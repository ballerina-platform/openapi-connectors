## Overview
This is a generated connector for [Paypal Payments API v2](https://developer.paypal.com/docs/api/payments/v2/) OpenAPI specification.
Call the Payments API to authorize payments, capture authorized payments, refund payments that have already been captured, and show payment information. 
Use the Payments API in conjunction with the Orders API.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Paypal](https://www.paypal.com) account
* Obtain tokens by following [this guide](https://developer.paypal.com/docs/api/overview/#get-credentials)
 
## Quickstart

To use the Paypal Payments connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/paypal.payments` module into the Ballerina project.
```ballerina
import ballerinax/paypal.payments;
```

### Step 2: Create a new connector instance
Create a `payments:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
payments:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
payments:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve details for an authorized payment using the connector.

    Get details for an authorized payment

    ```ballerina
    public function main() returns error? {
        payments:AuthorizationDetails response = check baseClient->getAuthorization(<AuthorizationId>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
