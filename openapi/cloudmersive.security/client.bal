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

# This is a generated connector from [Cloudmersive](https://account.cloudmersive.com) OpenAPI specification.
# The Cloudmersive Security APIs help you detect and block security threats.
@display {label: "Cloudmersive Security", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Cloudmersive account](https://account.cloudmersive.com/login) and obtain tokens following [this guide](https://account.cloudmersive.com/keys).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://testapi.cloudmersive.com/") returns error? {
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
    # Automatically detect threats in an input string
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function contentThreatDetectionAutomaticThreatDetectionString(string payload) returns StringAutomaticThreatDetection|error {
        string resourcePath = string `/security/threat-detection/content/automatic/detect/string`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringAutomaticThreatDetection response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Detect Insecure Deserialization JSON (JID) attacks in a string
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function contentThreatDetectionDetectInsecureDeserializationJsonString(string payload) returns StringInsecureDeserializationJsonDetection|error {
        string resourcePath = string `/security/threat-detection/content/insecure-deserialization/json/detect/string`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringInsecureDeserializationJsonDetection response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check text input for SQL Injection (SQLI) attacks
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function contentThreatDetectionCheckSqlInjectionString(string payload) returns StringSqlInjectionDetectionResult|error {
        string resourcePath = string `/security/threat-detection/content/sql-injection/detect/string`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringSqlInjectionDetectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect text input from Cross-Site-Scripting (XSS) attacks through normalization
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function contentThreatDetectionProtectXss(string payload) returns StringXssProtectionResult|error {
        string resourcePath = string `/security/threat-detection/content/xss/detect/string`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringXssProtectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Protect text input from XML External Entity (XXE) attacks
    #
    # + payload - User-facing text input. 
    # + return - OK 
    remote isolated function contentThreatDetectionCheckXxe(string payload) returns StringXxeDetectionResult|error {
        string resourcePath = string `/security/threat-detection/content/xxe/detect/xml/string`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StringXxeDetectionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a URL for Server-side Request Forgery (SSRF) threats
    #
    # + payload - Input URL request 
    # + return - OK 
    remote isolated function networkThreatDetectionDetectSsrfUrl(UrlSsrfThreatDetectionRequestFull payload) returns UrlSsrfThreatDetectionResponseFull|error {
        string resourcePath = string `/security/threat-detection/network/url/ssrf/detect`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UrlSsrfThreatDetectionResponseFull response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a known threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function networkThreatDetectionIsThreat(string payload) returns IPThreatDetectionResponse|error {
        string resourcePath = string `/security/threat-detection/network/ip/is-threat`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IPThreatDetectionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a Bot client threat
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function networkThreatDetectionIsBot(string payload) returns ThreatDetectionBotCheckResponse|error {
        string resourcePath = string `/security/threat-detection/network/ip/is-bot`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ThreatDetectionBotCheckResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check if IP address is a Tor node server
    #
    # + payload - IP address to check, e.g. "55.55.55.55".  The input is a string so be sure to enclose it in double-quotes. 
    # + return - OK 
    remote isolated function networkThreatDetectionIsTorNode(string payload) returns ThreatDetectionTorNodeResponse|error {
        string resourcePath = string `/security/threat-detection/network/ip/is-tor-node`;
        map<any> headerValues = {"Apikey": self.apiKeyConfig.apikey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ThreatDetectionTorNodeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
