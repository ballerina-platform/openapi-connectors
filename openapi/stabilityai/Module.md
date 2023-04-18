## Overview
This is a generated connector from [Stability.ai REST API (v1)](https://platform.stability.ai/rest-api) OpenAPI specification. 

## Prerequisites
- Create an [Satbility AI](https://beta.dreamstudio.ai/generate/) account.
- Obtain the API key. Refer to [Satbility AI Authentication](https://platform.stability.ai/docs/getting-started/authentication/) to learn how to obtain API key.

## Quickstart
To use the Stability AI connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/stabilityai` module into the Ballerina project.

```ballerina
import ballerinax/stabilityai;
```

### Step 2: Create a new connector instance
Create and initialize a `stabilityai:Client` with the obtained `apiKey` from the Satbility AI

```ballerina
final stabilityai:Client stabilityaiClient = check new ({authorization: api_key});
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector.

>**Note:** that they are in the form of remote operations.

Following is an example on generating an image based on the text prompt:

```ballerina
stabilityai:TextToImageRequestBody payload = {
    text_prompts: [
        {
            "text": "A lighthouse on a cliff",
            "weight": 1
        }
    ]
};

stabilityai:ImageRes listResult = check stabilityaiClient->/v1/generation/["stable-diffusion-v1"]/text\-to\-image.post(payload);

listResult.artifacts.forEach(function(stabilityai:Image image) {
    string? imageBytesString = image.'base64;
    if (imageBytesString is string) {
        byte[] imageBytes = imageBytesString.toBytes();
        var base64Decode = mime:base64Decode(imageBytes);
        if base64Decode is byte[] {
            io:Error? fileWrite = io:fileWriteBytes("./output.png", base64Decode);
            if fileWrite is io:Error {
                io:println("Error: ", fileWrite);
            }
        } else if base64Decode is error {
            io:println("Error: ", base64Decode);
        }
    }
});
```

2. Use `bal run` command to compile and run the Ballerina program.