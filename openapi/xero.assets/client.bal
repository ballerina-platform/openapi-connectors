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
    string refreshUrl = "https://identity.xero.com/connect/token";
|};

# This is a generated connector for [Xero Assets API v2.9.4](https://developer.xero.com/documentation/api/assets/overview/) OpenAPI specification.
# The Assets API exposes fixed asset related functions of the Xero Accounting application and can be used for a variety of purposes such as creating assets, retrieving asset valuations etc.
@display {label: "Xero Assets", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://www.xero.com/signup/api/) and obtain tokens following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/assets.xro/1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # searches fixed asset types
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + return - search results matching criteria 
    remote isolated function getAssetTypes(string xeroTenantId) returns AssetType[]|error {
        string resourcePath = string `/AssetTypes`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AssetType[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # adds a fixed asset type
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Asset type to add 
    # + return - results single object -  created fixed type 
    remote isolated function createAssetType(string xeroTenantId, AssetType payload) returns AssetType|error {
        string resourcePath = string `/AssetTypes`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssetType response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # searches fixed asset
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + status - Required when retrieving a collection of assets. See Asset Status Codes 
    # + page - Results are paged. This specifies which page of the results to return. The default page is 1. 
    # + pageSize - The number of records returned per page. By default the number of records returned is 10. 
    # + orderBy - Requests can be ordered by AssetType, AssetName, AssetNumber, PurchaseDate and PurchasePrice. If the asset status is DISPOSED it also allows DisposalDate and DisposalPrice. 
    # + sortDirection - ASC or DESC 
    # + filterBy - A string that can be used to filter the list to only return assets containing the text. Checks it against the AssetName, AssetNumber, Description and AssetTypeName fields. 
    # + return - search results matching criteria 
    remote isolated function getAssets(string xeroTenantId, AssetStatusQueryParam status, int? page = (), int? pageSize = (), string? orderBy = (), string? sortDirection = (), string? filterBy = ()) returns Assets|error {
        string resourcePath = string `/Assets`;
        map<anydata> queryParam = {"status": status, "page": page, "pageSize": pageSize, "orderBy": orderBy, "sortDirection": sortDirection, "filterBy": filterBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Assets response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # adds a fixed asset
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Fixed asset you are creating 
    # + return - return single object - create new asset 
    remote isolated function createAsset(string xeroTenantId, Asset payload) returns Asset|error {
        string resourcePath = string `/Assets`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Asset response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieves fixed asset by id
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + id - fixed asset id for single object 
    # + return - search results matching criteria 
    remote isolated function getAssetById(string xeroTenantId, string id) returns Asset|error {
        string resourcePath = string `/Assets/${getEncodedUri(id)}`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Asset response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # searches fixed asset settings
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + return - search results matching criteria 
    remote isolated function getAssetSettings(string xeroTenantId) returns Setting|error {
        string resourcePath = string `/Settings`;
        map<any> headerValues = {"xero-tenant-id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Setting response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
