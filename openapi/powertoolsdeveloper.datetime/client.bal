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

# This is a generated connector for [Apptigent PowerTools Developer API v2021.1.01](https://portal.apptigent.com/node/612) OpenAPI specification.
# 'Apptigent PowerTools Developer Edition is a powerful suite of API endpoints for custom applications running on any stack. 
# Manipulate text, modify collections, format dates and times, convert currency, perform advanced mathematical calculations, shorten URL's, encode strings, convert text to speech, translate content into multiple languages, process images, and more. 
# PowerTools is the ultimate developer toolkit.'
# This connector provides the capability for date and time operations.
@display {label: "PowerTools Developer Datetime", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Apptigent account](https://portal.apptigent.com/user/register) and obtain tokens following [this guide](https://portal.apptigent.com/start).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://connect.apptigent.com/api/utilities") returns error? {
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
    # DateTime - Get date and time information
    #
    # + payload - Input date time info parameters 
    # + return - OK 
    remote isolated function dateTimeInfo(InputDateTimeInfo payload) returns OutputDateInfo|error {
        string resourcePath = string `/DateTimeInfo`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputDateInfo response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - DateTime difference
    #
    # + payload - Input date time difference parameters 
    # + return - OK 
    remote isolated function dateTimeDifference(InputDateTimeDifference payload) returns OutputDateDifference|error {
        string resourcePath = string `/DateTimeDifference`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputDateDifference response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - Format date and time
    #
    # + payload - Input date time format parameters 
    # + return - OK 
    remote isolated function formatDateTime(InputDateTimeFormat payload) returns OutputString|error {
        string resourcePath = string `/FormatDateTime`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # DateTime - Get world time
    #
    # + payload - Input date time conversion parameters 
    # + return - OK 
    remote isolated function worldTime(InputDateTimeConversion payload) returns OutputString|error {
        string resourcePath = string `/WorldTime`;
        map<any> headerValues = {"X-IBM-Client-Id": self.apiKeyConfig.xIbmClientId};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OutputString response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
