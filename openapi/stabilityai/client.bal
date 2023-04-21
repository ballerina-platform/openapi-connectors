// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
import ballerina/mime;

# Welcome to the Stability.ai REST API!
# 
# Your DreamStudio API key will be required for authentication: [How to find your API key](https://platform.stability.ai/docs/getting-started/authentication)
# 
# API operations use the following versioning scheme:
# - `/v*` interface is stable and ready for production workloads
# - `/v*beta*`: interface is stable, preparing for production release
# - `/v*alpha*`: under development and the interface is subject to change
# 
# NOTE: The v1alpha and v1beta endpoints from the developer preview are still available, but they
# will disabled on May 1st, 2023.  Please migrate to the v1 endpoints as soon as possible.
# 
# If you have feedback or encounter any issues with the API, please reach out:
#   - [https://github.com/Stability-AI/REST-API](https://github.com/Stability-AI/REST-API)
#   - [https://discord.gg/stablediffusion #API channel](https://discord.com/channels/1002292111942635562/1042896447311454361)
@display {label: "Stability.AI", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.stability.ai") returns error? {
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
    # text-to-image
    #
    # + accept - The format of the response.  Leave blank for JSON, or set to 'image/png' for a PNG image. 
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "Generate image from text prompt"}
    resource isolated function post v1/generation/[string engine_id]/'text\-to\-image(TextToImageRequestBody payload, string accept = "application/json", string? organization = ()) returns ImageRes|error {
        string resourcePath = string `/v1/generation/${getEncodedUri(engine_id)}/text-to-image`;
        map<any> headerValues = {"Accept": accept, "Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = payload.toJson();
        request.setPayload(jsonBody, "application/json");
        ImageRes response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # image-to-image
    #
    # + accept - The format of the response.  Leave blank for JSON, or set to 'image/png' for a PNG image. 
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "Modify image based on text prompt"}
    resource isolated function post v1/generation/[string engine_id]/'image\-to\-image(ImageToImageRequestBody payload, string accept = "application/json", string? organization = ()) returns ImageRes|error {
        string resourcePath = string `/v1/generation/${getEncodedUri(engine_id)}/image-to-image`;
        map<any> headerValues = {"Accept": accept, "Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ImageRes response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # image-to-image/upscale
    #
    # + accept - The format of the response.  Leave blank for JSON, or set to 'image/png' for a PNG image. 
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "Upscale resolution of a image"}
    resource isolated function post v1/generation/[string engine_id]/'image\-to\-image/upscale(UpscaleImageRequestBody payload, string accept = "application/json", string? organization = ()) returns ImageRes|error {
        string resourcePath = string `/v1/generation/${getEncodedUri(engine_id)}/image-to-image/upscale`;
        map<any> headerValues = {"Accept": accept, "Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ImageRes response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # image-to-image/masking
    #
    # + accept - The format of the response.  Leave blank for JSON, or set to 'image/png' for a PNG image. 
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "Mask an image based on text prompt"}
    resource isolated function post v1/generation/[string engine_id]/'image\-to\-image/masking(MaskingRequestBody payload, string accept = "application/json", string? organization = ()) returns ImageRes|error {
        string resourcePath = string `/v1/generation/${getEncodedUri(engine_id)}/image-to-image/masking`;
        map<any> headerValues = {"Accept": accept, "Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ImageRes response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # list
    #
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "List all engines"}
    resource isolated function get v1/engines/list(string? organization = ()) returns ListEnginesResponseBody|error {
        string resourcePath = string `/v1/engines/list`;
        map<any> headerValues = {"Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ListEnginesResponseBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # account
    #
    # + return - OK response. 
    @display {label: "Get account information"}
    resource isolated function get v1/user/account() returns AccountResponseBody|error {
        string resourcePath = string `/v1/user/account`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountResponseBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # balance
    #
    # + organization - Allows for requests to be scoped to an organization other than the user's default.  If not provided, the user's default organization will be used. 
    # + return - OK response. 
    @display {label: "Get account balance"}
    resource isolated function get v1/user/balance(string? organization = ()) returns BalanceResponseBody|error {
        string resourcePath = string `/v1/user/balance`;
        map<any> headerValues = {"Organization": organization, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BalanceResponseBody response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
