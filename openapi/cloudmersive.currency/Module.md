## Overview
The Cloudmersive connector(https://account.cloudmersive.com) OpenAPI specification.

The Cloudmersive Currency APIs help you retrieve exchange rates and convert prices between currencies.
 
### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Support for webhooks and event-driven workflows
- Secure authentication with API key or OAuth support

## Prerequisites
* Create a [Cloudmersive](https://account.cloudmersive.com) account
* Obtain tokens
    - Use [this](https://account.cloudmersive.com/keys) guide to obtain the API key related to your account.


## Quickstart
To use the Cloudmersive Currency connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/cloudmersive.currency module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.currency;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
currency:ApiKeysConfig config = {
    apikey : "<your apiKey>"
};

currency:Client baseClient = check new Client(clientConfig);
```
### Step 3 - Invoke connector operation
1. Get all currency types
```ballerina
currency:AvailableCurrencyResponse|error bEvent = baseClient->currencyExchangeGetAvailableCurrencies();

if (bEvent is currency:AvailableCurrencyResponse) {
    log:printInfo("Currency List: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}
``` 
2. Use `bal run` command to compile and run the Ballerina program
