## Overview
This is a generated connector from [NOWPayments API v1](https://nowpayments.io/) OpenAPI Specification. 

NOWPayments is a non-custodial cryptocurrency payment processing platform. Accept payments in a wide range of cryptos and get them instantly converted into a coin of your choice and sent to your wallet. Keeping it simple – no excess. More about the NOWPayments API can be find at [NOWPayments](https://nowpayments.io/)
 
This module supports NOWPayments API version v1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [NOWPayments account](https://account.nowpayments.io/create-account)
- Obtain tokens - Navigate to the [NOWPayments Profile](https://account.nowpayments.io/sign-in),and obtain tokens by following [this guide](https://documenter.getpostman.com/view/7907941/S1a32n38?version=latest)
 
## Quickstart
To use the NOWPayments connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/nowpayments module into the Ballerina project.
```ballerina
import ballerinax/nowpayments;
```
### Step 2: Create a new connector instance
You can now intantiate the client.

```ballerina
nowpayments:ApiKeysConfig apiKeyConfig = {
    xApiKey: "<API_Key>"
};

nowpayments:Client nowpaymentsClient = check new(apiKeyConfig);
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to calculating the approximate price in cryptocurrency for a given value in Fiat currency.
```ballerina
nowpayments:ApproximatePrice estimatedPrice = check nowpaymentsClient->getEstimatedPrice("10", "ONE", "BTC");
```
2. Use `bal run` command to compile and run the Ballerina program.
