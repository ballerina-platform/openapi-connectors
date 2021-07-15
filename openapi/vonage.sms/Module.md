## Overview
Ballerina connector for Vonage SMS is connecting the [Vonage SMS API](https://nexmo-api-specification.herokuapp.com/sms) via Ballerina language easily. With the SMS API you can send SMS from your account and lookup messages both messages that you've sent as well as messages sent to your virtual numbers. Numbers are specified in E.164 format. More SMS API documentation is at https://developer.nexmo.com/messaging/sms/overview.

This module supports [Vonage SMS API](https://nexmo-api-specification.herokuapp.com/sms).

## Configuring Connector

### Prerequisites
- An [Vonage](https://www.vonage.com/) Account

### Obtaining tokens
https://dashboard.nexmo.com/sign-in
1. Obtain your API key and API secret by logging into Vonage API Dashboard and visiting https://dashboard.nexmo.com/
 
## Quickstart

### Send an SMS

#### Step 1: Import Vonage SMS module
First, import the ballerinax/vonage.sms module into the Ballerina project.
```ballerina
import ballerinax/vonage.sms as vs;
```
#### Step 2: Initialize the client.
You can initialize the client as follows.
```ballerina
vs:Client baseClient = check new Client();
```
#### Step 3: Send an SMS 
You can now provide the API key and API secret in the 'NewMessage' record with other message details.
```ballerina
public function main() {
    NewMessage message = {
        api_key: "7b....4",
        'from: "Vonage APIs",
        to: "947....7",
        api_secret: "Gd......4",
        text: "Hello"
    };
    InlineResponse200|error response = baseClient->sendAnSms("json", message);
    if (response is InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.toString());
    }
}
``` 
