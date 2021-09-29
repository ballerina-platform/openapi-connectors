## Overview
This is a generated connector for [Zendesk Support API v2](https://developer.zendesk.com/api-reference/) OpenAPI specification.
Zendesk Support is a simple system for tracking, prioritizing and solving customer support tickets.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Zendesk account](https://www.zendesk.com/). 
2. Obtain tokens - Follow [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).

## Quickstart

To use the Zendesk Support connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/zendesk.support` module into the Ballerina project.
```ballerina
import ballerinax/zendesk.support as zensupport;
```

### Step 2: Create a new connector instance
Create a `zensupport:ClientConfig` with the username and password obtained, then initialize the connector with it and the service URL (Zendesk Support URL) according to the [Zendesk Support documentation](https://developer.zendesk.com/api-reference/ticketing/introduction/).
```ballerina
zensupport:ClientConfig clientConfig = {
    auth: {
        username: <ZENDESK_EMAIL>,
        password: <ZENDESK_PASSWORD>
    }
};
zensupport:Client baseClient = check new Client(clientConfig, serviceUrl = "<https://{YOUR_SUBDOMAIN}.zendesk.comL>");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to create a user using the connector.

    ```ballerina
    public function main() returns error? {
        zensupport:CreateUserInfo user = { 
                                user:{
                                    name: "Roger Wilco",
                                    email: "roger@gmail.com",
                                    organization: { name: "Rogers Organization" },
                                    role: "agent"
                                } 
                            };
        zensupport:User userResult = check baseClient->createUser(user);
        log:printInfo(userResult.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
