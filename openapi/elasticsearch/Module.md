## Overview
This is a generated connector for [Elasticsearch](https://cloud.elastic.co/api/v1/api-docs/spec.json) OpenAPI specification. 

Elasticsearch API allows you to store, search, and analyze data with ease at scale.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Elasticsearch Account](https://cloud.elastic.co/registration).
* Obtain tokens by following [this guide](https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api.html#security-token-apis).

## Quickstart

To use the Elasticsearch in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/elasticsearch` module into the Ballerina project.
```ballerina
import ballerinax/elasticsearch;
```

### Step 2: Create a new connector instance
Create a `elasticsearch:ApiKeysConfig` with the `authorization` key obtained, and initialize the connector with it.
```ballerina
elasticsearch:ApiKeysConfig apiKeysConfig = {
    authorization : "<AUTHORIZATION_TOKEN>"
};
elasticsearch:Client baseClient = check new (apiKeysConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to obtain information about existing Elastic Stack versions, using the connector.

    Get Elastic Stack versions.

    ```ballerina
    public function main() returns error? {
        elasticsearch:StackVersionConfigs response = check baseClient->getVersionStacks();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.