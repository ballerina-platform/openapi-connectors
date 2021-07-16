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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration record for WhatsApp Business API.
#
# + authConfig - Bearer Token or Credentials Configuration
# + secureSocketConfig - Secure Socket Configuration 
public type ClientConfig record {
    http:BearerTokenConfig|http:CredentialsConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# See https://developers.facebook.com/docs/whatsapp
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Request-Code
    #
    # + payload - Required parameters
    # + return - Created: the account already exists. You are already registered, so you do not need to do anything else
    remote isolated function requestCode(RequestCodeRequestBody payload) returns http:Response|error {
        string  path = string `/account`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Set-Shards
    #
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function setShards(SetShardsRequestBody payload) returns http:Response|error {
        string  path = string `/account/shards`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Register-Account
    #
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function registerAccount(RegisterAccountRequestBody payload) returns http:Response|error {
        string  path = string `/account/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Upload-Certificate
    #
    # + payload - Certificate
    # + return - HTTP response or else an error
    remote isolated function uploadCertificate(string payload) returns http:Response|error {
        string  path = string `/certificates/external`;
        http:Request request = new;
        request.setPayload(payload);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Download-CA-Certificate
    #
    # + return - Certificate or else an error
    remote isolated function downloadCaCertificate() returns string|error {
        string  path = string `/certificates/external/ca`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Download Webhook CA Certificate
    #
    # + return - Certificate or else an error
    remote isolated function downloadWebhookCaCertificate() returns string|error {
        string  path = string `/certificates/webhooks/ca`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Upload Webhook CA Certificate
    #
    # + payload - Certificate
    # + return - HTTP response or else an error
    remote isolated function uploadWebhookCaCertificate(string payload) returns http:Response|error {
        string  path = string `/certificates/webhooks/ca`;
        http:Request request = new;
        request.setPayload(payload);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Check-Contact
    #
    # + payload - Required parameters
    # + return - Response or an error
    remote isolated function checkContact(CheckContactRequestBody payload) returns CheckContactResponse|error {
        string  path = string `/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CheckContactResponse response = check self.clientEp->post(path, request, targetType=CheckContactResponse);
        return response;
    }
    # Get-All-Groups
    #
    # + return - Response or an error
    remote isolated function getAllGroups() returns GroupsResponse|error {
        string  path = string `/groups`;
        GroupsResponse response = check self.clientEp-> get(path, targetType = GroupsResponse);
        return response;
    }
    # Create-Group
    #
    # + payload - Required parameters
    # + return - Response or an error
    remote isolated function createGroup(CreateGroupRequestBody payload) returns GroupsResponse|error {
        string  path = string `/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupsResponse response = check self.clientEp->post(path, request, targetType=GroupsResponse);
        return response;
    }
    # Get-Group-Info
    #
    # + GroupId - Group ID
    # + return - Response or an error
    remote isolated function getGroupInfo(string GroupId) returns GroupResponse|error {
        string  path = string `/groups/${GroupId}`;
        GroupResponse response = check self.clientEp-> get(path, targetType = GroupResponse);
        return response;
    }
    # Update-Group-Info
    #
    # + GroupId - Group ID
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function updateGroupInfo(string GroupId, UpdateGroupInfoRequestBody payload) returns http:Response|error {
        string  path = string `/groups/${GroupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Demote-Group-Admin
    #
    # + GroupId - Group ID
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function demoteGroupAdmin(string GroupId, GroupAdminRequestBody payload) returns http:Response|error {
        string  path = string `/groups/${GroupId}/admins`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Promote-To-Group-Admin
    #
    # + GroupId - Group ID
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function promoteToGroupAdmin(string GroupId, GroupAdminRequestBody payload) returns http:Response|error {
        string  path = string `/groups/${GroupId}/admins`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    # Get-Group-Icon-Binary
    #
    # + GroupId - Group ID
    # + return - HTTP response or else an error
    remote isolated function getGroupIconBinary(string GroupId) returns http:Response|error {
        string  path = string `/groups/${GroupId}/icon`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Get-Group-Invite
    #
    # + GroupId - Group ID
    # + return - Response or an error
    remote isolated function getGroupInvite(string GroupId) returns GroupInviteResponse|error {
        string  path = string `/groups/${GroupId}/invite`;
        GroupInviteResponse response = check self.clientEp-> get(path, targetType = GroupInviteResponse);
        return response;
    }
    # Remove-Group-Participant
    #
    # + GroupId - Group ID
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function removeGroupParticipant(string GroupId, RemoveGroupParticipantRequestBody payload) returns http:Response|error {
        string  path = string `/groups/${GroupId}/participants`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->delete(path, request, targetType=http:Response);
        return response;
    }
    # Check-Health
    #
    # + return - HTTP response or else an error
    remote isolated function checkHealth() returns http:Response|error {
        string  path = string `/health`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Download-Media
    #
    # + MediaId - Media ID
    # + return - JSON or else an error
    remote isolated function downloadMedia(string MediaId) returns json|error {
        string  path = string `/media/${MediaId}`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Send-Message
    #
    # + payload - Required parameters
    # + return - `Message-Response` or else an error
    remote isolated function sendMessage(SendMessageRequestBody payload) returns MessageResponse|error {
        string  path = string `/messages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageResponse response = check self.clientEp->post(path, request, targetType=MessageResponse);
        return response;
    }
    # Mark-Message-As-Read
    #
    # + MessageID - Message ID from Webhook
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function markMessageAsRead(string MessageID, MarkMessageAsReadRequestBody payload) returns http:Response|error {
        string  path = string `/messages/${MessageID}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get-Metrics (since v2.21.3)
    #
    # + format - Required format
    # + return - JSON response or an error
    remote isolated function getMetrics(string? format = ()) returns json|error {
        string  path = string `/metrics`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Enable-Two-Step
    #
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function enableTwoStep(EnableTwoStepRequestBody payload) returns http:Response|error {
        string  path = string `/settings/account/two-step`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get-Application-Settings
    #
    # + return - `Application-Settings` or else an error
    remote isolated function getApplicationSettings() returns ApplicationSettings|error {
        string  path = string `/settings/application`;
        ApplicationSettings response = check self.clientEp-> get(path, targetType = ApplicationSettings);
        return response;
    }
    # Update-Application-Settings
    #
    # + payload - `Application-Settings` or else an error
    # + return - `Response` or else an error
    remote isolated function updateApplicationSettings(ApplicationSettings payload) returns Response|error {
        string  path = string `/settings/application`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Response response = check self.clientEp->patch(path, request, targetType=Response);
        return response;
    }
    # Backup-Settings
    #
    # + payload - Required parameters
    # + return - `Backup-Settings-Response` or else an error
    remote isolated function backupSettings(BackupSettingsRequestBody payload) returns BackupSettingsResponse|error {
        string  path = string `/settings/backup`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BackupSettingsResponse response = check self.clientEp->post(path, request, targetType=BackupSettingsResponse);
        return response;
    }
    # Get-Business-Profile
    #
    # + return - `Get-Business-Profile-Response` or else an error
    remote isolated function getBusinessProfile() returns GetBusinessProfileResponse|error {
        string  path = string `/settings/business/profile`;
        GetBusinessProfileResponse response = check self.clientEp-> get(path, targetType = GetBusinessProfileResponse);
        return response;
    }
    # Update-Business-Profile
    #
    # + payload - `Business-Profile` or else an error
    # + return - HTTP response or else an error
    remote isolated function updateBusinessProfile(BusinessProfile payload) returns http:Response|error {
        string  path = string `/settings/business/profile`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get-Profile-About
    #
    # + return - `Get-Profile-About-Response` or else an error
    remote isolated function getProfileAbout() returns GetProfileAboutResponse|error {
        string  path = string `/settings/profile/about`;
        GetProfileAboutResponse response = check self.clientEp-> get(path, targetType = GetProfileAboutResponse);
        return response;
    }
    # Update-Profile-About
    #
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function updateProfileAbout(ProfileAbout payload) returns http:Response|error {
        string  path = string `/settings/profile/about`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, targetType=http:Response);
        return response;
    }
    # Get-Profile-Photo
    #
    # + format - Required format
    # + return - `Get-Profile-Photo-Response` or an error
    remote isolated function getProfilePhoto(string? format = ()) returns GetProfilePhotoResponse|error {
        string  path = string `/settings/profile/photo`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        GetProfilePhotoResponse response = check self.clientEp-> get(path, targetType = GetProfilePhotoResponse);
        return response;
    }
    # Restore-Settings
    #
    # + payload - Required parameters
    # + return - HTTP response or else an error
    remote isolated function restoreSettings(RestoreSettingsRequestBody payload) returns http:Response|error {
        string  path = string `/settings/restore`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get-App-Stats
    #
    # + format - Required format
    # + return - JSON response or an error
    remote isolated function getAppStats(string? format = ()) returns json|error {
        string  path = string `/stats/app`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get-DB-Stats
    #
    # + format - Required format
    # + return - JSON response or an error
    remote isolated function getDbStats(string? format = ()) returns json|error {
        string  path = string `/stats/db`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get-Support-Info
    #
    # + return - JSON response or an error
    remote isolated function getSupportInfo() returns json|error {
        string  path = string `/support`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Create-User
    #
    # + payload - Required parameters
    # + return - `User-Response` or an error
    remote isolated function createUser(CreateUserRequestBody payload) returns UserResponse|error {
        string  path = string `/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->post(path, request, targetType=UserResponse);
        return response;
    }
    # Login-User
    #
    # + payload - Required parameters
    # + return - `User-Login-Response` or an error
    remote isolated function loginUser(LoginAdminRequestBody payload) returns UserLoginResponse|error {
        string  path = string `/users/login`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserLoginResponse response = check self.clientEp->post(path, request, targetType=UserLoginResponse);
        return response;
    }
    # Get-User
    #
    # + UserUsername - User's username
    # + return - `Detailed-User-Response` or an error
    remote isolated function getUser(string UserUsername) returns DetailedUserResponse|error {
        string  path = string `/users/${UserUsername}`;
        DetailedUserResponse response = check self.clientEp-> get(path, targetType = DetailedUserResponse);
        return response;
    }
    # Update-User
    #
    # + UserUsername - User's username
    # + payload - Required parameters
    # + return - `User-Response` or an error
    remote isolated function updateUser(string UserUsername, UpdateUserRequestBody payload) returns UserResponse|error {
        string  path = string `/users/${UserUsername}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserResponse response = check self.clientEp->put(path, request, targetType=UserResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
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
