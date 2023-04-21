
## Overview

This is a generated connector for the [OpenAI Fine-tunes API](https://beta.openai.com/docs/api-reference/fine-tunes) OpenAPI specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Fine-tunes API provides a way to customize new AI models developed by OpenAI for your specific needs.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Fine-tunes connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.finetunes` module into the Ballerina project.

```ballerina
import ballerinax/openai.finetunes;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize a `finetunes:Client` with the  obtained `apiKey`.
```ballerina
    finetunes:Client finetunesClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. 

   Following is an example on fine tuning the GPT-3 ada model:

   ```ballerina
    public function main() returns error? {
        finetunes:CreateFileRequest req = {
            file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"},
            purpose: "fine-tune"
        };
        finetunes:OpenAIFile fileRes = check finetunesClient->/files.post(req);
        string fileId = fileRes.id;

        finetunes:CreateFineTuneRequest createFineTuneRequest = {
            model: "ada",
            training_file: fileId
        };

        finetunes:FineTune res = check finetunesClient->/fine\-tunes.post(createFineTuneRequest);
        io:println(res.id);
    }
   ``` 
2. Use the `bal run` command to compile and run the Ballerina program.
