## Overview
Ballerina connector for Vonage Number Insight is connecting the [Vonage Number Insight API](https://nexmo-api-specification.herokuapp.com/number-insight) via Ballerina language easily. The Number Insight API delivers real-time intelligence about the validity, reachability and roaming status of a phone number and tells you how to format the number correctly in your application. There are three levels of Number Insight API available: Basic, Standard and Advanced. The advanced API is available asynchronously as well as synchronously. More Number Insight API documentation is at https://developer.nexmo.com/number-insight/overview#number-insight-api-overview.

This module supports [Vonage Number Insight API](https://nexmo-api-specification.herokuapp.com/number-insight).

## Configuring Connector

### Prerequisites
- An [Vonage](https://www.vonage.com/) Account

### Obtaining tokens
1. Log into Vonage API Dashboard and visiting https://dashboard.nexmo.com/
2. Obtain the `API Key` and `API Secret` from the API Dashboard.
 
## Quickstart

### Basic Number Insight

#### Step 1: Import Number Insight module
First, import the ballerinax/vonage.numberinsight module into the Ballerina project.
```ballerina
import ballerinax/vonage.numberinsight as vn;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the configuration.
```ballerina
vn:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>",
        api_secret: "<API_SECRET"
    }
}
vn:Client baseClient = check new Client();
```
#### Step 3: Basic Number Insight
You can now get basic number insight information about a number.
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

### Standard Number Insight

#### Step 1: Import Number Insight module
First, import the ballerinax/vonage.numberinsight module into the Ballerina project.
```ballerina
import ballerinax/vonage.numberinsight as vn;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the configuration.
```ballerina
vn:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>",
        api_secret: "<API_SECRET"
    }
}
vn:Client baseClient = check new Client();
```
#### Step 3: Standard Number Insight
You can now get standard number insight information about a number.
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

### Advanced Number Insight (async)

#### Step 1: Import Number Insight module
First, import the ballerinax/vonage.numberinsight module into the Ballerina project.
```ballerina
import ballerinax/vonage.numberinsight as vn;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the configuration.
```ballerina
vn:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>",
        api_secret: "<API_SECRET"
    }
}
vn:Client baseClient = check new Client();
```
#### Step 3: Standard Number Insight
You can now get standard number insight information about a number.
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