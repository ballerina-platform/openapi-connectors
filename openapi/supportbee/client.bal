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
    # Represents API Key `auth_token`
    string authToken;
|};

# This is a generated connector for [SupportBee API v1](https://supportbee.com/api) OpenAPI specification.
# SupportBee’s support ticket system enables teams to organize, prioritize and collaborate on customer support emails.
@display {label: "SupportBee", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [SupportBee account](https://supportbee.com) and obtain tokens by following [this guide](https://supportbee.com/api#authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Returns 15 tickets of the company in the order of their last activity. Only tickets that are not archived are returned.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + perPage - Specifies the number of tickets to retrieve. Must be less than 100. Defaults to 15. 
    # + page - Specifies the page of tickets to retrieve. Defaults to 1. 
    # + archived - If true, retrieves only archived tickets. If false, it does not return any archived tickets. If any, includes archived tickets in the result. Defaults to false. 
    # + spam - If true, retrieved tickets contain tickets marked as spam. Defaults to false. 
    # + trash - If true, retrieved tickets contain tickets that are trashed. Defaults to false. 
    # + replies - If true, retrieved tickets contain only tickets with replies. If false, retrieved tickets contain only tickets without replies. 
    # + maxReplies - Specifies the number of replies that a ticket must have. This cannot be used with replies = false. 
    # + assignedUser - If me, retrieves only tickets assigned to the current user. If agent_id, retrieves only tickets assigned to the Agent with id agent_id. If any, retrieves tickets that are assigned to any user. If none, retrieves tickets that aren't assigned to any user. 
    # + assignedTeam - If mine, retrieves only tickets assigned to the teams of the current user. If team_id, retrieves only tickets assigned to the team with id team_id. If none, retrieves tickets that aren't assigned to any team. 
    # + starred - If true, retrieves only the starred tickets of the current user. If false, retrieves only the non starred tickets assigned to the current user. 
    # + label - Set to label_name, retrieves only the tickets with the label label_name. 
    # + since - Can be used to retrieve tickets whose last activity timestamp is greater than the time specified in this parameter. The last activity timestamp of a ticket is updated whenever there is a new reply or a new comment on the ticket. To retrieve tickets sorted by creation time, instead of last activity, send the sort_by parameter along with the since parameter. 
    # + until - Can be used to retrieve tickets whose last activity timestamp is lesser than the time specified in this parameter. The last activity timestamp of a ticket is updated whenever there is a new reply or a new comment on the ticket. To retrieve tickets sorted by creation time, instead of last activity, send the sort_by parameter along with the until parameter. 
    # + sortBy - If last_activity, retrieves tickets sorted by last activity. If creation_time, retrieves tickets sorted by creation time. Defaults to last_activity. 
    # + requesterEmails - Can be used to filter tickets by requester email addresses. Accepts a string of comma separated email addresses. For Example requester_emails=test1@example.com,test2@example.com 
    # + totalOnly - Can be used in conjunction with any other parameters to return only the total number of tickets. Accepts any truthy value. For example total_only=true. Defaults to false. 
    # + return - An object with a property tickets which is an array of Ticket objects. 
    remote isolated function listTickets(string accept = "application/json", int? perPage = (), int? page = (), string? archived = (), boolean? spam = (), boolean? trash = (), boolean? replies = (), int? maxReplies = (), string? assignedUser = (), string? assignedTeam = (), boolean? starred = (), string? label = (), string? since = (), string? until = (), string? sortBy = (), string? requesterEmails = (), boolean? totalOnly = ()) returns Tickets|error {
        string resourcePath = string `/tickets`;
        map<anydata> queryParam = {"per_page": perPage, "page": page, "archived": archived, "spam": spam, "trash": trash, "replies": replies, "max_replies": maxReplies, "assigned_user": assignedUser, "assigned_team": assignedTeam, "starred": starred, "label": label, "since": since, "until": until, "sort_by": sortBy, "requester_emails": requesterEmails, "total_only": totalOnly, "auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Tickets response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a ticket for the company.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + payload - The data required to create a ticket. 
    # + return - Created ticket 
    remote isolated function createTicket(CreateTicketRequest payload, string accept = "application/json") returns CreatedTicket|error {
        string resourcePath = string `/tickets`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedTicket response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves the ticket specified by the id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + id - The ticket ID 
    # + return - A ticket object 
    remote isolated function getTicket(string id, string accept = "application/json") returns TicketObject|error {
        string resourcePath = string `/tickets/${id}`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TicketObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Deletes a trashed ticket.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + id - The ticket ID 
    # + return - An empty body if the ticket was successfully deleted. 
    remote isolated function deleteTrashedTicket(string id, string accept = "application/json") returns http:Response|error {
        string resourcePath = string `/tickets/${id}`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Archives an unarchived ticket specified by ticket_id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + return - An empty body if the ticket was successfully archived. 
    remote isolated function archiveTicket(string ticketId, string accept = "application/json") returns http:Response|error {
        string resourcePath = string `/tickets/${ticketId}/archive`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Trashes' an un-trashed ticket specified by ticket_id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + return - An empty body if the ticket was successfully trashed. 
    remote isolated function trashTicket(string ticketId, string accept = "application/json") returns http:Response|error {
        string resourcePath = string `/tickets/${ticketId}/trash`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Assign a ticket to a user. If the ticket is already assigned to a team, then the given user must be a member of that team.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + payload - The data required to assign a ticket to a user. 
    # + return - An object with a property user_assignment. 
    remote isolated function assignUser(string ticketId, AssignUserRequest payload, string accept = "application/json") returns AssignedUserObject|error {
        string resourcePath = string `/tickets/${ticketId}/user_assignment`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssignedUserObject response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves the user specified by id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + id - The user ID 
    # + maxTickets - Specify the maximum number of recent tickets you want to retrieve that this user created. If false returns all tickets. 
    # + return - A user object 
    remote isolated function getUser(string id, string accept = "application/json", string? maxTickets = ()) returns GetUserObject|error {
        string resourcePath = string `/users/${id}`;
        map<anydata> queryParam = {"max_tickets": maxTickets, "auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GetUserObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves all users of the company.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + withInvited - If true, returns all the agents, including invited (unconfirmed) agents. Defaults to false. 
    # + withRoles - Specifies the role of the users you want to get. The role must be one of these: admin, agent, collaborator, customer. Several or all of these values can be used. Defaults to admin,agent,collaborator. 
    # + 'type - Specifies the type of the users you want to get. The type must be one of these: user, customer_group. Defaults to user. 
    # + return - An object with a property users which is an array of User objects. 
    remote isolated function listUsers(string accept = "application/json", boolean? withInvited = (), string? withRoles = (), string? 'type = ()) returns Users|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"with_invited": withInvited, "with_roles": withRoles, "type": 'type, "auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Users response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves all the replies of the ticket with id ticket_id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + return - An object with a property replies which is an array of Reply objects. 
    remote isolated function listReplies(string ticketId, string accept = "application/json") returns Replies|error {
        string resourcePath = string `/tickets/${ticketId}/replies`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Replies response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Posts a reply to the ticket with id ticket_id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + payload - The data required to create a ticket. 
    # + return - Created reply 
    remote isolated function createReply(string ticketId, CreateReplyRequest payload, string accept = "application/json") returns CreatedReply|error {
        string resourcePath = string `/tickets/${ticketId}/replies`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedReply response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieves the reply for ticket specified by the ticket_id with id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + id - The reply ID 
    # + return - A reply object 
    remote isolated function getReply(string ticketId, string id, string accept = "application/json") returns ReplyObject|error {
        string resourcePath = string `/tickets/${ticketId}/replies/${id}`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ReplyObject response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Adds the label with {label_name} to the ticket with id ticket_id
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + labelName - The label name 
    # + return - Created reply 
    remote isolated function createLabel(string ticketId, string labelName, string accept = "application/json") returns CreatedLabel|error {
        string resourcePath = string `/tickets/${ticketId}/labels/${labelName}`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        CreatedLabel response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Removes label from a ticket.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + labelName - The label name 
    # + return - An empty body if the label was successfully removed. 
    remote isolated function removeLabel(string ticketId, string labelName, string accept = "application/json") returns http:Response|error {
        string resourcePath = string `/tickets/${ticketId}/labels/${labelName}`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves all the custom labels of a company.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + return - An object with a property labels which is an array of Label objects. 
    remote isolated function listLabels(string accept = "application/json") returns Labels|error {
        string resourcePath = string `/labels`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Labels response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieves all the comments of the ticket with id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + return - An object with a property comments which is an array of Comment objects. 
    remote isolated function listComments(string ticketId, string accept = "application/json") returns Comments|error {
        string resourcePath = string `/tickets/${ticketId}/comments`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Comments response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Posts a comment to the ticket with id.
    #
    # + accept - All API requests must have a Accept header set to application/json. 
    # + ticketId - The ticket ID 
    # + payload - The data required to create a comment. 
    # + return - Created comment 
    remote isolated function createComment(string ticketId, CreateCommentRequest payload, string accept = "application/json") returns CreatedComment|error {
        string resourcePath = string `/tickets/${ticketId}/comments`;
        map<anydata> queryParam = {"auth_token": self.apiKeyConfig.authToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Accept": accept};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedComment response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
