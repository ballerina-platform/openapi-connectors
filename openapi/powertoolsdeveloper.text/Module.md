## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability for String manipulation, parsing, conversion and related operations.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Text module
Import the ballerinax/powertoolsdeveloper.text module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.text as pt;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pt:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pt:Client baseClient = check new Client(config);
```
### Step 3: Perform a comparison of two strings.
Perform a comparison of two strings by providing the `InputStringContains` record with the text to match, text to search and whether to convert strings to lowercase.
```ballerina
public function main() {
    pt:InputStringContains inputStringContains = {
        find: "cow",
        input: "The brown cow",
        lower: "True"
    };
    pt:OutputString|error response = baseClient->containsString(inputStringContains);
    if (response is pt:OutputString) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
