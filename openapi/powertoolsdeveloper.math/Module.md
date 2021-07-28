## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability for mathematical calculations and conversions.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Math module
Import the ballerinax/powertoolsdeveloper.math module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.math as pm;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pm:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pm:Client baseClient = check new Client(config);
```
### Step 3: Calculate the standard deviation of two or more numbers.
Calculate the standard deviation of two or more numbers by providing the `InputCalculateSeries` record with collection of values to calculate and number of decimal places to round.

```ballerina
public function main() {
    pm:InputCalculateSeries inputCalculateSeries = {
        input: [1,2,3,4,5],
        decimals: 2
    };
    pm:OutputNumber|error response = baseClient->standardDeviation(inputCalculateSeries);
    if (response is pm:OutputNumber) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
