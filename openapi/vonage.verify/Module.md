## Overview
This is a generated connector from [Vonage Verify API v1.1.7](https://nexmo-api-specification.herokuapp.com/verify) OpenAPI specification. 
The Verify API helps you to implement 2FA (two-factor authentication) in your applications. 
More information is available at https://developer.nexmo.com/verify/overview

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create [Vonage](https://www.vonage.com/) account
* Obtain tokens
    1. Log into Vonage API Dashboard by visiting https://dashboard.nexmo.com/
    2. Obtain the `API Key` and `API Secret` from the API Dashboard.

## Quickstart

To use the Vonage Number Insight connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/vonage.verify` module into the Ballerina project.
```ballerina
import ballerinax/vonage.verify as vv;
```

### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
vv:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to make a verification request using the connector. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/).
    You can now generate and send a PIN to your user.
    - Create a request to send a verification code to your user.
    - Check the `status` field in the response to ensure that your request was successful (zero is success).
    - Use the `request_id` field in the response for the Verify check.

    Request a Verification

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

    Following is an example on how to verify check using the connector. You can now provide the API key and API secret obtained from the [Vonage API Dashboard](https://dashboard.nexmo.com/). Use verify check to confirm that the PIN you received from your user matches the one sent by Vonage in your verify request.

    Verify Check

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

2. Use `bal run` command to compile and run the Ballerina program.
