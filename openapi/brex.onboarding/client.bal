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

# This is a generated connector for [Brex Onboarding API v0.1](https://developer.brex.com/openapi/onboarding_api/) OpenAPI specification. 
# Onboarding APIs allows partners to refer their customers to Brex to streamline the process of creating new accounts  for these customers. By submitting information for referrals, it removes the need for customers to enter in this information again.
@display {label: "brex.onboarding", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Brex account](https://www.brex.com/) and obtain tokens by following [this guide](https://developer.brex.com/docs/authentication/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://platform.staging.brexapps.com") returns error? {
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
    # List referrals
    #
    # + cursor - The cursor 
    # + return - listReferralsGet 200 response 
    remote isolated function listReferralsGet(string? cursor = ()) returns ReferralPage|error {
        string resourcePath = string `/v1/referrals`;
        map<anydata> queryParam = {"cursor": cursor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReferralPage response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a referral
    #
    # + payload - Create referral request. 
    # + return - createReferralRequestPost 200 response 
    remote isolated function createReferralRequestPost(CreateReferralRequest payload) returns Referral|error {
        string resourcePath = string `/v1/referrals`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Referral response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a referral by ID
    #
    # + id - Referral ID. 
    # + return - getReferralGet 200 response 
    remote isolated function getReferralGet(string id) returns Referral|error {
        string resourcePath = string `/v1/referrals/${getEncodedUri(id)}`;
        Referral response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new document upload
    #
    # + id - Referral ID 
    # + payload - Create Document request 
    # + return - createDocumentPost 200 response 
    remote isolated function createDocumentPost(string id, CreateDocumentRequest payload) returns Document|error {
        string resourcePath = string `/v1/referrals/${getEncodedUri(id)}/document_upload`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Document response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
