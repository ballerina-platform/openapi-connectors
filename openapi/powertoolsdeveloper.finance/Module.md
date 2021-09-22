## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability for financial calculations and conversions.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Finance module
Import the ballerinax/powertoolsdeveloper.finance module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.finance as pf;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pf:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pf:Client baseClient = check new Client(config);
```
### Step 3: Calculate monetary value in a different currency.
Calculate monetary value in a different currency by providing the `InputCurrencyConversion` record with amount to convert, source and target.

```ballerina
public function main() {
    pf:InputCurrencyConversion inputCurrencyConversion = {
        input: 100.25,
        'source: "USD",
        target: "CAD"
    };
    pf:OutputNumber|error response = baseClient->convertCurrency(inputCurrencyConversion);
    if (response is pf:OutputNumber) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
