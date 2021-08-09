## Overview

This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification. 
Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
PowerTools is the ultimate developer toolkit. 
This connector provides the capability for date and time operations.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Apptigent](https://portal.apptigent.com/user/register) account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here]((https://portal.apptigent.com/start)).
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/powertoolsdeveloper.datetime` module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.datetime as pd;
```

### Step 2: Create a new connector instance
Create a `datetime:ApiKeysConfig` with the Client ID obtained, and initialize the connector with it. 
```ballerina
pd:ApiKeysConfig config = {
    apiKeys: {
        X-IBM-Client-Id: "<CLIENT_ID>"
    }
}
pd:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to calculate the difference between two dates using the connector by providing the `InputDateTimeDifference` record with date/time values to compare.

    Calculate the difference between two dates

    ```ballerina
    public function main() {
        pd:InputDateTimeDifference inputDateTimeDifference = {
            dateTime1: "1/1/2010 12:37:19",
            dateTime2: "3/15/2011 14:27:49"
        };
        pd:OutputDateDifference|error response = baseClient->dateTimeDifference(inputDateTimeDifference);
        if (response is pd:OutputDateDifference) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program. 
