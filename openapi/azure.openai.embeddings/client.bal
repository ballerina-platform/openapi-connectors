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

# This is a generated connector from [Azure OpenAI Embeddings API v2023-03-15-preview](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#embeddings/) OpenAPI specification.
# The Azure Azure OpenAI Service REST API Embeddings Endpoint will generate one a vector representation of a given input that can be easily consumed by machine learning models and other algorithms.
@display {label: "Azure OpenAI Embeddings", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure](https://azure.microsoft.com/en-us/features/azure-portal/) account, an [Azure OpenAI resource with a model deployed](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/create-resource) and refer [this guide](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference#authentication) to learn how to generate and use tokens
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://your-resource-name.openai.azure.com/openai") returns error? {
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
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            config.auth = <http:BearerTokenConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get a vector representation of a given input that can be easily consumed by machine learning models and algorithms.
    #
    # + deploymentId - The deployment id of the model which was deployed. 
    # + return - OK 
    resource isolated function post deployments/[string deploymentId]/embeddings(string apiVersion, Deploymentid_embeddings_body payload) returns Inline_response_200|error {
        string resourcePath = string `/deployments/${getEncodedUri(deploymentId)}/embeddings`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"api-version": apiVersion};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["api-key"] = self.apiKeyConfig?.apiKey;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        Inline_response_200 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
