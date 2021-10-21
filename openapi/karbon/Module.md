## Overview
This is a generated connector for [Karbon API v3.0](https://developers.karbonhq.com/api) OpenAPI specification.
Leverage the Karbon API to integrate your apps with Karbon, build custom solutions, optimize workflows and power your business.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Karbon](https://developers.karbonhq.com) account
* Obtain tokens by following [this guide](https://help.karbonhq.com/en/articles/4324748-how-do-i-find-my-karbon-api-access-key)
 
## Quickstart

To use the Karbon connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/karbon` module into the Ballerina project.
```ballerina
import ballerinax/karbon;
```

### Step 2: Create a new connector instance
Create a `karbon:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
karbon:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
karbon:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve a list of Karbon users using the connector.

    Retrieve a list of Karbon users

    ```ballerina
    public function main() returns error? {
        karbon:KarbonApiTenantUserdto[] response = check baseClient->getUsers(<AccessKey>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
