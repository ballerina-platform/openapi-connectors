## Overview

The `openai.embeddings` module is a direct, fully-typed REST connector for OpenAI's [Embeddings API](https://platform.openai.com/docs/api-reference/embeddings) (`POST /embeddings`). Use it as a standalone client to turn text into embedding vectors for semantic search, clustering, and RAG — independent of the `ballerina/ai` agent framework, for which use `ai.openai`'s `EmbeddingProvider`.

### Key Features

- Programmatic access to create and manage resources via REST API
- Send and publish data through the API
- Manage user accounts and profiles
- Secure authentication with API key or OAuth support

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Embeddings connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.embeddings` module into the Ballerina project.
```ballerina
import ballerinax/openai.embeddings;
```

### Step 2: Create a new connector instance
Create and initialize an `embeddings:Client` with the obtained `apiKey`.
```ballerina
embeddings:Client embeddingsClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. Following is an example on obtaining embeddings from GPT-3 ada model.
    ```ballerina
    public function main() returns error? {
        embeddings:CreateEmbeddingRequest req = {
            model: "text-embedding-ada-002",
            input: "I have bought several of the Vitality canned"
        };
        embeddings:CreateEmbeddingResponse res = check embeddingsClient->/embeddings.post(req);
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.
