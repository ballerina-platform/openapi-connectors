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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `X-API-KEY`
    string xApiKey;
|};

# This is a generated connector for [IRIS Leads API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the Leads API to interact with your lead data.  
# Includes management of fields, user assignments, status changes, tasks, appointments, email, text messaging, and document attachments.
# Create custom reports without limits using the data already housed within your CRM.
@display {label: "IRIS Lead", iconPath: "resources/iris.lead.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [IRIS account](https://www.iriscrm.com) and obtain tokens by following [this guide](https://www.iriscrm.com/api/#section/Generate-an-API-token).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get a list of leads
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of leads by the field value 
    # + sortDir - Direction of sorting 
    # + 'group - Filter leads by a group id 
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
    remote isolated function getLeads(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", int? 'group = (), int? mid = (), int? campaign = (), int? 'source = (), int? status = (), int? category = (), int? user = (), string? dateFilter = (), string? startDate = (), string? endDate = (), string? email = ()) returns InlineResponse20016|error {
        string  path = string `/api/v1/leads`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "group": 'group, "mid": mid, "campaign": campaign, "source": 'source, "status": status, "category": category, "user": user, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "email": email};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20016 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20016);
        return response;
    }
    # Create a lead
    #
    # + payload - Lead details 
    # + return - Lead has been created successfully 
    remote isolated function createLead(Body1 payload) returns InlineResponse20017|error {
        string  path = string `/api/v1/leads`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20017 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20017);
        return response;
    }
    # Get detailed lead information
    #
    # + leadId - Lead Id 
    # + return - Detailed lead information 
    remote isolated function getDetailedLeadInformation(int leadId) returns InlineResponse20018|error {
        string  path = string `/api/v1/leads/${leadId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20018 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20018);
        return response;
    }
    # Update a lead
    #
    # + leadId - Lead Id 
    # + payload - Lead changes (send only fields you want to change) 
    # + return - Lead has been updated successfully 
    remote isolated function updateLead(int leadId, Body2 payload) returns InlineResponse20019|error {
        string  path = string `/api/v1/leads/${leadId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20019 response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=InlineResponse20019);
        return response;
    }
    # Delete record from a lead record set
    #
    # + leadId - Lead Id 
    # + catId - Record category ID 
    # + recordId - Record ID 
    # + return - The record has been deleted successfully 
    remote isolated function deleteRecordFromALeadRecordSet(int leadId, int catId, int recordId) returns InlineResponse20020|error {
        string  path = string `/api/v1/leads/${leadId}/records/${catId}/${recordId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20020 response = check self.clientEp-> delete(path, accHeaders, targetType = InlineResponse20020);
        return response;
    }
    # Get a list of available lead fields
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available fields 
    remote isolated function getAvailableLeadFields(int? page = (), int? perPage = ()) returns InlineResponse20021|error {
        string  path = string `/api/v1/leads/fields`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20021 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20021);
        return response;
    }
    # Create a new lead field
    #
    # + payload - LeadField data 
    # + return - Created field 
    remote isolated function createNewLeadField(Body3 payload) returns LeadField|error {
        string  path = string `/api/v1/leads/fields`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LeadField response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LeadField);
        return response;
    }
    # Get a lead field
    #
    # + fieldId - Field Id 
    # + return - Get a lead field 
    remote isolated function getLeadField(int fieldId) returns LeadField|error {
        string  path = string `/api/v1/leads/fields/${fieldId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LeadField response = check self.clientEp-> get(path, accHeaders, targetType = LeadField);
        return response;
    }
    # Update a lead field
    #
    # + fieldId - Field Id 
    # + payload - LeadField data 
    # + return - Updated field attributes 
    remote isolated function updateLeadField(int fieldId, Body4 payload) returns LeadField|error {
        string  path = string `/api/v1/leads/fields/${fieldId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LeadField response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=LeadField);
        return response;
    }
    # Update a lead field order position
    #
    # + fieldId - Field Id 
    # + payload - LeadFieldOrder data 
    # + return - Updated Lead field order position 
    remote isolated function updateLeadFieldOrderPosition(int fieldId, LeadFieldOrder payload) returns InlineResponse20022|error {
        string  path = string `/api/v1/leads/fields/${fieldId}/order`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20022 response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=InlineResponse20022);
        return response;
    }
    # Get a list of all lead field tabs
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of all lead field tabs 
    remote isolated function getAllLeadFieldTabs(int? page = (), int? perPage = ()) returns InlineResponse20023|error {
        string  path = string `/api/v1/leads/fields/tabs`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20023 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20023);
        return response;
    }
    # Create a lead field tab
    #
    # + payload - LeadFieldTab data 
    # + return - Create a lead field tab 
    remote isolated function createLeadFieldTab(LeadFieldTab payload) returns LeadFieldTab|error {
        string  path = string `/api/v1/leads/fields/tabs`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LeadFieldTab response = check self.clientEp->post(path, request, headers = accHeaders, targetType=LeadFieldTab);
        return response;
    }
    # Get a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + return - Lead field tab 
    remote isolated function getLeadFieldTab(int tabId) returns LeadFieldTab|error {
        string  path = string `/api/v1/leads/fields/tabs/${tabId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        LeadFieldTab response = check self.clientEp-> get(path, accHeaders, targetType = LeadFieldTab);
        return response;
    }
    # Update a lead field tab
    #
    # + tabId - Lead field tab Id 
    # + payload - LeadFieldTab data 
    # + return - Updated lead field tab 
    remote isolated function updateLeadFieldTab(int tabId, LeadFieldTab payload) returns LeadFieldTab|error {
        string  path = string `/api/v1/leads/fields/tabs/${tabId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LeadFieldTab response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=LeadFieldTab);
        return response;
    }
    # Get pricing templates
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of pricing templates 
    remote isolated function getPricingTemplates(int? page = (), int? perPage = ()) returns InlineResponse20024|error {
        string  path = string `/api/v1/leads/pricing_templates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20024 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20024);
        return response;
    }
    # Get lead notes
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead notes 
    remote isolated function getLeadNotes(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20025|error {
        string  path = string `/api/v1/leads/${leadId}/notes`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20025 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20025);
        return response;
    }
    # Create a lead note
    #
    # + leadId - Lead Id 
    # + payload - Create a lead note 
    # + return - Note has been added successfully 
    remote isolated function createLeadNote(int leadId, Body5 payload) returns InlineResponse20026|error {
        string  path = string `/api/v1/leads/${leadId}/notes`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20026 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20026);
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
    remote isolated function getLeadAppointments(int leadId, int? page = (), int? setFor = (), int? setBy = (), int? modifiedBy = (), int? confirmedBy = (), int? rescheduledBy = (), int? seenBy = (), int? rescheduledCount = (), boolean? done = (), int? perPage = (), string? sortBy = (), string? sortDir = (), string? dateFilter = (), string? startDate = (), string? endDate = ()) returns InlineResponse20027|error {
        string  path = string `/api/v1/leads/${leadId}/appointments`;
        map<anydata> queryParam = {"page": page, "set_for": setFor, "set_by": setBy, "modified_by": modifiedBy, "confirmed_by": confirmedBy, "rescheduled_by": rescheduledBy, "seen_by": seenBy, "rescheduled_count": rescheduledCount, "done": done, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20027 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20027);
        return response;
    }
    # Create a lead appointment
    #
    # + leadId - Lead Id 
    # + payload - Create a lead appointment 
    # + return - Appointment has been created successfully 
    remote isolated function createLeadAppointment(int leadId, Body6 payload) returns InlineResponse20028|error {
        string  path = string `/api/v1/leads/${leadId}/appointments`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20028 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20028);
        return response;
    }
    # Populate PDF Document
    #
    # + leadId - Lead Id 
    # + applicationId - Application Id 
    # + return - Document populated successfully. 
    remote isolated function populatePdfDocument(int leadId, int applicationId) returns InlineResponse20029|error {
        string  path = string `/api/v1/leads/${leadId}/applications/${applicationId}/populate`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        InlineResponse20029 response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = InlineResponse20029);
        return response;
    }
    # Get lead tasks
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of lead tasks 
    remote isolated function getLeadTasks(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20030|error {
        string  path = string `/api/v1/leads/${leadId}/tasks`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20030 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20030);
        return response;
    }
    # Create a lead task
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - Task has been created successfully 
    remote isolated function createLeadTask(int leadId, Body7 payload) returns InlineResponse20031|error {
        string  path = string `/api/v1/leads/${leadId}/tasks`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20031 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20031);
        return response;
    }
    # Get a list of assigned users
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of assigned users 
    remote isolated function getAssignedUsers(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20032|error {
        string  path = string `/api/v1/leads/${leadId}/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20032);
        return response;
    }
    # Assign a user
    #
    # + leadId - Lead Id 
    # + payload - Create a lead task 
    # + return - User has been assigned successfully 
    remote isolated function assignUser(int leadId, Body8 payload) returns InlineResponse20033|error {
        string  path = string `/api/v1/leads/${leadId}/users`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20033 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20033);
        return response;
    }
    # Unassign a user from a lead
    #
    # + leadId - Lead Id 
    # + userId - User Id 
    # + return - User has been unassigned successfully 
    remote isolated function unassignUserFromLead(int leadId, int userId) returns InlineResponse20034|error {
        string  path = string `/api/v1/leads/${leadId}/users/${userId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20034 response = check self.clientEp-> delete(path, accHeaders, targetType = InlineResponse20034);
        return response;
    }
    # Get a list of available documents
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available documents 
    remote isolated function getAvailableDocuments(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20035|error {
        string  path = string `/api/v1/leads/${leadId}/documents`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20035 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20035);
        return response;
    }
    # Get a list of available document labels
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available labels 
    remote isolated function getAvailableDocumentLabels(int? page = (), int? perPage = ()) returns InlineResponse20036|error {
        string  path = string `/api/v1/leads/file_labels`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20036 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20036);
        return response;
    }
    # Download a document
    #
    # + leadId - Lead Id 
    # + documentId - Document Id 
    # + return - Document 
    remote isolated function downoladDocument(int leadId, int documentId) returns string|error {
        string  path = string `/api/v1/leads/${leadId}/documents/${documentId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Send an email to lead with template
    #
    # + leadId - Lead Id 
    # + templateId - Template Id 
    # + payload - Payload data 
    # + return - Result of proccess 
    remote isolated function sendEmailToLeadWithTemplate(int leadId, int templateId, Body11 payload) returns InlineResponse20040|error {
        string  path = string `/api/v1/leads/${leadId}/emails/${templateId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20040 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20040);
        return response;
    }
    # Get a list of email templates
    #
    # + return - A list of available email templates 
    remote isolated function getEmailTemplates() returns InlineResponse20041|error {
        string  path = string `/api/v1/leads/emails/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20041 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20041);
        return response;
    }
    # Download a mailbox email attachment
    #
    # + leadId - Lead Id 
    # + emailId - Email Id 
    # + attachmentId - Attachment Id 
    # + return - Document 
    remote isolated function downloadMailboxEmailAttachment(int leadId, int emailId, int attachmentId) returns string|error {
        string  path = string `/api/v1/leads/${leadId}/mailbox/${emailId}/attachment/${attachmentId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string response = check self.clientEp-> get(path, accHeaders, targetType = string);
        return response;
    }
    # Send an SMS to lead with selected SMS template
    #
    # + leadId - Lead Id 
    # + templateId - Template Id 
    # + payload - Payload data 
    # + return - Result of proccess 
    remote isolated function sendSmsToLeadWithSelectedSmsTemplate(int leadId, int templateId, Body12 payload) returns InlineResponse20042|error {
        string  path = string `/api/v1/leads/${leadId}/sms/${templateId}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse20042 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse20042);
        return response;
    }
    # Get list of SMS templates
    #
    # + return - A list of available SMS templates 
    remote isolated function getSmsTemplates() returns InlineResponse20043|error {
        string  path = string `/api/v1/leads/sms/templates`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20043 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20043);
        return response;
    }
    # Get a list of all lead campaign activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadCampaignActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20044|error {
        string  path = string `/api/v1/leads/${leadId}/activity/campaign`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20044 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20044);
        return response;
    }
    # Get a list of all lead deletion activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDeletionActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20045|error {
        string  path = string `/api/v1/leads/${leadId}/activity/deletion`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20045 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20045);
        return response;
    }
    # Get a list of all lead duplicate activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadDuplicateActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20046|error {
        string  path = string `/api/v1/leads/${leadId}/activity/duplicates`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20046 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20046);
        return response;
    }
    # Get a list of all lead links activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadLinksActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20047|error {
        string  path = string `/api/v1/leads/${leadId}/activity/links`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20047 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20047);
        return response;
    }
    # Get a list of all lead source activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadSourceActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20048|error {
        string  path = string `/api/v1/leads/${leadId}/activity/source`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20048 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20048);
        return response;
    }
    # Get a list of all lead status activity
    #
    # + leadId - Lead Id 
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of activity 
    remote isolated function getAllLeadStatusActivity(int leadId, int? page = (), int? perPage = ()) returns InlineResponse20049|error {
        string  path = string `/api/v1/leads/${leadId}/activity/status`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20049 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20049);
        return response;
    }
    # Get a list of available campaigns
    #
    # + return - A list of available campaigns 
    remote isolated function getAvailableCampaigns() returns InlineResponse20052|error {
        string  path = string `/api/v1/leads/campaigns`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20052 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20052);
        return response;
    }
    # Get a list of available groups
    #
    # + status - Status Id 
    # + return - A list of available groups 
    remote isolated function getAvailableGroups(int? status = ()) returns InlineResponse20053|error {
        string  path = string `/api/v1/leads/groups`;
        map<anydata> queryParam = {"status": status};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20053 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20053);
        return response;
    }
    # Get a list of available sources
    #
    # + return - A list of available sources 
    remote isolated function getAvailableSources() returns InlineResponse20054|error {
        string  path = string `/api/v1/leads/sources`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20054 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20054);
        return response;
    }
    # Get a list of available statuses
    #
    # + 'group - Group Id 
    # + return - A list of available statuses 
    remote isolated function getAvailableStatuses(int? 'group = ()) returns InlineResponse20055|error {
        string  path = string `/api/v1/leads/statuses`;
        map<anydata> queryParam = {"group": 'group};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20055 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20055);
        return response;
    }
    # Get a list of available users
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + return - A list of available users 
    remote isolated function getAvailableUsers(int? page = (), int? perPage = ()) returns InlineResponse20032|error {
        string  path = string `/api/v1/leads/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse20032 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse20032);
        return response;
    }
}
