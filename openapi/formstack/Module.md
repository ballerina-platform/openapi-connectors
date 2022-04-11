## Overview
This is a generated connector for [Formstack REST API v2.0](https://formstack.readme.io/docs/api-overview) OpenAPI specification.
Formstack is a workplace productivity platform that helps organizations streamline digital work through no-code online forms, documents, and signatures.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Formstack account](https://admin.formstack.com/signup/sign-starter). 
2. Obtain tokens - Follow [this guide](https://help.formstack.com/s/article/How-to-create-a-V2-API-Application-Key).

## Quickstart

To use the Formstack connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/formstack` module into the Ballerina project.
```ballerina
import ballerinax/formstack;
```

### Step 2: Create a new connector instance
Create a `formstack:ClientConfig` with the access token, and initialize the connector with it.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
formstack:ClientConfig clientConfig = {auth : authConfig};
formstack:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get the details of the specified form.

    ```ballerina
    public function main() returns error? {
        formstack:Form form = check baseClient->getFormById(4771452);
        log:printInfo(form.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
