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

# This is a generated connector for [Xero Bank Feeds API v2.16.0](https://developer.xero.com/documentation/api/bankfeeds/overview) OpenAPI specification.
# The Bank Feeds API is a closed API that is only available to financial institutions that have an established financial services partnership with Xero.
# If you're an existing financial services partner that wants access, contact your local Partner Manager.
# If you're a financial institution who wants to provide bank feeds to your business customers, contact xero to become a financial services partner.
@display {label: "Xero Bank Feeds", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.xero.com/bankfeeds.xro/1.0") returns error? {
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
    # Searches for feed connections
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + page - Page number which specifies the set of records to retrieve. By default the number of the records per set is 10. Example - https://api.xero.com/bankfeeds.xro/1.0/FeedConnections?page=1 to get the second set of the records. When page value is not a number or a negative number, by default, the first set of records is returned. 
    # + pageSize - Page size which specifies how many records per page will be returned (default 10). Example - https://api.xero.com/bankfeeds.xro/1.0/FeedConnections?pageSize=100 to specify page size of 100. 
    # + return - search results matching criteria returned with pagination and items array 
    remote isolated function getFeedConnections(string xeroTenantId, int? page = (), int? pageSize = ()) returns FeedConnections|error {
        string resourcePath = string `/FeedConnections`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FeedConnections response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create one or more new feed connection
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Feed Connection(s) array object in the body 
    # + return - success new feed connection(s)response 
    remote isolated function createFeedConnections(string xeroTenantId, FeedConnections payload) returns FeedConnections|error {
        string resourcePath = string `/FeedConnections`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FeedConnections response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve single feed connection based on a unique id provided
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + id - Unique identifier for retrieving single object 
    # + return - success returns a FeedConnection object matching the id in response 
    remote isolated function getFeedConnection(string xeroTenantId, string id) returns FeedConnection|error {
        string resourcePath = string `/FeedConnections/${getEncodedUri(id)}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FeedConnection response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete an existing feed connection
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Feed Connections array object in the body 
    # + return - Success response for deleted feed connection 
    remote isolated function deleteFeedConnections(string xeroTenantId, FeedConnections payload) returns FeedConnections|error {
        string resourcePath = string `/FeedConnections/DeleteRequests`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FeedConnections response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all statements
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + page - unique id for single object 
    # + pageSize - Page size which specifies how many records per page will be returned (default 10). Example - https://api.xero.com/bankfeeds.xro/1.0/Statements?pageSize=100 to specify page size of 100. 
    # + xeroApplicationId - Xero-Application-Id 
    # + xeroUserId - Xero-User-Id 
    # + return - success returns Statements array of objects response 
    remote isolated function getStatements(string xeroTenantId, int? page = (), int? pageSize = (), string xeroApplicationId = "00000000-0000-0000-0000-0000000010000", string xeroUserId = "00000000-0000-0000-0000-0000030000000") returns Statements|error {
        string resourcePath = string `/Statements`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId, "Xero-Application-Id": xeroApplicationId, "Xero-User-Id": xeroUserId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Statements response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates one or more new statements
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Statements array of objects in the body 
    # + return - Success returns Statements array of objects in response 
    remote isolated function createStatements(string xeroTenantId, Statements payload) returns Statements|error {
        string resourcePath = string `/Statements`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Statements response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve single statement based on unique id provided
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + statementId - statement id for single object 
    # + return - search results matching id for single statement 
    remote isolated function getStatement(string xeroTenantId, string statementId) returns Statement|error {
        string resourcePath = string `/Statements/${getEncodedUri(statementId)}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Statement response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
