## Overview

This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification. 
Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
PowerTools is the ultimate developer toolkit. 
This connector provides the capability for data conversion.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Apptigent](https://portal.apptigent.com/user/register) account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here](https://portal.apptigent.com/start).
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/powertoolsdeveloper.data` module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.data as pd;
```

### Step 2: Create a new connector instance
Create a `data:ApiKeysConfig` with the Client ID obtained, and initialize the connector with it. 
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

    Following is an example on how to convert a JSON array to CSV string using the connector by providing the `InputJsonConversionCSV` record with JSON array as a string, boolean indicating whether to include the header row, columns to omit and the column order.

    Convert a JSON array to CSV string

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

2. Use `bal run` command to compile and run the Ballerina program.
