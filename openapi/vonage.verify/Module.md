## Overview
Ballerina connector for Vonage Verify is connecting the [Vonage Verify API](https://nexmo-api-specification.herokuapp.com/verify) via Ballerina language easily. The Verify API helps you to implement 2FA (two-factor authentication) in your applications. 

This is useful for:
- Protecting against spam, by preventing spammers from creating multiple accounts
- Monitoring suspicious activity, by forcing an account user to verify ownership of a number
- Ensuring that you can reach your users at any time because you have their correct phone number 
More information is available at https://developer.nexmo.com/verify/overview

This module supports [Vonage Verify API v1.1.7](https://nexmo-api-specification.herokuapp.com/verify).

## Configuring Connector

### Prerequisites
- An [Vonage](https://www.vonage.com/) Account

### Obtaining tokens
1. Log into Vonage API Dashboard and visiting https://dashboard.nexmo.com/
2. Obtain the `API Key` and `API Secret` from the API Dashboard.
 
## Quickstart

### Request a Verification

#### Step 1: Import Vonage Verify module
First, import the ballerinax/vonage.verify module into the Ballerina project.
```ballerina
import ballerinax/vonage.verify as vv;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. 
```ballerina
vv:Client baseClient = check new Client();
```
#### Step 3: Make a verification request
You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the configuration.
You can now generate and send a PIN to your user.
- Create a request to send a verification code to your user.
- Check the `status` field in the response to ensure that your request was successful (zero is success).
- Use the `request_id` field in the response for the Verify check.

```ballerina
public function main() {
    vv:VerifyRequest verifyRequest = {
        api_key: "7b.....4",
        api_secret: "Gd........4",
        number: "94......6",
        brand: "WSO2"
    };
    vv:InlineResponse200|error response = baseClient->verifyRequest(verifyRequest);
    if (response is vv:InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Verify Check

#### Step 1: Import Vonage Verify module
First, import the ballerinax/vonage.verify module into the Ballerina project.
```ballerina
import ballerinax/vonage.verify as vv;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. 
```ballerina
vv:Client baseClient = check new Client();
```
#### Step 3: Make a verification request
You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/) in the configuration.
Use Verify check to confirm that the PIN you received from your user matches the one sent by Vonage in your Verify request.
```ballerina
public function main() {
    vv:CheckRequest checkRequest = {
        api_key: "7b1.....4",
        api_secret: "Gd........4",
        request_id: "36...............443",
        code: "5..0"
    };
    vv:InlineResponse200|error response = baseClient->verifyCheck(checkRequest);
    if (response is vv:InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 