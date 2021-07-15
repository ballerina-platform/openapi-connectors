## Overview

The Movie Database (TMDB) connector consume the data exposed in https://developers.themoviedb.org/3/. It is currently supporting the following operations.

- getPopularMovies
- getUpcomingMovies
- getMovieByMovieId
- getTopRatedTvShow
- getTvShowByDetails
- searchMovie
- searchTvShow

## Obtaining tokens

### Prerequisites

- The Movie Database (TMDB) account

### Obtaining tokens

To utilize The Movie Database (TMDB) API users have to obtain API key given by [TMDB](https://www.themoviedb.org/)

To obtain an API Key please follow these steps
* Go to [TMDB](https://www.themoviedb.org/) and create an account
* Click the "Settings"
* Click the "API" tab in the left sidebar
* Click "Create" or "click here" on the API page

Then provide the obtained API Key in client configuration.

## Quickstart

#### Step 1: Import The Movie Database (TMDB) module
First, import the ballerinax/themoviedb module into the Ballerina project.

```ballerina
import ballerinax/themoviedb;
```
#### Step 2: Configure the connection credentials.
```ballerina
themoviedb:ApiKeysConfig config = {
apiKeys : {
api_key : "<your appid>"
}
}

themoviedb:Client myclient = check new themoviedb:Client(config);
```
#### Step 3: Get Upcoming Movies

```ballerina
themoviedb:GetUpcomingMoviesResponse result = check myclient->getUpcomingMovies();
```

## Snippets
Snippets of some operations.

- Get Upcoming Movies
``` ballerina
themoviedb:GetUpcomingMoviesResponse result = check myclient->getUpcomingMovies();
```
- Get Popular Movies
``` ballerina
themoviedb:GetPopularMoviesResponse result = check myclient->getPopularMovies();
```
- Search Movies
``` ballerina
themoviedb:SearchMovieResponse result = check myclient->searchMovie("Thor");
```