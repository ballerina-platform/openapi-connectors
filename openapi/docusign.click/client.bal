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
    string refreshUrl = "https://account-d.docusign.com/oauth/token";
|};

# This is a generated connector for [DocuSign Click API](https://developers.docusign.com/docs/click-api/) OpenAPI specification. DocuSign Click lets you capture consent to standard agreement terms with a single click terms and conditions, terms of service, terms of use, privacy policies, and more. The Click API lets you include this customizable clickwrap solution in your DocuSign integrations.
@display {label: "DocuSign Click", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [DocuSign account](https://www.docusign.com/) and obtain tokens by following [this guide](https://developers.docusign.com/docs/click-api/click101/auth/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://www.docusign.net/clickapi") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Gets the current version and other information about the Click API.
    #
    # + return - Successful response. 
    remote isolated function getServiceInformation() returns ServiceInformation|error {
        string resourcePath = string `/service_information`;
        ServiceInformation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all the clickwraps for an account.
    #
    # + accountId - A GUID that identifies your account. 
    # + fromDate - Optional. The earliest date to return agreements from. 
    # + ownerUserId - Optional. The user ID of the owner. 
    # + pageNumber - Optional. The page number to return. 
    # + status - Optional. The status of the clickwraps to filter by. One of: - `active` - `inactive` 
    # + toDate - Optional. The latest date to return agreements from. 
    # + return - Successful response. 
    remote isolated function getClickwraps(string accountId, string? fromDate = (), string? ownerUserId = (), string? pageNumber = (), string? status = (), string? toDate = ()) returns ClickwrapVersionsResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps`;
        map<anydata> queryParam = {"from_date": fromDate, "ownerUserId": ownerUserId, "page_number": pageNumber, "status": status, "to_date": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapVersionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a clickwrap for an account.
    #
    # + accountId - A GUID that identifies your account. 
    # + payload - Request body for working with clickwrap. 
    # + return - Successful response. 
    remote isolated function postClickwrap(string accountId, ClickwrapRequest payload) returns ClickwrapVersionSummaryResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapVersionSummaryResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes clickwraps for an account.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapIds - A comma-separated list of clickwrap IDs to delete. 
    # + return - Successful response. 
    remote isolated function deleteClickwraps(string accountId, string? clickwrapIds = ()) returns ClickwrapsDeleteResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps`;
        map<anydata> queryParam = {"clickwrapIds": clickwrapIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapsDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a  single clickwrap object.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + return - Successful response. 
    remote isolated function getClickwrap(string accountId, string clickwrapId) returns ClickwrapVersionResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}`;
        ClickwrapVersionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the user ID of a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + payload - Clieckwrap transfer payload 
    # + return - Successful response. 
    remote isolated function putClickwrap(string accountId, string clickwrapId, ClickwrapTransferRequest payload) returns ClickwrapVersionSummaryResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapVersionSummaryResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a clickwrap and all of its versions.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + versions - A comma-separated list of versions to delete. 
    # + return - Successful response. 
    remote isolated function deleteClickwrap(string accountId, string clickwrapId, string? versions = ()) returns ClickwrapVersionsDeleteResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}`;
        map<anydata> queryParam = {"versions": versions};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapVersionsDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Checks if a user has agreed to a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + payload - User agreement payload 
    # + return - Successful response. 
    remote isolated function checkIfUserHasAgreed(string accountId, string clickwrapId, UserAgreementRequest payload) returns UserAgreementResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/agreements`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserAgreementResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a specific agreement for a specified clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + agreementId - The agreement ID. 
    # + clickwrapId - The ID of the clickwrap. 
    # + return - Successful response. 
    remote isolated function getUserAgreement(string accountId, string agreementId, string clickwrapId) returns UserAgreementResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/agreements/${getEncodedUri(agreementId)}`;
        UserAgreementResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the completed user agreement PDF.
    #
    # + accountId - A GUID that identifies your account. 
    # + agreementId - The agreement ID. 
    # + clickwrapId - The ID of the clickwrap. 
    # + return - Successful response. 
    remote isolated function getAgreementPdf(string accountId, string agreementId, string clickwrapId) returns http:Response|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/agreements/${getEncodedUri(agreementId)}/download`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user agreements
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + clientUserId - The client ID. 
    # + fromDate - Optional. The earliest date to return agreements from. 
    # + pageNumber - Optional. The page number to return. 
    # + status - Optional. The status of the clickwraps to return. 
    # + toDate - Optional. The latest date to return agreements from. 
    # + return - Successful response. 
    remote isolated function getClickwrapAgreements(string accountId, string clickwrapId, string? clientUserId = (), string? fromDate = (), string? pageNumber = (), string? status = (), string? toDate = ()) returns ClickwrapAgreementsResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/users`;
        map<anydata> queryParam = {"client_user_id": clientUserId, "from_date": fromDate, "page_number": pageNumber, "status": status, "to_date": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapAgreementsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new clickwrap version.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + payload - Request body for working with clickwrap. 
    # + return - Successful response. 
    remote isolated function createClickwrapVersion(string accountId, string clickwrapId, ClickwrapRequest payload) returns ClickwrapVersionSummaryResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapVersionSummaryResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes the versions of a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + clickwrapVersionIds - A comma-separated list of clickwrap version IDs to delete. 
    # + return - Successful response. 
    remote isolated function deleteClickwrapVersions(string accountId, string clickwrapId, string? clickwrapVersionIds = ()) returns ClickwrapVersionsDeleteResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions`;
        map<anydata> queryParam = {"clickwrapVersionIds": clickwrapVersionIds};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapVersionsDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a specific version from a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + versionId - The ID of the version. 
    # + return - Successful response. 
    remote isolated function getClickwrapVersion(string accountId, string clickwrapId, string versionId) returns ClickwrapVersionResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions/${getEncodedUri(versionId)}`;
        ClickwrapVersionResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a specific version of a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + versionId - The ID of the version. 
    # + payload - Request body for working with clickwrap. 
    # + return - Successful response. 
    remote isolated function updateClickwrapVersion(string accountId, string clickwrapId, string versionId, ClickwrapRequest payload) returns ClickwrapVersionSummaryResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions/${getEncodedUri(versionId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClickwrapVersionSummaryResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a specific version of a clickwrap.
    #
    # + accountId - A GUID that identifies your account. 
    # + clickwrapId - The ID of the clickwrap. 
    # + versionId - The ID of the version. 
    # + return - Successful response. 
    remote isolated function deleteClickwrapVersion(string accountId, string clickwrapId, string versionId) returns ClickwrapVersionDeleteResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions/${getEncodedUri(versionId)}`;
        ClickwrapVersionDeleteResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the agreement responses for a clickwrap version.
    #
    # + accountId - A GUID that identifies your account. This value is automatically generated by DocuSign for any account you create. Copy the value from the **API Account ID** field in the **API and Keys** page in eSignature Settings. 
    # + clickwrapId - The ID of the clickwrap. 
    # + versionId - The ID of the version. 
    # + clientUserId - Client user ID. 
    # + fromDate - Optional. The earliest date to return agreements from. 
    # + pageNumber - Optional. The page number to return. 
    # + status - Clickwrap status. Possible values: - `active` - `inactive` - `deleted` 
    # + toDate - Optional. The latest date to return agreements from. 
    # + return - Successful response. 
    remote isolated function getClickwrapVersionUserAgreements(string accountId, string clickwrapId, string versionId, string? clientUserId = (), string? fromDate = (), string? pageNumber = (), string? status = (), string? toDate = ()) returns ClickwrapAgreementsResponse|error {
        string resourcePath = string `/v1/accounts/${getEncodedUri(accountId)}/clickwraps/${getEncodedUri(clickwrapId)}/versions/${getEncodedUri(versionId)}/users`;
        map<anydata> queryParam = {"client_user_id": clientUserId, "from_date": fromDate, "page_number": pageNumber, "status": status, "to_date": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ClickwrapAgreementsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
