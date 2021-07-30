## Overview

Ballerina connector for Apptigent PowerTools Developer is connecting the [Apptigent Powertools Developer API](https://portal.apptigent.com/node/612) via Ballerina language easily. Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. PowerTools is the ultimate developer toolkit. This module provides the capability to modify collections.

This module supports [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612).

## Prerequisites

* Create [Apptigent](https://portal.apptigent.com/user/register) Account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
* Configure the connector with obtained tokens
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Apptigent PowerTools Developer Collections module
Import the ballerinax/powertoolsdeveloper.collections module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.collections as pc;
```
### Step 2: Initialize the client.
Initialize the client as follows. You can provide the Client ID obtained from the [Apptigent Developer Portal](https://portal.apptigent.com) in the configuration.
```ballerina
pc:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pc:Client baseClient = check new Client(config);
```
### Step 3: Sort a collection of strings.
Sort a collection of strings by providing the collection of strings to sort and the sort order.

```ballerina
public function main() {
    pc:InputCollectionSort inputCollectionSort = {
        input: ["a","d","c","b","e"],
        'order: "Ascending"
    };
    pc:OutputCollectionResult|error response = baseClient->sortCollection(inputCollectionSort);
    if (response is pc:OutputCollectionResult) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
