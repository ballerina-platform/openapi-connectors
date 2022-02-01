## Overview
This is a generated connector for [Oracle Eloqua](https://docs.oracle.com/en/cloud/saas/marketing/eloqua-user/index.htm) OpenAPI specification. 

The Oracle Eloqua Marketing Cloud Service REST APIs enable you to extend the functionality of the product, build Apps, and perform high volume data transfers.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Oracle devoloper Account](https://profile.oracle.com/myprofile/account/create-account.jspx).
* Obtain tokens by following [this guide](https://docs.oracle.com/en/cloud/saas/marketing/eloqua-rest-api/Authentication.html).

## Quickstart

To use the Eloqua connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/eloqua` module into the Ballerina project.
```ballerina
import ballerinax/eloqua;
```

### Step 2: Create a new connector instance
Create a `eloqua:ClientConfig` with the `BEARER_TOKEN` obtained, and initialize the connector with it.
```ballerina
eloqua:ClientConfig clientConfig = {
    auth: {
        token: <BEARER_TOKEN>
    }
};
eloqua:Client baseClient = check new (clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a list of emails.

    Retrieve a list of emails.

    ```ballerina
    public function main() returns error? {
        eloqua:QueryResultEmailRest20 response = check baseClient->searchListOfEmails();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
