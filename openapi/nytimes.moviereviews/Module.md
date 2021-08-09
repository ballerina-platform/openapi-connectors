## Overview
This is a generated connector from [New York Times Movie Review API v2.0.0](https://developer.nytimes.com/docs/movie-reviews-api/1/overview) OpenAPI specification. 
With the New York Times Movie Reviews API you can search for movie reviews. 
The Movie Reviews API provides services for searching New York Times movie reviews by keyword and opening date and filter by Critics' Picks.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

To use the New York Times Movie Reviews connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.moviereviews` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.moviereviews as nm;
```

### Step 2: Create a new connector instance
Create a `moviereviews:ApiKeysConfig` with the API key obtained, and initialize the connector with it. 
```ballerina
nm:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nm:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get movie critics using the connector. You can either specify the reviewer name or use "all", "full-time", or "part-time".

    Get movie critics

    ```ballerina
    public function main() {
        nm:InlineResponse200|error response = baseClient->criticsPicks("all");
        if (response is nm:InlineResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to search for movie reviews using the connector. Supports filtering by Critics' Pick.

    Search for movie reviews

    ```ballerina
    public function main() {
        nm:InlineResponse2001|error response = baseClient->searchMovieReviews();
        if (response is nm:InlineResponse2001) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

    Following is an example on how to get movie reviews using the connector. You can filter to only return Critics' Picks. Supports ordering results by-publication-date or by-opening-date. Use offset to paginate thru results, 20 at a time. Here we specify `all` to retrieve all reviews, including NYT Critics' Picks.

    Get movie reviews

    ```ballerina
    public function main() {
        nm:InlineResponse2001|error response = baseClient->getMovieReviews("all");
        if (response is nm:InlineResponse2001) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.