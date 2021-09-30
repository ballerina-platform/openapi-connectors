## Overview
This is a generated connector for [Listen Notes API v2.0](https://www.listennotes.com/) OpenAPI specification. 

Simple & no-nonsense podcast search & directory API. Search all podcasts and episodes by people, places, or topics.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Listen Notes account](https://www.listennotes.com/).
* Obtain tokens by following [this guide](https://help.listennotes.com/en/articles/3416436-how-to-get-an-api-token-of-listen-notes-api).

## Quickstart

To use the Listen Notes connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/listen.notes` module into the Ballerina project.
```ballerina
import ballerinax/listen.notes;
```

### Step 2: Create a new connector instance
Create a `notes:ApiKeysConfig` with the `<API_KEY>` obtained, and initialize the connector with it.
```ballerina
notes:ApiKeysConfig apiKeyConfig = {
    xListenapiKey: `<API_KEY>`
};

notes:Client baseClient = check new Client(apiKeyConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to search using the connector. 

    ```ballerina
    public function main() {
        string q = "game of thrones";

        notes:SearchResponse|error response = baseClient->search(q);
        if (response is notes:SearchResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

