## Overview
This is a generated connector for [IRIS Dispute responder API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
IRIS CRM's revolutionary new Dispute Responder offers complete, end-to-end dispute management, including instant online notification of new disputes, electronic response submission, and complete record management for Fiserv merchants, all from right within IRIS CRM.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [IRIS CRM](https://www.iriscrm.com) account
* Obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token)
 
## Quickstart

To use the IRIS Dispute Responder connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/iris.disputeresponder` module into the Ballerina project.
```ballerina
import ballerinax/iris.disputeresponder;
```

### Step 2: Create a new connector instance
Create a `disputeresponder:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
disputeresponder:ApiKeysConfig config = {
    xApiKey: "<API_KEY>"
}
disputeresponder:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to reply to dispute chargeback case using the connector.

    Reply to dispute chargeback case

    ```ballerina
    public function main() returns error? {
        disputeresponder:ChargebackReplyDisputeRequest payload = {
            selected_doc_types: <selected_doc_types>
        };
        disputeresponder:InlineResponse2006 response = check baseClient->disputeChargeback(<merchantNumber>, <caseNumber>, <payload>);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
