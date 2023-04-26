## Overview

This is a generated connector for the [OpenAI Audio API](https://beta.openai.com/docs/api-reference/audio) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Audio API provides a way to access new speech-to-text AI models developed by OpenAI for a variety of tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI Audio connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.audio` module into the Ballerina project.
```ballerina
import ballerinax/openai.audio;
```

### Step 2: Create a new connector instance
Create and initialize `audio:Client` with the `apiKey` obtained.
```ballerina
audio:Client audioClient = check new ({
    auth: {
        token: "sk-XXXXXXXXX"
    }
});
```

### Step 3: Invoke the connector operation
1. Now, you can use the operations available within the connector. Following is an example on transcribing audio using the OpenAI Whisper-1 model.
    ```ballerina
    public function main() returns error? {
        audio:CreateTranscriptionRequest req = {
            file: {fileContent: check io:fileReadBytes("sample.mp3"), fileName: "sample.mp3"},
            model: "whisper-1"
        };
        audio:CreateTranscriptionResponse res = check audioClient->/audio/transcriptions.post(req);
    }
    ``` 

2. Use the `bal run` command to compile and run the Ballerina program.