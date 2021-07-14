## Overview

News API connector consume the data exposed in https://newsapi.org/v2. It is supporting the following operations.

- listArticles
- listTopHeadlines
- listSources

## Obtaining tokens

### Prerequisites

- News API Account

### Obtaining tokens

To utilize News API users have to obtain API key given by [News API](https://newsapi.org/register)

To obtain an API Key please follow these steps
    * Go to [News API](https://newsapi.org/) and register a new account
    * Submit information in register form
    * After submitting needed information API Key can be obtained

Then provide the obtained API Key in client configuration.

## Quickstart

### Client configuration

#### Step 1: Import News API module
First, import the ballerinax/newsapi module into the Ballerina project.

```ballerina
import ballerinax/newsapi;
```
#### Step 2: Configure the connection credentials.
```ballerina
newsapi:ApiKeysConfig config = {
    apiKeys : {
        apiKey : "<your apiKey>"
    }
};

newsapi:Client myclient = check new newsapi:Client(config, {}, "https://newsapi.org/v2");
```
#### Step 3: Get top headlines
```ballerina
newsapi:WSNewsTopHeadlineResponse result = check myclient->listTopHeadlines(country="us");
```

## Snippets
Snippets of some operations.

### Get top articles
```ballerina
newsapi:WSNewsTopHeadlineResponse articleResult = check myclient->listArticles(1, 5, domains="bbc.co.uk"); 
```
### Get top headlines
```ballerina
newsapi:WSNewsTopHeadlineResponse result = check myclient->listTopHeadlines(country="us");
```
### Get sources
```ballerina
newsapi:WSNewsSourcesResponse result = check myclient->listSources(country="us");
```
