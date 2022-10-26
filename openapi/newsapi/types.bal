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
    # All requests on the News API needs to include an API key. The API key can be provided as part of the query string or as a request header. The name of the API key needs to be `apiKey`
    @display {label: "", kind: "password"}
    string apiKey;
|};

# News API error response
public type WSNewsErrorResponse record {
    # If request was successful or not. Options: ok, error. In case of ok, below two properties will not be present
    string status?;
    # Short code identifying type of error returned
    string code?;
    # Fuller description of error, usually including how to fix it
    string message?;
};

# Record representing list sources
public type WSNewsSourcesResponse record {
    # If request was successful or not. Options: ok, error. In case of ok, below two properties will not be present
    string status?;
    # Results of request
    WSNewsSource[] sources?;
};

# Record representing a news article
public type WSNewsArticle record {
    # Record representing source of a news articles
    WSNewsSource 'source?;
    # Author of article
    string? author?;
    # Headline or title of article
    string title?;
    # Description or snippet from article
    string? description?;
    # Direct URL to article
    string? url?;
    # URL to a relevant image for article
    string? urlToImage?;
    # Date and time that article was published, in UTC (+000)
    string publishedAt?;
    # Unformatted content of article, where available. This is truncated to 200 chars
    string? content?;
};

# Record representing source of a news articles
public type WSNewsSource record {
    # Identifier of news source. You can use this with our other endpoints
    string? id?;
    # Name of news source
    string name?;
    # Description of news source
    string description?;
    # URL of homepage
    string url?;
    # Find sources that display news of this category. Default: all categories
    string category?;
    # Find sources that display news in a specific language. Possible options: ar de en es fr he it nl no pt ru se ud zh .Default: all languages
    string language?;
    # Find sources that display news in a specific country. Default: all countries
    string country?;
};

# Record representing top headlines
public type WSNewsTopHeadlineResponse record {
    # If request was successful or not. Options: ok, error. In case of error a code and message property will be populated
    string status?;
    # Total number of results available for request. Only a limited number are shown at a time though, so use page parameter in requests to page through them
    int totalResults?;
    # Results of request
    WSNewsArticle[] articles?;
};
