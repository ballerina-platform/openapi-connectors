## Overview
This is a generated connector for [Alfresco](https://api-explorer.alfresco.com/api-explorer/) OpenAPI specification. 

This Alfresco Content Services REST APIs enable you to access to the core features of Alfresco Content Services.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Alfresco Account](https://www.alfresco.com/try-alfresco-acs).
* Obtain tokens by following [this guide](https://docs.alfresco.com/content-services/latest/develop/repo-ext-points/authentication/).

## Quickstart

To use the Alfresco connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/alfresco` module into the Ballerina project.
```ballerina
import ballerinax/alfresco;
```

### Step 2: Create a new connector instance
Create a `alfresco:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
alfresco:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
alfresco:Client baseClient = check new (clientConfig, serviceURL);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get list of comments in a particular node.

    Retrieve list of comments in a particular node.

    ```ballerina
    public function main() returns error? {
        alfresco:CommentPaging response = check baseClient->listComments(nodeId);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.