## Overview

The `openai.text` module is a direct, fully-typed REST connector for OpenAI's legacy [Completions API](https://platform.openai.com/docs/api-reference/completions) (`POST /completions` and `/edits`). Use it as a standalone client for single-prompt text completion and editing with older GPT-3-era models — for chat/GPT-4-style conversations use `openai.chat`, and for the `ballerina/ai` agent framework use `ai.openai`.

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_text
cd openai_text
```

### Step 2: Invoke the completions API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.text;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main() returns error? {
    // Create an OpenAI text client.
    text:Client openAIText = check new ({
        auth: {token: openAIKey}
    });
    
    // Create a completion request.
    text:CreateCompletionRequest request = {
        model: "text-davinci-003",
        prompt: "Say this is a test"
    };

    // Call the API.
    text:CreateCompletionResponse response =
        check openAIText->/completions.post(request);
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
