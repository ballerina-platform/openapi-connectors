## Overview
This is a generated connector for [Google Apps Script API v1](https://developers.google.com/apps-script/api/) OpenAPI specification.
Manages and executes Google Apps Script projects.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Apps Script connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.appsscript` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.appsscript;
```

### Step 2: Create a new connector instance
Create a `tasks:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
appsscript:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

appsscript:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list information about processes made by or on behalf of a user, such as process type and current status using the connector. 

    List information about processes made by or on behalf of a user.

    ```ballerina
    public function main() {
        appsscript:ListUserProcessesResponse|error response = baseClient->listProcesses();
        if (response is appsscript:ListUserProcessesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
