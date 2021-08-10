## Overview
This is a generated connector for [Google Docs API v1.0](https://developers.google.com/docs/api) OpenAPI specification.
The Docs API provides access to read and write documents programmatically so that you can integrate data from various sources.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Docs connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.docs` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.docs;
```

### Step 2: Create a new connector instance
Create a `docs:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
docs:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

docs:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a Google Doc by document ID using the connector. 

    Retrieve a document by ID

    ```ballerina
    public function main() {
        docs:Document|error response = baseClient->docsDocumentsGet("<DOCUMENT_ID>");
        if (response is docs:Document) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
