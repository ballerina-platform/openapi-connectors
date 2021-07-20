## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 

Ballerina connector for HubSpot Events allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Configuring connector
### Prerequisites
- A HubSpot developer account

### Obtaining tokens
1. Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>
2. Next, you need to obtain an access token and a refresh token to invoke the HubSpot API. First, in a new browser, enter the below URL by replacing the `<CLIENT_ID>`, Provide scopes necessary to call the API for the `<SCOPES>`.
    ```
    https://app.hubspot.com/oauth/authorize?client_id=<CLIENT_ID>&scope=<SCOPES>&redirect_uri=https://www.example.com/
    ```

3. This will prompt you to enter the username and password for signing into the HubSPot App

4. Once the username and password pair is successfully entered, this will give a URL as follows on the browser address bar.

    ```
    https://www.example.com?code=xxxxxxxxxxxxxxxxxxxxxxxxxxx&session_state=bfc0a6755-757
    ```

12. Copy the code parameter (`xxxxxxxxxxxxxxxxxxxxxxxxxxx` in the above example) and in a new terminal, enter the following cURL command by replacing the `<CODE>` with the code received from the above step. The `<CLIENT_ID>`, `<CLIENT_SECRET>` and `<SCOPES>` parameters are the same as above.

    ```
    curl -X POST --header "Content-Type: application/x-www-form-urlencoded" --header -d "client_id=<CLIENT_ID>&client_secret=<CLIENT_SECRET>&grant_type=authorization_code&redirect_uri=https://www.example.com/&code=<CODE>&scope=<SCOPES>" https://api.hubapi.com/oauth/v1/token
    ```

    The above cURL command should result in a response as follows.
    ```
    {
      "token_type": "Bearer",
      "scope": "<SCOPES>",
      "expires_in": 3600,
      "ext_expires_in": 3600,
      "access_token": "<ACCESS_TOKEN>"
    }
    ```

13. Provide the following configuration information in the `Config.toml` file to use the Azure Data Lake connector.

    ```ballerina
    [authConfig]
    token = "<ACCESS_TOKEN>"
    ```

## Quickstart
### List Events
#### Step 1: Import HubSpot Events module
First, import the ballerinax/hubspot.event module into the Ballerina project.
```ballerina
import ballerinax/hubspot.event;
```

#### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
event:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

event:Client baseClient = check new Client(clientConfig);

```

#### Step 3: List Events

```
event:CollectionResponseExternalUnifiedEvent|error eventList = baseClient->listEvents("contact",<OBJECT_ID>);
if (eventList is event:CollectionResponseExternalUnifiedEvent) {
    log:printInfo("Event List " + eventList.toString());
} else {
    log:printInfo(msg = eventList.message());
}
```