## Overview

The `openai.embeddings` module is a direct, fully-typed REST connector for OpenAI's [Embeddings API](https://platform.openai.com/docs/api-reference/embeddings) (`POST /embeddings`). Use it as a standalone client to turn text into embedding vectors for semantic search, clustering, and RAG — independent of the `ballerina/ai` agent framework, for which use `ai.openai`'s `EmbeddingProvider`.

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_embeddings
cd openai_embeddings
```

### Step 2: Invoke the embeddings API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.embeddings;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main() returns error? {
    // Create an OpenAI embeddings client.
    embeddings:Client embeddingsClient = check new ({
        auth: {token: openAIKey}
    });

    embeddings:CreateEmbeddingRequest request = {
        model: "text-embedding-ada-002",
        input: "The food was delicious and the waiter..."
    };

    embeddings:CreateEmbeddingResponse response = 
        check embeddingsClient->/embeddings.post(request);
    io:println(response);
}
```

### Step 3: Set up your OpenAI API Key
Create a file called `Config.toml` at the root of the package directory and copy for the following content.
```toml
# OpenAI API Key
openAIKey="..."
```

### Step 4: Run the program
Use the `bal run` command to compile and run the Ballerina program.
