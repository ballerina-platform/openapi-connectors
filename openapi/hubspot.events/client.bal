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

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# These APIs allow accessing CRM object events.
@display {label: "HubSpot Events", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification. The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    # During initialization you can pass either http:BearerTokenConfig if you have a bearer token or http:OAuth2RefreshTokenGrantConfig if you have Oauth tokens.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a collection of events matching a query.
    #
    # + occurredAfter - The starting time as an ISO 8601 timestamp. 
    # + occurredBefore - The ending time as an ISO 8601 timestamp. 
    # + objectType - The type of object being selected. Valid values are hubspot named object types (e.g. `contact`). 
    # + objectId - The id of the selected object. If not present, then the `objectProperty` parameter is required. 
    # + eventType - Limits the response to the specified event type.  For example `&eventType=e_visited_page` returns only `e_visited_page` events.  If not present all event types are returned. 
    # + after - An additional parameter that may be used to get the next `limit` set of results. 
    # + before - An additional parameter that may be used to get the next `limit` set of results. 
    # + 'limit - The maximum number of events to return, defaults to 20. 
    # + sort - Selects the sort field and order. Defaults to ascending, prefix with `-` for descending order. `occurredAt` is the only field supported for sorting. 
    # + return - successful operation 
    remote isolated function listEvents(string objectType, int objectId, string? occurredAfter = (), string? occurredBefore = (), string? eventType = (), string? after = (), string? before = (), int? 'limit = (), string[]? sort = ()) returns ExternalUnifiedEventCollection|error {
        string resourcePath = string `/events/v3/events`;
        map<anydata> queryParam = {"occurredAfter": occurredAfter, "occurredBefore": occurredBefore, "objectType": objectType, "objectId": objectId, "eventType": eventType, "after": after, "before": before, "limit": 'limit, "sort": sort};
        map<Encoding> queryParamEncoding = {"sort": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ExternalUnifiedEventCollection response = check self.clientEp->get(resourcePath);
        return response;
    }
}
