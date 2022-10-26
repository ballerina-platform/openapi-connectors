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

# This is a generated connector for [SAPS4HANA Intelligent Trade Claims Management API v1.0.0](https://help.sap.com/viewer/902b9d277dfe48fea582d28849d54935/CURRENT/en-US) OpenAPI specification. 
# In SAPS4HANA Intelligent Trade Claims Management, the promotion service allows you to create, add, and delete information about promotions. Execution of Promotions should be done in an particular order.
@display {label: "SAPS4HANA ITCM Promotion", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create and configure an OAuth2 client credentials by following [this guide](https://help.sap.com/viewer/b865ed651e414196b39f8922db2122c7/LATEST/en-US/7aefa21a65f94b25b7e639c3931b6f83.html).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Create a new Promotion
    #
    # + payload - Request payload to create promotion 
    # + return - Success Created. 
    remote isolated function createPromotion(ExternalPromotionDTO payload) returns ResponsePromotionCreationMessage|error {
        string resourcePath = string `/promotions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResponsePromotionCreationMessage response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Promotion with externalId
    #
    # + externalId - The external id of the promotion, for example `348328430` 
    # + return - OK. 
    remote isolated function getPromotionByExternalId(string externalId) returns ResponseExternalPromotionMessage|error {
        string resourcePath = string `/promotions/${getEncodedUri(externalId)}`;
        ResponseExternalPromotionMessage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a Promotion with externalId
    #
    # + externalId - The external id of the promotion, for example `348328430` 
    # + return - OK. 
    remote isolated function deletePromotion(string externalId) returns ResponsePromotionDeletionMessage|error {
        string resourcePath = string `/promotions/${getEncodedUri(externalId)}`;
        ResponsePromotionDeletionMessage response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
