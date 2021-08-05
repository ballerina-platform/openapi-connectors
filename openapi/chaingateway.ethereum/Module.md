## Overview
This is a generated connector from [Chaingateway Ethereum API v1](https://chaingateway.io/docs-ethereum) OpenAPI Specification. 

Chaingateway Ethereum allows you to interact with Ethereum and all ERC20 tokens. Accept your own token as payment method for your shop, distribute airdrop tokens of your ICO, convert your site currency to a token that can be traded on exchanges and many more. There are a lot of use cases which are not only limited to sending tokens but also receiving them. You could even create a secure wallet for your token which only the wallet owner has access to. More about the Chaingateway Ethereum API API can be find at [https://chaingateway.io/docs-ethereum](https://chaingateway.io/docs-ethereum)
 
This module supports Chaingateway Ethereum API version v1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Chaingateway account](https://chaingateway.io/register)
- Obtain tokens - Navigate to the [Chaingateway Account](https://chaingateway.io/account), You will have an API key listed and you can to use it for your application, simply copy it.
 
## Quickstart
To use the `chaingateway.ethereum` connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/chaingateway.ethereum module into the Ballerina project.
```ballerina
import ballerinax/chaingateway.ethereum as chaingateway;
```
### Step 2: Create a new connector instance
You can now make the connection configuration using the obtained credentials.

```ballerina

chaingateway:Client chaingatewayClient = check new;
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to get ethereum-USD exchange rate.
```ballerina

chaingateway:GetExchangeRateRequest requestPayload = {
        currency: "usd"
};
chaingateway:GetExchangeRate exchangeRate = check baseClient->getExchangeRate("<API_Key>", requestPayload);

```
2. Use `bal run` command to compile and run the Ballerina program.
