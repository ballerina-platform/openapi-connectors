## Overview
This is a generated connector from [Azure OpenAI Deployments API](https://learn.microsoft.com/en-us/rest/api/cognitiveservices/azureopenaistable/deployments/) OpenAPI specification.

The Azure OpenAI Deployments REST API endpoints will deploy OpenAI models in Azure OpenAI resource. 

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account.
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource).
- Obtain the tokens. Refer to [Azure OpenAI Authentication](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide to learn how to generate and use tokens.

## Quickstart
To use the Azure OpenAI Deployment connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.deployment` module into the Ballerina project.

```ballerina
import ballerinax/azure.deployment;
```

### Step 2: Create a new connector instance
Create and initialize a `deployment:Client` with the obtained `apiKey` and a `serviceUrl` from the azure OpenAI resource

```ballerina
final deployment:Client deploymentClient = check new (
    apiKeyConfig = {auth: {apiKey: apiKey}},
    serviceUrl = serviceUrl
);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector.

>**Note:** that they are in the form of remote operations.

Following is an example on deploying `text-davinci-002` model:

```ballerina
model_deployment:Deployment deploymentPayload = {
    model: "text-davinci-002",
    scale_settings: {
        scale_type: "standard"
    }
};

model_deployment:Deployment modelDeployRes = check deploymentClient->/deployments.post("2022-12-01", deploymentPayload);
```

2. Use `bal run` command to compile and run the Ballerina program.
