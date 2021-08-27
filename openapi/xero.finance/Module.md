## Overview
This is a generated connector for [Xero Finance API v2.16.0](https://developer.xero.com/documentation/api/finance/overview) OpenAPI specification.
The Finance API is a collection of endpoints which customers can use in the course of a loan application, which may assist lenders to gain the confidence they need to provide capital.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Xero](https://developer.xero.com/app/manage) account
* Obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/)
 
## Quickstart

To use the Xero Finance connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/xero.finance` module into the Ballerina project.
```ballerina
import ballerinax/xero.finance;
```

### Step 2: Create a new connector instance
Create a `finance:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
finance:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
finance:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a list of all the users registered, and a history of their accounting transactions using the connector. 

    Get user activities

    ```ballerina
    public function main() returns error? {
        finance:Statements response = check baseClient->getUserActivities(<Xero_Identifier_For_Tenant>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
