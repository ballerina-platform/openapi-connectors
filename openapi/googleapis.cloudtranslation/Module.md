## Overview
This is a generated connector for [Google Cloud Translation API v3](https://cloud.google.com/translate/docs/quickstarts) OpenAPI specification.
Integrates text translation into your website or application.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Cloud Translation connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.cloudtranslation` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.cloudtranslation;
```

### Step 2: Create a new connector instance
Create a `cloudtranslation:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
cloudtranslation:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

cloudtranslation:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to translate input text and return translated text using the connector. 

    Translates input text and returns translated text

    ```ballerina
    public function main() {
        cloudtranslation:TranslateTextResponse|error response = baseClient->translatetextProjectsLocations("projects/<project-number-or-id>/locations/<location-id>");
        if (response is cloudtranslation:TranslateTextResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
