## Overview
This is a generated connector from [Files.com API v1.0](https://www.files.com/) OpenAPI specification.

Welcome to the Files.com API. Our REST API are designed for people who require the highest level of integration between Files.com and their own application, website, or database.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Files.com](https://www.files.com/) account
* Obtain tokens by following [this guide](https://developers.files.com/#authentication-with-api-key)

## Quickstart

To use the Files.com connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/files.com` module into the Ballerina project.
```ballerina
import ballerinax/files.com as filesdotcom;
```

### Step 2: Create a new connector instance
Create a `filesdotcom:ClientConfig` with the `API key` obtained, and initialize the connector with it.
```ballerina
filesdotcom:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

filesdotcom:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get API activity using the connector. 

    ```ballerina
    public function main() {
        filesdotcom:SiteEntity|error response = baseClient->getSite();
        if (response is filesdotcom:SiteEntity) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

