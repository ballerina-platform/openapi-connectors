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

# This is a generated connector for [Avalara AvaTax API v2](https://developer.avalara.com/api-reference/avatax/rest/v2/) OpenAPI specification.
# Avalara AvaTax is sales tax software that automates tax calculations and the tax filing process.
@display {label: "AvaTax", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Avalara account](https://buy.avalara.com/signup) and obtain tokens following [this guide](https://developer.avalara.com/avatax/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieve all accounts
    #
    # + include - A comma separated list of objects to fetch underneath this account.  Any object with a URL path underneath this account can be fetched by specifying its name. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptions, users 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryAccounts(string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountModelFetchResult|error {
        string resourcePath = string `/api/v2/accounts`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The account you wish to create. 
    # + return - Success 
    remote isolated function createAccount(AccountModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountModel[]|error {
        string resourcePath = string `/api/v2/accounts`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AccountModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single account
    #
    # + id - The ID of the account to retrieve 
    # + include - A comma separated list of special fetch options 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getAccount(int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single account
    #
    # + id - The ID of the account you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The account object you wish to update. 
    # + return - Success 
    remote isolated function updateAccount(int id, AccountModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AccountModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single account
    #
    # + id - The ID of the account you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteAccount(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Activate an account by accepting terms and conditions
    #
    # + id - The ID of the account to activate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The activation request 
    # + return - Success 
    remote isolated function activateAccount(int id, ActivateAccountModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/activate`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AccountModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve audit history for an account.
    #
    # + id - The ID of the account you wish to audit. 
    # + 'start - The start datetime of audit history you with to retrieve, e.g. "2018-06-08T17:00:00Z". Defaults to the past 15 minutes. 
    # + end - The end datetime of audit history you with to retrieve, e.g. "2018-06-08T17:15:00Z. Defaults to the current time. Maximum of an hour after the start time. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function auditAccount(int id, string? 'start = (), string? end = (), int top = 10, int skip = 0, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AuditModelFetchResult|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/audit`;
        map<anydata> queryParam = {"start": 'start, "end": end, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get configuration settings for this account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getAccountConfiguration(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountConfigurationModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/configuration`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountConfigurationModel[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change configuration settings for this account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function setAccountConfiguration(int id, AccountConfigurationModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountConfigurationModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/configuration`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AccountConfigurationModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create license key for this account
    #
    # + id - The ID of the account you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function createLicenseKey(int id, AccountLicenseKeyModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LicenseKeyModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/licensekey`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LicenseKeyModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve license key by license key name
    #
    # + id - The ID of the account to retrieve 
    # + licensekeyname - The ID of the account to retrieve 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLicenseKey(int id, string licensekeyname, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountLicenseKeyModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/licensekey/${getEncodedUri(licensekeyname)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLicenseKeyModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete license key for this account by license key name
    #
    # + id - The ID of the account you wish to update. 
    # + licensekeyname - The license key name you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteLicenseKey(int id, string licensekeyname, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/licensekey/${getEncodedUri(licensekeyname)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all license keys for this account
    #
    # + id - The ID of the account to retrieve 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLicenseKeys(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountLicenseKeyModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/licensekeys`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountLicenseKeyModel[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reset this account's license key
    #
    # + id - The ID of the account you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - A request confirming that you wish to reset the license key of this account. 
    # + return - Success 
    remote isolated function accountResetLicenseKey(int id, ResetLicenseKeyModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LicenseKeyModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/resetlicensekey`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LicenseKeyModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve geolocation information for a specified address
    #
    # + line1 - Line 1 
    # + line2 - Line 2 
    # + line3 - Line 3 
    # + city - City 
    # + region - State / Province / Region 
    # + postalCode - Postal Code / Zip Code 
    # + country - Two character ISO 3166 Country Code (see /api/v2/definitions/countries for a full list) 
    # + textCase - selectable text case for address validation 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function resolveAddress(string? line1 = (), string? line2 = (), string? line3 = (), string? city = (), string? region = (), string? postalCode = (), string? country = (), string? textCase = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AddressResolutionModel|error {
        string resourcePath = string `/api/v2/addresses/resolve`;
        map<anydata> queryParam = {"line1": line1, "line2": line2, "line3": line3, "city": city, "region": region, "postalCode": postalCode, "country": country, "textCase": textCase};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AddressResolutionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve geolocation information for a specified address
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The address to resolve 
    # + return - Success 
    remote isolated function resolveAddressPost(AddressValidationInfo payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AddressResolutionModel|error {
        string resourcePath = string `/api/v2/addresses/resolve`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AddressResolutionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get the lookup files for a company
    #
    # + accountId - The account ID for the company 
    # + companyId - The ID of the company for which to retrieve lookup files 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCompanyLookupFiles(int accountId, int companyId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AdvancedRuleLookupFileModelFetchResult|error {
        string resourcePath = string `/api/v2/advancedrules/accounts/${getEncodedUri(accountId)}/companies/${getEncodedUri(companyId)}/lookupFiles`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AdvancedRuleLookupFileModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lookup file for a company
    #
    # + accountId - The ID of the account for the company 
    # + companyId - The ID of the company for which the lookup file is to be created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The lookup file you wish to create 
    # + return - Success 
    remote isolated function createCompanyLookupFile(int accountId, int companyId, AdvancedRuleLookupFileModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AdvancedRuleLookupFileModel|error {
        string resourcePath = string `/api/v2/advancedrules/accounts/${getEncodedUri(accountId)}/companies/${getEncodedUri(companyId)}/lookupFiles`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AdvancedRuleLookupFileModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a lookup file for an accountId and companyLookupFileId
    #
    # + accountId - The ID of the account for the lookup file 
    # + id - The unique ID/GUID of the company lookup file to return 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLookupFile(int accountId, string id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AdvancedRuleLookupFileModel|error {
        string resourcePath = string `/api/v2/advancedrules/accounts/${getEncodedUri(accountId)}/lookupFiles/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AdvancedRuleLookupFileModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lookup file
    #
    # + accountId - The ID of the account for the company the lookup file is for 
    # + id - The unique ID/GUID of the company lookup file to be updated 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The new values to update the lookup file 
    # + return - Success 
    remote isolated function updateLookupFile(int accountId, string id, AdvancedRuleLookupFileModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AdvancedRuleLookupFileModel|error {
        string resourcePath = string `/api/v2/advancedrules/accounts/${getEncodedUri(accountId)}/lookupFiles/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AdvancedRuleLookupFileModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a lookup file
    #
    # + accountId - The ID of the account for the company the lookup file is for 
    # + id - The unique ID/GUID for the company lookup file to be deleted 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteLookupFile(int accountId, string id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/advancedrules/accounts/${getEncodedUri(accountId)}/lookupFiles/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all AvaFileForms
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* outletTypeId 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryAvaFileForms(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AvaFileFormModelFetchResult|error {
        string resourcePath = string `/api/v2/avafileforms`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AvaFileFormModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new AvaFileForm
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The AvaFileForm you wish to create. 
    # + return - Success 
    remote isolated function createAvaFileForms(AvaFileFormModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AvaFileFormModel[]|error {
        string resourcePath = string `/api/v2/avafileforms`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AvaFileFormModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single AvaFileForm
    #
    # + id - The primary key of this AvaFileForm 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getAvaFileForm(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AvaFileFormModel|error {
        string resourcePath = string `/api/v2/avafileforms/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AvaFileFormModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a AvaFileForm
    #
    # + id - The ID of the AvaFileForm you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The AvaFileForm model you wish to update. 
    # + return - Success 
    remote isolated function updateAvaFileForm(int id, AvaFileFormModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AvaFileFormModel|error {
        string resourcePath = string `/api/v2/avafileforms/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        AvaFileFormModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single AvaFileForm
    #
    # + id - The ID of the AvaFileForm you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteAvaFileForm(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/avafileforms/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all batches
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* files 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryBatches(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BatchModelFetchResult|error {
        string resourcePath = string `/api/v2/batches`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BatchModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all batches for this company
    #
    # + companyId - The ID of the company that owns these batches 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* files 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listBatchesByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BatchModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BatchModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new batch
    #
    # + companyId - The ID of the company that owns this batch. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The batch you wish to create. 
    # + return - Success 
    remote isolated function createBatches(int companyId, BatchModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BatchModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        BatchModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Download a single batch file
    #
    # + companyId - The ID of the company that owns this batch 
    # + batchId - The ID of the batch object 
    # + id - The primary key of this batch file object 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - OK 
    remote isolated function downloadBatch(int companyId, int batchId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches/${getEncodedUri(batchId)}/files/${getEncodedUri(id)}/attachment`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a single batch
    #
    # + companyId - The ID of the company that owns this batch 
    # + id - The primary key of this batch 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getBatch(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BatchModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BatchModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a single batch
    #
    # + companyId - The ID of the company that owns this batch. 
    # + id - The ID of the batch to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteBatch(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Cancel an in progress batch
    #
    # + companyId - The ID of the company that owns this batch. 
    # + id - The ID of the batch to cancel. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function cancelBatch(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BatchModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches/${getEncodedUri(id)}/cancel`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        BatchModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a new transaction batch
    #
    # + companyId - The ID of the company that owns this batch. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The transaction batch you wish to create. 
    # + return - Success 
    remote isolated function createTransactionBatch(int companyId, CreateTransactionBatchRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CreateTransactionBatchResponseModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/batches/transactions`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CreateTransactionBatchResponseModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List CertExpress invitations
    #
    # + companyId - The unique ID number of the company that issued this invitation 
    # + include - OPTIONAL: A comma separated list of special fetch options. No options are defined at this time. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* companyId, customer, coverLetter, exposureZones, exemptReasons, requestLink 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCertExpressInvitations(int companyId, string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertExpressInvitationModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certexpressinvites`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertExpressInvitationModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a CertExpress invitation
    #
    # + companyId - The unique ID number of the company that will record certificates 
    # + customerCode - The number of the customer where the request is sent to 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - the requests to send out to customers 
    # + return - Success 
    remote isolated function createCertExpressInvitation(int companyId, string customerCode, CreateCertExpressInvitationModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertExpressInvitationStatusModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certexpressinvites`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertExpressInvitationStatusModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single CertExpress invitation
    #
    # + companyId - The unique ID number of the company that issued this invitation 
    # + customerCode - The number of the customer where the request is sent to 
    # + id - The unique ID number of this CertExpress invitation 
    # + include - OPTIONAL: A comma separated list of special fetch options.  No options are defined at this time. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCertExpressInvitation(int companyId, string customerCode, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertExpressInvitationModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certexpressinvites/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertExpressInvitationModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all certificates for a company
    #
    # + companyId - The ID number of the company to search 
    # + include - OPTIONAL: A comma separated list of special fetch options.  You can specify one or more of the following: customers - Retrieves the list of customers linked to the certificate. po_numbers - Retrieves all PO numbers tied to the certificate. attributes - Retrieves all attributes applied to the certificate. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exemptionNumber, status, ecmsId, ecmsStatus, pdf, pages 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryCertificates(int companyId, string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create certificates for this company
    #
    # + companyId - The ID number of the company recording this certificate 
    # + prevalidatedexemptionreason - If set to true, the certificate will bypass the human verification process. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Certificates to be created 
    # + return - Success 
    remote isolated function createCertificates(int companyId, CertificateModel[] payload, boolean? prevalidatedexemptionreason = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates`;
        map<anydata> queryParam = {"$preValidatedExemptionReason": prevalidatedexemptionreason};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single certificate
    #
    # + companyId - The ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + include - OPTIONAL: A comma separated list of special fetch options.  You can specify one or more of the following: customers - Retrieves the list of customers linked to the certificate. po_numbers - Retrieves all PO numbers tied to the certificate. attributes - Retrieves all attributes applied to the certificate. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCertificate(int companyId, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single certificate
    #
    # + companyId - The ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The new certificate object that will replace the existing one 
    # + return - Success 
    remote isolated function updateCertificate(int companyId, int id, CertificateModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Revoke and delete a certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteCertificate(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Download an image for this certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + page - If you choose `$type`=`Jpeg`, you must specify which page number to retrieve. 
    # + 'type - The data format in which to retrieve the certificate image 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - OK 
    remote isolated function downloadCertificateImage(int companyId, int id, int? page = (), string 'type = "Pdf", string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/attachment`;
        map<anydata> queryParam = {"$page": page, "$type": 'type};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Upload an image or PDF attachment for this certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function uploadCertificateImage(int companyId, int id, IdAttachmentBody payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/attachment`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all attributes applied to this certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listAttributesForCertificate(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/attributes`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateAttributeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Link attributes to a certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of attributes to link to this certificate. 
    # + return - Success 
    remote isolated function linkAttributesToCertificate(int companyId, int id, CertificateAttributeModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/attributes/link`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateAttributeModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlink attributes from a certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of attributes to unlink from this certificate. 
    # + return - Success 
    remote isolated function unlinkAttributesFromCertificate(int companyId, int id, CertificateAttributeModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/attributes/unlink`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateAttributeModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List customers linked to this certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + include - OPTIONAL: A comma separated list of special fetch options. No options are currently available when fetching customers. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCustomersForCertificate(int companyId, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/customers`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Link customers to a certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of customers needed be added to the Certificate for exemption 
    # + return - Success 
    remote isolated function linkCustomersToCertificate(int companyId, int id, LinkCustomersModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/customers/link`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlink customers from a certificate
    #
    # + companyId - The unique ID number of the company that recorded this certificate 
    # + id - The unique ID number of this certificate 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of customers to unlink from this certificate 
    # + return - Success 
    remote isolated function unlinkCustomersFromCertificate(int companyId, int id, LinkCustomersModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/${getEncodedUri(id)}/customers/unlink`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check a company's exemption certificate status.
    #
    # + companyId - The company ID to check 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCertificateSetup(int companyId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ProvisionStatusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/setup`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProvisionStatusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request setup of exemption certificates for this company.
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function requestCertificateSetup(int companyId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ProvisionStatusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/certificates/setup`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProvisionStatusModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all companies
    #
    # + include - A comma separated list of objects to fetch underneath this company.  Any object with a URL path underneath this company can be fetched by specifying its name. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* IsFein, contacts, items, locations, nexus, settings, taxCodes, taxRules, upcs, nonReportingChildCompanies, exemptCerts, parameters, supplierandcustomers 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryCompanies(string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyModelFetchResult|error {
        string resourcePath = string `/api/v2/companies`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new companies
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Either a single company object or an array of companies to create 
    # + return - Success 
    remote isolated function createCompanies(CompanyModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyModel[]|error {
        string resourcePath = string `/api/v2/companies`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check the funding configuration of a company
    #
    # + companyId - The unique identifier of the company 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function fundingConfigurationByCompany(int companyId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingConfigurationModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/funding/configuration`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FundingConfigurationModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Check the funding configuration of a company
    #
    # + companyId - The unique identifier of the company 
    # + currency - The currency of the funding.  USD and CAD are the only valid currencies 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function fundingConfigurationsByCompanyAndCurrency(int companyId, string? currency = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingConfigurationModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/funding/configurations`;
        map<anydata> queryParam = {"currency": currency};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FundingConfigurationModel[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve parameters for a company
    #
    # + companyId - The company id 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCompanyParameterDetails(int companyId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyParameterDetailModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/parameters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyParameterDetailModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add parameters to a company.
    #
    # + companyId - The ID of the company that owns this company parameter. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The company parameters you wish to create. 
    # + return - Success 
    remote isolated function createCompanyParameters(int companyId, CompanyParameterDetailModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyParameterDetailModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyParameterDetailModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single company parameter
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCompanyParameterDetail(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyParameterDetailModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyParameterDetailModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a company parameter
    #
    # + companyId - The company id. 
    # + id - The company parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The company parameter object you wish to update. 
    # + return - Success 
    remote isolated function updateCompanyParameterDetail(int companyId, int id, CompanyParameterDetailModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyParameterDetailModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyParameterDetailModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single company parameter
    #
    # + companyId - The company id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteCompanyParameter(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a single company
    #
    # + id - The ID of the company to retrieve. 
    # + include - OPTIONAL: A comma separated list of special fetch options. Child objects - Specify one or more of the following to retrieve objects related to each company: "Contacts", "FilingCalendars", "Items", "Locations", "Nexus", "TaxCodes", "NonReportingChildren" or "TaxRules". Deleted objects - Specify "FetchDeleted" to retrieve information about previously deleted objects. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCompany(int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single company
    #
    # + id - The ID of the company you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The company object you wish to update. 
    # + return - Success 
    remote isolated function updateCompany(int id, CompanyModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single company
    #
    # + id - The ID of the company you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteCompany(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Checks whether the integration being used to set up this company and run transactions onto this company is compliant to all requirements.
    #
    # + id - The ID of the company to check if its integration is certified. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function certifyIntegration(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/certify`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get configuration settings for this company
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCompanyConfiguration(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyConfigurationModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/configuration`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyConfigurationModel[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change configuration settings for this company
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function setCompanyConfiguration(int id, CompanyConfigurationModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyConfigurationModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/configuration`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyConfigurationModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get this company's filing status
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getFilingStatus(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/filingstatus`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change the filing status of this company
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function changeFilingStatus(int id, FilingStatusChangeModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/filingstatus`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Check managed returns funding status for a company
    #
    # + id - The unique identifier of the company 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listFundingRequestsByCompany(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingStatusModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/funding`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FundingStatusModel[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request managed returns funding setup for a company
    #
    # + id - The unique identifier of the company 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The funding initialization request 
    # + return - Success 
    remote isolated function createFundingRequest(int id, FundingInitiateModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingStatusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(id)}/funding/setup`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FundingStatusModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Quick setup for a company with a single physical address
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information about the company you wish to create. 
    # + return - Success 
    remote isolated function companyInitialize(CompanyInitializationModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyModel|error {
        string resourcePath = string `/api/v2/companies/initialize`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a list of MRS Companies with account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listMrsCompanies(string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MrsCompanyModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/mrs`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MrsCompanyModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve jurisdiction rate information for tax authority
    #
    # + taxAuthorityId - Used to limit the jurisdictions returned. 
    # + effectiveDate - Used to limit the jurisdictions returned. 
    # + endDate - Used to limit the jurisdictions returned. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of objects to fetch underneath this jurisdiction. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryTaxAuthorityJurisdictionRates(int? taxAuthorityId = (), string? effectiveDate = (), string? endDate = (), string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ComplianceJurisdictionRateModel|error {
        string resourcePath = string `/api/v2/compliance/taxauthorityjurisdictionrates`;
        map<anydata> queryParam = {"taxAuthorityId": taxAuthorityId, "effectiveDate": effectiveDate, "endDate": endDate, "$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ComplianceJurisdictionRateModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve contacts for this company
    #
    # + companyId - The ID of the company that owns these contacts 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listContactsByCompany(int companyId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ContactModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/contacts`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new contact
    #
    # + companyId - The ID of the company that owns this contact. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The contacts you wish to create. 
    # + return - Success 
    remote isolated function createContacts(int companyId, ContactModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ContactModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/contacts`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ContactModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single contact
    #
    # + companyId - The ID of the company for this contact 
    # + id - The primary key of this contact 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getContact(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ContactModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single contact
    #
    # + companyId - The ID of the company that this contact belongs to. 
    # + id - The ID of the contact you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The contact you wish to update. 
    # + return - Success 
    remote isolated function updateContact(int companyId, int id, ContactModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ContactModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ContactModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single contact
    #
    # + companyId - The ID of the company that owns this contact. 
    # + id - The ID of the contact you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteContact(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all contacts
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryContacts(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ContactModelFetchResult|error {
        string resourcePath = string `/api/v2/contacts`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all customers for this company
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + include - OPTIONAL - You can specify the value `certificates` to fetch information about certificates linked to the customer. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* shipTos 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryCustomers(int companyId, string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create customers for this company
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of customer objects to be created 
    # + return - Success 
    remote isolated function createCustomers(int companyId, CustomerModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single customer
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + include - Specify optional additional objects to include in this fetch request 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCustomer(int companyId, string customerCode, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single customer
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The new customer model that will replace the existing record at this URL 
    # + return - Success 
    remote isolated function updateCustomer(int companyId, string customerCode, CustomerModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a customer record
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteCustomer(int companyId, string customerCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerModel response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a customer's attributes
    #
    # + companyId - The unique ID number of the company that recorded the provided customer 
    # + customerCode - The unique code representing the current customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listAttributesForCustomer(int companyId, string customerCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/attributes`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CustomerAttributeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Link attributes to a customer
    #
    # + companyId - The unique ID number of the company that recorded the provided customer 
    # + customerCode - The unique code representing the current customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of attributes to link to the customer. 
    # + return - Success 
    remote isolated function linkAttributesToCustomer(int companyId, string customerCode, CustomerAttributeModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/attributes/link`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerAttributeModelFetchResult response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlink attributes from a customer
    #
    # + companyId - The unique ID number of the company that recorded the customer 
    # + customerCode - The unique code representing the current customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of attributes to unlink from the customer. 
    # + return - Success 
    remote isolated function unlinkAttributesFromCustomer(int companyId, string customerCode, CustomerAttributeModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/attributes/unlink`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerAttributeModelFetchResult response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List certificates linked to a customer
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + include - OPTIONAL: A comma separated list of special fetch options.  You can specify one or more of the following: customers - Retrieves the list of customers linked to the certificate. po_numbers - Retrieves all PO numbers tied to the certificate. attributes - Retrieves all attributes applied to the certificate. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exemptionNumber, status, ecmsId, ecmsStatus, pdf, pages 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCertificatesForCustomer(int companyId, string customerCode, string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certificates`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List valid certificates for a location
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + country - Search for certificates matching this country.  Uses the ISO 3166 two character country code. 
    # + region - Search for certificates matching this region.  Uses the ISO 3166 two or three character state, region, or province code. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listValidCertificatesForCustomer(int companyId, string customerCode, string country, string region, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ExemptionStatusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certificates/${getEncodedUri(country)}/${getEncodedUri(region)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExemptionStatusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Link certificates to a customer
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of certificates to link to this customer 
    # + return - Success 
    remote isolated function linkCertificatesToCustomer(int companyId, string customerCode, LinkCertificatesModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certificates/link`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlink certificates from a customer
    #
    # + companyId - The unique ID number of the company that recorded this customer 
    # + customerCode - The unique code representing this customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The list of certificates to link to this customer 
    # + return - Success 
    remote isolated function unlinkCertificatesFromCustomer(int companyId, string customerCode, LinkCertificatesModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/${getEncodedUri(customerCode)}/certificates/unlink`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CertificateModelFetchResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Link two customer records together
    #
    # + companyId - The unique ID number of the company defining customers. 
    # + code - The code of the bill-to customer to link. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - A list of information about ship-to customers to link to this bill-to customer. 
    # + return - Success 
    remote isolated function linkShipToCustomersToBillCustomer(int companyId, string code, LinkCustomersModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CustomerModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/customers/billto/${getEncodedUri(code)}/shipto/link`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CustomerModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all datasources for this company
    #
    # + companyId - The id of the company you wish to retrieve the datasources. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isEnabled, isSynced, isAuthorized, name, externalState 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listDataSources(int companyId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns DataSourceModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/datasources`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DataSourceModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create and store new datasources for the respective companies.
    #
    # + companyId - The id of the company you which to create the datasources 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function createDataSources(int companyId, DataSourceModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns DataSourceModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/datasources`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        DataSourceModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get data source by data source id
    #
    # + id - data source id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getDataSourceById(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns DataSourceModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/datasources/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DataSourceModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a datasource identified by id for a company
    #
    # + companyId - The id of the company the datasource belongs to. 
    # + id - The id of the datasource you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function updateDataSource(int companyId, int id, DataSourceModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns DataSourceModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/datasources/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        DataSourceModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a datasource by datasource id for a company.
    #
    # + companyId - The id of the company the datasource belongs to. 
    # + id - The id of the datasource you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteDataSource(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/datasources/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all datasources
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isEnabled, isSynced, isAuthorized, name, externalState 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryDataSources(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns DataSourceModelFetchResult|error {
        string resourcePath = string `/api/v2/datasources`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DataSourceModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of the AvaFile Forms available
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* outletTypeId 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listAvaFileForms(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AvaFileFormModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/avafileforms`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AvaFileFormModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List certificate attributes used by a company
    #
    # + companyid - Id of the company the user wish to fetch the certificates' attributes from. If not specified the API will use user's default company. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCertificateAttributes(int? companyid = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CertificateAttributeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/certificateattributes`;
        map<anydata> queryParam = {"companyid": companyid, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CertificateAttributeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List the certificate exempt reasons defined by a company
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCertificateExemptReasons(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ExemptionReasonModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/certificateexemptreasons`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExemptionReasonModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List certificate exposure zones used by a company
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id, companyId, name, tag, description, created, modified, region, country 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCertificateExposureZones(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ExposureZoneModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/certificateexposurezones`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ExposureZoneModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported usage of extra parameters for classification of a item.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* values 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listClassificationParametersUsage(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ClassificationParameterUsageMapModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/classification/parametersusage`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ClassificationParameterUsageMapModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of communications transactiontypes
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCommunicationsTransactionTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CommunicationsTransactionTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/communications/transactiontypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CommunicationsTransactionTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of communications service types
    #
    # + id - The transaction type ID to examine 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* requiredParameters 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCommunicationsServiceTypes(int id, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CommunicationsTSPairModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/communications/transactiontypes/${getEncodedUri(id)}/servicetypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CommunicationsTSPairModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of communications transaction/service type pairs
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* requiredParameters 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCommunicationsTSPairs(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CommunicationsTSPairModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/communications/tspairs`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CommunicationsTSPairModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all ISO 3166 countries
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* alpha3Code, isEuropeanUnion, localizedNames, addressesRequireRegion 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCountries(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns IsoCountryModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/countries`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IsoCountryModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of rate types for each country
    #
    # + country - The country to examine for rate types 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listRateTypesByCountry(string country, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns RateTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/countries/${getEncodedUri(country)}/ratetypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RateTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all ISO 3166 regions for a country
    #
    # + country - The country of which you want to fetch ISO 3166 regions 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* localizedNames 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listRegionsByCountry(string country, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns IsoRegionModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/countries/${getEncodedUri(country)}/regions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IsoRegionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list of rate types by country, TaxType and by TaxSubType
    #
    # + country - The country to examine for rate types 
    # + taxTypeId - The taxType for the country to examine for rate types 
    # + taxSubTypeId - The taxSubType for the country and taxType to examine for rate types 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id, rateType, description 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listRateTypesByCountryTaxTypeTaxSubType(string country, string taxTypeId, string taxSubTypeId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns RateTypesModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/countries/${getEncodedUri(country)}/taxtypes/${getEncodedUri(taxTypeId)}/taxsubtypes/${getEncodedUri(taxSubTypeId)}/ratetypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        RateTypesModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List certificate exposure zones used by a company
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id, companyId, subject, description, createdDate, modifiedDate, pageCount, templateFilename, version 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCoverLetters(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CoverLetterModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/coverletters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CoverLetterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Lists the next level of HS Codes given a destination country and HS Code prefix.
    #
    # + country - The name or code of the destination country. 
    # + hsCode - The Section or partial HS Code for which you would like to view the next level of HS Code detail, if more detail is available. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* hsCodeSource, system, destinationCountry, isDecisionNode, zeroPaddingCount, isSystemDefined, isTaxable, effDate, endDate, hsCodeSourceLength 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCrossBorderCodes(string country, string hsCode, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns HsCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/crossborder/${getEncodedUri(country)}/${getEncodedUri(hsCode)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HsCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Lists all parents of an HS Code.
    #
    # + country - The name or code of the destination country. 
    # + hsCode - The partial or full HS Code for which you would like to view all of the parents. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getCrossBorderCode(string country, string hsCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns HsCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/crossborder/${getEncodedUri(country)}/${getEncodedUri(hsCode)}/hierarchy`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HsCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List top level HS Code Sections.
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCrossBorderSections(string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns HsCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/crossborder/sections`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        HsCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all ISO 4217 currencies supported by AvaTax.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listCurrencies(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CurrencyModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/currencies`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CurrencyModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported entity use codes
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* validCountries 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listEntityUseCodes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns EntityUseCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/entityusecodes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        EntityUseCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all forms where logins can be verified automatically
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxFormCodes, scraperType, expectedResponseTime, requiredFilingCalendarDataFields 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listLoginVerifiers(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SkyscraperStatusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/filingcalendars/loginverifiers`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SkyscraperStatusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Test whether a form supports online login verification
    #
    # + form - The name of the form you would like to verify. This is the tax form code 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxFormCodes, scraperType, expectedResponseTime, requiredFilingCalendarDataFields 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLoginVerifierByForm(string form, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SkyscraperStatusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/filingcalendars/loginverifiers/${getEncodedUri(form)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SkyscraperStatusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported filing frequencies.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listFilingFrequencies(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FilingFrequencyModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/filingfrequencies`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FilingFrequencyModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List jurisdictions based on the filter provided
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* rate, salesRate, signatureCode, useRate 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listJurisdictions(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/jurisdictions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List jurisdictions based on the TaxType, TaxSubType and RateType provided
    #
    # + country - The country for which you want to retrieve the jurisdiction information 
    # + region - The region for which you want to retrieve the jurisdiction information 
    # + taxTypeId - The taxtype for which you want to retrieve the jurisdiction information 
    # + taxSubTypeId - The taxsubtype for which you want to retrieve the jurisdiction information 
    # + rateTypeId - The ratetype for which you want to retrieve the jurisdiction information 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id, country, state, jurisdictionCode, longName, taxTypeId, taxSubTypeId, taxTypeGroupId, rateTypeId 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listJurisdictionsByRateTypeTaxTypeMapping(string country, string region, string taxTypeId, string taxSubTypeId, string rateTypeId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionRateTypeTaxTypeMappingModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/jurisdictions/countries/${getEncodedUri(country)}/regions/${getEncodedUri(region)}/taxtypes/${getEncodedUri(taxTypeId)}/taxsubtypes/${getEncodedUri(taxSubTypeId)}`;
        map<anydata> queryParam = {"rateTypeId": rateTypeId, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionRateTypeTaxTypeMappingModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List jurisdictions near a specific address
    #
    # + line1 - The first address line portion of this address. 
    # + line2 - The second address line portion of this address. 
    # + line3 - The third address line portion of this address. 
    # + city - The city portion of this address. 
    # + region - The region, state, or province code portion of this address. 
    # + postalCode - The postal code or zip code portion of this address. 
    # + country - The two-character ISO-3166 code of the country portion of this address. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* country, Jurisdictions 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listJurisdictionsByAddress(string country, string? line1 = (), string? line2 = (), string? line3 = (), string? city = (), string? region = (), string? postalCode = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/jurisdictionsnearaddress`;
        map<anydata> queryParam = {"line1": line1, "line2": line2, "line3": line3, "city": city, "region": region, "postalCode": postalCode, "country": country, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionOverrideModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all market place locations.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listAllMarketplaceLocations(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MarketplaceModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/listallmarketplacelocations`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MarketplaceModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list of questions that are required for a tax location
    #
    # + line1 - The first line of this location's address. 
    # + line2 - The second line of this location's address. 
    # + line3 - The third line of this location's address. 
    # + city - The city part of this location's address. 
    # + region - The region, state, or province part of this location's address. 
    # + postalCode - The postal code of this location's address. 
    # + country - The country part of this location's address. 
    # + latitude - Optionally identify the location via latitude/longitude instead of via address. 
    # + longitude - Optionally identify the location via latitude/longitude instead of via address. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listLocationQuestionsByAddress(string? line1 = (), string? line2 = (), string? line3 = (), string? city = (), string? region = (), string? postalCode = (), string? country = (), decimal? latitude = (), decimal? longitude = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationQuestionModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/locationquestions`;
        map<anydata> queryParam = {"line1": line1, "line2": line2, "line3": line3, "city": city, "region": region, "postalCode": postalCode, "country": country, "latitude": latitude, "longitude": longitude, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationQuestionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list of locations for a marketplace.
    #
    # + marketplaceId - MarketplaceId of a marketplace 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listMarketplaceLocations(string marketplaceId, int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MarketplaceLocationModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/marketplacelocations`;
        map<anydata> queryParam = {"marketplaceId": marketplaceId, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MarketplaceLocationModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported nexus for all countries and regions.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexus(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexus`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported nexus for a country.
    #
    # + country - The country in which you want to fetch the system nexus 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByCountry(string country, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexus/${getEncodedUri(country)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported nexus for a country and region.
    #
    # + country - The two-character ISO-3166 code for the country. 
    # + region - The two or three character region code for the region. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByCountryAndRegion(string country, string region, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexus/${getEncodedUri(country)}/${getEncodedUri(region)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all nexus that apply to a specific address.
    #
    # + line1 - The first address line portion of this address. 
    # + line2 - The first address line portion of this address. 
    # + line3 - The first address line portion of this address. 
    # + city - The city portion of this address. 
    # + region - Name or ISO 3166 code identifying the region portion of the address. This field supports many different region identifiers: * Two and three character ISO 3166 region codes.  Fully spelled out names of the region in ISO supported languages. Common alternative spellings for many regions. For a full list of all supported codes and names, please see the Definitions API `ListRegions`. 
    # + postalCode - The postal code or zip code portion of this address. 
    # + country - Name or ISO 3166 code identifying the country portion of this address. This field supports many different country identifiers: Two character ISO 3166 codes. Three character ISO 3166 codes. Fully spelled out names of the country in ISO supported languages. Common alternative spellings for many countries. For a full list of all supported codes and names, please see the Definitions API `ListCountries`. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByAddress(string region, string country, string? line1 = (), string? line2 = (), string? line3 = (), string? city = (), string? postalCode = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexus/byaddress`;
        map<anydata> queryParam = {"line1": line1, "line2": line2, "line3": line3, "city": city, "region": region, "postalCode": postalCode, "country": country, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List nexus related to a tax form
    #
    # + formCode - The form code that we are looking up the nexus for 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByFormCode(string formCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusByTaxFormModel|error {
        string resourcePath = string `/api/v2/definitions/nexus/byform/${getEncodedUri(formCode)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusByTaxFormModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported nexus for a tax type group.
    #
    # + taxTypeGroup - The tax type group to fetch the supporting system nexus for. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByTaxTypeGroup(string taxTypeGroup, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexus/bytaxtypegroup/${getEncodedUri(taxTypeGroup)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of nexus tax type groups
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptionTypeId, subscriptionDescription, tabName, showColumn 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusTaxTypeGroups(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusTaxTypeGroupModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/nexustaxtypegroups`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusTaxTypeGroupModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice customer funding options.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeCustomerFundingOptions(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeCustomerFundingOptionModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticecustomerfundingoptions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeCustomerFundingOptionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice customer types.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeCustomerTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeCustomerTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticecustomertypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeCustomerTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice filing types.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* description, activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeFilingtypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeFilingTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticefilingtypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeFilingTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice priorities.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticePriorities(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticePriorityModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticepriorities`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticePriorityModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice reasons.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* description, activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeReasons(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeReasonModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticereasons`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeReasonModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice responsibility ids
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeResponsibilities(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeResponsibilityModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticeresponsibilities`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeResponsibilityModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice root causes
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeRootCauses(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeRootCauseModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticerootcauses`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeRootCauseModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice statuses.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isOpen, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeStatuses(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeStatusModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticestatuses`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeStatusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax notice types.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* activeFlag, sortOrder 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNoticeTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/noticetypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NoticeTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported extra parameters for creating transactions.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* serviceTypes, regularExpression, values 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listParameters(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ParameterModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/parameters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ParameterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the parameters by companyCode and itemCode.
    #
    # + companyCode - Company code. 
    # + itemCode - Item code. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* serviceTypes, regularExpression, values 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listParametersByItem(string companyCode, string itemCode, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ParameterModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/parameters/byitem/${getEncodedUri(companyCode)}/${getEncodedUri(itemCode)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ParameterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported usage of extra parameters for creating transactions.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* values 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listParametersUsage(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ParameterUsageModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/parametersusage`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ParameterUsageModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported permissions
    #
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listPermissions(int? top = (), int? skip = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns StringFetchResult|error {
        string resourcePath = string `/api/v2/definitions/permissions`;
        map<anydata> queryParam = {"$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        StringFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported postal codes.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listPostalCodes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns PostalCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/postalcodes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PostalCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all customs duty programs recognized by AvaTax
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* effectiveDate, endDate 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listPreferredPrograms(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns PreferredProgramModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/preferredprograms`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PreferredProgramModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all available product classification systems.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* countries 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + countrycode - If not null, return all records with this code. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listProductClassificationSystems(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string? countrycode = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ProductClassificationSystemModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/productclassificationsystems`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby, "$countryCode": countrycode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductClassificationSystemModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all product classification systems available to a company based on its nexus.
    #
    # + companyCode - The company code. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* countries 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + countrycode - If not null, return all records with this code. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listProductClassificationSystemsByCompany(string companyCode, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string? countrycode = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ProductClassificationSystemModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/productclassificationsystems/bycompany/${getEncodedUri(companyCode)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby, "$countryCode": countrycode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ProductClassificationSystemModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all ISO 3166 regions
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* localizedNames 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listRegions(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns IsoRegionModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/regions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        IsoRegionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported resource file types
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listResourceFileTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ResourceFileTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/resourcefiletypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResourceFileTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported usage of parameters used for returns.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* values 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listReturnsParametersUsage(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ReturnsParameterUsageModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/returns/parametersusage`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReturnsParameterUsageModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported permissions
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listSecurityRoles(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SecurityRoleModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/securityroles`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SecurityRoleModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported subscription types
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listSubscriptionTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/subscriptiontypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list all tags supported by avalara
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTags(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TagsModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/tags`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TagsModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax authorities.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxAuthorities(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxAuthorityModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxauthorities`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxAuthorityModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported forms for each tax authority.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxAuthorityForms(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxAuthorityFormModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxauthorityforms`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxAuthorityFormModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax authority types.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxAuthorityTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxAuthorityTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxauthoritytypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxAuthorityTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax codes.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxCodes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxcodes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of Avalara-supported tax code types.
    #
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxCodeTypes(int? top = (), int? skip = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeTypesModel|error {
        string resourcePath = string `/api/v2/definitions/taxcodetypes`;
        map<anydata> queryParam = {"$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxCodeTypesModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of the Tax Forms available
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxForms(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FormMasterModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxforms`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormMasterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of tax sub types
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxSubTypes(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxSubTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxsubtypes`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxSubTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of tax sub types by jurisdiction code and region
    #
    # + jurisdictionCode - The jurisdiction code of the tax sub type. 
    # + region - The region of the tax sub type. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxSubTypesByJurisdictionAndRegion(string jurisdictionCode, string region, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxSubTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxsubtypes/${getEncodedUri(jurisdictionCode)}/${getEncodedUri(region)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxSubTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of tax sub types by Country and TaxType
    #
    # + country - The country to examine for taxsubtype 
    # + taxTypeId - The taxType for the country to examine for taxsubtype 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxSubTypesByCountryAndTaxType(string country, string taxTypeId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxSubTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxsubtypes/countries/${getEncodedUri(country)}/taxtypes/${getEncodedUri(taxTypeId)}`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxSubTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the full list of tax type groups
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptionTypeId, subscriptionDescription, tabName, showColumn, displaySequence 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxTypeGroups(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxTypeGroupModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxtypegroups`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxTypeGroupModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list of applicable TaxTypes
    #
    # + country - The country for which you want to retrieve the unitofbasis information 
    # + companyId - Your companyId to retrieve the applicable taxtypes 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxTypesByNexusAndCountry(string country, int companyId, int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxTypeModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/taxtypes/countries/${getEncodedUri(country)}`;
        map<anydata> queryParam = {"companyId": companyId, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxTypeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve the list of applicable UnitOfBasis
    #
    # + country - The country for which you want to retrieve the unitofbasis information 
    # + taxTypeId - The taxtype for which you want to retrieve the unitofbasis information 
    # + taxSubTypeId - The taxsubtype for which you want to retrieve the unitofbasis information 
    # + rateTypeId - The ratetype for which you want to retrieve the unitofbasis information 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listUnitOfBasisByCountryAndTaxTypeAndTaxSubTypeAndRateType(string country, string taxTypeId, string taxSubTypeId, string rateTypeId, int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UnitOfBasisModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/unitofbasis/countries/${getEncodedUri(country)}/taxtypes/${getEncodedUri(taxTypeId)}/taxsubtypes/${getEncodedUri(taxSubTypeId)}`;
        map<anydata> queryParam = {"rateTypeId": rateTypeId, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UnitOfBasisModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all defined units of measurement
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* id 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listUnitOfMeasurement(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UomModelFetchResult|error {
        string resourcePath = string `/api/v2/definitions/unitofmeasurements`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UomModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all DistanceThresholds for this company.
    #
    # + companyId - The ID of the company whose DistanceThreshold objects you wish to list. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listDistanceThresholds(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyDistanceThresholdModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/distancethresholds`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyDistanceThresholdModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create one or more DistanceThreshold objects
    #
    # + companyId - The unique ID number of the company that owns this DistanceThreshold 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The DistanceThreshold object or objects you wish to create. 
    # + return - Success 
    remote isolated function createDistanceThreshold(int companyId, CompanyDistanceThresholdModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyDistanceThresholdModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/distancethresholds`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyDistanceThresholdModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single DistanceThreshold
    #
    # + companyId - The ID of the company that owns this DistanceThreshold object 
    # + id - The unique ID number referring to this DistanceThreshold object 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getDistanceThreshold(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyDistanceThresholdModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/distancethresholds/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyDistanceThresholdModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a DistanceThreshold object
    #
    # + companyId - The unique ID number of the company that owns this DistanceThreshold object. 
    # + id - The unique ID number of the DistanceThreshold object to replace. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The new DistanceThreshold object to store. 
    # + return - Success 
    remote isolated function updateDistanceThreshold(int companyId, int id, CompanyDistanceThresholdModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyDistanceThresholdModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/distancethresholds/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyDistanceThresholdModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single DistanceThreshold object
    #
    # + companyId - The unique ID number of the company that owns this DistanceThreshold 
    # + id - The unique ID number of the DistanceThreshold object you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteDistanceThreshold(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/distancethresholds/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all DistanceThreshold objects
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryDistanceThresholds(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyDistanceThresholdModelFetchResult|error {
        string resourcePath = string `/api/v2/distancethresholds`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyDistanceThresholdModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Refresh an eCommerce token.
    #
    # + companyId - The company ID that the refreshed certificate belongs to. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function refreshECommerceToken(int companyId, RefreshECommerceTokenInputModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ECommerceTokenOutputModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/ecommercetokens`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ECommerceTokenOutputModelFetchResult response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a new eCommerce token.
    #
    # + companyId - The company ID that will be issued this certificate. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function createECommerceToken(int companyId, CreateECommerceTokenInputModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ECommerceTokenOutputModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/ecommercetokens`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ECommerceTokenOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a company return setting
    #
    # + companyId - The unique ID of the company 
    # + filingCalendarId - The unique ID of the filing calendar that will remove setting 
    # + companyReturnSettingId - The unique ID of the company return setting that will be deleted from the filing calendar 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteCompanyReturnSettings(int companyId, int filingCalendarId, int companyReturnSettingId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyReturnSettingModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/filingcalendars/${getEncodedUri(filingCalendarId)}/setting/${getEncodedUri(companyReturnSettingId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyReturnSettingModel[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Add or Edit options
    #
    # + companyId - The unique ID of the company that owns the filing calendar object 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Cycle Safe Options Request 
    # + return - Success 
    remote isolated function cycleSafeOptions(int companyId, CycleSafeEditRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CycleSafeOptionResultModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/filingcalendars/edit/cycleSafeOptions`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CycleSafeOptionResultModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all legacy filing calendars for this company
    #
    # + companyId - The ID of the company that owns these batches 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxTypes, taxAuthorityId, taxAuthorityName, taxAuthorityType, settings 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + returnCountry - A comma separated list of countries 
    # + returnRegion - A comma separated list of regions 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function legacyFilingCalendars(int companyId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string? returnCountry = (), string? returnRegion = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FilingCalendarModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/filingcalendars/Legacy`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby, "returnCountry": returnCountry, "returnRegion": returnRegion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FilingCalendarModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a filing containing the return and all its accrual returns.
    #
    # + companyId - The ID of the company that owns these returns 
    # + filingReturnId - The ID of the filing return 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getAccrualFilings(int companyId, int filingReturnId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiTaxFilingModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/filings/accrual/${getEncodedUri(filingReturnId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MultiTaxFilingModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a list of filed returns for the specified company in the year and month of a given filing period.
    #
    # + companyId - The ID of the company that owns these batches 
    # + endPeriodMonth - The month of the period you are trying to retrieve 
    # + endPeriodYear - The year of the period you are trying to retrieve 
    # + frequency - The frequency of the return you are trying to retrieve 
    # + status - The status of the return(s) you are trying to retrieve 
    # + country - The country of the return(s) you are trying to retrieve 
    # + region - The region of the return(s) you are trying to retrieve 
    # + filingCalendarId - The filing calendar id of the return you are trying to retrieve 
    # + taxformCode - The unique tax form code of the form. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getFiledReturns(int companyId, int? endPeriodMonth = (), int? endPeriodYear = (), string? frequency = (), string? status = (), string? country = (), string? region = (), int? filingCalendarId = (), string? taxformCode = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FiledReturnModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/filings/returns/filed`;
        map<anydata> queryParam = {"endPeriodMonth": endPeriodMonth, "endPeriodYear": endPeriodYear, "frequency": frequency, "status": status, "country": country, "region": region, "filingCalendarId": filingCalendarId, "taxformCode": taxformCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FiledReturnModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List client linkages for a firm or client
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* firmAccountName, clientAccountName 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listFirmClientLinkage(string? filter = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModelFetchResult|error {
        string resourcePath = string `/api/v2/firmclientlinkages`;
        map<anydata> queryParam = {"$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirmClientLinkageOutputModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Links a firm account with the client account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - FirmClientLinkageInputModel 
    # + return - Success 
    remote isolated function createFirmClientLinkage(FirmClientLinkageInputModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get linkage between a firm and client by id
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FirmClientLinkageOutputModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a linkage
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Approves linkage to a firm for a client account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function approveFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}/approve`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Rejects linkage to a firm for a client account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function rejectFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}/reject`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Reset linkage status between a client and firm back to requested
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function resetFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}/reset`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Revokes previously approved linkage to a firm for a client account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function revokeFirmClientLinkage(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/${getEncodedUri(id)}/revoke`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request a new FirmClient account and create an approved linkage to it
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information about the account you wish to create. 
    # + return - Success 
    remote isolated function createAndLinkNewFirmClientAccount(NewFirmClientAccountRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FirmClientLinkageOutputModel|error {
        string resourcePath = string `/api/v2/firmclientlinkages/createandlinkclient`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FirmClientLinkageOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # FREE API - Request a free trial of AvaTax
    #
    # + payload - Required information to provision a free trial account. 
    # + return - Success 
    remote isolated function requestFreeTrial(FreeTrialRequestModel payload) returns NewAccountModel|error {
        string resourcePath = string `/api/v2/accounts/freetrials/request`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NewAccountModel response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve status about a funding setup request
    #
    # + id - The unique ID number of this funding request 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function fundingRequestStatus(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingStatusModel|error {
        string resourcePath = string `/api/v2/fundingrequests/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FundingStatusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request the javascript for a funding setup widget
    #
    # + id - The unique ID number of this funding request 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function activateFundingRequest(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns FundingStatusModel|error {
        string resourcePath = string `/api/v2/fundingrequests/${getEncodedUri(id)}/widget`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FundingStatusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve items for this company
    #
    # + companyId - The ID of the company that defined these items 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, classifications, parameters, tags 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + tagName - Tag Name on the basis of which you want to filter Items 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listItemsByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string? tagName = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby, "tagName": tagName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new item
    #
    # + companyId - The ID of the company that owns this item. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item you wish to create. 
    # + return - Success 
    remote isolated function createItems(int companyId, ItemModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single item
    #
    # + companyId - The ID of the company that owns this item object 
    # + id - The primary key of this item 
    # + include - A comma separated list of additional data to retrieve. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getItem(int companyId, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single item
    #
    # + companyId - The ID of the company that this item belongs to. 
    # + id - The ID of the item you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item object you wish to update. 
    # + return - Success 
    remote isolated function updateItem(int companyId, int id, ItemModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single item
    #
    # + companyId - The ID of the company that owns this item. 
    # + id - The ID of the item you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteItem(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve classifications for an item.
    #
    # + companyId - The company id. 
    # + itemId - The item id. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* productCode, systemCode 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listItemClassifications(int companyId, int itemId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemClassificationOutputModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemClassificationOutputModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add classifications to an item.
    #
    # + companyId - The company id. 
    # + itemId - The item id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item classifications you wish to create. 
    # + return - Success 
    remote isolated function createItemClassifications(int companyId, int itemId, ItemClassificationInputModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemClassificationOutputModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemClassificationOutputModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete all classifications for an item
    #
    # + companyId - The ID of the company that owns this item. 
    # + itemId - The ID of the item you wish to delete the classifications. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function batchDeleteItemClassifications(int companyId, int itemId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a single item classification.
    #
    # + companyId - The company id. 
    # + itemId - The item id. 
    # + id - The item classification id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getItemClassification(int companyId, int itemId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemClassificationOutputModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemClassificationOutputModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an item classification.
    #
    # + companyId - The company id. 
    # + itemId - The item id. 
    # + id - The item classification id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item object you wish to update. 
    # + return - Success 
    remote isolated function updateItemClassification(int companyId, int itemId, int id, ItemClassificationInputModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemClassificationOutputModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemClassificationOutputModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single item classification.
    #
    # + companyId - The company id. 
    # + itemId - The item id. 
    # + id - The item classification id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteItemClassification(int companyId, int itemId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/classifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve parameters for an item
    #
    # + companyId - The company id 
    # + itemId - The item id 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit, isNeededForCalculation, isNeededForReturns, isNeededForClassification 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listItemParameters(int companyId, int itemId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemParameterModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemParameterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add parameters to an item.
    #
    # + companyId - The ID of the company that owns this item parameter. 
    # + itemId - The item id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item parameters you wish to create. 
    # + return - Success 
    remote isolated function createItemParameters(int companyId, int itemId, ItemParameterModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemParameterModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemParameterModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete all parameters for an item
    #
    # + companyId - The ID of the company that owns this item. 
    # + itemId - The ID of the item you wish to delete the parameters. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function batchDeleteItemParameters(int companyId, int itemId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a single item parameter
    #
    # + companyId - The company id 
    # + itemId - The item id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getItemParameter(int companyId, int itemId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemParameterModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemParameterModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an item parameter
    #
    # + companyId - The company id. 
    # + itemId - The item id 
    # + id - The item parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The item object you wish to update. 
    # + return - Success 
    remote isolated function updateItemParameter(int companyId, int itemId, int id, ItemParameterModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemParameterModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemParameterModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single item parameter
    #
    # + companyId - The company id 
    # + itemId - The item id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteItemParameter(int companyId, int itemId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve tags for an item
    #
    # + companyId - The ID of the company that defined these items 
    # + itemId - The ID of the item as defined by the company that owns this tag. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* tagName 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getItemTags(int companyId, int itemId, string? filter = (), int? top = (), int? skip = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemTagDetailModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/tags`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemTagDetailModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create tags for a item
    #
    # + companyId - The ID of the company that defined these items 
    # + itemId - The ID of the item as defined by the company that owns this tag. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Tags you wish to associate with the Item 
    # + return - Success 
    remote isolated function createItemTags(int companyId, int itemId, ItemTagDetailModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemTagDetailModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/tags`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemTagDetailModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete all item tags
    #
    # + companyId - The ID of the company that defined these items. 
    # + itemId - The ID of the item as defined by the company that owns this tag. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteItemTags(int companyId, int itemId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/tags`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Delete item tag by id
    #
    # + companyId - The ID of the company that defined these items 
    # + itemId - The ID of the item as defined by the company that owns this tag. 
    # + itemTagDetailId - The ID of the item tag detail you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteItemTag(int companyId, int itemId, int itemTagDetailId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/${getEncodedUri(itemId)}/tags/${getEncodedUri(itemTagDetailId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all items associated with given tag
    #
    # + companyId - The ID of the company that defined these items. 
    # + tag - The master tag to be associated with item. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, classifications, parameters, tags 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryItemsByTag(int companyId, string tag, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/bytags/${getEncodedUri(tag)}`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Sync items from a product catalog
    #
    # + companyId - The ID of the company that owns this item. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The request object. 
    # + return - Success 
    remote isolated function syncItems(int companyId, SyncItemsRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SyncItemsResponseModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/sync`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        SyncItemsResponseModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Bulk upload items from a product catalog
    #
    # + companyId - The ID of the company that owns this items. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The items you wish to upload. 
    # + return - Success 
    remote isolated function bulkUploadItems(int companyId, ItemBulkUploadInputModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemBulkUploadOutputModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/items/upload`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ItemBulkUploadOutputModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all items
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, classifications, parameters, tags 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryItems(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ItemModelFetchResult|error {
        string resourcePath = string `/api/v2/items`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ItemModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve overrides for this account
    #
    # + accountId - The ID of the account that owns this override 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* country, Jurisdictions 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listJurisdictionOverridesByAccount(int accountId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModelFetchResult|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/jurisdictionoverrides`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionOverrideModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create one or more overrides
    #
    # + accountId - The ID of the account that owns this override 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The jurisdiction override objects to create 
    # + return - Success 
    remote isolated function createJurisdictionOverrides(int accountId, JurisdictionOverrideModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/jurisdictionoverrides`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        JurisdictionOverrideModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single override
    #
    # + accountId - The ID of the account that owns this override 
    # + id - The primary key of this override 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getJurisdictionOverride(int accountId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/jurisdictionoverrides/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionOverrideModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single jurisdictionoverride
    #
    # + accountId - The ID of the account that this jurisdictionoverride belongs to. 
    # + id - The ID of the jurisdictionoverride you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The jurisdictionoverride object you wish to update. 
    # + return - Success 
    remote isolated function updateJurisdictionOverride(int accountId, int id, JurisdictionOverrideModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/jurisdictionoverrides/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        JurisdictionOverrideModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single override
    #
    # + accountId - The ID of the account that owns this override 
    # + id - The ID of the override you wish to delete 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteJurisdictionOverride(int accountId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/jurisdictionoverrides/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all overrides
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* country, Jurisdictions 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryJurisdictionOverrides(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns JurisdictionOverrideModelFetchResult|error {
        string resourcePath = string `/api/v2/jurisdictionoverrides`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        JurisdictionOverrideModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve locations for this company
    #
    # + companyId - The ID of the company that owns these locations 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isMarketplaceOutsideUsa, settings, parameters 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listLocationsByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new location
    #
    # + companyId - The ID of the company that owns this location. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The location you wish to create. 
    # + return - Success 
    remote isolated function createLocations(int companyId, LocationModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LocationModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single location
    #
    # + companyId - The ID of the company that owns this location 
    # + id - The primary key of this location 
    # + include - A comma separated list of additional data to retrieve. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLocation(int companyId, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single location
    #
    # + companyId - The ID of the company that this location belongs to. 
    # + id - The ID of the location you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The location you wish to update. 
    # + return - Success 
    remote isolated function updateLocation(int companyId, int id, LocationModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LocationModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single location
    #
    # + companyId - The ID of the company that owns this location. 
    # + id - The ID of the location you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteLocation(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Validate the location against local requirements
    #
    # + companyId - The ID of the company that owns this location 
    # + id - The primary key of this location 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function validateLocation(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationValidationModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(id)}/validate`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationValidationModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve parameters for a location
    #
    # + companyId - The company id 
    # + locationId - The ID of the location 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listLocationParameters(int companyId, int locationId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationParameterModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(locationId)}/parameters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationParameterModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add parameters to a location.
    #
    # + companyId - The ID of the company that owns this location parameter. 
    # + locationId - The location id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The location parameters you wish to create. 
    # + return - Success 
    remote isolated function createLocationParameters(int companyId, int locationId, LocationParameterModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationParameterModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(locationId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LocationParameterModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single company location parameter
    #
    # + companyId - The company id 
    # + locationId - The location id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getLocationParameter(int companyId, int locationId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationParameterModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(locationId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationParameterModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a location parameter
    #
    # + companyId - The company id. 
    # + locationId - The location id 
    # + id - The location parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The location parameter object you wish to update. 
    # + return - Success 
    remote isolated function updateLocationParameter(int companyId, int locationId, int id, LocationParameterModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationParameterModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(locationId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        LocationParameterModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single location parameter
    #
    # + companyId - The company id 
    # + locationId - The location id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteLocationParameter(int companyId, int locationId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(locationId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all locations
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* isMarketplaceOutsideUsa, settings, parameters 
    # + include - A comma separated list of additional data to retrieve.  You may specify `LocationSettings` to retrieve location settings. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryLocations(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns LocationModelFetchResult|error {
        string resourcePath = string `/api/v2/locations`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LocationModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all MultiDocument transactions
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* documents 
    # + include - Specifies objects to include in the response after transaction is created 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listMultiDocumentTransactions(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModelFetchResult|error {
        string resourcePath = string `/api/v2/transactions/multidocument`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MultiDocumentModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new MultiDocument transaction
    #
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - the multi document transaction model 
    # + return - Success 
    remote isolated function createMultiDocumentTransaction(CreateMultiDocumentModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a MultiDocument transaction
    #
    # + code - The multidocument code to retrieve 
    # + 'type - The transaction type to retrieve 
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getMultiDocumentTransactionByCodeAndType(string code, string 'type, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(code)}/type/${getEncodedUri('type)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MultiDocumentModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Adjust a MultiDocument transaction
    #
    # + code - The transaction code for this MultiDocument transaction 
    # + 'type - The transaction type for this MultiDocument transaction 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The adjust request you wish to execute 
    # + return - Success 
    remote isolated function adjustMultiDocumentTransaction(string code, string 'type, AdjustMultiDocumentModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(code)}/type/${getEncodedUri('type)}/adjust`;
        map<anydata> queryParam = {"include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get audit information about a MultiDocument transaction
    #
    # + code - The transaction code for this MultiDocument transaction 
    # + 'type - The transaction type for this MultiDocument transaction 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function auditMultiDocumentTransaction(string code, string 'type, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AuditMultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(code)}/type/${getEncodedUri('type)}/audit`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditMultiDocumentModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a refund for a MultiDocument transaction
    #
    # + code - The code of this MultiDocument transaction 
    # + 'type - The type of this MultiDocument transaction 
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information about the refund to create 
    # + return - Success 
    remote isolated function refundMultiDocumentTransaction(string code, string 'type, RefundTransactionModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(code)}/type/${getEncodedUri('type)}/refund`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Void a MultiDocument transaction
    #
    # + code - The transaction code for this MultiDocument transaction 
    # + 'type - The transaction type for this MultiDocument transaction 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The void request you wish to execute 
    # + return - Success 
    remote isolated function voidMultiDocumentTransaction(string code, string 'type, VoidTransactionModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(code)}/type/${getEncodedUri('type)}/void`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a MultiDocument transaction by ID
    #
    # + id - The unique ID number of the MultiDocument transaction to retrieve 
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getMultiDocumentTransactionById(int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MultiDocumentModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Commit a MultiDocument transaction
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The commit request you wish to execute 
    # + return - Success 
    remote isolated function commitMultiDocumentTransaction(CommitMultiDocumentModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/commit`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Verify a MultiDocument transaction
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information from your accounting system to verify against this MultiDocument transaction as it is stored in AvaTax 
    # + return - Success 
    remote isolated function verifyMultiDocumentTransaction(VerifyMultiDocumentModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns MultiDocumentModel|error {
        string resourcePath = string `/api/v2/transactions/multidocument/verify`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        MultiDocumentModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve nexus for this company
    #
    # + companyId - The ID of the company that owns these nexus objects 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new nexus
    #
    # + companyId - The ID of the company that owns this nexus. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The nexus you wish to create. 
    # + return - Success 
    remote isolated function createNexus(int companyId, NexusModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NexusModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single nexus
    #
    # + companyId - The ID of the company that owns this nexus object 
    # + id - The primary key of this nexus 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getNexus(int companyId, int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single nexus
    #
    # + companyId - The ID of the company that this nexus belongs to. 
    # + id - The ID of the nexus you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The nexus object you wish to update. 
    # + return - Success 
    remote isolated function updateNexus(int companyId, int id, NexusModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NexusModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single nexus
    #
    # + companyId - The ID of the company that owns this nexus. 
    # + id - The ID of the nexus you wish to delete. 
    # + cascadeDelete - If true, deletes all the child nexus if they exist along with parent nexus 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNexus(int companyId, int id, boolean? cascadeDelete = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"cascadeDelete": cascadeDelete};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve parameters for a nexus
    #
    # + companyId - The company id 
    # + nexusId - The nexus id 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* name, unit 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusParameters(int companyId, int nexusId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusParameterDetailModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusParameterDetailModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Add parameters to a nexus.
    #
    # + companyId - The ID of the company that owns this nexus parameter. 
    # + nexusId - The nexus id. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The nexus parameters you wish to create. 
    # + return - Success 
    remote isolated function createNexusParameters(int companyId, int nexusId, NexusParameterDetailModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusParameterDetailModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NexusParameterDetailModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete all parameters for an nexus
    #
    # + companyId - The ID of the company that owns this nexus. 
    # + nexusId - The ID of the nexus you wish to delete the parameters. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNexusParameters(int companyId, int nexusId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve a single nexus parameter
    #
    # + companyId - The company id 
    # + nexusId - The nexus id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getNexusParameter(int companyId, int nexusId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusParameterDetailModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusParameterDetailModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update an nexus parameter
    #
    # + companyId - The company id. 
    # + nexusId - The nexus id 
    # + id - The nexus parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The nexus object you wish to update. 
    # + return - Success 
    remote isolated function updateNexusParameter(int companyId, int nexusId, int id, NexusParameterDetailModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusParameterDetailModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NexusParameterDetailModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single nexus parameter
    #
    # + companyId - The company id 
    # + nexusId - The nexus id 
    # + id - The parameter id 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNexusParameter(int companyId, int nexusId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/${getEncodedUri(nexusId)}/parameters/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Creates nexus for a list of addresses.
    #
    # + companyId - The ID of the company that will own this nexus. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The nexus you wish to create. 
    # + return - Success 
    remote isolated function declareNexusByAddress(int companyId, DeclareNexusByAddressModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusByAddressModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/byaddress`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NexusByAddressModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List company nexus related to a tax form
    #
    # + companyId - The ID of the company that owns this nexus object 
    # + formCode - The form code that we are looking up the nexus for 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getNexusByFormCode(int companyId, string formCode, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusByTaxFormModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/byform/${getEncodedUri(formCode)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusByTaxFormModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve nexus for this company By TaxTypeGroup
    #
    # + companyId - The ID of the company that owns these nexus objects 
    # + taxTypeGroup - Name of TaxTypeGroup to filter by 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNexusByCompanyAndTaxTypeGroup(int companyId, string taxTypeGroup, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/nexus/byTaxTypeGroup/${getEncodedUri(taxTypeGroup)}`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all nexus
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* streamlinedSalesTax, isSSTActive, taxTypeGroup, taxAuthorityId, taxName, parameters, taxableNexus 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryNexus(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NexusModelFetchResult|error {
        string resourcePath = string `/api/v2/nexus`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NexusModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a new tax notice responsibility type.
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The responsibility type to create 
    # + return - Success 
    remote isolated function createNoticeResponsibilityType(CreateNoticeResponsibilityTypeModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeResponsibilityModel|error {
        string resourcePath = string `/api/v2/notices/responsibilities`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NoticeResponsibilityModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a tax notice responsibility type.
    #
    # + responsibilityId - The unique ID of the responsibility type 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNoticeResponsibilityType(int responsibilityId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/notices/responsibilities/${getEncodedUri(responsibilityId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Creates a new tax notice root cause type.
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The root cause type to create 
    # + return - Success 
    remote isolated function createNoticeRootCauseType(CreateNoticeRootCauseTypeModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NoticeRootCauseModel|error {
        string resourcePath = string `/api/v2/notices/rootcauses`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NoticeRootCauseModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a tax notice root cause type.
    #
    # + rootCauseId - The unique ID of the root cause type 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNoticeRootCauseType(int rootCauseId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/notices/rootcauses/${getEncodedUri(rootCauseId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List all notifications.
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listNotifications(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NotificationModelFetchResult|error {
        string resourcePath = string `/api/v2/notifications`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new notifications.
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The notifications you wish to create. 
    # + return - Success 
    remote isolated function createNotifications(NotificationModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NotificationModel[]|error {
        string resourcePath = string `/api/v2/notifications`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NotificationModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single notification.
    #
    # + id - The id of the notification to retrieve. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getNotification(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NotificationModel|error {
        string resourcePath = string `/api/v2/notifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        NotificationModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single notification.
    #
    # + id - The id of the notification you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The notification object you wish to update. 
    # + return - Success 
    remote isolated function updateNotification(int id, NotificationModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NotificationModel|error {
        string resourcePath = string `/api/v2/notifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NotificationModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single notification.
    #
    # + id - The id of the notification you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteNotification(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/notifications/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Mark a single notification as dismissed.
    #
    # + id - The id of the notification you wish to mark as dismissed. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function dismissNotification(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NotificationModel|error {
        string resourcePath = string `/api/v2/notifications/${getEncodedUri(id)}/dismiss`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        NotificationModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Request a new entitilement to an existing customer
    #
    # + id - The avatax account id of the customer 
    # + offer - The offer to be added to an already existing customer 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function requestNewEntitlement(int id, string offer, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns OfferModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(id)}/entitlements/${getEncodedUri(offer)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        OfferModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Request a new Avalara account
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information about the account you wish to create and the selected product offerings. 
    # + return - Success 
    remote isolated function requestNewAccount(NewAccountRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns NewAccountModel|error {
        string resourcePath = string `/api/v2/accounts/request`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        NewAccountModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve List of Accounts by Account Migration Status
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listAccountsByTssWriteMode(string writeMode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AccountMigrationStatusModel|error {
        string resourcePath = string `/api/v2/accounts/ListAccountsByTssWriteMode/${getEncodedUri(writeMode)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AccountMigrationStatusModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reset a user's password programmatically
    #
    # + userId - The unique ID of the user whose password will be changed 
    # + unmigrateFromAi - If user's password was migrated to AI, undo this. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The new password for this user 
    # + return - Success 
    remote isolated function resetPassword(int userId, SetPasswordModel payload, boolean unmigrateFromAi = false, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/passwords/${getEncodedUri(userId)}/reset`;
        map<anydata> queryParam = {"unmigrateFromAi": unmigrateFromAi};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Initiate an ExportDocumentLine report task
    #
    # + companyId - The unique ID number of the company to report on. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Options that may be configured to customize the report. 
    # + return - Success 
    remote isolated function initiateExportDocumentLineReport(int companyId, ExportDocumentLineModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ReportModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/reports/exportdocumentline/initiate`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ReportModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List all report tasks for account
    #
    # + companyId - The id of the company for which to get reports. 
    # + pageKey - Provide a page key to retrieve the next page of results. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listReports(int? companyId = (), string? pageKey = (), int? skip = (), int top = 25, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ReportModelFetchResult|error {
        string resourcePath = string `/api/v2/reports`;
        map<anydata> queryParam = {"companyId": companyId, "pageKey": pageKey, "$skip": skip, "$top": top};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a single report
    #
    # + id - The unique ID number of the report to retrieve 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getReport(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ReportModel|error {
        string resourcePath = string `/api/v2/reports/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReportModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a report
    #
    # + id - The unique ID number of this report 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - OK 
    remote isolated function downloadReport(int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/reports/${getEncodedUri(id)}/attachment`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all settings for this company
    #
    # + companyId - The ID of the company that owns these settings 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* modifiedDate, ModifiedUserId 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listSettingsByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SettingModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/settings`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SettingModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new setting
    #
    # + companyId - The ID of the company that owns this setting. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The setting you wish to create. 
    # + return - Success 
    remote isolated function createSettings(int companyId, SettingModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SettingModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/settings`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        SettingModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single setting
    #
    # + companyId - The ID of the company that owns this setting 
    # + id - The primary key of this setting 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getSetting(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SettingModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/settings/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SettingModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single setting
    #
    # + companyId - The ID of the company that this setting belongs to. 
    # + id - The ID of the setting you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The setting you wish to update. 
    # + return - Success 
    remote isolated function updateSetting(int companyId, int id, SettingModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SettingModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/settings/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        SettingModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single setting
    #
    # + companyId - The ID of the company that owns this setting. 
    # + id - The ID of the setting you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteSetting(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/settings/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all settings
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* modifiedDate, ModifiedUserId 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function querySettings(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SettingModelFetchResult|error {
        string resourcePath = string `/api/v2/settings`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SettingModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve subscriptions for this account
    #
    # + accountId - The ID of the account that owns these subscriptions 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptionDescription 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listSubscriptionsByAccount(int accountId, string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModelFetchResult|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/subscriptions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new subscription
    #
    # + accountId - The ID of the account that owns this subscription. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The subscription you wish to create. 
    # + return - Success 
    remote isolated function createSubscriptions(int accountId, SubscriptionModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/subscriptions`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        SubscriptionModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single subscription
    #
    # + accountId - The ID of the account that owns this subscription 
    # + id - The primary key of this subscription 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getSubscription(int accountId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single subscription
    #
    # + accountId - The ID of the account that this subscription belongs to. 
    # + id - The ID of the subscription you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The subscription you wish to update. 
    # + return - Success 
    remote isolated function updateSubscription(int accountId, int id, SubscriptionModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        SubscriptionModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single subscription
    #
    # + accountId - The ID of the account that owns this subscription. 
    # + id - The ID of the subscription you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteSubscription(int accountId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/subscriptions/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all subscriptions
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* subscriptionDescription 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function querySubscriptions(string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModelFetchResult|error {
        string resourcePath = string `/api/v2/subscriptions`;
        map<anydata> queryParam = {"$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve tax codes for this company
    #
    # + companyId - The ID of the company that owns these tax codes 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxCodesByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxcodes`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new tax code
    #
    # + companyId - The ID of the company that owns this tax code. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The tax code you wish to create. 
    # + return - Success 
    remote isolated function createTaxCodes(int companyId, TaxCodeModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxcodes`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TaxCodeModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single tax code
    #
    # + companyId - The ID of the company that owns this tax code 
    # + id - The primary key of this tax code 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getTaxCode(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxcodes/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxCodeModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single tax code
    #
    # + companyId - The ID of the company that this tax code belongs to. 
    # + id - The ID of the tax code you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The tax code you wish to update. 
    # + return - Success 
    remote isolated function updateTaxCode(int companyId, int id, TaxCodeModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxcodes/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TaxCodeModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single tax code
    #
    # + companyId - The ID of the company that owns this tax code. 
    # + id - The ID of the tax code you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteTaxCode(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxcodes/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all tax codes
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryTaxCodes(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxCodeModelFetchResult|error {
        string resourcePath = string `/api/v2/taxcodes`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxCodeModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Build a tax content file for a single location
    #
    # + companyId - The ID number of the company that owns this location. 
    # + id - The ID number of the location to retrieve point-of-sale data. 
    # + date - The date for which point-of-sale data would be calculated (today by default) 
    # + format - The format of the file (JSON by default) 
    # + partnerId - If specified, requests a custom partner-formatted version of the file. 
    # + includeJurisCodes - When true, the file will include jurisdiction codes in the result. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - OK 
    remote isolated function buildTaxContentFileForLocation(int companyId, int id, string? date = (), string? format = (), string? partnerId = (), boolean? includeJurisCodes = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/locations/${getEncodedUri(id)}/pointofsaledata`;
        map<anydata> queryParam = {"date": date, "format": format, "partnerId": partnerId, "includeJurisCodes": includeJurisCodes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Build a multi-location tax content file
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Parameters about the desired file format and report format, specifying which company, locations and TaxCodes to include. 
    # + return - OK 
    remote isolated function buildTaxContentFile(PointOfSaleDataRequestModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/pointofsaledata/build`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sales tax rates for a specified address
    #
    # + line1 - The street address of the location. 
    # + line2 - The street address of the location. 
    # + line3 - The street address of the location. 
    # + city - The city name of the location. 
    # + region - Name or ISO 3166 code identifying the region within the country. This field supports many different region identifiers: Two and three character ISO 3166 region codes. Fully spelled out names of the region in ISO supported languages. Common alternative spellings for many regions. For a full list of all supported codes and names, please see the Definitions API `ListRegions`. 
    # + postalCode - The postal code of the location. 
    # + country - Name or ISO 3166 code identifying the country. This field supports many different country identifiers: Two character ISO 3166 codes. Three character ISO 3166 codes. Fully spelled out names of the country in ISO supported languages. Common alternative spellings for many countries. For a full list of all supported codes and names, please see the Definitions API `ListCountries`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function taxRatesByAddress(string line1, string region, string postalCode, string country, string? line2 = (), string? line3 = (), string? city = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRateModel|error {
        string resourcePath = string `/api/v2/taxrates/byaddress`;
        map<anydata> queryParam = {"line1": line1, "line2": line2, "line3": line3, "city": city, "region": region, "postalCode": postalCode, "country": country};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxRateModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Sales tax rates for a specified country and postal code. This API is only available for US postal codes.
    #
    # + country - Name or ISO 3166 code identifying the country. This field supports many different country identifiers: Two character ISO 3166 codes. Three character ISO 3166 codes. Fully spelled out names of the country in ISO supported languages. Common alternative spellings for many countries. For a full list of all supported codes and names, please see the Definitions API `ListCountries`. 
    # + postalCode - The postal code of the location. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function taxRatesByPostalCode(string country, string postalCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRateModel|error {
        string resourcePath = string `/api/v2/taxrates/bypostalcode`;
        map<anydata> queryParam = {"country": country, "postalCode": postalCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxRateModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a file listing tax rates by postal code
    #
    # + date - The date for which point-of-sale data would be calculated (today by default). Example input: 2016-12-31 
    # + region - A two character region code which limits results to a specific region. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - OK 
    remote isolated function downloadTaxRatesByZipCode(string date, string? region = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/taxratesbyzipcode/download/${getEncodedUri(date)}`;
        map<anydata> queryParam = {"region": region};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve tax rules for this company
    #
    # + companyId - The ID of the company that owns these tax rules 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, taxTypeCode, taxRuleProductDetail, rateTypeCode, taxTypeGroup, taxSubType, unitOfBasis 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTaxRules(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRuleModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxrules`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxRuleModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new tax rule
    #
    # + companyId - The ID of the company that owns this tax rule. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The tax rule you wish to create. 
    # + return - Success 
    remote isolated function createTaxRules(int companyId, TaxRuleModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRuleModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxrules`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TaxRuleModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single tax rule
    #
    # + companyId - The ID of the company that owns this tax rule 
    # + id - The primary key of this tax rule 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getTaxRule(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRuleModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxrules/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxRuleModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single tax rule
    #
    # + companyId - The ID of the company that this tax rule belongs to. 
    # + id - The ID of the tax rule you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The tax rule you wish to update. 
    # + return - Success 
    remote isolated function updateTaxRule(int companyId, int id, TaxRuleModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRuleModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxrules/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TaxRuleModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single tax rule
    #
    # + companyId - The ID of the company that owns this tax rule. 
    # + id - The ID of the tax rule you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteTaxRule(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/taxrules/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all tax rules
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* taxCode, taxTypeCode, taxRuleProductDetail, rateTypeCode, taxTypeGroup, taxSubType, unitOfBasis 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryTaxRules(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TaxRuleModelFetchResult|error {
        string resourcePath = string `/api/v2/taxrules`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TaxRuleModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve all transactions
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + dataSourceId - Optionally filter transactions to those from a specific data source. 
    # + include - Specifies objects to include in this fetch call 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exchangeRateCurrencyCode, totalDiscount, lines, addresses, locationTypes, summary, taxDetailsByTaxType, parameters, userDefinedFields, messages, invoiceMessages, isFakeTransaction, deliveryTerms 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listTransactionsByCompany(string companyCode, int? dataSourceId = (), string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions`;
        map<anydata> queryParam = {"dataSourceId": dataSourceId, "$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TransactionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve a single transaction by code
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to retrieve 
    # + documentType - (Optional): The document type of the transaction to retrieve 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getTransactionByCode(string companyCode, string transactionCode, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TransactionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Correct a previously created transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to adjust 
    # + documentType - (Optional): The document type of the transaction to adjust. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The adjustment you wish to make 
    # + return - Success 
    remote isolated function adjustTransaction(string companyCode, string transactionCode, AdjustTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/adjust`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get audit information about a transaction
    #
    # + companyCode - The code identifying the company that owns this transaction 
    # + transactionCode - The code identifying the transaction 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function auditTransaction(string companyCode, string transactionCode, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AuditTransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/audit`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditTransactionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change a transaction's code
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to change 
    # + documentType - (Optional): The document type of the transaction to change document code. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The code change request you wish to execute 
    # + return - Success 
    remote isolated function changeTransactionCode(string companyCode, string transactionCode, ChangeTransactionCodeModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/changecode`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Commit a transaction for reporting
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to commit 
    # + documentType - (Optional): The document type of the transaction to commit. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The commit request you wish to execute 
    # + return - Success 
    remote isolated function commitTransaction(string companyCode, string transactionCode, CommitTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/commit`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Lock a single transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to lock 
    # + documentType - (Optional): The document type of the transaction to lock. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The lock request you wish to execute 
    # + return - Success 
    remote isolated function lockTransaction(string companyCode, string transactionCode, LockTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/lock`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create a refund for a transaction
    #
    # + companyCode - The code of the company that made the original sale 
    # + transactionCode - The transaction code of the original sale 
    # + include - Specifies objects to include in the response after transaction is created 
    # + documentType - (Optional): The document type of the transaction to refund. If not provided, the default is SalesInvoice. 
    # + useTaxDateOverride - (Optional): If set to true, processes refund using taxDateOverride rather than taxAmountOverride (Note: taxAmountOverride is not allowed for SST states). 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - Information about the refund to create 
    # + return - Success 
    remote isolated function refundTransaction(string companyCode, string transactionCode, RefundTransactionModel payload, string? include = (), string? documentType = (), boolean useTaxDateOverride = false, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/refund`;
        map<anydata> queryParam = {"$include": include, "documentType": documentType, "useTaxDateOverride": useTaxDateOverride};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Perform multiple actions on a transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to settle 
    # + documentType - (Optional): The document type of the transaction to settle. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The data from an external system to reconcile against AvaTax 
    # + return - Success 
    remote isolated function settleTransaction(string companyCode, string transactionCode, SettleTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/settle`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single transaction by code
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to retrieve 
    # + documentType - The transaction type to retrieve 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getTransactionByCodeAndType(string companyCode, string transactionCode, string documentType, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/types/${getEncodedUri(documentType)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TransactionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get audit information about a transaction
    #
    # + companyCode - The code identifying the company that owns this transaction 
    # + transactionCode - The code identifying the transaction 
    # + documentType - The document type of the original transaction 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function auditTransactionWithType(string companyCode, string transactionCode, string documentType, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns AuditTransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/types/${getEncodedUri(documentType)}/audit`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AuditTransactionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Uncommit a transaction for reporting
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to Uncommit 
    # + documentType - (Optional): The document type of the transaction to Uncommit. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function uncommitTransaction(string companyCode, string transactionCode, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/uncommit`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unvoids a transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to commit 
    # + documentType - (Optional): The document type of the transaction to commit. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function unvoidTransaction(string companyCode, string transactionCode, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/unvoid`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Verify a transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to settle 
    # + documentType - (Optional): The document type of the transaction to verify. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The data from an external system to reconcile against AvaTax 
    # + return - Success 
    remote isolated function verifyTransaction(string companyCode, string transactionCode, VerifyTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/verify`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Void a transaction
    #
    # + companyCode - The company code of the company that recorded this transaction 
    # + transactionCode - The transaction code to void 
    # + documentType - (Optional): The document type of the transaction to void. If not provided, the default is SalesInvoice. 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The void request you wish to execute. To void a transaction the code must be set to 'DocVoided' 
    # + return - Success 
    remote isolated function voidTransaction(string companyCode, string transactionCode, VoidTransactionModel payload, string? documentType = (), string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyCode)}/transactions/${getEncodedUri(transactionCode)}/void`;
        map<anydata> queryParam = {"documentType": documentType, "$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Add lines to an existing unlocked transaction
    #
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - information about the transaction and lines to be added 
    # + return - Success 
    remote isolated function addLines(AddTransactionLineModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/transactions/lines/add`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Remove lines from an existing unlocked transaction
    #
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - information about the transaction and lines to be removed 
    # + return - Success 
    remote isolated function deleteLines(RemoveTransactionLineModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/companies/transactions/lines/delete`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single transaction by ID
    #
    # + id - The unique ID number of the transaction to retrieve 
    # + include - Specifies objects to include in this fetch call 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getTransactionById(int id, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/transactions/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TransactionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new transaction
    #
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The transaction you wish to create 
    # + return - Success 
    remote isolated function createTransaction(CreateTransactionModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/transactions/create`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Create or adjust a transaction
    #
    # + include - Specifies objects to include in the response after transaction is created 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The transaction you wish to create or adjust 
    # + return - Success 
    remote isolated function createOrAdjustTransaction(CreateOrAdjustTransactionModel payload, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns TransactionModel|error {
        string resourcePath = string `/api/v2/transactions/createoradjust`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TransactionModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Lock a set of documents
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - bulk lock request 
    # + return - Success 
    remote isolated function bulkLockTransaction(BulkLockTransactionModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns BulkLockTransactionResult|error {
        string resourcePath = string `/api/v2/transactions/lock`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        BulkLockTransactionResult response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve UPCs for this company
    #
    # + companyId - The ID of the company that owns these UPCs 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listUPCsByCompany(int companyId, string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UPCModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/upcs`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UPCModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new UPC
    #
    # + companyId - The ID of the company that owns this UPC. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The UPC you wish to create. 
    # + return - Success 
    remote isolated function createUPCs(int companyId, UPCModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UPCModel[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/upcs`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        UPCModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single UPC
    #
    # + companyId - The ID of the company that owns this UPC 
    # + id - The primary key of this UPC 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getUPC(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UPCModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/upcs/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UPCModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single UPC
    #
    # + companyId - The ID of the company that this UPC belongs to. 
    # + id - The ID of the UPC you wish to update 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The UPC you wish to update. 
    # + return - Success 
    remote isolated function updateUPC(int companyId, int id, UPCModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UPCModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/upcs/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        UPCModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single UPC
    #
    # + companyId - The ID of the company that owns this UPC. 
    # + id - The ID of the UPC you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteUPC(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/upcs/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all UPCs
    #
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/). 
    # + include - A comma separated list of additional data to retrieve. 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryUPCs(string? filter = (), string? include = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UPCModelFetchResult|error {
        string resourcePath = string `/api/v2/upcs`;
        map<anydata> queryParam = {"$filter": filter, "$include": include, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UPCModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # 
    # 
    # ### Security Policies
    # 
    # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, Compliance Root User, ComplianceAdmin, ComplianceUser, CSPAdmin, CSPTester, FirmAdmin, FirmUser, ProStoresOperator, Registrar, SiteAdmin, SSTAdmin, SystemAdmin, TechnicalSupportAdmin, TechnicalSupportUser, TreasuryAdmin, TreasuryUser.
    # * This API depends on the following active services:*Required* (all):  AvaTaxPro, BasicReturns.
    #
    # + udfType - Document or Line level UDF 
    # + allowDefaults - If true this will add defaulted UDFs to the list that are not named yet 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listUserDefinedFieldsByCompanyId(int companyId, string udfType = "Document", boolean allowDefaults = true, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyUserDefinedFieldModelFetchResult|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/userdefinedfields`;
        map<anydata> queryParam = {"udfType": udfType, "allowDefaults": allowDefaults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompanyUserDefinedFieldModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a User Defined Field identified by id for a company
    #
    # + companyId - The id of the company the user defined field belongs to. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function updateUserDefinedField(int companyId, CompanyUserDefinedFieldModel payload, int? id = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns CompanyUserDefinedFieldModel|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/userdefinedfields`;
        map<anydata> queryParam = {"id": id};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        CompanyUserDefinedFieldModel response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a User Defined Field by User Defined Field id for a company.
    #
    # + companyId - The id of the company the User Defined Field belongs to. 
    # + id - The id of the User Defined Field you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteUserDefinedField(int companyId, int id, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/companies/${getEncodedUri(companyId)}/userdefinedfields/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve users for this account
    #
    # + accountId - The accountID of the user you wish to list. 
    # + include - Optional fetch commands. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* SuppressNewUserEmail 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listUsersByAccount(int accountId, string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserModelFetchResult|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create new users
    #
    # + accountId - The unique ID number of the account where these users will be created. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The user or array of users you wish to create. 
    # + return - Success 
    remote isolated function createUsers(int accountId, UserModel[] payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserModel[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        UserModel[] response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve a single user
    #
    # + id - The ID of the user to retrieve. 
    # + accountId - The accountID of the user you wish to get. 
    # + include - Optional fetch commands. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getUser(int id, int accountId, string? include = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"$include": include};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a single user
    #
    # + id - The ID of the user you wish to update. 
    # + accountId - The accountID of the user you wish to update. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - The user object you wish to update. 
    # + return - Success 
    remote isolated function updateUser(int id, int accountId, UserModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        UserModel response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a single user
    #
    # + id - The ID of the user you wish to delete. 
    # + accountId - The accountID of the user you wish to delete. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function deleteUser(int id, int accountId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns ErrorDetail[]|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(id)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ErrorDetail[] response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Retrieve all entitlements for a single user
    #
    # + id - The ID of the user to retrieve. 
    # + accountId - The accountID of the user you wish to get. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getUserEntitlements(int id, int accountId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserEntitlementModel|error {
        string resourcePath = string `/api/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(id)}/entitlements`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserEntitlementModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change Password
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + payload - An object containing your current password and the new password. 
    # + return - Success 
    remote isolated function changePassword(PasswordChangeModel payload, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns string|error {
        string resourcePath = string `/api/v2/passwords`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        string response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve all users
    #
    # + include - Optional fetch commands. 
    # + filter - A filter statement to identify specific records to retrieve.  For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* SuppressNewUserEmail 
    # + top - If nonzero, return no more than this number of results.  Used with `$skip` to provide pagination for large datasets.  Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records. 
    # + skip - If nonzero, skip this number of results before returning data.  Used with `$top` to provide pagination for large datasets. 
    # + orderby - A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`. 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function queryUsers(string? include = (), string? filter = (), int? top = (), int? skip = (), string? orderby = (), string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns UserModelFetchResult|error {
        string resourcePath = string `/api/v2/users`;
        map<anydata> queryParam = {"$include": include, "$filter": filter, "$top": top, "$skip": skip, "$orderBy": orderby};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UserModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Tests connectivity and version of the service
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function ping(string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns PingResultModel|error {
        string resourcePath = string `/api/v2/utilities/ping`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PingResultModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List all services to which the current user is subscribed
    #
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function listMySubscriptions(string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModelFetchResult|error {
        string resourcePath = string `/api/v2/utilities/subscriptions`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionModelFetchResult response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Checks if the current user is subscribed to a specific service
    #
    # + serviceTypeId - The service to check 
    # + xAvalaraClient - Identifies the software you are using to call this API.  For more information on the client header, see [Client Headers](https://developer.avalara.com/avatax/client-headers/) . 
    # + return - Success 
    remote isolated function getMySubscription(string serviceTypeId, string xAvalaraClient = "Swagger UI; 21.12.0; Custom; 1.0") returns SubscriptionModel|error {
        string resourcePath = string `/api/v2/utilities/subscriptions/${getEncodedUri(serviceTypeId)}`;
        map<any> headerValues = {"X-Avalara-Client": xAvalaraClient};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SubscriptionModel response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
