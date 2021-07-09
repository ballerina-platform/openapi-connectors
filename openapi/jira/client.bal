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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Configuration record for Jira
#
# + authConfig - Basic authentication or CredentialsConfig Configuration Tokens
# + secureSocketConfig - Secure Socket Configuration  
public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig|http:CredentialsConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

public type AttachmentArr Attachment[];

public type ColumnItemArr ColumnItem[];

public type ResolutionArr Resolution[];

public type IssueTypeDetailsArr IssueTypeDetails[];

public type ProjectArr Project[];

public type IssueTypeWithStatusArr IssueTypeWithStatus[];

public type ProjectTypeArr ProjectType[];

public type VersionArr Version[];

public type DeprecatedWorkflowArr DeprecatedWorkflow[];

public type PriorityArr Priority[];

public type FieldDetailsArr FieldDetails[];

public type TimeTrackingProviderArr TimeTrackingProvider[];

public type WorklogArr Worklog[];

public type StatusDetailsArr StatusDetails[];

public type StatusCategoryArr StatusCategory[];

public type ProjectCategoryArr ProjectCategory[];

public type ProjectComponentArr ProjectComponent[];

public type ProjectRoleDetailsArr ProjectRoleDetails[];

public type ProjectRoleArr ProjectRole[];

public type UserMigrationBeanArr UserMigrationBean[];

public type GroupNameArr GroupName[];

public type UserArr User[];

# Client endpoint for Jira Cloud platform API
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://your-domain.atlassian.net") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Create issue
    #
    # + payload - The request payload to create issue.
    # + updateHistory - Whether the project in which the issue is created is added to the user's **Recently viewed** project list, as shown under **Projects** in Jira. When provided, the issue type and request type are added to the user's history for a project. These values are then used to provide defaults on the issue create screen.
    # + return - Returned if the request is successful.
    remote isolated function createIssue(IssueUpdateDetails payload, boolean? updateHistory = false) returns CreatedIssue|error {
        string  path = string `/rest/api/2/issue`;
        map<anydata> queryParam = {"updateHistory": updateHistory};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedIssue response = check self.clientEp->post(path, request, targetType=CreatedIssue);
        return response;
    }
    # Bulk create issue
    #
    # + payload - The request payload to bulk create issue.
    # + return - Returned if any of the issue or subtask creation requests were successful. A request may be unsuccessful when it:
    remote isolated function createIssues(IssuesUpdateBean payload) returns CreatedIssues|error {
        string  path = string `/rest/api/2/issue/bulk`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreatedIssues response = check self.clientEp->post(path, request, targetType=CreatedIssues);
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
        string  path = string `/rest/api/2/issue/createmeta`;
        map<anydata> queryParam = {"projectIds": projectIds, "projectKeys": projectKeys, "issuetypeIds": issuetypeIds, "issuetypeNames": issuetypeNames, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        IssueCreateMetadata response = check self.clientEp-> get(path, targetType = IssueCreateMetadata);
        return response;
    }
    # Get issue
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + fields - A list of fields to return for the issue. This parameter accepts a comma-separated list. Use it to retrieve a subset of fields. Allowed values:
    # + fieldsByKeys - Whether fields in `fields` are referenced by keys rather than IDs. This parameter is useful where fields have been added by a connect app and a field's key may differ from its ID.
    # + expand - Use [expand](#expansion) to include additional information about the issues in the response. This parameter accepts a comma-separated list. Expand options include:
    # + properties - A list of issue properties to return for the issue. This parameter accepts a comma-separated list. Allowed values:
    # + updateHistory - Whether the project in which the issue is created is added to the user's **Recently viewed** project list, as shown under **Projects** in Jira. This also populates the [JQL issues search](#api-rest-api-2-search-get) `lastViewed` field.
    # + return - Returned if the request is successful.
    remote isolated function getIssue(string issueIdOrKey, string[]? fields = (), boolean? fieldsByKeys = false, string? expand = (), string[]? properties = (), boolean? updateHistory = false) returns IssueBean|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}`;
        map<anydata> queryParam = {"fields": fields, "fieldsByKeys": fieldsByKeys, "expand": expand, "properties": properties, "updateHistory": updateHistory};
        path = path + check getPathForQueryParam(queryParam);
        IssueBean response = check self.clientEp-> get(path, targetType = IssueBean);
        return response;
    }
    # Edit issue
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + payload - The request payload to edit issue.
    # + notifyUsers - Whether a notification email about the issue update is sent to all watchers. To disable the notification, administer Jira or administer project permissions are required. If the user doesn't have the necessary permission the request is ignored.
    # + overrideScreenSecurity - Whether screen security should be overridden to enable hidden fields to be edited. Available to Connect app users with admin permissions.
    # + overrideEditableFlag - Whether screen security should be overridden to enable uneditable fields to be edited. Available to Connect app users with admin permissions.
    # + return - Returned if the request is successful.
    remote isolated function editIssue(string issueIdOrKey, IssueUpdateDetails payload, boolean? notifyUsers = true, boolean? overrideScreenSecurity = false, boolean? overrideEditableFlag = false) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "overrideScreenSecurity": overrideScreenSecurity, "overrideEditableFlag": overrideEditableFlag};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete issue
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + deleteSubtasks - Whether the issue's subtasks are deleted when the issue is deleted.
    # + return - Returned if the request is successful.
    remote isolated function deleteIssue(string issueIdOrKey, string? deleteSubtasks = "false") returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}`;
        map<anydata> queryParam = {"deleteSubtasks": deleteSubtasks};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Assign issue
    #
    # + issueIdOrKey - The ID or key of the issue to be assigned.
    # + payload - The request object with the user that the issue is assigned to.
    # + return - Returned if the request is successful.
    remote isolated function assignIssue(string issueIdOrKey, User payload) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/assignee`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get change logs
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getChangeLogs(string issueIdOrKey, int? startAt = 0, int? maxResults = 100) returns PageBeanChangelog|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/changelog`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanChangelog response = check self.clientEp-> get(path, targetType = PageBeanChangelog);
        return response;
    }
    # Get changelogs by IDs
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + payload - The request payload to get changelogs by IDs.
    # + return - Returned if the request is successful.
    remote isolated function getChangeLogsByIds(string issueIdOrKey, IssueChangelogIds payload) returns PageOfChangelogs|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/changelog/list`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PageOfChangelogs response = check self.clientEp->post(path, request, targetType=PageOfChangelogs);
        return response;
    }
    # Get edit issue metadata
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + overrideScreenSecurity - Whether hidden fields should be returned. Available to connect app users with admin permissions.
    # + overrideEditableFlag - Whether non-editable fields should be returned. Available to connect app users with admin permissions.
    # + return - Returned if the request is successful.
    remote isolated function getEditIssueMeta(string issueIdOrKey, boolean? overrideScreenSecurity = false, boolean? overrideEditableFlag = false) returns IssueUpdateMetadata|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/editmeta`;
        map<anydata> queryParam = {"overrideScreenSecurity": overrideScreenSecurity, "overrideEditableFlag": overrideEditableFlag};
        path = path + check getPathForQueryParam(queryParam);
        IssueUpdateMetadata response = check self.clientEp-> get(path, targetType = IssueUpdateMetadata);
        return response;
    }
    # Send notification for issue
    #
    # + issueIdOrKey - ID or key of the issue that the notification is sent for.
    # + payload - The request object for the notification and recipients.
    # + return - Returned if the email is queued for sending.
    remote isolated function notify(string issueIdOrKey, Notification payload) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/notify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
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
    remote isolated function getTransitions(string issueIdOrKey, string? expand = (), string? transitionId = (), boolean? skipRemoteOnlyCondition = false, boolean? includeUnavailableTransitions = false, boolean? sortByOpsBarAndStatus = false) returns Transitions|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/transitions`;
        map<anydata> queryParam = {"expand": expand, "transitionId": transitionId, "skipRemoteOnlyCondition": skipRemoteOnlyCondition, "includeUnavailableTransitions": includeUnavailableTransitions, "sortByOpsBarAndStatus": sortByOpsBarAndStatus};
        path = path + check getPathForQueryParam(queryParam);
        Transitions response = check self.clientEp-> get(path, targetType = Transitions);
        return response;
    }
    # Transition issue
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + payload - The request payload to update the fields from the transition screen.
    # + return - Returned if the request is successful.
    remote isolated function doTransition(string issueIdOrKey, IssueUpdateDetails payload) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/transitions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Bulk set issues properties
    #
    # + payload - Issue properties to be set or updated with values.
    # + return - Returned if the operation is successful.
    remote isolated function bulkSetIssuesProperties(IssueEntityProperties payload) returns error? {
        string  path = string `/rest/api/2/issue/properties`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
    }
    # Bulk set issue property
    #
    # + propertyKey - The key of the property. The maximum length is 255 characters.
    # + payload - The request payload to bulk set issue property.
    # + return - Returned if the request is successful.
    remote isolated function bulkSetIssueProperty(string propertyKey, BulkIssuePropertyUpdateRequest payload) returns error? {
        string  path = string `/rest/api/2/issue/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> put(path, request, targetType=http:Response);
    }
    # Bulk delete issue property
    #
    # + propertyKey - The key of the property.
    # + payload - The request payload to bulk delete issue property.
    # + return - Returned if the request is successful.
    remote isolated function bulkDeleteIssueProperty(string propertyKey, IssueFilterForBulkPropertyDelete payload) returns error? {
        string  path = string `/rest/api/2/issue/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> delete(path, request, targetType=http:Response);
    }
    # Get issue property keys
    #
    # + issueIdOrKey - The key or ID of the issue.
    # + return - Returned if the request is successful.
    remote isolated function getIssuePropertyKeys(string issueIdOrKey) returns PropertyKeys|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/properties`;
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get issue property
    #
    # + issueIdOrKey - The key or ID of the issue.
    # + propertyKey - The key of the property.
    # + return - Returned if the request is successful.
    remote isolated function getIssueProperty(string issueIdOrKey, string propertyKey) returns EntityProperty|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/properties/${propertyKey}`;
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
        return response;
    }
    # Set issue property
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + propertyKey - The key of the issue property. The maximum length is 255 characters.
    # + payload - The request payload to set issue property.
    # + return - Returned if the issue property is updated.
    remote isolated function setIssueProperty(string issueIdOrKey, string propertyKey, json payload) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete issue property
    #
    # + issueIdOrKey - The key or ID of the issue.
    # + propertyKey - The key of the property.
    # + return - Returned if the request is successful.
    remote isolated function deleteIssueProperty(string issueIdOrKey, string propertyKey) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/properties/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get Jira attachment settings
    #
    # + return - Returned if the request is successful.
    remote isolated function getAttachmentMeta() returns AttachmentSettings|error {
        string  path = string `/rest/api/2/attachment/meta`;
        AttachmentSettings response = check self.clientEp-> get(path, targetType = AttachmentSettings);
        return response;
    }
    # Get attachment metadata
    #
    # + id - The ID of the attachment.
    # + return - Returned if the request is successful.
    remote isolated function getAttachment(string id) returns AttachmentMetadata|error {
        string  path = string `/rest/api/2/attachment/${id}`;
        AttachmentMetadata response = check self.clientEp-> get(path, targetType = AttachmentMetadata);
        return response;
    }
    # Delete attachment
    #
    # + id - The ID of the attachment.
    # + return - Returned if the request is successful.
    remote isolated function removeAttachment(string id) returns error? {
        string  path = string `/rest/api/2/attachment/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get all metadata for an expanded attachment
    #
    # + id - The ID of the attachment.
    # + return - Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    remote isolated function expandAttachmentForHumans(string id) returns AttachmentArchiveMetadataReadable|error {
        string  path = string `/rest/api/2/attachment/${id}/expand/human`;
        AttachmentArchiveMetadataReadable response = check self.clientEp-> get(path, targetType = AttachmentArchiveMetadataReadable);
        return response;
    }
    # Get contents metadata for an expanded attachment
    #
    # + id - The ID of the attachment.
    # + return - Returned if the request is successful. If an empty list is returned in the response, the attachment is empty, corrupt, or not an archive.
    remote isolated function expandAttachmentForMachines(string id) returns AttachmentArchiveImpl|error {
        string  path = string `/rest/api/2/attachment/${id}/expand/raw`;
        AttachmentArchiveImpl response = check self.clientEp-> get(path, targetType = AttachmentArchiveImpl);
        return response;
    }
    # Add attachment
    #
    # + issueIdOrKey - The ID or key of the issue that attachments are added to.
    # + payload - The request payload to add attachment.
    # + return - Returned if the request is successful.
    remote isolated function addAttachment(string issueIdOrKey, string payload) returns AttachmentArr|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/attachments`;
        http:Request request = new;
        AttachmentArr response = check self.clientEp->post(path, request, targetType=AttachmentArr);
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
    remote isolated function getAllFieldConfigurations(int? startAt = 0, int? maxResults = 50, int[]? id = (), boolean? isDefault = false, string? query = "") returns PageBeanFieldConfiguration|error {
        string  path = string `/rest/api/2/fieldconfiguration`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "id": id, "isDefault": isDefault, "query": query};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanFieldConfiguration response = check self.clientEp-> get(path, targetType = PageBeanFieldConfiguration);
        return response;
    }
    # Get field configuration items
    #
    # + id - The ID of the field configuration.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getFieldConfigurationItems(int id, int? startAt = 0, int? maxResults = 50) returns PageBeanFieldConfigurationItem|error {
        string  path = string `/rest/api/2/fieldconfiguration/${id}/fields`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanFieldConfigurationItem response = check self.clientEp-> get(path, targetType = PageBeanFieldConfigurationItem);
        return response;
    }
    # Get all field configuration schemes
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + id - The list of field configuration scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
    # + return - Returned if the request is successful.
    remote isolated function getAllFieldConfigurationSchemes(int? startAt = 0, int? maxResults = 50, int[]? id = ()) returns PageBeanFieldConfigurationScheme|error {
        string  path = string `/rest/api/2/fieldconfigurationscheme`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "id": id};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanFieldConfigurationScheme response = check self.clientEp-> get(path, targetType = PageBeanFieldConfigurationScheme);
        return response;
    }
    # Get field configuration issue type items
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + fieldConfigurationSchemeId - The list of field configuration scheme IDs. To include multiple field configuration schemes separate IDs with ampersand: `fieldConfigurationSchemeId=10000&fieldConfigurationSchemeId=10001`.
    # + return - Returned if the request is successful.
    remote isolated function getFieldConfigurationSchemeMappings(int? startAt = 0, int? maxResults = 50, int[]? fieldConfigurationSchemeId = ()) returns PageBeanFieldConfigurationIssueTypeItem|error {
        string  path = string `/rest/api/2/fieldconfigurationscheme/mapping`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "fieldConfigurationSchemeId": fieldConfigurationSchemeId};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanFieldConfigurationIssueTypeItem response = check self.clientEp-> get(path, targetType = PageBeanFieldConfigurationIssueTypeItem);
        return response;
    }
    # Get field configuration schemes for projects
    #
    # + projectId - The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getFieldConfigurationSchemeProjectMapping(int[] projectId, int? startAt = 0, int? maxResults = 50) returns PageBeanFieldConfigurationSchemeProjects|error {
        string  path = string `/rest/api/2/fieldconfigurationscheme/project`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanFieldConfigurationSchemeProjects response = check self.clientEp-> get(path, targetType = PageBeanFieldConfigurationSchemeProjects);
        return response;
    }
    # Assign field configuration scheme to project
    #
    # + payload - The request payload to assign field configuration scheme to project.
    # + return - Returned if the request is successful.
    remote isolated function assignFieldConfigurationSchemeToProject(FieldConfigurationSchemeProjectAssociation payload) returns json|error {
        string  path = string `/rest/api/2/fieldconfigurationscheme/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
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
    remote isolated function getContextsForField(string fieldId, boolean? isAnyIssueType = (), boolean? isGlobalContext = (), int[]? contextId = (), int? startAt = 0, int? maxResults = 50) returns PageBeanCustomFieldContext|error {
        string  path = string `/rest/api/2/field/${fieldId}/context`;
        map<anydata> queryParam = {"isAnyIssueType": isAnyIssueType, "isGlobalContext": isGlobalContext, "contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanCustomFieldContext response = check self.clientEp-> get(path, targetType = PageBeanCustomFieldContext);
        return response;
    }
    # Create custom field context
    #
    # + fieldId - The ID of the custom field.
    # + payload - The request payload to create a custom field context.
    # + return - Returned if the custom field context is created.
    remote isolated function createCustomFieldContext(string fieldId, CreateCustomFieldContext payload) returns CreateCustomFieldContext|error {
        string  path = string `/rest/api/2/field/${fieldId}/context`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateCustomFieldContext response = check self.clientEp->post(path, request, targetType=CreateCustomFieldContext);
        return response;
    }
    # Get custom field contexts default values
    #
    # + fieldId - The ID of the custom field, for example `customfield\_10000`.
    # + contextId - The IDs of the contexts.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getDefaultValues(string fieldId, int[]? contextId = (), int? startAt = 0, int? maxResults = 50) returns PageBeanCustomFieldContextDefaultValue|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/defaultValue`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanCustomFieldContextDefaultValue response = check self.clientEp-> get(path, targetType = PageBeanCustomFieldContextDefaultValue);
        return response;
    }
    # Set custom field contexts default values
    #
    # + fieldId - The ID of the custom field.
    # + payload - The request payload to set default for contexts of a custom field.
    # + return - Returned if operation is successful.
    remote isolated function setDefaultValues(string fieldId, CustomFieldContextDefaultValueUpdate payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/defaultValue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get issue types for custom field context
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context. To include multiple contexts, provide an ampersand-separated list. For example, `contextId=10001&contextId=10002`.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if operation is successful.
    remote isolated function getIssueTypeMappingsForContexts(string fieldId, int[]? contextId = (), int? startAt = 0, int? maxResults = 50) returns PageBeanIssueTypeToContextMapping|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/issuetypemapping`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanIssueTypeToContextMapping response = check self.clientEp-> get(path, targetType = PageBeanIssueTypeToContextMapping);
        return response;
    }
    # Get custom field contexts for projects and issue types
    #
    # + fieldId - The ID of the custom field.
    # + payload - The list of project and issue type mappings.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getCustomFieldContextsForProjectsAndIssueTypes(string fieldId, ProjectIssueTypeMappings payload, int? startAt = 0, int? maxResults = 50) returns PageBeanContextForProjectAndIssueType|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/mapping`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PageBeanContextForProjectAndIssueType response = check self.clientEp->post(path, request, targetType=PageBeanContextForProjectAndIssueType);
        return response;
    }
    # Get project mappings for custom field context
    #
    # + fieldId - The ID of the custom field, for example `customfield\_10000`.
    # + contextId - The list of context IDs. To include multiple context, separate IDs with ampersand: `contextId=10000&contextId=10001`.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getProjectContextMapping(string fieldId, int[]? contextId = (), int? startAt = 0, int? maxResults = 50) returns PageBeanCustomFieldContextProjectMapping|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/projectmapping`;
        map<anydata> queryParam = {"contextId": contextId, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanCustomFieldContextProjectMapping response = check self.clientEp-> get(path, targetType = PageBeanCustomFieldContextProjectMapping);
        return response;
    }
    # Update custom field context
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to update a custom field context.
    # + return - Returned if the context is updated.
    remote isolated function updateCustomFieldContext(string fieldId, int contextId, CustomFieldContextUpdateDetails payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete custom field context
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + return - Returned if the context is deleted.
    remote isolated function deleteCustomFieldContext(string fieldId, int contextId) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, targetType = json);
        return response;
    }
    # Add issue types to context
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to add issue types to a custom field context.
    # + return - Returned if operation is successful.
    remote isolated function addIssueTypesToContext(string fieldId, int contextId, IssueTypeIds payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/issuetype`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Remove issue types from context
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to remove issue types from a custom field context.
    # + return - Returned if operation is successful.
    remote isolated function removeIssueTypesFromContext(string fieldId, int contextId, IssueTypeIds payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/issuetype/remove`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Assign custom field context to projects
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to assign custom field context to projects.
    # + return - Returned if operation is successful.
    remote isolated function assignProjectsToCustomFieldContext(string fieldId, int contextId, ProjectIds payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Remove custom field context from projects
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to remove custom field context from projects.
    # + return - Returned if the custom field context is removed from the projects.
    remote isolated function removeCustomFieldContextFromProjects(string fieldId, int contextId, ProjectIds payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/project/remove`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Get custom field option
    #
    # + id - The ID of the custom field option.
    # + return - Returned if the request is successful.
    remote isolated function getCustomFieldOption(string id) returns CustomFieldOption|error {
        string  path = string `/rest/api/2/customFieldOption/${id}`;
        CustomFieldOption response = check self.clientEp-> get(path, targetType = CustomFieldOption);
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
    remote isolated function getOptionsForContext(string fieldId, int contextId, int? optionId = (), boolean? onlyOptions = false, int? startAt = 0, int? maxResults = 100) returns PageBeanCustomFieldContextOption|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/option`;
        map<anydata> queryParam = {"optionId": optionId, "onlyOptions": onlyOptions, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanCustomFieldContextOption response = check self.clientEp-> get(path, targetType = PageBeanCustomFieldContextOption);
        return response;
    }
    # Update custom field options (context)
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to update issue types to a custom field context.
    # + return - Returned if the request is successful.
    remote isolated function updateCustomFieldOption(string fieldId, int contextId, BulkCustomFieldOptionUpdateRequest payload) returns CustomFieldUpdatedContextOptionsList|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/option`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomFieldUpdatedContextOptionsList response = check self.clientEp->put(path, request, targetType=CustomFieldUpdatedContextOptionsList);
        return response;
    }
    # Create custom field options (context)
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payolad to create custom field options (context).
    # + return - Returned if the request is successful.
    remote isolated function createCustomFieldOption(string fieldId, int contextId, BulkCustomFieldOptionCreateRequest payload) returns CustomFieldCreatedContextOptionsList|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/option`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CustomFieldCreatedContextOptionsList response = check self.clientEp->post(path, request, targetType=CustomFieldCreatedContextOptionsList);
        return response;
    }
    # Reorder custom field options (context)
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context.
    # + payload - The request payload to reorder custom field options (context).
    # + return - Returned if options are reordered.
    remote isolated function reorderCustomFieldOptions(string fieldId, int contextId, OrderOfCustomFieldOptions payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/option/move`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete custom field options (context)
    #
    # + fieldId - The ID of the custom field.
    # + contextId - The ID of the context from which an option should be deleted.
    # + optionId - The ID of the option to delete.
    # + return - Returned if the option is deleted.
    remote isolated function deleteCustomFieldOption(string fieldId, int contextId, int optionId) returns error? {
        string  path = string `/rest/api/2/field/${fieldId}/context/${contextId}/option/${optionId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get issue link types
    #
    # + return - Returned if the request is successful.
    remote isolated function getIssueLinkTypes() returns IssueLinkTypes|error {
        string  path = string `/rest/api/2/issueLinkType`;
        IssueLinkTypes response = check self.clientEp-> get(path, targetType = IssueLinkTypes);
        return response;
    }
    # Create issue link type
    #
    # + payload - The request payload to create issue link type.
    # + return - Returned if the request is successful.
    remote isolated function createIssueLinkType(IssueLinkType payload) returns IssueLinkType|error {
        string  path = string `/rest/api/2/issueLinkType`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueLinkType response = check self.clientEp->post(path, request, targetType=IssueLinkType);
        return response;
    }
    # Get issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type.
    # + return - Returned if the request is successful.
    remote isolated function getIssueLinkType(string issueLinkTypeId) returns IssueLinkType|error {
        string  path = string `/rest/api/2/issueLinkType/${issueLinkTypeId}`;
        IssueLinkType response = check self.clientEp-> get(path, targetType = IssueLinkType);
        return response;
    }
    # Update issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type.
    # + payload - The request payload to update issue link type.
    # + return - Returned if the request is successful.
    remote isolated function updateIssueLinkType(string issueLinkTypeId, IssueLinkType payload) returns IssueLinkType|error {
        string  path = string `/rest/api/2/issueLinkType/${issueLinkTypeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueLinkType response = check self.clientEp->put(path, request, targetType=IssueLinkType);
        return response;
    }
    # Delete issue link type
    #
    # + issueLinkTypeId - The ID of the issue link type.
    # + return - Returned if the request is successful.
    remote isolated function deleteIssueLinkType(string issueLinkTypeId) returns error? {
        string  path = string `/rest/api/2/issueLinkType/${issueLinkTypeId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get issue navigator default columns
    #
    # + return - Returned if the request is successful.
    remote isolated function getIssueNavigatorDefaultColumns() returns ColumnItemArr|error {
        string  path = string `/rest/api/2/settings/columns`;
        ColumnItemArr response = check self.clientEp-> get(path, targetType = ColumnItemArr);
        return response;
    }
    # Set issue navigator default columns
    #
    # + payload - A navigable field value.
    # + return - Returned if the request is successful.
    remote isolated function setIssueNavigatorDefaultColumns(string[] payload) returns json|error {
        string  path = string `/rest/api/2/settings/columns`;
        http:Request request = new;
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get remote issue links
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + globalId - The global ID of the remote issue link.
    # + return - Returned if the request is successful.
    remote isolated function getRemoteIssueLinks(string issueIdOrKey, string? globalId = ()) returns RemoteIssueLink|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink`;
        map<anydata> queryParam = {"globalId": globalId};
        path = path + check getPathForQueryParam(queryParam);
        RemoteIssueLink response = check self.clientEp-> get(path, targetType = RemoteIssueLink);
        return response;
    }
    # Create or update remote issue link
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + payload - The request payload to create or update remote issue link.
    # + return - Returned if the remote issue link is updated.
    remote isolated function createOrUpdateRemoteIssueLink(string issueIdOrKey, RemoteIssueLinkRequest payload) returns RemoteIssueLinkIdentifies|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteIssueLinkIdentifies response = check self.clientEp->post(path, request, targetType=RemoteIssueLinkIdentifies);
        return response;
    }
    # Delete remote issue link by global ID
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + globalId - The global ID of a remote issue link.
    # + return - Returned if the request is successful.
    remote isolated function deleteRemoteIssueLinkByGlobalId(string issueIdOrKey, string globalId) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink`;
        map<anydata> queryParam = {"globalId": globalId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + linkId - The ID of the remote issue link.
    # + return - Returned if the request is successful.
    remote isolated function getRemoteIssueLinkById(string issueIdOrKey, string linkId) returns RemoteIssueLink|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink/${linkId}`;
        RemoteIssueLink response = check self.clientEp-> get(path, targetType = RemoteIssueLink);
        return response;
    }
    # Update remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + linkId - The ID of the remote issue link.
    # + payload - The request payload to update remote issue link by ID.
    # + return - Returned if the request is successful.
    remote isolated function updateRemoteIssueLink(string issueIdOrKey, string linkId, RemoteIssueLinkRequest payload) returns json|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink/${linkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete remote issue link by ID
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + linkId - The ID of a remote issue link.
    # + return - Returned if the request is successful.
    remote isolated function deleteRemoteIssueLinkById(string issueIdOrKey, string linkId) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/remotelink/${linkId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get resolutions
    #
    # + return - Returned if the request is successful.
    remote isolated function getResolutions() returns ResolutionArr|error {
        string  path = string `/rest/api/2/resolution`;
        ResolutionArr response = check self.clientEp-> get(path, targetType = ResolutionArr);
        return response;
    }
    # Get resolution
    #
    # + id - The ID of the issue resolution value.
    # + return - Returned if the request is successful.
    remote isolated function getResolution(string id) returns Resolution|error {
        string  path = string `/rest/api/2/resolution/${id}`;
        Resolution response = check self.clientEp-> get(path, targetType = Resolution);
        return response;
    }
    # Get all issue types for user
    #
    # + return - Returned if the request is successful.
    remote isolated function getIssueAllTypes() returns IssueTypeDetailsArr|error {
        string  path = string `/rest/api/2/issuetype`;
        IssueTypeDetailsArr response = check self.clientEp-> get(path, targetType = IssueTypeDetailsArr);
        return response;
    }
    # Create issue type
    #
    # + payload - The request payload to create issue type.
    # + return - Returned if the request is successful.
    remote isolated function createIssueType(IssueTypeCreateBean payload) returns IssueTypeDetails|error {
        string  path = string `/rest/api/2/issuetype`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueTypeDetails response = check self.clientEp->post(path, request, targetType=IssueTypeDetails);
        return response;
    }
    # Get issue types for project
    #
    # + projectId - The ID of the project.
    # + level - The level of the issue type to filter by. Use:
    # + return - Returned if the request is successful.
    remote isolated function getIssueTypesForProject(int projectId, int? level = ()) returns IssueTypeDetailsArr|error {
        string  path = string `/rest/api/2/issuetype/project`;
        map<anydata> queryParam = {"projectId": projectId, "level": level};
        path = path + check getPathForQueryParam(queryParam);
        IssueTypeDetailsArr response = check self.clientEp-> get(path, targetType = IssueTypeDetailsArr);
        return response;
    }
    # Get issue type
    #
    # + id - The ID of the issue type.
    # + return - Returned if the request is successful.
    remote isolated function getIssueType(string id) returns IssueTypeDetails|error {
        string  path = string `/rest/api/2/issuetype/${id}`;
        IssueTypeDetails response = check self.clientEp-> get(path, targetType = IssueTypeDetails);
        return response;
    }
    # Update issue type
    #
    # + id - The ID of the issue type.
    # + payload - The request payload to update issue type.
    # + return - Returned if the request is successful.
    remote isolated function updateIssueType(string id, IssueTypeUpdateBean payload) returns IssueTypeDetails|error {
        string  path = string `/rest/api/2/issuetype/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueTypeDetails response = check self.clientEp->put(path, request, targetType=IssueTypeDetails);
        return response;
    }
    # Delete issue type
    #
    # + id - The ID of the issue type.
    # + alternativeIssueTypeId - The ID of the replacement issue type.
    # + return - Returned if the request is successful.
    remote isolated function deleteIssueType(string id, string? alternativeIssueTypeId = ()) returns error? {
        string  path = string `/rest/api/2/issuetype/${id}`;
        map<anydata> queryParam = {"alternativeIssueTypeId": alternativeIssueTypeId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get alternative issue types
    #
    # + id - The ID of the issue type.
    # + return - Returned if the request is successful.
    remote isolated function getAlternativeIssueTypes(string id) returns IssueTypeDetailsArr|error {
        string  path = string `/rest/api/2/issuetype/${id}/alternatives`;
        IssueTypeDetailsArr response = check self.clientEp-> get(path, targetType = IssueTypeDetailsArr);
        return response;
    }
    # Load issue type avatar
    #
    # + id - The ID of the issue type.
    # + size - The length of each side of the crop region.
    # + payload - The request payload to load issue type avatar.
    # + x - The X coordinate of the top-left corner of the crop region.
    # + y - The Y coordinate of the top-left corner of the crop region.
    # + return - Returned if the request is successful.
    remote isolated function createIssueTypeAvatar(string id, int size, json payload, int? x = 0, int? y = 0) returns Avatar|error {
        string  path = string `/rest/api/2/issuetype/${id}/avatar2`;
        map<anydata> queryParam = {"x": x, "y": y, "size": size};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        Avatar response = check self.clientEp->post(path, request, targetType=Avatar);
        return response;
    }
    # Get issue type property keys
    #
    # + issueTypeId - The ID of the issue type.
    # + return - Returned if the request is successful.
    remote isolated function getIssueTypePropertyKeys(string issueTypeId) returns PropertyKeys|error {
        string  path = string `/rest/api/2/issuetype/${issueTypeId}/properties`;
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get issue type property
    #
    # + issueTypeId - The ID of the issue type.
    # + propertyKey - The key of the property. Use [Get issue type property keys](#api-rest-api-2-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
    # + return - Returned if the request is successful.
    remote isolated function getIssueTypeProperty(string issueTypeId, string propertyKey) returns EntityProperty|error {
        string  path = string `/rest/api/2/issuetype/${issueTypeId}/properties/${propertyKey}`;
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
        return response;
    }
    # Set issue type property
    #
    # + issueTypeId - The ID of the issue type.
    # + propertyKey - The key of the issue type property. The maximum length is 255 characters.
    # + payload - The request payload to set issue type property.
    # + return - Returned if the issue type property is updated.
    remote isolated function setIssueTypeProperty(string issueTypeId, string propertyKey, json payload) returns json|error {
        string  path = string `/rest/api/2/issuetype/${issueTypeId}/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete issue type property
    #
    # + issueTypeId - The ID of the issue type.
    # + propertyKey - The key of the property. Use [Get issue type property keys](#api-rest-api-2-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
    # + return - Returned if the issue type property is deleted.
    remote isolated function deleteIssueTypeProperty(string issueTypeId, string propertyKey) returns error? {
        string  path = string `/rest/api/2/issuetype/${issueTypeId}/properties/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get field reference data (GET)
    #
    # + return - Returned if the request is successful.
    remote isolated function getAutoComplete() returns JQLReferenceData|error {
        string  path = string `/rest/api/2/jql/autocompletedata`;
        JQLReferenceData response = check self.clientEp-> get(path, targetType = JQLReferenceData);
        return response;
    }
    # Get field reference data (POST)
    #
    # + payload - The request payload to get field reference data.
    # + return - Returned if the request is successful.
    remote isolated function getAutoCompletePost(SearchAutoCompleteFilter payload) returns JQLReferenceData|error {
        string  path = string `/rest/api/2/jql/autocompletedata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        JQLReferenceData response = check self.clientEp->post(path, request, targetType=JQLReferenceData);
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
        string  path = string `/rest/api/2/jql/autocompletedata/suggestions`;
        map<anydata> queryParam = {"fieldName": fieldName, "fieldValue": fieldValue, "predicateName": predicateName, "predicateValue": predicateValue};
        path = path + check getPathForQueryParam(queryParam);
        AutoCompleteSuggestions response = check self.clientEp-> get(path, targetType = AutoCompleteSuggestions);
        return response;
    }
    # Parse JQL query
    #
    # + payload - The request payload to parse JQL query.
    # + validation - How to validate the JQL query and treat the validation results. Validation options include:
    # + return - Returned if the request is successful.
    remote isolated function parseJqlQueries(JqlQueriesToParse payload, string? validation = "strict") returns ParsedJqlQueries|error {
        string  path = string `/rest/api/2/jql/parse`;
        map<anydata> queryParam = {"validation": validation};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ParsedJqlQueries response = check self.clientEp->post(path, request, targetType=ParsedJqlQueries);
        return response;
    }
    # Convert user identifiers to account IDs in JQL queries
    #
    # + payload - The request payload to convert user identifiers to account IDs in JQL queries.
    # + return - Returned if the request is successful. Note that the JQL queries are returned in the same order that they were passed.
    remote isolated function migrateQueries(JQLPersonalDataMigrationRequest payload) returns ConvertedJQLQueries|error {
        string  path = string `/rest/api/2/jql/pdcleaner`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ConvertedJQLQueries response = check self.clientEp->post(path, request, targetType=ConvertedJQLQueries);
        return response;
    }
    # Get all projects
    #
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:
    # + recent - Returns the user's most recently accessed projects. You may specify the number of results to return up to a maximum of 20. If access is anonymous, then the recently accessed projects are based on the current HTTP session.
    # + properties - A list of project properties to return for the project. This parameter accepts a comma-separated list.
    # + return - Returned if the request is successful.
    remote isolated function getAllProjects(string? expand = (), int? recent = (), string[]? properties = ()) returns ProjectArr|error {
        string  path = string `/rest/api/2/project`;
        map<anydata> queryParam = {"expand": expand, "recent": recent, "properties": properties};
        path = path + check getPathForQueryParam(queryParam);
        ProjectArr response = check self.clientEp-> get(path, targetType = ProjectArr);
        return response;
    }
    # Create project
    #
    # + payload - The JSON representation of the project being created.
    # + return - Returned if the project is created.
    remote isolated function createProject(CreateProjectDetails payload) returns ProjectIdentifiers|error {
        string  path = string `/rest/api/2/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectIdentifiers response = check self.clientEp->post(path, request, targetType=ProjectIdentifiers);
        return response;
    }
    # Get projects paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + orderBy - [Order](#ordering) the results by a field.
    # + id - The project IDs to filter the results by. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Up to 50 project IDs can be provided.
    # + query - Filter the results using a literal string. Projects with a matching `key` or `name` are returned (case insensitive).
    # + typeKey - Orders results by the [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes). This parameter accepts a comma-separated list. Valid values are `business`, `service_desk`, and `software`.
    # + categoryId - The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-2-projectCategory-get) operation.
    # + action - Filter results by projects for which the user can:
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:
    # + status - EXPERIMENTAL. Filter results by project status:
    # + properties - EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list.
    # + propertyQuery - EXPERIMENTAL. A query string used to search properties. The query string cannot be specified using a JSON object. For example, to search for the value of `nested` from `{"something":{"nested":1,"other":2}}` use `[thepropertykey].something.nested=1`. Note that the propertyQuery key is enclosed in square brackets to enable searching where the propertyQuery key includes dot (.) or equals (=) characters.
    # + return - Returned if the request is successful.
    remote isolated function searchProjects(int? startAt = 0, int? maxResults = 50, string? orderBy = "key", int[]? id = (), string? query = (), string? typeKey = (), int? categoryId = (), string? action = "view", string? expand = (), string[]? status = (), StringList[]? properties = (), string? propertyQuery = ()) returns PageBeanProject|error {
        string  path = string `/rest/api/2/project/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "id": id, "query": query, "typeKey": typeKey, "categoryId": categoryId, "action": action, "expand": expand, "status": status, "properties": properties, "propertyQuery": propertyQuery};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanProject response = check self.clientEp-> get(path, targetType = PageBeanProject);
        return response;
    }
    # Get project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:
    # + properties - A list of project properties to return for the project. This parameter accepts a comma-separated list.
    # + return - Returned if successful.
    remote isolated function getProject(string projectIdOrKey, string? expand = (), string[]? properties = ()) returns Project|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}`;
        map<anydata> queryParam = {"expand": expand, "properties": properties};
        path = path + check getPathForQueryParam(queryParam);
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Update project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + payload - The project details to be updated.
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:
    # + return - Returned if the project is updated.
    remote isolated function updateProject(string projectIdOrKey, UpdateProjectDetails payload, string? expand = ()) returns Project|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->put(path, request, targetType=Project);
        return response;
    }
    # Delete project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + enableUndo - Whether this project is placed in the Jira recycle bin where it will be available for restoration.
    # + return - Returned if the project is deleted.
    remote isolated function deleteProject(string projectIdOrKey, boolean? enableUndo = false) returns error? {
        string  path = string `/rest/api/2/project/${projectIdOrKey}`;
        map<anydata> queryParam = {"enableUndo": enableUndo};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Archive project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function archiveProject(string projectIdOrKey) returns json|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    # Delete project asynchronously
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function deleteProjectAsynchronously(string projectIdOrKey) returns TaskProgressBeanObject|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/delete`;
        http:Request request = new;
        //TODO: Update the request as needed;
        TaskProgressBeanObject response = check self.clientEp-> post(path, request, targetType = TaskProgressBeanObject);
        return response;
    }
    # Restore deleted project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function restore(string projectIdOrKey) returns Project|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/restore`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Project response = check self.clientEp-> post(path, request, targetType = Project);
        return response;
    }
    # Get all statuses for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getAllStatuses(string projectIdOrKey) returns IssueTypeWithStatusArr|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/statuses`;
        IssueTypeWithStatusArr response = check self.clientEp-> get(path, targetType = IssueTypeWithStatusArr);
        return response;
    }
    # Update project type
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + newProjectTypeKey - The key of the new project type.
    # + return - Returned if the project type is updated.
    remote isolated function updateProjectType(string projectIdOrKey, string newProjectTypeKey) returns Project|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/type/${newProjectTypeKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Project response = check self.clientEp-> put(path, request, targetType = Project);
        return response;
    }
    # Get project issue type hierarchy
    #
    # + projectId - The ID of the project.
    # + return - Returned if the request is successful.
    remote isolated function getHierarchy(int projectId) returns ProjectIssueTypeHierarchy|error {
        string  path = string `/rest/api/2/project/${projectId}/hierarchy`;
        ProjectIssueTypeHierarchy response = check self.clientEp-> get(path, targetType = ProjectIssueTypeHierarchy);
        return response;
    }
    # Get project notification scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive).
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getNotificationSchemeForProject(string projectKeyOrId, string? expand = ()) returns NotificationScheme|error {
        string  path = string `/rest/api/2/project/${projectKeyOrId}/notificationscheme`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        NotificationScheme response = check self.clientEp-> get(path, targetType = NotificationScheme);
        return response;
    }
    # Get all project types
    #
    # + return - Returned if the request is successful.
    remote isolated function getAllProjectTypes() returns ProjectTypeArr|error {
        string  path = string `/rest/api/2/project/type`;
        ProjectTypeArr response = check self.clientEp-> get(path, targetType = ProjectTypeArr);
        return response;
    }
    # Get licensed project types
    #
    # + return - Returned if the request is successful.
    remote isolated function getAllAccessibleProjectTypes() returns ProjectTypeArr|error {
        string  path = string `/rest/api/2/project/type/accessible`;
        ProjectTypeArr response = check self.clientEp-> get(path, targetType = ProjectTypeArr);
        return response;
    }
    # Get project type by key
    #
    # + projectTypeKey - The key of the project type.
    # + return - Returned if the request is successful.
    remote isolated function getProjectTypeByKey(string projectTypeKey) returns ProjectType|error {
        string  path = string `/rest/api/2/project/type/${projectTypeKey}`;
        ProjectType response = check self.clientEp-> get(path, targetType = ProjectType);
        return response;
    }
    # Get accessible project type by key
    #
    # + projectTypeKey - The key of the project type.
    # + return - Returned if the request is successful.
    remote isolated function getAccessibleProjectTypeByKey(string projectTypeKey) returns ProjectType|error {
        string  path = string `/rest/api/2/project/type/${projectTypeKey}/accessible`;
        ProjectType response = check self.clientEp-> get(path, targetType = ProjectType);
        return response;
    }
    # Get project versions paginated
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + orderBy - [Order](#ordering) the results by a field:
    # + query - Filter the results using a literal string. Versions with matching `name` or `description` are returned (case insensitive).
    # + status - A list of status values used to filter the results by version status. This parameter accepts a comma-separated list. The status values are `released`, `unreleased`, and `archived`.
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getProjectVersionsPaginated(string projectIdOrKey, int? startAt = 0, int? maxResults = 50, string? orderBy = (), string? query = (), string? status = (), string? expand = ()) returns PageBeanVersion|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/version`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "query": query, "status": status, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanVersion response = check self.clientEp-> get(path, targetType = PageBeanVersion);
        return response;
    }
    # Get project versions
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts `operations`, which returns actions that can be performed on the version.
    # + return - Returned if the request is successful.
    remote isolated function getProjectVersions(string projectIdOrKey, string? expand = ()) returns VersionArr|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/versions`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        VersionArr response = check self.clientEp-> get(path, targetType = VersionArr);
        return response;
    }
    # Get project's sender email
    #
    # + projectId - The project ID.
    # + return - Returned if the request is successful.
    remote isolated function getProjectEmail(int projectId) returns ProjectEmailAddress|error {
        string  path = string `/rest/api/2/project/${projectId}/email`;
        ProjectEmailAddress response = check self.clientEp-> get(path, targetType = ProjectEmailAddress);
        return response;
    }
    # Set project's sender email
    #
    # + projectId - The project ID.
    # + payload - The project's sender email address to be set.
    # + return - Returned if the project's sender email address is successfully set.
    remote isolated function updateProjectEmail(int projectId, ProjectEmailAddress payload) returns json|error {
        string  path = string `/rest/api/2/project/${projectId}/email`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get project issue security scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getProjectIssueSecurityScheme(string projectKeyOrId) returns SecurityScheme|error {
        string  path = string `/rest/api/2/project/${projectKeyOrId}/issuesecuritylevelscheme`;
        SecurityScheme response = check self.clientEp-> get(path, targetType = SecurityScheme);
        return response;
    }
    # Get assigned permission scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive).
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getAssignedPermissionScheme(string projectKeyOrId, string? expand = ()) returns PermissionScheme|error {
        string  path = string `/rest/api/2/project/${projectKeyOrId}/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PermissionScheme response = check self.clientEp-> get(path, targetType = PermissionScheme);
        return response;
    }
    # Assign permission scheme
    #
    # + projectKeyOrId - The project ID or project key (case sensitive).
    # + payload - The request payload to assign permission scheme.
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function assignPermissionScheme(string projectKeyOrId, IdBean payload, string? expand = ()) returns PermissionScheme|error {
        string  path = string `/rest/api/2/project/${projectKeyOrId}/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermissionScheme response = check self.clientEp->put(path, request, targetType=PermissionScheme);
        return response;
    }
    # Get project issue security levels
    #
    # + projectKeyOrId - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getSecurityLevelsForProject(string projectKeyOrId) returns ProjectIssueSecurityLevels|error {
        string  path = string `/rest/api/2/project/${projectKeyOrId}/securitylevel`;
        ProjectIssueSecurityLevels response = check self.clientEp-> get(path, targetType = ProjectIssueSecurityLevels);
        return response;
    }
    # Get all workflows
    #
    # + workflowName - The name of the workflow to be returned. Only one workflow can be specified.
    # + return - Returned if the request is successful.
    remote isolated function getAllWorkflows(string? workflowName = ()) returns DeprecatedWorkflowArr|error {
        string  path = string `/rest/api/2/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        path = path + check getPathForQueryParam(queryParam);
        DeprecatedWorkflowArr response = check self.clientEp-> get(path, targetType = DeprecatedWorkflowArr);
        return response;
    }
    # Create workflow
    #
    # + payload - The workflow details.
    # + return - Returned if the workflow is created.
    remote isolated function createWorkflow(CreateWorkflowDetails payload) returns WorkflowIDs|error {
        string  path = string `/rest/api/2/workflow`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowIDs response = check self.clientEp->post(path, request, targetType=WorkflowIDs);
        return response;
    }
    # Get workflows paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + workflowName - The name of a workflow to return.
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowsPaginated(int? startAt = 0, int? maxResults = 50, string[]? workflowName = (), string? expand = ()) returns PageBeanWorkflow|error {
        string  path = string `/rest/api/2/workflow/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "workflowName": workflowName, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanWorkflow response = check self.clientEp-> get(path, targetType = PageBeanWorkflow);
        return response;
    }
    # Delete inactive workflow
    #
    # + entityId - The entity ID of the workflow.
    # + return - Returned if the workflow is deleted.
    remote isolated function deleteInactiveWorkflow(string entityId) returns error? {
        string  path = string `/rest/api/2/workflow/${entityId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get comments by IDs
    #
    # + payload - The list of comment IDs.
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getCommentsByIds(IssueCommentListRequestBean payload, string? expand = ()) returns PageBeanComment|error {
        string  path = string `/rest/api/2/comment/list`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PageBeanComment response = check self.clientEp->post(path, request, targetType=PageBeanComment);
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
    remote isolated function getComments(string issueIdOrKey, int? startAt = 0, int? maxResults = 50, string? orderBy = (), string? expand = ()) returns PageOfComments|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/comment`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageOfComments response = check self.clientEp-> get(path, targetType = PageOfComments);
        return response;
    }
    # Add comment
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + payload - The request payload to add comment.
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
    # + return - Returned if the request is successful.
    remote isolated function addComment(string issueIdOrKey, Comment payload, string? expand = ()) returns Comment|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/comment`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, targetType=Comment);
        return response;
    }
    # Get comment
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + id - The ID of the comment.
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
    # + return - Returned if the request is successful.
    remote isolated function getComment(string issueIdOrKey, string id, string? expand = ()) returns Comment|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/comment/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Comment response = check self.clientEp-> get(path, targetType = Comment);
        return response;
    }
    # Update comment
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + id - The ID of the comment.
    # + payload - The request payload to update comment.
    # + expand - Use [expand](#expansion) to include additional information about comments in the response. This parameter accepts `renderedBody`, which returns the comment body rendered in HTML.
    # + return - Returned if the request is successful.
    remote isolated function updateComment(string issueIdOrKey, string id, Comment payload, string? expand = ()) returns Comment|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/comment/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->put(path, request, targetType=Comment);
        return response;
    }
    # Delete comment
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + id - The ID of the comment.
    # + return - Returned if the request is successful.
    remote isolated function deleteComment(string issueIdOrKey, string id) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/comment/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get comment property keys
    #
    # + commentId - The ID of the comment.
    # + return - Returned if the request is successful.
    remote isolated function getCommentPropertyKeys(string commentId) returns PropertyKeys|error {
        string  path = string `/rest/api/2/comment/${commentId}/properties`;
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get comment property
    #
    # + commentId - The ID of the comment.
    # + propertyKey - The key of the property.
    # + return - Returned if the request is successful.
    remote isolated function getCommentProperty(string commentId, string propertyKey) returns EntityProperty|error {
        string  path = string `/rest/api/2/comment/${commentId}/properties/${propertyKey}`;
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
        return response;
    }
    # Set comment property
    #
    # + commentId - The ID of the comment.
    # + propertyKey - The key of the property. The maximum length is 255 characters.
    # + payload - The request payload value of a property for a comment to update.
    # + return - Returned if the comment property is updated.
    remote isolated function setCommentProperty(string commentId, string propertyKey, json payload) returns json|error {
        string  path = string `/rest/api/2/comment/${commentId}/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete comment property
    #
    # + commentId - The ID of the comment.
    # + propertyKey - The key of the property.
    # + return - Returned if the request is successful.
    remote isolated function deleteCommentProperty(string commentId, string propertyKey) returns error? {
        string  path = string `/rest/api/2/comment/${commentId}/properties/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get priorities
    #
    # + return - Returned if the request is successful.
    remote isolated function getPriorities() returns PriorityArr|error {
        string  path = string `/rest/api/2/priority`;
        PriorityArr response = check self.clientEp-> get(path, targetType = PriorityArr);
        return response;
    }
    # Get priority
    #
    # + id - The ID of the issue priority.
    # + return - Returned if the request is successful.
    remote isolated function getPriority(string id) returns Priority|error {
        string  path = string `/rest/api/2/priority/${id}`;
        Priority response = check self.clientEp-> get(path, targetType = Priority);
        return response;
    }
    # Create issue link
    #
    # + payload - The issue link request.
    # + return - Returned if the request is successful.
    remote isolated function linkIssues(LinkIssueRequestJsonBean payload) returns json|error {
        string  path = string `/rest/api/2/issueLink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, targetType=json);
        return response;
    }
    # Get issue link
    #
    # + linkId - The ID of the issue link.
    # + return - Returned if the request is successful.
    remote isolated function getIssueLink(string linkId) returns IssueLink|error {
        string  path = string `/rest/api/2/issueLink/${linkId}`;
        IssueLink response = check self.clientEp-> get(path, targetType = IssueLink);
        return response;
    }
    # Delete issue link
    #
    # + linkId - The ID of the issue link.
    # + return - 200 response
    remote isolated function deleteIssueLink(string linkId) returns error? {
        string  path = string `/rest/api/2/issueLink/${linkId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get fields
    #
    # + return - Returned if the request is successful.
    remote isolated function getFields() returns FieldDetailsArr|error {
        string  path = string `/rest/api/2/field`;
        FieldDetailsArr response = check self.clientEp-> get(path, targetType = FieldDetailsArr);
        return response;
    }
    # Create custom field
    #
    # + payload - Definition of the custom field to be created
    # + return - Returned if the custom field is created.
    remote isolated function createCustomField(CustomFieldDefinitionJsonBean payload) returns FieldDetails|error {
        string  path = string `/rest/api/2/field`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FieldDetails response = check self.clientEp->post(path, request, targetType=FieldDetails);
        return response;
    }
    # Get fields paginated
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + 'type - The type of fields to search.
    # + id - The IDs of the custom fields to return or, where `query` is specified, filter.
    # + query - String used to perform a case-insensitive partial match with field names or descriptions.
    # + orderBy - [Order](#ordering) the results by a field:
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getFieldsPaginated(int? startAt = 0, int? maxResults = 50, string[]? 'type = (), string[]? id = (), string? query = (), string? orderBy = (), string? expand = ()) returns PageBeanField|error {
        string  path = string `/rest/api/2/field/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "type": 'type, "id": id, "query": query, "orderBy": orderBy, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanField response = check self.clientEp-> get(path, targetType = PageBeanField);
        return response;
    }
    # Update custom field
    #
    # + fieldId - The ID of the custom field.
    # + payload - The custom field update details.
    # + return - Returned if the request is successful.
    remote isolated function updateCustomField(string fieldId, UpdateCustomFieldDetails payload) returns json|error {
        string  path = string `/rest/api/2/field/${fieldId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
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
        string  path = string `/rest/api/2/issue/picker`;
        map<anydata> queryParam = {"query": query, "currentJQL": currentJQL, "currentIssueKey": currentIssueKey, "currentProjectId": currentProjectId, "showSubTasks": showSubTasks, "showSubTaskParent": showSubTaskParent};
        path = path + check getPathForQueryParam(queryParam);
        IssuePickerSuggestions response = check self.clientEp-> get(path, targetType = IssuePickerSuggestions);
        return response;
    }
    # Check issues against JQL
    #
    # + payload - The request payload to check issues against JQL.
    # + return - Returned if the request is successful.
    remote isolated function matchIssues(IssuesAndJQLQueries payload) returns IssueMatches|error {
        string  path = string `/rest/api/2/jql/match`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IssueMatches response = check self.clientEp->post(path, request, targetType=IssueMatches);
        return response;
    }
    # Search for issues using JQL (GET)
    #
    # + jql - The [JQL](https://confluence.atlassian.com/x/egORLQ) that defines the search. Note:
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page. To manage page size, Jira may return fewer items per page where a large number of fields are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only.
    # + validateQuery - Determines how to validate the JQL query and treat the validation results. Supported values are:
    # + fields - A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:
    # + expand - Use [expand](#expansion) to include additional information about issues in the response. This parameter accepts a comma-separated list. Expand options include:
    # + properties - A list of issue property keys for issue properties to include in the results. This parameter accepts a comma-separated list. Multiple properties can also be provided using an ampersand separated list. For example, `properties=prop1,prop2&properties=prop3`. A maximum of 5 issue property keys can be specified.
    # + fieldsByKeys - Reference fields by their key (rather than ID).
    # + return - Returned if the request is successful.
    remote isolated function searchForIssuesUsingJql(string? jql = (), int? startAt = 0, int? maxResults = 50, string? validateQuery = "strict", string[]? fields = (), string? expand = (), string[]? properties = (), boolean? fieldsByKeys = false) returns SearchResults|error {
        string  path = string `/rest/api/2/search`;
        map<anydata> queryParam = {"jql": jql, "startAt": startAt, "maxResults": maxResults, "validateQuery": validateQuery, "fields": fields, "expand": expand, "properties": properties, "fieldsByKeys": fieldsByKeys};
        path = path + check getPathForQueryParam(queryParam);
        SearchResults response = check self.clientEp-> get(path, targetType = SearchResults);
        return response;
    }
    # Search for issues using JQL (POST)
    #
    # + payload - A JSON object containing the search request.
    # + return - Returned if the request is successful.
    remote isolated function searchForIssuesUsingJqlPost(SearchRequestBean payload) returns SearchResults|error {
        string  path = string `/rest/api/2/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SearchResults response = check self.clientEp->post(path, request, targetType=SearchResults);
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
        string  path = string `/rest/api/2/mypermissions`;
        map<anydata> queryParam = {"projectKey": projectKey, "projectId": projectId, "issueKey": issueKey, "issueId": issueId, "permissions": permissions, "projectUuid": projectUuid, "projectConfigurationUuid": projectConfigurationUuid};
        path = path + check getPathForQueryParam(queryParam);
        Permissions response = check self.clientEp-> get(path, targetType = Permissions);
        return response;
    }
    # Get all permissions
    #
    # + return - Returned if the request is successful.
    remote isolated function getAllPermissions() returns Permissions|error {
        string  path = string `/rest/api/2/permissions`;
        Permissions response = check self.clientEp-> get(path, targetType = Permissions);
        return response;
    }
    # Get bulk permissions
    #
    # + payload - Details of the permissions to check.
    # + return - Returned if the request is successful.
    remote isolated function getBulkPermissions(BulkPermissionsRequestBean payload) returns BulkPermissionGrants|error {
        string  path = string `/rest/api/2/permissions/check`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BulkPermissionGrants response = check self.clientEp->post(path, request, targetType=BulkPermissionGrants);
        return response;
    }
    # Get permitted projects
    #
    # + payload - The request payload to get permitted projects.
    # + return - Returned if the request is successful.
    remote isolated function getPermittedProjects(PermissionsKeysBean payload) returns PermittedProjects|error {
        string  path = string `/rest/api/2/permissions/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermittedProjects response = check self.clientEp->post(path, request, targetType=PermittedProjects);
        return response;
    }
    # Get all permission schemes
    #
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getAllPermissionSchemes(string? expand = ()) returns PermissionSchemes|error {
        string  path = string `/rest/api/2/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PermissionSchemes response = check self.clientEp-> get(path, targetType = PermissionSchemes);
        return response;
    }
    # Create permission scheme
    #
    # + payload - The permission scheme to create.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:
    # + return - Returned if the permission scheme is created.
    remote isolated function createPermissionScheme(PermissionScheme payload, string? expand = ()) returns PermissionScheme|error {
        string  path = string `/rest/api/2/permissionscheme`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermissionScheme response = check self.clientEp->post(path, request, targetType=PermissionScheme);
        return response;
    }
    # Get permission scheme
    #
    # + schemeId - The ID of the permission scheme to return.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getPermissionScheme(int schemeId, string? expand = ()) returns PermissionScheme|error {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PermissionScheme response = check self.clientEp-> get(path, targetType = PermissionScheme);
        return response;
    }
    # Update permission scheme
    #
    # + schemeId - The ID of the permission scheme to update.
    # + payload - The request payload to update permission scheme.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:
    # + return - Returned if the scheme is updated.
    remote isolated function updatePermissionScheme(int schemeId, PermissionScheme payload, string? expand = ()) returns PermissionScheme|error {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermissionScheme response = check self.clientEp->put(path, request, targetType=PermissionScheme);
        return response;
    }
    # Delete permission scheme
    #
    # + schemeId - The ID of the permission scheme being deleted.
    # + return - Returned if the permission scheme is deleted.
    remote isolated function deletePermissionScheme(int schemeId) returns error? {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get permission scheme grants
    #
    # + schemeId - The ID of the permission scheme.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getPermissionSchemeGrants(int schemeId, string? expand = ()) returns PermissionGrants|error {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}/permission`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PermissionGrants response = check self.clientEp-> get(path, targetType = PermissionGrants);
        return response;
    }
    # Create permission grant
    #
    # + schemeId - The ID of the permission scheme in which to create a new permission grant.
    # + payload - The permission grant to create.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:
    # + return - Returned if the scheme permission is created.
    remote isolated function createPermissionGrant(int schemeId, PermissionGrant payload, string? expand = ()) returns PermissionGrant|error {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}/permission`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PermissionGrant response = check self.clientEp->post(path, request, targetType=PermissionGrant);
        return response;
    }
    # Get permission scheme grant
    #
    # + schemeId - The ID of the permission scheme.
    # + permissionId - The ID of the permission grant.
    # + expand - Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getPermissionSchemeGrant(int schemeId, int permissionId, string? expand = ()) returns PermissionGrant|error {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}/permission/${permissionId}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PermissionGrant response = check self.clientEp-> get(path, targetType = PermissionGrant);
        return response;
    }
    # Delete permission scheme grant
    #
    # + schemeId - The ID of the permission scheme to delete the permission grant from.
    # + permissionId - The ID of the permission grant to delete.
    # + return - Returned if the permission grant is deleted.
    remote isolated function deletePermissionSchemeEntity(int schemeId, int permissionId) returns error? {
        string  path = string `/rest/api/2/permissionscheme/${schemeId}/permission/${permissionId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get selected time tracking provider
    #
    # + return - Returned if the request is successful and time tracking is enabled.
    remote isolated function getSelectedTimeTrackingImplementation() returns TimeTrackingProvider|error {
        string  path = string `/rest/api/2/configuration/timetracking`;
        TimeTrackingProvider response = check self.clientEp-> get(path, targetType = TimeTrackingProvider);
        return response;
    }
    # Select time tracking provider
    #
    # + payload - The request payload to select a time tracking provider.
    # + return - Returned if the request is successful.
    remote isolated function selectTimeTrackingImplementation(TimeTrackingProvider payload) returns json|error {
        string  path = string `/rest/api/2/configuration/timetracking`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get all time tracking providers
    #
    # + return - Returned if the request is successful.
    remote isolated function getAvailableTimeTrackingImplementations() returns TimeTrackingProviderArr|error {
        string  path = string `/rest/api/2/configuration/timetracking/list`;
        TimeTrackingProviderArr response = check self.clientEp-> get(path, targetType = TimeTrackingProviderArr);
        return response;
    }
    # Get time tracking settings
    #
    # + return - Returned if the request is successful.
    remote isolated function getSharedTimeTrackingConfiguration() returns TimeTrackingConfiguration|error {
        string  path = string `/rest/api/2/configuration/timetracking/options`;
        TimeTrackingConfiguration response = check self.clientEp-> get(path, targetType = TimeTrackingConfiguration);
        return response;
    }
    # Set time tracking settings
    #
    # + payload - The request payload to set time tracking settings.
    # + return - Returned if the request is successful.
    remote isolated function setSharedTimeTrackingConfiguration(TimeTrackingConfiguration payload) returns TimeTrackingConfiguration|error {
        string  path = string `/rest/api/2/configuration/timetracking/options`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeTrackingConfiguration response = check self.clientEp->put(path, request, targetType=TimeTrackingConfiguration);
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
    remote isolated function getIssueWorklog(string issueIdOrKey, int? startAt = 0, int? maxResults = 1048576, int? startedAfter = (), string? expand = "") returns PageOfWorklogs|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "startedAfter": startedAfter, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageOfWorklogs response = check self.clientEp-> get(path, targetType = PageOfWorklogs);
        return response;
    }
    # Add worklog
    #
    # + issueIdOrKey - The ID or key the issue.
    # + payload - The request payload to add worklog.
    # + notifyUsers - Whether users watching the issue are notified by email.
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`.
    # + reduceBy - The amount to reduce the issue's remaining estimate by, as days (\#d), hours (\#h), or minutes (\#m). For example, *2d*. Required when `adjustEstimate` is `manual`.
    # + expand - Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts `properties`, which returns worklog properties.
    # + overrideEditableFlag - Whether the worklog entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Only connect app users with admin scope permission can use this flag.
    # + return - Returned if the request is successful.
    remote isolated function addWorklog(string issueIdOrKey, Worklog payload, boolean? notifyUsers = true, string? adjustEstimate = "auto", string? newEstimate = (), string? reduceBy = (), string? expand = "", boolean? overrideEditableFlag = false) returns Worklog|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "reduceBy": reduceBy, "expand": expand, "overrideEditableFlag": overrideEditableFlag};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Worklog response = check self.clientEp->post(path, request, targetType=Worklog);
        return response;
    }
    # Get worklog
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + id - The ID of the worklog.
    # + expand - Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts
    # + return - Returned if the request is successful.
    remote isolated function getWorklog(string issueIdOrKey, string id, string? expand = "") returns Worklog|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${id}`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        Worklog response = check self.clientEp-> get(path, targetType = Worklog);
        return response;
    }
    # Update worklog
    #
    # + issueIdOrKey - The ID or key the issue.
    # + id - The ID of the worklog.
    # + payload - The request payload to update worklog.
    # + notifyUsers - Whether users watching the issue are notified by email.
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`.
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties`, which returns worklog properties.
    # + overrideEditableFlag - Whether the worklog should be added to the issue even if the issue is not editable. For example, because the issue is closed. Only connect app users with admin permissions can use this flag.
    # + return - Returned if the request is successful
    remote isolated function updateWorklog(string issueIdOrKey, string id, Worklog payload, boolean? notifyUsers = true, string? adjustEstimate = "auto", string? newEstimate = (), string? expand = "", boolean? overrideEditableFlag = false) returns Worklog|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${id}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "expand": expand, "overrideEditableFlag": overrideEditableFlag};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Worklog response = check self.clientEp->put(path, request, targetType=Worklog);
        return response;
    }
    # Delete worklog
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + id - The ID of the worklog.
    # + notifyUsers - Whether users watching the issue are notified by email.
    # + adjustEstimate - Defines how to update the issue's time estimate, the options are:
    # + newEstimate - The value to set as the issue's remaining time estimate, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `new`.
    # + increaseBy - The amount to increase the issue's remaining estimate by, as days (\#d), hours (\#h), or minutes (\#m or \#). For example, *2d*. Required when `adjustEstimate` is `manual`.
    # + overrideEditableFlag - Whether the work log entry should be added to the issue even if the issue is not editable, because jira.issue.editable set to false or missing. For example, the issue is closed. Only connect app users with admin permissions can use this flag.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorklog(string issueIdOrKey, string id, boolean? notifyUsers = true, string? adjustEstimate = "auto", string? newEstimate = (), string? increaseBy = (), boolean? overrideEditableFlag = false) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${id}`;
        map<anydata> queryParam = {"notifyUsers": notifyUsers, "adjustEstimate": adjustEstimate, "newEstimate": newEstimate, "increaseBy": increaseBy, "overrideEditableFlag": overrideEditableFlag};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get IDs of deleted worklogs
    #
    # + since - The date and time, as a UNIX timestamp in milliseconds, after which deleted worklogs are returned.
    # + return - Returned if the request is successful.
    remote isolated function getIdsOfWorklogsDeletedSince(int? since = 0) returns ChangedWorklogs|error {
        string  path = string `/rest/api/2/worklog/deleted`;
        map<anydata> queryParam = {"since": since};
        path = path + check getPathForQueryParam(queryParam);
        ChangedWorklogs response = check self.clientEp-> get(path, targetType = ChangedWorklogs);
        return response;
    }
    # Get worklogs
    #
    # + payload - A JSON object containing a list of worklog IDs.
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
    # + return - Returned if the request is successful.
    remote isolated function getWorklogsForIds(WorklogIdsRequestBean payload, string? expand = "") returns WorklogArr|error {
        string  path = string `/rest/api/2/worklog/list`;
        map<anydata> queryParam = {"expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorklogArr response = check self.clientEp->post(path, request, targetType=WorklogArr);
        return response;
    }
    # Get IDs of updated worklogs
    #
    # + since - The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned.
    # + expand - Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.
    # + return - Returned if the request is successful.
    remote isolated function getIdsOfWorklogsModifiedSince(int? since = 0, string? expand = "") returns ChangedWorklogs|error {
        string  path = string `/rest/api/2/worklog/updated`;
        map<anydata> queryParam = {"since": since, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        ChangedWorklogs response = check self.clientEp-> get(path, targetType = ChangedWorklogs);
        return response;
    }
    # Get worklog property keys
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + worklogId - The ID of the worklog.
    # + return - Returned if the request is successful.
    remote isolated function getWorklogPropertyKeys(string issueIdOrKey, string worklogId) returns PropertyKeys|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${worklogId}/properties`;
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get worklog property
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + worklogId - The ID of the worklog.
    # + propertyKey - The key of the property.
    # + return - Returned if the request is successful.
    remote isolated function getWorklogProperty(string issueIdOrKey, string worklogId, string propertyKey) returns EntityProperty|error {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${worklogId}/properties/${propertyKey}`;
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
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
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${worklogId}/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete worklog property
    #
    # + issueIdOrKey - The ID or key of the issue.
    # + worklogId - The ID of the worklog.
    # + propertyKey - The key of the property.
    # + return - Returned if the worklog property is removed.
    remote isolated function deleteWorklogProperty(string issueIdOrKey, string worklogId, string propertyKey) returns error? {
        string  path = string `/rest/api/2/issue/${issueIdOrKey}/worklog/${worklogId}/properties/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get workflow transition rule configurations
    #
    # + types - The types of the transition rules to return.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + keys - The transition rule class keys, as defined in the Connect app descriptor, of the transition rules to return.
    # + expand - Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowTransitionRuleConfigurations(string[] types, int? startAt = 0, int? maxResults = 10, string[]? keys = (), string? expand = ()) returns PageBeanWorkflowTransitionRules|error {
        string  path = string `/rest/api/2/workflow/rule/config`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "types": types, "keys": keys, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanWorkflowTransitionRules response = check self.clientEp-> get(path, targetType = PageBeanWorkflowTransitionRules);
        return response;
    }
    # Update workflow transition rule configurations
    #
    # + payload - The request payload to update configuration of workflow transition rules.
    # + return - Returned if the request is successful.
    remote isolated function updateWorkflowTransitionRuleConfigurations(WorkflowTransitionRulesUpdate payload) returns WorkflowTransitionRulesUpdateErrors|error {
        string  path = string `/rest/api/2/workflow/rule/config`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowTransitionRulesUpdateErrors response = check self.clientEp->put(path, request, targetType=WorkflowTransitionRulesUpdateErrors);
        return response;
    }
    # Delete workflow transition rule configurations
    #
    # + payload - The request payload to delete configuration of workflow transition rules.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowTransitionRuleConfigurations(WorkflowsWithTransitionRulesDetails payload) returns WorkflowTransitionRulesUpdateErrors|error {
        string  path = string `/rest/api/2/workflow/rule/config/delete`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowTransitionRulesUpdateErrors response = check self.clientEp->put(path, request, targetType=WorkflowTransitionRulesUpdateErrors);
        return response;
    }
    # Get workflow transition properties
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira administration console. The ID is shown next to the transition.
    # + workflowName - The name of the workflow that the transition belongs to.
    # + includeReservedKeys - Some properties with keys that have the *jira.* prefix are reserved, which means they are not editable. To include these properties in the results, set this parameter to *true*.
    # + 'key - The key of the property being returned, also known as the name of the property. If this parameter is not specified, all properties on the transition are returned.
    # + workflowMode - The workflow status. Set to *live* for active and inactive workflows, or *draft* for draft workflows.
    # + return - 200 response
    remote isolated function getWorkflowTransitionProperties(int transitionId, string workflowName, boolean? includeReservedKeys = false, string? 'key = (), string? workflowMode = "live") returns WorkflowTransitionProperty|error {
        string  path = string `/rest/api/2/workflow/transitions/${transitionId}/properties`;
        map<anydata> queryParam = {"includeReservedKeys": includeReservedKeys, "key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        path = path + check getPathForQueryParam(queryParam);
        WorkflowTransitionProperty response = check self.clientEp-> get(path, targetType = WorkflowTransitionProperty);
        return response;
    }
    # Update workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition.
    # + 'key - The key of the property being updated, also known as the name of the property. Set this to the same value as the `key` defined in the request body.
    # + workflowName - The name of the workflow that the transition belongs to.
    # + payload - The request payload to update configuration of workflow transition property.
    # + workflowMode - The workflow status. Set to `live` for inactive workflows or `draft` for draft workflows. Active workflows cannot be edited.
    # + return - 200 response
    remote isolated function updateWorkflowTransitionProperty(int transitionId, string key, string workflowName, WorkflowTransitionProperty payload, string? workflowMode = ()) returns WorkflowTransitionProperty|error {
        string  path = string `/rest/api/2/workflow/transitions/${transitionId}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowTransitionProperty response = check self.clientEp->put(path, request, targetType=WorkflowTransitionProperty);
        return response;
    }
    # Create workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition.
    # + 'key - The key of the property being added, also known as the name of the property. Set this to the same value as the `key` defined in the request body.
    # + workflowName - The name of the workflow that the transition belongs to.
    # + payload - The request payload to create configuration of workflow transition property.
    # + workflowMode - The workflow status. Set to *live* for inactive workflows or *draft* for draft workflows. Active workflows cannot be edited.
    # + return - 200 response
    remote isolated function createWorkflowTransitionProperty(int transitionId, string key, string workflowName, WorkflowTransitionProperty payload, string? workflowMode = "live") returns WorkflowTransitionProperty|error {
        string  path = string `/rest/api/2/workflow/transitions/${transitionId}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowTransitionProperty response = check self.clientEp->post(path, request, targetType=WorkflowTransitionProperty);
        return response;
    }
    # Delete workflow transition property
    #
    # + transitionId - The ID of the transition. To get the ID, view the workflow in text mode in the Jira admin settings. The ID is shown next to the transition.
    # + 'key - The name of the transition property to delete, also known as the name of the property.
    # + workflowName - The name of the workflow that the transition belongs to.
    # + workflowMode - The workflow status. Set to `live` for inactive workflows or `draft` for draft workflows. Active workflows cannot be edited.
    # + return - 200 response
    remote isolated function deleteWorkflowTransitionProperty(int transitionId, string key, string workflowName, string? workflowMode = ()) returns error? {
        string  path = string `/rest/api/2/workflow/transitions/${transitionId}/properties`;
        map<anydata> queryParam = {"key": 'key, "workflowName": workflowName, "workflowMode": workflowMode};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get all workflow schemes
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function getAllWorkflowSchemes(int? startAt = 0, int? maxResults = 50) returns PageBeanWorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanWorkflowScheme response = check self.clientEp-> get(path, targetType = PageBeanWorkflowScheme);
        return response;
    }
    # Create workflow scheme
    #
    # + payload - The request payload to create workflow scheme.
    # + return - Returned if the request is successful.
    remote isolated function createWorkflowScheme(WorkflowScheme payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->post(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Get workflow scheme project associations
    #
    # + projectId - The ID of a project to return the workflow schemes for. To include multiple projects, provide an ampersand-Jim: oneseparated list. For example, `projectId=10000&projectId=10001`.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowSchemeProjectAssociations(int[] projectId) returns ContainerOfWorkflowSchemeAssociations|error {
        string  path = string `/rest/api/2/workflowscheme/project`;
        map<anydata> queryParam = {"projectId": projectId};
        path = path + check getPathForQueryParam(queryParam);
        ContainerOfWorkflowSchemeAssociations response = check self.clientEp-> get(path, targetType = ContainerOfWorkflowSchemeAssociations);
        return response;
    }
    # Assign workflow scheme to project
    #
    # + payload - The request payload to assign workflow scheme to project.
    # + return - Returned if the request is successful.
    remote isolated function assignSchemeToProject(WorkflowSchemeProjectAssociation payload) returns json|error {
        string  path = string `/rest/api/2/workflowscheme/project`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Get workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
    # + returnDraftIfExists - Returns the workflow scheme's draft rather than scheme itself, if set to true. If the workflow scheme does not have a draft, then the workflow scheme is returned.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowScheme(int id, boolean? returnDraftIfExists = false) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        path = path + check getPathForQueryParam(queryParam);
        WorkflowScheme response = check self.clientEp-> get(path, targetType = WorkflowScheme);
        return response;
    }
    # Update workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
    # + payload - The request payload to update workflow scheme.
    # + return - Returned if the request is successful.
    remote isolated function updateWorkflowScheme(int id, WorkflowScheme payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete workflow scheme
    #
    # + id - The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowScheme(int id) returns error? {
        string  path = string `/rest/api/2/workflowscheme/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Create draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft is created from.
    # + return - Returned if the request is successful.
    remote isolated function createWorkflowSchemeDraftFromParent(int id) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/createdraft`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> post(path, request, targetType = WorkflowScheme);
        return response;
    }
    # Get default workflow
    #
    # + id - The ID of the workflow scheme.
    # + returnDraftIfExists - Set to `true` to return the default workflow for the workflow scheme's draft rather than scheme itself. If the workflow scheme does not have a draft, then the default workflow for the workflow scheme is returned.
    # + return - Returned if the request is successful.
    remote isolated function getDefaultWorkflow(int id, boolean? returnDraftIfExists = false) returns DefaultWorkflow|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/default`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        path = path + check getPathForQueryParam(queryParam);
        DefaultWorkflow response = check self.clientEp-> get(path, targetType = DefaultWorkflow);
        return response;
    }
    # Update default workflow
    #
    # + id - The ID of the workflow scheme.
    # + payload - The new default workflow.
    # + return - Returned if the request is successful.
    remote isolated function updateDefaultWorkflow(int id, DefaultWorkflow payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/default`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete default workflow
    #
    # + id - The ID of the workflow scheme.
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
    # + return - Returned if the request is successful.
    remote isolated function deleteDefaultWorkflow(int id, boolean? updateDraftIfNeeded = ()) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/default`;
        map<anydata> queryParam = {"updateDraftIfNeeded": updateDraftIfNeeded};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> delete(path, request, targetType = WorkflowScheme);
        return response;
    }
    # Get draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowSchemeDraft(int id) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft`;
        WorkflowScheme response = check self.clientEp-> get(path, targetType = WorkflowScheme);
        return response;
    }
    # Update draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from.
    # + payload - The request payload to update workflow scheme draft.
    # + return - Returned if the request is successful.
    remote isolated function updateWorkflowSchemeDraft(int id, WorkflowScheme payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete draft workflow scheme
    #
    # + id - The ID of the active workflow scheme that the draft was created from.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowSchemeDraft(int id) returns error? {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + return - Returned if the request is successful.
    remote isolated function getDraftDefaultWorkflow(int id) returns DefaultWorkflow|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/default`;
        DefaultWorkflow response = check self.clientEp-> get(path, targetType = DefaultWorkflow);
        return response;
    }
    # Update draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + payload - The object for the new default workflow.
    # + return - Returned if the request is successful.
    remote isolated function updateDraftDefaultWorkflow(int id, DefaultWorkflow payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/default`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete draft default workflow
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + return - Returned if the request is successful.
    remote isolated function deleteDraftDefaultWorkflow(int id) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/default`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> delete(path, request, targetType = WorkflowScheme);
        return response;
    }
    # Get workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + issueType - The ID of the issue type.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowSchemeDraftIssueType(int id, string issueType) returns IssueTypeWorkflowMapping|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/issuetype/${issueType}`;
        IssueTypeWorkflowMapping response = check self.clientEp-> get(path, targetType = IssueTypeWorkflowMapping);
        return response;
    }
    # Set workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + issueType - The ID of the issue type.
    # + payload - The issue type-project mapping.
    # + return - Returned if the request is successful.
    remote isolated function setWorkflowSchemeDraftIssueType(int id, string issueType, IssueTypeWorkflowMapping payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/issuetype/${issueType}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete workflow for issue type in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + issueType - The ID of the issue type.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowSchemeDraftIssueType(int id, string issueType) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/issuetype/${issueType}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> delete(path, request, targetType = WorkflowScheme);
        return response;
    }
    # Publish draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + payload - Details of the status mappings.
    # + validateOnly - Whether the request only performs a validation.
    # + return - Returned if the request is only for validation and is successful.
    remote isolated function publishDraftWorkflowScheme(int id, PublishDraftWorkflowScheme payload, boolean? validateOnly = false) returns error? {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/publish`;
        map<anydata> queryParam = {"validateOnly": validateOnly};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
    }
    # Get issue types for workflows in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + workflowName - The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
    # + return - Returned if the request is successful.
    remote isolated function getDraftWorkflow(int id, string? workflowName = ()) returns IssueTypesWorkflowMapping|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        path = path + check getPathForQueryParam(queryParam);
        IssueTypesWorkflowMapping response = check self.clientEp-> get(path, targetType = IssueTypesWorkflowMapping);
        return response;
    }
    # Set issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + workflowName - The name of the workflow.
    # + payload - The request payload to set issue types in workflow scheme draft.
    # + return - Returned if the request is successful.
    remote isolated function updateDraftWorkflowMapping(int id, string workflowName, IssueTypesWorkflowMapping payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete issue types for workflow in draft workflow scheme
    #
    # + id - The ID of the workflow scheme that the draft belongs to.
    # + workflowName - The name of the workflow.
    # + return - Returned if the request is successful.
    remote isolated function deleteDraftWorkflowMapping(int id, string workflowName) returns error? {
        string  path = string `/rest/api/2/workflowscheme/${id}/draft/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + issueType - The ID of the issue type.
    # + returnDraftIfExists - Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflowSchemeIssueType(int id, string issueType, boolean? returnDraftIfExists = false) returns IssueTypeWorkflowMapping|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/issuetype/${issueType}`;
        map<anydata> queryParam = {"returnDraftIfExists": returnDraftIfExists};
        path = path + check getPathForQueryParam(queryParam);
        IssueTypeWorkflowMapping response = check self.clientEp-> get(path, targetType = IssueTypeWorkflowMapping);
        return response;
    }
    # Set workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + issueType - The ID of the issue type.
    # + payload - The issue type-project mapping.
    # + return - Returned if the request is successful.
    remote isolated function setWorkflowSchemeIssueType(int id, string issueType, IssueTypeWorkflowMapping payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/issuetype/${issueType}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete workflow for issue type in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + issueType - The ID of the issue type.
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowSchemeIssueType(int id, string issueType, boolean? updateDraftIfNeeded = ()) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/issuetype/${issueType}`;
        map<anydata> queryParam = {"updateDraftIfNeeded": updateDraftIfNeeded};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        WorkflowScheme response = check self.clientEp-> delete(path, request, targetType = WorkflowScheme);
        return response;
    }
    # Get issue types for workflows in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + workflowName - The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
    # + returnDraftIfExists - Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
    # + return - Returned if the request is successful.
    remote isolated function getWorkflow(int id, string? workflowName = (), boolean? returnDraftIfExists = false) returns IssueTypesWorkflowMapping|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName, "returnDraftIfExists": returnDraftIfExists};
        path = path + check getPathForQueryParam(queryParam);
        IssueTypesWorkflowMapping response = check self.clientEp-> get(path, targetType = IssueTypesWorkflowMapping);
        return response;
    }
    # Set issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + workflowName - The name of the workflow.
    # + payload - The request payload to set issue types in workflow scheme.
    # + return - Returned if the request is successful.
    remote isolated function updateWorkflowMapping(int id, string workflowName, IssueTypesWorkflowMapping payload) returns WorkflowScheme|error {
        string  path = string `/rest/api/2/workflowscheme/${id}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkflowScheme response = check self.clientEp->put(path, request, targetType=WorkflowScheme);
        return response;
    }
    # Delete issue types for workflow in workflow scheme
    #
    # + id - The ID of the workflow scheme.
    # + workflowName - The name of the workflow.
    # + updateDraftIfNeeded - Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
    # + return - Returned if the request is successful.
    remote isolated function deleteWorkflowMapping(int id, string workflowName, boolean? updateDraftIfNeeded = ()) returns error? {
        string  path = string `/rest/api/2/workflowscheme/${id}/workflow`;
        map<anydata> queryParam = {"workflowName": workflowName, "updateDraftIfNeeded": updateDraftIfNeeded};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get all statuses
    #
    # + return - Returned if the request is successful.
    remote isolated function getStatuses() returns StatusDetailsArr|error {
        string  path = string `/rest/api/2/status`;
        StatusDetailsArr response = check self.clientEp-> get(path, targetType = StatusDetailsArr);
        return response;
    }
    # Get status
    #
    # + idOrName - The ID or name of the status.
    # + return - Returned if the request is successful.
    remote isolated function getStatus(string idOrName) returns StatusDetails|error {
        string  path = string `/rest/api/2/status/${idOrName}`;
        StatusDetails response = check self.clientEp-> get(path, targetType = StatusDetails);
        return response;
    }
    # Get all status categories
    #
    # + return - Returned if the request is successful.
    remote isolated function getStatusCategories() returns StatusCategoryArr|error {
        string  path = string `/rest/api/2/statuscategory`;
        StatusCategoryArr response = check self.clientEp-> get(path, targetType = StatusCategoryArr);
        return response;
    }
    # Get status category
    #
    # + idOrKey - The ID or key of the status category.
    # + return - Returned if the request is successful.
    remote isolated function getStatusCategory(string idOrKey) returns StatusCategory|error {
        string  path = string `/rest/api/2/statuscategory/${idOrKey}`;
        StatusCategory response = check self.clientEp-> get(path, targetType = StatusCategory);
        return response;
    }
    # Get all project categories
    #
    # + return - Returned if the request is successful.
    remote isolated function getAllProjectCategories() returns ProjectCategoryArr|error {
        string  path = string `/rest/api/2/projectCategory`;
        ProjectCategoryArr response = check self.clientEp-> get(path, targetType = ProjectCategoryArr);
        return response;
    }
    # Create project category
    #
    # + payload - The request payload to create project category.
    # + return - Returned if the request is successful.
    remote isolated function createProjectCategory(ProjectCategory payload) returns ProjectCategory|error {
        string  path = string `/rest/api/2/projectCategory`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectCategory response = check self.clientEp->post(path, request, targetType=ProjectCategory);
        return response;
    }
    # Get project category by ID
    #
    # + id - The ID of the project category.
    # + return - Returned if the request is successful.
    remote isolated function getProjectCategoryById(int id) returns ProjectCategory|error {
        string  path = string `/rest/api/2/projectCategory/${id}`;
        ProjectCategory response = check self.clientEp-> get(path, targetType = ProjectCategory);
        return response;
    }
    # Update project category
    #
    # + id - Project category ID.
    # + payload - The request payload to update a project category.
    # + return - Returned if the request is successful.
    remote isolated function updateProjectCategory(int id, ProjectCategory payload) returns UpdatedProjectCategory|error {
        string  path = string `/rest/api/2/projectCategory/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdatedProjectCategory response = check self.clientEp->put(path, request, targetType=UpdatedProjectCategory);
        return response;
    }
    # Delete project category
    #
    # + id - ID of the project category to delete.
    # + return - Returned if the request is successful.
    remote isolated function removeProjectCategory(int id) returns error? {
        string  path = string `/rest/api/2/projectCategory/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Create component
    #
    # + payload - The request payload to create a component.
    # + return - Returned if the request is successful.
    remote isolated function createComponent(ProjectComponent payload) returns ProjectComponent|error {
        string  path = string `/rest/api/2/component`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectComponent response = check self.clientEp->post(path, request, targetType=ProjectComponent);
        return response;
    }
    # Get component
    #
    # + id - The ID of the component.
    # + return - Returned if the request is successful.
    remote isolated function getComponent(string id) returns ProjectComponent|error {
        string  path = string `/rest/api/2/component/${id}`;
        ProjectComponent response = check self.clientEp-> get(path, targetType = ProjectComponent);
        return response;
    }
    # Update component
    #
    # + id - The ID of the component.
    # + payload - The request payload to update a component.
    # + return - Returned if the request is successful.
    remote isolated function updateComponent(string id, ProjectComponent payload) returns ProjectComponent|error {
        string  path = string `/rest/api/2/component/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectComponent response = check self.clientEp->put(path, request, targetType=ProjectComponent);
        return response;
    }
    # Delete component
    #
    # + id - The ID of the component.
    # + moveIssuesTo - The ID of the component to replace the deleted component. If this value is null no replacement is made.
    # + return - Returned if the request is successful.
    remote isolated function deleteComponent(string id, string? moveIssuesTo = ()) returns error? {
        string  path = string `/rest/api/2/component/${id}`;
        map<anydata> queryParam = {"moveIssuesTo": moveIssuesTo};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get component issues count
    #
    # + id - The ID of the component.
    # + return - Returned if the request is successful.
    remote isolated function getComponentRelatedIssues(string id) returns ComponentIssuesCount|error {
        string  path = string `/rest/api/2/component/${id}/relatedIssueCounts`;
        ComponentIssuesCount response = check self.clientEp-> get(path, targetType = ComponentIssuesCount);
        return response;
    }
    # Get project components paginated
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + orderBy - [Order](#ordering) the results by a field:
    # + query - Filter the results using a literal string. Components with a matching `name` or `description` are returned (case insensitive).
    # + return - Returned if the request is successful.
    remote isolated function getProjectComponentsPaginated(string projectIdOrKey, int? startAt = 0, int? maxResults = 50, string? orderBy = (), string? query = ()) returns PageBeanComponentWithIssueCount|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/component`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "orderBy": orderBy, "query": query};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanComponentWithIssueCount response = check self.clientEp-> get(path, targetType = PageBeanComponentWithIssueCount);
        return response;
    }
    # Get project components
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getProjectComponents(string projectIdOrKey) returns ProjectComponentArr|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/components`;
        ProjectComponentArr response = check self.clientEp-> get(path, targetType = ProjectComponentArr);
        return response;
    }
    # Get project property keys
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getProjectPropertyKeys(string projectIdOrKey) returns PropertyKeys|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/properties`;
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + propertyKey - The project property key. Use [Get project property keys](#api-rest-api-2-project-projectIdOrKey-properties-get) to get a list of all project property keys.
    # + return - Returned if the request is successful.
    remote isolated function getProjectProperty(string projectIdOrKey, string propertyKey) returns EntityProperty|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/properties/${propertyKey}`;
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
        return response;
    }
    # Set project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + propertyKey - The key of the project property. The maximum length is 255 characters.
    # + payload - The request payload to set project property.
    # + return - Returned if the project property is updated.
    remote isolated function setProjectProperty(string projectIdOrKey, string propertyKey, json payload) returns json|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/properties/${propertyKey}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete project property
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + propertyKey - The project property key. Use [Get project property keys](#api-rest-api-2-project-projectIdOrKey-properties-get) to get a list of all project property keys.
    # + return - Returned if the project property is deleted.
    remote isolated function deleteProjectProperty(string projectIdOrKey, string propertyKey) returns error? {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/properties/${propertyKey}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get project roles for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + return - Returned if the request is successful.
    remote isolated function getProjectRoles(string projectIdOrKey) returns json|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/role`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Get project role for project
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + return - Returned if the request is successful.
    remote isolated function getProjectRole(string projectIdOrKey, int id) returns ProjectRole|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/role/${id}`;
        ProjectRole response = check self.clientEp-> get(path, targetType = ProjectRole);
        return response;
    }
    # Set actors for project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + payload - The groups or users to associate with the project role for this project. Provide the user account ID or group name.
    # + return - Returned if the request is successful. The complete list of actors for the project is returned.
    remote isolated function setActors(string projectIdOrKey, int id, ProjectRoleActorsUpdateBean payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/role/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->put(path, request, targetType=ProjectRole);
        return response;
    }
    # Add actors to project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + payload - The groups or users to associate with the project role for this project. Provide the user account ID or group name.
    # + return - Returned if the request is successful. The complete list of actors for the project is returned.
    remote isolated function addActorUsers(string projectIdOrKey, int id, ActorsMap payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/role/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->post(path, request, targetType=ProjectRole);
        return response;
    }
    # Delete actors from project role
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + user - The user account ID of the user to remove from the project role.
    # + 'group - The name of the group to remove from the project role.
    # + return - Returned if the request is successful.
    remote isolated function deleteActor(string projectIdOrKey, int id, string? user = (), string? 'group = ()) returns error? {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/role/${id}`;
        map<anydata> queryParam = {"user": user, "group": 'group};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get project role details
    #
    # + projectIdOrKey - The project ID or project key (case sensitive).
    # + currentMember - Whether the roles should be filtered to include only those the user is assigned to.
    # + excludeConnectAddons - Whether to exclude connect addons.
    # + return - Returned if the request is successful.
    remote isolated function getProjectRoleDetails(string projectIdOrKey, boolean? currentMember = false, boolean? excludeConnectAddons = false) returns ProjectRoleDetailsArr|error {
        string  path = string `/rest/api/2/project/${projectIdOrKey}/roledetails`;
        map<anydata> queryParam = {"currentMember": currentMember, "excludeConnectAddons": excludeConnectAddons};
        path = path + check getPathForQueryParam(queryParam);
        ProjectRoleDetailsArr response = check self.clientEp-> get(path, targetType = ProjectRoleDetailsArr);
        return response;
    }
    # Get all project roles
    #
    # + return - Returned if the request is successful.
    remote isolated function getAllProjectRoles() returns ProjectRoleArr|error {
        string  path = string `/rest/api/2/role`;
        ProjectRoleArr response = check self.clientEp-> get(path, targetType = ProjectRoleArr);
        return response;
    }
    # Create project role
    #
    # + payload - The request payload to create a new project role.
    # + return - Returned if the request is successful.
    remote isolated function createProjectRole(CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/role`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->post(path, request, targetType=ProjectRole);
        return response;
    }
    # Get project role by ID
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + return - Returned if the request is successful.
    remote isolated function getProjectRoleById(int id) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}`;
        ProjectRole response = check self.clientEp-> get(path, targetType = ProjectRole);
        return response;
    }
    # Fully update project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + payload - The request payload to fully update a project role.
    # + return - Returned if the request is successful.
    remote isolated function fullyUpdateProjectRole(int id, CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->put(path, request, targetType=ProjectRole);
        return response;
    }
    # Partial update project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + payload - The request payload to partial update a project role.
    # + return - Returned if the request is successful.
    remote isolated function partialUpdateProjectRole(int id, CreateUpdateRoleRequestBean payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->post(path, request, targetType=ProjectRole);
        return response;
    }
    # Delete project role
    #
    # + id - The ID of the project role to delete. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + swap - The ID of the project role that will replace the one being deleted.
    # + return - Returned if the request is successful.
    remote isolated function deleteProjectRole(int id, int? swap = ()) returns error? {
        string  path = string `/rest/api/2/role/${id}`;
        map<anydata> queryParam = {"swap": swap};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get default actors for project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + return - Returned if the request is successful.
    remote isolated function getProjectRoleActorsForRole(int id) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}/actors`;
        ProjectRole response = check self.clientEp-> get(path, targetType = ProjectRole);
        return response;
    }
    # Add default actors to project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + payload - The request payload to add default users to project role.
    # + return - Returned if the request is successful.
    remote isolated function addProjectRoleActorsToRole(int id, ActorInputBean payload) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}/actors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectRole response = check self.clientEp->post(path, request, targetType=ProjectRole);
        return response;
    }
    # Delete default actors from project role
    #
    # + id - The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    # + user - The user account ID of the user to remove as a default actor.
    # + 'group - The group name of the group to be removed as a default actor.
    # + return - Returned if the request is successful.
    remote isolated function deleteProjectRoleActorsFromRole(int id, string? user = (), string? 'group = ()) returns ProjectRole|error {
        string  path = string `/rest/api/2/role/${id}/actors`;
        map<anydata> queryParam = {"user": user, "group": 'group};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        ProjectRole response = check self.clientEp-> delete(path, request, targetType = ProjectRole);
        return response;
    }
    # Get user
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
    # + expand - Use [expand](#expansion) to include additional information about users in the response. This parameter accepts a comma-separated list. Expand options include:
    # + return - Returned if the request is successful.
    remote isolated function getUser(string? accountId = (), string? username = (), string? 'key = (), string? expand = ()) returns User|error {
        string  path = string `/rest/api/2/user`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key, "expand": expand};
        path = path + check getPathForQueryParam(queryParam);
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Create user
    #
    # + payload - Details about the user to be created.
    # + return - Returned if the request is successful.
    remote isolated function createUser(UserWriteBean payload) returns User|error {
        string  path = string `/rest/api/2/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->post(path, request, targetType=User);
        return response;
    }
    # Delete user
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function removeUser(string accountId, string? username = (), string? 'key = ()) returns error? {
        string  path = string `/rest/api/2/user`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Bulk get users
    #
    # + accountId - The account ID of a user. To specify multiple users, pass multiple `accountId` parameters. For example, `accountId=5b10a2844c20165700ede21g&accountId=5b10ac8d82e05b22cc7d4ef5`.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function bulkGetUsers(string[] accountId, int? startAt = 0, int? maxResults = 10, string[]? username = (), string[]? 'key = ()) returns PageBeanUser|error {
        string  path = string `/rest/api/2/user/bulk`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "username": username, "key": 'key, "accountId": accountId};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanUser response = check self.clientEp-> get(path, targetType = PageBeanUser);
        return response;
    }
    # Get account IDs for users
    #
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + username - Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present.
    # + 'key - Key of a user. To specify multiple users, pass multiple copies of this parameter. For example, `key=fred&key=barney`. Required if `username` isn't provided. Cannot be provided if `username` is present.
    # + return - Returned if the request is successful.
    remote isolated function bulkGetUsersMigration(int? startAt = 0, int? maxResults = 10, string[]? username = (), string[]? 'key = ()) returns UserMigrationBeanArr|error {
        string  path = string `/rest/api/2/user/bulk/migration`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults, "username": username, "key": 'key};
        path = path + check getPathForQueryParam(queryParam);
        UserMigrationBeanArr response = check self.clientEp-> get(path, targetType = UserMigrationBeanArr);
        return response;
    }
    # Get user default columns
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function getUserDefaultColumns(string? accountId = (), string? username = ()) returns ColumnItemArr|error {
        string  path = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        ColumnItemArr response = check self.clientEp-> get(path, targetType = ColumnItemArr);
        return response;
    }
    # Set user default columns
    #
    # + payload - The ID of a column to set. To set multiple columns, send multiple `columns` parameters.
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + return - Returned if the request is successful.
    remote isolated function setUserColumns(string[] payload, string? accountId = ()) returns json|error {
        string  path = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Reset user default columns
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function resetUserColumns(string? accountId = (), string? username = ()) returns error? {
        string  path = string `/rest/api/2/user/columns`;
        map<anydata> queryParam = {"accountId": accountId, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Get user email
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`.
    # + return - Returned if the request is successful.
    remote isolated function getUserEmail(string accountId) returns UnrestrictedUserEmail|error {
        string  path = string `/rest/api/2/user/email`;
        map<anydata> queryParam = {"accountId": accountId};
        path = path + check getPathForQueryParam(queryParam);
        UnrestrictedUserEmail response = check self.clientEp-> get(path, targetType = UnrestrictedUserEmail);
        return response;
    }
    # Get user email bulk
    #
    # + accountId - The account IDs of the users for which emails are required. An `accountId` is an identifier that uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`. Note, this should be treated as an opaque identifier (that is, do not assume any structure in the value).
    # + return - Returned if the request is successful.
    remote isolated function getUserEmailBulk(string[] accountId) returns UnrestrictedUserEmail|error {
        string  path = string `/rest/api/2/user/email/bulk`;
        map<anydata> queryParam = {"accountId": accountId};
        path = path + check getPathForQueryParam(queryParam);
        UnrestrictedUserEmail response = check self.clientEp-> get(path, targetType = UnrestrictedUserEmail);
        return response;
    }
    # Get user groups
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + 'key - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function getUserGroups(string accountId, string? username = (), string? 'key = ()) returns GroupNameArr|error {
        string  path = string `/rest/api/2/user/groups`;
        map<anydata> queryParam = {"accountId": accountId, "username": username, "key": 'key};
        path = path + check getPathForQueryParam(queryParam);
        GroupNameArr response = check self.clientEp-> get(path, targetType = GroupNameArr);
        return response;
    }
    # Get all users default
    #
    # + startAt - The index of the first item to return.
    # + maxResults - The maximum number of items to return.
    # + return - Returned if the request is successful.
    remote isolated function getAllUsersDefault(int? startAt = 0, int? maxResults = 50) returns UserArr|error {
        string  path = string `/rest/api/2/users`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all users
    #
    # + startAt - The index of the first item to return.
    # + maxResults - The maximum number of items to return.
    # + return - Returned if the request is successful.
    remote isolated function getAllUsers(int? startAt = 0, int? maxResults = 50) returns UserArr|error {
        string  path = string `/rest/api/2/users/search`;
        map<anydata> queryParam = {"startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get user property keys
    #
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function getUserPropertyKeys(string? accountId = (), string? userKey = (), string? username = ()) returns PropertyKeys|error {
        string  path = string `/rest/api/2/user/properties`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        PropertyKeys response = check self.clientEp-> get(path, targetType = PropertyKeys);
        return response;
    }
    # Get user property
    #
    # + propertyKey - The key of the user's property.
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the request is successful.
    remote isolated function getUserProperty(string propertyKey, string? accountId = (), string? userKey = (), string? username = ()) returns EntityProperty|error {
        string  path = string `/rest/api/2/user/properties/${propertyKey}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        EntityProperty response = check self.clientEp-> get(path, targetType = EntityProperty);
        return response;
    }
    # Set user property
    #
    # + propertyKey - The key of the user's property. The maximum length is 255 characters.
    # + payload - The request payload to set the value of a user's property.
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the user property is updated.
    remote isolated function setUserProperty(string propertyKey, json payload, string? accountId = (), string? userKey = (), string? username = ()) returns json|error {
        string  path = string `/rest/api/2/user/properties/${propertyKey}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, targetType=json);
        return response;
    }
    # Delete user property
    #
    # + propertyKey - The key of the user's property.
    # + accountId - The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    # + userKey - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + return - Returned if the user property is deleted.
    remote isolated function deleteUserProperty(string propertyKey, string? accountId = (), string? userKey = (), string? username = ()) returns error? {
        string  path = string `/rest/api/2/user/properties/${propertyKey}`;
        map<anydata> queryParam = {"accountId": accountId, "userKey": userKey, "username": username};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Find users assignable to projects
    #
    # + projectKeys - A list of project keys (case sensitive). This parameter accepts a comma-separated list.
    # + query - A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function findBulkAssignableUsers(string projectKeys, string? query = (), string? username = (), string? accountId = (), int? startAt = 0, int? maxResults = 50) returns UserArr|error {
        string  path = string `/rest/api/2/user/assignable/multiProjectSearch`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "projectKeys": projectKeys, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
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
    remote isolated function findAssignableUsers(string? query = (), string? sessionId = (), string? username = (), string? accountId = (), string? project = (), string? issueKey = (), int? startAt = 0, int? maxResults = 50, int? actionDescriptorId = (), boolean? recommend = false) returns UserArr|error {
        string  path = string `/rest/api/2/user/assignable/search`;
        map<anydata> queryParam = {"query": query, "sessionId": sessionId, "username": username, "accountId": accountId, "project": project, "issueKey": issueKey, "startAt": startAt, "maxResults": maxResults, "actionDescriptorId": actionDescriptorId, "recommend": recommend};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Find users with permissions
    #
    # + permissions - A comma separated list of permissions. Permissions can be specified as any:
    # + query - A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
    # + username - This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    # + accountId - A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
    # + issueKey - The issue key for the issue.
    # + projectKey - The project key for the project (case sensitive).
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function findUsersWithAllPermissions(string permissions, string? query = (), string? username = (), string? accountId = (), string? issueKey = (), string? projectKey = (), int? startAt = 0, int? maxResults = 50) returns UserArr|error {
        string  path = string `/rest/api/2/user/permission/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "permissions": permissions, "issueKey": issueKey, "projectKey": projectKey, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
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
    remote isolated function findUsersForPicker(string query, int? maxResults = 50, boolean? showAvatar = false, string[]? exclude = (), string[]? excludeAccountIds = (), string? avatarSize = (), boolean? excludeConnectUsers = false) returns FoundUsers|error {
        string  path = string `/rest/api/2/user/picker`;
        map<anydata> queryParam = {"query": query, "maxResults": maxResults, "showAvatar": showAvatar, "exclude": exclude, "excludeAccountIds": excludeAccountIds, "avatarSize": avatarSize, "excludeConnectUsers": excludeConnectUsers};
        path = path + check getPathForQueryParam(queryParam);
        FoundUsers response = check self.clientEp-> get(path, targetType = FoundUsers);
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
    remote isolated function findUsers(string? query = (), string? username = (), string? accountId = (), int? startAt = 0, int? maxResults = 50, string? property = ()) returns UserArr|error {
        string  path = string `/rest/api/2/user/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "startAt": startAt, "maxResults": maxResults, "property": property};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Find users by query
    #
    # + query - The search query.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function findUsersByQuery(string query, int? startAt = 0, int? maxResults = 100) returns PageBeanUser|error {
        string  path = string `/rest/api/2/user/search/query`;
        map<anydata> queryParam = {"query": query, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanUser response = check self.clientEp-> get(path, targetType = PageBeanUser);
        return response;
    }
    # Find user keys by query
    #
    # + query - The search query.
    # + startAt - The index of the first item to return in a page of results (page offset).
    # + maxResults - The maximum number of items to return per page.
    # + return - Returned if the request is successful.
    remote isolated function findUserKeysByQuery(string query, int? startAt = 0, int? maxResults = 100) returns PageBeanUserKey|error {
        string  path = string `/rest/api/2/user/search/query/key`;
        map<anydata> queryParam = {"query": query, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        PageBeanUserKey response = check self.clientEp-> get(path, targetType = PageBeanUserKey);
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
    remote isolated function findUsersWithBrowsePermission(string? query = (), string? username = (), string? accountId = (), string? issueKey = (), string? projectKey = (), int? startAt = 0, int? maxResults = 50) returns UserArr|error {
        string  path = string `/rest/api/2/user/viewissue/search`;
        map<anydata> queryParam = {"query": query, "username": username, "accountId": accountId, "issueKey": issueKey, "projectKey": projectKey, "startAt": startAt, "maxResults": maxResults};
        path = path + check getPathForQueryParam(queryParam);
        UserArr response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam) returns string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach var [key, value] in queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
