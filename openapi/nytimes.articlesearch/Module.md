## Overview
This is a generated connector for [New York Times Article Search API v1.0.0](https://developer.nytimes.com/docs/articlesearch-product/1/overview) OpenAPI specification. 
With the Article Search API, you can search New York Times articles from Sept. 18, 1851 to today, retrieving headlines, abstracts, lead paragraphs, links to associated multimedia and other article metadata. 
Use the Article Search API to look up articles by keyword. You can refine your search using filters and facets. 

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key by following the process summarized [here](https://developer.nytimes.com/get-started).

## Quickstart

To use the New York Times Article Search connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.articlesearch` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.articlesearch as na;
```

### Step 2: Create a new connector instance
Create a `articlesearch:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
na:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
na:Client baseClient = check new Client();
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to look up articles by keyword using the connector. You can now search for NYT articles by keywords, filters and facets. Here we have searched for articles with the word "election".

    Look up articles by keyword

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

2. Use `bal run` command to compile and run the Ballerina program. 