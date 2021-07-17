## Overview
Ballerina connector for Vonage Numbers is connecting the [Vonage Numbers API](https://nexmo-api-specification.herokuapp.com/numbers) via Ballerina language easily. The Numbers API enables you to manage your existing numbers and buy new virtual numbers for use with the Vonage APIs. Further information is here: https://developer.nexmo.com/numbers/overview

This module supports [Vonage Numbers API](https://nexmo-api-specification.herokuapp.com/numbers).

## Configuring Connector

### Prerequisites
- An [Vonage](https://www.vonage.com/) Account

### Obtaining tokens
1. Log into Vonage API Dashboard and visiting https://dashboard.nexmo.com/
2. Obtain the `API Key` and `API Secret` from the API Dashboard.
 
## Quickstart

### List Your Numbers

#### Step 1: Import Vonage Numbers module
First, import the ballerinax/vonage.numbers module into the Ballerina project.
```ballerina
import ballerinax/vonage.numbers as vn;
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
#### Step 3: List Your Numbers
You can now list the numbers that you own programmatically.
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

### Search Available Numbers

#### Step 1: Import Vonage Numbers module
First, import the ballerinax/vonage.numbers module into the Ballerina project.
```ballerina
import ballerinax/vonage.numbers as vn;
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
#### Step 3: Search Available Numbers
You can now programmatically search for numbers that are available for purchase in a specific country. Provide the two digit country code for the number as a parameter. For example: GB for the United Kingdom.
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
