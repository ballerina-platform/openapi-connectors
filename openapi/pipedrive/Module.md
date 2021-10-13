## Overview
This is a generated connector for [Pipedrive API v1](https://developers.pipedrive.com/docs/api/v1) OpenAPI specification.
Pipedrive is a sales CRM and pipeline management solution that enables businesses to plan their sales activities and monitor deals. 
Built using activity-based selling methodology, Pipedrive streamlines every action involved in converting a potential deal into a successful sale.

### Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Pipedrive](https://www.pipedrive.com) developer account
* Obtain tokens by following [this guide](https://pipedrive.readme.io/docs/core-api-concepts-authentication)
 
## Quickstart

To use the Pipedrive connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/pipedrive` module into the Ballerina project.
```ballerina
import ballerinax/pipedrive;
```

### Step 2: Create a new connector instance
Create a `pipedrive:ApiKeysConfig` with the API key obtained, and initialize the connector with it. 
```ballerina
pipedrive:ApiKeysConfig config = {
    apiToken: "<API_KEY>"
}
pipedrive:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all Activities assigned to a particular user using the connector. 

    Returns all Activities assigned to a particular User

    ```ballerina
    public function main() {
        pipedrive:GetActivitiesResponse200|error response = baseClient->getActivities();
        if (response is pipedrive:GetActivitiesResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program. 
