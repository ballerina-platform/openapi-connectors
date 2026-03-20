## Overview
The Sinch Verification API v2.0 connector(https://www.sinch.com/) OpenAPI specification. 

Verify users with SMS, flash calls (missed calls), a regular call, or data verification.

### Key Features

- Programmatic access to create and manage resources via REST API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Sinch account](https://www.sinch.com/) account
* Obtain tokens by following [this guide](https://developers.sinch.com/docs/verification/api-reference/authentication/).

## Quickstart

To use the Sinch Verification connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/sinch.verification` module into the Ballerina project.
```ballerina
import ballerinax/sinch.verification;
```

### Step 2: Create a new connector instance
Create a `verification:ClientConfig` with the `<USERNAME>` and `<PASSWORD>` obtained, and initialize the connector with it.
```ballerina
verification:ClientConfig clientConfig = {
    auth: {
        username: <USERNAME>,
        password: <PASSWORD>
    }
};

verification:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to start verification using the connector. 

    ```ballerina
    public function main() {
        verification:InitiateVerificationResource resources = {
            identity: {
                'type: "number",
                endpoint: "+46700000000"
            },
            method: "sms"
        };

        verification:InitiateVerificationResponse|error response = baseClient->startVerification(resources);
        if (response is verification:InitiateVerificationResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

