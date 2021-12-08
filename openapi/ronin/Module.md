## Overview
This is a generated connector for [Ronin API v2](https://www.roninapp.com/api) OpenAPI specification.
Ronin is a full featured time tracking and invoicing application. It allows you to easily manage almost all aspects of your online projects, though it has a focus on the billing side. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Ronin](https://www.roninapp.com) account
* Obtain tokens by following [this guide](https://www.roninapp.com/api)
 
## Quickstart

To use the Ronin connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/ronin` module into the Ballerina project.
```ballerina
import ballerinax/ronin;
```

### Step 2: Create a new connector instance
Create a `ronin:ClientConfig` with the `api_token` obtained, and initialize the connector with it.
```ballerina
ronin:ClientConfig clientConfig = {
    auth: {
        username: <api_token>,
        password: <api_token>
    }
};
ronin:Client baseClient = check new Client(clientConfig, serviceUrl = "https://{yourdomain}.roninapp.com");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all invoices using the connector.

    Get all invoices

    ```ballerina
    public function main() returns error? {
        ronin:Invoices response = check baseClient->listInvoices();
        log:printInfo(response.toJsonString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
