## Overview
Azure Data Lake Storage is a secure cloud platform that provides scalable, cost-effective storage for big data analytics.
Ballerina connector for Azure Data Lake allows easy integration with Azure Data Lake Storage(Gen2) REST API via Ballerina language. 
This connector allows the management of resources inside an Azure Data Lake Storage account instance.

This module supports Azure Data Lake Storage(Gen2) REST API `2019-10-31` version.
 
## Configuring connector
### Prerequisites
- Azure Data Lake Storage(Gen2) Account
- Access to register an application in Azure portal

### Obtaining tokens
1. Visit Azure portal-> Create a resource -> Azure AD. You can use your personal or work or school account to register.

2. In the App registrations page, click **New registration** and enter a meaningful name in the name field.

3. In the **Supported account types** section, select any of the account types. Click **Register** to create the application.
    
4. Copy the Application (client) ID (`<CLIENT_ID>`). This is the unique identifier for your app.
    
5. In the application's list of pages (under the **Manage** tab in left hand side menu), select **Authentication**.
    Under **Platform configurations**, click **Add a platform**.

6. Under **Configure platforms**, click **Web** located under **Web applications**.

7. Under the **Redirect URIs text box**, register the https://login.microsoftonline.com/common/oauth2/nativeclient url.
   Under **Implicit grant**, select **Access tokens**.
   Click **Configure**.

8. Under **Certificates & Secrets**, create a new client secret (`<CLIENT_SECRET>`). This requires providing a description and a period of expiry. Next, click **Add**.

9. Next, you need to obtain an access token and a refresh token to invoke the Azure Data Lake API.
First, in a new browser, enter the below URL by replacing the `<CLIENT_ID>` with the application ID. Provide `https://datalake.azure.net/user_impersonation` for the `<SCOPES>`.

    ```
    https://login.microsoftonline.com/common/oauth2/v2.0/authorize?response_type=code&client_id=<CLIENT_ID>&redirect_uri=https://login.microsoftonline.com/common/oauth2/nativeclient&scope=<SCOPES>
    ```

10. This will prompt you to enter the username and password for signing into the Azure Portal App.

11. Once the username and password pair is successfully entered, this will give a URL as follows on the browser address bar.

    `https://login.microsoftonline.com/common/oauth2/nativeclient?code=xxxxxxxxxxxxxxxxxxxxxxxxxxx&session_state=bfc0a6755-757`

12. Copy the code parameter (`xxxxxxxxxxxxxxxxxxxxxxxxxxx` in the above example) and in a new terminal, enter the following cURL command by replacing the `<CODE>` with the code received from the above step. The `<CLIENT_ID>`, `<CLIENT_SECRET>` and `<SCOPES>` parameters are the same as above.

    ```
    curl -X POST --header "Content-Type: application/x-www-form-urlencoded" --header "Host:login.microsoftonline.com" -d "client_id=<CLIENT_ID>&client_secret=<CLIENT_SECRET>&grant_type=authorization_code&redirect_uri=https://login.microsoftonline.com/common/oauth2/nativeclient&code=<CODE>&scope=<SCOPES>" https://login.microsoftonline.com/common/oauth2/v2.0/token
    ```

    The above cURL command should result in a response as follows.
    ```
    {
      "token_type": "Bearer",
      "scope": "Files.ReadWrite",
      "expires_in": 3600,
      "ext_expires_in": 3600,
      "access_token": "<ACCESS_TOKEN>"
    }
    ```

13. Provide the following configuration information in the `Config.toml` file to use the Azure Data Lake connector.

    ```ballerina
    [ballerinax.azure.datalake]
    access_token = "<ACCESS_TOKEN>"
    ```
**Note:**<br/>
More information on connecting to Azure Data lake from Azure AD tokens can be found [here](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app).

## Quickstart
### List file systems
#### Step 1: Import Azure Data Lake module
First, import the ballerinax/azure.datalake module into the Ballerina project.
```ballerina
import ballerinax/azure.datalake;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
datalake:ClientConfig clientConfig = {
    authConfig : {
        token: token
    }
};

datalake:Client baseClient = check new Client(clientConfig, serviceUrl = "https://{accountName}.{dnsSuffix}");

```
#### Step 3: List file systems

```ballerina
public function main() {
    datalake:FilesystemList|error fileSystemList = baseClient->filesystemList("account");
    if (fileSystemList is datalake:FilesystemList) {
        log:printInfo("Filesyatem List " + fileSystemList.toString());
    } else {
        log:printInfo("Error Occured");
    }
}
``` 