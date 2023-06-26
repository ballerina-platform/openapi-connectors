## Overview
This [Ballerina](https://ballerina.io) connector, which is actively maintained by a dedicated community, provides streamlined access to the [OpenAI Images API](https://platform.openai.com/docs/api-reference/images). The OpenAI Images API facilitates access to the innovative DALL.E models developed by OpenAI, designed for a range of image-based tasks. This connector is an essential tool for developers aiming to employ the power of OpenAI's advanced image processing AI capabilities in their applications.

[API Documentation](https://lib.ballerina.io/ballerinax/openai.images/latest)

## Prerequisites
* Create an [OpenAI account](https://platform.openai.com/signup).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start
### Step 1: Create a Ballerina package
Use `bal new` to create a new package. 

```sh
bal new openai_images
cd openai_images
```

### Step 2: Invoke the images API 
Copy the following code to the `main.bal` file.

```ballerina
import ballerinax/openai.images;
import ballerina/io;

// Read the OpenAI key
configurable string openAIKey = ?;

public function main() returns error? {
    images:Client openAIImages = check new ({
        auth: {token: openAIKey}
    });

    images:CreateImageRequest request = {
        prompt: "A cute baby sea otter",
        n: 1,
        size: "256x256",
        response_format: "url",
        user: "user-1234"
    };
    images:ImagesResponse response = 
        check openAIImages->/images/generations.post(request);
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
