## Overview

This is a generated connector for [Bing Autosuggest API v1](https://www.microsoft.com/en-us/bing/apis/bing-autosuggest-api) OpenAPI specification.
The Autosuggest API lets partners send a partial search query to Bing and get back a list of suggested queries that other users have searched on. 
In addition to including searches that other users have made, the list may include suggestions based on user intent. 
For example, if the query string is weather in Lo, the list will include relevant weather suggestions.

This module supports [Bing Autosuggest API v1](https://www.microsoft.com/en-us/bing/apis/bing-autosuggest-api).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [Azure account](https://docs.microsoft.com/en-us/learn/modules/create-an-azure-account/)

* Create a [Bing Resource](https://portal.azure.com/#create/microsoft.bingsearch)

* Obtain tokens by following [this guide](https://docs.microsoft.com/en-us/azure/search/search-security-api-keys)

## Quickstart

To use the Bing Autosuggest connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/bing.autosuggest` module into the Ballerina project.
```ballerina
import ballerinax/bing.autosuggest;
```

### Step 2: Create a new connector instance
You can now make the connection configuration using `Ocp-Apim-Subscription-Key`.

You can do this step in two ways. You can use any one of this.

- Option 1 :
    Configure `Ocp-Apim-Subscription-Key` in ballerina file directly. 

    ```ballerina
    
    autosuggest:ApiKeysConfig apiKeyConfig = {
        apiKeys :{
            Ocp-Apim-Subscription-Key:"<AZURE_API_KEY>"
        }
    };

    autosuggest:Client myClient = check new Client(apiKeyConfig, serviceUrl);

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

    autosuggest:Client myClient = check new Client(apiKeyConfig, serviceUrl);
    ```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following operation provides suggestions for a given query or partial query.

    ```ballerina
    public function main() returns error? {
        autosuggest:SentimentResponse res = check baseClient->sentiment(query);
    }
    ```

2. Use `bal run` command to compile and run the Ballerina program.
