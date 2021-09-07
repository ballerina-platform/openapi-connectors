## Overview
This is a generated connector for [Stripe API v1](https://stripe.com/docs/api) OpenAPI specification.

Stripe offers payment processing software and application programming interfaces for e-commerce websites and mobile applications. 

The Stripe API is organized around REST. Our API has predictable resource-oriented URLs, accepts form-encoded request bodies, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Stripe](https://dashboard.stripe.com/login) account
* Obtain token
    - Obtain API Key following [this guide](https://stripe.com/docs/api/authentication) and provide obtained API Key as the token at HTTP client initialization. 
    - Configure required permissions when generating the API Key.

## Quickstart

To use the Stripe connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/stripe` module into the Ballerina project.
```ballerina
import ballerinax/stripe;
```

### Step 2: Create a new connector instance
Configure the connection using the API-Key obtained.

```ballerina
stripe:ClientConfig configuration = {
    auth: {
        token: "<API-Key>"
    }
};
stripe:Client stripeClient = check new (configuration);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

   Following is an example on how to create a new customer in your Stripe account using the connector.

    Send an sms

    ```ballerina
    stripe:V1CustomersBody newCustomer = {
        address: {
            city: "<Customer City>",
            country: "<Customer Country>"
        },
        email: "<Customer Email>",
        name: "<Customer Name>"
    };
    stripe:Customer postCustomers = check stripeClient->createCustomer(newCustomer);
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
