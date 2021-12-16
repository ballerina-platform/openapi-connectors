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

# Properties of a workflow status.
public type WorkflowStatusProperties record {
    # Whether issues are editable in this status.
    boolean issueEditable;
};

# Details about a notification associated with an event.
public type EventNotification record {
    # Expand options that include additional event notification details in the response.
    string expand?;
    # The ID of the notification.
    int id?;
    # Identifies the recipients of the notification.
    string notificationType?;
    # The value of the `notificationType`:
    # 
    #  *  `User` The `parameter` is the user account ID.
    #  *  `Group` The `parameter` is the group name.
    #  *  `ProjectRole` The `parameter` is the project role ID.
    #  *  `UserCustomField` The `parameter` is the ID of the custom field.
    #  *  `GroupCustomField` The `parameter` is the ID of the custom field.
    string 'parameter?;
    # The specified group.
    GroupName 'group?;
    # The custom user or group field.
    FieldDetails 'field?;
    # The email address.
    string emailAddress?;
    # The specified project role.
    ProjectRole projectRole?;
    # The specified user.
    UserDetails user?;
};

# List of issue transitions.
public type Transitions record {
    # Expand options that include additional transitions details in the response.
    string expand?;
    # List of issue transitions.
    IssueTransition[] transitions?;
};

# List of user account IDs.
public type UserKey record {
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Returns *unknown* if the record is deleted and corrupted, for example, as the result of a server import.
    string accountId?;
};

# Properties that identify a workflow.
public type WorkflowId record {
    # The name of the workflow.
    string name;
    # Whether the workflow is in the draft state.
    boolean draft;
};

# The workflow transition rule conditions tree.
public type WorkflowCondition WorkflowSimpleCondition|WorkflowCompoundCondition;

# Details about a project landing page.
public type ProjectLandingPageInfo record {
    # Project landing page url.
    string url?;
    # Unique project key.
    string projectKey?;
    # Type of a project.
    string projectType?;
    # Board ID of project landing page.
    int boardId?;
    # Whether project landing page is simplified.
    boolean simplified?;
};

# The linked item.
public type RemoteObject record {
    # The URL of the item.
    string url;
    # The title of the item.
    string title;
    # The summary details of the item.
    string summary?;
    # Details of the icon for the item. If no icon is defined, the default link icon is used in Jira.
    Icon icon?;
    # The status of the item.
    Status status?;
};

# Details of an issue type.
public type IssueTypeInfo record {
    # The ID of the issue type.
    int id?;
    # The name of the issue type.
    string name?;
    # The avatar of the issue type.
    int avatarId?;
};

# Details of a field configuration.
public type FieldConfiguration record {
    # The ID of the field configuration.
    int id;
    # The name of the field configuration.
    string name;
    # The description of the field configuration.
    string description;
    # Whether the field configuration is the default.
    boolean isDefault?;
};

# The status of the item.
public type Status record {
    # Whether the item is resolved. If set to "true", the link to the issue is displayed in a strikethrough font, otherwise the link displays in normal font.
    boolean resolved?;
    # Details of the icon representing the status. If not provided, no status icon displays in Jira.
    Icon icon?;
};

# Details of configurations for a custom field.
public type CustomFieldConfigurations record {
    # The list of custom field configuration details.
    ContextualConfiguration[1000] configurations;
};

# Details of a changed worklog.
public type ChangedWorklog record {
    # The ID of the worklog.
    int worklogId?;
    # The datetime of the change.
    int updatedTime?;
    # Details of properties associated with the change.
    EntityProperty[] properties?;
};

# Details bulk operation error result.
public type BulkOperationErrorResult record {
    # Bulk operation error result status.
    int status?;
    # Error messages from an operation.
    ErrorCollection elementErrors?;
    # Bulk operation error failed element number.
    int failedElementNumber?;
};

# List of issues and JQL queries.
public type IssuesAndJQLQueries record {
    # A list of JQL queries.
    string[] jqls;
    # A list of issue IDs.
    int[] issueIds;
};

# A workflow transition rule.
public type ConnectWorkflowTransitionRule record {
    # The ID of the transition rule.
    string id;
    # The key of the rule, as defined in the Connect app descriptor.
    string 'key;
    # A rule configuration.
    RuleConfiguration configuration;
    # A workflow transition.
    WorkflowTransition transition?;
};

# A simple wrapper group name.
public type SimpleListWrapperGroupName record {
    # list wrapper group size
    int size?;
    # Array of list wrapper group names.
    GroupName[] items?;
    # A callback.
    ListWrapperCallbackGroupName pagingCallback?;
    # A callback.
    ListWrapperCallbackGroupName callback?;
    # Maximum possible results.
    int 'max\-results?;
};

# The details of a workflow.
public type CreateWorkflowDetails record {
    # The name of the workflow. The name must be unique. The maximum length is 255 characters. Characters can be separated by a whitespace but the name cannot start or end with a whitespace.
    string name;
    # The description of the workflow. The maximum length is 1000 characters.
    string description?;
    # The transitions of the workflow. For the request to be valid, these transitions must:
    # 
    #  *  include one *initial* transition.
    #  *  not use the same name for a *global* and *directed* transition.
    #  *  have a unique name for each *global* transition.
    #  *  have a unique 'to' status for each *global* transition.
    #  *  have unique names for each transition from a status.
    #  *  not have a 'from' status on *initial* and *global* transitions.
    #  *  have a 'from' status on *directed* transitions.
    # 
    # All the transition statuses must be included in `statuses`.
    CreateWorkflowTransitionDetails[] transitions;
    # The statuses of the workflow. Any status that does not include a transition is added to the workflow without a transition.
    CreateWorkflowStatusDetails[] statuses;
};

# A page of items.
public type PageBeanFieldConfigurationItem record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FieldConfigurationItem[] values?;
};

public type SimpleListWrapperApplicationRole record {
    int size?;
    ApplicationRole[] items?;
    ListWrapperCallbackApplicationRole pagingCallback?;
    ListWrapperCallbackApplicationRole callback?;
    int 'max\-results?;
};

# Details of the projects the option is available in.
public type IssueFieldOptionConfiguration record {
    # Defines the projects that the option is available in. If the scope is not defined, then the option is available in all projects.
    IssueFieldOptionScopeBean scope?;
    # DEPRECATED
    string[] attributes?;
};

# The details of a created custom field context.
public type CreateCustomFieldContext record {
    # The ID of the context.
    string id?;
    # The name of the context.
    string name;
    # The description of the context.
    string description?;
    # The list of project IDs associated with the context. If the list is empty, the context is global.
    string[] projectIds?;
    # The list of issue types IDs for the context. If the list is empty, the context refers to all issue types.
    string[] issueTypeIds?;
};

# List of issue level security items in a project.
public type ProjectIssueSecurityLevels record {
    # Issue level security items list.
    SecurityLevel[] levels;
};

# A list of projects in which a user is granted permissions.
public type PermittedProjects record {
    # A list of projects.
    ProjectIdentifierBean[] projects?;
};

# An icon.
public type IconBean record {
    # The URL of a 16x16 pixel icon.
    string url16x16?;
    # The title of the icon, for use as a tooltip on the icon.
    string title?;
    # The URL of the tooltip, used only for a status icon.
    string link?;
};

# A list of webhooks.
public type WebhookDetails record {
    # The JQL filter that specifies which issues the webhook is sent for. Only a subset of JQL can be used. The supported elements are:
    # 
    #  *  Fields: `issueKey`, `project`, `issuetype`, `status`, `assignee`, `reporter`, `issue.property`, and `cf[id]`. For custom fields (`cf[id]`), only the epic label custom field is supported.".
    #  *  Operators: `=`, `!=`, `IN`, and `NOT IN`.
    string jqlFilter;
    # A list of field IDs. When the issue changelog contains any of the fields, the webhook `jira:issue_updated` is sent. If this parameter is not present, the app is notified about all field updates.
    string[] fieldIdsFilter?;
    # A list of issue property keys. A change of those issue properties triggers the `issue_property_set` or `issue_property_deleted` webhooks. If this parameter is not present, the app is notified about all issue property updates.
    string[] issuePropertyKeysFilter?;
    # The Jira events that trigger the webhook.
    string[] events;
};

# Details of a permission scheme.
public type PermissionScheme record {
    # The expand options available for the permission scheme.
    string expand?;
    # The ID of the permission scheme.
    int id?;
    # The URL of the permission scheme.
    string self?;
    # The name of the permission scheme. Must be unique.
    string name;
    # A description for the permission scheme.
    string description?;
    # The scope of the permission scheme.
    Scope scope?;
    # The permission scheme to create or update. See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more information.
    PermissionGrant[] permissions?;
};

# A page of items.
public type PageBeanContext record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Context[] values?;
};

# A page of items.
public type PageBeanWebhook record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Webhook[] values?;
};

# Details about a notification.
public type Notification record {
    # The subject of the email notification for the issue. If this is not specified, then the subject is set to the issue key and summary.
    string subject?;
    # The plain text body of the email notification for the issue.
    string textBody?;
    # The HTML body of the email notification for the issue.
    string htmlBody?;
    # The recipients of the email notification for the issue.
    NotificationRecipients to?;
    # Restricts the notifications to users with the specified permissions.
    NotificationRecipientsRestrictions restrict?;
};

public type UserWriteBean record {
    # The URL of the user.
    string self?;
    # This parameter is no longer available. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # This parameter is no longer available. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # This parameter is no longer available. If the user has an Atlassian account, their password is not changed. If the user does not have an Atlassian account, they are sent an email asking them set up an account.
    string password?;
    # The email address for the user.
    string emailAddress;
    # A suggested display name for the user. If the user has an Atlassian account, their display name is not changed. If the user does not have an Atlassian account, this display name is used as a suggestion for creating an account. The user is sent an email asking them to set their display name and privacy preferences.
    string displayName;
    # Deprecated, do not use.
    string[] applicationKeys?;
};

# Status details for an issue type.
public type IssueTypeWithStatus record {
    # The URL of the issue type's status details.
    string self;
    # The ID of the issue type.
    string id;
    # The name of the issue type.
    string name;
    # Whether this issue type represents subtasks.
    boolean subtask;
    # List of status details for the issue type.
    StatusDetails[] statuses;
};

# This object is used as follows:
# 
#  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it defines and reports on the type of link between the issues. Find a list of issue link types with [Get issue link types](#api-rest-api-2-issueLinkType-get).
#  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it defines and reports on issue link types.
public type IssueLinkType record {
    # The ID of the issue link type and is used as follows:
    # 
    #  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it is the type of issue link. Required on create when `name` isn't provided. Otherwise, read only.
    #  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it is read only.
    string id?;
    # The name of the issue link type and is used as follows:
    # 
    #  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it is the type of issue link. Required on create when `id` isn't provided. Otherwise, read only.
    #  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it is required on create and optional on update. Otherwise, read only.
    string name?;
    # The description of the issue link type inward link and is used as follows:
    # 
    #  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it is read only.
    #  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it is required on create and optional on update. Otherwise, read only.
    string inward?;
    # The description of the issue link type outward link and is used as follows:
    # 
    #  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it is read only.
    #  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it is required on create and optional on update. Otherwise, read only.
    string outward?;
    # The URL of the issue link type. Read only.
    string self?;
};

# A status category.
public type StatusCategory record {
    # The URL of the status category.
    string self?;
    # The ID of the status category.
    int id?;
    # The key of the status category.
    string 'key?;
    # The name of the color used to represent the status category.
    string colorName?;
    # The name of the status category.
    string name?;
};

# Details of a worklog.
public type Worklog record {
    # The URL of the worklog item.
    string self?;
    # Details of the user who created the worklog.
    UserDetails author?;
    # Details of the user who last updated the worklog.
    UserDetails updateAuthor?;
    # A comment about the worklog. Optional when creating or updating a worklog.
    string comment?;
    # The datetime on which the worklog was created.
    string created?;
    # The datetime on which the worklog was last updated.
    string updated?;
    # Details about any restrictions in the visibility of the worklog. Optional when creating or updating a worklog.
    Visibility visibility?;
    # The datetime on which the worklog effort was started. Required when creating a worklog. Optional when updating a worklog.
    string started?;
    # The time spent working on the issue as days (\#d), hours (\#h), or minutes (\#m or \#). Required when creating a worklog if `timeSpentSeconds` isn't provided. Optional when updating a worklog. Cannot be provided if `timeSpentSecond` is provided.
    string timeSpent?;
    # The time in seconds spent working on the issue. Required when creating a worklog if `timeSpent` isn't provided. Optional when updating a worklog. Cannot be provided if `timeSpent` is provided.
    int timeSpentSeconds?;
    # The ID of the worklog record.
    string id?;
    # The ID of the issue this worklog is for.
    string issueId?;
    # Details of properties for the worklog. Optional when creating or updating a worklog.
    EntityProperty[] properties?;
};

# An operand that can be part of a list operand.
public type JqlQueryUnitaryOperand ValueOperand|FunctionOperand|KeywordOperand;

# Details about a licensed Jira application.
public type LicensedApplication record {
    # The ID of the application.
    string id;
    # The licensing plan.
    string plan;
};

# The field configuration for an issue type.
public type FieldConfigurationIssueTypeItem record {
    # The ID of the field configuration scheme.
    string fieldConfigurationSchemeId;
    # The ID of the issue type or *default*. When set to *default* this field configuration issue type item applies to all issue types without a field configuration.
    string issueTypeId;
    # The ID of the field configuration.
    string fieldConfigurationId;
};

# Details of names changed in the record event.
public type ChangedValueBean record {
    # The name of the field changed.
    string fieldName?;
    # The value of the field before the change.
    string changedFrom?;
    # The value of the field after the change.
    string changedTo?;
};

# A workflow transition rule.
public type WorkflowTransitionRule record {
    # The type of the transition rule.
    string 'type;
    # EXPERIMENTAL. The configuration of the transition rule.
    anydata configuration?;
};

# Bulk issue property update request details.
public type BulkIssuePropertyUpdateRequest record {
    # The value of the property. The value must be a [valid](https://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.
    anydata value?;
    # EXPERIMENTAL. The Jira expression to calculate the value of the property. The value of the expression must be an object that can be converted to JSON, such as a number, boolean, string, list, or map. The context variables available to the expression are `issue` and `user`. Issues for which the expression returns a value whose JSON representation is longer than 32768 characters are ignored.
    string expression?;
    # Bulk operation filter details.
    IssueFilterForBulkPropertySet filter?;
};

# Record define the permission bean.
public type PermissionsKeysBean record {
    # A list of permission keys.
    string[] permissions;
};

# The details of a workflow transition.
public type CreateWorkflowTransitionDetails record {
    # The name of the transition. The maximum length is 60 characters.
    string name;
    # The description of the transition. The maximum length is 1000 characters.
    string description?;
    # The statuses the transition can start from.
    string[] 'from?;
    # The status the transition goes to.
    string to;
    # The type of the transition.
    string 'type;
};

# An operand that is a user-provided value.
public type ValueOperand record {
    # The operand value.
    string value;
};

# List of all permission schemes.
public type PermissionSchemes record {
    # Permission schemes list.
    PermissionScheme[] permissionSchemes?;
};

# A page of items.
public type PageBeanScreen record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Screen[] values?;
};

# Details about the roles in a project.
public type ProjectRole record {
    # The URL the project role details.
    string self?;
    # The name of the project role.
    string name?;
    # The ID of the project role.
    int id?;
    # The description of the project role.
    string description?;
    # The list of users who act in this role.
    RoleActor[] actors?;
    # The scope of the role. Indicated for roles associated with [next-gen projects](https://confluence.atlassian.com/x/loMyO).
    Scope scope?;
    # The translated name of the project role.
    string translatedName?;
    # Whether the calling user is part of this role.
    boolean currentUserRole?;
    # Whether this role is the admin role for the project.
    boolean admin?;
    # Whether the roles are configurable for this project.
    boolean roleConfigurable?;
    # Whether this role is the default role for the project
    boolean 'default?;
};

# The ID of an issue type scheme.
public type IssueTypeSchemeID record {
    # The ID of the issue type scheme.
    string issueTypeSchemeId;
};

# A page of items.
public type PageBeanIssueTypeToContextMapping record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeToContextMapping[] values?;
};

public type IssueTypeUpdateBean record {
    # The unique name for the issue type. The maximum length is 60 characters.
    string name?;
    # The description of the issue type.
    string description?;
    # The ID of an issue type avatar.
    int avatarId?;
};

# A workflow transition.
public type WorkflowTransition record {
    # The transition ID.
    int id;
    # The transition name.
    string name;
};

# Details of any errors encountered while updating workflow transition rules for a workflow.
public type WorkflowTransitionRulesUpdateErrorDetails record {
    # Properties that identify a workflow.
    WorkflowId workflowId;
    # A list of transition rule update errors, indexed by the transition rule ID. Any transition rule that appears here wasn't updated.
    record {} ruleUpdateErrors;
    # The list of errors that specify why the workflow update failed. The workflow was not updated if the list contains any entries.
    string[] updateErrors;
};

# A screen with tab details.
public type ScreenWithTab record {
    # The ID of the screen.
    int id?;
    # The name of the screen.
    string name?;
    # The description of the screen.
    string description?;
    # The scope of the screen.
    Scope scope?;
    # The tab for the screen
    ScreenableTab tab?;
};

# Property key details.
public type PropertyKey record {
    # The URL of the property.
    string self?;
    # The key of the property.
    string 'key?;
};

# Error messages from an operation.
public type ErrorCollection record {
    # The list of error messages produced by this operation. For example, "input parameter 'key' must be provided"
    string[] errorMessages?;
    # The list of errors by parameter returned by the operation. For example,"projectKey": "Project keys must start with an uppercase letter, followed by one or more uppercase alphanumeric characters."
    record {} errors?;
    # Status of error
    int status?;
};

# Record define the included fields.
public type IncludedFields record {
    # Fields which are included.
    string[] included?;
    # Fields which are included.
    string[] excluded?;
    # Fields which are actuually included.
    string[] actuallyIncluded?;
};

public type NestedResponse record {
    int status?;
    # Error messages from an operation.
    ErrorCollection errorCollection?;
};

# A page of changelogs.
public type PageOfChangelogs record {
    # The index of the first item returned on the page.
    int startAt?;
    # The maximum number of results that could be on the page.
    int maxResults?;
    # The number of results on the page.
    int total?;
    # The list of changelogs.
    Changelog[] histories?;
};

# Details of an item associated with the changed record.
public type AssociatedItemBean record {
    # The ID of the associated record.
    string id?;
    # The name of the associated record.
    string name?;
    # The type of the associated record.
    string typeName?;
    # The ID of the associated parent record.
    string parentId?;
    # The name of the associated parent record.
    string parentName?;
};

# Details about an attachment.
public type Attachment record {
    # The URL of the attachment details response.
    string self?;
    # The ID of the attachment.
    string id?;
    # The file name of the attachment.
    string filename?;
    # Details of the user who added the attachment.
    UserDetails author?;
    # The datetime the attachment was created.
    string created?;
    # The size of the attachment.
    int size?;
    # The MIME type of the attachment.
    string mimeType?;
    # The content of the attachment.
    string content?;
    # The URL of a thumbnail representing the attachment.
    string thumbnail?;
};

# Details of a field that can be used in advanced searches.
public type FieldReferenceData record {
    # The field identifier.
    string value?;
    # The display name contains the following:
    # 
    #  *  for system fields, the field name. For example, `Summary`.
    #  *  for collapsed custom fields, the field name followed by a hyphen and then the field name and field type. For example, `Component - Component[Dropdown]`.
    #  *  for other custom fields, the field name followed by a hyphen and then the custom field ID. For example, `Component - cf[10061]`.
    string displayName?;
    # Whether the field can be used in a query's `ORDER BY` clause.
    string orderable?;
    # Whether the content of this field can be searched.
    string searchable?;
    # Whether the field provide auto-complete suggestions.
    string auto?;
    # If the item is a custom field, the ID of the custom field.
    string cfid?;
    # The valid search operators for the field.
    string[] operators?;
    # The data types of items in the field.
    string[] types?;
};

# An operand that is a list of values.
public type ListOperand record {
    # The list of operand values.
    JqlQueryUnitaryOperand[] values;
};

# Details of the scope of the default sharing for new filters and dashboards.
public type DefaultShareScope record {
    # The scope of the default sharing for new filters and dashboards:
    # 
    #  *  `AUTHENTICATED` Shared with all logged-in users.
    #  *  `GLOBAL` Shared with all logged-in users. This shows as `AUTHENTICATED` in the response.
    #  *  `PRIVATE` Not shared with any users.
    string scope;
};

# Details of webhooks to register.
public type WebhookRegistrationDetails record {
    # A list of webhooks.
    WebhookDetails[] webhooks;
    # The URL that specifies where to send the webhooks. This URL must use the same base URL as the Connect app.
    string url;
};

# Details about a project version.
public type Version record {
    # Use [expand](em>#expansion) to include additional information about version in the response. This parameter accepts a comma-separated list. Expand options include:
    # 
    #  *  `operations` Returns the list of operations available for this version.
    #  *  `issuesstatus` Returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.
    # 
    # Optional for create and update.
    string expand?;
    # The URL of the version.
    string self?;
    # The ID of the version.
    string id?;
    # The description of the version. Optional when creating or updating a version.
    string description?;
    # The unique name of the version. Required when creating a version. Optional when updating a version. The maximum length is 255 characters.
    string name?;
    # Indicates that the version is archived. Optional when creating or updating a version.
    boolean archived?;
    # Indicates that the version is released. If the version is released a request to release again is ignored. Not applicable when creating a version. Optional when updating a version.
    boolean released?;
    # The start date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.
    string startDate?;
    # The release date of the version. Expressed in ISO 8601 format (yyyy-mm-dd). Optional when creating or updating a version.
    string releaseDate?;
    # Indicates that the version is overdue.
    boolean overdue?;
    # The date on which work on this version is expected to start, expressed in the instance's *Day/Month/Year Format* date format.
    string userStartDate?;
    # The date on which work on this version is expected to finish, expressed in the instance's *Day/Month/Year Format* date format.
    string userReleaseDate?;
    # Deprecated. Use `projectId`.
    string project?;
    # The ID of the project to which this version is attached. Required when creating a version. Not applicable when updating a version.
    int projectId?;
    # The URL of the self link to the version to which all unfixed issues are moved when a version is released. Not applicable when creating a version. Optional when updating a version.
    string moveUnfixedIssuesTo?;
    # If the expand option `operations` is used, returns the list of operations available for this version.
    SimpleLink[] operations?;
    # If the expand option `issuesstatus` is used, returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property contains a count of issues with a status other than *to do*, *in progress*, and *done*.
    VersionIssuesStatus issuesStatusForFixVersion?;
};

# Details of an issue level security item.
public type SecurityLevel record {
    # The URL of the issue level security item.
    string self?;
    # The ID of the issue level security item.
    string id?;
    # The description of the issue level security item.
    string description?;
    # The name of the issue level security item.
    string name?;
};

# Details of a custom field context.
public type CustomFieldContextUpdateDetails record {
    # The name of the custom field context. The name must be unique. The maximum length is 255 characters.
    string name?;
    # The description of the custom field context. The maximum length is 255 characters.
    string description?;
};

# Details about a security scheme.
public type SecurityScheme record {
    # The URL of the issue security scheme.
    string self?;
    # The ID of the issue security scheme.
    int id?;
    # The name of the issue security scheme.
    string name?;
    # The description of the issue security scheme.
    string description?;
    # The ID of the default security level.
    int defaultSecurityLevelId?;
    # Level of security.
    SecurityLevel[] levels?;
};

# Details about a workflow.
public type DeprecatedWorkflow record {
    # The name of the workflow.
    string name?;
    # The description of the workflow.
    string description?;
    # The datetime the workflow was last modified.
    string lastModifiedDate?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string lastModifiedUser?;
    # The account ID of the user that last modified the workflow.
    string lastModifiedUserAccountId?;
    # The number of steps included in the workflow.
    int steps?;
    # The scope where this workflow applies
    Scope scope?;
    # Whether default or not
    boolean 'default?;
};

# A page of items.
public type PageBeanCustomFieldContextDefaultValue record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    CustomFieldContextDefaultValue[] values?;
};

# A page of items.
public type PageBeanFieldConfigurationSchemeProjects record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FieldConfigurationSchemeProjects[] values?;
};

# Details of an application property.
public type ApplicationProperty record {
    # The ID of the application property. The ID and key are the same.
    string id?;
    # The key of the application property. The ID and key are the same.
    string 'key?;
    # The new value.
    string value?;
    # The name of the application property.
    string name?;
    # The description of the application property.
    string desc?;
    # The data type of the application property.
    string 'type?;
    # The default value of the application property.
    string defaultValue?;
    # The example of application property.
    string example?;
    # The allowed values, if applicable.
    string[] allowedValues?;
};

# Properties that identify a published workflow.
public type PublishedWorkflowId record {
    # The name of the workflow.
    string name;
    # The entity ID of the workflow.
    string entityId?;
};

# Container for a list of webhook IDs.
public type ContainerForWebhookIDs record {
    # A list of webhook IDs.
    int[] webhookIds;
};

# Default value for a multi-select custom field.
public type CustomFieldContextDefaultValueMultipleOption record {
    # The ID of the context.
    string contextId;
    # The list of IDs of the default options.
    string[] optionIds;
    # The type of multi-select custom field
    string 'type;
};

# Details of an operation to perform on a field.
public type FieldUpdateOperation record {
    # A map containing the name of a field and the value to add to it.
    anydata add?;
    # A map containing the name of a field and the value to set in it.
    anydata set?;
    # A map containing the name of a field and the value to removed from it.
    anydata remove?;
    # A map containing the name of a field and the value to edit in it.
    anydata edit?;
};

# An icon. If no icon is defined:
# 
#  *  for a status icon, no status icon displays in Jira.
#  *  for the remote object icon, the default link icon displays in Jira.
public type Icon record {
    # The URL of an icon that displays at 16x16 pixel in Jira.
    string url16x16?;
    # The title of the icon. This is used as follows:
    # 
    #  *  For a status icon it is used as a tooltip on the icon. If not set, the status icon doesn't display a tooltip in Jira.
    #  *  For the remote object icon it is used in conjunction with the application name to display a tooltip for the link's icon. The tooltip takes the format "\[application name\] icon title". Blank itemsare excluded from the tooltip title. If both items are blank, the icon tooltop displays as "Web Link".
    string title?;
    # The URL of the tooltip, used only for a status icon. If not set, the status icon in Jira is not clickable.
    string link?;
};

public type SearchRequestBean record {
    # A [JQL](https://confluence.atlassian.com/x/egORLQ) expression.
    string jql?;
    # The index of the first item to return in the page of results (page offset). The base index is `0`.
    int startAt?;
    # The maximum number of items to return per page.
    int maxResults?;
    # A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:
    # 
    #  *  `*all` Returns all fields.
    #  *  `*navigable` Returns navigable fields.
    #  *  Any issue field, prefixed with a minus to exclude.
    # 
    # The default is `*navigable`.
    # 
    # Examples:
    # 
    #  *  `summary,comment` Returns the summary and comments fields only.
    #  *  `-description` Returns all navigable (default) fields except description.
    #  *  `*all,-comment` Returns all fields except comments.
    # 
    # Multiple `fields` parameters can be included in a request.
    # 
    # Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-2-issue-issueIdOrKey-get) where the default is all fields.
    string[] fields?;
    # Determines how to validate the JQL query and treat the validation results. Supported values:
    # 
    #  *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).
    #  *  `warn` Returns all errors as warnings.
    #  *  `none` No validation is performed.
    #  *  `true` *Deprecated* A legacy synonym for `strict`.
    #  *  `false` *Deprecated* A legacy synonym for `warn`.
    # 
    # The default is `strict`.
    # 
    # Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value.
    string validateQuery?;
    # Use [expand](em>#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a list of values. The expand options are:
    # 
    #  *  `renderedFields` Returns field values rendered in HTML format.
    #  *  `names` Returns the display name of each field.
    #  *  `schema` Returns the schema describing a field type.
    #  *  `transitions` Returns all possible transitions for the issue.
    #  *  `operations` Returns all possible operations for the issue.
    #  *  `editmeta` Returns information about how each field can be edited.
    #  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.
    #  *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.
    string[] expand?;
    # A list of up to 5 issue properties to include in the results. This parameter accepts a comma-separated list.
    string[] properties?;
    # Reference fields by their key (rather than ID). The default is `false`.
    boolean fieldsByKeys?;
};

public type AddFieldBean record {
    # The ID of the field to add.
    string fieldId;
};

# Bulk operation filter details.
public type IssueFilterForBulkPropertySet record {
    # List of issues to perform the bulk operation on.
    int[] entityIds?;
    # The value of properties to perform the bulk operation on.
    anydata currentValue?;
    # Whether the bulk operation occurs only when the property is present on or absent from an issue.
    boolean hasProperty?;
};

# A field within a field configuration.
public type FieldConfigurationItem record {
    # The ID of the field within the field configuration.
    string id;
    # The description of the field within the field configuration.
    string description?;
    # Whether the field is hidden in the field configuration.
    boolean isHidden?;
    # Whether the field is required in the field configuration.
    boolean isRequired?;
};

# Details of a custom field option for a context.
public type CustomFieldOptionUpdate record {
    # The ID of the custom field option.
    string id;
    # The value of the custom field option.
    string value?;
    # Whether the option is disabled.
    boolean disabled?;
};

# A list of parsed JQL queries.
public type ParsedJqlQueries record {
    # A list of parsed JQL queries.
    ParsedJqlQuery[] queries;
};

# The ID of a screen scheme.
public type UpdateDefaultScreenScheme record {
    # The ID of the screen scheme.
    string screenSchemeId;
};

# Details about the default workflow.
public type DefaultWorkflow record {
    # The name of the workflow to set as the default workflow.
    string workflow;
    # Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new default workflow. Defaults to `false`.
    boolean updateDraftIfNeeded?;
};

# List of changed worklogs.
public type ChangedWorklogs record {
    # Changed worklog list.
    ChangedWorklog[] values?;
    # The datetime of the first worklog item in the list.
    int since?;
    # The datetime of the last worklog item in the list.
    int until?;
    # The URL of this changed worklogs list.
    string self?;
    # The URL of the next list of changed worklogs.
    string nextPage?;
    # Whether it is the langepage or not.
    boolean lastPage?;
};

# The date the newly refreshed webhooks expire.
public type WebhooksExpirationDate record {
    # Expiration date.
    int expirationDate;
};

# Paginated list of worklog details
public type PageOfWorklogs record {
    # The index of the first item returned on the page.
    int startAt?;
    # The maximum number of results that could be on the page.
    int maxResults?;
    # The number of results on the page.
    int total?;
    # List of worklogs.
    Worklog[] worklogs?;
};

# A container for a list of workflow schemes together with the projects they are associated with.
public type ContainerOfWorkflowSchemeAssociations record {
    # A list of workflow schemes together with projects they are associated with.
    WorkflowSchemeAssociations[] values;
};

# Details of a field.
public type Field record {
    # The ID of the field.
    string id;
    # The name of the field.
    string name;
    # The schema of a field.
    JsonTypeBean schema;
    # The description of the field.
    string description?;
    # The key of the field.
    string 'key?;
    # Whether the field is locked.
    boolean isLocked?;
    # The searcher key of the field. Returned for custom fields.
    string searcherKey?;
    # Number of screens where the field is used.
    int screensCount?;
    # Number of contexts where the field is used.
    int contextsCount?;
    # Information about the most recent use of a field.
    FieldLastUsed lastUsed?;
};

# Details about the Jira instance.
public type ServerInformation record {
    # The base URL of the Jira instance.
    string baseUrl?;
    # The version of Jira.
    string 'version?;
    # The major, minor, and revision version numbers of the Jira version.
    int[] versionNumbers?;
    # The type of server deployment. This is always returned as *Cloud*.
    string deploymentType?;
    # The build number of the Jira version.
    int buildNumber?;
    # The timestamp when the Jira version was built.
    string buildDate?;
    # The time in Jira when this request was responded to.
    string serverTime?;
    # The unique identifier of the Jira version.
    string scmInfo?;
    # The name of the Jira instance.
    string serverTitle?;
    # Jira instance health check results. Deprecated and no longer returned.
    HealthCheckResult[] healthChecks?;
};

# Details of a custom option for a field.
public type CustomFieldOption record {
    # The URL of these custom field option details.
    string self?;
    # The value of the custom field option.
    string value?;
};

# Default value for a cascading select custom field.
public type CustomFieldContextDefaultValueCascadingOption record {
    # The ID of the context.
    string contextId;
    # The ID of the default option.
    string optionId;
    # The ID of the default cascading option.
    string cascadingOptionId?;
    # The type of the default cascading option.
    string 'type;
};

# The project and issue type mapping.
public type ProjectIssueTypeMapping record {
    # The ID of the project.
    string projectId;
    # The ID of the issue type.
    string issueTypeId;
};

# A paginated list of users sharing the filter. This includes users that are members of the groups or can browse the projects that the filter is shared with.
public type UserList record {
    # The number of items on the page.
    int size?;
    # The list of items.
    User[] items?;
    # The maximum number of results that could be on the page.
    int 'max\-results?;
    # The index of the first item returned on the page.
    int 'start\-index?;
    # The index of the last item returned on the page.
    int 'end\-index?;
};

# A page containing dashboard details.
public type PageOfDashboards record {
    # The index of the first item returned on the page.
    int startAt?;
    # The maximum number of results that could be on the page.
    int maxResults?;
    # The number of results on the page.
    int total?;
    # The URL of the previous page of results, if any.
    string prev?;
    # The URL of the next page of results, if any.
    string next?;
    # List of dashboards.
    Dashboard[] dashboards?;
};

# Issue type screen scheme with a list of the projects that use it.
public type IssueTypeScreenSchemesProjects record {
    # Details of an issue type screen scheme.
    IssueTypeScreenScheme issueTypeScreenScheme;
    # The IDs of the projects using the issue type screen scheme.
    string[] projectIds;
};

# Details of the identifiers for a created or updated remote issue link.
public type RemoteIssueLinkIdentifies record {
    # The ID of the remote issue link, such as the ID of the item on the remote system.
    int id?;
    # The URL of the remote issue link.
    string self?;
};

# A page of items.
public type PageBeanIssueTypeScreenSchemeItem record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeScreenSchemeItem[] values?;
};

# A list of issue IDs and the value to update a custom field to.
public type CustomFieldValueUpdate record {
    # The list of issue IDs.
    int[] issueIds;
    # The value for the custom field. The value must be compatible with the [custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#data-types) as follows:
    # 
    #  *  `string` – the value must be a string.
    #  *  `number` – the value must be a number.
    #  *  `datetime` – the value must be a string that represents a date in the ISO format, for example `"2021-01-18T12:00:00-03:00"`.
    #  *  `user` – the value must be an object that contains the `accountId` field.
    #  *  `group` – the value must be an object that contains the group `name` field.
    # 
    # A list of appropriate values must be provided if the field is of the `list` [collection type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#collection-types).
    anydata value;
};

# Details of how to filter and list search auto complete information.
public type SearchAutoCompleteFilter record {
    # List of project IDs used to filter the visible field details returned.
    int[] projectIds?;
    # Include collapsed fields for fields that have non-unique names.
    boolean includeCollapsedFields?;
};

# Details of an avatar.
public type Avatar record {
    # The ID of the avatar.
    string id;
    # The owner of the avatar. For a system avatar the owner is null (and nothing is returned). For non-system avatars this is the appropriate identifier, such as the ID for a project or the account ID for a user.
    string owner?;
    # Whether the avatar is a system avatar.
    boolean isSystemAvatar?;
    # Whether the avatar is used in Jira. For example, shown as a project's avatar.
    boolean isSelected?;
    # Whether the avatar can be deleted.
    boolean isDeletable?;
    # The file name of the avatar icon. Returned for system avatars.
    string fileName?;
    # The list of avatar icon URLs.
    record {} urls?;
};

# List of custom fields using the version.
public type VersionUsageInCustomField record {
    # The name of the custom field.
    string fieldName?;
    # The ID of the custom field.
    int customFieldId?;
    # Count of the issues where the custom field contains the version.
    int issueCountWithVersionInCustomField?;
};

# The description of the page of issues loaded by the provided JQL query.
public type IssuesJqlMetaDataBean record {
    # The index of the first issue.
    int startAt;
    # The maximum number of issues that could be loaded in this evaluation.
    int maxResults;
    # The number of issues that were loaded in this evaluation.
    int count;
    # The total number of issues the JQL returned.
    int totalCount;
    # Any warnings related to the JQL query. Present only if the validation mode was set to `warn`.
    string[] validationWarnings?;
};

# A page of items.
public type PageBeanIssueTypeSchemeMapping record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeSchemeMapping[] values?;
};

# Details about the issues created and the errors for requests that failed.
public type CreatedIssues record {
    # Details of the issues created.
    CreatedIssue[] issues?;
    # Error details for failed issue creation requests.
    BulkOperationErrorResult[] errors?;
};

# Count of a version's unresolved issues.
public type VersionUnresolvedIssuesCount record {
    # The URL of these count details.
    string self?;
    # Count of unresolved issues.
    int issuesUnresolvedCount?;
    # Count of issues.
    int issuesCount?;
};

public type WorklogIdsRequestBean record {
    # A list of worklog IDs.
    int[] ids;
};

# Details of an issue remote link.
public type RemoteIssueLink record {
    # The ID of the link.
    int id?;
    # The URL of the link.
    string self?;
    # The global ID of the link, such as the ID of the item on the remote system.
    string globalId?;
    # Details of the remote application the linked item is in.
    Application application?;
    # Description of the relationship between the issue and the linked item.
    string relationship?;
    # Details of the item linked to.
    RemoteObject 'object?;
};

# Details about a license for the Jira instance.
public type License record {
    # The applications under this license.
    LicensedApplication[] applications;
};

# The details of a transition status.
public type CreateWorkflowStatusDetails record {
    # The ID of the status.
    string id;
};

# Record defines a json node.
public type JsonNode record {
    # Existance of floating point numbers in node.
    boolean floatingPointNumber?;
    # Elements in node.
    record {} elements?;
    # Existance of pojo in node.
    boolean pojo?;
    # Existance of numbers in node.
    boolean number?;
    # Existance of integral numbers in node.
    boolean integralNumber?;
    # Existance of integers in node.
    boolean 'int?;
    # Existance of long type in node.
    boolean long?;
    # Existance of double type in node.
    boolean double?;
    # Existance of big decimal numbers in node.
    boolean bigDecimal?;
    # Existance of big integers in node.
    boolean bigInteger?;
    # Existance of textual representation in node.
    boolean textual?;
    # Existance of boolean in node.
    boolean 'boolean?;
    # Existance of binary numbers in node.
    boolean binary?;
    # Existance of container nodes.
    boolean containerNode?;
    # Existance of missing nodes.
    boolean missingNode?;
    # Existance of objects in node.
    boolean 'object?;
    # Values in node.
    boolean valueNode?;
    # Number value in node.
    decimal numberValue?;
    # Number type in node.
    string numberType?;
    # Integer value in node.
    int intValue?;
    # Long value in node.
    int longValue?;
    # Big integer value in node.
    int bigIntegerValue?;
    # Double value in node.
    float doubleValue?;
    # Decimal value in node.
    decimal decimalValue?;
    # Boolean value in node.
    boolean booleanValue?;
    # Binary values in node.
    string[] binaryValue?;
    # Integer representation of value in node.
    int valueAsInt?;
    # Long representation of value in node.
    int valueAsLong?;
    # :Double representation of value in node.
    float valueAsDouble?;
    # Boolean representation of value in node.
    boolean valueAsBoolean?;
    # Field names in node.
    record {} fieldNames?;
    # Text value in node.
    string textValue?;
    # Text representation of value in node.
    string valueAsText?;
    # Existance of array in node.
    boolean array?;
    # Fields in node.
    record {} fields?;
    # Null type in node.
    boolean 'null?;
};

public type IssueTypeCreateBean record {
    # The unique name for the issue type. The maximum length is 60 characters.
    string name;
    # The description of the issue type.
    string description?;
    # Deprecated. Use `hierarchyLevel` instead.
    # 
    # Whether the issue type is `subtype` or `standard`. Defaults to `standard`.
    string 'type?;
    # The hierarchy level of the issue type. Use:
    # 
    #  *  `-1` for Subtask.
    #  *  `0` for Base.
    # 
    # Defaults to `0`.
    int hierarchyLevel?;
};

# Details about a created issue or subtask.
public type CreatedIssue record {
    # The ID of the created issue or subtask.
    string id?;
    # The key of the created issue or subtask.
    string 'key?;
    # The URL of the created issue or subtask.
    string self?;
    # The response code and messages related to any requested transition.
    NestedResponse transition?;
};

public type ConnectModules record {
    # A list of app modules in the same format as the `modules` property in the
    # [app descriptor](https://developer.atlassian.com/cloud/jira/platform/app-descriptor/).
    ConnectModule[] modules;
};

# Details about a task.
public type TaskProgressBeanRemoveOptionFromIssuesResult record {
    # The URL of the task.
    string self;
    # The ID of the task.
    string id;
    # The description of the task.
    string description?;
    # The status of the task.
    string status;
    # Information about the progress of the task.
    string message?;
    # The result of the task execution.
    RemoveOptionFromIssuesResult result?;
    # The ID of the user who submitted the task.
    int submittedBy;
    # The progress of the task, as a percentage complete.
    int progress;
    # The execution time of the task, in milliseconds.
    int elapsedRuntime;
    # A timestamp recording when the task was submitted.
    int submitted;
    # A timestamp recording when the task was started.
    int started?;
    # A timestamp recording when the task was finished.
    int finished?;
    # A timestamp recording when the task progress was last updated.
    int lastUpdate;
};

# Default values to update.
public type CustomFieldContextDefaultValueUpdate record {
    # Default values of custom field.
    CustomFieldContextDefaultValue[] defaultValues?;
};

# Details about a next-gen project.
public type ProjectForScope record {
    # The URL of the project details.
    string self?;
    # The ID of the project.
    string id?;
    # The key of the project.
    string 'key?;
    # The name of the project.
    string name?;
    # The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
    string projectTypeKey?;
    # Whether or not the project is simplified.
    boolean simplified?;
    # The URLs of the project's avatars.
    AvatarUrlsBean avatarUrls?;
    # The category the project belongs to.
    UpdatedProjectCategory projectCategory?;
};

# A page of items.
public type PageBeanContextForProjectAndIssueType record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    ContextForProjectAndIssueType[] values?;
};

# Details of a parsed JQL query.
public type ParsedJqlQuery record {
    # The JQL query that was parsed and validated.
    string query;
    # The syntax tree of the query. Empty if the query was invalid.
    JqlQuery structure?;
    # The list of syntax or validation errors.
    string[] errors?;
};

# A page of items.
public type PageBeanFilterDetails record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FilterDetails[] values?;
};

# Container for a list of audit records.
public type AuditRecords record {
    # The number of audit items skipped before the first item in this list.
    int offset?;
    # The requested or default limit on the number of audit items to be returned.
    int 'limit?;
    # The total number of audit items returned.
    int total?;
    # The list of audit items.
    AuditRecordBean[] records?;
};

# List of permission grants.
public type PermissionGrants record {
    # Permission grants list.
    PermissionGrant[] permissions?;
    # Expand options that include additional permission grant details in the response.
    string expand?;
};

# Details of the issue creation metadata for a project.
public type ProjectIssueCreateMetadata record {
    # Expand options that include additional project issue create metadata details in the response.
    string expand?;
    # The URL of the project.
    string self?;
    # The ID of the project.
    string id?;
    # The key of the project.
    string 'key?;
    # The name of the project.
    string name?;
    # List of the project's avatars, returning the avatar size and associated URL.
    AvatarUrlsBean avatarUrls?;
    # List of the issue types supported by the project.
    IssueTypeIssueCreateMetadata[] issuetypes?;
};

# A page of items.
public type PageBeanChangelog record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Changelog[] values?;
};

# Details about the status mappings for publishing a draft workflow scheme.
public type PublishDraftWorkflowScheme record {
    # Mappings of statuses to new statuses for issue types.
    StatusMapping[] statusMappings?;
};

# A clause that asserts whether a field was changed. For example, `status CHANGED AFTER startOfMonth(-1M)`.See [CHANGED](https://confluence.atlassian.com/x/dgiiLQ#Advancedsearching-operatorsreference-CHANGEDCHANGED) for more information about the CHANGED operator.
public type FieldChangedClause record {
    # A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.
    JqlQueryField 'field;
    # The operator applied to the field.
    string operator;
    # The list of time predicates.
    JqlQueryClauseTimePredicate[] predicates;
};

# Metadata for an item in an attachment archive.
public type AttachmentArchiveItemReadable record {
    # The path of the archive item.
    string path?;
    # The position of the item within the archive.
    int index?;
    # The size of the archive item.
    string size?;
    # The MIME type of the archive item.
    string mediaType?;
    # The label for the archive item.
    string label?;
};

# The application the linked item is in.
public type Application record {
    # The name-spaced type of the application, used by registered rendering apps.
    string 'type?;
    # The name of the application. Used in conjunction with the (remote) object icon title to display a tooltip for the link's icon. The tooltip takes the format "\[application name\] icon title". Blank items are excluded from the tooltip title. If both items are blank, the icon tooltop displays as "Web Link". Grouping and sorting of links may place links without an application name last.
    string name?;
};

# Details of a filter.
public type FilterDetails record {
    # The URL of the filter.
    string self?;
    # The unique identifier for the filter.
    string id?;
    # The name of the filter. Must be unique.
    string name;
    # A description of the filter.
    string description?;
    # The user who owns the filter. This is defaulted to the creator of the filter, however Jira administrators can change the owner of a shared filter in the admin settings.
    User owner?;
    # The JQL query for the filter. For example, *project = SSP AND issuetype = Bug*.
    string jql?;
    # A URL to view the filter results in Jira, using the ID of the filter. For example, *https://your-domain.atlassian.net/issues/?filter=10100*.
    string viewUrl?;
    # A URL to view the filter results in Jira, using the [Search for issues using JQL](#api-rest-api-2-filter-search-get) operation with the filter's JQL string to return the filter results. For example, *https://your-domain.atlassian.net/rest/api/2/search?jql=project+%3D+SSP+AND+issuetype+%3D+Bug*.
    string searchUrl?;
    # Whether the filter is selected as a favorite by any users, not including the filter owner.
    boolean favourite?;
    # The count of how many users have selected this filter as a favorite, including the filter owner.
    int favouritedCount?;
    # The groups and projects that the filter is shared with. This can be specified when updating a filter, but not when creating a filter.
    SharePermission[] sharePermissions?;
    # The users that are subscribed to the filter.
    FilterSubscription[] subscriptions?;
};

# Record defining a project scope bean.
public type ProjectScopeBean record {
    # The ID of the project that the option's behavior applies to.
    int id?;
    # Defines the behavior of the option in the project.If notSelectable is set, the option cannot be set as the field's value. This is useful for archiving an option that has previously been selected but shouldn't be used anymore.If defaultValue is set, the option is selected by default.
    string[] attributes?;
};

# Details about a notification scheme.
public type NotificationScheme record {
    # Expand options that include additional notification scheme details in the response.
    string expand?;
    # The ID of the notification scheme.
    int id?;
    # The self of the notification scheme.
    string self?;
    # The name of the notification scheme.
    string name?;
    # The description of the notification scheme.
    string description?;
    # The notification events and associated recipients.
    NotificationSchemeEvent[] notificationSchemeEvents?;
    # The scope of the notification scheme.
    Scope scope?;
};

public type UserBeanAvatarUrls record {
    # The URL of the user's 48x48 pixel avatar.
    string '48x48?;
    # The URL of the user's 24x24 pixel avatar.
    string '24x24?;
    # The URL of the user's 16x16 pixel avatar.
    string '16x16?;
    # The URL of the user's 32x32 pixel avatar.
    string '32x32?;
};

# A page of items.
public type PageBeanIssueTypeSchemeProjects record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeSchemeProjects[] values?;
};

# Details of the time tracking configuration.
public type TimeTrackingConfiguration record {
    # The number of hours in a working day.
    float workingHoursPerDay;
    # The number of days in a working week.
    float workingDaysPerWeek;
    # The format that will appear on an issue's *Time Spent* field.
    string timeFormat;
    # The default unit of time applied to logged time.
    string defaultUnit;
};

# JQL queries that contained users that could not be found
public type JQLQueryWithUnknownUsers record {
    # The original query, for reference
    string originalQuery?;
    # The converted query, with accountIDs instead of user identifiers, or 'unknown' for users that could not be found
    string convertedQuery?;
};

# The identifiers for a project.
public type ProjectIdentifierBean record {
    # The ID of the project.
    int id?;
    # The key of the project.
    string 'key?;
};

# Record defining attachment archieve entry.
public type AttachmentArchiveEntry record {
    # Entry index of attachment archive entry.
    int entryIndex?;
    # Abbreviated name of attachment archive entry.
    string abbreviatedName?;
    # Media type of attachment archive entry.
    string mediaType?;
    # Name of attachment archive entry.
    string name?;
    # Size of attachment archive entry.
    int size?;
};

# A page of items.
public type PageBeanNotificationScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    NotificationScheme[] values?;
};

# Details about a failed webhook.
public type FailedWebhook record {
    # The webhook ID, as sent in the `X-Atlassian-Webhook-Identifier` header with the webhook.
    string id;
    # The webhook body.
    string body?;
    # The original webhook destination.
    string url;
    # The time the webhook was added to the list of failed webhooks (that is, the time of the last failed retry).
    int failureTime;
};

# Details of an operand in a JQL clause.
public type JqlQueryClauseOperand ListOperand|ValueOperand|FunctionOperand|KeywordOperand;

# The details of an issue type screen scheme.
public type IssueTypeScreenSchemeDetails record {
    # The name of the issue type screen scheme. The name must be unique. The maximum length is 255 characters.
    string name;
    # The description of the issue type screen scheme. The maximum length is 255 characters.
    string description?;
    # The IDs of the screen schemes for the issue type IDs and *default*. A *default* entry is required to create an issue type screen scheme, it defines the mapping for all issue types without a screen scheme.
    IssueTypeScreenSchemeMapping[] issueTypeMappings;
};

# An associated workflow scheme and project.
public type WorkflowSchemeProjectAssociation record {
    # The ID of the workflow scheme. If the workflow scheme ID is `null`, the operation assigns the default workflow scheme.
    string workflowSchemeId?;
    # The ID of the project.
    string projectId;
};

# Details about the time tracking provider.
public type TimeTrackingProvider record {
    # The key for the time tracking provider. For example, *JIRA*.
    string 'key;
    # The name of the time tracking provider. For example, *JIRA provided time tracking*.
    string name?;
    # The URL of the configuration page for the time tracking provider app. For example, */example/config/url*. This property is only returned if the `adminPageKey` property is set in the module descriptor of the time tracking provider app.
    string url?;
};

# A page of items.
public type PageBeanDashboard record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Dashboard[] values?;
};

# Details of a screen scheme.
public type ScreenSchemeDetails record {
    # The name of the screen scheme. The name must be unique. The maximum length is 255 characters.
    string name;
    # The description of the screen scheme. The maximum length is 255 characters.
    string description?;
    # The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.
    ScreenTypes screens;
};

public type GlobalScopeBean record {
    # Defines the behavior of the option in the global context.If notSelectable is set, the option cannot be set as the field's value. This is useful for archiving an option that has previously been selected but shouldn't be used anymore.If defaultValue is set, the option is selected by default.
    string[] attributes?;
};

public type StringList record {
};

# A group found in a search.
public type FoundGroup record {
    # The name of the group.
    string name?;
    # The group name with the matched query string highlighted with the HTML bold tag.
    string html?;
    # The group labels.
    GroupLabel[] labels?;
    # The ID of the group, if available, which uniquely identifies the group across all Atlassian products. For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*.
    string groupId?;
};

# Jira instance health check results. Deprecated and no longer returned.
public type HealthCheckResult record {
    # The name of the Jira health check item.
    string name?;
    # The description of the Jira health check item.
    string description?;
    # Whether the Jira health check item passed or failed.
    boolean passed?;
};

# The IDs of the screens for the screen types of the screen scheme.
public type UpdateScreenTypes record {
    # The ID of the edit screen. To remove the screen association, pass a null.
    string edit?;
    # The ID of the create screen. To remove the screen association, pass a null.
    string create?;
    # The ID of the view screen. To remove the screen association, pass a null.
    string view?;
    # The ID of the default screen. When specified, must include a screen ID as a default screen is required.
    string 'default?;
};

# Details of a workflow status.
public type WorkflowStatus record {
    # The ID of the issue status.
    string id;
    # The name of the status in the workflow.
    string name;
    # Properties of a workflow status.
    WorkflowStatusProperties properties?;
};

# A page of comments.
public type PageOfComments record {
    # The index of the first item returned.
    int startAt?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The number of items returned.
    int total?;
    # The list of comments.
    Comment[] comments?;
};

# Details of global and project permissions granted to the user.
public type BulkPermissionGrants record {
    # List of project permissions and the projects and issues those permissions provide access to.
    BulkProjectPermissionGrants[] projectPermissions;
    # List of permissions granted to the user.
    string[] globalPermissions;
};

# Details of a workflow transition.
public type Transition record {
    # The ID of the transition.
    string id;
    # The name of the transition.
    string name;
    # The description of the transition.
    string description;
    # The statuses the transition can start from.
    string[] 'from;
    # The status the transition goes to.
    string to;
    # The type of the transition.
    string 'type;
    # ID of a screen.
    ScreenID screen?;
    # A collection of transition rules.
    WorkflowRules rules?;
};

# A project category.
public type UpdatedProjectCategory record {
    # The URL of the project category.
    string self?;
    # The ID of the project category.
    string id?;
    # The name of the project category.
    string description?;
    # The description of the project category.
    string name?;
};

# Record defining an error message.
public type ErrorMessage record {
    # The error message.
    string message;
};

# Details of a locale.
public type Locale record {
    # The locale code. The Java the locale format is used: a two character language code (ISO 639), an underscore, and two letter country code (ISO 3166). For example, en\_US represents a locale of English (United States). Required on create.
    string locale?;
};

# Container for a list of registered webhooks. Webhook details are returned in the same order as the request.
public type ContainerForRegisteredWebhooks record {
    # A list of registered webhooks.
    RegisteredWebhook[] webhookRegistrationResult?;
};

# The converted JQL queries.
public type ConvertedJQLQueries record {
    # The list of converted query strings with account IDs in place of user identifiers.
    string[] queryStrings?;
    # List of queries containing user information that could not be mapped to an existing user
    JQLQueryWithUnknownUsers[] queriesWithUnknownUsers?;
};

public type UpdateUserToGroupBean record {
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string accountId?;
};

# An ordered list of issue type IDs and information about where to move them.
public type OrderOfIssueTypes record {
    # A list of the issue type IDs to move. The order of the issue type IDs in the list is the order they are given after the move.
    string[] issueTypeIds;
    # The ID of the issue type to place the moved issue types after. Required if `position` isn't provided.
    string after?;
    # The position the issue types should be moved to. Required if `after` isn't provided.
    string position?;
};

# The JQL queries to be converted.
public type JQLPersonalDataMigrationRequest record {
    # A list of queries with user identifiers. Maximum of 100 queries.
    string[] queryStrings?;
};

# A page of items.
public type PageBeanFieldConfigurationScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FieldConfigurationScheme[] values?;
};

# Details about the mapping between issue types and a workflow.
public type IssueTypesWorkflowMapping record {
    # The name of the workflow. Optional if updating the workflow-issue types mapping.
    string workflow?;
    # The list of issue type IDs.
    string[] issueTypes?;
    # Whether the workflow is the default workflow for the workflow scheme.
    boolean defaultMapping?;
    # Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new workflow-issue types mapping. Defaults to `false`.
    boolean updateDraftIfNeeded?;
};

# Details of the instance's attachment settings.
public type AttachmentSettings record {
    # Whether the ability to add attachments is enabled.
    boolean enabled?;
    # The maximum size of attachments permitted, in bytes.
    int uploadLimit?;
};

# A page of items.
public type PageBeanField record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Field[] values?;
};

public type JiraExpressionsComplexityBean record {
    # The number of steps it took to evaluate the expression, where a step is a high-level operation performed by the expression. A step is an operation such as arithmetic, accessing a property, accessing a context variable, or calling a function.
    JiraExpressionsComplexityValueBean steps;
    # The number of expensive operations executed while evaluating the expression. Expensive operations are those that load additional data, such as entity properties, comments, or custom fields.
    JiraExpressionsComplexityValueBean expensiveOperations;
    # The number of Jira REST API beans returned in the response.
    JiraExpressionsComplexityValueBean beans;
    # The number of primitive values returned in the response.
    JiraExpressionsComplexityValueBean primitiveValues;
};

# Details of an issue type scheme.
public type IssueTypeScheme record {
    # The ID of the issue type scheme.
    string id;
    # The name of the issue type scheme.
    string name;
    # The description of the issue type scheme.
    string description?;
    # The ID of the default issue type of the issue type scheme.
    string defaultIssueTypeId?;
    # Whether the issue type scheme is the default.
    boolean isDefault?;
};

# User details permitted by the user's Atlassian Account privacy settings. However, be aware of these exceptions:
# 
#  *  User record deleted from Atlassian: This occurs as the result of a right to be forgotten request. In this case, `displayName` provides an indication and other parameters have default values or are blank (for example, email is blank).
#  *  User record corrupted: This occurs as a results of events such as a server import and can only happen to deleted users. In this case, `accountId` returns *unknown* and all other parameters have fallback values.
#  *  User record unavailable: This usually occurs due to an internal service outage. In this case, all parameters have fallback values.
public type UserDetails record {
    # The URL of the user.
    string self?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string accountId?;
    # The email address of the user. Depending on the user’s privacy settings, this may be returned as null.
    string emailAddress?;
    # The avatars of the user.
    AvatarUrlsBean avatarUrls?;
    # The display name of the user. Depending on the user’s privacy settings, this may return an alternative value.
    string displayName?;
    # Whether the user is active.
    boolean active?;
    # The time zone specified in the user's profile. Depending on the user’s privacy settings, this may be returned as null.
    string timeZone?;
    # The type of account represented by this user. This will be one of 'atlassian' (normal users), 'app' (application user) or 'customer' (Jira Service Desk customer user)
    string accountType?;
};

# Details about the operations available in this version.
public type SimpleLink record {
    # The ID of a operations available.
    string id?;
    # The style class of a operations available.
    string styleClass?;
    # The icon class of a operations available.
    string iconClass?;
    # The label of a operations available.
    string label?;
    # The title of a operations available.
    string title?;
    # The URL of a operations available.
    string href?;
    # The weighted score of a operations available.
    int weight?;
};

# A list of project IDs.
public type ProjectIds record {
    # The IDs of projects.
    string[] projectIds;
};

# A screen scheme.
public type ScreenScheme record {
    # The ID of the screen scheme.
    int id?;
    # The name of the screen scheme.
    string name?;
    # The description of the screen scheme.
    string description?;
    # The IDs of the screens for the screen types of the screen scheme.
    ScreenTypes screens?;
    # Details of the issue type screen schemes associated with the screen scheme.
    PageBeanIssueTypeScreenScheme issueTypeScreenSchemes?;
};

# A page of items.
public type PageBeanIssueTypeScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeScheme[] values?;
};

# A list of the issues matched to a JQL query or details of errors encountered during matching.
public type IssueMatchesForJQL record {
    # A list of issue IDs.
    int[] matchedIssues;
    # A list of errors.
    string[] errors;
};

# List of users and groups found in a search.
public type FoundUsersAndGroups record {
    # The list of users found in a search, including header text (Showing X of Y matching users) and total of matched users.
    FoundUsers users?;
    # The list of groups found in a search, including header text (Showing X of Y matching groups) and total of matched groups.
    FoundGroups groups?;
};

public type HierarchyLevel record {
    # The ID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    int id?;
    # The name of this hierarchy level.
    string name?;
    # The ID of the level above this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    int aboveLevelId?;
    # The ID of the level below this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    int belowLevelId?;
    # The ID of the project configuration. This property is deprecated, see [Change oticen: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    int projectConfigurationId?;
    # The level of this item in the hierarchy.
    int level?;
    # The issue types available in this hierarchy level.
    int[] issueTypeIds?;
    # The external UUID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    string externalUuid?;
    string globalHierarchyLevel?;
};

# Details of the permission.
public type RestrictedPermission record {
    # The ID of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-2-permissions-get) to get the list of permissions.
    string id?;
    # The key of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-2-permissions-get) to get the list of permissions.
    string 'key?;
};

# Details of the users and groups to receive the notification.
public type NotificationRecipients record {
    # Whether the notification should be sent to the issue's reporter.
    boolean reporter?;
    # Whether the notification should be sent to the issue's assignees.
    boolean assignee?;
    # Whether the notification should be sent to the issue's watchers.
    boolean watchers?;
    # Whether the notification should be sent to the issue's voters.
    boolean voters?;
    # List of users to receive the notification.
    UserDetails[] users?;
    # List of groups to receive the notification.
    GroupName[] groups?;
};

# Details about a workflow configuration update request.
public type WorkflowTransitionRulesUpdate record {
    # The list of workflows with transition rules to update.
    WorkflowTransitionRules[] workflows;
};

# A page of items.
public type PageBeanComponentWithIssueCount record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    ComponentWithIssueCount[] values?;
};

public type IdBean record {
    # The ID of the permission scheme to associate with the project. Use the [Get all permission schemes](#api-rest-api-2-permissionscheme-get) resource to get a list of permission scheme IDs.
    int id;
};

# The group or role to which this item is visible.
public type Visibility record {
    # Whether visibility of this item is restricted to a group or role.
    string 'type?;
    # The name of the group or role to which visibility of this item is restricted.
    string value?;
};

# A project's sender email address.
public type ProjectEmailAddress record {
    # The email address.
    string emailAddress?;
};

# Bulk operation filter details.
public type IssueFilterForBulkPropertyDelete record {
    # List of issues to perform the bulk delete operation on.
    int[] entityIds?;
    # The value of properties to perform the bulk operation on.
    anydata currentValue?;
};

# A clause that asserts the current value of a field. For example, `summary ~ test`.
public type FieldValueClause record {
    # A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.
    JqlQueryField 'field;
    # The operator between the field and operand.
    string operator;
    # Details of an operand in a JQL clause.
    JqlQueryClauseOperand operand;
};

# A page of items.
public type PageBeanUserDetails record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    UserDetails[] values?;
};

# Issue type scheme item.
public type IssueTypeSchemeMapping record {
    # The ID of the issue type scheme.
    string issueTypeSchemeId;
    # The ID of the issue type.
    string issueTypeId;
};

# An operand that is a function. See [Advanced searching - functions reference](https://confluence.atlassian.com/x/dwiiLQ) for more information about JQL functions.
public type FunctionOperand record {
    # The name of the function.
    string 'function;
    # The list of function arguments.
    string[] arguments;
};

# A page of items.
public type PageBeanProject record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Project[] values?;
};

# A JQL query clause that consists of nested clauses. For example, `(labels in (urgent, blocker) OR lastCommentedBy = currentUser()). Note that, where nesting is not defined, the parser nests JQL clauses based on the operator precedence. For example, "A OR B AND C" is parsed as "(A OR B) AND C". See Setting the precedence of operators for more information about precedence in JQL queries.`
public type CompoundClause record {
    # The list of nested clauses.
    JqlQueryClause[] clauses;
    # The operator between the clauses.
    string operator;
};

# Details about the mapping between an issue type and a workflow.
public type IssueTypeWorkflowMapping record {
    # The ID of the issue type. Not required if updating the issue type-workflow mapping.
    string issueType?;
    # The name of the workflow.
    string workflow?;
    # Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`. Only applicable when updating the workflow-issue types mapping.
    boolean updateDraftIfNeeded?;
};

# Record defining a user bean.
public type UserBean record {
    # This property is deprecated in favor of `accountId` because of privacy changes. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.  
    # The key of the user.
    string 'key?;
    # The URL of the user.
    string self?;
    # This property is deprecated in favor of `accountId` because of privacy changes. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.  
    # The username of the user.
    string name?;
    # The display name of the user. Depending on the user’s privacy setting, this may return an alternative value.
    string displayName?;
    # Whether the user is active.
    boolean active?;
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string accountId?;
    # The avatars of the user.
    UserBeanAvatarUrls avatarUrls?;
};

# Details of the options to create for a custom field.
public type BulkCustomFieldOptionCreateRequest record {
    # Details of options to create.
    CustomFieldOptionCreate[] options?;
};

# Details of workflows and their transition rules to delete.
public type WorkflowsWithTransitionRulesDetails record {
    # The list of workflows with transition rules to delete.
    WorkflowTransitionRulesDetails[] workflows;
};

# The ID of a screen scheme.
public type ScreenSchemeId record {
    # The ID of the screen scheme.
    int id;
};

# Details of a share permission for the filter.
public type SharePermission record {
    # The unique identifier of the share permission.
    int id?;
    # The type of share permission:
    # 
    #  *  `group` Shared with a group. If set in a request, then specify `sharePermission.group` as well.
    #  *  `project` Shared with a project. If set in a request, then specify `sharePermission.project` as well.
    #  *  `projectRole` Share with a project role in a project. This value is not returned in responses. It is used in requests, where it needs to be specify with `projectId` and `projectRoleId`.
    #  *  `global` Shared globally. If set in a request, no other `sharePermission` properties need to be specified.
    #  *  `loggedin` Shared with all logged-in users. Note: This value is set in a request by specifying `authenticated` as the `type`.
    #  *  `project-unknown` Shared with a project that the user does not have access to. Cannot be set in a request.
    string 'type;
    # The project that the filter is shared with. This is similar to the project object returned by [Get project](#api-rest-api-2-project-projectIdOrKey-get) but it contains a subset of the properties, which are: `self`, `id`, `key`, `assigneeType`, `name`, `roles`, `avatarUrls`, `projectType`, `simplified`.  
    # For a request, specify the `id` for the project.
    Project project?;
    # The project role that the filter is shared with.  
    # For a request, specify the `id` for the role. You must also specify the `project` object and `id` for the project that the role is in.
    ProjectRole role?;
    # The group that the filter is shared with. For a request, specify the `name` property for the group.
    GroupName 'group?;
};

# A comment.
public type Comment record {
    # The URL of the comment.
    string self?;
    # The ID of the comment.
    string id?;
    # The ID of the user who created the comment.
    UserDetails author?;
    # The comment text.
    string body?;
    # The rendered version of the comment.
    string renderedBody?;
    # The ID of the user who updated the comment last.
    UserDetails updateAuthor?;
    # The date and time at which the comment was created.
    string created?;
    # The date and time at which the comment was updated last.
    string updated?;
    # The group or role to which this comment is visible. Optional on create and update.
    Visibility visibility?;
    # Whether the comment is visible in Jira Service Desk. Defaults to true when comments are created in the Jira Cloud Platform. This includes when the site doesn't use Jira Service Desk or the project isn't a Jira Service Desk project and, therefore, there is no Jira Service Desk for the issue to be visible on. To create a comment with its visibility in Jira Service Desk set to false, use the Jira Service Desk REST API [Create request comment](https://developer.atlassian.com/cloud/jira/service-desk/rest/#api-rest-servicedeskapi-request-issueIdOrKey-comment-post) operation.
    boolean jsdPublic?;
    # A list of comment properties. Optional on create and update.
    EntityProperty[] properties?;
};

# A workflow scheme along with a list of projects that use it.
public type WorkflowSchemeAssociations record {
    # The list of projects that use the workflow scheme.
    string[] projectIds;
    # The workflow scheme.
    WorkflowScheme workflowScheme;
};

# A page of items.
public type PageBeanIssueSecurityLevelMember record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueSecurityLevelMember[] values?;
};

# A page of items.
public type PageBeanScreenWithTab record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    ScreenWithTab[] values?;
};

# Details of an issue type screen scheme.
public type IssueTypeScreenSchemeUpdateDetails record {
    # The name of the issue type screen scheme. The name must be unique. The maximum length is 255 characters.
    string name?;
    # The description of the issue type screen scheme. The maximum length is 255 characters.
    string description?;
};

# The list of users found in a search, including header text (Showing X of Y matching users) and total of matched users.
public type FoundUsers record {
    # The array of users found in the search.
    UserPickerUser[] users?;
    # The total number of users found in the search.
    int total?;
    # Header text indicating the number of users in the response and the total number of users found in the search.
    string header?;
};

# A clause that asserts a previous value of a field. For example, `status WAS "Resolved" BY currentUser() BEFORE "2019/02/02"`. See [WAS](https://confluence.atlassian.com/x/dgiiLQ#Advancedsearching-operatorsreference-WASWAS) for more information about the WAS operator.
public type FieldWasClause record {
    # A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.
    JqlQueryField 'field;
    # The operator between the field and operand.
    string operator;
    # Details of an operand in a JQL clause.
    JqlQueryClauseOperand operand;
    # The list of time predicates.
    JqlQueryClauseTimePredicate[] predicates;
};

# Record defines a bean for about the expression complexity metadata.
public type JiraExpressionEvaluationMetaDataBean record {
    # Contains information about the expression complexity. For example, the number of steps it took to evaluate the expression.
    JiraExpressionsComplexityBean complexity?;
    # Contains information about the `issues` variable in the context. For example, is the issues were loaded with JQL, information about the page will be included here.
    IssuesMetaBean issues?;
};

# An audit record.
public type AuditRecordBean record {
    # The ID of the audit record.
    int id?;
    # The summary of the audit record.
    string summary?;
    # The URL of the computer where the creation of the audit record was initiated.
    string remoteAddress?;
    # Deprecated, use `authorAccountId` instead. The key of the user who created the audit record.
    string authorKey?;
    # The date and time on which the audit record was created.
    string created?;
    # The category of the audit record. For a list of these categories, see the help article [Auditing in Jira applications](https://confluence.atlassian.com/x/noXKM).
    string category?;
    # The event the audit record originated from.
    string eventSource?;
    # The description of the audit record.
    string description?;
    # Details of an item associated with the changed record.
    AssociatedItemBean objectItem?;
    # The list of values changed in the record event.
    ChangedValueBean[] changedValues?;
    # The list of items associated with the changed record.
    AssociatedItemBean[] associatedItems?;
};

# List of project permissions and the projects and issues those permissions grant access to.
public type BulkProjectPermissionGrants record {
    # A project permission,
    string permission;
    # IDs of the issues the user has the permission for.
    int[] issues;
    # IDs of the projects the user has the permission for.
    int[] projects;
};

# Details of the custom field options for a context.
public type CustomFieldContextOption record {
    # The ID of the custom field option.
    string id;
    # The value of the custom field option.
    string value;
    # For cascading options, the ID of the custom field option containing the cascading option.
    string optionId?;
    # Whether the option is disabled.
    boolean disabled;
};

# ID of a screen.
public type ScreenID record {
    # The ID of the screen.
    string id;
};

# A group label.
public type GroupLabel record {
    # The group label name.
    string text?;
    # The title of the group label.
    string title?;
    # The type of the group label.
    string 'type?;
};

# A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.
public type JqlQueryField record {
    # The name of the field.
    string name;
    # When the field refers to a value in an entity property, details of the entity property value.
    JqlQueryFieldEntityProperty[] property?;
};

# Details about the configuration of Jira.
public type Configuration record {
    # Whether the ability for users to vote on issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
    boolean votingEnabled?;
    # Whether the ability for users to watch issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
    boolean watchingEnabled?;
    # Whether the ability to create unassigned issues is enabled. See [Configuring Jira application options](https://confluence.atlassian.com/x/uYXKM) for details.
    boolean unassignedIssuesAllowed?;
    # Whether the ability to create subtasks for issues is enabled.
    boolean subTasksEnabled?;
    # Whether the ability to link issues is enabled.
    boolean issueLinkingEnabled?;
    # Whether the ability to track time is enabled. This property is deprecated.
    boolean timeTrackingEnabled?;
    # Whether the ability to add attachments to issues is enabled.
    boolean attachmentsEnabled?;
    # The configuration of time tracking.
    TimeTrackingConfiguration timeTrackingConfiguration?;
};

# Details about the project.
public type UpdateProjectDetails record {
    # Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.
    string 'key?;
    # The name of the project.
    string name?;
    # A brief description of the project.
    string description?;
    # This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Cannot be provided with `leadAccountId`.
    string lead?;
    # The account ID of the project lead. Cannot be provided with `lead`.
    string leadAccountId?;
    # A link to information about this project, such as project documentation
    string url?;
    # The default assignee when creating issues for this project.
    string assigneeType?;
    # An integer value for the project's avatar.
    int avatarId?;
    # The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-2-issuesecurityschemes-get) resource to get all issue security scheme IDs.
    int issueSecurityScheme?;
    # The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-2-permissionscheme-get) resource to see a list of all permission scheme IDs.
    int permissionScheme?;
    # The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-2-notificationscheme-get) resource to get a list of notification scheme IDs.
    int notificationScheme?;
    # The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-2-projectCategory-get) operation.
    int categoryId?;
};

# A type of issue suggested for use in auto-completion.
public type IssuePickerSuggestionsIssueType record {
    # The label of the type of issues suggested for use in auto-completion.
    string label?;
    # If issue suggestions are found, returns a message indicating the number of issues suggestions found and returned.
    string sub?;
    # The ID of the type of issues suggested for use in auto-completion.
    string id?;
    # If no issue suggestions are found, returns a message indicating no suggestions were found,
    string msg?;
    # A list of issues suggested for use in auto-completion.
    SuggestedIssue[] issues?;
};

# Details of the association between an issue type scheme and project.
public type IssueTypeSchemeProjectAssociation record {
    # The ID of the issue type scheme.
    string issueTypeSchemeId;
    # The ID of the project.
    string projectId;
};

public type IssueFieldOptionCreateBean record {
    # The option's name, which is displayed in Jira.
    string value;
    # The properties of the option as arbitrary key-value pairs. These properties can be searched using JQL, if the extractions (see https://developer.atlassian.com/cloud/jira/platform/modules/issue-field-option-property-index/) are defined in the descriptor for the issue field module.
    record {} properties?;
    # Details of the projects the option is available in.
    IssueFieldOptionConfiguration config?;
};

# Details of the group membership or permissions needed to receive the notification.
public type NotificationRecipientsRestrictions record {
    # List of group memberships required to receive the notification.
    GroupName[] groups?;
    # List of permissions required to receive the notification.
    RestrictedPermission[] permissions?;
};

# Details of Jira expressions for analysis.
public type JiraExpressionForAnalysis record {
    # The list of Jira expressions to analyse.
    string[] expressions;
    # Context variables and their types. The type checker assumes that [common context variables](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/#context-variables), such as `issue` or `project`, are available in context and sets their type. Use this property to override the default types or provide details of new variables.
    record {} contextVariables?;
};

# The details of watchers on an issue.
public type Watchers record {
    # The URL of these issue watcher details.
    string self?;
    # Whether the calling user is watching this issue.
    boolean isWatching?;
    # The number of users watching this issue.
    int watchCount?;
    # Details of the users watching this issue.
    UserDetails[] watchers?;
};

# Details of a custom field option to create.
public type CustomFieldOptionCreate record {
    # The value of the custom field option.
    string value;
    # For cascading options, the ID of the custom field object containing the cascading option.
    string optionId?;
    # Whether the option is disabled.
    boolean disabled?;
};

# Details about a workflow configuration update request.
public type WorkflowTransitionRulesDetails record {
    # Properties that identify a workflow.
    WorkflowId workflowId;
    # The list of connect workflow rule IDs.
    string[] workflowRuleIds;
};

# The hierarchy of issue types within a project.
public type ProjectIssueTypeHierarchy record {
    # The ID of the project.
    int projectId?;
    # Details of an issue type hierarchy level.
    ProjectIssueTypesHierarchyLevel[] hierarchy?;
};

# The ID or key of a linked issue.
public type LinkedIssue record {
    # The ID of an issue. Required if `key` isn't provided.
    string id?;
    # The key of an issue. Required if `id` isn't provided.
    string 'key?;
    # The URL of the issue.
    string self?;
    # The fields associated with the issue.
    Fields fields?;
};

# Details of a link between issues.
public type IssueLink record {
    # The ID of the issue link.
    string id?;
    # The URL of the issue link.
    string self?;
    # The type of link between the issues.
    IssueLinkType 'type;
    # The issue the link joins to.
    LinkedIssue inwardIssue;
    # The issue the link originates from.
    LinkedIssue outwardIssue;
};

# Record defines a collection of simple errors.
public type SimpleErrorCollection record {
    # The list of errors by parameter returned by the operation. For example,"projectKey": "Project keys must start with an uppercase letter, followed by one or more uppercase alphanumeric characters."
    record {} errors?;
    # The list of error messages produced by this operation. For example, "input parameter 'key' must be provided"
    string[] errorMessages?;
    # Error status codes.
    int httpStatusCode?;
};

# Details about a workflow.
public type Workflow record {
    # Properties that identify a published workflow.
    PublishedWorkflowId id;
    # The description of the workflow.
    string description;
    # The transitions of the workflow.
    Transition[] transitions?;
    # The statuses of the workflow.
    WorkflowStatus[] statuses?;
    # Whether this is the default workflow.
    boolean isDefault?;
};

# The list of groups found in a search, including header text (Showing X of Y matching groups) and total of matched groups.
public type FoundGroups record {
    # Header text indicating the number of groups in the response and the total number of groups found in the search.
    string header?;
    # The total number of groups found in the search.
    int total?;
    # The array of groups found in the search.
    FoundGroup[] groups?;
};

# Details of a custom field.
public type UpdateCustomFieldDetails record {
    # The name of the custom field. It doesn't have to be unique. The maximum length is 255 characters.
    string name?;
    # The description of the custom field. The maximum length is 40000 characters.
    string description?;
    # The searcher that defines the way the field is searched in Jira. It can be set to `null`, otherwise you must specify the valid searcher for the field type, as listed below (abbreviated values shown):
    # 
    #  *  `cascadingselect`: `cascadingselectsearcher`
    #  *  `datepicker`: `daterange`
    #  *  `datetime`: `datetimerange`
    #  *  `float`: `exactnumber` or `numberrange`
    #  *  `grouppicker`: `grouppickersearcher`
    #  *  `importid`: `exactnumber` or `numberrange`
    #  *  `labels`: `labelsearcher`
    #  *  `multicheckboxes`: `multiselectsearcher`
    #  *  `multigrouppicker`: `multiselectsearcher`
    #  *  `multiselect`: `multiselectsearcher`
    #  *  `multiuserpicker`: `userpickergroupsearcher`
    #  *  `multiversion`: `versionsearcher`
    #  *  `project`: `projectsearcher`
    #  *  `radiobuttons`: `multiselectsearcher`
    #  *  `readonlyfield`: `textsearcher`
    #  *  `select`: `multiselectsearcher`
    #  *  `textarea`: `textsearcher`
    #  *  `textfield`: `textsearcher`
    #  *  `url`: `exacttextsearcher`
    #  *  `userpicker`: `userpickergroupsearcher`
    #  *  `version`: `versionsearcher`
    string searcherKey?;
};

# A list of JQL queries to parse.
public type JqlQueriesToParse record {
    # A list of queries to parse.
    string[] queries;
};

public type EntityPropertyDetails record {
    # The entity property ID.
    decimal entityId;
    # The entity property key.
    string 'key;
    # The new value of the entity property.
    string value;
};

# A page of items.
public type PageBeanIssueTypeScreenSchemesProjects record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeScreenSchemesProjects[] values?;
};

# Details about a project.
public type Project record {
    # Expand options that include additional project details in the response.
    string expand?;
    # The URL of the project details.
    string self?;
    # The ID of the project.
    string id?;
    # The key of the project.
    string 'key?;
    # A brief description of the project.
    string description?;
    # The username of the project lead.
    User lead?;
    # List of the components contained in the project.
    ProjectComponent[] components?;
    # List of the issue types available in the project.
    IssueTypeDetails[] issueTypes?;
    # A link to information about this project, such as project documentation.
    string url?;
    # An email address associated with the project.
    string email?;
    # The default assignee when creating issues for this project.
    string assigneeType?;
    # The versions defined in the project. For more information, see [Create version](#api-rest-api-2-version-post).
    Version[] versions?;
    # The name of the project.
    string name?;
    # The name and self URL for each role defined in the project. For more information, see [Create project role](#api-rest-api-2-role-post).
    record {} roles?;
    # The URLs of the project's avatars.
    AvatarUrlsBean avatarUrls?;
    # The category the project belongs to.
    ProjectCategory projectCategory?;
    # The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
    string projectTypeKey?;
    # Whether the project is simplified.
    boolean simplified?;
    # The type of the project.
    string style?;
    # Whether the project is selected as a favorite.
    boolean favourite?;
    # Whether the project is private.
    boolean isPrivate?;
    # The issue type hierarchy for the project.
    Hierarchy issueTypeHierarchy?;
    # User permissions on the project
    ProjectPermissions permissions?;
    # Map of project properties
    record {} properties?;
    # Unique ID for next-gen projects.
    string uuid?;
    # Insights about the project.
    ProjectInsight insight?;
    # Whether the project is marked as deleted.
    boolean deleted?;
    # The date when the project is deleted permanently.
    string retentionTillDate?;
    # The date when the project was marked as deleted.
    string deletedDate?;
    # The user who marked the project as deleted.
    User deletedBy?;
    # Whether the project is archived.
    boolean archived?;
    # The date when the project was archived.
    string archivedDate?;
    # The user who archived the project.
    User archivedBy?;
    # The project landing page info.
    ProjectLandingPageInfo landingPageInfo?;
};

# List of project avatars.
public type ProjectAvatars record {
    # List of avatars included with Jira. These avatars cannot be deleted.
    Avatar[] system?;
    # List of avatars added to Jira. These avatars may be deleted.
    Avatar[] custom?;
};

# Details of the user associated with the role.
public type ProjectRoleUser record {
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Returns *unknown* if the record is deleted and corrupted, for example, as the result of a server import.
    string accountId?;
};

public type LinkIssueRequestJsonBean record {
    # This object is used as follows:
    # 
    #  *  In the [ issueLink](#api-rest-api-2-issueLink-post) resource it defines and reports on the type of link between the issues. Find a list of issue link types with [Get issue link types](#api-rest-api-2-issueLinkType-get).
    #  *  In the [ issueLinkType](#api-rest-api-2-issueLinkType-post) resource it defines and reports on issue link types.
    IssueLinkType 'type;
    # The ID or key of a linked issue.
    LinkedIssue inwardIssue;
    # The ID or key of a linked issue.
    LinkedIssue outwardIssue;
    # A comment.
    Comment comment?;
};

# A page of items.
public type PageBeanUser record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    User[] values?;
};

# Details of the issue creation metadata for an issue type.
public type IssueTypeIssueCreateMetadata record {
    # The URL of these issue type details.
    string self?;
    # The ID of the issue type.
    string id?;
    # The description of the issue type.
    string description?;
    # The URL of the issue type's avatar.
    string iconUrl?;
    # The name of the issue type.
    string name?;
    # Whether this issue type is used to create subtasks.
    boolean subtask?;
    # The ID of the issue type's avatar.
    int avatarId?;
    # Unique ID for next-gen projects.
    string entityId?;
    # Hierarchy level of the issue type.
    int hierarchyLevel?;
    # Details of the next-gen projects the issue type is available in.
    Scope scope?;
    # Expand options that include additional issue type metadata details in the response.
    string expand?;
    # List of the fields available when creating an issue for the issue type.
    record {} fields?;
};

public type Group record {
    # The name of group.
    string name?;
    # The URL for these group details.
    string self?;
    # A paginated list of the users that are members of the group. A maximum of 50 users is returned in the list, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 50 users, use`?expand=users[51:100]`.
    PagedListUserDetailsApplicationUser users?;
    # Expand options that include additional group details in the response.
    string expand?;
};

# Details about a field.
public type FieldDetails record {
    # The ID of the field.
    string id?;
    # The key of the field.
    string 'key?;
    # The name of the field.
    string name?;
    # Whether the field is a custom field.
    boolean custom?;
    # Whether the content of the field can be used to order lists.
    boolean orderable?;
    # Whether the field can be used as a column on the issue navigator.
    boolean navigable?;
    # Whether the content of the field can be searched.
    boolean searchable?;
    # The names that can be used to reference the field in an advanced search. For more information, see [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ).
    string[] clauseNames?;
    # The scope of the field.
    Scope scope?;
    # The data schema for the field.
    JsonTypeBean schema?;
};

# Details of an issue type scheme and its associated issue types.
public type IssueTypeSchemeDetails record {
    # The name of the issue type scheme. The name must be unique. The maximum length is 255 characters.
    string name;
    # The description of the issue type scheme. The maximum length is 4000 characters.
    string description?;
    # The ID of the default issue type of the issue type scheme. This ID must be included in `issueTypeIds`.
    string defaultIssueTypeId?;
    # The list of issue types IDs of the issue type scheme. At least one standard issue type ID is required.
    string[] issueTypeIds;
};

# Record defines a bean for create or update role request.
public type CreateUpdateRoleRequestBean record {
    # The name of the project role. Must be unique. Cannot begin or end with whitespace. The maximum length is 255 characters. Required when creating a project role. Optional when partially updating a project role.
    string name?;
    # A description of the project role. Required when fully updating a project role. Optional when creating or partially updating a project role.
    string description?;
};

# A parsed JQL query.
public type JqlQuery record {
    # A JQL query clause.
    JqlQueryClause 'where?;
    # Details of the order-by JQL clause.
    JqlQueryOrderByClause orderBy?;
};

public type DeleteAndReplaceVersionBean record {
    # The ID of the version to update `fixVersion` to when the field contains the deleted version.
    int moveFixIssuesTo?;
    # The ID of the version to update `affectedVersion` to when the field contains the deleted version.
    int moveAffectedIssuesTo?;
    # An array of custom field IDs (`customFieldId`) and version IDs (`moveTo`) to update when the fields contain the deleted version.
    CustomFieldReplacement[] customFieldReplacementList?;
};

# A change item.
public type ChangeDetails record {
    # The name of the field changed.
    string 'field?;
    # The type of the field changed.
    string fieldtype?;
    # The ID of the field changed.
    string fieldId?;
    # The details of the original value.
    string 'from?;
    # The details of the original value as a string.
    string fromString?;
    # The details of the new value.
    string to?;
    # The details of the new value as a string.
    string toString?;
};

# An element of the order-by JQL clause.
public type JqlQueryOrderByClauseElement record {
    # A field used in a JQL query. See [Advanced searching - fields reference](https://confluence.atlassian.com/x/dAiiLQ) for more information about fields in JQL queries.
    JqlQueryField 'field;
    # The direction in which to order the results.
    string direction?;
};

# List of system avatars.
public type SystemAvatars record {
    # A list of avatar details.
    Avatar[] system?;
};

# The details of votes on an issue.
public type Votes record {
    # The URL of these issue vote details.
    string self?;
    # The number of votes on the issue.
    int votes?;
    # Whether the user making this request has voted on the issue.
    boolean hasVoted?;
    # List of the users who have voted on this issue. An empty list is returned when the calling user doesn't have the *View voters and watchers* project permission.
    User[] voters?;
};

# Details of the options to update for a custom field.
public type BulkCustomFieldOptionUpdateRequest record {
    # Details of the options to update.
    CustomFieldOptionUpdate[] options?;
};

# A list of issue type screen scheme mappings.
public type IssueTypeScreenSchemeMappingDetails record {
    # The list of issue type to screen scheme mappings. A *default* entry cannot be specified because a default entry is added when an issue type screen scheme is created.
    IssueTypeScreenSchemeMapping[] issueTypeMappings;
};

# A context.
public type Context record {
    # The ID of the context.
    int id?;
    # The name of the context.
    string name?;
    # The scope of the context.
    Scope scope?;
};

# A page of items.
public type PageBeanFieldConfigurationIssueTypeItem record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FieldConfigurationIssueTypeItem[] values?;
};

public type IssueBean record {
    # Expand options that include additional issue details in the response.
    string expand?;
    # The ID of the issue.
    string id?;
    # The URL of the issue details.
    string self?;
    # The key of the issue.
    string 'key?;
    # The rendered value of each field present on the issue.
    record {} renderedFields?;
    # Details of the issue properties identified in the request.
    record {} properties?;
    # The ID and name of each field present on the issue.
    record {} names?;
    # The schema describing each field present on the issue.
    record {} schema?;
    # The transitions that can be performed on the issue.
    IssueTransition[] transitions?;
    # The operations that can be performed on the issue.
    Operations operations?;
    # The metadata for the fields on the issue that can be amended.
    IssueUpdateMetadata editmeta?;
    # Details of changelogs associated with the issue.
    PageOfChangelogs changelog?;
    # The versions of each field on the issue.
    record {} versionedRepresentations?;
    # Record define the included fields.
    IncludedFields fieldsToInclude?;
    record {} fields?;
};

# A page of items.
public type PageBeanCustomFieldContextProjectMapping record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    CustomFieldContextProjectMapping[] values?;
};

# The screen scheme for an issue type.
public type IssueTypeScreenSchemeItem record {
    # The ID of the issue type screen scheme.
    string issueTypeScreenSchemeId;
    # The ID of the issue type or *default*. Only issue types used in classic projects are accepted. When creating an issue screen scheme, an entry for *default* must be provided and defines the mapping for all issue types without a screen scheme. Otherwise, a *default* entry can't be provided.
    string issueTypeId;
    # The ID of the screen scheme.
    string screenSchemeId;
};

# Record defines to add a json node.
public type AddGroupBean record {
    # The name of the group.
    string name;
};

# Details of a user, group, field, or project role that holds a permission. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.
public type PermissionHolder record {
    # The type of permission holder.
    string 'type;
    # The identifier of permission holder.
    string 'parameter?;
    # Expand options that include additional permission holder details in the response.
    string expand?;
};

# A JQL query clause.
public type JqlQueryClause CompoundClause|FieldValueClause|FieldWasClause|FieldChangedClause;

# Details about an issue type.
public type IssueTypeDetails record {
    # The URL of these issue type details.
    string self?;
    # The ID of the issue type.
    string id?;
    # The description of the issue type.
    string description?;
    # The URL of the issue type's avatar.
    string iconUrl?;
    # The name of the issue type.
    string name?;
    # Whether this issue type is used to create subtasks.
    boolean subtask?;
    # The ID of the issue type's avatar.
    int avatarId?;
    # Unique ID for next-gen projects.
    string entityId?;
    # Hierarchy level of the issue type.
    int hierarchyLevel?;
    # Details of the next-gen projects the issue type is available in.
    Scope scope?;
};

# A list of issues suggested for use in auto-completion.
public type IssuePickerSuggestions record {
    # A list of issues for an issue type suggested for use in auto-completion.
    IssuePickerSuggestionsIssueType[] sections?;
};

# The JQL specifying the issues available in the evaluated Jira expression under the `issues` context variable. Not all issues returned by the JQL query are loaded, only those described by the `startAt` and `maxResults` properties. To determine whether it is necessary to iterate to ensure all the issues returned by the JQL query are evaluated, inspect `meta.issues.jql.count` in the response.
public type JexpJqlIssues record {
    # The JQL query.
    string query?;
    # The index of the first issue to return from the JQL query.
    int startAt?;
    # The maximum number of issues to return from the JQL query. Inspect `meta.issues.jql.maxResults` in the response to ensure the maximum value has not been exceeded.
    int maxResults?;
    # Determines how to validate the JQL query and treat the validation results.
    string validation?;
};

# A webhook.
public type Webhook record {
    # The ID of the webhook.
    int id;
    # The JQL filter that specifies which issues the webhook is sent for.
    string jqlFilter;
    # A list of field IDs. When the issue changelog contains any of the fields, the webhook `jira:issue_updated` is sent. If this parameter is not present, the app is notified about all field updates.
    string[] fieldIdsFilter?;
    # A list of issue property keys. A change of those issue properties triggers the `issue_property_set` or `issue_property_deleted` webhooks. If this parameter is not present, the app is notified about all issue property updates.
    string[] issuePropertyKeysFilter?;
    # The Jira events that trigger the webhook.
    string[] events;
    # The expiration date of the webhook.
    int expirationDate?;
};

# The wrapper for the issue creation metadata for a list of projects.
public type IssueCreateMetadata record {
    # Expand options that include additional project details in the response.
    string expand?;
    # List of projects and their issue creation metadata.
    ProjectIssueCreateMetadata[] projects?;
};

# Details of a permission and its availability to a user.
public type UserPermission record {
    # The ID of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-2-permissions-get) to get the list of permissions.
    string id?;
    # The key of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-2-permissions-get) to get the list of permissions.
    string 'key?;
    # The name of the permission.
    string name?;
    # The type of the permission.
    string 'type?;
    # The description of the permission.
    string description?;
    # Whether the permission is available to the user in the queried context.
    boolean havePermission?;
    # Indicate whether the permission key is deprecated. Note that deprecated keys cannot be used in the `permissions parameter of Get my permissions. Deprecated keys are not returned by Get all permissions.`
    boolean deprecatedKey?;
};

public type MoveFieldBean record {
    # The ID of the screen tab field after which to place the moved screen tab field. Required if `position` isn't provided.
    string after?;
    # The named position to which the screen tab field should be moved. Required if `after` isn't provided.
    string position?;
};

# Details about a group name.
public type GroupName record {
    # The name of group.
    string name?;
    # The URL for these group details.
    string self?;
};

# The metadata describing an issue field.
public type FieldMetadata record {
    # Whether the field is required.
    boolean required;
    # The data type of the field.
    JsonTypeBean schema;
    # The name of the field.
    string name;
    # The key of the field.
    string 'key;
    # The URL that can be used to automatically complete the field.
    string autoCompleteUrl?;
    # Whether the field has a default value.
    boolean hasDefaultValue?;
    # The list of operations that can be performed on the field.
    string[] operations;
    # The list of values allowed in the field.
    anydata[] allowedValues?;
    # The default value of the field.
    anydata defaultValue?;
};

# Details of an issue update request.
public type IssueUpdateDetails record {
    # Details of a transition. Required when performing a transition, optional when creating or editing an issue.
    IssueTransition transition?;
    # List of issue screen fields to update, specifying the sub-field to update and its value for each field. This field provides a straightforward option when setting a sub-field. When multiple sub-fields or other operations are required, use `update`. Fields included in here cannot be included in `update`.
    record {} fields?;
    # List of operations to perform on issue screen fields. Note that fields included in here cannot be included in `fields`.
    record {} update?;
    # Additional issue history details.
    HistoryMetadata historyMetadata?;
    # Details of issue properties to be add or update.
    EntityProperty[] properties?;
};

# An ordered list of custom field option IDs and information on where to move them.
public type OrderOfCustomFieldOptions record {
    # A list of IDs of custom field options to move. The order of the custom field option IDs in the list is the order they are given after the move. The list must contain custom field options or cascading options, but not both.
    string[] customFieldOptionIds;
    # The ID of the custom field option or cascading option to place the moved options after. Required if `position` isn't provided.
    string after?;
    # The position the custom field options should be moved to. Required if `after` isn't provided.
    string position?;
};

# A list of issue link type beans.
public type IssueLinkTypes record {
    # The issue link type bean.
    IssueLinkType[] issueLinkTypes?;
};

# Details of a dashboard.
public type Dashboard record {
    # The description about the dashboard.
    string description?;
    # The ID of the dashboard.
    string id?;
    # Whether the dashboard is selected as a favorite by the user.
    boolean isFavourite?;
    # The name of the dashboard.
    string name?;
    # The owner of the dashboard.
    UserBean owner?;
    # The number of users who have this dashboard as a favorite.
    int popularity?;
    # The rank of this dashboard.
    int rank?;
    # The URL of these dashboard details.
    string self?;
    # The details of any view share permissions for the dashboard.
    SharePermission[] sharePermissions?;
    # The details of any edit share permissions for the dashboard.
    SharePermission[] editPermissions?;
    # The URL of the dashboard.
    string view?;
};

# List of security schemes.
public type SecuritySchemes record {
    # List of security schemes.
    SecurityScheme[] issueSecuritySchemes?;
};

# The result of a JQL search.
public type SearchResults record {
    # Expand options that include additional search result details in the response.
    string expand?;
    # The index of the first item returned on the page.
    int startAt?;
    # The maximum number of results that could be on the page.
    int maxResults?;
    # The number of results on the page.
    int total?;
    # The list of issues found by the search.
    IssueBean[] issues?;
    # Any warnings related to the JQL query.
    string[] warningMessages?;
    # The ID and name of each field in the search results.
    record {} names?;
    # The schema describing the field types in the search results.
    record {} schema?;
};

# The results from a JQL query.
public type AutoCompleteSuggestions record {
    # The list of suggested item.
    AutoCompleteSuggestion[] results?;
};

public type ActorsMap record {
    # The user account ID of the user to add.
    string[] user?;
    # The name of the group to add.
    string[] 'group?;
};

# Mapping of an issue type to a context.
public type IssueTypeToContextMapping record {
    # The ID of the context.
    string contextId;
    # The ID of the issue type.
    string issueTypeId?;
    # Whether the context is mapped to any issue type.
    boolean isAnyIssueType?;
};

# A time predicate for a temporal JQL clause.
public type JqlQueryClauseTimePredicate record {
    # The operator between the field and the operand.
    string operator;
    # Details of an operand in a JQL clause.
    JqlQueryClauseOperand operand;
};

# Details about a workflow scheme.
public type WorkflowScheme record {
    # The ID of the workflow scheme.
    int id?;
    # The name of the workflow scheme. The name must be unique. The maximum length is 255 characters. Required when creating a workflow scheme.
    string name?;
    # The description of the workflow scheme.
    string description?;
    # The name of the default workflow for the workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira. If `defaultWorkflow` is not specified when creating a workflow scheme, it is set to *Jira Workflow (jira)*.
    string defaultWorkflow?;
    # The issue type to workflow mappings, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.
    record {} issueTypeMappings?;
    # For draft workflow schemes, this property is the name of the default workflow for the original workflow scheme. The default workflow has *All Unassigned Issue Types* assigned to it in Jira.
    string originalDefaultWorkflow?;
    # For draft workflow schemes, this property is the issue type to workflow mappings for the original workflow scheme, where each mapping is an issue type ID and workflow name pair. Note that an issue type can only be mapped to one workflow in a workflow scheme.
    record {} originalIssueTypeMappings?;
    # Whether the workflow scheme is a draft or not.
    boolean draft?;
    # The user that last modified the draft workflow scheme. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.
    User lastModifiedUser?;
    # The date-time that the draft workflow scheme was last modified. A modification is a change to the issue type-project mappings only. This property does not apply to non-draft workflows.
    string lastModified?;
    # The self of the workflow scheme.
    string self?;
    # Whether to create or update a draft workflow scheme when updating an active workflow scheme. An active workflow scheme is a workflow scheme that is used by at least one project. The following examples show how this property works:
    # 
    #  *  Update an active workflow scheme with `updateDraftIfNeeded` set to `true`: If a draft workflow scheme exists, it is updated. Otherwise, a draft workflow scheme is created.
    #  *  Update an active workflow scheme with `updateDraftIfNeeded` set to `false`: An error is returned, as active workflow schemes cannot be updated.
    #  *  Update an inactive workflow scheme with `updateDraftIfNeeded` set to `true`: The workflow scheme is updated, as inactive workflow schemes do not require drafts to update.
    # 
    # Defaults to `false`.
    boolean updateDraftIfNeeded?;
    # The issue types available in Jira.
    record {} issueTypes?;
};

# Details of global permissions to look up and project permissions with associated projects and issues to look up.
public type BulkPermissionsRequestBean record {
    # Project permissions with associated projects and issues to look up.
    BulkProjectPermissions[] projectPermissions?;
    # Global permissions to look up.
    string[] globalPermissions?;
    # The account ID of a user.
    string accountId?;
};

# A screen tab.
public type ScreenableTab record {
    # The ID of the screen tab.
    int id?;
    # The name of the screen tab. The maximum length is 255 characters.
    string name;
};

# Details about permissions.
public type Permissions record {
    # List of permissions.
    record {} permissions?;
};

# Associated field configuration scheme and project.
public type FieldConfigurationSchemeProjectAssociation record {
    # The ID of the field configuration scheme. If the field configuration scheme ID is `null`, the operation assigns the default field configuration scheme.
    string fieldConfigurationSchemeId?;
    # The ID of the project.
    string projectId;
};

# Details about application property.
public type SimpleApplicationPropertyBean record {
    # The ID of the application property.
    string id?;
    # The new value.
    string value?;
};

# A list of custom field options for a context.
public type CustomFieldCreatedContextOptionsList record {
    # The created custom field options.
    CustomFieldContextOption[] options?;
};

# A collection of transition rules.
public type WorkflowRules record {
    # The workflow conditions. ([Deprecated](https://community.developer.atlassian.com/t/deprecation-of-conditions-body-param/48884))
    WorkflowTransitionRule[] conditions?;
    # The workflow transition rule conditions tree.
    WorkflowCondition conditionsTree?;
    # The workflow validators.
    WorkflowTransitionRule[] validators?;
    # The workflow post functions.
    WorkflowTransitionRule[] postFunctions?;
};

# A compound workflow transition rule condition. This object returns `nodeType` as `compound`.
public type WorkflowCompoundCondition record {
    # The compound condition operator.
    string operator;
    # The list of workflow conditions.
    WorkflowCondition[] conditions;
    # The node type of workflow conditions.
    string nodeType;
};

# A paged list. To access additional details append `[start-index:end-index]` to the expand request. For example, `?expand=sharedUsers[10:40]` returns a list starting at item 10 and finishing at item 40.
public type PagedListUserDetailsApplicationUser record {
    # The number of items on the page.
    int size?;
    # The list of items.
    UserDetails[] items?;
    # The maximum number of results that could be on the page.
    int 'max\-results?;
    # The index of the first item returned on the page.
    int 'start\-index?;
    # The index of the last item returned on the page.
    int 'end\-index?;
};

# The project and issue type mapping with a matching custom field context.
public type ContextForProjectAndIssueType record {
    # The ID of the project.
    string projectId;
    # The ID of the issue type.
    string issueTypeId;
    # The ID of the custom field context.
    string contextId;
};

# Details about a project type.
public type ProjectType record {
    # The key of the project type.
    string 'key?;
    # The formatted key of the project type.
    string formattedKey?;
    # The key of the project type's description.
    string descriptionI18nKey?;
    # The icon of the project type.
    string icon?;
    # The color of the project type.
    string color?;
};

# The IDs of the screen schemes for the issue type IDs.
public type IssueTypeScreenSchemeMapping record {
    # The ID of the issue type or *default*. Only issue types used in classic projects are accepted. An entry for *default* must be provided and defines the mapping for all issue types without a screen scheme.
    string issueTypeId;
    # The ID of the screen scheme. Only screen schemes used in classic projects are accepted.
    string screenSchemeId;
};

# A page of items.
public type PageBeanIssueTypeScreenScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    IssueTypeScreenScheme[] values?;
};

# Lists of JQL reference data.
public type JQLReferenceData record {
    # List of fields usable in JQL queries.
    FieldReferenceData[] visibleFieldNames?;
    # List of functions usable in JQL queries.
    FunctionReferenceData[] visibleFunctionNames?;
    # List of JQL query reserved words.
    string[] jqlReservedWords?;
};

# Details of an issue type screen scheme.
public type IssueTypeScreenScheme record {
    # The ID of the issue type screen scheme.
    string id;
    # The name of the issue type screen scheme.
    string name;
    # The description of the issue type screen scheme.
    string description?;
};

public type ProjectRoleActorsUpdateBean record {
    # The ID of the project role. Use [Get all project roles](#api-rest-api-2-role-get) to get a list of project role IDs.
    int id?;
    # The actors to add to the project role. Add groups using `atlassian-group-role-actor` and a list of group names. For example, `"atlassian-group-role-actor":["another","administrators"]}`. Add users using `atlassian-user-role-actor` and a list of account IDs. For example, `"atlassian-user-role-actor":["12345678-9abc-def1-2345-6789abcdef12", "abcdef12-3456-789a-bcde-f123456789ab"]`.
    record {} categorisedActors?;
};

# Details of a screen.
public type ScreenDetails record {
    # The name of the screen. The name must be unique. The maximum length is 255 characters.
    string name;
    # The description of the screen. The maximum length is 255 characters.
    string description?;
};

# Identifiers for a project.
public type ProjectIdentifiers record {
    # The URL of the created project.
    string self;
    # The ID of the created project.
    int id;
    # The key of the created project.
    string 'key;
};

# Details of a remote issue link.
public type RemoteIssueLinkRequest record {
    # An identifier for the remote item in the remote system. For example, the global ID for a remote item in Confluence would consist of the app ID and page ID, like this: `appId=456&pageId=123`.
    # 
    # Setting this field enables the remote issue link details to be updated or deleted using remote system and item details as the record identifier, rather than using the record's Jira ID.
    # 
    # The maximum length is 255 characters.
    string globalId?;
    # Details of the remote application the linked item is in. For example, trello.
    Application application?;
    # Description of the relationship between the issue and the linked item. If not set, the relationship description "links to" is used in Jira.
    string relationship?;
    # Details of the item linked to.
    RemoteObject 'object;
};

public type JiraExpressionsComplexityValueBean record {
    # The complexity value of the current expression.
    int value;
    # The maximum allowed complexity. The evaluation will fail if this value is exceeded.
    int 'limit;
};

# A rule configuration.
public type RuleConfiguration record {
    # Configuration of the rule, as it is stored by the Connect app on the rule configuration page.
    string value;
};

# Details of the contextual configuration for a custom field.
public type ContextualConfiguration record {
    # The ID of the context the configuration is associated with.
    int contextId;
    # The configuration associated with the context.
    anydata configuration?;
};

# Details about syntax and type errors. The error details apply to the entire expression, unless the object includes:
# 
#  *  `line` and `column`
#  *  `expression`
public type JiraExpressionValidationError record {
    # The text line in which the error occurred.
    int line?;
    # The text column in which the error occurred.
    int column?;
    # The part of the expression in which the error occurred.
    string expression?;
    # Details about the error.
    string message;
    # The error type.
    string 'type;
};

# ID of a registered webhook or error messages explaining why a webhook wasn't registered.
public type RegisteredWebhook record {
    # The ID of the webhook. Returned if the webhook is created.
    int createdWebhookId?;
    # Error messages specifying why the webhook creation failed.
    string[] errors?;
};

# Details of functions that can be used in advanced searches.
public type FunctionReferenceData record {
    # The function identifier.
    string value?;
    # The display name of the function.
    string displayName?;
    # Whether the function can take a list of arguments.
    string isList?;
    # The data types returned by the function.
    string[] types?;
};

# Details of context to project associations.
public type CustomFieldContextProjectMapping record {
    # The ID of the context.
    string contextId;
    # The ID of the project.
    string projectId?;
    # Whether context is global.
    boolean isGlobalContext?;
};

# Details of the order-by JQL clause.
public type JqlQueryOrderByClause record {
    # The list of order-by clause fields and their ordering directives.
    JqlQueryOrderByClauseElement[] fields;
};

# A page of items.
public type PageBeanString record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    string[] values?;
};

public type JiraExpressionEvalContextBean record {
    # The issue that is available under the `issue` variable when evaluating the expression.
    IdOrKeyBean issue?;
    # The collection of issues that is available under the `issues` variable when evaluating the expression.
    JexpIssues issues?;
    # The project that is available under the `project` variable when evaluating the expression.
    IdOrKeyBean project?;
    # The ID of the sprint that is available under the `sprint` variable when evaluating the expression.
    int sprint?;
    # The ID of the board that is available under the `board` variable when evaluating the expression.
    int board?;
    # The ID of the service desk that is available under the `serviceDesk` variable when evaluating the expression.
    int serviceDesk?;
    # The ID of the customer request that is available under the `customerRequest` variable when evaluating the expression. This is the same as the ID of the underlying Jira issue, but the customer request context variable will have a different type.
    int customerRequest?;
};

# Details about the replacement for a deleted version.
public type CustomFieldReplacement record {
    # The ID of the custom field in which to replace the version number.
    int customFieldId?;
    # The version number to use as a replacement for the deleted version.
    int moveTo?;
};

# A list of changelog IDs.
public type IssueChangelogIds record {
    # The list of changelog IDs.
    int[] changelogIds;
};

# Details of an issue navigator column item.
public type ColumnItem record {
    # The issue navigator column label.
    string label?;
    # The issue navigator column value.
    string value?;
};

# A [Connect module](https://developer.atlassian.com/cloud/jira/platform/about-jira-modules/) in the same format as in the
# [app descriptor](https://developer.atlassian.com/cloud/jira/platform/app-descriptor/).
public type ConnectModule record {
};

# A page of items.
public type PageBeanVersion record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Version[] values?;
};

# Information about the most recent use of a field.
public type FieldLastUsed record {
    # Last used value type:
    # 
    #  *  *TRACKED*: field is tracked and a last used date is available.
    #  *  *NOT\_TRACKED*: field is not tracked, last used date is not available.
    #  *  *NO\_INFORMATION*: field is tracked, but no last used date is available.
    string 'type?;
    # The date when the value of the field last changed.
    string value?;
};

public type CustomFieldDefinitionJsonBean record {
    # The name of the custom field, which is displayed in Jira. This is not the unique identifier.
    string name;
    # The description of the custom field, which is displayed in Jira.
    string description?;
    # The type of the custom field. These built-in custom field types are available:
    # 
    #  *  `cascadingselect`: Enables values to be selected from two levels of select lists (value: `com.atlassian.jira.plugin.system.customfieldtypes:cascadingselect`)
    #  *  `datepicker`: Stores a date using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:datepicker`)
    #  *  `datetime`: Stores a date with a time component (value: `com.atlassian.jira.plugin.system.customfieldtypes:datetime`)
    #  *  `float`: Stores and validates a numeric (floating point) input (value: `com.atlassian.jira.plugin.system.customfieldtypes:float`)
    #  *  `grouppicker`: Stores a user group using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:grouppicker`)
    #  *  `importid`: A read-only field that stores the ID the issue had in the system it was imported from (value: `com.atlassian.jira.plugin.system.customfieldtypes:importid`)
    #  *  `labels`: Stores labels (value: `com.atlassian.jira.plugin.system.customfieldtypes:labels`)
    #  *  `multicheckboxes`: Stores multiple values using checkboxes (value: ``)
    #  *  `multigrouppicker`: Stores multiple user groups using a picker control (value: ``)
    #  *  `multiselect`: Stores multiple values using a select list (value: `com.atlassian.jira.plugin.system.customfieldtypes:multicheckboxes`)
    #  *  `multiuserpicker`: Stores multiple users using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:multigrouppicker`)
    #  *  `multiversion`: Stores multiple versions from the versions available in a project using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:multiversion`)
    #  *  `project`: Stores a project from a list of projects that the user is permitted to view (value: `com.atlassian.jira.plugin.system.customfieldtypes:project`)
    #  *  `radiobuttons`: Stores a value using radio buttons (value: `com.atlassian.jira.plugin.system.customfieldtypes:radiobuttons`)
    #  *  `readonlyfield`: Stores a read-only text value, which can only be populated via the API (value: `com.atlassian.jira.plugin.system.customfieldtypes:readonlyfield`)
    #  *  `select`: Stores a value from a configurable list of options (value: `com.atlassian.jira.plugin.system.customfieldtypes:select`)
    #  *  `textarea`: Stores a long text string using a multiline text area (value: `com.atlassian.jira.plugin.system.customfieldtypes:textarea`)
    #  *  `textfield`: Stores a text string using a single-line text box (value: `com.atlassian.jira.plugin.system.customfieldtypes:textfield`)
    #  *  `url`: Stores a URL (value: `com.atlassian.jira.plugin.system.customfieldtypes:url`)
    #  *  `userpicker`: Stores a user using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:userpicker`)
    #  *  `version`: Stores a version using a picker control (value: `com.atlassian.jira.plugin.system.customfieldtypes:version`)
    # 
    # To create a field based on a [Forge custom field type](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#jira-custom-field-type--beta-), use the ID of the Forge custom field type as the value. For example, `ari:cloud:ecosystem::extension/e62f20a2-4b61-4dbe-bfb9-9a88b5e3ac84/548c5df1-24aa-4f7c-bbbb-3038d947cb05/static/my-cf-type-key`.
    string 'type;
    # The searcher defines the way the field is searched in Jira. For example, *com.atlassian.jira.plugin.system.customfieldtypes:grouppickersearcher*.  
    # The search UI (basic search and JQL search) will display different operations and values for the field, based on the field searcher. You must specify a searcher that is valid for the field type, as listed below (abbreviated values shown):
    # 
    #  *  `cascadingselect`: `cascadingselectsearcher`
    #  *  `datepicker`: `daterange`
    #  *  `datetime`: `datetimerange`
    #  *  `float`: `exactnumber` or `numberrange`
    #  *  `grouppicker`: `grouppickersearcher`
    #  *  `importid`: `exactnumber` or `numberrange`
    #  *  `labels`: `labelsearcher`
    #  *  `multicheckboxes`: `multiselectsearcher`
    #  *  `multigrouppicker`: `multiselectsearcher`
    #  *  `multiselect`: `multiselectsearcher`
    #  *  `multiuserpicker`: `userpickergroupsearcher`
    #  *  `multiversion`: `versionsearcher`
    #  *  `project`: `projectsearcher`
    #  *  `radiobuttons`: `multiselectsearcher`
    #  *  `readonlyfield`: `textsearcher`
    #  *  `select`: `multiselectsearcher`
    #  *  `textarea`: `textsearcher`
    #  *  `textfield`: `textsearcher`
    #  *  `url`: `exacttextsearcher`
    #  *  `userpicker`: `userpickergroupsearcher`
    #  *  `version`: `versionsearcher`
    # 
    # If no searcher is provided, the field isn't searchable. However, [Forge custom fields](https://developer.atlassian.com/platform/forge/manifest-reference/modules/#jira-custom-field-type--beta-) have a searcher set automatically, so are always searchable.
    string searcherKey?;
};

# A page of items.
public type PageBeanUserKey record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    UserKey[] values?;
};

# A page of items.
public type PageBeanScreenScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    ScreenScheme[] values?;
};

# The projects the item is associated with. Indicated for items associated with [next-gen projects](https://confluence.atlassian.com/x/loMyO).
public type Scope record {
    # The type of scope.
    string 'type?;
    # The project the item has scope in.
    ProjectForScope project?;
};

# Details about a permission granted to a user or group.
public type PermissionGrant record {
    # The ID of the permission granted details.
    int id?;
    # The URL of the permission granted details.
    string self?;
    # The user or group being granted the permission. It consists of a `type` and a type-dependent `parameter`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.
    PermissionHolder holder?;
    # The permission to grant. This permission can be one of the built-in permissions or a custom permission added by an app. See [Built-in permissions](../api-group-permission-schemes/#built-in-permissions) in *Get all permission schemes* for more information about the built-in permissions. See the [project permission](https://developer.atlassian.com/cloud/jira/platform/modules/project-permission/) and [global permission](https://developer.atlassian.com/cloud/jira/platform/modules/global-permission/) module documentation for more information about custom permissions.
    string permission?;
};

# Details about a filter.
public type Filter record {
    # The URL of the filter.
    string self?;
    # The unique identifier for the filter.
    string id?;
    # The name of the filter. Must be unique.
    string name;
    # A description of the filter.
    string description?;
    # The user who owns the filter. This is defaulted to the creator of the filter, however Jira administrators can change the owner of a shared filter in the admin settings.
    User owner?;
    # The JQL query for the filter. For example, *project = SSP AND issuetype = Bug*.
    string jql?;
    # A URL to view the filter results in Jira, using the ID of the filter. For example, *https://your-domain.atlassian.net/issues/?filter=10100*.
    string viewUrl?;
    # A URL to view the filter results in Jira, using the [Search for issues using JQL](#api-rest-api-2-filter-search-get) operation with the filter's JQL string to return the filter results. For example, *https://your-domain.atlassian.net/rest/api/2/search?jql=project+%3D+SSP+AND+issuetype+%3D+Bug*.
    string searchUrl?;
    # Whether the filter is selected as a favorite.
    boolean favourite?;
    # The count of how many users have selected this filter as a favorite, including the filter owner.
    int favouritedCount?;
    # The groups and projects that the filter is shared with.
    SharePermission[] sharePermissions?;
    # A paginated list of the users that the filter is shared with. This includes users that are members of the groups or can browse the projects that the filter is shared with.
    UserList sharedUsers?;
    # A paginated list of the users that are subscribed to the filter.
    FilterSubscriptionsList subscriptions?;
};

# Default value for a single select custom field.
public type CustomFieldContextDefaultValueSingleOption record {
    # The ID of the context.
    string contextId;
    # The ID of the default option.
    string optionId;
    # The type of the default option.
    string 'type;
};

# The list of issue type IDs.
public type IssueTypeIds record {
    # The list of issue type IDs.
    string[] issueTypeIds;
};

# A page of items.
public type PageBeanWorkflowTransitionRules record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    WorkflowTransitionRules[] values?;
};

# A workflow transition rule condition. This object returns `nodeType` as `simple`.
public type WorkflowSimpleCondition record {
    # The type of the transition rule.
    string 'type;
    # EXPERIMENTAL. The configuration of the transition rule.
    anydata configuration?;
    # The node type of the transition rule.
    string nodeType;
};

# A page of items.
public type PageBeanWorkflow record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Workflow[] values?;
};

# Count of issues assigned to a component.
public type ComponentIssuesCount record {
    # The URL for this count of issues for a component.
    string self?;
    # The count of issues assigned to a component.
    int issueCount?;
};

# A page of items.
public type PageBeanContextualConfiguration record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    ContextualConfiguration[] values?;
};

# Details of the name, description, and default issue type for an issue type scheme.
public type IssueTypeSchemeUpdateDetails record {
    # The name of the issue type scheme. The name must be unique. The maximum length is 255 characters.
    string name?;
    # The description of the issue type scheme. The maximum length is 4000 characters.
    string description?;
    # The ID of the default issue type of the issue type scheme.
    string defaultIssueTypeId?;
};

public type IssueFieldOptionScopeBean record {
    # DEPRECATED
    int[] projects?;
    # Defines the projects in which the option is available and the behavior of the option within each project. Specify one object per project. The behavior of the option in a project context overrides the behavior in the global context.
    ProjectScopeBean[] projects2?;
    # Defines the behavior of the option within the global context. If this property is set, even if set to an empty object, then the option is available in all projects.
    GlobalScopeBean global?;
};

# Details of a screen.
public type UpdateScreenDetails record {
    # The name of the screen. The name must be unique. The maximum length is 255 characters.
    string name?;
    # The description of the screen. The maximum length is 255 characters.
    string description?;
};

public type AttachmentArchive record {
    boolean moreAvailable?;
    int totalNumberOfEntriesAvailable?;
    int totalEntryCount?;
    AttachmentArchiveEntry[] entries?;
};

# Details of an entity property.
public type JqlQueryFieldEntityProperty record {
    # The object on which the property is set.
    string entity;
    # The key of the property.
    string 'key;
    # The path in the property value to query.
    string path;
    # The type of the property value extraction. Not available if the extraction for the property is not registered on the instance with the [Entity property](https://developer.atlassian.com/cloud/jira/platform/modules/entity-property/) module.
    string 'type?;
};

# Details of a dashboard.
public type DashboardDetails record {
    # The name of the dashboard.
    string name;
    # The description of the dashboard.
    string description?;
    # The details of any share permissions for the dashboard.
    SharePermission[] sharePermissions;
};

# A paginated list of subscriptions to a filter.
public type FilterSubscriptionsList record {
    # The number of items on the page.
    int size?;
    # The list of items.
    FilterSubscription[] items?;
    # The maximum number of results that could be on the page.
    int 'max\-results?;
    # The index of the first item returned on the page.
    int 'start\-index?;
    # The index of the last item returned on the page.
    int 'end\-index?;
};

public type RichText record {
    boolean emptyAdf?;
    boolean finalised?;
    boolean valueSet?;
};

# A page of items.
public type PageBeanWorkflowScheme record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    WorkflowScheme[] values?;
};

public type RemoveOptionFromIssuesResult record {
    # The IDs of the modified issues.
    int[] modifiedIssues?;
    # The IDs of the unchanged issues, those issues where errors prevent modification.
    int[] unmodifiedIssues?;
    # A collection of errors related to unchanged issues. The collection size is limited, which means not all errors may be returned.
    SimpleErrorCollection errors?;
};

# Details of the group associated with the role.
public type ProjectRoleGroup record {
    # The display name of the group.
    string displayName?;
    # The name of the group
    string name?;
};

# Metadata for an archive (for example a zip) and its contents.
public type AttachmentArchiveMetadataReadable record {
    # The ID of the attachment.
    int id?;
    # The name of the archive file.
    string name?;
    # The list of the items included in the archive.
    AttachmentArchiveItemReadable[] entries?;
    # The number of items included in the archive.
    int totalEntryCount?;
    # The MIME type of the attachment.
    string mediaType?;
};

# Project list with assigned field configuration schema.
public type FieldConfigurationSchemeProjects record {
    # Details of a field configuration scheme.
    FieldConfigurationScheme fieldConfigurationScheme?;
    # The IDs of projects using the field configuration scheme.
    string[] projectIds;
};

# Details of the operations that can be performed on the issue.
public type Operations record {
    # Details of the link groups defining issue operations.
    LinkGroup[] linkGroups?;
};

# Details of user or system associated with a issue history metadata item.
public type HistoryMetadataParticipant record {
    # The ID of the user or system associated with a history record.
    string id?;
    # The display name of the user or system associated with a history record.
    string displayName?;
    # The key of the display name of the user or system associated with a history record.
    string displayNameKey?;
    # The type of the user or system associated with a history record.
    string 'type?;
    # The URL to an avatar for the user or system associated with a history record.
    string avatarUrl?;
    # The URL of the user or system associated with a history record.
    string url?;
};

# A project category.
public type ProjectCategory record {
    # The URL of the project category.
    string self?;
    # The ID of the project category.
    string id?;
    # The name of the project category. Required on create, optional on update.
    string name?;
    # The description of the project category.
    string description?;
};

# Issue security level member.
public type IssueSecurityLevelMember record {
    # The ID of the issue security level member.
    int id;
    # The ID of the issue security level.
    int issueSecurityLevelId;
    # The user or group being granted the permission. It consists of a `type` and a type-dependent `parameter`. See [Holder object](../api-group-permission-schemes/#holder-object) in *Get all permission schemes* for more information.
    PermissionHolder holder;
};

# Metadata for an issue attachment.
public type AttachmentMetadata record {
    # The ID of the attachment.
    int id?;
    # The URL of the attachment metadata details.
    string self?;
    # The name of the attachment file.
    string filename?;
    # Details of the user who attached the file.
    User author?;
    # The datetime the attachment was created.
    string created?;
    # The size of the attachment.
    int size?;
    # The MIME type of the attachment.
    string mimeType?;
    # Additional properties of the attachment.
    record {} properties?;
    # The URL of the attachment.
    string content?;
    # The URL of a thumbnail representing the attachment.
    string thumbnail?;
};

# Details about the mapping from a status to a new status for an issue type.
public type StatusMapping record {
    # The ID of the issue type.
    string issueTypeId;
    # The ID of the status.
    string statusId;
    # The ID of the new status.
    string newStatusId;
};

# An issue suggested for use in the issue picker auto-completion.
public type SuggestedIssue record {
    # The ID of the issue.
    int id?;
    # The key of the issue.
    string 'key?;
    # The key of the issue in HTML format.
    string keyHtml?;
    # The URL of the issue type's avatar.
    string img?;
    # The phrase containing the query string in HTML format, with the string highlighted with HTML bold tags.
    string summary?;
    # The phrase containing the query string, as plain text.
    string summaryText?;
};

# A page of items.
public type PageBeanCustomFieldContextOption record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    CustomFieldContextOption[] values?;
};

# Details about a group.
public type GroupDetails record {
    # The name of the group.
    string name?;
    # The ID of the group, if available, which uniquely identifies the group across all Atlassian products. For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*.
    string groupId?;
};

# Details about a user assigned to a project role.
public type RoleActor record {
    # The ID of the role actor.
    int id?;
    # The display name of the role actor. For users, depending on the user’s privacy setting, this may return an alternative value for the user's name.
    string displayName?;
    # The type of role actor.
    string 'type?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # The avatar of the role actor.
    string avatarUrl?;
    # The project role related to the role actor.
    ProjectRoleUser actorUser?;
    # The project role group related to the role actor.
    ProjectRoleGroup actorGroup?;
};

public type UnrestrictedUserEmail record {
    # The accountId of the user
    string accountId?;
    # The email of the user
    string email?;
};

public type IssuesUpdateBean record {
    IssueUpdateDetails[] issueUpdates?;
};

# Permissions which a user has on a project.
public type ProjectPermissions record {
    # Whether the logged user can edit the project.
    boolean canEdit?;
};

public type AttachmentArchiveImpl record {
    # The list of the items included in the archive.
    AttachmentArchiveEntry[] entries?;
    # The number of items in the archive.
    int totalEntryCount?;
};

# Details about a component with a count of the issues it contains.
public type ComponentWithIssueCount record {
    # Count of issues for the component.
    int issueCount?;
    # The description for the component.
    string description?;
    # The URL for this count of the issues contained in the component.
    string self?;
    # The key of the project to which the component is assigned.
    string project?;
    # The user details for the component's lead user.
    User lead?;
    # The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Takes the following values:
    # 
    #  *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.
    #  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.
    #  *  `UNASSIGNED` an assignee is not set for issues created with this component.
    #  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.
    string assigneeType?;
    # Not used.
    int projectId?;
    # The details of the user associated with `assigneeType`, if any. See `realAssignee` for details of the user assigned to issues created with this component.
    User assignee?;
    # The user assigned to issues created with this component, when `assigneeType` does not identify a valid assignee.
    User realAssignee?;
    # Whether a user is associated with `assigneeType`. For example, if the `assigneeType` is set to `COMPONENT_LEAD` but the component lead is not set, then `false` is returned.
    boolean isAssigneeTypeValid?;
    # The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:
    # 
    #  *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.
    #  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.
    #  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.
    #  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
    string realAssigneeType?;
    # The name for the component.
    string name?;
    # The unique identifier for the component.
    string id?;
};

# A list of custom field options for a context.
public type CustomFieldUpdatedContextOptionsList record {
    # The updated custom field options.
    CustomFieldOptionUpdate[] options?;
};

# Details about system and custom avatars.
public type Avatars record {
    # System avatars list.
    Avatar[] system?;
    # Custom avatars list.
    Avatar[] custom?;
};

# A page of items.
public type PageBeanGroupDetails record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    GroupDetails[] values?;
};

# Details of a field configuration scheme.
public type FieldConfigurationScheme record {
    # The ID of the field configuration scheme.
    string id;
    # The name of the field configuration scheme.
    string name;
    # The description of the field configuration scheme.
    string description?;
};

# A user found in a search.
public type UserPickerUser record {
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string accountId?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # The display name, email address, and key of the user with the matched query string highlighted with the HTML bold tag.
    string html?;
    # The display name of the user. Depending on the user’s privacy setting, this may be returned as null.
    string displayName?;
    # The avatar URL of the user.
    string avatarUrl?;
};

public type UserMigrationBean record {
    string 'key?;
    string username?;
    string accountId?;
};

# An entity property, for more information see [Entity properties](https://developer.atlassian.com/cloud/jira/platform/jira-entity-properties/).
public type EntityProperty record {
    # The key of the property. Required on create and update.
    string 'key?;
    # The value of the property. Required on create and update.
    anydata value?;
};

# Meta data describing the `issues` context variable.
public type IssuesMetaBean record {
    # The description of the page of issues loaded by the provided JQL query.
    IssuesJqlMetaDataBean jql?;
};

# The details of a custom field context.
public type CustomFieldContext record {
    # The ID of the context.
    string id;
    # The name of the context.
    string name;
    # The description of the context.
    string description;
    # Whether the context is global.
    boolean isGlobalContext;
    # Whether the context apply to all issue types.
    boolean isAnyIssueType;
};

# Details of a user or group subscribing to a filter.
public type FilterSubscription record {
    # The ID of the filter subscription.
    int id?;
    # The user subscribing to filter.
    User user?;
    # The group subscribing to filter.
    GroupName 'group?;
};

public type JiraExpressionEvalRequestBean record {
    # The Jira expression to evaluate.
    string expression;
    # The context in which the Jira expression is evaluated.
    JiraExpressionEvalContextBean context?;
};

# A changelog.
public type Changelog record {
    # The ID of the changelog.
    string id?;
    # The user who made the change.
    UserDetails author?;
    # The date on which the change took place.
    string created?;
    # The list of items changed.
    ChangeDetails[] items?;
    # The history metadata associated with the changed.
    HistoryMetadata historyMetadata?;
};

public type SharePermissionInputBean record {
    # The type of the share permission.Specify the type as follows:
    # 
    #  *  `group` Share with a group. Specify `groupname` as well.
    #  *  `project` Share with a project. Specify `projectId` as well.
    #  *  `projectRole` Share with a project role in a project. Specify `projectId` and `projectRoleId` as well.
    #  *  `global` Share globally, including anonymous users. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.
    #  *  `authenticated` Share with all logged-in users. This shows as `loggedin` in the response. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.
    string 'type;
    # The ID of the project to share the filter with. Set `type` to `project`.
    string projectId?;
    # The name of the group to share the filter with. Set `type` to `group`.
    string groupname?;
    # The ID of the project role to share the filter with. Set `type` to `projectRole` and the `projectId` for the project that the role is in.
    string projectRoleId?;
};

# Time tracking details.
public type TimeTrackingDetails record {
    # The original estimate of time needed for this issue in readable format.
    string originalEstimate?;
    # The remaining estimate of time needed for this issue in readable format.
    string remainingEstimate?;
    # Time worked on this issue in readable format.
    string timeSpent?;
    # The original estimate of time needed for this issue in seconds.
    int originalEstimateSeconds?;
    # The remaining estimate of time needed for this issue in seconds.
    int remainingEstimateSeconds?;
    # Time worked on this issue in seconds.
    int timeSpentSeconds?;
};

# A page of items.
public type PageBeanCustomFieldContext record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    CustomFieldContext[] values?;
};

# Details of an issue transition.
public type IssueTransition record {
    # The ID of the issue transition. Required when specifying a transition to undertake.
    string id?;
    # The name of the issue transition.
    string name?;
    # Details of the issue status after the transition.
    StatusDetails to?;
    # Whether there is a screen associated with the issue transition.
    boolean hasScreen?;
    # Whether the issue transition is global, that is, the transition is applied to issues regardless of their status.
    boolean isGlobal?;
    # Whether this is the initial issue transition for the workflow.
    boolean isInitial?;
    # Whether the transition is available to be performed.
    boolean isAvailable?;
    # Whether the issue has to meet criteria before the issue transition is applied.
    boolean isConditional?;
    # Details of the fields associated with the issue transition screen. Use this information to populate `fields` and `update` in a transition request.
    record {} fields?;
    # Expand options that include additional transition details in the response.
    string expand?;
    # Whether looped or not
    boolean looped?;
};

# The result of evaluating a Jira expression.
public type JiraExpressionResult record {
    # The value of the evaluated expression. It may be a primitive JSON value or a Jira REST API object. (Some expressions do not produce any meaningful results—for example, an expression that returns a lambda function—if that's the case a simple string representation is returned. These string representations should not be relied upon and may change without notice.)
    anydata value;
    # Contains various characteristics of the performed expression evaluation.
    JiraExpressionEvaluationMetaDataBean meta?;
};

# The IDs of the screens for the screen types of the screen scheme.
public type ScreenTypes record {
    # The ID of the edit screen.
    int edit?;
    # The ID of the create screen.
    int create?;
    # The ID of the view screen.
    int view?;
    # The ID of the default screen. Required when creating a screen scheme.
    int 'default?;
};

# A workflow with transition rules.
public type WorkflowTransitionRules record {
    # Properties that identify a workflow.
    WorkflowId workflowId;
    # The list of post functions within the workflow.
    ConnectWorkflowTransitionRule[] postFunctions;
    # The list of conditions within the workflow.
    ConnectWorkflowTransitionRule[] conditions;
    # The list of validators within the workflow.
    ConnectWorkflowTransitionRule[] validators;
};

# The project and issue type mappings.
public type ProjectIssueTypeMappings record {
    # The project and issue type mappings.
    ProjectIssueTypeMapping[] mappings;
};

# Details of any errors encountered while updating workflow transition rules.
public type WorkflowTransitionRulesUpdateErrors record {
    # A list of workflows.
    WorkflowTransitionRulesUpdateErrorDetails[] updateResults;
};

# A screen tab field.
public type ScreenableField record {
    # The ID of the screen tab field.
    string id?;
    # The name of the screen tab field. Required on create and update. The maximum length is 255 characters.
    string name?;
};

# Details about a notification scheme event.
public type NotificationSchemeEvent record {
    # Details about a notification event.
    NotificationEvent event?;
    # Details about notifications.
    EventNotification[] notifications?;
};

# A field auto-complete suggestion.
public type AutoCompleteSuggestion record {
    # The value of a suggested item.
    string value?;
    # The display name of a suggested item. If `fieldValue` or `predicateValue` are provided, the matching text is highlighted with the HTML bold tag.
    string displayName?;
};

# Details about a project component.
public type ProjectComponent record {
    # The URL of the component.
    string self?;
    # The unique identifier for the component.
    string id?;
    # The unique name for the component in the project. Required when creating a component. Optional when updating a component. The maximum length is 255 characters.
    string name?;
    # The description for the component. Optional when creating or updating a component.
    string description?;
    # The user details for the component's lead user.
    User lead?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string leadUserName?;
    # The accountId of the component's lead user. The accountId uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string leadAccountId?;
    # The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Can take the following values:
    # 
    #  *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.
    #  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.
    #  *  `UNASSIGNED` an assignee is not set for issues created with this component.
    #  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.
    # 
    # Default value: `PROJECT_DEFAULT`.  
    # Optional when creating or updating a component.
    string assigneeType?;
    # The details of the user associated with `assigneeType`, if any. See `realAssignee` for details of the user assigned to issues created with this component.
    User assignee?;
    # The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:
    # 
    #  *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.
    #  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.
    #  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.
    #  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
    string realAssigneeType?;
    # The user assigned to issues created with this component, when `assigneeType` does not identify a valid assignee.
    User realAssignee?;
    # Whether a user is associated with `assigneeType`. For example, if the `assigneeType` is set to `COMPONENT_LEAD` but the component lead is not set, then `false` is returned.
    boolean isAssigneeTypeValid?;
    # The key of the project the component is assigned to. Required when creating a component. Can't be updated.
    string project?;
    # The ID of the project the component is assigned to.
    int projectId?;
};

# Details about the server Jira is running on.
public type WorkflowTransitionProperty record {
    # The key of the transition property. Also known as the name of the transition property.
    string 'key?;
    # The value of the transition property.
    string value;
    # The ID of the transition property.
    string id?;
};

# Details of issue history metadata.
public type HistoryMetadata record {
    # The type of the history record.
    string 'type?;
    # The description of the history record.
    string description?;
    # The description key of the history record.
    string descriptionKey?;
    # The activity described in the history record.
    string activityDescription?;
    # The key of the activity described in the history record.
    string activityDescriptionKey?;
    # The description of the email address associated the history record.
    string emailDescription?;
    # The description key of the email address associated the history record.
    string emailDescriptionKey?;
    # Details of the user whose action created the history record.
    HistoryMetadataParticipant actor?;
    # Details of the system that generated the history record.
    HistoryMetadataParticipant generator?;
    # Details of the cause that triggered the creation the history record.
    HistoryMetadataParticipant cause?;
    # Additional arbitrary information about the history record.
    record {} extraData?;
};

# A page of failed webhooks.
public type FailedWebhooks record {
    # The list of webhooks.
    FailedWebhook[] values;
    # The maximum number of items on the page. If the list of values is shorter than this number, then there are no more pages.
    int maxResults;
    # The URL to the next page of results. Present only if the request returned at least one result.The next page may be empty at the time of receiving the response, but new failed webhooks may appear in time. You can save the URL to the next page and query for new results periodically (for example, every hour).
    string next?;
};

# A page of items.
public type PageBeanComment record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    Comment[] values?;
};

public type ListWrapperCallbackApplicationRole record {
};

# Associated issue type screen scheme and project.
public type IssueTypeScreenSchemeProjectAssociation record {
    # The ID of the issue type screen scheme.
    string issueTypeScreenSchemeId?;
    # The ID of the project.
    string projectId?;
};

# Issue type scheme with a list of the projects that use it.
public type IssueTypeSchemeProjects record {
    # Details of an issue type scheme.
    IssueTypeScheme issueTypeScheme;
    # The IDs of the projects using the issue type scheme.
    string[] projectIds;
};

# The project issue type hierarchy.
public type Hierarchy record {
    # The ID of the base level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    int baseLevelId?;
    # Details about the hierarchy level.
    HierarchyLevel[] levels?;
};

# Details of a screen scheme.
public type UpdateScreenSchemeDetails record {
    # The name of the screen scheme. The name must be unique. The maximum length is 255 characters.
    string name?;
    # The description of the screen scheme. The maximum length is 255 characters.
    string description?;
    # The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.
    UpdateScreenTypes screens?;
};

public type IssueCommentListRequestBean record {
    # The list of comment IDs. A maximum of 1000 IDs can be specified.
    int[] ids;
};

# A page of items.
public type PageBeanFieldConfiguration record {
    # The URL of the page.
    string self?;
    # If there is another page of results, the URL of the next page.
    string nextPage?;
    # The maximum number of items that could be returned.
    int maxResults?;
    # The index of the first item returned.
    int startAt?;
    # The number of items returned.
    int total?;
    # Whether this is the last page.
    boolean isLast?;
    # The list of items.
    FieldConfiguration[] values?;
};

# Details about the project.
public type CreateProjectDetails record {
    # Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.
    string 'key;
    # The name of the project.
    string name;
    # A brief description of the project.
    string description?;
    # This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `leadAccountId`.
    string lead?;
    # The account ID of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `lead`.
    string leadAccountId?;
    # A link to information about this project, such as project documentation
    string url?;
    # The default assignee when creating issues for this project.
    string assigneeType?;
    # An integer value for the project's avatar.
    int avatarId?;
    # The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-2-issuesecurityschemes-get) resource to get all issue security scheme IDs.
    int issueSecurityScheme?;
    # The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-2-permissionscheme-get) resource to see a list of all permission scheme IDs.
    int permissionScheme?;
    # The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-2-notificationscheme-get) resource to get a list of notification scheme IDs.
    int notificationScheme?;
    # The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-2-projectCategory-get) operation.
    int categoryId?;
    # The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.
    string projectTypeKey?;
    # A predefined configuration for a project. The type of the `projectTemplateKey` must match with the type of the `projectTypeKey`.
    string projectTemplateKey?;
    # The ID of the workflow scheme for the project. Use the [Get all workflow schemes](#api-rest-api-2-workflowscheme-get) operation to get a list of workflow scheme IDs. If you specify the workflow scheme you cannot specify the project template key.
    int workflowScheme?;
    # The ID of the issue type screen scheme for the project. Use the [Get all issue type screen schemes](#api-rest-api-2-issuetypescreenscheme-get) operation to get a list of issue type screen scheme IDs. If you specify the issue type screen scheme you cannot specify the project template key.
    int issueTypeScreenScheme?;
    # The ID of the issue type scheme for the project. Use the [Get all issue type schemes](#api-rest-api-2-issuetypescheme-get) operation to get a list of issue type scheme IDs. If you specify the issue type scheme you cannot specify the project template key.
    int issueTypeScheme?;
    # The ID of the field configuration scheme for the project. Use the [Get all field configuration schemes](#api-rest-api-2-fieldconfigurationscheme-get) operation to get a list of field configuration scheme IDs. If you specify the field configuration scheme you cannot specify the project template key.
    int fieldConfigurationScheme?;
};

# Details of updates for a custom field.
public type CustomFieldValueUpdateRequest record {
    # The list of custom field update details.
    CustomFieldValueUpdate[] updates?;
};

# Various counts of issues within a version.
public type VersionIssueCounts record {
    # The URL of these count details.
    string self?;
    # Count of issues where the `fixVersion` is set to the version.
    int issuesFixedCount?;
    # Count of issues where the `affectedVersion` is set to the version.
    int issuesAffectedCount?;
    # Count of issues where a version custom field is set to the version.
    int issueCountWithCustomFieldsShowingVersion?;
    # List of custom fields using the version.
    VersionUsageInCustomField[] customFieldUsage?;
};

# Details of project permissions and associated issues and projects to look up.
public type BulkProjectPermissions record {
    # List of issue IDs.
    int[] issues?;
    # List of project IDs.
    int[] projects?;
    # List of project permissions.
    string[] permissions;
};

# An issue priority.
public type Priority record {
    # The URL of the issue priority.
    string self?;
    # The color used to indicate the issue priority.
    string statusColor?;
    # The description of the issue priority.
    string description?;
    # The URL of the icon for the issue priority.
    string iconUrl?;
    # The name of the issue priority.
    string name?;
    # The ID of the issue priority.
    string id?;
};

# The ID of an issue type screen scheme.
public type IssueTypeScreenSchemeId record {
    # The ID of the issue type screen scheme.
    string id;
};

# Counts of the number of issues in various statuses.
public type VersionIssuesStatus record {
    # Count of issues with a status other than *to do*, *in progress*, and *done*.
    int unmapped?;
    # Count of issues with status *to do*.
    int toDo?;
    # Count of issues with status *in progress*.
    int inProgress?;
    # Count of issues with status *done*.
    int done?;
};

# The JQL specifying the issues available in the evaluated Jira expression under the `issues` context variable.
public type JexpIssues record {
    # The JQL query that specifies the set of issues available in the Jira expression.
    JexpJqlIssues jql?;
};

public type AvatarUrlsBean record {
    # The URL of the item's 16x16 pixel avatar.
    string '16x16?;
    # The URL of the item's 24x24 pixel avatar.
    string '24x24?;
    # The URL of the item's 32x32 pixel avatar.
    string '32x32?;
    # The URL of the item's 48x48 pixel avatar.
    string '48x48?;
};

public type IdOrKeyBean record {
    # The ID of the referenced item.
    int id?;
    # The key of the referenced item.
    string 'key?;
};

# Key fields from the linked issue.
public type Fields record {
    # The summary description of the linked issue.
    string summary?;
    # The status of the linked issue.
    StatusDetails status?;
    # The priority of the linked issue.
    Priority priority?;
    # The assignee of the linked issue.
    UserDetails assignee?;
    # The time tracking of the linked issue.
    TimeTrackingDetails timetracking?;
    # Details about an issue type.
    IssueTypeDetails issuetype?;
    # The type of the linked issue.
    IssueTypeDetails issueType?;
};

# Details about a task.
public type TaskProgressBeanObject record {
    # The URL of the task.
    string self;
    # The ID of the task.
    string id;
    # The description of the task.
    string description?;
    # The status of the task.
    string status;
    # Information about the progress of the task.
    string message?;
    # The result of the task execution.
    anydata result?;
    # The ID of the user who submitted the task.
    int submittedBy;
    # The progress of the task, as a percentage complete.
    int progress;
    # The execution time of the task, in milliseconds.
    int elapsedRuntime;
    # A timestamp recording when the task was submitted.
    int submitted;
    # A timestamp recording when the task was started.
    int started?;
    # A timestamp recording when the task was finished.
    int finished?;
    # A timestamp recording when the task progress was last updated.
    int lastUpdate;
};

# List of property keys.
public type PropertyKeys record {
    # Property key details.
    PropertyKey[] keys?;
};

# A status.
public type StatusDetails record {
    # The URL of the status.
    string self?;
    # The description of the status.
    string description?;
    # The URL of the icon used to represent the status.
    string iconUrl?;
    # The name of the status.
    string name?;
    # The ID of the status.
    string id?;
    # The category assigned to the status.
    StatusCategory statusCategory?;
};

public type OperationMessage record {
    # The human-readable message that describes the result.
    string message;
    # The status code of the response.
    int statusCode;
};

# Details of an issue resolution.
public type Resolution record {
    # The URL of the issue resolution.
    string self?;
    # The ID of the issue resolution.
    string id?;
    # The description of the issue resolution.
    string description?;
    # The name of the issue resolution.
    string name?;
};

# A user with details as permitted by the user's Atlassian Account privacy settings. However, be aware of these exceptions:
# 
#  *  User record deleted from Atlassian: This occurs as the result of a right to be forgotten request. In this case, `displayName` provides an indication and other parameters have default values or are blank (for example, email is blank).
#  *  User record corrupted: This occurs as a results of events such as a server import and can only happen to deleted users. In this case, `accountId` returns *unknown* and all other parameters have fallback values.
#  *  User record unavailable: This usually occurs due to an internal service outage. In this case, all parameters have fallback values.
public type User record {
    # The URL of the user.
    string self?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required in requests.
    string accountId?;
    # The user account type. Can take the following values:
    # 
    #  *  `atlassian` regular Atlassian user account
    #  *  `app` system account used for Connect applications and OAuth to represent external systems
    #  *  `customer` Jira Service Desk account representing an external service desk
    string accountType?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # The email address of the user. Depending on the user’s privacy setting, this may be returned as null.
    string emailAddress?;
    AvatarUrlsBean avatarUrls?;
    # The display name of the user. Depending on the user’s privacy setting, this may return an alternative value.
    string displayName?;
    # Whether the user is active.
    boolean active?;
    # The time zone specified in the user's profile. Depending on the user’s privacy setting, this may be returned as null.
    string timeZone?;
    # The locale of the user. Depending on the user’s privacy setting, this may be returned as null.
    string locale?;
    # A simple wrapper group name.
    SimpleListWrapperGroupName groups?;
    SimpleListWrapperApplicationRole applicationRoles?;
    # Expand options that include additional user details in the response.
    string expand?;
};

public type ActorInputBean record {
    # The account IDs of the users to add as default actors. This parameter accepts a comma-separated list. For example, `"user":["5b10a2844c20165700ede21g", "5b109f2e9729b51b54dc274d"]`.
    string[] user?;
    # The name of the group to add as a default actor. This parameter accepts a comma-separated list. For example, `"group":["project-admin", "jira-developers"]`.
    string[] 'group?;
};

# A screen.
public type Screen record {
    # The ID of the screen.
    int id?;
    # The name of the screen.
    string name?;
    # The description of the screen.
    string description?;
    # The scope of the screen.
    Scope scope?;
};

# A list of editable field details.
public type IssueUpdateMetadata record {
    # A list of editable field details.
    record {} fields?;
};

# Details a link group, which defines issue operations.
public type LinkGroup record {
    # The ID of a link group.
    string id?;
    # The style class of a link group.
    string styleClass?;
    # Details about the operations available in this version.
    SimpleLink header?;
    # The weighted score of a link group.
    int weight?;
    # The links of a link group.
    SimpleLink[] links?;
    # The groups related to a link group.
    LinkGroup[] groups?;
};

# Details of an issue type hierarchy level.
public type ProjectIssueTypesHierarchyLevel record {
    # The ID of the issue type hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
    string entityId?;
    # The level of the issue type hierarchy level.
    int level?;
    # The name of the issue type hierarchy level.
    string name?;
    # The list of issue types in the hierarchy level.
    IssueTypeInfo[] issueTypes?;
};

# Details about a project role.
public type ProjectRoleDetails record {
    # The URL the project role details.
    string self?;
    # The name of the project role.
    string name?;
    # The ID of the project role.
    int id?;
    # The description of the project role.
    string description?;
    # Whether this role is the admin role for the project.
    boolean admin?;
    # The scope of the role. Indicated for roles associated with [next-gen projects](https://confluence.atlassian.com/x/loMyO).
    Scope scope?;
    # Whether the roles are configurable for this project.
    boolean roleConfigurable?;
    # The translated name of the project role.
    string translatedName?;
    # Whether this role is the default role for the project.
    boolean 'default?;
};

# Lists of issues and entity properties. See [Entity properties](https://developer.atlassian.com/cloud/jira/platform/jira-entity-properties/) for more information.
public type IssueEntityProperties record {
    # A list of entity property IDs.
    int[10000] entitiesIds?;
    # A list of entity property keys and values.
    record {} properties?;
};

# Additional details about a project.
public type ProjectInsight record {
    # Total issue count.
    int totalIssueCount?;
    # The last issue update time.
    string lastIssueUpdateTime?;
};

# An operand that is a JQL keyword. See [Advanced searching - keywords reference](https://confluence.atlassian.com/jiracorecloud/advanced-searching-keywords-reference-765593717.html#Advancedsearching-keywordsreference-EMPTYEMPTY) for more information about operand keywords.
public type KeywordOperand record {
    # The keyword that is the operand value.
    string keyword;
};

public type CustomFieldContextDefaultValue CustomFieldContextDefaultValueCascadingOption|CustomFieldContextDefaultValueMultipleOption|CustomFieldContextDefaultValueSingleOption;

# The schema of a field.
public type JsonTypeBean record {
    # The data type of the field.
    string 'type;
    # When the data type is an array, the name of the field items within the array.
    string items?;
    # If the field is a system field, the name of the field.
    string system?;
    # If the field is a custom field, the URI of the field.
    string custom?;
    # If the field is a custom field, the custom ID of the field.
    int customId?;
    # If the field is a custom field, the configuration of the field.
    record {} configuration?;
};

# Details about a notification event.
public type NotificationEvent record {
    # The ID of the event. The event can be a [Jira system event](https://confluence.atlassian.com/x/8YdKLg#Creatinganotificationscheme-eventsEvents) or a [custom event](https://confluence.atlassian.com/x/AIlKLg).
    int id?;
    # The name of the event.
    string name?;
    # The description of the event.
    string description?;
    # The template of the event. Only custom events configured by Jira administrators have template.
    NotificationEvent templateEvent?;
};

# A list of matched issues or errors for each JQL query, in the order the JQL queries were passed.
public type IssueMatches record {
    # Array of matched issues.
    IssueMatchesForJQL[] matches;
};

# A callback.
public type ListWrapperCallbackGroupName record {
};

public type VersionMoveBean record {
    # The URL (self link) of the version after which to place the moved version. Cannot be used with `position`.
    string after?;
    # An absolute position in which to place the moved version. Cannot be used with `after`.
    string position?;
};

# The classic workflow identifiers.
public type WorkflowIDs record {
    # The name of the workflow.
    string name;
    # The entity ID of the workflow.
    string entityId?;
};

# Details of an application role.
public type ApplicationRole record {
    # The key of the application role.
    string 'key?;
    # The groups associated with the application role.
    string[] groups?;
    # The display name of the application role.
    string name?;
    # The groups that are granted default access for this application role.
    string[] defaultGroups?;
    # Determines whether this application role should be selected by default on user creation.
    boolean selectedByDefault?;
    # Deprecated.
    boolean defined?;
    # The maximum count of users on your license.
    int numberOfSeats?;
    # The count of users remaining on your license.
    int remainingSeats?;
    # The number of users counting against your license.
    int userCount?;
    # The [type of users](https://confluence.atlassian.com/x/lRW3Ng) being counted against your license.
    string userCountDescription?;
    # Whether has unlimited remaining on your license or not.
    boolean hasUnlimitedSeats?;
    # Indicates if the application role belongs to Jira platform (`jira-core`).
    boolean platform?;
};

public type PaginatedResponseComment record {
    int total?;
    int maxResults?;
    int startAt?;
    Comment[] results?;
};
