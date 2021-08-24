## Overview
This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 

This API provides access to pipelines. Pipelines represent distinct stages in a workflow, like closing a deal or servicing a support ticket. These endpoints provide access to read and modify pipelines in HubSpot. They support `deals` and `tickets` object types.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create a [HubSpot developer](https://developers.hubspot.com/) account
* Obtain tokens
    - Use [this](https://developers.hubspot.com/docs/api/working-with-oauth4) guide to obtain the credentials which are needed to create the <CLIENT_ID> and <CLIENT_SECRET>

## Quickstart
To use the HubSpot CRM Pipelines connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/hubspot.crm.pipeline module into the Ballerina project.
```ballerina
import ballerinax/hubspot.crm.pipeline;
```

### Step 2 - Create a new connector instance
You can now make the connection configuration using the access token.
```ballerina
pipeline:ClientConfig clientConfig = {
    auth : {
        token: <ACCESS_TOKEN>
    }
};

pipeline:Client baseClient = check new Client(clientConfig);

```

### Step 3 - Invoke connector operation
1. Create a pipeline instance

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

2. List pipelines

```ballerina
pipeline:CollectionResponsePipeline|error bEvent = baseClient->getAll("deals");

if (bEvent is pipeline:CollectionResponsePipeline) {
    log:printInfo("Pipeline list" + bEvent.toString());
} else {
    log:printError(msg = bEvent.message());
}
```

3. Use `bal run` command to compile and run the Ballerina program
