## Overview
Ballerina connector for New York Times Archive is connecting the [New York Times Archive API](https://developer.nytimes.com/docs/archive-product/1/overview) via Ballerina language easily. With the New York Times Archive API you can get all NYTimes article metadata for a given month. The Archive API returns an array of NYT articles for a given month, going back to 1851. Its response fields are the same as the Article Search API. The Archive API is very useful if you want to build your own database of NYT article metadata. You simply pass the API the year and month and it returns all articles for that month. The response size can be large (~20mb).

This module supports [New York Times Archive API v1.0.0](https://developer.nytimes.com/docs/archive-product/1/overview).

## Prerequisites

* Create [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
* Configure the connector with obtained tokens
 
## Quickstart

To use the New York Times TimesTags connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import New York Times Archive module
First, import the ballerinax/nytimes.archive module into the Ballerina project.
```ballerina
import ballerinax/nytimes.archive as na;
```
### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
na:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
na:Client baseClient = check new Client(config);
```
### Step 3: Get all article metadata for a given month and year.
You can now get all NYTimes article metadata for a given month and year.

```ballerina
public function main() {
    na:InlineResponse200|error response = baseClient->getArticles(2021, 1);
    if (response is na:InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
