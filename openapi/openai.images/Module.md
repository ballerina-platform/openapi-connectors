
## Overview

This is a generated connector for the [OpenAI Images API](https://beta.openai.com/docs/api-reference/images) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Images API provides a way to access new DALL.E models developed by OpenAI for a variety of image-related tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Images connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.images` module (along with the other required imports) as given below.

```ballerina
import ballerinax/openai.images;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize an `images:Client` with the obtained `apiKey`.
```ballerina
    images:Client imagesClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now you can use the operations available within the connector.

    Following is an example on generating image using the OpenAI DALL.E model:

    ```ballerina
    public function main() returns error? {
        images:CreateImageRequest createImageRequest = {
            prompt: "A cute baby sea otter",
            n: 1,
            size: "256x256",
            response_format: "url",
            user: "user-1234"
        };
        images:ImagesResponse res = check imagesClient->/images/generations.post(createImageRequest);
        io:println(res);
    }
    ``` 
2. Use the`bal run` command to compile and run the Ballerina program.
