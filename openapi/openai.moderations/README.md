## Overview

The `openai.moderations` module is a direct, fully-typed REST connector for OpenAI's [Moderations API](https://platform.openai.com/docs/api-reference/moderations) (`POST /moderations`). Use it as a standalone client to classify whether text is potentially harmful across OpenAI's content-policy categories — for text generation use `openai.chat`, and for the `ballerina/ai` agent framework use `ai.openai`.

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_moderations
cd openai_moderations
```

### Step 2: Invoke the moderations API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.moderations;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main() returns error? {
    moderations:Client moderationsClient = check new ({
        auth: {token: openAIKey}
    });

    moderations:CreateModerationRequest request = {
        input: "I want to kill them.",
        model: "text-moderation-stable"
    };

    moderations:CreateModerationResponse response = 
        check moderationsClient->/moderations.post(request);
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
