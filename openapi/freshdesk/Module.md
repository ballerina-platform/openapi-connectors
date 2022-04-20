## Overview
This is a generated connector for [Freshdesk API v2.0](https://developers.freshdesk.com/api/#intro) OpenAPI specification.
Freshdesk is a cloud-based customer service software that enables businesses of all sizes to deliver stellar customer support for requests coming in via email, web, phone, chat, and social into tickets, and unifies ticket resolution across channels.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
1. Create an [Freshdesk account](https://freshdesk.com/signup). 
2. Obtain tokens - Follow [this guide](https://developers.freshdesk.com/api/#getting-started).

## Quickstart
To use the Freshdesk connector in your Ballerina application, update the .bal file as follows

### Step 1: Import connector
First, import the `ballerinax/freshdesk` module into the Ballerina project.
```ballerina
import ballerinax/freshdesk;
```

### Step 2: Create a new connector instance
Create a `freshdesk:ClientConfig` with the api key as username in basic authentication password you can provide any, and initialize the connector with it.
```ballerina
configurable http:CredentialsConfig & readonly authConfig = ?;
freshdesk:ClientConfig clientConfig = {auth : authConfig};
freshdesk:Client baseClient = check new (clientConfig, 
                                serviceUrl = "https://<account_identifier>.freshdesk.com");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get the create a ticket.

    ```ballerina
    public function main() returns error? {
        freshdesk:TicketPayload payload = {
                     description: "Details about",
                     subject: "Support Needed...",
                     email: "tom@outerspace.com",
                     priority: 1,
                     status: 2,
                     cc_emails: ["ram@freshdesk.com"]
                 };
        freshdesk:Ticket creationResult = check baseClient->addTicket(payload);
        log:printInfo(creationResult.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
