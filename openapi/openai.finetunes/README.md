## Overview
This [Ballerina](https://ballerina.io) connector, which is actively maintained by a dedicated community, provides streamlined access to the [OpenAI Fine-tunes API](https://platform.openai.com/docs/api-reference/fine-tunes). The OpenAI Fine-tunes API allows developers to tailor the latest AI models developed by OpenAI according to their specific requirements.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.finetunes/latest)

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_finetunes
cd openai_finetunes
```

### Step 2: Invoke the fine-tunes API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.finetunes;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main(string fileName) returns error? {
    // Create an OpenAI fine-tunes client.
    finetunes:Client finetunesClient = check new ({
        auth: {token: openAIKey}
    });

    byte[] fileContent = check io:fileReadBytes(fileName);
    finetunes:CreateFileRequest fileRequest = {
        file: {fileContent, fileName},
        purpose: "fine-tune"
    };
    finetunes:OpenAIFile fileResponse = 
        check finetunesClient->/files.post(fileRequest);
    string fileId = fileResponse.id;

    finetunes:CreateFineTuneRequest fineTuneRequest = {
        model: "ada",
        training_file: fileId
    };
    finetunes:FineTune fineTuneResponse = 
        check finetunesClient->/fine\-tunes.post(fineTuneRequest);
    io:println(fineTuneResponse.id);
}
```

### Step 3: Set up your OpenAI API Key
Create a file called `Config.toml` at the root of the package directory and copy for the following content.
```toml
# OpenAI API Key
openAIKey="..."
```

### Step 4: Run the program
Use the `bal run -- sample.jsonl` command to compile and run the Ballerina program.
