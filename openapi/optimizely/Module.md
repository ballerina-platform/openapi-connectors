## Overview
This is a generated connector for [Optimizely API v2](https://www.optimizely.com/) OpenAPI specification. 

Optimizely Agent is a stand-alone, open-source microservice that provides major benefits over using Optimizely SDKs in certain use cases. Its REST API offers consolidated and simplified endpoints for accessing all the functionality of Optimizely Full Stack SDKs. Use this API the control experiments (such as a feature tests).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Optimizely account](https://www.optimizely.com/).
* Obtain tokens by following [this guide](https://docs.developers.optimizely.com/web/docs/rest-api-getting-started#section-2-generate-a-token).

## Quickstart

To use the Optimizely connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/optimizely` module into the Ballerina project.
```ballerina
import ballerinax/optimizely;
```

### Step 2: Create a new connector instance
Create a `optimizely:CredentialsConfig` with the `<TOKEN>` obtained, and initialize the connector with it.
```ballerina
optimizely:ClientConfig clientConfig = {
    auth : {
        token: `<TOKEN>`
    }
};

optimizely:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list attributes under a project using the connector. 

    ```ballerina
    public function main() {
        int projectId = 231112;
        optimizely:Attribute[]|error response = baseClient->listAttributes(projectId);
        if (response is optimizely:Attribute[]) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

