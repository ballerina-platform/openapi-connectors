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
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

# A collection of Events
public type ExternalUnifiedEventCollection record {
    # Array of results
    ExternalUnifiedEvent[] results;
    # Pagination data
    Paging paging?;
};

# Used to represent any event. With this format, the `objectType` and `eventType` values are stringified CRM types. Example object:
# <br/>
# ```
#  {
#       "objectType": "CONTACT",
#       "objectId": 208451632,
#       "eventType": "e_visited_page",
#       "occurredAt": 1567377501421,
#       "id": "leviathan-be3335d3-46f1-3985-988e-ff38e6e7b9d8",
#       "properties": {
#           "hs_url": "https://some-website.com/",
#           "hs_title": "Home",
#           "hs_referrer": "https://some-other-website.com/blog/why-we-love-big-data-and-you-should-too",
#           "hs_userAgent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36",
#           "hs_city": "lund",
#           "hs_region": "m",
#           "hs_country": "se",
#           "hs_session_id" : "leviathan-be3335d3-46f1-3985-988e-ff38e6e7b9d8",
#           "hs_session_source" : "DIRECT"
#       }
#   }      
# ```
public type ExternalUnifiedEvent record {
    # The objectType for the object which did the event.
    string objectType;
    # The objectId of the object which did the event.
    string objectId;
    # The format of the `eventType` string is `ae{appId}_{eventTypeLabel}`, `pe{portalId}_{eventTypeLabel}`, or just `e_{eventTypeLabel}` for HubSpot events.
    string eventType;
    # An ISO 8601 timestamp when the event occurred.
    string occurredAt;
    # A unique identifier for the event.
    string id;
    # External event properties.
    record {} properties;
};

# Pagination data
public type Paging record {
    # Next Page info
    NextPage next?;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

# Next Page info
public type NextPage record {
    # Page after
    string after;
    # Page link
    string link?;
};
