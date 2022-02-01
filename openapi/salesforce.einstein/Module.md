## Overview
This is a generated connector for [Einstein Vision and Einstein Language API](https://metamind.readme.io/reference#predictive-vision-service-api) OpenAPI specification. 

Allows you to access the Einstein Vision and Einstein Language services via the standard REST API calls. Use the APIs to programmatically work with datasets, labels, examples, models, and predictions.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Einstein API Account](https://api.einstein.ai/signup).
* Obtain tokens by following [this guide](https://metamind.readme.io/docs/generate-an-oauth-token-using-your-key).

## Quickstart

To use the Salesfore Einstein Vision and Einstein Language connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/salesforce.einstein` module into the Ballerina project.
```ballerina
import ballerinax/salesforce.einstein;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the <ACCESS_TOKEN>.
```ballerina
einstein:ClientConfig clientConfig = {
    auth : {
        token: `<ACCESS_TOKEN>`
    }
};

einstein:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to list datasets using the connector. 

    ```ballerina
    public function main() {
        einstein:DatasetList|error result = baseClient->listDatasets();
        if (result is einstein:DatasetList) {
            log:printInfo(result.toString());
        } else {
            log:printInfo(result.toString());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
