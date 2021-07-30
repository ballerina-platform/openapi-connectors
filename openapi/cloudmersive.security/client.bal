// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

import  ballerina/http;

# Visit [here](https://account.cloudmersive.com/keys) to get more information on obtaining API key
#
# + apiKeys - Provide your API Key as `Apikey`. Eg: `{"Apikey" : "<API Key>}`"
public type ApiKeysConfig record {
    map<string> apiKeys;
};
# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Security APIs help you detect and block security threats.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - Provide your API Key as `Apikey`. Eg: `{"Apikey" : "<API Key>}`"
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Automatically detect threats in an input string
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function contentThreatDetectionAutomaticThreatDetectionString(string payload) returns StringAutomaticThreatDetection|error {
        string  path = string `/security/threat-detection/content/automatic/detect/string`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StringAutomaticThreatDetection response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StringAutomaticThreatDetection);
        return response;
    }
    # Detect Insecure Deserialization JSON (JID) attacks in a string
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function contentThreatDetectionDetectInsecureDeserializationJsonString(string payload) returns StringInsecureDeserializationJsonDetection|error {
        string  path = string `/security/threat-detection/content/insecure-deserialization/json/detect/string`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StringInsecureDeserializationJsonDetection response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StringInsecureDeserializationJsonDetection);
        return response;
    }
    # Check text input for SQL Injection (SQLI) attacks
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function contentThreatDetectionCheckSqlInjectionString(string payload) returns StringSqlInjectionDetectionResult|error {
        string  path = string `/security/threat-detection/content/sql-injection/detect/string`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StringSqlInjectionDetectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StringSqlInjectionDetectionResult);
        return response;
    }
    # Protect text input from Cross-Site-Scripting (XSS) attacks through normalization
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function contentThreatDetectionProtectXss(string payload) returns StringXssProtectionResult|error {
        string  path = string `/security/threat-detection/content/xss/detect/string`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StringXssProtectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StringXssProtectionResult);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    #
    # + payload - User-facing text input.
    # + return - OK
    remote isolated function contentThreatDetectionCheckXxe(string payload) returns StringXxeDetectionResult|error {
        string  path = string `/security/threat-detection/content/xxe/detect/xml/string`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StringXxeDetectionResult response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StringXxeDetectionResult);
        return response;
    }
    # Check a URL for Server-side Request Forgery (SSRF) threats
    #
    # + payload - Input URL request
    # + return - OK
    remote isolated function networkThreatDetectionDetectSsrfUrl(UrlSsrfThreatDetectionRequestFull payload) returns UrlSsrfThreatDetectionResponseFull|error {
        string  path = string `/security/threat-detection/network/url/ssrf/detect`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UrlSsrfThreatDetectionResponseFull response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UrlSsrfThreatDetectionResponseFull);
        return response;
    }
    # Check if IP address is a known threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function networkThreatDetectionIsThreat(string payload) returns IPThreatDetectionResponse|error {
        string  path = string `/security/threat-detection/network/ip/is-threat`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IPThreatDetectionResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPThreatDetectionResponse);
        return response;
    }
    # Check if IP address is a Bot client threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function networkThreatDetectionIsBot(string payload) returns ThreatDetectionBotCheckResponse|error {
        string  path = string `/security/threat-detection/network/ip/is-bot`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThreatDetectionBotCheckResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ThreatDetectionBotCheckResponse);
        return response;
    }
    # Check if IP address is a Tor node server
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes.
    # + return - OK
    remote isolated function networkThreatDetectionIsTorNode(string payload) returns ThreatDetectionTorNodeResponse|error {
        string  path = string `/security/threat-detection/network/ip/is-tor-node`;
        map<any> headerValues = {Apikey: self.apiKeys["Apikey"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ThreatDetectionTorNodeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ThreatDetectionTorNodeResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
