## Overview
This is a generated connector for [FraudLabsPro SMS Verification API v1.0](https://www.fraudlabspro.com/developer/api/send-verification) OpenAPI specification. 
Send an SMS with verification code and a custom message for authentication purpose.
It helps merchants to minimize chargebacks and fraud for various kinds of payment method, such as credit card, paypal, cod and so on. 
Please visit https://www.fraudlabspro.com to learn more.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [FraudLabsPro](https://www.fraudlabspro.com/checkout) account
* Obtain tokens
    1. Log into FraudLabsPro account by visiting https://www.fraudlabspro.com/merchant/login
    2. Obtain the `API Key` from [here](https://www.fraudlabspro.com/merchant/sms-verification-api) following [this guide](https://www.fraudlabspro.com/developer/api/send-verification)

**Note:** The connector initialization doesn't require setting the API credentials. But invoking the connector endpoints may require passing API credentials as parameters.
 
## Quickstart

To use the FraudLabsPro SMS Verification connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/fraudlabspro.smsverification` module into the Ballerina project.
```ballerina
import ballerinax/fraudlabspro.smsverification as fs;
```

### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
fs:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to send an SMS with verification code and a custom message for authentication purpose using the connector.

    Send SMS verification

    ```ballerina
    public function main() {
        string|error response = baseClient->send("<MOBILE_NUMBER_Eg_+123456789>","<API_KEY>","<COUNTRY_CODE>",
            "<RESPONSE_FORMAT>","mesg=Hi, your OTP is <OTP>");
        if (response is string) {
            log:printInfo(response);
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to verify that an OTP sent by the Send SMS Verification API is valid using the connector. 

    Get verification result

    ```ballerina
    public function main() {
        string|error response = baseClient->result("<TRANSACTION_ID>","<API_KEY>","<OTP>");
        if (response is string) {
            log:printInfo(response);
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
