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

# This is a generated connector for [Google Vault API v1](https://developers.google.com/vault/reference/rest) OpenAPI specification.
# The Google Vault API provides the capability to do Retention and eDiscovery for Google Workspace. 
# To work with Vault resources, the account must have the [required Vault privileges](https://support.google.com/vault/answer/2799699) and access to the matter. 
# To access a matter, the account must have created the matter, have the matter shared with them, or have the **View All Matters** privilege.
# For example, to download an export, an account needs the **Manage Exports** privilege and the matter shared with them.
@display {label: "Googleapis Vault", iconPath: "resources/googleapis.vault.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google Workspace account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://vault.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists matters the requestor has access to.
    #
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The number of matters to return in the response. Default and maximum are 100.
    # + pageToken - The pagination token as returned in the response.
    # + state - If set, lists only matters with the specified state. The default lists matters of all states.
    # + view - Specifies how much information about the matter to return in response.
    # + return - Successful response
    remote isolated function listMatters(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? state = (), string? view = ()) returns ListMattersResponse|error {
        string  path = string `/v1/matters`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "state": state, "view": view};
        path = path + check getPathForQueryParam(queryParam);
        ListMattersResponse response = check self.clientEp-> get(path, targetType = ListMattersResponse);
        return response;
    }
    # Creates a matter with the given name and description. The initial state is open, and the owner is the method caller. Returns the created matter with default view.
    #
    # + payload - Matter to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createVaultMatter(Matter payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Matter|error {
        string  path = string `/v1/matters`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Matter response = check self.clientEp->post(path, request, targetType=Matter);
        return response;
    }
    # Gets the specified matter.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + view - Specifies how much information about the matter to return in the response.
    # + return - Successful response
    remote isolated function getMatter(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? view = ()) returns Matter|error {
        string  path = string `/v1/matters/${matterId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "view": view};
        path = path + check getPathForQueryParam(queryParam);
        Matter response = check self.clientEp-> get(path, targetType = Matter);
        return response;
    }
    #
    # + matterId - The matter ID.
    # + payload - Matter to be updated
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updateMatter(string matterId, Matter payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Matter|error {
        string  path = string `/v1/matters/${matterId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Matter response = check self.clientEp->put(path, request, targetType=Matter);
        return response;
    }
    # Deletes the specified matter. Returns the matter with updated state.
    #
    # + matterId - The matter ID
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteMatter(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Matter|error {
        string  path = string `/v1/matters/${matterId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Matter response = check self.clientEp-> delete(path, request, targetType = Matter);
        return response;
    }
    # Lists details about the exports in the specified matter.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The number of exports to return in the response.
    # + pageToken - The pagination token as returned in the response.
    # + return - Successful response
    remote isolated function listExports(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListExportsResponse|error {
        string  path = string `/v1/matters/${matterId}/exports`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListExportsResponse response = check self.clientEp-> get(path, targetType = ListExportsResponse);
        return response;
    }
    # Creates an export.
    #
    # + matterId - The matter ID.
    # + payload - Export to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createExport(string matterId, Export payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Export|error {
        string  path = string `/v1/matters/${matterId}/exports`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Export response = check self.clientEp->post(path, request, targetType=Export);
        return response;
    }
    # Gets an export.
    #
    # + matterId - The matter ID.
    # + exportId - The export ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getExport(string matterId, string exportId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Export|error {
        string  path = string `/v1/matters/${matterId}/exports/${exportId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        Export response = check self.clientEp-> get(path, targetType = Export);
        return response;
    }
    # Deletes an export.
    #
    # + matterId - The matter ID.
    # + exportId - The export ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteExport(string matterId, string exportId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/matters/${matterId}/exports/${exportId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Lists the holds in a matter.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The number of holds to return in the response, between 0 and 100 inclusive. Leaving this empty, or as 0, is the same as **page_size** = 100.
    # + pageToken - The pagination token as returned in the response. An empty token means start from the beginning.
    # + view - The amount of detail to return for a hold.
    # + return - Successful response
    remote isolated function listHolds(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? view = ()) returns ListHoldsResponse|error {
        string  path = string `/v1/matters/${matterId}/holds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "view": view};
        path = path + check getPathForQueryParam(queryParam);
        ListHoldsResponse response = check self.clientEp-> get(path, targetType = ListHoldsResponse);
        return response;
    }
    # Creates a hold in the specified matter.
    #
    # + matterId - The matter ID.
    # + payload - Hold to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createHold(string matterId, Hold payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Hold|error {
        string  path = string `/v1/matters/${matterId}/holds`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Hold response = check self.clientEp->post(path, request, targetType=Hold);
        return response;
    }
    # Gets the specified hold.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + view - The amount of detail to return for a hold.
    # + return - Successful response
    remote isolated function getHold(string matterId, string holdId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? view = ()) returns Hold|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "view": view};
        path = path + check getPathForQueryParam(queryParam);
        Hold response = check self.clientEp-> get(path, targetType = Hold);
        return response;
    }
    # Updates the scope (organizational unit or accounts) and query parameters of a hold. You cannot add accounts to a hold that covers an organizational unit, nor can you add organizational units to a hold that covers individual accounts. If you try, the unsupported values are ignored.
    #
    # + matterId - The matter ID.
    # + holdId - The ID of the hold.
    # + payload - Hold to be updated
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function updateHold(string matterId, string holdId, Hold payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Hold|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Hold response = check self.clientEp->put(path, request, targetType=Hold);
        return response;
    }
    # Removes the specified hold and releases the accounts or organizational unit covered by the hold. If the data is not preserved by another hold or retention rule, it might be purged.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteHold(string matterId, string holdId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Lists the accounts covered by a hold. This can list only individually-specified accounts covered by the hold. If the hold covers an organizational unit, use the [Admin SDK](https://developers.google.com/admin-sdk/). to list the members of the organizational unit on hold.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function listAccounts(string matterId, string holdId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ListHeldAccountsResponse|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        ListHeldAccountsResponse response = check self.clientEp-> get(path, targetType = ListHeldAccountsResponse);
        return response;
    }
    # Adds an account to a hold. Accounts can be added only to a hold that does not have an organizational unit set. If you try to add an account to an organizational unit-based hold, an error is returned.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + payload - Account to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createAccount(string matterId, string holdId, HeldAccount payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns HeldAccount|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}/accounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HeldAccount response = check self.clientEp->post(path, request, targetType=HeldAccount);
        return response;
    }
    # Removes an account from a hold.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + accountId - The ID of the account to remove from the hold.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteAccount(string matterId, string holdId, string accountId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}/accounts/${accountId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Adds accounts to a hold. Returns a list of accounts that have been successfully added. Accounts can be added only to an existing account-based hold.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + payload - Account to be created
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function addHeldAccount(string matterId, string holdId, AddHeldAccountsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns AddHeldAccountsResponse|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}:addHeldAccounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddHeldAccountsResponse response = check self.clientEp->post(path, request, targetType=AddHeldAccountsResponse);
        return response;
    }
    # Removes the specified accounts from a hold. Returns a list of statuses in the same order as the request.
    #
    # + matterId - The matter ID.
    # + holdId - The hold ID.
    # + payload - Account to be removed
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function removeHeldAccount(string matterId, string holdId, RemoveHeldAccountsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns RemoveHeldAccountsResponse|error {
        string  path = string `/v1/matters/${matterId}/holds/${holdId}:removeHeldAccounts`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoveHeldAccountsResponse response = check self.clientEp->post(path, request, targetType=RemoveHeldAccountsResponse);
        return response;
    }
    # Lists the saved queries in a matter.
    #
    # + matterId - The ID of the matter to get the saved queries for.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + pageSize - The maximum number of saved queries to return.
    # + pageToken - The pagination token as returned in the previous response. An empty token means start from the beginning.
    # + return - Successful response
    remote isolated function listSavedQueries(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListSavedQueriesResponse|error {
        string  path = string `/v1/matters/${matterId}/savedQueries`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListSavedQueriesResponse response = check self.clientEp-> get(path, targetType = ListSavedQueriesResponse);
        return response;
    }
    # Creates a saved query.
    #
    # + matterId - The ID of the matter to create the saved query in.
    # + payload - Query
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function createSavedQueries(string matterId, SavedQuery payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns SavedQuery|error {
        string  path = string `/v1/matters/${matterId}/savedQueries`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SavedQuery response = check self.clientEp->post(path, request, targetType=SavedQuery);
        return response;
    }
    # Retrieves the specified saved query.
    #
    # + matterId - The ID of the matter to get the saved query from.
    # + savedQueryId - ID of the saved query to retrieve.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function getSavedQueries(string matterId, string savedQueryId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns SavedQuery|error {
        string  path = string `/v1/matters/${matterId}/savedQueries/${savedQueryId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        SavedQuery response = check self.clientEp-> get(path, targetType = SavedQuery);
        return response;
    }
    # Deletes the specified saved query.
    #
    # + matterId - The ID of the matter to delete the saved query from.
    # + savedQueryId - ID of the saved query to delete.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function deleteSavedQueries(string matterId, string savedQueryId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/matters/${matterId}/savedQueries/${savedQueryId}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Adds an account as a matter collaborator.
    #
    # + matterId - The matter ID.
    # + payload - Account to be added
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function addVaultPermission(string matterId, AddMatterPermissionsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns MatterPermission|error {
        string  path = string `/v1/matters/${matterId}:addPermissions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MatterPermission response = check self.clientEp->post(path, request, targetType=MatterPermission);
        return response;
    }
    # Closes the specified matter. Returns the matter with updated state.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function closeMatter(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns CloseMatterResponse|error {
        string  path = string `/v1/matters/${matterId}:close`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        CloseMatterResponse response = check self.clientEp-> post(path, request, targetType = CloseMatterResponse);
        return response;
    }
    # Counts the accounts processed by the specified query.
    #
    # + matterId - The matter ID.
    # + payload - Accounts to be counted
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function countMatters(string matterId, CountArtifactsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string  path = string `/v1/matters/${matterId}:count`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Operation response = check self.clientEp->post(path, request, targetType=Operation);
        return response;
    }
    # Removes an account as a matter collaborator.
    #
    # + matterId - The matter ID.
    # + payload - Account to be removed
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function removeMatterPermission(string matterId, RemoveMatterPermissionsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/matters/${matterId}:removePermissions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Reopens the specified matter. Returns the matter with updated state.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function reopenMatter(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns ReopenMatterResponse|error {
        string  path = string `/v1/matters/${matterId}:reopen`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        ReopenMatterResponse response = check self.clientEp-> post(path, request, targetType = ReopenMatterResponse);
        return response;
    }
    # Undeletes the specified matter. Returns the matter with updated state.
    #
    # + matterId - The matter ID.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function undeleteMatter(string matterId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Matter|error {
        string  path = string `/v1/matters/${matterId}:undelete`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        Matter response = check self.clientEp-> post(path, request, targetType = Matter);
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
    remote isolated function listVaultOperations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns ListOperationsResponse|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        path = path + check getPathForQueryParam(queryParam);
        ListOperationsResponse response = check self.clientEp-> get(path, targetType = ListOperationsResponse);
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
    remote isolated function deleteVaultOperation(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/${name}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.
    #
    # + name - The name of the operation resource to be cancelled.
    # + xgafv - V1 error format.
    # + alt - Data format for response.
    # + callback - JSONP
    # + fields - Selector specifying which fields to include in a partial response.
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters.
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart").
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart").
    # + return - Successful response
    remote isolated function cancelVaultOperation(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string  path = string `/v1/${name}:cancel`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
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
