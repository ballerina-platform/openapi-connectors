## Overview
With over 15 exchange rate data sources, the Exchangerates API is delivering exchanging rates data for more than 170 world currencies. This API has several endpoints, where each of them serves a different purpose, use case. The endpoints include functionalities like receiving the latest exchange rates information for a specific set, or for all currencies; conversion from one to another currency; receiving data Time-series for multiple or for one currency, and preserving the API daily for the fluctuation data.. More about the Api2Pdf API can be find at [ExchangeRates-API](https://exchangeratesapi.io/documentation/)
 
This module supports ExchangeRates API version v4.

## Quickstart
To use the ExchangeRates connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import ExchangeRates module
First, import the ballerinax/exchangerates module into the Ballerina project.
```ballerina
import ballerinax/exchangerates;
```
### Step 2: Initialize ExchangeRates client

```ballerina
exchangerates:Client baseClient = check new;
```

### Step 3: Invoke an operation
Following code demonstrate how to obtain exchange rates for USD

```ballerina
exchangerates:InlineResponse200 response = check baseClient->latestBybase_currency("USD");
```

## Attribution
<a href="https://www.exchangerate-api.com">Rates By Exchange Rate API</a>