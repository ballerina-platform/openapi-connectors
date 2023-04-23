
## Overview

This is a generated connector for the [OpenAI Chat API](https://beta.openai.com/docs/api-reference/chat) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Chat API provides a way to access the state-of-the-art ChatGPT models developed by OpenAI for a variety of tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Chat connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.chat` module into the Ballerina project.
```ballerina
import ballerinax/openai.chat;
```

### Step 2: Create a new connector instance
Create and initialize a `chat:Client` with the obtained `apiKey`.
```ballerina
    chat:Client chatClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now you can use the operations available within the connector. Following is an example on creating a conversation with the GPT-3.5 model.
```ballerina
public function main() returns error? {
    chat:CreateChatCompletionRequest req = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": "What is Ballerina?"}]
    };
    chat:CreateChatCompletionResponse res = check chatClient->/chat/completions.post(req);
}
``` 

2. Use `bal run` command to compile and run the Ballerina program.
