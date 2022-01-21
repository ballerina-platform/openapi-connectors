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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API Key - supports user-based or site-wide API keys
    string xFilesapiKey;
|};

# This is a generated connector from [Files.com API v1.0](https://www.files.com/) OpenAPI specification.
# Welcome to the Files.com API. Our REST API are designed for people who require the highest level of integration between Files.com and their own application, website, or database.
@display {label: "files.com", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Obtain API keys following [this guide](https://developers.files.com/#authentication-with-api-key).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Create Action Notification Export
    #
    # + return - The ActionNotificationExports object. 
    remote isolated function postActionNotificationExports(ActionNotificationExportsBody payload) returns ActionNotificationExportEntity|error {
        string resourcePath = string `/action_notification_exports`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ActionNotificationExportEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Action Notification Export
    #
    # + id - Action Notification Export ID. 
    # + return - The ActionNotificationExports object. 
    remote isolated function getActionNotificationExportsId(int id) returns ActionNotificationExportEntity|error {
        string resourcePath = string `/action_notification_exports/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionNotificationExportEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Action Notification Export Results
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + actionNotificationExportId - ID of the associated action notification export. 
    # + return - A list of ActionNotificationExportResults objects. 
    remote isolated function getActionNotificationExportResults(int actionNotificationExportId, int? userId = (), string? cursor = (), int? perPage = ()) returns ActionNotificationExportResultEntity[]|error {
        string resourcePath = string `/action_notification_export_results`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "action_notification_export_id": actionNotificationExportId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionNotificationExportResultEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # retry Action Webhook Failure
    #
    # + id - Action Webhook Failure ID. 
    # + return - The ActionWebhookFailures object. 
    remote isolated function postActionWebhookFailuresIdRetry(int id) returns http:Response|error {
        string resourcePath = string `/action_webhook_failures/${id}/retry`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show information about current API key.  (Requires current API connection to be using an API key.)
    #
    # + return - The ApiKey object. 
    remote isolated function apiKeyFindCurrent() returns ApiKeyEntity|error {
        string resourcePath = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete current API key.  (Requires current API connection to be using an API key.)
    #
    # + return - No body. 
    remote isolated function apiKeyDeleteCurrent() returns http:Response|error {
        string resourcePath = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update current API key.  (Requires current API connection to be using an API key.)
    #
    # + return - The ApiKey object. 
    remote isolated function apiKeyUpdateCurrent(ApiKeyBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Api Key
    #
    # + id - Api Key ID. 
    # + return - The ApiKeys object. 
    remote isolated function getApiKeysId(int id) returns ApiKeyEntity|error {
        string resourcePath = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Api Key
    #
    # + id - Api Key ID. 
    # + return - No body. 
    remote isolated function deleteApiKeysId(int id) returns http:Response|error {
        string resourcePath = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Api Key
    #
    # + id - Api Key ID. 
    # + return - The ApiKeys object. 
    remote isolated function patchApiKeysId(int id, ApiKeysIdBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Api Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `expires_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `expires_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `expires_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `expires_at`. 
    # + return - A list of ApiKeys objects. 
    remote isolated function getApiKeys(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ApiKeyEntity[]|error {
        string resourcePath = string `/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Api Key
    #
    # + return - The ApiKeys object. 
    remote isolated function postApiKeys(ApiKeysBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Get the most recent usage snapshot (usage data for billing purposes) for a Site.
    #
    # + return - The Site object. 
    remote isolated function getSiteUsage() returns UsageSnapshotEntity|error {
        string resourcePath = string `/site/usage`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsageSnapshotEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show site settings
    #
    # + return - The Site object. 
    remote isolated function getSite() returns SiteEntity|error {
        string resourcePath = string `/site`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SiteEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update site settings.
    #
    # + return - The Site object. 
    remote isolated function patchSite(SiteBody payload) returns SiteEntity|error {
        string resourcePath = string `/site`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SiteEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List IP Addresses associated with the current site
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getSiteIpAddresses(string? cursor = (), int? perPage = ()) returns IpAddressEntity[]|error {
        string resourcePath = string `/site/ip_addresses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IpAddressEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show site DNS configuration.
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of DnsRecords objects. 
    remote isolated function getSiteDnsRecords(string? cursor = (), int? perPage = ()) returns DnsRecordEntity[]|error {
        string resourcePath = string `/site/dns_records`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DnsRecordEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Test webhook.
    #
    # + return - The Behaviors object. 
    remote isolated function postSiteTestWebhook(SiteTestwebhookBody payload) returns StatusEntity|error {
        string resourcePath = string `/site/test-webhook`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StatusEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Api Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `expires_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `expires_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `expires_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `expires_at`. 
    # + return - A list of ApiKeys objects. 
    remote isolated function getSiteApiKeys(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ApiKeyEntity[]|error {
        string resourcePath = string `/site/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Api Key
    #
    # + return - The ApiKeys object. 
    remote isolated function postSiteApiKeys(SiteApiKeysBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/site/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Update User
    #
    # + return - The Users object. 
    remote isolated function patchUser(UserBody payload) returns UserEntity|error {
        string resourcePath = string `/user`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getUserPublicKeys(int? userId = (), string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string resourcePath = string `/user/public_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Public Key
    #
    # + return - The PublicKeys object. 
    remote isolated function postUserPublicKeys(UserPublicKeysBody payload) returns PublicKeyEntity|error {
        string resourcePath = string `/user/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Group Users
    #
    # + userId - User ID.  If provided, will return group_users of this user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + groupId - Group ID.  If provided, will return group_users of this group. 
    # + return - A list of GroupUsers objects. 
    remote isolated function getUserGroups(int? userId = (), string? cursor = (), int? perPage = (), int? groupId = ()) returns GroupUserEntity[]|error {
        string resourcePath = string `/user/groups`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "group_id": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getUserAs2Keys(int? userId = (), string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string resourcePath = string `/user/as2_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create As2 Key
    #
    # + return - The As2Keys object. 
    remote isolated function postUserAs2Keys(UserAs2KeysBody payload) returns As2KeyEntity|error {
        string resourcePath = string `/user/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        As2KeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Api Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `expires_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `expires_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `expires_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `expires_at`. 
    # + return - A list of ApiKeys objects. 
    remote isolated function getUserApiKeys(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ApiKeyEntity[]|error {
        string resourcePath = string `/user/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Api Key
    #
    # + return - The ApiKeys object. 
    remote isolated function postUserApiKeys(UserApiKeysBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/user/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Unlock user who has been locked out due to failed logins.
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersIdUnlock(int id) returns http:Response|error {
        string resourcePath = string `/users/${id}/unlock`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Resend user welcome email
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersIdResendWelcomeEmail(int id) returns http:Response|error {
        string resourcePath = string `/users/${id}/resend_welcome_email`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Trigger 2FA Reset process for user who has lost access to their existing 2FA methods.
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersId2faReset(int id) returns http:Response|error {
        string resourcePath = string `/users/${id}/2fa/reset`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show User
    #
    # + id - User ID. 
    # + return - The Users object. 
    remote isolated function getUsersId(int id) returns UserEntity|error {
        string resourcePath = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete User
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function deleteUsersId(int id) returns http:Response|error {
        string resourcePath = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update User
    #
    # + id - User ID. 
    # + return - The Users object. 
    remote isolated function patchUsersId(int id, UsersIdBody payload) returns UserEntity|error {
        string resourcePath = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Users
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `authenticate_until`, `email`, `last_desktop_login_at`, `last_login_at`, `username`, `company`, `name`, `site_admin`, `receive_admin_alerts`, `password_validity_days`, `ssl_required` or `not_site_admin`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `username`, `email`, `company`, `site_admin`, `password_validity_days`, `ssl_required`, `last_login_at`, `authenticate_until` or `not_site_admin`. 
    # + ids - comma-separated list of User IDs 
    # + qUsername - List users matching username. 
    # + qEmail - List users matching email. 
    # + qNotes - List users matching notes field. 
    # + qAdmin - If `true`, list only admin users. 
    # + qAllowedIps - If set, list only users with overridden allowed IP setting. 
    # + qPasswordValidityDays - If set, list only users with overridden password validity days setting. 
    # + qSslRequired - If set, list only users with overridden SSL required setting. 
    # + search - Searches for partial matches of name, username, or email. 
    # + return - A list of Users objects. 
    remote isolated function getUsers(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? ids = (), string? qUsername = (), string? qEmail = (), string? qNotes = (), string? qAdmin = (), string? qAllowedIps = (), string? qPasswordValidityDays = (), string? qSslRequired = (), string? search = ()) returns UserEntity[]|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "ids": ids, "q[username]": qUsername, "q[email]": qEmail, "q[notes]": qNotes, "q[admin]": qAdmin, "q[allowed_ips]": qAllowedIps, "q[password_validity_days]": qPasswordValidityDays, "q[ssl_required]": qSslRequired, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create User
    #
    # + return - The Users object. 
    remote isolated function postUsers(UsersBody payload) returns UserEntity|error {
        string resourcePath = string `/users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List User Cipher Uses
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserCipherUses objects. 
    remote isolated function getUsersUserIdCipherUses(int userId, string? cursor = (), int? perPage = ()) returns UserCipherUseEntity[]|error {
        string resourcePath = string `/users/${userId}/cipher_uses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserCipherUseEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getUsersUserIdPublicKeys(int userId, string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string resourcePath = string `/users/${userId}/public_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Public Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + return - The PublicKeys object. 
    remote isolated function postUsersUserIdPublicKeys(int userId, UserIdPublicKeysBody payload) returns PublicKeyEntity|error {
        string resourcePath = string `/users/${userId}/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Permissions
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `group_id`, `path`, `user_id` or `permission`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + groupId - DEPRECATED: Group ID.  If provided, will scope permissions to this group. Use `filter[group_id]` instead. 
    # + userId - DEPRECATED: User ID.  If provided, will scope permissions to this user. Use `filter[user_id]` instead. 
    # + includeGroups - If searching by user or group, also include user's permissions that are inherited from its groups? 
    # + return - A list of Permissions objects. 
    remote isolated function getUsersUserIdPermissions(string userId, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? groupId = (), boolean? includeGroups = ()) returns PermissionEntity[]|error {
        string resourcePath = string `/users/${userId}/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "include_groups": includeGroups};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Group Users
    #
    # + userId - User ID.  If provided, will return group_users of this user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + groupId - Group ID.  If provided, will return group_users of this group. 
    # + return - A list of GroupUsers objects. 
    remote isolated function getUsersUserIdGroups(int userId, string? cursor = (), int? perPage = (), int? groupId = ()) returns GroupUserEntity[]|error {
        string resourcePath = string `/users/${userId}/groups`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "group_id": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getUsersUserIdAs2Keys(int userId, string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string resourcePath = string `/users/${userId}/as2_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create As2 Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + return - The As2Keys object. 
    remote isolated function postUsersUserIdAs2Keys(int userId, UserIdAs2KeysBody payload) returns As2KeyEntity|error {
        string resourcePath = string `/users/${userId}/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        As2KeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Api Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `expires_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `expires_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `expires_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `expires_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `expires_at`. 
    # + return - A list of ApiKeys objects. 
    remote isolated function getUsersUserIdApiKeys(int userId, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ApiKeyEntity[]|error {
        string resourcePath = string `/users/${userId}/api_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Api Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + return - The ApiKeys object. 
    remote isolated function postUsersUserIdApiKeys(int userId, UserIdApiKeysBody payload) returns ApiKeyEntity|error {
        string resourcePath = string `/users/${userId}/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApiKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Apps
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `name` and `app_type`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name` and `app_type`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `name` and `app_type`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `name` and `app_type`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name` and `app_type`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `name` and `app_type`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `name` and `app_type`. 
    # + return - A list of Apps objects. 
    remote isolated function getApps(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns AppEntity[]|error {
        string resourcePath = string `/apps`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AppEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show As2 Key
    #
    # + id - As2 Key ID. 
    # + return - The As2Keys object. 
    remote isolated function getAs2KeysId(int id) returns As2KeyEntity|error {
        string resourcePath = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        As2KeyEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete As2 Key
    #
    # + id - As2 Key ID. 
    # + return - No body. 
    remote isolated function deleteAs2KeysId(int id) returns http:Response|error {
        string resourcePath = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update As2 Key
    #
    # + id - As2 Key ID. 
    # + return - The As2Keys object. 
    remote isolated function patchAs2KeysId(int id, As2KeysIdBody payload) returns As2KeyEntity|error {
        string resourcePath = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        As2KeyEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getAs2Keys(int? userId = (), string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string resourcePath = string `/as2_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create As2 Key
    #
    # + return - The As2Keys object. 
    remote isolated function postAs2Keys(As2KeysBody payload) returns As2KeyEntity|error {
        string resourcePath = string `/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        As2KeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Automation
    #
    # + id - Automation ID. 
    # + return - The Automations object. 
    remote isolated function getAutomationsId(int id) returns AutomationEntity|error {
        string resourcePath = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AutomationEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Automation
    #
    # + id - Automation ID. 
    # + return - No body. 
    remote isolated function deleteAutomationsId(int id) returns http:Response|error {
        string resourcePath = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Automation
    #
    # + id - Automation ID. 
    # + return - The Automations object. 
    remote isolated function patchAutomationsId(int id, AutomationsIdBody payload) returns AutomationEntity|error {
        string resourcePath = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Automations
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `automation`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `automation`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `automation`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `automation`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `automation`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `automation`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `automation`. 
    # + automation - DEPRECATED: Type of automation to filter by. Use `filter[automation]` instead. 
    # + return - A list of Automations objects. 
    remote isolated function getAutomations(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? automation = ()) returns AutomationEntity[]|error {
        string resourcePath = string `/automations`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "automation": automation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AutomationEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Automation
    #
    # + return - The Automations object. 
    remote isolated function postAutomations(AutomationsBody payload) returns AutomationEntity|error {
        string resourcePath = string `/automations`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Bandwidth Snapshots
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `logged_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `logged_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `logged_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `logged_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `logged_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `logged_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `logged_at`. 
    # + return - A list of BandwidthSnapshots objects. 
    remote isolated function getBandwidthSnapshots(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns BandwidthSnapshotEntity[]|error {
        string resourcePath = string `/bandwidth_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BandwidthSnapshotEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Test webhook.
    #
    # + return - The Behaviors object. 
    remote isolated function postBehaviorsWebhookTest(WebhookTestBody payload) returns StatusEntity|error {
        string resourcePath = string `/behaviors/webhook/test`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StatusEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Behavior
    #
    # + id - Behavior ID. 
    # + return - The Behaviors object. 
    remote isolated function getBehaviorsId(int id) returns BehaviorEntity|error {
        string resourcePath = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BehaviorEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Behavior
    #
    # + id - Behavior ID. 
    # + return - No body. 
    remote isolated function deleteBehaviorsId(int id) returns http:Response|error {
        string resourcePath = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Behavior
    #
    # + id - Behavior ID. 
    # + return - The Behaviors object. 
    remote isolated function patchBehaviorsId(int id, BehaviorsIdBody payload) returns BehaviorEntity|error {
        string resourcePath = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BehaviorEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Behaviors
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `behavior`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `behavior`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `behavior`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `behavior`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `behavior`. 
    # + behavior - If set, only shows folder behaviors matching this behavior type. 
    # + return - A list of Behaviors objects. 
    remote isolated function getBehaviors(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? behavior = ()) returns BehaviorEntity[]|error {
        string resourcePath = string `/behaviors`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "behavior": behavior};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BehaviorEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Behavior
    #
    # + return - The Behaviors object. 
    remote isolated function postBehaviors(BehaviorsBody payload) returns BehaviorEntity|error {
        string resourcePath = string `/behaviors`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BehaviorEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Behaviors by path
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `behavior`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `behavior`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `behavior`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `behavior`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `behavior`. 
    # + operationPath - Path to operate on. 
    # + recursive - Show behaviors above this path? 
    # + behavior - DEPRECATED: If set only shows folder behaviors matching this behavior type. Use `filter[behavior]` instead. 
    # + return - A list of Behaviors objects. 
    remote isolated function behaviorListForPath(string operationPath, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? recursive = (), string? behavior = ()) returns BehaviorEntity[]|error {
        string resourcePath = string `/behaviors/folders/${operationPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "recursive": recursive, "behavior": behavior};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BehaviorEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show Bundle
    #
    # + id - Bundle ID. 
    # + return - The Bundles object. 
    remote isolated function getBundlesId(int id) returns BundleEntity|error {
        string resourcePath = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Bundle
    #
    # + id - Bundle ID. 
    # + return - No body. 
    remote isolated function deleteBundlesId(int id) returns http:Response|error {
        string resourcePath = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Bundle
    #
    # + id - Bundle ID. 
    # + return - The Bundles object. 
    remote isolated function patchBundlesId(int id, BundlesIdBody payload) returns BundleEntity|error {
        string resourcePath = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Bundles
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `created_at` and `code`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `created_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `created_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `created_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `created_at`. 
    # + return - A list of Bundles objects. 
    remote isolated function getBundles(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns BundleEntity[]|error {
        string resourcePath = string `/bundles`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Bundle
    #
    # + return - The Bundles object. 
    remote isolated function postBundles(BundlesBody payload) returns BundleEntity|error {
        string resourcePath = string `/bundles`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Send email(s) with a link to bundle
    #
    # + id - Bundle ID. 
    # + return - No body. 
    remote isolated function postBundlesIdShare(int id, IdShareBody payload) returns http:Response|error {
        string resourcePath = string `/bundles/${id}/share`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Bundle Downloads
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `created_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `created_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `created_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `created_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `created_at`. 
    # + bundleId - Bundle ID 
    # + bundleRegistrationId - BundleRegistration ID 
    # + return - A list of BundleDownloads objects. 
    remote isolated function getBundleDownloads(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), int? bundleId = (), int? bundleRegistrationId = ()) returns BundleDownloadEntity[]|error {
        string resourcePath = string `/bundle_downloads`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "bundle_id": bundleId, "bundle_registration_id": bundleRegistrationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleDownloadEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Bundle Recipients
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `has_registrations`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `has_registrations`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `has_registrations`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `has_registrations`. 
    # + bundleId - List recipients for the bundle with this ID. 
    # + return - A list of BundleRecipients objects. 
    remote isolated function getBundleRecipients(int bundleId, int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns BundleRecipientEntity[]|error {
        string resourcePath = string `/bundle_recipients`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "bundle_id": bundleId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleRecipientEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Bundle Recipient
    #
    # + return - The BundleRecipients object. 
    remote isolated function postBundleRecipients(BundleRecipientsBody payload) returns BundleRecipientEntity|error {
        string resourcePath = string `/bundle_recipients`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BundleRecipientEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Bundle Registrations
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + bundleId - ID of the associated Bundle 
    # + return - A list of BundleRegistrations objects. 
    remote isolated function getBundleRegistrations(int? userId = (), string? cursor = (), int? perPage = (), int? bundleId = ()) returns BundleRegistrationEntity[]|error {
        string resourcePath = string `/bundle_registrations`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "bundle_id": bundleId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BundleRegistrationEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Clickwraps
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Clickwraps objects. 
    remote isolated function getClickwraps(string? cursor = (), int? perPage = ()) returns ClickwrapEntity[]|error {
        string resourcePath = string `/clickwraps`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ClickwrapEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Clickwrap
    #
    # + return - The Clickwraps object. 
    remote isolated function postClickwraps(ClickwrapsBody payload) returns ClickwrapEntity|error {
        string resourcePath = string `/clickwraps`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Clickwrap
    #
    # + id - Clickwrap ID. 
    # + return - The Clickwraps object. 
    remote isolated function getClickwrapsId(int id) returns ClickwrapEntity|error {
        string resourcePath = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ClickwrapEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Clickwrap
    #
    # + id - Clickwrap ID. 
    # + return - No body. 
    remote isolated function deleteClickwrapsId(int id) returns http:Response|error {
        string resourcePath = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Clickwrap
    #
    # + id - Clickwrap ID. 
    # + return - The Clickwraps object. 
    remote isolated function patchClickwrapsId(int id, ClickwrapsIdBody payload) returns ClickwrapEntity|error {
        string resourcePath = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show site DNS configuration.
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of DnsRecords objects. 
    remote isolated function getDnsRecords(string? cursor = (), int? perPage = ()) returns DnsRecordEntity[]|error {
        string resourcePath = string `/dns_records`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DnsRecordEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List External Events
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `remote_server_type`, `event_type`, `created_at`, `status`, `site_id` or `folder_behavior_id`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `created_at`, `event_type`, `remote_server_type`, `status` or `folder_behavior_id`. 
    # + return - A list of ExternalEvents objects. 
    remote isolated function getExternalEvents(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ExternalEventEntity[]|error {
        string resourcePath = string `/external_events`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExternalEventEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create External Event
    #
    # + return - The ExternalEvents object. 
    remote isolated function postExternalEvents(ExternalEventsBody payload) returns ExternalEventEntity|error {
        string resourcePath = string `/external_events`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExternalEventEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show External Event
    #
    # + id - External Event ID. 
    # + return - The ExternalEvents object. 
    remote isolated function getExternalEventsId(int id) returns ExternalEventEntity|error {
        string resourcePath = string `/external_events/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExternalEventEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download file
    #
    # + filePath - Path to operate on. 
    # + action - Can be blank, `redirect` or `stat`.  If set to `stat`, we will return file information but without a download URL, and without logging a download.  If set to `redirect` we will serve a 302 redirect directly to the file.  This is used for integrations with Zapier, and is not recommended for most integrations. 
    # + previewSize - Request a preview size.  Can be `small` (default), `large`, `xlarge`, or `pdf`. 
    # + withPreviews - Include file preview information? 
    # + withPriorityColor - Include file priority color information? 
    # + return - The Files object. 
    remote isolated function fileDownload(string filePath, string? action = (), string? previewSize = (), boolean? withPreviews = (), boolean? withPriorityColor = ()) returns FileEntity|error {
        string resourcePath = string `/files/${filePath}`;
        map<anydata> queryParam = {"action": action, "preview_size": previewSize, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload file
    #
    # + filePath - Path to operate on. 
    # + return - The Files object. 
    remote isolated function postFilesPath(string filePath, FilesFilepathBody payload) returns FileEntity|error {
        string resourcePath = string `/files/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete file/folder
    #
    # + filePath - Path to operate on. 
    # + recursive - If true, will recursively delete folers.  Otherwise, will error on non-empty folders. 
    # + return - No body. 
    remote isolated function deleteFilesPath(string filePath, boolean? recursive = ()) returns http:Response|error {
        string resourcePath = string `/files/${filePath}`;
        map<anydata> queryParam = {"recursive": recursive};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update file/folder metadata
    #
    # + filePath - Path to operate on. 
    # + return - The Files object. 
    remote isolated function patchFilesPath(string filePath, FilesFilepathBody3 payload) returns FileEntity|error {
        string resourcePath = string `/files/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Return metadata for file/folder
    #
    # + filePath - Path to operate on. 
    # + previewSize - Request a preview size.  Can be `small` (default), `large`, `xlarge`, or `pdf`. 
    # + withPreviews - Include file preview information? 
    # + withPriorityColor - Include file priority color information? 
    # + return - The FileActions object. 
    remote isolated function fileActionMetadata(string filePath, string? previewSize = (), boolean? withPreviews = (), boolean? withPriorityColor = ()) returns FileEntity|error {
        string resourcePath = string `/file_actions/metadata/${filePath}`;
        map<anydata> queryParam = {"preview_size": previewSize, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Copy file/folder
    #
    # + filePath - Path to operate on. 
    # + return - The FileActions object. 
    remote isolated function fileActionCopy(string filePath, CopyFilepathBody payload) returns FileActionEntity|error {
        string resourcePath = string `/file_actions/copy/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileActionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Move file/folder
    #
    # + filePath - Path to operate on. 
    # + return - The FileActions object. 
    remote isolated function fileActionMove(string filePath, MoveFilepathBody payload) returns FileActionEntity|error {
        string resourcePath = string `/file_actions/move/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileActionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Begin file upload
    #
    # + filePath - Path to operate on. 
    # + return - The FileActions object. 
    remote isolated function fileActionBeginUpload(string filePath, BeginUploadFilepathBody payload) returns FileUploadPartEntity[]|error {
        string resourcePath = string `/file_actions/begin_upload/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileUploadPartEntity[] response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete File Comment
    #
    # + id - File Comment ID. 
    # + return - No body. 
    remote isolated function deleteFileCommentsId(int id) returns http:Response|error {
        string resourcePath = string `/file_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update File Comment
    #
    # + id - File Comment ID. 
    # + return - The FileComments object. 
    remote isolated function patchFileCommentsId(int id, FileCommentsIdBody payload) returns FileCommentEntity|error {
        string resourcePath = string `/file_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileCommentEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create File Comment
    #
    # + return - The FileComments object. 
    remote isolated function postFileComments(FileCommentsBody payload) returns FileCommentEntity|error {
        string resourcePath = string `/file_comments`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileCommentEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List File Comments by path
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + filePath - Path to operate on. 
    # + return - A list of FileComments objects. 
    remote isolated function fileCommentListForPath(string filePath, string? cursor = (), int? perPage = ()) returns FileCommentEntity[]|error {
        string resourcePath = string `/file_comments/files/${filePath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileCommentEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete File Comment Reaction
    #
    # + id - File Comment Reaction ID. 
    # + return - No body. 
    remote isolated function deleteFileCommentReactionsId(int id) returns http:Response|error {
        string resourcePath = string `/file_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Create File Comment Reaction
    #
    # + return - The FileCommentReactions object. 
    remote isolated function postFileCommentReactions(FileCommentReactionsBody payload) returns FileCommentReactionEntity|error {
        string resourcePath = string `/file_comment_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FileCommentReactionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show File Migration
    #
    # + id - File Migration ID. 
    # + return - The FileMigrations object. 
    remote isolated function getFileMigrationsId(int id) returns FileMigrationEntity|error {
        string resourcePath = string `/file_migrations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileMigrationEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Folders by path
    #
    # + cursor - Send cursor to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + folderPath - Path to operate on. 
    # + filter - If specified, will filter folders/files list by this string.  Wildcards of `*` and `?` are acceptable here. 
    # + previewSize - Request a preview size.  Can be `small` (default), `large`, `xlarge`, or `pdf`. 
    # + search - If `search_all` is `true`, provide the search string here.  Otherwise, this parameter acts like an alias of `filter`. 
    # + searchAll - Search entire site? 
    # + withPreviews - Include file previews? 
    # + withPriorityColor - Include file priority color information? 
    # + return - A list of Folders objects. 
    remote isolated function folderListForPath(string folderPath, string? cursor = (), int? perPage = (), string? filter = (), string? previewSize = (), string? search = (), boolean? searchAll = (), boolean? withPreviews = (), boolean? withPriorityColor = ()) returns FileEntity[]|error {
        string resourcePath = string `/folders/${folderPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "filter": filter, "preview_size": previewSize, "search": search, "search_all": searchAll, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FileEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create folder
    #
    # + folderPath - Path to operate on. 
    # + return - The Folders object. 
    remote isolated function postFoldersPath(string folderPath) returns FileEntity|error {
        string resourcePath = string `/folders/${folderPath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FileEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Form Field Sets
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of FormFieldSets objects. 
    remote isolated function getFormFieldSets(int? userId = (), string? cursor = (), int? perPage = ()) returns FormFieldSetEntity[]|error {
        string resourcePath = string `/form_field_sets`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormFieldSetEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Form Field Set
    #
    # + return - The FormFieldSets object. 
    remote isolated function postFormFieldSets(PostFormFieldSets payload) returns FormFieldSetEntity|error {
        string resourcePath = string `/form_field_sets`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormFieldSetEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Form Field Set
    #
    # + id - Form Field Set ID. 
    # + return - The FormFieldSets object. 
    remote isolated function getFormFieldSetsId(int id) returns FormFieldSetEntity|error {
        string resourcePath = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormFieldSetEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Form Field Set
    #
    # + id - Form Field Set ID. 
    # + return - No body. 
    remote isolated function deleteFormFieldSetsId(int id) returns http:Response|error {
        string resourcePath = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Form Field Set
    #
    # + id - Form Field Set ID. 
    # + return - The FormFieldSets object. 
    remote isolated function patchFormFieldSetsId(int id, PatchFormFieldSets payload) returns FormFieldSetEntity|error {
        string resourcePath = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FormFieldSetEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Group Users
    #
    # + userId - User ID.  If provided, will return group_users of this user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + groupId - Group ID.  If provided, will return group_users of this group. 
    # + return - A list of GroupUsers objects. 
    remote isolated function getGroupsGroupIdUsers(int groupId, int? userId = (), string? cursor = (), int? perPage = ()) returns GroupUserEntity[]|error {
        string resourcePath = string `/groups/${groupId}/users`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create User
    #
    # + groupId - Group ID to associate this user with. 
    # + return - The Users object. 
    remote isolated function postGroupsGroupIdUsers(int groupId, GroupIdUsersBody payload) returns UserEntity|error {
        string resourcePath = string `/groups/${groupId}/users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Permissions
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `group_id`, `path`, `user_id` or `permission`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + groupId - DEPRECATED: Group ID.  If provided, will scope permissions to this group. Use `filter[group_id]` instead. 
    # + userId - DEPRECATED: User ID.  If provided, will scope permissions to this user. Use `filter[user_id]` instead. 
    # + includeGroups - If searching by user or group, also include user's permissions that are inherited from its groups? 
    # + return - A list of Permissions objects. 
    remote isolated function getGroupsGroupIdPermissions(string groupId, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? userId = (), boolean? includeGroups = ()) returns PermissionEntity[]|error {
        string resourcePath = string `/groups/${groupId}/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "user_id": userId, "include_groups": includeGroups};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Group User
    #
    # + groupId - Group ID from which to remove user. 
    # + userId - User ID to remove from group. 
    # + return - No body. 
    remote isolated function deleteGroupsGroupIdMembershipsUserId(int groupId, int userId) returns http:Response|error {
        string resourcePath = string `/groups/${groupId}/memberships/${userId}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Group User
    #
    # + groupId - Group ID to add user to. 
    # + userId - User ID to add to group. 
    # + return - The GroupUsers object. 
    remote isolated function patchGroupsGroupIdMembershipsUserId(int groupId, int userId, MembershipsUserIdBody payload) returns GroupUserEntity|error {
        string resourcePath = string `/groups/${groupId}/memberships/${userId}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupUserEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Group
    #
    # + id - Group ID. 
    # + return - The Groups object. 
    remote isolated function getGroupsId(int id) returns GroupEntity|error {
        string resourcePath = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Group
    #
    # + id - Group ID. 
    # + return - No body. 
    remote isolated function deleteGroupsId(int id) returns http:Response|error {
        string resourcePath = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Group
    #
    # + id - Group ID. 
    # + return - The Groups object. 
    remote isolated function patchGroupsId(int id, GroupsIdBody payload) returns GroupEntity|error {
        string resourcePath = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Groups
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `name`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `name`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `name`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `name`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `name`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `name`. 
    # + ids - Comma-separated list of group ids to include in results. 
    # + return - A list of Groups objects. 
    remote isolated function getGroups(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? ids = ()) returns GroupEntity[]|error {
        string resourcePath = string `/groups`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "ids": ids};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Group
    #
    # + return - The Groups object. 
    remote isolated function postGroups(GroupsBody payload) returns GroupEntity|error {
        string resourcePath = string `/groups`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete Group User
    #
    # + id - Group User ID. 
    # + groupId - Group ID from which to remove user. 
    # + userId - User ID to remove from group. 
    # + return - No body. 
    remote isolated function deleteGroupUsersId(int id, int groupId, int userId) returns http:Response|error {
        string resourcePath = string `/group_users/${id}`;
        map<anydata> queryParam = {"group_id": groupId, "user_id": userId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Group User
    #
    # + id - Group User ID. 
    # + return - The GroupUsers object. 
    remote isolated function patchGroupUsersId(int id, GroupUsersIdBody payload) returns GroupUserEntity|error {
        string resourcePath = string `/group_users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupUserEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Group Users
    #
    # + userId - User ID.  If provided, will return group_users of this user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + groupId - Group ID.  If provided, will return group_users of this group. 
    # + return - A list of GroupUsers objects. 
    remote isolated function getGroupUsers(int? userId = (), string? cursor = (), int? perPage = (), int? groupId = ()) returns GroupUserEntity[]|error {
        string resourcePath = string `/group_users`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "group_id": groupId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Group User
    #
    # + return - The GroupUsers object. 
    remote isolated function postGroupUsers(GroupUsersBody payload) returns GroupUserEntity|error {
        string resourcePath = string `/group_users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GroupUserEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List history for specific file.
    #
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + filePath - Path to operate on. 
    # + return - A list of History objects. 
    remote isolated function historyListForFile(string filePath, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string resourcePath = string `/history/files/${filePath}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List history for specific folder.
    #
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + folderPath - Path to operate on. 
    # + return - A list of History objects. 
    remote isolated function historyListForFolder(string folderPath, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string resourcePath = string `/history/folders/${folderPath}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List history for specific user.
    #
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + userId - User ID. 
    # + return - A list of History objects. 
    remote isolated function historyListForUser(int userId, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string resourcePath = string `/history/users/${userId}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List site login history.
    #
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + return - A list of History objects. 
    remote isolated function historyListLogins(string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string resourcePath = string `/history/login`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List site full action history.
    #
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `path`, `folder`, `user_id` or `created_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `user_id`, `folder` or `path`. 
    # + return - A list of History objects. 
    remote isolated function historyList(string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns ActionEntity[]|error {
        string resourcePath = string `/history`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create History Export
    #
    # + return - The HistoryExports object. 
    remote isolated function postHistoryExports(HistoryExportsBody payload) returns HistoryExportEntity|error {
        string resourcePath = string `/history_exports`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HistoryExportEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show History Export
    #
    # + id - History Export ID. 
    # + return - The HistoryExports object. 
    remote isolated function getHistoryExportsId(int id) returns HistoryExportEntity|error {
        string resourcePath = string `/history_exports/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HistoryExportEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List History Export Results
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + historyExportId - ID of the associated history export. 
    # + return - A list of HistoryExportResults objects. 
    remote isolated function getHistoryExportResults(int historyExportId, int? userId = (), string? cursor = (), int? perPage = ()) returns HistoryExportResultEntity[]|error {
        string resourcePath = string `/history_export_results`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "history_export_id": historyExportId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HistoryExportResultEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Inbox Recipients
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `has_registrations`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `has_registrations`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `has_registrations`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `has_registrations`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `has_registrations`. 
    # + inboxId - List recipients for the inbox with this ID. 
    # + return - A list of InboxRecipients objects. 
    remote isolated function getInboxRecipients(int inboxId, int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns InboxRecipientEntity[]|error {
        string resourcePath = string `/inbox_recipients`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "inbox_id": inboxId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InboxRecipientEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Inbox Recipient
    #
    # + return - The InboxRecipients object. 
    remote isolated function postInboxRecipients(InboxRecipientsBody payload) returns InboxRecipientEntity|error {
        string resourcePath = string `/inbox_recipients`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InboxRecipientEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Inbox Registrations
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + folderBehaviorId - ID of the associated Inbox. 
    # + return - A list of InboxRegistrations objects. 
    remote isolated function getInboxRegistrations(int folderBehaviorId, string? cursor = (), int? perPage = ()) returns InboxRegistrationEntity[]|error {
        string resourcePath = string `/inbox_registrations`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "folder_behavior_id": folderBehaviorId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InboxRegistrationEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Inbox Uploads
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `created_at`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `created_at`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `created_at`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `created_at`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `created_at`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `created_at`. 
    # + inboxRegistrationId - InboxRegistration ID 
    # + inboxId - Inbox ID 
    # + return - A list of InboxUploads objects. 
    remote isolated function getInboxUploads(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), int? inboxRegistrationId = (), int? inboxId = ()) returns InboxUploadEntity[]|error {
        string resourcePath = string `/inbox_uploads`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "inbox_registration_id": inboxRegistrationId, "inbox_id": inboxId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InboxUploadEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show Invoice
    #
    # + id - Invoice ID. 
    # + return - The Invoices object. 
    remote isolated function getInvoicesId(int id) returns AccountLineItemEntity|error {
        string resourcePath = string `/invoices/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Invoices
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Invoices objects. 
    remote isolated function getInvoices(string? cursor = (), int? perPage = ()) returns AccountLineItemEntity[]|error {
        string resourcePath = string `/invoices`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all possible public IP addresses
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getIpAddressesReserved(string? cursor = (), int? perPage = ()) returns PublicIpAddressEntity[]|error {
        string resourcePath = string `/ip_addresses/reserved`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicIpAddressEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List IP Addresses associated with the current site
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getIpAddresses(string? cursor = (), int? perPage = ()) returns IpAddressEntity[]|error {
        string resourcePath = string `/ip_addresses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IpAddressEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Locks by path
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + lockPath - Path to operate on. 
    # + includeChildren - Include locks from children objects? 
    # + return - A list of Locks objects. 
    remote isolated function lockListForPath(string lockPath, string? cursor = (), int? perPage = (), boolean? includeChildren = ()) returns LockEntity[]|error {
        string resourcePath = string `/locks/${lockPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "include_children": includeChildren};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LockEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Lock
    #
    # + lockPath - Path 
    # + return - The Locks object. 
    remote isolated function postLocksPath(string lockPath, LocksLockpathBody payload) returns LockEntity|error {
        string resourcePath = string `/locks/${lockPath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LockEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete Lock
    #
    # + lockPath - Path 
    # + token - Lock token 
    # + return - No body. 
    remote isolated function deleteLocksPath(string lockPath, string token) returns http:Response|error {
        string resourcePath = string `/locks/${lockPath}`;
        map<anydata> queryParam = {"token": token};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Show Message
    #
    # + id - Message ID. 
    # + return - The Messages object. 
    remote isolated function getMessagesId(int id) returns MessageEntity|error {
        string resourcePath = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Message
    #
    # + id - Message ID. 
    # + return - No body. 
    remote isolated function deleteMessagesId(int id) returns http:Response|error {
        string resourcePath = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Message
    #
    # + id - Message ID. 
    # + return - The Messages object. 
    remote isolated function patchMessagesId(int id, MessagesIdBody payload) returns MessageEntity|error {
        string resourcePath = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Messages
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + projectId - Project for which to return messages. 
    # + return - A list of Messages objects. 
    remote isolated function getMessages(int projectId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageEntity[]|error {
        string resourcePath = string `/messages`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "project_id": projectId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Message
    #
    # + return - The Messages object. 
    remote isolated function postMessages(MessagesBody payload) returns MessageEntity|error {
        string resourcePath = string `/messages`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Message Comment
    #
    # + id - Message Comment ID. 
    # + return - The MessageComments object. 
    remote isolated function getMessageCommentsId(int id) returns MessageCommentEntity|error {
        string resourcePath = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageCommentEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Message Comment
    #
    # + id - Message Comment ID. 
    # + return - No body. 
    remote isolated function deleteMessageCommentsId(int id) returns http:Response|error {
        string resourcePath = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Message Comment
    #
    # + id - Message Comment ID. 
    # + return - The MessageComments object. 
    remote isolated function patchMessageCommentsId(int id, MessageCommentsIdBody payload) returns MessageCommentEntity|error {
        string resourcePath = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageCommentEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Message Comments
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + messageId - Message comment to return comments for. 
    # + return - A list of MessageComments objects. 
    remote isolated function getMessageComments(int messageId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageCommentEntity[]|error {
        string resourcePath = string `/message_comments`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_id": messageId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageCommentEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Message Comment
    #
    # + return - The MessageComments object. 
    remote isolated function postMessageComments(MessageCommentsBody payload) returns MessageCommentEntity|error {
        string resourcePath = string `/message_comments`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageCommentEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Message Comment Reaction
    #
    # + id - Message Comment Reaction ID. 
    # + return - The MessageCommentReactions object. 
    remote isolated function getMessageCommentReactionsId(int id) returns MessageCommentReactionEntity|error {
        string resourcePath = string `/message_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageCommentReactionEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Message Comment Reaction
    #
    # + id - Message Comment Reaction ID. 
    # + return - No body. 
    remote isolated function deleteMessageCommentReactionsId(int id) returns http:Response|error {
        string resourcePath = string `/message_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Message Comment Reactions
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + messageCommentId - Message comment to return reactions for. 
    # + return - A list of MessageCommentReactions objects. 
    remote isolated function getMessageCommentReactions(int messageCommentId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageCommentReactionEntity[]|error {
        string resourcePath = string `/message_comment_reactions`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_comment_id": messageCommentId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageCommentReactionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Message Comment Reaction
    #
    # + return - The MessageCommentReactions object. 
    remote isolated function postMessageCommentReactions(MessageCommentReactionsBody payload) returns MessageCommentReactionEntity|error {
        string resourcePath = string `/message_comment_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageCommentReactionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Message Reaction
    #
    # + id - Message Reaction ID. 
    # + return - The MessageReactions object. 
    remote isolated function getMessageReactionsId(int id) returns MessageReactionEntity|error {
        string resourcePath = string `/message_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageReactionEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Message Reaction
    #
    # + id - Message Reaction ID. 
    # + return - No body. 
    remote isolated function deleteMessageReactionsId(int id) returns http:Response|error {
        string resourcePath = string `/message_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Message Reactions
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + messageId - Message to return reactions for. 
    # + return - A list of MessageReactions objects. 
    remote isolated function getMessageReactions(int messageId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageReactionEntity[]|error {
        string resourcePath = string `/message_reactions`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_id": messageId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MessageReactionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Message Reaction
    #
    # + return - The MessageReactions object. 
    remote isolated function postMessageReactions(MessageReactionsBody payload) returns MessageReactionEntity|error {
        string resourcePath = string `/message_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MessageReactionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Notification
    #
    # + id - Notification ID. 
    # + return - The Notifications object. 
    remote isolated function getNotificationsId(int id) returns NotificationEntity|error {
        string resourcePath = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Notification
    #
    # + id - Notification ID. 
    # + return - No body. 
    remote isolated function deleteNotificationsId(int id) returns http:Response|error {
        string resourcePath = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Notification
    #
    # + id - Notification ID. 
    # + return - The Notifications object. 
    remote isolated function patchNotificationsId(int id, NotificationsIdBody payload) returns NotificationEntity|error {
        string resourcePath = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Notifications
    #
    # + userId - DEPRECATED: Show notifications for this User ID. Use `filter[user_id]` instead. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `path`, `user_id` or `group_id`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `user_id`, `group_id` or `path`. 
    # + groupId - DEPRECATED: Show notifications for this Group ID. Use `filter[group_id]` instead. 
    # + path - Show notifications for this Path. 
    # + includeAncestors - If `include_ancestors` is `true` and `path` is specified, include notifications for any parent paths. Ignored if `path` is not specified. 
    # + return - A list of Notifications objects. 
    remote isolated function getNotifications(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), int? groupId = (), string? path = (), boolean? includeAncestors = ()) returns NotificationEntity[]|error {
        string resourcePath = string `/notifications`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "path": path, "include_ancestors": includeAncestors};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Notification
    #
    # + return - The Notifications object. 
    remote isolated function postNotifications(NotificationsBody payload) returns NotificationEntity|error {
        string resourcePath = string `/notifications`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Payment
    #
    # + id - Payment ID. 
    # + return - The Payments object. 
    remote isolated function getPaymentsId(int id) returns AccountLineItemEntity|error {
        string resourcePath = string `/payments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Payments
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Payments objects. 
    remote isolated function getPayments(string? cursor = (), int? perPage = ()) returns AccountLineItemEntity[]|error {
        string resourcePath = string `/payments`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Permission
    #
    # + id - Permission ID. 
    # + return - No body. 
    remote isolated function deletePermissionsId(int id) returns http:Response|error {
        string resourcePath = string `/permissions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Permissions
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `group_id`, `path`, `user_id` or `permission`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + groupId - DEPRECATED: Group ID.  If provided, will scope permissions to this group. Use `filter[group_id]` instead. 
    # + userId - DEPRECATED: User ID.  If provided, will scope permissions to this user. Use `filter[user_id]` instead. 
    # + includeGroups - If searching by user or group, also include user's permissions that are inherited from its groups? 
    # + return - A list of Permissions objects. 
    remote isolated function getPermissions(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? groupId = (), string? userId = (), boolean? includeGroups = ()) returns PermissionEntity[]|error {
        string resourcePath = string `/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "user_id": userId, "include_groups": includeGroups};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Permission
    #
    # + return - The Permissions object. 
    remote isolated function postPermissions(PermissionsBody payload) returns PermissionEntity|error {
        string resourcePath = string `/permissions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermissionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Project
    #
    # + id - Project ID. 
    # + return - The Projects object. 
    remote isolated function getProjectsId(int id) returns ProjectEntity|error {
        string resourcePath = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProjectEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Project
    #
    # + id - Project ID. 
    # + return - No body. 
    remote isolated function deleteProjectsId(int id) returns http:Response|error {
        string resourcePath = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Project
    #
    # + id - Project ID. 
    # + return - The Projects object. 
    remote isolated function patchProjectsId(int id, ProjectsIdBody payload) returns ProjectEntity|error {
        string resourcePath = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Projects
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Projects objects. 
    remote isolated function getProjects(string? cursor = (), int? perPage = ()) returns ProjectEntity[]|error {
        string resourcePath = string `/projects`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProjectEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Project
    #
    # + return - The Projects object. 
    remote isolated function postProjects(ProjectsBody payload) returns ProjectEntity|error {
        string resourcePath = string `/projects`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Public Key
    #
    # + id - Public Key ID. 
    # + return - The PublicKeys object. 
    remote isolated function getPublicKeysId(int id) returns PublicKeyEntity|error {
        string resourcePath = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Public Key
    #
    # + id - Public Key ID. 
    # + return - No body. 
    remote isolated function deletePublicKeysId(int id) returns http:Response|error {
        string resourcePath = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Public Key
    #
    # + id - Public Key ID. 
    # + return - The PublicKeys object. 
    remote isolated function patchPublicKeysId(int id, PublicKeysIdBody payload) returns PublicKeyEntity|error {
        string resourcePath = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicKeyEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getPublicKeys(int? userId = (), string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string resourcePath = string `/public_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Public Key
    #
    # + return - The PublicKeys object. 
    remote isolated function postPublicKeys(PublicKeysBody payload) returns PublicKeyEntity|error {
        string resourcePath = string `/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PublicKeyEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Remote Servers
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of RemoteServers objects. 
    remote isolated function getRemoteServers(string? cursor = (), int? perPage = ()) returns RemoteServerEntity[]|error {
        string resourcePath = string `/remote_servers`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RemoteServerEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Remote Server
    #
    # + return - The RemoteServers object. 
    remote isolated function postRemoteServers(RemoteServersBody payload) returns RemoteServerEntity|error {
        string resourcePath = string `/remote_servers`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteServerEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show Remote Server
    #
    # + id - Remote Server ID. 
    # + return - The RemoteServers object. 
    remote isolated function getRemoteServersId(int id) returns RemoteServerEntity|error {
        string resourcePath = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RemoteServerEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Remote Server
    #
    # + id - Remote Server ID. 
    # + return - No body. 
    remote isolated function deleteRemoteServersId(int id) returns http:Response|error {
        string resourcePath = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Remote Server
    #
    # + id - Remote Server ID. 
    # + return - The RemoteServers object. 
    remote isolated function patchRemoteServersId(int id, RemoteServersIdBody payload) returns RemoteServerEntity|error {
        string resourcePath = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteServerEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete Request
    #
    # + id - Request ID. 
    # + return - No body. 
    remote isolated function deleteRequestsId(int id) returns http:Response|error {
        string resourcePath = string `/requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Requests
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `destination`. 
    # + mine - Only show requests of the current user?  (Defaults to true if current user is not a site admin.) 
    # + requestPath - Path to show requests for.  If omitted, shows all paths. Send `/` to represent the root directory. 
    # + return - A list of Requests objects. 
    remote isolated function getRequests(string? cursor = (), int? perPage = (), record {}? sortBy = (), boolean? mine = (), string? requestPath = ()) returns RequestEntity[]|error {
        string resourcePath = string `/requests`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "mine": mine, "requestPath": requestPath};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RequestEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Request
    #
    # + return - The Requests object. 
    remote isolated function postRequests(RequestsBody payload) returns RequestEntity|error {
        string resourcePath = string `/requests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RequestEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Requests
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `destination`. 
    # + mine - Only show requests of the current user?  (Defaults to true if current user is not a site admin.) 
    # + folderPath - Path to show requests for.  If omitted, shows all paths. Send `/` to represent the root directory. 
    # + return - A list of Requests objects. 
    remote isolated function getRequestsFoldersPath(string folderPath, string? cursor = (), int? perPage = (), record {}? sortBy = (), boolean? mine = ()) returns RequestEntity[]|error {
        string resourcePath = string `/requests/folders/${folderPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "mine": mine};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RequestEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create user session (log in)
    #
    # + return - The Sessions object. 
    remote isolated function postSessions(SessionsBody payload) returns SessionEntity|error {
        string resourcePath = string `/sessions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SessionEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Delete user session (log out)
    #
    # + return - No body. 
    remote isolated function deleteSessions() returns http:Response|error {
        string resourcePath = string `/sessions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # List Settings Changes
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `api_key_id`, `created_at` or `user_id`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `api_key_id` and `user_id`. 
    # + return - A list of SettingsChanges objects. 
    remote isolated function getSettingsChanges(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns SettingsChangeEntity[]|error {
        string resourcePath = string `/settings_changes`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SettingsChangeEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show Sso Strategy
    #
    # + id - Sso Strategy ID. 
    # + return - The SsoStrategies object. 
    remote isolated function getSsoStrategiesId(int id) returns SsoStrategyEntity|error {
        string resourcePath = string `/sso_strategies/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SsoStrategyEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Sso Strategies
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of SsoStrategies objects. 
    remote isolated function getSsoStrategies(string? cursor = (), int? perPage = ()) returns SsoStrategyEntity[]|error {
        string resourcePath = string `/sso_strategies`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SsoStrategyEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Show Style
    #
    # + stylePath - Style path. 
    # + return - The Styles object. 
    remote isolated function getStylesPath(string stylePath) returns StyleEntity|error {
        string resourcePath = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StyleEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Style
    #
    # + stylePath - Style path. 
    # + return - No body. 
    remote isolated function deleteStylesPath(string stylePath) returns http:Response|error {
        string resourcePath = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Update Style
    #
    # + stylePath - Style path. 
    # + return - The Styles object. 
    remote isolated function patchStylesPath(string stylePath, StylesStylepathBody payload) returns StyleEntity|error {
        string resourcePath = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StyleEntity response = check self.clientEp->patch(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Sync Jobs
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of SyncJobs objects. 
    remote isolated function getSyncJobs(string? cursor = (), int? perPage = ()) returns SyncJobEntity[]|error {
        string resourcePath = string `/sync_jobs`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SyncJobEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Usage Snapshots
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UsageSnapshots objects. 
    remote isolated function getUsageSnapshots(string? cursor = (), int? perPage = ()) returns UsageSnapshotEntity[]|error {
        string resourcePath = string `/usage_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsageSnapshotEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Usage Daily Snapshots
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `date` and `usage_snapshot_id`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `date` and `usage_snapshot_id`. 
    # + return - A list of UsageDailySnapshots objects. 
    remote isolated function getUsageDailySnapshots(string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns UsageDailySnapshotEntity[]|error {
        string resourcePath = string `/usage_daily_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsageDailySnapshotEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List User Cipher Uses
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserCipherUses objects. 
    remote isolated function getUserCipherUses(int? userId = (), string? cursor = (), int? perPage = ()) returns UserCipherUseEntity[]|error {
        string resourcePath = string `/user_cipher_uses`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserCipherUseEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List User Requests
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserRequests objects. 
    remote isolated function getUserRequests(string? cursor = (), int? perPage = ()) returns UserRequestEntity[]|error {
        string resourcePath = string `/user_requests`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserRequestEntity[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create User Request
    #
    # + return - The UserRequests object. 
    remote isolated function postUserRequests(UserRequestsBody payload) returns UserRequestEntity|error {
        string resourcePath = string `/user_requests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserRequestEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Show User Request
    #
    # + id - User Request ID. 
    # + return - The UserRequests object. 
    remote isolated function getUserRequestsId(int id) returns UserRequestEntity|error {
        string resourcePath = string `/user_requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserRequestEntity response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete User Request
    #
    # + id - User Request ID. 
    # + return - No body. 
    remote isolated function deleteUserRequestsId(int id) returns http:Response|error {
        string resourcePath = string `/user_requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Create Webhook Test
    #
    # + return - The WebhookTests object. 
    remote isolated function postWebhookTests(WebhookTestsBody payload) returns WebhookTestEntity|error {
        string resourcePath = string `/webhook_tests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeyConfig.xFilesapiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WebhookTestEntity response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
