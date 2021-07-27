## Overview
Ballerina connector for Vonage Voice is connecting the [Vonage Voice API](https://nexmo-api-specification.herokuapp.com/api/voice) via Ballerina language easily. The Voice API lets you create outbound calls, control in-progress calls and get information about historical calls. More information about the Voice API can be found at https://developer.nexmo.com/voice/voice-api/overview.

This module supports [Vonage Voice API v1.3.6](https://nexmo-api-specification.herokuapp.com/api/voice).

## Prerequisites

* Create [Vonage](https://www.vonage.com/) Account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Go to https://dashboard.nexmo.com/getting-started/voice and follow the guidelines to create an application.
    3. Use the `Application ID` and the `Private key` of the created application to generate a `JWT token`. You can generate a JWT using the [online tool](https://developer.nexmo.com/jwt).
    4.  Learn more about [how Vonage APIs use JWTs](https://developer.nexmo.com/concepts/guides/authentication#jwts).
* Configure the connector with obtained tokens 


## Quickstart

To use the Vonage Voice connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import Vonage Voice module
First, import the ballerinax/vonage.voice module into the Ballerina project.
```ballerina
import ballerinax/vonage.voice as vv;
```
### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the JWT obtained above in the configuration.
```ballerina
vv:ClientConfig config = {
    authConfig: {
        token: "JWT"
    }
}
vv:Client baseClient = check new Client(config);
```
### Step 3: Create an outbound call
You can now make a call from your own machine. Vonage will call you and read out a text-to-speech message.
```ballerina
public function main() {
    vv:EndpointPhoneTo endpointPhoneTo = {
        'type: "phone", 
        number: "9477.....96"
    };
    vv:EndpointPhoneFrom endpointPhoneFrom = {
        'type: "phone", 
        number: "9477.....96"
    };
    vv:NCCO ncco = {
        action: "talk",
        text: "This is a text to speech call from Vonage"
    };
    vv:CreateCallRequestNcco payload = {
        to: [endpointPhoneTo],
        'from: endpointPhoneFrom,
        ncco: [ncco]
    };
    vv:CreateCallResponse|error response = baseClient->createCall(payload);
    if (response is vv:CreateCallResponse) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Step 4: Get details of your calls
You can now get details of your calls.
```ballerina
public function main() {
    vv:GetCallsResponse|error response = baseClient->getCalls();
    if (response is vv:CreateCallResponse) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
