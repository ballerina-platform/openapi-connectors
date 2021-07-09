Connects to News API from Ballerina.

## Module Overview

News API connector consume the data exposed in https://newsapi.org/v2. It is currently supporting the following operations.

- listArticles
- listTopHeadlines
- listSources

## Compatibility

| Ballerina Language Versions  |             News API              |
|:----------------------------:|:---------------------------------:|
|       Swan Lake Alpha 5      |                V2                 |

# Quickstart

## Authorization

To utilize News API users have to obtain API key given by [News API](https://newsapi.org/register)

To obtain an API Key please follow these steps
* Go to [News API](https://newsapi.org/) and register a new account
* Submit information in register form
* After submitting needed information API Key can be obtained

Then provide the obtained API Key in client configuration.

### Client configuration

```ballerina
    import ballerinax/newsapi;

    ApiKeysConfig config = {
        apiKeys : {
            apiKey : "<your apiKey>"
        }
    }

    newsapi:Client myclient = check new newsapi:Client(config, {}, "https://newsapi.org/v2");
};
```
### Get Top Headlines

```ballerina
    WSNewsTopHeadlineResponse result = check myclient->listTopHeadlines(country="us");
    log:printInfo(result.toString());
```

### Get Top Articles

```ballerina
    WSNewsTopHeadlineResponse articleResult = check myclient->listArticles(1, 5, domains="bbc.co.uk");
    log:printInfo(articleResult.toString());    
```
