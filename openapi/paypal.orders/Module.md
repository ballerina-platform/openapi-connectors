## Overview
This is a generated connector for [Paypal Orders API v2](https://developer.paypal.com/docs/api/orders/v2/) OpenAPI specification.
An order represents a payment between two or more parties. 
Use the Orders API to create, update, retrieve, authorize, and capture orders.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Paypal](https://www.paypal.com) account
* Obtain tokens by following [this guide](https://developer.paypal.com/docs/api/overview/#get-credentials)
 
## Quickstart

To use the Paypal Orders connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/paypal.orders` module into the Ballerina project.
```ballerina
import ballerinax/paypal.orders;
```

### Step 2: Create a new connector instance
Create a `orders:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
orders:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
orders:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to create an order using the connector.

    Creates an order

    ```ballerina
    public function main() returns error? {
        orders:CreateOrderRequest createOrderRequest = {
            intent: "CAPTURE",
            purchase_units: [
                {
                    amount: {
                        currency_code: "USD",
                        value: "100.00"
                    }
                }
            ]
        };
        orders:CreatedOrderDetails response = check baseClient->createOrder(createOrderRequest);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
