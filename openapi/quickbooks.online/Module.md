## Overview
This is a generated connector for [QuickBooks API v3](https://developer.intuit.com/app/developer/qbo/docs/get-started) OpenAPI specification.

The QuickBooks Online Accounting API utilizes the REST architecture. It lets you seamlessly integrate your app with QuickBooks Online and the Intuit Financial Ecosystem 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [QuickBooks account](https://quickbooks.intuit.com/global/).
* Obtain credentials by following [this guide](https://developer.intuit.com/app/developer/qbo/docs/get-started/start-developing-your-app). Tokens can be obtained by using [OAuth 2.0 Playground](https://developer.intuit.com/app/developer/playground).

## Quickstart

To use the QuickBooks Online connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/quickbooks.online` module into the Ballerina project.
```ballerina
    import ballerinax/quickbooks.online as quickbooks;
```

### Step 2: Create a new connector instance
Add the configuration file by creating a `Config.toml` file. Config file should have following configurations. Add the tokens obtained in the previous step to the `Config.toml` file.

```ballerina
    [authConfig]
    clientId: <CLIENT_ID>,
    clientSecret: <CLIENT_SECRET>,
    refreshToken: <REFRESH_TOKEN>
```

```ballerina
    configurable quickbooks:OAuth2RefreshTokenGrantConfig & readonly authConfig = ?;
    quickbooks:ClientConfig clientConfig = {auth : authConfig};

    quickbooks:Client baseClient = 
            check new Client(clientConfig, "https://sandbox-quickbooks.api.intuit.com");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a customer using the connector.

    Get a quickbooks customer with given customer id

    ```ballerina
    public function main() returns error? {
        quickbooks:CustomerResponse response = check baseClient->readCustomer("<REALM_ID>", "<CUSTOMER_ID>");
        log:printInfo("Customer Info : " + response.toString());
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program. 
