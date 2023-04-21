// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for the `Vector Operations` under [Pinecone Vector Database API](https://docs.pinecone.io/reference) OpenAPI specification. Pinecone is a fully managed vector database which supports building developer-friendly, easily scalable, and high-performance vector search applications without infrastructure hassles.
@display {label: "Pinecone Vector", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a new project in [Pinecone](https://www.pinecone.io/) and obtain an API Key.
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Describe Index Stats
    #
    # + return - A successful response 
    @display {label: "Describe Index Stats"}
    resource isolated function post describe_index_stats(DescribeIndexStatsRequest payload) returns DescribeIndexStatsResponse|error {
        string resourcePath = string `/describe_index_stats`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DescribeIndexStatsResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Query
    #
    # + return - A successful response 
    @display {label: "Query"}
    resource isolated function post query(QueryRequest payload) returns QueryResponse|error {
        string resourcePath = string `/query`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        QueryResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete
    #
    # + return - A successful response 
    @display {label: "Delete"}
    resource isolated function post vectors/delete(DeleteRequest payload) returns DeleteResponse|error {
        string resourcePath = string `/vectors/delete`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        DeleteResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Fetch
    #
    # + ids - The vector IDs to fetch. Does not accept values containing spaces. 
    # + return - A successful response 
    @display {label: "Fetch"}
    resource isolated function get vectors/fetch(string[] ids, string? namespace = ()) returns FetchResponse|error {
        string resourcePath = string `/vectors/fetch`;
        map<anydata> queryParam = {"ids": ids, "namespace": namespace};
        map<Encoding> queryParamEncoding = {"ids": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FetchResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Fetch
    #
    # + return - A successful response 
    @display {label: "Update"}
    resource isolated function post vectors/update(UpdateRequest payload) returns UpdateResponse|error {
        string resourcePath = string `/vectors/update`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UpdateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Upsert
    #
    # + return - A successful response 
    @display {label: "Upsert"}
    resource isolated function post vectors/upsert(UpsertRequest payload) returns UpsertResponse|error {
        string resourcePath = string `/vectors/upsert`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        UpsertResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
