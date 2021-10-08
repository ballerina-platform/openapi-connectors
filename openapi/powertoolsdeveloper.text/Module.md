## Overview

This is a generated connector from [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification. 
Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
PowerTools is the ultimate developer toolkit. 
This connector provides the capability for String manipulation, parsing, conversion and related operations.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Apptigent](https://portal.apptigent.com/user/register) account
* Obtain tokens
    1. Log into Apptigent Developer Portal by visiting https://portal.apptigent.com
    2. Create an app and obtain the `Client ID` which will be used as the `API Key` by following the guidelines described [here](https://portal.apptigent.com/start).
 
## Quickstart

To use the Apptigent PowerTools Developer connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/powertoolsdeveloper.text` module into the Ballerina project.
```ballerina
import ballerinax/powertoolsdeveloper.text as pt;
```
### Step 2: Create a new connector instance
Create a `text:ApiKeysConfig` with the Client ID obtained, and initialize the connector with it.
```ballerina
pt:ApiKeysConfig config = {
    axIbmClientId: "<CLIENT_ID>"
}
pt:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to perform a comparison of two strings using the connector by providing the `InputStringContains` record with the text to match, text to search and whether to convert strings to lowercase.

    Perform a comparison of two strings

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

2. Use `bal run` command to compile and run the Ballerina program.
