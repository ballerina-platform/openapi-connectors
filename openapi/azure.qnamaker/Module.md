## Overview

This is a generated connector for [Azure QnA Maker API v4](https://docs.microsoft.com/en-us/rest/api/cognitiveservices-qnamaker/QnAMaker4.0/) OpenAPI specification.
The Azure QnA Maker API is a cloud-based Natural Language Processing (NLP) service that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom knowledge base (KB) of information. QnA Maker is commonly used to build conversational client applications, which include social media applications, chat bots, and speech-enabled desktop applications.

This module supports [Azure QnA Maker API v4](https://docs.microsoft.com/en-us/rest/api/cognitiveservices-qnamaker/QnAMaker4.0/).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Azure account](https://docs.microsoft.com/en-us/learn/modules/create-an-azure-account/)

* Create a [resource](https://portal.azure.com/#blade/Microsoft_Azure_ProjectOxford/CognitiveServicesHub/QnAMaker)

* Obtain tokens by following [this guide](https://docs.microsoft.com/en-us/azure/cognitive-services/qnamaker/how-to/set-up-qnamaker-service-azure?tabs=v1)

## Quickstart

To use this connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.qnamaker` module into the Ballerina project.
```ballerina
import ballerinax/azure.qnamaker;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using `Ocp-Apim-Subscription-Key`.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure `Ocp-Apim-Subscription-Key` in ballerina file directly. 

    ```ballerina
    
    qnamaker:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            Ocp-Apim-Subscription-Key:"<AZURE_API_KEY>"
        }
    };

    qnamaker:Client myClient = check new Client(apiKeyConfig, serviceUrl = "https://<REGION>.api.cognitive.microsoft.com/qnamaker/v4.0");

    ```

- Option 2 :
    Configure `Ocp-Apim-Subscription-Key` in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up `Ocp-Apim-Subscription-Key` in `Config.toml` as shown below.
    ```
    [apiKeyConfig.apiKeys]
    Ocp-Apim-Subscription-Key = "<AZURE_API_KEY>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable ApiKeysConfig & readonly apiKeyConfig = ?;

    qnamaker:Client myClient = check new Client(apiKeyConfig, serviceUrl = "https://<REGION>.api.cognitive.microsoft.com/qnamaker/v4.0");
    ```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get Knowledgebase Details from API.

    Get Knowledgebase Details

    ```ballerina
    public function main() returns error? {

        qnamaker:KnowledgebaseDTO res = check baseClient->getKnowledgebaseDetail(kID);

    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.
