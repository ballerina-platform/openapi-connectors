## Overview

This is a generated connector for [The Movie Database (TMDB) API v3](https://www.themoviedb.org/documentation/api) OpenAPI specification. 

The Movie Database (TMDB) API provide data about movies and tv shows around the world.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [TMDB Account](https://www.themoviedb.org/signup)
* Obtaining tokens
    1. Log into [TMDB Account](https://www.themoviedb.org/login)
    2. Click the `Settings`
    3. Click the `API` tab in the left sidebar
    4. Click `Create` or `click here` on the API page

## Quickstart

### Step 1: Import connector
Import the ballerinax/themoviedb module into the Ballerina project.

```ballerina
import ballerinax/themoviedb;
```
### Step 2: Create a new connector instance
```ballerina
themoviedb:ApiKeysConfig config = {
    apiKeys : {
        api_key : "<your appid>"
    }
}

themoviedb:Client myclient = check new themoviedb:Client(config);
```
### Step 3: Invoke connector operation
1. You can get list of upcoming movies as follows with `getUpcomingMovies` method. Successful creation returns the created `GetUpcomingMoviesResponse` and the error cases returns an `error` object.
    ```ballerina
    themoviedb:GetUpcomingMoviesResponse result = check myclient->getUpcomingMovies();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
