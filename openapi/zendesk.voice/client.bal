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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [Zendesk Talk API v2](https://developer.zendesk.com/api-reference/voice/talk-api/introduction/) OpenAPI specification.
# Zendesk Talk API in conjunction with the Support API to work with Talk agents, groups, and tickets.
@display {label: "Zendesk Voice", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Zendesk account](https://www.zendesk.com/) and obtain tokens by following [this guide](https://developer.zendesk.com/api-reference/ticketing/introduction/#security-and-authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
