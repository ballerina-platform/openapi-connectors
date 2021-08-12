## Overview
This is a generated connector for [Google Tasks API v1](https://developers.google.com/tasks/get_started) OpenAPI specification.
The Google Tasks API lets you manage your tasks and task lists.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Tasks connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.tasks` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.tasks;
```

### Step 2: Create a new connector instance
Create a `tasks:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
tasks:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

tasks:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to return all the authenticated user's task lists using the connector. 

    Return all the authenticated user's task lists

    ```ballerina
    public function main() {
        tasks:TaskLists|error response = baseClient->listTasklists();
        if (response is tasks:TaskLists) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
