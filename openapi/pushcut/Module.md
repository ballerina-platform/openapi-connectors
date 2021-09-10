## Overview
This is a generated connector for [Pushcut API v1](https://www.pushcut.io/webapi.html) OpenAPI specification.
API to send Pushcut notifications, execute Automation Server actions, and register custom webhooks as online actions.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Pushcut](https://www.pushcut.io) account
* Obtain tokens by following [this guide](https://www.pushcut.io/help)
 
## Quickstart

To use the Optirtc connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/pushcut` module into the Ballerina project.
```ballerina
import ballerinax/pushcut;
```

### Step 2: Create a new connector instance
Create a `pushcut:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
pushcut:ApiKeysConfig config = {
    apiKeys: {
        API-Key: "<API_KEY>"
    }
}
pushcut:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of all active devices using the connector.

    Gets a list of all active devices

    ```ballerina
    public function main() returns error? {
        pushcut:InlineResponse200[] response = check baseClient->getDevices();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
