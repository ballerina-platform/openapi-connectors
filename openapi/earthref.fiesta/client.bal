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
@display {label: "EarthRef FIESTA", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [an EarthRef.org user account](https://earthref.org/) and obtain tokens following [this guide](https://www2.earthref.org/log-in).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.earthref.org") returns error? {
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
    # Check the health of the API
    #
    # + return - Health check passed 
    remote isolated function checkHealth() returns InlineResponse200|error {
        string resourcePath = string `/v1/health-check`;
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Authenticate a username and password
    #
    # + return - User Record 
    remote isolated function authenticate() returns string|error {
        string resourcePath = string `/v1/authenticate`;
        string response = check self.clientEp->get(resourcePath);
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
    remote isolated function downloadPublicFiles(string repository, int nMaxContributions = 10, string? query = (), int[]? id = (), string[]? doi = (), string[]? contributorName = ()) returns json|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/download`;
        map<anydata> queryParam = {"n_max_contributions": nMaxContributions, "query": query, "id": id, "doi": doi, "contributor_name": contributorName};
        map<Encoding> queryParamEncoding = {"id": {style: FORM, explode: true}, "doi": {style: FORM, explode: true}, "contributor_name": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        json? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the data for a public or shared private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution to retrieve 
    # + 'key - The private key for retrieving a shared contribution 
    # + return - Rows are returned in the format requested by the accept header 
    remote isolated function getPublicContributionData(string repository, int? id = (), string? 'key = ()) returns string|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/data`;
        map<anydata> queryParam = {"id": id, "key": 'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string? response = check self.clientEp->get(resourcePath);
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
    remote isolated function getPublicTable(string repository, string 'table, int? nMaxRows = (), int? 'from = (), string[]? query = ()) returns string|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/search/${getEncodedUri('table)}`;
        map<anydata> queryParam = {"n_max_rows": nMaxRows, "from": 'from, "query": query};
        map<Encoding> queryParamEncoding = {"query": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        string? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Validate a contribution
    #
    # + repository - Repository 
    # + payload - Request payload 
    # + return - The validation result was returned. 
    remote isolated function validateContribution(string repository, RepositoryValidateBody payload) returns json|error {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/validate`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Download the zip archive of the files for a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution to download 
    # + return - A zip archive of files for the private contribution 
    remote isolated function downloadPrivateFiles(string repository, int id) returns json|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private/download`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve the data for a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution data to retrieve 
    # + return - Rows are returned in the format requested by the accept header 
    remote isolated function getPrivateContributionData(string repository, int id) returns string|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private/data`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string? response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Validate a private contribution
    #
    # + repository - Repository 
    # + id - The ID of the contribution data to validate 
    # + return - The validation result was returned. 
    remote isolated function validatePrivateContribution(string repository, int id) returns json|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private/validate`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        json? response = check self.clientEp-> put(resourcePath, request);
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
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private/search/${getEncodedUri('table)}`;
        map<anydata> queryParam = {"n_max_rows": nMaxRows, "from": 'from, "query": query};
        map<Encoding> queryParamEncoding = {"query": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a private contribution
    #
    # + repository - Repository 
    # + id - Contribution IDs 
    # + payload - Request payload 
    # + return - The file(s) were uploaded to the contribution and are being processed. 
    remote isolated function updatePrivateContribution(string repository, int id, RepositoryPrivateBody payload) returns InlineResponse202|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        InlineResponse202? response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a private contribution
    #
    # + repository - Repository 
    # + return - The private contribution was created. 
    remote isolated function createPrivateContribution(string repository) returns InlineResponse201|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private`;
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse201? response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete a private contribution
    #
    # + repository - Repository 
    # + id - Contribution IDs 
    # + return - The contribution was deleted. 
    remote isolated function deletePrivateContribution(string repository, int id) returns InlineResponse2001|error? {
        string resourcePath = string `/v1/${getEncodedUri(repository)}/private`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001? response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
