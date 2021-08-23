## Overview
This is a generated connector for [Google Slides API v1](https://developers.google.com/slides/api) OpenAPI specification. Reads and writes Google Slides presentations.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Slides connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the ballerinax/googleapis.slides module into the Ballerina project.
```ballerina
import ballerinax/googleapis.slides as slides;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Google Slides client configuration and create Google Slides client by passing the configuration:

```ballerina
slides:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

slides:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation

1. You can create a presentation as follows with `createPresentation` method by passing a `Presentation` record as parameter.

    ```ballerina
    slides:Presentation createPayload = {
        "title": "Sample Presentation"
    };

    slides:Presentation presentation = check baseClient->createPresentation(createPayload);
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
