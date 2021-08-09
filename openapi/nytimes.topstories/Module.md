## Overview
This is a generated connector from [New York Times Top Stories API v2.0.0](https://developer.nytimes.com/docs/top-stories-product/1/overview) OpenAPI specification. 
With the New York Times Top Stories API you can get articles currently on a section front or home page. The Top Stories API returns an array of articles currently on the specified section (arts, business, ...). 
The possible section value are: arts, automobiles, books, business, fashion, food, health, home, insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, t-magazine, travel, upshot, us, and world.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

To use the New York Times Top Stories connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.topstories` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.topstories as nt;
```

### Step 2: Create a new connector instance
Create a `topstories:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
nt:ApiKeysConfig config = {
    apiKeys: {
        api_key: "<API_KEY>"
    }
}
nt:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to look up top stories using the connector. You can now get an array of articles currently on the specified section (arts, business, ...). Here we have searched for top stories in the `world` section. The possible section value are: arts, automobiles, books, business, fashion, food, health, home, insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, t-magazine, travel, upshot, us, and world.

    Look up top stories

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
    
    Following is an example on how to look up top stories on home page using the connector. You can now get articles currently on the homepage. Here we have searched for articles with the word "home".

    Look up top stories on home page

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

2. Use `bal run` command to compile and run the Ballerina program. 
