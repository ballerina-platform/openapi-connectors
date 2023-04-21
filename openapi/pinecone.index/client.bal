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

# This is a generated connector for the `Index Operations` under [Pinecone Vector Database API](https://docs.pinecone.io/reference) OpenAPI specification. Pinecone is a fully managed vector database which supports building developer-friendly, easily scalable, and high-performance vector search applications without infrastructure hassles.
@display {label: "Pinecone Index", iconPath: "icon.png"}
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
    # List collections
    #
    # + return - This operation returns a list of your Pinecone collections. 
    @display {label: "List Collections"}
    resource isolated function get collections() returns CollectionsList|error {
        string resourcePath = string `/collections`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CollectionsList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create collection
    #
    # + return - The collection has been successfully created. 
    @display {label: "Create Collection"}
    resource isolated function post collections(CollectionDefinition payload) returns http:Response|error {
        string resourcePath = string `/collections`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Describe collection
    #
    # + return - This operation returns a description of a collection. 
    @display {label: "Describe Collection"}
    resource isolated function get collections/[string collectionName]() returns Collection|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionName)}`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Collection response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Collection
    #
    # + return - The collection has been successfully deleted. 
    @display {label: "Delete Collection"}
    resource isolated function delete collections/[string collectionName]() returns http:Response|error {
        string resourcePath = string `/collections/${getEncodedUri(collectionName)}`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List indexes
    #
    # + return - This operation returns a list of your Pinecone indexes. 
    @display {label: "List Indexes"}
    resource isolated function get databases() returns IndexesList|error {
        string resourcePath = string `/databases`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IndexesList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create index
    #
    # + return - The index has been successfully created. 
    @display {label: "Create Index"}
    resource isolated function post databases(IndexDefinition payload) returns http:Response|error {
        string resourcePath = string `/databases`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Describe index
    #
    # + return - This operation returns a description of an index. 
    @display {label: "Describe Index"}
    resource isolated function get databases/[string indexName]() returns Index|error {
        string resourcePath = string `/databases/${getEncodedUri(indexName)}`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Index response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Index
    #
    # + return - The index has been successfully deleted. 
    @display {label: "Delete Index"}
    resource isolated function delete databases/[string indexName]() returns http:Response|error {
        string resourcePath = string `/databases/${getEncodedUri(indexName)}`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Configure index
    #
    # + return - The index has been successfully updated. 
    @display {label: "Configure Index"}
    resource isolated function patch databases/[string indexName](IndexConfiguration payload) returns http:Response|error {
        string resourcePath = string `/databases/${getEncodedUri(indexName)}`;
        map<any> headerValues = {"Api-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
}
