## Overview
Ballerina connector for New York Times Top Stories is connecting the [New York Times Top Stories API](https://developer.nytimes.com/docs/top-stories-product/1/overview) via Ballerina language easily. With the New York Times Top Stories API you can get articles currently on a section front or home page. The Top Stories API returns an array of articles currently on the specified section (arts, business, ...). The possible section value are: arts, automobiles, books, business, fashion, food, health, home, insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, t-magazine, travel, upshot, us, and world.

This module supports [New York Times Top Stories API](https://developer.nytimes.com/docs/top-stories-product/1/overview).

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

### Top Stories Search

#### Step 1: Import New York Times Top Stories module
First, import the ballerinax/nytimes.topstories module into the Ballerina project.
```ballerina
import ballerinax/nytimes.topstories as nt;
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
#### Step 3: Look up top stories
You can now get an array of articles currently on the specified section (arts, business, ...). Here we have searched for top stories in the `world` section. The possible section value are: arts, automobiles, books, business, fashion, food, health, home, insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, t-magazine, travel, upshot, us, and world.
```ballerina
public function main() {
    nt:InlineResponse200|error response = baseClient->topStories("world", "json");
    if (response is nt:InlineResponse200) {
        nt:Article[]? articles = response?.results;
        if !(articles is ()) {
            foreach var article in articles {
                log:printInfo(article?.'abstract.toString() + "\n");
            }
        }
    } else {
        log:printError(response.toString());
    }
}
``` 

### Top Stories on Home Page 

#### Step 1: Import New York Times Top Stories module
First, import the ballerinax/nytimes.topstories module into the Ballerina project.
```ballerina
import ballerinax/nytimes.topstories as nt;
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
#### Step 3: Look up top stories
You can now get articles currently on the homepage. Here we have searched for articles with the word "home".
```ballerina
public function main() {
    nt:InlineResponse200|error response = baseClient->topStories("home", "json");
    if (response is nt:InlineResponse200) {
        nt:Article[]? articles = response?.results;
        if !(articles is ()) {
            foreach var article in articles {
                log:printInfo(article?.'abstract.toString() + "\n");
            }
        }
    } else {
        log:printError(response.toString());
    }
}
``` 