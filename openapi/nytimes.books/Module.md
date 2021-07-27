## Overview
Ballerina connector for New York Times Books is connecting the [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview) via Ballerina language easily. With the New York Times Books API provides information about book reviews and The New York Times Best Sellers lists.

This module supports all the operations available at [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview).

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [NYTimes Developer Account](https://developer.nytimes.com/accounts/create)
* Obtaining tokens
        
    Follow [this link](https://developer.nytimes.com/get-started) and obtain the necessary tokens.

* Configure the connector with obtained tokens

## Quickstart

To use the New York Times Books connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import New York Times Books module
First, import the ballerinax/nytimes.books module into the Ballerina project.
```ballerina
import ballerinax/nytimes.books as books;
```
### Step 2: Initialize the client
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
books:ApiKeysConfig config = {
    apiKeys: {
        api\-key: "<API_KEY>"
    }
}
books:Client baseClient = check new Client(config);
```
### Step 3: Get best Sellers list names
This returns a list of all the New York Times Best Sellers Lists. Some lists are published weekly and others monthly. The response includes when each list was first published and last published.
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
