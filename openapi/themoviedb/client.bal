// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the TMDB API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `api_key`
    string apiKey;
|};

# This is a generated connector for [The Movie Database (TMDB) API v3](https://www.themoviedb.org/documentation/api) OpenAPI specification.
# The Movie Database (TMDB) API provide data about movies and tv shows around the world.
@display {label: "The Movie Database (TMDB)", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Request a [TMDB Account](https://www.themoviedb.org/signup) and obtain tokens following [this guide](https://developers.themoviedb.org/3/getting-started/introduction).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.themoviedb.org/3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get Popular Movies
    #
    # + return - Get popular movies response 
    @display {label: "Get Popular Movies"}
    remote isolated function getPopularMovies() returns InlineResponse200|error {
        string resourcePath = string `/movie/popular`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Upcoming Movies
    #
    # + return - Get upcoming movies response 
    @display {label: "Get Upcoming Movies"}
    remote isolated function getUpcomingMovies() returns InlineResponse2001|error {
        string resourcePath = string `/movie/upcoming`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Movie Details
    #
    # + movieId - Movie ID 
    # + return - Get movie by movie ID response 
    @display {label: "Get Movie Details"}
    remote isolated function getMovieByMovieId(@display {label: "Movie ID"} int movieId) returns InlineResponse2002|error {
        string resourcePath = string `/movie/${getEncodedUri(movieId)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Top Rated
    #
    # + return - Get top rated TV show response 
    @display {label: "Get Top Rated TV Shows"}
    remote isolated function getTopRatedTvShow() returns InlineResponse2003|error {
        string resourcePath = string `/tv/top_rated`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Details
    #
    # + tvId - TV show ID 
    # + seasonNumber - TV show season number 
    # + episodeNumber - TV show episode number 
    # + return - Get TV show by details response 
    @display {label: "Get TV Show Episode"}
    remote isolated function getTvShowEpisode(@display {label: "TV Show ID"} int tvId, @display {label: "Season Number"} int seasonNumber, @display {label: "Episode Number"} int episodeNumber) returns InlineResponse2004|error {
        string resourcePath = string `/tv/${getEncodedUri(tvId)}/season/${getEncodedUri(seasonNumber)}/episode/${getEncodedUri(episodeNumber)}`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search Movies
    #
    # + query - Text query to search 
    # + year - Release year of movie 
    # + return - Search movie response 
    @display {label: "Search Movies"}
    remote isolated function searchMovie(@display {label: "Search Text Query"} string query, @display {label: "Movie Release Year"} int? year = ()) returns InlineResponse200|error {
        string resourcePath = string `/search/movie`;
        map<anydata> queryParam = {"query": query, "year": year, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search TV Shows
    #
    # + query - Text query to search 
    # + firstAirDateYear - First air date 
    # + return - Search TV show response 
    @display {label: "Search TV Shows"}
    remote isolated function searchTvShow(@display {label: "Search Text Query"} string query, @display {label: "First Air Date"} int? firstAirDateYear = ()) returns InlineResponse2003|error {
        string resourcePath = string `/search/tv`;
        map<anydata> queryParam = {"query": query, "firstAirDateYear": firstAirDateYear, "api_key": self.apiKeyConfig.apiKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
