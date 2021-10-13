## Overview

This is a generated connector from [Apptigent PowerTools Developer API v2021.3.01](https://portal.apptigent.com/node/904) OpenAPI specification. 
Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
PowerTools is the ultimate developer toolkit. 
This connector provides the capability for weather conditions, forecasts and related operations.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Apptigent](https://portal.apptigent.com/user/register) account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here](https://portal.apptigent.com/start).
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/powertoolsdeveloper.weather` module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.weather as pw;
```
### Step 2: Create a new connector instance
Create a `text:ApiKeysConfig` with the Client ID obtained, and initialize the connector with it.
```ballerina
pw:ApiKeysConfig config = {
    xIbmClientId: "<CLIENT_ID>"
}
pw:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get current weather conditions near an address or location using the connector.

    Get current weather conditions near an address or location

    ```ballerina
    public function main() returns error? {
        pw:InputWeatherConditions inputWeatherConditions = {
            'source: "<Full or partial address>",
            units: "<Units>"
        };
        pw:OutputWeatherConditions response = check baseClient->weatherConditions(inputWeatherConditions);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
