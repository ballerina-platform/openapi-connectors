## Overview
This is a generated connector for [Sinch Voice API v1.0.0](https://www.sinch.com/) OpenAPI specification. 

The Calling API exposes calling- and conference-related functionality in the Sinch Voice Platform.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Sinch account](https://www.sinch.com/) account
* Obtain tokens by following [this guide](https://developers.sinch.com/docs/voice/api-reference/authentication/#basic-authorization).

## Quickstart

To use the Sinch Voice connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/sinch.voice` module into the Ballerina project.
```ballerina
import ballerinax/sinch.voice;
```

### Step 2: Create a new connector instance
Create a `voice:ClientConfig` with the `<USERNAME>` and `<PASSWORD>` obtained, and initialize the connector with it.
```ballerina
voice:ClientConfig clientConfig = {
    auth: {
        username: <USERNAME>,
        password: <PASSWORD>
    }
};

voice:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to send callout using the connector. 

    ```ballerina
    public function main() {
        voice:CalloutRequest request = {
            method: "ttsCallout",
            ttsCallout: {
                cli: "+14045001000",
                destination: {
                    'type: "number",
                    endpoint: "+14045005000"
                }
            }
        };

        voice:GetCalloutResponseObj|error response = baseClient->callouts(request);
        if (response is voice:GetCalloutResponseObj) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

