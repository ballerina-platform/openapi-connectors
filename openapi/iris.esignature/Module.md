## Overview
This is a generated connector for [IRIS E-Signature API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
Connect with the E-Signature API to create workflows that send specific documents for e-signature documents.
Create field mappings between Lead fields to populate their respective PDF documents.
Receive notifications when documents are generated, opened, and signed by recipients.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS E-Signature connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.esignature` module into the Ballerina project.
```ballerina
import ballerinax/iris.esignature;
```

### Step 2: Create a new connector instance
Create a `esignature:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
esignature:ApiKeysConfig config = {
    apiKeys: {
        X-API-KEY: "<API_KEY>"
    }
}
subscriptions:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a list of all lead e-signatures documents using the connector.

    Get a list of all lead e-signatures documents

    ```ballerina
    public function main() returns error? {
        esignature:InlineResponse20039 response = check baseClient->getAllLeadEsignaturesDocuments(<LEAD_ID>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
