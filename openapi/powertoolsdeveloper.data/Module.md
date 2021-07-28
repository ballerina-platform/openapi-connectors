## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability to data conversion.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Data module
Import the ballerinax/powertoolsdeveloper.data module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.data as pd;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pd:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pd:Client baseClient = check new Client(config);
```
### Step 3: Convert a JSON array to CSV string.
Convert a JSON array to CSV string by providing the `InputJsonConversionCSV` record with JSON array as a string, boolean indicating whether to include the header row, columns to omit and the column order.

```ballerina
public function main() {
    pd:InputJsonConversionCSV inputJsonConversionCSV = {
        input: "[{\"property1\":\"value\"},{\"property2\":\"value\"},{\"property3\":\"value\"}]",
        header: true,
        omit: "property1",
        'order: "property3,property2"
    };
    pd:OutputString|error response = baseClient->jsonToCsv(inputJsonConversionCSV);
    if (response is pd:OutputString) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
