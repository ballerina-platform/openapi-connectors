## Overview
This is a generated connector from [Azure OpenAI Chat Completions API](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#chat-completions/) OpenAPI specification.

The Azure Azure OpenAI Service REST API Chat Completions Endpoint will create completions for chat messages with the GPT3.5 (preview), GPT-4 (preview) models and GPT-4 Vision models.

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource)
- Deploy an appropriate model within the resource by referring to [Deploy a model](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource?pivots=web-portal#deploy-a-model) guide
- Obtain tokens by following [Azure OpenAI Authentication](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide

## Quickstart

To use the Azure OpenAI Chat connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.openai.chat` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.chat;
import ballerina/io;
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

    >**Note:** These operations are in the form of remote operations.


   Following is an example of creating a conversation with an Azure OpenAI chat model:

    ```ballerina
    public function main() returns error? {

        final chat:Client chatClient = check new (
            config = {auth: {apiKey: apiKey}},
            serviceUrl = serviceUrl
        );

        chat:CreateChatCompletionRequest chatBody = {
            messages: [{role: "user", content: "What is Ballerina?"}]  
        };

        chat:CreateChatCompletionResponse chatResult = check chatClient->/deployments/["chat"]/chat/completions.post("2023-12-01-preview", chatBody);

        io:println(chatResult);
    }
    ```

    Following is a sample of using function calling with an Azure OpenAI chat model:

    ```ballerina
    public function main() returns error? {

        final chat:Client chatClient = check new (
            config = {auth: {apiKey: apiKey}},
            serviceUrl = serviceUrl
        );

        chat:ChatCompletionRequestMessage[] messages = [{role: "user", "content": "What is the weather in Seattle?"}];
        chat:ChatCompletionTool[] tools = [
            {
                'type: "function",
                'function: {
                    name: "get_current_weather",
                    description: "Get the current weather in a given location",
                    parameters: {
                        "type": "object",
                        "properties": {
                            "location": {
                                "type": "string",
                                "description": "The city or town to get the weather for"
                            },
                            "unit": {
                                "type": "string",
                                "enum": ["celsius", "fahrenheit"]
                            }
                        },
                        "required": ["location"]
                    }
                }
            }
        ];

        chat:CreateChatCompletionRequest chatBody = {messages, tools};

        chat:CreateChatCompletionResponse chatResult = check chatClient->/deployments/[deployementId]/chat/completions.post("2023-12-01-preview", chatBody);

        io:println(chatResult);

        record {|chat:ChatCompletionResponseMessage message?; chat:ContentFilterChoiceResults content_filter_results?; int index?; string finish_reason?; anydata...;|}[] choices = check chatResult.choices.ensureType();

        // continue the chat
        chat:ChatCompletionRequestMessage message = check choices[0].message.cloneWithType();
        messages.push(message);

        // check if there are any tool calls
        chat:ChatCompletionMessageToolCall[]? toolCalls = choices[0].message?.tool_calls;
        if toolCalls is chat:ChatCompletionMessageToolCall[] {
            foreach chat:ChatCompletionMessageToolCall toolCall in toolCalls {
                string functionName = toolCall.'function.name;
                string functionArguments = toolCall.'function.arguments;
                // invoke the function
                anydata functionResponse = "<function response>";
                messages.push(
                    {
                    role: "tool",
                    "tool_call_id": toolCall.id,
                    "name": functionName,
                    "content": functionResponse
                });
            }
        }

        // do the second chat request
        chatResult = check chatClient->/deployments/["chatgpt"]/chat/completions.post("2023-12-01-preview", {messages});
        io:println(chatResult);
    }
    ```

    Following a sample to use OpenAI vision capabilities with chat model
    ```ballerina
    public function main() returns error? {
        final chat:Client chatClient = check new (
            config = {auth: {apiKey: apiKey}},
            serviceUrl = serviceUrl
        );

        chat:CreateChatCompletionResponse response = check chatClient->/deployments/[deployementId]/chat/completions.post("2023-12-01-preview",
            {
                messages: [
                    {
                        "role": "system",
                        "content": "You are a helpful assistant."
                    },
                    {
                        "role": "user",
                        "content": [
                            {
                                "type": "text",
                                "text": "Describe the image."
                            },
                            {
                                "type": "image_url",
                                "image_url": {
                                    "url": "<image url>"
                                }
                            }
                        ]

                    }
                ]
            }
        );

        record {|chat:ChatCompletionResponseMessage message?; chat:ContentFilterChoiceResults content_filter_results?; int index?; string finish_reason?; anydata...;|}[] choices = check response.choices.ensureType();
        io:println(choices[0].message?.content);
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.