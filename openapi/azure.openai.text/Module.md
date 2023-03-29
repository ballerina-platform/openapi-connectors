## Overview
This is a generated connector from [Azure OpenAI Completions API v2023-03-15-preview](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#completions/) OpenAPI specification.

The Azure Azure OpenAI Service REST API Completions Endpoint will generate one or more predicted completions based on a provided prompt. The service can also return the probabilities of alternative tokens at each position.

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure OpenAI resource with a model deployed](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource)
- Obtain tokens
    - Use [this](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide to learn how to generate and use tokens

## Quickstart

To use the Azure OpenAI Text connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.text` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.text;
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
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on text completion using an OpenAI text-davinci-002 model:

    Generate text with Davinci

    Sample

    ```ballerina
    public function main() returns error? {

    final text:Client textClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );

    text:Deploymentid_completions_body completionsBody = {
        prompt: ""What is Ballerina?",
    };

    text:Inline_response_200|error unionResult = check textClient->/deployments/["davinci"]/completions.post("2023-03-15-preview", completionsBody);

    if (unionResult is text:Inline_response_200) {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.