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

# This is a generated connector for [Pushcut API v1](https://www.pushcut.io/webapi.html) OpenAPI specification.
# API to send Pushcut notifications, execute Automation Server actions, and register custom webhooks as online actions.
@display {label: "Pushcut", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Pushcut account](https://www.pushcut.io) and obtain tokens by following [this guide](https://www.pushcut.io/help).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.pushcut.io/v1") returns error? {
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
    # Get devices
    #
    # + return - Success 
    remote isolated function getDevices() returns InlineResponse200[]|error {
        string resourcePath = string `/devices`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get defined notifications
    #
    # + return - Success 
    remote isolated function getNotifications() returns InlineResponse2001[]|error {
        string resourcePath = string `/notifications`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send a smart notification
    #
    # + notificationName - Notification Name 
    # + payload - Extend and customize the defined notification by providing dynamic content. 
    # + return - Success 
    remote isolated function sendNotification(string notificationName, Notification payload) returns http:Response|error {
        string resourcePath = string `/notifications/${getEncodedUri(notificationName)}`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of all online action subscriptions
    #
    # + return - Success 
    remote isolated function getSubscriptions() returns SubscriptionData[]|error {
        string resourcePath = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionData[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Subscribe to an online action
    #
    # + payload - Subscription request 
    # + return - Success 
    remote isolated function actionExecuted(Subscription payload) returns InlineResponse2002|error {
        string resourcePath = string `/subscriptions`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2002 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove an online action subscription
    #
    # + subscriptionId - Id that was returned when creating the subscription. 
    # + return - Success 
    remote isolated function deleteSubscription(string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}`;
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Execute an Automation Server action.
    #
    # + shortcut - Shortcut 
    # + homekit - HomeKit scene 
    # + timeout - Timout in seconds, or 'nowait' 
    # + delay - Duration in which this request should be executed. Eg: 10s, 15m, 6h 
    # + identifier - Only used for delayed requests. Use an identifier to overwrite or cancel a scheduled execution. 
    # + payload - Pass an input or optional configuration with the request. 
    # + return - Success 
    remote isolated function execute(Execute payload, string? shortcut = (), string? homekit = (), string? timeout = (), string? delay = (), string? identifier = ()) returns http:Response|error {
        string resourcePath = string `/execute`;
        map<anydata> queryParam = {"shortcut": shortcut, "homekit": homekit, "timeout": timeout, "delay": delay, "identifier": identifier};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel a scheduled Automation Server action.
    #
    # + identifier - Identifier of the request. 
    # + return - Success 
    remote isolated function cancelExecution(string? identifier = ()) returns http:Response|error {
        string resourcePath = string `/cancelExecution`;
        map<anydata> queryParam = {"identifier": identifier};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"API-Key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
