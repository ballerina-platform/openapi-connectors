Connects to The Movie Database (TMDB) from Ballerina.

## Module Overview

The The Movie Database (TMDB) connector consume the data exposed in https://developers.themoviedb.org/3/. It is currently supporting the following operations.

- getPopularMovies
- getUpcomingMovies
- getMovieByMovieId
- getTopRatedTvShow
- getTvShowByDetails
- searchMovie
- searchTvShow


## Compatibility

| Ballerina Language Versions  |   The Movie Database (TMDB) API   |
|:----------------------------:|:---------------------------------:|
|       Swan Lake Alpha 5      |                V3                 |

# Quickstart

## Authorization

To utilize The Movie Database (TMDB) API users have to obtain API key given by [TMDB](https://www.themoviedb.org/)

To obtain an API Key please follow these steps
* Go to [TMDB](https://www.themoviedb.org/) and create an account
* Click the "Settings"
* Click the "API" tab in the left sidebar
* Click "Create" or "click here" on the API page

Then provide the obtained API Key in client configuration.

### Client configuration

```ballerina
    import ballerinax/themoviedb;

    ApiKeysConfig config = {
        apiKeys : {
            api_key : "<your appid>"
        }
    }

    themoviedb:Client myclient = check new themoviedb:Client(config);

};
```
### Get Upcoming Movies

```ballerina
    GetUpcomingMoviesResponse result = check myclient->getUpcomingMovies();
    log:printInfo(result.toString());
```
