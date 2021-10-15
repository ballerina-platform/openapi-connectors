## Overview
This is a generated connector for [Google Cloud Natural Language API v1](https://cloud.google.com/natural-language/) OpenAPI specification.
Provides natural language understanding technologies, such as sentiment analysis, entity recognition, entity sentiment analysis, and other text annotations, to developers.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Cloud Natural Language connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.cloudnaturallanguage` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.cloudnaturallanguage;
```

### Step 2: Create a new connector instance
Create a `cloudnaturallanguage:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
cloudnaturallanguage:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

cloudnaturallanguage:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to classify a document into categories using the connector. 

    Classifies a document into categories

    ```ballerina
    public function main() {
        cloudnaturallanguage:Document document = {
            content: "<content>"
        };
        cloudnaturallanguage:ClassifyTextRequest classifyTextRequest = {
            document: document
        };

        cloudnaturallanguage:ClassifyTextResponse|error response = baseClient->classifytextDocuments(classifyTextRequest);
        if (response is cloudnaturallanguage:ClassifyTextResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
