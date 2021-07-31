## Overview
HubSpot is a powerful easy to use Contact Mangement(CRM), email marketing, live chat, forms and analytics platform. Its 

Ballerina connector for HubSpot CRM allows easy integration with HubSpot REST API via Ballerina language. 

This module supports HubSpot REST API `v3` version.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a HubSpot developer account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>
* Configure the connector with obtained tokens

## Quickstart
To use the HubSpot CRM Pipelines connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import HubSpot CRM Pipeline module
First, import the ballerinax/hubspot.crm.pipeline module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.pipeline;
```

### Step 2: Configure the connection credentials
You can now make the connection configuration using the access token.
```ballerina
pipeline:ClientConfig clientConfig = {
    authConfig : {
        token: <ACCESS_TOKEN>
    }
};

pipeline:Client baseClient = check new Client(clientConfig);

```

### Step 3: Create a pipeline instance

```ballerina
pipeline:PipelineInput event = {
    stages: [
        {
            label: "In progress",
            displayOrder: 0,
            metadata: {
                "ticketState": "OPEN",
                "probability": 0.5
            }
        }
    ],
    label: "My replaced pipeline",
    displayOrder: 0
};

pipeline:PipelineInput|error bEvent = baseClient->create("deals", event);

if (bEvent is pipeline:PipelineInput) {
    log:printInfo("Created the pipeline" + bEvent.toString());
} else {
    log:printError(msg = bEvent.toString());
}
```

### Step 4: List companies

```ballerina
pipeline:CollectionResponsePipeline|error bEvent = baseClient->getAll("deals");

if (bEvent is pipeline:CollectionResponsePipeline) {
    log:printInfo("Pipeline list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```