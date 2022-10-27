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

# This is a generated connector for [OpenFIGI API v3](https://www.openfigi.com/api) OpenAPI Specification.
# OpenFIGI API provides capability to access multiple tools for identifying, mapping and requesting a free and open symbology dataset.  This user friendly platform provides the ultimate understanding for how a unique identifier combined with accurate,  associated metadata can eliminate redundant mapping processes, streamline the trade workflow and reduce operational risk.
@display {label: "OpenFIGI", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [OpenFIGI account](https://www.openfigi.com/)  and obtain tokens following [this guide](https://www.openfigi.com/api#api-key).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.openfigi.com/v3") returns error? {
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
    # Allows mapping from third-party identifiers to FIGIs.
    #
    # + payload - A list of third-party identifiers and extra filters. 
    # + return - A list of FIGIs and their metadata. 
    remote isolated function mapIdentifiers(BulkMappingJob payload) returns BulkMappingJobResult|error {
        string resourcePath = string `/mapping`;
        map<any> headerValues = {"X-OPENFIGI-APIKEY": self.apiKeyConfig.xOpenfigiApikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkMappingJobResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get values for enum-like fields.
    #
    # + 'key - Key of MappingJob for which to get possible values. 
    # + return - The list of values. 
    remote isolated function getValues(string 'key) returns Values|error {
        string resourcePath = string `/mapping/values/${getEncodedUri('key)}`;
        map<any> headerValues = {"X-OPENFIGI-APIKEY": self.apiKeyConfig.xOpenfigiApikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Values response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
