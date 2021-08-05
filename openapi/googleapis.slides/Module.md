## Overview
This is a generated connector for [Google Slides API v1](https://developers.google.com/slides/api) OpenAPI specification.
Google Slides API allow read and write Google Slides presentations.
For additional help getting started with the API, visit [Google Slides API](https://developers.google.com/slides/api/reference/rest).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

- Create a [Google account](https://accounts.google.com/signup/v2/webcreateaccount?utm_source=ga-ob-search&utm_medium=google-account&flowName=GlifWebSignIn&flowEntry=SignUp)
- Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Slides API connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/googleapis.slides module into the Ballerina project.
```ballerina
import ballerinax/googleapis.slides as slides;
```
### Step 2: Create a new connector instance

You can now enter the credentials in the Google Slides API client configuration and create Google Slides API client by passing the configuration:

```ballerina
slides:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

slides:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation

1. You can create a presentation as follows with `getSlidesPresentations` method by passing a `Presentation` record as parameter. Successful creation returns the created presentation as a `Presentation` and the error cases returns an `error` object.

    ```ballerina
    slides:Presentation createPayload = {
        "title": "Sample Presentation"
    };

    slides:Presentation presentation = check baseClient->createSlidesPresentations(createPayload);
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
