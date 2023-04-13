## Overview
This is a generated connector for the `Index Operations` under [Pinecone Vector Database API](https://docs.pinecone.io/reference) OpenAPI specification. Pinecone is a fully managed vector database, which allows storing data objects and vector embeddings from the ML models, including the LLMs offered by [OpenAI](https://openai.com/), [Hugging Face](https://huggingface.co/), and [Cohere](https://cohere.ai/). The Pinecone vector database makes it easy to build developer-friendly, easily scalable, and high-performance vector search applications without infrastructure hassles.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

1. Sign up and log in to [Pinecone](https://www.pinecone.io/).
2. Create a new project and specify an environment.
3. Click on `API Keys` and create an API key.

## Quick start
To use the Pinecone.index connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/pinecone.index` module into the Ballerina project.
```ballerina
import ballerinax/pinecone.index;
```

### Step 2: Create a new connector instance
Create and initialize a `index:Client` with your `Service URL` and the obtained `Authentication key`.
```ballerina
    index:Client pineconeIndexClient = check new ({
        apiKey: "XXXXX"
    }, serviceUrl="https://controller.<environment>.pinecone.io");
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. You can list indexes in your proect as follows.
    ```ballerina
    index:IndexesList indexesList = check pineconeIndexClient->/databases.get();
    ```
2. Use the `bal run` command to compile and run the Ballerina program.
