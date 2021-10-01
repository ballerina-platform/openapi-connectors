## Overview
This is a generated connector for [Who Hosts This API v0.0.1](https://www.who-hosts-this.com/Documentation) OpenAPI specification.
The Who Hosts This API provides services to get discover the hosting provider for any web site.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Who Hosts This Account](https://www.who-hosts-this.com/Profile?cmd=RegisterForm). 
2. Obtain tokens - Follow [this link](https://www.who-hosts-this.com/APIKey).

## Quickstart

To use the Who Hosts This connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/whohoststhis` module into the Ballerina project.
```ballerina
import ballerinax/whohoststhis;
```

### Step 2: Create a new connector instance

```ballerina
whohoststhis:ApiKeysConfig apiKeyConfig = {
    key: "<API_KEY>"
};
whohoststhis:Client baseClient = check new Client(apiKeyConfig, serviceUrl = "https://www.who-hosts-this.com/APIEndpoint");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example to discover the hosting provider for a web site.

    ```ballerina
    public function main() returns error? {
        json listHostingProvider = check baseClient->discoverHostingProvider("www.wso2.com");
        log:printInfo(listHostingProvider.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
