## Overview
This is a generated connector for [Disqus API v3](https://disqus.com/api/docs) OpenAPI specification.
Disqus is a service for web comments and discussions. 
Disqus makes commenting easier and more interactive, helping publishers power online discussions.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Disqus](https://disqus.com) account
* Obtain tokens by following [this guide](https://help.disqus.com/en/articles/1717212-using-the-api)
 
## Quickstart

To use the SupportBee connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/disqus` module into the Ballerina project.
```ballerina
import ballerinax/disqus;
```

### Step 2: Create a new connector instance
Create a `disqus:ApiKeysConfig` with the Access token, API key & API secret obtained, and initialize the connector with it.
```ballerina
disqus:ApiKeysConfig config = {
    accessToken: "<ACCESS_TOKEN>",
    apiKey: "<API_KEY>",
    apiSecret: "<API_SECRET>"
}
disqus:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of categories within a forum using the connector.

    Returns a list of categories within a forum.

    ```ballerina
    public function main() returns error? {
        disqus:Categories response = check baseClient->listCategories("forum");
        log:printInfo(response.toJsonString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
