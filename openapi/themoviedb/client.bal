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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [The Movie Database (TMDB) API v3](https://www.themoviedb.org/documentation/api) OpenAPI specification.
# The Movie Database (TMDB) API provide data about movies and tv shows around the world.
@display {label: "The Movie Database (TMDB) Client"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Request a [TMDB Account](https://www.themoviedb.org/signup) and obtain tokens following [this guide](https://developers.themoviedb.org/3/getting-started/introduction).
    #
    # + apiKeyConfig - Provide your API key as `api_key`. Eg: `{"api_key" : "<your API key >"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.themoviedb.org/3") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Get Popular Movies
    #
    # + return - Get popular movies response
    @display {label: "Get Popular Movies"}
    remote isolated function getPopularMovies() returns InlineResponse200|error {
        string  path = string `/movie/popular`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Get Upcoming Movies
    #
    # + return - Get upcoming movies response
    @display {label: "Get Upcoming Movies"}
    remote isolated function getUpcomingMovies() returns InlineResponse2001|error {
        string  path = string `/movie/upcoming`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Get Movie Details
    #
    # + movieId - Movie ID
    # + return - Get movie by movie ID response
    @display {label: "Get Movie Details"}
    remote isolated function getMovieByMovieId(@display {label: "Movie ID"} int movieId) returns InlineResponse2002|error {
        string  path = string `/movie/${movieId}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp-> get(path, targetType = InlineResponse2002);
        return response;
    }
    # Get Top Rated
    #
    # + return - Get top rated TV show response
    @display {label: "Get Top Rated TV Shows"}
    remote isolated function getTopRatedTvShow() returns InlineResponse2003|error {
        string  path = string `/tv/top_rated`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
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
        string  path = string `/tv/${tvId}/season/${seasonNumber}/episode/${episodeNumber}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp-> get(path, targetType = InlineResponse2004);
        return response;
    }
    # Search Movies
    #
    # + query - Text query to search
    # + year - Release year of movie
    # + return - Search movie response
    @display {label: "Search Movies"}
    remote isolated function searchMovie(@display {label: "Search Text Query"} string query, @display {label: "Movie Release Year"} int? year = ()) returns InlineResponse200|error {
        string  path = string `/search/movie`;
        map<anydata> queryParam = {"query": query, "year": year, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Search TV Shows
    #
    # + query - Text query to search
    # + firstAirDateYear - First air date
    # + return - Search TV show response
    @display {label: "Search TV Shows"}
    remote isolated function searchTvShow(@display {label: "Search Text Query"} string query, @display {label: "First Air Date"} int? firstAirDateYear = ()) returns InlineResponse2003|error {
        string  path = string `/search/tv`;
        map<anydata> queryParam = {"query": query, "firstAirDateYear": firstAirDateYear, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
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
