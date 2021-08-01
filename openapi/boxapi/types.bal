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

# File-Version-Legal-Hold is an entity representing all holds on a File Version.
public type FileVersionLegalHold record {
    # The unique identifier for this file version legal hold
    string id?;
    # `file_version_legal_hold`
    string 'type?;
    # A mini representation of a file version, used when nested within another resource.
    FileversionMini file_version?;
    # A mini representation of a file, used when nested under another resource.
    FileMini file?;
    # List of assignments contributing to this Hold.
    LegalHoldPolicyAssignment[] legal_hold_policy_assignments?;
    # Time that this File-Version-Legal-Hold was deleted.
    string deleted_at?;
};

# A request to refresh an Access Token. Use this API to refresh an expired Access Token using a valid Refresh Token.
public type Postoauth2tokenRefreshaccesstoken record {
    # The type of request being made, in this case a refresh request.
    string grant_type;
    # The client ID of the application requesting to refresh the token.
    string client_id;
    # The client secret of the application requesting to refresh the token.
    string client_secret;
    # The refresh token to refresh.
    string refresh_token;
};

# The destination folder to copy the file to.
public type FilesfileIdcopyParent record {
    # The ID of folder to copy the file to.
    string id;
};

# The optional file version to assign the cards to.
public type SkillInvocationsskillIdFileVersion record {
    # `file_version`
    string 'type?;
    # The ID of the file version
    string id?;
};

# Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
public type StatusskillcardStatus record {
    # A code for the status of this Skill invocation. By default each of these will have their own accompanied messages. These can be adjusted by setting the `message` value on this object.
    string code;
    # A custom message that can be provided with this status. This will be shown in the web app to the end user.
    string message?;
};

# Custom tracking code for a user.
public type UserfullTrackingCodes record {
    # `tracking_code`
    string 'type?;
    # The name of the tracking code, which must be preconfigured in the Admin Console
    string name?;
    # The value of the tracking code
    string value?;
};

# The item to attach the comment to.
public type CollaborationsItem record {
    # The type of the item that this collaboration will be granted access to
    string 'type;
    # The ID of the item that will be granted access to
    string id;
};

# A list of real-time servers that can be used for long-polling.
public type RealtimeServers record {
    # The number of items in this response.
    int chunk_size?;
    # The entries of realtime servers.
    RealtimeServer[] entries?;
};

# A representation of a Box enterprise
public type CollaborationAllowlistUser record {
    # The unique identifier for this enterprise.
    string id?;
    # `enterprise`
    string 'type?;
    # The name of the enterprise
    string name?;
};

# A standard representation of a file version
#
public type FileVersion record {
    *FileversionMini;
};

# A mini description of a Storage Policy object
public type StoragepolicyMini record {
    # The unique identifier for this storage policy
    string id?;
    # `storage_policy`
    string 'type?;
};

# The error that occurs when a file can not be created due to a conflict.
#
public type ConflictError record {
    *ClientError;
};

# A Box Skill metadata card that adds a transcript to a file.
public type TranscriptSkillCard record {
    # The optional date and time this card was created at.
    string created_at?;
    # `skill_card`
    string 'type;
    # `transcript`
    string skill_card_type;
    # The title of the card.
    SkillcardSkillCardTitle skill_card_title?;
    # The service that applied this metadata.
    TranscriptskillcardSkill skill;
    # The invocation of this service, used to track which instance of a service applied the metadata.
    TranscriptskillcardInvocation invocation;
    # An optional total duration in seconds.  Used with a `skill_card_type` of `transcript` or `timeline`.
    int duration?;
    # An list of entries for the card. This represents the individual entries of the transcription.
    TranscriptskillcardEntries[] entries;
};

# A list of storage policy assignments.
#
# The part of an API response that describes marker based pagination
public type StoragePolicyAssignments record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# A list of terms of services
public type TermsOfServices record {
    # The total number of objects.
    int total_count?;
    # The entries of terms of service.
    TermsOfService[] entries?;
};

# The user to set the status for.
public type TermsOfServiceUserStatusesUser record {
    # The type of object.
    string 'type;
    # The ID of user
    string id;
};

# A representation of a file that is used to show
#
public type FileConflict record {
    *FileMini;
};

# A request for a new OAuth 2.0 token
public type PostOAuth2Token record {
    # The type of request being made, either using a client-side obtained authorization code, a refresh token, a JWT assertion, client credentials grant or another access token for the purpose of downscoping a token.
    string grant_type;
    # The Client ID of the application requesting an access token.  Used in combination with `authorization_code`, `client_credentials`, or `urn:ietf:params:oauth:grant-type:jwt-bearer` as the `grant_type`.
    string client_id?;
    # The client secret of the application requesting an access token.  Used in combination with `authorization_code`, `client_credentials`, or `urn:ietf:params:oauth:grant-type:jwt-bearer` as the `grant_type`.
    string client_secret?;
    # The client-side authorization code passed to your application by Box in the browser redirect after the user has successfully granted your application permission to make API calls on their behalf.  Used in combination with `authorization_code` as the `grant_type`.
    string code?;
    # A refresh token used to get a new access token with.  Used in combination with `refresh_token` as the `grant_type`.
    string refresh_token?;
    # A JWT assertion for which to request a new access token.  Used in combination with `urn:ietf:params:oauth:grant-type:jwt-bearer` as the `grant_type`.
    string assertion?;
    # The token to exchange for a downscoped token. This can be a regular access token, a JWT assertion, or an app token.  Used in combination with `urn:ietf:params:oauth:grant-type:token-exchange` as the `grant_type`.
    string subject_token?;
    # The type of `subject_token` passed in.  Used in combination with `urn:ietf:params:oauth:grant-type:token-exchange` as the `grant_type`.
    string subject_token_type?;
    # The token used to create an annotator token. This is a JWT assertion.  Used in combination with `urn:ietf:params:oauth:grant-type:token-exchange` as the `grant_type`.
    string actor_token?;
    # The type of `actor_token` passed in.  Used in combination with `urn:ietf:params:oauth:grant-type:token-exchange` as the `grant_type`.
    string actor_token_type?;
    # The space-delimited list of scopes that you want apply to the new access token.  The `subject_token` will need to have all of these scopes or the call will error with **401 Unauthorized**.
    string scope?;
    # Full URL for the file that the token should be generated for.
    string 'resource?;
    # Used in combination with `client_credentials` as the `grant_type`.
    string box_subject_type?;
    # Used in combination with `client_credentials` as the `grant_type`. Value is determined by `box_subject_type`. If `user` use user ID and if `enterprise` use enterprise ID.
    string box_subject_id?;
    # Full URL of the shared link on the file or folder that the token should be generated for.
    string box_shared_link?;
};

# The watermark to imprint on the file
public type FilesfileIdwatermarkWatermark record {
    # The type of watermark to apply.  Currently only supports one option.
    string imprint;
};

# A list of email aliases
public type EmailAliases record {
    # The number of email aliases.
    int total_count?;
    # The entries of email alias.
    EmailAlias[] entries?;
};

# A standard representation of a group, as returned from any group API endpoints by default
#
public type Group record {
    *GroupMini;
};

# The item that will trigger the webhook
public type WebhooksTarget record {
    # The ID of the item to trigger a webhook
    string id?;
    # The type of item to trigger a webhook
    string 'type?;
};

# A file or folder for which a conflict was encountered, This object provides the type and identifier of the original item, as well as a mapping between its original name and it's new name as it will appear in the archive.
public type NameconflictInner record {
    # The identifier of the item
    string id?;
    # The type of this item
    string 'type?;
    # The original name of this item
    string original_name?;
    # The new name of this item as it will appear in the downloaded `zip` archive.
    string download_name?;
};

# An entry in the `entries` attribute of a metadata card
public type KeywordskillcardEntries record {
    # The text of the keyword.
    string text?;
};

# A list of folder locks
#
# The part of an API response that describes marker based pagination
public type FolderLocks record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The user to invite
public type InvitesActionableBy record {
    # The login of the invited user
    string login?;
};

# A relation between a file and the scopes for which the file can be accessed
public type FileScope record {
    # The file scopes for the file access
    string scope?;
    # A mini representation of a file, used when nested under another resource.
    FileMini 'object?;
};

# A list of groups.
#
# The part of an API response that describes pagination
public type Groups record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# A Box Skill metadata card that places a list of images on a timeline.
public type TimelineSkillCard record {
    # The optional date and time this card was created at.
    string created_at?;
    # `skill_card`
    string 'type;
    # `timeline`
    string skill_card_type;
    # The title of the card.
    TimelineskillcardSkillCardTitle skill_card_title?;
    # The service that applied this metadata.
    SkillcardSkill skill;
    # The invocation of this service, used to track which instance of a service applied the metadata.
    SkillcardInvocation invocation;
    # An total duration in seconds of the timeline.
    int duration?;
    # A list of entries on the timeline.
    TimelineskillcardEntries[] entries;
};

# The item to assign the policy to
public type LegalHoldPolicyAssignmentsAssignTo record {
    # The type of item to assign the policy to
    string 'type;
    # The ID of item to assign the policy to
    string id;
};

# A list of files
public type Files record {
    # The number of files.
    int total_count?;
    # A list of files
    File[] entries?;
};

# Mini representation of a group, including id and name of group.
#
public type GroupMini record {
    *GroupBase;
};

# The order in which a pagination is ordered
public type CollaborationsOrder record {
    # The field to order by
    string 'by?;
    # The direction to order by, either ascending or descending
    string direction?;
};

# A metadata template that holds the security classifications defined by an enterprise.
public type ClassificationTemplate record {
    # The ID of the classification template.
    string id?;
    # `metadata_template`
    string 'type?;
    # The scope of the classification template. This is in the format `enterprise_{id}` where the `id` is the enterprise ID.
    string scope?;
    # `securityClassification-6VMVochwUWo`
    string templateKey?;
    # The name of this template as shown in web and mobile interfaces.
    string displayName?;
    # This template is always available in web and mobile interfaces.
    boolean hidden?;
    # Classifications are always copied along when the file or folder is copied.
    boolean copyInstanceOnItemCopy?;
    # A list of fields for this classification template. This includes only one field, the `Box__Security__Classification__Key`, which defines the different classifications available in this enterprise.
    ClassificationtemplateFields[] fields?;
};

# A chunk of a file uploaded as part of an upload session, as returned by some endpoints.
public type UploadedPart record {
    # The representation of an upload session chunk.
    UploadPart part?;
};

# An entry in the `entries` attribute of a metadata card
public type TranscriptskillcardEntries record {
    # The text of the entry. This would be the transcribed text assigned to the entry on the timeline.
    string text?;
    # Defines when a transcribed bit of text appears. This only includes a start time and no end time.
    TranscriptskillcardAppears[] appears?;
};

# A single classification available in this enterprise.
public type ClassificationtemplateOptions record {
    # The unique ID of this classification.
    string id?;
    # The display name and key for this classification.
    string 'key?;
    # Additional information about the classification.
    ClassificationtemplateStaticconfig staticConfig?;
};

# Defines who can download a file.
public type FilesfileIdPermissions record {
    # Defines who is allowed to download this file. The possible values are either `open` for everyone or `company` for the other members of the user's enterprise.  This setting overrides the download permissions that are normally part of the `role` of a collaboration. When set to `company`, this essentially removes the download option for external users with `viewer` or `editor` a roles.
    string can_download?;
};

# A list of allowed domains for collaboration.
#
# The part of an API response that describes marker based pagination
public type CollaborationAllowlistEntries record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The description of an event that happened within Box
public type Event record {
    # `event`
    string 'type?;
    # The ID of the event object. You can use this to detect duplicate events
    string event_id?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # An event type that can trigger an event
    string event_type?;
    # The session of the user that performed the action. Not all events will populate this attribute.
    string session_id?;
    User|EventSource 'source?;
    # This object provides additional information about the event if available.  This can include how a user performed an event as well as additional information to correlate an event to external KeySafe logs. Not all events have an `additional_details` object.  This object is only available in the Enterprise Events.
    record {} additional_details?;
};

public type CollaborationAcceptanceRequirementsStatusTwoFactorAuthenticationRequirement record {
    # Whether or not the enterprise that owns the content requires two-factor authentication to be enabled in order to collaborate on the content.
    boolean enterprise_has_two_factor_auth_enabled?;
    # Whether or not the user has two-factor authentication enabled. The field is `null` when two-factor authentication is not required.
    boolean? user_has_two_factor_authentication_enabled?;
};

# Represents a configured webhook.
public type Webhook record {
    # The unique identifier for this webhook.
    string id?;
    # `webhook`
    string 'type?;
    # The item that will trigger the webhook
    WebhooksTarget target?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # A timestamp identifying the time that the webhook was created.
    string created_at?;
    # The URL that is notified by this webhook
    string address?;
    # An array of event names that this webhook is to be triggered for
    string[] triggers?;
};

# A list of collaborations
#
# The part of an API response that describes pagination
public type Collaborations record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# The settings for the shared link to create on the file.  Use an empty object (`{}`) to use the default settings for shared links.
public type FilesfileIdaddSharedLinkSharedLink record {
    # The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the file (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
    string access?;
    # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
    string password?;
    # Defines a custom vanity name to use in the shared link URL, for example `https://app.box.com/v/my-shared-link`.  Custom URLs should not be used when sharing sensitive content as vanity URLs are a lot easier to guess than regular shared links.
    string vanity_name?;
    # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts. The value must be greater than the current date and time.
    string unshared_at?;
    # The permissions on shared link.
    FilesfileIdaddSharedLinkSharedLinkPermissions permissions?;
};

# The invocation of this service, used to track which instance of a service applied the metadata.
public type SkillcardInvocation record {
    # `skill_invocation`
    string 'type;
    # A custom identifier that represent the instance of the service that applied this metadata. For example, if your `image-recognition-service` runs on multiple nodes, this field can be used to identify the ID of the node that was used to apply the metadata.
    string id;
};

# A list of retention policy assignments
#
# The part of an API response that describes marker based pagination
public type RetentionPolicyAssignments record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# A list of files, folders and web links that matched the search query, including the additional information about any shared links through which the item has been shared with the user.  This response format is only returned when the `include_recent_shared_links` query parameter has been set to `true`.
#
public type SearchResultsWithSharedLinks record {
    # One greater than the offset of the last entry in the search results. The total number of entries in the collection may be less than `total_count`.
    int total_count?;
    # The limit that was used for this search. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter used.
    int offset?;
};

# The title of the card.
public type KeywordskillcardSkillCardTitle record {
    # An optional identifier for the title.
    string code?;
    # The actual title to show in the UI.
    string message;
};

# Groups contain a set of users, and can be used in place of users in some operations, such as collaborations.
#
public type GroupFull record {
    *Group;
};

# A list of files, folders and web links that matched the search query.
#
public type SearchResults record {
    # One greater than the offset of the last entry in the search results. The total number of entries in the collection may be less than `total_count`.
    int total_count?;
    # The limit that was used for this search. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter used.
    int offset?;
};

# The timestamp for an entry.
public type TranscriptskillcardAppears record {
    # The time in seconds when an entry should start appearing on a timeline.
    int 'start?;
};

# The read-only and read-write access tokens for this item
public type SkillinvocationToken record {
    # The basics of an access token
    SkillinvocationTokenRead read?;
    # The basics of an access token
    SkillinvocationTokenRead write?;
};

# The title of the card.
public type StatusskillcardSkillCardTitle record {
    # An optional identifier for the title.
    string code?;
    # The actual title to show in the UI.
    string message;
};

# The destination folder to copy the folder to.
public type FoldersfolderIdcopyParent record {
    # The ID of parent folder
    string id;
};

# The user to add to the group.
public type GroupMembershipsUser record {
    # The ID of the user to add to the group
    string id;
};

# A list of collections
#
# The part of an API response that describes pagination
public type Collections record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# The parent folder for this folder. Use this to move the folder or to restore it out of the trash.
public type FoldersfolderIdParent record {
    # The ID of the new parent folder
    string id?;
};

# The terms of service to set the status for.
public type TermsOfServiceUserStatusesTos record {
    # The type of object.
    string 'type;
    # The ID of terms of service
    string id;
};

# A task assignment defines which task is assigned to which user to complete.
public type TaskAssignment record {
    # The unique identifier for this task assignment
    string id?;
    # `task_assignment`
    string 'type?;
    # A mini representation of a file, used when nested under another resource.
    FileMini item?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini assigned_to?;
    # A message that will is included with the task assignment. This is visible to the assigned user in the web and mobile UI.
    string message?;
    # The date at which this task assignment was completed. This will be `null` if the task is not completed yet.
    string completed_at?;
    # The date at which this task was assigned to the user.
    string assigned_at?;
    # The date at which the assigned user was reminded of this task assignment.
    string reminded_at?;
    # The current state of the assignment. The available states depend on the `action` value of the task object.
    string resolution_state?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini assigned_by?;
};

# Web links are objects that point to URLs. These objects are also known as bookmarks within the Box web application.  Web link objects are treated similarly to file objects, they will also support most actions that apply to regular files.
#
public type WeblinkMini record {
    *WeblinkBase;
};

# The timestamp for an entry.
public type SkillcardAppears record {
    # The time in seconds when an entry should start appearing on a timeline.
    int 'start?;
    # The time in seconds when an entry should stop appearing on a timeline. For a `skill_card_type` of `transcript` this value is ignored.
    int end?;
};

# An entry in the `entries` attribute of a metadata card
public type SkillcardEntries record {
    # The text of the entry. This would be the actual keyword in a `keyword` card, the line of a transcript in a `transcript` card, or the display name for an item when using the `timeline` entry.
    string text?;
    # Defines a list of timestamps for an entry. This is used with a `skill_card_type` of `transcript` as well as `timeline` to place items on a timeline.  For a `skill_card_type` of `transcript` there can only be one entry in this list for each item, and only the `start` time is used to place the transcript on the timeline.
    SkillcardAppears[] appears?;
    # The image to show on a for an entry that appears on a timeline. This image URL is required for any `timeline` cards. The image will be shown in a list of items (for example faces), and clicking the image will show the user where that entry appears during the duration of this entry.
    string image_url?;
};

# The timestamp for an entry.
public type TimelineskillcardAppears record {
    # The time in seconds when an entry should start appearing on a timeline.
    int 'start?;
    # The time in seconds when an entry should stop appearing on a timeline.
    int end?;
};

# A list of task assignments
public type TaskAssignments record {
    # The total number of items in this collection.
    int total_count?;
    # The entries of task assignments.
    TaskAssignment[] entries?;
};

# The source file or folder that triggered an event in the event stream.
public type EventSource record {
    # The type of the item that the event represents. Can be `file` or `folder`. 
    string item_type?;
    # The unique identifier that represents the item. 
    string item_id?;
    # The name of the item. 
    string item_name?;
    # A mini representation of a file version, used when nested under another resource.
    FolderMini parent?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini owned_by?;
};

# A mini representation of a user, used when nested within another resource.
public type UserBase record {
    # The unique identifier for this user
    string id?;
    # `user`
    string 'type?;
};

# A standard representation of a file request, as returned from any file request API endpoints by default.
public type FileRequest record {
    # The unique identifier for this file request.
    string id?;
    # `file-request`
    string 'type?;
    # The title of file request. This is shown in the Box UI to users uploading files.  This defaults to title of the file request that was copied to create this file request.
    string title?;
    # The optional description of this file request. This is shown in the Box UI to users uploading files.  This defaults to description of the file request that was copied to create this file request.
    string? description?;
    # The status of the file request. This defaults to `active`.  When the status is set to `inactive`, the file request will no longer accept new submissions, and any visitor to the file request URL will receive a `HTTP 404` status code.  This defaults to status of file request that was copied to create this file request.
    string status?;
    # Whether a file request submitter is required to provide their email address.  When this setting is set to true, the Box UI will show an email field on the file request form.  This defaults to setting of file request that was copied to create this file request.
    boolean is_email_required?;
    # Whether a file request submitter is required to provide a description of the files they are submitting.  When this setting is set to true, the Box UI will show a description field on the file request form.  This defaults to setting of file request that was copied to create this file request.
    boolean is_description_required?;
    # The date after which a file request will no longer accept new submissions.  After this date, the `status` will automatically be set to `inactive`.
    string expires_at?;
    # A mini representation of a file version, used when nested under another resource.
    FolderMini folder?;
    # The generated URL for this file request. This URL can be shared with users to let them upload files to the associated folder.
    string url?;
    # The HTTP `etag` of this file. This can be used in combination with the `If-Match` header when updating a file request. By providing that header, a change will only be performed on the  file request if the `etag` on the file request still matches the `etag` provided in the `If-Match` header.
    string? etag?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # The date and time when the file request was created.
    string created_at?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini updated_by?;
    # The date and time when the file request was last updated.
    string updated_at?;
};

# The settings for the shared link to update.
public type FilesfileIdupdateSharedLinkSharedLink record {
    # The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the folder (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
    string access?;
    # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
    string password?;
    # Defines a custom vanity name to use in the shared link URL, for example `https://app.box.com/v/my-shared-link`.  Custom URLs should not be used when sharing sensitive content as vanity URLs are a lot easier to guess than regular shared links.
    string vanity_name?;
    # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts. The value must be greater than the current date and time.
    string unshared_at?;
    # The permissions on shared link.
    FilesfileIdaddSharedLinkSharedLinkPermissions permissions?;
};

# The storage policy to assign to the user or enterprise
public type StoragePolicyAssignmentsStoragePolicy record {
    # The type to assign.
    string 'type;
    # The ID of the storage policy to assign.
    string id;
};

# The details for the upload session for the file.
public type UploadUrl record {
    # A URL for an upload session that can be used to upload the file.
    string upload_url?;
    # An optional access token to use to upload the file
    string upload_token?;
};

# The status of a `zip` archive being downloaded.
public type ZipDownloadStatus record {
    # The total number of files in the archive.
    int total_file_count?;
    # The number of files that have already been downloaded.
    int downloaded_file_count?;
    # The number of files that have been skipped as they could not be downloaded. In many cases this is due to permission issues that have surfaced between the creation of the request for the archive and the archive being downloaded.
    int skipped_file_count?;
    # The number of folders that have been skipped as they could not be downloaded. In many cases this is due to permission issues that have surfaced between the creation of the request for the archive and the archive being downloaded.
    int skipped_folder_count?;
    # The state of the archive being downloaded.
    string state?;
};

# Session endpoints.
public type SessionEndpoint record {
    # The URL to upload parts to
    string upload_part?;
    # The URL used to commit the file
    string 'commit?;
    # The URL for used to abort the session.
    string 'abort?;
    # The URL users to list all parts.
    string list_parts?;
    # The URL used to get the status of the upload.
    string status?;
    # The URL used to get the upload log from.
    string log_event?;
};

# Additional information about the classification.  This is not an exclusive list of properties, and more object fields might be returned. These fields are used for internal Box Shield and Box Governance purposes and no additional value must be derived from these fields.
public type ClassificationtemplateStaticconfigClassification record {
    # A longer description of the classification.
    string classificationDefinition?;
    # An internal Box identifier used to assign a color to a classification label.  Mapping between a `colorID` and a color may change without notice. Currently, the color mappings are as follows.  * `0`: Yellow * `1`: Orange * `2`: Watermelon red * `3`: Purple rain * `4`: Light blue * `5`: Dark blue * `6`: Light green * `7`: Gray
    decimal colorID?;
};

# The payload of a Box skill as sent to a skill's `invocation_url`.
public type SkillInvocation record {
    # `skill_invocation`
    string 'type?;
    # Unique identifier for the invocation request.
    string id?;
    # An object representing a skill
    Skill skill?;
    # The read-only and read-write access tokens for this item
    SkillinvocationToken token?;
    # The details status of this event.
    SkillinvocationStatus status?;
    # The time this invocation was created.
    string created_at?;
    # Action that triggered the invocation
    string trigger?;
    # A representation of a Box enterprise
    Enterprise enterprise?;
    File|Folder 'source?;
    # The description of an event that happened within Box
    Event event?;
};

# A base representation of a group.
public type GroupBase record {
    # The unique identifier for this object
    string id?;
    # `group`
    string 'type?;
};

public type ConflicterrorContextInfo record {
    # A list of the file conflicts that caused this error.
    FileConflict[] conflicts?;
};

# The file to attach the task to.
public type TasksItem record {
    # The ID of the file
    string id;
    # `file`
    string 'type;
};

# The metadata to set for this skill. This is a list of Box Skills cards. These cards will overwrite any existing Box skill cards on the file.
public type SkillInvocationsskillIdMetadata record {
    # A list of Box Skill cards to apply to this file.
    SkillCard|KeywordSkillCard|TimelineSkillCard|TranscriptSkillCard|StatusSkillCard[] cards?;
};

# A full representation of a user, as can be returned from any user API endpoint.
#
public type UserFull record {
    *User;
};

# Counts of assignments within this a legal hold policy by item type
public type LegalholdpolicyAssignmentCounts record {
    # The number of users this policy is applied to
    int user?;
    # The number of folders this policy is applied to
    int folder?;
    # The number of files this policy is applied to
    int file?;
    # The number of file versions this policy is applied to
    int file_version?;
};

# A list of device pins
public type DevicePinners record {
    # A entries of device pins
    DevicePinner[] entries?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The order by which items are returned.
    DevicepinnersOrder[] 'order?;
};

# The task to assign to a user.
public type TaskAssignmentsTask record {
    # The ID of the task
    string id;
    # The type of the item to assign.
    string 'type;
};

# The retention policy assignment endpoint provides a way for admins to apply a retention policy on a per-folder basis, or place a blanket policy over the entire enterprise.
public type RetentionPolicyAssignment record {
    # The unique identifier for this retention policy assignment
    string id?;
    # `retention_policy_assignment`
    string 'type?;
    # A mini representation of a retention policy, used when nested within another resource.
    RetentionpolicyMini retention_policy?;
    # The bare basic reference for an object
    Reference assigned_to?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini assigned_by?;
    # When the retention policy assignment object was created
    string assigned_at?;
};

# A retention policy blocks permanent deletion of content for a specified amount of time. Admins can create retention policies and then later assign them to specific folders or their entire enterprise.  To use this feature, you must have the manage retention policies scope enabled for your API key via your application management console.
#
public type RetentionPolicy record {
    *RetentionpolicyMini;
};

# The user or group to give access to the item.
public type CollaborationsAccessibleBy record {
    # The type of collaborator to invite.
    string 'type;
    # The ID of the user or group.  Alternatively, use `login` to specify a user by email address.
    string id?;
    # The email address of the user to grant access to the item.  Alternatively, use `id` to specify a user by user ID.
    string login?;
};

# The bare basic reference for an object
public type AssignedTo record {
    # The unique identifier for this object
    string id?;
    # The type for this object
    string 'type?;
};

# An object representing a skill
public type Skill record {
    # The unique identifier for this skill
    string id?;
    # `skill`
    string 'type?;
    # The name of the skill
    string name?;
    # The client ID of the application
    string api_key?;
};

# A generic Box Skill metadata card.
public type SkillCard record {
    # The optional date and time this card was created at.
    string created_at?;
    # `skill_card`
    string 'type;
    # The type of card to add to the file.
    string skill_card_type;
    # The title of the card.
    SkillcardSkillCardTitle skill_card_title?;
    # Used with a card of type `status` to set the status of the skill. This can be used to show a message to the user while the Skill is processing the data.
    SkillcardStatus status?;
    # The service that applied this metadata.
    SkillcardSkill skill;
    # The invocation of this service, used to track which instance of a service applied the metadata.
    SkillcardInvocation invocation;
    # An optional total duration in seconds.  Used with a `skill_card_type` of `transcript` or `timeline`.
    int duration?;
    # An optional list of entries in the metadata card.  This field is used with a `skill_card_type` of `transcript`, `keyword` or `timeline`.
    SkillcardEntries[] entries?;
};

# A mini legal hold policy
public type LegalholdpolicyMini record {
    # The unique identifier for this legal hold policy
    string id?;
    # `legal_hold_policy`
    string 'type?;
};

# The folder to apply the lock to.
public type FolderLocksFolder record {
    # The content type the lock is being applied to. Only `folder` is supported.
    string 'type;
    # The ID of the folder.
    string id;
};

# A watermark is a semi-transparent overlay on an embedded file preview that displays a viewer's email address or user ID and the time of access over a file's content
public type Watermark record {
    # Watermark details
    WatermarkWatermark watermark?;
};

# A list of storage policies.
#
# The part of an API response that describes marker based pagination
public type StoragePolicies record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The event that is sent to a webhook address when an event happens.
public type WebhookInvocation record {
    # The unique identifier for this webhook invocation
    string id?;
    # `webhook_event`
    string 'type?;
    # Represents a configured webhook.
    Webhook webhook?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # A timestamp identifying the time that the webhook event was triggered.
    string created_at?;
    # The event name that triggered this webhook
    string trigger?;
    File|Folder 'source?;
};

public type Body56 record {
    # The user to exempt.
    CollaborationWhitelistExemptTargetsUser user;
};

# Membership is used to signify that a user is part of a group.
public type GroupMembership record {
    # The unique identifier for this group membership
    string id?;
    # `group_membership`
    string 'type?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini user?;
    # Mini representation of a group, including id and name of group.
    GroupMini 'group?;
    # The role of the user in the group.
    string role?;
    # The time this membership was created.
    string created_at?;
    # The time this membership was last modified.
    string modified_at?;
};

# The enterprise to invite the user to
public type InvitesEnterprise record {
    # The ID of the enterprise
    string id;
};

# A user that is notified of an event.
public type RetentionPoliciesCustomNotificationRecipients record {
    # The type of item to notify
    string 'type?;
    # The id of the user to notify
    string id?;
    # The name of the user to notify
    string name?;
    # The email address the user uses to notify
    string login?;
};

public type Body55 record {
    # The domain to add to the list of allowed domains.
    string domain;
    # The direction in which to allow collaborations.
    string direction;
};

public type Body54 record {
    # Whether the user has accepted the terms.
    boolean is_accepted;
};

# A list of users.
#
# The part of an API response that describes pagination
public type Users record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

public type Body53 record {
    # The terms of service to set the status for.
    TermsOfServiceUserStatusesTos tos;
    # The user to set the status for.
    TermsOfServiceUserStatusesUser user;
    # Whether the user has accepted the terms.
    boolean is_accepted;
};

# The request body to update a file request.
public type FileRequestUpdateRequest record {
    # An optional new title for the file request. This can be used to change the title of the file request.  This will default to the value on the existing file request.
    string title?;
    # An optional new description for the file request. This can be used to change the description of the file request.  This will default to the value on the existing file request.
    string description?;
    # An optional new status of the file request.  When the status is set to `inactive`, the file request will no longer accept new submissions, and any visitor to the file request URL will receive a `HTTP 404` status code.  This will default to the value on the existing file request.
    string status?;
    # Whether a file request submitter is required to provide their email address.  When this setting is set to true, the Box UI will show an email field on the file request form.  This will default to the value on the existing file request.
    boolean is_email_required?;
    # Whether a file request submitter is required to provide a description of the files they are submitting.  When this setting is set to true, the Box UI will show a description field on the file request form.  This will default to the value on the existing file request.
    boolean is_description_required?;
    # The date after which a file request will no longer accept new submissions.  After this date, the `status` will automatically be set to `inactive`.  This will default to the value on the existing file request.
    string expires_at?;
};

# An item to add to the `zip` archive. This can be a file or a folder.
public type ZipdownloadrequestItems record {
    # The type of the item to add to the archive.
    string 'type;
    # The identifier of the item to add to the archive. When this item is a folder then this can not be the root folder with ID `0`.
    string id;
};

public type Body58 record {
    # The storage policy to assign to the user or enterprise
    StoragePolicyAssignmentsStoragePolicy storage_policy;
};

public type Body57 record {
    # The storage policy to assign to the user or enterprise
    StoragePolicyAssignmentsStoragePolicy storage_policy;
    # The user or enterprise to assign the storage policy to.
    StoragePolicyAssignmentsAssignedTo assigned_to;
};

# The bare basic representation of a folder, the minimal amount of fields returned when using the `fields` query parameter.
public type FolderBase record {
    # The unique identifier that represent a folder.  The ID for any folder can be determined by visiting a folder in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/folders/123` the `folder_id` is `123`.
    string id?;
    # The HTTP `etag` of this folder. This can be used within some API endpoints in the `If-Match` and `If-None-Match` headers to only perform changes on the folder if (no) changes have happened.
    string? etag?;
    # `folder`
    string 'type?;
};

# The item to assign the policy to
public type RetentionPolicyAssignmentsAssignTo record {
    # The type of item to assign the policy to.
    string 'type;
    # The ID of item to assign the policy to.  Set to `null` or omit when `type` is set to `enterprise`.
    string id;
};

# Web links are objects that point to URLs. These objects are also known as bookmarks within the Box web application.  Web link objects are treated similarly to file objects, they will also support most actions that apply to regular files.
public type WeblinkBase record {
    # The unique identifier for this web link
    string id?;
    # `web_link`
    string 'type?;
    # The entity tag of this web link. Used with `If-Match` headers.
    string etag?;
};

# The basics of an access token
public type SkillinvocationTokenRead record {
    # The requested access token.
    string access_token?;
    # The time in seconds in seconds by which this token will expire.
    int expires_in?;
    # The type of access token returned.
    string token_type?;
    # The permissions that this access token permits, providing a list of resources (files, folders, etc) and the scopes permitted for each of those resources.
    FileScope[] restricted_to?;
};

# A mini representation of a user, as can be returned when nested within other resources.
#
public type UserMini record {
    *UserBase;
};

# The watermark to imprint on the folder
public type FoldersfolderIdwatermarkWatermark record {
    # The type of watermark to apply.  Currently only supports one option.
    string imprint;
};

# The association between a Terms of Service and a user
public type TermsOfServiceUserStatus record {
    # The unique identifier for this terms of service user status
    string id?;
    # `terms_of_service_user_status`
    string 'type?;
    # The root-level record that is supposed to represent a single Terms of Service.
    TermsofserviceMini tos?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini user?;
    # If the user has accepted the terms of services
    boolean is_accepted?;
    # When the legal item was created
    string created_at?;
    # When the legal item was modified.
    string modified_at?;
};

# The operations that have been locked. Currently the `move` and `delete` operations cannot be locked separately, and both need to be set to `true`. 
public type FolderlockLockedOperations record {
    # Whether moving the folder is restricted.
    boolean move?;
    # Whether deleting the folder is restricted.
    boolean delete?;
};

public type Body45 record {
    # The name for the retention policy
    string policy_name;
    # The type of the retention policy. A retention policy type can either be `finite`, where a specific amount of time to retain the content is known upfront, or `indefinite`, where the amount of time to retain the content is still unknown.
    string policy_type;
    # The disposition action of the retention policy. This action can be `permanently_delete`, which will cause the content retained by the policy to be permanently deleted, or `remove_retention`, which will lift the retention policy from the content, allowing it to be deleted by users, once the retention policy has expired.
    string disposition_action;
    # The length of the retention policy. This length specifies the duration in days that the retention policy will be active for after being assigned to content.  If the policy has A `policy_type` of `indefinite`, the `retention_length` will also be `indefinite`.
    string retention_length?;
    # Whether the owner of a file will be allowed to extend the retention.
    boolean can_owner_extend_retention?;
    # Whether owner and co-owners of a file are notified when the policy nears expiration.
    boolean are_owners_notified?;
    RetentionPoliciesCustomNotificationRecipients[] custom_notification_recipients?;
};

# An OAuth 2.0 error
public type OAuth2Error record {
    # The type of the error returned.
    string _error?;
    # The type of the error returned.
    string error_description?;
};

public type Body44 record {
    # Defines the status of this invocation. Set this to `success` when setting Skill cards.
    string status;
    # The metadata to set for this skill. This is a list of Box Skills cards. These cards will overwrite any existing Box skill cards on the file.
    SkillInvocationsskillIdMetadata metadata;
    # The file to assign the cards to.
    SkillInvocationsskillIdFile file;
    # The optional file version to assign the cards to.
    SkillInvocationsskillIdFileVersion file_version?;
    # A descriptor that defines what items are affected by this call.  Set this to the default values when setting a card to a `success` state, and leave it out in most other situations.
    SkillInvocationsskillIdUsage usage?;
};

public type Body43 record {
    # The item that will trigger the webhook
    WebhooksTarget target?;
    # The URL that is notified by this webhook
    string address?;
    # An array of event names that this webhook is to be triggered for
    string[] triggers?;
};

public type Body42 record {
    # The item that will trigger the webhook
    WebhooksTarget target;
    # The URL that is notified by this webhook
    string address;
    # An array of event names that this webhook is to be triggered for
    string[] triggers;
};

public type Body49 record {
    # The name of the policy.
    string policy_name?;
    # A description for the policy.
    string description?;
    # Notes around why the policy was released.
    string release_notes?;
};

# The group to add the user to.
public type GroupMembershipsGroup record {
    # The ID of the group to add the user to
    string id;
};

public type Body48 record {
    # The name of the policy.
    string policy_name;
    # A description for the policy.
    string description?;
    # The filter start date.  When this policy is applied using a `custodian` legal hold assignments, it will only apply to file versions created or uploaded inside of the date range. Other assignment types, such as folders and files, will ignore the date filter.  Required if `is_ongoing` is set to `false`.
    string filter_started_at?;
    # The filter end date.  When this policy is applied using a `custodian` legal hold assignments, it will only apply to file versions created or uploaded inside of the date range. Other assignment types, such as folders and files, will ignore the date filter.  Required if `is_ongoing` is set to `false`.
    string filter_ended_at?;
    # Whether new assignments under this policy should continue applying to files even after initialization.  When this policy is applied using a legal hold assignment, it will continue applying the policy to any new file versions even after it has been applied.  For example, if a legal hold assignment is placed on a user today, and that user uploads a file tomorrow, that file will get held. This will continue until the policy is retired.  Required if no filter dates are set.
    boolean is_ongoing?;
};

public type Body47 record {
    # The ID of the retention policy to assign
    string policy_id;
    # The item to assign the policy to
    RetentionPolicyAssignmentsAssignTo assign_to;
};

public type Body46 record {
    # The name for the retention policy
    string policy_name?;
    # The disposition action of the retention policy. This action can be `permanently_delete`, which will cause the content retained by the policy to be permanently deleted, or `remove_retention`, which will lift the retention policy from the content, allowing it to be deleted by users, once the retention policy has expired.
    string disposition_action?;
    # Used to retire a retention policy.  If not retiring a policy, do not include this parameter or set it to `null`.
    string status?;
};

public type Body52 record {
    # Whether this terms of service is active.
    string status;
    # The terms of service text to display to users.  The text can be set to empty if the `status` is set to `disabled`.
    string text;
};

public type Body51 record {
    # Whether this terms of service is active.
    string status;
    # The type of user to set the terms of service for.
    string tos_type?;
    # The terms of service text to display to users.  The text can be set to empty if the `status` is set to `disabled`.
    string text;
};

public type Body50 record {
    # The ID of the policy to assign.
    string policy_id;
    # The item to assign the policy to
    LegalHoldPolicyAssignmentsAssignTo assign_to;
};

# A list of uploaded chunks for an upload session.
#
# The part of an API response that describes pagination
public type UploadParts record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

public type CollaborationAcceptanceRequirementsStatusTermsOfServiceRequirement record {
    # Whether or not the terms of service have been accepted.  The field is `null` when there is no terms of service required.
    boolean? is_accepted?;
    record {*TermsofserviceMini;} terms_of_service?;
};

# A list of legal hold policies assignments.
#
# The part of an API response that describes marker based pagination
public type LegalHoldPolicyAssignments record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The user who the folder will be transferred to
public type UsersuserIdfolders0OwnedBy record {
    # The ID of the user who the folder will be transferred to
    string id;
};

# Watermark details
public type WatermarkWatermark record {
    # When this watermark was created
    string created_at?;
    # When this task was modified
    string modified_at?;
};

# The assignment of a storage policy to a user or enterprise
public type StoragePolicyAssignment record {
    # A mini description of a Storage Policy object
    StoragepolicyMini storage_policy?;
    # The bare basic reference for an object
    AssignedTo assigned_to?;
};

# The details status of this event.
public type SkillinvocationStatus record {
    # The state of this event.  * `invoked` - Triggered the skill with event details to start   applying skill on the file. * `processing` - Currently processing. * `success` - Completed processing with a success. * `transient_failure` - Encountered an issue which can be   retried. * `permanent_failure` -  Encountered a permanent issue and   retry would not help.
    string state?;
    # Status information
    string message?;
    # Error code information, if error occurred.
    string error_code?;
    # Additional status information.
    string additional_info?;
};

# A free-form object that contains additional context about the error. The possible fields are defined on a per-endpoint basis.
public type ClienterrorContextInfo record {
    # A list of the file conflicts that caused this error.
    FileConflict[] conflicts?;
};

# A list of retention policies
public type RetentionPolicies record {
    # The number of retention policies.
    int total_count?;
    # The entries of retention policies.
    RetentionPolicy[] entries?;
};

public type FolderFolderUploadEmail record {
    # When this parameter has been set, users can email files to the email address that has been automatically created for this folder.  To create an email address, set this property either when creating or updating the folder.  When set to `collaborators`, only emails from registered email addresses for collaborators will be accepted. This includes any email aliases a user might have registered.  When set to `open` it will accept emails from any email address.
    string access?;
    # The optional upload email address for this folder.
    string email?;
};

# Device pins allow enterprises to control what devices can use native Box applications.
public type DevicePinner record {
    # The unique identifier for this device pin.
    string id?;
    # `device_pinner`
    string 'type?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini owned_by?;
    # The type of device being pinned
    string product_name?;
    # The time the device pin was created
    string created_at?;
    # The time the device pin was modified
    string modified_at?;
};

public type Body39 record {
    # The name of the new group to be created. Must be unique within the enterprise.
    string name?;
    # Keeps track of which external source this group is coming, for example `Active Directory`, or `Okta`.  Setting this will also prevent Box admins from editing the group name and its members directly via the Box web application.  This is desirable for one-way syncing of groups.
    string provenance?;
    # An arbitrary identifier that can be used by external group sync tools to link this Box Group to an external group.  Example values of this field could be an **Active Directory Object ID** or a **Google Group ID**.  We recommend you use of this field in order to avoid issues when group names are updated in either Box or external systems.
    string external_sync_identifier?;
    # A human readable description of the group.
    string description?;
    # Specifies who can invite the group to collaborate on folders.  When set to `admins_only` the enterprise admin, co-admins, and the group's admin can invite the group.  When set to `admins_and_members` all the admins listed above and group members can invite the group.  When set to `all_managed_users` all managed users in the enterprise can invite the group.
    string invitability_level?;
    # Specifies who can see the members of the group.  * `admins_only` - the enterprise admin, co-admins, group's   group admin * `admins_and_members` - all admins and group members * `all_managed_users` - all managed users in the   enterprise
    string member_viewability_level?;
};

# A mini representation of a retention policy, used when nested within another resource.
#
public type RetentionpolicyMini record {
    *RetentionpolicyBase;
};

public type Body34 record {
    # Set this to `null` to roll the user out of the enterprise and make them a free user
    string? enterprise?;
    # Whether the user should receive an email when they are rolled out of an enterprise
    boolean notify?;
    # The name of the user
    string name?;
    # The email address the user uses to log in
    string login?;
    # The user’s enterprise role
    string role?;
    # The language of the user, formatted in modified version of the [ISO 639-1](/guides/api-calls/language-codes) format.
    string language?;
    # Whether the user can use Box Sync
    boolean is_sync_enabled?;
    # The user’s job title
    string job_title?;
    # The user’s phone number
    string phone?;
    # The user’s address
    string address?;
    # Tracking codes allow an admin to generate reports from the admin console and assign an attribute to a specific group of users. This setting must be enabled for an enterprise before it can be used.
    string[] tracking_codes?;
    # Whether the user can see other enterprise users in their contact list
    boolean can_see_managed_users?;
    # The user's timezone
    string timezone?;
    # Whether the user is allowed to collaborate with users outside their enterprise
    boolean is_external_collab_restricted?;
    # Whether to exempt the user from enterprise device limits
    boolean is_exempt_from_device_limits?;
    # Whether the user must use two-factor authentication
    boolean is_exempt_from_login_verification?;
    # Whether the user is required to reset their password
    boolean is_password_reset_required?;
    # The user's account status
    string status?;
    # The user’s total available space in bytes. Set this to `-1` to indicate unlimited storage.
    int space_amount?;
    # An alternate notification email address to which email notifications are sent. When it's confirmed, this will be the email address to which notifications are sent instead of to the primary email address.  Set this value to `null` to remove the notification email.
    UsersuserIdNotificationEmail notification_email?;
};

public type Body33 record {
    # The name of the user
    string name;
    # The email address the user uses to log in  Required, unless `is_platform_access_only` is set to `true`.
    string login?;
    # Specifies that the user is an app user.
    boolean is_platform_access_only?;
    # The user’s enterprise role
    string role?;
    # The language of the user, formatted in modified version of the [ISO 639-1](/guides/api-calls/language-codes) format.
    string language?;
    # Whether the user can use Box Sync
    boolean is_sync_enabled?;
    # The user’s job title
    string job_title?;
    # The user’s phone number
    string phone?;
    # The user’s address
    string address?;
    # The user’s total available space in bytes. Set this to `-1` to indicate unlimited storage.
    int space_amount?;
    # Tracking codes allow an admin to generate reports from the admin console and assign an attribute to a specific group of users. This setting must be enabled for an enterprise before it can be used.
    string[] tracking_codes?;
    # Whether the user can see other enterprise users in their contact list
    boolean can_see_managed_users?;
    # The user's timezone
    string timezone?;
    # Whether the user is allowed to collaborate with users outside their enterprise
    boolean is_external_collab_restricted?;
    # Whether to exempt the user from enterprise device limits
    boolean is_exempt_from_device_limits?;
    # Whether the user must use two-factor authentication
    boolean is_exempt_from_login_verification?;
    # The user's account status
    string status?;
    # An external identifier for an app user, which can be used to look up the user. This can be used to tie user IDs from external identity providers to Box users.
    string external_app_user_id?;
};

# A descriptor that defines what items are affected by this call.  Set this to the default values when setting a card to a `success` state, and leave it out in most other situations.
public type SkillInvocationsskillIdUsage record {
    # `file`
    string unit?;
    # `1`
    decimal value?;
};

public type Body32 record {
    # An optional new name for the web link.
    string name?;
    record {# The ID of parent item
        string id?;} parent?;
};

public type Body31 record {
    # The new URL that the web link links to. Must start with `"http://"` or `"https://"`.
    string url?;
    record {# The ID of parent item
        string id?;} parent?;
    # A new name for the web link. Defaults to the URL if not set.
    string name?;
    # A new description of the web link.
    string description?;
};

# A standard representation of a folder, as returned from any folder API endpoints by default
#
public type Folder record {
    *FolderMini;
};

public type Body38 record {
    # The name of the new group to be created. This name must be unique within the enterprise.
    string name;
    # Keeps track of which external source this group is coming, for example `Active Directory`, or `Okta`.  Setting this will also prevent Box admins from editing the group name and its members directly via the Box web application.  This is desirable for one-way syncing of groups.
    string provenance?;
    # An arbitrary identifier that can be used by external group sync tools to link this Box Group to an external group.  Example values of this field could be an **Active Directory Object ID** or a **Google Group ID**.  We recommend you use of this field in order to avoid issues when group names are updated in either Box or external systems.
    string external_sync_identifier?;
    # A human readable description of the group.
    string description?;
    # Specifies who can invite the group to collaborate on folders.  When set to `admins_only` the enterprise admin, co-admins, and the group's admin can invite the group.  When set to `admins_and_members` all the admins listed above and group members can invite the group.  When set to `all_managed_users` all managed users in the enterprise can invite the group.
    string invitability_level?;
    # Specifies who can see the members of the group.  * `admins_only` - the enterprise admin, co-admins, group's   group admin * `admins_and_members` - all admins and group members * `all_managed_users` - all managed users in the   enterprise
    string member_viewability_level?;
};

# A full representation of a folder, as can be returned from any folder API endpoints by default
#
public type FolderFull record {
    *Folder;
};

public type Body37 record {
    # The enterprise to invite the user to
    InvitesEnterprise enterprise;
    # The user to invite
    InvitesActionableBy actionable_by;
};

public type Body36 record {
    # The email address to add to the account as an alias.
    string email;
};

public type Body35 record {
    # The user who the folder will be transferred to
    UsersuserIdfolders0OwnedBy owned_by;
};

# A mini representation of a file version, used when nested within another resource.
#
public type FileversionMini record {
    *FileversionBase;
};

# The settings for the shared link to update.
public type FoldersfolderIdupdateSharedLinkSharedLink record {
    # The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the folder (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
    string access?;
    # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
    string password?;
    # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts. The value must be greater than the current date and time.
    string unshared_at?;
    # The permissions on shared link.
    FoldersfolderIdaddSharedLinkSharedLinkPermissions permissions?;
};

# A real-time server that can be used for long polling user events
public type RealtimeServer record {
    # `realtime_server`
    string 'type?;
    # The URL for the server.
    string url?;
    # The time in minutes for which this server is available
    int ttl?;
    # The maximum number of retries this server will allow before a new long poll should be started by getting a [new list of server](#options-events).
    int max_retries?;
    # The maximum number of seconds without a response after which you should retry the long poll connection.  This helps to overcome network issues where the long poll looks to be working but no packages are coming through.
    int retry_timeout?;
};

# A list of terms of service user statuses
public type TermsOfServiceUserStatuses record {
    # The total number of objects.
    int total_count?;
    # The associations between a Terms of Service and a user.
    TermsOfServiceUserStatus[] entries?;
};

public type Body41 record {
    # The role of the user in the group.
    string role?;
    # Custom configuration for the permissions an admin if a group will receive. This option has no effect on members with a role of `member`.  Setting these permissions overwrites the default access levels of an admin.  Specifying a value of "null" for this object will disable all configurable permissions. Specifying permissions will set them accordingly, omitted permissions will be enabled by default.
    record {} configurable_permissions?;
};

# A list of event objects
public type Events record {
    # The number of events returned in this response.
    int chunk_size?;
    # The stream position of the start of the next page (chunk) of events.
    string next_stream_position?;
    # The description of an events that happened within Box.
    Event[] entries?;
};

public type Body40 record {
    # The user to add to the group.
    GroupMembershipsUser user;
    # The group to add the user to.
    GroupMembershipsGroup 'group;
    # The role of the user in the group.
    string role?;
    # Custom configuration for the permissions an admin if a group will receive. This option has no effect on members with a role of `member`.  Setting these permissions overwrites the default access levels of an admin.  Specifying a value of "null" for this object will disable all configurable permissions. Specifying permissions will set them accordingly, omitted permissions will be enabled by default.
    record {} configurable_permissions?;
};

# The file version to revert to
public type Body8 record {
    # The file version ID
    string id?;
    # The type to revert to
    string 'type?;
};

public type Body9 record {
    # The watermark to imprint on the file
    FilesfileIdwatermarkWatermark watermark;
};

public type Body6 record {
    # The list details for the uploaded parts
    UploadPart[] parts;
};

public type Body29 record {
    # By setting this value to `null`, the shared link is removed from the folder.
    record {} shared_link?;
};

public type Body7 record {
    # An optional new name for the copied file.  There are some restrictions to the file name. Names containing non-printable ASCII characters, forward and backward slashes (`/`, `\`), and protected names like `.` and `..` are automatically sanitized by removing the non-allowed characters.
    string name?;
    # An optional ID of the specific file version to copy.
    string 'version?;
    # The destination folder to copy the file to.
    FilesfileIdcopyParent parent;
};

public type Body28 record {
    # The settings for the shared link to update.
    FoldersfolderIdupdateSharedLinkSharedLink shared_link?;
};

# The user or enterprise to assign the storage policy to.
public type StoragePolicyAssignmentsAssignedTo record {
    # The type to assign the policy to.
    string 'type;
    # The ID of the user or enterprise
    string id;
};

# The additional attributes of the file being uploaded. Mainly the name and the parent folder. These attributes are part of the multi part request body and are in JSON format.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
public type FilesfileIdcontentAttributes record {
    # An optional new name for the file. If specified, the file will be renamed when the new version is uploaded.
    string name;
    # Defines the time the file was last modified at.  If not set, the upload time will be used.
    string content_modified_at?;
};

public type Body4 record {
    # The ID of the folder to upload the new file to.
    string folder_id;
    # The total number of bytes of the file to be uploaded
    int file_size;
    # The name of new file
    string file_name;
};

# Additional information about the classification.
public type ClassificationtemplateStaticconfig record {
    # Additional information about the classification.  This is not an exclusive list of properties, and more object fields might be returned. These fields are used for internal Box Shield and Box Governance purposes and no additional value must be derived from these fields.
    ClassificationtemplateStaticconfigClassification classification?;
};

public type CollaborationAcceptanceRequirementsStatusStrongPasswordRequirement record {
    # Whether or not the enterprise that owns the content requires a strong password to collaborate on the content.
    boolean enterprise_has_strong_password_required_for_external_users?;
    # Whether or not the user has a strong password set for their account. The field is `null` when a strong password is not required.
    boolean? user_has_strong_password?;
};

public type Body5 record {
    # The total number of bytes of the file to be uploaded
    int file_size;
    # The optional new name of new file
    string file_name?;
};

public type Body2 record {
    # The additional attributes of the file being uploaded. Mainly the name and the parent folder. These attributes are part of the multi part request body and are in JSON format.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
    FilesfileIdcontentAttributes attributes;
    # The content of the file to upload to Box.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
    string file;
};

# The bare basic reference for an object
public type Reference record {
    # The unique identifier for this object
    string id?;
    # The type for this object
    string 'type?;
};

public type Body3 record {
    # The additional attributes of the file being uploaded. Mainly the name and the parent folder. These attributes are part of the multi part request body and are in JSON format.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
    FilescontentAttributes attributes;
    # The content of the file to upload to Box.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
    string file;
};

# The parent folder to create the new folder within.
public type FoldersParent record {
    # The ID of parent folder
    string id;
};

public type Body23 record {
    # An optional message by the assignee that can be added to the task.
    string message?;
    # The state of the task assigned to the user.  * For a task with an `action` value of `complete` this can be `incomplete` or `completed`. * For a task with an `action` of `review` this can be `incomplete`, `approved`, or `rejected`.
    string resolution_state?;
};

# Defines a lock on an item. This prevents the item from being moved, renamed, or otherwise changed by anyone other than the user who created the lock.  Set this to `null` to remove the lock.
public type FilesfileIdLock record {
    # The type of this object.
    string access?;
    # Defines the time at which the lock expires.
    string expires_at?;
    # Defines if the file can be downloaded while it is locked.
    boolean is_download_prevented?;
};

public type Body22 record {
    # The task to assign to a user.
    TaskAssignmentsTask task;
    # The user to assign the task to.
    TaskAssignmentsAssignTo assign_to;
};

# The terms of service that must be accepted before the collaboration can be accepted.
public type CollaborationAcceptanceRequirementsStatus record {
    CollaborationAcceptanceRequirementsStatusTermsOfServiceRequirement terms_of_service_requirement?;
    CollaborationAcceptanceRequirementsStatusStrongPasswordRequirement strong_password_requirement?;
    CollaborationAcceptanceRequirementsStatusTwoFactorAuthenticationRequirement two_factor_authentication_requirement?;
};

public type Body21 record {
    # The action the task assignee will be prompted to do. Must be  * `review` defines an approval task that can be approved or rejected * `complete` defines a general task which can be completed
    string action?;
    # The message included with the task.
    string message?;
    # When the task is due at.
    string due_at?;
    # Defines which assignees need to complete this task before the task is considered completed.  * `all_assignees` (default) requires all assignees to review or approve the the task in order for it to be considered completed. * `any_assignee` accepts any one assignee to review or approve the the task in order for it to be considered completed.
    string completion_rule?;
};

# The Storage Policy object describes the storage zone.
#
public type StoragePolicy record {
    *StoragepolicyMini;
};

# A Box Skill metadata card that puts a status message in the metadata sidebar.
public type StatusSkillCard record {
    # The optional date and time this card was created at.
    string created_at?;
    # `skill_card`
    string 'type;
    # `status`
    string skill_card_type;
    # The title of the card.
    StatusskillcardSkillCardTitle skill_card_title?;
    # Sets the status of the skill. This can be used to show a message to the user while the Skill is processing the data, or if it was not able to process the file.
    StatusskillcardStatus status;
    # The service that applied this metadata.
    SkillcardSkill skill;
    # The invocation of this service, used to track which instance of a service applied the metadata.
    SkillcardInvocation invocation;
};

public type Body20 record {
    # The file to attach the task to.
    TasksItem item;
    # The action the task assignee will be prompted to do. Must be  * `review` defines an approval task that can be approved or rejected * `complete` defines a general task which can be completed
    string action?;
    # An optional message to include with the task.
    string message?;
    # Defines when the task is due. Defaults to `null` if not provided.
    string due_at?;
    # Defines which assignees need to complete this task before the task is considered completed.  * `all_assignees` (default) requires all assignees to review or approve the the task in order for it to be considered completed. * `any_assignee` accepts any one assignee to review or approve the the task in order for it to be considered completed.
    string completion_rule?;
};

public type Body27 record {
    # The settings for the shared link to create on the folder.  Use an empty object (`{}`) to use the default settings for shared links.
    FoldersfolderIdaddSharedLinkSharedLink shared_link?;
};

public type Body26 record {
    # By setting this value to `null`, the shared link is removed from the file.
    record {} shared_link?;
};

# The order in which a pagination is ordered
public type DevicepinnersOrder record {
    # The field that is ordered by
    string 'by?;
    # The direction to order by, either ascending or descending
    string direction?;
};

# Web links are objects that point to URLs. These objects are also known as bookmarks within the Box web application.  Web link objects are treated similarly to file objects, they will also support most actions that apply to regular files.
#
public type WebLink record {
    *WeblinkMini;
};

public type Body25 record {
    # The settings for the shared link to update.
    FilesfileIdupdateSharedLinkSharedLink shared_link?;
};

public type Body24 record {
    # The settings for the shared link to create on the file.  Use an empty object (`{}`) to use the default settings for shared links.
    FilesfileIdaddSharedLinkSharedLink shared_link?;
};

# Legal Hold Policy information describes the basic characteristics of the Policy, such as name, description, and filter dates.
#
public type LegalHoldPolicy record {
    *LegalholdpolicyMini;
};

# Base representation of a comment.
public type CommentBase record {
    # The unique identifier for this comment.
    string id?;
    # `comment`
    string 'type?;
};

# The root-level record that is supposed to represent a single Terms of Service.
#
public type TermsOfService record {
    *TermsofserviceMini;
};

public type Body30 record {
    # The URL that this web link links to. Must start with `"http://"` or `"https://"`.
    string url;
    # The parent folder to create the web link within.
    WebLinksParent parent;
    # Name of the web link. Defaults to the URL if not set.
    string name?;
    # Description of the web link.
    string description?;
};

# A mini representation of a file version, used when nested under another resource.
#
public type FolderMini record {
    *FolderBase;
};

# The bare basic representation of a file, the minimal amount of fields returned when using the `fields` query parameter.
public type FileBase record {
    # The unique identifier that represent a file.  The ID for any file can be determined by visiting a file in the web application and copying the ID from the URL. For example, for the URL `https://*.app.box.com/files/123` the `file_id` is `123`.
    string id?;
    # The HTTP `etag` of this file. This can be used within some API endpoints in the `If-Match` and `If-None-Match` headers to only perform changes on the file if (no) changes have happened.
    string? etag?;
    # `file`
    string 'type?;
};

# A list of webhooks.
#
# The part of an API response that describes marker based pagination
public type Webhooks record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# A representation of a Box enterprise
public type Enterprise record {
    # The unique identifier for this enterprise.
    string id?;
    # `enterprise`
    string 'type?;
    # The name of the enterprise
    string name?;
};

public type Body1 record {
    # An optional new name for the file.
    string name?;
    # The parent for this item
    FilesfileIdParent parent?;
};

# The item to attach the comment to.
public type CommentsItem record {
    # The ID of the item
    string id;
    # The type of the item that this comment will be placed on.
    string 'type;
};

# The file to assign the cards to.
public type SkillInvocationsskillIdFile record {
    # `file`
    string 'type?;
    # The ID of the file
    string id?;
};

# The basic representation of an upload session chunk.
public type UploadpartMini record {
    # The unique ID of the chunk.
    string part_id?;
    # The offset of the chunk within the file in bytes. The lower bound of the position of the chunk within the file.
    int offset?;
    # The size of the chunk in bytes.
    int size?;
};

# A generic error
public type ClientError record {
    # `error`
    string 'type?;
    # The HTTP status of the response.
    int status?;
    # A Box-specific error code
    string code?;
    # A short message describing the error.
    string message?;
    # A free-form object that contains additional context about the error. The possible fields are defined on a per-endpoint basis.
    ClienterrorContextInfo context_info?;
    # A URL that links to more information about why this error occurred.
    string help_url?;
    # A unique identifier for this response, which can be used when contacting Box support.
    string request_id?;
};

# The title of the card.
public type SkillcardSkillCardTitle record {
    # An optional identifier for the title.
    string code?;
    # The actual title to show in the UI.
    string message;
};

# Legal Hold Assignments are used to assign Legal Hold Policies to Users, Folders, Files, or File Versions.  Creating a Legal Hold Assignment puts a hold on the File-Versions that belong to the Assignment's 'apply-to' entity.
#
public type LegalHoldPolicyAssignment record {
    *LegalholdpolicyassignmentBase;
};

public type Body19 record {
    # The item to attach the comment to.
    CollaborationsItem item;
    # The user or group to give access to the item.
    CollaborationsAccessibleBy accessible_by;
    # The level of access granted.
    string role;
    # Determines if the invited users can see the entire parent path to the associated folder. The user will not gain privileges in any parent folder and therefore can not see content the user is not collaborated on.  Be aware that this meaningfully increases the time required to load the invitee's **All Files** page. We recommend you limit the number of collaborations with `can_view_path` enabled to 1,000 per user.
    boolean can_view_path?;
    # Set the expiration date for the collaboration. At this date, the collaboration will be automatically removed from the item.  This feature will only work if the **Automatically remove invited collaborators: Allow folder owners to extend the expiry date** setting has been enabled in the **Enterprise Settings** of the **Admin Console**. When the setting is not enabled, collaborations can not have an expiry date and a value for this field will be result in an error.
    string expires_at?;
};

# A task allows for file-centric workflows within Box. Users can create tasks on files and assign them to other users for them to complete the tasks.
public type Task record {
    # The unique identifier for this task
    string id?;
    # `task`
    string 'type?;
    # A mini representation of a file, used when nested under another resource.
    FileMini item?;
    # When the task is due
    string due_at?;
    # The type of task the task assignee will be prompted to perform.
    string action?;
    # A message that will be included with the task
    string message?;
    # A list of task assignments
    TaskAssignments task_assignment_collection?;
    # Whether the task has been completed
    boolean is_completed?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # When the task object was created
    string created_at?;
    # Defines which assignees need to complete this task before the task is considered completed.  * `all_assignees` requires all assignees to review or approve the the task in order for it to be considered completed. * `any_assignee` accepts any one assignee to review or approve the the task in order for it to be considered completed.
    string completion_rule?;
};

public type Body18 record {
    # The level of access granted.
    string role;
    # <!--alex ignore reject--> Set the status of a `pending` collaboration invitation, effectively accepting, or rejecting the invite.
    string status?;
    # Update the expiration date for the collaboration. At this date, the collaboration will be automatically removed from the item.  This feature will only work if the **Automatically remove invited collaborators: Allow folder owners to extend the expiry date** setting has been enabled in the **Enterprise Settings** of the **Admin Console**. When the setting is not enabled, collaborations can not have an expiry date and a value for this field will be result in an error.  Additionally, a collaboration can only be given an expiration if it was created after the **Automatically remove invited collaborator** setting was enabled.
    string expires_at?;
    # Determines if the invited users can see the entire parent path to the associated folder. The user will not gain privileges in any parent folder and therefore can not see content the user is not collaborated on.  Be aware that this meaningfully increases the time required to load the invitee's **All Files** page. We recommend you limit the number of collaborations with `can_view_path` enabled to 1,000 per user.
    boolean can_view_path?;
};

public type Body17 record {
    # The text of the comment.  To mention a user, use the `tagged_message` parameter instead.
    string message;
    # The text of the comment, including `@[user_id:name]` somewhere in the message to mention another user, which will send them an email notification, letting them know they have been mentioned.  The `user_id` is the target user's ID, where the `name` can be any custom phrase. In the Box UI this name will link to the user's profile.  If you are not mentioning another user, use `message` instead.
    string tagged_message?;
    # The item to attach the comment to.
    CommentsItem item?;
};

# A recent item accessed by a user.
public type RecentItem record {
    # `recent_item`
    string 'type?;
    File|Folder|WebLink item?;
    # The most recent type of access the user performed on the item.
    string interaction_type?;
    # The time of the most recent interaction.
    string interacted_at?;
    # If the item was accessed through a shared link it will appear here, otherwise this will be null.
    string interaction_shared_link?;
};

public type Body12 record {
    # The name for the new folder.  There are some restrictions to the file name. Names containing non-printable ASCII characters, forward and backward slashes (`/`, `\`), as well as names with trailing spaces are prohibited.  Additionally, the names `.` and `..` are not allowed either.
    string name;
    # The parent folder to create the new folder within.
    FoldersParent parent;
    record {# When this parameter has been set, users can email files to the email address that has been automatically created for this folder.  To create an email address, set this property either when creating or updating the folder.  When set to `collaborators`, only emails from registered email addresses for collaborators will be accepted. This includes any email aliases a user might have registered.  When set to `open` it will accept emails from any email address.
        string access?;} folder_upload_email?;
    # Specifies whether a folder should be synced to a user's device or not. This is used by Box Sync (discontinued) and is not used by Box Drive.
    string sync_state?;
};

# The title of the card.
public type TimelineskillcardSkillCardTitle record {
    # An optional identifier for the title.
    string code?;
    # The actual title to show in the UI.
    string message;
};

# A skill card that contains a set of keywords
public type KeywordSkillCard record {
    # The optional date and time this card was created at.
    string created_at?;
    # `skill_card`
    string 'type;
    # `keyword`
    string skill_card_type;
    # The title of the card.
    KeywordskillcardSkillCardTitle skill_card_title?;
    # The service that applied this metadata.
    SkillcardSkill skill;
    # The invocation of this service, used to track which instance of a service applied the metadata.
    SkillcardInvocation invocation;
    # An list of entries in the metadata card.
    KeywordskillcardEntries[] entries;
};

public type Body11 record {
    # An optional new name for the folder.
    string name?;
    record {# The ID of parent item
        string id?;} parent?;
};

# The additional attributes of the file being uploaded. Mainly the name and the parent folder. These attributes are part of the multi part request body and are in JSON format.  <Message warning>    The `attributes` part of the body must come **before** the   `file` part. Requests that do not follow this format when   uploading the file will receive a HTTP `400` error with a   `metadata_after_file_contents` error code.  </Message>
public type FilescontentAttributes record {
    # The name of the file
    string name;
    # The parent folder to upload the file to
    FilescontentAttributesParent parent;
    # Defines the time the file was originally created at.  If not set, the upload time will be used.
    string content_created_at?;
    # Defines the time the file was last modified at.  If not set, the upload time will be used.
    string content_modified_at?;
};

public type Body10 record {
    # The optional new name for this folder.
    string name?;
    # The optional description of this folder
    string description?;
    # Specifies whether a folder should be synced to a user's device or not. This is used by Box Sync (discontinued) and is not used by Box Drive.
    string sync_state?;
    # Specifies if users who are not the owner of the folder can invite new collaborators to the folder.
    boolean can_non_owners_invite?;
    # The parent folder for this folder. Use this to move the folder or to restore it out of the trash.
    FoldersfolderIdParent parent?;
    record {# The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the folder (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
        string access?; # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
        string password?; # Defines a custom vanity name to use in the shared link URL, for example `https://app.box.com/v/my-shared-link`.  Custom URLs should not be used when sharing sensitive content as vanity URLs are a lot easier to guess than regular shared links.
        string vanity_name?; # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts.
        string unshared_at?; # The permissions on shared link.
        record  { # If the shared link allows for downloading of files. This can only be set when `access` is set to `open` or `company`.
            boolean can_download?;}  permissions?;} shared_link?;
    record {# When this parameter has been set, users can email files to the email address that has been automatically created for this folder.  To create an email address, set this property either when creating or updating the folder.  When set to `collaborators`, only emails from registered email addresses for collaborators will be accepted. This includes any email aliases a user might have registered.  When set to `open` it will accept emails from any email address.
        string access?;} folder_upload_email?;
    # The tags for this item. These tags are shown in the Box web app and mobile apps next to an item.  To add or remove a tag, retrieve the item's current tags, modify them, and then update this field.  There is a limit of 100 tags per item, and 10,000 unique tags per enterprise.
    string[] tags?;
    # Specifies if new invites to this folder are restricted to users within the enterprise. This does not affect existing collaborations.
    boolean is_collaboration_restricted_to_enterprise?;
    # An array of collections to make this folder a member of. Currently we only support the `favorites` collection.  To get the ID for a collection, use the [List all collections][1] endpoint.  Passing an empty array `[]` or `null` will remove the folder from all collections.  [1]: ../advanced-files-and-folders/#get-collections
    Reference[] collections?;
    # Restricts collaborators who are not the owner of this folder from viewing other collaborations on this folder.  It also restricts non-owners from inviting new collaborators.  When setting this field to `false`, it is required to also set `can_non_owners_invite_collaborators` to `false` if it has not already been set.
    boolean can_non_owners_view_collaborators?;
};

# A representation of a Box enterprise
public type CollaborationAllowlistEnterprise record {
    # The unique identifier for this enterprise.
    string id?;
    # `enterprise`
    string 'type?;
    # The name of the enterprise
    string name?;
};

# An alternate notification email address to which email notifications are sent. When it's confirmed, this will be the email address to which notifications are sent instead of to the primary email address.
public type UserNotificationEmail record {
    # The email address to send the notifications to.
    string email?;
    # Specifies if this email address has been confirmed.
    boolean is_confirmed?;
};

public type Body16 record {
    # The text of the comment to update
    string message?;
};

# The user to assign the task to.
public type TaskAssignmentsAssignTo record {
    # The ID of the user to assign to the task.  To specify a user by their email address use the `login` parameter.
    string id?;
    # The email address of the user to assign to the task. To specify a user by their user ID please use the `id` parameter.
    string login?;
};

public type Body15 record {
    # The operations to lock for the folder. If `locked_operations` is included in the request, both `move` and `delete` must also be included and both set to `true`.
    FolderLocksLockedOperations locked_operations?;
    # The folder to apply the lock to.
    FolderLocksFolder folder;
};

public type Body14 record {
    # The watermark to imprint on the folder
    FoldersfolderIdwatermarkWatermark watermark;
};

public type Body13 record {
    # An optional new name for the copied folder.  There are some restrictions to the file name. Names containing non-printable ASCII characters, forward and backward slashes (`/`, `\`), as well as names with trailing spaces are prohibited.  Additionally, the names `.` and `..` are not allowed either.
    string name?;
    # The destination folder to copy the folder to.
    FoldersfolderIdcopyParent parent;
};

# A request to create a `zip` archive to download
public type ZipDownloadRequest record {
    # A list of items to add to the `zip` archive. These can be folders or files.
    ZipdownloadrequestItems[] items;
    # The optional name of the `zip` archive. This name will be appended by the `.zip` file extension, for example `January Financials.zip`.
    string download_file_name?;
};

# A list of group memberships.
#
# The part of an API response that describes pagination
public type GroupMemberships record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# A token that can be used to make authenticated API calls.
public type AccessToken record {
    # The requested access token.
    string access_token?;
    # The time in seconds in seconds by which this token will expire.
    int expires_in?;
    # The type of access token returned.
    string token_type?;
    # The permissions that this access token permits, providing a list of resources (files, folders, etc) and the scopes permitted for each of those resources.
    FileScope[] restricted_to?;
    # The refresh token for this access token, which can be used to request a new access token when the current one expires.
    string refresh_token?;
    # The type of downscoped access token returned. This is only returned if an access token has been downscoped.
    string issued_token_type?;
};

# A list of files, folders, and web links in their mini representation.
#
# The part of an API response that describes pagination
public type Items record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# The user that is exempt from any of the restrictions imposed by the list of allowed collaboration domains for this enterprise.
public type CollaborationAllowlistExemptTarget record {
    # The unique identifier for this exemption
    string id?;
    # `collaboration_whitelist`
    string 'type?;
    # A representation of a Box enterprise
    CollaborationAllowlistEnterprise enterprise?;
    # A representation of a Box enterprise
    CollaborationAllowlistUser user?;
    # The time the entry was created
    string created_at?;
    # The time the entry was modified
    string modified_at?;
};

# A list of file version retentions.
#
# The part of an API response that describes marker based pagination
public type FileVersionRetentions record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The permissions on shared link.
public type FilesfileIdaddSharedLinkSharedLinkPermissions record {
    # If the shared link allows for downloading of files. This can only be set when `access` is set to `open` or `company`.
    boolean can_download?;
};

# The settings for the shared link to create on the folder.  Use an empty object (`{}`) to use the default settings for shared links.
public type FoldersfolderIdaddSharedLinkSharedLink record {
    # The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the folder (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
    string access?;
    # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
    string password?;
    # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts. The value must be greater than the current date and time.
    string unshared_at?;
    # The permissions on shared link.
    FoldersfolderIdaddSharedLinkSharedLinkPermissions permissions?;
};

# The service that applied this metadata.
public type TranscriptskillcardSkill record {
    # `service`
    string 'type;
    # A custom identifier that represent the service that applied this metadata.
    string id;
};

# A list of tasks
public type Tasks record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.
    int total_count?;
    # Tasks on files which other users can to complete for a user.
    Task[] entries?;
};

# A list of recent items.
#
# The part of an API response that describes marker based pagination
public type RecentItems record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The service that applied this metadata.
public type SkillcardSkill record {
    # `service`
    string 'type;
    # A custom identifier that represent the service that applied this metadata.
    string id;
};

# Comments are messages created on files. Comments can be made independently or created as responses to other comments
#
public type CommentFull record {
    *Comment;
};

# Folder locks define access restrictions placed by folder owners to prevent specific folders from being moved or deleted.
public type FolderLock record {
    # A mini representation of a file version, used when nested under another resource.
    FolderMini folder?;
    # The unique identifier for this folder lock.
    string id?;
    # The object type, always `folder_lock`.
    string 'type?;
    # A mini representation of a user, used when nested within another resource.
    UserBase created_by?;
    # When the folder lock object was created.
    string created_at?;
    # The operations that have been locked. Currently the `move` and `delete` operations cannot be locked separately, and both need to be set to `true`. 
    FolderlockLockedOperations locked_operations?;
    # The lock type, always `freeze`.
    string lock_type?;
};

# An single item that's placed on multiple items on the timeline.
public type TimelineskillcardEntries record {
    # The text of the entry. This would be the display name for an item being placed on the timeline, for example the name of the person who was detected in a video.
    string text?;
    # Defines a list of timestamps for when this item should appear on the timeline.
    TimelineskillcardAppears[] appears?;
    # The image to show on a for an entry that appears on a timeline. This image URL is required for every entry.  The image will be shown in a list of items (for example faces), and clicking the image will show the user where that entry appears during the duration of this entry.
    string image_url?;
};

# The request body to copy a file request.
#
public type FileRequestCopyRequest record {
    *FileRequestUpdateRequest;
};

# The user to exempt.
public type CollaborationWhitelistExemptTargetsUser record {
    # The ID of the user to exempt.
    string id;
};

# Used with a card of type `status` to set the status of the skill. This can be used to show a message to the user while the Skill is processing the data.
public type SkillcardStatus record {
    # A code for the status of this Skill invocation. By default each of these will have their own accompanied messages. These can be adjusted by setting the `message` value on this object.
    string code;
    # A custom message that can be provided with this status. This will be shown in the web app to the end user.
    string message?;
};

# A list of file version legal holds.
#
# The part of an API response that describes marker based pagination
public type FileVersionLegalHolds record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# Defines a shared link for an item. Set this to `null` to remove the shared link.
public type FilesfileIdSharedLink record {
    # The level of access for the shared link. This can be restricted to anyone with the link (`open`), only people within the company (`company`) and only those who have been invited to the folder (`collaborators`).  If not set, this field defaults to the access level specified by the enterprise admin. To create a shared link with this default setting pass the `shared_link` object with no `access` field, for example `{ "shared_link": {} }`.  The `company` access level is only available to paid accounts.
    string access?;
    # The password required to access the shared link. Set the password to `null` to remove it.  A password can only be set when `access` is set to `open`.
    string password?;
    # Defines a custom vanity name to use in the shared link URL, for example `https://app.box.com/v/my-shared-link`.  Custom URLs should not be used when sharing sensitive content as vanity URLs are a lot easier to guess than regular shared links.
    string vanity_name?;
    # The timestamp at which this shared link will expire. This field can only be set by users with paid accounts.
    string unshared_at?;
    # The permissions for the shared link.
    FilesfileIdSharedLinkPermissions permissions?;
};

# The folder to associate the new file request to.
public type FilerequestcopyrequestFolder record {
    # `folder`
    string 'type?;
    # The ID of the folder to associate the new file request to.
    string id;
};

# A list of file versions
#
# The part of an API response that describes pagination
public type FileVersions record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# A list of legal hold policies.
#
# The part of an API response that describes marker based pagination
public type LegalHoldPolicies record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# A full representation of a file, as can be returned from any file API endpoints by default
#
public type FileFull record {
    *File;
};

# A collection of items, including files and folders.  Currently, the only collection available is the `favorites` collection.  The contents of a collection can be explored in a similar way to which the contents of a folder is explored.
public type Collection record {
    # The unique identifier for this collection.
    string id?;
    # `collection`
    string 'type?;
    # The name of the collection.
    string name?;
    # The type of the collection. This is used to determine the proper visual treatment for collections.
    string collection_type?;
};

# A standard representation of a file, as returned from any file API endpoints by default
#
public type File record {
    *FileMini;
};

# Represents a successful request to create a `zip` archive of a list of files and folders.
public type ZipDownload record {
    # The URL that can be used to download the `zip` archive. A `Get` request to this URL will start streaming the items requested. By default, this URL is only valid for a few seconds, until the `exires_at` time, unless a download is started after which it is valid for the duration of the download.  It is important to note that the domain and path of this URL might change between API calls, and therefore it's important to use this URL as-is.
    string download_url?;
    # The URL that can be used to get the status of the `zip` archive being downloaded. A `Get` request to this URL will return the number of files in the archive as well as the number of items already downloaded or skipped. By default, this URL is only valid for a few seconds, until the `exires_at` time, unless a download is started after which the URL is valid for 12 hours from the start of the download.  It is important to note that the domain and path of this URL might change between API calls, and therefore it's important to use this URL as-is.
    string status_url?;
    # The time and date when this archive will expire. After this time the `status_url` and `download_url` will return an error.  By default, these URLs are only valid for a few seconds, unless a download is started after which the `download_url` is valid for the duration of the download, and the `status_url` is valid for 12 hours from the start of the download.
    string expires_at?;
    # A list of conflicts that occurred when trying to create the archive. This would occur when multiple items have been requested with the same name.  To solve these conflicts, the API will automatically rename an item and return a mapping between the original item's name and its new name.  For every conflict, both files will be renamed and therefore this list will always be a multiple of 2.
    NameConflict[] name_conflicts?;
};

# A standard representation of a user, as returned from any user API endpoints by default
#
public type User record {
    *UserMini;
};

# An alternate notification email address to which email notifications are sent. When it's confirmed, this will be the email address to which notifications are sent instead of to the primary email address.  Set this value to `null` to remove the notification email.
public type UsersuserIdNotificationEmail record {
    # The email address to send the notifications to.
    string email?;
};

# The invocation of this service, used to track which instance of a service applied the metadata.
public type TranscriptskillcardInvocation record {
    # `skill_invocation`
    string 'type;
    # A custom identifier that represent the instance of the service that applied this metadata. For example, if your `image-recognition-service` runs on multiple nodes, this field can be used to identify the ID of the node that was used to apply the metadata.
    string id;
};

# The operations to lock for the folder. If `locked_operations` is included in the request, both `move` and `delete` must also be included and both set to `true`.
public type FolderLocksLockedOperations record {
    # Whether moving the folder should be locked.
    boolean move;
    # Whether deleting the folder should be locked.
    boolean delete;
};

# A retention policy blocks permanent deletion of content for a specified amount of time. Admins can apply policies to specified folders, or an entire enterprise. A file version retention is a  record for a retained file version. To use this feature, you must  have the manage retention policies scope enabled for your API key via  your application management console. For more information about retention policies, please visit our help documentation
public type FileVersionRetention record {
    # The unique identifier for this file version retention.
    string id?;
    # `file_version_retention`
    string 'type?;
    # A mini representation of a file version, used when nested within another resource.
    FileversionMini file_version?;
    # A mini representation of a file, used when nested under another resource.
    FileMini file?;
    # When this file version retention object was created
    string applied_at?;
    # When the retention expires on this file version retention
    string disposition_at?;
    # A mini representation of a retention policy, used when nested within another resource.
    RetentionpolicyMini winning_retention_policy?;
};

# An individual conflict that occurred when trying to create the archive. This includes an array of 2 objects, each containing the original name and the renamed filename of a file or folder for which the names conflicted.
#
# + NameconflictInner - An individual conflict that occurred when trying to create the archive. This includes an array of 2 objects, each containing the original name and the renamed filename of a file or folder for which the names conflicted.
public type NameConflict NameconflictInner[];

# The bare basic representation of a file version, the minimal amount of fields returned when using the `fields` query parameter.
public type RetentionpolicyBase record {
    # The unique identifier that represent a file version.
    string id?;
    # `retention_policy`
    string 'type?;
};

# An upload session for chunk uploading a file.
public type UploadSession record {
    # The unique identifier for this session
    string id?;
    # `upload_session`
    string 'type?;
    # The date and time when this session expires.
    string session_expires_at?;
    # The  size in bytes that must be used for all parts of of the upload.  Only the last part is allowed to be of a smaller size.
    int part_size?;
    # The total number of parts expected in this upload session, as determined by the file size and part size.
    int total_parts?;
    # The number of parts that have been uploaded and processed by the server. This starts at `0`.  When committing a file files, inspecting this property can provide insight if all parts have been uploaded correctly.
    int num_parts_processed?;
    # Session endpoints.
    SessionEndpoint session_endpoints?;
};

# The parent folder to upload the file to
public type FilescontentAttributesParent record {
    # The id of the parent folder. Use `0` for the user's root folder.
    string id;
};

# The metadata template field that represents the available classifications.
public type ClassificationtemplateFields record {
    # The unique ID of the field.
    string id?;
    # `enum`
    string 'type?;
    # `Box__Security__Classification__Key`
    string 'key?;
    # `Classification`
    string displayName?;
    # Classifications are always visible to web and mobile users.
    boolean hidden?;
    # A list of classifications available in this enterprise.
    ClassificationtemplateOptions[] options?;
};

public type Body record {
    # An optional different name for the file. This can be used to rename the file.
    string name?;
    # The description for a file. This can be seen in the right-hand sidebar panel when viewing a file in the Box web app. Additionally, this index is used in the search index of the file, allowing users to find the file by the content in the description.
    string description?;
    # The parent for this item
    FilesfileIdParent parent?;
    # Defines a shared link for an item. Set this to `null` to remove the shared link.
    FilesfileIdSharedLink shared_link?;
    # Defines a lock on an item. This prevents the item from being moved, renamed, or otherwise changed by anyone other than the user who created the lock.  Set this to `null` to remove the lock.
    FilesfileIdLock 'lock?;
    # Defines who can download a file.
    FilesfileIdPermissions permissions?;
    # The tags for this item. These tags are shown in the Box web app and mobile apps next to an item.  To add or remove a tag, retrieve the item's current tags, modify them, and then update this field.  There is a limit of 100 tags per item, and 10,000 unique tags per enterprise.
    string[] tags?;
};

# Standard representation of a comment.
#
public type Comment record {
    *CommentBase;
};

# The parent for this item
public type FilesfileIdParent record {
    # The ID of parent item
    string id?;
};

# A list of comments
#
# The part of an API response that describes pagination
public type Comments record {
    # One greater than the offset of the last entry in the entire collection. The total number of entries in the collection may be less than `total_count`.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int total_count?;
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The 0-based offset of the first entry in this set. This will be the same as the `offset` query parameter.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    int offset?;
    # The order by which items are returned.  This field is only returned for calls that use offset-based pagination. For marker-based paginated APIs, this field will be omitted.
    CollaborationsOrder[] 'order?;
};

# The representation of an upload session chunk.
#
public type UploadPart record {
    *UploadpartMini;
};

# The root-level record that is supposed to represent a single Terms of Service.
public type TermsofserviceMini record {
    # The unique identifier for this terms of service.
    string id?;
    # `terms_of_service`
    string 'type?;
};

# The permissions for the shared link.
public type FilesfileIdSharedLinkPermissions record {
    # If the shared link allows for downloading of files. This can only be set when `access` is set to `open` or `company`.
    boolean can_download?;
};

# A mini representation of a file, used when nested under another resource.
#
public type FileMini record {
    *FileBase;
};

# Legal Hold Assignments are used to assign Legal Hold Policies to Users, Folders, Files, or File Versions.  Creating a Legal Hold Assignment puts a hold on the File-Versions that belong to the Assignment's 'apply-to' entity.
public type LegalholdpolicyassignmentBase record {
    # The unique identifier for this legal hold assignment
    string id?;
    # `legal_hold_policy_assignment`
    string 'type?;
};

# The bare basic representation of a file version, the minimal amount of fields returned when using the `fields` query parameter.
public type FileversionBase record {
    # The unique identifier that represent a file version.
    string id?;
    # `file_version`
    string 'type?;
};

# A request to revoke an OAuth 2.0 token
public type PostOAuth2Revoke record {
    # The Client ID of the application requesting to revoke the access token.
    string client_id?;
    # The client secret of the application requesting to revoke an access token.
    string client_secret?;
    # The access token to revoke.
    string token?;
};

# An email alias for a user.
public type EmailAlias record {
    # The unique identifier for this object
    string id?;
    # Email alias type
    string 'type?;
    # The email address
    string email?;
    # Whether the email address has been confirmed
    boolean is_confirmed?;
};

# Collaborations define access permissions for users and groups to files and folders, similar to access control lists. A collaboration object grants a user or group access to a file or folder with permissions defined by a specific role.
public type Collaboration record {
    # The unique identifier for this collaboration.
    string id?;
    # `collaboration`
    string 'type?;
    File|Folder|WebLink item?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini accessible_by?;
    # The email address used to invite an unregistered collaborator, if they are not a registered user.
    string? invite_email?;
    # The level of access granted.
    string role?;
    # When the collaboration will expire, or `null` if no expiration date is set.
    string? expires_at?;
    # The status of the collaboration invitation.
    string status?;
    # When the `status` of the collaboration object changed to `accepted` or `rejected`
    string acknowledged_at?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini created_by?;
    # When the collaboration object was created
    string created_at?;
    # When the collaboration object was last modified
    string modified_at?;
    # The terms of service that must be accepted before the collaboration can be accepted.
    CollaborationAcceptanceRequirementsStatus acceptance_requirements_status?;
};

# An entry that describes an approved domain for which users can collaborate with files and folders in your enterprise or vice versa.
public type CollaborationAllowlistEntry record {
    # The unique identifier for this entry
    string id?;
    # `collaboration_whitelist_entry`
    string 'type?;
    # The whitelisted domain
    string domain?;
    # The direction of the collaborations to allow.
    string direction?;
    # A representation of a Box enterprise
    CollaborationAllowlistEnterprise enterprise?;
    # The time the entry was created at
    string created_at?;
};

# The parent folder to create the web link within.
public type WebLinksParent record {
    # The ID of parent folder
    string id;
};

# A list of users that is exempt from any of the restrictions imposed by the list of allowed collaboration domains for this enterprise.
#
# The part of an API response that describes marker based pagination
public type CollaborationAllowlistExemptTargets record {
    # The limit that was used for these entries. This will be the same as the `limit` query parameter unless that value exceeded the maximum value allowed. The maximum value varies by API.
    int 'limit?;
    # The marker for the start of the next page of results.
    int next_marker?;
    # The marker for the start of the previous page of results.
    int prev_marker?;
};

# The permissions on shared link.
public type FoldersfolderIdaddSharedLinkSharedLinkPermissions record {
    # If the shared link allows for downloading of folders. This can only be set when `access` is set to `open` or `company`.
    boolean can_download?;
};

# An invite for a user to an enterprise.
public type Invite record {
    # The unique identifier for this invite
    string id?;
    # `invite`
    string 'type?;
    # A representation of a Box enterprise
    Enterprise invited_to?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini actionable_by?;
    # A mini representation of a user, as can be returned when nested within other resources.
    UserMini invited_by?;
    # The status of the invite
    string status?;
    # When the invite was created
    string created_at?;
    # When the invite was modified.
    string modified_at?;
};

# A single of files, folder or web link that matched the search query, including the additional information about the shared link through which the item has been shared with the user.  This response format is only returned when the `include_recent_shared_links` query parameter has been set to `true`.
public type SearchResultWithSharedLink record {
    # The optional shared link through which the user has access to this item. This value is only returned for items for which the user has recently accessed the file through a shared link. For all other items this value will return `null`.
    string accessible_via_shared_link?;
    File|Folder|WebLink item?;
    # The result type. The value is always `search_result`.
    string 'type?;
};
