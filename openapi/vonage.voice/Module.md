## Overview
Ballerina connector for Vonage Voice is connecting the [Vonage Voice API](https://nexmo-api-specification.herokuapp.com/api/voice) via Ballerina language easily. The Voice API lets you create outbound calls, control in-progress calls and get information about historical calls. More information about the Voice API can be found at https://developer.nexmo.com/voice/voice-api/overview.

This module supports [Vonage Voice API v1.3.6](https://nexmo-api-specification.herokuapp.com/api/voice).

## Configuring Connector

### Prerequisites
- An [Vonage](https://www.vonage.com/) Account

### Obtaining tokens
1. Log into Vonage API Dashboard and visiting https://dashboard.nexmo.com/
2. Go to https://dashboard.nexmo.com/getting-started/voice
3. The first thing required in order to send a Voice call is to create an application. This will be used for authentication and to receive call events. Click `Create an application`.
4. Use the `Application ID` and the `Private key` of the created application to generate a `JWT token`. You can generate a JWT using the [online tool](https://developer.nexmo.com/jwt).
5.  Learn more about [how Vonage APIs use JWTs](https://developer.nexmo.com/concepts/guides/authentication#jwts).
 
## Quickstart

### Create an Outbound Call

#### Step 1: Import Vonage Voice module
First, import the ballerinax/vonage.voice module into the Ballerina project.
```ballerina
import ballerinax/vonage.voice as vv;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the JWT obtained above in the configuration.
```ballerina
vv:ClientConfig config = {
    authConfig: {
        token: "JWT"
    }
}
vv:Client baseClient = check new Client(config);
```
#### Step 3: Create an outbound call
You can now make a call from your own machine. Vonage will call you and read out a text-to-speech message.
```ballerina
public function main() {
    EndpointPhoneTo endpointPhoneTo = {
        'type: "phone", 
        number: "9477.....96"
    };
    EndpointPhoneFrom endpointPhoneFrom = {
        'type: "phone", 
        number: "9477.....96"
    };
    NCCO ncco = {
        action: "talk",
        text: "This is a text to speech call from Vonage"
    };
    CreateCallRequestNcco payload = {
        to: [endpointPhoneTo],
        'from: endpointPhoneFrom,
        ncco: [ncco]
    };
    CreateCallResponse|error response = baseClient->createCall(payload);
    if (response is CreateCallResponse) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Get Details of Your Calls

#### Step 1: Import Vonage Voice module
First, import the ballerinax/vonage.voice module into the Ballerina project.
```ballerina
import ballerinax/vonage.voice as vv;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the JWT obtained above in the configuration.
```ballerina
vv:ClientConfig config = {
    authConfig: {
        token: "JWT"
    }
}
vv:Client baseClient = check new Client(config);
```
#### Step 3: Get details of your calls
You can now get details of your calls.
```ballerina
public function main() {
    GetCallsResponse|error response = baseClient->getCalls();
    if (response is CreateCallResponse) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
