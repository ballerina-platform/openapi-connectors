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
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for communicating with a remote HTTP endpoint.
#
# + authConfig - Configurations related to client authentication
# + secureSocketConfig - SSL/TLS-related configurations  
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# This is a generated connector for [Google Books API v1](https://developers.google.com/books) OpenAPI specification.
# The Google Books API allows clients to access the Google Books repository.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://books.googleapis.com/") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Add a user-upload volume and triggers processing.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + driveDocumentId - A drive document id. The upload_client_token must not be set.
    # + mimeType - The document MIME type. It can be set only if the drive_document_id is set.
    # + name - The document name. It can be set only if the drive_document_id is set.
    # + uploadClientToken - Scotty upload token.
    # + return - Successful response
    remote isolated function addbookCloudloading(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? driveDocumentId = (), string? mimeType = (), string? name = (), string? uploadClientToken = ()) returns BooksCloudloadingResource|error {
        string  path = string `/books/v1/cloudloading/addBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "drive_document_id": driveDocumentId, "mime_type": mimeType, "name": name, "upload_client_token": uploadClientToken};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BooksCloudloadingResource response = check self.clientEp-> post(path, request, targetType = BooksCloudloadingResource);
        return response;
    }
    # Remove the book and its contents.
    #
    # + volumeId - The id of the book to be removed.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deletebookCloudloading(string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Empty|error {
        string  path = string `/books/v1/cloudloading/deleteBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Updates a user-upload volume.
    #
    # + payload - Books cloudloading resource request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updatebookCloudloading(BooksCloudloadingResource payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BooksCloudloadingResource|error {
        string  path = string `/books/v1/cloudloading/updateBook`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BooksCloudloadingResource response = check self.clientEp->post(path, request, targetType=BooksCloudloadingResource);
        return response;
    }
    # Retrieves a list of annotations, possibly filtered.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function listMylibraryAnnotations(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? layerId = (), string[]? layerIds = (), int? maxResults = (), string? pageToken = (), boolean? showDeleted = (), string? 'source = (), string? updatedMax = (), string? updatedMin = (), string? volumeId = ()) returns Annotations|error {
        string  path = string `/books/v1/mylibrary/annotations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "layerId": layerId, "layerIds": layerIds, "maxResults": maxResults, "pageToken": pageToken, "showDeleted": showDeleted, "source": 'source, "updatedMax": updatedMax, "updatedMin": updatedMin, "volumeId": volumeId};
        path = path + check getPathForQueryParam(queryParam);
        Annotations response = check self.clientEp-> get(path, targetType = Annotations);
        return response;
    }
    # Inserts a new annotation.
    #
    # + payload - Annotation request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + annotationId - The ID for the annotation to insert.
    # + country - ISO-3166-1 code to override the IP-based location.
    # + showOnlySummaryInResponse - Requests that only the summary of the specified layer be provided in the response.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function insertMylibraryAnnotations(Annotation payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? annotationId = (), string? country = (), boolean? showOnlySummaryInResponse = (), string? 'source = ()) returns Annotation|error {
        string  path = string `/books/v1/mylibrary/annotations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "annotationId": annotationId, "country": country, "showOnlySummaryInResponse": showOnlySummaryInResponse, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Annotation response = check self.clientEp->post(path, request, targetType=Annotation);
        return response;
    }
    # Gets the summary of specified layers.
    #
    # + layerIds - Array of layer IDs to get the summary for.
    # + volumeId - Volume id to get the summary for.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function summaryMylibraryAnnotations(string[] layerIds, string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AnnotationsSummary|error {
        string  path = string `/books/v1/mylibrary/annotations/summary`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "layerIds": layerIds, "volumeId": volumeId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        AnnotationsSummary response = check self.clientEp-> post(path, request, targetType = AnnotationsSummary);
        return response;
    }
    # Updates an existing annotation.
    #
    # + annotationId - The ID for the annotation to update.
    # + payload - Annotation request
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function updateMylibraryAnnotations(string annotationId, Annotation payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Annotation|error {
        string  path = string `/books/v1/mylibrary/annotations/${annotationId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Annotation response = check self.clientEp->put(path, request, targetType=Annotation);
        return response;
    }
    # Deletes an annotation.
    #
    # + annotationId - The ID for the annotation to delete.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function deleteMylibraryAnnotations(string annotationId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/annotations/${annotationId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> delete(path, request, targetType = Empty);
        return response;
    }
    # Retrieves a list of bookshelves belonging to the authenticated user.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function listMylibraryBookshelves(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelves|error {
        string  path = string `/books/v1/mylibrary/bookshelves`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Bookshelves response = check self.clientEp-> get(path, targetType = Bookshelves);
        return response;
    }
    # Retrieves metadata for a specific bookshelf belonging to the authenticated user.
    #
    # + shelf - ID of bookshelf to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getMylibraryBookshelves(string shelf, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelf|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Bookshelf response = check self.clientEp-> get(path, targetType = Bookshelf);
        return response;
    }
    # Adds a volume to a bookshelf.
    #
    # + shelf - ID of bookshelf to which to add a volume.
    # + volumeId - ID of volume to add.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + reason - The reason for which the book is added to the library.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function addvolumeMylibraryBookshelves(string shelf, string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? reason = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}/addVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "reason": reason, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Clears all volumes from a bookshelf.
    #
    # + shelf - ID of bookshelf from which to remove a volume.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function clearvolumesMylibraryBookshelves(string shelf, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}/clearVolumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Moves a volume within a bookshelf.
    #
    # + shelf - ID of bookshelf with the volume.
    # + volumeId - ID of volume to move.
    # + volumePosition - Position on shelf to move the item (0 puts the item before the current first item, 1 puts it between the first and the second and so on.)
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function movevolumeMylibraryBookshelves(string shelf, string volumeId, int volumePosition, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}/moveVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "volumePosition": volumePosition, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Removes a volume from a bookshelf.
    #
    # + shelf - ID of bookshelf from which to remove a volume.
    # + volumeId - ID of volume to remove.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + reason - The reason for which the book is removed from the library.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function removevolumeMylibraryBookshelves(string shelf, string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? reason = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}/removeVolume`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "volumeId": volumeId, "reason": reason, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Gets volume information for volumes on a bookshelf.
    #
    # + shelf - The bookshelf ID or name retrieve volumes for.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + country - ISO-3166-1 code to override the IP-based location.
    # + maxResults - Maximum number of results to return
    # + projection - Restrict information returned to a set of selected fields.
    # + q - Full-text search query string in this bookshelf.
    # + showPreorders - Set to true to show pre-ordered books. Defaults to false.
    # + 'source - String to identify the originator of this request.
    # + startIndex - Index of the first element to return (starts at 0)
    # + return - Successful response
    remote isolated function listMylibraryBookshelvesVolumes(string shelf, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = (), int? maxResults = (), string? projection = (), string? q = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string  path = string `/books/v1/mylibrary/bookshelves/${shelf}/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "maxResults": maxResults, "projection": projection, "q": q, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Retrieves my reading position information for a volume.
    #
    # + volumeId - ID of volume for which to retrieve a reading position.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + contentVersion - Volume content version for which this reading position is requested.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getMylibraryReadingpositions(string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? 'source = ()) returns ReadingPosition|error {
        string  path = string `/books/v1/mylibrary/readingpositions/${volumeId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        ReadingPosition response = check self.clientEp-> get(path, targetType = ReadingPosition);
        return response;
    }
    # Sets my reading position information for a volume.
    #
    # + volumeId - ID of volume for which to update the reading position.
    # + position - Position string for the new volume reading position.
    # + timestamp - RFC 3339 UTC format timestamp associated with this reading position.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + action - Action that caused this reading position to be set.
    # + contentVersion - Volume content version for which this reading position applies.
    # + deviceCookie - Random persistent device cookie optional on set position.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function setpositionMylibraryReadingpositions(string volumeId, string position, string timestamp, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? action = (), string? contentVersion = (), string? deviceCookie = (), string? 'source = ()) returns Empty|error {
        string  path = string `/books/v1/mylibrary/readingpositions/${volumeId}/setPosition`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "position": position, "timestamp": timestamp, "action": action, "contentVersion": contentVersion, "deviceCookie": deviceCookie, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Returns notification details for a given notification id.
    #
    # + notificationId - String to identify the notification.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating notification title and body.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getNotification(string notificationId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns Notification|error {
        string  path = string `/books/v1/notification/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "notification_id": notificationId, "locale": locale, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Notification response = check self.clientEp-> get(path, targetType = Notification);
        return response;
    }
    # List categories for onboarding experience.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset.
    # + return - Successful response
    remote isolated function listcategoriesOnboarding(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = ()) returns Category|error {
        string  path = string `/books/v1/onboarding/listCategories`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale};
        path = path + check getPathForQueryParam(queryParam);
        Category response = check self.clientEp-> get(path, targetType = Category);
        return response;
    }
    # List available volumes under categories for onboarding experience.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + categoryId - List of category ids requested.
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Default is en-US if unset.
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned volumes. Books with a higher maturity rating are filtered out.
    # + pageSize - Number of maximum results per page to be included in the response.
    # + pageToken - The value of the nextToken from the previous page.
    # + return - Successful response
    remote isolated function listcategoryvolumesOnboarding(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? categoryId = (), string? locale = (), string? maxAllowedMaturityRating = (), int? pageSize = (), string? pageToken = ()) returns Volume2|error {
        string  path = string `/books/v1/onboarding/listCategoryVolumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "categoryId": categoryId, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        Volume2 response = check self.clientEp-> get(path, targetType = Volume2);
        return response;
    }
    # Accepts the promo offer.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function acceptPromooffer(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? offerId = (), string? product = (), string? serial = (), string? volumeId = ()) returns Empty|error {
        string  path = string `/books/v1/promooffer/accept`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "offerId": offerId, "product": product, "serial": serial, "volumeId": volumeId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Marks the promo offer as dismissed.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function dismissPromooffer(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? offerId = (), string? product = (), string? serial = ()) returns Empty|error {
        string  path = string `/books/v1/promooffer/dismiss`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "offerId": offerId, "product": product, "serial": serial};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Empty response = check self.clientEp-> post(path, request, targetType = Empty);
        return response;
    }
    # Returns a list of promo offers available to the user.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function getPromooffer(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? androidId = (), string? device = (), string? manufacturer = (), string? model = (), string? product = (), string? serial = ()) returns Offers|error {
        string  path = string `/books/v1/promooffer/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "androidId": androidId, "device": device, "manufacturer": manufacturer, "model": model, "product": product, "serial": serial};
        path = path + check getPathForQueryParam(queryParam);
        Offers response = check self.clientEp-> get(path, targetType = Offers);
        return response;
    }
    # Returns Series metadata for the given series ids.
    #
    # + seriesId - String that identifies the series
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getSeries(string[] seriesId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Series|error {
        string  path = string `/books/v1/series/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "series_id": seriesId};
        path = path + check getPathForQueryParam(queryParam);
        Series response = check self.clientEp-> get(path, targetType = Series);
        return response;
    }
    # Returns Series membership data given the series id.
    #
    # + seriesId - String that identifies the series
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - Number of maximum results per page to be included in the response.
    # + pageToken - The value of the nextToken from the previous page.
    # + return - Successful response
    remote isolated function getSeriesMembership(string seriesId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns Seriesmembership|error {
        string  path = string `/books/v1/series/membership/get`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "series_id": seriesId, "page_size": pageSize, "page_token": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        Seriesmembership response = check self.clientEp-> get(path, targetType = Seriesmembership);
        return response;
    }
    # Retrieves a list of public bookshelves for the specified user.
    #
    # + userId - ID of user for whom to retrieve bookshelves.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function listBookshelves(string userId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelves|error {
        string  path = string `/books/v1/users/${userId}/bookshelves`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Bookshelves response = check self.clientEp-> get(path, targetType = Bookshelves);
        return response;
    }
    # Retrieves metadata for a specific bookshelf for the specified user.
    #
    # + userId - ID of user for whom to retrieve bookshelves.
    # + shelf - ID of bookshelf to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getBookshelves(string userId, string shelf, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? 'source = ()) returns Bookshelf|error {
        string  path = string `/books/v1/users/${userId}/bookshelves/${shelf}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Bookshelf response = check self.clientEp-> get(path, targetType = Bookshelf);
        return response;
    }
    # Retrieves volumes in a specific bookshelf for the specified user.
    #
    # + userId - ID of user for whom to retrieve bookshelf volumes.
    # + shelf - ID of bookshelf to retrieve volumes.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + maxResults - Maximum number of results to return
    # + showPreorders - Set to true to show pre-ordered books. Defaults to false.
    # + 'source - String to identify the originator of this request.
    # + startIndex - Index of the first element to return (starts at 0)
    # + return - Successful response
    remote isolated function listBookshelvesVolumes(string userId, string shelf, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? maxResults = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string  path = string `/books/v1/users/${userId}/bookshelves/${shelf}/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "maxResults": maxResults, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Performs a book search.
    #
    # + q - Full-text search query string.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
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
    remote isolated function listVolumes(string q, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? download = (), string? filter = (), string? langRestrict = (), string? libraryRestrict = (), string? maxAllowedMaturityRating = (), int? maxResults = (), string? orderBy = (), string? partner = (), string? printType = (), string? projection = (), boolean? showPreorders = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string  path = string `/books/v1/volumes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "q": q, "download": download, "filter": filter, "langRestrict": langRestrict, "libraryRestrict": libraryRestrict, "maxAllowedMaturityRating": maxAllowedMaturityRating, "maxResults": maxResults, "orderBy": orderBy, "partner": partner, "printType": printType, "projection": projection, "showPreorders": showPreorders, "source": 'source, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Return a list of books in My Library.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function listVolumesMybooks(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? acquireMethod = (), string? country = (), string? locale = (), int? maxResults = (), string[]? processingState = (), string? 'source = (), int? startIndex = ()) returns Volumes|error {
        string  path = string `/books/v1/volumes/mybooks`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "acquireMethod": acquireMethod, "country": country, "locale": locale, "maxResults": maxResults, "processingState": processingState, "source": 'source, "startIndex": startIndex};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Return a list of recommended books for the current user.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations.
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function listVolumesRecommended(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? maxAllowedMaturityRating = (), string? 'source = ()) returns Volumes|error {
        string  path = string `/books/v1/volumes/recommended`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Rate a recommended book for the current user.
    #
    # + rating - Rating to be given to the volume.
    # + volumeId - ID of the source volume.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function rateVolumesRecommended(string rating, string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns BooksVolumesRecommendedRateResponse|error {
        string  path = string `/books/v1/volumes/recommended/rate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "rating": rating, "volumeId": volumeId, "locale": locale, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BooksVolumesRecommendedRateResponse response = check self.clientEp-> post(path, request, targetType = BooksVolumesRecommendedRateResponse);
        return response;
    }
    # Return a list of books uploaded by the current user.
    #
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
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
    remote isolated function listVolumesUseruploaded(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), int? maxResults = (), string[]? processingState = (), string? 'source = (), int? startIndex = (), string[]? volumeId = ()) returns Volumes|error {
        string  path = string `/books/v1/volumes/useruploaded`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "maxResults": maxResults, "processingState": processingState, "source": 'source, "startIndex": startIndex, "volumeId": volumeId};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Gets volume information for a single volume.
    #
    # + volumeId - ID of volume to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + country - ISO-3166-1 code to override the IP-based location.
    # + includeNonComicsSeries - Set to true to include non-comics series. Defaults to false.
    # + partner - Brand results for partner ID.
    # + projection - Restrict information returned to a set of selected fields.
    # + 'source - string to identify the originator of this request.
    # + userLibraryConsistentRead - user library consistent read status
    # + return - Successful response
    remote isolated function getVolumes(string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? country = (), boolean? includeNonComicsSeries = (), string? partner = (), string? projection = (), string? 'source = (), boolean? userLibraryConsistentRead = ()) returns Volume|error {
        string  path = string `/books/v1/volumes/${volumeId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "country": country, "includeNonComicsSeries": includeNonComicsSeries, "partner": partner, "projection": projection, "source": 'source, "user_library_consistent_read": userLibraryConsistentRead};
        path = path + check getPathForQueryParam(queryParam);
        Volume response = check self.clientEp-> get(path, targetType = Volume);
        return response;
    }
    # Return a list of associated books.
    #
    # + volumeId - ID of the source volume.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + association - Association type.
    # + locale - ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'. Used for generating recommendations.
    # + maxAllowedMaturityRating - The maximum allowed maturity rating of returned recommendations. Books with a higher maturity rating are filtered out.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function listVolumesAssociated(string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? association = (), string? locale = (), string? maxAllowedMaturityRating = (), string? 'source = ()) returns Volumes|error {
        string  path = string `/books/v1/volumes/${volumeId}/associated`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "association": association, "locale": locale, "maxAllowedMaturityRating": maxAllowedMaturityRating, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Volumes response = check self.clientEp-> get(path, targetType = Volumes);
        return response;
    }
    # Gets the volume annotations for a volume and layer.
    #
    # + volumeId - The volume to retrieve annotations for.
    # + layerId - The ID for the layer to get the annotations.
    # + contentVersion - The content version for the requested volume.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
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
    remote isolated function listLayersVolumeannotations(string volumeId, string layerId, string contentVersion, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? endOffset = (), string? endPosition = (), string? locale = (), int? maxResults = (), string? pageToken = (), boolean? showDeleted = (), string? 'source = (), string? startOffset = (), string? startPosition = (), string? updatedMax = (), string? updatedMin = (), string? volumeAnnotationsVersion = ()) returns Volumeannotations|error {
        string  path = string `/books/v1/volumes/${volumeId}/layers/${layerId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "endOffset": endOffset, "endPosition": endPosition, "locale": locale, "maxResults": maxResults, "pageToken": pageToken, "showDeleted": showDeleted, "source": 'source, "startOffset": startOffset, "startPosition": startPosition, "updatedMax": updatedMax, "updatedMin": updatedMin, "volumeAnnotationsVersion": volumeAnnotationsVersion};
        path = path + check getPathForQueryParam(queryParam);
        Volumeannotations response = check self.clientEp-> get(path, targetType = Volumeannotations);
        return response;
    }
    # Gets the volume annotation.
    #
    # + volumeId - The volume to retrieve annotations for.
    # + layerId - The ID for the layer to get the annotations.
    # + annotationId - The ID of the volume annotation to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getLayersVolumeannotations(string volumeId, string layerId, string annotationId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? locale = (), string? 'source = ()) returns Volumeannotation|error {
        string  path = string `/books/v1/volumes/${volumeId}/layers/${layerId}/annotations/${annotationId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "locale": locale, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Volumeannotation response = check self.clientEp-> get(path, targetType = Volumeannotation);
        return response;
    }
    # Gets the annotation data for a volume and layer.
    #
    # + volumeId - The volume to retrieve annotation data for.
    # + layerId - The ID for the layer to get the annotation data.
    # + contentVersion - The content version for the requested volume.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
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
    remote isolated function listLayersAnnotationdata(string volumeId, string layerId, string contentVersion, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? annotationDataId = (), int? h = (), string? locale = (), int? maxResults = (), string? pageToken = (), int? scale = (), string? 'source = (), string? updatedMax = (), string? updatedMin = (), int? w = ()) returns Annotationsdata|error {
        string  path = string `/books/v1/volumes/${volumeId}/layers/${layerId}/data`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "annotationDataId": annotationDataId, "h": h, "locale": locale, "maxResults": maxResults, "pageToken": pageToken, "scale": scale, "source": 'source, "updatedMax": updatedMax, "updatedMin": updatedMin, "w": w};
        path = path + check getPathForQueryParam(queryParam);
        Annotationsdata response = check self.clientEp-> get(path, targetType = Annotationsdata);
        return response;
    }
    # Gets the annotation data.
    #
    # + volumeId - The volume to retrieve annotations for.
    # + layerId - The ID for the layer to get the annotations.
    # + annotationDataId - The ID of the annotation data to retrieve.
    # + contentVersion - The content version for the volume you are trying to retrieve.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + allowWebDefinitions - For the dictionary layer. Whether or not to allow web definitions.
    # + h - The requested pixel height for any images. If height is provided width must also be provided.
    # + locale - The locale information for the data. ISO-639-1 language and ISO-3166-1 country code. Ex: 'en_US'.
    # + scale - The requested scale for the image.
    # + 'source - String to identify the originator of this request.
    # + w - The requested pixel width for any images. If width is provided height must also be provided.
    # + return - Successful response
    remote isolated function getLayersAnnotationdata(string volumeId, string layerId, string annotationDataId, string contentVersion, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? allowWebDefinitions = (), int? h = (), string? locale = (), int? scale = (), string? 'source = (), int? w = ()) returns DictionaryAnnotationdata|error {
        string  path = string `/books/v1/volumes/${volumeId}/layers/${layerId}/data/${annotationDataId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "allowWebDefinitions": allowWebDefinitions, "h": h, "locale": locale, "scale": scale, "source": 'source, "w": w};
        path = path + check getPathForQueryParam(queryParam);
        DictionaryAnnotationdata response = check self.clientEp-> get(path, targetType = DictionaryAnnotationdata);
        return response;
    }
    # List the layer summaries for a volume.
    #
    # + volumeId - The volume to retrieve layers for.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + contentVersion - The content version for the requested volume.
    # + maxResults - Maximum number of results to return
    # + pageToken - The value of the nextToken from the previous page.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function listLayers(string volumeId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), int? maxResults = (), string? pageToken = (), string? 'source = ()) returns Layersummaries|error {
        string  path = string `/books/v1/volumes/${volumeId}/layersummary`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "maxResults": maxResults, "pageToken": pageToken, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Layersummaries response = check self.clientEp-> get(path, targetType = Layersummaries);
        return response;
    }
    # Gets the layer summary for a volume.
    #
    # + volumeId - The volume to retrieve layers for.
    # + summaryId - The ID for the layer to get the summary for.
    # + xgafv - V1 error format.
    # + accessToken - OAuth access token.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token.
    # + oauthToken - OAuth 2.0 token for the current user.
    # + prettyPrint - Returns response with indentations and line breaks.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + contentVersion - The content version for the requested volume.
    # + 'source - String to identify the originator of this request.
    # + return - Successful response
    remote isolated function getLayers(string volumeId, string summaryId, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), boolean? prettyPrint = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? contentVersion = (), string? 'source = ()) returns Layersummary|error {
        string  path = string `/books/v1/volumes/${volumeId}/layersummary/${summaryId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "prettyPrint": prettyPrint, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "contentVersion": contentVersion, "source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        Layersummary response = check self.clientEp-> get(path, targetType = Layersummary);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
