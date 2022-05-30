## Overview
This is a generated connector for [SugarCRM REST API v12.0](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_12.0/Integration/Web_Services/REST_API/) OpenAPI Specification.
SugarCRM REST API provides capabilities to effectively manage the customer lifecycle with a set of modules that support each stage of the funnel. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [SugarCRM](https://www.sugarcrm.com/au/?utm_source=google.com&utm_medium=organic) account
* Obtain tokens by following [this guide](https://support.sugarcrm.com/Documentation/Sugar_Developer/Sugar_Developer_Guide_12.0/Integration/Web_Services/REST_API/#Authentication)
 
## Quickstart

To use the SugarCRM connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/sugarcrm` module into the Ballerina project.
```ballerina
import ballerinax/sugarcrm;
```

### Step 2: Create a new connector instance
Create a `sugarcrm:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
sugarcrm:ClientConfig config = {
    auth: {
        tokenUrl: "<TOKEN_URL>"
        username: "<USERNAME>"
        password: "<PASSWORD>"
        clientId: "<CLIENT_ID>"
        clientSecret: "<CLIENT_SECRET>"
    }
}
sugarcrm:Client sugarCrmClient = check new Client(config, serviceUrl = "https://<site_url>/rest/v{version}/");
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list set of records filtered by an expression using the connector.

    Creates a ticket for the company

    ```ballerina
    public function main() returns error? {
        string module = "Account";
        string[] filter = [{"id":"1"}];
        FilteredRecordDetails records = check sugarCrmClient -> listRecords(module, filter);
        io:println(records);
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
