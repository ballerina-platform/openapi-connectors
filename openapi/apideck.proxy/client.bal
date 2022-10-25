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

# This is a generated connector from [Apideck Proxy API v5.3.0](https://developers.apideck.com/apis/proxy/reference) OpenAPI specification.
# You can use this API to access all Proxy API endpoints.
@display {label: "Apideck Proxy", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Unify API accounts have sandbox mode and live mode API keys. To change modes just use the appropriate key to get a live or test object. 
    # You can find your API keys on the unify settings of your Apideck app.Your Apideck application_id can also be found on the same page.
    # Obtain API keys following [this guide](https://developers.apideck.com/apis/proxy/reference#section/Authorization).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://unify.apideck.com") returns error? {
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
    # GET
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function getProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string resourcePath = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # PUT
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + return - Ok 
    remote isolated function putProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, json payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string resourcePath = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # POST
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + return - Ok 
    remote isolated function postProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, json payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string resourcePath = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DELETE
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + return - Ok 
    remote isolated function deleteProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string resourcePath = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # PATCH
    #
    # + xApideckConsumerId - ID of the consumer which you want to get or push data from 
    # + xApideckAppId - The ID of your Unify application 
    # + xApideckServiceId - Provide the service id you want to call (e.g., pipedrive). [See the full list in the connector section.](#section/Connectors) Only needed when a consumer has activated multiple integrations for a Unified API. 
    # + xApideckDownstreamUrl - Downstream URL 
    # + xApideckDownstreamAuthorization - Downstream authorization header. This will skip the Vault token injection. 
    # + payload - Depending on the verb/method of the request this will contain the request body you want to POST/PATCH/PUT. 
    # + return - Ok 
    remote isolated function patchProxy(string xApideckConsumerId, string xApideckAppId, string xApideckServiceId, string xApideckDownstreamUrl, json payload, string? xApideckDownstreamAuthorization = ()) returns json|error {
        string resourcePath = string `/proxy`;
        map<any> headerValues = {"x-apideck-consumer-id": xApideckConsumerId, "x-apideck-app-id": xApideckAppId, "x-apideck-service-id": xApideckServiceId, "x-apideck-downstream-url": xApideckDownstreamUrl, "x-apideck-downstream-authorization": xApideckDownstreamAuthorization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
}
