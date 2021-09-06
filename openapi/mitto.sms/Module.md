## Overview
This is a generated connector for [Mitto SMS and Bulk SMS APIs v1](https://docs.mitto.ch/sms-api-reference/) OpenAPI specification.
Send individual SMS reliably and securely, or send them in bulk. 
You can choose from different servers to test with based on where you want to send a message to.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Mitto](https://docs.mitto.ch) account
* Obtain tokens by following [this guide](https://docs.mitto.ch/sms-api/#authentication)
 
## Quickstart

To use the Neutrino connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/mitto.sms` module into the Ballerina project.
```ballerina
import ballerinax/mitto.sms;
```

### Step 2: Create a new connector instance
Create a `sms:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
sms:ApiKeysConfig config = {
    apiKeys: {
        X-Mitto-API-Key: "<API_KEY>"
    }
}
sms:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to send an sms using the connector.

    Send an sms

    ```ballerina
    public function main() {
        sms:Body body = {
            'from: "MITTO SMS",
            to: "15555552795",
            text: "Hello, World!",
            test: true
        };
        sms:Sms response = check baseClient->sendSms(body);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
