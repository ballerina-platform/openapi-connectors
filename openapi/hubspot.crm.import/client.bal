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
import ballerina/mime;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
@display {label: "HubSpot CRM Import", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get active imports
    #
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + before - The paging cursor token from second page onwards will be returned as the `paging.next.before` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + return - successful operation 
    remote isolated function getPage(string? after = (), string? before = (), int? 'limit = ()) returns PublicImportCollectionResponse|error {
        string resourcePath = string `/crm/v3/imports/`;
        map<anydata> queryParam = {"after": after, "before": before, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PublicImportCollectionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start a new import
    #
    # + payload - Data import resourses 
    # + return - successful operation 
    remote isolated function create(V3ImportsBody payload) returns PublicImportResponse|error {
        string resourcePath = string `/crm/v3/imports/`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        PublicImportResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the information on any import
    #
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function getById(int importId) returns PublicImportResponse|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}`;
        PublicImportResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Cancel an active import
    #
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function cancel(int importId) returns ActionResponse|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}/cancel`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    #
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + importId - Import ID 
    # + return - successful operation 
    remote isolated function errors(int importId, string? after = (), int? 'limit = ()) returns PublicImportErrorCollection|error {
        string resourcePath = string `/crm/v3/imports/${getEncodedUri(importId)}/errors`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PublicImportErrorCollection response = check self.clientEp->get(resourcePath);
        return response;
    }
}
