## Overview
This is a generated connector for [FraudLabsPro Fraud Detection API v1.1](https://www.fraudlabspro.com/developer/api/screen-order) OpenAPI specification. 
Online payment fraud detection service. It helps merchants to minimize chargebacks and therefore maximize the revenue. 
It can be used to detect fraud for various kinds of payment method, such as credit card, paypal, cod and so on. 
Please visit https://www.fraudlabspro.com to learn more.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [FraudLabsPro](https://www.fraudlabspro.com/checkout) account
* Obtain tokens
    1. Log into FraudLabsPro account by visiting https://www.fraudlabspro.com/merchant/login
    2. Obtain the `API Key` following [this guide](https://www.fraudlabspro.com/developer/api/screen-order)

**Note:** The connector initialization doesn't require setting the API credentials. But invoking the connector endpoints may require passing API credentials as parameters.
 
## Quickstart

To use the FraudLabsPro SMS Verification connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/fraudlabspro.frauddetection` module into the Ballerina project.
```ballerina
import ballerinax/fraudlabspro.frauddetection as ff;
```

### Step 2: Create a new connector instance
Initialize the connector.
```ballerina
ff:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to Update status of a transaction from pending-manual-review to APPROVE, REJECT or IGNORE using the connector. The FraudLabs Pro algorithm will improve the formula in determining the FraudLabs Pro score using the data collected.

    Feedback order

    ```ballerina
    public function main() {
        string|error response = baseClient->feedback("<TRANSACTION_ID>","<API_KEY>",
            "<APPROVE|REJECT|REJECT_BLACKLIST>","<RESPONSE_FORMAT>");
        if (response is string) {
            log:printInfo(response);
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to screen an order transaction for payment fraud using the connector. This API will detect all possibles fraud traits based on the input parameters supplied. The more input parameter supplied, the higher accuracy of fraud detection.

    Screen order

    ```ballerina
    public function main() {
        string|error response = baseClient->screen("<IP_ADDRESS_OF_TRANSACTION>","<API_KEY>","<RESPONSE_FORMAT>");
        if (response is string) {
            log:printInfo(response);
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
