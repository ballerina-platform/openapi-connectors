## Overview
This is a generated connector for [Open Design REST API v0.3.4](https://opendesign.dev/docs/api-reference/introduction) OpenAPI specification. 

Open Design read and display data from designs using code. Unlock the power of programmatic design.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Open Design account](https://opendesign.dev) account
* Obtain tokens by following [this guide](https://opendesign.dev/docs/api-reference/introduction#step-1-get-your-api-token).

## Quickstart

To use the Brex Onboarding connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/opendesign` module into the Ballerina project.
```ballerina
import ballerinax/opendesign;
```

### Step 2: Create a new connector instance
Create a `opendesign:ClientConfig` with the `<JWT_TOKEN>` obtained, and initialize the connector with it.
```ballerina
opendesign:ClientConfig clientConfig = {
    authConfig : {
        token: <JWT_TOKEN>
    }
};

opendesign:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on test if your token is valid using the connector. 

    ```ballerina
    public function main() {
        opendesign:InlineResponse200|error response = baseClient->checkToken();
        if (response is opendesign:InlineResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

