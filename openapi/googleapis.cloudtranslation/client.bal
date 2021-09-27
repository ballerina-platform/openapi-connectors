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

# This is a generated connector for [Google Cloud Translation API v3](https://cloud.google.com/translate/docs/quickstarts) OpenAPI specification.
# Integrates text translation into your website or application.
@display {label: "Googleapis Cloudtranslation", iconPath: "resources/googleapis.cloudtranslation.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://translation.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
    #
    # + name - The name of the operation resource.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getProjectsLocationsOperations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v3/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Operation response = check self.clientEp-> get(path, targetType = Operation);
        return response;
    }
    # Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.
    #
    # + name - The name of the operation resource to be deleted.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteProjectsLocationsOperations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v3/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Lists information about the supported locations for this service.
    #
    # + name - The resource that owns the locations collection, if applicable.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - A filter to narrow down results to a preferred subset. The filtering language accepts strings like "displayName=tokyo", and is documented in more detail in [AIP-160](https://google.aip.dev/160).
    # + pageSize - The maximum number of results to return. If not set, the service selects a default.
    # + pageToken - A page token received from the `next_page_token` field in the response. Send that page token to receive the subsequent page.
    # + return - Successful response
    remote isolated function listProjectsLocations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListLocationsResponse|error {
        string  path = string `/v3/${name}/locations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListLocationsResponse response = check self.clientEp-> get(path, targetType = ListLocationsResponse);
        return response;
    }
    # Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`. NOTE: the `name` binding allows API services to override the binding to use different resource name schemes, such as `users/*/operations`. To override the binding, API services can add a binding such as `"/v1/{name=users/*}/operations"` to their service configuration. For backwards compatibility, the default name includes the operations collection id, however overriding users must ensure the name binding is the parent resource, without the operations collection id.
    #
    # + name - The name of the operation's parent resource.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - The standard list filter.
    # + pageSize - The standard list page size.
    # + pageToken - The standard list page token.
    # + return - Successful response
    remote isolated function listProjectsLocationsOperations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListOperationsResponse|error {
        string  path = string `/v3/${name}/operations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListOperationsResponse response = check self.clientEp-> get(path, targetType = ListOperationsResponse);
        return response;
    }
    # Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    #
    # + name - The name of the operation resource to be cancelled.
    # + payload - CancelOperation request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function cancelProjectsLocationsOperations(string name, CancelOperationRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v3/${name}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Waits until the specified long-running operation is done or reaches at most a specified timeout, returning the latest state. If the operation is already done, the latest state is immediately returned. If the timeout specified is greater than the default HTTP/RPC timeout, the HTTP/RPC timeout is used. If the server does not support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Note that this method is on a best-effort basis. It may return the latest state before the specified timeout (including immediately), meaning even an immediate response is no guarantee that the operation is done.
    #
    # + name - The name of the operation resource to wait on.
    # + payload - WaitOperation request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function waitProjectsLocationsOperations(string name, WaitOperationRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v3/${name}:wait`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Lists glossaries in a project. Returns NOT_FOUND, if the project doesn't exist.
    #
    # + parent - Required. The name of the project from which to list all of the glossaries.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + filter - Optional. Filter specifying constraints of a list operation. Specify the constraint by the format of "key=value", where key must be "src" or "tgt", and the value must be a valid language code. For multiple restrictions, concatenate them by "AND" (uppercase only), such as: "src=en-US AND tgt=zh-CN". Notice that the exact match is used here, which means using 'en-US' and 'en' can lead to different results, which depends on the language code you used when you create the glossary. For the unidirectional glossaries, the "src" and "tgt" add restrictions on the source and target language code separately. For the equivalent term set glossaries, the "src" and/or "tgt" add restrictions on the term set. For example: "src=en-US AND tgt=zh-CN" will only pick the unidirectional glossaries which exactly match the source language code as "en-US" and the target language code "zh-CN", but all equivalent term set glossaries which contain "en-US" and "zh-CN" in their language set will be picked. If missing, no filtering is performed.
    # + pageSize - Optional. Requested page size. The server may return fewer glossaries than requested. If unspecified, the server picks an appropriate default.
    # + pageToken - Optional. A token identifying a page of results the server should return. Typically, this is the value of [ListGlossariesResponse.next_page_token] returned from the previous call to `ListGlossaries` method. The first page is returned if `page_token`is empty or missing.
    # + return - Successful response
    remote isolated function listProjectsLocationsGlossaries(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListGlossariesResponse|error {
        string  path = string `/v3/${parent}/glossaries`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListGlossariesResponse response = check self.clientEp-> get(path, targetType = ListGlossariesResponse);
        return response;
    }
    # Creates a glossary and returns the long-running operation. Returns NOT_FOUND, if the project doesn't exist.
    #
    # + parent - Required. The project name.
    # + payload - Glossary request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createProjectsLocationsGlossaries(string parent, Glossary payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v3/${parent}/glossaries`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Returns a list of supported languages for translation.
    #
    # + parent - Required. Project or location to make a call. Must refer to a caller's project. Format: `projects/{project-number-or-id}` or `projects/{project-number-or-id}/locations/{location-id}`. For global calls, use `projects/{project-number-or-id}/locations/global` or `projects/{project-number-or-id}`. Non-global location is required for AutoML models. Only models within the same region (have same location-id) can be used, otherwise an INVALID_ARGUMENT (400) error is returned.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + displayLanguageCode - Optional. The language to use to return localized, human readable names of supported languages. If missing, then display names are not returned in a response.
    # + model - Optional. Get supported languages of this model. The format depends on model type: - AutoML Translation models: `projects/{project-number-or-id}/locations/{location-id}/models/{model-id}` - General (built-in) models: `projects/{project-number-or-id}/locations/{location-id}/models/general/nmt`, Returns languages supported by the specified model. If missing, we get supported languages of Google general NMT model.
    # + return - Successful response
    remote isolated function getsupportedlanguagesProjectsLocations(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? displayLanguageCode = (), string? model = ()) returns SupportedLanguages|error {
        string  path = string `/v3/${parent}/supportedLanguages`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "displayLanguageCode": displayLanguageCode, "model": model};
        path = path + check getPathForQueryParam(queryParam);
        SupportedLanguages response = check self.clientEp-> get(path, targetType = SupportedLanguages);
        return response;
    }
    # Translates a large volume of text in asynchronous batch mode. This function provides real-time output as the inputs are being processed. If caller cancels a request, the partial results (for an input file, it's all or nothing) may still be available on the specified output location. This call returns immediately and you can use google.longrunning.Operation.name to poll the status of the call.
    #
    # + parent - Required. Location to make a call. Must refer to a caller's project. Format: `projects/{project-number-or-id}/locations/{location-id}`. The `global` location is not supported for batch translation. Only AutoML Translation models or glossaries within the same region (have the same location-id) can be used, otherwise an INVALID_ARGUMENT (400) error is returned.
    # + payload - BatchTranslateText request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function batchtranslatetextProjectsLocations(string parent, BatchTranslateTextRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v3/${parent}:batchTranslateText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Detects the language of text within a request.
    #
    # + parent - Required. Project or location to make a call. Must refer to a caller's project. Format: `projects/{project-number-or-id}/locations/{location-id}` or `projects/{project-number-or-id}`. For global calls, use `projects/{project-number-or-id}/locations/global` or `projects/{project-number-or-id}`. Only models within the same region (has same location-id) can be used. Otherwise an INVALID_ARGUMENT (400) error is returned.
    # + payload - DetectLanguage request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function detectlanguageProjectsLocations(string parent, DetectLanguageRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns DetectLanguageResponse|error {
        string  path = string `/v3/${parent}:detectLanguage`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DetectLanguageResponse response = check self.clientEp->post(path, request, targetType=DetectLanguageResponse);
        return response;
    }
    # Translates input text and returns translated text.
    #
    # + parent - Required. Project or location to make a call. Must refer to a caller's project. Format: `projects/{project-number-or-id}` or `projects/{project-number-or-id}/locations/{location-id}`. For global calls, use `projects/{project-number-or-id}/locations/global` or `projects/{project-number-or-id}`. Non-global location is required for requests using AutoML models or custom glossaries. Models and glossaries must be within the same region (have same location-id), otherwise an INVALID_ARGUMENT (400) error is returned.
    # + payload - TranslateText request
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function translatetextProjectsLocations(string parent, TranslateTextRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns TranslateTextResponse|error {
        string  path = string `/v3/${parent}:translateText`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TranslateTextResponse response = check self.clientEp->post(path, request, targetType=TranslateTextResponse);
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
