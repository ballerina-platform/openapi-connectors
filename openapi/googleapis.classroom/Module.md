## Overview
This is a generated connector for [Google Classroom API v1](https://developers.google.com/classroom/guides/get-started) OpenAPI specification.
Manages classes, rosters, and invitations in Google Classroom.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Classroom connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.classroom` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.classroom;
```

### Step 2: Create a new connector instance
Create a `classroom:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
classroom:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

classroom:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to return a list of courses that the requesting user is permitted to view, restricted to those that match the request using the connector. 

    Return a list of courses

    ```ballerina
    public function main() {
        classroom:ListCoursesResponse|error response = baseClient->listCourses();
        if (response is classroom:ListCoursesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
