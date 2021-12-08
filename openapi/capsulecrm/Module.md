## Overview
This is a generated connector for [Capsule CRM API v2](https://developer.capsulecrm.com/v2/overview/getting-started) OpenAPI specification.
Capsule CRM keeps track of the people and companies you do business with, opportunities in the pipeline and what needs to be done.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Capsule CRM](https://capsulecrm.com) account
* Obtain tokens by following [this guide](https://developer.capsulecrm.com/v2/overview/authentication)
 
## Quickstart

To use the Capsule CRM connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/capsulecrm` module into the Ballerina project.
```ballerina
import ballerinax/capsulecrm;
```

### Step 2: Create a new connector instance
Create a `capsulecrm:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
capsulecrm:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
capsulecrm:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve the collection of Cases on the Capsule account using the connector.

    Retrieves the collection of Cases on the Capsule account

    ```ballerina
    public function main() returns error? {
        capsulecrm:Cases response = check baseClient->listCases();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
