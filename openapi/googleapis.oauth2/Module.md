## Overview
This is a generated connector for [Google OAuth2 API v2.0](https://developers.google.com/identity/protocols/oauth2/) OpenAPI specification.
The OAuth2 API provides end-user authorization grants for use with other Google APIs.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google OAuth2 connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.oauth2` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.oauth2;
```

### Step 2: Create a new connector instance
Create a `oauth2:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
oauth2:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

oauth2:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a oauth token information using the connector. 

    Retrieve a token information

    ```ballerina
    public function main() {
        oauth2:Tokeninfo|error response = baseClient->oauth2Tokeninfo();
        if (response is oauth2:Tokeninfo) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
