## Overview
This is a generated connector from [Azure OpenAI Completions API](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#completions/) OpenAPI specification.

The Azure  OpenAI Service REST API Completions Endpoint will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position.

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource)
- Deploy an appropriate model within the resource by referring to [Deploy a model](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal#deploy-a-model) guide
- Obtain tokens by following [Azure OpenAI Authentication](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide

## Quickstart

To use the Azure OpenAI Text connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.text` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.text;
import ballerina/io;
```

### Step 2: Create a new connector instance

Create and initialize a `text:Client` with the obtained `apiKey` and a `serviceUrl` containing the deployed models.

```ballerina
    final text:Client textClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. 

    >**Note:** These operations are in the form of remote operations.

    Following is an example on text completion using an OpenAI `text-davinci-002` model:

    ```ballerina
    public function main() returns error? {

    final text:Client textClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );

    text:Deploymentid_completions_body completionsBody = {
        prompt: "What is Ballerina?",
    };

    text:Inline_response_200 completionsResult = check textClient->/deployments/["davinci"]/completions.post("2023-03-15-preview", completionsBody);

    io:println(completionsResult);
    ```

2. Use `bal run` command to compile and run the Ballerina program.