## Overview
The Zoho CRM REST connector(https://www.zoho.com/crm/) OpenAPI specification. 

Zoho CRM REST API provides the capability to unify customer data from across different applications and databases.

### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Zoho CRM account](https://www.zoho.com/crm/signup.html).
* Obtain tokens by following [this guide](https://www.zoho.com/crm/developer/docs/api/v2/oauth-overview.html).

## Quickstart

To use the Zoho CRM REST connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/zoho.crm.rest` module into the Ballerina project.
```ballerina
import ballerinax/zoho.crm.rest;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
rest:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

rest:Client zohoClient = check new (clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to add a record in Zoho. 

    ```ballerina
    public function main() returns error? {
        Response response = check zohoClient->addRecord("contacts", {data:[{Last_Name: "NC"}]});
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
