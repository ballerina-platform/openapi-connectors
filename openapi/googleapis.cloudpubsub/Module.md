## Overview
This is a generated connector for [Google Cloud Pub/Sub REST API v1](https://cloud.google.com/pubsub/docs/reference/rest) OpenAPI specification.
The Google Cloud Pub/Sub API provides the capability to do the messaging and ingestion for event-driven systems and streaming analytics.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create a [Google account](https://accounts.google.com/signup)
2. Obtain tokens - Follow [this guide](https://developers.google.com/identity/protocols/oauth2)

## Quickstart

To use the Google Cloud Pub/Sub connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.cloudpubsub` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.cloudpubsub;
```

### Step 2: Create a new connector instance
Create a `pubsub:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
cloudpubsub:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};
cloudpubsub:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.  
   Following is an example on how to list the topics in a project using the connector. 

    ```ballerina
    public function main() returns error? {
        cloudpubsub:ListTopicsResponse response = check baseClient->pubsubProjectsTopicsList("xxx");
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.