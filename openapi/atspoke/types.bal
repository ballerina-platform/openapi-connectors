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

public type RequesttypeinforesponseAnsweredfields record {
    string simpleValue?;
    RequesttypeinforesponseField 'field?;
};

# The content of the update
public type MessageContent record {
    # An object that holds various types of updates. Only the text type is supported via the public API. Attachments are not supported.
    MessagecontentMessage message?;
};

# Describes the actor that led to an update.
public type UpdateActor record {
    # Kind
    string kind?;
    # A team or user id
    string ref?;
};

# Third-party data associated with a configuration list
public type ConfigListItemExternalData record {
    # Integration id of the third party app this list or item is synced from
    string sourceIntegrationId?;
    # Unique id in the third-party system for this item
    string remoteId?;
    # Unique link for this item in the third-party system
    string remoteLink?;
    # Most recent timestamp when this list was synced with the third-party system
    string lastSyncedAt?;
};

public type RequestidMessagesBody record {
    # Describes the actor that led to an update.
    UpdateActor actor;
    # The content of the update
    MessageContent content;
};

# Team
public type CustomnavlistFiltersTeam record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# VisibleSegment object.
public type VisibleSegment record {
    # ID
    string id?;
    # Org
    string org;
    # Name
    string name?;
    # Teams
    SegmentTeamField[] teams?;
    # SegmentStringField
    SegmentStringField[] locations?;
    # Departments
    SegmentStringField[] departments?;
    # Created at
    string createdAt?;
    # Updated at
    string updatedAt?;
};

# Update object
public type Update record {
    # The content of the update
    MessageContent content?;
    # Describes the actor that led to an update.
    UpdateActor actor?;
};

public type RequestsrequestidtagsTags record {
    # a tag id
    string _id?;
};

public type RequesttypeinforesponseField record {
    string uuid?;
    string 'type?;
    string label?;
    RequesttypeFormSelect 'select?;
    RequesttypeinforesponseFieldAssignmentrule assignmentRule?;
};

# The item created from the search proposal.
public type SearchProposalItem record {
    # Action
    string action?;
    # Item type
    string itemType?;
    # Ref
    string ref?;
};

# Request type form values.
public type RequestTypeInfo record {
    # Answered fields
    RequesttypeinfoAnsweredfields[] answeredFields?;
};

# Team settings
public type TeamSettings record {
    # Team delegation settings
    TeamDelegation delegation?;
    # Flags
    TeamsettingsFlags flags?;
};

# the template a RequestType uses to create a task. Copied onto the created TaskInstance at instantiation
public type TaskTemplate record {
    # UUID
    string uuid?;
    # Subject
    string subject?;
    # Assignment rule
    TasktemplateAssignmentrule assignmentRule?;
};

public type UsersUseridBody record {
    # New display name.
    string displayName?;
    # New phone number of the user.
    string phoneNumber?;
    # country of the users phone number.
    string countryId?;
    # New email of the user.
    string email?;
    # User profile object.
    Profile profile?;
};

# Task instances
public type TaskInstance record {
    # UUID
    string uuid;
    # Owner
    string owner?;
    # Status
    string status?;
    # Due date
    string dueDate?;
};

# A representation of a single task on a request
public type TaskInstanceResponse record {
    # UUID
    string uuid?;
    # Subject
    string subject;
    # the template a RequestType uses to create a task. Copied onto the created TaskInstance at instantiation
    TaskTemplate taskTemplate?;
    # Request type ID
    string requestTypeId?;
    # Is required
    boolean isRequired?;
    # Parent task UUIDs
    string parentTaskUUIDs?;
    # Is Approval
    boolean isApproval?;
    # Approval State
    string approvalState?;
    # Owner
    string owner?;
    # Due date
    string dueDate?;
    # Was manually reassigned
    boolean wasManuallyReassigned?;
    # Status
    string status?;
    # Timestamps
    string timestamps?;
};

# Request PATCH object.
public type RequestPatchBody record {
    # New requester user id
    string requester?;
    # New request owner user id
    string owner?;
    # New request subject
    string subject?;
    # Request statuses.
    RequestStatus status?;
    # New request type id
    record {} requestType?;
    # Request type form values.
    RequestTypeInfo requestTypeInfo?;
    # Task instances
    TaskInstance[] taskInstances?;
    # New privacy level
    string privacyLevel?;
    # New team id
    string team?;
};

# Resource object.
public type Resource record {
    # ID
    string id?;
    # Type
    string 'type?;
    # Author
    string author?;
    # Title
    string title?;
    # Body
    string body?;
    # File
    record {} file?;
    # Link
    record {} link?;
    # Keywords
    string[] keywords?;
    # Team
    string team?;
    # Org
    string org?;
    # Is deprecated
    boolean isDeprecated?;
    # Needs review
    boolean needsReview?;
    # Review status
    string reviewStatus?;
    # Created at
    string createdAt?;
    # Updated at
    string updatedAt?;
};

# Resource object.
public type ResourcePostBody record {
    # The type of the resource. atSpoke supports many types of resources but only text-based ones can be created via API.
    string 'type?;
    # The user id of the author of this resource.
    string author;
    # The title of this resource.
    string title;
    # The body of this resource.
    string body?;
    # The id of the team this resource should belong to.
    string team?;
};

# Webhook Subscription object.
public type WebhookSubscriptionPostBody record {
    # A description of the client software that created the webhook.
    string 'client;
    # The URL to which webhooks will be posted. Must be HTTPS
    string url;
    # An array of the topics to which to subscribe. If this is left empty, it will default to an empty array.
    # - request.created is fired when a request is created 
    # - resource.created is fired when a resource is created 
    # - request.updated is fired when a request is updated 
    #  - Change in request status
    #  - Change in associated requestType
    #  - Change in request tags
    #  - Change in form fields
    string[] topics?;
    # A description of this subscription in particular
    string description?;
    # if false, webhook will not actually be sent.
    boolean enabled?;
    # Authentication info for this webhook.
    WebhooksubscriptionpostbodyAuthentication authentication?;
};

public type RequesttypeFormFields record {
    string uuid?;
    string 'type?;
    string label?;
    RequesttypeFormSelect 'select?;
};

# Filters
public type CustomnavlistFilters record {
    # Status
    CustomnavlistFiltersStatus status?;
    # Team
    CustomnavlistFiltersTeam team?;
    # Request type
    CustomnavlistFiltersRequesttype requestType?;
    # Assignee
    CustomnavlistFiltersAssignee assignee?;
    # Requester
    CustomnavlistFiltersRequester requester?;
    # Follower
    CustomnavlistFiltersFollower follower?;
    # Task assignee
    CustomnavlistFiltersTaskassignee taskAssignee?;
    # Tag
    CustomnavlistFiltersTag tag?;
    # Query
    string query?;
};

# Bad request
public type BadRequest record {
    # atSpoke error code.
    int code?;
    # Error message.
    string message?;
};

# Flags
public type TeamsettingsFlags record {
    # whether this team should use auto delegation
    boolean AUTO_DELEGATION?;
};

# Team agent statuses.
public type TeamAgentStatus string;

# Third-party data associated with a configuration list
public type ConfigListExternalData record {
    # Integration id of the third party app this list or item is synced from
    string sourceIntegrationId?;
    # Most recent timestamp when this list was synced with the third-party system
    string lastSyncedAt?;
};

public type RequestidTagsBody record {
    # Tag ids to add
    RequestsrequestidtagsTags[] tags;
};

# Task assignee
public type CustomnavlistFiltersTaskassignee record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# Form
public type RequesttypeForm record {
    # Fields
    RequesttypeFormFields[] fields?;
};

# Request type object
public type RequestType record {
    # ID
    string id?;
    # Title
    string title;
    # Form
    RequesttypeForm form?;
    # Task template
    TaskTemplate[] taskTemplates?;
    # Status
    string status?;
    # Icon
    string icon?;
    # Team
    string team;
    # Description
    string description?;
    # Org
    string org;
    # Has form
    boolean hasForm?;
    # Created at
    string createdAt?;
    # Updated at
    string updatedAt?;
};

public type InlineResponse2009 record {
    ConfigList[] results?;
    # The total number of config lists.
    int total?;
    # The start offset for this set of lists.
    int 'start?;
    # The number of lists returned.
    int 'limit?;
};

# Manager
public type ProfileManager record {
    # Name
    string name?;
    # Email
    string email?;
};

public type InlineResponse2008 record {
    # current org id
    string org?;
    # user id
    string user?;
    # user name
    string displayName?;
    # user role
    string role?;
    # user status
    string status?;
};

# User object.
public type User record {
    # ID
    string id?;
    # Display name
    string displayName;
    # Email
    string email;
    # Is email verified
    boolean isEmailVerified?;
    # Is profile completed
    boolean isProfileCompleted?;
    # Status
    string status?;
    # User profile object.
    Profile profile?;
    # Memberships
    string[] memberships?;
    # Created at
    string createdAt?;
};

# Describes an agent in a team.
public type TeamAgent record {
    # User object.
    User user?;
    # Team agent statuses.
    TeamAgentStatus status?;
    # last request assigned at timestamp
    string lastAssignedAt?;
    # timestamp when this agent joined the team
    string joinedAt?;
    # Timestamps
    TeamagentTimestamps timestamps?;
    # Whether this agent is excluded from rotation
    boolean isExcluded?;
    # number of open requests assigned to this user on this team
    int numRequests?;
};

public type SubscriberlistInner record {
    # The user id of a user subscribed to this request
    string subscriber?;
    # whether this user has unsubscribed from this request
    boolean unsubscribed?;
    # why this user was subscribed
    string reason?;
};

# Payment required
public type PaymentRequired record {
    # atSpoke error code.
    int code?;
    # Error message.
    string message?;
};

# Timestamps
public type TeamagentTimestamps record {
    # when this agent became available most recently
    string lastAvailableAt?;
    # when this agent went away most recently
    string lastAwayAt?;
};

# Authentication info for this webhook.
public type WebhooksubscriptionpostbodyAuthentication record {
    # A secret that will be sent with every fired webhook. Use this to confirm that webhooks are coming from atSpoke.
    string clientSecret?;
};

# Forbidden
public type Forbidden record {
    # atSpoke error code.
    int code?;
    # Error message.
    string message?;
};

public type InlineResponse200 record {
    # The list of requests itself.
    Request[] results?;
    # The total number of requests.
    int total?;
    # The start offset for this set of requests.
    int 'start?;
    # The number of requests returned.
    int 'limit?;
};

# A custom nav list used to organize a user’s requests
public type CustomNavList record {
    # Name
    string name;
    # Slug
    string slug;
    # Filters
    CustomnavlistFilters filters?;
};

# Team delegation settings
public type TeamDelegation record {
    # Team delegation strategies.
    TeamDelegationStrategy strategy?;
    # user id, valid only for SPECIFIC_USER strategy
    string specificUser?;
    # user ids of excluded users, valid only for ROUND_ROBIN strategy
    string[] excludedUsers?;
};

# User profile object.
public type Profile record {
    # ID
    string id?;
    # Job title
    string jobTitle?;
    # Location
    string location?;
    # Department
    string department?;
    # Manager
    ProfileManager manager?;
    # Start date
    string startDate?;
};

# A single item in a configuration list
public type ConfigListItem record {
    # ID
    string id?;
    # Name
    string name?;
    # Status
    string status?;
    # Third-party data associated with a configuration list
    ConfigListItemExternalData externalData?;
};

public type RequesttypeinfoAnsweredfields record {
    string fieldId?;
    string value?;
};

# An object that holds various types of updates. Only the text type is supported via the public API. Attachments are not supported.
public type MessagecontentMessage record {
    # a plain text string of the message to be posted to the request
    string text?;
};

# Assignee
public type CustomnavlistFiltersAssignee record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# Requester
public type CustomnavlistFiltersRequester record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# Team delegation strategies.
public type TeamDelegationStrategy string;

# The item created from the search proposal.
public type SearchProposalPivot record {
    # Kind
    string kind?;
    # Ref
    string ref?;
};

# Webhook authentication mechanism
public type WebhooksubscriptionAuthentication record {
    # The type of authentication for this webhook.  Currently, client_secret is the default and only supported value. This means that a secret will be sent in the headers of each request (as the "Client-Secret" header).
    string 'type?;
    # The secret sent with each request. Set only if authentication.type is client_secret.
    string clientSecret?;
};

# Team object.
public type Team record {
    # ID
    string id?;
    # Name
    string name;
    # Slug
    string slug?;
    # Description
    string description?;
    # Keywords
    string[] keywords?;
    # Icon
    string icon?;
    # Color
    string color?;
    # Status
    string status?;
    # Goals
    record {} goals?;
    # Agent list
    record {}[] agentList?;
    # Created at
    string createdAt?;
    # Updated at
    string updatedAt?;
    # Owner
    string owner;
    # Org
    string org?;
    # Email
    string email?;
    # Permalink
    string permalink?;
    # Team settings
    TeamSettings settings?;
};

public type RequestsBody record {
    # Request subject.
    string subject;
    # a longer description of the request
    string body?;
    # user id of person who will be the requester
    string requester;
    # user id of the person the request will be assigned to. Will be automatically delegated if left blank
    string owner?;
    # ID of the team to assign the request to.
    string team?;
    # Privacy level for the request.
    string privacyLevel?;
    # ID of the request type form.
    string requestType?;
    # Request type form values.
    RequestTypeInfo requestTypeInfo?;
};

# Team PATCH object
public type TeamPatchBody record {
    # Team settings
    TeamSettings settings?;
};

# A team field in a VisibleSegment
public type SegmentTeamField record {
    # Operator
    string operator?;
    # Team object.
    Team value?;
};

# Tag
public type CustomnavlistFiltersTag record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# Request containing single task object.
public type RequestTask record {
    # ID
    string id?;
    # Subject
    string subject;
    # Permalink ID
    int permalinkId?;
    # Task instances
    TaskInstance taskInstances?;
    # Sort field
    string sortField?;
};

# Webhook Subscription object.
public type WebhookSubscription record {
    # The ID of the webhook subscription.
    string id?;
    # A description of the client software that created the webhook.
    string 'client?;
    # The subscriptions org.
    string org?;
    # The user who owns the subscription.
    string user?;
    # The URL to which webhooks will be posted.
    string url?;
    # Whether the webhook is enabled. If disabled, webhooks will not be sent, but one can always re-enable the subscription later.
    boolean enabled?;
    # An array of the topics to which to subscribe.
    string[] topics?;
    # A description of this subscription in particular
    string description?;
    # When the subscription was created
    string createdAt?;
    # Webhook authentication mechanism
    WebhooksubscriptionAuthentication authentication?;
};

# Status
public type CustomnavlistFiltersStatus record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

# Request object.
public type Request record {
    # ID
    string id?;
    # Requester
    string requester;
    # Owner
    string owner?;
    # Subject
    string subject;
    # Request statuses.
    RequestStatus status?;
    # Request type
    record {} requestType?;
    # Request type form answer values.
    RequestTypeInfoResponse requestTypeInfo?;
    # Privacy level
    string privacyLevel?;
    # Team
    string team?;
    # Org
    string org?;
    # Is auto resolved
    boolean isAutoResolved?;
    # is filed
    boolean isFiled?;
    # Email
    string email?;
    # Permalink
    string permalink?;
    # Created at
    string createdAt?;
    # Updated at
    string updatedAt?;
    # Resolve time
    int resolveTime?;
    # Team response time in ms
    int teamResponseTimeInMs?;
    # Last resolved at
    string lastResolvedAt?;
    # Tags
    string[] tags?;
    # Task instances
    TaskInstanceResponse[] taskInstances?;
};

# Request type
public type CustomnavlistFiltersRequesttype record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

public type RequesttypeFormSelect record {
    string[] choices?;
};

# Request type form answer values.
public type RequestTypeInfoResponse record {
    # Answered fields
    RequesttypeinforesponseAnsweredfields[] answeredFields?;
};

# A list of the subscribers on the request
public type SubscriberList SubscriberlistInner[];

# Body to bulk add labels
public type BulkAddLabelBody record {
    # A list of request ids to add a label to.
    string[] requests;
    # Label id to add to the requests.
    string label;
};

# A string field in a VisibleSegment
public type SegmentStringField record {
    # Operator
    string operator?;
    # Value
    string value?;
};

public type InlineResponse20010 record {
    WebhookSubscription[] results?;
};

# Assignment rule
public type TasktemplateAssignmentrule record {
    # Type
    string 'type?;
    # Team
    string team?;
    # User
    string user?;
};

public type RequestidMergeBody record {
    # Request ids to be merged into the request in the path parameter
    string[] requests;
};

public type RequesttypeinforesponseFieldAssignmentrule record {
    string 'type?;
    string team?;
    string user?;
};

public type InlineResponse2001 record {
    RequestTask[] results?;
    # The total number of tasks.
    int total?;
    # The start offset for this set of tasks.
    int 'start?;
    # The number of tasks returned.
    int 'limit?;
};

public type InlineResponse2003 record {
    RequestType[] results?;
    # The total number of the request types.
    int total?;
    # The start offset for this set of request types.
    int 'start?;
    # The number of request types returned.
    int 'limit?;
};

# Request tag.
public type Tag record {
    # ID
    string id?;
    # Color
    string color?;
    # Status
    string status?;
    # Text
    string text?;
    # Org
    string org?;
};

# A DB record for storing search recommendations.
public type SearchProposal record {
    # Query
    string query?;
    # Channel ID
    string channelId?;
    # User
    string user?;
    # Org
    string org?;
    # The item created from the search proposal.
    SearchProposalPivot pivot?;
    # Interaction ID
    string interactionId?;
    # Proposals
    SearchProposalItem[] proposals?;
};

public type InlineResponse2002 record {
    Request[] results?;
    # The total number of the requests.
    int total?;
    # The start offset for this set of requests.
    int 'start?;
    # The number of requests returned.
    int 'limit?;
};

# Follower
public type CustomnavlistFiltersFollower record {
    # Include no value
    boolean includeNoValue?;
    # Values
    string[] values?;
};

public type InlineResponse2005 record {
    Tag[] results?;
    # The total number of the tags.
    int total?;
    # The start offset for this set of tags.
    int 'start?;
    # The number of tags returned.
    int count?;
};

public type InlineResponse2004 record {
    Resource[] results?;
    # The total number of the resources.
    int total?;
    # The start offset for this set of resouces.
    int 'start?;
    # The number of resouces returned.
    int 'limit?;
    # Where to start next request for pagination.
    int newStart?;
};

# Configuration Item List
public type ConfigList record {
    # ID
    string id?;
    # Name
    string name?;
    # Status
    string status?;
    # Items
    ConfigListItem[] items?;
    # Third-party data associated with a configuration list
    ConfigListExternalData externalData?;
    # Org
    string org?;
};

public type InlineResponse2007 record {
    User[] results?;
    # The total number of the users.
    int total?;
    # The start offset for this set of users.
    int 'start?;
    # The number of users returned.
    int 'limit?;
};

# Request statuses.
public type RequestStatus string;

# Not Found
public type NotFound record {
    # atSpoke error code.
    int code?;
    # Error message.
    string message?;
};

public type RequestsBulkAddTagBody record {
    # the IDs of the requests to be updated, 24 characters, hexadecimal
    string[] requests;
    # ID of the tag to add to the requests.
    string tag;
};

public type InlineResponse2006 record {
    Team[] results?;
    # The total number of the teams.
    int total?;
    # The start offset for this set of teams.
    int 'start?;
    # The limit of teams returned.
    int 'limit?;
};
