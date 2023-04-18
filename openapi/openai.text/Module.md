
## Overview

This is a generated connector for the [OpenAI Completions API](https://beta.openai.com/docs/api-reference/completions) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Completions API provides a way to access new Text AI models developed by OpenAI for a variety of tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI text connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.text` module into the Ballerina project.

```ballerina
import ballerinax/openai.text;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize a `text:Client` with the obtained `apiKey`.
```ballerina
    text:Client textClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now you can use the operations available within the connector.

    Following is an example on text completion using the OpenAI Davinci model:

    Generate text with Davinci

    ```ballerina
    public function main() returns error? {
        text:CreateCompletionRequest createCompletionRequest = {
            model: "text-davinci-002",
            prompt: "What is Ballerina?"
        };
        text:CreateCompletionResponse res = check textClient->/completions.post(createCompletionRequest);
        io:println(res);
    }
    ``` 
2. Use the `bal run` command to compile and run the Ballerina program.
