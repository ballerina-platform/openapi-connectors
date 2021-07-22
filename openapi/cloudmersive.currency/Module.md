## Overview
Cloudmersive Currency API provide capabilities to convert prices between currencies, and it leverages real-time 
conversion rates for over 30 currencies.

Ballerina connector for Cloudmersive Currency allows easy integration with Cloudmersive Currency REST API via Ballerina language. 
It allows obtaining real-time exchange Rate Data and allows converting prices between over 30 currencies.

This module supports Cloudmersive Currency REST API `v1` version.
 
## Configuring the connector
### Prerequisites
- A Cloudmersive Account

### Obtaining tokens
Follow these steps to obtain the required token

1. Login to the Cloudmersive account
2. Visit `API Keys` tab on sidebar
3. Click `Create Key` button

## Quickstart
### Get all the available currency types
#### Step 1: Import cloudmersive.currency module
First, import the ballerinax/cloudmersive.currency module into the Ballerina project.
```ballerina
import ballerinax/cloudmersive.currency;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the access token.
```ballerina
currency:ApiKeysConfig config = {
    apiKeys : {
        hapikey : "<your apiKey>"
    }
};

currency:Client baseClient = check new Client(clientConfig);

```
#### Step 3: Get all currency types
```ballerina
currency:AvailableCurrencyResponse|error bEvent = baseClient->currencyExchangeGetAvailableCurrencies();

if (bEvent is currency:AvailableCurrencyResponse) {
    log:printInfo("Currency List: " + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}

``` 