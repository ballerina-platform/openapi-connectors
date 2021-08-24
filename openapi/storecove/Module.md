## Overview
This is a generated connector for [Storecove API v2](https://app.storecove.com/docs) OpenAPI specification. 

Storecove API provides the capability to perform e-invoice management operations.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Storecove account](https://www.storecove.com/us/en/companies)
- Obtain tokens - Follow [this guide](https://app.storecove.com/docs#_getting_started)
 
## Quickstart
To use the Storecove connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/storecove module into the Ballerina project.
```ballerina
import ballerinax/storecove;
```

### Step 2: Create a new connector instance
Create client using connection configuration.
Create a `storecove:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 

```ballerina
storecove:ClientConfig configuration = {
    auth: {
        token : "<API_KEY>"
    }
};

storecove:Client storecoveClient = check new (configuration);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.  
Following is an example on how to get legal entity using the connector.
    ```ballerina
    public function main() returns error? {
        storecove:LegalEntity entity = check storecoveClient->getLegalEntity(123);
    }
    ```
2. Use `bal run` command to compile and run the Ballerina program.
