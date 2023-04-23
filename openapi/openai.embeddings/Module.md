## Overview

This is a generated connector for the [OpenAI Embeddings API](https://beta.openai.com/docs/api-reference/embeddings) OpenAPI specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Embeddings API provides a way to access embeddings from new AI models developed by OpenAI for a variety of tasks.

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