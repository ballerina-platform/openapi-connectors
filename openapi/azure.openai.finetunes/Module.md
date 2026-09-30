## Overview

The `azure.openai.finetunes` module is a direct, fully-typed REST connector for the Azure OpenAI [Files](https://learn.microsoft.com/en-us/rest/api/azureopenai/files) and [Models](https://learn.microsoft.com/en-us/rest/api/azureopenai/models) management APIs behind fine-tuning. Use it as a standalone client to upload, list, and delete the training and validation data files and to list the available (fine-tuned) models on Azure — independent of the `ballerina/ai` agent framework.

### Key Features

- Programmatic access to create and manage resources via REST API
- Send and publish data through the API
- Manage user accounts and profiles
- Support for webhooks and event-driven workflows

## Prerequisites
- Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account.
- Create an [Azure OpenAI resource](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource).
- Obtain the tokens. Refer to [Azure OpenAI Authentication](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) guide to learn how to generate and use tokens.

## Quickstart

To use the Azure OpenAI Fine Tunes connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import the connector
Import the `ballerinax/azure.openai.finetunes` module into the Ballerina project.

```ballerina
import ballerinax/azure.openai.finetunes;
```

### Step 2: Create a new connector instance

Create and initialize a `finetunes:Client` with the obtained `apiKey` and a `serviceUrl` from the Azure OpenAI resource

```ballerina
final finetunes:Client finetunesClient = check new (
    apiKeyConfig = {auth: {apiKey: apiKey}},
    serviceUrl = serviceUrl
);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. 

>**Note:** that they are in the form of remote operations.

Following is an example of uploading a file and finetuning `curie` base model:

Uploading the data file from the local machine.

```ballerina
finetunes:Files_body filePayload = {
    purpose: "fine-tune",
    file: {fileContent: check io:fileReadBytes("sample.jsonl"), fileName: "sample.jsonl"}
};

finetunes:File fileResult = check finetunesClient->/files.post("2022-12-01", filePayload);
```

Once the file is uploaded, get the file ID from the response and use it to finetune the base model.

```ballerina
finetunes:FineTuneCreation finetunePayload = {
    training_file: "file-5272129a77284a188239a68656fc7890", 
    model: "curie"
};

finetunes:FineTune fineTune = check finetunesClient->/fine\-tunes.post("2022-12-01", finetunePayload);
```

2. Use `bal run` command to compile and run the Ballerina program.
