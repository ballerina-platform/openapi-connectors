## Overview
This is a generated connector for [SupportBee API v1](https://supportbee.com/api) OpenAPI specification.
SupportBee’s support ticket system enables teams to organize, prioritize and collaborate on customer support emails. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [SupportBee](https://supportbee.com) account
* Obtain tokens by following [this guide](https://supportbee.com/api#authentication)
 
## Quickstart

To use the SupportBee connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/supportbee` module into the Ballerina project.
```ballerina
import ballerinax/supportbee;
```

### Step 2: Create a new connector instance
Create a `supportbee:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
supportbee:ApiKeysConfig config = {
    authToken: "<API_KEY>"
}
supportbee:Client baseClient = check new Client(config, serviceUrl = "https://{company}.supportbee.com");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to create a ticket for the company using the connector.

    Creates a ticket for the company

    ```ballerina
    public function main() returns error? {
        supportbee:CreateTicketRequest requestData = {
            ticket: {
                subject: "Subject",
                requester_name: "John Doe",
                requester_email: "john@example.com",
                cc: [
                    "Test1 <test1@example.com>",
                    "Test2 <test2@example.com>"
                ],
                bcc: [
                    "Test3 <test3@example.com>",
                    "Test4 <test4@example.com>"
                ],
                content: {
                    text: "Creating a ticket",
                    html: "<p>Creating a ticket</p>"
                }
            }
        };
        supportbee:CreatedTicket response = check baseClient->createTicket(requestData);
        log:printInfo(response.toJsonString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
