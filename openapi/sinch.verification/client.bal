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

# This is a generated connector for [Sinch Verification API v2.0](https://www.sinch.com/) OpenAPI specification.
# Verify users with SMS, flash calls (missed calls), a regular call, or data verification.
@display {label: "sinch.verification", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/verification/api-reference/authentication/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://verificationapi-v1.sinch.com") returns error? {
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
    # Start verification
    #
    # + payload - Start verification request payload. 
    # + return - A successful response. 
    remote isolated function startVerification(InitiateVerificationResource payload) returns InitiateVerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InitiateVerificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Report back on a started verification
    #
    # + 'type - Currently only `number` type is supported. 
    # + endpoint - For `number` use a [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537)-compatible phone number. 
    # + payload - Verification report request payload. 
    # + return - A successful response. 
    remote isolated function reportVerificationByIdentity(string 'type, string endpoint, VerificationReportRequestResource payload) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/${getEncodedUri('type)}/${getEncodedUri(endpoint)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get verification by ID
    #
    # + id - The ID of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusById(string id) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/id/${getEncodedUri(id)}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Report back on a started verification
    #
    # + id - The ID of the verification. 
    # + payload - Verification report request resource payload. 
    # + return - A sucessful response. 
    remote isolated function reportVerificationById(string id, VerificationReportRequestResource payload) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/id/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerificationResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get verification by Identity
    #
    # + 'type - Currently only `number` type is supported. 
    # + endpoint - For `number` use a [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537)-compatible phone number. 
    # + method - The method of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusByIdentity(string 'type, string endpoint, string method) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/${getEncodedUri(method)}/${getEncodedUri('type)}/${getEncodedUri(endpoint)}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get verification by Reference
    #
    # + reference - The custom reference of the verification. 
    # + return - A sucessful response. 
    remote isolated function verificationStatusByReference(string reference) returns VerificationResponse|error {
        string resourcePath = string `/verification/v1/verifications/reference/${getEncodedUri(reference)}`;
        VerificationResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
