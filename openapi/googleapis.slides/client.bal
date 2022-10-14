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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# This is a generated connector for [Google Slides API v1](https://developers.google.com/slides/api) OpenAPI specification.
# Reads and writes Google Slides presentations.
@display {label: "Google Slides", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://slides.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Creates a blank presentation using the title given in the request. If a `presentationId` is provided, it is used as the ID of the new presentation. Otherwise, a new ID is generated. Other fields in the request, including any provided content, are ignored. Returns the created presentation.
    #
    # + xgafv - V1 error format 
    # + alt - Data format for response 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart") 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart") 
    # + payload - A record of type `Presentation` which contains the necessary data to create a presentation 
    # + return - Successful response 
    remote isolated function createPresentation(Presentation payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Presentation|error {
        string resourcePath = string `/v1/presentations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Presentation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the latest version of the specified presentation.
    #
    # + xgafv - V1 error format 
    # + alt - Data format for response 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart") 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart") 
    # + presentationId - The ID of the presentation to retrieve 
    # + return - Successful response 
    remote isolated function getPresentation(string presentationId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Presentation|error {
        string resourcePath = string `/v1/presentations/${getEncodedUri(presentationId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Presentation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the latest version of the specified page in the presentation.
    #
    # + xgafv - V1 error format 
    # + alt - Data format for response 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart") 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart") 
    # + presentationId - The ID of the presentation to retrieve 
    # + pageObjectId - The object ID of the page to retrieve 
    # + return - Successful response 
    remote isolated function getPresentationPage(string presentationId, string pageObjectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Page|error {
        string resourcePath = string `/v1/presentations/${getEncodedUri(presentationId)}/pages/${getEncodedUri(pageObjectId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Page response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generates a thumbnail of the latest version of the specified page in the presentation and returns a URL to the thumbnail image. This request counts as an [expensive read request](/slides/limits) for quota purposes.
    #
    # + xgafv - V1 error format 
    # + alt - Data format for response 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart") 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart") 
    # + presentationId - The ID of the presentation to retrieve 
    # + pageObjectId - The object ID of the page whose thumbnail to retrieve 
    # + thumbnailpropertiesMimetype - The optional mime type of the thumbnail image. If you don't specify the mime type, the mime type defaults to PNG 
    # + thumbnailpropertiesThumbnailsize - The optional thumbnail image size. If you don't specify the size, the server chooses a default size of the image 
    # + return - Successful response 
    remote isolated function getPresentationPageThumbnail(string presentationId, string pageObjectId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? thumbnailpropertiesMimetype = (), string? thumbnailpropertiesThumbnailsize = ()) returns Thumbnail|error {
        string resourcePath = string `/v1/presentations/${getEncodedUri(presentationId)}/pages/${getEncodedUri(pageObjectId)}/thumbnail`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "thumbnailProperties.mimeType": thumbnailpropertiesMimetype, "thumbnailProperties.thumbnailSize": thumbnailpropertiesThumbnailsize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Thumbnail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Applies one or more updates to the presentation. Each request is validated before being applied. If any request is not valid, then the entire request will fail and nothing will be applied. Some requests have replies to give you some information about how they are applied. Other requests do not need to return information; these each return an empty reply. The order of replies matches that of the requests. For example, suppose you call batchUpdate with four updates, and only the third one returns information. The response would have two empty replies: the reply to the third request, and another empty reply, in that order. Because other users may be editing the presentation, the presentation might not exactly reflect your changes: your changes may be altered with respect to collaborator changes. If there are no collaborators, the presentation should reflect your changes. In any case, the updates in your request are guaranteed to be applied together atomically.
    #
    # + xgafv - V1 error format 
    # + alt - Data format for response 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart") 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart") 
    # + presentationId - The presentation to apply the updates to 
    # + payload - A record of type `BatchUpdatePresentationRequest` which contains the necessary data to make one or more updates to the presentation 
    # + return - Successful response 
    remote isolated function batchUpdatePresentations(string presentationId, BatchUpdatePresentationRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BatchUpdatePresentationResponse|error {
        string resourcePath = string `/v1/presentations/${getEncodedUri(presentationId)}:batchUpdate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchUpdatePresentationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
