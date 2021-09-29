## Overview
This is a generated connector for [ProdPad API v1.0](https://www.prodpad.com/) OpenAPI specification. 

ProdPad is product management software that helps product managers develop product strategy. Easily manage teams, customers and roadmaps.  

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [ProdPad account](https://www.prodpad.com/)
* Obtain token by following [this guide](https://help.prodpad.com/article/763-generating-an-api-key).

## Quickstart

To use the ProdPad connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/prodpad` module into the Ballerina project.
```ballerina
import ballerinax/prodpad;
```

### Step 2: Create a new connector instance
Create a `prodpad:ClientConfig` with the `<API_KEY>` obtained, and initialize the connector with it.
```ballerina
prodpad:ClientConfig clientConfig = {
    auth: {
        token: <API_KEY>
    }
};

prodpad:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to get a list of feedbacks using the connector. 

    ```ballerina
    public function main() {
        prodpad:FeedbackList|error response = baseClient->getFeedbacks();
        if (response is prodpad:FeedbackList) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.

