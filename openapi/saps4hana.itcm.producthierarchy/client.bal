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
# In SAPS4HANA Intelligent Trade Claims Management, users can group and organize their products and nodes and assign them to a product hierarchy.
@display {label: "SAPS4HANA ITCM Product Hierarchy", iconPath: "icon.png"}
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
    # Create a new Product Hierarchy
    #
    # + payload - Request payload to create a new product hierarchy 
    # + return - Success Created. 
    remote isolated function createProductHierarchy(HierarchyHeaderEO payload) returns HierarchyCreationResponse|error {
        string resourcePath = string `/hierarchy/products`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HierarchyCreationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get Product Hierarchy Nodes with header externalId
    #
    # + externalId - External Id 
    # + return - OK. 
    remote isolated function getAllNodes(string externalId) returns HierarchyNodeHeaderResponse|error {
        string resourcePath = string `/hierarchy/products/header/${getEncodedUri(externalId)}`;
        HierarchyNodeHeaderResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Product Hierarchy with externalId
    #
    # + externalId - External Id 
    # + return - OK. 
    remote isolated function getNode(string externalId) returns HierarchyNodeResponse|error {
        string resourcePath = string `/hierarchy/products/${getEncodedUri(externalId)}`;
        HierarchyNodeResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete the Product Hierarchy with header externalId
    #
    # + headerExternalId - Header external Id 
    # + return - OK. 
    remote isolated function deleteProductHierarchyTenant(string headerExternalId) returns ResponseDeleteMessage|error {
        string resourcePath = string `/hierarchy/products/${getEncodedUri(headerExternalId)}`;
        ResponseDeleteMessage response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
