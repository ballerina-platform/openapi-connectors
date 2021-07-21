## Overview
Ballerina connector for New York Times Books is connecting the [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview) via Ballerina language easily. With the New York Times Books API provides information about book reviews and The New York Times Best Sellers lists.

This module supports all the operations available at [New York Times Books API](https://developer.nytimes.com/docs/books-product/1/overview).

## Configuring Connector

### Prerequisites
- An [NYTimes](https://developer.nytimes.com/accounts/login) Developer Account

### Obtaining tokens
1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
2. Register an app in order to obtain the API Key.
    - Select `My Apps` from the user drop-down.
    - Click `+ New App` to create a new app.
    - Enter a name and description for the app in the New App dialog.
    - Click `Create`.
    - Click the `APIs` tab.
    - Click the access toggle to enable or disable access to an API product from the app.
3. Access the API Key.
    - Select `My Apps` from th user drop-down.
    - Click the app in the list.
    - View the API key on the `App Details` tab.
    - Confirm that the status of the API key is Approved.
4. The whole process is summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

### Get best Sellers list names

#### Step 1: Import New York Times Books module
First, import the ballerinax/nytimes.books module into the Ballerina project.
```ballerina
import ballerinax/nytimes.books as books;
```
#### Step 2: Initialize the client
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
books:ApiKeysConfig config = {
    apiKeys: {
        api\-key: "<API_KEY>"
    }
}
books:Client baseClient = check new Client(config);
```
#### Step 3: Get best Sellers list names
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
