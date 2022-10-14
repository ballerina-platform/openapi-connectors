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
    string refreshUrl = "/oauth/token";
|};

# This is a generated connector from [Dracoon API v4.28.3](https://www.dracoon.com/en/home) OpenAPI specification.
# REST Web Services for DRACOON. <a title='Developer Information' href='https://developer.dracoon.com'>Developer Information</a>&emsp;&emsp;<a title='Get SDKs on GitHub' href='https://github.com/dracoon'>Get SDKs on GitHub</a><br><br><a title='Terms of service' href='https://www.dracoon.com/terms/general-terms-and-conditions/'>Terms of service</a>
@display {label: "Dracoon Public", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Dracoon account](https://www.dracoon.com/en/home) and obtain OAuth tokens following [this guide](https://cloud.support.dracoon.com/hc/en-us/articles/360001329825-OAuth-2-0-example).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://stats.bis.org/api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Authenticate user (Login)
    #
    # + payload - User credentials 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function login(LoginRequest payload) returns LoginResponse|error {
        string resourcePath = string `/v4/auth/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LoginResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Initiate OpenID Connect authentication
    #
    # + issuer - Issuer identifier of the OpenID Connect identity provider 
    # + redirectUri - Redirect URI to complete the OpenID Connect authentication 
    # + language - Language ID or ISO 639-1 code 
    # + test - Flag to test the authentication parameters. If the request is valid, the API will respond with `204 No Content`. 
    # # Deprecated parameters
    # + language -
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function initiateOpenIdLogin(string issuer, string redirectUri, @deprecated string language, boolean test) returns http:Response|error {
        string resourcePath = string `/v4/auth/openid/login`;
        map<anydata> queryParam = {"issuer": issuer, "redirect_uri": redirectUri, "language": language, "test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Complete OpenID Connect authentication
    #
    # + code - Authorization code 
    # + idToken - Identity token 
    # + state - Authentication state 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function completeOpenIdLogin(string code, string state, string? idToken = ()) returns LoginResponse|error {
        string resourcePath = string `/v4/auth/openid/login`;
        map<anydata> queryParam = {"code": code, "id_token": idToken, "state": state};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        LoginResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Request OpenID Connect authentication resources
    #
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestOpenIdAuthResources() returns OpenIdAuthResources|error {
        string resourcePath = string `/v4/auth/openid/resources`;
        OpenIdAuthResources response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Ping
    #
    # + return - OK 
    remote isolated function ping() returns string|error {
        string resourcePath = string `/v4/auth/ping`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Recover username
    #
    # + return - No Content 
    remote isolated function recoverUserName(RecoverUserNameRequest payload) returns http:Response|error {
        string resourcePath = string `/v4/auth/recover_username`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Request password reset
    #
    # + return - No Content 
    remote isolated function requestPasswordReset(ResetPasswordRequest payload) returns http:Response|error {
        string resourcePath = string `/v4/auth/reset_password`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Validate information for password reset
    #
    # + token - Password reset token 
    # + return - OK 
    remote isolated function validateResetPasswordToken(string token) returns ResetPasswordTokenValidateResponse|error {
        string resourcePath = string `/v4/auth/reset_password/${getEncodedUri(token)}`;
        ResetPasswordTokenValidateResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Reset password
    #
    # + token - Password reset token 
    # + return - No Content 
    remote isolated function resetPassword(string token, ResetPasswordWithTokenRequest payload) returns http:Response|error {
        string resourcePath = string `/v4/auth/reset_password/${getEncodedUri(token)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Request default values
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestSystemDefaultsInfo(string? xSdsAuthToken = ()) returns SystemDefaults|error {
        string resourcePath = string `/v4/config/info/defaults`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SystemDefaults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request general settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGeneralSettingsInfo(string? xSdsAuthToken = ()) returns GeneralSettingsInfo|error {
        string resourcePath = string `/v4/config/info/general`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GeneralSettingsInfo response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request infrastructure properties
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestInfrastructurePropertiesInfo(string? xSdsAuthToken = ()) returns InfrastructureProperties|error {
        string resourcePath = string `/v4/config/info/infrastructure`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InfrastructureProperties response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of notification channels
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestNotificationChannelsInfo(string? xSdsAuthToken = ()) returns NotificationChannelList|error {
        string resourcePath = string `/v4/config/info/notifications/channels`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationChannelList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request algorithms
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAlgorithms(string? xSdsAuthToken = ()) returns AlgorithmVersionInfoList|error {
        string resourcePath = string `/v4/config/info/policies/algorithms`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AlgorithmVersionInfoList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request password policies
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestPasswordPoliciesConfigInfo(string? xSdsAuthToken = ()) returns PasswordPoliciesConfig|error {
        string resourcePath = string `/v4/config/info/policies/passwords`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PasswordPoliciesConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of configured S3 tags
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestS3TagsInfo(string? xSdsAuthToken = ()) returns S3TagList|error {
        string resourcePath = string `/v4/config/info/s3_tags`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3TagList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestSystemSettings(string? xSdsAuthToken = ()) returns ConfigOptionList|error {
        string resourcePath = string `/v4/config/settings`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ConfigOptionList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update system settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function updateSystemSettings(ConfigOptionList payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/config/settings`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Download avatar
    #
    # + userId - User ID 
    # + uuid - UUID of the avatar 
    # + return - OK 
    remote isolated function downloadAvatar(int userId, string uuid) returns string|error {
        string resourcePath = string `/v4/downloads/avatar/${getEncodedUri(userId)}/${getEncodedUri(uuid)}`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Download ZIP archive
    #
    # + token - Download token 
    # + return - OK 
    remote isolated function downloadZipArchiveViaToken(string token) returns http:Response|error {
        string resourcePath = string `/v4/downloads/zip/${getEncodedUri(token)}`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Download file
    #
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadFileViaToken(string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/downloads/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download file
    #
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadfileviatoken1(string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/downloads/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # Request node assigned users with permissions
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAuditNodeUserData(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns AuditNodeResponse[]|error {
        string resourcePath = string `/v4/eventlog/audits/nodes`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditNodeResponse[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system events
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + dateStart - Filter events from given date  e.g. `2015-12-31T23:59:00` 
    # + dateEnd - Filter events until given date  e.g. `2015-12-31T23:59:00` 
    # + 'type - Operation ID  cf. `GET /eventlog/operations` 
    # + userId - User ID 
    # + status - Operation status: * `0` - Success * `2` - Error 
    # + userClient - User client 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestLogEventsAsJson(string? xSdsDateFormat = (), string? sort = (), int? offset = (), int? 'limit = (), string? dateStart = (), string? dateEnd = (), int? 'type = (), int? userId = (), string? status = (), string? userClient = (), string? xSdsAuthToken = ()) returns LogEventList|error {
        string resourcePath = string `/v4/eventlog/events`;
        map<anydata> queryParam = {"sort": sort, "offset": offset, "limit": 'limit, "date_start": dateStart, "date_end": dateEnd, "type": 'type, "user_id": userId, "status": status, "user_client": userClient};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LogEventList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request allowed Log Operations
    #
    # + isDeprecated - Show only deprecated operations 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestLogOperations(boolean? isDeprecated = (), string? xSdsAuthToken = ()) returns LogOperationList|error {
        string resourcePath = string `/v4/eventlog/operations`;
        map<anydata> queryParam = {"is_deprecated": isDeprecated};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LogOperationList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of user groups
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGroups(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns GroupList|error {
        string resourcePath = string `/v4/groups`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new user group
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createGroup(CreateGroupRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Group|error {
        string resourcePath = string `/v4/groups`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request user group
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGroup(int groupId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Group|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Group response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update user group's metadata
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateGroup(int groupId, UpdateGroupRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Group|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove user group
    #
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeGroup(int groupId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request rooms where the group is defined as last admin group
    #
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestLastAdminRoomsGroups(int groupId, string? xSdsAuthToken = ()) returns LastAdminGroupRoomList|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/last_admin_rooms`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LastAdminGroupRoomList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of roles assigned to the group
    #
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGroupRoles(int groupId, string? xSdsAuthToken = ()) returns RoleList|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/roles`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request rooms granted to the group or / and rooms that can be granted
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + groupId - Group ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestGroupRooms(int groupId, string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns RoomTreeDataList|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/rooms`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomTreeDataList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request group member users or / and users who can become a member
    #
    # + groupId - Group ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGroupMembers(int groupId, int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns GroupUserList|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/users`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupUserList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add group members
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function addGroupMembers(int groupId, ChangeGroupMembersRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Group|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/users`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Group response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove group members
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + groupId - Group ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function removeGroupMembers(int groupId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Group|error {
        string resourcePath = string `/v4/groups/${getEncodedUri(groupId)}/users`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Group response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of nodes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + depthLevel - * `0` - top level nodes only * `n` (any positive number) - include `n` levels starting from the current node 
    # + parentId - Parent node ID. Only rooms and folders can be parents. Parent ID `0` or empty is the root node. 
    # + roomManager - Show all rooms for management perspective. Only possible for _Rooms Managers_. For all other users, it will be ignored. 
    # + filter - Filter string 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # # Deprecated parameters
    # + depthLevel -
    # + return - OK 
    remote isolated function requestNodes(string? xSdsDateFormat = (), @deprecated int? depthLevel = (), int? parentId = (), boolean? roomManager = (), string? filter = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns NodeList|error {
        string resourcePath = string `/v4/nodes`;
        map<anydata> queryParam = {"depth_level": depthLevel, "parent_id": parentId, "room_manager": roomManager, "filter": filter, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NodeList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove nodes
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeNodes(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Edit node comment
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + commentId - Comment ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateNodeComment(int commentId, ChangeNodeCommentRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Comment|error {
        string resourcePath = string `/v4/nodes/comments/${getEncodedUri(commentId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Comment response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove node comment
    #
    # + commentId - Comment ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeNodeComment(int commentId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/comments/${getEncodedUri(commentId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Remove nodes from recycle bin
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeDeletedNodes(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/deleted_nodes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Restore deleted nodes
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function restoreNodes(RestoreDeletedNodesRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/deleted_nodes/actions/restore`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request deleted node
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + deletedNodeId - Deleted node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDeletedNode(int deletedNodeId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns DeletedNode|error {
        string resourcePath = string `/v4/nodes/deleted_nodes/${getEncodedUri(deletedNodeId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeletedNode response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Mark or unmark a list of nodes (room, folder or file) as favorite
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateFavorites(UpdateFavoritesBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/favorites`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Updates a list of  file’s metadata
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateFiles(UpdateFilesBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Set file keys for a list of users and files
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function setUserFileKeys(UserFileKeySetBatchRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files/keys`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create new file upload channel
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createFileUploadChannel(CreateFileUploadRequest payload, string? xSdsAuthToken = ()) returns CreateFileUploadResponse|error {
        string resourcePath = string `/v4/nodes/files/uploads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateFileUploadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request status of S3 file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + uploadId - Upload channel ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUploadStatusFiles(string uploadId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns S3FileUploadStatus|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3FileUploadStatus response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Complete file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + uploadId - Upload channel ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function completeFileUpload(string uploadId, CompleteUploadRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Upload file
    #
    # + uploadId - Upload channel ID 
    # + contentRange - Content-Range  e.g. `bytes 0-999/3980` 
    # + xSdsAuthToken - Authentication token 
    # + payload - File 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function uploadFileAsMultipart(string uploadId, UploadsUploadIdBody payload, string? contentRange = (), string? xSdsAuthToken = ()) returns ChunkUploadResponse|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"Content-Range": contentRange, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ChunkUploadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel file upload
    #
    # + uploadId - Upload channel ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function cancelFileUpload(string uploadId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Complete S3 file upload
    #
    # + uploadId - Upload channel ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Accepted 
    remote isolated function completeS3FileUpload(string uploadId, CompleteS3FileUploadRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}/s3`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Generate presigned URLs for S3 file upload
    #
    # + uploadId - Upload channel ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function generatePresignedUrlsFiles(string uploadId, GeneratePresignedUrlsRequest payload, string? xSdsAuthToken = ()) returns PresignedUrlList|error {
        string resourcePath = string `/v4/nodes/files/uploads/${getEncodedUri(uploadId)}/s3_urls`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PresignedUrlList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Updates a file’s metadata
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + fileId - File ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateFile(int fileId, UpdateFileRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request room rescue key
    #
    # + fileId - File ID 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestRoomRescueKey(int fileId, string? 'version = (), string? xSdsAuthToken = ()) returns FileKey|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/data_room_file_key`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileKey response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system rescue key
    #
    # + fileId - File ID 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestSystemRescueKey(int fileId, string? 'version = (), string? xSdsAuthToken = ()) returns FileKey|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/data_space_file_key`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileKey response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download file
    #
    # + fileId - File ID 
    # + range - Range  e.g. `bytes=0-999/3980` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function downloadFile(int fileId, string? range = (), boolean? genericMimetype = (), boolean? inline = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/downloads`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate download URL
    #
    # + fileId - File ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function generateDownloadUrl(int fileId, string? xSdsAuthToken = ()) returns DownloadTokenGenerateResponse|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/downloads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        DownloadTokenGenerateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download file
    #
    # + fileId - File ID 
    # + range - Range  e.g. `bytes=0-999/3980` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function downloadfile1(int fileId, string? range = (), boolean? genericMimetype = (), boolean? inline = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/downloads`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # Request user's file key
    #
    # + fileId - File ID 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserFileKey(int fileId, string? 'version = (), string? xSdsAuthToken = ()) returns FileKey|error {
        string resourcePath = string `/v4/nodes/files/${getEncodedUri(fileId)}/user_file_key`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileKey response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new folder
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createFolder(CreateFolderRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/folders`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Updates folder’s metadata
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + folderId - Folder ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateFolder(int folderId, UpdateFolderRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/folders/${getEncodedUri(folderId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request files without user's file key
    #
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + roomId - Room ID 
    # + fileId - File ID 
    # + userId - User ID 
    # + useKey - Determines which key should be used (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestMissingFileKeys(int? offset = (), int? 'limit = (), int? roomId = (), int? fileId = (), int? userId = (), string? useKey = (), string? xSdsAuthToken = ()) returns MissingKeysResponse|error {
        string resourcePath = string `/v4/nodes/missingFileKeys`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "room_id": roomId, "file_id": fileId, "user_id": userId, "use_key": useKey};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MissingKeysResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createRoom(CreateRoomRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/rooms`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request user-room assignments per group
    #
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestPendingAssignments(int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns PendingAssignmentList|error {
        string resourcePath = string `/v4/nodes/rooms/pending`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PendingAssignmentList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Handle user-room assignments per group
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function changePendingAssignments(PendingAssignmentsRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/pending`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Updates room’s metadata
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateRoom(int roomId, UpdateRoomRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request events of a room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + dateStart - Filter events from given date  e.g. `2015-12-31T23:59:00` 
    # + dateEnd - Filter events until given date  e.g. `2015-12-31T23:59:00` 
    # + 'type - Operation ID  cf. `GET /eventlog/operations` 
    # + userId - User ID 
    # + status - Operation status: * `0` - Success * `2` - Error 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestRoomActivitiesLogAsJsonOld(int roomId, string? xSdsDateFormat = (), string? sort = (), int? offset = (), int? 'limit = (), string? dateStart = (), string? dateEnd = (), int? 'type = (), int? userId = (), int? status = (), string? xSdsAuthToken = ()) returns SyslogEventList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/activities_log`;
        map<anydata> queryParam = {"sort": sort, "offset": offset, "limit": 'limit, "date_start": dateStart, "date_end": dateEnd, "type": 'type, "user_id": userId, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SyslogEventList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Configure room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function configureRoom(int roomId, ConfigRoomRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/config`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Encrypt room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function encryptRoom(int roomId, EncryptRoomRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/encrypt`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request events of a room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + dateStart - Filter events from given date  e.g. `2015-12-31T23:59:00` 
    # + dateEnd - Filter events until given date  e.g. `2015-12-31T23:59:00` 
    # + 'type - Operation ID  cf. `GET /eventlog/operations` 
    # + userId - User ID 
    # + status - Operation status: * `0` - Success * `2` - Error 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoomActivitiesLogAsJson(int roomId, string? xSdsDateFormat = (), string? sort = (), int? offset = (), int? 'limit = (), string? dateStart = (), string? dateEnd = (), int? 'type = (), int? userId = (), int? status = (), string? xSdsAuthToken = ()) returns LogEventList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/events`;
        map<anydata> queryParam = {"sort": sort, "offset": offset, "limit": 'limit, "date_start": dateStart, "date_end": dateEnd, "type": 'type, "user_id": userId, "status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LogEventList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request room granted group(s) or / and group(s) that can be granted
    #
    # + roomId - Room ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoomGroups(int roomId, int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns RoomGroupList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/groups`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomGroupList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or change room granted group(s)
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateRoomGroups(int roomId, RoomGroupsAddBatchRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/groups`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Revoke granted group(s) from room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function revokeRoomGroups(int roomId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/groups`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request room rescue key
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoomRescueKeyPair(int roomId, string? xSdsDateFormat = (), string? 'version = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set room's rescue key pair
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function setRoomRescueKeyPair(int roomId, UserKeyPairContainer payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/keypair`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove rooms's rescue key pair
    #
    # + roomId - Room ID 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeRoomRescueKeyPair(int roomId, string? 'version = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request all room rescue key pairs
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function requestRoomRescueKeyPairs(int roomId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer[]|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/keypairs`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create key pair and preserve copy of old private key
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function createAndPreserveRoomRescueKeyPair(int roomId, CreateKeyPairRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/keypairs`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of all assigned S3 tags to the room
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoomS3Tags(int roomId, string? xSdsAuthToken = ()) returns S3TagList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/s3_tags`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3TagList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set S3 tags for a room
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function setRoomS3Tags(int roomId, S3TagIds payload, string? xSdsAuthToken = ()) returns S3TagList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/s3_tags`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        S3TagList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request room granted user(s) or / and user(s) that can be granted
    #
    # + roomId - Room ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoomUsers(int roomId, int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns RoomUserList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/users`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomUserList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or change room granted user(s)
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateRoomUsers(int roomId, RoomUsersAddBatchRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/users`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Revoke granted user(s) from room
    #
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function revokeRoomUsers(int roomId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/users`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of webhooks that are assigned or can be assigned to this room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestListOfWebhooksForRoom(int roomId, string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns RoomWebhookList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/webhooks`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomWebhookList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign or unassign webhooks to room
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + roomId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function handleRoomWebhookAssignments(int roomId, UpdateRoomWebhookRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns RoomWebhookList|error {
        string resourcePath = string `/v4/nodes/rooms/${getEncodedUri(roomId)}/webhooks`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RoomWebhookList response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Search nodes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + searchString - Search string 
    # + depthLevel - * `0` - top level nodes only (default) * `-1` - full tree * `n` (any positive number) - include `n` levels starting from the current node 
    # + parentId - Parent node ID. Only rooms and folders can be parents. Parent ID `0` or empty is the root node. 
    # + filter - Filter string 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function searchNodes(string searchString, string? xSdsDateFormat = (), int? depthLevel = (), int? parentId = (), string? filter = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns NodeList|error {
        string resourcePath = string `/v4/nodes/search`;
        map<anydata> queryParam = {"search_string": searchString, "depth_level": depthLevel, "parent_id": parentId, "filter": filter, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NodeList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate download URL for ZIP download
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function generateDownloadUrlForZipArchive(ZipDownloadRequest payload, string? xSdsAuthToken = ()) returns DownloadTokenGenerateResponse|error {
        string resourcePath = string `/v4/nodes/zip`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DownloadTokenGenerateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download files / folders as ZIP archive
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function downloadZipArchive(ZipDownloadRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/zip/download`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request node
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestNode(int nodeId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Node response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove node
    #
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeNode(int nodeId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of node comments
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + nodeId - Node ID 
    # + hideDeleted - Hide deleted comments (default: false) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestNodeComments(int nodeId, string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), boolean? hideDeleted = (), string? xSdsAuthToken = ()) returns CommentList|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/comments`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "hide_deleted": hideDeleted};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CommentList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create node comment
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createNodeComment(int nodeId, CreateNodeCommentRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Comment|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/comments`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Comment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Copy node(s)
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Target parent node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function copyNodes(int nodeId, CopyNodesRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns string|Node|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/copy_to`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string|Node response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of deleted nodes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Parent ID (can only be a room ID) 
    # + filter - Filter string 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDeletedNodesSummary(int nodeId, string? xSdsDateFormat = (), string? filter = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns DeletedNodeSummaryList|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/deleted_nodes`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeletedNodeSummaryList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Empty recycle bin
    #
    # + nodeId - Room ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function emptyDeletedNodes(int nodeId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/deleted_nodes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request deleted versions of nodes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Parent ID (room or folder ID) 
    # + 'type - Node type 
    # + name - Node name 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDeletedNodeVersions(int nodeId, string 'type, string name, string? xSdsDateFormat = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns DeletedNodeVersionsList|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/deleted_nodes/versions`;
        map<anydata> queryParam = {"type": 'type, "name": name, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeletedNodeVersionsList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Mark a node (room, folder or file) as favorite
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function addFavorite(int nodeId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Node|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/favorite`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Node response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unmark a node (room, folder or file) as favorite
    #
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeFavorite(int nodeId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/favorite`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Move node(s)
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + nodeId - Target parent node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function moveNodes(int nodeId, MoveNodesRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns string|Node|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/move_to`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string|Node response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of parent nodes
    #
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestNodeParents(int nodeId, string? xSdsAuthToken = ()) returns NodeParentList|error {
        string resourcePath = string `/v4/nodes/${getEncodedUri(nodeId)}/parents`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NodeParentList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of customers
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + includeAttributes - Include custom customer attributes. 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestCustomers(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), boolean? includeAttributes = (), string? xSdsServiceToken = ()) returns CustomerList|error {
        string resourcePath = string `/v4/provisioning/customers`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort, "include_attributes": includeAttributes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create customer
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsServiceToken - Service Authentication token 
    # + return - Created 
    remote isolated function createCustomer(NewCustomerRequest payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns NewCustomerResponse|error {
        string resourcePath = string `/v4/provisioning/customers`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NewCustomerResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get customer
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + customerId - Customer ID 
    # + includeAttributes - Include custom customer attributes. 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestCustomer(int customerId, string? xSdsDateFormat = (), boolean? includeAttributes = (), string? xSdsServiceToken = ()) returns Customer|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}`;
        map<anydata> queryParam = {"include_attributes": includeAttributes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Customer response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update customer
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + customerId - Customer ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function updateCustomer(int customerId, UpdateCustomerRequest payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns UpdateCustomerResponse|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdateCustomerResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove customer
    #
    # + customerId - Customer ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - No Content 
    remote isolated function removeCustomer(int customerId, string? xSdsServiceToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}`;
        map<any> headerValues = {"X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request customer attributes
    #
    # + customerId - Customer ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestCustomerAttributes(int customerId, int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsServiceToken = ()) returns AttributesResponse|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}/customerAttributes`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AttributesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or edit customer attributes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + customerId - Customer ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function updateCustomerAttributes(int customerId, CustomerAttributes payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Customer|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}/customerAttributes`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Set customer attributes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + customerId - Customer ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setCustomerAttributes(int customerId, CustomerAttributes payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Customer|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}/customerAttributes`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Customer response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove customer attribute
    #
    # + customerId - Customer ID 
    # + 'key - Key 
    # + xSdsServiceToken - Service Authentication token 
    # + return - No Content 
    remote isolated function removeCustomerAttribute(int customerId, string 'key, string? xSdsServiceToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}/customerAttributes/${getEncodedUri('key)}`;
        map<any> headerValues = {"X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of customer users
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + customerId - Customer ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + includeAttributes - Include custom user attributes. 
    # + includeRoles - Include roles 
    # + includeManageableRooms - Include hasManageableRooms (deprecated) 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestCustomerUsers(int customerId, string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), boolean? includeAttributes = (), boolean? includeRoles = (), boolean? includeManageableRooms = (), string? xSdsServiceToken = ()) returns UserList|error {
        string resourcePath = string `/v4/provisioning/customers/${getEncodedUri(customerId)}/users`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort, "include_attributes": includeAttributes, "include_roles": includeRoles, "include_manageable_rooms": includeManageableRooms};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of tenant webhooks
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestListOfTenantWebhooks(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsServiceToken = ()) returns WebhookList|error {
        string resourcePath = string `/v4/provisioning/webhooks`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WebhookList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create tenant webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsServiceToken - Service Authentication token 
    # + return - Created 
    remote isolated function createTenantWebhook(CreateWebhookRequest payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/provisioning/webhooks`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of event types
    #
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestListOfEventTypesForTenant(string? xSdsServiceToken = ()) returns EventTypeList|error {
        string resourcePath = string `/v4/provisioning/webhooks/event_types`;
        map<any> headerValues = {"X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EventTypeList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request tenant webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function requestTenantWebhook(int webhookId, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/provisioning/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Webhook response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update tenant webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function updateTenantWebhook(int webhookId, UpdateWebhookRequest payload, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/provisioning/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove tenant webhook
    #
    # + webhookId - Webhook ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - No Content 
    remote isolated function removeTenantWebhook(int webhookId, string? xSdsServiceToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/provisioning/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Reset tenant webhook lifetime
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsServiceToken - Service Authentication token 
    # + return - OK 
    remote isolated function resetTenantWebhookLifetime(int webhookId, string? xSdsDateFormat = (), string? xSdsServiceToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/provisioning/webhooks/${getEncodedUri(webhookId)}/reset_lifetime`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Service-Token": xSdsServiceToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Webhook response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request public Download Share information
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + return - OK 
    remote isolated function requestPublicDownloadShareInfo(string accessKey, string? xSdsDateFormat = ()) returns PublicDownloadShare|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicDownloadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Generate download URL
    #
    # + accessKey - Access key 
    # + return - Created 
    remote isolated function generateDownloadUrlPublic(string accessKey, PublicDownloadTokenGenerateRequest payload) returns PublicDownloadTokenGenerateResponse|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicDownloadTokenGenerateResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Download file with token
    #
    # + accessKey - Access key 
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadFileViaTokenPublic(string accessKey, string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download file with token
    #
    # + accessKey - Access key 
    # + token - Download token 
    # + range - Range  e.g. `bytes=0-999` 
    # + genericMimetype - Always return `application/octet-stream` instead of specific mimetype 
    # + inline - Use Content-Disposition: `inline` instead of `attachment` 
    # + return - OK 
    remote isolated function downloadfileviatokenpublic1(string accessKey, string token, string? range = (), boolean? genericMimetype = (), boolean? inline = ()) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/downloads/${getEncodedUri(accessKey)}/${getEncodedUri(token)}`;
        map<anydata> queryParam = {"generic_mimetype": genericMimetype, "inline": inline};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Range": range};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->head(resourcePath, httpHeaders);
        return response;
    }
    # Request public Upload Share information
    #
    # + xSdsSharePassword - Upload share password. Should be base64-encoded. Plain X-Sds-Share-Passwords are *deprecated* and will be removed in the future 
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + return - OK 
    remote isolated function requestPublicUploadShareInfo(string accessKey, string? xSdsSharePassword = (), string? xSdsDateFormat = ()) returns PublicUploadShare|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}`;
        map<any> headerValues = {"X-Sds-Share-Password": xSdsSharePassword, "X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicUploadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new file upload channel
    #
    # + accessKey - Access key 
    # + return - Created 
    remote isolated function createShareUploadChannel(string accessKey, CreateShareUploadChannelRequest payload) returns CreateShareUploadChannelResponse|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateShareUploadChannelResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Request status of S3 file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - OK 
    remote isolated function requestUploadStatusPublic(string accessKey, string uploadId) returns S3ShareUploadStatus|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        S3ShareUploadStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Complete file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + payload - Mandatory for encrypted shares 
    # + return - Created 
    remote isolated function completeFileUploadViaShare(string accessKey, string uploadId, UserFileKeyList payload, string? xSdsDateFormat = ()) returns PublicUploadedFileData|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicUploadedFileData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Upload file
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + contentRange - Content-Range  e.g. `bytes 0-999/3980` 
    # + payload - File 
    # + return - Created 
    remote isolated function uploadfileasbinarypublic1(string accessKey, string uploadId, AccessKeyUploadIdBody payload, string? xSdsDateFormat = (), string? contentRange = ()) returns ChunkUploadResponse|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "Content-Range": contentRange};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ChunkUploadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - No Content 
    remote isolated function cancelFileUploadViaShare(string accessKey, string uploadId) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Complete S3 file upload
    #
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - Accepted 
    remote isolated function completeS3FileUploadViaShare(string accessKey, string uploadId, CompleteS3ShareUploadRequest payload) returns http:Response|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}/s3`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Generate presigned URLs for S3 file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + accessKey - Access key 
    # + uploadId - Upload channel ID 
    # + return - Created 
    remote isolated function generatePresignedUrlsPublic(string accessKey, string uploadId, GeneratePresignedUrlsRequest payload, string? xSdsDateFormat = ()) returns PresignedUrlList|error {
        string resourcePath = string `/v4/public/shares/uploads/${getEncodedUri(accessKey)}/${getEncodedUri(uploadId)}/s3_urls`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PresignedUrlList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request third-party software dependencies
    #
    # + return - OK 
    remote isolated function requestThirdPartyDependencies() returns ThirdPartyDependenciesData[]|error {
        string resourcePath = string `/v4/public/software/third_party_dependencies`;
        ThirdPartyDependenciesData[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request software version information
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + return - OK 
    remote isolated function requestSoftwareVersion(string? xSdsDateFormat = ()) returns SoftwareVersionData|error {
        string resourcePath = string `/v4/public/software/version`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SoftwareVersionData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system information
    #
    # + isEnabled - Show only enabled authentication methods 
    # + return - OK 
    remote isolated function requestSystemInfo(boolean? isEnabled = ()) returns SystemInfo|error {
        string resourcePath = string `/v4/public/system/info`;
        map<anydata> queryParam = {"is_enabled": isEnabled};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SystemInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request Active Directory authentication information
    #
    # + isGlobalAvailable - Show only global available items 
    # + return - OK 
    remote isolated function requestActiveDirectoryAuthInfo(boolean? isGlobalAvailable = ()) returns ActiveDirectoryAuthInfo|error {
        string resourcePath = string `/v4/public/system/info/auth/ad`;
        map<anydata> queryParam = {"is_global_available": isGlobalAvailable};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ActiveDirectoryAuthInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request OpenID Connect provider authentication information
    #
    # + isGlobalAvailable - Show only global available items 
    # + return - OK 
    remote isolated function requestOpenIdAuthInfo(boolean? isGlobalAvailable = ()) returns OpenIdAuthInfo|error {
        string resourcePath = string `/v4/public/system/info/auth/openid`;
        map<anydata> queryParam = {"is_global_available": isGlobalAvailable};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OpenIdAuthInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request system time
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + return - OK 
    remote isolated function requestSystemTime(string? xSdsDateFormat = ()) returns SdsServerTime|error {
        string resourcePath = string `/v4/public/time`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SdsServerTime response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of subscription scopes
    #
    # + return - OK 
    remote isolated function requestSubscriptionScopes() returns NotificationScopeList|error {
        string resourcePath = string `/v4/resources/user/notifications/scopes`;
        NotificationScopeList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request user avatar
    #
    # + uuid - UUID of the avatar 
    # + userId - User ID 
    # + return - OK 
    remote isolated function requestUserAvatar(string uuid, int userId) returns Avatar|error {
        string resourcePath = string `/v4/resources/users/${getEncodedUri(userId)}/avatar/${getEncodedUri(uuid)}`;
        Avatar response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Request all roles with assigned rights
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoles(string? xSdsAuthToken = ()) returns RoleList|error {
        string resourcePath = string `/v4/roles`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request groups with specific role
    #
    # + roleId - Role ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoleGroups(int roleId, int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns RoleGroupList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/groups`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleGroupList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign group(s) to the role
    #
    # + roleId - Role ID 
    # + xSdsAuthToken - Authentication token 
    # + payload - Group IDs 
    # + return - OK 
    remote isolated function addRoleGroups(int roleId, GroupIds payload, string? xSdsAuthToken = ()) returns RoleGroupList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/groups`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RoleGroupList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Revoke granted role from group(s)
    #
    # + roleId - Role ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function revokeRoleGroups(int roleId, string? xSdsAuthToken = ()) returns RoleGroupList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/groups`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleGroupList response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request users with specific role
    #
    # + roleId - Role ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRoleUsers(int roleId, int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns RoleUserList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/users`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleUserList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign user(s) to the role
    #
    # + roleId - Role ID 
    # + xSdsAuthToken - Authentication token 
    # + payload - User IDs 
    # + return - OK 
    remote isolated function addRoleUsers(int roleId, UserIds payload, string? xSdsAuthToken = ()) returns RoleUserList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/users`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RoleUserList response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Revoke granted role from user(s)
    #
    # + roleId - Role ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function revokeRoleUsers(int roleId, string? xSdsAuthToken = ()) returns RoleUserList|error {
        string resourcePath = string `/v4/roles/${getEncodedUri(roleId)}/users`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleUserList response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request customer settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestSettings(string? xSdsAuthToken = ()) returns CustomerSettingsResponse|error {
        string resourcePath = string `/v4/settings`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerSettingsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set customer settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function setSettings(CustomerSettingsRequest payload, string? xSdsAuthToken = ()) returns CustomerSettingsResponse|error {
        string resourcePath = string `/v4/settings`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerSettingsResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request system rescue key pair
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestSystemRescueKeyPair(string? xSdsDateFormat = (), string? 'version = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer|error {
        string resourcePath = string `/v4/settings/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate client-side encryption for customer
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function setSystemRescueKeyPair(UserKeyPairContainer payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/settings/keypair`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove system rescue key pair
    #
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeSystemRescueKeyPair(string? 'version = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/settings/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request all system rescue key pairs
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAllSystemRescueKeyPairs(string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer[]|error {
        string resourcePath = string `/v4/settings/keypairs`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create system rescue key pair and preserve copy of old private key
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function createAndPreserveKeyPair(CreateKeyPairRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/settings/keypairs`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of notification channels
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestNotificationChannels(string? xSdsAuthToken = ()) returns NotificationChannelList|error {
        string resourcePath = string `/v4/settings/notifications/channels`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationChannelList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Toggle notification channels
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function toggleNotificationChannels(NotificationChannelActivationRequest payload, string? xSdsAuthToken = ()) returns NotificationChannelList|error {
        string resourcePath = string `/v4/settings/notifications/channels`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationChannelList response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of webhooks
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestListOfWebhooks(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns WebhookList|error {
        string resourcePath = string `/v4/settings/webhooks`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WebhookList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createWebhook(CreateWebhookRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/settings/webhooks`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of event types
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestListOfEventTypesForConfigManager(string? xSdsAuthToken = ()) returns EventTypeList|error {
        string resourcePath = string `/v4/settings/webhooks/event_types`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EventTypeList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestWebhook(int webhookId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/settings/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Webhook response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update webhook
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateWebhook(int webhookId, UpdateWebhookRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/settings/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove webhook
    #
    # + webhookId - Webhook ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeWebhook(int webhookId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/settings/webhooks/${getEncodedUri(webhookId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Reset webhook lifetime
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + webhookId - Webhook ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function resetWebhookLifetime(int webhookId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns Webhook|error {
        string resourcePath = string `/v4/settings/webhooks/${getEncodedUri(webhookId)}/reset_lifetime`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        Webhook response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of Download Shares
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + filter - Filter string 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDownloadShares(string? xSdsDateFormat = (), string? filter = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns DownloadShareList|error {
        string resourcePath = string `/v4/shares/downloads`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DownloadShareList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a list of Download Shares
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateDownloadShares(UpdateDownloadSharesBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/downloads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create new Download Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createDownloadShare(CreateDownloadShareRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns DownloadShare|error {
        string resourcePath = string `/v4/shares/downloads`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DownloadShare response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove Download Shares
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function deleteDownloadShares(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/downloads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request Download Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDownloadShare(int shareId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns DownloadShare|error {
        string resourcePath = string `/v4/shares/downloads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DownloadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Download Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateDownloadShare(int shareId, UpdateDownloadShareRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns DownloadShare|error {
        string resourcePath = string `/v4/shares/downloads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DownloadShare response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove Download Share
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeDownloadShare(int shareId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/downloads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Send an existing Download Share link via email
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function sendDownloadShareLinkViaEmail(int shareId, DownloadShareLinkEmail payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/downloads/${getEncodedUri(shareId)}/email`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request Download Share via QR Code
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestDownloadShareQr(int shareId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns DownloadShare|error {
        string resourcePath = string `/v4/shares/downloads/${getEncodedUri(shareId)}/qr`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DownloadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request list of Upload Shares
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + filter - Filter string 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUploadShares(string? xSdsDateFormat = (), string? filter = (), string? sort = (), int? offset = (), int? 'limit = (), string? xSdsAuthToken = ()) returns UploadShareList|error {
        string resourcePath = string `/v4/shares/uploads`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UploadShareList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update List of Upload Shares
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateUploadShares(UpdateUploadSharesBulkRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/uploads`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create new Upload Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createUploadShare(CreateUploadShareRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UploadShare|error {
        string resourcePath = string `/v4/shares/uploads`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UploadShare response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove Upload Shares
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function deleteUploadShares(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/uploads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request Upload Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUploadShare(int shareId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UploadShare|error {
        string resourcePath = string `/v4/shares/uploads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UploadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Upload Share
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateUploadShare(int shareId, UpdateUploadShareRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UploadShare|error {
        string resourcePath = string `/v4/shares/uploads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UploadShare response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove Upload Share
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeUploadShare(int shareId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/uploads/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Send an existing Upload Share link via email
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function sendUploadShareLinkViaEmail(int shareId, UploadShareLinkEmail payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/shares/uploads/${getEncodedUri(shareId)}/email`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request Upload Share via QR Code
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUploadShareQr(int shareId, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UploadShare|error {
        string resourcePath = string `/v4/shares/uploads/${getEncodedUri(shareId)}/qr`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UploadShare response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request nodes assigned users with permissions
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestAuditNodeUserDataSyslog(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns AuditNodeResponse[]|error {
        string resourcePath = string `/v4/syslog/audits/nodes`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditNodeResponse[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request system events
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + sort - Sort string 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + dateStart - Filter events from given date  e.g. `2015-12-31T23:59:00` 
    # + dateEnd - Filter events until given date  e.g. `2015-12-31T23:59:00` 
    # + 'type - Operation ID  cf. `GET /eventlog/operations` 
    # + userId - User ID 
    # + status - Operation status: * `0` - Success * `2` - Error 
    # + userClient - User client 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestSyslogEvents(string? xSdsDateFormat = (), string? sort = (), int? offset = (), int? 'limit = (), string? dateStart = (), string? dateEnd = (), int? 'type = (), int? userId = (), string? status = (), string? userClient = (), string? xSdsAuthToken = ()) returns SyslogEventList|error {
        string resourcePath = string `/v4/syslog/events`;
        map<anydata> queryParam = {"sort": sort, "offset": offset, "limit": 'limit, "date_start": dateStart, "date_end": dateEnd, "type": 'type, "user_id": userId, "status": status, "user_client": userClient};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SyslogEventList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request allowed log operations
    #
    # + isDeprecated - Show only deprecated operations 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestLogOperationsSyslog(boolean? isDeprecated = (), string? xSdsAuthToken = ()) returns LogOperationList|error {
        string resourcePath = string `/v4/syslog/operations`;
        map<anydata> queryParam = {"is_deprecated": isDeprecated};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LogOperationList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Test Active Directory configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function testAdConfig(TestActiveDirectoryConfigRequest payload, string? xSdsAuthToken = ()) returns TestActiveDirectoryConfigResponse|error {
        string resourcePath = string `/v4/system/config/actions/test/ad`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TestActiveDirectoryConfigResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Test RADIUS server availability
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function testRadiusConfig(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/actions/test/radius`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of Active Directory configurations
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAdConfigs(string? xSdsAuthToken = ()) returns ActiveDirectoryConfigList|error {
        string resourcePath = string `/v4/system/config/auth/ads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActiveDirectoryConfigList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Active Directory configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createAdConfig(CreateActiveDirectoryConfigRequest payload, string? xSdsAuthToken = ()) returns ActiveDirectoryConfig|error {
        string resourcePath = string `/v4/system/config/auth/ads`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ActiveDirectoryConfig response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request Active Directory configuration
    #
    # + adId - Active Directory ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAdConfig(int adId, string? xSdsAuthToken = ()) returns ActiveDirectoryConfig|error {
        string resourcePath = string `/v4/system/config/auth/ads/${getEncodedUri(adId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActiveDirectoryConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update Active Directory configuration
    #
    # + adId - Active Directory ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateAdConfig(int adId, UpdateActiveDirectoryConfigRequest payload, string? xSdsAuthToken = ()) returns ActiveDirectoryConfig|error {
        string resourcePath = string `/v4/system/config/auth/ads/${getEncodedUri(adId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ActiveDirectoryConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove Active Directory configuration
    #
    # + adId - Active Directory ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeAdConfig(int adId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/auth/ads/${getEncodedUri(adId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of OpenID Connect IDP configurations
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOpenIdIdpConfigs(string? xSdsAuthToken = ()) returns OpenIdIdpConfig[]|error {
        string resourcePath = string `/v4/system/config/auth/openid/idps`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OpenIdIdpConfig[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create OpenID Connect IDP configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createOpenIdIdpConfig(CreateOpenIdIdpConfigRequest payload, string? xSdsAuthToken = ()) returns OpenIdIdpConfig|error {
        string resourcePath = string `/v4/system/config/auth/openid/idps`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OpenIdIdpConfig response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request OpenID Connect IDP configuration
    #
    # + idpId - OpenID Connect IDP configuration ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOpenIdIdpConfig(int idpId, string? xSdsAuthToken = ()) returns OpenIdIdpConfig|error {
        string resourcePath = string `/v4/system/config/auth/openid/idps/${getEncodedUri(idpId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OpenIdIdpConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update OpenID Connect IDP configuration
    #
    # + idpId - OpenID Connect IDP configuration ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateOpenIdIdpConfig(int idpId, UpdateOpenIdIdpConfigRequest payload, string? xSdsAuthToken = ()) returns OpenIdIdpConfig|error {
        string resourcePath = string `/v4/system/config/auth/openid/idps/${getEncodedUri(idpId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OpenIdIdpConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove OpenID Connect IDP configuration
    #
    # + idpId - OpenID Connect IDP configuration ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeOpenIdIdpConfig(int idpId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/auth/openid/idps/${getEncodedUri(idpId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request RADIUS configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestRadiusConfig(string? xSdsAuthToken = ()) returns RadiusConfig|error {
        string resourcePath = string `/v4/system/config/auth/radius`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RadiusConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update RADIUS configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateRadiusConfig(RadiusConfigUpdateRequest payload, string? xSdsAuthToken = ()) returns RadiusConfig|error {
        string resourcePath = string `/v4/system/config/auth/radius`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RadiusConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create RADIUS configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createRadiusConfig(RadiusConfigCreateRequest payload, string? xSdsAuthToken = ()) returns RadiusConfig|error {
        string resourcePath = string `/v4/system/config/auth/radius`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RadiusConfig response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove RADIUS configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeRadiusConfig(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/auth/radius`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of OAuth clients
    #
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOAuthClients(string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns OAuthClient[]|error {
        string resourcePath = string `/v4/system/config/oauth/clients`;
        map<anydata> queryParam = {"filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OAuthClient[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create OAuth client
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createOAuthClient(CreateOAuthClientRequest payload, string? xSdsAuthToken = ()) returns OAuthClient|error {
        string resourcePath = string `/v4/system/config/oauth/clients`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OAuthClient response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request OAuth client
    #
    # + clientId - OAuth client ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOAuthClient(string clientId, string? xSdsAuthToken = ()) returns OAuthClient|error {
        string resourcePath = string `/v4/system/config/oauth/clients/${getEncodedUri(clientId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OAuthClient response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update OAuth client
    #
    # + clientId - OAuth client ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateOAuthClient(string clientId, UpdateOAuthClientRequest payload, string? xSdsAuthToken = ()) returns OAuthClient|error {
        string resourcePath = string `/v4/system/config/oauth/clients/${getEncodedUri(clientId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OAuthClient response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove OAuth client
    #
    # + clientId - OAuth client ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeOAuthClient(string clientId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/oauth/clients/${getEncodedUri(clientId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request password policies
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestPasswordPoliciesConfig(string? xSdsAuthToken = ()) returns PasswordPoliciesConfig|error {
        string resourcePath = string `/v4/system/config/policies/passwords`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PasswordPoliciesConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change password policies
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function changePasswordPoliciesConfig(UpdatePasswordPoliciesConfig payload, string? xSdsAuthToken = ()) returns PasswordPoliciesConfig|error {
        string resourcePath = string `/v4/system/config/policies/passwords`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PasswordPoliciesConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Enforce login password change for all users
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function enforceLoginPasswordChange(string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/policies/passwords/enforce_change`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request password policies for a certain password type
    #
    # + passwordType - Password type 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestPasswordPoliciesForPasswordType(string passwordType, string? xSdsAuthToken = ()) returns PasswordPoliciesConfig|error {
        string resourcePath = string `/v4/system/config/policies/passwords/${getEncodedUri(passwordType)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PasswordPoliciesConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request authentication settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAuthConfig(string? xSdsAuthToken = ()) returns AuthConfig|error {
        string resourcePath = string `/v4/system/config/settings/auth`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuthConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update authentication settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateAuthConfig(AuthConfig payload, string? xSdsAuthToken = ()) returns AuthConfig|error {
        string resourcePath = string `/v4/system/config/settings/auth`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AuthConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request system defaults
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestSystemDefaults(string? xSdsAuthToken = ()) returns SystemDefaults|error {
        string resourcePath = string `/v4/system/config/settings/defaults`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SystemDefaults response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update system defaults
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateSystemDefaults(UpdateSystemDefaults payload, string? xSdsAuthToken = ()) returns SystemDefaults|error {
        string resourcePath = string `/v4/system/config/settings/defaults`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SystemDefaults response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request eventlog settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestEventlogConfig(string? xSdsAuthToken = ()) returns EventlogConfig|error {
        string resourcePath = string `/v4/system/config/settings/eventlog`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EventlogConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update eventlog settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateEventlogConfig(UpdateEventlogConfig payload, string? xSdsAuthToken = ()) returns EventlogConfig|error {
        string resourcePath = string `/v4/system/config/settings/eventlog`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventlogConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request general settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestGeneralSettings(string? xSdsAuthToken = ()) returns GeneralSettings|error {
        string resourcePath = string `/v4/system/config/settings/general`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GeneralSettings response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update general settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateGeneralSettings(UpdateGeneralSettings payload, string? xSdsAuthToken = ()) returns GeneralSettings|error {
        string resourcePath = string `/v4/system/config/settings/general`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GeneralSettings response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request infrastructure properties
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestInfrastructureProperties(string? xSdsAuthToken = ()) returns InfrastructureProperties|error {
        string resourcePath = string `/v4/system/config/settings/infrastructure`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InfrastructureProperties response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request syslog settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestSyslogConfig(string? xSdsAuthToken = ()) returns SyslogConfig|error {
        string resourcePath = string `/v4/system/config/settings/syslog`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SyslogConfig response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update syslog settings
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateSyslogConfig(UpdateSyslogConfig payload, string? xSdsAuthToken = ()) returns SyslogConfig|error {
        string resourcePath = string `/v4/system/config/settings/syslog`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SyslogConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request S3 storage configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function request3Config(string? xSdsAuthToken = ()) returns S3Config|error {
        string resourcePath = string `/v4/system/config/storage/s3`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3Config response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update S3 storage configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateS3Config(S3ConfigUpdateRequest payload, string? xSdsAuthToken = ()) returns S3Config|error {
        string resourcePath = string `/v4/system/config/storage/s3`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        S3Config response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create S3 storage configuration
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createS3Config(S3ConfigCreateRequest payload, string? xSdsAuthToken = ()) returns S3Config|error {
        string resourcePath = string `/v4/system/config/storage/s3`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        S3Config response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of configured S3 tags
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestS3TagList(string? xSdsAuthToken = ()) returns S3TagList|error {
        string resourcePath = string `/v4/system/config/storage/s3/tags`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3TagList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create S3 tag
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createS3Tag(S3TagCreateRequest payload, string? xSdsAuthToken = ()) returns S3Tag|error {
        string resourcePath = string `/v4/system/config/storage/s3/tags`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        S3Tag response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request S3 tag
    #
    # + id - S3 tag ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestS3Tag(int id, string? xSdsAuthToken = ()) returns S3Tag|error {
        string resourcePath = string `/v4/system/config/storage/s3/tags/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        S3Tag response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove S3 tag
    #
    # + id - S3 tag ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeS3Tag(int id, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/system/config/storage/s3/tags/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Complete file upload
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + token - Upload token 
    # + payload - The body must be empty if public upload token is used. 
    # + return - Created 
    remote isolated function completeFileUploadByToken(string token, CompleteUploadRequest payload, string? xSdsDateFormat = ()) returns Node|error {
        string resourcePath = string `/v4/uploads/${getEncodedUri(token)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Node response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Upload file
    #
    # + token - Upload token 
    # + contentRange - Content-Range  e.g. `bytes 0-999/3980` 
    # + payload - File 
    # + return - default response 
    remote isolated function uploadfilebytokenasmultipart1(string token, UploadsTokenBody payload, string? contentRange = ()) returns ChunkUploadResponse|error {
        string resourcePath = string `/v4/uploads/${getEncodedUri(token)}`;
        map<any> headerValues = {"Content-Range": contentRange};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        ChunkUploadResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Cancel file upload
    #
    # + token - Upload token 
    # + return - No Content 
    remote isolated function cancelFileUploadByToken(string token) returns http:Response|error {
        string resourcePath = string `/v4/uploads/${getEncodedUri(token)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Request user account information
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + moreInfo - Get more info for this user e.g. list of user groups 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserInfo(string? xSdsDateFormat = (), boolean? moreInfo = (), string? xSdsAuthToken = ()) returns UserAccount|error {
        string resourcePath = string `/v4/user/account`;
        map<anydata> queryParam = {"more_info": moreInfo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserAccount response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update user account
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateUserAccount(UpdateUserAccountRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserAccount|error {
        string resourcePath = string `/v4/user/account`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserAccount response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request avatar
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestAvatar(string? xSdsAuthToken = ()) returns Avatar|error {
        string resourcePath = string `/v4/user/account/avatar`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Avatar response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change avatar
    #
    # + xSdsAuthToken - Authentication token 
    # + payload - File 
    # + return - Created 
    remote isolated function uploadAvatarAsMultipart(AccountAvatarBody payload, string? xSdsAuthToken = ()) returns Avatar|error {
        string resourcePath = string `/v4/user/account/avatar`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        Avatar response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reset avatar
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function resetAvatar(string? xSdsAuthToken = ()) returns Avatar|error {
        string resourcePath = string `/v4/user/account/avatar`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Avatar response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request customer information for user
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestCustomerInfo(string? xSdsAuthToken = ()) returns CustomerData|error {
        string resourcePath = string `/v4/user/account/customer`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Activate client-side encryption for customer
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function enableCustomerEncryption(EnableCustomerEncryptionRequest payload, string? xSdsAuthToken = ()) returns CustomerData|error {
        string resourcePath = string `/v4/user/account/customer`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request customer's key pair
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestCustomerKeyPair(string? xSdsAuthToken = ()) returns UserKeyPairContainer|error {
        string resourcePath = string `/v4/user/account/customer/keypair`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request user's key pair
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserKeyPair(string? xSdsDateFormat = (), string? 'version = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer|error {
        string resourcePath = string `/v4/user/account/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Set user's key pair
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function setUserKeyPair(UserKeyPairContainer payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/account/keypair`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove user's key pair
    #
    # + 'version - Version (NEW) 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeUserKeyPair(string? 'version = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/account/keypair`;
        map<anydata> queryParam = {"version": 'version};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request all user key pairs
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserKeyPairs(string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserKeyPairContainer[]|error {
        string resourcePath = string `/v4/user/account/keypairs`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserKeyPairContainer[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create key pair and preserve copy of old private key
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function createAndPreserveUserKeyPair(CreateKeyPairRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/account/keypairs`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Change user's password
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function changeUserPassword(ChangeUserPasswordRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/account/password`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Invalidate authentication token
    #
    # + everywhere - Invalidate all tokens 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function logout(boolean? everywhere = (), string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/logout`;
        map<anydata> queryParam = {"everywhere": everywhere};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of notification configurations
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestListOfNotificationConfigs(string? xSdsAuthToken = ()) returns NotificationConfigList|error {
        string resourcePath = string `/v4/user/notifications/config`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationConfigList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update notification configuration
    #
    # + id - Unique identifier for a notification configuration 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateNotificationConfig(int id, NotificationConfigChangeRequest payload, string? xSdsAuthToken = ()) returns NotificationConfig|error {
        string resourcePath = string `/v4/user/notifications/config/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationConfig response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request list of OAuth client approvals
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOAuthApprovals(string? xSdsDateFormat = (), string? sort = (), string? xSdsAuthToken = ()) returns OAuthApproval[]|error {
        string resourcePath = string `/v4/user/oauth/approvals`;
        map<anydata> queryParam = {"sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OAuthApproval[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove OAuth client approval
    #
    # + clientId - OAuth client ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeOAuthApproval(string clientId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/oauth/approvals/${getEncodedUri(clientId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request list of OAuth client authorizations
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestOAuthAuthorizations(string? xSdsDateFormat = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns OAuthAuthorization[]|error {
        string resourcePath = string `/v4/user/oauth/authorizations`;
        map<anydata> queryParam = {"filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        OAuthAuthorization[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Remove all OAuth authorizations of a client
    #
    # + clientId - OAuth client ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeOAuthAuthorizations(string clientId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/oauth/authorizations/${getEncodedUri(clientId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Remove a OAuth authorization
    #
    # + clientId - OAuth client ID 
    # + authorizationId - OAuth authorization ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeOAuthAuthorization(string clientId, int authorizationId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/oauth/authorizations/${getEncodedUri(clientId)}/${getEncodedUri(authorizationId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # (authenticated) Ping
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function pingUser(string? xSdsAuthToken = ()) returns string|error {
        string resourcePath = string `/v4/user/ping`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request user profile attributes
    #
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestProfileAttributes(int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns AttributesResponse|error {
        string resourcePath = string `/v4/user/profileAttributes`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AttributesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or edit user profile attributes
    #
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateProfileAttributes(ProfileAttributesRequest payload, string? xSdsAuthToken = ()) returns ProfileAttributes|error {
        string resourcePath = string `/v4/user/profileAttributes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProfileAttributes response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Set user profile attributes
    #
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setProfileAttributes(ProfileAttributesRequest payload, string? xSdsAuthToken = ()) returns ProfileAttributes|error {
        string resourcePath = string `/v4/user/profileAttributes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProfileAttributes response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove user profile attribute
    #
    # + 'key - Key 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeProfileAttribute(string 'key, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/profileAttributes/${getEncodedUri('key)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Download Share subscriptions
    #
    # + filter - Filter string 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + offset - Range offset 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function listDownloadShareSubscriptions(string? filter = (), int? 'limit = (), int? offset = (), string? sort = (), string? xSdsAuthToken = ()) returns SubscribedDownloadShareList|error {
        string resourcePath = string `/v4/user/subscriptions/download_shares`;
        map<anydata> queryParam = {"filter": filter, "limit": 'limit, "offset": offset, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscribedDownloadShareList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Subscribe or Unsubscribe a List of Download Shares for notifications
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function subscribeDownloadShares(UpdateSubscriptionsBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/download_shares`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Subscribe Download Share for notifications
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function subscribeDownloadShare(int shareId, string? xSdsAuthToken = ()) returns SubscribedDownloadShare|error {
        string resourcePath = string `/v4/user/subscriptions/download_shares/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SubscribedDownloadShare response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unsubscribe Download Share from notifications
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function unsubscribeDownloadShare(int shareId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/download_shares/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List node subscriptions
    #
    # + filter - Filter string 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + offset - Range offset 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function listNodeSubscriptions(string? filter = (), int? 'limit = (), int? offset = (), string? sort = (), string? xSdsAuthToken = ()) returns SubscribedNodeList|error {
        string resourcePath = string `/v4/user/subscriptions/nodes`;
        map<anydata> queryParam = {"filter": filter, "limit": 'limit, "offset": offset, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscribedNodeList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Subscribe or Unsubscribe a List of nodes for notifications
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function updateNodeSubscriptions(UpdateSubscriptionsBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/nodes`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Subscribe node for notifications
    #
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function subscribeNode(int nodeId, string? xSdsAuthToken = ()) returns SubscribedNode|error {
        string resourcePath = string `/v4/user/subscriptions/nodes/${getEncodedUri(nodeId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SubscribedNode response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unsubscribe node from notifications
    #
    # + nodeId - Node ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function unsubscribeNode(int nodeId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/nodes/${getEncodedUri(nodeId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List Upload Share subscriptions
    #
    # + filter - Filter string 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + offset - Range offset 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function listUploadShareSubscriptions(string? filter = (), int? 'limit = (), int? offset = (), string? sort = (), string? xSdsAuthToken = ()) returns SubscribedUploadShareList|error {
        string resourcePath = string `/v4/user/subscriptions/upload_shares`;
        map<anydata> queryParam = {"filter": filter, "limit": 'limit, "offset": offset, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscribedUploadShareList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Subscribe or Unsubscribe a List of Upload Shares for notifications
    #
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function subscribeUploadShares(UpdateSubscriptionsBulkRequest payload, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/upload_shares`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Subscribe Upload Share for notifications
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function subscribeUploadShare(int shareId, string? xSdsAuthToken = ()) returns SubscribedUploadShare|error {
        string resourcePath = string `/v4/user/subscriptions/upload_shares/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        SubscribedUploadShare response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unsubscribe Upload Share from notifications
    #
    # + shareId - Share ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function unsubscribeUploadShare(int shareId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/user/subscriptions/upload_shares/${getEncodedUri(shareId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request users
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + includeAttributes - Include custom user attributes. 
    # + includeRoles - Include roles 
    # + includeManageableRooms - Include hasManageableRooms (deprecated) 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUsers(string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), boolean? includeAttributes = (), boolean? includeRoles = (), boolean? includeManageableRooms = (), string? xSdsAuthToken = ()) returns UserList|error {
        string resourcePath = string `/v4/users`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort, "include_attributes": includeAttributes, "include_roles": includeRoles, "include_manageable_rooms": includeManageableRooms};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new user
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    remote isolated function createUser(CreateUserRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserData|error {
        string resourcePath = string `/v4/users`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserData response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request user
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + userId - User ID 
    # + effectiveRoles - Filter users with DIRECT or DIRECT **AND** EFFECTIVE roles. * `false`: DIRECT roles * `true`: DIRECT **AND** EFFECTIVE roles DIRECT means: e.g. user gets role **directly** granted from someone with _grant permission_ right. EFFECTIVE means: e.g. user gets role through **group membership**. 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUser(int userId, string? xSdsDateFormat = (), boolean? effectiveRoles = (), string? xSdsAuthToken = ()) returns UserData|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}`;
        map<anydata> queryParam = {"effective_roles": effectiveRoles};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserData response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update user's metadata
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateUser(int userId, UpdateUserRequest payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserData|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove user
    #
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeUser(int userId, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Request groups that user is a member of or / and can become a member
    #
    # + userId - User ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserGroups(int userId, int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns UserGroupList|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/groups`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserGroupList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request rooms where the user is last admin
    #
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestLastAdminRoomsUsers(int userId, string? xSdsAuthToken = ()) returns LastAdminUserRoomList|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/last_admin_rooms`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LastAdminUserRoomList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request user's granted roles
    #
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserRoles(int userId, string? xSdsAuthToken = ()) returns RoleList|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/roles`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoleList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request rooms granted to the user or / and rooms that can be granted
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + userId - User ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    # 
    # # Deprecated
    @deprecated
    remote isolated function requestUsersRooms(int userId, string? xSdsDateFormat = (), int? offset = (), int? 'limit = (), string? filter = (), string? xSdsAuthToken = ()) returns RoomTreeDataList|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/rooms`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RoomTreeDataList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request custom user attributes
    #
    # + userId - User ID 
    # + offset - Range offset 
    # + 'limit - Range limit. Maximum 500.  For more results please use paging (`offset` + `limit`). 
    # + filter - Filter string 
    # + sort - Sort string 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function requestUserAttributes(int userId, int? offset = (), int? 'limit = (), string? filter = (), string? sort = (), string? xSdsAuthToken = ()) returns AttributesResponse|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/userAttributes`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AttributesResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add or edit custom user attributes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - OK 
    remote isolated function updateUserAttributes(int userId, UserAttributes payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserData|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/userAttributes`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserData response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Set custom user attributes
    #
    # + xSdsDateFormat - Date time format (cf. [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) & [leettime.de](http://leettime.de/)) 
    # + userId - User ID 
    # + xSdsAuthToken - Authentication token 
    # + return - Created 
    # 
    # # Deprecated
    @deprecated
    remote isolated function setUserAttributes(int userId, UserAttributes payload, string? xSdsDateFormat = (), string? xSdsAuthToken = ()) returns UserData|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/userAttributes`;
        map<any> headerValues = {"X-Sds-Date-Format": xSdsDateFormat, "X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserData response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove custom user attribute
    #
    # + userId - User ID 
    # + 'key - Key 
    # + xSdsAuthToken - Authentication token 
    # + return - No Content 
    remote isolated function removeUserAttribute(int userId, string 'key, string? xSdsAuthToken = ()) returns http:Response|error {
        string resourcePath = string `/v4/users/${getEncodedUri(userId)}/userAttributes/${getEncodedUri('key)}`;
        map<any> headerValues = {"X-Sds-Auth-Token": xSdsAuthToken};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
}
