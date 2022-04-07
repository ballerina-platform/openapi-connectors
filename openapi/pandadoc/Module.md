## Overview

This is a generated connector from [PandaDoc API version 4.3.0](https://developers.pandadoc.com/reference/about) OpenAPI Specification. 

PandaDoc API spans a broad range of functionality to help you build incredible documents automation experiences inside your product. PandaDoc API is organized around REST. Our API has predictable resource-oriented URLs and uses standard HTTP response codes, authentication, and verbs.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [PandaDoc](https://www.pandadoc.com/) account. 
* You can start using PandaDoc API with their [free sandbox plan](https://signup.pandadoc.com/?ss=api-dev&plan=rec_plans_v5_api_dev_mn_free), which allows you to open all the available features. 
* The [sandbox API key](https://developers.pandadoc.com/reference/api-key-authentication-process#sandbox-key) you can generate on the Developer Dashboard with predefined rate limits.

## Quickstart

To use the PandaDoc connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/pandadoc` module into the Ballerina project.
```ballerina
import ballerinax/pandadoc;
```

### Step 2: Create a new connector instance
Create a `pandadoc:AuthConfig` with the `API-Key` obtained, and initialize the connector with it.

```ballerina
    pandadoc:AuthConfig authConfig = {
        auth: {
            authorization: "API-Key <API Key>"
        }
    };
    pandadoc:Client baseClient = check new Client(authConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list opportunities, using the connector.

    Gets a list of opportunities.

    ```ballerina
    public function main() returns error? {
        pandadoc:DocumentListResponse response = check baseClient->listDocuments();
        log:printInfo(response.toJsonString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
