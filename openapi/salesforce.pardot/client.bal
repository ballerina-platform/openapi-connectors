// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Salesforce Pardot API v5](https://developer.salesforce.com/docs/marketing/pardot/guide/version5overview.html) OpenAPI specification.
# The version 5 of the Pardot API to read and update a variety of assets and objects, like File and Layout Template objects.
@display {label: "Salesforce Pardot", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Salesforce account](https://www.salesforce.com) and obtain tokens following [this guide](https://developer.salesforce.com/docs/marketing/pardot/guide/authentication.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://pi.demo.pardot.com/api/v5") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieves a single campaign.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readCampaign(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/campaigns/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of campaigns.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + name - Returns any records where Name is equal to the given string value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryCampaigns(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? name = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/campaigns`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "name": name, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single custom field.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readCustomField(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/custom-fields/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a custom field.
    #
    # + id - (required) CustomField record id 
    # + return - No content 
    remote isolated function deleteCustomField(string id) returns http:Response|error {
        string resourcePath = string `/objects/custom-fields/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates a custom field.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + payload - Custom Field update request 
    # + return - Response payload 
    remote isolated function updateCustomField(string fields, string id, CustomFieldUpdateRequest payload) returns Record|error {
        string resourcePath = string `/objects/custom-fields/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieves a collection of custom fields.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryCustomFields(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/custom-fields`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a custom field.
    #
    # + fields - Record fields to return 
    # + payload - Custom Field create request 
    # + return - Response payload 
    remote isolated function createCustomField(string fields, CustomFieldCreateRequest payload) returns Record|error {
        string resourcePath = string `/objects/custom-fields`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a single custom redirect.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readCustomRedirect(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/custom-redirects/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a custom redirect.
    #
    # + id - Record id 
    # + return - No content 
    remote isolated function deleteCustomRedirect(string id) returns http:Response|error {
        string resourcePath = string `/objects/custom-redirects/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates a custom redirect.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + payload - Custom Redirects update request 
    # + return - Response payload 
    remote isolated function updateCustomRedirect(string fields, string id, CustomRedirectsUpdateRequest payload) returns Record|error {
        string resourcePath = string `/objects/custom-redirects/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieves a collection of custom redirects.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryCustomRedirects(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/custom-redirects`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a custom redirect.
    #
    # + fields - (required) CustomRedirect fields to return 
    # + payload - Custom Redirects create request 
    # + return - Response payload 
    remote isolated function createCustomRedirect(string fields, CustomRedirectsCreateRequest payload) returns Record|error {
        string resourcePath = string `/objects/custom-redirects`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Submits external activity to Pardot. 
    #
    # + payload - External Activity create request 
    # + return - Response payload 
    remote isolated function createExternalActivity(ExternalActivityCreateRequest payload) returns Record|error {
        string resourcePath = string `/external-activities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a single file.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readFile(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/files/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a file.
    #
    # + id - (required) record id 
    # + return - No content 
    remote isolated function deleteFile(string id) returns http:Response|error {
        string resourcePath = string `/objects/files/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Updates a file.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + payload - File update request 
    # + return - Response payload 
    remote isolated function updateFile(string fields, string id, FileUpdateRequest payload) returns Record|error {
        string resourcePath = string `/objects/files/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieves a collection of files.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + return - Response payload 
    remote isolated function queryFiles(string fields, string? orderBy = ()) returns Record|error {
        string resourcePath = string `/objects/files`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a file.
    #
    # + fields - Record fields to return 
    # + payload - File create request payload 
    # + return - Response payload 
    remote isolated function createFile(string fields, FileCreateRequestObject payload) returns Record|error {
        string resourcePath = string `/objects/files`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a single folder.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readFolder(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/folders/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of folders.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + parentFolderId - Returns any records where the parentFolderId is equal to the given integer value. 
    # + parentFolderIdGreaterThan - Returns any records where the parentFolderId is greater than the specified value, non-inclusive. 
    # + parentFolderIdGreaterThanOrEqualTo - Returns any records where the parentFolderId is greater than or equal to the specified value. 
    # + parentFolderIdLessThan - Returns any records where the parentFolderId is less than the specified value, non-inclusive. 
    # + parentFolderIdLessThanOrEqualTo - Returns any records where the parentFolderId is less than or equal to the specified value. 
    # + parentFolderIdIsNull - Returns any records where the parentFolderId is null when true is specified. 
    # + parentFolderIdIsNotNull - Returns any records where the parentFolderId isn’t null when true is specified. 
    # + return - Response payload 
    remote isolated function queryFolders(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), int? parentFolderId = (), int? parentFolderIdGreaterThan = (), int? parentFolderIdGreaterThanOrEqualTo = (), int? parentFolderIdLessThan = (), int? parentFolderIdLessThanOrEqualTo = (), boolean? parentFolderIdIsNull = (), boolean? parentFolderIdIsNotNull = ()) returns Record|error {
        string resourcePath = string `/objects/folders`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "parentFolderId": parentFolderId, "parentFolderIdGreaterThan": parentFolderIdGreaterThan, "parentFolderIdGreaterThanOrEqualTo": parentFolderIdGreaterThanOrEqualTo, "parentFolderIdLessThan": parentFolderIdLessThan, "parentFolderIdLessThanOrEqualTo": parentFolderIdLessThanOrEqualTo, "parentFolderIdIsNull": parentFolderIdIsNull, "parentFolderIdIsNotNull": parentFolderIdIsNotNull};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single form.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readForm(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/forms/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of forms.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryForms(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/forms`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single layout template.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readLayoutTemplates(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/layout-templates/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a layout template.
    #
    # + id - (required) record id 
    # + return - No content 
    remote isolated function deleteLayoutTemplate(string id) returns http:Response|error {
        string resourcePath = string `/objects/layout-templates/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update a layout template.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + payload - Layout Template update request 
    # + return - Response payload 
    remote isolated function updateLayoutTemplate(string fields, string id, LayoutTemplateUpdateRequest payload) returns Record|error {
        string resourcePath = string `/objects/layout-templates/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve a collection of layout templates.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryLayoutTemplates(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/layout-templates`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a layout template.
    #
    # + fields - Record fields to return 
    # + payload - Layout Template create request 
    # + return - Response payload 
    remote isolated function createLayoutTemplate(string fields, LayoutTemplateCreateRequest payload) returns Record|error {
        string resourcePath = string `/objects/layout-templates`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a single list.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readList(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/lists/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a list.
    #
    # + id - Record id 
    # + return - No content 
    remote isolated function deleteList(string id) returns http:Response|error {
        string resourcePath = string `/objects/lists/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update a list.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + payload - List update request 
    # + return - Response payload 
    remote isolated function updateList(string fields, string id, ListUpdateRequest payload) returns Record|error {
        string resourcePath = string `/objects/lists/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieve a collection of lists.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + name - Returns any records where Name is equal to the given string value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryLists(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? name = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/lists`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "name": name, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a list.
    #
    # + fields - Record fields to return 
    # + payload - List create request 
    # + return - Response payload 
    remote isolated function createList(string fields, ListCreateRequest payload) returns Record|error {
        string resourcePath = string `/objects/lists`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Record response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a single prospect.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readProspect(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/prospects/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of prospects.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + lastActivityAt - Returns any records where LastActivityAt is equal to the given datetime value. 
    # + lastActivityAtAfter - Returns any records where LastActivityAt is after the given datetime value, non-inclusive. 
    # + lastActivityAtAfterOrEqualTo - Returns any records where LastActivityAt is after or equal to the given datetime value. 
    # + lastActivityAtBefore - Returns any records where LastActivityAt is before the given datetime value, non-inclusive. 
    # + lastActivityAtBeforeOrEqualTo - Returns any records where LastActivityAt is before or equal to the given datetime value. 
    # + userId - Returns any records where UserId is equal to the given integer value. 
    # + userIdGreaterThan - Returns any records where UserId is greater than the specified value, non-inclusive. 
    # + userIdGreaterThanOrEqualTo - Returns any records where UserId is greater than or equal to the specified value. 
    # + userIdLessThan - Returns any records where UserId is less than the specified value, non-inclusive. 
    # + userIdLessThanOrEqualTo - Returns any records where UserId is less than or equal to the specified value. 
    # + assignedToId - Returns any records where AssignedToId is equal to the given integer value. 
    # + assignedToIdGreaterThan - Returns any records where AssignedToId is greater than the specified value, non-inclusive. 
    # + assignedToIdGreaterThanOrEqualTo - Returns any records where AssignedToId is greater than or equal to the specified value. 
    # + assignedToIdLessThan - Returns any records where AssignedToId is less than the specified value, non-inclusive. 
    # + assignedToIdLessThanOrEqualTo - Returns any records where AssignedToId is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryProspects(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = (), string? lastActivityAt = (), string? lastActivityAtAfter = (), string? lastActivityAtAfterOrEqualTo = (), string? lastActivityAtBefore = (), string? lastActivityAtBeforeOrEqualTo = (), int? userId = (), int? userIdGreaterThan = (), int? userIdGreaterThanOrEqualTo = (), int? userIdLessThan = (), int? userIdLessThanOrEqualTo = (), int? assignedToId = (), int? assignedToIdGreaterThan = (), int? assignedToIdGreaterThanOrEqualTo = (), int? assignedToIdLessThan = (), int? assignedToIdLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/prospects`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo, "lastActivityAt": lastActivityAt, "lastActivityAtAfter": lastActivityAtAfter, "lastActivityAtAfterOrEqualTo": lastActivityAtAfterOrEqualTo, "lastActivityAtBefore": lastActivityAtBefore, "lastActivityAtBeforeOrEqualTo": lastActivityAtBeforeOrEqualTo, "userId": userId, "userIdGreaterThan": userIdGreaterThan, "userIdGreaterThanOrEqualTo": userIdGreaterThanOrEqualTo, "userIdLessThan": userIdLessThan, "userIdLessThanOrEqualTo": userIdLessThanOrEqualTo, "assignedToId": assignedToId, "assignedToIdGreaterThan": assignedToIdGreaterThan, "assignedToIdGreaterThanOrEqualTo": assignedToIdGreaterThanOrEqualTo, "assignedToIdLessThan": assignedToIdLessThan, "assignedToIdLessThanOrEqualTo": assignedToIdLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single prospect account.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readProspectAccount(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/prospect-accounts/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of prospect accounts.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryProspectAccounts(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/prospect-accounts`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single tracker domain.
    #
    # + fields - (Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readTrackerDomain(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/tracker-domains/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of tracker domains.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + return - Response payload 
    remote isolated function queryTrackerDomains(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/tracker-domains`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single user.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readUser(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/users/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of users.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + email - Returns any records where Email is equal to the given string value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryUsers(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? email = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/users`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "email": email, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single visit.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function readVisit(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/visits/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of visits.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + visitorId - Returns any records where VisitorId is equal to the given integer value. 
    # + visitorIdGreaterThan - Returns any records where VisitorId is greater than the specified value, non-inclusive. 
    # + visitorIdGreaterThanOrEqualTo - Returns any records where VisitorId is greater than or equal to the specified value. 
    # + visitorIdLessThan - Returns any records where VisitorId is less than the specified value, non-inclusive. 
    # + visitorIdLessThanOrEqualTo - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + prospectId - Returns any records where ProspectId is equal to the given integer value. 
    # + prospectIdGreaterThan - Returns any records where ProspectId is greater than the specified value, non-inclusive. 
    # + prospectIdGreaterThanOrEqualTo - Returns any records where ProspectId is greater than or equal to the specified value. 
    # + prospectIdLessThan - Returns any records where ProspectId is less than the specified value, non-inclusive. 
    # + prospectIdLessThanOrEqualTo - Returns any records where ProspectId is less than or equal to the specified value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryVisits(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), int? visitorId = (), int? visitorIdGreaterThan = (), int? visitorIdGreaterThanOrEqualTo = (), int? visitorIdLessThan = (), int? visitorIdLessThanOrEqualTo = (), int? prospectId = (), int? prospectIdGreaterThan = (), int? prospectIdGreaterThanOrEqualTo = (), int? prospectIdLessThan = (), int? prospectIdLessThanOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/visits`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "visitorId": visitorId, "visitorIdGreaterThan": visitorIdGreaterThan, "visitorIdGreaterThanOrEqualTo": visitorIdGreaterThanOrEqualTo, "visitorIdLessThan": visitorIdLessThan, "visitorIdLessThanOrEqualTo": visitorIdLessThanOrEqualTo, "prospectId": prospectId, "prospectIdGreaterThan": prospectIdGreaterThan, "prospectIdGreaterThanOrEqualTo": prospectIdGreaterThanOrEqualTo, "prospectIdLessThan": prospectIdLessThan, "prospectIdLessThanOrEqualTo": prospectIdLessThanOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a single visitor page view.
    #
    # + fields - Record fields to return 
    # + id - Record id 
    # + return - Response payload 
    remote isolated function getVisitorPageViews(string fields, string id) returns Record|error {
        string resourcePath = string `/objects/visitor-page-views/${id}`;
        map<anydata> queryParam = {"fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a collection of visitor page views.
    #
    # + fields - Record fields to return 
    # + orderBy - When executing a query, the following fields can be specified in the orderBy parameter. 
    # + id - Returns any records where ID is equal to the given integer value. 
    # + idGreaterThan - Returns any records where ID is greater than the specified value, non-inclusive. 
    # + idGreaterThanOrEqualTo - Returns any records where ID is greater than or equal to the specified value. 
    # + idLessThan - Returns any records where ID is less than the specified value, non-inclusive. 
    # + idLessThanOrEqualTo - Returns any records where ID is less than or equal to the specified value. 
    # + visitorId - Returns any records where VisitorId is equal to the given integer value. 
    # + visitorIdGreaterThan - Returns any records where VisitorId is greater than the specified value, non-inclusive. 
    # + visitorIdGreaterThanOrEqualTo - Returns any records where VisitorId is greater than or equal to the specified value. 
    # + visitorIdLessThan - Returns any records where VisitorId is less than the specified value, non-inclusive. 
    # + visitorIdLessThanOrEqualTo - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + visitId - Returns any visitor page view where VisitId is equal to the given integer value. 
    # + visitIdGreaterThan - Returns any visitor page view where VisitId is greater than the specified value, non-inclusive. 
    # + visitIdGreaterThanOrEqualTo - Returns any visitor page view where VisitId is greater than or equal to the specified value. 
    # + visitIdLessThan - Returns any visitor page view where VisitId is less than the specified value, non-inclusive. 
    # + visitIdLessThanOrEqualTo - Returns any visitor page view where VisitId is less than or equal to the specified value. 
    # + createdAt - Returns any records where CreatedAt is equal to the given datetime value. 
    # + createdAtAfter - Returns any records where CreatedAt is after the given datetime value, non-inclusive. 
    # + createdAtAfterOrEqualTo - Returns any records where CreatedAt is after or equal to the given datetime value. 
    # + createdAtBefore - Returns any records where CreatedAt is before the given datetime value, non-inclusive. 
    # + createdAtBeforeOrEqualTo - Returns any records where CreatedAt is before or equal to the given datetime value. 
    # + updatedAt - Returns any records where UpdatedAt is equal to the given datetime value.e. 
    # + updatedAtAfter - Returns any records where UpdatedAt is after the given datetime value, non-inclusive. 
    # + updatedAtAfterOrEqualTo - Returns any records where UpdatedAt is after or equal to the given datetime value. 
    # + updatedAtBefore - Returns any records where UpdatedAt is before the given datetime value, non-inclusive. 
    # + updatedAtBeforeOrEqualTo - Returns any records where UpdatedAt is before or equal to the given datetime value. 
    # + return - Response payload 
    remote isolated function queryVisitorPageViews(string fields, string? orderBy = (), int? id = (), int? idGreaterThan = (), int? idGreaterThanOrEqualTo = (), int? idLessThan = (), int? idLessThanOrEqualTo = (), int? visitorId = (), int? visitorIdGreaterThan = (), int? visitorIdGreaterThanOrEqualTo = (), int? visitorIdLessThan = (), int? visitorIdLessThanOrEqualTo = (), int? visitId = (), int? visitIdGreaterThan = (), int? visitIdGreaterThanOrEqualTo = (), int? visitIdLessThan = (), int? visitIdLessThanOrEqualTo = (), string? createdAt = (), string? createdAtAfter = (), string? createdAtAfterOrEqualTo = (), string? createdAtBefore = (), string? createdAtBeforeOrEqualTo = (), string? updatedAt = (), string? updatedAtAfter = (), string? updatedAtAfterOrEqualTo = (), string? updatedAtBefore = (), string? updatedAtBeforeOrEqualTo = ()) returns Record|error {
        string resourcePath = string `/objects/visitor-page-views`;
        map<anydata> queryParam = {"fields": fields, "orderBy": orderBy, "id": id, "idGreaterThan": idGreaterThan, "idGreaterThanOrEqualTo": idGreaterThanOrEqualTo, "idLessThan": idLessThan, "idLessThanOrEqualTo": idLessThanOrEqualTo, "visitorId": visitorId, "visitorIdGreaterThan": visitorIdGreaterThan, "visitorIdGreaterThanOrEqualTo": visitorIdGreaterThanOrEqualTo, "visitorIdLessThan": visitorIdLessThan, "visitorIdLessThanOrEqualTo": visitorIdLessThanOrEqualTo, "visitId": visitId, "visitIdGreaterThan": visitIdGreaterThan, "visitIdGreaterThanOrEqualTo": visitIdGreaterThanOrEqualTo, "visitIdLessThan": visitIdLessThan, "visitIdLessThanOrEqualTo": visitIdLessThanOrEqualTo, "createdAt": createdAt, "createdAtAfter": createdAtAfter, "createdAtAfterOrEqualTo": createdAtAfterOrEqualTo, "createdAtBefore": createdAtBefore, "createdAtBeforeOrEqualTo": createdAtBeforeOrEqualTo, "updatedAt": updatedAt, "updatedAtAfter": updatedAtAfter, "updatedAtAfterOrEqualTo": updatedAtAfterOrEqualTo, "updatedAtBefore": updatedAtBefore, "updatedAtBeforeOrEqualTo": updatedAtBeforeOrEqualTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Record response = check self.clientEp->get(resourcePath);
        return response;
    }
}
