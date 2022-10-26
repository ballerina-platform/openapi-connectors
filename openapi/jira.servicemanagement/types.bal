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
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://auth.atlassian.com/oauth/token";
|};

public type CustomerRequestActionsDTO record {
    # Action of adding attachments to a request.
    CustomerRequestActionDTO addAttachment?;
    # Action of adding comments to a request.
    CustomerRequestActionDTO addComment?;
    # Action of adding participants to a request.
    CustomerRequestActionDTO addParticipant?;
    # Action of removing participants from a request.
    CustomerRequestActionDTO removeParticipant?;
};

public type PagedDTOOrganizationDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    OrganizationDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type SelfLinkDTO record {
    string self?;
};

public type UsersOrganizationUpdateDTO record {
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. Use `accountIds` instead.
    string[] usernames?;
    # List of customers, specific by account IDs, to add to or remove from the organization.
    string[] accountIds?;
};

public type DateDTO record {
    # Date in ISO8601 format.
    string iso8601?;
    # Date in the format used in the Jira REST APIs, which is ISO8601 format but extended with milliseconds. For example, 2016-09-28T23:08:32.097+1000.
    string jira?;
    # Date in a user-friendly text format.
    string friendly?;
    # Date as the number of milliseconds that have elapsed since 00:00:00 Coordinated Universal Time (UTC), 1 January 1970.
    int epochMillis?;
};

public type PagedDTOUserDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    UserDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type SlaInformationDTO record {
    # ID of the Service Level Agreement (SLA).
    string id?;
    # Description of the SLA.
    string name?;
    # List of completed cycles for the SLA.
    SlaInformationCompletedCycleDTO[] completedCycles?;
    # Details of the active cycle for the SLA.
    SlaInformationOngoingCycleDTO ongoingCycle?;
    # REST API URL for the SLA.
    SelfLinkDTO _links?;
};

public type Expandable record {
    string[] _expands?;
};

public type SlaInformationCompletedCycleDTO record {
    # Time and date at which the SLA cycle started.
    DateDTO startTime?;
    # Time and date at which the SLA cycle completed.
    DateDTO stopTime?;
    # Time and date at which the SLA cycle breached in case of completed breached cycle or would have breached in case of non-breached completed cycle.
    DateDTO breachTime?;
    # Indicates if the SLA (duration) was exceeded (true) or not (false).
    boolean breached?;
    # Duration within which the service should have been completed.
    DurationDTO goalDuration?;
    # Duration in which the service was completed.
    DurationDTO elapsedTime?;
    # Duration remaining after the service was completed.
    DurationDTO remainingTime?;
};

public type RequestTypeDTO record {
    # ID for the request type.
    string id?;
    # Short name for the request type.
    string name?;
    # Description of the request type.
    string description?;
    # Help text for the request type.
    string helpText?;
    # ID of the issue type the request type is based upon.
    string issueTypeId?;
    # ID of the service desk the request type belongs to.
    string serviceDeskId?;
    # List of the request type groups the request type belongs to.
    string[] groupIds?;
    # Links to the request type's icons.
    RequestTypeIconDTO icon?;
    # Fields and additional metadata for creating a request that uses the request type
    CustomerRequestCreateMetaDTO fields?;
    # The request type's practice
    string practice?;
    # List of items that can be expanded in the response by specifying the expand query parameter.
    string[] _expands?;
    # REST API URL for the request type.
    SelfLinkDTO _links?;
};

# Details of the operations that can be performed on the issue.
public type Operations record {
    # Details of the link groups defining issue operations.
    LinkGroup[] linkGroups?;
};

public type CustomerTransitionDTO record {
    # ID of the transition.
    string id?;
    # Name of the transition.
    string name?;
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

public type SoftwareInfoDTO record {
    # Jira Service Management version.
    string 'version?;
    # Jira Platform version upon which Service Desk is based.
    string platformVersion?;
    # Date of the current build.
    DateDTO buildDate?;
    # Reference of the change set included in the build.
    string buildChangeSet?;
    # Indicates whether the instance is licensed (true) or not (false).
    boolean isLicensedForUse?;
    # REST API URL of the instance.
    SelfLinkDTO _links?;
};

public type ApprovalDecisionRequestDTO record {
    # Response to the approval request.
    string decision?;
};

public type OrganizationDTO record {
    # A unique system generated ID for the organization.
    string id?;
    # Name of the organization.
    string name?;
    # REST API URL to the organization.
    SelfLinkDTO _links?;
};

public type PagedDTOSlaInformationDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    SlaInformationDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type RequestTypeCreateDTO record {
    # ID of the request type to add to the service desk.
    string issueTypeId?;
    # Name of the request type on the service desk.
    string name?;
    # Description of the request type on the service desk.
    string description?;
    # Help text for the request type on the service desk.
    string helpText?;
};

public type PagedDTOAttachmentDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    AttachmentDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type PagedLinkDTO record {
    # REST API URL for the current page.
    string self?;
    # Base URL for the REST API calls.
    string base?;
    string context?;
    # REST API URL for the next page, if there is one.
    string next?;
    # REST API URL for the previous page, if there is one.
    string prev?;
};

public type RequestTypeIconLinkDTO record {
    # URLs for the request type icons.
    record {} iconUrls?;
};

public type CustomerRequestLinkDTO record {
    string self?;
    # REST API URL for the request.
    string jiraRest?;
    # Web URL for the request.
    string web?;
    # Jira agent view URL for the request.
    string agent?;
};

public type CSATFeedbackFullDTO record {
    # Indicates the type of feedback, supported values: `csat`.
    string 'type?;
    # A numeric representation of the rating, this must be an integer value between 1 and 5.
    int rating?;
    # (Optional) The comment provided with this feedback.
    AdditionalCommentDTO comment?;
};

public type CustomerRequestStatusDTO record {
    # Name of the status condition.
    string status?;
    # Status category the status belongs to.
    string statusCategory?;
    # Date on which the status was attained.
    DateDTO statusDate?;
};

public type PagedDTOCommentDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    CommentDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type CustomerCreateDTO record {
    # Customer's email address.
    string email?;
    # Deprecated, please use 'displayName'.
    string fullName?;
    # Customer's name for display in the UI.
    string displayName?;
};

public type CommentDTO record {
    # ID of the comment.
    string id?;
    # Content of the comment.
    string body?;
    # The rendered body of the comment.
    RenderedValueDTO renderedBody?;
    # Details of the customer who authored the comment.
    UserDTO author?;
    # Date the comment was created.
    DateDTO created?;
    # List of the attachments included in the comment.
    PagedDTOAttachmentDTO attachments?;
    # List of items that can be expanded in the response by specifying the expand query parameter.
    string[] _expands?;
    # Indicates whether the comment is public (true) or private/internal (false).
    boolean 'public?;
    # REST API URL link to the comment.
    SelfLinkDTO _links?;
};

public type PagedDTOQueueDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    QueueDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type OrganizationServiceDeskUpdateDTO record {
    # List of organizations, specified by 'ID' field values, to add to or remove from the service desk.
    int organizationId;
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

# An entity property, for more information see [Entity properties](https://developer.atlassian.com/cloud/jira/platform/jira-entity-properties/).
public type EntityProperty record {
    # The key of the property. Required on create and update.
    string 'key?;
    # The value of the property. Required on create and update.
    anydata value?;
};

public type ContentDTO record {
    # Url containing the body of the article (without title), suitable for rendering in an iframe
    string iframeSrc?;
};

public type AttachmentDTO record {
    # Filename of the item attached.
    string filename?;
    # Details of the user who attached the file.
    UserDTO author?;
    # Date the attachment was added.
    DateDTO created?;
    # Size of the attachment in bytes.
    int size?;
    # MIME type of the attachment.
    string mimeType?;
    # Various URLs for the attachment.
    AttachmentLinkDTO _links?;
};

public type LinkableAttachmentLinkDTO record {
    AttachmentLinkDTO _links?;
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

public type AttachmentCreateDTO record {
    # List of IDs for the temporary attachments to be added to the customer request.
    string[] temporaryAttachmentIds?;
    # Comment about the attachments.
    AdditionalCommentDTO additionalComment?;
    # Indicates whether the attachments are to be public (true) or private/internal (false).
    boolean 'public?;
};

public type PagedDTORequestTypeGroupDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    RequestTypeGroupDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type PagedDTOCustomerRequestDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    CustomerRequestDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
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

public type ApprovalDTO record {
    # ID of the approval.
    string id?;
    # Description of the approval being sought or provided.
    string name?;
    # Outcome of the approval, based on the approvals provided by all approvers.
    string finalDecision?;
    # Indicates whether the user making the request is one of the approvers and can respond to the approval (true) or not (false).
    boolean canAnswerApproval?;
    # Detailed list of the users who must provide a response to the approval.
    ApproverDTO[] approvers?;
    # Date the approval was created.
    DateDTO createdDate?;
    # Date the approval was completed.
    DateDTO completedDate?;
    # The REST API URL of the approval.
    SelfLinkDTO _links?;
};

public type QueueDTO record {
    # ID for the queue.
    string id?;
    # Short name for the queue.
    string name?;
    # JQL query that filters reqeusts for the queue.
    string jql?;
    # Fields returned for each request in the queue.
    string[] fields?;
    # The count of customer requests in the queue.
    int issueCount?;
    # REST API URL to the queue.
    SelfLinkDTO _links?;
};

public type DurationDTO record {
    # Duration in milliseconds.
    int millis?;
    # Duration in a user-friendly text format.
    string friendly?;
};

public type ServiceDeskCustomerDTO record {
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. Use `accountIds` instead.
    string[] usernames?;
    # List of users, specified by account IDs, to add to or remove from a service desk.
    string[] accountIds?;
};

# Details about an issue.
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
    IncludedFields fieldsToInclude?;
    record {} fields?;
};

public type CustomerTransitionExecutionDTO record {
    # ID of the transition to be performed.
    string id?;
    # Comment explaining the reason for the transition.
    AdditionalCommentDTO additionalComment?;
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
    boolean looped?;
};

public type SlaInformationOngoingCycleDTO record {
    # Time and date at which the SLA cycle started.
    DateDTO startTime?;
    # Time and date at which the SLA cycle would have breached its limit.
    DateDTO breachTime?;
    # Indicates whether the SLA has been breached (true) or not (false).
    boolean breached?;
    # Indicates whether the SLA is paused (true) or not (false).
    boolean paused?;
    # Indicates whether the SLA it timed during calendared working hours only (true) or not (false).
    boolean withinCalendarHours?;
    # Duration within which the service should be completed.
    DurationDTO goalDuration?;
    # Duration of the service.
    DurationDTO elapsedTime?;
    # Duration remaining in which to complete the service.
    DurationDTO remainingTime?;
};

public type PagedDTOCustomerTransitionDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    CustomerTransitionDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type ErrorResponse record {
    string errorMessage?;
    I18nErrorMessage i18nErrorMessage?;
};

public type Linkable record {
    SelfLinkDTO _links?;
};

# Property key details.
public type PropertyKey record {
    # The URL of the property.
    string self?;
    # The key of the property.
    string 'key?;
};

public type IncludedFields record {
    string[] included?;
    string[] actuallyIncluded?;
    string[] excluded?;
};

public type CommentCreateDTO record {
    # Content of the comment.
    string body?;
    # Indicates whether the comment is public (true) or private/internal (false).
    boolean 'public?;
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

public type CustomerRequestFieldValueDTO record {
    # ID of the field.
    string fieldId?;
    # Text label for the field.
    string label?;
    # Value of the field.
    anydata value?;
    # Value of the field rendered in the UI.
    record {} renderedValue?;
};

public type UserDTO record {
    # The accountId of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
    string accountId?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string name?;
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
    string 'key?;
    # Customer's email address. Depending on the customer’s privacy settings, this may be returned as null.
    string emailAddress?;
    # Customer's name for display in a UI. Depending on the customer’s privacy settings, this may return an alternative value.
    string displayName?;
    # Indicates if the customer is active (true) or inactive (false)
    boolean active?;
    # Customer time zone. Depending on the customer’s privacy settings, this may be returned as null.
    string timeZone?;
    # URLs for the customer record and related items.
    UserLinkDTO _links?;
};

public type ArticleDTO record {
    # Title of the article.
    string title?;
    # Excerpt of the article which matches the given query string.
    string excerpt?;
    # Source of the article.
    SourceDTO 'source?;
    ContentDTO content?;
};

public type SourceDTO record {
    # Type of the knowledge base source
    string 'type?;
};

public type PagedDTOInsightWorkspaceDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    InsightWorkspaceDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
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
    @constraint:String {maxLength: 128}
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
    string id?;
    string styleClass?;
    string iconClass?;
    string label?;
    string title?;
    string href?;
    int weight?;
};

public type RenderedValueDTO record {
    string html?;
};

public type PagedDTOArticleDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    ArticleDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type PagedDTOIssueBean record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    IssueBean[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type PagedDTOCustomerRequestStatusDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    CustomerRequestStatusDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type OrganizationCreateDTO record {
    # Name of the organization.
    string name;
};

public type ServiceDeskDTO record {
    # ID of the service desk.
    string id?;
    # ID of the peer project for the service desk.
    string projectId?;
    # Name of the project and service desk.
    string projectName?;
    # Key of the peer project of the service desk.
    string projectKey?;
    # REST API URL to the service desk.
    SelfLinkDTO _links?;
};

public type LinkableCustomerRequestLinkDTO record {
    CustomerRequestLinkDTO _links?;
};

public type RequestParticipantUpdateDTO record {
    # This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. Use `accountIds` instead.
    string[] usernames?;
    # List of users, specified by account IDs, to add to or remove as participants in the request.
    string[] accountIds?;
};

# Details of an insight workspace ID.
public type InsightWorkspaceDTO record {
    # The workspace ID used as the identifier to access the Insight REST API.
    string workspaceId?;
};

public type RequestTypeGroupDTO record {
    # ID of the request type group
    string id?;
    # Name of the request type group.
    string name?;
};

public type RequestTypeIconDTO record {
    # ID of the request type icon.
    string id?;
    # Map of the URLs for the request type icons.
    RequestTypeIconLinkDTO _links?;
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

public type RequestNotificationSubscriptionDTO record {
    # Indicates whether the user is subscribed (true) or not (false) to the request's notifications.
    boolean subscribed?;
};

# List of property keys.
public type PropertyKeys record {
    # Property key details.
    PropertyKey[] keys?;
};

public type AdditionalCommentDTO record {
    # Content of the comment.
    string body?;
};

public type RequestTypeFieldDTO record {
    # ID of the field.
    string fieldId?;
    # Name of the field.
    string name?;
    # Description of the field.
    string description?;
    # Indicates if the field is required (true) or not (false).
    boolean required?;
    # List of default values for the field.
    RequestTypeFieldValueDTO[] defaultValues?;
    # List of valid values for the field.
    RequestTypeFieldValueDTO[] validValues?;
    # List of preset values for the field.
    string[] presetValues?;
    # Jira specific implementation details for the field in the UI.
    JsonTypeBean jiraSchema?;
    boolean visible?;
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

public type CustomerRequestDTO record {
    # ID of the request, as the peer issue ID.
    string issueId?;
    # Key of the request, as the peer issue key.
    string issueKey?;
    # ID of the request type for the request.
    string requestTypeId?;
    # Expandable details of the request type.
    RequestTypeDTO requestType?;
    # ID of the service desk the request belongs to.
    string serviceDeskId?;
    # Expandable details of the service desk.
    ServiceDeskDTO serviceDesk?;
    # Date on which the request was created.
    DateDTO createdDate?;
    # Details of the customer reporting the request.
    UserDTO reporter?;
    # JSON map of Jira field IDs and their values representing the content of the request.
    CustomerRequestFieldValueDTO[] requestFieldValues?;
    # Status of the request.
    CustomerRequestStatusDTO currentStatus?;
    # Expandable details of the request's status history.
    PagedDTOCustomerRequestStatusDTO status?;
    # Expandable details of the customers participating in the request.
    PagedDTOUserDTO participants?;
    # Expandable details of the SLAs relating to the request.
    PagedDTOSlaInformationDTO sla?;
    # List of attachments included with the request.
    PagedDTOAttachmentDTO attachments?;
    # List of comments included with the request.
    PagedDTOCommentDTO comments?;
    # List of actions that the user can take on the request.
    CustomerRequestActionsDTO actions?;
    # List of items that can be expanded in the response by specifying the expand query parameter.
    string[] _expands?;
    # List of links associated with the request.
    CustomerRequestLinkDTO _links?;
};

public type PagedDTOApprovalDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    ApprovalDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

# A list of editable field details.
public type IssueUpdateMetadata record {
    record {} fields?;
};

# Details a link group, which defines issue operations.
public type LinkGroup record {
    string id?;
    string styleClass?;
    # Details about the operations available in this version.
    SimpleLink header?;
    int weight?;
    SimpleLink[] links?;
    LinkGroup[] groups?;
};

public type RequestCreateDTO record {
    # ID of the service desk in which to create the request.
    string serviceDeskId?;
    # ID of the request type for the request.
    string requestTypeId?;
    # JSON map of Jira field IDs and their values representing the content of the request.
    record {} requestFieldValues?;
    # List of customers to participate in the request, as a list of `accountId` values.
    string[] requestParticipants?;
    # The `accountId` of the customer that the request is being raised on behalf of.
    string raiseOnBehalfOf?;
    # (Experimental) Shows extra information for the request channel.
    string channel?;
};

public type CustomerRequestCreateMetaDTO record {
    # List of the fields included in this request.
    RequestTypeFieldDTO[] requestTypeFields?;
    # Flag indicating if a request can be raised on behalf of another user (true) or not.
    boolean canRaiseOnBehalfOf?;
    # Flag indicating if participants can be added to a request (true) or not.
    boolean canAddRequestParticipants?;
};

public type AttachmentLinkDTO record {
    string self?;
    # REST API URL for the attachment
    string jiraRest?;
    # URL for the attachment.
    string content?;
    # URL for the attachment's thumbnail image.
    string thumbnail?;
};

public type I18nErrorMessage record {
    string i18nKey?;
    string[] parameters?;
};

public type CustomerRequestActionDTO record {
    # Indicates whether the user can undertake the action (true) or not (false).
    boolean allowed?;
};

public type AttachmentCreateResultDTO record {
    # Details of the comment included with the attachments.
    CommentDTO comment?;
    # List of the attachments added.
    PagedDTOAttachmentDTO attachments?;
};

public type UserLinkDTO record {
    string self?;
    # REST API URL for the customer.
    string jiraRest?;
    # Links to the various sizes of the customer's avatar. Note that this property is deprecated, and will be removed in future versions.
    record {} avatarUrls?;
};

public type RequestTypeFieldValueDTO record {
    # Value of the field.
    string value?;
    # Label for the field.
    string label?;
    # List of child fields.
    RequestTypeFieldValueDTO[] children?;
};

public type LinkableUserLinkDTO record {
    UserLinkDTO _links?;
};

public type ApproverDTO record {
    # Details of the User who is providing approval.
    UserDTO approver?;
    # Decision made by the approver.
    string approverDecision?;
};

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

public type PagedDTOServiceDeskDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    ServiceDeskDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};

public type PagedDTORequestTypeDTO record {
    # Number of items returned in the page.
    int size?;
    # Index of the first item returned in the page.
    int 'start?;
    # Number of items to be returned per page, up to the maximum set for these objects in the current implementation.
    int 'limit?;
    # Indicates if this is the last page of records (true) or not (false).
    boolean isLastPage?;
    # Details of the items included in the page.
    RequestTypeDTO[] values?;
    string[] _expands?;
    # List of the links relating to the page.
    PagedLinkDTO _links?;
};
