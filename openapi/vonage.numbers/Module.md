## Overview
This is a generated connector for [Vonage Numbers API v1.0.20](https://nexmo-api-specification.herokuapp.com/numbers) OpenAPI specification. 
The Numbers API enables you to manage your existing numbers and buy new virtual numbers for use with the Vonage APIs. 
Further information is here: https://developer.nexmo.com/numbers/overview

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Vonage](https://www.vonage.com/) account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Obtain the `API Key` and `API Secret` from the API Dashboard.
 
## Quickstart

To use the Vonage Numbers connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/vonage.numbers` module into the Ballerina project.
```ballerina
import ballerinax/vonage.numbers as vn;
```

### Step 2: Create a new connector instance
Create a `numbers:ApiKeysConfig` with the API key and API secret obtained, and initialize the connector with it.
```ballerina
vn:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>",
        api_secret: "<API_SECRET"
    }
}
vn:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list the numbers that you own programmatically using the connector.

    List Your Numbers

    ```ballerina
    public function main() {
        InboundNumbers|error response = baseClient->getOwnedNumbers();
        if (response is InboundNumbers) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to programmatically search for numbers that are available for purchase in a specific country using the connector. Provide the two digit country code for the number as a parameter. For example: GB for the United Kingdom.

    Search Available Numbers

    ```ballerina
    public function main() {
        AvailableNumbers|error response = baseClient->getAvailableNumbers("GB");
        if (response is AvailableNumbers) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
