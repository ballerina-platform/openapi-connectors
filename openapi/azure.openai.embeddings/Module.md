## Overview

The `azure.openai.embeddings` module is a direct, fully-typed REST connector for the [Azure OpenAI Embeddings API](https://learn.microsoft.com/en-us/azure/ai-services/openai/reference#embeddings) (`POST /deployments/{id}/embeddings`). Use it as a standalone client to turn text into embedding vectors on Azure-hosted models for semantic search and RAG — for the `ballerina/ai` agent framework use `ai.azure`'s `EmbeddingProvider`.

### Key Features

- Programmatic access to create and manage resources via REST API
- Send and publish data through the API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource)
- Deploy an appropriate model within the resource by referring to [Deploy a model](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal#deploy-a-model) guide
- Obtain tokens by following [Azure OpenAI Authentication](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide

## Quickstart

To use the Azure OpenAI Embeddings connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.embeddings` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.embeddings;
import ballerina/io;
```

### Step 2: Create a new connector instance

Create and initialize an `embeddings:Client` with the obtained `apiKey` and a `serviceUrl` containing the deployed models.

```ballerina
    final embeddings:Client embeddingsClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector.

    >**Note:** These operations are in the form of remote operations.

    Following is an example on obtaining embeddings from a GPT-3 ada model:

    ```ballerina
    public function main() returns error? {

        final embeddings:Client embeddingsClient = check new (
            config = {auth: {apiKey: apiKey}},
            serviceUrl = serviceUrl
        );

        embeddings:Deploymentid_embeddings_body embeddingsBody = {
            input: "I have bought several of Vitality canned"
        };

        embeddings:Inline_response_200 embeddingsResult = check embeddingsClient->/deployments/["embedding"]/embeddings.post("2023-03-15-preview", embeddingsBody);

        io:println(embeddingsResult);
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.
