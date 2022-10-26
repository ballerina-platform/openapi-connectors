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

# This is a generated connector from [PandaDoc API version 4.3.0](https://developers.pandadoc.com/reference/about) OpenAPI Specification. 
# PandaDoc API spans a broad range of functionality to help you build incredible documents automation experiences inside your product.
# PandaDoc API is organized around REST. Our API has predictable resource-oriented URLs and uses standard HTTP response codes, authentication, and verbs.
@display {label: "PandaDoc", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig? apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # You can start using PandaDoc API with our [free sandbox plan](https://signup.pandadoc.com/?ss=api-dev&plan=rec_plans_v5_api_dev_mn_free), which allows you to open all the available features. 
    # The [sandbox API key](https://developers.pandadoc.com/reference/api-key-authentication-process#sandbox-key) you can generate on the Developer Dashboard with predefined rate limits.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.pandadoc.com") returns error? {
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
        if config.auth is ApiKeysConfig {
            self.apiKeyConfig = (<ApiKeysConfig>config.auth).cloneReadOnly();
        } else {
            config.auth = <http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig>config.auth;
            self.apiKeyConfig = ();
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create/Refresh Access Token
    #
    # + payload - Authentication request 
    # + return - OK 
    remote isolated function accessToken(Oauth2AccessTokenBody payload) returns OAuth2AccessTokenResponse|error {
        string resourcePath = string `/oauth2/access_token`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        OAuth2AccessTokenResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List documents
    #
    # + completedFrom - Return results where the `date_completed` field (ISO 8601) is greater than or equal to this value. 
    # + completedTo - Return results where the `date_completed` field (ISO 8601) is less than or equal to this value. 
    # + contactId - Returns results where 'contact_id' is present in document as recipient or approver 
    # + count - Specify how many document results to return. Default is 50 documents, maximum is 100 documents. 
    # + createdFrom - Return results where the `date_created` field (ISO 8601) is greater than or equal to this value. 
    # + createdTo - Return results where the `date_created` field (ISO 8601) is less than this value. 
    # + deleted - Returns only the deleted documents. 
    # + id - Specify document's ID. 
    # + folderUuid - The UUID of the folder where the documents are stored. 
    # + formId - Specify the form used for documents creation. This parameter can't be used with template_id. 
    # + membershipId - Returns results where 'membership_id' is present in document as owner (should be member uuid) 
    # + metadata - Specify metadata to filter by in the format of `metadata_{metadata-key}={metadata-value}` such as `metadata_opportunity_id=2181432`. The `metadata_` prefix is always required. 
    # + modifiedFrom - Return results where the `date_modified` field (iso-8601) is greater than or equal to this value. 
    # + modifiedTo - Return results where the `date_modified` field (iso-8601) is less than this value. 
    # + orderBy - Specify the order of documents to return. Use `value` (for example, `date_created`) for ASC and `-value` (for example, `-date_created`) for DESC. 
    # + page - Specify which page of the dataset to return. 
    # + q - Search query. Filter by document reference number (this token is stored on the template level) or name. 
    # + status - Specify the status of documents to return.   * 0: document.draft   * 1: document.sent   * 2: document.completed   * 3: document.uploaded   * 4: document.error   * 5: document.viewed   * 6: document.waiting_approval   * 7: document.approved   * 8: document.rejected   * 9: document.waiting_pay   * 10: document.paid   * 11: document.voided   * 12: document.declined   * 13: document.external_review 
    # + statusNe - Specify the status of documents to return (exclude).   * 0: document.draft   * 1: document.sent   * 2: document.completed   * 3: document.uploaded   * 4: document.error   * 5: document.viewed   * 6: document.waiting_approval   * 7: document.approved   * 8: document.rejected   * 9: document.waiting_pay   * 10: document.paid   * 11: document.voided   * 12: document.declined   * 13: document.external_review 
    # + tag - Search tag. Filter by document tag. 
    # + templateId - Specify the template used for documents creation. Parameter can't be used with form_id. 
    # + return - OK 
    remote isolated function listDocuments(string? completedFrom = (), string? completedTo = (), string? contactId = (), int? count = (), string? createdFrom = (), string? createdTo = (), boolean? deleted = (), string? id = (), string? folderUuid = (), string? formId = (), string? membershipId = (), string? metadata = (), string? modifiedFrom = (), string? modifiedTo = (), DocumentOrderingFieldsEnum? orderBy = (), int? page = (), string? q = (), DocumentStatusRequestEnum? status = (), DocumentStatusRequestEnum? statusNe = (), string? tag = (), string? templateId = ()) returns DocumentListResponse|error {
        string resourcePath = string `/public/v1/documents`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"completed_from": completedFrom, "completed_to": completedTo, "contact_id": contactId, "count": count, "created_from": createdFrom, "created_to": createdTo, "deleted": deleted, "id": id, "folder_uuid": folderUuid, "form_id": formId, "membership_id": membershipId, "metadata": metadata, "modified_from": modifiedFrom, "modified_to": modifiedTo, "order_by": orderBy, "page": page, "q": q, "status": status, "status__ne": statusNe, "tag": tag, "template_id": templateId};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create document
    #
    # + editorVer - Set this parameter as `ev1` if you want to create a document from PDF with Classic Editor when both editors are enabled for the workspace. 
    # + payload - Use a PandaDoc template or an existing PDF to create a document. 
    # + return - OK 
    remote isolated function createDocument(DocumentCreateRequest payload, string? editorVer = ()) returns DocumentCreateResponse|error {
        string resourcePath = string `/public/v1/documents`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"editor_ver": editorVer};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Document status
    #
    # + id - Specify document ID. 
    # + return - OK 
    remote isolated function statusDocument(string id) returns DocumentStatusResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentStatusResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete document by id
    #
    # + id - Document ID 
    # + return - No content 
    remote isolated function deleteDocument(string id) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Document status change
    #
    # + id - Specify document ID. 
    # + payload - Document status change request 
    # + return - No content 
    remote isolated function changeDocumentStatus(string id, DocumentStatusChangeRequest payload) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/status`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Document details
    #
    # + id - Document ID 
    # + return - OK 
    remote isolated function detailsDocument(string id) returns DocumentDetailsResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/details`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a Document Link
    #
    # + id - Document ID 
    # + payload - Request to create document link 
    # + return - OK 
    remote isolated function createDocumentLink(string id, DocumentCreateLinkRequest payload) returns DocumentCreateLinkResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/session`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentCreateLinkResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Send Document
    #
    # + id - Document ID 
    # + payload - Document send request 
    # + return - OK 
    remote isolated function sendDocument(string id, DocumentSendRequest payload) returns DocumentSendResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/send`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentSendResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Document download
    #
    # + id - Specify document ID. 
    # + watermarkColor - HEX code (for example `#FF5733`). 
    # + watermarkFontSize - Font size of the watermark. 
    # + watermarkOpacity - In range 0.0-1.0 
    # + watermarkText - Specify watermark text. 
    # + return - OK 
    remote isolated function downloadDocument(string id, string? watermarkColor = (), int? watermarkFontSize = (), float? watermarkOpacity = (), string? watermarkText = ()) returns string|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/download`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"watermark_color": watermarkColor, "watermark_font_size": watermarkFontSize, "watermark_opacity": watermarkOpacity, "watermark_text": watermarkText};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download document protected
    #
    # + id - Specify document ID. 
    # + return - OK 
    remote isolated function downloadProtectedDocument(string id) returns string|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/download-protected`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Linked Objects
    #
    # + id - Specify document ID. 
    # + return - Success response 
    remote isolated function listLinkedObjects(string id) returns LinkedObjectListResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/linked-objects`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LinkedObjectListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Linked Object
    #
    # + id - Specify document ID. 
    # + payload - Request to create linked object 
    # + return - OK 
    remote isolated function createLinkedObject(string id, LinkedObjectCreateRequest payload) returns LinkedObjectCreateResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/linked-objects`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LinkedObjectCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete Linked Object
    #
    # + id - Specify document ID. 
    # + linkedObjectId - Specify linked object ID. 
    # + return - No content 
    remote isolated function deleteLinkedObject(string id, string linkedObjectId) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/linked-objects/${getEncodedUri(linkedObjectId)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Document Attachment List
    #
    # + id - Document UUID 
    # + return - OK 
    remote isolated function listDocumentAttachments(string id) returns DocumentAttachmentResponse[]|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/attachments`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentAttachmentResponse[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Document Attachment Create
    #
    # + id - Document UUID 
    # + payload - Uploads attachment to document by using Multipart Form Data 
    # + return - OK 
    remote isolated function createDocumentAttachment(string id, DocumentAttachmentRequest payload) returns DocumentAttachmentResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/attachments`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        DocumentAttachmentResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Document Attachment Details
    #
    # + id - Document UUID 
    # + attachmentId - Attachment UUID 
    # + return - OK 
    remote isolated function detailsDocumentAttachment(string id, string attachmentId) returns DocumentAttachmentResponse|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/attachments/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentAttachmentResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Document Attachment Delete
    #
    # + id - Document UUID 
    # + attachmentId - Attachment UUID 
    # + return - No Content 
    remote isolated function deleteDocumentAttachment(string id, string attachmentId) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/attachments/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Document Attachment Download
    #
    # + id - Document UUID 
    # + attachmentId - Attachment UUID 
    # + return - OK 
    remote isolated function downloadDocumentAttachment(string id, string attachmentId) returns string|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/attachments/${getEncodedUri(attachmentId)}/download`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update document ownership
    #
    # + id - Specify document ID. 
    # + payload - Request to transfer document ownership 
    # + return - No content 
    remote isolated function transferDocumentOwnership(string id, DocumentTransferOwnershipRequest payload) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/${getEncodedUri(id)}/ownership`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Transfer all documents ownership
    #
    # + payload - Request to transfer all document ownerships 
    # + return - No content 
    remote isolated function transferAllDocumentsOwnership(DocumentTransferAllOwnershipRequest payload) returns http:Response|error {
        string resourcePath = string `/public/v1/documents/ownership`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # List Content Library Item
    #
    # + q - Search query. Filter by content library item name. 
    # + id - Specify content library item ID. 
    # + deleted - Returns only the deleted content library items. 
    # + folderUuid - The UUID of the folder where the content library items are stored. 
    # + count - Specify how many content library items to return. Default is 50 content library items, maximum is 100 content library items. 
    # + page - Specify which page of the dataset to return. 
    # + tag - Search tag. Filter by content library item tag. 
    # + return - OK 
    remote isolated function listContentLibraryItems(string? q = (), string? id = (), boolean? deleted = (), string? folderUuid = (), int? count = (), int? page = (), string? tag = ()) returns ContentLibraryItemListResponse|error {
        string resourcePath = string `/public/v1/content-library-items`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"q": q, "id": id, "deleted": deleted, "folder_uuid": folderUuid, "count": count, "page": page, "tag": tag};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContentLibraryItemListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Details Content Library Item
    #
    # + id - Content Library Item ID 
    # + return - OK 
    remote isolated function detailsContentLibraryItem(string id) returns ContentLibraryItemResponse|error {
        string resourcePath = string `/public/v1/content-library-items/${getEncodedUri(id)}/details`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContentLibraryItemResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Templates
    #
    # + q - Optional search query. Filter by template name. 
    # + shared - Returns only the shared templates. 
    # + deleted - Optional. Returns only the deleted templates. 
    # + count - Optionally, specify how many templates to return. Default is 50 templates, maximum is 100 templates. 
    # + page - Optionally, specify which page of the dataset to return. 
    # + id - Optionally, specify template ID. 
    # + folderUuid - UUID of the folder where the templates are stored. 
    # + tag - Optional search tag. Filter by template tag. 
    # + return - OK 
    remote isolated function listTemplates(string? q = (), boolean? shared = (), boolean? deleted = (), int? count = (), int? page = (), string? id = (), string? folderUuid = (), string[]? tag = ()) returns TemplateListResponse|error {
        string resourcePath = string `/public/v1/templates`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"q": q, "shared": shared, "deleted": deleted, "count": count, "page": page, "id": id, "folder_uuid": folderUuid, "tag": tag};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<Encoding> queryParamEncoding = {"tag": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TemplateListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Details Template
    #
    # + id - Template ID 
    # + return - OK 
    remote isolated function detailsTemplate(string id) returns TemplateDetailsResponse|error {
        string resourcePath = string `/public/v1/templates/${getEncodedUri(id)}/details`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TemplateDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Template
    #
    # + id - Template ID 
    # + return - No content 
    remote isolated function deleteTemplate(string id) returns http:Response|error {
        string resourcePath = string `/public/v1/templates/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Forms
    #
    # + count - Optionally, specify how many forms to return. Default is 50 forms, maximum is 100 forms. 
    # + page - Optionally, specify which page of the dataset to return. 
    # + status - Optionally, specify which status of the forms dataset to return. 
    # + orderBy - Optionally, specify the form dataset order to return. 
    # + asc - Optionally, specify sorting the result-set in ascending or descending order. 
    # + name - Specify the form name. 
    # + return - List of forms 
    remote isolated function listForm(int? count = (), int? page = (), string[]? status = (), string? orderBy = (), boolean? asc = (), string? name = ()) returns FormListResponse|error {
        string resourcePath = string `/public/v1/forms`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"count": count, "page": page, "status": status, "order_by": orderBy, "asc": asc, "name": name};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        FormListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Documents Folders
    #
    # + parentUuid - The UUID of the folder containing folders. To list the folders located in the root folder, remove this parameter in the request. 
    # + count - Optionally, specify how many folders to return. Default is 50 folders, maximum is 100 folders. 
    # + page - Optionally, specify which page of the dataset to return. 
    # + return - List of document folders 
    remote isolated function listDocumentFolders(string? parentUuid = (), int? count = (), int? page = ()) returns DocumentsFolderListResponse|error {
        string resourcePath = string `/public/v1/documents/folders`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"parent_uuid": parentUuid, "count": count, "page": page};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DocumentsFolderListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Documents Folder
    #
    # + payload - Document folder details 
    # + return - Success response 
    remote isolated function createDocumentFolder(DocumentsFolderCreateRequest payload) returns DocumentsFolderCreateResponse|error {
        string resourcePath = string `/public/v1/documents/folders`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentsFolderCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Rename Documents Folder
    #
    # + id - The UUID of the folder that you are renaming. 
    # + payload - Details to rename document folder 
    # + return - OK 
    remote isolated function renameDocumentFolder(string id, DocumentsFolderRenameRequest payload) returns DocumentsFolderRenameResponse|error {
        string resourcePath = string `/public/v1/documents/folders/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DocumentsFolderRenameResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List Templates Folders
    #
    # + parentUuid - The UUID of the folder containing folders. To list the folders located in the root folder, remove this parameter in the request. 
    # + count - Optionally, specify how many folders to return. Default is 50 folders, maximum is 100 folders. 
    # + page - Optionally, specify which page of the dataset to return. 
    # + return - OK 
    remote isolated function listTemplateFolders(string? parentUuid = (), int? count = (), int? page = ()) returns TemplatesFolderListResponse|error {
        string resourcePath = string `/public/v1/templates/folders`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"parent_uuid": parentUuid, "count": count, "page": page};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TemplatesFolderListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Templates Folder
    #
    # + payload - Details to create new folder for templates 
    # + return - OK 
    remote isolated function createTemplateFolder(TemplatesFolderCreateRequest payload) returns TemplatesFolderCreateResponse|error {
        string resourcePath = string `/public/v1/templates/folders`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplatesFolderCreateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Rename Templates Folder
    #
    # + id - The UUID of the folder which you are renaming. 
    # + payload - Request to rename template folder 
    # + return - OK 
    remote isolated function renameTemplateFolder(string id, TemplatesFolderRenameRequest payload) returns TemplatesFolderRenameResponse|error {
        string resourcePath = string `/public/v1/templates/folders/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplatesFolderRenameResponse response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # List API Log
    #
    # + since - Determines a point in time from which logs should be fetched. Either a specific ISO 8601 datetime or a relative identifier such as "-90d" (for past 90 days). 
    # + to - Determines a point in time from which logs should be fetched. Either a specific ISO 8601 datetime or a relative identifier such as "-10d" (for past 10 days) or a special "now" value. 
    # + count - The amount of items on each page. 
    # + page - Page number of the results returned. 
    # + statuses - Returns only the predefined status codes. Allows 1xx, 2xx, 3xx, 4xx, and 5xx. 
    # + methods - Returns only the predefined HTTP methods. Allows GET, POST, PUT, PATCH, and DELETE. 
    # + search - Returns the results containing a string. 
    # + environmentType - Returns logs for production/sandbox. 
    # + return - OK 
    remote isolated function listLogs(string? since = (), string? to = (), int? count = (), int? page = (), int[]? statuses = (), string[]? methods = (), string? search = (), string? environmentType = ()) returns APILogListResponse|error {
        string resourcePath = string `/public/v1/logs`;
        map<any> headerValues = {};
        map<anydata> queryParam = {"since": since, "to": to, "count": count, "page": page, "statuses": statuses, "methods": methods, "search": search, "environment_type": environmentType};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<Encoding> queryParamEncoding = {"statuses": {style: FORM, explode: true}, "methods": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APILogListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Details API Log
    #
    # + id - Log event id. 
    # + return - OK 
    remote isolated function detailsLog(string id) returns APILogDetailsResponse|error {
        string resourcePath = string `/public/v1/logs/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        APILogDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List contacts
    #
    # + return - OK 
    remote isolated function listContacts() returns ContactListResponse|error {
        string resourcePath = string `/public/v1/contacts`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create contact
    #
    # + payload - Contact details 
    # + return - OK 
    remote isolated function createContact(ContactCreateRequest payload) returns ContactDetailsResponse|error {
        string resourcePath = string `/public/v1/contacts`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactDetailsResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get contact details by id
    #
    # + id - Contact id. 
    # + return - OK 
    remote isolated function detailsContact(string id) returns ContactDetailsResponse|error {
        string resourcePath = string `/public/v1/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ContactDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete contact by id
    #
    # + id - Contact id. 
    # + return - OK 
    remote isolated function deleteContact(string id) returns http:Response|error {
        string resourcePath = string `/public/v1/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update contact by id
    #
    # + id - Contact id. 
    # + payload - Contact details 
    # + return - OK 
    remote isolated function updateContact(string id, ContactUpdateRequest payload) returns ContactDetailsResponse|error {
        string resourcePath = string `/public/v1/contacts/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ContactDetailsResponse response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # List members
    #
    # + return - OK 
    remote isolated function listMembers() returns MemberListResponse|error {
        string resourcePath = string `/public/v1/members`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MemberListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Current member details
    #
    # + return - OK 
    remote isolated function detailsCurrentMember() returns MemberDetailsResponse|error {
        string resourcePath = string `/public/v1/members/current`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MemberDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Member details
    #
    # + id - Membership id 
    # + return - OK 
    remote isolated function detailsMember(string id) returns MemberDetailsResponse|error {
        string resourcePath = string `/public/v1/members/${getEncodedUri(id)}`;
        map<any> headerValues = {};
        if self.apiKeyConfig is ApiKeysConfig {
            headerValues["Authorization"] = self.apiKeyConfig?.authorization;
        }
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MemberDetailsResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
