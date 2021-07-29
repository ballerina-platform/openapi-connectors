## Overview
This is a generated connector for [WebScraping.AI API v2.0.4](https://webscraping.ai/docs) OpenAPI specification. 
It provides a web scaping automation API with Chrome JS rendering, rotating proxies and builtin HTML parsing. 
More information about the WebScraping.AI API can be found at https://webscraping.ai.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [WebScraping.AI](https://webscraping.ai) account
* Obtain tokens
    1. Log into WebScraping.AI API Dashboard by visiting https://webscraping.ai/dashboard
    2. Obtain the `API Key` from the dashboard
 
## Quickstart

To use the WebScraping.AI connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/webscraping.ai` module into the Ballerina project.
```ballerina
import ballerinax/webscraping.ai as wa;
```

### Step 2: Create a new connector instance
Create a `ai:ApiKeysConfig` with the API Key obtained, and initialize the connector with it. 
```ballerina
wa:ApiKeysConfig config = {
    api_key: "<API_KEY>"
}
wa:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to page HTML by URL using the connector. You can now get full HTML content of a page with proxies and Chrome JS rendering.

    Page HTML by URL

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

    Following is an example on how to get HTML of a selected page area by URL and CSS selector using the connector. You can now get HTML content of selected page areas (like price, search results, page title, etc.).

    Get HTML of a selected page area by URL and CSS selector


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

2. Use `bal run` command to compile and run the Ballerina program.