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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector from [Files.com API v1.0](https://www.files.com/) OpenAPI specification.
# Welcome to the Files.com API. Our REST API are designed for people who require the highest level of integration between Files.com and their own application, website, or database.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Obtain API keys following [this guide](https://developers.files.com/#authentication-with-api-key).
    #
    # + apiKeyConfig - Provide your API key as `X-FilesAPI-Key`. Eg: `{"X-FilesAPI-Key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Create Action Notification Export
    #
    # + payload - Request payload
    # + return - The ActionNotificationExports object. 
    remote isolated function postActionNotificationExports(Body payload) returns ActionNotificationExportEntity|error {
        string  path = string `/action_notification_exports`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ActionNotificationExportEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ActionNotificationExportEntity);
        return response;
    }
    # Show Action Notification Export
    #
    # + id - Action Notification Export ID. 
    # + return - The ActionNotificationExports object. 
    remote isolated function getActionNotificationExportsId(int id) returns ActionNotificationExportEntity|error {
        string  path = string `/action_notification_exports/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionNotificationExportEntity response = check self.clientEp-> get(path, accHeaders, targetType = ActionNotificationExportEntity);
        return response;
    }
    # List Action Notification Export Results
    #
    # + actionNotificationExportId - ID of the associated action notification export. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of ActionNotificationExportResults objects. 
    remote isolated function getActionNotificationExportResults(int actionNotificationExportId, int? userId = (), string? cursor = (), int? perPage = ()) returns ActionNotificationExportResultEntity[]|error {
        string  path = string `/action_notification_export_results`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "action_notification_export_id": actionNotificationExportId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionNotificationExportResultEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionNotificationExportResultEntityArr);
        return response;
    }
    # retry Action Webhook Failure
    #
    # + id - Action Webhook Failure ID. 
    # + return - The ActionWebhookFailures object. 
    remote isolated function postActionWebhookFailuresIdRetry(int id) returns http:Response|error {
        string  path = string `/action_webhook_failures/${id}/retry`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Show information about current API key.  (Requires current API connection to be using an API key.)
    #
    # + return - The ApiKey object. 
    remote isolated function apiKeyFindCurrent() returns ApiKeyEntity|error {
        string  path = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntity);
        return response;
    }
    # Delete current API key.  (Requires current API connection to be using an API key.)
    #
    # + return - No body. 
    remote isolated function apiKeyDeleteCurrent() returns http:Response|error {
        string  path = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update current API key.  (Requires current API connection to be using an API key.)
    #
    # + payload - Request payload
    # + return - The ApiKey object. 
    remote isolated function apiKeyUpdateCurrent(Body3 payload) returns ApiKeyEntity|error {
        string  path = string `/api_key`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ApiKeyEntity);
        return response;
    }
    # Show Api Key
    #
    # + id - Api Key ID. 
    # + return - The ApiKeys object. 
    remote isolated function getApiKeysId(int id) returns ApiKeyEntity|error {
        string  path = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntity);
        return response;
    }
    # Delete Api Key
    #
    # + id - Api Key ID. 
    # + return - No body. 
    remote isolated function deleteApiKeysId(int id) returns http:Response|error {
        string  path = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Api Key
    #
    # + id - Api Key ID.
    # + payload - Request payload
    # + return - The ApiKeys object. 
    remote isolated function patchApiKeysId(int id, Body6 payload) returns ApiKeyEntity|error {
        string  path = string `/api_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ApiKeyEntity);
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
        string  path = string `/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntityArr);
        return response;
    }
    # Create Api Key
    #
    # + payload - Request payload
    # + return - The ApiKeys object. 
    remote isolated function postApiKeys(Body9 payload) returns ApiKeyEntity|error {
        string  path = string `/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiKeyEntity);
        return response;
    }
    # Get the most recent usage snapshot (usage data for billing purposes) for a Site.
    #
    # + return - The Site object. 
    remote isolated function getSiteUsage() returns UsageSnapshotEntity|error {
        string  path = string `/site/usage`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UsageSnapshotEntity response = check self.clientEp-> get(path, accHeaders, targetType = UsageSnapshotEntity);
        return response;
    }
    # Show site settings
    #
    # + return - The Site object. 
    remote isolated function getSite() returns SiteEntity|error {
        string  path = string `/site`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SiteEntity response = check self.clientEp-> get(path, accHeaders, targetType = SiteEntity);
        return response;
    }
    # Update site settings.
    #
    # + payload - Request payload
    # + return - The Site object. 
    remote isolated function patchSite(Body12 payload) returns SiteEntity|error {
        string  path = string `/site`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SiteEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=SiteEntity);
        return response;
    }
    # List IP Addresses associated with the current site
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getSiteIpAddresses(string? cursor = (), int? perPage = ()) returns IpAddressEntity[]|error {
        string  path = string `/site/ip_addresses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        IpAddressEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = IpAddressEntityArr);
        return response;
    }
    # Show site DNS configuration.
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of DnsRecords objects. 
    remote isolated function getSiteDnsRecords(string? cursor = (), int? perPage = ()) returns DnsRecordEntity[]|error {
        string  path = string `/site/dns_records`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DnsRecordEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = DnsRecordEntityArr);
        return response;
    }
    # Test webhook.
    #
    # + payload - Request payload
    # + return - The Behaviors object. 
    remote isolated function postSiteTestWebhook(Body15 payload) returns StatusEntity|error {
        string  path = string `/site/test-webhook`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StatusEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StatusEntity);
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
        string  path = string `/site/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntityArr);
        return response;
    }
    # Create Api Key
    #
    # + payload - Request payload
    # + return - The ApiKeys object. 
    remote isolated function postSiteApiKeys(Body18 payload) returns ApiKeyEntity|error {
        string  path = string `/site/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiKeyEntity);
        return response;
    }
    # Update User
    #
    # + payload - Request payload
    # + return - The Users object. 
    remote isolated function patchUser(Body21 payload) returns UserEntity|error {
        string  path = string `/user`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserEntity);
        return response;
    }
    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getUserPublicKeys(int? userId = (), string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string  path = string `/user/public_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PublicKeyEntityArr);
        return response;
    }
    # Create Public Key
    #
    # + payload - Request payload
    # + return - The PublicKeys object. 
    remote isolated function postUserPublicKeys(Body24 payload) returns PublicKeyEntity|error {
        string  path = string `/user/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublicKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PublicKeyEntity);
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
        string  path = string `/user/groups`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "group_id": groupId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupUserEntityArr);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getUserAs2Keys(int? userId = (), string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string  path = string `/user/as2_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = As2KeyEntityArr);
        return response;
    }
    # Create As2 Key
    #
    # + payload - Request payload
    # + return - The As2Keys object. 
    remote isolated function postUserAs2Keys(Body27 payload) returns As2KeyEntity|error {
        string  path = string `/user/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        As2KeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=As2KeyEntity);
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
        string  path = string `/user/api_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntityArr);
        return response;
    }
    # Create Api Key
    #
    # + payload - Request payload
    # + return - The ApiKeys object. 
    remote isolated function postUserApiKeys(Body30 payload) returns ApiKeyEntity|error {
        string  path = string `/user/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiKeyEntity);
        return response;
    }
    # Unlock user who has been locked out due to failed logins.
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersIdUnlock(int id) returns http:Response|error {
        string  path = string `/users/${id}/unlock`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Resend user welcome email
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersIdResendWelcomeEmail(int id) returns http:Response|error {
        string  path = string `/users/${id}/resend_welcome_email`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Trigger 2FA Reset process for user who has lost access to their existing 2FA methods.
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function postUsersId2faReset(int id) returns http:Response|error {
        string  path = string `/users/${id}/2fa/reset`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Show User
    #
    # + id - User ID. 
    # + return - The Users object. 
    remote isolated function getUsersId(int id) returns UserEntity|error {
        string  path = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserEntity response = check self.clientEp-> get(path, accHeaders, targetType = UserEntity);
        return response;
    }
    # Delete User
    #
    # + id - User ID. 
    # + return - No body. 
    remote isolated function deleteUsersId(int id) returns http:Response|error {
        string  path = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update User
    #
    # + id - User ID.
    # + payload - Request payload
    # + return - The Users object. 
    remote isolated function patchUsersId(int id, Body33 payload) returns UserEntity|error {
        string  path = string `/users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UserEntity);
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
        string  path = string `/users`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "ids": ids, "q[username]": qUsername, "q[email]": qEmail, "q[notes]": qNotes, "q[admin]": qAdmin, "q[allowed_ips]": qAllowedIps, "q[password_validity_days]": qPasswordValidityDays, "q[ssl_required]": qSslRequired, "search": search};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UserEntityArr);
        return response;
    }
    # Create User
    #
    # + payload - Request payload
    # + return - The Users object. 
    remote isolated function postUsers(Body36 payload) returns UserEntity|error {
        string  path = string `/users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserEntity);
        return response;
    }
    # List User Cipher Uses
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserCipherUses objects. 
    remote isolated function getUsersUserIdCipherUses(int userId, string? cursor = (), int? perPage = ()) returns UserCipherUseEntity[]|error {
        string  path = string `/users/${userId}/cipher_uses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserCipherUseEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UserCipherUseEntityArr);
        return response;
    }

    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getUsersUserIdPublicKeys(int userId, string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string  path = string `/users/${userId}/public_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PublicKeyEntityArr);
        return response;
    }
    # Create Public Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + payload - Request payload.
    # + return - The PublicKeys object. 
    remote isolated function postUsersUserIdPublicKeys(int userId, Body39 payload) returns PublicKeyEntity|error {
        string  path = string `/users/${userId}/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublicKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PublicKeyEntity);
        return response;
    }
    # List Permissions
    #
    # + userId - DEPRECATED: User ID.  If provided, will scope permissions to this user. Use `filter[user_id]` instead.
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
    # + includeGroups - If searching by user or group, also include user's permissions that are inherited from its groups? 
    # + return - A list of Permissions objects. 
    remote isolated function getUsersUserIdPermissions(string userId, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? groupId = (), boolean? includeGroups = ()) returns PermissionEntity[]|error {
        string  path = string `/users/${userId}/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "include_groups": includeGroups};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PermissionEntityArr);
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
        string  path = string `/users/${userId}/groups`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "group_id": groupId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupUserEntityArr);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getUsersUserIdAs2Keys(int userId, string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string  path = string `/users/${userId}/as2_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = As2KeyEntityArr);
        return response;
    }
    # Create As2 Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + payload - Request payload.
    # + return - The As2Keys object. 
    remote isolated function postUsersUserIdAs2Keys(int userId, Body42 payload) returns As2KeyEntity|error {
        string  path = string `/users/${userId}/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        As2KeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=As2KeyEntity);
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
        string  path = string `/users/${userId}/api_keys`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ApiKeyEntityArr);
        return response;
    }
    # Create Api Key
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + payload - Request payload.
    # + return - The ApiKeys object. 
    remote isolated function postUsersUserIdApiKeys(int userId, Body45 payload) returns ApiKeyEntity|error {
        string  path = string `/users/${userId}/api_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ApiKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ApiKeyEntity);
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
        string  path = string `/apps`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AppEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = AppEntityArr);
        return response;
    }
    # Show As2 Key
    #
    # + id - As2 Key ID. 
    # + return - The As2Keys object. 
    remote isolated function getAs2KeysId(int id) returns As2KeyEntity|error {
        string  path = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        As2KeyEntity response = check self.clientEp-> get(path, accHeaders, targetType = As2KeyEntity);
        return response;
    }
    # Delete As2 Key
    #
    # + id - As2 Key ID. 
    # + return - No body. 
    remote isolated function deleteAs2KeysId(int id) returns http:Response|error {
        string  path = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update As2 Key
    #
    # + id - As2 Key ID. 
    # + payload - Request payload.
    # + return - The As2Keys object. 
    remote isolated function patchAs2KeysId(int id, Body48 payload) returns As2KeyEntity|error {
        string  path = string `/as2_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        As2KeyEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=As2KeyEntity);
        return response;
    }
    # List As2 Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of As2Keys objects. 
    remote isolated function getAs2Keys(int? userId = (), string? cursor = (), int? perPage = ()) returns As2KeyEntity[]|error {
        string  path = string `/as2_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        As2KeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = As2KeyEntityArr);
        return response;
    }
    # Create As2 Key
    #
    # + payload - Request payload.
    # + return - The As2Keys object. 
    remote isolated function postAs2Keys(Body51 payload) returns As2KeyEntity|error {
        string  path = string `/as2_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        As2KeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=As2KeyEntity);
        return response;
    }
    # Show Automation
    #
    # + id - Automation ID. 
    # + return - The Automations object. 
    remote isolated function getAutomationsId(int id) returns AutomationEntity|error {
        string  path = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AutomationEntity response = check self.clientEp-> get(path, accHeaders, targetType = AutomationEntity);
        return response;
    }
    # Delete Automation
    #
    # + id - Automation ID. 
    # + return - No body. 
    remote isolated function deleteAutomationsId(int id) returns http:Response|error {
        string  path = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Automation
    #
    # + id - Automation ID. 
    # + payload - Request payload.
    # + return - The Automations object. 
    remote isolated function patchAutomationsId(int id, Body54 payload) returns AutomationEntity|error {
        string  path = string `/automations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AutomationEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=AutomationEntity);
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
        string  path = string `/automations`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "automation": automation};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AutomationEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = AutomationEntityArr);
        return response;
    }
    # Create Automation
    #
    # + payload - Request payload.
    # + return - The Automations object. 
    remote isolated function postAutomations(Body57 payload) returns AutomationEntity|error {
        string  path = string `/automations`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AutomationEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=AutomationEntity);
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
        string  path = string `/bandwidth_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BandwidthSnapshotEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BandwidthSnapshotEntityArr);
        return response;
    }
    # Test webhook.
    #
    # + payload - Request payload.
    # + return - The Behaviors object. 
    remote isolated function postBehaviorsWebhookTest(Body60 payload) returns StatusEntity|error {
        string  path = string `/behaviors/webhook/test`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StatusEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=StatusEntity);
        return response;
    }
    # Show Behavior
    #
    # + id - Behavior ID. 
    # + return - The Behaviors object. 
    remote isolated function getBehaviorsId(int id) returns BehaviorEntity|error {
        string  path = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BehaviorEntity response = check self.clientEp-> get(path, accHeaders, targetType = BehaviorEntity);
        return response;
    }
    # Delete Behavior
    #
    # + id - Behavior ID. 
    # + return - No body. 
    remote isolated function deleteBehaviorsId(int id) returns http:Response|error {
        string  path = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Behavior
    #
    # + id - Behavior ID. 
    # + payload - Request payload.
    # + return - The Behaviors object. 
    remote isolated function patchBehaviorsId(int id, Body63 payload) returns BehaviorEntity|error {
        string  path = string `/behaviors/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BehaviorEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=BehaviorEntity);
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
        string  path = string `/behaviors`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "behavior": behavior};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BehaviorEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BehaviorEntityArr);
        return response;
    }
    # Create Behavior
    #
    # + payload - Request payload.
    # + return - The Behaviors object. 
    remote isolated function postBehaviors(Body66 payload) returns BehaviorEntity|error {
        string  path = string `/behaviors`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BehaviorEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BehaviorEntity);
        return response;
    }
    # List Behaviors by path
    #
    # + operationPath - Path to operate on. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `behavior`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `behavior`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `behavior`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `behavior`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `behavior`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `behavior`. 
    # + recursive - Show behaviors above this path? 
    # + behavior - DEPRECATED: If set only shows folder behaviors matching this behavior type. Use `filter[behavior]` instead. 
    # + return - A list of Behaviors objects. 
    remote isolated function behaviorListForPath(string operationPath, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? recursive = (), string? behavior = ()) returns BehaviorEntity[]|error {
        string  path = string `/behaviors/folders/${operationPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "recursive": recursive, "behavior": behavior};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BehaviorEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BehaviorEntityArr);
        return response;
    }
    # Show Bundle
    #
    # + id - Bundle ID. 
    # + return - The Bundles object. 
    remote isolated function getBundlesId(int id) returns BundleEntity|error {
        string  path = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BundleEntity response = check self.clientEp-> get(path, accHeaders, targetType = BundleEntity);
        return response;
    }
    # Delete Bundle
    #
    # + id - Bundle ID. 
    # + return - No body. 
    remote isolated function deleteBundlesId(int id) returns http:Response|error {
        string  path = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Bundle
    #
    # + id - Bundle ID. 
    # + payload - Request payload.
    # + return - The Bundles object. 
    remote isolated function patchBundlesId(int id, Body69 payload) returns BundleEntity|error {
        string  path = string `/bundles/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BundleEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=BundleEntity);
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
        string  path = string `/bundles`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BundleEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BundleEntityArr);
        return response;
    }
    # Create Bundle
    #
    # + payload - Request payload.
    # + return - The Bundles object. 
    remote isolated function postBundles(Body72 payload) returns BundleEntity|error {
        string  path = string `/bundles`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BundleEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BundleEntity);
        return response;
    }
    # Send email(s) with a link to bundle
    #
    # + id - Bundle ID. 
    # + payload - Request payload.
    # + return - No body. 
    remote isolated function postBundlesIdShare(int id, Body75 payload) returns http:Response|error {
        string  path = string `/bundles/${id}/share`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
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
        string  path = string `/bundle_downloads`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "bundle_id": bundleId, "bundle_registration_id": bundleRegistrationId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BundleDownloadEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BundleDownloadEntityArr);
        return response;
    }
    # List Bundle Recipients
    #
    # + bundleId - List recipients for the bundle with this ID. 
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
    # + return - A list of BundleRecipients objects. 
    remote isolated function getBundleRecipients(int bundleId, int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns BundleRecipientEntity[]|error {
        string  path = string `/bundle_recipients`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "bundle_id": bundleId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BundleRecipientEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BundleRecipientEntityArr);
        return response;
    }
    # Create Bundle Recipient
    #
    # + payload - Request payload.
    # + return - The BundleRecipients object. 
    remote isolated function postBundleRecipients(Body78 payload) returns BundleRecipientEntity|error {
        string  path = string `/bundle_recipients`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BundleRecipientEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BundleRecipientEntity);
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
        string  path = string `/bundle_registrations`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "bundle_id": bundleId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        BundleRegistrationEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = BundleRegistrationEntityArr);
        return response;
    }
    # List Clickwraps
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Clickwraps objects. 
    remote isolated function getClickwraps(string? cursor = (), int? perPage = ()) returns ClickwrapEntity[]|error {
        string  path = string `/clickwraps`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ClickwrapEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ClickwrapEntityArr);
        return response;
    }
    # Create Clickwrap
    #
    # + payload - Request payload.
    # + return - The Clickwraps object. 
    remote isolated function postClickwraps(Body81 payload) returns ClickwrapEntity|error {
        string  path = string `/clickwraps`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClickwrapEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ClickwrapEntity);
        return response;
    }
    # Show Clickwrap
    #
    # + id - Clickwrap ID. 
    # + return - The Clickwraps object. 
    remote isolated function getClickwrapsId(int id) returns ClickwrapEntity|error {
        string  path = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ClickwrapEntity response = check self.clientEp-> get(path, accHeaders, targetType = ClickwrapEntity);
        return response;
    }
    # Delete Clickwrap
    #
    # + id - Clickwrap ID. 
    # + return - No body. 
    remote isolated function deleteClickwrapsId(int id) returns http:Response|error {
        string  path = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Clickwrap
    #
    # + id - Clickwrap ID. 
    # + payload - Request payload.
    # + return - The Clickwraps object. 
    remote isolated function patchClickwrapsId(int id, Body84 payload) returns ClickwrapEntity|error {
        string  path = string `/clickwraps/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClickwrapEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ClickwrapEntity);
        return response;
    }
    # Show site DNS configuration.
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of DnsRecords objects. 
    remote isolated function getDnsRecords(string? cursor = (), int? perPage = ()) returns DnsRecordEntity[]|error {
        string  path = string `/dns_records`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DnsRecordEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = DnsRecordEntityArr);
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
        string  path = string `/external_events`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExternalEventEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ExternalEventEntityArr);
        return response;
    }
    # Create External Event
    #
    # + payload - Request payload.
    # + return - The ExternalEvents object. 
    remote isolated function postExternalEvents(Body87 payload) returns ExternalEventEntity|error {
        string  path = string `/external_events`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExternalEventEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ExternalEventEntity);
        return response;
    }
    # Show External Event
    #
    # + id - External Event ID. 
    # + return - The ExternalEvents object. 
    remote isolated function getExternalEventsId(int id) returns ExternalEventEntity|error {
        string  path = string `/external_events/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ExternalEventEntity response = check self.clientEp-> get(path, accHeaders, targetType = ExternalEventEntity);
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
        string  path = string `/files/${filePath}`;
        map<anydata> queryParam = {"action": action, "preview_size": previewSize, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileEntity response = check self.clientEp-> get(path, accHeaders, targetType = FileEntity);
        return response;
    }
    # Upload file
    #
    # + filePath - Path to operate on. 
    # + payload - Request payload.
    # + return - The Files object. 
    remote isolated function postFilesPath(string filePath, Body90 payload) returns FileEntity|error {
        string  path = string `/files/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileEntity);
        return response;
    }
    # Delete file/folder
    #
    # + filePath - Path to operate on. 
    # + recursive - If true, will recursively delete folers.  Otherwise, will error on non-empty folders. 
    # + return - No body. 
    remote isolated function deleteFilesPath(string filePath, boolean? recursive = ()) returns http:Response|error {
        string  path = string `/files/${filePath}`;
        map<anydata> queryParam = {"recursive": recursive};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update file/folder metadata
    #
    # + filePath - Path to operate on. 
    # + payload - Request payload.
    # + return - The Files object. 
    remote isolated function patchFilesPath(string filePath, Body93 payload) returns FileEntity|error {
        string  path = string `/files/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=FileEntity);
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
        string  path = string `/file_actions/metadata/${filePath}`;
        map<anydata> queryParam = {"preview_size": previewSize, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileEntity response = check self.clientEp-> get(path, accHeaders, targetType = FileEntity);
        return response;
    }
    # Copy file/folder
    #
    # + filePath - Path to operate on. 
    # + payload - Request payload.
    # + return - The FileActions object. 
    remote isolated function fileActionCopy(string filePath, Body96 payload) returns FileActionEntity|error {
        string  path = string `/file_actions/copy/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileActionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileActionEntity);
        return response;
    }
    # Move file/folder
    #
    # + filePath - Path to operate on. 
    # + payload - Request payload.
    # + return - The FileActions object. 
    remote isolated function fileActionMove(string filePath, Body99 payload) returns FileActionEntity|error {
        string  path = string `/file_actions/move/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileActionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileActionEntity);
        return response;
    }
    # Begin file upload
    #
    # + filePath - Path to operate on. 
    # + payload - Request payload.
    # + return - The FileActions object. 
    remote isolated function fileActionBeginUpload(string filePath, Body102 payload) returns FileUploadPartEntity[]|error {
        string  path = string `/file_actions/begin_upload/${filePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileUploadPartEntity[] response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileUploadPartEntityArr);
        return response;
    }
    # Delete File Comment
    #
    # + id - File Comment ID. 
    # + return - No body. 
    remote isolated function deleteFileCommentsId(int id) returns http:Response|error {
        string  path = string `/file_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update File Comment
    #
    # + id - File Comment ID. 
    # + payload - Request payload.
    # + return - The FileComments object. 
    remote isolated function patchFileCommentsId(int id, Body105 payload) returns FileCommentEntity|error {
        string  path = string `/file_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileCommentEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=FileCommentEntity);
        return response;
    }
    # Create File Comment
    #
    # + payload - Request payload.
    # + return - The FileComments object. 
    remote isolated function postFileComments(Body108 payload) returns FileCommentEntity|error {
        string  path = string `/file_comments`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileCommentEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileCommentEntity);
        return response;
    }
    # List File Comments by path
    #
    # + filePath - Path to operate on. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of FileComments objects. 
    remote isolated function fileCommentListForPath(string filePath, string? cursor = (), int? perPage = ()) returns FileCommentEntity[]|error {
        string  path = string `/file_comments/files/${filePath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileCommentEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = FileCommentEntityArr);
        return response;
    }
    # Delete File Comment Reaction
    #
    # + id - File Comment Reaction ID. 
    # + return - No body. 
    remote isolated function deleteFileCommentReactionsId(int id) returns http:Response|error {
        string  path = string `/file_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Create File Comment Reaction
    #
    # + payload - Request payload.
    # + return - The FileCommentReactions object. 
    remote isolated function postFileCommentReactions(Body111 payload) returns FileCommentReactionEntity|error {
        string  path = string `/file_comment_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FileCommentReactionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FileCommentReactionEntity);
        return response;
    }
    # Show File Migration
    #
    # + id - File Migration ID. 
    # + return - The FileMigrations object. 
    remote isolated function getFileMigrationsId(int id) returns FileMigrationEntity|error {
        string  path = string `/file_migrations/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileMigrationEntity response = check self.clientEp-> get(path, accHeaders, targetType = FileMigrationEntity);
        return response;
    }
    # List Folders by path
    #
    # + folderPath - Path to operate on. 
    # + cursor - Send cursor to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + filter - If specified, will filter folders/files list by this string.  Wildcards of `*` and `?` are acceptable here. 
    # + previewSize - Request a preview size.  Can be `small` (default), `large`, `xlarge`, or `pdf`. 
    # + search - If `search_all` is `true`, provide the search string here.  Otherwise, this parameter acts like an alias of `filter`. 
    # + searchAll - Search entire site? 
    # + withPreviews - Include file previews? 
    # + withPriorityColor - Include file priority color information? 
    # + return - A list of Folders objects. 
    remote isolated function folderListForPath(string folderPath, string? cursor = (), int? perPage = (), string? filter = (), string? previewSize = (), string? search = (), boolean? searchAll = (), boolean? withPreviews = (), boolean? withPriorityColor = ()) returns FileEntity[]|error {
        string  path = string `/folders/${folderPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "filter": filter, "preview_size": previewSize, "search": search, "search_all": searchAll, "with_previews": withPreviews, "with_priority_color": withPriorityColor};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FileEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = FileEntityArr);
        return response;
    }
    # Create folder
    #
    # + folderPath - Path to operate on. 
    # + return - The Folders object. 
    remote isolated function postFoldersPath(string folderPath) returns FileEntity|error {
        string  path = string `/folders/${folderPath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FileEntity response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = FileEntity);
        return response;
    }
    # List Form Field Sets
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of FormFieldSets objects. 
    remote isolated function getFormFieldSets(int? userId = (), string? cursor = (), int? perPage = ()) returns FormFieldSetEntity[]|error {
        string  path = string `/form_field_sets`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FormFieldSetEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = FormFieldSetEntityArr);
        return response;
    }
    # Create Form Field Set
    #
    # + payload - Request payload.
    # + return - The FormFieldSets object. 
    remote isolated function postFormFieldSets(PostFormFieldSets payload) returns FormFieldSetEntity|error {
        string  path = string `/form_field_sets`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FormFieldSetEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=FormFieldSetEntity);
        return response;
    }
    # Show Form Field Set
    #
    # + id - Form Field Set ID. 
    # + return - The FormFieldSets object. 
    remote isolated function getFormFieldSetsId(int id) returns FormFieldSetEntity|error {
        string  path = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        FormFieldSetEntity response = check self.clientEp-> get(path, accHeaders, targetType = FormFieldSetEntity);
        return response;
    }
    # Delete Form Field Set
    #
    # + id - Form Field Set ID. 
    # + return - No body. 
    remote isolated function deleteFormFieldSetsId(int id) returns http:Response|error {
        string  path = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Form Field Set
    #
    # + id - Form Field Set ID. 
    # + payload - Request payload.
    # + return - The FormFieldSets object. 
    remote isolated function patchFormFieldSetsId(int id, PatchFormFieldSets payload) returns FormFieldSetEntity|error {
        string  path = string `/form_field_sets/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FormFieldSetEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=FormFieldSetEntity);
        return response;
    }
    # List Group Users
    #
    # + groupId - Group ID.  If provided, will return group_users of this group. 
    # + userId - User ID.  If provided, will return group_users of this user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of GroupUsers objects. 
    remote isolated function getGroupsGroupIdUsers(int groupId, int? userId = (), string? cursor = (), int? perPage = ()) returns GroupUserEntity[]|error {
        string  path = string `/groups/${groupId}/users`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupUserEntityArr);
        return response;
    }
    # Create User
    #
    # + groupId - Group ID to associate this user with.
    # + payload - Request payload. 
    # + return - The Users object. 
    remote isolated function postGroupsGroupIdUsers(int groupId, Body114 payload) returns UserEntity|error {
        string  path = string `/groups/${groupId}/users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserEntity);
        return response;
    }
    # List Permissions
    #
    # + groupId - DEPRECATED: Group ID.  If provided, will scope permissions to this group. Use `filter[group_id]` instead.
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `group_id`, `path`, `user_id` or `permission`. 
    # + filter - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGt - If set, return records where the specifiied field is greater than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterGteq - If set, return records where the specifiied field is greater than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLike - If set, return records where the specifiied field is equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLt - If set, return records where the specifiied field is less than the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + filterLteq - If set, return records where the specifiied field is less than or equal to the supplied value. Valid fields are `group_id`, `user_id` or `path`. 
    # + userId - DEPRECATED: User ID.  If provided, will scope permissions to this user. Use `filter[user_id]` instead.
    # + includeGroups - If searching by user or group, also include user's permissions that are inherited from its groups? 
    # + return - A list of Permissions objects. 
    remote isolated function getGroupsGroupIdPermissions(string groupId, string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), string? userId = (), boolean? includeGroups = ()) returns PermissionEntity[]|error {
        string  path = string `/groups/${groupId}/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "user_id": userId, "include_groups": includeGroups};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PermissionEntityArr);
        return response;
    }
    # Delete Group User
    #
    # + groupId - Group ID from which to remove user. 
    # + userId - User ID to remove from group. 
    # + return - No body. 
    remote isolated function deleteGroupsGroupIdMembershipsUserId(int groupId, int userId) returns http:Response|error {
        string  path = string `/groups/${groupId}/memberships/${userId}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Group User
    #
    # + groupId - Group ID to add user to. 
    # + userId - User ID to add to group. 
    # + payload - Request payload..
    # + return - The GroupUsers object. 
    remote isolated function patchGroupsGroupIdMembershipsUserId(int groupId, int userId, Body117 payload) returns GroupUserEntity|error {
        string  path = string `/groups/${groupId}/memberships/${userId}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupUserEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GroupUserEntity);
        return response;
    }
    # Show Group
    #
    # + id - Group ID. 
    # + return - The Groups object. 
    remote isolated function getGroupsId(int id) returns GroupEntity|error {
        string  path = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupEntity response = check self.clientEp-> get(path, accHeaders, targetType = GroupEntity);
        return response;
    }
    # Delete Group
    #
    # + id - Group ID. 
    # + return - No body. 
    remote isolated function deleteGroupsId(int id) returns http:Response|error {
        string  path = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Group
    #
    # + id - Group ID. 
    # + payload - Request payload.
    # + return - The Groups object. 
    remote isolated function patchGroupsId(int id, Body120 payload) returns GroupEntity|error {
        string  path = string `/groups/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GroupEntity);
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
        string  path = string `/groups`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "ids": ids};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupEntityArr);
        return response;
    }
    # Create Group
    #
    # + payload - Request payload.
    # + return - The Groups object. 
    remote isolated function postGroups(Body123 payload) returns GroupEntity|error {
        string  path = string `/groups`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GroupEntity);
        return response;
    }
    # Delete Group User
    #
    # + id - Group User ID. 
    # + groupId - Group ID from which to remove user. 
    # + userId - User ID to remove from group. 
    # + return - No body. 
    remote isolated function deleteGroupUsersId(int id, int groupId, int userId) returns http:Response|error {
        string  path = string `/group_users/${id}`;
        map<anydata> queryParam = {"group_id": groupId, "user_id": userId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Group User
    #
    # + id - Group User ID. 
    # + payload - Request payload.
    # + return - The GroupUsers object. 
    remote isolated function patchGroupUsersId(int id, Body126 payload) returns GroupUserEntity|error {
        string  path = string `/group_users/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupUserEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=GroupUserEntity);
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
        string  path = string `/group_users`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "group_id": groupId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GroupUserEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = GroupUserEntityArr);
        return response;
    }
    # Create Group User
    #
    # + payload - Request payload.
    # + return - The GroupUsers object. 
    remote isolated function postGroupUsers(Body129 payload) returns GroupUserEntity|error {
        string  path = string `/group_users`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GroupUserEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GroupUserEntity);
        return response;
    }
    # List history for specific file.
    #
    # + filePath - Path to operate on. 
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + return - A list of History objects. 
    remote isolated function historyListForFile(string filePath, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string  path = string `/history/files/${filePath}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionEntityArr);
        return response;
    }
    # List history for specific folder.
    #
    # + folderPath - Path to operate on. 
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + return - A list of History objects. 
    remote isolated function historyListForFolder(string folderPath, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string  path = string `/history/folders/${folderPath}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionEntityArr);
        return response;
    }
    # List history for specific user.
    #
    # + userId - User ID. 
    # + startAt - Leave blank or set to a date/time to filter earlier entries. 
    # + endAt - Leave blank or set to a date/time to filter later entries. 
    # + display - Display format. Leave blank or set to `full` or `parent`. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `user_id` and `created_at`. 
    # + return - A list of History objects. 
    remote isolated function historyListForUser(int userId, string? startAt = (), string? endAt = (), string? display = (), string? cursor = (), int? perPage = (), record {}? sortBy = ()) returns ActionEntity[]|error {
        string  path = string `/history/users/${userId}`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionEntityArr);
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
        string  path = string `/history/login`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionEntityArr);
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
        string  path = string `/history`;
        map<anydata> queryParam = {"start_at": startAt, "end_at": endAt, "display": display, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ActionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ActionEntityArr);
        return response;
    }
    # Create History Export
    #
    # + payload - Request payload.
    # + return - The HistoryExports object. 
    remote isolated function postHistoryExports(Body132 payload) returns HistoryExportEntity|error {
        string  path = string `/history_exports`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HistoryExportEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=HistoryExportEntity);
        return response;
    }
    # Show History Export
    #
    # + id - History Export ID. 
    # + return - The HistoryExports object. 
    remote isolated function getHistoryExportsId(int id) returns HistoryExportEntity|error {
        string  path = string `/history_exports/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryExportEntity response = check self.clientEp-> get(path, accHeaders, targetType = HistoryExportEntity);
        return response;
    }
    # List History Export Results
    #
    # + historyExportId - ID of the associated history export. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of HistoryExportResults objects. 
    remote isolated function getHistoryExportResults(int historyExportId, int? userId = (), string? cursor = (), int? perPage = ()) returns HistoryExportResultEntity[]|error {
        string  path = string `/history_export_results`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "history_export_id": historyExportId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        HistoryExportResultEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = HistoryExportResultEntityArr);
        return response;
    }
    # List Inbox Recipients
    #
    # + inboxId - List recipients for the inbox with this ID. 
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
    # + return - A list of InboxRecipients objects. 
    remote isolated function getInboxRecipients(int inboxId, int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = ()) returns InboxRecipientEntity[]|error {
        string  path = string `/inbox_recipients`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "inbox_id": inboxId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InboxRecipientEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = InboxRecipientEntityArr);
        return response;
    }
    # Create Inbox Recipient
    #
    # + payload - Request payload.
    # + return - The InboxRecipients object. 
    remote isolated function postInboxRecipients(Body135 payload) returns InboxRecipientEntity|error {
        string  path = string `/inbox_recipients`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InboxRecipientEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InboxRecipientEntity);
        return response;
    }
    # List Inbox Registrations
    #
    # + folderBehaviorId - ID of the associated Inbox. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of InboxRegistrations objects. 
    remote isolated function getInboxRegistrations(int folderBehaviorId, string? cursor = (), int? perPage = ()) returns InboxRegistrationEntity[]|error {
        string  path = string `/inbox_registrations`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "folder_behavior_id": folderBehaviorId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InboxRegistrationEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = InboxRegistrationEntityArr);
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
        string  path = string `/inbox_uploads`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "inbox_registration_id": inboxRegistrationId, "inbox_id": inboxId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InboxUploadEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = InboxUploadEntityArr);
        return response;
    }
    # Show Invoice
    #
    # + id - Invoice ID. 
    # + return - The Invoices object. 
    remote isolated function getInvoicesId(int id) returns AccountLineItemEntity|error {
        string  path = string `/invoices/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity response = check self.clientEp-> get(path, accHeaders, targetType = AccountLineItemEntity);
        return response;
    }
    # List Invoices
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Invoices objects. 
    remote isolated function getInvoices(string? cursor = (), int? perPage = ()) returns AccountLineItemEntity[]|error {
        string  path = string `/invoices`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = AccountLineItemEntityArr);
        return response;
    }
    # List all possible public IP addresses
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getIpAddressesReserved(string? cursor = (), int? perPage = ()) returns PublicIpAddressEntity[]|error {
        string  path = string `/ip_addresses/reserved`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicIpAddressEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PublicIpAddressEntityArr);
        return response;
    }
    # List IP Addresses associated with the current site
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of IpAddresses objects. 
    remote isolated function getIpAddresses(string? cursor = (), int? perPage = ()) returns IpAddressEntity[]|error {
        string  path = string `/ip_addresses`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        IpAddressEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = IpAddressEntityArr);
        return response;
    }
    # List Locks by path
    #
    # + lockPath - Path to operate on. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + includeChildren - Include locks from children objects? 
    # + return - A list of Locks objects. 
    remote isolated function lockListForPath(string lockPath, string? cursor = (), int? perPage = (), boolean? includeChildren = ()) returns LockEntity[]|error {
        string  path = string `/locks/${lockPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "include_children": includeChildren};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LockEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = LockEntityArr);
        return response;
    }
    # Create Lock
    #
    # + lockPath - Path 
    # + payload - Request payload.
    # + return - The Locks object. 
    remote isolated function postLocksPath(string lockPath, Body138 payload) returns LockEntity|error {
        string  path = string `/locks/${lockPath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LockEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LockEntity);
        return response;
    }
    # Delete Lock
    #
    # + lockPath - Path 
    # + token - Lock token 
    # + return - No body. 
    remote isolated function deleteLocksPath(string lockPath, string token) returns http:Response|error {
        string  path = string `/locks/${lockPath}`;
        map<anydata> queryParam = {"token": token};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Show Message
    #
    # + id - Message ID. 
    # + return - The Messages object. 
    remote isolated function getMessagesId(int id) returns MessageEntity|error {
        string  path = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageEntity response = check self.clientEp-> get(path, accHeaders, targetType = MessageEntity);
        return response;
    }
    # Delete Message
    #
    # + id - Message ID. 
    # + return - No body. 
    remote isolated function deleteMessagesId(int id) returns http:Response|error {
        string  path = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Message
    #
    # + id - Message ID.
    # + payload - Request payload. 
    # + return - The Messages object. 
    remote isolated function patchMessagesId(int id, Body141 payload) returns MessageEntity|error {
        string  path = string `/messages/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=MessageEntity);
        return response;
    }
    # List Messages
    #
    # + projectId - Project for which to return messages. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Messages objects. 
    remote isolated function getMessages(int projectId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageEntity[]|error {
        string  path = string `/messages`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "project_id": projectId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = MessageEntityArr);
        return response;
    }
    # Create Message
    #
    # + payload - Request payload.
    # + return - The Messages object. 
    remote isolated function postMessages(Body144 payload) returns MessageEntity|error {
        string  path = string `/messages`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=MessageEntity);
        return response;
    }
    # Show Message Comment
    #
    # + id - Message Comment ID. 
    # + return - The MessageComments object. 
    remote isolated function getMessageCommentsId(int id) returns MessageCommentEntity|error {
        string  path = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageCommentEntity response = check self.clientEp-> get(path, accHeaders, targetType = MessageCommentEntity);
        return response;
    }
    # Delete Message Comment
    #
    # + id - Message Comment ID. 
    # + return - No body. 
    remote isolated function deleteMessageCommentsId(int id) returns http:Response|error {
        string  path = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Message Comment
    #
    # + id - Message Comment ID. 
    # + payload - Request payload.
    # + return - The MessageComments object. 
    remote isolated function patchMessageCommentsId(int id, Body147 payload) returns MessageCommentEntity|error {
        string  path = string `/message_comments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageCommentEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=MessageCommentEntity);
        return response;
    }
    # List Message Comments
    #
    # + messageId - Message comment to return comments for. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of MessageComments objects. 
    remote isolated function getMessageComments(int messageId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageCommentEntity[]|error {
        string  path = string `/message_comments`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_id": messageId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageCommentEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = MessageCommentEntityArr);
        return response;
    }
    # Create Message Comment
    #
    # + payload - Request payload.
    # + return - The MessageComments object. 
    remote isolated function postMessageComments(Body150 payload) returns MessageCommentEntity|error {
        string  path = string `/message_comments`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageCommentEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=MessageCommentEntity);
        return response;
    }
    # Show Message Comment Reaction
    #
    # + id - Message Comment Reaction ID. 
    # + return - The MessageCommentReactions object. 
    remote isolated function getMessageCommentReactionsId(int id) returns MessageCommentReactionEntity|error {
        string  path = string `/message_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageCommentReactionEntity response = check self.clientEp-> get(path, accHeaders, targetType = MessageCommentReactionEntity);
        return response;
    }
    # Delete Message Comment Reaction
    #
    # + id - Message Comment Reaction ID. 
    # + return - No body. 
    remote isolated function deleteMessageCommentReactionsId(int id) returns http:Response|error {
        string  path = string `/message_comment_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # List Message Comment Reactions
    #
    # + messageCommentId - Message comment to return reactions for. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of MessageCommentReactions objects. 
    remote isolated function getMessageCommentReactions(int messageCommentId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageCommentReactionEntity[]|error {
        string  path = string `/message_comment_reactions`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_comment_id": messageCommentId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageCommentReactionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = MessageCommentReactionEntityArr);
        return response;
    }
    # Create Message Comment Reaction
    #
    # + payload - Request payload.
    # + return - The MessageCommentReactions object. 
    remote isolated function postMessageCommentReactions(Body153 payload) returns MessageCommentReactionEntity|error {
        string  path = string `/message_comment_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageCommentReactionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=MessageCommentReactionEntity);
        return response;
    }
    # Show Message Reaction
    #
    # + id - Message Reaction ID. 
    # + return - The MessageReactions object. 
    remote isolated function getMessageReactionsId(int id) returns MessageReactionEntity|error {
        string  path = string `/message_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageReactionEntity response = check self.clientEp-> get(path, accHeaders, targetType = MessageReactionEntity);
        return response;
    }
    # Delete Message Reaction
    #
    # + id - Message Reaction ID. 
    # + return - No body. 
    remote isolated function deleteMessageReactionsId(int id) returns http:Response|error {
        string  path = string `/message_reactions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # List Message Reactions
    #
    # + messageId - Message to return reactions for. 
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of MessageReactions objects. 
    remote isolated function getMessageReactions(int messageId, int? userId = (), string? cursor = (), int? perPage = ()) returns MessageReactionEntity[]|error {
        string  path = string `/message_reactions`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "message_id": messageId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MessageReactionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = MessageReactionEntityArr);
        return response;
    }
    # Create Message Reaction
    # + payload - Request payload.
    # + return - The MessageReactions object. 
    remote isolated function postMessageReactions(Body156 payload) returns MessageReactionEntity|error {
        string  path = string `/message_reactions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MessageReactionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=MessageReactionEntity);
        return response;
    }
    # Show Notification
    #
    # + id - Notification ID. 
    # + return - The Notifications object. 
    remote isolated function getNotificationsId(int id) returns NotificationEntity|error {
        string  path = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        NotificationEntity response = check self.clientEp-> get(path, accHeaders, targetType = NotificationEntity);
        return response;
    }
    # Delete Notification
    #
    # + id - Notification ID. 
    # + return - No body. 
    remote isolated function deleteNotificationsId(int id) returns http:Response|error {
        string  path = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Notification
    #
    # + id - Notification ID. 
    # + payload - Request payload.
    # + return - The Notifications object. 
    remote isolated function patchNotificationsId(int id, Body159 payload) returns NotificationEntity|error {
        string  path = string `/notifications/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=NotificationEntity);
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
    # + notificationPath - Show notifications for this Path. 
    # + includeAncestors - If `include_ancestors` is `true` and `path` is specified, include notifications for any parent paths. Ignored if `path` is not specified. 
    # + return - A list of Notifications objects. 
    remote isolated function getNotifications(int? userId = (), string? cursor = (), int? perPage = (), record {}? sortBy = (), record {}? filter = (), record {}? filterGt = (), record {}? filterGteq = (), record {}? filterLike = (), record {}? filterLt = (), record {}? filterLteq = (), int? groupId = (), string? notificationPath = (), boolean? includeAncestors = ()) returns NotificationEntity[]|error {
        string  path = string `/notifications`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "notificationPath": notificationPath, "include_ancestors": includeAncestors};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        NotificationEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = NotificationEntityArr);
        return response;
    }
    # Create Notification
    #
    # + payload - Request payload.
    # + return - The Notifications object. 
    remote isolated function postNotifications(Body162 payload) returns NotificationEntity|error {
        string  path = string `/notifications`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NotificationEntity);
        return response;
    }
    # Show Payment
    #
    # + id - Payment ID. 
    # + return - The Payments object. 
    remote isolated function getPaymentsId(int id) returns AccountLineItemEntity|error {
        string  path = string `/payments/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity response = check self.clientEp-> get(path, accHeaders, targetType = AccountLineItemEntity);
        return response;
    }
    # List Payments
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Payments objects. 
    remote isolated function getPayments(string? cursor = (), int? perPage = ()) returns AccountLineItemEntity[]|error {
        string  path = string `/payments`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AccountLineItemEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = AccountLineItemEntityArr);
        return response;
    }
    # Delete Permission
    #
    # + id - Permission ID. 
    # + return - No body. 
    remote isolated function deletePermissionsId(int id) returns http:Response|error {
        string  path = string `/permissions/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
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
        string  path = string `/permissions`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq, "group_id": groupId, "user_id": userId, "include_groups": includeGroups};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PermissionEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PermissionEntityArr);
        return response;
    }
    # Create Permission
    #
    # + payload - Request payload.
    # + return - The Permissions object. 
    remote isolated function postPermissions(Body165 payload) returns PermissionEntity|error {
        string  path = string `/permissions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermissionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PermissionEntity);
        return response;
    }
    # Show Project
    #
    # + id - Project ID. 
    # + return - The Projects object. 
    remote isolated function getProjectsId(int id) returns ProjectEntity|error {
        string  path = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectEntity response = check self.clientEp-> get(path, accHeaders, targetType = ProjectEntity);
        return response;
    }
    # Delete Project
    #
    # + id - Project ID. 
    # + return - No body. 
    remote isolated function deleteProjectsId(int id) returns http:Response|error {
        string  path = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Project
    #
    # + id - Project ID.
    # + payload - Request payload. 
    # + return - The Projects object. 
    remote isolated function patchProjectsId(int id, Body168 payload) returns ProjectEntity|error {
        string  path = string `/projects/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=ProjectEntity);
        return response;
    }
    # List Projects
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of Projects objects. 
    remote isolated function getProjects(string? cursor = (), int? perPage = ()) returns ProjectEntity[]|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = ProjectEntityArr);
        return response;
    }
    # Create Project
    #
    # + payload - Request payload.
    # + return - The Projects object. 
    remote isolated function postProjects(Body171 payload) returns ProjectEntity|error {
        string  path = string `/projects`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ProjectEntity);
        return response;
    }
    # Show Public Key
    #
    # + id - Public Key ID. 
    # + return - The PublicKeys object. 
    remote isolated function getPublicKeysId(int id) returns PublicKeyEntity|error {
        string  path = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity response = check self.clientEp-> get(path, accHeaders, targetType = PublicKeyEntity);
        return response;
    }
    # Delete Public Key
    #
    # + id - Public Key ID. 
    # + return - No body. 
    remote isolated function deletePublicKeysId(int id) returns http:Response|error {
        string  path = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Public Key
    #
    # + id - Public Key ID. 
    # + payload - Request payload.
    # + return - The PublicKeys object. 
    remote isolated function patchPublicKeysId(int id, Body174 payload) returns PublicKeyEntity|error {
        string  path = string `/public_keys/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublicKeyEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=PublicKeyEntity);
        return response;
    }
    # List Public Keys
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of PublicKeys objects. 
    remote isolated function getPublicKeys(int? userId = (), string? cursor = (), int? perPage = ()) returns PublicKeyEntity[]|error {
        string  path = string `/public_keys`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PublicKeyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = PublicKeyEntityArr);
        return response;
    }
    # Create Public Key
    #
    # + payload - Request payload.
    # + return - The PublicKeys object. 
    remote isolated function postPublicKeys(Body177 payload) returns PublicKeyEntity|error {
        string  path = string `/public_keys`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PublicKeyEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PublicKeyEntity);
        return response;
    }
    # List Remote Servers
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of RemoteServers objects. 
    remote isolated function getRemoteServers(string? cursor = (), int? perPage = ()) returns RemoteServerEntity[]|error {
        string  path = string `/remote_servers`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RemoteServerEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = RemoteServerEntityArr);
        return response;
    }
    # Create Remote Server
    #
    # + payload - Request payload.
    # + return - The RemoteServers object. 
    remote isolated function postRemoteServers(Body180 payload) returns RemoteServerEntity|error {
        string  path = string `/remote_servers`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteServerEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=RemoteServerEntity);
        return response;
    }
    # Show Remote Server
    #
    # + id - Remote Server ID. 
    # + return - The RemoteServers object. 
    remote isolated function getRemoteServersId(int id) returns RemoteServerEntity|error {
        string  path = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RemoteServerEntity response = check self.clientEp-> get(path, accHeaders, targetType = RemoteServerEntity);
        return response;
    }
    # Delete Remote Server
    #
    # + id - Remote Server ID. 
    # + return - No body. 
    remote isolated function deleteRemoteServersId(int id) returns http:Response|error {
        string  path = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Remote Server
    #
    # + id - Remote Server ID.
    # + payload - Request payload. 
    # + return - The RemoteServers object. 
    remote isolated function patchRemoteServersId(int id, Body183 payload) returns RemoteServerEntity|error {
        string  path = string `/remote_servers/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteServerEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=RemoteServerEntity);
        return response;
    }
    # Delete Request
    #
    # + id - Request ID. 
    # + return - No body. 
    remote isolated function deleteRequestsId(int id) returns http:Response|error {
        string  path = string `/requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
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
        string  path = string `/requests`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "mine": mine, "requestPath": requestPath};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RequestEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = RequestEntityArr);
        return response;
    }
    # Create Request
    #
    # + payload - Request payload.
    # + return - The Requests object. 
    remote isolated function postRequests(Body186 payload) returns RequestEntity|error {
        string  path = string `/requests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RequestEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=RequestEntity);
        return response;
    }
    # List Requests
    #
    # + folderPath - Path to show requests for.  If omitted, shows all paths. Send `/` to represent the root directory. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + sortBy - If set, sort records by the specified field in either 'asc' or 'desc' direction (e.g. sort_by[last_login_at]=desc). Valid fields are `destination`. 
    # + mine - Only show requests of the current user?  (Defaults to true if current user is not a site admin.) 
    # + return - A list of Requests objects. 
    remote isolated function getRequestsFoldersPath(string folderPath, string? cursor = (), int? perPage = (), record {}? sortBy = (), boolean? mine = ()) returns RequestEntity[]|error {
        string  path = string `/requests/folders/${folderPath}`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "mine": mine};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        RequestEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = RequestEntityArr);
        return response;
    }
    # Create user session (log in)
    #
    # + payload - Request payload.
    # + return - The Sessions object. 
    remote isolated function postSessions(Body189 payload) returns SessionEntity|error {
        string  path = string `/sessions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SessionEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SessionEntity);
        return response;
    }
    # Delete user session (log out)
    #
    # + return - No body. 
    remote isolated function deleteSessions() returns http:Response|error {
        string  path = string `/sessions`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
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
        string  path = string `/settings_changes`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SettingsChangeEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = SettingsChangeEntityArr);
        return response;
    }
    # Show Sso Strategy
    #
    # + id - Sso Strategy ID. 
    # + return - The SsoStrategies object. 
    remote isolated function getSsoStrategiesId(int id) returns SsoStrategyEntity|error {
        string  path = string `/sso_strategies/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SsoStrategyEntity response = check self.clientEp-> get(path, accHeaders, targetType = SsoStrategyEntity);
        return response;
    }
    # List Sso Strategies
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of SsoStrategies objects. 
    remote isolated function getSsoStrategies(string? cursor = (), int? perPage = ()) returns SsoStrategyEntity[]|error {
        string  path = string `/sso_strategies`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SsoStrategyEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = SsoStrategyEntityArr);
        return response;
    }
    # Show Style
    #
    # + stylePath - Style path. 
    # + return - The Styles object. 
    remote isolated function getStylesPath(string stylePath) returns StyleEntity|error {
        string  path = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        StyleEntity response = check self.clientEp-> get(path, accHeaders, targetType = StyleEntity);
        return response;
    }
    # Delete Style
    #
    # + stylePath - Style path. 
    # + return - No body. 
    remote isolated function deleteStylesPath(string stylePath) returns http:Response|error {
        string  path = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update Style
    #
    # + stylePath - Style path. 
    # + payload - Request payload.
    # + return - The Styles object. 
    remote isolated function patchStylesPath(string stylePath, Body192 payload) returns StyleEntity|error {
        string  path = string `/styles/${stylePath}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StyleEntity response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=StyleEntity);
        return response;
    }
    # List Sync Jobs
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of SyncJobs objects. 
    remote isolated function getSyncJobs(string? cursor = (), int? perPage = ()) returns SyncJobEntity[]|error {
        string  path = string `/sync_jobs`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SyncJobEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = SyncJobEntityArr);
        return response;
    }
    # List Usage Snapshots
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UsageSnapshots objects. 
    remote isolated function getUsageSnapshots(string? cursor = (), int? perPage = ()) returns UsageSnapshotEntity[]|error {
        string  path = string `/usage_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UsageSnapshotEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UsageSnapshotEntityArr);
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
        string  path = string `/usage_daily_snapshots`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage, "sort_by": sortBy, "filter": filter, "filter_gt": filterGt, "filter_gteq": filterGteq, "filter_like": filterLike, "filter_lt": filterLt, "filter_lteq": filterLteq};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UsageDailySnapshotEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UsageDailySnapshotEntityArr);
        return response;
    }
    # List User Cipher Uses
    #
    # + userId - User ID.  Provide a value of `0` to operate the current session's user. 
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserCipherUses objects. 
    remote isolated function getUserCipherUses(int? userId = (), string? cursor = (), int? perPage = ()) returns UserCipherUseEntity[]|error {
        string  path = string `/user_cipher_uses`;
        map<anydata> queryParam = {"user_id": userId, "cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserCipherUseEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UserCipherUseEntityArr);
        return response;
    }
    # List User Requests
    #
    # + cursor - Used for pagination.  Send a cursor value to resume an existing list from the point at which you left off.  Get a cursor from an existing list via the X-Files-Cursor-Next header. 
    # + perPage - Number of records to show per page.  (Max: 10,000, 1,000 or less is recommended). 
    # + return - A list of UserRequests objects. 
    remote isolated function getUserRequests(string? cursor = (), int? perPage = ()) returns UserRequestEntity[]|error {
        string  path = string `/user_requests`;
        map<anydata> queryParam = {"cursor": cursor, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserRequestEntity[] response = check self.clientEp-> get(path, accHeaders, targetType = UserRequestEntityArr);
        return response;
    }
    # Create User Request
    #
    # + payload - Request payload.
    # + return - The UserRequests object. 
    remote isolated function postUserRequests(Body195 payload) returns UserRequestEntity|error {
        string  path = string `/user_requests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserRequestEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserRequestEntity);
        return response;
    }
    # Show User Request
    #
    # + id - User Request ID. 
    # + return - The UserRequests object. 
    remote isolated function getUserRequestsId(int id) returns UserRequestEntity|error {
        string  path = string `/user_requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UserRequestEntity response = check self.clientEp-> get(path, accHeaders, targetType = UserRequestEntity);
        return response;
    }
    # Delete User Request
    #
    # + id - User Request ID. 
    # + return - No body. 
    remote isolated function deleteUserRequestsId(int id) returns http:Response|error {
        string  path = string `/user_requests/${id}`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Create Webhook Test
    #
    # + payload - Request payload.
    # + return - The WebhookTests object. 
    remote isolated function postWebhookTests(Body198 payload) returns WebhookTestEntity|error {
        string  path = string `/webhook_tests`;
        map<any> headerValues = {"X-FilesAPI-Key": self.apiKeys["X-FilesAPI-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WebhookTestEntity response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WebhookTestEntity);
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
