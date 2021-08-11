## Overview
This is a generated connector for [Vonage SMS API v1.0.10](https://nexmo-api-specification.herokuapp.com/sms) OpenAPI specification. 
With the SMS API you can send SMS from your account and lookup messages both messages that you've sent as well as messages sent to your virtual numbers. 
Numbers are specified in E.164 format. More SMS API documentation is at https://developer.nexmo.com/messaging/sms/overview.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Vonage](https://www.vonage.com/) account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Obtain the `API Key` and `API Secret` from the API Dashboard.
 
## Quickstart

To use the Vonage SMS connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/vonage.sms` module into the Ballerina project.
```ballerina
import ballerinax/vonage.sms as vs;
```
### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
vs:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to send an SMS using the connector. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the 'NewMessage' record with other message details.

    Send an SMS

    ```ballerina
    public function main() {
        NewMessage message = {
            api_key: "7b....4",
            api_secret: "Gd......4",
            'from: "Vonage APIs",
            to: "947....7",
            text: "Hello"
        };
        InlineResponse200|error response = baseClient->sendAnSms(message);
        if (response is InlineResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
