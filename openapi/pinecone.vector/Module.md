## Overview
This is a generated connector for the `Vector Operations` under [Pinecone Vector Database API](https://docs.pinecone.io/reference) OpenAPI specification. Pinecone is a fully managed vector database, which allows storing data objects and vector embeddings from the ML models, including the LLMs offered by [OpenAI](https://openai.com/), [Hugging Face](https://huggingface.co/), and [Cohere](https://cohere.ai/). The Pinecone vector database makes it easy to build developer-friendly, easily scalable, and high-performance vector search applications without infrastructure hassles.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

1. Sign up and log in to [Pinecone](https://www.pinecone.io/).
2. Create a new project and specify an environment.
3. Click on `API Keys` and create an API key.

## Quick start
To use the Pinecone.vector connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/pinecone.vector` module into the Ballerina project.
```ballerina
import ballerinax/pinecone.vector;
```

### Step 2: Create a new connector instance
Create and initialize a `vector:Client` with your `Service URL` and the obtained `Authentication key`.
```ballerina
    vector:Client pineconeVectorClient = check new ({
        apiKey: "XXXXX"
    }, serviceUrl = "https://<index_name>-<project_name>.svc.<environment>.pinecone.io");
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. You can describe the statistics of your index as follows.
    ```ballerina
    vector:DescribeIndexStatsResponse indexStats = check pineconeVectorClient->/describe_index_stats.post({});
    ```
2. Use the `bal run` command to compile and run the Ballerina program.
