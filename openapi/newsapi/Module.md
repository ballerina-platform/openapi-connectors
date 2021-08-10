## Overview

This is a generated connector for [News API v2.0.0](https://newsapi.org/docs) OpenAPI specification. 

News API used to fetch news(articles, headlines and sources) from news sources and blogs across the web.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [News API Account](https://newsapi.org/register)
* Obtaining tokens
    1. Log into [News API Account](https://newsapi.org/login)
    2. Get API key by clicking to `Get API Key`

## Quickstart

### Step 1: Import connector
Import the ballerinax/newsapi module into the Ballerina project.

```ballerina
import ballerinax/newsapi;
```
### Step 2: Create a new connector instance
```ballerina
newsapi:ApiKeysConfig config = {
    apiKeys : {
        apiKey : "<your apiKey>"
    }
};

newsapi:Client myclient = check new newsapi:Client(config, {}, "https://newsapi.org/v2");
```
### Step 3: Invoke connector operation
1. You can get top headlines as follows with `listTopHeadlines` method by passing country as a parameter.
    ```ballerina
    newsapi:WSNewsTopHeadlineResponse result = check myclient->listTopHeadlines(country="us");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
