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

# This is a generated connector for [Xero Bank Feeds API v2.16.0](https://developer.xero.com/documentation/api/bankfeeds/overview) OpenAPI specification.
# The Bank Feeds API is a closed API that is only available to financial institutions that have an established financial services partnership with Xero.
# If you're an existing financial services partner that wants access, contact your local Partner Manager.
# If you're a financial institution who wants to provide bank feeds to your business customers, contact xero to become a financial services partner.
@display {label: "Xero Bank Feeds", iconPath: "resources/xero.bankfeeds.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/bankfeeds.xro/1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Searches for feed connections
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + page - Page number which specifies the set of records to retrieve. By default the number of the records per set is 10. Example - https://api.xero.com/bankfeeds.xro/1.0/FeedConnections?page=1 to get the second set of the records. When page value is not a number or a negative number, by default, the first set of records is returned. 
    # + pageSize - Page size which specifies how many records per page will be returned (default 10). Example - https://api.xero.com/bankfeeds.xro/1.0/FeedConnections?pageSize=100 to specify page size of 100. 
    # + return - search results matching criteria returned with pagination and items array 
    remote isolated function getFeedConnections(string xeroTenantId, int? page = (), int? pageSize = ()) returns FeedConnections|error {
        string  path = string `/FeedConnections`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeedConnections response = check self.clientEp-> get(path, accHeaders, targetType = FeedConnections);
        return response;
    }
    # Create one or more new feed connection
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Feed Connection(s) array object in the body 
    # + return - success new feed connection(s)response 
    remote isolated function createFeedConnections(string xeroTenantId, FeedConnections payload) returns FeedConnections|error {
        string  path = string `/FeedConnections`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeedConnections response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeedConnections);
        return response;
    }
    # Retrieve single feed connection based on a unique id provided
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + id - Unique identifier for retrieving single object 
    # + return - success returns a FeedConnection object matching the id in response 
    remote isolated function getFeedConnection(string xeroTenantId, string id) returns FeedConnection|error {
        string  path = string `/FeedConnections/${id}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FeedConnection response = check self.clientEp-> get(path, accHeaders, targetType = FeedConnection);
        return response;
    }
    # Delete an existing feed connection
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Feed Connections array object in the body 
    # + return - Success response for deleted feed connection 
    remote isolated function deleteFeedConnections(string xeroTenantId, FeedConnections payload) returns FeedConnections|error {
        string  path = string `/FeedConnections/DeleteRequests`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FeedConnections response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FeedConnections);
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
        string  path = string `/Statements`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId, "Xero-Application-Id": xeroApplicationId, "Xero-User-Id": xeroUserId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Statements response = check self.clientEp-> get(path, accHeaders, targetType = Statements);
        return response;
    }
    # Creates one or more new statements
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Statements array of objects in the body 
    # + return - Success returns Statements array of objects in response 
    remote isolated function createStatements(string xeroTenantId, Statements payload) returns Statements|error {
        string  path = string `/Statements`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Statements response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Statements);
        return response;
    }
    # Retrieve single statement based on unique id provided
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + statementId - statement id for single object 
    # + return - search results matching id for single statement 
    remote isolated function getStatement(string xeroTenantId, string statementId) returns Statement|error {
        string  path = string `/Statements/${statementId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Statement response = check self.clientEp-> get(path, accHeaders, targetType = Statement);
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
