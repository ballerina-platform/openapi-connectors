## Overview

This is a generated connector for [New York Times Books API v3.0.0](https://developer.nytimes.com/docs/books-product/1/overview) OpenAPI specification.

The Books API provides information about book reviews and The New York Times bestsellers lists. For additional help getting started with the API, visit [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).

## Quickstart

To use the New York Times Books connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/nytimes.books module into the Ballerina project.
```ballerina
import ballerinax/nytimes.books as books;
```
### Step 2: Create a new connector instance
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
books:ApiKeysConfig config = {
    apiKeys: {
        api\-key: "<API_KEY>"
    }
}
books:Client baseClient = check new Client(config);
```
### Step 3: Invoke connector operation
1. You can use this function to get list of all the New York Times Best Sellers Lists. Some lists are published weekly and others monthly. The response includes when each list was first published and last published.
    ```ballerina
    books:InlineResponse2002 listsBestSellersHistoryJson = check baseClient->getListsFormat("json");
    if (listsBestSellersHistoryJson is books:InlineResponse2002) {
        books:InlineResponse2002Results[]? Results = listsBestSellersHistoryJson?.results;
        if !(Results is ()) {
            foreach var result in Results {
                log:printInfo(result.toString() + "\n");
            }
        }
    }
    ``` 
2. Use `bal run` command to compile and run the Ballerina program