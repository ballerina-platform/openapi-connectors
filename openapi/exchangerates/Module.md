## Overview
This is a generated connector from [ExchangeRates-API v6](https://exchangeratesapi.io/documentation/) OpenAPI Specification. 

With over 15 exchange rate data sources, the Exchangerates API is delivering exchanging rates data for more than 170 world currencies. The endpoints include functionalities like receiving the latest exchange rates information for a specific currency; conversion from one to another currency; receiving data Time-series for multiple or for one currency, and preserving the API daily for the fluctuation data.. More about the ExchangeRate-API can be find at [ExchangeRates-API](https://exchangeratesapi.io/documentation/)
 
This module supports ExchangeRates API version v6.

## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create [ExchangeRate-API Account](https://app.exchangerate-api.com/sign-up)
* Obtain tokens
    - Follow this [link](https://app.exchangerate-api.com/dashboard) and obtain the API key.

## Quickstart
To use the ExchangeRates connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/exchangerates module into the Ballerina project.
```ballerina
import ballerinax/exchangerates;
```
### Step 2: Create a new connector instance
You can now initialize the client.
```ballerina
exchangerates:Client baseClient = check new(serviceUrl = "https://v6.exchangerate-api.com/v6/");
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to obtain exchange rates for USD

```ballerina
exchangerates:CurrencyExchangeInfomation response = check baseClient->getExchangeRateFor("<API-Key>", "usd");
```
2. Use `bal run` command to compile and run the Ballerina program.