## Overview
This is a generated connector for [IRIS Leads API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
Connect with the Leads API to interact with your lead data.  
Includes management of fields, user assignments, status changes, tasks, appointments, email, text messaging, and document attachments.
Create custom reports without limits using the data already housed within your CRM.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS Leads connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.lead` module into the Ballerina project.
```ballerina
import ballerinax/iris.lead;
```

### Step 2: Create a new connector instance
Create a `lead:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
lead:ApiKeysConfig config = {
    xApiKey: "<API_KEY>"
}
lead:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of leads using the connector.

    Get a list of leads

    ```ballerina
    public function main() returns error? {
        lead:InlineResponse20016 response = check baseClient->getLeads();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
