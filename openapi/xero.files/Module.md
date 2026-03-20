## Overview
The Xero Files API v2.16.1 connector(https://developer.xero.com/documentation/api/files/overview) OpenAPI specification.
The Files API provides access to the files, folders, and the association of files within a Xero organisation. It can be used to upload/download files, manage folders and associate files to invoices, contacts, payments etc.

### Key Features

- Programmatic access to create and manage resources via REST API
- Handle payments, billing, and financial transactions
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Xero](https://developer.xero.com/app/manage) account
* Obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/)
 
## Quickstart

To use the Xero Files connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/xero.files` module into the Ballerina project.
```ballerina
import ballerinax/xero.files;
```

### Step 2: Create a new connector instance
Create a `files:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
files:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
files:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. You can get all the files by providing Xero tenant identifier as parameter.

    ```ballerina
    files:Files response = check baseClient->getFiles(<Xero_Identifier_For_Tenant>);
    ```

2. Use `bal run` command to compile and run the Ballerina program.