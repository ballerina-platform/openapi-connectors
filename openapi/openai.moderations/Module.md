
## Overview

This is a generated connector for the [OpenAI `moderations` API](https://beta.openai.com/docs/api-reference/moderations) OpenAPI Specification. OpenAI is an American artificial intelligence research laboratory consisting of a non-profit corporation and a for-profit subsidiary. OpenAI conducts AI research with the declared intention of promoting and developing friendly AI. The OpenAI Moderations API provides a way to access new moderation models developed by OpenAI for content moderation tasks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI `moderations` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the connector
First, import the `ballerinax/openai.moderations` module into the Ballerina project.

```ballerina
import ballerinax/openai.moderations;
import ballerina/io;
```

### Step 2: Create a new connector instance
Create and initialize a `moderations:Client` with the obtained `apiKey`.
```ballerina
    moderations:Client moderationsClient = check new ({
        auth: {
            token: "sk-XXXXXXXXX"
        }
    });
```

### Step 3: Invoke the connector operation
1. Now you can use the operations available within the connector.

    Following is an example on identifying harmful content using the OpenAI moderations model:

    Moderate with Text Moderation model

    ```ballerina
    public function main() returns error? {
        moderations:CreateModerationRequest createModerationRequest = {
            input: "I want to kill them.",
            model: "text-moderation-stable"
        };

        moderations:CreateModerationResponse res = check moderationsClient->/moderations.post(createModerationRequest);
        io:println(res);
    }
    ``` 
2. Use the `bal run` command to compile and run the Ballerina program.
