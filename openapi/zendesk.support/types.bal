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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type Organization record {
    # The API url of this organization
    string url?;
    # Automatically assigned id when the organization is created
    int id?;
    # A unique name for the organization
    string name?;
    # End users in this organization are able to see each other's tickets
    boolean shared_tickets?;
    # End users in this organization are able to see each other's comments on tickets
    boolean shared_comments?;
    # A unique external id to associate organizations to an external record
    string? external_id?;
    # The time the organization was created
    string created_at?;
    # The time the organization was updated
    string updated_at?;
    # An array of domain names associated with this organization
    string[] domain_names?;
    # Any details obout the organization, such as the address
    string? details?;
    # Any notes you have about the organization
    string? notes?;
    # New tickets from users in this organization are automatically put in this group
    int? group_id?;
    # The tags of the organization
    string[] tags?;
    # organization_fields
    record {} organization_fields?;
};

public type User record {
    # False if the user has been deleted
    boolean? active?;
    # An alias displayed to end users
    string? alias?;
    # Whether or not the user is a chat-only agent
    boolean? chat_only?;
    # The time the user was created
    string? created_at?;
    # A custom role if the user is an agent on the Enterprise plan or above
    int? custom_role_id?;
    # The id of the user's default group
    int? default_group_id?;
    # Any details you want to store about the user, such as an address
    string? details?;
    # The user's primary email address
    string? email?;
    # A unique identifier from another system. The API treats the id as case insensitive. Example - "ian1" and "Ian1" are the same user
    string? external_id?;
    # The time zone for the user
    string? iana_time_zone?;
    # Automatically assigned  id when the user is created
    int? id?;
    # The last time the user signed in to Zendesk Support
    string? last_login_at?;
    # The user's locale. A BCP-47 compliant tag for the locale. If both "locale" and "locale_id" are present on create or update, "locale_id" is ignored and only "locale" is used.
    string? locale?;
    # The user's language identifier
    int? locale_id?;
    # Designates whether the user has forum moderation capabilities
    boolean? moderator?;
    # The user's name
    string? name?;
    # Any notes you want to store about the user
    string? notes?;
    # true if the user can only create private comments
    boolean? only_private_comments?;
    # The id of the user's organization. If the user has more than one organization memberships, the id of the user's default organization
    int? organization_id?;
    # The user's primary phone number
    string? phone?;
    # Whether or not the user can access the CSV report on the Search tab of the Reporting page in the Support admin interface
    boolean? report_csv?;
    # If the agent has any restrictions; false for admins and unrestricted agents, true for other agents
    boolean restricted_agent?;
    # The user's role. Possible values are "end-user", "agent", or "admin"
    string? role?;
    # The user's role id. 0 for custom agents, 1 for light agent, 2 for chat agent, 3 for chat agent added to the Support account as a contributor (Chat Phase 4), and 5 for billing admins
    int? role_type?;
    # If the user is shared from a different Zendesk Support instance. Ticket sharing accounts only
    boolean? shared?;
    # If the user is a shared agent from a different Zendesk Support instance. Ticket sharing accounts only
    boolean? shared_agent?;
    # Whether the phone number is shared or not
    boolean? shared_phone_number?;
    # The user's signature. Only agents and admins can have signatures
    string? signature?;
    # If the agent is suspended. Tickets from suspended users are also suspended, and these users cannot sign in to the end user portal
    boolean? suspended?;
    # Specifies which tickets the user has access to. Possible values are - "organization", "groups", "assigned", "requested", null
    string? ticket_restriction?;
    # The user's time zone
    string? time_zone?;
    # If two factor authentication is enabled
    boolean? two_factor_auth_enabled?;
    # The time the user was last updated
    string? updated_at?;
    # The user's API url
    string? url?;
    # Any of the user's identities is verified
    boolean? verified?;
};

# The information for create ticket request
public type TicketInfoUpdate record {
    TicketInfoUpdate_ticket ticket?;
};

# The information for create user request
public type CreateUserInfo record {
    # The user information to create
    UserInfo user?;
};

# Agent or end users email CCs to add or delete from the ticket
public type EmailCC record {
    string user_id?;
    string action?;
    string user_email?;
    string user_name?;
};

# The user information to create
public type UserInfo record {
    # A custom role if the user is an agent on the Enterprise plan or above
    string custom_role_id?;
    # The user's primary email address
    string email?;
    # The user's name
    string name?;
    # The organization information to create
    OrganizationInfo organization?;
    # The user's role. Possible values are "end-user", "agent", or "admin"
    string role?;
};

public type Users record {
    Users_users[] users?;
    # next_page
    int? next_page?;
    # previous_page
    int? previous_page?;
    # count
    int count?;
};

# The information for create ticket request
public type CreateTicketInfo record {
    # The ticket information to create
    TicketInfo ticket?;
};

# More information about the source of the ticket
public type Source record {
    string rel?;
    SourceDetail 'from?;
    SourceDetail to?;
};

public type Users_users record {
    # id
    int id?;
    # url
    string url?;
    # name
    string name?;
    # email
    string email?;
};

# Ticket comments represent the conversation between requesters, collaborators, and agents
public type TicketResponse record {
    Ticket ticket?;
};

public type Tickets record {
    Ticket[] tickets?;
    # next_page
    int? next_page?;
    # previous_page
    int? previous_page?;
    # count
    int count?;
};

# The information for create organization request
public type CreateOrganizationInfo record {
    # The organization information to create
    OrganizationInfo organization?;
};

# The organization information to create
public type OrganizationInfo record {
    # organization name
    string name?;
};

# Ticket comments represent the conversation between requesters, collaborators, and agents
public type Comment record {
    # author_id
    int author_id?;
    # body
    string body?;
    # html_body
    string html_body?;
    # public
    boolean 'public?;
};

public type Ticket record {
    # Permission for agents to add add attachments to a comment. Defaults to true
    boolean? allow_attachments?;
    # Is false if channelback is disabled, true otherwise. Only applicable for channels framework ticket
    boolean? allow_channelback?;
    # The agent currently assigned to the ticket
    int? assignee_id?;
    # Enterprise only. The id of the brand this ticket is associated with
    int? brand_id?;
    # When this ticket record was created
    string? created_at?;
    # Read-only first comment on the ticket. When creating a ticket, use comment to set the description
    string? description?;
    # If this is a ticket of type "task" it has a due date. Due date format uses ISO 8601 format
    string? due_at?;
    # An id you can use to link Zendesk Support tickets to local records
    string? external_id?;
    # The topic in the Zendesk Web portal this ticket originated from, if any. The Web portal is deprecated
    int? forum_topic_id?;
    # The group this ticket is assigned to
    int? group_id?;
    # Is true if a ticket is a problem type and has one or more incidents linked to it. Otherwise, the value is false.
    boolean? has_incidents?;
    # Automatically assigned when the ticket is created
    int? id?;
    # Is true if any comments are public, false otherwise
    boolean? is_public?;
    # The organization of the requester. You can only specify the ID of an organization associated with the requester
    int? organization_id?;
    # The urgency with which the ticket should be addressed. Allowed values are "urgent", "high", "normal", or "low"
    string? priority?;
    # For tickets of type "incident", the ID of the problem the incident is linked to
    int? problem_id?;
    # The dynamic content placeholder, if present, or the "subject" value
    string? raw_subject?;
    # The original recipient e-mail address of the ticket
    string? recipient?;
    # The user who requested this ticket
    int? requester_id?;
    # The state of the ticket. Allowed values are "new", "open", "pending", "hold", "solved", or "closed"The state of the ticket. Allowed values are "new", "open", "pending", "hold", "solved", or "closed".
    string? status?;
    # The value of the subject field for this ticket
    string? subject?;
    # The user who submitted the ticket. The submitter always becomes the author of the first comment on the ticket
    int? submitter_id?;
    # Enterprise only. The id of the ticket form to render for the ticket
    int ticket_form_id?;
    # The type of this ticket. Allowed values are "problem", "incident", "question", or "task"	The type of this ticket. Allowed values are "problem", "incident", "question", or "task".
    string? 'type?;
    # When this record last got updated
    string? updated_at?;
    # The API url of this ticket
    string? url?;
    # The id of a closed ticket when creating a follow-up ticket
    int? via_followup_source_id?;
};

# The ticket information to create
public type TicketInfo record {
    # The email address of the agent to assign the ticket to
    string assignee_email?;
    # The agent currently assigned to the ticket
    int assignee_id?;
    # An array of the IDs of attribute values to be associated with the ticket
    int[] attribute_value_ids?;
    # The ids of users currently CC'ed on the ticket
    int[] collaborator_ids?;
    # Custom fields for the ticket
    CustomField[] custom_fields?;
    # The custom ticket status id of the ticket
    int custom_status_id?;
    # If this is a ticket of type "task" it has a due date. Due date format uses ISO 8601 format.
    string due_at?;
    # An array of objects that represent agent or end users email CCs to add or delete from the ticket
    EmailCC[] email_ccs?;
    # An id you can use to link Zendesk Support tickets to local records
    string external_id?;
    # An array of objects that represent agent followers to add or delete from the ticket
    Follower[] followers?;
    # The group this ticket is assigned to
    int group_id?;
    # The organization of the requester. You can only specify the ID of an organization associated with the requester.
    int organization_id?;
    # Priority of ticket. Allowed values are "urgent", "high", "normal", or "low".
    string priority?;
    # For tickets of type "incident", the ID of the problem the incident is linked to
    int problem_id?;
    # The user who requested this ticket
    int requester_id?;
    # Optional boolean. When true and an update_stamp date is included, protects against ticket update collisions and returns a message to let you know if one occurs.
    boolean safe_update?;
    # The ids of the sharing agreements used for this ticket
    int[] sharing_agreement_ids?;
    # The state of the ticket. Allowed values are "new", "open", "pending", "hold", "solved", or "closed".
    string status?;
    # The value of the subject field for this ticket
    string subject?;
    # The array of tags applied to this ticket
    string[] tags?;
    # The type of this ticket. Allowed values are "problem", "incident", "question", or "task".
    string 'type?;
    # Datetime of last update received from API. See the safe_update property
    string updated_stamp?;
    # Enterprise only. The id of the brand this ticket is associated with
    int brand_id?;
    # Users to add as cc's when creating a ticket.
    (string|int|Collaborator)[] collaborators?;
    # The ids of agents or end users currently CC'ed on the ticket.
    int[] email_cc_ids?;
    # The ids of agents currently following the ticket.
    int[] follower_ids?;
    # List of macro IDs to be recorded in the ticket audit
    int[] macro_ids?;
    # The dynamic content placeholder, if present, or the "subject" value
    string raw_subject?;
    # The original recipient e-mail address of the ticket
    string recipient?;
    # The user who submitted the ticket
    int submitter_id?;
    # Enterprise only. The id of the ticket form to render for the ticket
    int ticket_form_id?;
    # How or why an action or event was created
    Via via?;
    # The id of a closed ticket when creating a follow-up ticket
    int via_followup_source_id?;
    # Ticket comments represent the conversation between requesters, collaborators, and agents
    Comment comment?;
};

# The information for create ticket request
public type UpdateTicketInfo record {
    # The information for create ticket request
    TicketInfoUpdate ticket?;
};

# Agent followers to add or delete from the ticket
public type Follower record {
    string user_id?;
    string action?;
    string user_email?;
    string user_name?;
};

public type SourceDetail record {
    int id?;
    string title?;
};

# How or why an action or event was created
public type Via record {
    string|int channel?;
    # More information about the source of the ticket
    Source 'source?;
};

public type TicketInfoUpdate_ticket record {
    # subject
    string subject?;
    # Priority of ticket. Allowed values are "urgent", "high", "normal", or "low"
    string priority?;
    # Ticket comments represent the conversation between requesters, collaborators, and agents
    Comment comment?;
};

public type UserResponse record {
    User user?;
};

# Details of a collaborator
public type Collaborator record {
    string name?;
    string email?;
};

public type OrganizationResponse record {
    Organization organization?;
};

# Custom fields for the ticket
public type CustomField record {
    int id?;
    string value?;
};
