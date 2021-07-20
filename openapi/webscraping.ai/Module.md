## Overview
Ballerina connector for WebScraping.AI is connecting the [WebScraping.AI API](https://webscraping.ai/docs) via Ballerina language easily. It provides a web scaping automation API with Chrome JS rendering, rotating proxies and builtin HTML parsing. More information about the WebScraping.AI API can be found at https://webscraping.ai.

This module supports [WebScraping.AI API v2.0.4](https://webscraping.ai/docs).

## Configuring Connector

### Prerequisites
- A [WebScraping.AI](https://webscraping.ai) Account

### Obtaining tokens
1. Log into WebScraping.AI API Dashboard and visiting https://webscraping.ai/dashboard
2. Obtain the `API Key` from the dashboard
 
## Quickstart

### Page HTML by URL

#### Step 1: Import WebScraping.AI module
First, import the ballerinax/webscraping.ai module into the Ballerina project.
```ballerina
import ballerinax/webscraping.ai as wa;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API Key obtained above in the configuration.
```ballerina
wa:ApiKeysConfig config = {
    api_key: "<API_KEY>"
}
wa:Client baseClient = check new Client(config);
```
#### Step 3: Page HTML by URL
You can now get full HTML content of a page with proxies and Chrome JS rendering.
```ballerina
public function main() {
    string|error response = baseClient->getHTML(string `https://example.com`);
    if (response is string) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.toString());
    }
}
``` 

### HTML of a selected page area by URL and CSS selector

#### Step 1: Import WebScraping.AI module
First, import the ballerinax/webscraping.ai module into the Ballerina project.
```ballerina
import ballerinax/webscraping.ai as wa;
```
#### Step 2: Initialize the client.
You can initialize the client as follows. You can now provide the API Key obtained above in the configuration.
```ballerina
wa:ApiKeysConfig config = {
    api_key: "<API_KEY>"
}
wa:Client baseClient = check new Client(config);
```
#### Step 3: HTML of a selected page area by URL and CSS selector
You can now get HTML content of selected page areas (like price, search results, page title, etc.).
```ballerina
public function main() {
    string|error response = baseClient->getSelected(string `https://example.com`, "h1");
    if (response is string) {
        log:printInfo(response.toString());
    } else {
        log:printError(response.toString());
    }
}
``` 
