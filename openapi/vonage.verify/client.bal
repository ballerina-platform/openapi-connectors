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

# This is a generated connector for [Vonage Verify API v1.1.7](https://nexmo-api-specification.herokuapp.com/verify) OpenAPI specification.
# The Verify API helps you to implement 2FA (two-factor authentication) in your applications.
# More information is available at https://developer.nexmo.com/verify/overview
@display {label: "Vonage Verify", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials. 
    # Create a [Vonage account](https://www.vonage.com/) and obtain tokens by following [this guide](https://developer.nexmo.com/concepts/guides/authentication). 
    # Some operations may require passing the token as a parameter.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://api.nexmo.com/verify") returns error? {
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
        return;
    }
    # Request a Verification
    #
    # + payload - Verify Request 
    # + return - OK 
    remote isolated function verifyRequest(VerifyRequest payload) returns InlineResponse200|error {
        string resourcePath = string `/json`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        InlineResponse200 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Verify Check
    #
    # + payload - Check Request 
    # + return - OK 
    remote isolated function verifyCheck(CheckRequest payload) returns InlineResponse2001|error {
        string resourcePath = string `/check/json`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Verify Search
    #
    # + apiKey - API Key 
    # + apiSecret - API Secret 
    # + requestId - The `request_id` you received in the Verify Request Response. Required if `request_ids` not provided. 
    # + requestIds - More than one `request_id`. Each `request_id` is a new parameter in the Verify Search request. Required if `request_id` not provided. 
    # + return - OK 
    remote isolated function verifySearch(string apiKey, string apiSecret, string requestId, string[]? requestIds = ()) returns InlineResponse2002|error {
        string resourcePath = string `/search/json`;
        map<anydata> queryParam = {"api_key": apiKey, "api_secret": apiSecret, "request_id": requestId, "request_ids": requestIds};
        map<Encoding> queryParamEncoding = {"request_ids": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Verify Control
    #
    # + payload - Control Request 
    # + return - OK 
    remote isolated function verifyControl(ControlRequest payload) returns InlineResponse2003|error {
        string resourcePath = string `/control/json`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        InlineResponse2003 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # PSD2 (Payment Services Directive 2) Request
    #
    # + payload - PSD2 (Payment Services Directive 2) Request 
    # + return - OK 
    remote isolated function verifyRequestWithPSD2(Psd2Request payload) returns InlineResponse200|error {
        string resourcePath = string `/psd2/json`;
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        InlineResponse200 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
