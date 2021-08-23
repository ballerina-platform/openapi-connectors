## Overview
This is a generated connector for [Google Cloud Talent Solution API v4](https://cloud.google.com/talent-solution/job-search/docs/) OpenAPI specification.
Cloud Talent Solution provides the capability to create, read, update, and delete job postings, as well as search jobs based on keywords and filters.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Cloud Talent Solution connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.cloudtalentsolution` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.cloudtalentsolution;
```

### Step 2: Create a new connector instance
Create a `cloudtalentsolution:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
cloudtalentsolution:ClientConfig clientConfig = {
    auth: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

cloudtalentsolution:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to lists jobs by filter using the connector. 

    Lists jobs by filter

    ```ballerina
    public function main() {
        cloudtalentsolution:ListJobsResponse|error response = baseClient->listProjectsTenants("projects/<projectId>/tenants/<tenantId>","<filter>");
        if (response is cloudtalentsolution:ListJobsResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
