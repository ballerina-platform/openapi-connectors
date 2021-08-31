## Overview
This is a generated connector for [atSpoke API v0.1.0](https://askspoke.com/api/reference) OpenAPI specification.
The atSpoke REST API provides a broad set of operations including:
- Creation, manipulation, and deletion of requests in atSpoke
- Management of users in atSpoke
- Creation, manipulation, and deletion of knowledge resources in atSpoke
The public API is served from https://api.askspoke.com/api/v1 – note `api` in the host name, not your usual organization id.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [atSpoke](https://www.atspoke.com) account
* Obtain tokens by following [this guide](https://help.atspoke.com/article/uga6efxps2-api-authentication)
 
## Quickstart

To use the atSpoke connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/atspoke` module into the Ballerina project.
```ballerina
import ballerinax/atspoke;
```

### Step 2: Create a new connector instance
Create a `atspoke:ApiKeysConfig` with the API key obtained, and initialize the connector with it. 
```ballerina
atspoke:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
atspoke:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to return a list of teams using the connector.

    Return a list of teams

    ```ballerina
    public function main() returns error? {
        atspoke:InlineResponse2006 response = check baseClient->getTeams();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
