## Overview
This is a generated connector from [Azure OpenAI Chat Completions API](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#chat-completions/) OpenAPI specification.

The Azure Azure OpenAI Service REST API Chat Completions Endpoint will create completions for chat messages with the ChatGPT (preview) and GPT-4 (preview) models.

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource)
- Deploy an appropriate model within the resource by referring to [this guide](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal#deploy-a-model)
- Obtain tokens by following [this guide](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication)

## Quickstart

To use the Azure OpenAI Chat connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.chat` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.chat;
```

### Step 2: Create a new connector instance

Create and initialize a `chat:Client` with the obtained `apiKey` and a `serviceUrl` containing the deployed models.

    ```ballerina
    final chat:Client chatClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );
    ```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector.

>**Note:** that they are in the form of remote operations.

    Following is an example on creating a conversation with a OpenAI gpt-35-turbo model:

    ```ballerina
    public function main() returns error? {

    final chat:Client chatClient = check new (
        config = {auth: {apiKey: apiKey}},
        serviceUrl = serviceUrl
    );

    chat:Chat_completions_body chatBody = {
        messages: [{role: "user", content: "What is Ballerina?"}]  
    };

    chat:Inline_response_200|error unionResult = check chatClient->/deployments/["chat"]/chat/completions.post("2023-03-15-preview", chatBody);

    if (unionResult is chat:Inline_response_200) {
            io:println(unionResult);
        } else {
            io:println(unionResult);
        }
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.