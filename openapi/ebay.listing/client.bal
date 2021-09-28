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

# This is a generated connector for [eBay Listing API v1_beta.3.0](https://developer.ebay.com) OpenAPI specification.
# '<span class="tablenote"><b>Note:</b> This is a <a href="https://developer.ebay.com/api-docs/static/versioning.html#limited" target="_blank"> 
#  <img src="/cms/img/docs/partners-api.svg" class="legend-icon partners-icon" title="Limited Release"  alt="Limited Release" />(Limited Release)</a> 
# 
# API available only to select developers approved by business units.</span><br /><br />Enables a seller adding an ad or item on a Partner''s site to automatically  create an eBay listing draft using the item details from the Partner''s site.'
@display {label: "eBay Listing", iconPath: "resources/ebay.listing.svg"} 
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [developer account](https://developer.ebay.com/api-docs/static/creating-edp-account.html)  and obtain tokens following [this guide](https://developer.ebay.com/api-docs/static/oauth-tokens.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.ebay.com/sell/listing/v1_beta") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    #
    # + xEbayCMarketplaceId - Use this header to specify an eBay marketplace ID. For a list of supported sites, see API Restrictions in the Listing API overview.
    # + contentLanguage - Use this header to specify the natural language of the seller. For details, see Content-Language in HTTP request headers. Required: For EBAY_CA in French. (Content-Language = fr-CA)
    # + return - OK
    remote isolated function createItemDraft(string xEbayCMarketplaceId, ItemDraft payload, string? contentLanguage = ()) returns ItemDraftResponse|error {
        string  path = string `/item_draft/`;
        map<any> headerValues = {"Content-Language": contentLanguage, "X-EBAY-C-MARKETPLACE-ID": xEbayCMarketplaceId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ItemDraftResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ItemDraftResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
