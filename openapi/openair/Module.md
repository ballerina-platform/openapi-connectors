## Overview
This is a generated connector for [OpenAir API v1.0](https://www.openair.com/download/OpenAirRESTAPIGuide.pdf) OpenAPI specification.
The OpenAir REST API provides an interface for integration applications to exchange information with [OpenAir](https://docs.oracle.com/cloud/openair/index.html). OpenAir REST API currently supports the following resources: Expense reports, Receipts, Attachments, Job codes, Contacts  

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [OpenAir](https://www.openair.com/) account.
* Obtain token by following [this guide](https://www.openair.com/download/OpenAirRESTAPIGuide.pdf).

## Quickstart

To use the OpenAir connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/openair` module into the Ballerina project.
```ballerina
import ballerinax/openair;
```
### Step 2: Create a new connector instance
Create a `openair:ClientConfig` with bearer token obtained, then initialize the connector with it and the service URL according to the [OpenAir
REST API guide](https://www.openair.com/download/OpenAirRESTAPIGuide.pdf).
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
openair:ClientConfig clientConfig = {auth : authConfig};
openair:Client baseClient = check new Client(clientConfig, serviceUrl = "<Service URL>");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get a list of contacts using the connector. 

    ```ballerina
    public function main() {
        openair:OpenAirResponse|error response = baseClient->getContacts();
        if (response is openair:OpenAirResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
