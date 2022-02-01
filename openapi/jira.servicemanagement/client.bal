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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
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

# This is a generated connector for [Jira Service Management Cloud REST API](https://developer.atlassian.com/cloud/jira/service-desk/) OpenAPI specification. 
# The Jira Service Management Cloud REST APIs are for developers who want to integrate Jira Service Management with other applications or administrators that want to automate their workflows and processes.
@display {label: "Jira Service Management", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Atlassian Account](https://id.atlassian.com/signup) 
    # and obtain tokens by following [this guide](https://developer.atlassian.com/cloud/jira/platform/basic-auth-for-rest-apis/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create customer
    #
    # + payload - Customer details 
    # + return - Returns the customer details. 
    remote isolated function createCustomer(CustomerCreateDTO payload) returns UserDTO|error {
        string resourcePath = string `/rest/servicedeskapi/customer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UserDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get info
    #
    # + return - Returns the runtime information for the Jira Service Management instance. 
    remote isolated function getInfo() returns SoftwareInfoDTO|error {
        string resourcePath = string `/rest/servicedeskapi/info`;
        SoftwareInfoDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get insight workspaces
    #
    # + 'start - The starting index of the returned workspace IDs. Base index: 0 See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of workspace IDs to return per page. Default: 50 See the [Pagination](#pagination) section for more details. 
    # + return - Returned if the request is successful. 
    remote isolated function getInsightWorkspaces(int 'start = 0, int 'limit = 50) returns PagedDTOInsightWorkspaceDTO|error {
        string resourcePath = string `/rest/servicedeskapi/insight/workspace`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOInsightWorkspaceDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get articles
    #
    # + query - The string used to filter the articles (required). 
    # + highlight - If set to true matching query term in the title and excerpt will be highlighted using the \{@code @@@hl@@@term@@@endhl@@@\} syntax. Default: false. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the articles, on the specified page of the results. 
    remote isolated function getArticles(string? query = (), boolean highlight = false, int? 'start = (), int? 'limit = ()) returns PagedDTOArticleDTO|error {
        string resourcePath = string `/rest/servicedeskapi/knowledgebase/article`;
        map<anydata> queryParam = {"query": query, "highlight": highlight, "start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOArticleDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get organizations
    #
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of organizations to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + return - Returns paginated list of organizations. 
    remote isolated function getOrganizations(int? 'start = (), int? 'limit = (), string? accountId = ()) returns PagedDTOOrganizationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/organization`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "accountId": accountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOOrganizationDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create organization
    #
    # + payload - Organization details 
    # + return - Returns the created organization or the existing organization if name already exists. 
    remote isolated function createOrganization(OrganizationCreateDTO payload) returns OrganizationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/organization`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizationDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get organization
    #
    # + organizationId - The ID of the organization. 
    # + return - Returns the requested organization. 
    remote isolated function getOrganization(int organizationId) returns OrganizationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}`;
        OrganizationDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete organization
    #
    # + organizationId - The ID of the organization. 
    # + return - Returned if the organization was deleted. 
    remote isolated function deleteOrganization(int organizationId) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get properties keys
    #
    # + organizationId - The ID of the organization from which keys will be returned. 
    # + return - Returned if the organization was found. 
    remote isolated function getPropertiesKeys(string organizationId) returns PropertyKeys|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/property`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get property
    #
    # + organizationId - The ID of the organization from which the property will be returned. 
    # + propertyKey - The key of the property to return. 
    # + return - Returns the organization's property. 
    remote isolated function getProperty(string organizationId, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/property/${propertyKey}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set property
    #
    # + organizationId - The ID of the organization on which the property will be set. 
    # + propertyKey - The key of the organization's property. The maximum length of the key is 255 bytes. 
    # + return - Returned if the organization property was updated. 
    remote isolated function setProperty(string organizationId, string propertyKey) returns json|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/property/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Delete property
    #
    # + organizationId - The ID of the organization from which the property will be removed. 
    # + propertyKey - The key of the property to remove. 
    # + return - Returned if the organization property was removed. 
    remote isolated function deleteProperty(string organizationId, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/property/${propertyKey}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get users in organization
    #
    # + organizationId - The ID of the organization. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of users to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns a paged list of users associated with the organization, ordered by their accountId. 
    remote isolated function getUsersInOrganization(int organizationId, int? 'start = (), int? 'limit = ()) returns PagedDTOUserDTO|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/user`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOUserDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add users to organization
    #
    # + organizationId - The ID of the organization. 
    # + payload - Organization details 
    # + return - Returned if all the users were valid and added to the organization, no response payload is provided. 
    remote isolated function addUsersToOrganization(int organizationId, UsersOrganizationUpdateDTO payload) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/organization/${organizationId}/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get customer requests
    #
    # + searchTerm - Filters customer requests where the request summary matches the `searchTerm`. [Wildcards](https://confluence.atlassian.com/display/JIRACORECLOUD/Search+syntax+for+text+fields) can be used in the `searchTerm` parameter. 
    # + requestOwnership - Filters customer requests using the following values:  *  `OWNED_REQUESTS` returns customer requests where the user is the creator.  *  `PARTICIPATED_REQUESTS` returns customer requests where the user is a participant.  *  `ORGANIZATION` returns customer requests for an organization of which the user is a member when used in conjunction with `organizationId`.  *  `ALL_ORGANIZATIONS` returns customer requests that belong to all organizations of which the user is a member.  *  `APPROVER` returns customer requests where the user is an approver. Can be used in conjunction with `approvalStatus` to filter pending or complete approvals.  *  `ALL_REQUESTS` returns all customer requests. **Deprecated and will be removed, as the returned requests may change if more values are added in the future. Instead, explicitly list the desired filtering strategies.** Multiple values of the query parameter are supported. For example, `requestOwnership=OWNED_REQUESTS&requestOwnership=PARTICIPATED_REQUESTS` will only return customer requests where the user is the creator or a participant. If not specified, filtering defaults to `OWNED_REQUESTS`, `PARTICIPATED_REQUESTS`, and `ALL_ORGANIZATIONS`. 
    # + requestStatus - Filters customer requests where the request is closed, open, or either of the two where:  *  `CLOSED_REQUESTS` returns customer requests that are closed.  *  `OPEN_REQUESTS` returns customer requests that are open.  *  `ALL_REQUESTS` returns all customer requests. 
    # + approvalStatus - Filters results to customer requests based on their approval status:  *  `MY_PENDING_APPROVAL` returns customer requests pending the user's approval.  *  `MY_HISTORY_APPROVAL` returns customer requests where the user was an approver. **Note**: Valid only when used with requestOwnership=APPROVER. 
    # + organizationId - Filters customer requests that belong to a specific organization (note that the user must be a member of that organization). **Note**: Valid only when used with requestOwnership=ORGANIZATION. 
    # + serviceDeskId - Filters customer requests by service desk. 
    # + requestTypeId - Filters customer requests by request type. Note that the `serviceDeskId` must be specified for the service desk in which the request type belongs. 
    # + expand - A multi-value parameter indicating which properties of the customer request to expand, where:  *  `serviceDesk` returns additional details for each service desk.  *  `requestType` returns additional details for each request type.  *  `participant` returns the participant details, if any, for each customer request.  *  `sla` returns the SLA information on each customer request.  *  `status` returns the status transitions, in chronological order, for each customer request.  *  `attachment` returns the attachments for the customer request.  *  `action` returns the actions that the user can or cannot perform on this customer request.  *  `comment` returns the comments, if any, for each customer request.  *  `comment.attachment` returns the attachment details, if any, for each comment.  *  `comment.renderedBody` (Experimental) returns the rendered body in HTML format (in addition to the raw body) for each comment. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the customer requests, on the specified page of the results. 
    remote isolated function getCustomerRequests(string? searchTerm = (), string[]? requestOwnership = (), string? requestStatus = (), string? approvalStatus = (), int? organizationId = (), int? serviceDeskId = (), int? requestTypeId = (), string[]? expand = (), int? 'start = (), int? 'limit = ()) returns PagedDTOCustomerRequestDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request`;
        map<anydata> queryParam = {"searchTerm": searchTerm, "requestOwnership": requestOwnership, "requestStatus": requestStatus, "approvalStatus": approvalStatus, "organizationId": organizationId, "serviceDeskId": serviceDeskId, "requestTypeId": requestTypeId, "expand": expand, "start": 'start, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"requestOwnership": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PagedDTOCustomerRequestDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create customer request
    #
    # + payload - Request details 
    # + return - Returned if the customer request was created. 
    remote isolated function createCustomerRequest(RequestCreateDTO payload) returns CustomerRequestDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomerRequestDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get customer request by id or key
    #
    # + issueIdOrKey - The ID or Key of the customer request to be returned 
    # + expand - A multi-value parameter indicating which properties of the customer request to expand, where:  *  `serviceDesk` returns additional service desk details.  *  `requestType` returns additional customer request type details.  *  `participant` returns the participant details.  *  `sla` returns the SLA information.  *  `status` returns the status transitions, in chronological order.  *  `attachment` returns the attachments.  *  `action` returns the actions that the user can or cannot perform.  *  `comment` returns the comments.  *  `comment.attachment` returns the attachment details for each comment.  *  `comment.renderedBody` (Experimental) return the rendered body in HTML format (in addition to the raw body) for each comment. 
    # + return - Returns the customer request. 
    remote isolated function getCustomerRequestByIdOrKey(string issueIdOrKey, string[]? expand = ()) returns CustomerRequestDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerRequestDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get approvals
    #
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of approvals to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + issueIdOrKey - The ID or key of the customer request to be queried for its approvals. 
    # + return - Returns the customer request's approvals. 
    remote isolated function getApprovals(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOApprovalDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/approval`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOApprovalDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get approval by id
    #
    # + issueIdOrKey - The ID or key of the customer request the approval is on. 
    # + approvalId - The ID of the approval to be returned. 
    # + return - Returns the requested approval. 
    remote isolated function getApprovalById(string issueIdOrKey, int approvalId) returns ApprovalDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/approval/${approvalId}`;
        ApprovalDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Answer approval
    #
    # + issueIdOrKey - The ID or key of the customer request to be updated. 
    # + approvalId - The ID of the approval to be updated. 
    # + payload - Approval decision request details 
    # + return - Returns the updated approval. 
    remote isolated function answerApproval(string issueIdOrKey, int approvalId, ApprovalDecisionRequestDTO payload) returns ApprovalDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/approval/${approvalId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ApprovalDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get attachments for request
    #
    # + issueIdOrKey - The ID or key of the customer request from which the attachments will be listed. 
    # + 'start - The starting index of the returned attachment. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of comments to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the visible attachments from the customer request. 
    remote isolated function getAttachmentsForRequest(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOAttachmentDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/attachment`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOAttachmentDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create attachment
    #
    # + issueIdOrKey - The ID or key of the customer request to which the attachment will be added. 
    # + payload - Attachment details 
    # + return - Returns the attachments and comment. 
    remote isolated function createAttachment(string issueIdOrKey, AttachmentCreateDTO payload) returns AttachmentCreateResultDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/attachment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AttachmentCreateResultDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get request comments
    #
    # + issueIdOrKey - The ID or key of the customer request whose comments will be retrieved. 
    # + 'public - Specifies whether to return public comments or not. Default: true. 
    # + internal - Specifies whether to return internal comments or not. Default: true. 
    # + expand - A multi-value parameter indicating which properties of the comment to expand:  *  `attachment` returns the attachment details, if any, for each comment. (If you want to get all attachments for a request, use [servicedeskapi/request/\{issueIdOrKey\}/attachment](#api-request-issueIdOrKey-attachment-get).)  *  `renderedBody` (Experimental) returns the rendered body in HTML format (in addition to the raw body) for each comment. 
    # + 'start - The starting index of the returned comments. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of comments to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the comments, on the specified page of the results. 
    remote isolated function getRequestComments(string issueIdOrKey, boolean? 'public = (), boolean? internal = (), string[]? expand = (), int? 'start = (), int? 'limit = ()) returns PagedDTOCommentDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/comment`;
        map<anydata> queryParam = {"public": 'public, "internal": internal, "expand": expand, "start": 'start, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PagedDTOCommentDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create request comment
    #
    # + issueIdOrKey - The ID or key of the customer request to which the comment will be added. 
    # + payload - Comment 
    # + return - Returns the comment. 
    remote isolated function createRequestComment(string issueIdOrKey, CommentCreateDTO payload) returns CommentDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/comment`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CommentDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get request comment by id
    #
    # + issueIdOrKey - The ID or key of the customer request that contains the comment. 
    # + commentId - The ID of the comment to retrieve. 
    # + expand - A multi-value parameter indicating which properties of the comment to expand:  *  `attachment` returns the attachment details, if any, for the comment. (If you want to get all attachments for a request, use [servicedeskapi/request/\{issueIdOrKey\}/attachment](#api-request-issueIdOrKey-attachment-get).)  *  `renderedBody` (Experimental) returns the rendered body in HTML format (in addition to the raw body) of the comment. 
    # + return - Returns the comment. 
    remote isolated function getRequestCommentById(string issueIdOrKey, int commentId, string[]? expand = ()) returns CommentDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/comment/${commentId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CommentDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get comment attachments
    #
    # + issueIdOrKey - The ID or key of the customer request that contains the comment. 
    # + commentId - The ID of the comment. 
    # + 'start - The starting index of the returned comments. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of comments to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the attachments, on the specified page of the results. 
    remote isolated function getCommentAttachments(string issueIdOrKey, int commentId, int? 'start = (), int? 'limit = ()) returns PagedDTOAttachmentDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/comment/${commentId}/attachment`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOAttachmentDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get subscription status
    #
    # + issueIdOrKey - The ID or key of the customer request to be queried for subscription status. 
    # + return - Returns the status of the notification subscription. 
    remote isolated function getSubscriptionStatus(string issueIdOrKey) returns RequestNotificationSubscriptionDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/notification`;
        RequestNotificationSubscriptionDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Subscribe
    #
    # + issueIdOrKey - The ID or key of the customer request to be subscribed to. 
    # + return - Returns if the user was subscribed. 
    remote isolated function subscribe(string issueIdOrKey) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/notification`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Unsubscribe
    #
    # + issueIdOrKey - The ID or key of the customer request to be unsubscribed from. 
    # + return - Returns if the user was unsubscribed. 
    remote isolated function unsubscribe(string issueIdOrKey) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/notification`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get request participants
    #
    # + issueIdOrKey - The ID or key of the customer request to be queried for its participants. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of request types to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the customer request's participants, on the specified page of the results. 
    remote isolated function getRequestParticipants(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOUserDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/participant`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOUserDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add request participants
    #
    # + issueIdOrKey - The ID or key of the customer request to have participants added. 
    # + payload - Participant details 
    # + return - Returns the participants added to the customer request. 
    remote isolated function addRequestParticipants(string issueIdOrKey, RequestParticipantUpdateDTO payload) returns PagedDTOUserDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/participant`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PagedDTOUserDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get sla information
    #
    # + issueIdOrKey - The ID or key of the customer request whose SLAs will be retrieved. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of request types to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the SLA records on the customer request, on the specified page of the results. 
    remote isolated function getSlaInformation(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOSlaInformationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/sla`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOSlaInformationDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get sla information by id
    #
    # + issueIdOrKey - The ID or key of the customer request whose SLAs will be retrieved. 
    # + slaMetricId - The ID or key of the SLAs metric to be retrieved. 
    # + return - Returns the SLA record, on the specified page of the results. 
    remote isolated function getSlaInformationById(string issueIdOrKey, int slaMetricId) returns SlaInformationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/sla/${slaMetricId}`;
        SlaInformationDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get customer request status
    #
    # + issueIdOrKey - The ID or key of the customer request to be retrieved. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the customer request's status history, on the specified page of the results. 
    remote isolated function getCustomerRequestStatus(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOCustomerRequestStatusDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/status`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOCustomerRequestStatusDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get customer transitions
    #
    # + issueIdOrKey - The ID or key of the customer request whose transitions will be retrieved. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the transitions available to the user on the customer request. 
    remote isolated function getCustomerTransitions(string issueIdOrKey, int? 'start = (), int? 'limit = ()) returns PagedDTOCustomerTransitionDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/transition`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOCustomerTransitionDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Perform customer transition
    #
    # + issueIdOrKey - ID or key of the issue to transition 
    # + payload - Comment 
    # + return - Returned if the request is transitioned. 
    remote isolated function performCustomerTransition(string issueIdOrKey, CustomerTransitionExecutionDTO payload) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/request/${issueIdOrKey}/transition`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get feedback
    #
    # + requestIdOrKey - The id or the key of the request to post the feedback on 
    # + return - Returns the comment. 
    remote isolated function getFeedback(string requestIdOrKey) returns CSATFeedbackFullDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${requestIdOrKey}/feedback`;
        CSATFeedbackFullDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Post feedback
    #
    # + requestIdOrKey - The id or the key of the request to post the feedback on 
    # + payload - The feedback to be added on the request 
    # + return - Returns the comment. 
    remote isolated function postFeedback(string requestIdOrKey, CSATFeedbackFullDTO payload) returns CSATFeedbackFullDTO|error {
        string resourcePath = string `/rest/servicedeskapi/request/${requestIdOrKey}/feedback`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CSATFeedbackFullDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete feedback
    #
    # + requestIdOrKey - The id or the key of the request to post the feedback on 
    # + return - No content. 
    remote isolated function deleteFeedback(string requestIdOrKey) returns json|error {
        string resourcePath = string `/rest/servicedeskapi/request/${requestIdOrKey}/feedback`;
        json response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get all request types
    #
    # + searchQuery - String to be used to filter the results. 
    # + serviceDeskId - Filter the request types by service desk Ids provided. Multiple values of the query parameter are supported. For example, `serviceDeskId=1&serviceDeskId=2` will return request types only for service desks 1 and 2. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + expand - Expand 
    # + return - Returns the request types, on the specified page of the results. 
    remote isolated function getAllRequestTypes(string? searchQuery = (), int[]? serviceDeskId = (), int? 'start = (), int? 'limit = (), string[]? expand = ()) returns PagedDTORequestTypeDTO|error {
        string resourcePath = string `/rest/servicedeskapi/requesttype`;
        map<anydata> queryParam = {"searchQuery": searchQuery, "serviceDeskId": serviceDeskId, "start": 'start, "limit": 'limit, "expand": expand};
        map<Encoding> queryParamEncoding = {"serviceDeskId": {style: FORM, explode: true}, "expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PagedDTORequestTypeDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get service desks
    #
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the service desks, on the specified page of the results. 
    remote isolated function getServiceDesks(int? 'start = (), int? 'limit = ()) returns PagedDTOServiceDeskDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOServiceDeskDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get service desk by id
    #
    # + serviceDeskId - The ID of the service desk to return. This can alternatively be a [project identifier.](#project-identifiers) 
    # + return - Returns the requested service desk. 
    remote isolated function getServiceDeskById(string serviceDeskId) returns ServiceDeskDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}`;
        ServiceDeskDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Attach temporary file
    #
    # + serviceDeskId - The ID of the Service Desk to which the file will be attached. This can alternatively be a [project identifier.](#project-identifiers) 
    # + payload - The attachments in a RFC 1867 multipart/form-data format. 
    # + return - Returns if the file(s) were attached. 
    remote isolated function attachTemporaryFile(string serviceDeskId, byte[] payload) returns json|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/attachTemporaryFile`;
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get customers
    #
    # + serviceDeskId - The ID of the service desk the customer list should be returned from. This can alternatively be a [project identifier.](#project-identifiers) 
    # + query - The string used to filter the customer list. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of users to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the service desk's customer list. 
    remote isolated function getCustomers(string serviceDeskId, string? query = (), int? 'start = (), int? 'limit = ()) returns PagedDTOUserDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/customer`;
        map<anydata> queryParam = {"query": query, "start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOUserDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add customers
    #
    # + serviceDeskId - The ID of the service desk the customer list should be returned from. This can alternatively be a [project identifier.](#project-identifiers) 
    # + payload - Customer details 
    # + return - Returned if all the customers were added to the service desk or were already associated with the service desk. 
    remote isolated function addCustomers(string serviceDeskId, ServiceDeskCustomerDTO payload) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/customer`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get articles
    #
    # + serviceDeskId - Servicedesk Id 
    # + query - The string used to filter the articles (required). 
    # + highlight - If set to true matching query term in the title and excerpt will be highlighted using the \{@code 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the articles, on the specified page of the results. 
    remote isolated function getArticlesByServiceDeskId(string serviceDeskId, string? query = (), boolean highlight = false, int? 'start = (), int? 'limit = ()) returns PagedDTOArticleDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/knowledgebase/article`;
        map<anydata> queryParam = {"query": query, "highlight": highlight, "start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOArticleDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get organizations
    #
    # + serviceDeskId - The ID of the service desk from which the organization list will be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + return - Returns the requested organizations list. 
    remote isolated function getOrganizationsByServiceDeskId(string serviceDeskId, int? 'start = (), int? 'limit = (), string? accountId = ()) returns PagedDTOOrganizationDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/organization`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit, "accountId": accountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOOrganizationDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add organization
    #
    # + serviceDeskId - The ID of the service desk to which the organization will be added. This can alternatively be a [project identifier.](#project-identifiers) 
    # + payload - Organization details 
    # + return - Returned if the organization was added or the organization was already associated with the service desk. 
    remote isolated function addOrganization(string serviceDeskId, OrganizationServiceDeskUpdateDTO payload) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/organization`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get queues
    #
    # + serviceDeskId - ID of the service desk whose queues will be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + includeCount - Specifies whether to include each queue's customer request (issue) count in the response. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the queues of the service desk, on the specified page of the results. 
    remote isolated function getQueues(string serviceDeskId, boolean includeCount = false, int? 'start = (), int? 'limit = ()) returns PagedDTOQueueDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/queue`;
        map<anydata> queryParam = {"includeCount": includeCount, "start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOQueueDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get queue
    #
    # + serviceDeskId - ID of the service desk whose queues will be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + queueId - ID of the required queue. 
    # + includeCount - Specifies whether to include each queue's customer request (issue) count in the response. 
    # + return - Returns the specific queue of the service desk. 
    remote isolated function getQueue(string serviceDeskId, int queueId, boolean includeCount = false) returns QueueDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/queue/${queueId}`;
        map<anydata> queryParam = {"includeCount": includeCount};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        QueueDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get issues in queue
    #
    # + serviceDeskId - The ID of the service desk containing the queue to be queried. This can alternatively be a [project identifier.](#project-identifiers) 
    # + queueId - The ID of the queue whose customer requests will be returned. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 50. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the customer requests belonging to the queue, on the specified page of the results. 
    remote isolated function getIssuesInQueue(string serviceDeskId, int queueId, int? 'start = (), int? 'limit = ()) returns PagedDTOIssueBean|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/queue/${queueId}/issue`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTOIssueBean response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get request types
    #
    # + serviceDeskId - The ID of the service desk whose customer request types are to be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + groupId - Filters results to those in a customer request type group. 
    # + expand - Expand 
    # + searchQuery - The string to be used to filter the results. 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the requested customer request types, on the specified page of the results. 
    remote isolated function getRequestTypes(string serviceDeskId, int? groupId = (), string[]? expand = (), string? searchQuery = (), int? 'start = (), int? 'limit = ()) returns PagedDTORequestTypeDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype`;
        map<anydata> queryParam = {"groupId": groupId, "expand": expand, "searchQuery": searchQuery, "start": 'start, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PagedDTORequestTypeDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create request type
    #
    # + serviceDeskId - The ID of the service desk where the customer request type is to be created. This can alternatively be a [project identifier.](#project-identifiers) 
    # + payload - Request type details 
    # + return - Returns the customer request type created. 
    remote isolated function createRequestType(string serviceDeskId, RequestTypeCreateDTO payload) returns RequestTypeDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RequestTypeDTO response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get request type by id
    #
    # + serviceDeskId - The ID of the service desk whose customer request type is to be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + requestTypeId - The ID of the customer request type to be returned. 
    # + expand - Expand 
    # + return - Returns the customer request type item. 
    remote isolated function getRequestTypeById(string serviceDeskId, int requestTypeId, string[]? expand = ()) returns RequestTypeDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        RequestTypeDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete request type
    #
    # + serviceDeskId - The ID or [project identifier](#project-identifiers) of the service desk. 
    # + requestTypeId - The ID of the request type. 
    # + return - Returned if the request type is deleted. 
    remote isolated function deleteRequestType(string serviceDeskId, int requestTypeId) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get request type fields
    #
    # + serviceDeskId - The ID of the service desk containing the request types whose fields are to be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + requestTypeId - The ID of the request types whose fields are to be returned. 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts `hiddenFields` that returns hidden fields associated with the request type. 
    # + return - Returns the request type's fields and user permission details, on the specified page of the results. 
    remote isolated function getRequestTypeFields(string serviceDeskId, int requestTypeId, string[]? expand = ()) returns CustomerRequestCreateMetaDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}/field`;
        map<anydata> queryParam = {"expand": expand};
        map<Encoding> queryParamEncoding = {"expand": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CustomerRequestCreateMetaDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get properties keys
    #
    # + requestTypeId - The ID of the request type for which keys will be retrieved. 
    # + serviceDeskId - The ID of the service desk which contains the request type. This can alternatively be a [project identifier.](#project-identifiers) 
    # + return - Returned if the request type was found. 
    remote isolated function getPropertiesKeysByServiceDeskId(int requestTypeId, string serviceDeskId) returns PropertyKeys|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}/property`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get property
    #
    # + serviceDeskId - The ID of the service desk which contains the request type. This can alternatively be a [project identifier.](#project-identifiers) 
    # + requestTypeId - The ID of the request type from which the property will be retrieved. 
    # + propertyKey - The key of the property to return. 
    # + return - Returned if the request type property was returned. 
    remote isolated function getPropertyByServiceDeskId(string serviceDeskId, int requestTypeId, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}/property/${propertyKey}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set property
    #
    # + serviceDeskId - The ID of the service desk which contains the request type. This can alternatively be a [project identifier.](#project-identifiers) 
    # + requestTypeId - The ID of the request type on which the property will be set. 
    # + propertyKey - The key of the request type property. The maximum length of the key is 255 bytes. 
    # + return - Returned if the request type property is updated. 
    remote isolated function setPropertyByServiceDeskId(string serviceDeskId, int requestTypeId, string propertyKey) returns json|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}/property/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Delete property
    #
    # + serviceDeskId - The ID of the service desk which contains the request type. This can alternatively be a [project identifier.](#project-identifiers) 
    # + requestTypeId - The ID of the request type for which the property will be removed. 
    # + propertyKey - The key of the property to remove. 
    # + return - Returned if the request type property was removed. 
    remote isolated function deletePropertyByServiceDeskId(string serviceDeskId, int requestTypeId, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttype/${requestTypeId}/property/${propertyKey}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Get request type groups
    #
    # + serviceDeskId - The ID of the service desk whose customer request type groups are to be returned. This can alternatively be a [project identifier.](#project-identifiers) 
    # + 'start - The starting index of the returned objects. Base index: 0. See the [Pagination](#pagination) section for more details. 
    # + 'limit - The maximum number of items to return per page. Default: 100. See the [Pagination](#pagination) section for more details. 
    # + return - Returns the service desk's customer request type groups, on the specified page of the results. 
    remote isolated function getRequestTypeGroups(string serviceDeskId, int? 'start = (), int? 'limit = ()) returns PagedDTORequestTypeGroupDTO|error {
        string resourcePath = string `/rest/servicedeskapi/servicedesk/${serviceDeskId}/requesttypegroup`;
        map<anydata> queryParam = {"start": 'start, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PagedDTORequestTypeGroupDTO response = check self.clientEp->get(resourcePath);
        return response;
    }
}
