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
import ballerina/mime;

# This is a generated connector for [Open Design REST API v0.3.4](https://opendesign.dev/docs/api-reference/introduction) OpenAPI specification. 
# Open Design read and display data from designs using code. Unlock the power of programmatic design.
@display {label: "opendesign", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Open Design account](https://opendesign.dev) and obtain tokens by following [this guide](https://opendesign.dev/docs/api-reference/introduction#step-1-get-your-api-token).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.opendesign.dev") returns error? {
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
    # Auth Token Check
    #
    # + return - Returns info about the token. 
    remote isolated function checkToken() returns InlineResponse200|error {
        string resourcePath = string `/token`;
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Design File Upload
    #
    # + payload - Upload information 
    # + return - Returns the created design entity. 
    remote isolated function postDesignUpload(DesignsUploadBody payload) returns InlineResponse201|error {
        string resourcePath = string `/designs/upload`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        InlineResponse201 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # URL-Based Design File Import
    #
    # + payload - Design link information 
    # + return - Returns the created design entity. 
    remote isolated function postDesignLink(DesignsLinkBody payload) returns InlineResponse201|error {
        string resourcePath = string `/designs/link`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Figma Design File Import
    #
    # + payload - Figma design information 
    # + return - Returns the created design entity or its processing status (in case a export was requested). 
    remote isolated function postDesignFigmaLink(DesignsFigmalinkBody payload) returns InlineResponse2011|error {
        string resourcePath = string `/designs/figma-link`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2011 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Design List
    #
    # + return - Returns a list of design entities 
    remote isolated function getDesignList() returns InlineResponse2001|error {
        string resourcePath = string `/designs`;
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Design Info
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns the design entity or its processing status. 
    remote isolated function getDesign(string designId) returns DesignProcessing|InlineResponse2002|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}`;
        DesignProcessing|InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start Design Export
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + payload - Design export target 
    # + return - Returns the started design export task entity. 
    remote isolated function postDesignExport(string designId, DesignIdExportsBody payload) returns DesignExport|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}/exports`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DesignExport response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Design Export Info
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + exportId - An identifier of a export task of an imported design file. 
    # + return - Returns the design export task entity. 
    remote isolated function getDesignExport(string designId, string exportId) returns DesignExport|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}/exports/${getEncodedUri(exportId)}`;
        DesignExport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Design Summary
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns an extended design entity with the complete page and artboard entity lists or the processing status of the design. 
    remote isolated function getDesignSummary(string designId) returns DesignProcessing|InlineResponse2003|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}/summary`;
        DesignProcessing|InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Page List
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns a page entity list. 
    remote isolated function getDesignPageList(string designId) returns InlineResponse2004|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}/pages`;
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Artboard List
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns a artboard entity list. 
    remote isolated function getDesignArtboardList(string designId) returns InlineResponse2005|error {
        string resourcePath = string `/designs/${getEncodedUri(designId)}/artboards`;
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
