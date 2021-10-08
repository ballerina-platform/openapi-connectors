## Overview

This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification. 
Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
PowerTools is the ultimate developer toolkit. 
This connector provides the capability for financial calculations and conversions.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Apptigent](https://portal.apptigent.com/user/register) account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here](https://portal.apptigent.com/start).
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/powertoolsdeveloper.finance` module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.finance as pf;
```

### Step 2: Create a new connector instance
Create a `finance:ApiKeysConfig` with the Client ID obtained, and initialize the connector with it. 
```ballerina
pf:ApiKeysConfig config = {
    xIbmClientId: "<CLIENT_ID>"
}
pf:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to Calculate monetary value in a different currency using the connector by providing the `InputCurrencyConversion` record with amount to convert, source and target.

    Calculate monetary value in a different currency

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

2. Use `bal run` command to compile and run the Ballerina program. 
