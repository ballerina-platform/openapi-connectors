## Overview

This is a generated connector for [Azure Text Analytics API v1](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/) OpenAPI specification.
The Text Analytics API is a suite of natural language processing (NLP) services built with best-in-class Microsoft machine learning algorithms. The API can be used to analyze unstructured text for tasks such as sentiment analysis, key phrase extraction and language detection. Functionality for analysis of text specific to the healthcare domain and personal information are also available in the API. Further documentation can be found [here](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/overview)

This module supports [Azure Text Analytics API v1](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Azure account](https://docs.microsoft.com/en-us/learn/modules/create-an-azure-account/)

* Create a [Text Analysis resource](https://portal.azure.com/#create/Microsoft.CognitiveServicesTextAnalytics)

* Obtain tokens by following [this guide](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-keys-manage?tabs=azure-portal)

## Quickstart

To use the Azure Text Analytics connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/azure.textanalytics` module into the Ballerina project.
```ballerina
import ballerinax/azure.textanalytics;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using `Ocp-Apim-Subscription-Key`.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure `Ocp-Apim-Subscription-Key` in ballerina file directly. 

    ```ballerina
    
    textanalytics:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            Ocp-Apim-Subscription-Key:"<AZURE_TEXT_ANALYTICS_API_KEY>"
        }
    };

    textanalytics:Client myClient = check new Client(apiKeyConfig, serviceUrl = "https://<REGION>.api.cognitive.microsoft.com/text/analytics/v3.1");

    ```

- Option 2 :
    Configure `Ocp-Apim-Subscription-Key` in `Config.toml` file and configure it in ballerina file, using configurables. 

    1. Set up `Ocp-Apim-Subscription-Key` in `Config.toml` as shown below.
    ```
    [apiKeyConfig.apiKeys]
    Ocp-Apim-Subscription-Key = "<AZURE_TEXT_ANALYTICS_API_KEY>"
    ```

    2. Configure the client in ballerina file as shown below.
    ```ballerina
    configurable ApiKeysConfig & readonly apiKeyConfig = ?;

    textanalytics:Client myClient = check new Client(apiKeyConfig, serviceUrl = "https://<REGION>.api.cognitive.microsoft.com/text/analytics/v3.1");
    ```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to use sentiment prediction. The API returns a sentiment prediction, as well as sentiment scores for each sentiment class (Positive, Negative, and Neutral) for the document and each sentence within it.

    Sentiment Prediction

    ```ballerina
    public function main() returns error? {

        textanalytics:MultiLanguageBatchInput payload = {
            "documents": [
                {
                "id": "string",
                "text": "string",
                "language": "string"
            }
        ]};

        textanalytics:SentimentResponse res = check baseClient->sentiment(payload);

    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.
