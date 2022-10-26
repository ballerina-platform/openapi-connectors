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

# This is a generated connector for [IRIS Leads API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the Leads API to interact with your lead data.  
# Includes management of fields, user assignments, status changes, tasks, appointments, email, text messaging, and document attachments.
# Create custom reports without limits using the data already housed within your CRM.
@display {label: "IRIS Lead", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, ConnectionConfig config =  {}) returns error? {
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
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Get a list of leads
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of leads by the field value 
    # + sortDir - Direction of sorting 
    # + group - Filter leads by a group id 
    # + mid - Filter leads by a merchant id 
    # + campaign - Filter leads by a campaign id 
    # + 'source - Filter leads by a source id 
    # + status - Filter leads by a status id 
    # + category - Filter leads by a status category id 
    # + user - Filter leads by a user id 
    # + dateFilter - Filtering leads by a date range depends on this filter 
    # + startDate - Filter leads by a date in ISO 8601 format (Y-m-d\TH:i:sP) (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - Filter leads by a date in ISO 8601 format (Y-m-d\TH:i:sP) (**Please note that `+` sign should be encoded to `%2B`**) 
    # + email - Filter leads by a email 
    # + return - A JSON array of leads 
    remote isolated function getLeads(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", int? group = (), int? mid = (), int? campaign = (), int? 'source = (), int? status = (), int? category = (), int? user = (), string? dateFilter = (), string? startDate = (), string? endDate = (), string? email = ()) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/leads`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "group": group, "mid": mid, "campaign": campaign, "source": 'source, "status": status, "category": category, "user": user, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "email": email};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead
    #
    # + payload - Lead details 
    # + return - Lead has been created successfully 
    remote isolated function createLead(V1LeadsBody payload) returns InlineResponse2001|error {
        string resourcePath = string `/api/v1/leads`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get detailed lead information
    #
    # + leadId - Lead Id 
    # + return - Detailed lead information 
    remote isolated function getDetailedLeadInformation(int leadId) returns InlineResponse2002|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead
    #
    # + leadId - Lead Id 
    # + payload - Lead changes (send only fields you want to change) 
    # + return - Lead has been updated successfully 
    remote isolated function updateLead(int leadId, LeadsLeadidBody payload) returns InlineResponse2003|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2003 response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete record from a lead record set
    #
    # + leadId - Lead Id 
    # + catId - Record category ID 
    # + recordId - Record ID 
    # + return - The record has been deleted successfully 
    remote isolated function deleteRecordFromALeadRecordSet(int leadId, int catId, int recordId) returns InlineResponse2004|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/records/${getEncodedUri(catId)}/${getEncodedUri(recordId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a list of available lead fields
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available fields 
    remote isolated function getAvailableLeadFields(int? page = (), int? perPage = ()) returns InlineResponse2005|error {
        string resourcePath = string `/api/v1/leads/fields`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new lead field
    #
    # + payload - LeadField data 
    # + return - Created field 
    remote isolated function createNewLeadField(LeadsFieldsBody payload) returns LeadField|error {
        string resourcePath = string `/api/v1/leads/fields`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadField response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a lead field
    #
    # + fieldId - Field Id 
    # + return - Get a lead field 
    remote isolated function getLeadField(int fieldId) returns LeadField|error {
        string resourcePath = string `/api/v1/leads/fields/${getEncodedUri(fieldId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadField response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead field
    #
    # + fieldId - Field Id 
    # + payload - LeadField data 
    # + return - Updated field attributes 
    remote isolated function updateLeadField(int fieldId, FieldsFieldidBody payload) returns LeadField|error {
        string resourcePath = string `/api/v1/leads/fields/${getEncodedUri(fieldId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadField response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Update a lead field order position
    #
    # + fieldId - Field Id 
    # + payload - LeadFieldOrder data 
    # + return - Updated Lead field order position 
    remote isolated function updateLeadFieldOrderPosition(int fieldId, LeadFieldOrder payload) returns InlineResponse2006|error {
        string resourcePath = string `/api/v1/leads/fields/${getEncodedUri(fieldId)}/order`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2006 response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of all lead field tabs
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of all lead field tabs 
    remote isolated function getAllLeadFieldTabs(int? page = (), int? perPage = ()) returns InlineResponse2007|error {
        string resourcePath = string `/api/v1/leads/fields/tabs`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2007 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead field tab
    #
    # + payload - LeadFieldTab data 
    # + return - Create a lead field tab 
    remote isolated function createLeadFieldTab(LeadFieldTab payload) returns LeadFieldTab|error {
        string resourcePath = string `/api/v1/leads/fields/tabs`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadFieldTab response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + return - Lead field tab 
    remote isolated function getLeadFieldTab(int tabId) returns LeadFieldTab|error {
        string resourcePath = string `/api/v1/leads/fields/tabs/${getEncodedUri(tabId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        LeadFieldTab response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + payload - LeadFieldTab data 
    # + return - Updated lead field tab 
    remote isolated function updateLeadFieldTab(int tabId, LeadFieldTab payload) returns LeadFieldTab|error {
        string resourcePath = string `/api/v1/leads/fields/tabs/${getEncodedUri(tabId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LeadFieldTab response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get pricing templates
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of pricing templates 
    remote isolated function getPricingTemplates(int? page = (), int? perPage = ()) returns InlineResponse2008|error {
        string resourcePath = string `/api/v1/leads/pricing_templates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2008 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get lead notes
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead notes 
    remote isolated function getLeadNotes(int leadId, int? page = (), int? perPage = ()) returns InlineResponse2009|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/notes`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2009 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead note
    #
    # + leadId - Lead Id 
    # + payload - Create a lead note 
    # + return - Note has been added successfully 
    remote isolated function createLeadNote(int leadId, LeadidNotesBody payload) returns InlineResponse20010|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/notes`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20010 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get lead appointments
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + setFor - Filter by the user for who appointment was created 
    # + setBy - Filter by the user for who have created an appointment 
    # + modifiedBy - Filter by the user for who have modified an appointment 
    # + confirmedBy - Filter by the user for who have confirmed an appointment 
    # + rescheduledBy - Filter by the user for who have rescheduled an appointment 
    # + seenBy - Filter by the user for who have mark an appointment as seen 
    # + rescheduledCount - Filter by the count of rescheduling 
    # + done - Filter by the done flag 
    # + perPage - Count of records per page 
    # + sortBy - Sort appointments by columns 
    # + sortDir - Sort direction 
    # + dateFilter - Filtering appointments by a date range depends on this filter 
    # + startDate - Filter appointments by a date in format Y-m-d 
    # + endDate - Filter leads by a date in format Y-m-d 
    # + return - A list of lead appointments 
    remote isolated function getLeadAppointments(int leadId, int? page = (), int? setFor = (), int? setBy = (), int? modifiedBy = (), int? confirmedBy = (), int? rescheduledBy = (), int? seenBy = (), int? rescheduledCount = (), boolean? done = (), int? perPage = (), string? sortBy = (), string? sortDir = (), string? dateFilter = (), string? startDate = (), string? endDate = ()) returns InlineResponse20011|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/appointments`;
        map<anydata> queryParam = {"page": page, "set_for": setFor, "set_by": setBy, "modified_by": modifiedBy, "confirmed_by": confirmedBy, "rescheduled_by": rescheduledBy, "seen_by": seenBy, "rescheduled_count": rescheduledCount, "done": done, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20011 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead appointment
    #
    # + leadId - Lead Id 
    # + payload - Create a lead appointment 
    # + return - Appointment has been created successfully 
    remote isolated function createLeadAppointment(int leadId, LeadidAppointmentsBody payload) returns InlineResponse20012|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/appointments`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20012 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Populate PDF Document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + return - Document populated successfully. 
    remote isolated function populatePdfDocument(int leadId, int applicationId) returns InlineResponse20013|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/applications/${getEncodedUri(applicationId)}/populate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse20013 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get lead tasks
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead tasks 
    remote isolated function getLeadTasks(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20014|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/tasks`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20014 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a lead task
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - Task has been created successfully 
    remote isolated function createLeadTask(int leadId, LeadidTasksBody payload) returns InlineResponse20015|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/tasks`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20015 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of assigned users
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of assigned users 
    remote isolated function getAssignedUsers(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20016|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Assign a user
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - User has been assigned successfully 
    remote isolated function assignUser(int leadId, LeadidUsersBody payload) returns InlineResponse20017|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/users`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20017 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unassign a user from a lead
    #
    # + leadId - Lead Id 
    # + userId - User Id 
    # + return - User has been unassigned successfully 
    remote isolated function unassignUserFromLead(int leadId, int userId) returns InlineResponse20018|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20018 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a list of available documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available documents 
    remote isolated function getAvailableDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20019|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/documents`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20019 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available document labels
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available labels 
    remote isolated function getAvailableDocumentLabels(int? page = (), int? perPage = ()) returns InlineResponse20020|error {
        string resourcePath = string `/api/v1/leads/file_labels`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a document
    #
    # + leadId - Lead Id 
    # + documentId - Document Id 
    # + return - Document 
    remote isolated function downoladDocument(int leadId, int documentId) returns string|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/documents/${getEncodedUri(documentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of email templates
    #
    # + return - A list of available email templates 
    remote isolated function getEmailTemplates() returns InlineResponse20021|error {
        string resourcePath = string `/api/v1/leads/emails/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20021 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Download a mailbox email attachment
    #
    # + leadId - Lead Id 
    # + emailId - Email Id 
    # + attachmentId - Attachment Id 
    # + return - Document 
    remote isolated function downloadMailboxEmailAttachment(int leadId, int emailId, int attachmentId) returns string|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/mailbox/${getEncodedUri(emailId)}/attachment/${getEncodedUri(attachmentId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Send an SMS to lead with selected SMS template
    #
    # + leadId - Lead Id 
    # + templateId - Template Id 
    # + payload - Payload data 
    # + return - Result of proccess 
    remote isolated function sendSmsToLeadWithSelectedSmsTemplate(int leadId, int templateId, SmsTemplateidBody payload) returns InlineResponse20022|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/sms/${getEncodedUri(templateId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse20022 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get list of SMS templates
    #
    # + return - A list of available SMS templates 
    remote isolated function getSmsTemplates() returns InlineResponse20023|error {
        string resourcePath = string `/api/v1/leads/sms/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20023 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead campaign activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadCampaignActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20024|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/campaign`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20024 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead deletion activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDeletionActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20025|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/deletion`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20025 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead duplicate activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDuplicateActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20026|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/duplicates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20026 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead links activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadLinksActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20027|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/links`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead source activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadSourceActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20028|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/source`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20028 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of all lead status activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadStatusActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20029|error {
        string resourcePath = string `/api/v1/leads/${getEncodedUri(leadId)}/activity/status`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20029 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available applications
    #
    # + return - A list of available applications 
    remote isolated function getAvailableApplications() returns BriefApplicationInfo[]|error {
        string resourcePath = string `/leads/applications`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        BriefApplicationInfo[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available application field mappings
    #
    # + appId - Application Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available application field mappings 
    remote isolated function getAvailableApplicationFieldMappings(int appId, int? page = (), int? perPage = ()) returns InlineResponse20030|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20030 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new application field mapping
    #
    # + appId - Application Id 
    # + return - Created new application field mapping 
    remote isolated function createNewApplicationFieldMapping(int appId, ApplicationField payload) returns ApplicationField|error {
        string resourcePath = string `/leads/applications/${getEncodedUri(appId)}/mappings`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApplicationField response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of available campaigns
    #
    # + return - A list of available campaigns 
    remote isolated function getAvailableCampaigns() returns InlineResponse20031|error {
        string resourcePath = string `/api/v1/leads/campaigns`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20031 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available groups
    #
    # + status - Status Id 
    # + return - A list of available groups 
    remote isolated function getAvailableGroups(int? status = ()) returns InlineResponse20032|error {
        string resourcePath = string `/api/v1/leads/groups`;
        map<anydata> queryParam = {"status": status};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of available users
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available users 
    remote isolated function getAvailableUsers(int? page = (), int? perPage = ()) returns InlineResponse20016|error {
        string resourcePath = string `/api/v1/leads/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
