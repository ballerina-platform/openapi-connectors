## Overview
The Zoho Books API v3 connector(https://www.zoho.com/books/api/v3/) OpenAPI specification.
Zoho Books is online accounting software that manages your finances, automates business workflows, and helps you work collectively across departments.

### Key Features

- Programmatic access to create and manage resources via REST API
- Handle payments, billing, and financial transactions
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Zoho account](https://www.zoho.com/books/signup/). 
2. Obtain tokens - Follow [this guide](https://www.zoho.com/books/api/v3/#oauth).

## Quickstart

To use the Zoho Books connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/zoho.books` module into the Ballerina project.
```ballerina
import ballerinax/zoho.books as books;
```

### Step 2: Create a new connector instance
Create a `books:ClientConfig` with the access token, and initialize the connector with it.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
books:ClientConfig clientConfig = {auth : authConfig};
books:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get the details of the invoices.

    ```ballerina
    public function main() returns error? {
        books:InvoiceList invoiceList = check baseClient->listInvoices(771463097);
        log:printInfo(invoiceList.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
