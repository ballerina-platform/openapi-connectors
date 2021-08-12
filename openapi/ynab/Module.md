## Overview
This is a generated connector for [YNAB API v1.0.0](https://api.youneedabudget.com) OpenAPI specification. 
YNAB API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. 
We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body. 
API Documentation is at https://api.youneedabudget.com

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [YNAB](https://app.youneedabudget.com) account
* Obtain tokens
    1. Log into YNAB account by visiting https://app.youneedabudget.com/users/authentication
    2. Obtain the `access token` following [this guide](https://api.youneedabudget.com/#quick-start)
 
## Quickstart

To use the YNAB connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/ynab` module into the Ballerina project.
```ballerina
import ballerinax/ynab;
```

### Step 2: Create a new connector instance
Create a `ynab:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
ynab:ClientConfig clientConfig = {
    authConfig: {
        token: <ACCESS_TOKEN>
    }
};
ynab:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to return a budgets list with summary information using the connector. 

    List budgets

    ```ballerina
    public function main() {
        ynab:BudgetSummaryResponse|error response = baseClient->getBudgets();
        if (response is ynab:BudgetSummaryResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
