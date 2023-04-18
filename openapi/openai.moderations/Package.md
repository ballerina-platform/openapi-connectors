Connects to the OpenAI Moderations API from Ballerina with the `ballerinax/openai.moderations` package.

## Package overview
The `ballerinax/openai.moderations` package is a [Ballerina](https://ballerina.io/) connector for OpenAI's Moderations API. The connector provides access to state-of-the-art models for text moderation. By using the `ballerinax/openai.moderations` package, you can easily integrate OpenAI's advanced AI capabilities into your own Ballerina applications.

|                             | Version         |
|-----------------------------|-----------------|
| OpenAI API                  | 1.2.0           |

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [OpenAI account](https://beta.openai.com/signup/).
* Obtain an API key by following [these instructions](https://platform.openai.com/docs/api-reference/authentication).

## Quick start

To use the OpenAI moderations connector in your Ballerina application, update the `.bal` file as follows:

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

## Report issues
To report bugs, request new features, start new discussions, view project boards, etc., visit the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library).

## Useful links
- Discuss code changes of the Ballerina project via [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Join the Ballerina community on [Discord](https://discord.gg/ballerinalang) to chat with the developers.
- Post technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
