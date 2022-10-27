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

# This is a generated connector for [Zendesk Talk API v2](https://developer.zendesk.com/api-reference/voice/talk-api/introduction/) OpenAPI specification.
# Zendesk Talk API in conjunction with the Support API to work with Talk agents, groups, and tickets.
@display {label: "Zendesk Voice", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Zendesk account](https://www.zendesk.com/) and obtain tokens by following [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).
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
    # List phone numbers.
    #
    # + return - Returns list of phone numbers 
    remote isolated function listPhoneNumbers() returns PhoneNumbers|error {
        string resourcePath = string `/api/v2/channels/voice/phone_numbers.json`;
        PhoneNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create phone number (This endpoint is not available for trial accounts).
    #
    # + payload - The information for create phone number request 
    # + return - Returns detail of phone number created 
    remote isolated function createPhoneNumber(PhoneNumberInfo payload) returns PhoneNumber|error {
        string resourcePath = string `/api/v2/channels/voice/phone_numbers.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PhoneNumber response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search for available phone numbers (This endpoint is not available for trial accounts).
    #
    # + country - The ISO country code 
    # + areaCode - Find phone numbers in the specified area code. (US and Canada only 
    # + contains - The regular expression used to search for phone numbers. Valid characters are '' and [0-9a-zA-Z] 
    # + tollFree - Whether the number should be toll-free or local 
    # + return - Returns available phone numbers 
    remote isolated function searchAvailablePhoneNumbers(string country, string? areaCode = (), string? contains = (), boolean? tollFree = ()) returns PhoneNumber|error {
        string resourcePath = string `/api/v2/channels/voice/phone_numbers/search.json`;
        map<anydata> queryParam = {"country": country, "area_code": areaCode, "contains": contains, "toll_free": tollFree};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Show phone number.
    #
    # + phoneNumberId - ID of a phone number 
    # + return - Returns phone number by id 
    remote isolated function showPhoneNumber(string phoneNumberId) returns PhoneNumber|error {
        string resourcePath = string `/api/v2/channels/voice/phone_numbers/${getEncodedUri(phoneNumberId)}.json`;
        PhoneNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete phone number by id.
    #
    # + phoneNumberId - ID of a phone number 
    # + return - Returns detail of phone number deleted 
    remote isolated function deletePhoneNumberById(string phoneNumberId) returns PhoneNumber|error {
        string resourcePath = string `/api/v2/channels/voice/phone_numbers/${getEncodedUri(phoneNumberId)}.json`;
        PhoneNumber response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List greeting categories.
    #
    # + return - Returns list of greeting categories 
    remote isolated function listGreetingCategories() returns GreetingCategories|error {
        string resourcePath = string `/api/v2/channels/voice/greeting_categories.json`;
        GreetingCategories response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Show greeting category.
    #
    # + greetingCategoriesId - ID of the greeting category 
    # + return - Returns greeting category by id 
    remote isolated function showGreetingCategory(string greetingCategoriesId) returns GreetingCategory|error {
        string resourcePath = string `/api/v2/channels/voice/greeting_categories/${getEncodedUri(greetingCategoriesId)}.json`;
        GreetingCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List greetings.
    #
    # + return - Returns list of greetings 
    remote isolated function listGreetings() returns Greetings|error {
        string resourcePath = string `/api/v2/channels/voice/greetings.json`;
        Greetings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create greeting.
    #
    # + payload - The information for create greeting request 
    # + return - Returns detail of greeting created 
    remote isolated function createGreeting(GreetingInfo payload) returns Greeting|error {
        string resourcePath = string `/api/v2/channels/voice/greetings.json`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Greeting response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Show greeting.
    #
    # + greetingsId - ID of a greeting 
    # + return - Returns greeting by id 
    remote isolated function showGreeting(string greetingsId) returns Greeting|error {
        string resourcePath = string `/api/v2/channels/voice/greetings/${getEncodedUri(greetingsId)}.json`;
        Greeting response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete greeting by id.
    #
    # + greetingsId - ID of a greeting 
    # + return - Returns detail of greeting deleted 
    remote isolated function deleteGreetingById(string greetingsId) returns Greeting|error {
        string resourcePath = string `/api/v2/channels/voice/greetings/${getEncodedUri(greetingsId)}.json`;
        Greeting response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
