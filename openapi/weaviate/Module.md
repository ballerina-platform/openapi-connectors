
## Overview

This is a generated connector for the [Weaviate Vector Search Engine API](https://weaviate.io/developers/weaviate/api) OpenAPI specification. Weaviate is an open-source vector search engine that allows storing data objects and vector embeddings from the ML models including the LLMs offered by [OpenAI](https://openai.com/), [Hugging Face](https://huggingface.co/), and [Cohere](https://cohere.ai/). Weaviate provides a powerful GraphQL API for querying the embeddings, while looking at the similarity and can scale seamlessly into billions of data objects.


## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a Cluster using [Weaviate Cloud Service](https://weaviate.io/developers/weaviate/quickstart/installation#weaviate-cloud-services) or deploy using [Docker/Kubernetes](https://weaviate.io/developers/weaviate/quickstart/installation#running-weaviate-with-docker)
* Obtain the [OIDC Authentication key](https://weaviate.io/developers/weaviate/configuration/authentication).

## Quick start

To use the Weaviate connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/weaviate` module into the Ballerina project.

```ballerina
import ballerinax/weaviate;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize an `weaviate:Client` with the obtained `Authentication key`.
```ballerina
    weaviate:Client weaviateClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    }, serviceURL: "https://weaviate-server:port/v1");
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. 

>**Note:** that they are in the form of remote operations.


Following is an example on inserting new objects to the Weaviate vector storage as a batch operation:


```ballerina
string className = "DocClass"; // weaviate class name
string[] text; // list of text
float[][] embeddings; // list of embbedings for the texts
int len = text.length();

// creates the batch of weaviate objects
weaviate:Object[] objArr = [];
foreach int i in 0...len {
    objArr.push(
        {
            'class: className,
            vector: embeddings[i],
            properties: {
                "docs": text[i]
            }
        });
}

weaviate:ObjectsGetResponse[] responseArray =  check weaviateClient->/batch/objects.post({
    objects : objArr
});
```


Once the new records are inserted, we can query the Weaviate vector storage using the [Weaviate GraphQL API](https://weaviate.io/developers/weaviate/api/graphql) similar to the below example:


```ballerina
// this is the embedding for the text being searched for similar content
float[] embeddings; 

string graphQLQuery =  string`{
                            Get {
                                DocStore (
                                nearVector: {
                                    vector: ${embeddings.toString()}
                                    }
                                    limit: 5
                                ){
                                docs
                                _additional {
                                    certainty,
                                    id
                                    }
                                }
                            }
                        }`;

weaviate:GraphQLResponse|error results = check weaviateClient->/graphql.post({
    query: graphQLQuery
});
``` 

2. Use `bal run` command to compile and run the Ballerina program.

## Samples

 - [Insert a batch of data to the Weaviate Vector Search Engine](https://github.com/nadheesh/ballerina-weaviate-client/blob/main/samples/batch-insert/main.bal)
 - [Search for similar documents/vectors using the Weaviate GraphQL API](https://github.com/nadheesh/ballerina-weaviate-client/blob/main/samples/search-similar/main.bal)

