## Overview
This is a generated connector for [New York Times Archive API v1.0.0](https://developer.nytimes.com/docs/archive-product/1/overview) OpenAPI specification. 
With the New York Times Archive API you can get all NYTimes article metadata for a given month. The Archive API returns an array of NYT articles for a given month, going back to 1851. Its response fields are the same as the Article Search API. 
The Archive API is very useful if you want to build your own database of NYT article metadata. You simply pass the API the year and month and it returns all articles for that month. The response size can be large (~20mb).

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [NYTimes](https://developer.nytimes.com/accounts/login) developer account
* Obtain tokens
    1. Log into NYTimes Developer Portal by visiting https://developer.nytimes.com/accounts/login
    2. Register an app and obtain the API Key following the process summarized [here](https://developer.nytimes.com/get-started).
 
## Quickstart

To use the New York Times TimesTags connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/nytimes.archive` module into the Ballerina project.
```ballerina
import ballerinax/nytimes.archive as na;
```

### Step 2: Create a new connector instance
Create a `archive:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
na:ApiKeysConfig config = {
    apiKey: "<API_KEY>"
}
na:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all article metadata for a given month and year using the connector.

    Get all article metadata for a given month and year

    ```ballerina
    public function main() {
        na:InlineResponse200|error response = baseClient->getArticles(2021, 1);
        if (response is na:InlineResponse200) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program. 
