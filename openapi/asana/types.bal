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

public type PortfolioMembershipResponse record {
    *PortfolioMembershipBase;
};

# A response object returned from a batch request.
public type BatchResponse record {
    # The JSON body that the invoked endpoint returned.
    record {} body?;
    # A map of HTTP headers specific to this result. This is primarily used for returning a `Location` header to accompany a `201 Created` result.  The parent HTTP response will contain all common headers.
    record {} headers?;
    # The HTTP status code that the invoked endpoint returned.
    int status_code?;
};

public type ProjectStatusRequest record {
    *ProjectStatusBase;
};

public type TeamRequest record {
    *TeamBase;
    # The description of the team.
    string description?;
    # The description of the team with formatting as HTML.
    string html_description?;
    # The organization/workspace the team belongs to.
    string organization?;
};

public type SectionTaskInsertRequest record {
    # An existing task within this section after which the added task should be inserted. Cannot be provided together with insert_before.
    string insert_after?;
    # An existing task within this section before which the added task should be inserted. Cannot be provided together with insert_after.
    string insert_before?;
    # The task to add to this section.
    string task;
};

public type ProjectMembershipBase record {
    *ProjectMembershipCompact;
};

public type CustomFieldSettingBase record {
    *CustomFieldSettingCompact;
};

public type PortfolioResponse record {
    *PortfolioBase;
    # The time at which this resource was created.
    string created_at?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact created_by?;
    # Array of custom field settings applied to the portfolio.
    CustomFieldSettingResponse[] custom_field_settings?;
    # The localized day on which this portfolio is due. This takes a date with format YYYY-MM-DD.
    string? due_on?;
    UserCompact[] members?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact owner?;
    # A url that points directly to the object within Asana.
    string permalink_url?;
    # The day on which work for this portfolio begins, or null if the portfolio has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` must be present in the request when setting or unsetting the `start_on` parameter. Additionally, start_on and due_on cannot be the same date.*
    string? start_on?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

# A story represents an activity associated with an object in the Asana system.
public type StoryBase record {
    *AsanaResource;
    # The time at which this resource was created.
    string created_at?;
    # [Opt In](/docs/input-output-options). HTML formatted text for a comment. This will not include the name of the creator.
    string html_text?;
    # *Conditional*. Whether the story should be pinned on the resource.
    boolean is_pinned?;
    # The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
    string resource_subtype?;
    # The name of the sticker in this story. `null` if there is no sticker.
    string sticker_name?;
    # The plain text of the comment to add. Cannot be used with html_text.
    string text?;
};

public type WebhookRequest record {
    # An array of WebhookFilter objects to specify a whitelist of filters to apply to events from this webhook. If a webhook event passes any of the filters the event will be delivered; otherwise no event will be sent to the receiving server.
    WebhookFilter[] filters?;
    # A resource ID to subscribe to. Many Asana resources are valid to create webhooks on, but higher-level resources require filters.
    string 'resource;
    # The URL to receive the HTTP POST. The full URL will be used to deliver events from this webhook (including parameters) which allows encoding of application-specific state when the webhook is created.
    string target;
};

public type TaskAddTagRequest record {
    # The tag to add to the task.
    string tag;
};

# A request object for use in a batch request.
public type BatchRequest record {
    # Batch request actions
    BatchRequestAction[] actions?;
};

public type CustomFieldSettingCompact record {
    *AsanaResource;
};

public type TagResponse record {
    *TagBase;
    # Array of users following this tag.
    UserCompact[] followers?;
    # A url that points directly to the object within Asana.
    string permalink_url?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

public type TaskAddProjectRequest record {
    # A task in the project to insert the task after, or `null` to insert at the beginning of the list.
    string? insert_after?;
    # A task in the project to insert the task before, or `null` to insert at the end of the list.
    string? insert_before?;
    # The project to add the task to.
    string project;
    # A section in the project to insert the task into. The task will be inserted at the bottom of the section.
    string? section?;
};

public type WebhookResponse record {
    *WebhookCompact;
    # The time at which this resource was created.
    string created_at?;
    # Whitelist of filters to apply to events from this webhook. If a webhook event passes any of the filters the event will be delivered; otherwise no event will be sent to the receiving server.
    WebhookFilter[] filters?;
    # The timestamp when the webhook last received an error when sending an event to the target.
    string last_failure_at?;
    # The contents of the last error response sent to the webhook when attempting to deliver events to the target.
    string last_failure_content?;
    # The timestamp when the webhook last successfully sent an event to the target.
    string last_success_at?;
};

public type AddCustomFieldSettingRequest record {
    # The custom field to associate with this container.
    string custom_field;
    # A gid of a Custom Field Setting on this container, after which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    string insert_after?;
    # A gid of a Custom Field Setting on this container, before which the new Custom Field Setting will be added.  `insert_before` and `insert_after` parameters cannot both be specified.
    string insert_before?;
    # Whether this field should be considered important to this container (for instance, to display in the list view of items in the container).
    boolean is_important?;
};

public type ProjectBase record {
    *ProjectCompact;
    # True if the project is archived, false if not. Archived projects do not show in the UI by default and may be treated differently for queries.
    boolean archived?;
    # Color of the project.
    string? color?;
    # The time at which this resource was created.
    string created_at?;
    ProjectStatusResponse current_status?;
    # Array of Custom Field Settings (in compact form).
    CustomFieldSettingCompact[] custom_field_settings?;
    # The default view (list, board, calendar, or timeline) of a project.
    string default_view?;
    # *Deprecated: new integrations should prefer the due_on field.*
    string? due_date?;
    # The day on which this project is due. This takes a date with format YYYY-MM-DD.
    string? due_on?;
    # [Opt In](/docs/input-output-options). The notes of the project with formatting as HTML.
    string html_notes?;
    # [Opt In](/docs/input-output-options). Determines if the project is a template.
    boolean is_template?;
    # Array of users who are members of this project.
    UserCompact[] members?;
    # The time at which this project was last modified.
    string modified_at?;
    # More detailed, free-form textual information associated with the project.
    string notes?;
    # True if the project is public to the organization. If false, do not share this project with other users in this organization without explicitly checking to see if they have access.
    boolean 'public?;
    # The day on which work for this project begins, or null if the project has no start date. This takes a date with `YYYY-MM-DD` format. *Note: `due_on` or `due_at` must be present in the request when setting or unsetting the `start_on` parameter. Additionally, start_on and due_on cannot be the same date.*
    string? start_on?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

public type CustomFieldResponse record {
    *CustomFieldBase;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact created_by?;
    # Enum options are the possible values which an enum custom field can adopt.
    EnumOption enum_value?;
};

# A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.
public type UserresponsePhoto record {
    # User profile image of size 128x128
    string image_128x128?;
    # User profile image of size 21x21
    string image_21x21?;
    # User profile image of size 27x27
    string image_27x27?;
    # User profile image of size 36x36
    string image_36x36?;
    # User profile image of size 60x60
    string image_60x60?;
};

# Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](/docs/asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.
#
# Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](/docs/asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.
public type CustomFieldCompact record {
    *AsanaResource;
    # A string representation for the value of the custom field. Integrations that don't require the underlying type should use this field to read values. Using this field will future-proof an app against new custom field types.
    string display_value?;
    # *Conditional*. Determines if the custom field is enabled or not.
    boolean enabled?;
    # *Conditional*. Only relevant for custom fields of type enum. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](/docs/create-an-enum-option).
    EnumOption[] enum_options?;
    # The name of the custom field.
    string name?;
    # *Conditional*. This number is the value of a number custom field.
    decimal number_value?;
    # The type of the custom field. Must be one of the given values.
    string resource_subtype?;
    # *Conditional*. This string is the value of a text custom field.
    string text_value?;
    # *Deprecated: new integrations should prefer the resource_subtype field.* The type of the custom field. Must be one of the given values.
    string 'type?;
};

# A *job* is an object representing a process that handles asynchronous work.
public type JobCompact record {
    *AsanaResource;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact new_project?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact new_task?;
    # The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
    string resource_subtype?;
    # Status of job.
    string status?;
};

public type WorkspaceResponse record {
    *WorkspaceBase;
    # The email domains that are associated with this workspace.
    string[] email_domains?;
    # Whether the workspace is an *organization*.
    boolean is_organization?;
};

public type InlineResponse2009 record {
    CustomFieldSettingResponse[] data?;
};

public type InlineResponse2008 record {
    PortfolioCompact[] data?;
};

public type PortfolioRequest record {
    *PortfolioBase;
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string[] members?;
    # Gid of an object.
    string workspace?;
};

public type SectionResponse record {
    *SectionBase;
    # The time at which this resource was created.
    string created_at?;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact project?;
    # *Deprecated - please use project instead*
    ProjectCompact[] projects?;
};

public type TaskRemoveProjectRequest record {
    # The project to remove the task from.
    string project;
};

# An *attachment* object represents any file attached to a task in Asana, whether it’s an uploaded file or one associated via a third-party service such as Dropbox or Google Drive.
public type AttachmentCompact record {
    *AsanaResource;
    # The name of the file.
    string name?;
    # The service hosting the attachment. Valid values are `asana`, `dropbox`, `gdrive`, `onedrive`, `box`, and `external`.
    anydata resource_subtype?;
};

# A user identification object for specification with the addUser/removeUser endpoints.
public type WorkspaceAddUserRequest record {
    # A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    string user?;
};

# A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
#
# A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
public type ProjectCompact record {
    *AsanaResource;
    # Name of the project. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.
    string name?;
};

public type InlineResponse2012 record {
    OrganizationExportResponse data?;
};

# A WebhookFilter can be passed on creation of a webhook in order to filter the types of actions that trigger delivery of an [Event](/docs/tocS_Event)
public type WebhookFilter record {
    # The type of change on the **resource** to pass through the filter. For more information refer to `Event.action` in the [Event](/docs/tocS_Event) schema. This can be one of `changed`, `added`, `removed`, `deleted`, and `undeleted` depending on the nature of what has occurred on the resource.
    string action?;
    # *Conditional.* A whitelist of fields for events which will pass the filter when the resource is changed. These can be any combination of the fields on the resources themselves. This field is only valid for `action` of type 'changed'
    string[] fields?;
    # The resource subtype of the resource that the filter applies to. This should be set to the same value as is returned on the `resource_subtype` field on the resources themselves.
    string resource_subtype?;
    # The type of the resource which created the event when modified; for example, to filter to changes on regular tasks this field should be set to `task`.
    string resource_type?;
};

public type InlineResponse2011 record {
    # Enum options are the possible values which an enum custom field can adopt.
    EnumOption data?;
};

public type InlineResponse2014 record {
    ProjectResponse data?;
};

public type InlineResponse2013 record {
    PortfolioResponse data?;
};

public type InlineResponse2016 record {
    TagResponse data?;
};

public type InlineResponse2015 record {
    SectionResponse data?;
};

public type InlineResponse2018 record {
    TeamResponse data?;
};

public type InlineResponse2017 record {
    TaskResponse data?;
};

public type TeamMembershipBase record {
    *TeamMembershipCompact;
};

public type PortfolioRemoveItemRequest record {
    # The item to remove from the portfolio.
    string item;
};

public type TaskRequest record {
    *TaskBase;
    # Gid of a user.
    string? assignee?;
    # An object where each key is a Custom Field gid and each value is an enum gid, string, or number.
    record {} custom_fields?;
    # *Create-Only* An array of strings identifying users. These can either be the string "me", an email, or the gid of a user. In order to change followers on an existing task use `addFollowers` and `removeFollowers`.
    string[] followers?;
    # Gid of a task.
    string? parent?;
    # *Create-Only* Array of project gids. In order to change projects on an existing task use `addProject` and `removeProject`.
    string[] projects?;
    # *Create-Only* Array of tag gids. In order to change tags on an existing task use `addTag` and `removeTag`.
    string[] tags?;
    # Gid of a workspace.
    string workspace?;
};

public type UserTaskListRequest record {
    *UserTaskListBase;
};

# Sadly, sometimes requests to the API are not successful. Failures can
public type ErrorResponse record {
    # Array of errors when requests to the API are not successful.
    Error[] errors?;
};

public type InlineResponse2001 record {
    # An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.
    EmptyResponse data?;
};

# The full record for all events that have occurred since the sync token was created.
public type InlineResponse2003 record {
    # An organization_export object represents a request to export the complete data of an organization.
    EventResponse[] data?;
    # A sync token to be used with the next call to the events endpoint.
    string sync?;
};

public type InlineResponse2002 record {
    BatchResponse[] data?;
};

public type InlineResponse2005 record {
    TeamCompact[] data?;
};

public type InlineResponse2004 record {
    JobResponse data?;
};

public type InlineResponse2007 record {
    PortfolioMembershipResponse data?;
};

public type InlineResponse2006 record {
    PortfolioMembershipCompact[] data?;
};

public type OrganizationExportBase record {
    *OrganizationExportCompact;
};

# A generic Asana Resource, containing a globally unique identifier.
#
public type AsanaNamedResource record {
    *AsanaResource;
    # The name of the object.
    string name?;
};

public type SectionBase record {
    *SectionCompact;
};

# A user task list represents the tasks assigned to a particular user. It provides API access to a user’s “My Tasks” view in Asana.
public type UserTaskListCompact record {
    *AsanaResource;
    # The name of the user task list.
    string name?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact owner?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

# A user identification object for specification with the addUser/removeUser endpoints.
public type WorkspaceRemoveUserRequest record {
    # A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    string user?;
};

public type PortfolioAddItemRequest record {
    # An id of an item in this portfolio. The new item will be added after the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.
    string insert_after?;
    # An id of an item in this portfolio. The new item will be added before the one specified here. `insert_before` and `insert_after` parameters cannot both be specified.
    string insert_before?;
    # The item to add to the portfolio.
    string item;
};

public type PortfolioBase record {
    *PortfolioCompact;
    # Color of the portfolio.
    string color?;
};

public type UserRequest record {
    *UserBase;
};

public type TaskSetParentRequest record {
    # A subtask of the parent to insert the task after, or `null` to insert at the beginning of the list.
    string insert_after?;
    # A subtask of the parent to insert the task before, or `null` to insert at the end of the list.
    string insert_before?;
    # The new parent of the task, or `null` for no parent.
    string parent;
};

public type RemoveMembersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string members;
};

# Enum options are the possible values which an enum custom field can adopt.
#
# Enum options are the possible values which an enum custom field can adopt. An enum custom field must contain at least 1 enum option but no more than 50.
public type EnumOption record {
    *AsanaResource;
    # The color of the enum option. Defaults to ‘none’.
    string color?;
    # Whether or not the enum option is a selectable value for the custom field.
    boolean enabled?;
    # The name of the enum option.
    string name?;
};

# The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
#
# A *user* object represents an account in Asana that can be given access to various workspaces, projects, and tasks.
public type UserCompact record {
    *AsanaResource;
    # *Read-only except when same user as requester*. The user’s name.
    string name?;
};

public type TaskAddFollowersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string[] followers;
};

public type EnumOptionRequest record {
    *EnumOptionBase;
    # An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.
    string insert_after?;
    # An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.
    string insert_before?;
};

public type ProjectResponse record {
    *ProjectBase;
    # Array of Custom Fields.
    CustomFieldCompact[] custom_fields?;
    # Array of users following this project. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.
    UserCompact[] followers?;
    # The icon for a project.
    string? icon?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact owner?;
    # A url that points directly to the object within Asana.
    string permalink_url?;
    # A *team* is used to group related projects and people together within an organization.
    TeamCompact team?;
};

public type TeamBase record {
    *TeamCompact;
};

public type UserBase record {
    *UserCompact;
};

public type ProjectStatusResponse record {
    *ProjectStatusBase;
    # The time at which this resource was created.
    string created_at?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact created_by?;
};

# *OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (/docs/input-output-options).
public type TaskbaseExternal record {
    # The data of external field allows you to store app-specific metadata on tasks.
    string data?;
    # Globally unique identifier of the resource, as a string.
    string gid?;
};

public type OrganizationExportResponse record {
    *OrganizationExportBase;
};

# A section is a subdivision of a project that groups tasks together.
#
# A *section* is a subdivision of a project that groups tasks together. It can either be a header above a list of tasks in a list view or a column in a board view of a project.
public type SectionCompact record {
    *AsanaResource;
    # The name of the section (i.e. the text displayed as the section header).
    string name?;
};

public type WorkspaceBase record {
    *WorkspaceCompact;
};

public type TeamResponse record {
    *TeamBase;
    # [Opt In](/docs/input-output-options). The description of the team.
    string description?;
    # [Opt In](/docs/input-output-options). The description of the team with formatting as HTML.
    string html_description?;
    # The workspace in which the user task list is located.
    WorkspaceCompact organization?;
    # A url that points directly to the object within Asana.
    string permalink_url?;
};

# A set of dependent tasks.
public type ModifyDependentsRequest record {
    # An array of task gids that are dependents of the given task.
    string[] dependents?;
};

public type UserTaskListBase record {
    *UserTaskListCompact;
};

public type TaskbaseMemberships record {
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact project?;
    # A section is a subdivision of a project that groups tasks together.
    SectionCompact section?;
};

public type ProjectMembershipResponse record {
    *ProjectMembershipBase;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact project?;
    # Whether the user has full access to the project or has comment-only access.
    string write_access?;
};

public type UserResponse record {
    *UserBase;
    # The user's email address.
    string email?;
    # A map of the user’s profile photo in various sizes, or null if no photo is set. Sizes provided are 21, 27, 36, 60, and 128. Images are in PNG format.
    UserresponsePhoto photo?;
    # Workspaces and organizations this user may access.
    WorkspaceCompact[] workspaces?;
};

public type RemoveFollowersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string followers;
};

# A user identification object for specification with the addUser/removeUser endpoints.
public type TeamAddUserRequest record {
    # A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    string user?;
};

# This object represents a user's connection to a team.
public type TeamMembershipCompact record {
    *AsanaResource;
    # Describes if the user is a guest in the team.
    boolean is_guest?;
    # A *team* is used to group related projects and people together within an organization.
    TeamCompact team?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
};

# This object determines if a user is a member of a portfolio.
public type PortfolioMembershipCompact record {
    *AsanaResource;
    # A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana.
    PortfolioCompact portfolio?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
};

# A response object returned from the task count endpoint.
public type TaskCountResponse record {
    # The number of completed milestones in a project.
    int num_completed_milestones?;
    # The number of completed tasks in a project.
    int num_completed_tasks?;
    # The number of incomplete milestones in a project.
    int num_incomplete_milestones?;
    # The number of incomplete tasks in a project.
    int num_incomplete_tasks?;
    # The number of milestones in a project.
    int num_milestones?;
    # The number of tasks in a project.
    int num_tasks?;
};

# Represents activity associated with an object in the Asana system
#
public type StoryResponse record {
    *StoryBase;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact assignee?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact created_by?;
    # Custom Fields store the metadata that is used in order to add user-specified information to tasks in Asana. Be sure to reference the [Custom Fields](/docs/asana-custom-fields) developer documentation for more information about how custom fields relate to various resources in Asana.
    CustomFieldCompact custom_field?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact dependency?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact duplicate_of?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact duplicated_from?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact follower?;
    # *Deprecated - please use likes instead*
    boolean hearted?;
    # *Deprecated - please use likes instead*
    Like[] hearts?;
    # *Conditional*. Whether the text of the story has been edited after creation.
    boolean is_edited?;
    # *Conditional*. True if the story is liked by the authorized user, false if not.
    boolean liked?;
    # *Conditional*. Array of likes for users who have liked this story.
    Like[] likes?;
    # *Conditional*
    string new_approval_status?;
    # *Conditional*
    StoryResponseDates new_dates?;
    # Enum options are the possible values which an enum custom field can adopt.
    EnumOption new_enum_value?;
    # *Conditional*
    string new_name?;
    # *Conditional*
    int new_number_value?;
    # *Conditional*
    string new_resource_subtype?;
    # A section is a subdivision of a project that groups tasks together.
    SectionCompact new_section?;
    # *Conditional*
    string new_text_value?;
    # *Deprecated - please use likes instead*
    int num_hearts?;
    # *Conditional*. The number of users who have liked this story.
    int num_likes?;
    # *Conditional*
    string old_approval_status?;
    # *Conditional*
    StoryResponseDates old_dates?;
    # Enum options are the possible values which an enum custom field can adopt.
    EnumOption old_enum_value?;
    # *Conditional*'
    string old_name?;
    # *Conditional*
    int old_number_value?;
    # *Conditional*
    string old_resource_subtype?;
    # A section is a subdivision of a project that groups tasks together.
    SectionCompact old_section?;
    # *Conditional*
    string old_text_value?;
    # *Conditional*. A collection of previews to be displayed in the story.
    Preview[] previews?;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact project?;
    # The component of the Asana product the user used to trigger the story.
    string 'source?;
    # A story represents an activity associated with an object in the Asana system.
    StoryCompact story?;
    # A tag is a label that can be attached to any task in Asana.
    TagCompact tag?;
    # The object this story is associated with. Currently may only be a task.
    StoryresponseTarget target?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact task?;
};

# With the introduction of “comment-only” projects in Asana, a user’s membership in a project comes with associated permissions. These permissions (whether a user has full access to the project or comment-only access) are accessible through the project memberships endpoints described here.
public type ProjectMembershipCompact record {
    *AsanaResource;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
};

public type TaskRemoveTagRequest record {
    # The tag to remove from the task.
    string tag;
};

public type InlineResponse20019 record {
    # Represents activity associated with an object in the Asana system
    StoryResponse data?;
};

public type CustomFieldSettingResponse record {
    *CustomFieldSettingBase;
    CustomFieldResponse custom_field?;
    # `is_important` is used in the Asana web application to determine if this custom field is displayed in the list/grid view of a project or portfolio.
    boolean is_important?;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact parent?;
    # A *project* represents a prioritized list of tasks in Asana or a board with columns of tasks represented as cards. It exists in a single workspace or organization and is accessible to a subset of users in that workspace or organization, depending on its permissions.
    ProjectCompact project?;
};

public type SectionRequest record {
    # An existing section within this project after which the added section should be inserted. Cannot be provided together with insert_before.
    string insert_after?;
    # An existing section within this project before which the added section should be inserted. Cannot be provided together with insert_after.
    string insert_before?;
    # The text to be displayed as the section name. This cannot be an empty string.
    string name;
    # *Create-Only* The project to create the section in
    string project;
};

public type Body56 record {
    TagResponse data?;
};

public type Body55 record {
    # A user identification object for specification with the addUser/removeUser endpoints.
    WorkspaceRemoveUserRequest data?;
};

public type Body54 record {
    ProjectRequest data?;
};

public type CustomFieldRequest record {
    *CustomFieldBase;
    # *Create-Only* The workspace to create a custom field in.
    string workspace?;
};

public type Body53 record {
    # A user identification object for specification with the addUser/removeUser endpoints.
    WorkspaceAddUserRequest data?;
};

# An action object for use in a batch request.
public type BatchRequestAction record {
    # For `GET` requests, this should be a map of query parameters you would have normally passed in the URL. Options and pagination are not accepted here; put them in `options` instead. For `POST`, `PATCH`, and `PUT` methods, this should be the content you would have normally put in the data field of the body.
    record {} data?;
    # The HTTP method you wish to emulate for the action.
    string method;
    # Pagination (`limit` and `offset`) and output options (`fields` or `expand`) for the action. “Pretty” JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request.
    BatchrequestactionOptions options?;
    # The path of the desired endpoint relative to the API’s base URL. Query parameters are not accepted here; put them in `data` instead.
    string relative_path;
};

public type InlineResponse20021 record {
    AttachmentCompact[] data?;
};

public type InlineResponse20020 record {
    TagCompact[] data?;
};

public type InlineResponse20023 record {
    StoryCompact[] data?;
};

public type InlineResponse20022 record {
    EmptyResponse[] data?;
};

public type InlineResponse20025 record {
    TeamMembershipResponse data?;
};

public type AttachmentRequest record {
    string file?;
};

public type InlineResponse20024 record {
    TeamMembershipCompact[] data?;
};

public type InlineResponse20027 record {
    UserCompact[] data?;
};

public type TaskResponse record {
    *TaskBase;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact assignee?;
    # Array of custom field values applied to the task. These represent the custom field values recorded on this project for a particular custom field. For example, these custom field values will contain an `enum_value` property for custom fields of type enum, a `text_value` property for custom fields of type text, and so on. Please note that the `gid` returned on each custom field value *is identical* to the `gid` of the custom field, which allows referencing the custom field metadata through the `/custom_fields/custom_field-gid` endpoint.
    CustomFieldResponse[] custom_fields?;
    # Array of users following this task.
    UserCompact[] followers?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact parent?;
    # A url that points directly to the object within Asana.
    string permalink_url?;
    # *Create-only.* Array of projects this task is associated with. At task creation time, this array can be used to add the task to many projects at once. After task creation, these associations can be modified using the addProject and removeProject endpoints.
    ProjectCompact[] projects?;
    # Array of tags associated with this task. In order to change tags on an existing task use `addTag` and `removeTag`.
    TagCompact[] tags?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

public type InlineResponse20026 record {
    UserResponse data?;
};

public type InlineResponse20029 record {
    AsanaNamedResource[] data?;
};

public type InlineResponse20028 record {
    UserTaskListResponse data?;
};

public type WorkspaceMembershipResponse record {
    *WorkspaceMembershipBase;
    # Reflects if this user still a member of the workspace.
    boolean is_active?;
    # Reflects if this user is an admin of the workspace.
    boolean is_admin?;
    # Reflects if this user is a guest of the workspace.
    boolean is_guest?;
    UserTaskListResponse user_task_list?;
};

public type ProjectStatusBase record {
    *ProjectStatusCompact;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact author?;
    # The color associated with the status update.
    string color?;
    # [Opt In](/docs/input-output-options). The text content of the status update with formatting as HTML.
    string html_text?;
    # The time at which this project status was last modified.
    anydata modified_at?;
    # The text content of the status update.
    string text?;
};

# An *organization_export* request starts a job to export the complete data of the given Organization.
public type OrganizationExportRequest record {
    # Globally unique identifier for the workspace or organization.
    string organization?;
};

# The *task* is the basic object around which many operations in Asana are centered.
#
# The *task* is the basic object around which many operations in Asana are centered.
public type TaskCompact record {
    *AsanaResource;
    # The name of the task.
    string name?;
};

public type Body45 record {
    StoryRequest data?;
};

public type Body44 record {
    TaskSetParentRequest data?;
};

public type Body43 record {
    TaskRemoveTagRequest data?;
};

public type Body42 record {
    TaskRemoveProjectRequest data?;
};

public type Body49 record {
    ProjectRequest data?;
};

public type Body48 record {
    # A user identification object for specification with the addUser/removeUser endpoints.
    TeamAddUserRequest data?;
};

public type Body47 record {
    TeamRequest data?;
};

public type Body46 record {
    TaskRequest data?;
};

public type InlineResponse20030 record {
    WorkspaceMembershipCompact[] data?;
};

public type Body52 record {
    WorkspaceRequest data?;
};

public type Body51 record {
    WebhookRequest data?;
};

public type Body50 record {
    # A user identification object for specification with the addUser/removeUser endpoints.
    TeamRemoveUserRequest data?;
};

public type InlineResponse20032 record {
    WorkspaceMembershipResponse data?;
};

public type ProjectRequest record {
    *ProjectBase;
    # An object where each key is a Custom Field gid and each value is an enum gid, string, or number.
    record {} custom_fields?;
    # *Create-only*. Comma separated string of users. Followers are a subset of members who receive all notifications for a project, the default notification setting when adding members to a project in-product.
    string followers?;
    # The current owner of the project, may be null.
    string? owner?;
    # *Create-only*. The team that this project is shared with. This field only exists for projects in organizations.
    string team?;
};

public type InlineResponse20031 record {
    WebhookResponse[] data?;
};

public type InlineResponse20034 record {
    WorkspaceResponse data?;
};

public type InlineResponse20033 record {
    WorkspaceCompact[] data?;
};

public type InlineResponse20036 record {
    # The data containing generic Asana Resource, containing a globally unique identifier.
    AsanaNamedResource[] data?;
};

public type InlineResponse20035 record {
    CustomFieldResponse[] data?;
};

public type CustomFieldBase record {
    *CustomFieldCompact;
    # ISO 4217 currency code to format this custom field. This will be null if the `format` is not `currency`.
    string? currency_code?;
    # This is the string that appears next to the custom field value. This will be null if the `format` is not `custom`.
    string? custom_label?;
    # Only relevant for custom fields with `custom` format. This depicts where to place the custom label. This will be null if the `format` is not `custom`.
    string custom_label_position?;
    # [Opt In](/docs/input-output-options). The description of the custom field.
    string description?;
    # *Conditional*. Only relevant for custom fields of type enum. This array specifies the possible values which an `enum` custom field can adopt. To modify the enum options, refer to [working with enum options](/docs/create-an-enum-option).
    EnumOption[] enum_options?;
    # The format of this custom field.
    string format?;
    # *Conditional*. This flag describes whether a follower of a task with this field should receive inbox notifications from changes to this field.
    boolean has_notifications_enabled?;
    # This flag describes whether this custom field is available to every container in the workspace. Before project-specific custom fields, this field was always true.
    boolean is_global_to_workspace?;
    # Only relevant for custom fields of type ‘Number’. This field dictates the number of places after the decimal to round to, i.e. 0 is integer values, 1 rounds to the nearest tenth, and so on. Must be between 0 and 6, inclusive.
    int precision?;
};

public type AttachmentBase record {
    *AttachmentCompact;
};

public type Body39 record {
    ModifyDependenciesRequest data?;
};

public type Body34 record {
    # A set of dependent tasks.
    ModifyDependentsRequest data?;
};

public type JobResponse record {
    *JobBase;
};

public type TaskBase record {
    *TaskCompact;
    # *Conditional* Reflects the approval status of this task. This field is kept in sync with `completed`, meaning `pending` translates to false while `approved`, `rejected`, and `changes_requested` translate to true. If you set completed to true, this field will be set to `approved`.
    string approval_status?;
    # *Deprecated* Scheduling status of this task for the user it is assigned to. This field can only be set if the assignee is non-null. Setting this field to "inbox" or "upcoming" inserts it at the top of the section, while the other options will insert at the bottom.
    string assignee_status?;
    # True if the task is currently marked complete, false if not.
    boolean completed?;
    # The time at which this task was completed, or null if the task is incomplete.
    string? completed_at?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact completed_by?;
    # The time at which this resource was created.
    string created_at?;
    # [Opt In](/docs/input-output-options). Array of resources referencing tasks that this task depends on. The objects contain only the gid of the dependency.
    AsanaResource[] dependencies?;
    # [Opt In](/docs/input-output-options). Array of resources referencing tasks that depend on this task. The objects contain only the ID of the dependent.
    AsanaResource[] dependents?;
    # The UTC date and time on which this task is due, or null if the task has no due time. This takes an ISO 8601 date string in UTC and should not be used together with `due_on`.
    string? due_at?;
    # The localized date on which this task is due, or null if the task has no due date. This takes a date with `YYYY-MM-DD` format and should not be used together with due_at.
    string? due_on?;
    # *OAuth Required*. *Conditional*. This field is returned only if external values are set or included by using [Opt In] (/docs/input-output-options).
    TaskbaseExternal 'external?;
    # *Deprecated - please use liked instead* True if the task is hearted by the authorized user, false if not.
    boolean hearted?;
    # *Deprecated - please use likes instead* Array of likes for users who have hearted this task.
    Like[] hearts?;
    # [Opt In](/docs/input-output-options). The notes of the text with formatting as HTML.
    string html_notes?;
    # [Opt In](/docs/input-output-options). In some contexts tasks can be rendered as a visual separator; for instance, subtasks can appear similar to [sections](/docs/asana-sections) without being true `section` objects. If a `task` object is rendered this way in any context it will have the property `is_rendered_as_separator` set to `true`.
    boolean is_rendered_as_separator?;
    # True if the task is liked by the authorized user, false if not.
    boolean liked?;
    # Array of likes for users who have liked this task.
    Like[] likes?;
    # *Create-only*. Array of projects this task is associated with and the section it is in. At task creation time, this array can be used to add the task to specific sections. After task creation, these associations can be modified using the `addProject` and `removeProject` endpoints. Note that over time, more types of memberships may be added to this property.
    TaskbaseMemberships[] memberships?;
    # The time at which this task was last modified.
    string modified_at?;
    # Name of the task. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.
    string name?;
    # More detailed, free-form textual information associated with the task.
    string notes?;
    # *Deprecated - please use likes instead* The number of users who have hearted this task.
    int num_hearts?;
    # The number of users who have liked this task.
    int num_likes?;
    # [Opt In](/docs/input-output-options). The number of subtasks on this task.
    int num_subtasks?;
    # The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
    string resource_subtype?;
    # Date and time on which work begins for the task, or null if the task has no start time. This takes a UTC timestamp format.
    string? start_at?;
    # The day on which work begins for the task , or null if the task has no start date. This takes a date with `YYYY-MM-DD` format.
    string? start_on?;
};

public type Body33 record {
    ModifyDependenciesRequest data?;
};

public type Body32 record {
    TaskRequest data?;
};

public type Body31 record {
    TaskRequest data?;
};

public type Body38 record {
    TaskDuplicateRequest data?;
};

public type Body37 record {
    TaskAddTagRequest data?;
};

public type Body36 record {
    TaskAddProjectRequest data?;
};

public type Body35 record {
    TaskAddFollowersRequest data?;
};

# An *event* is an object representing a change to a resource that was
public type EventResponse record {
    # The type of action taken on the **resource** that triggered the event.  This can be one of `changed`, `added`, `removed`, `deleted`, or `undeleted` depending on the nature of the event.
    string action?;
    # Information about the type of change that has occurred. This field is only present when the value of the property `action`, describing the action taken on the **resource**, is `changed`.
    EventresponseChange change?;
    # The timestamp when the event occurred.
    string created_at?;
    # A generic Asana Resource, containing a globally unique identifier.
    AsanaNamedResource parent?;
    # A generic Asana Resource, containing a globally unique identifier.
    AsanaNamedResource 'resource?;
    # *Deprecated: Refer to the resource_type of the resource.* The type of the resource that generated the event.
    string 'type?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
};

# A *team* is used to group related projects and people together within an organization.
#
# A *team* is used to group related projects and people together within an organization. Each project in an organization is associated with a team.
public type TeamCompact record {
    *AsanaResource;
    # The name of the team.
    string name?;
};

public type Body41 record {
    TaskRemoveFollowersRequest data?;
};

public type Body40 record {
    # A set of dependent tasks.
    ModifyDependentsRequest data?;
};

public type ModifyDependenciesRequest record {
    # An array of task gids that a task depends on.
    string[] dependencies?;
};

# A story represents an activity associated with an object in the Asana system.
#
# A story represents an activity associated with an object in the Asana system.
public type StoryCompact record {
    *AsanaResource;
    # The time at which this resource was created.
    string created_at?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact created_by?;
    # The subtype of this resource. Different subtypes retain many of the same fields and behavior, but may render differently in Asana or represent resources with different semantic meaning.
    string resource_subtype?;
    # *Create-only*. Human-readable text for the story or comment.
    string text?;
};

public type ProjectSectionInsertRequest record {
    # Insert the given section immediately after the section specified by this parameter.
    string after_section?;
    # Insert the given section immediately before the section specified by this parameter.
    string before_section?;
    # The project in which to reorder the given section.
    string project;
    # The section to reorder.
    string section;
};

# Information about the type of change that has occurred. This field is only present when the value of the property `action`, describing the action taken on the **resource**, is `changed`.
public type EventresponseChange record {
    # The type of action taken on the **field** which has been changed.  This can be one of `changed`, `added`, or `removed` depending on the nature of the change.
    string action?;
    # *Conditional.* This property is only present when the **field's** `action` is `added` and the `added_value` is an Asana resource. This will be only the `gid` and `resource_type` of the resource when the events come from webhooks; this will be the compact representation (and can have fields expanded with [opt_fields](/docs/input-output-options)) when using the [Events](/docs/asana-events) resource.
    anydata added_value?;
    # The name of the field that has changed in the resource.
    string 'field?;
    # *Conditional.* This property is only present when the **field's** `action` is `changed` and the `new_value` is an Asana resource. This will be only the `gid` and `resource_type` of the resource when the events come from webhooks; this will be the compact representation (and can have fields expanded with [opt_fields](/docs/input-output-options)) when using the [Events](/docs/asana-events) resource.
    anydata new_value?;
    # *Conditional.* This property is only present when the **field's** `action` is `removed` and the `removed_value` is an Asana resource. This will be only the `gid` and `resource_type` of the resource when the events come from webhooks; this will be the compact representation (and can have fields expanded with [opt_fields](/docs/input-output-options)) when using the [Events](/docs/asana-events) resource.
    anydata removed_value?;
};

# A user identification object for specification with the addUser/removeUser endpoints.
public type TeamRemoveUserRequest record {
    # A string identifying a user. This can either be the string "me", an email, or the gid of a user.
    string user?;
};

# The object this story is associated with. Currently may only be a task.
public type StoryresponseTarget record {
    # The gid of the object this story is associated with.
    string gid?;
    # The name of the object this story is associated with.
    string name?;
};

public type Body8 record {
    PortfolioRequest data?;
};

public type Body9 record {
    AddCustomFieldSettingRequest data?;
};

public type Body6 record {
    # An *organization_export* request starts a job to export the complete data of the given Organization.
    OrganizationExportRequest data?;
};

public type Body29 record {
    StoryRequest data?;
};

public type Body7 record {
    PortfolioRequest data?;
};

public type Body28 record {
    SectionTaskInsertRequest data?;
};

public type Body4 record {
    EnumOptionInsertRequest data?;
};

public type Body5 record {
    EnumOptionRequest data?;
};

public type Body2 record {
    CustomFieldRequest data?;
};

public type Body3 record {
    EnumOptionRequest data?;
};

public type Body23 record {
    RemoveFollowersRequest data?;
};

public type Body22 record {
    RemoveCustomFieldSettingRequest data?;
};

public type Body21 record {
    ProjectStatusRequest data?;
};

public type Body20 record {
    ProjectDuplicateRequest data?;
};

public type Body27 record {
    SectionRequest data?;
};

public type Body26 record {
    ProjectSectionInsertRequest data?;
};

public type Body25 record {
    SectionRequest data?;
};

public type Body24 record {
    RemoveMembersRequest data?;
};

public type Body30 record {
    TagRequest data?;
};

public type JobBase record {
    *JobCompact;
};

public type Body1 record {
    CustomFieldRequest data?;
};

public type StoryRequest record {
    *StoryBase;
};

# A *project status* is an update on the progress of a particular project, and is sent out to all project followers when created. These updates include both text describing the update and a color code intended to represent the overall state of the project: "green" for projects that are on track, "yellow" for projects at risk, and "red" for projects that are behind.
public type ProjectStatusCompact record {
    *AsanaResource;
    # The title of the project status update.
    string title?;
};

public type Body19 record {
    AddMembersRequest data?;
};

public type Body18 record {
    AddFollowersRequest data?;
};

public type Body17 record {
    AddCustomFieldSettingRequest data?;
};

# A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana.
#
# A *portfolio* gives a high-level overview of the status of multiple initiatives in Asana. Portfolios provide a dashboard overview of the state of multiple projects, including a progress report and the most recent [project status](/docs/asana-project-statuses) update.
public type PortfolioCompact record {
    *AsanaResource;
    # The name of the portfolio.
    string name?;
};

public type Body12 record {
    RemoveCustomFieldSettingRequest data?;
};

public type Body11 record {
    AddMembersRequest data?;
};

public type Body10 record {
    PortfolioAddItemRequest data?;
};

public type WorkspaceMembershipRequest record {
    *WorkspaceMembershipBase;
};

public type Body16 record {
    ProjectRequest data?;
};

public type Body15 record {
    ProjectRequest data?;
};

public type Body14 record {
    RemoveMembersRequest data?;
};

public type Body13 record {
    PortfolioRemoveItemRequest data?;
};

public type TagRequest record {
    *TagBase;
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string[] followers?;
    # Gid of an object.
    string workspace?;
};

# An object to represent a user's like.
public type Like record {
    # Globally unique identifier of the object, as a string.
    string gid?;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
};

public type AttachmentResponse record {
    *AttachmentBase;
    # The time at which this resource was created.
    string created_at?;
    # The URL containing the content of the attachment.
    string? download_url?;
    # The service hosting the attachment. Valid values are `asana`, `dropbox`, `gdrive` and `box`.
    string host?;
    # The *task* is the basic object around which many operations in Asana are centered.
    TaskCompact parent?;
    # The URL where the attachment can be viewed, which may be friendlier to users in a browser than just directing them to a raw file. May be null if no view URL exists for the service.
    string? view_url?;
};

public type WorkspaceRequest record {
    *WorkspaceBase;
};

public type AddMembersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string members;
};

public type InlineResponse2019 record {
    WebhookResponse data?;
};

public type EnumOptionBase record {
    *EnumOption;
};

# Webhook objects represent the state of an active subscription for a server to be updated with information from Asana. This schema represents the subscription itself, not the objects that are sent to the server. For information on those please refer to the [Event](/docs/tocS_Event) schema.
public type WebhookCompact record {
    *AsanaResource;
    # If true, the webhook will send events - if false it is considered inactive and will not generate events.
    boolean active?;
    # A generic Asana Resource, containing a globally unique identifier.
    AsanaNamedResource 'resource?;
    # The URL to receive the HTTP POST.
    string target?;
};

public type AddFollowersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string followers;
};

public type TagBase record {
    *TagCompact;
    # Color of the tag.
    string color?;
};

# An empty object. Some endpoints do not return an object on success. The success is conveyed through a 2-- status code and returning an empty object.
public type EmptyResponse record {
};

public type RemoveCustomFieldSettingRequest record {
    # The custom field to remove from this portfolio.
    string custom_field;
};

# This object determines if a user is a member of a workspace.
public type WorkspaceMembershipCompact record {
    *AsanaResource;
    # The owner of the user task list, i.e. the person whose My Tasks is represented by this resource.
    UserCompact user?;
    # The workspace in which the user task list is located.
    WorkspaceCompact workspace?;
};

public type TaskDuplicateRequest record {
    # The fields that will be duplicated to the new task.
    string include?;
    # The name of the new task.
    string name?;
};

public type ProjectDuplicateRequest record {
    # The elements that will be duplicated to the new project. Tasks are always included.
    string include?;
    # The name of the new project.
    string name;
    # A dictionary of options to auto-shift dates. `task_dates` must be included to use this option. Requires either `start_on` or `due_on`, but not both.
    ProjectduplicaterequestScheduleDates schedule_dates?;
    # Sets the team of the new project. If team is not defined, the new project will be in the same team as the the original project.
    string team?;
};

public type InlineResponse201 record {
    CustomFieldResponse data?;
};

# A tag is a label that can be attached to any task in Asana.
#
# A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.
public type TagCompact record {
    *AsanaResource;
    # Name of the tag. This is generally a short sentence fragment that fits on a line in the UI for maximum readability. However, it can be longer.
    string name?;
};

public type InlineResponse200 record {
    AttachmentResponse data?;
};

# A generic Asana Resource, containing a globally unique identifier.
public type AsanaResource record {
    # Globally unique identifier of the resource, as a string.
    string gid?;
    # The base type of this resource.
    string resource_type?;
};

# A dictionary of options to auto-shift dates. `task_dates` must be included to use this option. Requires either `start_on` or `due_on`, but not both.
public type ProjectduplicaterequestScheduleDates record {
    # Sets the last due date in the duplicated project to the given date. The rest of the due dates will be offset by the same amount as the due dates in the original project.
    string due_on?;
    # Determines if the auto-shifted dates should skip weekends.
    boolean should_skip_weekends;
    # Sets the first start date in the duplicated project to the given date. The rest of the start dates will be offset by the same amount as the start dates in the original project.
    string start_on?;
};

public type UserTaskListResponse record {
    *UserTaskListBase;
};

# An *organization_export* object represents a request to export the complete data of an Organization in JSON format.
public type OrganizationExportCompact record {
    *AsanaResource;
    # The time at which this resource was created.
    string created_at?;
    # Download this URL to retreive the full export of the organization
    string? download_url?;
    # The workspace in which the user task list is located.
    WorkspaceCompact organization?;
    # The current state of the export.
    string state?;
};

public type TeamMembershipResponse record {
    *TeamMembershipBase;
};

public type Body record {
    # A request object for use in a batch request.
    BatchRequest data?;
};

public type WorkspaceMembershipBase record {
    *WorkspaceMembershipCompact;
};

# Pagination (`limit` and `offset`) and output options (`fields` or `expand`) for the action. “Pretty” JSON output is not an available option on individual actions; if you want pretty output, specify that option on the parent request.
public type BatchrequestactionOptions record {
    # The fields to retrieve in the request.
    string[] fields?;
    # Pagination limit for the request.
    int 'limit?;
    # Pagination offset for the request.
    int offset?;
};

public type Error record {
    # Additional information directing developers to resources on how to address and fix the problem, if available.
    string help?;
    # Message providing more detail about the error that occurred, if available.
    string message?;
    # *500 errors only*. A unique error phrase which can be used when contacting developer support to help identify the exact occurrence of the problem in Asana’s logs.
    string phrase?;
};

# A collection of rich text that will be displayed as a preview to another app.
public type Preview record {
    # Some fallback text to display if unable to display the full preview.
    string fallback?;
    # Text to display in the footer.
    string footer?;
    # Text to display in the header.
    string header?;
    # Where the header will link to.
    string header_link?;
    # HTML formatted text for the body of the preview.
    string html_text?;
    # Text for the body of the preview.
    string text?;
    # Text to display as the title.
    string title?;
    # Where to title will link to.
    string title_link?;
};

public type PortfolioMembershipBase record {
    *PortfolioMembershipCompact;
};

# *Conditional*
public type StoryResponseDates record {
    # Date and time representing activity occurance
    string due_at?;
    # Date representing activity occurance
    string due_on?;
    # Date representing activity start
    string start_on?;
};

public type InlineResponse20010 record {
    ProjectCompact[] data?;
};

# The workspace in which the user task list is located.
#
# A *workspace* is the highest-level organizational unit in Asana. All projects and tasks have an associated workspace.
public type WorkspaceCompact record {
    *AsanaResource;
    # The name of the workspace.
    string name?;
};

public type InlineResponse20012 record {
    ProjectStatusResponse data?;
};

public type EnumOptionInsertRequest record {
    # An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.
    string after_enum_option?;
    # An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.
    string before_enum_option?;
    # The gid of the enum option to relocate.
    string enum_option;
};

public type InlineResponse20011 record {
    ProjectMembershipResponse data?;
};

public type TaskRemoveFollowersRequest record {
    # An array of strings identifying users. These can either be the string "me", an email, or the gid of a user.
    string[] followers;
};

public type InlineResponse20014 record {
    ProjectMembershipCompact[] data?;
};

public type InlineResponse20013 record {
    CustomFieldSettingResponse data?;
};

public type InlineResponse20016 record {
    SectionCompact[] data?;
};

public type InlineResponse20015 record {
    ProjectStatusCompact[] data?;
};

public type InlineResponse20018 record {
    TaskCompact[] data?;
};

public type InlineResponse20017 record {
    # A response object returned from the task count endpoint.
    TaskCountResponse data?;
};
