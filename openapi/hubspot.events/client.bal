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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. 
# These APIs allow accessing CRM object events.
@display {label: "HubSpot Events", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    # During initialization you can pass either http:BearerTokenConfig if you have a bearer token or http:OAuth2RefreshTokenGrantConfig if you have Oauth tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns a collection of events matching a query.
    #
    # + objectType - The type of object being selected. Valid values are hubspot named object types (e.g. `contact`).
    # + objectId - The id of the selected object. If not present, then the `objectProperty` parameter is required.
    # + occurredAfter - The starting time as an ISO 8601 timestamp.
    # + occurredBefore - The ending time as an ISO 8601 timestamp.
    # + eventType - Limits the response to the specified event type.  For example `&eventType=e_visited_page` returns only `e_visited_page` events.  If not present all event types are returned.
    # + after - An additional parameter that may be used to get the next `limit` set of results.
    # + before- An additional parameter that may be used to get the next `limit` set of results.
    # + 'limit - The maximum number of events to return, defaults to 20.
    # + sort - Selects the sort field and order. Defaults to ascending, prefix with `-` for descending order. `occurredAt` is the only field supported for sorting.
    # + return - successful operation
    remote isolated function listEvents(string objectType, int? objectId = (), string? occurredAfter = (), string? occurredBefore = (), string? eventType = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = ()) returns CollectionResponseExternalUnifiedEvent|error {
        string  path = string `/events/v3/events`;
        map<anydata> queryParam = {"occurredAfter": occurredAfter, "occurredBefore": occurredBefore, "objectType": objectType, "objectId": objectId, "eventType": eventType, "after": after, "before": before, "limit": 'limit, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseExternalUnifiedEvent response = check self.clientEp-> get(path, targetType = CollectionResponseExternalUnifiedEvent);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
