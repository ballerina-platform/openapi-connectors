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

# This is a generated connector for [IRIS Helpdesk API v1.6.4](https://www.iriscrm.com/api) OpenAPI specification.
# Connect with the Helpdesk API to work with your ticket data.  
# Helpdesk tickets are organized by ticket types.
# Ticket types have properties such as assigned users, expected time to completion (SLA), and visibility to help you segment tickets based on job descriptions.
# Get detailed helpdesk ticket information, perform updates, and manage attached files with ease by using the Helpdesk API.
@display {label: "IRIS Helpdesk", iconPath: "icon.png"}
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
    # Get a list of helpdesk tickets
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of helpdesk tickets by the field value 
    # + sortDir - Direction of sorting 
    # + dateFilter - Filter tickets by the specific date field 
    # + startDate - Start date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - End date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + group - Filter tickets by the specific ticket groups 
    # + 'type - Filter tickets by the specific ticket types 
    # + creator - Filter tickets by the ticket creator 
    # + modifier - Filter tickets by the ticket modifier 
    # + search - Search tickets by some criteria 
    # + searchBy - Search tickets by some specific field 
    # + resolver - Filter tickets by the ticket resolver 
    # + lid - Filter tickets by the Lead ID 
    # + mid - Filter tickets by the Merchant ID 
    # + hideResolved - Hide resolved ticket 
    # + assignedTo - Filter tickets by the assigned users. For sending multiple users please send them in comma seperated format. Please use an empty string to select all assigned tickets. 
    # + unassigned - Set this parameter to 1 if you need unassigned tickets also. For select only unassigned tickets exclude `assigned_to` from the request 
    # + return - A JSON array of tickets 
    remote isolated function getHelpdeskTickets(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? dateFilter = (), string? startDate = (), string? endDate = (), string? group = (), string? 'type = (), decimal? creator = (), decimal? modifier = (), string? search = (), string? searchBy = (), decimal? resolver = (), decimal? lid = (), string? mid = (), boolean? hideResolved = (), string? assignedTo = (), boolean? unassigned = ()) returns InlineResponse200|error {
        string resourcePath = string `/api/v1/helpdesk`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "group": group, "type": 'type, "creator": creator, "modifier": modifier, "search": search, "search_by": searchBy, "resolver": resolver, "lid": lid, "mid": mid, "hide_resolved": hideResolved, "assigned_to": assignedTo, "unassigned": unassigned};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new ticket
    #
    # + payload - Ticket details 
    # + return - Ticket has been created successfully 
    remote isolated function createNewTicket(V1HelpdeskBody payload) returns TicketDetail|error {
        string resourcePath = string `/api/v1/helpdesk`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TicketDetail response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Add a ticket comment
    #
    # + ticketId - Ticket Id 
    # + payload - Comment details 
    # + return - Comment was added successfully 
    remote isolated function addTicketComment(int ticketId, TicketidCommentBody payload) returns BriefTicketComments|error {
        string resourcePath = string `/api/v1/helpdesk/${getEncodedUri(ticketId)}/comment`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BriefTicketComments response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get detailed ticked information
    #
    # + ticketId - Ticket Id 
    # + return - A JSON array of tickets 
    remote isolated function getDetailedTicketInformation(int ticketId) returns TicketDetail|error {
        string resourcePath = string `/api/v1/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a ticket
    #
    # + ticketId - Ticket Id 
    # + return - Ticket has been deleted successfully 
    remote isolated function deleteTicket(int ticketId) returns InlineResponse2001|error {
        string resourcePath = string `/api/v1/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a ticket
    #
    # + ticketId - Ticket Id 
    # + payload - Ticket details 
    # + return - Ticket has been updated successfully 
    remote isolated function updateTicket(int ticketId, HelpdeskTicketidBody payload) returns TicketDetail|error {
        string resourcePath = string `/api/v1/helpdesk/${getEncodedUri(ticketId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TicketDetail response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get ticked assignment logs
    #
    # + ticketId - Ticket Id 
    # + return - A JSON array of assignments 
    remote isolated function getTicketAssignmentLogs(int ticketId) returns InlineResponse2002[]|error {
        string resourcePath = string `/api/v1/helpdesk/${getEncodedUri(ticketId)}/assignments`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get a list of helpdesk ticket types
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + sortBy - Sorting of helpdesk ticket types by the field value 
    # + sortDir - Direction of sorting 
    # + dateFilter - Filter ticket types by the specific date field 
    # + startDate - Start date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + endDate - End date for date_filter filter in format ISO 8601 (**Please note that `+` sign should be encoded to `%2B`**) 
    # + status - Status 
    # + priority - 0 - Normal, 1 - Medium, 2 - Rush 
    # + daysToResolve - Days to resolve 
    # + creator - Creator 
    # + modifier - Filter ticket types by the ticket modifier 
    # + return - A JSON array of ticket types 
    remote isolated function getHelpdeskTicketTypes(int? page = (), int? perPage = (), string? sortBy = (), string sortDir = "asc", string? dateFilter = (), string? startDate = (), string? endDate = (), string? status = (), int? priority = (), decimal? daysToResolve = (), decimal? creator = (), decimal? modifier = ()) returns InlineResponse2003|error {
        string resourcePath = string `/api/v1/helpdesk/types`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "sort_by": sortBy, "sort_dir": sortDir, "date_filter": dateFilter, "start_date": startDate, "end_date": endDate, "status": status, "priority": priority, "daysToResolve": daysToResolve, "creator": creator, "modifier": modifier};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create a new helpdesk ticket type
    #
    # + payload - Comment details 
    # + return - A JSON array of ticket types 
    remote isolated function createHelpdeskTicketType(HelpdeskTypesBody payload) returns TypeDetail|error {
        string resourcePath = string `/api/v1/helpdesk/types`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeDetail response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get details for a helpdesk ticket type
    #
    # + typeId - Ticket Type Id 
    # + return - A JSON array of ticket types 
    remote isolated function getHelpdeskTicketType(int typeId) returns TypeDetail|error {
        string resourcePath = string `/api/v1/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TypeDetail response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete a ticket type
    #
    # + typeId - Ticket Type Id 
    # + return - Result message 
    remote isolated function deleteTicketType(int typeId) returns InlineResponse2004|error {
        string resourcePath = string `/api/v1/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2004 response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a helpdesk ticket type
    #
    # + typeId - Ticket Type Id 
    # + payload - Ticket data 
    # + return - A JSON array of ticket types 
    remote isolated function updateHelpdeskTicketType(int typeId, TypesTypeidBody payload) returns TypeDetail|error {
        string resourcePath = string `/api/v1/helpdesk/types/${getEncodedUri(typeId)}`;
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TypeDetail response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a list of available users to notify and assign
    #
    # + page - Page number 
    # + perPage - Count of records per page 
    # + role - ID of user class 
    # + return - A JSON array of users 
    remote isolated function getAvailableUsersToNotify(int? page = (), int? perPage = (), string? role = ()) returns InlineResponse2005|error {
        string resourcePath = string `/api/v1/helpdesk/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage, "role": role};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-API-KEY": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2005 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
