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

# This is a generated connector for [Google Books API v1](https://developers.google.com/books) OpenAPI specification.
# The Google Books API allows clients to access the Google Books repository.
@display {label: "Google Books", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://books.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Add a user-upload volume and triggers processing.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + driveDocumentId - A drive document id. The upload_client_token must not be set. 
    # + mimeType - The document MIME type. It can be set only if the drive_document_id is set. 
    # + name - The document name. It can be set only if the drive_document_id is set. 
    # + uploadClientToken - Scotty upload token. 
    # + return - Successful response 
    remote isolated function addbookCloudloading(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? driveDocumentId = (), string? mimeType = (), string? name = (), string? uploadClientToken = ()) returns BooksCloudloadingResource|error {
        string resourcePath = string `/books/v1/cloudloading/addBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "drive_document_id": driveDocumentId, "mime_type": mimeType, "name": name, "upload_client_token": uploadClientToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BooksCloudloadingResource response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Remove the book and its contents.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The id of the book to be removed. 
    # + return - Successful response 
    remote isolated function deletebookCloudloading(string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/cloudloading/deleteBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Updates a user-upload volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - Books cloudloading resource request 
    # + return - Successful response 
    remote isolated function updatebookCloudloading(BooksCloudloadingResource payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BooksCloudloadingResource|error {
        string resourcePath = string `/books/v1/cloudloading/updateBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BooksCloudloadingResource response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of offline dictionary metadata available.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + cpksver - The device/version ID from which to request the data. 
    # + return - Successful response 
    remote isolated function listofflinemetadataDictionary(string cpksver, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Metadata|error {
        string resourcePath = string `/books/v1/dictionary/listOfflineMetadata`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "cpksver": cpksver};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Metadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets information regarding the family that the user is part of.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getfamilyinfoFamilysharing(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns FamilyInfo|error {
        string resourcePath = string `/books/v1/familysharing/getFamilyInfo`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FamilyInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Initiates sharing of the content with the user's family. Empty response indicates success.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + docId - The docid to share. 
    # + 'source - String to identify the originator of this request. 
    # + volumeId - The volume to share. 
    # + return - Successful response 
    remote isolated function shareFamilysharing(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? docId = (), string? 'source = (), string? volumeId = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/familysharing/share`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "docId": docId, "source": 'source, "volumeId": volumeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Initiates revoking content that has already been shared with the user's family. Empty response indicates success.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + docId - The docid to unshare. 
    # + 'source - String to identify the originator of this request. 
    # + volumeId - The volume to unshare. 
    # + return - Successful response 
    remote isolated function unshareFamilysharing(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? docId = (), string? 'source = (), string? volumeId = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/familysharing/unshare`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "docId": docId, "source": 'source, "volumeId": volumeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets the current settings for the user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + country - Unused. Added only to workaround TEX mandatory request template requirement 
    # + return - Successful response 
    remote isolated function getusersettingsMyconfig(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = ()) returns Usersettings|error {
        string resourcePath = string `/books/v1/myconfig/getUserSettings`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Usersettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Release downloaded content access restriction.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + cpksver - The device/version ID from which to release the restriction. 
    # + volumeIds - The volume(s) to release restrictions for. 
    # + locale - ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function releasedownloadaccessMyconfig(string cpksver, string[] volumeIds, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns DownloadAccesses|error {
        string resourcePath = string `/books/v1/myconfig/releaseDownloadAccess`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "cpksver": cpksver, "volumeIds": volumeIds, "locale": locale, "source": 'source};
        map<Encoding> queryParamEncoding = {"volumeIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        DownloadAccesses response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Request concurrent and download access restrictions.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + cpksver - The device/version ID from which to request the restrictions. 
    # + nonce - The client nonce value. 
    # + 'source - String to identify the originator of this request. 
    # + volumeId - The volume to request concurrent/download restrictions for. 
    # + licenseTypes - The type of access license to request. If not specified, the default is BOTH. 
    # + locale - ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US. 
    # + return - Successful response 
    remote isolated function requestaccessMyconfig(string cpksver, string nonce, string 'source, string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? licenseTypes = (), string? locale = ()) returns RequestAccessData|error {
        string resourcePath = string `/books/v1/myconfig/requestAccess`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "cpksver": cpksver, "nonce": nonce, "source": 'source, "volumeId": volumeId, "licenseTypes": licenseTypes, "locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        RequestAccessData response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Request downloaded content access for specified volumes on the My eBooks shelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + cpksver - The device/version ID from which to release the restriction. 
    # + nonce - The client nonce value. 
    # + 'source - String to identify the originator of this request. 
    # + features - List of features supported by the client, i.e., 'RENTALS' 
    # + includeNonComicsSeries - Set to true to include non-comics series. Defaults to false. 
    # + locale - ISO-639-1, ISO-3166-1 codes for message localization, i.e. en_US. 
    # + showPreorders - Set to true to show pre-ordered books. Defaults to false. 
    # + volumeIds - The volume(s) to request download restrictions for. 
    # + return - Successful response 
    remote isolated function syncvolumelicensesMyconfig(string cpksver, string nonce, string 'source, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? features = (), boolean? includeNonComicsSeries = (), string? locale = (), boolean? showPreorders = (), string[]? volumeIds = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/myconfig/syncVolumeLicenses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "cpksver": cpksver, "nonce": nonce, "source": 'source, "features": features, "includeNonComicsSeries": includeNonComicsSeries, "locale": locale, "showPreorders": showPreorders, "volumeIds": volumeIds};
        map<Encoding> queryParamEncoding = {"features": {style: FORM, explode: true}, "volumeIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        Volumes response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Sets the settings for the user. If a sub-object is specified, it will overwrite the existing sub-object stored in the server. Unspecified sub-objects will retain the existing value.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - A record of type `Usersettings` which contains the necessary data to set settings for user. 
    # + return - Successful response 
    remote isolated function updateusersettingsMyconfig(Usersettings payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Usersettings|error {
        string resourcePath = string `/books/v1/myconfig/updateUserSettings`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Usersettings response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a list of annotations, possibly filtered.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + contentVersion - The content version for the requested volume. 
    # + layerId - The layer ID to limit annotation by. 
    # + layerIds - The layer ID(s) to limit annotation by. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - The value of the nextToken from the previous page. 
    # + showDeleted - Set to true to return deleted annotations. updatedMin must be in the request to use this. Defaults to false. 
    # + 'source - String to identify the originator of this request. 
    # + updatedMax - RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive). 
    # + updatedMin - RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive). 
    # + volumeId - The volume to restrict annotations to. 
    # + return - Successful response 
    remote isolated function listMylibraryAnnotations(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? layerId = (), string[]? layerIds = (), int? maxResults = (), string? pageToken = (), boolean? showDeleted = (), string? 'source = (), string? updatedMax = (), string? updatedMin = (), string? volumeId = ()) returns Annotations|error {
        string resourcePath = string `/books/v1/mylibrary/annotations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "layerId": layerId, "layerIds": layerIds, "maxResults": maxResults, "pageToken": pageToken, "showDeleted": showDeleted, "source": 'source, "updatedMax": updatedMax, "updatedMin": updatedMin, "volumeId": volumeId};
        map<Encoding> queryParamEncoding = {"layerIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Annotations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Inserts a new annotation.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + annotationId - The ID for the annotation to insert. 
    # + country - ISO-3166-1 code to override the IP-based location. 
    # + showOnlySummaryInResponse - Requests that only the summary of the specified layer be provided in the response. 
    # + 'source - String to identify the originator of this request. 
    # + payload - Annotation request 
    # + return - Successful response 
    remote isolated function insertMylibraryAnnotations(Annotation payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? annotationId = (), string? country = (), boolean? showOnlySummaryInResponse = (), string? 'source = ()) returns Annotation|error {
        string resourcePath = string `/books/v1/mylibrary/annotations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "annotationId": annotationId, "country": country, "showOnlySummaryInResponse": showOnlySummaryInResponse, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Annotation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the summary of specified layers.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + layerIds - Array of layer IDs to get the summary for. 
    # + volumeId - Volume id to get the summary for. 
    # + return - Successful response 
    remote isolated function summaryMylibraryAnnotations(string[] layerIds, string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnnotationsSummary|error {
        string resourcePath = string `/books/v1/mylibrary/annotations/summary`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "layerIds": layerIds, "volumeId": volumeId};
        map<Encoding> queryParamEncoding = {"layerIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        //TODO: Update the request as needed;
        AnnotationsSummary response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Updates an existing annotation.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + annotationId - The ID for the annotation to update. 
    # + 'source - String to identify the originator of this request. 
    # + payload - Annotation request 
    # + return - Successful response 
    remote isolated function updateMylibraryAnnotations(string annotationId, Annotation payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Annotation|error {
        string resourcePath = string `/books/v1/mylibrary/annotations/${getEncodedUri(annotationId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Annotation response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an annotation.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + annotationId - The ID for the annotation to delete. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function deleteMylibraryAnnotations(string annotationId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/annotations/${getEncodedUri(annotationId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves a list of bookshelves belonging to the authenticated user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function listMylibraryBookshelves(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelves|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Bookshelves response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves metadata for a specific bookshelf belonging to the authenticated user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - ID of bookshelf to retrieve. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getMylibraryBookshelves(string shelf, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelf|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Bookshelf response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a volume to a bookshelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - ID of bookshelf to which to add a volume. 
    # + volumeId - ID of volume to add. 
    # + reason - The reason for which the book is added to the library. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function addvolumeMylibraryBookshelves(string shelf, string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? reason = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}/addVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "reason": reason, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Clears all volumes from a bookshelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - ID of bookshelf from which to remove a volume. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function clearvolumesMylibraryBookshelves(string shelf, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}/clearVolumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Moves a volume within a bookshelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - ID of bookshelf with the volume. 
    # + volumeId - ID of volume to move. 
    # + volumePosition - Position on shelf to move the item (0 puts the item before the current first item, 1 puts it between the first and the second and so on.) 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function movevolumeMylibraryBookshelves(string shelf, string volumeId, int volumePosition, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}/moveVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "volumePosition": volumePosition, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Removes a volume from a bookshelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - ID of bookshelf from which to remove a volume. 
    # + volumeId - ID of volume to remove. 
    # + reason - The reason for which the book is removed from the library. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function removevolumeMylibraryBookshelves(string shelf, string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? reason = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}/removeVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "reason": reason, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets volume information for volumes on a bookshelf.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + shelf - The bookshelf ID or name retrieve volumes for. 
    # + country - ISO-3166-1 code to override the IP-based location. 
    # + maxResults - Maximum number of results to return 
    # + projection - Restrict information returned to a set of selected fields. 
    # + q - Full-text search query string in this bookshelf. 
    # + showPreorders - Set to true to show pre-ordered books. Defaults to false. 
    # + 'source - String to identify the originator of this request. 
    # + startIndex - Index of the first element to return (starts at 0) 
    # + return - Successful response 
    remote isolated function listMylibraryBookshelvesVolumes(string shelf, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = (), int? maxResults = (), string? projection = (), string? q = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/mylibrary/bookshelves/${getEncodedUri(shelf)}/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "maxResults": maxResults, "projection": projection, "q": q, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves my reading position information for a volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - ID of volume for which to retrieve a reading position. 
    # + contentVersion - Volume content version for which this reading position is requested. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getMylibraryReadingpositions(string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? 'source = ()) returns ReadingPosition|error {
        string resourcePath = string `/books/v1/mylibrary/readingpositions/${getEncodedUri(volumeId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ReadingPosition response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets my reading position information for a volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - ID of volume for which to update the reading position. 
    # + position - Position string for the new volume reading position. 
    # + timestamp - RFC 3339 UTC format timestamp associated with this reading position. 
    # + action - Action that caused this reading position to be set. 
    # + contentVersion - Volume content version for which this reading position applies. 
    # + deviceCookie - Random persistent device cookie optional on set position. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function setpositionMylibraryReadingpositions(string volumeId, string position, string timestamp, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? action = (), string? contentVersion = (), string? deviceCookie = (), string? 'source = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/mylibrary/readingpositions/${getEncodedUri(volumeId)}/setPosition`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "position": position, "timestamp": timestamp, "action": action, "contentVersion": contentVersion, "deviceCookie": deviceCookie, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns notification details for a given notification id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + notificationId - String to identify the notification. 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating notification title and body. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getNotification(string notificationId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns Notification|error {
        string resourcePath = string `/books/v1/notification/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "notification_id": notificationId, "locale": locale, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Notification response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List categories for onboarding experience.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset. 
    # + return - Successful response 
    remote isolated function listcategoriesOnboarding(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = ()) returns Category|error {
        string resourcePath = string `/books/v1/onboarding/listCategories`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Category response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List available volumes under categories for onboarding experience.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + categoryId - List of category ids requested. 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset. 
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned volumes. Books with a higher maturity rating are filtered out. 
    # + pageSize - Number of maximum results per page to be included in the response. 
    # + pageToken - The value of the nextToken from the previous page. 
    # + return - Successful response 
    remote isolated function listcategoryvolumesOnboarding(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? categoryId = (), string? locale = (), string? maxAllowedMaturityRating = (), int? pageSize = (), string? pageToken = ()) returns Volume2|error {
        string resourcePath = string `/books/v1/onboarding/listCategoryVolumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "categoryId": categoryId, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "pageSize": pageSize, "pageToken": pageToken};
        map<Encoding> queryParamEncoding = {"categoryId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Volume2 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a stream of personalized book clusters.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations. 
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getPersonalizedstream(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? maxAllowedMaturityRating = (), string? 'source = ()) returns Discoveryclusters|error {
        string resourcePath = string `/books/v1/personalizedstream/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Discoveryclusters response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Accepts the promo offer.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + androidId - device android_id 
    # + device - device 
    # + manufacturer - device manufacturer 
    # + model - device model 
    # + offerId - offer id 
    # + product - device product 
    # + serial - device serial 
    # + volumeId - Volume id to exercise the offer 
    # + return - Successful response 
    remote isolated function acceptPromooffer(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? offerId = (), string? product = (), string? serial = (), string? volumeId = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/promooffer/accept`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "offerId": offerId, "product": product, "serial": serial, "volumeId": volumeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Marks the promo offer as dismissed.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + androidId - device android_id 
    # + device - device device 
    # + manufacturer - device manufacturer 
    # + model - device model 
    # + offerId - Offer to dimiss 
    # + product - device product 
    # + serial - device serial 
    # + return - Successful response 
    remote isolated function dismissPromooffer(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? offerId = (), string? product = (), string? serial = ()) returns http:Response|error {
        string resourcePath = string `/books/v1/promooffer/dismiss`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "offerId": offerId, "product": product, "serial": serial};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of promo offers available to the user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + androidId - device android_id 
    # + device - device device 
    # + manufacturer - device manufacturer 
    # + model - device model 
    # + product - device product 
    # + serial - device serial 
    # + return - Successful response 
    remote isolated function getPromooffer(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? product = (), string? serial = ()) returns Offers|error {
        string resourcePath = string `/books/v1/promooffer/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "product": product, "serial": serial};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Offers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns Series metadata for the given series ids.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + seriesId - String that identifies the series 
    # + return - Successful response 
    remote isolated function getSeries(string[] seriesId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Series|error {
        string resourcePath = string `/books/v1/series/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "series_id": seriesId};
        map<Encoding> queryParamEncoding = {"series_id": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Series response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns Series membership data given the series id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + seriesId - String that identifies the series 
    # + pageSize - Number of maximum results per page to be included in the response. 
    # + pageToken - The value of the nextToken from the previous page. 
    # + return - Successful response 
    remote isolated function getSeriesMembership(string seriesId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns Seriesmembership|error {
        string resourcePath = string `/books/v1/series/membership/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "series_id": seriesId, "page_size": pageSize, "page_token": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Seriesmembership response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a list of public bookshelves for the specified user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - ID of user for whom to retrieve bookshelves. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function listBookshelves(string userId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelves|error {
        string resourcePath = string `/books/v1/users/${getEncodedUri(userId)}/bookshelves`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Bookshelves response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves metadata for a specific bookshelf for the specified user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - ID of user for whom to retrieve bookshelves. 
    # + shelf - ID of bookshelf to retrieve. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getBookshelves(string userId, string shelf, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelf|error {
        string resourcePath = string `/books/v1/users/${getEncodedUri(userId)}/bookshelves/${getEncodedUri(shelf)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Bookshelf response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves volumes in a specific bookshelf for the specified user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + userId - ID of user for whom to retrieve bookshelf volumes. 
    # + shelf - ID of bookshelf to retrieve volumes. 
    # + maxResults - Maximum number of results to return 
    # + showPreorders - Set to true to show pre-ordered books. Defaults to false. 
    # + 'source - String to identify the originator of this request. 
    # + startIndex - Index of the first element to return (starts at 0) 
    # + return - Successful response 
    remote isolated function listBookshelvesVolumes(string userId, string shelf, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/users/${getEncodedUri(userId)}/bookshelves/${getEncodedUri(shelf)}/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Performs a book search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + q - Full-text search query string. 
    # + download - Restrict to volumes by download availability. 
    # + filter - Filter search results. 
    # + langRestrict - Restrict results to books with this language code. 
    # + libraryRestrict - Restrict search to this user's library. 
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out. 
    # + maxResults - Maximum number of results to return. 
    # + orderBy - Sort search results. 
    # + partner - Restrict and brand results for partner ID. 
    # + printType - Restrict to books or magazines. 
    # + projection - Restrict information returned to a set of selected fields. 
    # + showPreorders - Set to true to show books available for preorder. Defaults to false. 
    # + 'source - String to identify the originator of this request. 
    # + startIndex - Index of the first result to return (starts at 0) 
    # + return - Successful response 
    remote isolated function listVolumes(string q, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? download = (), string? filter = (), string? langRestrict = (), string? libraryRestrict = (), string? maxAllowedMaturityRating = (), int? maxResults = (), string? orderBy = (), string? partner = (), string? printType = (), string? projection = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "q": q, "download": download, "filter": filter, "langRestrict": langRestrict, "libraryRestrict": libraryRestrict, "maxAllowedMaturityRating": maxAllowedMaturityRating, "maxResults": maxResults, "orderBy": orderBy, "partner": partner, "printType": printType, "projection": projection, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return a list of books in My Library.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + acquireMethod - How the book was acquired 
    # + country - ISO-3166-1 code to override the IP-based location. 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex:'en_US'. Used for generating recommendations. 
    # + maxResults - Maximum number of results to return. 
    # + processingState - The processing state of the user uploaded volumes to be returned. Applicable only if the UPLOADED is specified in the acquireMethod. 
    # + 'source - String to identify the originator of this request. 
    # + startIndex - Index of the first result to return (starts at 0) 
    # + return - Successful response 
    remote isolated function listVolumesMybooks(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? acquireMethod = (), string? country = (), string? locale = (), int? maxResults = (), string[]? processingState = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/volumes/mybooks`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "acquireMethod": acquireMethod, "country": country, "locale": locale, "maxResults": maxResults, "processingState": processingState, "source": 'source, "startIndex": startIndex};
        map<Encoding> queryParamEncoding = {"acquireMethod": {style: FORM, explode: true}, "processingState": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return a list of recommended books for the current user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations. 
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function listVolumesRecommended(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? maxAllowedMaturityRating = (), string? 'source = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/volumes/recommended`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Rate a recommended book for the current user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + rating - Rating to be given to the volume. 
    # + volumeId - ID of the source volume. 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function rateVolumesRecommended(string rating, string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns BooksVolumesRecommendedRateResponse|error {
        string resourcePath = string `/books/v1/volumes/recommended/rate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "rating": rating, "volumeId": volumeId, "locale": locale, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BooksVolumesRecommendedRateResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Return a list of books uploaded by the current user.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations. 
    # + maxResults - Maximum number of results to return. 
    # + processingState - The processing state of the user uploaded volumes to be returned. 
    # + 'source - String to identify the originator of this request. 
    # + startIndex - Index of the first result to return (starts at 0) 
    # + volumeId - The ids of the volumes to be returned. If not specified all that match the processingState are returned. 
    # + return - Successful response 
    remote isolated function listVolumesUseruploaded(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), int? maxResults = (), string[]? processingState = (), string? 'source = (), int? startIndex = (), string[]? volumeId = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/volumes/useruploaded`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "maxResults": maxResults, "processingState": processingState, "source": 'source, "startIndex": startIndex, "volumeId": volumeId};
        map<Encoding> queryParamEncoding = {"processingState": {style: FORM, explode: true}, "volumeId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets volume information for a single volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - ID of volume to retrieve. 
    # + country - ISO-3166-1 code to override the IP-based location. 
    # + includeNonComicsSeries - Set to true to include non-comics series. Defaults to false. 
    # + partner - Brand results for partner ID. 
    # + projection - Restrict information returned to a set of selected fields. 
    # + 'source - string to identify the originator of this request. 
    # + userLibraryConsistentRead - user library consistent read status 
    # + return - Successful response 
    remote isolated function getVolumes(string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = (), boolean? includeNonComicsSeries = (), string? partner = (), string? projection = (), string? 'source = (), boolean? userLibraryConsistentRead = ()) returns Volume|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "includeNonComicsSeries": includeNonComicsSeries, "partner": partner, "projection": projection, "source": 'source, "user_library_consistent_read": userLibraryConsistentRead};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volume response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return a list of associated books.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - ID of the source volume. 
    # + association - Association type. 
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations. 
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function listVolumesAssociated(string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? association = (), string? locale = (), string? maxAllowedMaturityRating = (), string? 'source = ()) returns Volumes|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/associated`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "association": association, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the volume annotations for a volume and layer.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve annotations for. 
    # + layerId - The ID for the layer to get the annotations. 
    # + contentVersion - The content version for the requested volume. 
    # + endOffset - The end offset to end retrieving data from. 
    # + endPosition - The end position to end retrieving data from. 
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - The value of the nextToken from the previous page. 
    # + showDeleted - Set to true to return deleted annotations. updatedMin must be in the request to use this. Defaults to false. 
    # + 'source - String to identify the originator of this request. 
    # + startOffset - The start offset to start retrieving data from. 
    # + startPosition - The start position to start retrieving data from. 
    # + updatedMax - RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive). 
    # + updatedMin - RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive). 
    # + volumeAnnotationsVersion - The version of the volume annotations that you are requesting. 
    # + return - Successful response 
    remote isolated function listLayersVolumeannotations(string volumeId, string layerId, string contentVersion, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endOffset = (), string? endPosition = (), string? locale = (), int? maxResults = (), string? pageToken = (), boolean? showDeleted = (), string? 'source = (), string? startOffset = (), string? startPosition = (), string? updatedMax = (), string? updatedMin = (), string? volumeAnnotationsVersion = ()) returns Volumeannotations|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layers/${getEncodedUri(layerId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "endOffset": endOffset, "endPosition": endPosition, "locale": locale, "maxResults": maxResults, "pageToken": pageToken, "showDeleted": showDeleted, "source": 'source, "startOffset": startOffset, "startPosition": startPosition, "updatedMax": updatedMax, "updatedMin": updatedMin, "volumeAnnotationsVersion": volumeAnnotationsVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumeannotations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the volume annotation.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve annotations for. 
    # + layerId - The ID for the layer to get the annotations. 
    # + annotationId - The ID of the volume annotation to retrieve. 
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getLayersVolumeannotations(string volumeId, string layerId, string annotationId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns Volumeannotation|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layers/${getEncodedUri(layerId)}/annotations/${getEncodedUri(annotationId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Volumeannotation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the annotation data for a volume and layer.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve annotation data for. 
    # + layerId - The ID for the layer to get the annotation data. 
    # + contentVersion - The content version for the requested volume. 
    # + annotationDataId - The list of Annotation Data Ids to retrieve. Pagination is ignored if this is set. 
    # + h - The requested pixel height for any images. If height is provided width must also be provided. 
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - The value of the nextToken from the previous page. 
    # + scale - The requested scale for the image. 
    # + 'source - String to identify the originator of this request. 
    # + updatedMax - RFC 3339 timestamp to restrict to items updated prior to this timestamp (exclusive). 
    # + updatedMin - RFC 3339 timestamp to restrict to items updated since this timestamp (inclusive). 
    # + w - The requested pixel width for any images. If width is provided height must also be provided. 
    # + return - Successful response 
    remote isolated function listLayersAnnotationdata(string volumeId, string layerId, string contentVersion, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? annotationDataId = (), int? h = (), string? locale = (), int? maxResults = (), string? pageToken = (), int? scale = (), string? 'source = (), string? updatedMax = (), string? updatedMin = (), int? w = ()) returns Annotationsdata|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layers/${getEncodedUri(layerId)}/data`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "annotationDataId": annotationDataId, "h": h, "locale": locale, "maxResults": maxResults, "pageToken": pageToken, "scale": scale, "source": 'source, "updatedMax": updatedMax, "updatedMin": updatedMin, "w": w};
        map<Encoding> queryParamEncoding = {"annotationDataId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Annotationsdata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the annotation data.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve annotations for. 
    # + layerId - The ID for the layer to get the annotations. 
    # + annotationDataId - The ID of the annotation data to retrieve. 
    # + contentVersion - The content version for the volume you are trying to retrieve. 
    # + allowWebDefinitions - For the dictionary layer. Whether or not to allow web definitions. 
    # + h - The requested pixel height for any images. If height is provided width must also be provided. 
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. 
    # + scale - The requested scale for the image. 
    # + 'source - String to identify the originator of this request. 
    # + w - The requested pixel width for any images. If width is provided height must also be provided. 
    # + return - Successful response 
    remote isolated function getLayersAnnotationdata(string volumeId, string layerId, string annotationDataId, string contentVersion, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? allowWebDefinitions = (), int? h = (), string? locale = (), int? scale = (), string? 'source = (), int? w = ()) returns DictionaryAnnotationdata|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layers/${getEncodedUri(layerId)}/data/${getEncodedUri(annotationDataId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "allowWebDefinitions": allowWebDefinitions, "h": h, "locale": locale, "scale": scale, "source": 'source, "w": w};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DictionaryAnnotationdata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List the layer summaries for a volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve layers for. 
    # + contentVersion - The content version for the requested volume. 
    # + maxResults - Maximum number of results to return 
    # + pageToken - The value of the nextToken from the previous page. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function listLayers(string volumeId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), int? maxResults = (), string? pageToken = (), string? 'source = ()) returns Layersummaries|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layersummary`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "maxResults": maxResults, "pageToken": pageToken, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Layersummaries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the layer summary for a volume.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + volumeId - The volume to retrieve layers for. 
    # + summaryId - The ID for the layer to get the summary for. 
    # + contentVersion - The content version for the requested volume. 
    # + 'source - String to identify the originator of this request. 
    # + return - Successful response 
    remote isolated function getLayers(string volumeId, string summaryId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? 'source = ()) returns Layersummary|error {
        string resourcePath = string `/books/v1/volumes/${getEncodedUri(volumeId)}/layersummary/${getEncodedUri(summaryId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "source": 'source};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Layersummary response = check self.clientEp->get(resourcePath);
        return response;
    }
}
