## Overview
Ballerina connector for New York Times Most Popular is connecting the [New York Times Most Popular API](https://developer.nytimes.com/docs/most-popular-product/1/overview) via Ballerina language easily. With the New York Times Most Popular API you can get popular articles on NYTimes.com. The Most Popular API provides services for getting the most popular articles on NYTimes.com based on emails, shares, or views.

This module supports [New York Times Most Popular API v2.0.0](https://developer.nytimes.com/docs/most-popular-product/1/overview).

### Prerequisites
* Create [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
* Configure the connector with obtained tokens
 
## Quickstart

To use the New York Times Most Popular connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import New York Times Most Popular module
First, import the ballerinax/nytimes.mostpopular module into the Ballerina project.
```ballerina
import ballerinax/nytimes.mostpopular as nm;
```
### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nm:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nm:Client baseClient = check new Client(config);
```
### Step 3: Get most emailed articles
You can now get most emailed articles on a certain section for a certain period. Here we have considered the "world" section for last 7 days.

```ballerina
public function main() {
    nm:InlineResponse200|error response = baseClient->getMostemailed("world", "7");
    if (response is nm:InlineResponse200) {
        nm:ArticleWithCountType[]? articlesWithCountType = response?.results;
        if !(articlesWithCountType is ()) {
            foreach var articleWithCountType in articlesWithCountType {
                log:printInfo(articleWithCountType?.'abstract.toString());
            }
        }
    } else {
        log:printError(response.message());
    }
}
``` 
### Step 4: Get most shared articles
You can now get most shared articles on a certain section for a certain period. Here we have considered the "sports" section for last 7 days.

```ballerina
public function main() {
    nm:InlineResponse2001|error response = baseClient->getMostshared("sports", "7");
    if (response is nm:InlineResponse2001) {
        nm:Article[]? articles = response?.results;
        if !(articles is ()) {
            foreach var article in articles {
                log:printInfo(article?.'abstract.toString());
            }
        }
    } else {
        log:printError(response.message());
    }
}
``` 
### Step 5: Get most viewed articles
You can now get most shared articles on a certain section for a certain period. Here we have considered the "world" section for last 30 days.

```ballerina
public function main() {
    nm:InlineResponse2001|error response = baseClient->getMostviewed("world", "30");
    if (response is nm:InlineResponse2001) {
        nm:Article[]? articles = response?.results;
        if !(articles is ()) {
            foreach var article in articles {
                log:printInfo(article?.'abstract.toString());
            }
        }
    } else {
        log:printError(response.message());
    }
}
``` 
