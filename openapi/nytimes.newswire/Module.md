## Overview
Ballerina connector for New York Times Newswire is connecting the [New York Times Newswire API](https://developer.nytimes.com/docs/timeswire-product/1/overview) via Ballerina language easily. With the New York Times Newswire API you can get realtime feed of NYTimes articles publishes. With the Times Newswire API, you can get links and metadata for Times' articles as soon as they are published on NYTimes.com. The Times Newswire API provides an up-to-the-minute stream of published articles. You can filter results by source (all, nyt, inyt) and section (arts, business, ...).

This module supports [New York Times Newswire API](https://developer.nytimes.com/docs/timeswire-product/1/overview).

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

### Get Articles

#### Step 1: Import New York Times Newswire module
First, import the ballerinax/nytimes.newswire module into the Ballerina project.
```ballerina
import ballerinax/nytimes.newswire as nt;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```
#### Step 3: Get articles.
You can now get articles. Here we have given the complete URL of a specific news item, URL-encoded or backslash-escaped.

```ballerina
public function main() {
    nt:InlineResponse200|error response = baseClient->getContents("https%3A%2F%2Fwww.nytimes.com%2F2018%2F09%2F19%2Fworld%2Fasia%2Fnorth-south-korea-nuclear-weapons.html");
    if (response is nt:InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Filter Articles

#### Step 1: Import New York Times Newswire module
First, import the ballerinax/nytimes.newswire module into the Ballerina project.
```ballerina
import ballerinax/nytimes.newswire as nt;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```
#### Step 3: Filter articles.
You can now filter by source and section articles. 
The following values are allowed for the `source`:
- all = items from both The New York Times and The International New York Times 
- nyt = New York Times items only 
- inyt = International New York Times items only (FKA The International Herald Tribune)

The following values are allowed for the `section`:
- all | A section name

```ballerina
public function main() {
    nt:InlineResponse200|error response = baseClient->filterContents("all", "world");
    if (response is InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 

### Filter Articles by Time

#### Step 1: Import New York Times Newswire module
First, import the ballerinax/nytimes.newswire module into the Ballerina project.
```ballerina
import ballerinax/nytimes.newswire as nt;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API key obtained from the [NYTimes Developer Portal](https://developer.nytimes.com/accounts/login) in the configuration.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```
#### Step 3: Filter articles by time.
You can now filter by source and section articles. 
The following values are allowed for the `source`:
- all = items from both The New York Times and The International New York Times 
- nyt = New York Times items only 
- inyt = International New York Times items only (FKA The International Herald Tribune)

The following values are allowed for the `section`:
- all | A section name
The `time-period` field limits the set of items by time published, integer in number of hours.

```ballerina
public function main() {
    nt:InlineResponse200|error response = baseClient->filterContentsByTime("all", "world", 24);
    if (response is nt:InlineResponse200) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.message());
    }
}
``` 
