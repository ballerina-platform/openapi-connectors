## Overview
This is a generated connector for [Shortcut API v3.0](https://shortcut.com/api/rest/v3) OpenAPI specification.
The Shortcut API bring the flow to your software team's workflow. Plan, collaborate, build, and measure success with Shortcut.
The Shortcut API provides a greater amount of control over your organization’s Shortcut data than what is possible using the Shortcut web app. 
You can use this API to build custom integrations or automate even more of your organization’s workflow.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Shortcut](https://shortcut.com) account
* Obtain tokens by following [this guide](https://shortcut.com/api/rest/v3#Authentication)
 
## Quickstart

To use the Shortcut connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shortcut` module into the Ballerina project.
```ballerina
import ballerinax/shortcut;
```

### Step 2: Create a new connector instance
Create a `shortcut:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
shortcut:ApiKeysConfig config = {
    shortcutToken: "<API_KEY>"
}
shortcut:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a list of categories using the connector.

    List Categories

    ```ballerina
    public function main() returns error? {
        shortcut:Category[] response = check baseClient->listCategories();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
