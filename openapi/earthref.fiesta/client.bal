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
    http:CredentialsConfig auth;
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

# This is a generated connector for [EarthRef.org's FIESTA API v1.2.0](https://api.earthref.org/v1) OpenAPI Specification.
# 
# [EarthRef.org](https://earthref.org) is a geoscience umbrella website for several data repositories.
# These repositories, unified under the mandate to preserve their respective data and promote scientific collaboration 
# in their fields, are also disparate in their schemata.
# The Framework for Integrated Earth Science and Technology Applications (FIESTA) project is creating the tools to 
# easily customize and manage these geoscience repositories and the FIESTA API is a core component of that solution.
# 
# # Authentication
# 
# The API is served over HTTPS thereby making HTTP Basic Authentication secure.
# The credentials are the username and password of an active EarthRef.org user account and provide access to that user's 
# private workspace in any of EarthRef.org FIESTA repositories.
@display {label: "EarthRef FIESTA", iconPath: "resources/earthreffiesta.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [an EarthRef.org user account](https://earthref.org/) and obtain tokens following [this guide](https://www2.earthref.org/log-in).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.earthref.org") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Check the health of the API
    #
    # + return - Health check passed 
    remote isolated function checkHealth() returns InlineResponse200|error {
        string  path = string `/v1/health-check`;
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Authenticate a username and password
    #
    # + return - User Record 
    remote isolated function authenticate() returns string|error {
        string  path = string `/v1/authenticate`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Download the zip archive of files for one or more public contributions
    #
    # + repository - Repository 
    # + nMaxContributions - Maximum number of contributions to download in descending timestamp order 
    # + query - One or more Elasticsearch query strings to match any data model text field (https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#query-string-syntax) 
    # + id - One or more contribution IDs to match 
    # + doi - One or more reference DOIs to match 
    # + contributorName - One or more contributor names to match 
    # + return - A zip archive of files for the public contributions 
    remote isolated function downloadPublicFiles(string repository, int nMaxContributions = 10, string? query = (), int[]? id = (), string[]? doi = (), string[]? contributorName = ()) returns json|error {
        string  path = string `/v1/${repository}/download`;
        map<anydata> queryParam = {"n_max_contributions": nMaxContributions, "query": query, "id": id, "doi": doi, "contributor_name": contributorName};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Retrieve the data for a public or shared private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution to retrieve 
    # + 'key - The private key for retrieving a shared contribution 
    # + return - Rows are returned in the format requested by the accept header 
    remote isolated function getPublicContributionData(string repository, int? id = (), string? 'key = ()) returns string|error {
        string  path = string `/v1/${repository}/data`;
        map<anydata> queryParam = {"id": id, "key": 'key};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Retrieve public data rows
    #
    # + repository - Repository 
    # + 'table - Table name 
    # + nMaxRows - Max number of rows to return 
    # + 'from - Starting record number for paging 
    # + query - One or more Elasticsearch query strings to match any data model text field (https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html) 
    # + return - Rows are returned in the format requested by the accept header 
    remote isolated function getPublicTable(string repository, string 'table, int? nMaxRows = (), int? 'from = (), string[]? query = ()) returns string|error {
        string  path = string `/v1/${repository}/search/${'table}`;
        map<anydata> queryParam = {"n_max_rows": nMaxRows, "from": 'from, "query": query};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Validate a contribution
    #
    # + repository - Repository 
    # + payload - Request payload 
    # + return - The validation result was returned. 
    remote isolated function validateContribution(string repository, Body payload) returns json|error {
        string  path = string `/v1/${repository}/validate`;
        http:Request request = new;
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Download the zip archive of the files for a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution to download 
    # + return - A zip archive of files for the private contribution 
    remote isolated function downloadPrivateFiles(string repository, int id) returns json|error {
        string  path = string `/v1/${repository}/private/download`;
        map<anydata> queryParam = {"id": id};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Retrieve the data for a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution data to retrieve 
    # + return - Rows are returned in the format requested by the accept header 
    remote isolated function getPrivateContributionData(string repository, int id) returns string|error {
        string  path = string `/v1/${repository}/private/data`;
        map<anydata> queryParam = {"id": id};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Validate a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution data to validate 
    # + return - The validation result was returned. 
    remote isolated function validatePrivateContribution(string repository, int id) returns json|error {
        string  path = string `/v1/${repository}/private/validate`;
        map<anydata> queryParam = {"id": id};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(path, request, targetType = json);
        return response;
    }
    # Retrieve private data rows
    #
    # + repository - Repository 
    # + 'table - Table name 
    # + nMaxRows - Max number of rows to return 
    # + 'from - Starting record number for paging 
    # + query - One or more Elasticsearch query strings to match any data model text field (https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html) 
    # + return - Rows are returned in the format requested by the accept header. 
    remote isolated function getPrivateTable(string repository, string 'table, int? nMaxRows = (), int? 'from = (), string[]? query = ()) returns http:Response|error {
        string  path = string `/v1/${repository}/private/search/${'table}`;
        map<anydata> queryParam = {"n_max_rows": nMaxRows, "from": 'from, "query": query};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Update a private contribution
    #
    # + repository - Repository 
    # + id - Contribution IDs 
    # + payload - Request payload 
    # + return - The file(s) were uploaded to the contribution and are being processed. 
    remote isolated function updatePrivateContribution(string repository, int id, Body1 payload) returns InlineResponse202|error {
        string  path = string `/v1/${repository}/private`;
        map<anydata> queryParam = {"id": id};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        InlineResponse202 response = check self.clientEp->put(path, request, targetType=InlineResponse202);
        return response;
    }
    # Create a private contribution
    #
    # + repository - Repository 
    # + return - The private contribution was created. 
    remote isolated function createPrivateContribution(string repository) returns InlineResponse201|error {
        string  path = string `/v1/${repository}/private`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse201 response = check self.clientEp-> post(path, request, targetType = InlineResponse201);
        return response;
    }
    # Delete a private contribution
    #
    # + repository - Repository 
    # + id - Contribution IDs 
    # + return - The contribution was deleted. 
    remote isolated function deletePrivateContribution(string repository, int id) returns InlineResponse2001|error {
        string  path = string `/v1/${repository}/private`;
        map<anydata> queryParam = {"id": id};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse2001 response = check self.clientEp-> delete(path, request, targetType = InlineResponse2001);
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
