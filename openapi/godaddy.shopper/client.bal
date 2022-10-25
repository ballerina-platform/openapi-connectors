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

# This is a generated connector for [GoDaddy Shoppers API v1](https://developer.godaddy.com/doc/endpoint/shoppers) OpenAPI specification. The GoDaddy Shoppers API provides capability to access GoDaddy operations related to shopper.
@display {label: "GoDaddy Shopper", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
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
    # Create a Subaccount owned by the authenticated Reseller
    #
    # + payload - The subaccount to create 
    # + return - Request was successful 
    remote isolated function createSubaccount(SubaccountCreate payload) returns ShopperId|error {
        string resourcePath = string `/v1/shoppers/subaccount`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShopperId response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get details for the specified Shopper
    #
    # + shopperId - Shopper whose details are to be retrieved 
    # + includes - Additional properties to be included in the response shopper object 
    # + return - Request was successful 
    remote isolated function get(string shopperId, string[]? includes = ()) returns Shopper|error {
        string resourcePath = string `/v1/shoppers/${getEncodedUri(shopperId)}`;
        map<anydata> queryParam = {"includes": includes};
        map<Encoding> queryParamEncoding = {"includes": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Shopper response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update details for the specified Shopper
    #
    # + shopperId - The ID of the Shopper to update 
    # + payload - The Shopper details to update 
    # + return - Request was successful 
    remote isolated function update(string shopperId, ShopperUpdate payload) returns ShopperId|error {
        string resourcePath = string `/v1/shoppers/${getEncodedUri(shopperId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShopperId response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request the deletion of a shopper profile
    #
    # + shopperId - The ID of the shopper to delete. Must agree with the shopper id on the token or header, if present. *Note*: **shopperId** is **not the same** as **customerId**.  **shopperId** is a number of max length 10 digits (*ex:* 1234567890) whereas **customerId** is a UUIDv4 (*ex:* 295e3bc3-b3b9-4d95-aae5-ede41a994d13) 
    # + auditClientIp - The client IP of the user who originated the request leading to this call. 
    # + return - Request was successful 
    remote isolated function delete(string shopperId, string auditClientIp) returns http:Response|error {
        string resourcePath = string `/v1/shoppers/${getEncodedUri(shopperId)}`;
        map<anydata> queryParam = {"auditClientIp": auditClientIp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get details for the specified Shopper
    #
    # + shopperId - The ID of the shopper to retrieve. Must agree with the shopper id on the token or header, if present 
    # + auditClientIp - The client IP of the user who originated the request leading to this call. 
    # + return - Request was successful 
    remote isolated function getStatus(string shopperId, string auditClientIp) returns ShopperStatus|error {
        string resourcePath = string `/v1/shoppers/${getEncodedUri(shopperId)}/status`;
        map<anydata> queryParam = {"auditClientIp": auditClientIp};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ShopperStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set subaccount's password
    #
    # + shopperId - Shopper whose password will be set 
    # + payload - The value to set the subaccount's password to 
    # + return - Request was successful 
    remote isolated function changePassword(string shopperId, Secret payload) returns ShopperId|error {
        string resourcePath = string `/v1/shoppers/${getEncodedUri(shopperId)}/factors/password`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShopperId response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
}
