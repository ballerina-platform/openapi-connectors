## Overview
This is a generated connector from [New York Times Most Popular API v2.0.0](https://developer.nytimes.com/docs/most-popular-product/1/overview) OpenAPI specification. 
With the New York Times Most Popular API you can get popular articles on NYTimes.com. 
The Most Popular API provides services for getting the most popular articles on NYTimes.com based on emails, shares, or views.

### Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

To use the New York Times Most Popular connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.mostpopular` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.mostpopular as nm;
```

### Step 2: Create a new connector instance
Create a `mostpopular:ApiKeysConfig` with the API key obtained, and initialize the connector with it. 
```ballerina
nm:ApiKeysConfig config = {
    apiKey: "<API_KEY>"
}
nm:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get most emailed articles using the connector. You can now get most emailed articles on a certain section for a certain period. Here we have considered the "world" section for last 7 days.

    Get most emailed articles

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

    Following is an example on how to get most shared articles using the connector. You can now get most shared articles on a certain section for a certain period. Here we have considered the "sports" section for last 7 days.

    Get most shared articles

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

    Following is an example on how to get most viewed articles using the connector. You can now get most shared articles on a certain section for a certain period. Here we have considered the "world" section for last 30 days.

    Get most viewed articles

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

2. Use `bal run` command to compile and run the Ballerina program. 
