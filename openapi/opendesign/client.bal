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

import ballerina/http;
import ballerina/mime;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
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
|};

# This is a generated connector for [Open Design REST API v0.3.4](https://opendesign.dev/docs/api-reference/introduction) OpenAPI specification. 
# Open Design read and display data from designs using code. Unlock the power of programmatic design.
@display {label: "opendesign", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Open Design account](https://opendesign.dev) and obtain tokens by following [this guide](https://opendesign.dev/docs/api-reference/introduction#step-1-get-your-api-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.opendesign.dev") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
        string resourcePath = string `/designs/${designId}`;
        DesignProcessing|InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start Design Export
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + payload - Design export target 
    # + return - Returns the started design export task entity. 
    remote isolated function postDesignExport(string designId, DesignIdExportsBody payload) returns DesignExport|error {
        string resourcePath = string `/designs/${designId}/exports`;
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
        string resourcePath = string `/designs/${designId}/exports/${exportId}`;
        DesignExport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Design Summary
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns an extended design entity with the complete page and artboard entity lists or the processing status of the design. 
    remote isolated function getDesignSummary(string designId) returns DesignProcessing|InlineResponse2003|error {
        string resourcePath = string `/designs/${designId}/summary`;
        DesignProcessing|InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Page List
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns a page entity list. 
    remote isolated function getDesignPageList(string designId) returns InlineResponse2004|error {
        string resourcePath = string `/designs/${designId}/pages`;
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Artboard List
    #
    # + designId - A unique identifier (UUID) of an imported design file. 
    # + return - Returns a artboard entity list. 
    remote isolated function getDesignArtboardList(string designId) returns InlineResponse2005|error {
        string resourcePath = string `/designs/${designId}/artboards`;
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
