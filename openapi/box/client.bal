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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Box Platform API v2.0.0](https://developer.box.com/guides/) OpenAPI specification.
# [Box Platform](https://box.dev) provides functionality to provide access to content stored within [Box](https://box.com). It provides endpoints for basic manipulation of files and folders, management of users within an enterprise, as well as more complex topics such as legal holds and retention policies.
@display {label: "Box", iconPath: "resources/box.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Box Developer Account](https://developer.box.com/) and obtain tokens following [this guide](https://developer.box.com/guides/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.box.com/2.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Authorize user
    #
    # + responseType - The type of response we'd like to receive.
    # + clientId - The Client ID of the application that is requesting to authenticate the user. To get the Client ID for your application, log in to your Box developer console and click the **Edit Application** link for the application you're working with. In the OAuth 2.0 Parameters section of the configuration page, find the item labelled `client_id`. The text of that item is your application's Client ID.
    # + redirectUri - The URL to which Box redirects the browser after the user has granted or denied the application permission. This URL must match the redirect URL in the configuration of your application. It must be a valid HTTPS URL and it needs to be able to handle the redirection to complete the next step in the OAuth 2.0 flow.
    # + state - A custom string of your choice. Box will pass the same string to the redirect URL when authentication is complete. This parameter can be used to identify a user on redirect, as well as protect against hijacked sessions and other exploits.
    # + scope - A comma-separated list of application scopes you'd like to authenticate the user for. This defaults to all the scopes configured for the application in its configuration page.
    # + return - Does not return any data, but rather should be used in the browser.
    remote isolated function getAuthorize(string responseType, string clientId, string? redirectUri = (), string? state = (), string? scope = ()) returns string|error {
        string  path = string `/authorize`;
        map<anydata> queryParam = {"response_type": responseType, "client_id": clientId, "redirect_uri": redirectUri, "state": state, "scope": scope};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Request access token
    #
    # + return - Returns a new Access Token that can be used to make authenticated API calls by passing along the token in a authorization header as follows `Authorization: Bearer <Token>`.
    remote isolated function postOauth2Token(PostOAuth2Token payload) returns AccessToken|error {
        string  path = string `/oauth2/token`;
        http:Request request = new;
        AccessToken response = check self.clientEp->post(path, request, targetType=AccessToken);
        return response;
    }
    # Refresh access token
    #
    # + return - Returns a new Access Token that can be used to make authenticated API calls by passing along the token in a authorization header as follows `Authorization: Bearer <Token>`.
    remote isolated function postOauth2TokenRefresh(Postoauth2tokenRefreshaccesstoken payload) returns AccessToken|error {
        string  path = string `/oauth2/token#refresh`;
        http:Request request = new;
        AccessToken response = check self.clientEp->post(path, request, targetType=AccessToken);
        return response;
    }
    # Revoke access token
    #
    # + return - Returns an empty response when the token was successfully revoked.
    remote isolated function postOauth2Revoke(PostOAuth2Revoke payload) returns http:Response|error {
        string  path = string `/oauth2/revoke`;
        http:Request request = new;
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get file information
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + xRepHints - A header required to request specific `representations` of a file. Use this in combination with the `fields` query parameter to request a specific file representation.  The general format for these representations is `X-Rep-Hints: [...]` where `[...]` is one or many hints in the format `[fileType?query]`.  For example, to request a `png` representation in `32x32` as well as `94x94` pixel dimensions provide the following hints.  `X-Rep-Hints: [jpg?dimensions=32x32][jpg?dimensions=94x94]`  Additionally, a `text` representation is available for all document file types in Box using the `[extracted_text]` representation.  `X-Rep-Hints: [extracted_text]`
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.  Additionally this field can be used to query any metadata applied to the file by specifying the `metadata` field as well as the scope and key of the template to retrieve, for example `?field=metadata.enterprise_12345.contractTemplate`.
    # + ifNoneMatch - Ensures an item is only returned if it has changed.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `304 Not Modified` if the item has not changed since.
    # + boxapi - The URL, and optional password, for the shared link of this item.  This header can be used to access items that have not been explicitly shared with a user.  Use the format `shared_link=[link]` or if a password is required then use `shared_link=[link]&shared_link_password=[password]`.  This header can be used on the file or folder shared, as well as on any files or folders nested within the item.
    # + return - Returns a file object.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function getFilesId(string fileId, string xRepHints, string[]? fields = (), string? ifNoneMatch = (), string? boxapi = ()) returns File|error {
        string  path = string `/files/${fileId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-none-match": ifNoneMatch, "boxapi": boxapi, "x-rep-hints": xRepHints};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        File response = check self.clientEp-> get(path, accHeaders, targetType = File);
        return response;
    }
    # Update file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + return - Returns a file object.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function putFilesId(string fileId, Body payload, string[]? fields = (), string? ifMatch = ()) returns File|error {
        string  path = string `/files/${fileId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->put(path, request, headers = accHeaders, targetType=File);
        return response;
    }
    # Restore file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a file object when the file has been restored.
    remote isolated function postFilesId(string fileId, Body1 payload, string[]? fields = ()) returns File|error {
        string  path = string `/files/${fileId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->post(path, request, targetType=File);
        return response;
    }
    # Delete file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + return - Returns an empty response when the file has been successfully deleted.
    remote isolated function deleteFilesId(string fileId, string? ifMatch = ()) returns http:Response|error {
        string  path = string `/files/${fileId}`;
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Download file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + range - The byte range of the content to download.  The format `{start_byte}-{end_byte}` can be used to specify what section of the file to download.
    # + boxapi - The URL, and optional password, for the shared link of this item.  This header can be used to access items that have not been explicitly shared with a user.  Use the format `shared_link=[link]` or if a password is required then use `shared_link=[link]&shared_link_password=[password]`.  This header can be used on the file or folder shared, as well as on any files or folders nested within the item.
    # + 'version - The file version to download
    # + accessToken - An optional access token that can be used to pre-authenticate this request, which means that a download link can be shared with a browser or a third party service without them needing to know how to handle the authentication. When using this parameter, please make sure that the access token is sufficiently scoped down to only allow read access to that file and no other files or folders.
    # + return - If the file is not ready to be downloaded yet `Retry-After` header will be returned indicating the time in seconds after which the file will be available for the client to download.  This response can occur when the file was uploaded immediately before the download request.
    remote isolated function getFilesIdContent(string fileId, string? range = (), string? boxapi = (), string? 'version = (), string? accessToken = ()) returns http:Response|error {
        string  path = string `/files/${fileId}/content`;
        map<anydata> queryParam = {"version": 'version, "access_token": accessToken};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"range": range, "boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> get(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Upload file version
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + contentMd5 - An optional header containing the SHA1 hash of the file to ensure that the file was not corrupted in transit.
    # + return - Returns the new file object in a list.
    remote isolated function postFilesIdContent(string fileId, Body2 payload, string? ifMatch = (), string[]? fields = (), string? contentMd5 = ()) returns Files|error {
        string  path = string `/files/${fileId}/content`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-match": ifMatch, "content-md5": contentMd5};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Files response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Files);
        return response;
    }
    # Upload file
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + contentMd5 - An optional header containing the SHA1 hash of the file to ensure that the file was not corrupted in transit.
    # + return - Returns the new file object in a list.
    remote isolated function postFilesContent(Body3 payload, string[]? fields = (), string? contentMd5 = ()) returns Files|error {
        string  path = string `/files/content`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"content-md5": contentMd5};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Files response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Files);
        return response;
    }
    # Create upload session
    #
    # + return - Returns a new upload session.
    remote isolated function postFilesUploadSessions(Body4 payload) returns UploadSession|error {
        string  path = string `/files/upload_sessions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UploadSession response = check self.clientEp->post(path, request, targetType=UploadSession);
        return response;
    }
    # Create upload session for existing file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - Returns a new upload session.
    remote isolated function postFilesIdUploadSessions(string fileId, Body5 payload) returns UploadSession|error {
        string  path = string `/files/${fileId}/upload_sessions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UploadSession response = check self.clientEp->post(path, request, targetType=UploadSession);
        return response;
    }
    # Get upload session
    #
    # + uploadSessionId - The ID of the upload session.
    # + return - Returns an upload session object.
    remote isolated function getFilesUploadSessionsId(string uploadSessionId) returns UploadSession|error {
        string  path = string `/files/upload_sessions/${uploadSessionId}`;
        UploadSession response = check self.clientEp-> get(path, targetType = UploadSession);
        return response;
    }
    # Upload part of file
    #
    # + uploadSessionId - The ID of the upload session.
    # + digest - The [RFC3230][1] message digest of the chunk uploaded.  Only SHA1 is supported. The SHA1 digest must be Base64 encoded. The format of this header is as `sha=BASE64_ENCODED_DIGEST`.  [1]: https://tools.ietf.org/html/rfc3230
    # + contentRange - The byte range of the chunk.  Must not overlap with the range of a part already uploaded this session.
    # + return - Chunk has been uploaded successfully.
    remote isolated function putFilesUploadSessionsId(string uploadSessionId, string digest, string contentRange, string payload) returns UploadedPart|error {
        string  path = string `/files/upload_sessions/${uploadSessionId}`;
        map<any> headerValues = {"digest": digest, "content-range": contentRange};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        UploadedPart response = check self.clientEp->put(path, request, headers = accHeaders, targetType=UploadedPart);
        return response;
    }
    # Remove upload session
    #
    # + uploadSessionId - The ID of the upload session.
    # + return - A blank response is returned if the session was successfully aborted.
    remote isolated function deleteFilesUploadSessionsId(string uploadSessionId) returns http:Response|error {
        string  path = string `/files/upload_sessions/${uploadSessionId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List parts
    #
    # + uploadSessionId - The ID of the upload session.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a list of parts that have been uploaded.
    remote isolated function getFilesUploadSessionsIdParts(string uploadSessionId, int offset = 0, int? 'limit = ()) returns UploadParts|error {
        string  path = string `/files/upload_sessions/${uploadSessionId}/parts`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        UploadParts response = check self.clientEp-> get(path, targetType = UploadParts);
        return response;
    }
    # Commit upload session
    #
    # + uploadSessionId - The ID of the upload session.
    # + digest - The [RFC3230][1] message digest of the whole file.  Only SHA1 is supported. The SHA1 digest must be Base64 encoded. The format of this header is as `sha=BASE64_ENCODED_DIGEST`.  [1]: https://tools.ietf.org/html/rfc3230
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + ifNoneMatch - Ensures an item is only returned if it has changed.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `304 Not Modified` if the item has not changed since.
    # + return - Returns the file object in a list.
    remote isolated function postFilesUploadSessionsIdCommit(string uploadSessionId, string digest, Body6 payload, string? ifMatch = (), string? ifNoneMatch = ()) returns Files|error {
        string  path = string `/files/upload_sessions/${uploadSessionId}/commit`;
        map<any> headerValues = {"digest": digest, "if-match": ifMatch, "if-none-match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Files response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Files);
        return response;
    }
    # Copy file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a new file object representing the copied file.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function postFilesIdCopy(string fileId, Body7 payload, string[]? fields = ()) returns File|error {
        string  path = string `/files/${fileId}/copy`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->post(path, request, targetType=File);
        return response;
    }
    # Get file thumbnail
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + extension - The file format for the thumbnail
    # + minHeight - The minimum height of the thumbnail
    # + minWidth - The minimum width of the thumbnail
    # + maxHeight - The maximum height of the thumbnail
    # + maxWidth - The maximum width of the thumbnail
    # + return - When a thumbnail can be created the thumbnail data will be returned in the body of the response.
    remote isolated function getFilesIdThumbnailId(string fileId, string extension, int? minHeight = (), int? minWidth = (), int? maxHeight = (), int? maxWidth = ()) returns string|error {
        string  path = string `/files/${fileId}/thumbnail.${extension}`;
        map<anydata> queryParam = {"min_height": minHeight, "min_width": minWidth, "max_height": maxHeight, "max_width": maxWidth};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # List file collaborations
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + return - Returns a collection of collaboration objects. If there are no collaborations on this file an empty collection will be returned.  This list includes pending collaborations, for which the `status` is set to `pending`, indicating invitations that have been sent but not yet accepted.
    remote isolated function getFilesIdCollaborations(string fileId, string[]? fields = (), int? 'limit = (), string? marker = ()) returns Collaborations|error {
        string  path = string `/files/${fileId}/collaborations`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "marker": marker};
        path = path + check getPathForQueryParam(queryParam);
        Collaborations response = check self.clientEp-> get(path, targetType = Collaborations);
        return response;
    }
    # List file comments
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns a collection of comment objects. If there are no comments on this file an empty collection will be returned.
    remote isolated function getFilesIdComments(string fileId, string[]? fields = (), int? 'limit = (), int offset = 0) returns Comments|error {
        string  path = string `/files/${fileId}/comments`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Comments response = check self.clientEp-> get(path, targetType = Comments);
        return response;
    }
    # List tasks on file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - Returns a list of tasks on a file.  If there are no tasks on this file an empty collection is returned instead.
    remote isolated function getFilesIdTasks(string fileId) returns Tasks|error {
        string  path = string `/files/${fileId}/tasks`;
        Tasks response = check self.clientEp-> get(path, targetType = Tasks);
        return response;
    }
    # Get trashed file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the file that was trashed, including information about when the it was moved to the trash.
    remote isolated function getFilesIdTrash(string fileId, string[]? fields = ()) returns File|error {
        string  path = string `/files/${fileId}/trash`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        File response = check self.clientEp-> get(path, targetType = File);
        return response;
    }
    # Permanently remove file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - Returns an empty response when the file was permanently deleted.
    remote isolated function deleteFilesIdTrash(string fileId) returns http:Response|error {
        string  path = string `/files/${fileId}/trash`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List all file versions
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns an array of past versions for this file.
    remote isolated function getFilesIdVersions(string fileId, string[]? fields = (), int? 'limit = (), int offset = 0) returns FileVersions|error {
        string  path = string `/files/${fileId}/versions`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        FileVersions response = check self.clientEp-> get(path, targetType = FileVersions);
        return response;
    }
    # Get file version
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fileVersionId - The ID of the file version
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a specific version of a file.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function getFilesIdVersionsId(string fileId, string fileVersionId, string[]? fields = ()) returns FileVersion|error {
        string  path = string `/files/${fileId}/versions/${fileVersionId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        FileVersion response = check self.clientEp-> get(path, targetType = FileVersion);
        return response;
    }
    # Remove file version
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fileVersionId - The ID of the file version
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + return - Returns an empty response when the file has been successfully deleted.
    remote isolated function deleteFilesIdVersionsId(string fileId, string fileVersionId, string? ifMatch = ()) returns http:Response|error {
        string  path = string `/files/${fileId}/versions/${fileVersionId}`;
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Revert file version
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a newly created file version object.
    remote isolated function postFilesIdVersionsCurrent(string fileId, Body8 payload, string[]? fields = ()) returns FileVersion|error {
        string  path = string `/files/${fileId}/versions/current`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileVersion response = check self.clientEp->post(path, request, targetType=FileVersion);
        return response;
    }
    # Get watermark on file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - Returns an object containing information about the watermark associated for to this file.
    remote isolated function getFilesIdWatermark(string fileId) returns Watermark|error {
        string  path = string `/files/${fileId}/watermark`;
        Watermark response = check self.clientEp-> get(path, targetType = Watermark);
        return response;
    }
    # Apply watermark to file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - Returns an updated watermark if a watermark already existed on this file.
    remote isolated function putFilesIdWatermark(string fileId, Body9 payload) returns Watermark|error {
        string  path = string `/files/${fileId}/watermark`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Watermark response = check self.clientEp->put(path, request, targetType=Watermark);
        return response;
    }
    # Remove watermark from file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + return - An empty response will be returned when the watermark was successfully deleted.
    remote isolated function deleteFilesIdWatermark(string fileId) returns http:Response|error {
        string  path = string `/files/${fileId}/watermark`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get file request
    #
    # + fileRequestId - The unique identifier that represent a file request.  The ID for any file request can be determined by visiting a file request builder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/filerequest/123` the `file_request_id` is `123`.
    # + return - Returns a file request object.
    remote isolated function getFileRequestsId(string fileRequestId) returns FileRequest|error {
        string  path = string `/file_requests/${fileRequestId}`;
        FileRequest response = check self.clientEp-> get(path, targetType = FileRequest);
        return response;
    }
    # Update file request
    #
    # + fileRequestId - The unique identifier that represent a file request.  The ID for any file request can be determined by visiting a file request builder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/filerequest/123` the `file_request_id` is `123`.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + return - Returns the updated file request object.
    remote isolated function putFileRequestsId(string fileRequestId, FileRequestUpdateRequest payload, string? ifMatch = ()) returns FileRequest|error {
        string  path = string `/file_requests/${fileRequestId}`;
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileRequest response = check self.clientEp->put(path, request, headers = accHeaders, targetType=FileRequest);
        return response;
    }
    # Delete file request
    #
    # + fileRequestId - The unique identifier that represent a file request.  The ID for any file request can be determined by visiting a file request builder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/filerequest/123` the `file_request_id` is `123`.
    # + return - Returns an empty response when the file request has been successfully deleted.
    remote isolated function deleteFileRequestsId(string fileRequestId) returns http:Response|error {
        string  path = string `/file_requests/${fileRequestId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Copy file request
    #
    # + fileRequestId - The unique identifier that represent a file request.  The ID for any file request can be determined by visiting a file request builder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/filerequest/123` the `file_request_id` is `123`.
    # + return - Returns updated file request object.
    remote isolated function postFileRequestsIdCopy(string fileRequestId, FileRequestCopyRequest payload) returns FileRequest|error {
        string  path = string `/file_requests/${fileRequestId}/copy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileRequest response = check self.clientEp->post(path, request, targetType=FileRequest);
        return response;
    }
    # Get folder information
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.  Additionally this field can be used to query any metadata applied to the file by specifying the `metadata` field as well as the scope and key of the template to retrieve, for example `?field=metadata.enterprise_12345.contractTemplate`.
    # + ifNoneMatch - Ensures an item is only returned if it has changed.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `304 Not Modified` if the item has not changed since.
    # + boxapi - The URL, and optional password, for the shared link of this item.  This header can be used to access items that have not been explicitly shared with a user.  Use the format `shared_link=[link]` or if a password is required then use `shared_link=[link]&shared_link_password=[password]`.  This header can be used on the file or folder shared, as well as on any files or folders nested within the item.
    # + return - Returns a folder, including the first 100 entries in the folder.  To fetch more items within the folder, please use the [Get items in a folder](#get-folders-id-items) endpoint.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function getFoldersId(string folderId, string[]? fields = (), string? ifNoneMatch = (), string? boxapi = ()) returns Folder|error {
        string  path = string `/folders/${folderId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-none-match": ifNoneMatch, "boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp-> get(path, accHeaders, targetType = Folder);
        return response;
    }
    # Update folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + return - Returns a folder object for the updated folder  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.  This call will return synchronously. This holds true even when moving folders with a large a large number of items in all of its descendants. For very large folders, this means the call could take minutes or hours to return.
    remote isolated function putFoldersId(string folderId, Body10 payload, string[]? fields = (), string? ifMatch = ()) returns Folder|error {
        string  path = string `/folders/${folderId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Folder);
        return response;
    }
    # Restore folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a folder object when the folder has been restored.
    remote isolated function postFoldersId(string folderId, Body11 payload, string[]? fields = ()) returns Folder|error {
        string  path = string `/folders/${folderId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->post(path, request, targetType=Folder);
        return response;
    }
    # Delete folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + ifMatch - Ensures this item hasn't recently changed before making changes.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `412 Precondition Failed` if it has changed since.
    # + recursive - Delete a folder that is not empty by recursively deleting the folder and all of its content.
    # + return - Returns an empty response when the folder is successfully deleted or moved to the trash.
    remote isolated function deleteFoldersId(string folderId, string? ifMatch = (), boolean? recursive = ()) returns http:Response|error {
        string  path = string `/folders/${folderId}`;
        map<anydata> queryParam = {"recursive": recursive};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-match": ifMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # List items in folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.  Additionally this field can be used to query any metadata applied to the file by specifying the `metadata` field as well as the scope and key of the template to retrieve, for example `?field=metadata.enterprise_12345.contractTemplate`.
    # + usemarker - Specifies whether to use marker-based pagination instead of offset-based pagination. Only one pagination method can be used at a time.  By setting this value to true, the API will return a `marker` field that can be passed as a parameter to this endpoint to get the next page of the response.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + boxapi - The URL, and optional password, for the shared link of this item.  This header can be used to access items that have not been explicitly shared with a user.  Use the format `shared_link=[link]` or if a password is required then use `shared_link=[link]&shared_link_password=[password]`.  This header can be used on the file or folder shared, as well as on any files or folders nested within the item.
    # + sort - Defines the **second** attribute by which items are sorted.  Items are always sorted by their `type` first, with folders listed before files, and files listed before web links.  This parameter is not supported for marker-based pagination on the root folder (the folder with an ID of `0`).
    # + direction - The direction to sort results in. This can be either in alphabetical ascending (`ASC`) or descending (`DESC`) order.
    # + return - Returns a collection of files, folders, and web links contained in a folder.
    remote isolated function getFoldersIdItems(string folderId, string[]? fields = (), boolean? usemarker = (), string? marker = (), int offset = 0, int? 'limit = (), string? boxapi = (), string? sort = (), string? direction = ()) returns Items|error {
        string  path = string `/folders/${folderId}/items`;
        map<anydata> queryParam = {"fields": fields, "usemarker": usemarker, "marker": marker, "offset": offset, "limit": 'limit, "sort": sort, "direction": direction};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Items response = check self.clientEp-> get(path, accHeaders, targetType = Items);
        return response;
    }
    # Create folder
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a folder object.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function postFolders(Body12 payload, string[]? fields = ()) returns Folder|error {
        string  path = string `/folders`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->post(path, request, targetType=Folder);
        return response;
    }
    # Copy folder
    #
    # + folderId - The unique identifier of the folder to copy.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder with the ID `0` can not be copied.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a new folder object representing the copied folder.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function postFoldersIdCopy(string folderId, Body13 payload, string[]? fields = ()) returns Folder|error {
        string  path = string `/folders/${folderId}/copy`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->post(path, request, targetType=Folder);
        return response;
    }
    # List folder collaborations
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a collection of collaboration objects. If there are no collaborations on this folder an empty collection will be returned.  This list includes pending collaborations, for which the `status` is set to `pending`, indicating invitations that have been sent but not yet accepted.
    remote isolated function getFoldersIdCollaborations(string folderId, string[]? fields = ()) returns Collaborations|error {
        string  path = string `/folders/${folderId}/collaborations`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Collaborations response = check self.clientEp-> get(path, targetType = Collaborations);
        return response;
    }
    # Get trashed folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the folder that was trashed, including information about when the it was moved to the trash.
    remote isolated function getFoldersIdTrash(string folderId, string[]? fields = ()) returns Folder|error {
        string  path = string `/folders/${folderId}/trash`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Folder response = check self.clientEp-> get(path, targetType = Folder);
        return response;
    }
    # Permanently remove folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + return - Returns an empty response when the folder was permanently deleted.
    remote isolated function deleteFoldersIdTrash(string folderId) returns http:Response|error {
        string  path = string `/folders/${folderId}/trash`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List trashed items
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + usemarker - Specifies whether to use marker-based pagination instead of offset-based pagination. Only one pagination method can be used at a time.  By setting this value to true, the API will return a `marker` field that can be passed as a parameter to this endpoint to get the next page of the response.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + direction - The direction to sort results in. This can be either in alphabetical ascending (`ASC`) or descending (`DESC`) order.
    # + sort - Defines the **second** attribute by which items are sorted.  Items are always sorted by their `type` first, with folders listed before files, and files listed before web links.  This parameter is not supported when using marker-based pagination.
    # + return - Returns a list of items that have been deleted
    remote isolated function getFoldersTrashItems(string[]? fields = (), int? 'limit = (), int offset = 0, boolean? usemarker = (), string? marker = (), string? direction = (), string? sort = ()) returns Items|error {
        string  path = string `/folders/trash/items`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "offset": offset, "usemarker": usemarker, "marker": marker, "direction": direction, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Items response = check self.clientEp-> get(path, targetType = Items);
        return response;
    }
    # Get watermark for folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + return - Returns an object containing information about the watermark associated for to this folder.
    remote isolated function getFoldersIdWatermark(string folderId) returns Watermark|error {
        string  path = string `/folders/${folderId}/watermark`;
        Watermark response = check self.clientEp-> get(path, targetType = Watermark);
        return response;
    }
    # Apply watermark to folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + return - Returns an updated watermark if a watermark already existed on this folder.
    remote isolated function putFoldersIdWatermark(string folderId, Body14 payload) returns Watermark|error {
        string  path = string `/folders/${folderId}/watermark`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Watermark response = check self.clientEp->put(path, request, targetType=Watermark);
        return response;
    }
    # Remove watermark from folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + return - An empty response will be returned when the watermark was successfully deleted.
    remote isolated function deleteFoldersIdWatermark(string folderId) returns http:Response|error {
        string  path = string `/folders/${folderId}/watermark`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List folder locks
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + return - Returns details for all folder locks applied to the folder, including the lock type and user that applied the lock.
    remote isolated function getFolderLocks(string folderId) returns FolderLocks|error {
        string  path = string `/folder_locks`;
        map<anydata> queryParam = {"folder_id": folderId};
        path = path + check getPathForQueryParam(queryParam);
        FolderLocks response = check self.clientEp-> get(path, targetType = FolderLocks);
        return response;
    }
    # Create folder lock
    #
    # + return - Returns the instance of the folder lock that was applied to the folder, including the user that applied the lock and the operations set.
    remote isolated function postFolderLocks(Body15 payload) returns FolderLock|error {
        string  path = string `/folder_locks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FolderLock response = check self.clientEp->post(path, request, targetType=FolderLock);
        return response;
    }
    # Delete folder lock
    #
    # + folderLockId - The ID of the folder lock.
    # + return - Returns an empty response when the folder lock is successfully deleted.
    remote isolated function deleteFolderLocksId(string folderLockId) returns http:Response|error {
        string  path = string `/folder_locks/${folderLockId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get comment
    #
    # + commentId - The ID of the comment.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a full comment object.
    remote isolated function getCommentsId(string commentId, string[]? fields = ()) returns Comment|error {
        string  path = string `/comments/${commentId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Comment response = check self.clientEp-> get(path, targetType = Comment);
        return response;
    }
    # Update comment
    #
    # + commentId - The ID of the comment.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the updated comment object.
    remote isolated function putCommentsId(string commentId, Body16 payload, string[]? fields = ()) returns Comment|error {
        string  path = string `/comments/${commentId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->put(path, request, targetType=Comment);
        return response;
    }
    # Remove comment
    #
    # + commentId - The ID of the comment.
    # + return - Returns an empty response when the comment has been deleted.
    remote isolated function deleteCommentsId(string commentId) returns http:Response|error {
        string  path = string `/comments/${commentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Create comment
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the newly created comment object.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields.
    remote isolated function postComments(Body17 payload, string[]? fields = ()) returns Comment|error {
        string  path = string `/comments`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, targetType=Comment);
        return response;
    }
    # Get collaboration
    #
    # + collaborationId - The ID of the collaboration
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a collaboration object.
    remote isolated function getCollaborationsId(string collaborationId, string[]? fields = ()) returns Collaboration|error {
        string  path = string `/collaborations/${collaborationId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Collaboration response = check self.clientEp-> get(path, targetType = Collaboration);
        return response;
    }
    # Update collaboration
    #
    # + collaborationId - The ID of the collaboration
    # + return - Returns an updated collaboration object unless the owner has changed.
    remote isolated function putCollaborationsId(string collaborationId, Body18 payload) returns Collaboration|error {
        string  path = string `/collaborations/${collaborationId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collaboration response = check self.clientEp->put(path, request, targetType=Collaboration);
        return response;
    }
    # Remove collaboration
    #
    # + collaborationId - The ID of the collaboration
    # + return - A blank response is returned if the collaboration was successfully deleted.
    remote isolated function deleteCollaborationsId(string collaborationId) returns http:Response|error {
        string  path = string `/collaborations/${collaborationId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List pending collaborations
    #
    # + status - The status of the collaborations to retrieve
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a collection of pending collaboration objects.  If the user has no pending collaborations, the collection will be empty.
    remote isolated function getCollaborations(string status, string[]? fields = (), int offset = 0, int? 'limit = ()) returns Collaborations|error {
        string  path = string `/collaborations`;
        map<anydata> queryParam = {"status": status, "fields": fields, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        Collaborations response = check self.clientEp-> get(path, targetType = Collaborations);
        return response;
    }
    # Create collaboration
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + notify - Determines if users should receive email notification for the action performed.
    # + return - Returns a new collaboration object.
    remote isolated function postCollaborations(Body19 payload, string[]? fields = (), boolean? notify = ()) returns Collaboration|error {
        string  path = string `/collaborations`;
        map<anydata> queryParam = {"fields": fields, "notify": notify};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collaboration response = check self.clientEp->post(path, request, targetType=Collaboration);
        return response;
    }
    # Create task
    #
    # + return - Returns the newly created task.
    remote isolated function postTasks(Body20 payload) returns Task|error {
        string  path = string `/tasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->post(path, request, targetType=Task);
        return response;
    }
    # Get task
    #
    # + taskId - The ID of the task.
    # + return - Returns a task object.
    remote isolated function getTasksId(string taskId) returns Task|error {
        string  path = string `/tasks/${taskId}`;
        Task response = check self.clientEp-> get(path, targetType = Task);
        return response;
    }
    # Update task
    #
    # + taskId - The ID of the task.
    # + return - Returns the updated task object
    remote isolated function putTasksId(string taskId, Body21 payload) returns Task|error {
        string  path = string `/tasks/${taskId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->put(path, request, targetType=Task);
        return response;
    }
    # Remove task
    #
    # + taskId - The ID of the task.
    # + return - Returns an empty response when the task was successfully deleted.
    remote isolated function deleteTasksId(string taskId) returns http:Response|error {
        string  path = string `/tasks/${taskId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List task assignments
    #
    # + taskId - The ID of the task.
    # + return - Returns a collection of task assignment defining what task on a file has been assigned to which users and by who.
    remote isolated function getTasksIdAssignments(string taskId) returns TaskAssignments|error {
        string  path = string `/tasks/${taskId}/assignments`;
        TaskAssignments response = check self.clientEp-> get(path, targetType = TaskAssignments);
        return response;
    }
    # Assign task
    #
    # + return - Returns a new task assignment object.
    remote isolated function postTaskAssignments(Body22 payload) returns TaskAssignment|error {
        string  path = string `/task_assignments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaskAssignment response = check self.clientEp->post(path, request, targetType=TaskAssignment);
        return response;
    }
    # Get task assignment
    #
    # + taskAssignmentId - The ID of the task assignment.
    # + return - Returns a task assignment, specifying who the task has been assigned to and by whom.
    remote isolated function getTaskAssignmentsId(string taskAssignmentId) returns TaskAssignment|error {
        string  path = string `/task_assignments/${taskAssignmentId}`;
        TaskAssignment response = check self.clientEp-> get(path, targetType = TaskAssignment);
        return response;
    }
    # Update task assignment
    #
    # + taskAssignmentId - The ID of the task assignment.
    # + return - Returns the updated task assignment object.
    remote isolated function putTaskAssignmentsId(string taskAssignmentId, Body23 payload) returns TaskAssignment|error {
        string  path = string `/task_assignments/${taskAssignmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TaskAssignment response = check self.clientEp->put(path, request, targetType=TaskAssignment);
        return response;
    }
    # Unassign task
    #
    # + taskAssignmentId - The ID of the task assignment.
    # + return - Returns an empty response when the task assignment was successfully deleted.
    remote isolated function deleteTaskAssignmentsId(string taskAssignmentId) returns http:Response|error {
        string  path = string `/task_assignments/${taskAssignmentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Find file for shared link
    #
    # + boxapi - A header containing the shared link and optional password for the shared link.  The format for this header is as follows.  `shared_link=[link]&shared_link_password=[password]`
    # + ifNoneMatch - Ensures an item is only returned if it has changed.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `304 Not Modified` if the item has not changed since.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a full file resource if the shared link is valid and the user has access to it.
    remote isolated function getSharedItems(string boxapi, string? ifNoneMatch = (), string[]? fields = ()) returns File|error {
        string  path = string `/shared_items`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-none-match": ifNoneMatch, "boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        File response = check self.clientEp-> get(path, accHeaders, targetType = File);
        return response;
    }
    # Get shared link for file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns the base representation of a file with the additional shared link information.
    remote isolated function getFilesIdGetSharedLink(string fileId, string fields) returns File|error {
        string  path = string `/files/${fileId}#get_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        File response = check self.clientEp-> get(path, targetType = File);
        return response;
    }
    # Add shared link to file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns the base representation of a file with a new shared link attached.
    remote isolated function putFilesIdAddSharedLink(string fileId, string fields, Body24 payload) returns File|error {
        string  path = string `/files/${fileId}#add_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->put(path, request, targetType=File);
        return response;
    }
    # Update shared link on file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns a basic representation of the file, with the updated shared link attached.
    remote isolated function putFilesIdUpdateSharedLink(string fileId, string fields, Body25 payload) returns File|error {
        string  path = string `/files/${fileId}#update_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->put(path, request, targetType=File);
        return response;
    }
    # Remove shared link from file
    #
    # + fileId - The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns a basic representation of a file, with the shared link removed.
    remote isolated function putFilesIdRemoveSharedLink(string fileId, string fields, Body26 payload) returns File|error {
        string  path = string `/files/${fileId}#remove_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        File response = check self.clientEp->put(path, request, targetType=File);
        return response;
    }
    # Find folder for shared link
    #
    # + boxapi - A header containing the shared link and optional password for the shared link.  The format for this header is as follows.  `shared_link=[link]&shared_link_password=[password]`
    # + ifNoneMatch - Ensures an item is only returned if it has changed.  Pass in the item's last observed `etag` value into this header and the endpoint will fail with a `304 Not Modified` if the item has not changed since.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a full folder resource if the shared link is valid and the user has access to it.
    remote isolated function getSharedItemsFolders(string boxapi, string? ifNoneMatch = (), string[]? fields = ()) returns Folder|error {
        string  path = string `/shared_items#folders`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"if-none-match": ifNoneMatch, "boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Folder response = check self.clientEp-> get(path, accHeaders, targetType = Folder);
        return response;
    }
    # Get shared link for folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns the base representation of a folder with the additional shared link information.
    remote isolated function getFoldersIdGetSharedLink(string folderId, string fields) returns Folder|error {
        string  path = string `/folders/${folderId}#get_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Folder response = check self.clientEp-> get(path, targetType = Folder);
        return response;
    }
    # Add shared link to folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns the base representation of a folder with a new shared link attached.
    remote isolated function putFoldersIdAddSharedLink(string folderId, string fields, Body27 payload) returns Folder|error {
        string  path = string `/folders/${folderId}#add_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, targetType=Folder);
        return response;
    }
    # Update shared link on folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns a basic representation of the folder, with the updated shared link attached.
    remote isolated function putFoldersIdUpdateSharedLink(string folderId, string fields, Body28 payload) returns Folder|error {
        string  path = string `/folders/${folderId}#update_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, targetType=Folder);
        return response;
    }
    # Remove shared link from folder
    #
    # + folderId - The unique identifier that represent a folder.  The ID for any folder can be determined by visiting this folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folder/123` the `folder_id` is `123`.  The root folder of a Box account is always represented by the ID `0`.
    # + fields - Explicitly request the `shared_link` fields to be returned for this item.
    # + return - Returns a basic representation of a folder, with the shared link removed.
    remote isolated function putFoldersIdRemoveSharedLink(string folderId, string fields, Body29 payload) returns Folder|error {
        string  path = string `/folders/${folderId}#remove_shared_link`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, targetType=Folder);
        return response;
    }
    # Create web link
    #
    # + return - Returns the newly created web link object.
    remote isolated function postWebLinks(Body30 payload) returns WebLink|error {
        string  path = string `/web_links`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebLink response = check self.clientEp->post(path, request, targetType=WebLink);
        return response;
    }
    # Get web link
    #
    # + webLinkId - The ID of the web link.
    # + boxapi - The URL, and optional password, for the shared link of this item.  This header can be used to access items that have not been explicitly shared with a user.  Use the format `shared_link=[link]` or if a password is required then use `shared_link=[link]&shared_link_password=[password]`.  This header can be used on the file or folder shared, as well as on any files or folders nested within the item.
    # + return - Returns the web link object.
    remote isolated function getWebLinksId(string webLinkId, string? boxapi = ()) returns WebLink|error {
        string  path = string `/web_links/${webLinkId}`;
        map<any> headerValues = {"boxapi": boxapi};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebLink response = check self.clientEp-> get(path, accHeaders, targetType = WebLink);
        return response;
    }
    # Update web link
    #
    # + webLinkId - The ID of the web link.
    # + return - Returns the updated web link object.
    remote isolated function putWebLinksId(string webLinkId, Body31 payload) returns WebLink|error {
        string  path = string `/web_links/${webLinkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebLink response = check self.clientEp->put(path, request, targetType=WebLink);
        return response;
    }
    # Restore web link
    #
    # + webLinkId - The ID of the web link.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a web link object when it has been restored.
    remote isolated function postWebLinksId(string webLinkId, Body32 payload, string[]? fields = ()) returns WebLink|error {
        string  path = string `/web_links/${webLinkId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebLink response = check self.clientEp->post(path, request, targetType=WebLink);
        return response;
    }
    # Remove web link
    #
    # + webLinkId - The ID of the web link.
    # + return - An empty response will be returned when the web link was successfully deleted.
    remote isolated function deleteWebLinksId(string webLinkId) returns http:Response|error {
        string  path = string `/web_links/${webLinkId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get trashed web link
    #
    # + webLinkId - The ID of the web link.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the web link that was trashed, including information about when the it was moved to the trash.
    remote isolated function getWebLinksIdTrash(string webLinkId, string[]? fields = ()) returns Folder|error {
        string  path = string `/web_links/${webLinkId}/trash`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Folder response = check self.clientEp-> get(path, targetType = Folder);
        return response;
    }
    # Permanently remove web link
    #
    # + webLinkId - The ID of the web link.
    # + return - Returns an empty response when the web link was permanently deleted.
    remote isolated function deleteWebLinksIdTrash(string webLinkId) returns http:Response|error {
        string  path = string `/web_links/${webLinkId}/trash`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List enterprise users
    #
    # + filterTerm - Limits the results to only users who's `name` or `login` start with the search term.  For externally managed users, the search term needs to completely match the in order to find the user, and it will only return one user at a time.
    # + userType - Limits the results to the kind of user specified.  * `all` returns every kind of user for whom the   `login` or `name` partially matches the   `filter_term`. It will only return an external user   if the login matches the `filter_term` completely,   and in that case it will only return that user. * `managed` returns all managed and app users for whom   the `login` or `name` partially matches the   `filter_term`. * `external` returns all external users for whom the   `login` matches the `filter_term` exactly.
    # + externalAppUserId - Limits the results to app users with the given `external_app_user_id` value.  When creating an app user, an `external_app_user_id` value can be set. This value can then be used in this endpoint to find any users that match that `external_app_user_id` value.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + usemarker - Specifies whether to use marker-based pagination instead of offset-based pagination. Only one pagination method can be used at a time.  By setting this value to true, the API will return a `marker` field that can be passed as a parameter to this endpoint to get the next page of the response.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + return - Returns all of the users in the enterprise.
    remote isolated function getUsers(string? filterTerm = (), string? userType = (), string? externalAppUserId = (), string[]? fields = (), int offset = 0, int? 'limit = (), boolean? usemarker = (), string? marker = ()) returns Users|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"filter_term": filterTerm, "user_type": userType, "external_app_user_id": externalAppUserId, "fields": fields, "offset": offset, "limit": 'limit, "usemarker": usemarker, "marker": marker};
        path = path + check getPathForQueryParam(queryParam);
        Users response = check self.clientEp-> get(path, targetType = Users);
        return response;
    }
    # Create user
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a user object for the newly created user.
    remote isolated function postUsers(Body33 payload, string[]? fields = ()) returns User|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->post(path, request, targetType=User);
        return response;
    }
    # Get current user
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a single user object.
    remote isolated function getUsersMe(string[]? fields = ()) returns User|error {
        string  path = string `/users/me`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Get user
    #
    # + userId - The ID of the user.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a single user object.  Not all available fields are returned by default. Use the [fields](#param-fields) query parameter to explicitly request any specific fields using the [fields](#get-users-id--request--fields) parameter.
    remote isolated function getUsersId(string userId, string[]? fields = ()) returns User|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Update user
    #
    # + userId - The ID of the user.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the updated user object.
    remote isolated function putUsersId(string userId, Body34 payload, string[]? fields = ()) returns User|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->put(path, request, targetType=User);
        return response;
    }
    # Delete user
    #
    # + userId - The ID of the user.
    # + notify - Whether the user will receive email notification of the deletion
    # + force - Whether the user should be deleted even if this user still own files
    # + return - Removes the user and returns an empty response.
    remote isolated function deleteUsersId(string userId, boolean? notify = (), boolean? force = ()) returns http:Response|error {
        string  path = string `/users/${userId}`;
        map<anydata> queryParam = {"notify": notify, "force": force};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get user avatar
    #
    # + userId - The ID of the user.
    # + return - When an avatar can be found for the user the image data will be returned in the body of the response.
    remote isolated function getUsersIdAvatar(string userId) returns string|error {
        string  path = string `/users/${userId}/avatar`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Transfer owned folders
    #
    # + userId - The ID of the user.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + notify - Determines if users should receive email notification for the action performed.
    # + return - Returns the information for the newly created destination folder.
    remote isolated function putUsersIdFolders0(string userId, Body35 payload, string[]? fields = (), boolean? notify = ()) returns Folder|error {
        string  path = string `/users/${userId}/folders/0`;
        map<anydata> queryParam = {"fields": fields, "notify": notify};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Folder response = check self.clientEp->put(path, request, targetType=Folder);
        return response;
    }
    # List user's email aliases
    #
    # + userId - The ID of the user.
    # + return - Returns a collection of email aliases.
    remote isolated function getUsersIdEmailAliases(string userId) returns EmailAliases|error {
        string  path = string `/users/${userId}/email_aliases`;
        EmailAliases response = check self.clientEp-> get(path, targetType = EmailAliases);
        return response;
    }
    # Create email alias
    #
    # + userId - The ID of the user.
    # + return - Returns the newly created email alias object.
    remote isolated function postUsersIdEmailAliases(string userId, Body36 payload) returns EmailAlias|error {
        string  path = string `/users/${userId}/email_aliases`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EmailAlias response = check self.clientEp->post(path, request, targetType=EmailAlias);
        return response;
    }
    # Remove email alias
    #
    # + userId - The ID of the user.
    # + emailAliasId - The ID of the email alias.
    # + return - Removes the alias and returns an empty response.
    remote isolated function deleteUsersIdEmailAliasesId(string userId, string emailAliasId) returns http:Response|error {
        string  path = string `/users/${userId}/email_aliases/${emailAliasId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List user's groups
    #
    # + userId - The ID of the user.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns a collection of membership objects. If there are no memberships, an empty collection will be returned.
    remote isolated function getUsersIdMemberships(string userId, int? 'limit = (), int offset = 0) returns GroupMemberships|error {
        string  path = string `/users/${userId}/memberships`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        GroupMemberships response = check self.clientEp-> get(path, targetType = GroupMemberships);
        return response;
    }
    # Create user invite
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a new invite object.
    remote isolated function postInvites(Body37 payload, string[]? fields = ()) returns Invite|error {
        string  path = string `/invites`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Invite response = check self.clientEp->post(path, request, targetType=Invite);
        return response;
    }
    # Get user invite status
    #
    # + inviteId - The ID of an invite.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns an invite object
    remote isolated function getInvitesId(string inviteId, string[]? fields = ()) returns Invite|error {
        string  path = string `/invites/${inviteId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Invite response = check self.clientEp-> get(path, targetType = Invite);
        return response;
    }
    # List groups for enterprise
    #
    # + filterTerm - Limits the results to only groups whose `name` starts with the search term.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns a collection of group objects. If there are no groups, an empty collection will be returned.
    remote isolated function getGroups(string? filterTerm = (), string[]? fields = (), int? 'limit = (), int offset = 0) returns Groups|error {
        string  path = string `/groups`;
        map<anydata> queryParam = {"filter_term": filterTerm, "fields": fields, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Groups response = check self.clientEp-> get(path, targetType = Groups);
        return response;
    }
    # Create group
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the new group object.
    remote isolated function postGroups(Body38 payload, string[]? fields = ()) returns Group|error {
        string  path = string `/groups`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, targetType=Group);
        return response;
    }
    # Get group
    #
    # + groupId - The ID of the group.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the group object
    remote isolated function getGroupsId(string groupId, string[]? fields = ()) returns Group|error {
        string  path = string `/groups/${groupId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        Group response = check self.clientEp-> get(path, targetType = Group);
        return response;
    }
    # Update group
    #
    # + groupId - The ID of the group.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the updated group object.
    remote isolated function putGroupsId(string groupId, Body39 payload, string[]? fields = ()) returns Group|error {
        string  path = string `/groups/${groupId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->put(path, request, targetType=Group);
        return response;
    }
    # Remove group
    #
    # + groupId - The ID of the group.
    # + return - A blank response is returned if the group was successfully deleted.
    remote isolated function deleteGroupsId(string groupId) returns http:Response|error {
        string  path = string `/groups/${groupId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List members of group
    #
    # + groupId - The ID of the group.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns a collection of membership objects. If there are no memberships, an empty collection will be returned.
    remote isolated function getGroupsIdMemberships(string groupId, int? 'limit = (), int offset = 0) returns GroupMemberships|error {
        string  path = string `/groups/${groupId}/memberships`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        GroupMemberships response = check self.clientEp-> get(path, targetType = GroupMemberships);
        return response;
    }
    # List group collaborations
    #
    # + groupId - The ID of the group.
    # + 'limit - The maximum number of items to return per page.
    # + offset - The offset of the item at which to begin the response.
    # + return - Returns a collection of collaboration objects. If there are no collaborations, an empty collection will be returned.
    remote isolated function getGroupsIdCollaborations(string groupId, int? 'limit = (), int offset = 0) returns Collaborations|error {
        string  path = string `/groups/${groupId}/collaborations`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Collaborations response = check self.clientEp-> get(path, targetType = Collaborations);
        return response;
    }
    # Add user to group
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a new group membership object.
    remote isolated function postGroupMemberships(Body40 payload, string[]? fields = ()) returns GroupMembership|error {
        string  path = string `/group_memberships`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupMembership response = check self.clientEp->post(path, request, targetType=GroupMembership);
        return response;
    }
    # Get group membership
    #
    # + groupMembershipId - The ID of the group membership.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the group membership object.
    remote isolated function getGroupMembershipsId(string groupMembershipId, string[]? fields = ()) returns GroupMembership|error {
        string  path = string `/group_memberships/${groupMembershipId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        GroupMembership response = check self.clientEp-> get(path, targetType = GroupMembership);
        return response;
    }
    # Update group membership
    #
    # + groupMembershipId - The ID of the group membership.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a new group membership object.
    remote isolated function putGroupMembershipsId(string groupMembershipId, Body41 payload, string[]? fields = ()) returns GroupMembership|error {
        string  path = string `/group_memberships/${groupMembershipId}`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupMembership response = check self.clientEp->put(path, request, targetType=GroupMembership);
        return response;
    }
    # Remove user from group
    #
    # + groupMembershipId - The ID of the group membership.
    # + return - A blank response is returned if the membership was successfully deleted.
    remote isolated function deleteGroupMembershipsId(string groupMembershipId) returns http:Response|error {
        string  path = string `/group_memberships/${groupMembershipId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List all webhooks
    #
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a list of webhooks.
    remote isolated function getWebhooks(string? marker = (), int? 'limit = ()) returns Webhooks|error {
        string  path = string `/webhooks`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        Webhooks response = check self.clientEp-> get(path, targetType = Webhooks);
        return response;
    }
    # Create webhook
    #
    # + return - Returns the new webhook object.
    remote isolated function postWebhooks(Body42 payload) returns Webhook|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, targetType=Webhook);
        return response;
    }
    # Get webhook
    #
    # + webhookId - The ID of the webhook.
    # + return - Returns a webhook object
    remote isolated function getWebhooksId(string webhookId) returns Webhook|error {
        string  path = string `/webhooks/${webhookId}`;
        Webhook response = check self.clientEp-> get(path, targetType = Webhook);
        return response;
    }
    # Update webhook
    #
    # + webhookId - The ID of the webhook.
    # + return - Returns the new webhook object.
    remote isolated function putWebhooksId(string webhookId, Body43 payload) returns Webhook|error {
        string  path = string `/webhooks/${webhookId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->put(path, request, targetType=Webhook);
        return response;
    }
    # Remove webhook
    #
    # + webhookId - The ID of the webhook.
    # + return - An empty response will be returned when the webhook was successfully deleted.
    remote isolated function deleteWebhooksId(string webhookId) returns http:Response|error {
        string  path = string `/webhooks/${webhookId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update all Box Skill cards on file
    #
    # + skillId - The ID of the skill to apply this metadata for.
    # + return - Returns an empty response when the card has been successfully updated.
    remote isolated function putSkillInvocationsId(string skillId, Body44 payload) returns http:Response|error {
        string  path = string `/skill_invocations/${skillId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # List user and enterprise events
    #
    # + streamType - Defines the type of events that are returned  * `all` returns everything for a user and is the default * `changes` returns events that may cause file tree changes   such as file updates or collaborations. * `sync` is similar to `changes` but only applies to synced folders * `admin_logs` returns all events for an entire enterprise and   requires the user making the API call to have admin permissions.
    # + streamPosition - The location in the event stream to start receiving events from.  * `now` will return an empty list events and the latest stream position for initialization. * `0` or `null` will return all events.
    # + 'limit - Limits the number of events returned
    # + eventType - A comma-separated list of events to filter by. This can only be used when requesting the events with a `stream_type` of `admin_logs`. For any other `stream_type` this value will be ignored.
    # + createdAfter - The lower bound date and time to return events for. This can only be used when requesting the events with a `stream_type` of `admin_logs`. For any other `stream_type` this value will be ignored.
    # + createdBefore - The upper bound date and time to return events for. This can only be used when requesting the events with a `stream_type` of `admin_logs`. For any other `stream_type` this value will be ignored.
    # + return - Returns a list of event objects.  Events objects are returned in pages, with each page (chunk) including a list of event objects. The response includes a `chunk_size` parameter indicating how many events were returned in this chunk, as well as the next `stream_position` that can be queried.
    remote isolated function getEvents(string streamType = "all", string? streamPosition = (), int 'limit = 100, string[]? eventType = (), string? createdAfter = (), string? createdBefore = ()) returns Events|error {
        string  path = string `/events`;
        map<anydata> queryParam = {"stream_type": streamType, "stream_position": streamPosition, "limit": 'limit, "event_type": eventType, "created_after": createdAfter, "created_before": createdBefore};
        path = path + check getPathForQueryParam(queryParam);
        Events response = check self.clientEp-> get(path, targetType = Events);
        return response;
    }
    # Get events long poll endpoint
    #
    # + return - Returns a paginated array of servers that can be used instead of the regular endpoints for long-polling events.
    remote isolated function optionsEvents() returns RealtimeServers|error {
        string  path = string `/events`;
        RealtimeServers response = check self.clientEp-> options(path, targetType = RealtimeServers);
        return response;
    }
    # List all collections
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns all collections for the given user
    remote isolated function getCollections(string[]? fields = (), int offset = 0, int? 'limit = ()) returns Collections|error {
        string  path = string `/collections`;
        map<anydata> queryParam = {"fields": fields, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        Collections response = check self.clientEp-> get(path, targetType = Collections);
        return response;
    }
    # List collection items
    #
    # + collectionId - The ID of the collection.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + offset - The offset of the item at which to begin the response.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns an array of items in the collection.
    remote isolated function getCollectionsIdItems(string collectionId, string[]? fields = (), int offset = 0, int? 'limit = ()) returns Items|error {
        string  path = string `/collections/${collectionId}/items`;
        map<anydata> queryParam = {"fields": fields, "offset": offset, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        Items response = check self.clientEp-> get(path, targetType = Items);
        return response;
    }
    # List recently accessed items
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + 'limit - The maximum number of items to return per page.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + return - Returns a list recent items access by a user.
    remote isolated function getRecentItems(string[]? fields = (), int? 'limit = (), string? marker = ()) returns RecentItems|error {
        string  path = string `/recent_items`;
        map<anydata> queryParam = {"fields": fields, "limit": 'limit, "marker": marker};
        path = path + check getPathForQueryParam(queryParam);
        RecentItems response = check self.clientEp-> get(path, targetType = RecentItems);
        return response;
    }
    # List retention policies
    #
    # + policyName - Filters results by a case sensitive prefix of the name of retention policies.
    # + policyType - Filters results by the type of retention policy.
    # + createdByUserId - Filters results by the ID of the user who created policy.
    # + return - Returns a list retention policies in the enterprise.
    remote isolated function getRetentionPolicies(string? policyName = (), string? policyType = (), string? createdByUserId = ()) returns RetentionPolicies|error {
        string  path = string `/retention_policies`;
        map<anydata> queryParam = {"policy_name": policyName, "policy_type": policyType, "created_by_user_id": createdByUserId};
        path = path + check getPathForQueryParam(queryParam);
        RetentionPolicies response = check self.clientEp-> get(path, targetType = RetentionPolicies);
        return response;
    }
    # Create retention policy
    #
    # + return - Returns a new retention policy object.
    remote isolated function postRetentionPolicies(Body45 payload) returns RetentionPolicy|error {
        string  path = string `/retention_policies`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RetentionPolicy response = check self.clientEp->post(path, request, targetType=RetentionPolicy);
        return response;
    }
    # Get retention policy
    #
    # + retentionPolicyId - The ID of the retention policy.
    # + return - Returns the retention policy object.
    remote isolated function getRetentionPoliciesId(string retentionPolicyId) returns RetentionPolicy|error {
        string  path = string `/retention_policies/${retentionPolicyId}`;
        RetentionPolicy response = check self.clientEp-> get(path, targetType = RetentionPolicy);
        return response;
    }
    # Update retention policy
    #
    # + retentionPolicyId - The ID of the retention policy.
    # + return - Returns the updated retention policy object.
    remote isolated function putRetentionPoliciesId(string retentionPolicyId, Body46 payload) returns RetentionPolicy|error {
        string  path = string `/retention_policies/${retentionPolicyId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RetentionPolicy response = check self.clientEp->put(path, request, targetType=RetentionPolicy);
        return response;
    }
    # List retention policy assignments
    #
    # + retentionPolicyId - The ID of the retention policy.
    # + 'type - The type of the retention policy assignment to retrieve.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a list of the retention policy assignments associated with the specified retention policy.
    remote isolated function getRetentionPoliciesIdAssignments(string retentionPolicyId, string? 'type = (), string? marker = (), int? 'limit = ()) returns RetentionPolicyAssignments|error {
        string  path = string `/retention_policies/${retentionPolicyId}/assignments`;
        map<anydata> queryParam = {"type": 'type, "marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        RetentionPolicyAssignments response = check self.clientEp-> get(path, targetType = RetentionPolicyAssignments);
        return response;
    }
    # Assign retention policy
    #
    # + return - Returns a new retention policy assignment object.
    remote isolated function postRetentionPolicyAssignments(Body47 payload) returns RetentionPolicyAssignment|error {
        string  path = string `/retention_policy_assignments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RetentionPolicyAssignment response = check self.clientEp->post(path, request, targetType=RetentionPolicyAssignment);
        return response;
    }
    # Get retention policy assignment
    #
    # + retentionPolicyAssignmentId - The ID of the retention policy assignment.
    # + return - Returns the retention policy assignment object.
    remote isolated function getRetentionPolicyAssignmentsId(string retentionPolicyAssignmentId) returns RetentionPolicyAssignment|error {
        string  path = string `/retention_policy_assignments/${retentionPolicyAssignmentId}`;
        RetentionPolicyAssignment response = check self.clientEp-> get(path, targetType = RetentionPolicyAssignment);
        return response;
    }
    # List all legal hold policies
    #
    # + policyName - Limits results to policies for which the names start with this search term. This is a case-insensitive prefix.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a list of legal hold policies.
    remote isolated function getLegalHoldPolicies(string? policyName = (), string[]? fields = (), string? marker = (), int? 'limit = ()) returns LegalHoldPolicies|error {
        string  path = string `/legal_hold_policies`;
        map<anydata> queryParam = {"policy_name": policyName, "fields": fields, "marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        LegalHoldPolicies response = check self.clientEp-> get(path, targetType = LegalHoldPolicies);
        return response;
    }
    # Create legal hold policy
    #
    # + return - Returns a new legal hold policy object.
    remote isolated function postLegalHoldPolicies(Body48 payload) returns LegalHoldPolicy|error {
        string  path = string `/legal_hold_policies`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LegalHoldPolicy response = check self.clientEp->post(path, request, targetType=LegalHoldPolicy);
        return response;
    }
    # Get legal hold policy
    #
    # + legalHoldPolicyId - The ID of the legal hold policy
    # + return - Returns a legal hold policy object.
    remote isolated function getLegalHoldPoliciesId(string legalHoldPolicyId) returns LegalHoldPolicy|error {
        string  path = string `/legal_hold_policies/${legalHoldPolicyId}`;
        LegalHoldPolicy response = check self.clientEp-> get(path, targetType = LegalHoldPolicy);
        return response;
    }
    # Update legal hold policy
    #
    # + legalHoldPolicyId - The ID of the legal hold policy
    # + return - Returns a new legal hold policy object.
    remote isolated function putLegalHoldPoliciesId(string legalHoldPolicyId, Body49 payload) returns LegalHoldPolicy|error {
        string  path = string `/legal_hold_policies/${legalHoldPolicyId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LegalHoldPolicy response = check self.clientEp->put(path, request, targetType=LegalHoldPolicy);
        return response;
    }
    # Remove legal hold policy
    #
    # + legalHoldPolicyId - The ID of the legal hold policy
    # + return - A blank response is returned if the policy was successfully deleted.
    remote isolated function deleteLegalHoldPoliciesId(string legalHoldPolicyId) returns http:Response|error {
        string  path = string `/legal_hold_policies/${legalHoldPolicyId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List legal hold policy assignments
    #
    # + policyId - The ID of the legal hold policy
    # + assignToType - Filters the results by the type of item the policy was applied to.
    # + assignToId - Filters the results by the ID of item the policy was applied to.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns a list of legal hold policy assignments.
    remote isolated function getLegalHoldPolicyAssignments(string policyId, string? assignToType = (), string? assignToId = (), string? marker = (), int? 'limit = (), string[]? fields = ()) returns LegalHoldPolicyAssignments|error {
        string  path = string `/legal_hold_policy_assignments`;
        map<anydata> queryParam = {"policy_id": policyId, "assign_to_type": assignToType, "assign_to_id": assignToId, "marker": marker, "limit": 'limit, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        LegalHoldPolicyAssignments response = check self.clientEp-> get(path, targetType = LegalHoldPolicyAssignments);
        return response;
    }
    # Assign legal hold policy
    #
    # + return - Returns a new legal hold policy assignment.
    remote isolated function postLegalHoldPolicyAssignments(Body50 payload) returns LegalHoldPolicyAssignment|error {
        string  path = string `/legal_hold_policy_assignments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LegalHoldPolicyAssignment response = check self.clientEp->post(path, request, targetType=LegalHoldPolicyAssignment);
        return response;
    }
    # Get legal hold policy assignment
    #
    # + legalHoldPolicyAssignmentId - The ID of the legal hold policy assignment
    # + return - Returns a legal hold policy object.
    remote isolated function getLegalHoldPolicyAssignmentsId(string legalHoldPolicyAssignmentId) returns LegalHoldPolicyAssignment|error {
        string  path = string `/legal_hold_policy_assignments/${legalHoldPolicyAssignmentId}`;
        LegalHoldPolicyAssignment response = check self.clientEp-> get(path, targetType = LegalHoldPolicyAssignment);
        return response;
    }
    # Unassign legal hold policy
    #
    # + legalHoldPolicyAssignmentId - The ID of the legal hold policy assignment
    # + return - A blank response is returned if the assignment was successfully deleted.
    remote isolated function deleteLegalHoldPolicyAssignmentsId(string legalHoldPolicyAssignmentId) returns http:Response|error {
        string  path = string `/legal_hold_policy_assignments/${legalHoldPolicyAssignmentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List current file versions for legal hold policy assignment
    #
    # + legalHoldPolicyAssignmentId - The ID of the legal hold policy assignment
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the list of current file versions held under legal hold for a specific legal hold policy assignment.
    remote isolated function getLegalHoldPolicyAssignmentsIdFilesOnHold(string legalHoldPolicyAssignmentId, string? marker = (), int? 'limit = (), string[]? fields = ()) returns FileVersionLegalHolds|error {
        string  path = string `/legal_hold_policy_assignments/${legalHoldPolicyAssignmentId}/files_on_hold`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        FileVersionLegalHolds response = check self.clientEp-> get(path, targetType = FileVersionLegalHolds);
        return response;
    }
    # List previous file versions for legal hold policy assignment
    #
    # + legalHoldPolicyAssignmentId - The ID of the legal hold policy assignment
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + return - Returns the list of previous file versions held under legal hold for a specific legal hold policy assignment.
    remote isolated function getLegalHoldPolicyAssignmentsIdFileVersionsOnHold(string legalHoldPolicyAssignmentId, string? marker = (), int? 'limit = (), string[]? fields = ()) returns FileVersionLegalHolds|error {
        string  path = string `/legal_hold_policy_assignments/${legalHoldPolicyAssignmentId}/file_versions_on_hold`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        FileVersionLegalHolds response = check self.clientEp-> get(path, targetType = FileVersionLegalHolds);
        return response;
    }
    # Get retention on file
    #
    # + fileVersionRetentionId - The ID of the file version retention
    # + return - Returns a file version retention object.
    remote isolated function getFileVersionRetentionsId(string fileVersionRetentionId) returns FileVersionRetention|error {
        string  path = string `/file_version_retentions/${fileVersionRetentionId}`;
        FileVersionRetention response = check self.clientEp-> get(path, targetType = FileVersionRetention);
        return response;
    }
    # List file version retentions
    #
    # + fileId - Filters results by files with this ID.
    # + fileVersionId - Filters results by file versions with this ID.
    # + policyId - Filters results by the retention policy with this ID.
    # + dispositionAction - Filters results by the retention policy with this disposition action.
    # + dispositionBefore - Filters results by files that will have their disposition come into effect before this date.
    # + dispositionAfter - Filters results by files that will have their disposition come into effect after this date.
    # + 'limit - The maximum number of items to return per page.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + return - Returns a list of all file version retentions for the enterprise.
    remote isolated function getFileVersionRetentions(string? fileId = (), string? fileVersionId = (), string? policyId = (), string? dispositionAction = (), string? dispositionBefore = (), string? dispositionAfter = (), int? 'limit = (), string? marker = ()) returns FileVersionRetentions|error {
        string  path = string `/file_version_retentions`;
        map<anydata> queryParam = {"file_id": fileId, "file_version_id": fileVersionId, "policy_id": policyId, "disposition_action": dispositionAction, "disposition_before": dispositionBefore, "disposition_after": dispositionAfter, "limit": 'limit, "marker": marker};
        path = path + check getPathForQueryParam(queryParam);
        FileVersionRetentions response = check self.clientEp-> get(path, targetType = FileVersionRetentions);
        return response;
    }
    # Get file version legal hold
    #
    # + fileVersionLegalHoldId - The ID of the file version legal hold
    # + return - Returns the legal hold policy assignments for the file version.
    remote isolated function getFileVersionLegalHoldsId(string fileVersionLegalHoldId) returns FileVersionLegalHold|error {
        string  path = string `/file_version_legal_holds/${fileVersionLegalHoldId}`;
        FileVersionLegalHold response = check self.clientEp-> get(path, targetType = FileVersionLegalHold);
        return response;
    }
    # List file version legal holds
    #
    # + policyId - The ID of the legal hold policy to get the file version legal holds for.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns the list of file version legal holds for a specific legal hold policy.
    remote isolated function getFileVersionLegalHolds(string policyId, string? marker = (), int? 'limit = ()) returns FileVersionLegalHolds|error {
        string  path = string `/file_version_legal_holds`;
        map<anydata> queryParam = {"policy_id": policyId, "marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        FileVersionLegalHolds response = check self.clientEp-> get(path, targetType = FileVersionLegalHolds);
        return response;
    }
    # Get device pin
    #
    # + devicePinnerId - The ID of the device pin
    # + return - Returns information about a single device pin.
    remote isolated function getDevicePinnersId(string devicePinnerId) returns DevicePinner|error {
        string  path = string `/device_pinners/${devicePinnerId}`;
        DevicePinner response = check self.clientEp-> get(path, targetType = DevicePinner);
        return response;
    }
    # Remove device pin
    #
    # + devicePinnerId - The ID of the device pin
    # + return - Returns an empty response when the pin has been deleted.
    remote isolated function deleteDevicePinnersId(string devicePinnerId) returns http:Response|error {
        string  path = string `/device_pinners/${devicePinnerId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List enterprise device pins
    #
    # + enterpriseId - The ID of the enterprise
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + direction - The direction to sort results in. This can be either in alphabetical ascending (`ASC`) or descending (`DESC`) order.
    # + return - Returns a list of device pins for a given enterprise.
    remote isolated function getEnterprisesIdDevicePinners(string enterpriseId, string? marker = (), int? 'limit = (), string? direction = ()) returns DevicePinners|error {
        string  path = string `/enterprises/${enterpriseId}/device_pinners`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit, "direction": direction};
        path = path + check getPathForQueryParam(queryParam);
        DevicePinners response = check self.clientEp-> get(path, targetType = DevicePinners);
        return response;
    }
    # List terms of services
    #
    # + tosType - Limits the results to the terms of service of the given type.
    # + return - Returns a collection of terms of service text and settings for the enterprise.
    remote isolated function getTermsOfServices(string? tosType = ()) returns TermsOfServices|error {
        string  path = string `/terms_of_services`;
        map<anydata> queryParam = {"tos_type": tosType};
        path = path + check getPathForQueryParam(queryParam);
        TermsOfServices response = check self.clientEp-> get(path, targetType = TermsOfServices);
        return response;
    }
    # Create terms of service
    #
    # + return - Returns a new task object
    remote isolated function postTermsOfServices(Body51 payload) returns Task|error {
        string  path = string `/terms_of_services`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Task response = check self.clientEp->post(path, request, targetType=Task);
        return response;
    }
    # Get terms of service
    #
    # + termsOfServiceId - The ID of the terms of service.
    # + return - Returns a terms of service object.
    remote isolated function getTermsOfServicesId(string termsOfServiceId) returns TermsOfService|error {
        string  path = string `/terms_of_services/${termsOfServiceId}`;
        TermsOfService response = check self.clientEp-> get(path, targetType = TermsOfService);
        return response;
    }
    # Update terms of service
    #
    # + termsOfServiceId - The ID of the terms of service.
    # + return - Returns an updated terms of service object.
    remote isolated function putTermsOfServicesId(string termsOfServiceId, Body52 payload) returns TermsOfService|error {
        string  path = string `/terms_of_services/${termsOfServiceId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TermsOfService response = check self.clientEp->put(path, request, targetType=TermsOfService);
        return response;
    }
    # List terms of service user statuses
    #
    # + tosId - The ID of the terms of service.
    # + userId - Limits results to the given user ID.
    # + return - Returns a list of terms of service statuses.
    remote isolated function getTermsOfServiceUserStatuses(string tosId, string? userId = ()) returns TermsOfServiceUserStatuses|error {
        string  path = string `/terms_of_service_user_statuses`;
        map<anydata> queryParam = {"tos_id": tosId, "user_id": userId};
        path = path + check getPathForQueryParam(queryParam);
        TermsOfServiceUserStatuses response = check self.clientEp-> get(path, targetType = TermsOfServiceUserStatuses);
        return response;
    }
    # Create terms of service status for new user
    #
    # + return - Returns a terms of service status object.
    remote isolated function postTermsOfServiceUserStatuses(Body53 payload) returns TermsOfServiceUserStatus|error {
        string  path = string `/terms_of_service_user_statuses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TermsOfServiceUserStatus response = check self.clientEp->post(path, request, targetType=TermsOfServiceUserStatus);
        return response;
    }
    # Update terms of service status for existing user
    #
    # + termsOfServiceUserStatusId - The ID of the terms of service status.
    # + return - Returns the updated terms of service status object.
    remote isolated function putTermsOfServiceUserStatusesId(string termsOfServiceUserStatusId, Body54 payload) returns TermsOfServiceUserStatus|error {
        string  path = string `/terms_of_service_user_statuses/${termsOfServiceUserStatusId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TermsOfServiceUserStatus response = check self.clientEp->put(path, request, targetType=TermsOfServiceUserStatus);
        return response;
    }
    # List allowed collaboration domains
    #
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a collection of domains that are allowed for collaboration.
    remote isolated function getCollaborationWhitelistEntries(string? marker = (), int? 'limit = ()) returns CollaborationAllowlistEntries|error {
        string  path = string `/collaboration_whitelist_entries`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CollaborationAllowlistEntries response = check self.clientEp-> get(path, targetType = CollaborationAllowlistEntries);
        return response;
    }
    # Add domain to list of allowed collaboration domains
    #
    # + return - Returns a new entry on the list of allowed domains.
    remote isolated function postCollaborationWhitelistEntries(Body55 payload) returns CollaborationAllowlistEntry|error {
        string  path = string `/collaboration_whitelist_entries`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollaborationAllowlistEntry response = check self.clientEp->post(path, request, targetType=CollaborationAllowlistEntry);
        return response;
    }
    # Get allowed collaboration domain
    #
    # + collaborationWhitelistEntryId - The ID of the entry in the list.
    # + return - Returns an entry on the list of allowed domains.
    remote isolated function getCollaborationWhitelistEntriesId(string collaborationWhitelistEntryId) returns CollaborationAllowlistEntry|error {
        string  path = string `/collaboration_whitelist_entries/${collaborationWhitelistEntryId}`;
        CollaborationAllowlistEntry response = check self.clientEp-> get(path, targetType = CollaborationAllowlistEntry);
        return response;
    }
    # Remove domain from list of allowed collaboration domains
    #
    # + collaborationWhitelistEntryId - The ID of the entry in the list.
    # + return - A blank response is returned if the entry was successfully deleted.
    remote isolated function deleteCollaborationWhitelistEntriesId(string collaborationWhitelistEntryId) returns http:Response|error {
        string  path = string `/collaboration_whitelist_entries/${collaborationWhitelistEntryId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List users exempt from collaboration domain restrictions
    #
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a collection of user exemptions.
    remote isolated function getCollaborationWhitelistExemptTargets(string? marker = (), int? 'limit = ()) returns CollaborationAllowlistExemptTargets|error {
        string  path = string `/collaboration_whitelist_exempt_targets`;
        map<anydata> queryParam = {"marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        CollaborationAllowlistExemptTargets response = check self.clientEp-> get(path, targetType = CollaborationAllowlistExemptTargets);
        return response;
    }
    # Create user exemption from collaboration domain restrictions
    #
    # + return - Returns a new exemption entry.
    remote isolated function postCollaborationWhitelistExemptTargets(Body56 payload) returns CollaborationAllowlistExemptTarget|error {
        string  path = string `/collaboration_whitelist_exempt_targets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollaborationAllowlistExemptTarget response = check self.clientEp->post(path, request, targetType=CollaborationAllowlistExemptTarget);
        return response;
    }
    # Get user exempt from collaboration domain restrictions
    #
    # + collaborationWhitelistExemptTargetId - The ID of the exemption to the list.
    # + return - Returns the user's exempted from the list of collaboration domains.
    remote isolated function getCollaborationWhitelistExemptTargetsId(string collaborationWhitelistExemptTargetId) returns CollaborationAllowlistExemptTarget|error {
        string  path = string `/collaboration_whitelist_exempt_targets/${collaborationWhitelistExemptTargetId}`;
        CollaborationAllowlistExemptTarget response = check self.clientEp-> get(path, targetType = CollaborationAllowlistExemptTarget);
        return response;
    }
    # Remove user from list of users exempt from domain restrictions
    #
    # + collaborationWhitelistExemptTargetId - The ID of the exemption to the list.
    # + return - A blank response is returned if the exemption was successfully deleted.
    remote isolated function deleteCollaborationWhitelistExemptTargetsId(string collaborationWhitelistExemptTargetId) returns http:Response|error {
        string  path = string `/collaboration_whitelist_exempt_targets/${collaborationWhitelistExemptTargetId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List storage policies
    #
    # + fields - A comma-separated list of attributes to include in the response. This can be used to request fields that are not normally returned in a standard response.  Be aware that specifying this parameter will have the effect that none of the standard fields are returned in the response unless explicitly specified, instead only fields for the mini representation are returned, additional to the fields requested.
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + 'limit - The maximum number of items to return per page.
    # + return - Returns a collection of storage policies.
    remote isolated function getStoragePolicies(string[]? fields = (), string? marker = (), int? 'limit = ()) returns StoragePolicies|error {
        string  path = string `/storage_policies`;
        map<anydata> queryParam = {"fields": fields, "marker": marker, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        StoragePolicies response = check self.clientEp-> get(path, targetType = StoragePolicies);
        return response;
    }
    # Get storage policy
    #
    # + storagePolicyId - The ID of the storage policy.
    # + return - Returns a storage policy object.
    remote isolated function getStoragePoliciesId(string storagePolicyId) returns StoragePolicy|error {
        string  path = string `/storage_policies/${storagePolicyId}`;
        StoragePolicy response = check self.clientEp-> get(path, targetType = StoragePolicy);
        return response;
    }
    # List storage policy assignments
    #
    # + resolvedForType - The target type to return assignments for
    # + resolvedForId - The ID of the user or enterprise to return assignments for
    # + marker - Defines the position marker at which to begin returning results. This is used when paginating using marker-based pagination.  This requires `usemarker` to be set to `true`.
    # + return - Returns a collection of storage policies for the enterprise or user.
    remote isolated function getStoragePolicyAssignments(string resolvedForType, string resolvedForId, string? marker = ()) returns StoragePolicyAssignments|error {
        string  path = string `/storage_policy_assignments`;
        map<anydata> queryParam = {"marker": marker, "resolved_for_type": resolvedForType, "resolved_for_id": resolvedForId};
        path = path + check getPathForQueryParam(queryParam);
        StoragePolicyAssignments response = check self.clientEp-> get(path, targetType = StoragePolicyAssignments);
        return response;
    }
    # Assign storage policy
    #
    # + return - Returns the new storage policy assignment created.
    remote isolated function postStoragePolicyAssignments(Body57 payload) returns StoragePolicyAssignment|error {
        string  path = string `/storage_policy_assignments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoragePolicyAssignment response = check self.clientEp->post(path, request, targetType=StoragePolicyAssignment);
        return response;
    }
    # Get storage policy assignment
    #
    # + storagePolicyAssignmentId - The ID of the storage policy assignment.
    # + return - Returns a storage policy assignment object.
    remote isolated function getStoragePolicyAssignmentsId(string storagePolicyAssignmentId) returns StoragePolicyAssignment|error {
        string  path = string `/storage_policy_assignments/${storagePolicyAssignmentId}`;
        StoragePolicyAssignment response = check self.clientEp-> get(path, targetType = StoragePolicyAssignment);
        return response;
    }
    # Update storage policy assignment
    #
    # + storagePolicyAssignmentId - The ID of the storage policy assignment.
    # + return - Returns an updated storage policy assignment object.
    remote isolated function putStoragePolicyAssignmentsId(string storagePolicyAssignmentId, Body58 payload) returns StoragePolicyAssignment|error {
        string  path = string `/storage_policy_assignments/${storagePolicyAssignmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StoragePolicyAssignment response = check self.clientEp->put(path, request, targetType=StoragePolicyAssignment);
        return response;
    }
    # Unassign storage policy
    #
    # + storagePolicyAssignmentId - The ID of the storage policy assignment.
    # + return - Returns an empty response when the storage policy assignment is successfully deleted.
    remote isolated function deleteStoragePolicyAssignmentsId(string storagePolicyAssignmentId) returns http:Response|error {
        string  path = string `/storage_policy_assignments/${storagePolicyAssignmentId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Create zip download
    #
    # + return - If the `zip` archive is ready to be downloaded, the API will return a response that will include a `download_url`, a `status_url`, as well as any conflicts that might have occurred when creating the request.
    remote isolated function postZipDownloads(ZipDownloadRequest payload) returns ZipDownload|error {
        string  path = string `/zip_downloads`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ZipDownload response = check self.clientEp->post(path, request, targetType=ZipDownload);
        return response;
    }
    # Download zip archive
    #
    # + zipDownloadId - The unique identifier that represent this `zip` archive.
    # + return - Returns the content of the items requested for this download, formatted as a stream of files and folders in a `zip` archive.
    remote isolated function getZipDownloadsIdContent(string zipDownloadId) returns string|error {
        string  path = string `/zip_downloads/${zipDownloadId}/content`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Get zip download status
    #
    # + zipDownloadId - The unique identifier that represent this `zip` archive.
    # + return - Returns the status of the `zip` archive that is being downloaded.
    remote isolated function getZipDownloadsIdStatus(string zipDownloadId) returns ZipDownloadStatus|error {
        string  path = string `/zip_downloads/${zipDownloadId}/status`;
        ZipDownloadStatus response = check self.clientEp-> get(path, targetType = ZipDownloadStatus);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
