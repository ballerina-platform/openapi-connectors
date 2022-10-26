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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # All requests on the TMDB API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `api_key`
    @display {label: "", kind: "password"}
    string apiKey;
|};

# Crew details of TV show
public type Crew record {
    # Crew ID
    int id;
    # Credit ID of crew
    string credit_id?;
    # Name of the crew
    string name;
    # Crew department
    string department?;
    # Job of the crew
    string job?;
    # Profile image path
    string? profile_path?;
};

# Release date range
public type ReleaseDateRange record {
    # Maximum date of release
    string maximum;
    # Minimum date of release
    string minimum;
};

# Movie list object
public type MovieListObject record {
    # Poster image path
    string? poster_path?;
    # Adult content or not
    boolean adult?;
    # Overview of movie
    string overview;
    # Release date
    string release_date?;
    # Genre IDs of movie
    int[] genre_ids?;
    # Movie ID
    int id;
    # Original title
    string original_title?;
    # Original language
    string original_language?;
    # Title of movie
    string title;
    # Backdrop image path
    string? backdrop_path?;
    # Popularity of movie
    decimal popularity?;
    # Vote count
    int vote_count?;
    # Video available or not
    boolean video?;
    # Vote average
    decimal vote_average?;
};

public type InlineResponse200 record {
    # Specify which page to query
    int page;
    # Movie List Object
    MovieListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

public type InlineResponse401 record {
    string status_message?;
    int status_code?;
};

# Guest star details of TV show
public type GuestStar record {
    # Guest star ID
    int id;
    # Name of the guest star
    string name;
    # Credit ID of guest star
    string credit_id?;
    # Character of guest star
    string character?;
    # Order of guest star
    string 'order?;
    # Profile image path
    string? profile_path?;
};

# TV list object
public type TvListObject record {
    # Poster image path
    string? poster_path?;
    # Popularity of TV show
    decimal popularity?;
    # TV show ID
    int id;
    # Backdrop image path
    string? backdrop_path?;
    # Vote average
    decimal vote_average?;
    # Overview of TV show
    string overview;
    # First air date of TV show
    string first_air_date?;
    # Origin country
    string[] origin_country?;
    # Genre IDs of TV show
    int[] genre_ids?;
    # Original language
    string original_language?;
    # Vote count
    int vote_count?;
    # Name
    string name;
    # Original name of TV show
    string original_name?;
};

# Production company
public type ProductionCompany record {
    # Production company name
    string name;
    # Production company ID
    int id;
    # Country of production company
    string? origin_country?;
};

public type InlineResponse2001 record {
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

public type InlineResponse2003 record {
    # Specify which page to query
    int page;
    # TV List Object
    TvListObject[] results;
    # Total number of results
    int total_results;
    # Total number of pages
    int total_pages;
};

# Genere of movie
public type Genre record {
    # Genre ID
    int id;
    # Genre name
    string name;
};

public type InlineResponse2002 record {
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

# Spoken language
public type SpokenLanguage record {
    # Standard for representation of languages
    string iso_639_1;
    # Spoken language name
    string name;
};

public type InlineResponse2004 record {
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

# Production country
public type ProductionCountry record {
    # Standard for representation of country names
    string iso_3166_1;
    # Production country name
    string name;
};
