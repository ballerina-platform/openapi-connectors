## Overview
This is a generated connector for [Recurly API V3](https://developers.recurly.com/api/v2021-02-25/index.html) OpenAPI specification.
Recurly is a subscription management platform delivering a competitive advantage for leading brands worldwide. 
Trusted by Sling TV, BarkBox, Asana, and thousands more to drive recurring revenue.
Onboard and manage customers through Recurly API.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Recurly](https://recurly.com) account
* Obtain tokens by following [this guide](https://developers.recurly.com/api/v2021-02-25/index.html#section/Authentication)
 
## Quickstart

To use the atSpoke connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/recurly` module into the Ballerina project.
```ballerina
import ballerinax/recurly;
```

### Step 2: Create a new connector instance
Create a `recurly:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
recurly:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
recurly:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list a site's accounts using the connector.

    List a site's accounts

    ```ballerina
    public function main() returns error? {
        recurly:AccountList response = check baseClient->listAccounts();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
