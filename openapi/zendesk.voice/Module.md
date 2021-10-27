## Overview
This is a generated connector for [Zendesk Talk API v2](https://developer.zendesk.com/api-reference/) OpenAPI specification.
Zendesk Voice provides capability to work with talk agents, groups, and tickets.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Zendesk account](https://www.zendesk.com/). 
2. Obtain tokens - Follow [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).

## Quickstart

To use the Zendesk Voice connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/zendesk.voice` module into the Ballerina project.
```ballerina
import ballerinax/zendesk.voice as zenvoice;
```

### Step 2: Create a new connector instance
Create a `zenvoice:ClientConfig` with the username and password obtained, then initialize the connector with it and the service URL (Zendesk Support URL) according to the [Zendesk Support documentation](https://developer.zendesk.com/api-reference/ticketing/introduction/).
```ballerina
zenvoice:ClientConfig clientConfig = {
    auth: {
        username: <ZENDESK_EMAIL>,
        password: <ZENDESK_PASSWORD>
    }
};
zenvoice:Client baseClient = check new Client(clientConfig, serviceUrl = "<https://{YOUR_SUBDOMAIN}.zendesk.comL>");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list the phone numbers.

    ```ballerina
    public function main() returns error? {
        zenvoice:PhoneNumbers phoneNumbers = check baseClient->listPhoneNumbers();
        log:printInfo(phoneNumbers.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
