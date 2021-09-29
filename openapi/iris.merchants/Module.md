## Overview
This is a generated connector for [IRIS Merchants API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
Populate your data warehouse programmatically through this Merchants API and interact with your merchant services portfolio.  
Data points include merchant demographics, deposits, transactions, retrievals, chargebacks, and statements across supported processors.
Each merchant account is accessible by users through a set of permissions controlled on the User Class level.
Segment your portfolio of merchants by filters such as processor, data source, and processing status.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS Merchants connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.merchants` module into the Ballerina project.
```ballerina
import ballerinax/iris.merchants;
```

### Step 2: Create a new connector instance
Create a `merchants:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
merchants:ApiKeysConfig config = {
    xApiKey: "<API_KEY>"
}
merchants:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of merchants using the connector.

    Get a list of merchants

    ```ballerina
    public function main() returns error? {
        merchants:InlineResponse200 response = check baseClient->getMerchants();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
