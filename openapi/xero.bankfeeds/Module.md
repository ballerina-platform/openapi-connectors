## Overview
This is a generated connector for [Xero Bank Feeds API v2.16.0](https://developer.xero.com/documentation/api/bankfeeds/overview) OpenAPI specification.
The Bank Feeds API is a closed API that is only available to financial institutions that have an established financial services partnership with Xero.
If you're an existing financial services partner that wants access, contact your local Partner Manager.
If you're a financial institution who wants to provide bank feeds to your business customers, contact xero to become a financial services partner.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Xero](https://developer.xero.com/app/manage) account
* Obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/)
 
## Quickstart

To use the Xero Bank Feeds connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/xero.bankfeeds` module into the Ballerina project.
```ballerina
import ballerinax/xero.bankfeeds;
```

### Step 2: Create a new connector instance
Create a `bankfeeds:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
bankfeeds:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
bankfeeds:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve all statements using the connector. 

    Retrieve all statements

    ```ballerina
    public function main() returns error? {
        bankfeeds:Statements response = check baseClient->getStatements();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
