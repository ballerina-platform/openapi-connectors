## Overview
This [Ballerina](https://ballerina.io) connector, which is actively maintained by a dedicated community, provides streamlined access to the [OpenAI Embeddings API](https://platform.openai.com/docs/api-reference/embeddings). It offers an interface to extract embeddings from a diverse range of AI models recently devised by OpenAI. This connector is a crucial tool for developers intending to utilize the cutting-edge artificial intelligence capabilities of these models in various computational tasks.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.embeddings/latest)

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
