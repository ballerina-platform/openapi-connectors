## Overview
This [Ballerina](https://ballerina.io) connector, which is actively maintained by a dedicated community, provides streamlined access to the [OpenAI Audio API](https://platform.openai.com/docs/api-reference/audio). Its main function is to act as an interface between your Ballerina application and OpenAI's sophisticated speech-to-text AI models. By utilizing this connector, developers can easily leverage the power of OpenAI's latest advancements in artificial intelligence for speech recognition and transcription tasks.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.audio/latest)

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_audio
cd openai_audio
```

### Step 2: Invoke the audio API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.audio;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main(string fileName) returns error? {
    // Create an OpenAI audio client.
    audio:Client OpenAIAudio = check new ({
        auth: {token: openAIKey}
    });

    // Create a speech-to-text request.
    byte[] fileContent = check io:fileReadBytes(fileName);
    audio:CreateTranscriptionRequest request = {
        model: "whisper-1",
        file: {fileContent, fileName}
    };

    // Call the API.
    audio:CreateTranscriptionResponse response =
        check OpenAIAudio->/audio/transcriptions.post(request);
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
Use the `bal run -- audio.mp3` command to compile and run the Ballerina program.
