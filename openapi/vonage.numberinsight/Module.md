## Overview
This is a generated connector for [Vonage Number Insight API v1.0.10](https://nexmo-api-specification.herokuapp.com/number-insight) OpenAPI specification. 
The Number Insight API delivers real-time intelligence about the validity, reachability and roaming status of a phone number and tells you how to format the number correctly in your application. 
There are three levels of Number Insight API available: [Basic, Standard and Advanced](https://developer.nexmo.com/number-insight/overview#basic-standard-and-advanced-apis). The advanced API is available asynchronously as well as synchronously. 
More Number Insight API documentation is at https://developer.nexmo.com/number-insight/overview#number-insight-api-overview.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Vonage](https://www.vonage.com/) account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Obtain the `API Key` and `API Secret` from the API Dashboard.

## Quickstart

To use the Vonage Number Insight connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/vonage.numberinsight` module into the Ballerina project.
```ballerina
import ballerinax/vonage.numberinsight as vn;
```

### Step 2: Create a new connector instance
Create a `numberinsight:ApiKeysConfig` with the API key and API secret obtained, and initialize the connector with it.
```ballerina
vn:ApiKeysConfig config = {
    apiKey: "<API_KEY>",
    apiSecret: "<API_SECRET"
}
vn:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get basic number insight information about a number using the connector.

    Basic Number Insight

    ```ballerina
    public function main() {
        vn:NiResponseJsonBasic|error response = baseClient->getNumberInsightBasic("json", "9477.....83");
        if (response is vn:NiResponseJsonBasic) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to get standard number insight information about a number using the connector.

    Standard Number Insight

    ```ballerina
    public function main() {
        vn:NiResponseJsonStandard|error response = baseClient->getNumberInsightStandard("json", "9477.....83");
        if (response is vn:NiResponseJsonStandard) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to get advanced number insight information about a number using the connector.

    Advanced Number Insight (async)

    ```ballerina
    public function main() {
        vn:NiResponseJsonAdvanced|error response = baseClient->getNumberInsightAdvanced("json", "9477.....83");
        if (response is vn:NiResponseJsonAdvanced) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
