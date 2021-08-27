## Overview
This is a generated connector for [Kinto API v1.22](https://docs.kinto-storage.org/en/stable/api/index.html) OpenAPI specification. 

The Kinto API provides the capability to store and retrieve JSON data.

## Quickstart
To use the Kinto connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
Import the ballerinax/kinto module into the Ballerina project.
```ballerina
import ballerinax/kinto;
```

### Step 2: Create a new connector instance
```ballerina
kinto:Client kintoClient = check new();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.  
Following is an example on how to get buckets using the connector.

    ```ballerina
    public function main() returns error? {
        Schema entity = check kintoClient->getBuckets();
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.