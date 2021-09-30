## Overview
This is a generated connector from [Microsoft Dynamics 365 Business Central API v1.0](https://dynamics.microsoft.com/en-us/business-central/overview/) OpenAPI specification.

(v1.0) Business Central Standard APIs

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Microsoft Dynamics 365 Business Central](https://dynamics.microsoft.com/en-us/business-central/overview/) account
* Obtain tokens by following [this guide](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-develop-connect-apps#AAD)

## Quickstart

To use the Dynamics 365 Business Central connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/microsoft.dynamics365businesscentral` module into the Ballerina project.
```ballerina
import ballerinax/microsoft.dynamics365businesscentral;
```

### Step 2: Create a new connector instance
Create a `dynamics365businesscentral:ClientConfig` with the `OAuth Token` obtained, and initialize the connector with it.
```ballerina
dynamics365businesscentral:ClientConfig clientConfig = {
    auth : {
        token: token
    }
};

dynamics365businesscentral:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list companies using the connector. 

    ```ballerina
    public function main() {
        dynamics365businesscentral:InlineResponse200|error response = baseClient->listCompanies();
        if (response is dynamics365businesscentral:InlineResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

