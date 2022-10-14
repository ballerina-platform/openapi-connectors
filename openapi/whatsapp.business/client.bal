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
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

# This is a generated connector for [WhatsApp Business v2.21.4](https://developers.facebook.com/docs/whatsapp/) OpenAPI Specification.
# WhatsApp Business connector supports to communicate with customers all over the world via WhatsApp.
@display {label: "WhatsApp Business", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create [WhatsApp Business account](https://developers.facebook.com/docs/whatsapp/getting-started#before) and install client by following [this guide](https://developers.facebook.com/docs/whatsapp/getting-started#client-setup).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Request-Code
    #
    # + payload - Required parameters 
    # + return - Created: the account already exists. You are already registered, so you do not need to do anything else 
    remote isolated function requestCode(RequestCodeRequestBody payload) returns RequestCodeResponse|error? {
        string resourcePath = string `/account`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RequestCodeResponse? response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set-Shards
    #
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function setShards(SetShardsRequestBody payload) returns http:Response|error {
        string resourcePath = string `/account/shards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Register-Account
    #
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function registerAccount(RegisterAccountRequestBody payload) returns http:Response|error {
        string resourcePath = string `/account/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Upload-Certificate
    #
    # + payload - Certificate 
    # + return - HTTP response or else an error 
    remote isolated function uploadCertificate(byte[] payload) returns http:Response|error {
        string resourcePath = string `/certificates/external`;
        http:Request request = new;
        request.setPayload(payload, "text/plain");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Download-CA-Certificate
    #
    # + return - Certificate or else an error 
    remote isolated function downloadCaCertificate() returns string|error {
        string resourcePath = string `/certificates/external/ca`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Download Webhook CA Certificate
    #
    # + return - Certificate or else an error 
    remote isolated function downloadWebhookCaCertificate() returns string|error {
        string resourcePath = string `/certificates/webhooks/ca`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Upload Webhook CA Certificate
    #
    # + payload - Certificate 
    # + return - HTTP response or else an error 
    remote isolated function uploadWebhookCaCertificate(byte[] payload) returns http:Response|error {
        string resourcePath = string `/certificates/webhooks/ca`;
        http:Request request = new;
        request.setPayload(payload, "text/plain");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Check-Contact
    #
    # + payload - Required parameters 
    # + return - Response or an error 
    remote isolated function checkContact(CheckContactRequestBody payload) returns CheckContactResponse|error {
        string resourcePath = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckContactResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-All-Groups
    #
    # + return - Response or an error 
    remote isolated function getAllGroups() returns GroupsResponse|error {
        string resourcePath = string `/groups`;
        GroupsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create-Group
    #
    # + payload - Required parameters 
    # + return - Response or an error 
    remote isolated function createGroup(CreateGroupRequestBody payload) returns GroupsResponse|error {
        string resourcePath = string `/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-Group-Info
    #
    # + groupId - Group ID 
    # + return - Response or an error 
    remote isolated function getGroupInfo(string groupId) returns GroupResponse|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        GroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update-Group-Info
    #
    # + groupId - Group ID 
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function updateGroupInfo(string groupId, UpdateGroupInfoRequestBody payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Demote-Group-Admin
    #
    # + groupId - Group ID 
    # + return - HTTP response or else an error 
    remote isolated function demoteGroupAdmin(string groupId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/admins`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Promote-To-Group-Admin
    #
    # + groupId - Group ID 
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function promoteToGroupAdmin(string groupId, GroupAdminRequestBody payload) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/admins`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get-Group-Icon-Binary
    #
    # + groupId - Group ID 
    # + return - HTTP response or else an error 
    remote isolated function getGroupIconBinary(string groupId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/icon`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get-Group-Invite
    #
    # + groupId - Group ID 
    # + return - Response or an error 
    remote isolated function getGroupInvite(string groupId) returns GroupInviteResponse|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/invite`;
        GroupInviteResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove-Group-Participant
    #
    # + groupId - Group ID 
    # + return - HTTP response or else an error 
    remote isolated function removeGroupParticipant(string groupId) returns http:Response|error {
        string resourcePath = string `/groups/${getEncodedUri(groupId)}/participants`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Check-Health
    #
    # + return - HTTP response or else an error 
    remote isolated function checkHealth() returns http:Response|error {
        string resourcePath = string `/health`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Download-Media
    #
    # + mediaId - Media ID 
    # + return - JSON or else an error 
    remote isolated function downloadMedia(string mediaId) returns json|error {
        string resourcePath = string `/media/${getEncodedUri(mediaId)}`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Send-Message
    #
    # + payload - Required parameters 
    # + return - `Message-Response` or else an error 
    remote isolated function sendMessage(SendMessageRequestBody payload) returns MessageResponse|error {
        string resourcePath = string `/messages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Mark-Message-As-Read
    #
    # + messageID - Message ID from Webhook 
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function markMessageAsRead(string messageID, MarkMessageAsReadRequestBody payload) returns http:Response|error {
        string resourcePath = string `/messages/${getEncodedUri(messageID)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get-Metrics (since v2.21.3)
    #
    # + format - Required format 
    # + return - JSON response or an error 
    remote isolated function getMetrics(string? format = ()) returns json|error {
        string resourcePath = string `/metrics`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Enable-Two-Step
    #
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function enableTwoStep(EnableTwoStepRequestBody payload) returns http:Response|error {
        string resourcePath = string `/settings/account/two-step`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-Application-Settings
    #
    # + return - `Application-Settings` or else an error 
    remote isolated function getApplicationSettings() returns ApplicationSettings|error {
        string resourcePath = string `/settings/application`;
        ApplicationSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update-Application-Settings
    #
    # + payload - `Application-Settings` or else an error 
    # + return - `Response` or else an error 
    remote isolated function updateApplicationSettings(ApplicationSettings payload) returns Response|error {
        string resourcePath = string `/settings/application`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Backup-Settings
    #
    # + payload - Required parameters 
    # + return - `Backup-Settings-Response` or else an error 
    remote isolated function backupSettings(BackupSettingsRequestBody payload) returns BackupSettingsResponse|error {
        string resourcePath = string `/settings/backup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BackupSettingsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-Business-Profile
    #
    # + return - `Get-Business-Profile-Response` or else an error 
    remote isolated function getBusinessProfile() returns GetBusinessProfileResponse|error {
        string resourcePath = string `/settings/business/profile`;
        GetBusinessProfileResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update-Business-Profile
    #
    # + payload - `Business-Profile` or else an error 
    # + return - HTTP response or else an error 
    remote isolated function updateBusinessProfile(BusinessProfile payload) returns http:Response|error {
        string resourcePath = string `/settings/business/profile`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-Profile-About
    #
    # + return - `Get-Profile-About-Response` or else an error 
    remote isolated function getProfileAbout() returns GetProfileAboutResponse|error {
        string resourcePath = string `/settings/profile/about`;
        GetProfileAboutResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update-Profile-About
    #
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function updateProfileAbout(ProfileAbout payload) returns http:Response|error {
        string resourcePath = string `/settings/profile/about`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get-Profile-Photo
    #
    # + format - Required format 
    # + return - `Get-Profile-Photo-Response` or an error 
    remote isolated function getProfilePhoto(string? format = ()) returns GetProfilePhotoResponse|error {
        string resourcePath = string `/settings/profile/photo`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetProfilePhotoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Restore-Settings
    #
    # + payload - Required parameters 
    # + return - HTTP response or else an error 
    remote isolated function restoreSettings(RestoreSettingsRequestBody payload) returns http:Response|error {
        string resourcePath = string `/settings/restore`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-App-Stats
    #
    # + format - Required format 
    # + return - JSON response or an error 
    remote isolated function getAppStats(string? format = ()) returns json|error {
        string resourcePath = string `/stats/app`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get-DB-Stats
    #
    # + format - Required format 
    # + return - JSON response or an error 
    remote isolated function getDbStats(string? format = ()) returns json|error {
        string resourcePath = string `/stats/db`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get-Support-Info
    #
    # + return - JSON response or an error 
    remote isolated function getSupportInfo() returns json|error {
        string resourcePath = string `/support`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create-User
    #
    # + payload - Required parameters 
    # + return - `User-Response` or an error 
    remote isolated function createUser(CreateUserRequestBody payload) returns UserResponse|error {
        string resourcePath = string `/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Login-User
    #
    # + payload - Required parameters 
    # + return - `User-Login-Response` or an error 
    remote isolated function loginUser(LoginAdminRequestBody payload) returns UserLoginResponse|error {
        string resourcePath = string `/users/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserLoginResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get-User
    #
    # + userUsername - User's username 
    # + return - `Detailed-User-Response` or an error 
    remote isolated function getUser(string userUsername) returns DetailedUserResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userUsername)}`;
        DetailedUserResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update-User
    #
    # + userUsername - User's username 
    # + payload - Required parameters 
    # + return - `User-Response` or an error 
    remote isolated function updateUser(string userUsername, UpdateUserRequestBody payload) returns UserResponse|error {
        string resourcePath = string `/users/${getEncodedUri(userUsername)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
}
