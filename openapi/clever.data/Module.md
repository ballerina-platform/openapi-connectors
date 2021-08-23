## Overview
This is a generated connector for [Clever Data API v1.2](https://dev.clever.com/v1.2/docs/secure-sync) OpenAPI specification. 

Clever Data API provides the capability to retrieve information from Clever.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create a [Clever account](https://clever.com/signup)
- Obtain tokens - Follow this [guide](https://dev.clever.com/v1.2/docs/getting-started)
 
## Quickstart
To use the Clever Data connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/clever.data` module into the Ballerina project.
```ballerina
import ballerinax/clever.data;
```

### Step 2: Create a new connector instance
Create a `data:ClientConfig` with the tokens obtained, and initialize the connector with it.

```ballerina
data:ClientConfig configuration = {
    auth: {
        token : "<TOKEN>"
    }
};

data:Client cleverClient = check new (configuration);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.   
Following is an example on how to get contacts using the connector.
    ```ballerina
    public function main() returns error? {
        data:StudentContactsResponse response = check cleverClient->getContacts();
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.