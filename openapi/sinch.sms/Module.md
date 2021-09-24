## Overview
This is a generated connector for [Sinch SMS API v1](https://www.sinch.com/) OpenAPI specification. 

Sinch SMS API is the one of the easiest APIs we offer and enables you to add fast and reliable global SMS to your applications. It allows for sending single messages, scheduled batch sending, message templates and more.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Sinch account](https://www.sinch.com/) account
* Obtain tokens by following [this guide](https://developers.sinch.com/docs/sms/api-reference/#authentication).

## Quickstart

To use the Sinch sms connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/sinch.sms` module into the Ballerina project.
```ballerina
import ballerinax/sinch.sms;
```

### Step 2: Create a new connector instance
Create a `sms:ClientConfig` with the `<BEARER_TOKEN>` obtained, and initialize the connector with it.
```ballerina
sms:ClientConfig clientConfig = {
    auth : {
        token: <BEARER_TOKEN>
    }
};

sms:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to send sms using the connector. 

    ```ballerina
    public function main() {
        string servicePlanID = "jd63jf88477ll";
        sms:SendBatchObject message = {
            'from: "12345",
            to: [
                "+15551231212"
            ],
            body: "Hello how are you"
        };

       sms:SendBatchCreated|error response = baseClient->sendSMS(servicePlanID, message);
        if (response is sms:SendBatchCreated) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

