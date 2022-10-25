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

# This is a generated connector for [Google My Business API v4.9](https://developers.google.com/my-business/) OpenAPI specification.
# The Google My Business API provides an interface for managing business location information on Google.
@display {label: "Google My Business", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    # Some operations may require passing the token as a parameter.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config =  {}, string serviceUrl = "https://mybusiness.googleapis.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Lists all of the accounts for the authenticated user. This includes all accounts that the user owns, as well as any accounts for which the user has management rights.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + filter - A filter constraining the accounts to return. The response includes only entries that match the filter. If `filter` is empty, then no constraints are applied and all accounts (paginated) are retrieved for the requested account. For example, a request with the filter `type=USER_GROUP` will only return user groups. 
    # + name - The resource name of the account for which the list of directly accessible accounts is to be retrieved. This only makes sense for Organizations and User Groups. If empty, will return `ListAccounts` for the authenticated user. 
    # + pageSize - How many accounts to fetch per page. Default is 20, minimum is 2, and maximum page size is 20. 
    # + pageToken - If specified, the next page of accounts is retrieved. The `pageToken` is returned when a call to `accounts.list` returns more results than can fit into the requested page size. 
    # + return - Successful response 
    remote isolated function listAccounts(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), string? name = (), int? pageSize = (), string? pageToken = ()) returns ListAccountsResponse|error {
        string resourcePath = string `/v4/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "name": name, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListAccountsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an account with the specified name and type under the given parent. - Personal accounts and Organizations cannot be created. - User Groups cannot be created with a Personal account as primary owner. - Location Groups cannot be created with a primary owner of a Personal account if the Personal account is in an Organization. - Location Groups cannot own Location Groups. 
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + primaryOwner - The resource name of the account which will be the primary owner of the account being created. It should be of the form `accounts/{account_id}/`. 
    # + payload - Account request 
    # + return - Successful response 
    remote isolated function createAccounts(Account payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? primaryOwner = ()) returns Account|error {
        string resourcePath = string `/v4/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "primaryOwner": primaryOwner};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the list of available attributes that would be available for a location with the given primary category and country.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + categoryId - The primary category stable ID to find available attributes. 
    # + country - The ISO 3166-1 alpha-2 country code to find available attributes. 
    # + languageCode - The BCP 47 code of language to get attribute display names in. If this language is not available, they will be provided in English. 
    # + name - Resource name of the location to look up available attributes. 
    # + pageSize - How many attributes to include per page. Default is 200, minimum is 1. 
    # + pageToken - If specified, the next page of attribute metadata is retrieved. The `pageToken` is returned when a call to `attributes.list` returns more results than can fit into the requested page size. 
    # + return - Successful response 
    remote isolated function listAttributes(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? categoryId = (), string? country = (), string? languageCode = (), string? name = (), int? pageSize = (), string? pageToken = ()) returns ListAttributeMetadataResponse|error {
        string resourcePath = string `/v4/attributes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "categoryId": categoryId, "country": country, "languageCode": languageCode, "name": name, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListAttributeMetadataResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of business categories. Search will match the category name but not the category ID. *Note:* Search only matches the front of a category name (that is, 'food' may return 'Food Court' but not 'Fast Food Restaurant').
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + languageCode - The BCP 47 code of language. If the language is not available, it will default to English. 
    # + pageSize - How many categories to fetch per page. Default is 100, minimum is 1, and maximum page size is 100. 
    # + pageToken - If specified, the next page of categories will be fetched. 
    # + regionCode - The ISO 3166-1 alpha-2 country code. 
    # + searchTerm - Optional filter string from user. 
    # + view - Optional. Specifies which parts to the Category resource should be returned in the response. 
    # + return - Successful response 
    remote isolated function listCategories(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? languageCode = (), int? pageSize = (), string? pageToken = (), string? regionCode = (), string? searchTerm = (), string? view = ()) returns ListBusinessCategoriesResponse|error {
        string resourcePath = string `/v4/categories`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "languageCode": languageCode, "pageSize": pageSize, "pageToken": pageToken, "regionCode": regionCode, "searchTerm": searchTerm, "view": view};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListBusinessCategoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of business categories for the provided language and GConcept ids.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + categoryIds - Required. At least one name must be set. The GConcept ids the localized category names should be returned for. 
    # + languageCode - Required. The BCP 47 code of language that the category names should be returned in. 
    # + regionCode - Optional. The ISO 3166-1 alpha-2 country code used to infer non-standard language. 
    # + view - Required. Specifies which parts to the Category resource should be returned in the response. 
    # + return - Successful response 
    remote isolated function batchgetCategories(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? categoryIds = (), string? languageCode = (), string? regionCode = (), string? view = ()) returns BatchGetBusinessCategoriesResponse|error {
        string resourcePath = string `/v4/categories:batchGet`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "categoryIds": categoryIds, "languageCode": languageCode, "regionCode": regionCode, "view": view};
        map<Encoding> queryParamEncoding = {"categoryIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BatchGetBusinessCategoriesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Searches the chain based on chain name.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + chainDisplayName - Search for a chain by its name. Exact/partial/fuzzy/related queries are supported. Examples: "walmart", "wal-mart", "walmmmart", "沃尔玛" 
    # + resultCount - The maximum number of matched chains to return from this query. The default is 10. The maximum possible value is 500. 
    # + return - Successful response 
    remote isolated function searchChains(string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? chainDisplayName = (), int? resultCount = ()) returns SearchChainsResponse|error {
        string resourcePath = string `/v4/chains:search`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "chainDisplayName": chainDisplayName, "resultCount": resultCount};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SearchChainsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search all of the possible locations that are a match to the specified request.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - SearchGoogleLocations request 
    # + return - Successful response 
    remote isolated function searchGooglelocations(SearchGoogleLocationsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns SearchGoogleLocationsResponse|error {
        string resourcePath = string `/v4/googleLocations:search`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchGoogleLocationsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the specified chain. Returns `NOT_FOUND` if the chain does not exist.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The chain's resource name, in the format `chains/{chain_place_id}`. 
    # + return - Successful response 
    remote isolated function getChains(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Chain|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Chain response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sets the pubsub notification settings for the account informing My Business which topic to send pubsub notifications for: - New reviews for locations administered by the account. - Updated reviews for locations administered by the account. - New `GoogleUpdates` for locations administered by the account. An account will only have one notification settings resource, and only one pubsub topic can be set.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The notification settings resource name. 
    # + payload - Notifications request 
    # + return - Successful response 
    remote isolated function updatenotificationsAccounts(string name, Notifications payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Notifications|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Notifications response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a specific question written by the current user.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the question to delete. 
    # + return - Successful response 
    remote isolated function deleteAccountsLocationsQuestions(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates a specific question written by the current user.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the question to update. 
    # + updateMask - The specific fields to update. If no mask is specified, then this is treated as a full update and all editable fields are set to the values passed in. 
    # + payload - Question request 
    # + return - Successful response 
    remote isolated function patchAccountsLocationsQuestions(string name, Question payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? updateMask = ()) returns Question|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "updateMask": updateMask};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Question response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns insights for a set of local posts associated with a single listing. Which metrics and how they are reported are options specified in the request proto. *Note:* Insight reports are limited to 100 `local_post_names` per call.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The name of the location for which to fetch insights. 
    # + payload - ReportLocalPostInsights request 
    # + return - Successful response 
    remote isolated function reportinsightsAccountsLocationsLocalposts(string name, ReportLocalPostInsightsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ReportLocalPostInsightsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/localPosts:reportInsights`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportLocalPostInsightsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets all of the specified locations in the given account.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the account from which to fetch locations. 
    # + payload - BatchGetLocations request 
    # + return - Successful response 
    remote isolated function batchgetAccountsLocations(string name, BatchGetLocationsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BatchGetLocationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/locations:batchGet`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchGetLocationsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the paginated list of reviews for all specified locations. This operation is only valid if the specified locations are verified. *Note:* Reviews are limited to a batch size of 200 `location_names` per call.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the account from which to retrieve a list of reviews across multiple locations. 
    # + payload - BatchGetReviews request 
    # + return - Successful response 
    remote isolated function batchgetreviewsAccountsLocations(string name, BatchGetReviewsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns BatchGetReviewsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/locations:batchGetReviews`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchGetReviewsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a report containing insights on one or more metrics by location. *Note:* Insight reports are limited to a batch size of 10 `location_names` per call.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The account resource name. 
    # + payload - ReportLocationInsights request 
    # + return - Successful response 
    remote isolated function reportinsightsAccountsLocations(string name, ReportLocationInsightsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ReportLocationInsightsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/locations:reportInsights`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReportLocationInsightsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates the reply to the specified review. A reply is created if one does not exist. This operation is only valid if the specified location is verified.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the review to respond to. 
    # + payload - ReviewReply request 
    # + return - Successful response 
    remote isolated function updatereplyAccountsLocationsReviews(string name, ReviewReply payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ReviewReply|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/reply`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ReviewReply response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes the response to the specified review. This operation is only valid if the specified location is verified.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the review reply to delete. 
    # + return - Successful response 
    remote isolated function deletereplyAccountsLocationsReviews(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}/reply`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Accepts the specified invitation.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the invitation that is being accepted. 
    # + payload - AcceptInvitation request 
    # + return - Successful response 
    remote isolated function acceptAccountsInvitations(string name, AcceptInvitationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:accept`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Associates a location to a place ID. Any previous association is overwritten. This operation is only valid if the location is unverified. The association must be valid, that is, it appears in the list of `FindMatchingLocations`.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The resource name of the location to associate. 
    # + payload - AssociateLocation request 
    # + return - Successful response 
    remote isolated function associateAccountsLocations(string name, AssociateLocationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:associate`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Clears an association between a location and its place ID. This operation is only valid if the location is unverified.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The resource name of the location to disassociate. 
    # + payload - ClearLocationAssociation request 
    # + return - Successful response 
    remote isolated function clearassociationAccountsLocations(string name, ClearLocationAssociationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:clearAssociation`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Completes a `PENDING` verification. It is only necessary for non `AUTO` verification methods. `AUTO` verification request is instantly `VERIFIED` upon creation.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Resource name of the verification to complete. 
    # + payload - CompleteVerification request 
    # + return - Successful response 
    remote isolated function completeAccountsLocationsVerifications(string name, CompleteVerificationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns CompleteVerificationResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:complete`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CompleteVerificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Declines the specified invitation.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the account invitation that is being declined. 
    # + payload - DeclineInvitation request 
    # + return - Successful response 
    remote isolated function declineAccountsInvitations(string name, DeclineInvitationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:decline`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reports all eligible verification options for a location in a specific language.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Resource name of the location to verify. 
    # + payload - FetchVerificationOptions request 
    # + return - Successful response 
    remote isolated function fetchverificationoptionsAccountsLocations(string name, FetchVerificationOptionsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns FetchVerificationOptionsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:fetchVerificationOptions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FetchVerificationOptionsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Finds all of the possible locations that are a match to the specified location. This operation is only valid if the location is unverified.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The resource name of the location to find matches for. 
    # + payload - FindMatchingLocations request 
    # + return - Successful response 
    remote isolated function findmatchesAccountsLocations(string name, FindMatchingLocationsRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns FindMatchingLocationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:findMatches`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FindMatchingLocationsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Generates an account number for this account. The account number is not provisioned when an account is created. Use this request to create an account number when it is required.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the account to generate an account number for. 
    # + payload - GenerateAccountNumber request 
    # + return - Successful response 
    remote isolated function generateaccountnumberAccounts(string name, GenerateAccountNumberRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Account|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:generateAccountNumber`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the Google updated Lodging of a specific location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. Google identifier for this location in the form: `accounts/{account_id}/locations/{location_id}/lodging` 
    # + readMask - Optional. The specific fields to return. If no mask is specified, then it returns the full Lodging (same as "*"). Repeated field items cannot be individually specified. 
    # + return - Successful response 
    remote isolated function getgoogleupdatedAccountsLocationsLodging(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? readMask = ()) returns GetGoogleUpdatedLodgingResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:getGoogleUpdated`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "readMask": readMask};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetGoogleUpdatedLodgingResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the Google-updated version of the specified location. Returns `NOT_FOUND` if the location does not exist.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the location to fetch. 
    # + return - Successful response 
    remote isolated function getgoogleupdatedAccountsLocations(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleUpdatedLocation|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:googleUpdated`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleUpdatedLocation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List all the GoogleLocations that have been recommended to the specified GMB account. Recommendations are provided for personal accounts and location groups only, requests for all other account types will result in an error. The recommendations for location groups are based on the locations in that group. The recommendations for personal accounts are based on all of the locations that the user has access to on Google My Business (which includes locations they can access through location groups), and is a superset of all recommendations generated for the user.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Name of the account resource to fetch recommended Google locations for. 
    # + pageSize - How many locations to fetch per page. Default is 25, minimum is 1, and maximum page size is 100. 
    # + pageToken - If specified, the next page of locations is retrieved. 
    # + return - Successful response 
    remote isolated function listrecommendgooglelocationsAccounts(string name, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListRecommendedGoogleLocationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:recommendGoogleLocations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListRecommendedGoogleLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Report a GoogleLocation.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Resource name of a [GoogleLocation], in the format `googleLocations/{googleLocationId}`. 
    # + payload - ReportGoogleLocation request 
    # + return - Successful response 
    remote isolated function reportGooglelocations(string name, ReportGoogleLocationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:report`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Moves a location from an account that the user owns to another account that the same user administers. The user must be an owner of the account the location is currently associated with and must also be at least a manager of the destination account. Returns the Location with its new resource name.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the location to transfer. 
    # + payload - TransferLocation request 
    # + return - Successful response 
    remote isolated function transferAccountsLocations(string name, TransferLocationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Location|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:transfer`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Location response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts the verification process for a location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Resource name of the location to verify. 
    # + payload - VerifyLocation request 
    # + return - Successful response 
    remote isolated function verifyAccountsLocations(string name, VerifyLocationRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns VerifyLocationResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(name)}:verify`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifyLocationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists all of the admins for the specified location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location to list admins of. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsAdmins(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ListLocationAdminsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/admins`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListLocationAdminsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Invites the specified user to become an administrator for the specified location. The invitee must accept the invitation in order to be granted access to the location. See AcceptInvitation to programmatically accept an invitation.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The resource name of the location this admin is created for. 
    # + payload - Admin request 
    # + return - Successful response 
    remote isolated function createAccountsLocationsAdmins(string parent, Admin payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Admin|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/admins`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Admin response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the paginated list of answers for a specified question.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the question to fetch answers for. 
    # + orderBy - The order to return the answers. Valid options include 'update_time desc' and 'upvote_count desc', which will return the answers sorted descendingly by the requested field. The default sort order is 'update_time desc'. 
    # + pageSize - How many answers to fetch per page. The default and maximum `page_size` values are 10. 
    # + pageToken - If specified, the next page of answers is retrieved. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsQuestionsAnswers(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? orderBy = (), int? pageSize = (), string? pageToken = ()) returns ListAnswersResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/answers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "orderBy": orderBy, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListAnswersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the answer written by the current user to a question.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the question to delete an answer for. 
    # + return - Successful response 
    remote isolated function deleteAccountsLocationsQuestionsAnswers(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/answers:delete`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Creates an answer or updates the existing answer written by the user for the specified question. A user can only create one answer per question.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the question to write an answer for. 
    # + payload - UpsertAnswer request 
    # + return - Successful response 
    remote isolated function upsertAccountsLocationsQuestionsAnswers(string parent, UpsertAnswerRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Answer|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/answers:upsert`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Answer response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of all insurance networks supported by Google.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The name of the location whose insurance networks will be listed. The name is in the form: accounts/{account_id}/locations/{location_id} 
    # + languageCode - Optional. The BCP 47 code for the language. If a language code is not provided, it defaults to English. Right now only 'en' is supported. 
    # + pageSize - How many insurance networks to return per page. The default value is 5000. Maximum page size is 10000. 
    # + pageToken - If specified, returns the next page of insurance networks. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsInsurancenetworks(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? languageCode = (), int? pageSize = (), string? pageToken = ()) returns ListInsuranceNetworksResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/insuranceNetworks`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "languageCode": languageCode, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListInsuranceNetworksResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists pending invitations for the specified account.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the account from which the list of invitations is being retrieved. 
    # + targetType - Specifies which target types should appear in the response. 
    # + return - Successful response 
    remote isolated function listAccountsInvitations(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? targetType = ()) returns ListInvitationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/invitations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "targetType": targetType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListInvitationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of local posts associated with a location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location whose local posts will be listed. 
    # + pageSize - How many local posts to return per page. Default of 20. The minimum is 1, and maximum page size is 100. 
    # + pageToken - If specified, returns the next page of local posts. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsLocalposts(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListLocalPostsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/localPosts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListLocalPostsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new local post associated with the specified location, and returns it.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location in which to create this local post. 
    # + payload - LocalPost request 
    # + return - Successful response 
    remote isolated function createAccountsLocationsLocalposts(string parent, LocalPost payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns LocalPost|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/localPosts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LocalPost response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists the locations for the specified account.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the account to fetch locations from. If the Account is of AccountType PERSONAL, only Locations that are directly owned by the Account are returned, otherwise it will return all accessible locations from the Account, either directly or indirectly. 
    # + filter - A filter constraining the locations to return. The response includes only entries that match the filter. If `filter` is empty, then constraints are applied and all locations (paginated) are retrieved for the requested account. For more information about valid fields and example usage, see [Work with Location Data Guide](https://developers.google.com/my-business/content/location-data#filter_results_when_you_list_locations). 
    # + languageCode - The BCP 47 code of language to get display location properties in. If this language is not available, they will be provided in the language of the location. If neither is available, they will be provided in English. Deprecated. After August 15th, 2020, this field will no longer be applied. Instead, the language of the location will always be used. 
    # + orderBy - Sorting order for the request. Multiple fields should be comma-separated, following SQL syntax. The default sorting order is ascending. To specify descending order, a suffix " desc" should be added. Valid fields to order_by are location_name and store_code. For example: "location_name, store_code desc" or "location_name" or "store_code desc" 
    # + pageSize - How many locations to fetch per page. Default is 100, minimum is 1, and maximum page size is 100. 
    # + pageToken - If specified, it fetches the next `page` of locations. The page token is returned by previous calls to `ListLocations` when there were more locations than could fit in the requested page size. 
    # + return - Successful response 
    remote isolated function listAccountsLocations(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), string? languageCode = (), string? orderBy = (), int? pageSize = (), string? pageToken = ()) returns ListLocationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/locations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "languageCode": languageCode, "orderBy": orderBy, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new location owned by the specified account, and returns it.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the account in which to create this location. 
    # + requestId - A unique request ID for the server to detect duplicated requests. We recommend using UUIDs. Max length is 50 characters. 
    # + validateOnly - If true, the request is validated without actually creating the location. 
    # + payload - Location request 
    # + return - Successful response 
    remote isolated function createAccountsLocations(string parent, Location payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? requestId = (), boolean? validateOnly = ()) returns Location|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/locations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "requestId": requestId, "validateOnly": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Location response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of media items associated with a location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location whose media items will be listed. 
    # + pageSize - How many media items to return per page. The default value is 100, which is also the maximum supported number of media items able to be added to a location with the My Business API. Maximum page size is 2500. 
    # + pageToken - If specified, returns the next page of media items. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsMedia(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListMediaItemsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/media`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListMediaItemsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new media item for the location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The resource name of the location where this media item will be created. 
    # + payload - MediaItem request 
    # + return - Successful response 
    remote isolated function createAccountsLocationsMedia(string parent, MediaItem payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns MediaItem|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/media`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MediaItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns a list of media items associated with a location that have been contributed by customers.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location whose customer media items will be listed. 
    # + pageSize - How many media items to return per page. The default value is 100, the maximum supported page size is 200. 
    # + pageToken - If specified, returns the next page of media items. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsMediaCustomers(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListCustomerMediaItemsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/media/customers`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListCustomerMediaItemsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Generates a `MediaItemDataRef` for media item uploading.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The resource name of the location this media item is to be added to. 
    # + payload - StartUploadMediaItemData request 
    # + return - Successful response 
    remote isolated function startuploadAccountsLocationsMedia(string parent, StartUploadMediaItemDataRequest payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns MediaItemDataRef|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/media:startUpload`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MediaItemDataRef response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the paginated list of questions and some of its answers for a specified location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location to fetch questions for. 
    # + answersPerQuestion - How many answers to fetch per question. The default and maximum `answers_per_question` values are 10. 
    # + filter - A filter constraining the questions to return. The only filter currently supported is "ignore_answered=true" 
    # + orderBy - The order to return the questions. Valid options include 'update_time desc' and 'upvote_count desc', which will return the questions sorted descendingly by the requested field. The default sort order is 'update_time desc'. 
    # + pageSize - How many questions to fetch per page. The default and maximum `page_size` values are 10. 
    # + pageToken - If specified, the next page of questions is retrieved. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsQuestions(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? answersPerQuestion = (), string? filter = (), string? orderBy = (), int? pageSize = (), string? pageToken = ()) returns ListQuestionsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/questions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "answersPerQuestion": answersPerQuestion, "filter": filter, "orderBy": orderBy, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListQuestionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a question for the specified location.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location to write a question for. 
    # + payload - Question request 
    # + return - Successful response 
    remote isolated function createAccountsLocationsQuestions(string parent, Question payload, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Question|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/questions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Question response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns the paginated list of reviews for the specified location. This operation is only valid if the specified location is verified.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - The name of the location to fetch reviews for. 
    # + orderBy - Specifies the field to sort reviews by. If unspecified, the order of reviews returned will default to `update_time desc`. Valid orders to sort by are `rating`, `rating desc` and `update_time desc`. 
    # + pageSize - How many reviews to fetch per page. The maximum `page_size` is 50. 
    # + pageToken - If specified, it fetches the next page of reviews. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsReviews(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? orderBy = (), int? pageSize = (), string? pageToken = ()) returns ListReviewsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/reviews`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "orderBy": orderBy, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListReviewsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List verifications of a location, ordered by create time.
    #
    # + xgafv - V1 error format. 
    # + accessToken - OAuth access token. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + 'key - API key. Your API key identifies your project and provides you with API access, quota, and reports. Required unless you provide an OAuth 2.0 token. 
    # + oauthToken - OAuth 2.0 token for the current user. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Resource name of the location that verification requests belong to. 
    # + pageSize - How many verification to include per page. If not set, return all. 
    # + pageToken - If specified, returns the next page of verifications. 
    # + return - Successful response 
    remote isolated function listAccountsLocationsVerifications(string parent, string? xgafv = (), string? accessToken = (), string? alt = (), string? callback = (), string? fields = (), string? 'key = (), string? oauthToken = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListVerificationsResponse|error {
        string resourcePath = string `/v4/${getEncodedUri(parent)}/verifications`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "access_token": accessToken, "alt": alt, "callback": callback, "fields": fields, "key": 'key, "oauth_token": oauthToken, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListVerificationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
