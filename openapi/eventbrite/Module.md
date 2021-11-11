## Overview
This is a generated connector for [Eventbrite API v3](https://www.eventbrite.com/platform/api) OpenAPI specification.
Eventbrite is an Event Management System with an API which allows creating and managing events including venue management, marketing, selling tickets, and financial management.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Eventbrite](https://www.eventbrite.com/platform) account
* Obtain tokens by following [this guide](https://www.eventbrite.com/platform/api#/introduction/authentication)
 
## Quickstart

To use the Eventbrite connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/eventbrite` module into the Ballerina project.
```ballerina
import ballerinax/eventbrite;
```

### Step 2: Create a new connector instance
Create a `eventbrite:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
eventbrite:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
eventbrite:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list events by organization ID using the connector.

    List Events by Organization ID.

    ```ballerina
    public function main() returns error? {
        eventbrite:EventsByOrganization response = check baseClient->listEventsByOrganization(<organizationId>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
