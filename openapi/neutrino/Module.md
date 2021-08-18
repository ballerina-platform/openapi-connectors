## Overview
This is a generated connector for [Neutrino API v3.5.0](https://www.neutrinoapi.com/api/api-basics/) OpenAPI specification.
The Neutrino API is a general-purpose API.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Neutrino](https://www.neutrinoapi.com/signup) account
* Obtain tokens by following [this guide](https://www.neutrinoapi.com/api/api-basics/)
 
## Quickstart

To use the Neutrino connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/neutrino` module into the Ballerina project.
```ballerina
import ballerinax/neutrino;
```

### Step 2: Create a new connector instance
Create a `neutrino:ApiKeysConfig` with the User ID and API key obtained, and initialize the connector with it.
```ballerina
neutrino:ApiKeysConfig config = {
    apiKeys: {
        user-id: "<USER_ID>",
        api-key: "<API_KEY>"
    }
}
neutrino:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get location information about an IP address using the connector.

    Get location information about an IP address 

    ```ballerina
    public function main() {
        neutrino:Body19 body19 = {
            'output\-case: "kebab",
            ip: "162.209.104.195"
        };
        neutrino:IPInfoResponse|error response = baseClient->getIPInfo(body19);
        if (response is neutrino:IPInfoResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
