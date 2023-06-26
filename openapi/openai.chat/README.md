## Overview
This is a community-maintained [Ballerina](https://ballerina.io) connector for the [OpenAI Chat API](https://platform.openai.com/docs/api-reference/chat). The OpenAI Chat API provides a way to access the state-of-the-art ChatGPT models developed by OpenAI for a variety of tasks.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.chat/latest)

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_chat
cd openai_chat
```

### Step 2: Invoke the chat API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.chat;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main() returns error? {
    // Create an OpenAI chat client.
    chat:Client openAIChat = check new ({
        auth: {token: openAIKey}
    });

    // Create a chat completion request.
    chat:CreateChatCompletionRequest request = {
        model: "gpt-3.5-turbo",
        messages: [{"role": "user", "content": "What is Ballerina?"}]
    };

    // Call the API.
    chat:CreateChatCompletionResponse response =
        check openAIChat->/chat/completions.post(request);
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
