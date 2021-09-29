## Overview
This is a generated connector for [IRIS Residuals API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
Populate your data warehouse programmatically through this Residuals API and interact with your monthly residuals income calculations, line items, and user compensation data.
Line items give you control with the ability to add income or expense calculations that are outside of any residual reports.
Receive instant notifications when new residual reports are published or when line items are added.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS Residuals connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.residuals` module into the Ballerina project.
```ballerina
import ballerinax/iris.residuals;
```

### Step 2: Create a new connector instance
Create a `residuals:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
residuals:ApiKeysConfig config = {
    xApiKey: "<API_KEY>"
}
residuals:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get residuals templates using the connector.

    Get residuals templates

    ```ballerina
    public function main() returns error? {
        residuals:InlineResponse20014 response = check baseClient->getResidualsTemplates();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
