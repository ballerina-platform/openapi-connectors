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

# This is a generated connector for [Google BigQuery Data Transfer API v2.0](https://cloud.google.com/bigquery-transfer/docs/reference/datatransfer/rest) OpenAPI specification.
# The BigQuery Data Transfer API schedule queries or transfer external data from SaaS applications to Google BigQuery on a regular basis.
@display {label: "Google BigQuery Data Transfer", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [google account](https://accounts.google.com/signup) and obtain tokens following [this guide](https://developers.google.com/identity/protocols/oauth2)
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://bigquerydatatransfer.googleapis.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
    # Returns information about the particular transfer run.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The field will contain name of the resource requested, for example: `projects/{project_id}/transferConfigs/{config_id}/runs/{run_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}/runs/{run_id}` 
    # + return - Successful response 
    remote isolated function getTransferRun(string name, string? xgafv = (), string? alt = (), string? callback = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns TransferRun|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TransferRun response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes the specified transfer run.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The field will contain name of the resource requested, for example: `projects/{project_id}/transferConfigs/{config_id}/runs/{run_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}/runs/{run_id}` 
    # + return - Successful response 
    remote isolated function deleteTransferRun(string name, string? xgafv = (), string? alt = (), string? callback = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates a data transfer configuration. All fields must be set, even if they are not updated.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The resource name of the transfer config. Transfer config names have the form `projects/{project_id}/locations/{region}/transferConfigs/{config_id}`. Where `config_id` is usually a uuid, even though it is not guaranteed or required. The name is ignored when creating a transfer config. 
    # + authorizationCode - Optional OAuth2 authorization code to use with this transfer configuration. If it is provided, the transfer configuration will be associated with the authorizing user. In order to obtain authorization_code, please make a request to https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=&scope=&redirect_uri= * client_id should be OAuth client_id of BigQuery DTS API for the given data source returned by ListDataSources method. * data_source_scopes are the scopes returned by ListDataSources method. * redirect_uri is an optional parameter. If not specified, then authorization code is posted to the opener of authorization flow window. Otherwise it will be sent to the redirect uri. A special value of urn:ietf:wg:oauth:2.0:oob means that authorization code should be returned in the title bar of the browser, with the page text prompting the user to copy the code and paste it in the application. 
    # + serviceAccountName - Optional service account name. If this field is set and "service_account_name" is set in update_mask, transfer config will be updated to use this service account credentials. It requires that requesting user calling this API has permissions to act as this service account. 
    # + updateMask - Required. Required list of fields to be updated in this request. 
    # + versionInfo - Optional version info. If users want to find a very recent access token, that is, immediately after approving access, users have to set the version_info claim in the token request. To obtain the version_info, users must use the "none+gsession" response type. which be return a version_info back in the authorization response which be be put in a JWT claim in the token request. 
    # + return - Successful response 
    remote isolated function updateTransferRun(string name, TransferConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? authorizationCode = (), string? serviceAccountName = (), string? updateMask = (), string? versionInfo = ()) returns TransferConfig|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "authorizationCode": authorizationCode, "serviceAccountName": serviceAccountName, "updateMask": updateMask, "versionInfo": versionInfo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferConfig response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Lists information about the supported locations for this service.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The resource that owns the locations collection, if applicable. 
    # + filter - A filter to narrow down results to a preferred subset. The filtering language accepts strings like "displayName=tokyo", and is documented in more detail in [AIP-160](https://google.aip.dev/160). 
    # + pageSize - The maximum number of results to return. If not set, the service selects a default. 
    # + pageToken - A page token received from the `next_page_token` field in the response. Send that page token to receive the subsequent page. 
    # + return - Successful response 
    remote isolated function listProjectLocations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListLocationsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}/locations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListLocationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns true if valid credentials exist for the given data source and requesting user. Some data sources doesn't support service account, so we need to talk to them on behalf of the end user. This API just checks whether we have OAuth token for the particular user, which is a pre-requisite before user can create a transfer config.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. The data source in the form: `projects/{project_id}/dataSources/{data_source_id}` or `projects/{project_id}/locations/{location_id}/dataSources/{data_source_id}`. 
    # + return - Successful response 
    remote isolated function checkValidCreds(string name, CheckValidCredsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns CheckValidCredsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(name)}:checkValidCreds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckValidCredsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists supported data sources and returns their settings, which can be used for UI rendering.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The BigQuery project id for which data sources should be returned. Must be in the form: `projects/{project_id}` or `projects/{project_id}/locations/{location_id} 
    # + pageSize - Page size. The default page size is the maximum value of 1000 results. 
    # + pageToken - Pagination token, which can be used to request a specific page of `ListDataSourcesRequest` list results. For multiple-page results, `ListDataSourcesResponse` outputs a `next_page` token, which can be used as the `page_token` value to request the next page of list results. 
    # + return - Successful response 
    remote isolated function listDataSources(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListDataSourcesResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/dataSources`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDataSourcesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information about running and completed jobs.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. Name of transfer configuration for which transfer runs should be retrieved. Format of transfer configuration resource name is: `projects/{project_id}/transferConfigs/{config_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}`. 
    # + pageSize - Page size. The default page size is the maximum value of 1000 results. 
    # + pageToken - Pagination token, which can be used to request a specific page of `ListTransferRunsRequest` list results. For multiple-page results, `ListTransferRunsResponse` outputs a `next_page` token, which can be used as the `page_token` value to request the next page of list results. 
    # + runAttempt - Indicates how run attempts are to be pulled. 
    # + states - When specified, only transfer runs with requested states are returned. 
    # + return - Successful response 
    remote isolated function listJobs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? runAttempt = (), string[]? states = ()) returns ListTransferRunsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/runs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "runAttempt": runAttempt, "states": states};
        map<Encoding> queryParamEncoding = {"states": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListTransferRunsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns information about all transfer configs owned by a project in the specified location.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The BigQuery project id for which data sources should be returned: `projects/{project_id}` or `projects/{project_id}/locations/{location_id}` 
    # + dataSourceIds - When specified, only configurations of requested data sources are returned. 
    # + pageSize - Page size. The default page size is the maximum value of 1000 results. 
    # + pageToken - Pagination token, which can be used to request a specific page of `ListTransfersRequest` list results. For multiple-page results, `ListTransfersResponse` outputs a `next_page` token, which can be used as the `page_token` value to request the next page of list results. 
    # + return - Successful response 
    remote isolated function listTransferConfigs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? dataSourceIds = (), int? pageSize = (), string? pageToken = ()) returns ListTransferConfigsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/transferConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dataSourceIds": dataSourceIds, "pageSize": pageSize, "pageToken": pageToken};
        map<Encoding> queryParamEncoding = {"dataSourceIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListTransferConfigsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new data transfer configuration.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The BigQuery project id where the transfer configuration should be created. Must be in the format projects/{project_id}/locations/{location_id} or projects/{project_id}. If specified location and location of the destination bigquery dataset do not match - the request will fail. 
    # + authorizationCode - Optional OAuth2 authorization code to use with this transfer configuration. This is required if new credentials are needed, as indicated by `CheckValidCreds`. In order to obtain authorization_code, please make a request to https://www.gstatic.com/bigquerydatatransfer/oauthz/auth?client_id=&scope=&redirect_uri= * client_id should be OAuth client_id of BigQuery DTS API for the given data source returned by ListDataSources method. * data_source_scopes are the scopes returned by ListDataSources method. * redirect_uri is an optional parameter. If not specified, then authorization code is posted to the opener of authorization flow window. Otherwise it will be sent to the redirect uri. A special value of urn:ietf:wg:oauth:2.0:oob means that authorization code should be returned in the title bar of the browser, with the page text prompting the user to copy the code and paste it in the application. 
    # + serviceAccountName - Optional service account name. If this field is set, transfer config will be created with this service account credentials. It requires that requesting user calling this API has permissions to act as this service account. 
    # + versionInfo - Optional version info. If users want to find a very recent access token, that is, immediately after approving access, users have to set the version_info claim in the token request. To obtain the version_info, users must use the "none+gsession" response type. which be return a version_info back in the authorization response which be be put in a JWT claim in the token request. 
    # + return - Successful response 
    remote isolated function createTransferConfigs(string parent, TransferConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? authorizationCode = (), string? serviceAccountName = (), string? versionInfo = ()) returns TransferConfig|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/transferConfigs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "authorizationCode": authorizationCode, "serviceAccountName": serviceAccountName, "versionInfo": versionInfo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TransferConfig response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Returns user facing log messages for the data transfer run.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. Transfer run name in the form: `projects/{project_id}/transferConfigs/{config_id}/runs/{run_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}/runs/{run_id}` 
    # + messageTypes - Message types to return. If not populated - INFO, WARNING and ERROR messages are returned. 
    # + pageSize - Page size. The default page size is the maximum value of 1000 results. 
    # + pageToken - Pagination token, which can be used to request a specific page of `ListTransferLogsRequest` list results. For multiple-page results, `ListTransferLogsResponse` outputs a `next_page` token, which can be used as the `page_token` value to request the next page of list results. 
    # + return - Successful response 
    remote isolated function getTransferLogs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string[]? messageTypes = (), int? pageSize = (), string? pageToken = ()) returns ListTransferLogsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}/transferLogs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "messageTypes": messageTypes, "pageSize": pageSize, "pageToken": pageToken};
        map<Encoding> queryParamEncoding = {"messageTypes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListTransferLogsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates transfer runs for a time range [start_time, end_time]. For each date - or whatever granularity the data source supports - in the range, one transfer run is created. Note that runs are created per UTC time in the time range. DEPRECATED: use StartManualTransferRuns instead.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. Transfer configuration name in the form: `projects/{project_id}/transferConfigs/{config_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}`. 
    # + return - Successful response 
    remote isolated function createScheduleRun(string parent, ScheduleTransferRunsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ScheduleTransferRunsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}:scheduleRuns`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScheduleTransferRunsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Start manual transfer runs to be executed now with schedule_time equal to current time. The transfer runs can be created for a time range where the run_time is between start_time (inclusive) and end_time (exclusive), or for a specific run_time.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Transfer configuration name in the form: `projects/{project_id}/transferConfigs/{config_id}` or `projects/{project_id}/locations/{location_id}/transferConfigs/{config_id}`. 
    # + return - Successful response 
    remote isolated function startManualRuns(string parent, StartManualTransferRunsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns StartManualTransferRunsResponse|error {
        string resourcePath = string `/v1/${getEncodedUri(parent)}:startManualRuns`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StartManualTransferRunsResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
