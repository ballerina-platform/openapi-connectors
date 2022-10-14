// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
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
    string refreshUrl = "https://auth.atlassian.com/oauth/token";
|};

# This is a generated connector for [Jira Cloud platform API](https://developer.atlassian.com/cloud/jira/platform/) OpenAPI specification. 
# Jira Cloud platform API provide capability to access Jira operations related to projects, issues and user related operations.
@display {label: "Jira", iconPath: "icon.png"}
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
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://your-domain.atlassian.net") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Create issue
    #
    # + updateHistory - Whether the project in which the issue is created is added to the user's **Recently viewed** project list, as shown under **Projects** in Jira. When provided, the issue type and request type are added to the user's history for a project. These values are then used to provide defaults on the issue create screen. 
    # + payload - The request payload to create issue. 
    # + return - Returned if the request is successful. 
    remote isolated function createIssue(IssueUpdateDetails payload, boolean updateHistory = false) returns CreatedIssue|error {
        string resourcePath = string `/rest/api/2/issue`;
        map<anydata> queryParam = {"updateHistory": updateHistory};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedIssue response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Bulk create issue
    #
    # + payload - The request payload to bulk create issue. 
    # + return - Returned if any of the issue or subtask creation requests were successful. A request may be unsuccessful when it:  *  is missing required fields.  *  contains invalid field values.  *  contains fields that cannot be set for the issue type.  *  is by a user who does not have the necessary permission.  *  is to create a subtype in a project different that of the parent issue.  *  is for a subtask when the option to create subtasks is disabled.  *  is invalid for any other reason. 
    remote isolated function createIssues(IssuesUpdateBean payload) returns CreatedIssues|error {
        string resourcePath = string `/rest/api/2/issue/bulk`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreatedIssues response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get create issue metadata
    #
    # + projectIds - List of project IDs. This parameter accepts a comma-separated list. Multiple project IDs can also be provided using an ampersand-separated list. For example, `projectIds=10000,10001&projectIds=10020,10021`. This parameter may be provided with `projectKeys`. 
    # + projectKeys - List of project keys. This parameter accepts a comma-separated list. Multiple project keys can also be provided using an ampersand-separated list. For example, `projectKeys=proj1,proj2&projectKeys=proj3`. This parameter may be provided with `projectIds`. 
    # + issuetypeIds - List of issue type IDs. This parameter accepts a comma-separated list. Multiple issue type IDs can also be provided using an ampersand-separated list. For example, `issuetypeIds=10000,10001&issuetypeIds=10020,10021`. This parameter may be provided with `issuetypeNames`. 
    # + issuetypeNames - List of issue type names. This parameter accepts a comma-separated list. Multiple issue type names can also be provided using an ampersand-separated list. For example, `issuetypeNames=name1,name2&issuetypeNames=name3`. This parameter may be provided with `issuetypeIds`. 
    # + expand - Use [expand](#expansion) to include additional information about issue metadata in the response. This parameter accepts `projects.issuetypes.fields`, which returns information about the fields in the issue creation screen for each issue type. Fields hidden from the screen are not returned. Use the information to populate the `fields` and `update` fields in [Create issue](#api-rest-api-2-issue-post) and [Create issues](#api-rest-api-2-issue-bulk-post). 
    # + return - Returned if the request is successful. 
    remote isolated function getCreateIssueMeta(string[]? projectIds = (), string[]? projectKeys = (), string[]? issuetypeIds = (), string[]? issuetypeNames = (), string? expand = ()) returns IssueCreateMetadata|error {
        string resourcePath = string `/rest/api/2/issue/createmeta`;
        map<anydata> queryParam = {"projectIds": projectIds, "projectKeys": projectKeys, "issuetypeIds": issuetypeIds, "issuetypeNames": issuetypeNames, "expand": expand};
        map<Encoding> queryParamEncoding = {"projectIds": {style: FORM, explode: true}, "projectKeys": {style: FORM, explode: true}, "issuetypeIds": {style: FORM, explode: true}, "issuetypeNames": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        IssueCreateMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get issue
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + fields - A list of fields to return for the issue. This parameter accepts a comma-separated list. Use it to retrieve a subset of fields. Allowed values:  *  `*all` Returns all fields.  *  `*navigable` Returns navigable fields.  *  Any issue field, prefixed with a minus to exclude. Examples:  *  `summary,comment` Returns only the summary and comments fields.  *  `-description` Returns all (default) fields except description.  *  `*navigable,-comment` Returns all navigable fields except comment. This parameter may be specified multiple times. For example, `fields=field1,field2& fields=field3`. Note: All fields are returned by default. This differs from [Search for issues using JQL (GET)](#api-rest-api-2-search-get) and [Search for issues using JQL (POST)](#api-rest-api-2-search-post) where the default is all navigable fields. 
    # + fieldsByKeys - Whether fields in `fields` are referenced by keys rather than IDs. This parameter is useful where fields have been added by a connect app and a field's key may differ from its ID. 
    # + expand - Use [expand](#expansion) to include additional information about the issues in the response. This parameter accepts a comma-separated list. Expand options include:  *  `renderedFields` Returns field values rendered in HTML format.  *  `names` Returns the display name of each field.  *  `schema` Returns the schema describing a field type.  *  `transitions` Returns all possible transitions for the issue.  *  `editmeta` Returns information about how each field can be edited.  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.  *  `versionedRepresentations` Returns a JSON array for each version of a field's value, with the highest number representing the most recent version. Note: When included in the request, the `fields` parameter is ignored. 
    # + properties - A list of issue properties to return for the issue. This parameter accepts a comma-separated list. Allowed values:  *  `*all` Returns all issue properties.  *  Any issue property key, prefixed with a minus to exclude. Examples:  *  `*all` Returns all properties.  *  `*all,-prop1` Returns all properties except `prop1`.  *  `prop1,prop2` Returns `prop1` and `prop2` properties. This parameter may be specified multiple times. For example, `properties=prop1,prop2& properties=prop3`. 
    # + updateHistory - Whether the project in which the issue is created is added to the user's **Recently viewed** project list, as shown under **Projects** in Jira. This also populates the [JQL issues search](#api-rest-api-2-search-get) `lastViewed` field. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssue(string issueIdOrKey, string[]? fields = (), boolean fieldsByKeys = false, string? expand = (), string[]? properties = (), boolean updateHistory = false) returns IssueBean|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}`;
        map<anydata> queryParam = {"fields": fields, "fieldsByKeys": fieldsByKeys, "expand": expand, "properties": properties, "updateHistory": updateHistory};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: true}, "properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        IssueBean response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Edit issue
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + notifyUsers - Whether a notification email about the issue update is sent to all watchers. To disable the notification, administer Jira or administer project permissions are required. If the user doesn't have the necessary permission the request is ignored. 
    # + overrideScreenSecurity - Whether screen security should be overridden to enable hidden fields to be edited. Available to Connect app users with admin permissions. 
    # + overrideEditableFlag - Whether screen security should be overridden to enable uneditable fields to be edited. Available to Connect app users with admin permissions. 
    # + payload - The request payload to edit issue. 
    # + return - Returned if the request is successful. 
    remote isolated function editIssue(string issueIdOrKey, IssueUpdateDetails payload, boolean notifyUsers = true, boolean overrideScreenSecurity = false, boolean overrideEditableFlag = false) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "overrideScreenSecurity": overrideScreenSecurity, "overrideEditableFlag": overrideEditableFlag};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + deleteSubtasks - Whether the issue's subtasks are deleted when the issue is deleted. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteIssue(string issueIdOrKey, string deleteSubtasks = "false") returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}`;
        map<anydata> queryParam = {"deleteSubtasks": deleteSubtasks};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Assign issue
    #
    # + issueIdOrKey - The ID or key of the issue to be assigned. 
    # + payload - The request object with the user that the issue is assigned to. 
    # + return - Returned if the request is successful. 
    remote isolated function assignIssue(string issueIdOrKey, User payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/assignee`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get change logs
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getChangeLogs(string issueIdOrKey, int startAt = 0, int maxResults = 100) returns PageBeanChangelog|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/changelog`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanChangelog response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get changelogs by IDs
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + payload - The request payload to get changelogs by IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getChangeLogsByIds(string issueIdOrKey, IssueChangelogIds payload) returns PageOfChangelogs|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/changelog/list`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PageOfChangelogs response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get edit issue metadata
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + overrideScreenSecurity - Whether hidden fields should be returned. Available to connect app users with admin permissions. 
    # + overrideEditableFlag - Whether non-editable fields should be returned. Available to connect app users with admin permissions. 
    # + return - Returned if the request is successful. 
    remote isolated function getEditIssueMeta(string issueIdOrKey, boolean overrideScreenSecurity = false, boolean overrideEditableFlag = false) returns IssueUpdateMetadata|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/editmeta`;
        map<anydata> queryParam = {"overrideScreenSecurity": overrideScreenSecurity, "overrideEditableFlag": overrideEditableFlag};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssueUpdateMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Send notification for issue
    #
    # + issueIdOrKey - ID or key of the issue that the notification is sent for. 
    # + payload - The request object for the notification and recipients. 
    # + return - Returned if the email is queued for sending. 
    remote isolated function notify(string issueIdOrKey, Notification payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/notify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get transitions
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + expand - Use [expand](#expansion) to include additional information about transitions in the response. This parameter accepts `transitions.fields`, which returns information about the fields in the transition screen for each transition. Fields hidden from the screen are not returned. Use this information to populate the `fields` and `update` fields in [Transition issue](#api-rest-api-2-issue-issueIdOrKey-transitions-post). 
    # + transitionId - The ID of the transition. 
    # + skipRemoteOnlyCondition - Whether transitions with the condition *Hide From User Condition* are included in the response. 
    # + includeUnavailableTransitions - Whether details of transitions that fail a condition are included in the response 
    # + sortByOpsBarAndStatus - Whether the transitions are sorted by ops-bar sequence value first then category order (Todo, In Progress, Done) or only by ops-bar sequence value. 
    # + return - Returned if the request is successful. 
    remote isolated function getTransitions(string issueIdOrKey, string? expand = (), string? transitionId = (), boolean skipRemoteOnlyCondition = false, boolean includeUnavailableTransitions = false, boolean sortByOpsBarAndStatus = false) returns Transitions|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/transitions`;
        map<anydata> queryParam = {"expand": expand, "transitionId": transitionId, "skipRemoteOnlyCondition": skipRemoteOnlyCondition, "includeUnavailableTransitions": includeUnavailableTransitions, "sortByOpsBarAndStatus": sortByOpsBarAndStatus};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Transitions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Transition issue
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + payload - The request payload to update the fields from the transition screen. 
    # + return - Returned if the request is successful. 
    remote isolated function doTransition(string issueIdOrKey, IssueUpdateDetails payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/transitions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Bulk set issues properties
    #
    # + payload - Issue properties to be set or updated with values. 
    # + return - Returned if the operation is successful. 
    remote isolated function bulkSetIssuesProperties(IssueEntityProperties payload) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/properties`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Bulk set issue property
    #
    # + propertyKey - The key of the property. The maximum length is 255 characters. 
    # + payload - The request payload to bulk set issue property. 
    # + return - Returned if the request is successful. 
    remote isolated function bulkSetIssueProperty(string propertyKey, BulkIssuePropertyUpdateRequest payload) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Bulk delete issue property
    #
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function bulkDeleteIssueProperty(string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get issue property keys
    #
    # + issueIdOrKey - The key or ID of the issue. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssuePropertyKeys(string issueIdOrKey) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/properties`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get issue property
    #
    # + issueIdOrKey - The key or ID of the issue. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueProperty(string issueIdOrKey, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set issue property
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + propertyKey - The key of the issue property. The maximum length is 255 characters. 
    # + payload - The request payload to set issue property. 
    # + return - Returned if the issue property is updated. 
    remote isolated function setIssueProperty(string issueIdOrKey, string propertyKey, json payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue property
    #
    # + issueIdOrKey - The key or ID of the issue. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteIssueProperty(string issueIdOrKey, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Jira attachment settings
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAttachmentMeta() returns AttachmentSettings|error {
        string resourcePath = string `/rest/api/2/attachment/meta`;
        AttachmentSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get attachment metadata
    #
    # + id - The ID of the attachment. 
    # + return - Returned if the request is successful. 
    remote isolated function getAttachment(string id) returns AttachmentMetadata|error {
        string resourcePath = string `/rest/api/2/attachment/${getEncodedUri(id)}`;
        AttachmentMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete attachment
    #
    # + id - The ID of the attachment. 
    # + return - Returned if the request is successful. 
    remote isolated function removeAttachment(string id) returns http:Response|error {
        string resourcePath = string `/rest/api/2/attachment/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all metadata for an expanded attachment
    #
    # + id - The ID of the attachment. 
    # + return - Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive. 
    remote isolated function expandAttachmentForHumans(string id) returns AttachmentArchiveMetadataReadable|error {
        string resourcePath = string `/rest/api/2/attachment/${getEncodedUri(id)}/expand/human`;
        AttachmentArchiveMetadataReadable response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get contents metadata for an expanded attachment
    #
    # + id - The ID of the attachment. 
    # + return - Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive. 
    remote isolated function expandAttachmentForMachines(string id) returns AttachmentArchiveImpl|error {
        string resourcePath = string `/rest/api/2/attachment/${getEncodedUri(id)}/expand/raw`;
        AttachmentArchiveImpl response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all field configurations
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + id - The list of field configuration IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. 
    # + isDefault - If *true* returns default field configurations only. 
    # + query - The query string used to match against field configuration names and descriptions. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllFieldConfigurations(int startAt = 0, int maxResults = 50, int[]? id = (), boolean isDefault = false, string query = "") returns PageBeanFieldConfiguration|error {
        string resourcePath = string `/rest/api/2/fieldconfiguration`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "id": id, "isDefault": isDefault, "query": query};
        map<Encoding> queryParamEncoding = {"id": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanFieldConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get field configuration items
    #
    # + id - The ID of the field configuration. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getFieldConfigurationItems(int id, int startAt = 0, int maxResults = 50) returns PageBeanFieldConfigurationItem|error {
        string resourcePath = string `/rest/api/2/fieldconfiguration/${getEncodedUri(id)}/fields`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanFieldConfigurationItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all field configuration schemes
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + id - The list of field configuration scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllFieldConfigurationSchemes(int startAt = 0, int maxResults = 50, int[]? id = ()) returns PageBeanFieldConfigurationScheme|error {
        string resourcePath = string `/rest/api/2/fieldconfigurationscheme`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "id": id};
        map<Encoding> queryParamEncoding = {"id": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanFieldConfigurationScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get field configuration issue type items
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + fieldConfigurationSchemeId - The list of field configuration scheme IDs. To include multiple field configuration schemes separate IDs with ampersand: `fieldConfigurationSchemeId=10000&fieldConfigurationSchemeId=10001`. 
    # + return - Returned if the request is successful. 
    remote isolated function getFieldConfigurationSchemeMappings(int startAt = 0, int maxResults = 50, int[]? fieldConfigurationSchemeId = ()) returns PageBeanFieldConfigurationIssueTypeItem|error {
        string resourcePath = string `/rest/api/2/fieldconfigurationscheme/mapping`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "fieldConfigurationSchemeId": fieldConfigurationSchemeId};
        map<Encoding> queryParamEncoding = {"fieldConfigurationSchemeId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanFieldConfigurationIssueTypeItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get field configuration schemes for projects
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + projectId - The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`. 
    # + return - Returned if the request is successful. 
    remote isolated function getFieldConfigurationSchemeProjectMapping(int[] projectId, int startAt = 0, int maxResults = 50) returns PageBeanFieldConfigurationSchemeProjects|error {
        string resourcePath = string `/rest/api/2/fieldconfigurationscheme/project`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "projectId": projectId};
        map<Encoding> queryParamEncoding = {"projectId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanFieldConfigurationSchemeProjects response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assign field configuration scheme to project
    #
    # + payload - The request payload to assign field configuration scheme to project. 
    # + return - Returned if the request is successful. 
    remote isolated function assignFieldConfigurationSchemeToProject(FieldConfigurationSchemeProjectAssociation payload) returns json|error {
        string resourcePath = string `/rest/api/2/fieldconfigurationscheme/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get custom field contexts
    #
    # + fieldId - The ID of the custom field. 
    # + isAnyIssueType - Whether to return contexts that apply to all issue types. 
    # + isGlobalContext - Whether to return contexts that apply to all projects. 
    # + contextId - The list of context IDs. To include multiple contexts, separate IDs with ampersand: `contextId=10000&contextId=10001`. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getContextsForField(string fieldId, boolean? isAnyIssueType = (), boolean? isGlobalContext = (), int[]? contextId = (), int startAt = 0, int maxResults = 50) returns PageBeanCustomFieldContext|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context`;
        map<anydata> queryParam = {"isAnyIssueType": isAnyIssueType, "isGlobalContext": isGlobalContext, "contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        map<Encoding> queryParamEncoding = {"contextId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanCustomFieldContext response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create custom field context
    #
    # + fieldId - The ID of the custom field. 
    # + payload - The request payload to create a custom field context. 
    # + return - Returned if the custom field context is created. 
    remote isolated function createCustomFieldContext(string fieldId, CreateCustomFieldContext payload) returns CreateCustomFieldContext|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCustomFieldContext response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get custom field contexts default values
    #
    # + fieldId - The ID of the custom field, for example `customfield\_10000`. 
    # + contextId - The IDs of the contexts. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getDefaultValues(string fieldId, int[]? contextId = (), int startAt = 0, int maxResults = 50) returns PageBeanCustomFieldContextDefaultValue|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/defaultValue`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        map<Encoding> queryParamEncoding = {"contextId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanCustomFieldContextDefaultValue response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set custom field contexts default values
    #
    # + fieldId - The ID of the custom field. 
    # + payload - The request payload to set default for contexts of a custom field. 
    # + return - Returned if operation is successful. 
    remote isolated function setDefaultValues(string fieldId, CustomFieldContextDefaultValueUpdate payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/defaultValue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get issue types for custom field context
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. To include multiple contexts, provide an ampersand-separated list. For example, `contextId=10001&contextId=10002`. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if operation is successful. 
    remote isolated function getIssueTypeMappingsForContexts(string fieldId, int[]? contextId = (), int startAt = 0, int maxResults = 50) returns PageBeanIssueTypeToContextMapping|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/issuetypemapping`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        map<Encoding> queryParamEncoding = {"contextId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanIssueTypeToContextMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get custom field contexts for projects and issue types
    #
    # + fieldId - The ID of the custom field. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + payload - The list of project and issue type mappings. 
    # + return - Returned if the request is successful. 
    remote isolated function getCustomFieldContextsForProjectsAndIssueTypes(string fieldId, ProjectIssueTypeMappings payload, int startAt = 0, int maxResults = 50) returns PageBeanContextForProjectAndIssueType|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/mapping`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PageBeanContextForProjectAndIssueType response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get project mappings for custom field context
    #
    # + fieldId - The ID of the custom field, for example `customfield\_10000`. 
    # + contextId - The list of context IDs. To include multiple context, separate IDs with ampersand: `contextId=10000&contextId=10001`. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectContextMapping(string fieldId, int[]? contextId = (), int startAt = 0, int maxResults = 50) returns PageBeanCustomFieldContextProjectMapping|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/projectmapping`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        map<Encoding> queryParamEncoding = {"contextId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanCustomFieldContextProjectMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update custom field context
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to update a custom field context. 
    # + return - Returned if the context is updated. 
    remote isolated function updateCustomFieldContext(string fieldId, int contextId, CustomFieldContextUpdateDetails payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete custom field context
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + return - Returned if the context is deleted. 
    remote isolated function deleteCustomFieldContext(string fieldId, int contextId) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Add issue types to context
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to add issue types to a custom field context. 
    # + return - Returned if operation is successful. 
    remote isolated function addIssueTypesToContext(string fieldId, int contextId, IssueTypeIds payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/issuetype`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove issue types from context
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to remove issue types from a custom field context. 
    # + return - Returned if operation is successful. 
    remote isolated function removeIssueTypesFromContext(string fieldId, int contextId, IssueTypeIds payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/issuetype/remove`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Assign custom field context to projects
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to assign custom field context to projects. 
    # + return - Returned if operation is successful. 
    remote isolated function assignProjectsToCustomFieldContext(string fieldId, int contextId, ProjectIds payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Remove custom field context from projects
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to remove custom field context from projects. 
    # + return - Returned if the custom field context is removed from the projects. 
    remote isolated function removeCustomFieldContextFromProjects(string fieldId, int contextId, ProjectIds payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/project/remove`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get custom field option
    #
    # + id - The ID of the custom field option. 
    # + return - Returned if the request is successful. 
    remote isolated function getCustomFieldOption(string id) returns CustomFieldOption|error {
        string resourcePath = string `/rest/api/2/customFieldOption/${getEncodedUri(id)}`;
        CustomFieldOption response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get custom field options (context)
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + optionId - The ID of the option. 
    # + onlyOptions - Whether only options are returned. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getOptionsForContext(string fieldId, int contextId, int? optionId = (), boolean onlyOptions = false, int startAt = 0, int maxResults = 100) returns PageBeanCustomFieldContextOption|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/option`;
        map<anydata> queryParam = {"optionId": optionId, "onlyOptions": onlyOptions, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanCustomFieldContextOption response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update custom field options (context)
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to update issue types to a custom field context. 
    # + return - Returned if the request is successful. 
    remote isolated function updateCustomFieldOption(string fieldId, int contextId, BulkCustomFieldOptionUpdateRequest payload) returns CustomFieldUpdatedContextOptionsList|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/option`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldUpdatedContextOptionsList response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create custom field options (context)
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payolad to create custom field options (context). 
    # + return - Returned if the request is successful. 
    remote isolated function createCustomFieldOption(string fieldId, int contextId, BulkCustomFieldOptionCreateRequest payload) returns CustomFieldCreatedContextOptionsList|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/option`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CustomFieldCreatedContextOptionsList response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reorder custom field options (context)
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context. 
    # + payload - The request payload to reorder custom field options (context). 
    # + return - Returned if options are reordered. 
    remote isolated function reorderCustomFieldOptions(string fieldId, int contextId, OrderOfCustomFieldOptions payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/option/move`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete custom field options (context)
    #
    # + fieldId - The ID of the custom field. 
    # + contextId - The ID of the context from which an option should be deleted. 
    # + optionId - The ID of the option to delete. 
    # + return - Returned if the option is deleted. 
    remote isolated function deleteCustomFieldOption(string fieldId, int contextId, int optionId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}/context/${getEncodedUri(contextId)}/option/${getEncodedUri(optionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get issue link types
    #
    # + return - Returned if the request is successful. 
    remote isolated function getIssueLinkTypes() returns IssueLinkTypes|error {
        string resourcePath = string `/rest/api/2/issueLinkType`;
        IssueLinkTypes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create issue link type
    #
    # + payload - The request payload to create issue link type. 
    # + return - Returned if the request is successful. 
    remote isolated function createIssueLinkType(IssueLinkType payload) returns IssueLinkType|error {
        string resourcePath = string `/rest/api/2/issueLinkType`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueLinkType response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueLinkType(string issueLinkTypeId) returns IssueLinkType|error {
        string resourcePath = string `/rest/api/2/issueLinkType/${getEncodedUri(issueLinkTypeId)}`;
        IssueLinkType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type. 
    # + payload - The request payload to update issue link type. 
    # + return - Returned if the request is successful. 
    remote isolated function updateIssueLinkType(string issueLinkTypeId, IssueLinkType payload) returns IssueLinkType|error {
        string resourcePath = string `/rest/api/2/issueLinkType/${getEncodedUri(issueLinkTypeId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueLinkType response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteIssueLinkType(string issueLinkTypeId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issueLinkType/${getEncodedUri(issueLinkTypeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get issue navigator default columns
    #
    # + return - Returned if the request is successful. 
    remote isolated function getIssueNavigatorDefaultColumns() returns ColumnItem[]|error {
        string resourcePath = string `/rest/api/2/settings/columns`;
        ColumnItem[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set issue navigator default columns
    #
    # + payload - A navigable field value. 
    # + return - Returned if the request is successful. 
    remote isolated function setIssueNavigatorDefaultColumns(byte[] payload) returns json|error {
        string resourcePath = string `/rest/api/2/settings/columns`;
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get remote issue links
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + globalId - The global ID of the remote issue link. 
    # + return - Returned if the request is successful. 
    remote isolated function getRemoteIssueLinks(string issueIdOrKey, string? globalId = ()) returns RemoteIssueLink|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink`;
        map<anydata> queryParam = {"globalId": globalId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RemoteIssueLink response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create or update remote issue link
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + payload - The request payload to create or update remote issue link. 
    # + return - Returned if the remote issue link is updated. 
    remote isolated function createOrUpdateRemoteIssueLink(string issueIdOrKey, RemoteIssueLinkRequest payload) returns RemoteIssueLinkIdentifies|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteIssueLinkIdentifies response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete remote issue link by global ID
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + globalId - The global ID of a remote issue link. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteRemoteIssueLinkByGlobalId(string issueIdOrKey, string globalId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink`;
        map<anydata> queryParam = {"globalId": globalId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + linkId - The ID of the remote issue link. 
    # + return - Returned if the request is successful. 
    remote isolated function getRemoteIssueLinkById(string issueIdOrKey, string linkId) returns RemoteIssueLink|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink/${getEncodedUri(linkId)}`;
        RemoteIssueLink response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + linkId - The ID of the remote issue link. 
    # + payload - The request payload to update remote issue link by ID. 
    # + return - Returned if the request is successful. 
    remote isolated function updateRemoteIssueLink(string issueIdOrKey, string linkId, RemoteIssueLinkRequest payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink/${getEncodedUri(linkId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + linkId - The ID of a remote issue link. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteRemoteIssueLinkById(string issueIdOrKey, string linkId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/remotelink/${getEncodedUri(linkId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get resolutions
    #
    # + return - Returned if the request is successful. 
    remote isolated function getResolutions() returns Resolution[]|error {
        string resourcePath = string `/rest/api/2/resolution`;
        Resolution[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get resolution
    #
    # + id - The ID of the issue resolution value. 
    # + return - Returned if the request is successful. 
    remote isolated function getResolution(string id) returns Resolution|error {
        string resourcePath = string `/rest/api/2/resolution/${getEncodedUri(id)}`;
        Resolution response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all issue types for user
    #
    # + return - Returned if the request is successful. 
    remote isolated function getIssueAllTypes() returns IssueTypeDetails[]|error {
        string resourcePath = string `/rest/api/2/issuetype`;
        IssueTypeDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create issue type
    #
    # + payload - The request payload to create issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function createIssueType(IssueTypeCreateBean payload) returns IssueTypeDetails|error {
        string resourcePath = string `/rest/api/2/issuetype`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueTypeDetails response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get issue types for project
    #
    # + projectId - The ID of the project. 
    # + level - The level of the issue type to filter by. Use:  *  `-1` for Subtask.  *  `0` for Base.  *  `1` for Epic. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueTypesForProject(int projectId, int? level = ()) returns IssueTypeDetails[]|error {
        string resourcePath = string `/rest/api/2/issuetype/project`;
        map<anydata> queryParam = {"projectId": projectId, "level": level};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssueTypeDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get issue type
    #
    # + id - The ID of the issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueType(string id) returns IssueTypeDetails|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(id)}`;
        IssueTypeDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update issue type
    #
    # + id - The ID of the issue type. 
    # + payload - The request payload to update issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function updateIssueType(string id, IssueTypeUpdateBean payload) returns IssueTypeDetails|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueTypeDetails response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue type
    #
    # + id - The ID of the issue type. 
    # + alternativeIssueTypeId - The ID of the replacement issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteIssueType(string id, string? alternativeIssueTypeId = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"alternativeIssueTypeId": alternativeIssueTypeId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get alternative issue types
    #
    # + id - The ID of the issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function getAlternativeIssueTypes(string id) returns IssueTypeDetails[]|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(id)}/alternatives`;
        IssueTypeDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Load issue type avatar
    #
    # + id - The ID of the issue type. 
    # + x - The X coordinate of the top-left corner of the crop region. 
    # + y - The Y coordinate of the top-left corner of the crop region. 
    # + size - The length of each side of the crop region. 
    # + payload - The request payload to load issue type avatar. 
    # + return - Returned if the request is successful. 
    remote isolated function createIssueTypeAvatar(string id, int size, byte[] payload, int x = 0, int y = 0) returns Avatar|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(id)}/avatar2`;
        map<anydata> queryParam = {"x": x, "y": y, "size": size};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        request.setPayload(payload, "*/*");
        Avatar response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get issue type property keys
    #
    # + issueTypeId - The ID of the issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueTypePropertyKeys(string issueTypeId) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(issueTypeId)}/properties`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get issue type property
    #
    # + issueTypeId - The ID of the issue type. 
    # + propertyKey - The key of the property. Use [Get issue type property keys](#api-rest-api-2-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueTypeProperty(string issueTypeId, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(issueTypeId)}/properties/${getEncodedUri(propertyKey)}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set issue type property
    #
    # + issueTypeId - The ID of the issue type. 
    # + propertyKey - The key of the issue type property. The maximum length is 255 characters. 
    # + payload - The request payload to set issue type property. 
    # + return - Returned if the issue type property is updated. 
    remote isolated function setIssueTypeProperty(string issueTypeId, string propertyKey, json payload) returns json|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(issueTypeId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue type property
    #
    # + issueTypeId - The ID of the issue type. 
    # + propertyKey - The key of the property. Use [Get issue type property keys](#api-rest-api-2-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys. 
    # + return - Returned if the issue type property is deleted. 
    remote isolated function deleteIssueTypeProperty(string issueTypeId, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issuetype/${getEncodedUri(issueTypeId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get field reference data (GET)
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAutoComplete() returns JQLReferenceData|error {
        string resourcePath = string `/rest/api/2/jql/autocompletedata`;
        JQLReferenceData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get field reference data (POST)
    #
    # + payload - The request payload to get field reference data. 
    # + return - Returned if the request is successful. 
    remote isolated function getAutoCompletePost(SearchAutoCompleteFilter payload) returns JQLReferenceData|error {
        string resourcePath = string `/rest/api/2/jql/autocompletedata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        JQLReferenceData response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get field auto complete suggestions
    #
    # + fieldName - The name of the field. 
    # + fieldValue - The partial field item name entered by the user. 
    # + predicateName - The name of the [ CHANGED operator predicate](https://confluence.atlassian.com/x/hQORLQ#Advancedsearching-operatorsreference-CHANGEDCHANGED) for which the suggestions are generated. The valid predicate operators are *by*, *from*, and *to*. 
    # + predicateValue - The partial predicate item name entered by the user. 
    # + return - Returned if the request is successful. 
    remote isolated function getFieldAutoCompleteForQueryString(string? fieldName = (), string? fieldValue = (), string? predicateName = (), string? predicateValue = ()) returns AutoCompleteSuggestions|error {
        string resourcePath = string `/rest/api/2/jql/autocompletedata/suggestions`;
        map<anydata> queryParam = {"fieldName": fieldName, "fieldValue": fieldValue, "predicateName": predicateName, "predicateValue": predicateValue};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AutoCompleteSuggestions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Parse JQL query
    #
    # + validation - How to validate the JQL query and treat the validation results. Validation options include:  *  `strict` Returns all errors. If validation fails, the query structure is not returned.  *  `warn` Returns all errors. If validation fails but the JQL query is correctly formed, the query structure is returned.  *  `none` No validation is performed. If JQL query is correctly formed, the query structure is returned. 
    # + payload - The request payload to parse JQL query. 
    # + return - Returned if the request is successful. 
    remote isolated function parseJqlQueries(JqlQueriesToParse payload, string validation = "strict") returns ParsedJqlQueries|error {
        string resourcePath = string `/rest/api/2/jql/parse`;
        map<anydata> queryParam = {"validation": validation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ParsedJqlQueries response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Convert user identifiers to account IDs in JQL queries
    #
    # + payload - The request payload to convert user identifiers to account IDs in JQL queries. 
    # + return - Returned if the request is successful. Note that the JQL queries are returned in the same order that they were passed. 
    remote isolated function migrateQueries(JQLPersonalDataMigrationRequest payload) returns ConvertedJQLQueries|error {
        string resourcePath = string `/rest/api/2/jql/pdcleaner`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConvertedJQLQueries response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get all projects
    #
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:  *  `description` Returns the project description.  *  `issueTypes` Returns all issue types associated with the project.  *  `lead` Returns information about the project lead.  *  `projectKeys` Returns all project keys associated with the project. 
    # + recent - Returns the user's most recently accessed projects. You may specify the number of results to return up to a maximum of 20. If access is anonymous, then the recently accessed projects are based on the current HTTP session. 
    # + properties - A list of project properties to return for the project. This parameter accepts a comma-separated list. 
    # + return - Returned if the request is successful. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getAllProjects(string? expand = (), int? recent = (), string[]? properties = ()) returns Project[]|error {
        string resourcePath = string `/rest/api/2/project`;
        map<anydata> queryParam = {"expand": expand, "recent": recent, "properties": properties};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Project[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create project
    #
    # + payload - The JSON representation of the project being created. 
    # + return - Returned if the project is created. 
    remote isolated function createProject(CreateProjectDetails payload) returns ProjectIdentifiers|error {
        string resourcePath = string `/rest/api/2/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectIdentifiers response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get projects paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + orderBy - [Order](#ordering) the results by a field.  *  `category` Sorts by project category. A complete list of category IDs is found using [Get all project categories](#api-rest-api-2-projectCategory-get).  *  `issueCount` Sorts by the total number of issues in each project.  *  `key` Sorts by project key.  *  `lastIssueUpdatedTime` Sorts by the last issue update time.  *  `name` Sorts by project name.  *  `owner` Sorts by project lead.  *  `archivedDate` EXPERIMENTAL. Sorts by project archived date.  *  `deletedDate` EXPERIMENTAL. Sorts by project deleted date. 
    # + id - The project IDs to filter the results by. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Up to 50 project IDs can be provided. 
    # + query - Filter the results using a literal string. Projects with a matching `key` or `name` are returned (case insensitive). 
    # + typeKey - Orders results by the [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes). This parameter accepts a comma-separated list. Valid values are `business`, `service_desk`, and `software`. 
    # + categoryId - The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-2-projectCategory-get) operation. 
    # + action - Filter results by projects for which the user can:  *  `view` the project, meaning that they have one of the following permissions:      *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  `browse` the project, meaning that they have the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  `edit` the project, meaning that they have one of the following permissions:      *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:  *  `description` Returns the project description.  *  `projectKeys` Returns all project keys associated with a project.  *  `lead` Returns information about the project lead.  *  `issueTypes` Returns all issue types associated with the project.  *  `url` Returns the URL associated with the project.  *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project. 
    # + status - EXPERIMENTAL. Filter results by project status:  *  `live` Search live projects.  *  `archived` Search archived projects.  *  `deleted` Search deleted projects, those in the recycle bin. 
    # + properties - EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list. 
    # + propertyQuery - EXPERIMENTAL. A query string used to search properties. The query string cannot be specified using a JSON object. For example, to search for the value of `nested` from `{"something":{"nested":1,"other":2}}` use `[thepropertykey].something.nested=1`. Note that the propertyQuery key is enclosed in square brackets to enable searching where the propertyQuery key includes dot (.) or equals (=) characters. 
    # + return - Returned if the request is successful. 
    remote isolated function searchProjects(int startAt = 0, int maxResults = 50, string orderBy = "key", int[]? id = (), string? query = (), string? typeKey = (), int? categoryId = (), string action = "view", string? expand = (), string[]? status = (), StringList[]? properties = (), string? propertyQuery = ()) returns PageBeanProject|error {
        string resourcePath = string `/rest/api/2/project/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "id": id, "query": query, "typeKey": typeKey, "categoryId": categoryId, "action": action, "expand": expand, "status": status, "properties": properties, "propertyQuery": propertyQuery};
        map<Encoding> queryParamEncoding = {"id": {style: FORM, explode: true}, "status": {style: FORM, explode: true}, "properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanProject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:  *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project.  *  `issueTypeHierarchy` The project issue type hierarchy. 
    # + properties - A list of project properties to return for the project. This parameter accepts a comma-separated list. 
    # + return - Returned if successful. 
    remote isolated function getProject(string projectIdOrKey, string? expand = (), string[]? properties = ()) returns Project|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}`;
        map<anydata> queryParam = {"expand": expand, "properties": properties};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:  *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project. 
    # + payload - The project details to be updated. 
    # + return - Returned if the project is updated. 
    remote isolated function updateProject(string projectIdOrKey, UpdateProjectDetails payload, string? expand = ()) returns Project|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + enableUndo - Whether this project is placed in the Jira recycle bin where it will be available for restoration. 
    # + return - Returned if the project is deleted. 
    remote isolated function deleteProject(string projectIdOrKey, boolean enableUndo = false) returns http:Response|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}`;
        map<anydata> queryParam = {"enableUndo": enableUndo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Archive project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function archiveProject(string projectIdOrKey) returns json|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Delete project asynchronously
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function deleteProjectAsynchronously(string projectIdOrKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/delete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Restore deleted project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function restore(string projectIdOrKey) returns Project|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/restore`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Project response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get all statuses for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getAllStatuses(string projectIdOrKey) returns IssueTypeWithStatus[]|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/statuses`;
        IssueTypeWithStatus[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update project type
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + newProjectTypeKey - The key of the new project type. 
    # + return - Returned if the project type is updated. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function updateProjectType(string projectIdOrKey, string newProjectTypeKey) returns Project|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/type/${getEncodedUri(newProjectTypeKey)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Project response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Get project issue type hierarchy
    #
    # + projectId - The ID of the project. 
    # + return - Returned if the request is successful. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getHierarchy(int projectId) returns ProjectIssueTypeHierarchy|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectId)}/hierarchy`;
        ProjectIssueTypeHierarchy response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project notification scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about any custom fields assigned to receive an event.  *  `group` Returns information about any groups assigned to receive an event.  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information.  *  `projectRole` Returns information about any project roles assigned to receive an event.  *  `user` Returns information about any users assigned to receive an event. 
    # + return - Returned if the request is successful. 
    remote isolated function getNotificationSchemeForProject(string projectKeyOrId, string? expand = ()) returns NotificationScheme|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectKeyOrId)}/notificationscheme`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NotificationScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all project types
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAllProjectTypes() returns ProjectType[]|error {
        string resourcePath = string `/rest/api/2/project/type`;
        ProjectType[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get licensed project types
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAllAccessibleProjectTypes() returns ProjectType[]|error {
        string resourcePath = string `/rest/api/2/project/type/accessible`;
        ProjectType[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project type by key
    #
    # + projectTypeKey - The key of the project type. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectTypeByKey(string projectTypeKey) returns ProjectType|error {
        string resourcePath = string `/rest/api/2/project/type/${getEncodedUri(projectTypeKey)}`;
        ProjectType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get accessible project type by key
    #
    # + projectTypeKey - The key of the project type. 
    # + return - Returned if the request is successful. 
    remote isolated function getAccessibleProjectTypeByKey(string projectTypeKey) returns ProjectType|error {
        string resourcePath = string `/rest/api/2/project/type/${getEncodedUri(projectTypeKey)}/accessible`;
        ProjectType response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project versions paginated
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + orderBy - [Order](#ordering) the results by a field:  *  `description` Sorts by version description.  *  `name` Sorts by version name.  *  `releaseDate` Sorts by release date, starting with the oldest date. Versions with no release date are listed last.  *  `sequence` Sorts by the order of appearance in the user interface.  *  `startDate` Sorts by start date, starting with the oldest date. Versions with no start date are listed last. 
    # + query - Filter the results using a literal string. Versions with matching `name` or `description` are returned (case insensitive). 
    # + status - A list of status values used to filter the results by version status. This parameter accepts a comma-separated list. The status values are `released`, `unreleased`, and `archived`. 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:  *  `issuesstatus` Returns the number of issues in each status category for each version.  *  `operations` Returns actions that can be performed on the specified version. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectVersionsPaginated(string projectIdOrKey, int startAt = 0, int maxResults = 50, string? orderBy = (), string? query = (), string? status = (), string? expand = ()) returns PageBeanVersion|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/version`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "query": query, "status": status, "expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanVersion response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project versions
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts `operations`, which returns actions that can be performed on the version. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectVersions(string projectIdOrKey, string? expand = ()) returns Version[]|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/versions`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Version[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project's sender email
    #
    # + projectId - The project ID. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectEmail(int projectId) returns ProjectEmailAddress|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectId)}/email`;
        ProjectEmailAddress response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set project's sender email
    #
    # + projectId - The project ID. 
    # + payload - The project's sender email address to be set. 
    # + return - Returned if the project's sender email address is successfully set. 
    remote isolated function updateProjectEmail(int projectId, ProjectEmailAddress payload) returns json|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectId)}/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get project issue security scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectIssueSecurityScheme(string projectKeyOrId) returns SecurityScheme|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectKeyOrId)}/issuesecuritylevelscheme`;
        SecurityScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get assigned permission scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + return - Returned if the request is successful. 
    remote isolated function getAssignedPermissionScheme(string projectKeyOrId, string? expand = ()) returns PermissionScheme|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectKeyOrId)}/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assign permission scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive). 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + payload - The request payload to assign permission scheme. 
    # + return - Returned if the request is successful. 
    remote isolated function assignPermissionScheme(string projectKeyOrId, IdBean payload, string? expand = ()) returns PermissionScheme|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectKeyOrId)}/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermissionScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get project issue security levels
    #
    # + projectKeyOrId - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getSecurityLevelsForProject(string projectKeyOrId) returns ProjectIssueSecurityLevels|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectKeyOrId)}/securitylevel`;
        ProjectIssueSecurityLevels response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all workflows
    #
    # + workflowName - The name of the workflow to be returned. Only one workflow can be specified. 
    # + return - Returned if the request is successful. 
    # 
    # # Deprecated
    @deprecated
    remote isolated function getAllWorkflows(string? workflowName = ()) returns DeprecatedWorkflow[]|error {
        string resourcePath = string `/rest/api/2/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DeprecatedWorkflow[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create workflow
    #
    # + payload - The workflow details. 
    # + return - Returned if the workflow is created. 
    remote isolated function createWorkflow(CreateWorkflowDetails payload) returns WorkflowIDs|error {
        string resourcePath = string `/rest/api/2/workflow`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowIDs response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get workflows paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + workflowName - The name of a workflow to return. 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:  *  `transitions` For each workflow, returns information about the transitions inside the workflow.  *  `transitions.rules` For each workflow transition, returns information about its rules. Transitions are included automatically if this expand is requested.  *  `statuses` For each workflow, returns information about the statuses inside the workflow.  *  `statuses.properties` For each workflow status, returns information about its properties. Statuses are included automatically if this expand is requested.  *  `default` For each workflow, returns information about whether this is the default workflow. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowsPaginated(int startAt = 0, int maxResults = 50, string[]? workflowName = (), string? expand = ()) returns PageBeanWorkflow|error {
        string resourcePath = string `/rest/api/2/workflow/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "workflowName": workflowName, "expand": expand};
        map<Encoding> queryParamEncoding = {"workflowName": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanWorkflow response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete inactive workflow
    #
    # + entityId - The entity ID of the workflow. 
    # + return - Returned if the workflow is deleted. 
    remote isolated function deleteInactiveWorkflow(string entityId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflow/${getEncodedUri(entityId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get comments by IDs
    #
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts a comma-separated list. Expand options include:  *  `renderedBody` Returns the comment body rendered in HTML.  *  `properties` Returns the comment's properties. 
    # + payload - The list of comment IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getCommentsByIds(IssueCommentListRequestBean payload, string? expand = ()) returns PageBeanComment|error {
        string resourcePath = string `/rest/api/2/comment/list`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PageBeanComment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get comments
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + orderBy - [Order](#ordering) the results by a field. Accepts *created* to sort comments by their created date. 
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML. 
    # + return - Returned if the request is successful. 
    remote isolated function getComments(string issueIdOrKey, int startAt = 0, int maxResults = 50, string? orderBy = (), string? expand = ()) returns PageOfComments|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/comment`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageOfComments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add comment
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML. 
    # + payload - The request payload to add comment. 
    # + return - Returned if the request is successful. 
    remote isolated function addComment(string issueIdOrKey, Comment payload, string? expand = ()) returns Comment|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/comment`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Comment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get comment
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + id - The ID of the comment. 
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML. 
    # + return - Returned if the request is successful. 
    remote isolated function getComment(string issueIdOrKey, string id, string? expand = ()) returns Comment|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/comment/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Comment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update comment
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + id - The ID of the comment. 
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML. 
    # + payload - The request payload to update comment. 
    # + return - Returned if the request is successful. 
    remote isolated function updateComment(string issueIdOrKey, string id, Comment payload, string? expand = ()) returns Comment|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/comment/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Comment response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete comment
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + id - The ID of the comment. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteComment(string issueIdOrKey, string id) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/comment/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get comment property keys
    #
    # + commentId - The ID of the comment. 
    # + return - Returned if the request is successful. 
    remote isolated function getCommentPropertyKeys(string commentId) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/comment/${getEncodedUri(commentId)}/properties`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get comment property
    #
    # + commentId - The ID of the comment. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function getCommentProperty(string commentId, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/comment/${getEncodedUri(commentId)}/properties/${getEncodedUri(propertyKey)}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set comment property
    #
    # + commentId - The ID of the comment. 
    # + propertyKey - The key of the property. The maximum length is 255 characters. 
    # + payload - The request payload value of a property for a comment to update. 
    # + return - Returned if the comment property is updated. 
    remote isolated function setCommentProperty(string commentId, string propertyKey, json payload) returns json|error {
        string resourcePath = string `/rest/api/2/comment/${getEncodedUri(commentId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete comment property
    #
    # + commentId - The ID of the comment. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteCommentProperty(string commentId, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/comment/${getEncodedUri(commentId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get priorities
    #
    # + return - Returned if the request is successful. 
    remote isolated function getPriorities() returns Priority[]|error {
        string resourcePath = string `/rest/api/2/priority`;
        Priority[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get priority
    #
    # + id - The ID of the issue priority. 
    # + return - Returned if the request is successful. 
    remote isolated function getPriority(string id) returns Priority|error {
        string resourcePath = string `/rest/api/2/priority/${getEncodedUri(id)}`;
        Priority response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create issue link
    #
    # + payload - The issue link request. 
    # + return - Returned if the request is successful. 
    remote isolated function linkIssues(LinkIssueRequestJsonBean payload) returns json|error {
        string resourcePath = string `/rest/api/2/issueLink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get issue link
    #
    # + linkId - The ID of the issue link. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssueLink(string linkId) returns IssueLink|error {
        string resourcePath = string `/rest/api/2/issueLink/${getEncodedUri(linkId)}`;
        IssueLink response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete issue link
    #
    # + linkId - The ID of the issue link. 
    # + return - 200 response 
    remote isolated function deleteIssueLink(string linkId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issueLink/${getEncodedUri(linkId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get fields
    #
    # + return - Returned if the request is successful. 
    remote isolated function getFields() returns FieldDetails[]|error {
        string resourcePath = string `/rest/api/2/field`;
        FieldDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create custom field
    #
    # + payload - Definition of the custom field to be created 
    # + return - Returned if the custom field is created. 
    remote isolated function createCustomField(CustomFieldDefinitionJsonBean payload) returns FieldDetails|error {
        string resourcePath = string `/rest/api/2/field`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FieldDetails response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get fields paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + 'type - The type of fields to search. 
    # + id - The IDs of the custom fields to return or, where `query` is specified, filter. 
    # + query - String used to perform a case-insensitive partial match with field names or descriptions. 
    # + orderBy - [Order](#ordering) the results by a field:  *  `contextsCount` Sorts by the number of contexts related to a field.  *  `lastUsed` Sorts by the date when the value of the field last changed.  *  `name` Sorts by the field name.  *  `screensCount` Sorts by the number of screens related to a field. 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:  *  `key` Returns the key for each field.  *  `lastUsed` Returns the date when the value of the field last changed.  *  `screensCount` Returns the number of screens related to a field.  *  `contextsCount` Returns the number of contexts related to a field.  *  `isLocked` Returns information about whether the field is [locked](https://confluence.atlassian.com/x/ZSN7Og).  *  `searcherKey` Returns the searcher key for each custom field. 
    # + return - Returned if the request is successful. 
    remote isolated function getFieldsPaginated(int startAt = 0, int maxResults = 50, string[]? 'type = (), string[]? id = (), string? query = (), string? orderBy = (), string? expand = ()) returns PageBeanField|error {
        string resourcePath = string `/rest/api/2/field/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "type": 'type, "id": id, "query": query, "orderBy": orderBy, "expand": expand};
        map<Encoding> queryParamEncoding = {"type": {style: FORM, explode: true}, "id": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanField response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update custom field
    #
    # + fieldId - The ID of the custom field. 
    # + payload - The custom field update details. 
    # + return - Returned if the request is successful. 
    remote isolated function updateCustomField(string fieldId, UpdateCustomFieldDetails payload) returns json|error {
        string resourcePath = string `/rest/api/2/field/${getEncodedUri(fieldId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get issue picker suggestions
    #
    # + query - A string to match against text fields in the issue such as title, description, or comments. 
    # + currentJQL - A JQL query defining a list of issues to search for the query term. Note that `username` and `userkey` cannot be used as search terms for this parameter, due to privacy reasons. Use `accountId` instead. 
    # + currentIssueKey - The key of an issue to exclude from search results. For example, the issue the user is viewing when they perform this query. 
    # + currentProjectId - The ID of a project that suggested issues must belong to. 
    # + showSubTasks - Indicate whether to include subtasks in the suggestions list. 
    # + showSubTaskParent - When `currentIssueKey` is a subtask, whether to include the parent issue in the suggestions if it matches the query. 
    # + return - Returned if the request is successful. 
    remote isolated function getIssuePickerResource(string? query = (), string? currentJQL = (), string? currentIssueKey = (), string? currentProjectId = (), boolean? showSubTasks = (), boolean? showSubTaskParent = ()) returns IssuePickerSuggestions|error {
        string resourcePath = string `/rest/api/2/issue/picker`;
        map<anydata> queryParam = {"query": query, "currentJQL": currentJQL, "currentIssueKey": currentIssueKey, "currentProjectId": currentProjectId, "showSubTasks": showSubTasks, "showSubTaskParent": showSubTaskParent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssuePickerSuggestions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Check issues against JQL
    #
    # + payload - The request payload to check issues against JQL. 
    # + return - Returned if the request is successful. 
    remote isolated function matchIssues(IssuesAndJQLQueries payload) returns IssueMatches|error {
        string resourcePath = string `/rest/api/2/jql/match`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        IssueMatches response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Search for issues using JQL (GET)
    #
    # + jql - The [JQL](https://confluence.atlassian.com/x/egORLQ) that defines the search. Note:  *  If no JQL expression is provided, all issues are returned.  *  `username` and `userkey` cannot be used as search terms due to privacy reasons. Use `accountId` instead.  *  If a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. To manage page size, Jira may return fewer items per page where a large number of fields are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only. 
    # + validateQuery - Determines how to validate the JQL query and treat the validation results. Supported values are:  *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).  *  `warn` Returns all errors as warnings.  *  `none` No validation is performed.  *  `true` *Deprecated* A legacy synonym for `strict`.  *  `false` *Deprecated* A legacy synonym for `warn`. Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value. 
    # + fields - A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:  *  `*all` Returns all fields.  *  `*navigable` Returns navigable fields.  *  Any issue field, prefixed with a minus to exclude. Examples:  *  `summary,comment` Returns only the summary and comments fields.  *  `-description` Returns all navigable (default) fields except description.  *  `*all,-comment` Returns all fields except comments. This parameter may be specified multiple times. For example, `fields=field1,field2&fields=field3`. Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-2-issue-issueIdOrKey-get) where the default is all fields. 
    # + expand - Use [expand](#expansion) to include additional information about issues in the response. This parameter accepts a comma-separated list. Expand options include:  *  `renderedFields` Returns field values rendered in HTML format.  *  `names` Returns the display name of each field.  *  `schema` Returns the schema describing a field type.  *  `transitions` Returns all possible transitions for the issue.  *  `operations` Returns all possible operations for the issue.  *  `editmeta` Returns information about how each field can be edited.  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.  *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version. 
    # + properties - A list of issue property keys for issue properties to include in the results. This parameter accepts a comma-separated list. Multiple properties can also be provided using an ampersand separated list. For example, `properties=prop1,prop2&properties=prop3`. A maximum of 5 issue property keys can be specified. 
    # + fieldsByKeys - Reference fields by their key (rather than ID). 
    # + return - Returned if the request is successful. 
    remote isolated function searchForIssuesUsingJql(string? jql = (), int startAt = 0, int maxResults = 50, string validateQuery = "strict", string[]? fields = (), string? expand = (), string[]? properties = (), boolean fieldsByKeys = false) returns SearchResults|error {
        string resourcePath = string `/rest/api/2/search`;
        map<anydata> queryParam = {"jql": jql, "startAt": startAt, "maxResults": maxResults, "validateQuery": validateQuery, "fields": fields, "expand": expand, "properties": properties, "fieldsByKeys": fieldsByKeys};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: true}, "properties": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SearchResults response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search for issues using JQL (POST)
    #
    # + payload - A JSON object containing the search request. 
    # + return - Returned if the request is successful. 
    remote isolated function searchForIssuesUsingJqlPost(SearchRequestBean payload) returns SearchResults|error {
        string resourcePath = string `/rest/api/2/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SearchResults response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get my permissions
    #
    # + projectKey - The key of project. Ignored if `projectId` is provided. 
    # + projectId - The ID of project. 
    # + issueKey - The key of the issue. Ignored if `issueId` is provided. 
    # + issueId - The ID of the issue. 
    # + permissions - A list of permission keys. (Required) This parameter accepts a comma-separated list. To get the list of available permissions, use [Get all permissions](#api-rest-api-2-permissions-get). 
    # + projectUuid - UUID of a project. 
    # + projectConfigurationUuid - UUID of a project configuration. 
    # + return - Returned if the request is successful. 
    remote isolated function getMyPermissions(string? projectKey = (), string? projectId = (), string? issueKey = (), string? issueId = (), string? permissions = (), string? projectUuid = (), string? projectConfigurationUuid = ()) returns Permissions|error {
        string resourcePath = string `/rest/api/2/mypermissions`;
        map<anydata> queryParam = {"projectKey": projectKey, "projectId": projectId, "issueKey": issueKey, "issueId": issueId, "permissions": permissions, "projectUuid": projectUuid, "projectConfigurationUuid": projectConfigurationUuid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Permissions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all permissions
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAllPermissions() returns Permissions|error {
        string resourcePath = string `/rest/api/2/permissions`;
        Permissions response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get bulk permissions
    #
    # + payload - Details of the permissions to check. 
    # + return - Returned if the request is successful. 
    remote isolated function getBulkPermissions(BulkPermissionsRequestBean payload) returns BulkPermissionGrants|error {
        string resourcePath = string `/rest/api/2/permissions/check`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BulkPermissionGrants response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get permitted projects
    #
    # + payload - The request payload to get permitted projects. 
    # + return - Returned if the request is successful. 
    remote isolated function getPermittedProjects(PermissionsKeysBean payload) returns PermittedProjects|error {
        string resourcePath = string `/rest/api/2/permissions/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermittedProjects response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get all permission schemes
    #
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllPermissionSchemes(string? expand = ()) returns PermissionSchemes|error {
        string resourcePath = string `/rest/api/2/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionSchemes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create permission scheme
    #
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + payload - The permission scheme to create. 
    # + return - Returned if the permission scheme is created. 
    remote isolated function createPermissionScheme(PermissionScheme payload, string? expand = ()) returns PermissionScheme|error {
        string resourcePath = string `/rest/api/2/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermissionScheme response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get permission scheme
    #
    # + schemeId - The ID of the permission scheme to return. 
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + return - Returned if the request is successful. 
    remote isolated function getPermissionScheme(int schemeId, string? expand = ()) returns PermissionScheme|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update permission scheme
    #
    # + schemeId - The ID of the permission scheme to update. 
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + payload - The request payload to update permission scheme. 
    # + return - Returned if the scheme is updated. 
    remote isolated function updatePermissionScheme(int schemeId, PermissionScheme payload, string? expand = ()) returns PermissionScheme|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermissionScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete permission scheme
    #
    # + schemeId - The ID of the permission scheme being deleted. 
    # + return - Returned if the permission scheme is deleted. 
    remote isolated function deletePermissionScheme(int schemeId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get permission scheme grants
    #
    # + schemeId - The ID of the permission scheme. 
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:  *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information. 
    # + return - Returned if the request is successful. 
    remote isolated function getPermissionSchemeGrants(int schemeId, string? expand = ()) returns PermissionGrants|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}/permission`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionGrants response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create permission grant
    #
    # + schemeId - The ID of the permission scheme in which to create a new permission grant. 
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:  *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information. 
    # + payload - The permission grant to create. 
    # + return - Returned if the scheme permission is created. 
    remote isolated function createPermissionGrant(int schemeId, PermissionGrant payload, string? expand = ()) returns PermissionGrant|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}/permission`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PermissionGrant response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get permission scheme grant
    #
    # + schemeId - The ID of the permission scheme. 
    # + permissionId - The ID of the permission grant. 
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:  *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission. 
    # + return - Returned if the request is successful. 
    remote isolated function getPermissionSchemeGrant(int schemeId, int permissionId, string? expand = ()) returns PermissionGrant|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}/permission/${getEncodedUri(permissionId)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PermissionGrant response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete permission scheme grant
    #
    # + schemeId - The ID of the permission scheme to delete the permission grant from. 
    # + permissionId - The ID of the permission grant to delete. 
    # + return - Returned if the permission grant is deleted. 
    remote isolated function deletePermissionSchemeEntity(int schemeId, int permissionId) returns http:Response|error {
        string resourcePath = string `/rest/api/2/permissionscheme/${getEncodedUri(schemeId)}/permission/${getEncodedUri(permissionId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get selected time tracking provider
    #
    # + return - Returned if the request is successful and time tracking is enabled. 
    remote isolated function getSelectedTimeTrackingImplementation() returns json|TimeTrackingProvider|error {
        string resourcePath = string `/rest/api/2/configuration/timetracking`;
        json|TimeTrackingProvider response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Select time tracking provider
    #
    # + payload - The request payload to select a time tracking provider. 
    # + return - Returned if the request is successful. 
    remote isolated function selectTimeTrackingImplementation(TimeTrackingProvider payload) returns json|error {
        string resourcePath = string `/rest/api/2/configuration/timetracking`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get all time tracking providers
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAvailableTimeTrackingImplementations() returns TimeTrackingProvider[]|error {
        string resourcePath = string `/rest/api/2/configuration/timetracking/list`;
        TimeTrackingProvider[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get time tracking settings
    #
    # + return - Returned if the request is successful. 
    remote isolated function getSharedTimeTrackingConfiguration() returns TimeTrackingConfiguration|error {
        string resourcePath = string `/rest/api/2/configuration/timetracking/options`;
        TimeTrackingConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set time tracking settings
    #
    # + payload - The request payload to set time tracking settings. 
    # + return - Returned if the request is successful. 
    remote isolated function setSharedTimeTrackingConfiguration(TimeTrackingConfiguration payload) returns TimeTrackingConfiguration|error {
        string resourcePath = string `/rest/api/2/configuration/timetracking/options`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeTrackingConfiguration response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get issue worklogs
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + startedAfter - The worklog start date and time, as a UNIX timestamp in milliseconds, after which worklogs are returned. 
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts`properties`, which returns worklog properties. 
    # + return - Returned if the request is successful 
    remote isolated function getIssueWorklog(string issueIdOrKey, int startAt = 0, int maxResults = 1048576, int? startedAfter = (), string expand = "") returns PageOfWorklogs|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "startedAfter": startedAfter, "expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageOfWorklogs response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add worklog
    #
    # + issueIdOrKey - The ID or key the issue. 
    # + notifyUsers - Whether users watching the issue are notified by email. 
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:  *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Reduces the estimate by amount specified in `reduceBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog. 
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`. 
    # + reduceBy - The amount to reduce the issue's remaining estimate by, as days (\#d), hours (\#h), or minutes (\#m). For example, *2d*. Required when `adjustEstimate` is `manual`. 
    # + expand - Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts `properties`, which returns worklog properties. 
    # + overrideEditableFlag - Whether the worklog entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Only connect app users with admin scope permission can use this flag. 
    # + payload - The request payload to add worklog. 
    # + return - Returned if the request is successful. 
    remote isolated function addWorklog(string issueIdOrKey, Worklog payload, boolean notifyUsers = true, string adjustEstimate = "auto", string? newEstimate = (), string? reduceBy = (), string expand = "", boolean overrideEditableFlag = false) returns Worklog|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "reduceBy": reduceBy, "expand": expand, "overrideEditableFlag": overrideEditableFlag};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Worklog response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get worklog
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + id - The ID of the worklog. 
    # + expand - Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts `properties`, which returns worklog properties. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorklog(string issueIdOrKey, string id, string expand = "") returns Worklog|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Worklog response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update worklog
    #
    # + issueIdOrKey - The ID or key the issue. 
    # + id - The ID of the worklog. 
    # + notifyUsers - Whether users watching the issue are notified by email. 
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:  *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `auto` Updates the estimate by the difference between the original and updated value of `timeSpent` or `timeSpentSeconds`. 
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`. 
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties`, which returns worklog properties. 
    # + overrideEditableFlag - Whether the worklog should be added to the issue even if the issue is not editable. For example, because the issue is closed. Only connect app users with admin permissions can use this flag. 
    # + payload - The request payload to update worklog. 
    # + return - Returned if the request is successful 
    remote isolated function updateWorklog(string issueIdOrKey, string id, Worklog payload, boolean notifyUsers = true, string adjustEstimate = "auto", string? newEstimate = (), string expand = "", boolean overrideEditableFlag = false) returns Worklog|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "expand": expand, "overrideEditableFlag": overrideEditableFlag};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Worklog response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete worklog
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + id - The ID of the worklog. 
    # + notifyUsers - Whether users watching the issue are notified by email. 
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:  *  `new` Sets the estimate to a specific value, defined in `newEstimate`.  *  `leave` Leaves the estimate unchanged.  *  `manual` Increases the estimate by amount specified in `increaseBy`.  *  `auto` Reduces the estimate by the value of `timeSpent` in the worklog. 
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`. 
    # + increaseBy - The amount to increase the issue's remaining estimate by, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `manual`. 
    # + overrideEditableFlag - Whether the work log entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Only connect app users with admin permissions can use this flag. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorklog(string issueIdOrKey, string id, boolean notifyUsers = true, string adjustEstimate = "auto", string? newEstimate = (), string? increaseBy = (), boolean overrideEditableFlag = false) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "increaseBy": increaseBy, "overrideEditableFlag": overrideEditableFlag};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get IDs of deleted worklogs
    #
    # + since - The date and time, as a UNIX timestamp in milliseconds, after which deleted worklogs are returned. 
    # + return - Returned if the request is successful. 
    remote isolated function getIdsOfWorklogsDeletedSince(int since = 0) returns ChangedWorklogs|error {
        string resourcePath = string `/rest/api/2/worklog/deleted`;
        map<anydata> queryParam = {"since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ChangedWorklogs response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get worklogs
    #
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog. 
    # + payload - A JSON object containing a list of worklog IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorklogsForIds(WorklogIdsRequestBean payload, string expand = "") returns Worklog[]|error {
        string resourcePath = string `/rest/api/2/worklog/list`;
        map<anydata> queryParam = {"expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Worklog[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get IDs of updated worklogs
    #
    # + since - The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned. 
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog. 
    # + return - Returned if the request is successful. 
    remote isolated function getIdsOfWorklogsModifiedSince(int since = 0, string expand = "") returns ChangedWorklogs|error {
        string resourcePath = string `/rest/api/2/worklog/updated`;
        map<anydata> queryParam = {"since": since, "expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ChangedWorklogs response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get worklog property keys
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + worklogId - The ID of the worklog. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorklogPropertyKeys(string issueIdOrKey, string worklogId) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(worklogId)}/properties`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get worklog property
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + worklogId - The ID of the worklog. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorklogProperty(string issueIdOrKey, string worklogId, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(worklogId)}/properties/${getEncodedUri(propertyKey)}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set worklog property
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + worklogId - The ID of the worklog. 
    # + propertyKey - The key of the issue property. The maximum length is 255 characters. 
    # + payload - The request payload to set worklog property. 
    # + return - Returned if the worklog property is updated. 
    remote isolated function setWorklogProperty(string issueIdOrKey, string worklogId, string propertyKey, json payload) returns json|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(worklogId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete worklog property
    #
    # + issueIdOrKey - The ID or key of the issue. 
    # + worklogId - The ID of the worklog. 
    # + propertyKey - The key of the property. 
    # + return - Returned if the worklog property is removed. 
    remote isolated function deleteWorklogProperty(string issueIdOrKey, string worklogId, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/issue/${getEncodedUri(issueIdOrKey)}/worklog/${getEncodedUri(worklogId)}/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get workflow transition rule configurations
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + types - The types of the transition rules to return. 
    # + keys - The transition rule class keys, as defined in the Connect app descriptor, of the transition rules to return. 
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowTransitionRuleConfigurations(string[] types, int startAt = 0, int maxResults = 10, string[]? keys = (), string? expand = ()) returns PageBeanWorkflowTransitionRules|error {
        string resourcePath = string `/rest/api/2/workflow/rule/config`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "types": types, "keys": keys, "expand": expand};
        map<Encoding> queryParamEncoding = {"types": {style: FORM, explode: true}, "keys": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanWorkflowTransitionRules response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update workflow transition rule configurations
    #
    # + payload - The request payload to update configuration of workflow transition rules. 
    # + return - Returned if the request is successful. 
    remote isolated function updateWorkflowTransitionRuleConfigurations(WorkflowTransitionRulesUpdate payload) returns WorkflowTransitionRulesUpdateErrors|error {
        string resourcePath = string `/rest/api/2/workflow/rule/config`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowTransitionRulesUpdateErrors response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete workflow transition rule configurations
    #
    # + payload - The request payload to delete configuration of workflow transition rules. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowTransitionRuleConfigurations(WorkflowsWithTransitionRulesDetails payload) returns WorkflowTransitionRulesUpdateErrors|error {
        string resourcePath = string `/rest/api/2/workflow/rule/config/delete`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowTransitionRulesUpdateErrors response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get workflow transition properties
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira administration console. The ID is shown next to the transition. 
    # + includeReservedKeys - Some properties with keys that have the *jira.* prefix are reserved, which means they are not editable. To include these properties in the results, set this parameter to *true*. 
    # + 'key - The key of the property being returned, also known as the name of the property. If this parameter is not specified, all properties on the transition are returned. 
    # + workflowName - The name of the workflow that the transition belongs to. 
    # + workflowMode - The workflow status. Set to *live* for active and inactive workflows, or *draft* for draft workflows. 
    # + return - 200 response 
    remote isolated function getWorkflowTransitionProperties(int transitionId, string workflowName, boolean includeReservedKeys = false, string? 'key = (), string workflowMode = "live") returns WorkflowTransitionProperty|error {
        string resourcePath = string `/rest/api/2/workflow/transitions/${getEncodedUri(transitionId)}/properties`;
        map<anydata> queryParam = {"includeReservedKeys": includeReservedKeys, "key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkflowTransitionProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition. 
    # + 'key - The key of the property being updated, also known as the name of the property. Set this to the same value as the `key` defined in the request body. 
    # + workflowName - The name of the workflow that the transition belongs to. 
    # + workflowMode - The workflow status. Set to `live` for inactive workflows or `draft` for draft workflows. Active workflows cannot be edited. 
    # + payload - The request payload to update configuration of workflow transition property. 
    # + return - 200 response 
    remote isolated function updateWorkflowTransitionProperty(int transitionId, string 'key, string workflowName, WorkflowTransitionProperty payload, string? workflowMode = ()) returns WorkflowTransitionProperty|error {
        string resourcePath = string `/rest/api/2/workflow/transitions/${getEncodedUri(transitionId)}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowTransitionProperty response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition. 
    # + 'key - The key of the property being added, also known as the name of the property. Set this to the same value as the `key` defined in the request body. 
    # + workflowName - The name of the workflow that the transition belongs to. 
    # + workflowMode - The workflow status. Set to *live* for inactive workflows or *draft* for draft workflows. Active workflows cannot be edited. 
    # + payload - The request payload to create configuration of workflow transition property. 
    # + return - 200 response 
    remote isolated function createWorkflowTransitionProperty(int transitionId, string 'key, string workflowName, WorkflowTransitionProperty payload, string workflowMode = "live") returns WorkflowTransitionProperty|error {
        string resourcePath = string `/rest/api/2/workflow/transitions/${getEncodedUri(transitionId)}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowTransitionProperty response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition. 
    # + 'key - The name of the transition property to delete, also known as the name of the property. 
    # + workflowName - The name of the workflow that the transition belongs to. 
    # + workflowMode - The workflow status. Set to `live` for inactive workflows or `draft` for draft workflows. Active workflows cannot be edited. 
    # + return - 200 response 
    remote isolated function deleteWorkflowTransitionProperty(int transitionId, string 'key, string workflowName, string? workflowMode = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflow/transitions/${getEncodedUri(transitionId)}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all workflow schemes
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllWorkflowSchemes(int startAt = 0, int maxResults = 50) returns PageBeanWorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanWorkflowScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create workflow scheme
    #
    # + payload - The request payload to create workflow scheme. 
    # + return - Returned if the request is successful. 
    remote isolated function createWorkflowScheme(WorkflowScheme payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get workflow scheme project associations
    #
    # + projectId - The ID of a project to return the workflow schemes for. To include multiple projects, provide an ampersand-Jim: oneseparated list. For example, `projectId=10000&projectId=10001`. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowSchemeProjectAssociations(int[] projectId) returns ContainerOfWorkflowSchemeAssociations|error {
        string resourcePath = string `/rest/api/2/workflowscheme/project`;
        map<anydata> queryParam = {"projectId": projectId};
        map<Encoding> queryParamEncoding = {"projectId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ContainerOfWorkflowSchemeAssociations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Assign workflow scheme to project
    #
    # + payload - The request payload to assign workflow scheme to project. 
    # + return - Returned if the request is successful. 
    remote isolated function assignSchemeToProject(WorkflowSchemeProjectAssociation payload) returns json|error {
        string resourcePath = string `/rest/api/2/workflowscheme/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*. 
    # + returnDraftIfExists - Returns the workflow scheme's draft rather than scheme itself, if set to true. If the workflow scheme does not have a draft, then the workflow scheme is returned. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowScheme(int id, boolean returnDraftIfExists = false) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkflowScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*. 
    # + payload - The request payload to update workflow scheme. 
    # + return - Returned if the request is successful. 
    remote isolated function updateWorkflowScheme(int id, WorkflowScheme payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowScheme(int id) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft is created from. 
    # + return - Returned if the request is successful. 
    remote isolated function createWorkflowSchemeDraftFromParent(int id) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/createdraft`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get default workflow
    #
    # + id - The ID of the workflow scheme. 
    # + returnDraftIfExists - Set to `true` to return the default workflow for the workflow scheme's draft rather than scheme itself. If the workflow scheme does not have a draft, then the default workflow for the workflow scheme is returned. 
    # + return - Returned if the request is successful. 
    remote isolated function getDefaultWorkflow(int id, boolean returnDraftIfExists = false) returns DefaultWorkflow|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/default`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        DefaultWorkflow response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update default workflow
    #
    # + id - The ID of the workflow scheme. 
    # + payload - The new default workflow. 
    # + return - Returned if the request is successful. 
    remote isolated function updateDefaultWorkflow(int id, DefaultWorkflow payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/default`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete default workflow
    #
    # + id - The ID of the workflow scheme. 
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteDefaultWorkflow(int id, boolean? updateDraftIfNeeded = ()) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/default`;
        map<anydata> queryParam = {"updateDraftIfNeeded": updateDraftIfNeeded};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkflowScheme response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowSchemeDraft(int id) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft`;
        WorkflowScheme response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from. 
    # + payload - The request payload to update workflow scheme draft. 
    # + return - Returned if the request is successful. 
    remote isolated function updateWorkflowSchemeDraft(int id, WorkflowScheme payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowSchemeDraft(int id) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + return - Returned if the request is successful. 
    remote isolated function getDraftDefaultWorkflow(int id) returns DefaultWorkflow|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/default`;
        DefaultWorkflow response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + payload - The object for the new default workflow. 
    # + return - Returned if the request is successful. 
    remote isolated function updateDraftDefaultWorkflow(int id, DefaultWorkflow payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/default`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteDraftDefaultWorkflow(int id) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/default`;
        WorkflowScheme response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + issueType - The ID of the issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowSchemeDraftIssueType(int id, string issueType) returns IssueTypeWorkflowMapping|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/issuetype/${getEncodedUri(issueType)}`;
        IssueTypeWorkflowMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + issueType - The ID of the issue type. 
    # + payload - The issue type-project mapping. 
    # + return - Returned if the request is successful. 
    remote isolated function setWorkflowSchemeDraftIssueType(int id, string issueType, IssueTypeWorkflowMapping payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/issuetype/${getEncodedUri(issueType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + issueType - The ID of the issue type. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowSchemeDraftIssueType(int id, string issueType) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/issuetype/${getEncodedUri(issueType)}`;
        WorkflowScheme response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Publish draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + validateOnly - Whether the request only performs a validation. 
    # + payload - Details of the status mappings. 
    # + return - Returned if the request is only for validation and is successful. 
    remote isolated function publishDraftWorkflowScheme(int id, PublishDraftWorkflowScheme payload, boolean validateOnly = false) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/publish`;
        map<anydata> queryParam = {"validateOnly": validateOnly};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get issue types for workflows in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + workflowName - The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow. 
    # + return - Returned if the request is successful. 
    remote isolated function getDraftWorkflow(int id, string? workflowName = ()) returns IssueTypesWorkflowMapping|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssueTypesWorkflowMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + workflowName - The name of the workflow. 
    # + payload - The request payload to set issue types in workflow scheme draft. 
    # + return - Returned if the request is successful. 
    remote isolated function updateDraftWorkflowMapping(int id, string workflowName, IssueTypesWorkflowMapping payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue types for workflow in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to. 
    # + workflowName - The name of the workflow. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteDraftWorkflowMapping(int id, string workflowName) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + issueType - The ID of the issue type. 
    # + returnDraftIfExists - Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflowSchemeIssueType(int id, string issueType, boolean returnDraftIfExists = false) returns IssueTypeWorkflowMapping|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/issuetype/${getEncodedUri(issueType)}`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssueTypeWorkflowMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + issueType - The ID of the issue type. 
    # + payload - The issue type-project mapping. 
    # + return - Returned if the request is successful. 
    remote isolated function setWorkflowSchemeIssueType(int id, string issueType, IssueTypeWorkflowMapping payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/issuetype/${getEncodedUri(issueType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + issueType - The ID of the issue type. 
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowSchemeIssueType(int id, string issueType, boolean? updateDraftIfNeeded = ()) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/issuetype/${getEncodedUri(issueType)}`;
        map<anydata> queryParam = {"updateDraftIfNeeded": updateDraftIfNeeded};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WorkflowScheme response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get issue types for workflows in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + workflowName - The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow. 
    # + returnDraftIfExists - Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned. 
    # + return - Returned if the request is successful. 
    remote isolated function getWorkflow(int id, string? workflowName = (), boolean returnDraftIfExists = false) returns IssueTypesWorkflowMapping|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName, "returnDraftIfExists": returnDraftIfExists};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        IssueTypesWorkflowMapping response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + workflowName - The name of the workflow. 
    # + payload - The request payload to set issue types in workflow scheme. 
    # + return - Returned if the request is successful. 
    remote isolated function updateWorkflowMapping(int id, string workflowName, IssueTypesWorkflowMapping payload) returns WorkflowScheme|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkflowScheme response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme. 
    # + workflowName - The name of the workflow. 
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteWorkflowMapping(int id, string workflowName, boolean? updateDraftIfNeeded = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/workflowscheme/${getEncodedUri(id)}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName, "updateDraftIfNeeded": updateDraftIfNeeded};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all statuses
    #
    # + return - Returned if the request is successful. 
    remote isolated function getStatuses() returns StatusDetails[]|error {
        string resourcePath = string `/rest/api/2/status`;
        StatusDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get status
    #
    # + idOrName - The ID or name of the status. 
    # + return - Returned if the request is successful. 
    remote isolated function getStatus(string idOrName) returns StatusDetails|error {
        string resourcePath = string `/rest/api/2/status/${getEncodedUri(idOrName)}`;
        StatusDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all status categories
    #
    # + return - Returned if the request is successful. 
    remote isolated function getStatusCategories() returns StatusCategory[]|error {
        string resourcePath = string `/rest/api/2/statuscategory`;
        StatusCategory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get status category
    #
    # + idOrKey - The ID or key of the status category. 
    # + return - Returned if the request is successful. 
    remote isolated function getStatusCategory(string idOrKey) returns StatusCategory|error {
        string resourcePath = string `/rest/api/2/statuscategory/${getEncodedUri(idOrKey)}`;
        StatusCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all project categories
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAllProjectCategories() returns ProjectCategory[]|error {
        string resourcePath = string `/rest/api/2/projectCategory`;
        ProjectCategory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create project category
    #
    # + payload - The request payload to create project category. 
    # + return - Returned if the request is successful. 
    remote isolated function createProjectCategory(ProjectCategory payload) returns ProjectCategory|error {
        string resourcePath = string `/rest/api/2/projectCategory`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get project category by ID
    #
    # + id - The ID of the project category. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectCategoryById(int id) returns ProjectCategory|error {
        string resourcePath = string `/rest/api/2/projectCategory/${getEncodedUri(id)}`;
        ProjectCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update project category
    #
    # + id - Project category ID. 
    # + payload - The request payload to update a project category. 
    # + return - Returned if the request is successful. 
    remote isolated function updateProjectCategory(int id, ProjectCategory payload) returns UpdatedProjectCategory|error {
        string resourcePath = string `/rest/api/2/projectCategory/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UpdatedProjectCategory response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete project category
    #
    # + id - ID of the project category to delete. 
    # + return - Returned if the request is successful. 
    remote isolated function removeProjectCategory(int id) returns http:Response|error {
        string resourcePath = string `/rest/api/2/projectCategory/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Create component
    #
    # + payload - The request payload to create a component. 
    # + return - Returned if the request is successful. 
    remote isolated function createComponent(ProjectComponent payload) returns ProjectComponent|error {
        string resourcePath = string `/rest/api/2/component`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectComponent response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get component
    #
    # + id - The ID of the component. 
    # + return - Returned if the request is successful. 
    remote isolated function getComponent(string id) returns ProjectComponent|error {
        string resourcePath = string `/rest/api/2/component/${getEncodedUri(id)}`;
        ProjectComponent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update component
    #
    # + id - The ID of the component. 
    # + payload - The request payload to update a component. 
    # + return - Returned if the request is successful. 
    remote isolated function updateComponent(string id, ProjectComponent payload) returns ProjectComponent|error {
        string resourcePath = string `/rest/api/2/component/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectComponent response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete component
    #
    # + id - The ID of the component. 
    # + moveIssuesTo - The ID of the component to replace the deleted component. If this value is null no replacement is made. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteComponent(string id, string? moveIssuesTo = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/component/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"moveIssuesTo": moveIssuesTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get component issues count
    #
    # + id - The ID of the component. 
    # + return - Returned if the request is successful. 
    remote isolated function getComponentRelatedIssues(string id) returns ComponentIssuesCount|error {
        string resourcePath = string `/rest/api/2/component/${getEncodedUri(id)}/relatedIssueCounts`;
        ComponentIssuesCount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project components paginated
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + orderBy - [Order](#ordering) the results by a field:  *  `description` Sorts by the component description.  *  `issueCount` Sorts by the count of issues associated with the component.  *  `lead` Sorts by the user key of the component's project lead.  *  `name` Sorts by component name. 
    # + query - Filter the results using a literal string. Components with a matching `name` or `description` are returned (case insensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectComponentsPaginated(string projectIdOrKey, int startAt = 0, int maxResults = 50, string? orderBy = (), string? query = ()) returns PageBeanComponentWithIssueCount|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/component`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "query": query};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanComponentWithIssueCount response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project components
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectComponents(string projectIdOrKey) returns ProjectComponent[]|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/components`;
        ProjectComponent[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project property keys
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectPropertyKeys(string projectIdOrKey) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/properties`;
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + propertyKey - The project property key. Use [Get project property keys](#api-rest-api-2-project-projectIdOrKey-properties-get) to get a list of all project property keys. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectProperty(string projectIdOrKey, string propertyKey) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + propertyKey - The key of the project property. The maximum length is 255 characters. 
    # + payload - The request payload to set project property. 
    # + return - Returned if the project property is updated. 
    remote isolated function setProjectProperty(string projectIdOrKey, string propertyKey, json payload) returns json|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + propertyKey - The project property key. Use [Get project property keys](#api-rest-api-2-project-projectIdOrKey-properties-get) to get a list of all project property keys. 
    # + return - Returned if the project property is deleted. 
    remote isolated function deleteProjectProperty(string projectIdOrKey, string propertyKey) returns http:Response|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/properties/${getEncodedUri(propertyKey)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get project roles for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectRoles(string projectIdOrKey) returns json|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/role`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get project role for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectRole(string projectIdOrKey, int id) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/role/${getEncodedUri(id)}`;
        ProjectRole response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set actors for project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + payload - The groups or users to associate with the project role for this project. Provide the user account ID or group name. 
    # + return - Returned if the request is successful. The complete list of actors for the project is returned. 
    remote isolated function setActors(string projectIdOrKey, int id, ProjectRoleActorsUpdateBean payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/role/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Add actors to project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + payload - The groups or users to associate with the project role for this project. Provide the user account ID or group name. 
    # + return - Returned if the request is successful. The complete list of actors for the project is returned. For example, the cURL request above adds a group, *jira-developers*. For the response below to be returned as a result of that request, the user *Mia Krystof* would have previously been added as a `user` actor for this project. 
    remote isolated function addActorUsers(string projectIdOrKey, int id, ActorsMap payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/role/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete actors from project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + user - The user account ID of the user to remove from the project role. 
    # + group - The name of the group to remove from the project role. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteActor(string projectIdOrKey, int id, string? user = (), string? group = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/role/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"user": user, "group": group};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get project role details
    #
    # + projectIdOrKey - The project ID or project key (case sensitive). 
    # + currentMember - Whether the roles should be filtered to include only those the user is assigned to. 
    # + excludeConnectAddons - Whether to exclude connect addons. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectRoleDetails(string projectIdOrKey, boolean currentMember = false, boolean excludeConnectAddons = false) returns ProjectRoleDetails[]|error {
        string resourcePath = string `/rest/api/2/project/${getEncodedUri(projectIdOrKey)}/roledetails`;
        map<anydata> queryParam = {"currentMember": currentMember, "excludeConnectAddons": excludeConnectAddons};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProjectRoleDetails[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all project roles
    #
    # + return - Returned if the request is successful. 
    remote isolated function getAllProjectRoles() returns ProjectRole[]|error {
        string resourcePath = string `/rest/api/2/role`;
        ProjectRole[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create project role
    #
    # + payload - The request payload to create a new project role. 
    # + return - Returned if the request is successful. 
    remote isolated function createProjectRole(CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get project role by ID
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectRoleById(int id) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}`;
        ProjectRole response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Fully update project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + payload - The request payload to fully update a project role. 
    # + return - Returned if the request is successful. 
    remote isolated function fullyUpdateProjectRole(int id, CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Partial update project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + payload - The request payload to partial update a project role. 
    # + return - Returned if the request is successful. 
    remote isolated function partialUpdateProjectRole(int id, CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete project role
    #
    # + id - The ID of the project role to delete. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + swap - The ID of the project role that will replace the one being deleted. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteProjectRole(int id, int? swap = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}`;
        map<anydata> queryParam = {"swap": swap};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get default actors for project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + return - Returned if the request is successful. 
    remote isolated function getProjectRoleActorsForRole(int id) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}/actors`;
        ProjectRole response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add default actors to project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + payload - The request payload to add default users to project role. 
    # + return - Returned if the request is successful. 
    remote isolated function addProjectRoleActorsToRole(int id, ActorInputBean payload) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}/actors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProjectRole response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete default actors from project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs. 
    # + user - The user account ID of the user to remove as a default actor. 
    # + group - The group name of the group to be removed as a default actor. 
    # + return - Returned if the request is successful. 
    remote isolated function deleteProjectRoleActorsFromRole(int id, string? user = (), string? group = ()) returns ProjectRole|error {
        string resourcePath = string `/rest/api/2/role/${getEncodedUri(id)}/actors`;
        map<anydata> queryParam = {"user": user, "group": group};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProjectRole response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get user
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details. 
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details. 
    # + expand - Use [expand](#expansion) to include additional information about users in the response. This parameter accepts a comma-separated list. Expand options include:  *  `groups` includes all groups and nested groups to which the user belongs.  *  `applicationRoles` includes details of all the applications to which the user has access. 
    # + return - Returned if the request is successful. 
    remote isolated function getUser(string? accountId = (), string? username = (), string? 'key = (), string? expand = ()) returns User|error {
        string resourcePath = string `/rest/api/2/user`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key, "expand": expand};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create user
    #
    # + payload - Details about the user to be created. 
    # + return - Returned if the request is successful. 
    remote isolated function createUser(UserWriteBean payload) returns User|error {
        string resourcePath = string `/rest/api/2/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete user
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + return - Returned if the request is successful. 
    remote isolated function removeUser(string accountId, string? username = (), string? 'key = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/user`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Bulk get users
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + accountId - The account ID of a user. To specify multiple users, pass multiple `accountId` parameters. For example, `accountId=5b10a2844c20165700ede21g&accountId=5b10ac8d82e05b22cc7d4ef5`. 
    # + return - Returned if the request is successful. 
    remote isolated function bulkGetUsers(string[] accountId, int startAt = 0, int maxResults = 10, string[]? username = (), string[]? 'key = ()) returns PageBeanUser|error {
        string resourcePath = string `/rest/api/2/user/bulk`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "username": username, "key": 'key, "accountId": accountId};
        map<Encoding> queryParamEncoding = {"username": {style: FORM, explode: true}, "key": {style: FORM, explode: true}, "accountId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PageBeanUser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get account IDs for users
    #
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + username - Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present. 
    # + 'key - Key of a user. To specify multiple users, pass multiple copies of this parameter. For example, `key=fred&key=barney`. Required if `username` isn't provided. Cannot be provided if `username` is present. 
    # + return - Returned if the request is successful. 
    remote isolated function bulkGetUsersMigration(int startAt = 0, int maxResults = 10, string[]? username = (), string[]? 'key = ()) returns UserMigrationBean[]|error {
        string resourcePath = string `/rest/api/2/user/bulk/migration`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "username": username, "key": 'key};
        map<Encoding> queryParamEncoding = {"username": {style: FORM, explode: true}, "key": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UserMigrationBean[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user default columns
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + return - Returned if the request is successful. 
    remote isolated function getUserDefaultColumns(string? accountId = (), string? username = ()) returns ColumnItem[]|error {
        string resourcePath = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ColumnItem[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set user default columns
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + payload - The ID of a column to set. To set multiple columns, send multiple `columns` parameters. 
    # + return - Returned if the request is successful. 
    remote isolated function setUserColumns(byte[] payload, string? accountId = ()) returns json|error {
        string resourcePath = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        request.setPayload(payload);
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Reset user default columns
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + return - Returned if the request is successful. 
    remote isolated function resetUserColumns(string? accountId = (), string? username = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get user email
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`. 
    # + return - Returned if the request is successful. 
    remote isolated function getUserEmail(string accountId) returns UnrestrictedUserEmail|error {
        string resourcePath = string `/rest/api/2/user/email`;
        map<anydata> queryParam = {"accountId": accountId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UnrestrictedUserEmail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user email bulk
    #
    # + accountId - The account IDs of the users for which emails are required. An `accountId` is an identifier that uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`. Note, this should be treated as an opaque identifier (that is, do not assume any structure in the value). 
    # + return - Returned if the request is successful. 
    remote isolated function getUserEmailBulk(string[] accountId) returns UnrestrictedUserEmail|error {
        string resourcePath = string `/rest/api/2/user/email/bulk`;
        map<anydata> queryParam = {"accountId": accountId};
        map<Encoding> queryParamEncoding = {"accountId": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        UnrestrictedUserEmail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user groups
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + return - Returned if the request is successful. 
    remote isolated function getUserGroups(string accountId, string? username = (), string? 'key = ()) returns GroupName[]|error {
        string resourcePath = string `/rest/api/2/user/groups`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GroupName[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all users default
    #
    # + startAt - The index of the first item to return. 
    # + maxResults - The maximum number of items to return. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllUsersDefault(int startAt = 0, int maxResults = 50) returns User[]|error {
        string resourcePath = string `/rest/api/2/users`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all users
    #
    # + startAt - The index of the first item to return. 
    # + maxResults - The maximum number of items to return. 
    # + return - Returned if the request is successful. 
    remote isolated function getAllUsers(int startAt = 0, int maxResults = 50) returns User[]|error {
        string resourcePath = string `/rest/api/2/users/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user property keys
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + return - Returned if the request is successful. 
    remote isolated function getUserPropertyKeys(string? accountId = (), string? userKey = (), string? username = ()) returns PropertyKeys|error {
        string resourcePath = string `/rest/api/2/user/properties`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PropertyKeys response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get user property
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + propertyKey - The key of the user's property. 
    # + return - Returned if the request is successful. 
    remote isolated function getUserProperty(string propertyKey, string? accountId = (), string? userKey = (), string? username = ()) returns EntityProperty|error {
        string resourcePath = string `/rest/api/2/user/properties/${getEncodedUri(propertyKey)}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        EntityProperty response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set user property
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + propertyKey - The key of the user's property. The maximum length is 255 characters. 
    # + payload - The request payload to set the value of a user's property. 
    # + return - Returned if the user property is updated. 
    remote isolated function setUserProperty(string propertyKey, json payload, string? accountId = (), string? userKey = (), string? username = ()) returns json|error {
        string resourcePath = string `/rest/api/2/user/properties/${getEncodedUri(propertyKey)}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        request.setPayload(payload, "application/json");
        json response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete user property
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. 
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + propertyKey - The key of the user's property. 
    # + return - Returned if the user property is deleted. 
    remote isolated function deleteUserProperty(string propertyKey, string? accountId = (), string? userKey = (), string? username = ()) returns http:Response|error {
        string resourcePath = string `/rest/api/2/user/properties/${getEncodedUri(propertyKey)}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Find users assignable to projects
    #
    # + query - A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified. 
    # + projectKeys - A list of project keys (case sensitive). This parameter accepts a comma-separated list. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function findBulkAssignableUsers(string projectKeys, string? query = (), string? username = (), string? accountId = (), int startAt = 0, int maxResults = 50) returns User[]|error {
        string resourcePath = string `/rest/api/2/user/assignable/multiProjectSearch`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "projectKeys": projectKeys, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users assignable to issues
    #
    # + query - A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `username` or `accountId` is specified. 
    # + sessionId - The sessionId of this request. SessionId is the same until the assignee is set. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified. 
    # + project - The project ID or project key (case sensitive). Required, unless `issueKey` is specified. 
    # + issueKey - The key of the issue. Required, unless `project` is specified. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return. This operation may return less than the maximum number of items even if more are available. The operation fetches users up to the maximum and then, from the fetched users, returns only the users that can be assigned to the issue. 
    # + actionDescriptorId - The ID of the transition. 
    # + recommend - Whether recommended or not. 
    # + return - Returned if the request is successful. 
    remote isolated function findAssignableUsers(string? query = (), string? sessionId = (), string? username = (), string? accountId = (), string? project = (), string? issueKey = (), int startAt = 0, int maxResults = 50, int? actionDescriptorId = (), boolean recommend = false) returns User[]|error {
        string resourcePath = string `/rest/api/2/user/assignable/search`;
        map<anydata> queryParam = {"query": query, "sessionId": sessionId, "username": username, "accountId": accountId, "project": project, "issueKey": issueKey, "startAt": startAt, "maxResults": maxResults, "actionDescriptorId": actionDescriptorId, "recommend": recommend};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users with permissions
    #
    # + query - A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified. 
    # + permissions - A comma separated list of permissions. Permissions can be specified as any:  *  permission returned by [Get all permissions](#api-rest-api-2-permissions-get).  *  custom project permission added by Connect apps.  *  (deprecated) one of the following:      *  ASSIGNABLE\_USER      *  ASSIGN\_ISSUE      *  ATTACHMENT\_DELETE\_ALL      *  ATTACHMENT\_DELETE\_OWN      *  BROWSE      *  CLOSE\_ISSUE      *  COMMENT\_DELETE\_ALL      *  COMMENT\_DELETE\_OWN      *  COMMENT\_EDIT\_ALL      *  COMMENT\_EDIT\_OWN      *  COMMENT\_ISSUE      *  CREATE\_ATTACHMENT      *  CREATE\_ISSUE      *  DELETE\_ISSUE      *  EDIT\_ISSUE      *  LINK\_ISSUE      *  MANAGE\_WATCHER\_LIST      *  MODIFY\_REPORTER      *  MOVE\_ISSUE      *  PROJECT\_ADMIN      *  RESOLVE\_ISSUE      *  SCHEDULE\_ISSUE      *  SET\_ISSUE\_SECURITY      *  TRANSITION\_ISSUE      *  VIEW\_VERSION\_CONTROL      *  VIEW\_VOTERS\_AND\_WATCHERS      *  VIEW\_WORKFLOW\_READONLY      *  WORKLOG\_DELETE\_ALL      *  WORKLOG\_DELETE\_OWN      *  WORKLOG\_EDIT\_ALL      *  WORKLOG\_EDIT\_OWN      *  WORK\_ISSUE 
    # + issueKey - The issue key for the issue. 
    # + projectKey - The project key for the project (case sensitive). 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function findUsersWithAllPermissions(string permissions, string? query = (), string? username = (), string? accountId = (), string? issueKey = (), string? projectKey = (), int startAt = 0, int maxResults = 50) returns User[]|error {
        string resourcePath = string `/rest/api/2/user/permission/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "permissions": permissions, "issueKey": issueKey, "projectKey": projectKey, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users for picker
    #
    # + query - A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. 
    # + maxResults - The maximum number of items to return. The total number of matched users is returned in `total`. 
    # + showAvatar - Include the URI to the user's avatar. 
    # + exclude - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + excludeAccountIds - A list of account IDs to exclude from the search results. This parameter accepts a comma-separated list. Multiple account IDs can also be provided using an ampersand-separated list. For example, `excludeAccountIds=5b10a2844c20165700ede21g,5b10a0effa615349cb016cd8&excludeAccountIds=5b10ac8d82e05b22cc7d4ef5`. Cannot be provided with `exclude`. 
    # + avatarSize - Avatar size of user. 
    # + excludeConnectUsers - Whether to exclude connector users. 
    # + return - Returned if the request is successful. 
    remote isolated function findUsersForPicker(string query, int maxResults = 50, boolean showAvatar = false, string[]? exclude = (), string[]? excludeAccountIds = (), string? avatarSize = (), boolean excludeConnectUsers = false) returns FoundUsers|error {
        string resourcePath = string `/rest/api/2/user/picker`;
        map<anydata> queryParam = {"query": query, "maxResults": maxResults, "showAvatar": showAvatar, "exclude": exclude, "excludeAccountIds": excludeAccountIds, "avatarSize": avatarSize, "excludeConnectUsers": excludeConnectUsers};
        map<Encoding> queryParamEncoding = {"exclude": {style: FORM, explode: true}, "excludeAccountIds": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FoundUsers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users
    #
    # + query - A query string that is matched against user attributes ( `displayName`, and `emailAddress`) to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` or `property` is specified. 
    # + username - Username assigned to a user. 
    # + accountId - A query string that is matched exactly against a user `accountId`. Required, unless `query` or `property` is specified. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + property - A query string used to search properties. Property keys are specified by path, so property keys containing dot (.) or equals (=) characters cannot be used. The query string cannot be specified using a JSON object. Example: To search for the value of `nested` from `{"something":{"nested":1,"other":2}}` use `thepropertykey.something.nested=1`. Required, unless `accountId` or `query` is specified. 
    # + return - Returned if the request is successful. 
    remote isolated function findUsers(string? query = (), string? username = (), string? accountId = (), int startAt = 0, int maxResults = 50, string? property = ()) returns User[]|error {
        string resourcePath = string `/rest/api/2/user/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "startAt": startAt, "maxResults": maxResults, "property": property};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users by query
    #
    # + query - The search query. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function findUsersByQuery(string query, int startAt = 0, int maxResults = 100) returns PageBeanUser|error {
        string resourcePath = string `/rest/api/2/user/search/query`;
        map<anydata> queryParam = {"query": query, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanUser response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find user keys by query
    #
    # + query - The search query. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function findUserKeysByQuery(string query, int startAt = 0, int maxResults = 100) returns PageBeanUserKey|error {
        string resourcePath = string `/rest/api/2/user/search/query/key`;
        map<anydata> queryParam = {"query": query, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PageBeanUserKey response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Find users with browse permission
    #
    # + query - A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified. 
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. 
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified. 
    # + issueKey - The issue key for the issue. Required, unless `projectKey` is specified. 
    # + projectKey - The project key for the project (case sensitive). Required, unless `issueKey` is specified. 
    # + startAt - The index of the first item to return in a page of results (page offset). 
    # + maxResults - The maximum number of items to return per page. 
    # + return - Returned if the request is successful. 
    remote isolated function findUsersWithBrowsePermission(string? query = (), string? username = (), string? accountId = (), string? issueKey = (), string? projectKey = (), int startAt = 0, int maxResults = 50) returns User[]|error {
        string resourcePath = string `/rest/api/2/user/viewissue/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "issueKey": issueKey, "projectKey": projectKey, "startAt": startAt, "maxResults": maxResults};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
