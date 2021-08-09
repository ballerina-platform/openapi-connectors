## Overview
This is a generated connector for [Vonage Voice API v1.3.6](https://nexmo-api-specification.herokuapp.com/api/voice) OpenAPI specification. 
The Voice API lets you create outbound calls, control in-progress calls and get information about historical calls. 
More information about the Voice API can be found at https://developer.nexmo.com/voice/voice-api/overview.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Vonage](https://www.vonage.com/) account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Go to https://dashboard.nexmo.com/getting-started/voice and follow the guidelines to create an application.
    3. Use the `Application ID` and the `Private key` of the created application to generate a `JWT token`. You can generate a JWT using the [online tool](https://developer.nexmo.com/jwt).
    4.  Learn more about [how Vonage APIs use JWTs](https://developer.nexmo.com/concepts/guides/authentication#jwts).

## Quickstart

To use the Vonage Voice connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/vonage.voice` module into the Ballerina project.
```ballerina
import ballerinax/vonage.voice as vv;
```

### Step 2: Create a new connector instance
You can initialize the client as follows. You can now provide the JWT obtained above in the configuration.
Create a `voice:ClientConfig` with the JWT token obtained, and initialize the connector with it.
```ballerina
vv:ClientConfig config = {
    authConfig: {
        token: "JWT"
    }
}

vv:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation

1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to create an outbound call using the connector. You can now make a call from your own machine. Vonage will call you and read out a text-to-speech message.

    Create an outbound call

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

    Following is an example on how to get details of your calls using the connector.

    Get details of your calls

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
2. Use `bal run` command to compile and run the Ballerina program. 
