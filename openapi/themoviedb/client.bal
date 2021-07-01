// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://wwww.themoviedb.org/) and obtain an `API Key` in the settings.
#
# + apiKeys - Provide your API Key as `api_key`. Eg: `{"api_key" : "<Your API Key>"}` 
public type ApiKeysConfig record {
    map<string|string[]> apiKeys;
};

# Get popular movies response
public type GetPopularMoviesResponse record {
    # Specify which page to query
    int page;
    # Movie List Object
    MovieListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

# Get upcoming movies response
public type GetUpcomingMoviesResponse record {
    # Specify which page to query
    int page;
    # Movie List Object
    MovieListObject[] results;
    # Release date range
    ReleaseDateRange dates;
    # Total number of pages
    int total_pages;
    # Total number of results
    anydata total_results;
};

# Get movie by movie ID response
public type GetMovieByMovieIdResponse record {
    # Adult content or not
    boolean adult?;
    # Backdrop image path
    string? backdrop_path?;
    # Budget of movie
    int budget?;
    # Genres of movie
    Genre[] genres?;
    # Movie ID
    int id;
    # Original language of movie
    string original_language?;
    # Original title of movie
    string original_title?;
    # Popularity of movie
    decimal popularity?;
    # Poster image path
    string? poster_path?;
    # Movie production companies
    ProductionCompany[] production_companies?;
    # Countries where movie produced
    ProductionCountry[] production_countries?;
    # Release date of movie
    string release_date?;
    # Revenue genereted by movie
    int revenue?;
    # Languages spoken in movie
    SpokenLanguage[] spoken_languages?;
    # Status of movie
    string status?;
    # Title of movie
    string title;
    # Contain videos or not
    boolean video?;
    # Vote average
    decimal vote_average?;
    # Vote count
    int vote_count?;
};

# Get top rated TV show response
public type GetTopRatedTvShowResponse record {
    # Specify which page to query
    int page;
    # TV List Object
    TvListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

# Get TV show by details response
public type GetTvShowEpisodeResponse record {
    # Air date of TV show
    string air_date?;
    # Crew details of TV show
    Crew[] crew;
    # Episode number
    int episode_number;
    # Guest stars in TV show
    GuestStar[] guest_stars?;
    # Crew details of TV show
    string name;
    # Overview of TV show
    string overview;
    # TV show ID
    int id;
    # Season number
    int season_number;
    # Still path
    string? still_path?;
    # Vote average
    decimal vote_average?;
    # Vote count
    int vote_count?;
};

# Search movie response
public type SearchMovieResponse record {
    # Specify which page to query
    int page;
    # Movie List Object
    MovieListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

# Search TV show response
public type SearchTvShowResponse record {
    # Specify which page to query
    int page;
    # TV List Object
    TvListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

# The Movie Database (TMDB) Client object
#
# + clientEp - Connector http endpoint
@display {label: "The Movie Database (TMDB) Client"}
public client class Client {
    http:Client clientEp;
    map<string|string[]> apiKeys;
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, 
                                  string serviceUrl = "https://api.themoviedb.org/3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Get Popular Movies
    #
    # + return - Get popular movies response
    @display {label: "Get Popular Movies"}
    remote isolated function getPopularMovies() returns GetPopularMoviesResponse|error {
        string  path = string `/movie/popular`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        GetPopularMoviesResponse response = check self.clientEp-> get(path, targetType = GetPopularMoviesResponse);
        return response;
    }
    # Get Upcoming Movies
    #
    # + return - Get upcoming movies response
    @display {label: "Get Upcoming Movies"}
    remote isolated function getUpcomingMovies() returns GetUpcomingMoviesResponse|error {
        string  path = string `/movie/upcoming`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        GetUpcomingMoviesResponse response = check self.clientEp-> get(path, targetType = GetUpcomingMoviesResponse);
        return response;
    }
    # Get Movie Details
    #
    # + movie_id - Movie ID
    # + return - Get movie by movie ID response
    @display {label: "Get Movie Details"}
    remote isolated function getMovieByMovieId(@display {label: "Movie ID"} int movie_id) returns GetMovieByMovieIdResponse|error {
        string  path = string `/movie/${movie_id}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        GetMovieByMovieIdResponse response = check self.clientEp-> get(path, targetType = GetMovieByMovieIdResponse);
        return response;
    }
    # Get Top Rated
    #
    # + return - Get top rated TV show response
    @display {label: "Get Top Rated TV Shows"}
    remote isolated function getTopRatedTvShow() returns GetTopRatedTvShowResponse|error {
        string  path = string `/tv/top_rated`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        GetTopRatedTvShowResponse response = check self.clientEp-> get(path, targetType = GetTopRatedTvShowResponse);
        return response;
    }
    # Get Details
    #
    # + tv_id - TV show ID
    # + season_number - TV show season number
    # + episode_number - TV show episode number
    # + return - Get TV show by details response
    @display {label: "Get TV Show Episode"}
    remote isolated function getTvShowEpisode(@display {label: "TV Show ID"} int tv_id, @display {label: "Season Number"} int season_number, @display {label: "Episode Number"} int episode_number) returns GetTvShowEpisodeResponse|error {
        string  path = string `/tv/${tv_id}/season/${season_number}/episode/${episode_number}`;
        map<anydata> queryParam = {api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        GetTvShowEpisodeResponse response = check self.clientEp-> get(path, targetType = GetTvShowEpisodeResponse);
        return response;
    }
    # Search Movies
    #
    # + query - Text query to search
    # + year - Release year of movie
    # + return - Search movie response
    @display {label: "Search Movies"}
    remote isolated function searchMovie(@display {label: "Search Text Query"} string query, @display {label: "Movie Release Year"} int? year = ()) returns SearchMovieResponse|error {
        string  path = string `/search/movie`;
        map<anydata> queryParam = {"query": query, "year": year, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        SearchMovieResponse response = check self.clientEp-> get(path, targetType = SearchMovieResponse);
        return response;
    }
    # Search TV Shows
    #
    # + query - Text query to search
    # + firstAirDateYear - First air date
    # + return - Search TV show response
    @display {label: "Search TV Shows"}
    remote isolated function searchTvShow(@display {label: "Search Text Query"} string query, @display {label: "First Air Date"} int? firstAirDateYear = ()) returns SearchTvShowResponse|error {
        string  path = string `/search/tv`;
        map<anydata> queryParam = {"query": query, "firstAirDateYear": firstAirDateYear, api_key: self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        SearchTvShowResponse response = check self.clientEp-> get(path, targetType = SearchTvShowResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam) returns string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
