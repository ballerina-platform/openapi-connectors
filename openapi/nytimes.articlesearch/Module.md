## Overview
Ballerina connector for New York Times Article Search is connecting the [New York Times Article Search API](https://developer.nytimes.com/docs/articlesearch-product/1/overview) via Ballerina language easily. With the New York Times Article Search API you can search for New York Times articles. With the Article Search API, you can search New York Times articles from Sept. 18, 1851 to today, retrieving headlines, abstracts, lead paragraphs, links to associated multimedia and other article metadata. Use the Article Search API to look up articles by keyword. You can refine your search using filters and facets. 

This module supports [New York Times Article Search API v1.0.0](https://developer.nytimes.com/docs/articlesearch-product/1/overview).

## Prerequisites

* Create [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key by following the process summarized [here](https://developer.nytimes.com/get-started).
* Configure the connector with obtained tokens 

## Quickstart

To use the New York Times Article Search connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import New York Times Article Search module
First, import the ballerinax/nytimes.articlesearch module into the Ballerina project.
```ballerina
import ballerinax/nytimes.articlesearch as na;
```
### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
na:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
na:Client baseClient = check new Client();
```
### Step 3: Look up articles by keyword
You can now search for NYT articles by keywords, filters and facets. Here we have searched for articles with the word "election".
```ballerina
public function main() {
    na:InlineResponse200|error response = baseClient->articleSearch("election");
    if (response is na:InlineResponse200) {
        na:InlineResponse200Response? inlineResponse200Response = response?.response;
        na:Doc[]? docs = inlineResponse200Response?.docs;
        if !(docs is ()) {
            foreach var doc in docs {
                log:printInfo(doc?.'abstract.toString() + "\n");
            }
        }
    } else {
        log:printError(response.toString());
    }
}
``` 
