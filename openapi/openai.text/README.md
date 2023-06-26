## Overview
This is a community-maintained [Ballerina](https://ballerina.io) connector for the [OpenAI Completions API](https://platform.openai.com/docs/api-reference/completions). The OpenAI Completions API provides a way to access new Text AI models developed by OpenAI for a variety of tasks.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.text/latest)

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
