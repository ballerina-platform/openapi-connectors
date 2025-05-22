## Overview
This is a generated connector for [Alfresco](https://api-explorer.alfresco.com/api-explorer/) OpenAPI specification. 

This Alfresco Content Services REST APIs enable you to access to the core features of Alfresco Content Services.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Alfresco Account](https://www.alfresco.com/try-alfresco-acs).
* Once registered, you will receive an email with instructions to set up your Alfresco environment, including the default username and password. Use these credentials to access the Alfresco Content Services API.
* Note: This connector only supports Basic Authentication (username/password) and does not require or support bearer tokens.

## Quickstart

To use the Alfresco connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import the module
First, import the `ballerinax/alfresco` module into the Ballerina project.
```ballerina
import ballerinax/alfresco;
```

### Step 2: Create a new connector instance
Create a `alfresco:ConnectionConfig` using the Basic Authentication credentials (i.e: username and password), and initialize the connector with it.
```ballerina
configurable string username = ?;
configurable string password = ?;

alfresco:ConnectionConfig clientConfig = {
    auth: {
        username,
        password
    }
};
alfresco:Client baseClient = check new (clientConfig, serviceURL);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get list of comments in a particular node.
    ```ballerina
    public function main() returns error? {
        alfresco:CommentPaging response = check baseClient->listComments(nodeId);
        log:printInfo(response.toString());
    }
    ``` 

### Step 4: Run the Ballerina application
Use the command below to run the Ballerina application
```bash
bal run
```