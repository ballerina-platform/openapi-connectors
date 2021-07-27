## Overview
Ballerina connector for New York Times Movie Reviews is connecting the [New York Times Movie Reviews API](https://developer.nytimes.com/docs/movie-reviews-api/1/overview) via Ballerina language easily. With the New York Times Movie Reviews API you can search for movie reviews. The Movie Reviews API provides services for searching New York Times movie reviews by keyword and opening date and filter by Critics' Picks.

This module supports [New York Times Movie Review API v2.0.0](https://developer.nytimes.com/docs/movie-reviews-api/1/overview).

## Configuring Connector

### Prerequisites

* Create [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
* Configure the connector with obtained tokens
 
## Quickstart

To use the New York Times Movie Reviews connector in your Ballerina application, update the .bal file as follows:

#### Step 1: Import New York Times Movie Review module
First, import the ballerinax/nytimes.moviereviews module into the Ballerina project.
```ballerina
import ballerinax/nytimes.moviereviews as nm;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nm:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nm:Client baseClient = check new Client(config);
```
#### Step 3: Get movie critics.
You can now get movie critics. You can either specify the reviewer name or use "all", "full-time", or "part-time".

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
#### Step 4: Search for movie reviews.
You can now search for movie reviews. Supports filtering by Critics' Pick.

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
#### Step 5: Get movie reviews.
You can now get movie reviews. Can filter to only return Critics' Picks. Supports ordering results by-publication-date or by-opening-date. Use offset to paginate thru results, 20 at a time. Here we specify `all` to retrieve all reviews, including NYT Critics' Picks.

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
