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

# This is a generated connector for [WorkDay Connect Service REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The WorkDay connect service enables applications to access REST service for Multichannel Collaboration (MCC) services.
@display {label: "Workday Connect", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
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
    # Secured by: Set Up: Message Templates
    # 
    # Scope: Learning Coredescription
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getMessageTemplateByID(string id) returns MessageTemplateDetailRef|error {
        string resourcePath = string `/messageTemplates/${getEncodedUri(id)}`;
        MessageTemplateDetailRef response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Secured by: Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating resource. 
    remote isolated function createMessageTemplateByID(string id, MessageTemplateDetailRef payload) returns MessageTemplateDetailRef|error {
        string resourcePath = string `/messageTemplates/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageTemplateDetailRef response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Secured by: Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating resource. 
    remote isolated function updateMessageTemplateByID(string id, MessageTemplateDetailRef payload) returns MessageTemplateDetailRef|error {
        string resourcePath = string `/messageTemplates/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageTemplateDetailRef response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Secured by: Administer Communications, Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getNotificationTypes(int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/notificationTypes`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Secured by: Administer Communications
    #
    # + return - Resource created. 
    remote isolated function sendMessage(MessageDetail payload) returns MessageDetail|error {
        string resourcePath = string `/sendMessage`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageDetail response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Secured by: Administer Communications, Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getNotificationTypeByID(string id) returns NotificationCategoryDetail|error {
        string resourcePath = string `/notificationTypes/${getEncodedUri(id)}`;
        NotificationCategoryDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Secured by: Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + inactive - Indicates template is active or has been disabled. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + name - Message Template Name 
    # + notificationType - Notification Type indicates where the template can be used. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getMessageTemplate(boolean? inactive = (), int? 'limit = (), string? name = (), string? notificationType = (), int? offset = ()) returns InlineResponse2001|error {
        string resourcePath = string `/messageTemplates`;
        map<anydata> queryParam = {"inactive": inactive, "limit": 'limit, "name": name, "notificationType": notificationType, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Secured by: Set Up: Message Templates
    # 
    # Scope: Learning Core
    #
    # + inactive - Indicates template is active or has been disabled. 
    # + name - Message Template Name 
    # + notificationType - Notification Type indicates where the template can be used. 
    # + return - Resource created. 
    remote isolated function createMessageTemplate(MessageTemplateDetailRef payload, boolean? inactive = (), string? name = (), string? notificationType = ()) returns MessageTemplateDetailRef|error {
        string resourcePath = string `/messageTemplates`;
        map<anydata> queryParam = {"inactive": inactive, "name": name, "notificationType": notificationType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageTemplateDetailRef response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
