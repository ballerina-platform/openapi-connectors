## Overview
This is a generated connector for [Keap API v1.70.0.453309-hf-202203291431](https://developer.infusionsoft.com/docs/rest/) OpenAPI specification.
Keap is an all-in-one CRM, sales and marketing automation software that helps organize leads, land the job, get paid, and keep growing.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Keap](https://developer.keap.com) account
* Obtain tokens by following [this guide](https://developer.infusionsoft.com/developer-guide)
 
## Quickstart

To use the Keap connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/keap` module into the Ballerina project.
```ballerina
import ballerinax/keap;
```

### Step 2: Create a new connector instance
Create a `keap:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
keap:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
keap:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list opportunities, using the connector.

    Gets a list of opportunities.

    ```ballerina
    public function main() returns error? {
        keap:OpportunityList response = check baseClient->listOpportunities();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
