## Overview
The FreshBooks API v1 connector(https://www.freshbooks.com/api/start) OpenAPI specification.

FreshBooks lets you create professional looking invoices in seconds, automatically record expenses with ease and track your time quickly and efficiently so you can focus on what matters most - serving the needs of your clients.
The FreshBooks API is an interface for accessing your FreshBooks data using JSON. 

### Key Features

- Programmatic access to create and manage resources via REST API
- Handle payments, billing, and financial transactions
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [FreshBooks account](https://www.freshbooks.com/).
* Obtain tokens by following [this guide](https://www.freshbooks.com/api/start).

## Quickstart

To use the FreshBooks connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/freshbooks` module into the Ballerina project.
```ballerina
import ballerinax/freshbooks;
```

### Step 2: Create a new connector instance
Create a `freshbooks:ClientConfig` with the `<ACCESS_TOKEN>` obtained, and initialize the connector with it.
```ballerina
freshbooks:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

freshbooks:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list clients using the connector. 

    ```ballerina
    public function main() {
        string accountId = "<ACCOUNT_ID>";
        freshbooks:ClientListResponse|error result = baseClient->listClients(accountId);
        if (result is freshbooks:ClientListResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.