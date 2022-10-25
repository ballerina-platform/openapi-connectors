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

# This is a generated connector for [DocuSign Rooms API](https://developers.docusign.com/docs/rooms-api/) OpenAPI specification.  DocuSign Rooms streamlines real estate and mortgage workflows by connecting all parties in a digital, secure, and central workspace. With the DocuSign Rooms API, it’s easy to integrate Rooms functionality into your own solutions.
@display {label: "DocuSign Rooms", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [DocuSign account](https://www.docusign.com/) and obtain tokens by following [this guide](https://developers.docusign.com/docs/rooms-api/rooms101/auth/).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://rooms.docusign.com/restapi") returns error? {
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
    # Gets account information.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Account information successfully retrieved 
    remote isolated function getAccountInformation(string accountId) returns AccountSummary|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}`;
        AccountSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets information about or the contents of a document.
    #
    # + documentId - (Required) The id of the document. 
    # + includeContents - (Optional) When set to **true**, includes the contents of the document in the `base64Contents` property of the response. The default value is **false**. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Document successfully retrieved. 
    remote isolated function getDocument(int documentId, string accountId, boolean includeContents = false) returns Document|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}`;
        map<anydata> queryParam = {"includeContents": includeContents};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Document response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a specified document.
    #
    # + documentId - The ID of the document. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Document has been successfully deleted. 
    remote isolated function deleteDocument(int documentId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Grants a user access to a document.
    #
    # + documentId - The ID of the document. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - User information to grant access 
    # + return - User successfully granted access to document. 
    remote isolated function createUserAccessToDocument(int documentId, string accountId, DocumentUserForCreate payload) returns DocumentUser|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/documents/${getEncodedUri(documentId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        DocumentUser response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets eSignature Permission Profiles.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Permission profiles successfully retrieved. 
    remote isolated function getEsignPermissionProfiles(string accountId) returns ESignPermissionProfileList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/esign_permission_profiles`;
        ESignPermissionProfileList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an external form fill session.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Details required to create a form fill session. 
    # + return - Success 
    remote isolated function createExternalFormFillSession(string accountId, ExternalFormFillSessionForCreate payload) returns ExternalFormFillSession|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/external_form_fill_sessions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        ExternalFormFillSession response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a field set.
    #
    # + fieldSetId - (Required) The id of the field set. Example: `4aef602b-xxxx-xxxx-xxxx-08d76696f678` 
    # + fieldsCustomDataFilters - (Optional) An comma-separated list that limits the fields to return: - `IsRequiredOnCreate`: include fields that are required in room creation. - `IsRequiredOnSubmit`: include fields that are required when submitting a room for review. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - FieldSet successfully retrieved. 
    remote isolated function getFieldSet(string fieldSetId, string accountId, string[]? fieldsCustomDataFilters = ()) returns FieldSet|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/field_sets/${getEncodedUri(fieldSetId)}`;
        map<anydata> queryParam = {"fieldsCustomDataFilters": fieldsCustomDataFilters};
        map<Encoding> queryParamEncoding = {"fieldsCustomDataFilters": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FieldSet response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets form groups.
    #
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The starting zero-based index position of the results set. The default value is `0`. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Successfully retrieved Form Groups. 
    remote isolated function getFormGroups(string accountId, int count = 100, int startPosition = 0) returns FormGroupSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FormGroupSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a form group.
    #
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - Request object for FormGroup::CreateFormGroup. 
    # + return - Successfully created form group. 
    remote isolated function createFormGroup(string accountId, FormGroupForCreate payload) returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Successfully retrieved form group. 
    remote isolated function getFormGroup(string formGroupId, string accountId) returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        FormGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Renames a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - Details about a form group 
    # + return - Successfully updated form group. 
    remote isolated function renameFormGroup(string formGroupId, string accountId, FormGroupForUpdate payload) returns FormGroup|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroup response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Successfully deleted form group. 
    remote isolated function deleteFormgroup(string formGroupId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Removes a form from a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + formId - The id of the form. Example: `5be324eb-xxxx-xxxx-xxxx-208065181be9` 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Form was successfully removed from the form group 
    remote isolated function removeFormInFormGroup(string formGroupId, string formId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/unassign_form/${getEncodedUri(formId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Assigns a form to a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - Group information to assign form 
    # + return - Successfully assigned form to form group. 
    remote isolated function assignFormToFormGroup(string formGroupId, string accountId, FormGroupFormToAssign payload) returns FormGroupFormToAssign|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/assign_form`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FormGroupFormToAssign response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Grants an office access to a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + officeId - The id of the office. This is the id that the system generated when you created the office. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Office was successfully assigned to the form group 
    remote isolated function grantOfficeAccessToFormGroup(string formGroupId, int officeId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/grant_office_access/${getEncodedUri(officeId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Revoke an office's access to a form group.
    #
    # + formGroupId - The ID of the form group. Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1` 
    # + officeId - The id of the office. This is the id that the system generated when you created the office. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Office was successfully removed from the form group 
    remote isolated function revokeOfficeAccessFromFormGroup(string formGroupId, int officeId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_groups/${getEncodedUri(formGroupId)}/revoke_office_access/${getEncodedUri(officeId)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets form libraries.
    #
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The starting zero-based index position of the results set. The default value is `0`. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Successfully retrieved Form Libraries. 
    remote isolated function getFormLibraries(string accountId, int count = 100, int startPosition = 0) returns FormLibrarySummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_libraries`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FormLibrarySummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the forms in a form library.
    #
    # + formLibraryId - (Required) The id of the form library. Example: `402c6e2f-xxxx-xxxx-xxxx-ff3f249f6da9` 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The starting zero-based index position of the results set. The default value is `0`. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Successfully retrieved library  
    remote isolated function getFormsInFormLibraryForms(string formLibraryId, string accountId, int count = 100, int startPosition = 0) returns FormSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/form_libraries/${getEncodedUri(formLibraryId)}/forms`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FormSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets form details.
    #
    # + formId - (Required) The id of the form. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Form based on FormId 
    remote isolated function getFormDetails(string formId, string accountId) returns FormDetails|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/forms/${getEncodedUri(formId)}/details`;
        FormDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets countries.
    #
    # + return - Request was successful. 
    remote isolated function getCountries() returns GlobalCountries|error {
        string resourcePath = string `/v2/countries`;
        GlobalCountries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets closing statuses.
    #
    # + return - Request was successful. 
    remote isolated function getClosingStatuses() returns GlobalClosingStatuses|error {
        string resourcePath = string `/v2/closing_statuses`;
        GlobalClosingStatuses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets contact sides.
    #
    # + return - Request was successful. 
    remote isolated function getContactSides() returns GlobalContactSides|error {
        string resourcePath = string `/v2/contact_sides`;
        GlobalContactSides response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets financing types.
    #
    # + return - Request was successful. 
    remote isolated function getFinancingTypes() returns GlobalFinancingTypes|error {
        string resourcePath = string `/v2/financing_types`;
        GlobalFinancingTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets origins of leads.
    #
    # + return - Request was successful. 
    remote isolated function getOriginsOfLeads() returns GlobalOriginsOfLeads|error {
        string resourcePath = string `/v2/origins_of_leads`;
        GlobalOriginsOfLeads response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets property types.
    #
    # + return - Request was successful. 
    remote isolated function getPropertyTypes() returns GlobalPropertyTypes|error {
        string resourcePath = string `/v2/property_types`;
        GlobalPropertyTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets room contact types.
    #
    # + return - Request was successful. 
    remote isolated function getRoomContactTypes() returns GlobalRoomContactTypes|error {
        string resourcePath = string `/v2/room_contact_types`;
        GlobalRoomContactTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets seller decision types.
    #
    # + return - Request was successful. 
    remote isolated function getSellerDecisionTypes() returns GlobalSellerDecisionTypes|error {
        string resourcePath = string `/v2/seller_decision_types`;
        GlobalSellerDecisionTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets special circumstance types.
    #
    # + return - Request was successful. 
    remote isolated function getSpecialCircumstanceTypes() returns GlobalSpecialCircumstanceTypes|error {
        string resourcePath = string `/v2/special_circumstance_types`;
        GlobalSpecialCircumstanceTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets task date types.
    #
    # + return - Request was successful. 
    remote isolated function getTaskDateTypes() returns GlobalTaskDateTypes|error {
        string resourcePath = string `/v2/task_date_types`;
        GlobalTaskDateTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets task responsibility types.
    #
    # + return - Request was successful. 
    remote isolated function getTaskResponsibilityTypes() returns GlobalTaskResponsibilityTypes|error {
        string resourcePath = string `/v2/task_responsibility_types`;
        GlobalTaskResponsibilityTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the list of valid task statuses.
    #
    # + return - Request was successful. 
    remote isolated function getTaskStatuses() returns GlobalTaskStatuses|error {
        string resourcePath = string `/v2/task_statuses`;
        GlobalTaskStatuses response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets transaction sides.
    #
    # + return - Request was successful. 
    remote isolated function getTransactionSides() returns GlobalTransactionSides|error {
        string resourcePath = string `/v2/transaction_sides`;
        GlobalTransactionSides response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets states.
    #
    # + return - Request was successful. 
    remote isolated function getStates() returns GlobalStates|error {
        string resourcePath = string `/v2/states`;
        GlobalStates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets valid currencies.
    #
    # + return - Request was successful. 
    remote isolated function getCurrencies() returns GlobalCurrencies|error {
        string resourcePath = string `/v2/currencies`;
        GlobalCurrencies response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets time zones.
    #
    # + return - Request was successful. 
    remote isolated function getTimeZones() returns GlobalTimeZones|error {
        string resourcePath = string `/v2/time_zones`;
        GlobalTimeZones response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets offices.
    #
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The starting zero-based index position of the results set from which to begin returning values. The default value is `0`. 
    # + onlyAccessible - (Optional) When set to **true**, the response only includes the offices that are accessible to the current user. 
    # + search - (Optional) Filters returned records by the specified string. The response only includes records containing this string in the office `name` field. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Offices successfully retrieved. 
    remote isolated function getOffices(string accountId, int count = 100, int startPosition = 0, boolean onlyAccessible = false, string? search = ()) returns OfficeSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "onlyAccessible": onlyAccessible, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OfficeSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates an office.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Details about the office that you want to create. 
    # + return - Office successfully created. 
    remote isolated function createOffice(string accountId, OfficeForCreate payload) returns Office|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        Office response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets information about an office.
    #
    # + officeId - (Required) The id of the office. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Office successfully retrieved. 
    remote isolated function getOffice(int officeId, string accountId) returns Office|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}`;
        Office response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an office.
    #
    # + officeId - (Required) The id of the office. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Office successfully deleted. 
    remote isolated function deleteOffice(int officeId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves the number and type of objects that reference an office.
    #
    # + officeId - (Required) The id of the office. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Reference counts successfully retrieved. 
    remote isolated function getReferenceCounts(int officeId, string accountId) returns OfficeReferenceCountList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/offices/${getEncodedUri(officeId)}/reference_counts`;
        OfficeReferenceCountList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets regions.
    #
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The starting zero-based index position of the results set from which to begin returning values. The default value is `0`. 
    # + managedOnly - (Optional) When set to **true**, only the regions that the current user manages are returned. The default value is **false**. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Regions successfully retrieved. 
    remote isolated function getRegions(string accountId, int count = 100, int startPosition = 0, boolean managedOnly = false) returns RegionSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "managedOnly": managedOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RegionSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a region.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Information about a region. 
    # + return - The region was successfully created 
    remote isolated function createRegion(string accountId, Region payload) returns Region|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        Region response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets information about a region.
    #
    # + regionId - (Required) The id of the region. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - The region was found. 
    remote isolated function getRegion(int regionId, string accountId) returns Region|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}`;
        Region response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a region.
    #
    # + regionId - (Required) The id of the region. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Region successfully deleted. 
    remote isolated function deleteRegion(int regionId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Retrieves the number and type of objects that reference a region.
    #
    # + regionId - (Required) The id of the region. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Reference counts successfully retrieved. 
    remote isolated function getRegionReferenceCounts(int regionId, string accountId) returns RegionReferenceCountList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/regions/${getEncodedUri(regionId)}/reference_counts`;
        RegionReferenceCountList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets roles.
    #
    # + onlyAssignable - (Optional) When set to **true**, returns only the roles that the current user can assign to someone else. The default value is **false**. 
    # + filter - (Optional) A search filter that returns roles by the beginning of the role name. You can enter the beginning of the role name only to return all of the roles that begin with the text that you entered.  For example, if your company has set up roles such as Manager Beginner, Manager Pro, Agent Expert, and Agent Superstar, you could enter `Manager` to return all of the Manager roles (Manager Beginner and Manager Pro). **Note**: You do not enter a wildcard (*) at the end of the name fragment. 
    # + startPosition - (Optional) The starting zero-based index position of the result set. The default value is 0. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Roles successfully retrieved. 
    remote isolated function getRoles(string accountId, boolean onlyAssignable = false, string? filter = (), int startPosition = 0, int count = 100) returns RoleSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles`;
        map<anydata> queryParam = {"onlyAssignable": onlyAssignable, "filter": filter, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoleSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a role.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Details about the role that you want to create. 
    # + return - Role successfully created. 
    remote isolated function createRole(string accountId, RoleForCreate payload) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        Role response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a role.
    #
    # + roleId - (Required) The id of the role. 
    # + includeIsAssigned - (Optional) When set to **true**, the response includes the `isAssigned` property, which specifies whether the role is currently assigned to any users. The default is **false**. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Role successfully retrieved. 
    remote isolated function getRole(int roleId, string accountId, boolean includeIsAssigned = false) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        map<anydata> queryParam = {"includeIsAssigned": includeIsAssigned};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Role response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a role.
    #
    # + roleId - (Required) The id of the role to update. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - The details to use for the update. 
    # + return - Role successfully updated. 
    remote isolated function updateRole(int roleId, string accountId, RoleForUpdate payload) returns Role|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        Role response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a role.
    #
    # + roleId - (Required) The id of the role to delete. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Role successfully deleted. 
    remote isolated function deleteRole(int roleId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/roles/${getEncodedUri(roleId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets a room's field data.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Field data successfully retrieved. 
    remote isolated function getRoomFieldData(int roomId, string accountId) returns FieldData|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_data`;
        FieldData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a room's field data.
    #
    # + roomId - The id of the room. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - The field data to update. When updating field data, specify only the fields being updated. 
    # + return - Field data successfully updated. 
    remote isolated function updateRoomFieldData(int roomId, string accountId, FieldDataForUpdate payload) returns FieldData|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_data`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        FieldData response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets a list of room folders accessible to the current user.
    #
    # + roomId - The room id from which to retrieve folders. 
    # + startPosition - Position of the first item in the total results. Defaults to 0. 
    # + count - Number of room folders to return. Defaults to the maximum which is 100. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Room folders successfully retrieved. 
    remote isolated function getRoomFolders(int roomId, string accountId, int startPosition = 0, int count = 100) returns RoomFolderList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/room_folders`;
        map<anydata> queryParam = {"startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoomFolderList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a form to a room.
    #
    # + roomId - (Required) The id of the room to which you want to add the form. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Details about the form that you want to add. 
    # + return - Success 
    remote isolated function addFormToRoom(int roomId, string accountId, FormForAdd payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/forms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomDocument response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a room's users.
    #
    # + roomId - (Required) The id of the room. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The index position within the total result set from which to start returning values. The default value is `0`. 
    # + filter - (Optional) A search filter that returns users by the beginning of the user's first name, last name, or email address. You can enter the beginning of the name or email only to return all of the users whose names or email addresses begin with the text that you entered.  **Note**: You do not enter a wildcard (*) at the end of the name or email fragment. 
    # + sort - (Optional) The order in which to return results. Valid values are: - `firstNameAsc`: Sort on first name in ascending order.  - `firstNameDesc`:  Sort on first name in descending order.  - `lastNameAsc`: Sort on last name in ascending order.  - `lastNameDesc`: Sort on last name in descending order. This is the default value. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - The room user was successfully retrieved. 
    remote isolated function getRoomUsers(int roomId, string accountId, int count = 100, int startPosition = 0, string? filter = (), string? sort = ()) returns RoomUsersResult|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "filter": filter, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoomUsersResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Invites a user to a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - The information to use for the invitation. 
    # + return - Success 
    remote isolated function inviteUserToRoom(int roomId, string accountId, RoomInvite payload) returns RoomInviteResponse|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomInviteResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates a room user.
    #
    # + roomId - (Required) The id of the room. 
    # + userId - (Required) The id of the user to update. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - This request object contains the information that you want to update for the room user. 
    # + return - The room user was successfully updated. 
    remote isolated function putRoomUser(int roomId, int userId, string accountId, RoomUserForUpdate payload) returns RoomUser|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomUser response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Revokes the specified user's access to the room.
    #
    # + roomId - The room Id to revoke access from 
    # + userId - The user Id getting revoked from the room 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - Details for removal. 
    # + return - The room user's access was successfully revoked. 
    remote isolated function revokeRoomUserAccess(int roomId, int userId, string accountId, RoomUserRemovalDetail payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}/revoke_access`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Restores the specified user's access to the room.
    #
    # + roomId - The room Id to restore access 
    # + userId - The user Id getting restored to the room 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - The room user's access was successfully restored. 
    remote isolated function restoreRoomUserAccess(int roomId, int userId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/users/${getEncodedUri(userId)}/restore_access`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns a list of rooms.
    #
    # + count - (Optional) The number of results. When this property is used as a request parameter specifying the number of results to return, the value must be a number between 1 and 100 (default). 
    # + startPosition - (Optional) The index position within the total result set from which to start returning values. The default value is `0`. 
    # + roomStatus - (Optional) The status of the room. Valid values are: - `active`: This is the default value. - `pending` - `open`: Includes both `active` and `pending` statuses. - `closed` To return rooms with multiple statuses, enter a comma-separated list of statuses.  Example: `closed,open` 
    # + officeId - (Optional) The id of the office. 
    # + fieldDataChangedStartDate - (Optional) Starting date and time to filter rooms whose field data has changed after this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`. Valid formats: - `yyyy-mm-dd hh:mm:ss` - `yyyy/mm/dd hh:mm:ss` The default start date is the beginning of time. 
    # + fieldDataChangedEndDate - (Optional) Ending date and time to filter rooms whose field data has changed before this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`. Valid formats: - `yyyy-mm-dd hh:mm:ss` - `yyyy/mm/dd hh:mm:ss` If this query parameter is omitted, the default end date is now. 
    # + roomClosedStartDate - (Optional) Starting date and time to filter rooms that were closed this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`. Valid formats: - `yyyy-mm-dd hh:mm:ss` - `yyyy/mm/dd hh:mm:ss` The default start date is the beginning of time. 
    # + roomClosedEndDate - (Optional) Ending date and time to filter rooms that were closed before this date. Date and time is always given as UTC. If the time (`hh:mm:ss`) is omitted, it defaults to `00:00:00`. Valid formats: - `yyyy-mm-dd hh:mm:ss` - `yyyy/mm/dd hh:mm:ss` If this query parameter is omitted, the default end date is now. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Rooms successfully retrieved. 
    remote isolated function getRooms(string accountId, int count = 100, int startPosition = 0, string? roomStatus = (), int? officeId = (), string? fieldDataChangedStartDate = (), string? fieldDataChangedEndDate = (), string? roomClosedStartDate = (), string? roomClosedEndDate = ()) returns RoomSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition, "roomStatus": roomStatus, "officeId": officeId, "fieldDataChangedStartDate": fieldDataChangedStartDate, "fieldDataChangedEndDate": fieldDataChangedEndDate, "roomClosedStartDate": roomClosedStartDate, "roomClosedEndDate": roomClosedEndDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoomSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a room.
    #
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Details about the new room. 
    # + return - Room successfully created. 
    remote isolated function createRoom(string accountId, RoomForCreate payload) returns Room|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        Room response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a room.
    #
    # + roomId - (Required) The id of the room. 
    # + includeFieldData - (Optional) When set to **true**, the response includes the field data from the room. This is the information that appears on the room's **Details** tab. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Room successfully retrieved. 
    remote isolated function getRoom(int roomId, string accountId, boolean includeFieldData = false) returns Room|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}`;
        map<anydata> queryParam = {"includeFieldData": includeFieldData};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Room response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Room successfully deleted. 
    remote isolated function deleteRoom(int roomId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets assignable room-level roles in v6.
    #
    # + roomId - (Required) The id of the room. 
    # + assigneeEmail - (Optional) The email address of a specific member. Using this parameter returns only the roles that the current user can assign to the member with that email address. 
    # + filter - (Optional) A search filter that returns assignable roles by the beginning of the role name. **Note**: You do not enter a wildcard (*) at the end of the name fragment. 
    # + startPosition - (Optional) The index position within the total result set from which to start returning values. The default value is `0`. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Assignable roles successfully retrieved. 
    remote isolated function roomsGetAssignableRoles(int roomId, string accountId, string? assigneeEmail = (), string? filter = (), int startPosition = 0, int count = 100) returns AssignableRoles|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/assignable_roles`;
        map<anydata> queryParam = {"assigneeEmail": assigneeEmail, "filter": filter, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AssignableRoles response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of documents in a room.
    #
    # + roomId - (Required) The id of the room. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The index position within the total result set from which to start returning values. The default value is `0`. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Documents successfully retrieved. 
    remote isolated function roomsGetDocuments(int roomId, string accountId, int count = 100, int startPosition = 0) returns RoomDocumentList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents`;
        map<anydata> queryParam = {"count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoomDocumentList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a document to a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Contains information about a document. 
    # + return - Document successfully added. 
    remote isolated function addDocumentToroom(int roomId, string accountId, Document payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        RoomDocument response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Uploads the contents of a file as a document to a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Document Content 
    # + return - Document successfully added. 
    remote isolated function addDocumentToRoomViaFileUpload(int roomId, string accountId, DocumentsContentsBody payload) returns RoomDocument|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/documents/contents`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        RoomDocument response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates the picture for a room.
    #
    # + roomId - (Required) The id of the room for which you are updating the picture. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Image content 
    # + return - Picture successfully updated. 
    remote isolated function updatePicture(int roomId, string accountId, RoomidPictureBody payload) returns RoomPicture|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/picture`;
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        RoomPicture response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets the field set for a room.
    #
    # + roomId - (Required) The globally unique identifier (GUID) for the account. 
    # + accountId - (Required) The id of the account. 
    # + return - FieldSet successfully retrieved. 
    remote isolated function getRoomFieldSet(int roomId, string accountId) returns FieldSet|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/field_set`;
        FieldSet response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets task lists for a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The id of the account. 
    # + return - Task lists successfully retrieved. 
    remote isolated function getTaskLists(int roomId, string accountId) returns TaskListSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/task_lists`;
        TaskListSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Applies a task list to a room.
    #
    # + roomId - (Required) The id of the room. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Information about the task list template to use to create the new task list. 
    # + return - Task lists successfully created. 
    remote isolated function createTaskList(int roomId, string accountId, TaskListForCreate payload) returns TaskList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/rooms/${getEncodedUri(roomId)}/task_lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        TaskList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets room templates.
    #
    # + officeId - (Optional) The ID of the office for which the user wants to create a room. When you pass in a value for this parameter, only room templates that are valid for that office appear in the results. For users who are not Admins, the default is the id of the user's default office. However, you can specify a value if the user belongs to multiple offices. If the user is an Admin, set the `forAdmin` search parameter to **true** instead and omit the `officeId` parameter.  
    # + onlyAssignable - (Optional) When set to **true**, returns only the roles that the current user can assign to someone else. The default value is **false**. 
    # + onlyEnabled - When set to true, only returns room templates that are not disabled. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + startPosition - (Optional) The index position within the total result set from which to start returning values. The default value is `0`. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - Successfully retrieved room templates for the caller 
    remote isolated function getRoomTemplates(string accountId, int? officeId = (), boolean onlyAssignable = false, boolean onlyEnabled = true, int count = 100, int startPosition = 0) returns RoomTemplatesSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/room_templates`;
        map<anydata> queryParam = {"officeId": officeId, "onlyAssignable": onlyAssignable, "onlyEnabled": onlyEnabled, "count": count, "startPosition": startPosition};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RoomTemplatesSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a task list from a room.
    #
    # + taskListId - The id of the task list. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - Task list successfully deleted. 
    remote isolated function deleteTaskList(int taskListId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/task_lists/${getEncodedUri(taskListId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets task list templates.
    #
    # + startPosition - (Optional) The starting zero-based index position from which to start returning values. The default is `0`. 
    # + count - (Optional) The number of results to return. This value must be a number between `1` and `100` (default). 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + return - Successfully returned list of task list  
    remote isolated function getTaskListTemplates(string accountId, int startPosition = 0, int count = 100) returns TaskListTemplateList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/task_list_templates`;
        map<anydata> queryParam = {"startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TaskListTemplateList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a list of users.
    #
    # + filter - (Optional) Filters results by name and email address. This is a  "starts with" filter, which means that you can enter only the beginning of a name or email address.  **Note**: You do not use a wildcard with this filter. 
    # + sort - (Optional) Specifies how to sort the results. Valid values are: - `FirstNameAsc` - `LastNameAsc` - `EmailAsc` - `FirstNameDesc` - `LastNameDesc` - `EmailDesc` 
    # + defaultOfficeId - (Optional) Filters for users who have this office id as their default office id. 
    # + accessLevel - (Optional) Filters for users who have the specified access level. A user's access level and role determine the types of resources and actions that are available to them. Valid values are: - Company: Users with this access level can administer resources across the company. - Region: Users with this access level can administer offices and other resources within their regions.  - Office: Users with this access level can administer resources within their offices. - Contributor: Users with this access level can only administer their own resources. **Note**: In requests, the values that you may use for this property depend on your permissions and whether you can add users at your access level or lower. This property applies only to Rooms Version 6.  
    # + titleId - (Optional) For Rooms Version 5 only, filters for users whose managers have the specified `titleId`. 
    # + roleId - (Optional) For Rooms Version 6 only, filters for users who have the specified `roleId`. 
    # + status - (Optional) Filters for users who have the specified `status`. Valid values are: - `Active`: The user is active. - `Pending`: The user has been invited but has not yet accepted the invitation. 
    # + lockedOnly - (Optional) When set to **true**, filters for users whose accounts are locked. 
    # + startPosition - (Optional) The starting zero-based index position within the result set from which to begin the response. The default is `0`.  
    # + count - (Optional) The maximum number of users to return in the response. This value must be a number between `1` and `100` (default). 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + return - Users information successfully retrieved. 
    remote isolated function getUsers(string accountId, string? filter = (), string? sort = (), int? defaultOfficeId = (), string? accessLevel = (), int? titleId = (), int? roleId = (), string? status = (), boolean? lockedOnly = (), int startPosition = 0, int count = 100) returns UserSummaryList|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users`;
        map<anydata> queryParam = {"filter": filter, "sort": sort, "defaultOfficeId": defaultOfficeId, "accessLevel": accessLevel, "titleId": titleId, "roleId": roleId, "status": status, "lockedOnly": lockedOnly, "startPosition": startPosition, "count": count};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserSummaryList response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a user.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + return - User information successfully retrieved. 
    remote isolated function getUser(int userId, string accountId) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a user's default office.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - This request object contains the information to use to update a user's default office.  
    # + return - User information successfully updated. 
    remote isolated function updateUser(int userId, string accountId, UserForUpdate payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Removes a user from a company account.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - The User was successfully removed. 
    remote isolated function removeUser(int userId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Invites a user to a v6 company account.
    #
    # + accountId - (Required) The id of the account. 
    # + payload - Information about the user that you are inviting. 
    # + return - User successfully invited. 
    remote isolated function inviteUserToAccount(string accountId, UserToInvite payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/invite_user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Invites a user to a v5 company account as an Admin.
    #
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Details about the person who you want to invite. 
    # + return - User successfully invited. 
    remote isolated function inviteClassicAdmin(string accountId, ClassicAdminToInvite payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/invite_classic_admin`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Invites a user to a v5 company account as a Manager.
    #
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Details about the person who you want to invite. 
    # + return - User successfully invited. 
    remote isolated function inviteclassicManager(string accountId, ClassicManagerToInvite payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/invite_classic_manager`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Invites a user to a v5 company account as an Agent.
    #
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Details about the person who you want to invite. 
    # + return - User successfully invited. 
    remote isolated function inviteClassicAgent(string accountId, ClassicAgentToInvite payload) returns User|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/invite_classic_agent`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reinvites a user to join a company account.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + return - User successfully reinvited. 
    remote isolated function reinviteUser(int userId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/reinvite`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Adds a user to an office.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Information about the office that you want to add a member to or remove a member from. 
    # + return - User successfully added to the office. 
    remote isolated function addUserToOffice(int userId, string accountId, DesignatedOffice payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/add_to_office`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes a user from an office.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Information about the office that you want to add a member to or remove a member from. 
    # + return - User successfully removed from the office. 
    remote isolated function removeUserFromOffice(int userId, string accountId, DesignatedOffice payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/remove_from_office`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Adds a user to a region.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally-unique identifier (GUID) for the account. 
    # + payload - Information about the region associated with the member. 
    # + return - User successfully added to the region. 
    remote isolated function addUserToRegion(int userId, string accountId, DesignatedRegion payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/add_to_region`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Removes a user from a region.
    #
    # + userId - (Required) The id of the user. 
    # + accountId - (Required) The globally unique identifier (GUID) for the account. 
    # + payload - Information about the region associated with the member. 
    # + return - User successfully removed from the region. 
    remote isolated function removeUserFromRegion(int userId, string accountId, DesignatedRegion payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/remove_from_region`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Locks a user's account.
    #
    # + userId - User Id of the user attempting to be locked. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + payload - Details about a locked account. 
    # + return - User has been successfully locked out. 
    remote isolated function lockUser(int userId, string accountId, LockedOutDetails payload) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/lock`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json-patch+json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unlocks  a user's account.
    #
    # + userId - The id of the user. 
    # + accountId - The globally unique identifier (GUID) for the account. 
    # + return - User has been successfully unlocked. 
    remote isolated function unlockUser(int userId, string accountId) returns http:Response|error {
        string resourcePath = string `/v2/accounts/${getEncodedUri(accountId)}/users/${getEncodedUri(userId)}/unlock`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
