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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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
    string refreshUrl = "https://account-d.docusign.com/oauth/token";
|};

# Contains a list of forms libraries.
public type FormLibrarySummaryList record {
    # A list of form libraries.
    FormLibrarySummary[] formsLibrarySummaries?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# The `TimeZones` resource enables you to list the time zones that you can assign to an office.
public type TimeZones record {
    # The id of the time zone for the office address.
    # 
    # Example: `eastern` (for the Eastern US Time Zone)
    string timeZoneId?;
    # The name of the office.
    string name?;
};

# This request object contains details about the person who you want to invite.
public type ClassicAgentToInvite record {
    # (Required) The user's first name.
    string firstName;
    # (Required) The user's last name.
    string lastName;
    # (Required) The user's email address.
    string email;
    # (Required) The id of the office. This is the id that the system generated when you created the office.
    int officeId;
    # Company type ID
    string companyTypeId?;
    # (Required) When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. The `eSignPermissionProfileId` is the id of the eSignature permission set to assign to the member.
    string eSignPermissionProfileId?;
};

# Result from getting a form group.
public type FormGroup record {
    # The ID of the form group.
    # 
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    string formGroupId?;
    # The name of the office.
    string name?;
    # An array of office IDs.
    int[] officeIds?;
    # A list of forms.
    GroupForm[] forms?;
};

# A task list template is a custom task list that can be added to rooms.
public type TaskListTemplates record {
    # The id of the task list template.
    int taskListTemplateId?;
    # The name of the office.
    string name?;
    # The total number of tasks in the task list template.
    int taskCount?;
    # The number of tasks in the task list template that have documents associated with them.
    int tasksWithDocumentsCount?;
};

# The Users resource provides methods that enable you to add, update, delete, and manage users. A user is a person who is either added to a room (as a participant), or who is a member of a company.
public type Users record {
    # The id of the user.
    int userId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # When set to **true**, an administrator has locked the user's account. For example, an administrator might want to lock an agent's account after they leave the brokerage until they determine how to transfer the agent's rooms and data to another active user.
    boolean isLockedOut?;
    # Valid values are 'Active', 'Pending'
    string status?;
    # Access level
    AccessLevel accessLevel?;
    # The id of the user's default office.
    int defaultOfficeId?;
    # In Rooms Version 5, this is the id of the custom job title for a Manager role within your company. For example, your company might have the custom job titles "Transaction Coordinator" and "Office Manager".
    # 
    # **Note**: If you are using Rooms Version 5, you must enter a `titleId` when using the Users::InviteClassicManager method. (The `titleId` property is empty for Agent users on Rooms Version 5.) If you are using Rooms Version 6, use the Users::InviteUser method with the `roleId` property instead.
    int titleId?;
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # The URL for the user's profile image.
    string profileImageUrl?;
    # An array of office ids for the offices in which a user with an `Office` or `Contributor` `accessLevel` has been granted the ability to participate.
    int[] offices?;
    # An array of region ids for the regions in which a user with the `Region accessLevel` has been granted the ability to participate.
    int[] regions?;
    # This object contains details about user permissions. These permissions are associated only with Rooms v5.
    ClassicManagerPermissions permissions?;
};

# Contains information about a document.
public type Document record {
    # The ID of the document.
    int documentId?;
    # The file name associated with the document.
    string name;
    # The id of the room associated with the document.
    int roomId?;
    # The id of the user who owns the document.
    int ownerId?;
    # The size of the document in bytes.
    int size?;
    # The id of the folder that holds the document.
    int folderId?;
    # The date and time when the document was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-11-11T17:15:14.82`
    string createdDate?;
    # When set to **true**, indicates that the document is signed.
    boolean isSigned?;
    # Content type
    string contentType?;
    # The base64-encoded contents of the document. This property is only included in the response when you use the `includeContents` query parameter and set it to **true**.
    string base64Contents;
};

# This object contains details about a room.
public type RoomSummary record {
    # The id of the room.
    int roomId?;
    # The name of the room.
    string name?;
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # The UTC DateTime when the room was submitted for review.
    # 
    # **Note**: In Rooms v5, this is when an agent submitted the room to a manager. In Rooms v6, this is when a member with a role for which the **Submit rooms for review** permission is set to **true** submitted the room to a member with a role for which the **Review and close rooms** permission is set to **true**.
    string submittedForReviewDate?;
    # The UTC date and time when the room was closed.
    string closedDate?;
    # The date on which the reviewer rejected the room. For example, a reviewer might reject closing a room if documentation is missing or the details are inaccurate.
    string rejectedDate?;
    # The id of the user who created the room.
    int createdByUserId?;
    # The id of the user who rejected the room.
    int rejectedByUserId?;
    # The reason why a room was closed. Possible values are:
    # 
    # - `sold`: Property sold.
    # - `dup`: Duplicate room.
    # - `escrcncl`: Escrow canceled.
    # - `inspctn`: Inspection issues.
    # - `exp`: Listing expired.
    # - `lostbuy`: Buyer withdrew.
    # - `list`: Listing withdrawn. 
    # - `newlist`: New listing.
    # - `offrrjct`: Offer not accepted.
    # - `pend`: Pending. An agent might use this status to temporarily hide a room from their Active rooms view if they are blocked on a task. When they are ready to reopen the room, they can quickly find it by filtering for rooms in `pending` status.
    # - `lstcanc`: Listing canceled. 
    # - `lstleave`: Listing released.
    # - `sellwtdw`: Seller withdrew.
    # - `nofin`: Buyer unable to finance.
    # - `disciss`: Property disclosure issue.
    # - `appiss`: Appraisal issues.
    # - `mtgiss`: Mortgage issues. Use when details about why the buyer wasn't able to obtain financing are unknown.
    # - `zoniss`: Zoning issues.
    # - `attiss`: Attorney review issues.
    # - `proplsd`: Property leased. Use for the list side of the transaction.
    # - `tenlease`: Tenant signed lease. Use when an agent helps renters find a to lease.   
    string closedStatusId?;
    # Field data last updated date
    string fieldDataLastUpdatedDate?;
};

# The `States` resource provides a method that enables you to retrieve a list of states and state ids that the Rooms API uses.
public type States record {
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # The name of the office.
    string name?;
};

# This resource provides a method that returns a URL for a new external form fill session, based on the `roomId` and `formId` that you specify in the `formFillSessionForCreate` request body.
public type ExternalFormFillSessions record {
    # URL for a new external form fill session
    string url?;
};

# Object that contains a summary of information about a requested group of offices in the Rooms account.
public type OfficeSummaryList record {
    # A list of `OfficeSummary` objects containing summary information about an office.
    OfficeSummary[] officeSummaries?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The index position within the total result set from which returned values start.
    int startPosition?;
    # The index position within the total result set at which returned values end.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Object that contains a summary of information about a requested group of regions in the Rooms account.
public type RegionSummaryList record {
    # A list of `RegionSummary` objects containing summary information on a region; the elements of this object are identical to those of the `Regions` object.
    RegionSummary[] regionSummaries?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains details about a supported currency.
public type Currency record {
    # The three-letter code for the currency.
    # 
    # Example: `CAD`
    string currencyId?;
    # The name of the currency.
    # 
    # Example: `Canadian Dollar`
    string name?;
};

# Contains details about a form in a form library.
public type FormSummary record {
    # The id of the form.
    # 
    # Example: `301f560d-xxxx-xxxx-xxxx-063a47cc12c2`
    string libraryFormId?;
    # The name of the form. 
    # 
    # Example: `Short Sale Supplement to Marketing Agreement`
    string name?;
    # The date and time when the form was last updated.
    # 
    # Example: `2017-08-11T19:58:36.18`
    string lastUpdatedDate?;
};

# Contains information about a special circumstance type.
public type SpecialCircumstanceType record {
    # The id of the special circumstance type.
    # 
    # Example: `ss` (for `Short Sale`)
    string specialCircumstanceTypeId?;
    # The name of the special circumstance type. Possible values are:
    # 
    # - `Short Sale`
    # - `Foreclosure`
    # - `Corporate Owned`
    # - `Historical`
    # - `Investor Owned`
    # - `HUD`
    # - `Estate Sale`
    # - `Relocation`
    # - `Contingency`
    string name?;
};

# 
public type TaskStatuses record {
    # 
    string taskStatusId?;
    # The name of the office.
    string name?;
};

# Contains details about how a field is configured.
public type FieldConfiguration record {
    # The maximum value allowed for the field.
    decimal maxValue?;
    # The minimum value allowed for the field.
    decimal minValue?;
    # This property is used for validation. When you set a number value for this property, the value for the field must be a multiple of it.
    decimal multipleOf?;
    # The maximum length of the field.
    int maxLength?;
    # The minimum length of the field.
    int minLength?;
    # The regular expression pattern to use to validate the value of the field.
    string pattern?;
    # When set to **true**, the field is a parent field on which one or more child fields depend.
    boolean isPublisher?;
    # This property applies to child fields. It contains information about the parent field that must have a value set in order for this field to have a value. For example, you must specify a country before you can select a state.
    DependsOn[] dependsOn?;
    # An array of options in a list.
    SelectListFieldOption[] options?;
};

# Contains the URL for the new form fill session.
public type ExternalFormFillSession record {
    # The URL for the new form fill session.
    string url?;
};

# This resource provides a method that enables you retrieve a list of closing statuses, or valid reasons for closing a room.
public type ClosingStatuses record {
    # The id of the closing status.
    # 
    # Example: `exp`
    string closingStatusId?;
    # The name of the office.
    string name?;
};

# Contains information about a seller decision type.
public type SellerDecisionType record {
    # The id of the seller decision type.
    # 
    # Example: `appr` (for `Approved`)
    string sellerDecisionTypeId?;
    # The name of the seller decision type. Possible values are:
    # 
    # - `Pending`
    # - `Approved`
    # - `Countered`
    # - `Rejected`
    # - `Pending Rejection`
    string name?;
};

# 
public type Regions record {
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # String that specifies the region name.
    string name;
    # UTC datetime that the region was created (for example "2019-06-27T19:32:46.943"). Note that the service assigns this value, so it is read-only.
    string createdDate?;
};

# This object contains information about a role.
public type Roles record {
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # The legacy name of the role in Rooms Version 5.
    string legacyRoleId?;
    # The name of the role. 
    # 
    # Examples: 
    # 
    # - `Agent`
    # - `Default Admin`
    string name?;
    # When **true**, the role is the default for account administrators.
    boolean isDefaultForAdmin?;
    # When set to **true**, the role is an external role. You assign external roles to people from outside your company when you invite them into a room.
    boolean isExternal?;
    # The UTC DateTime when the role was created.
    string createdDate?;
    # When set to **true**, indicates that this role is currently assigned to a user.
    boolean isAssigned?;
    # Contains details about permissions.
    Permissions permissions?;
};

# Contains information about a task list.
public type TaskListSummary record {
    # The id of the task list.
    int taskListId?;
    # The name of the task list.
    string name?;
    # The id of the task list template.
    int taskListTemplateId?;
    # The UTC DateTime when the task list was submitted for review.
    string submittedForReviewDate?;
    # The UTC DateTime when the task list was approved.
    string approvalDate?;
    # The date on which the reviewer rejected the task list.
    string rejectedDate?;
    # The UTC date and time when the task list was created. This is a read-only value that the service assigns.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string createdDate?;
    # The id of the user who approved the task list.
    int approvedByUserId?;
    # The id of the user who rejected the task list.
    int rejectedByUserId?;
    # Contains a user comment about the task list.
    string comment?;
};

# Contains details about an option in a list.
public type SelectListFieldOption record {
    # The id of the list option.
    # 
    # Example: `AU`
    record {} id?;
    # The title or name of the list option.
    # 
    # Example: `Australia`
    string title?;
    # The order of the list option in the list.
    # 
    # Example: `3`
    int 'order?;
};

# Contains information about a time zone.
public type TimeZone record {
    # The id of the time zone.
    # 
    # Example: `brisbane`
    string timeZoneId?;
    # The name of the time zone.
    # 
    # Example: `Eastern Australia (Brisbane)`
    string name?;
};

# Contains details about the role that you want to create.
public type RoleForCreate record {
    # The name of the role.
    string name?;
    # When set to **true**, the role is an external role. You assign external roles to people from outside your company when you invite them into a room.
    boolean isExternal?;
    # Contains details about permissions.
    Permissions permissions?;
};

# A list of room folder results.
public type RoomFolderList record {
    # An array of room folders.
    RoomFolder[] folders?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains information about the task list template to use to create the new task list.
public type TaskListForCreate record {
    # (Required) The id of the task list template.
    int taskListTemplateId?;
};

# Contains details about a supported country.
public type Country record {
    # The two-letter code for the country. 
    # 
    # Example: `NZ`
    string countryId?;
    # The name of the country. 
    # 
    # Example: `New Zealand`
    string name?;
};

# This object describes errors that occur. It is valid only for responses and ignored in requests.
public type ApiError record {
    # The code associated with the error condition.
    string errorCode?;
    # A brief message describing the error condition.
    string message?;
};

# A list of documents in a room.
public type RoomDocumentList record {
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
    # An array of room documents.
    RoomDocument[] documents?;
};

# Contains information about an office.
public type Office record {
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The name of the office.
    string name;
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # First line of the office street address.
    string address1?;
    # Second line of the office street address.
    string address2?;
    # City name or metropolitan area of the office address.
    string city?;
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # Postal code or ZIP code of the office address.
    string postalCode?;
    # The two-letter country code of the office address (for example, "UK" for United Kingdom).
    string countryId?;
    # The id of the time zone for the office address.
    # 
    # Example: `eastern` (for the Eastern US Time Zone)
    string timeZoneId?;
    # Phone number of the office.
    string phone?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
};

# This request object contains the details to use for the update.
public type RoleForUpdate record {
    # The name of the role.
    string name?;
    # When set to **true**, the role is an external role. You assign external roles to people from outside your company when you invite them into a room.
    boolean isExternal?;
    # Contains details about permissions.
    Permissions permissions?;
};

# Product version
public type ProductVersion string;

# Contains details about a field set.
public type FieldSet record {
    # The id of the field set.
    # 
    # Example: `4aef602b-xxxx-xxxx-xxxx-08d76696f678`
    string fieldSetId?;
    # The title or name of the field set.
    string title?;
    # An array of fields.
    Field[] fields?;
};

# The information to use for the invitation.
public type RoomInvite record {
    # The user's email address.
    string email;
    # The user's first name.
    string firstName;
    # The user's last name.
    string lastName;
    # In Rooms Version 6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who are not part of your organization.
    # 
    # **Note**: If you are using Rooms Version 6, you must enter a `roleId` in requests. If you are using Rooms Version 5, you must use one of the Users::InviteClassic methods with the `titleId` property instead.
    int roleId;
    # Required for a real estate company; otherwise ignored.
    string transactionSideId?;
};

# Contains information about whether the field is required when a room is created or submitted for review.
public type CustomData record {
    # When set to **true**, the field is required when a new room is created.
    boolean isRequiredOnCreate?;
    # When set to **true**, the field is required when a room is submitted for review.
    boolean isRequiredOnSubmit?;
};

# This complex type contains details about rooms.
public type RoomSummaryList record {
    # An array of `roomSummary` objects.
    RoomSummary[] rooms?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# 
public type DocumentUser record {
    # The id of the user.
    int userId?;
    # The ID of the document.
    int documentId?;
    # The file name associated with the document.
    string name?;
    # **True** if the user `userId` has access to this document.
    boolean hasAccess?;
    # **True** if the user `userId` has can approve a task for this document.
    boolean canApproveTask?;
    # **True** if the user `userId` can assign this document to a task list.
    boolean canAssignToTaskList?;
    # **True** if the user `userId` can make a copy of this document.
    boolean canCopy?;
    # **True** if the user `userId` can delete this document.
    boolean canDelete?;
    # **True** if the user `userId` can remove this document from a task list.
    boolean canRemoveFromTaskList?;
    # **True** if the user `userId` can remove approval for this document.
    boolean canRemoveApproval?;
    # **True** if the user `userId` can rename this document.
    boolean canRename?;
    # **True** if the user `userId` can share this document.
    boolean canShare?;
    # **True** if the user `userId` can view activity on this document.
    boolean canViewActivity?;
};

# The `TaskResponsibilityTypes` resource enables you to return a list of responsibility types that you can assign to users when you add them to a task. 
public type TaskResponsibilityTypes record {
    # The id of the task responsibility type.
    string taskResponsibilityTypeId?;
    # The name of the office.
    string name?;
};

# Contains a list of origins of leads.
public type GlobalOriginsOfLeads record {
    # A list of origins of leads.
    OriginOfLead[] originsOfLeads?;
};

# Information about the sent invitation.
public type RoomInviteResponse record {
    # The id of the user.
    int userId?;
    # The id of the room.
    int roomId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
};

# Room document owner
public type RoomDocumentOwner record {
    # The id of the user.
    int userId?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # The company name.
    string companyName?;
    # The source of the user's profile picture.
    string imageSrc?;
};

# A complex element containing summary information on an office; the elements of this object are identical to those of the `Offices` object.
public type OfficeSummary record {
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The name of the office.
    string name?;
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # First line of the office street address.
    string address1?;
    # Second line of the office street address.
    string address2?;
    # City name or metropolitan area of the office address.
    string city?;
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # Postal code or ZIP code of the office address.
    string postalCode?;
    # The two-letter country code of the office address (for example, "UK" for United Kingdom).
    string countryId?;
    # The id of the time zone for the office address.
    # 
    # Example: `eastern` (for the Eastern US Time Zone)
    string timeZoneId?;
    # Phone number of the office.
    string phone?;
    # UTC datetime that the office was created (for example, "2019-07-17T17:45:42.783"). Note that the service assigns this value, so it is read-only.
    string createdDate?;
};

# This object contains information about the office that you want to add a member to or remove a member from.
public type DesignatedOffice record {
    # (Required) The id of the office. This is the id that the system generated when you created the office.
    int officeId;
};

# Group information to assign form
public type FormGroupFormToAssign record {
    # The id of the form.
    # 
    # Example: `5be324eb-xxxx-xxxx-xxxx-208065181be9`
    string formId;
    # **True** if the form is required.
    boolean isRequired?;
};

# The `FormGroups` resource enables you to create and manage custom groups of association forms.
public type FormGroups record {
    # The ID of the form group.
    # 
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    string formGroupId?;
    # The name of the office.
    string name?;
    # The number of forms in the form library. 
    # 
    # Example: `50`
    int formCount?;
};

public type RoomidPictureBody record {
    # Image
    string file?;
};

# Contains key-value pairs that specify the properties of the room and their values.
public type FieldDataForCreate record {
    # Field data is a collection of name/value pairs where the names correspond to the fields in the room's **Details** tab. The value of name/value object can be a field data collection itself. These collections are implemented as JSON objects.
    # 
    # For example, the field data for fields named "Tax annual amount" and "buyer1" might look like this: 
    # 
    # 
    # ```
    # {
    #   "data": {
    #     "taxAnnualAmount": 3389.12,
    #     "buyer1": {
    #       "email": "lizzy@example.com",
    #       "country": "England",
    #       "businessPhone": null,
    #       "name": "Elizabeth Bennet",
    #       "homePhone": null,
    #       "city": "Meryton",
    #       "address2": null,
    #       "postalCode": null,
    #       "state": "Hertfordshire",
    #       "company": null,
    #       "cellPhone": null,
    #       "address1": "Longbourn Estate"
    #     }
    #   }
    # }
    # ```
    record {} data?;
};

# 
public type TaskStatus record {
    # 
    string taskStatusId?;
    # The name of the office.
    string name?;
};

# Contains a list of financing types.
public type GlobalFinancingTypes record {
    # A list of financing types.
    FinancingType[] financingTypes?;
};

# The `Currencies` method provides a resource that enables you to retrieve a list currencies that you can use for listing, offer, and loan amounts.
public type Currencies record {
    # The three-letter code for the currency.
    # 
    # Example: `CAD`
    string currencyId?;
    # The name of the office.
    string name?;
};

# 
public type RoomFolders record {
    # 
    int roomFolderId?;
    # The name of the office.
    string name?;
    # 
    boolean isDefault?;
};

# The Rooms resource provides methods that enable you to create and manage rooms. In Rooms for Real Estate, a room is a collaborative digital space corresponding to a specific property. In Rooms for Mortgages, a room corresponds to a specific loan.
public type Rooms record {
    # The id of the room.
    int roomId?;
    # The id of the company.
    int companyId?;
    # The name of the room.
    # 
    # Maximum Length: 100 characters.
    string name?;
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # The UTC DateTime when the room was submitted for review.
    # 
    # **Note**: In Rooms v5, this is when an agent submitted the room to a manager. In Rooms v6, this is when a member with a role for which the **Submit rooms for review** permission is set to **true** submitted the room to a member with a role for which the **Review and close rooms** permission is set to **true**.
    string submittedForReviewDate?;
    # The UTC date and time when the room was closed.
    string closedDate?;
    # The date on which the reviewer rejected the room. For example, a reviewer might reject closing a room if documentation is missing or the details are inaccurate.
    string rejectedDate?;
    # The id of the user who created the room.
    int createdByUserId?;
    # The id of the user who rejected the room.
    int rejectedByUserId?;
    # The reason why a room was closed. Possible values are:
    # 
    # - `sold`: Property sold.
    # - `dup`: Duplicate room.
    # - `escrcncl`: Escrow canceled.
    # - `inspctn`: Inspection issues.
    # - `exp`: Listing expired.
    # - `lostbuy`: Buyer withdrew.
    # - `list`: Listing withdrawn. 
    # - `newlist`: New listing.
    # - `offrrjct`: Offer not accepted.
    # - `pend`: Pending. An agent might use this status to temporarily hide a room from their Active rooms view if they are blocked on a task. When they are ready to reopen the room, they can quickly find it by filtering for rooms in `pending` status.
    # - `lstcanc`: Listing canceled. 
    # - `lstleave`: Listing released.
    # - `sellwtdw`: Seller withdrew.
    # - `nofin`: Buyer unable to finance.
    # - `disciss`: Property disclosure issue.
    # - `appiss`: Appraisal issues.
    # - `mtgiss`: Mortgage issues. Use when details about why the buyer wasn't able to obtain financing are unknown.
    # - `zoniss`: Zoning issues.
    # - `attiss`: Attorney review issues.
    # - `proplsd`: Property leased. Use for the list side of the transaction.
    # - `tenlease`: Tenant signed lease. Use when an agent helps renters find a to lease.   
    string closedStatusId?;
    # The field data associated with a room. See [Rooms::GetRoomFieldData](/rooms-api/reference/Rooms/Rooms/GetRoomFieldData).
    FieldData fieldData?;
};

# The field data associated with a room. See [Rooms::GetRoomFieldData](/rooms-api/reference/Rooms/Rooms/GetRoomFieldData).
public type FieldData record {
    # Field data is a collection of name/value pairs where the names correspond to the fields in the room's **Details** tab. The value of name/value object can be a field data collection itself. These collections are implemented as JSON objects.
    # 
    # For example, the field data for fields named "Tax annual amount" and "buyer1" might look like this: 
    # 
    # 
    # ```
    # {
    #   "data": {
    #     "taxAnnualAmount": 3389.12,
    #     "buyer1": {
    #       "email": "lizzy@example.com",
    #       "country": "England",
    #       "businessPhone": null,
    #       "name": "Elizabeth Bennet",
    #       "homePhone": null,
    #       "city": "Meryton",
    #       "address2": null,
    #       "postalCode": null,
    #       "state": "Hertfordshire",
    #       "company": null,
    #       "cellPhone": null,
    #       "address1": "Longbourn Estate"
    #     }
    #   }
    # }
    # ```
    record {} data?;
};

# This resource contains details about a form, such as the date it was created and last updated, the number of pages, the form owner, and other information.
public type FormDetails record {
    # The id of the form.
    # 
    # Example: `5be324eb-xxxx-xxxx-xxxx-208065181be9`
    string formId?;
    # The name of the form.
    # 
    # Example: `MORe Private Network Addendum`
    string name?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # The UTC date and time when the item was last updated. This is a read-only value that the service assigns.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string lastUpdatedDate?;
    # The UTC DateTime when the form was made available or published. (It is possible for a form to be published but not yet available.)
    string availableOnDate?;
    # The name of the organization that owns the form.
    # 
    # Example: `Mainstreet organization of Realtors`
    string ownerName?;
    # The version of the form. 
    # 
    # Example: `1`
    string 'version?;
    # The number of pages in the form.
    # 
    # Example: `2`
    int numberOfPages?;
};

# 
public type FieldsCustomDataFilterType string;

# An individual document in a room.
public type RoomDocument record {
    # The ID of the document.
    int documentId?;
    # The file name of the document.
    # 
    # Example: `Short Sale Supplement to Marketing Agreement.pdf`
    string name?;
    # The id of the user who owns the document.
    int ownerId?;
    # The size of the document in bytes.
    int size?;
    # The id of the folder the document is in.
    int folderId?;
    # The UTC date and time that the document was created or uploaded. 
    # 
    # Example: `2019-07-25T22:18:56.95Z`
    string createdDate?;
    # When set to **true**, this property indicates that the document is signed.
    boolean isSigned?;
    # The id of the corresponding DocuSign form.
    string docuSignFormId?;
    # **True** if the document is archived.
    boolean isArchived?;
    # **True** if the document is virtual.
    boolean isVirtual?;
    # Room document owner
    RoomDocumentOwner owner?;
};

# Request object for FormGroup::CreateFormGroup.
public type FormGroupForCreate record {
    # The name of the group.
    string name;
};

# Contains information about a task list.
public type TaskSummary record {
    # The id of the task list.
    int taskId?;
    # The name of the task list.
    string name?;
    # When set to **true**, the task must be completed and reviewed before it can be closed.
    boolean requiresApproval?;
    # The id of the due date type (such as Actual Close Date or Contract Date).
    string dueDateTypeId?;
    # The number of days before or after the due date (specified by the `dueDateTypeId`) within which the task must be completed. A negative number indicates that the task must be completed within a certain number of days before the due date. A positive number indicates that the task must be completed within a certain number of days after the due date.
    int dueDateOffset?;
    # A specific calendar due date for the task.
    # 
    # In the API, this value is a UTC DateTime that does not actually include a time.
    # 
    # Example: 2019-07-17T00:00:00.000Z
    string fixedDueDate?;
    # The id of the user who owns the task.
    int ownerUserId?;
    # The UTC DateTime when the task was completed.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string completionDate?;
    # The UTC DateTime when the task was approved.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string approvalDate?;
    # The date on which the reviewer rejected the task.
    string rejectedDate?;
    # 	
    # The UTC date and time when the task was created. This is a read-only value that the service assigns.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string createdDate?;
    # When set to **true**, the task is associated with a document.
    boolean isDocumentTask?;
    # When set to **true**, the task is optional. If the task is completed (if a document is added or the task is marked complete), it must be reviewed before it can be closed.
    boolean requiresReview?;
};

# Contains details about a task list template.
public type TaskListTemplate record {
    # The id of the task list template.
    int taskListTemplateId?;
    # The name of the task list template.
    string name?;
    # The total number of tasks in the task list template.
    int taskCount?;
    # The number of tasks in the task list template that have documents associated with them.
    int tasksWithDocumentsCount?;
};

# This request object contains the details about the new room.
public type RoomForCreate record {
    # (Required) The name of the room.
    string name;
    # (Required) The id of the role that the owner has in the room.
    int roleId;
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    # 
    # **Note**: This property is required for real estate companies, and otherwise ignored.
    string transactionSideId?;
    # The id of the user who owns the room.
    int ownerId?;
    # (Optional) The id of the template to use to create the room.
    int templateId?;
    # (Optional) The id of the office associated with the room. Required when creating a room on behalf of someone else or a Manager-owned room. 
    int officeId?;
    # Contains key-value pairs that specify the properties of the room and their values.
    FieldDataForCreate fieldData?;
};

# This complex type contains details about the users associated with a room.
public type RoomUsersResult record {
    # An array of `RoomUser` objects.
    RoomUserSummary[] users?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains details about a role.
public type RoleSummary record {
    # In Rooms v6, this is the id of the company role assigned to the user.
    int roleId?;
    # The legacy name of the role in Rooms Version 5.
    string legacyRoleId?;
    # The name of the role.
    string name?;
    # When **true**, the role is the default for account administrators.
    boolean isDefaultForAdmin?;
    # When set to **true**, the role is an external role. You assign external roles to people from outside your company when you invite them into a room.
    boolean isExternal?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
};

# Information about accounts.
public type Accounts record {
    # The id of the company.
    int companyId?;
    # The name of the office.
    string name?;
    # Product version
    ProductVersion companyVersion?;
    # The globally-unique identifier (GUID) for the DocuSign Rooms account.
    string docuSignAccountGuid?;
    # The id of the company's default field set. A field set is a set of data fields and the information about those data fields that the system uses to configure rooms. It corresponds to the **Admin > Company > Room Details** area in the console.
    string defaultFieldSetId?;
    # Require office library assignments
    boolean requireOfficeLibraryAssignments?;
};

# The room template resources provides a method that enables you to retrieve the room templates associated with an account.
public type RoomTemplates record {
    # The id of the room template.
    int roomTemplateId?;
    # The name of the room template.
    string name?;
    # The total number of task templates that the room template uses.
    int taskTemplateCount?;
};

# Contains details about a company account.
public type AccountSummary record {
    # The id of the company.
    int companyId?;
    # The name of the company.
    string name?;
    # Product version
    ProductVersion companyVersion?;
    # The globally-unique identifier (GUID) for the DocuSign Rooms account.
    string docuSignAccountGuid?;
    # The id of the company's default field set. A field set is a set of data fields and the information about those data fields that the system uses to configure rooms. It corresponds to the **Admin > Company > Room Details** area in the console.
    string defaultFieldSetId?;
    # Require office library assignments
    boolean requireOfficeLibraryAssignments?;
};

# The `OriginsOfLeads` resource enables you to get a list of origins of leads (such as Trulia or Zillow) that you can specify for rooms.
public type OriginsOfLeads record {
    # The id of the origin of lead.
    # 
    # Example: `tru` (for `Trulia`)
    string originOfLeadId?;
    # The name of the office.
    string name?;
};

# 
public type GlobalTaskStatuses record {
    # 
    TaskStatus[] taskStatuses?;
};

# The `Countries` resource provide a method that enables you to retrieve a list of countries in which you can create an office.
public type Countries record {
    # The two-letter country code of the office address (for example, "UK" for United Kingdom).
    string countryId?;
    # The name of the office.
    string name?;
};

# This resource provides a method that returns a list of date types that you can use with tasks, such as `Actual Close Date` and `Task Due Date`.
public type TaskDateTypes record {
    # The id of the task date type.
    # 
    # Example: `tdd` (for `Task Due Date`)
    string taskDateTypeId?;
    # The name of the office.
    string name?;
};

# This response object contains details about the new task list.
public type TaskList record {
    # The id of the task list.
    int taskListId?;
    # The name of the task list.
    string name?;
    # The id of the task list template used to create the task list.
    int taskListTemplateId?;
    # The UTC DateTime when the task list was submitted for review.
    string submittedForReviewDate?;
    # The UTC DateTime when the task list was approved.
    string approvalDate?;
    # The UTC DateTime when the reviewer rejected the task list. 
    string rejectedDate?;
    # The UTC date and time when the task list was created. This is a read-only value that the service assigns.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string createdDate?;
    # The id of the user who approved the task list.
    int approvedByUserId?;
    # The id of the user who rejected the task list.
    int rejectedByUserId?;
    # Contains a comment about the task list.
    string comment?;
    # A list of tasks in the task list.
    TaskSummary[] tasks?;
};

# The field data to update. When updating field data, specify only the fields being updated.
public type FieldDataForUpdate record {
    # Field data is a collection of name/value pairs where the names correspond to the fields in the room's **Details** tab. The value of name/value object can be a field data collection itself. These collections are implemented as JSON objects.
    # 
    # For example, the field data for fields named "Tax annual amount" and "buyer1" might look like this: 
    # 
    # 
    # ```
    # {
    #   "data": {
    #     "taxAnnualAmount": 3389.12,
    #     "buyer1": {
    #       "email": "lizzy@example.com",
    #       "country": "England",
    #       "businessPhone": null,
    #       "name": "Elizabeth Bennet",
    #       "homePhone": null,
    #       "city": "Meryton",
    #       "address2": null,
    #       "postalCode": null,
    #       "state": "Hertfordshire",
    #       "company": null,
    #       "cellPhone": null,
    #       "address1": "Longbourn Estate"
    #     }
    #   }
    # }
    # ```
    record {} data?;
};

# Contains details about a user.
public type UserSummary record {
    # The id of the user.
    int userId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # When set to **true**, an administrator has locked the user's account. For example, an administrator might want to lock an agent's account after they leave the brokerage until they determine how to transfer the agent's rooms and data to another active user.
    boolean isLockedOut?;
    # The user's status. Possible values are:
    # 
    # - `Active`
    # - `Pending`
    string status?;
    # Access level
    AccessLevel accessLevel?;
    # The id of the user's default office.
    int defaultOfficeId?;
    # In Rooms Version 5, this is the id of the custom job title for a Manager role within your company. For example, your company might have the custom job titles "Transaction Coordinator" and "Office Manager".
    # 
    # **Note**: If you are using Rooms Version 5, you must enter a `titleId` when using the Users::InviteClassicManager method. (The `titleId` property is empty for Agent users on Rooms Version 5.) If you are using Rooms Version 6, use the Users::InviteUser method with the `roleId` property instead.
    int titleId?;
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # The URL for the user's profile image.
    string profileImageUrl?;
};

# When you create or invite a new member in Rooms, the system creates an eSignature account for the member at the same time.
public type ESignPermissionProfiles record {
    # When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. The `eSignPermissionProfileId` is the id of the eSignature permission set to assign to the member.
    string eSignPermissionProfileId?;
    # The name of the eSignature permission profile.
    string name?;
    # This object contains details about the permissions associated with a eSignature permission profile.
    ESignAccountRoleSettings settings?;
};

# Contains information about a property type.
public type PropertyType record {
    # The id of the property type.
    # 
    # Example: `resd` (for `Residential Detached`)
    string propertyTypeId?;
    # The name of the property type. Possible values are:
    # 
    # - `Residential Detached`
    # - `Residential Attached`
    # - `New Construction`
    # - `Residential Developed Lots`
    # - `Land/Farm`
    # - `Rental`
    # - `Commercial`
    # - `Condominium`
    # - `Mobile Home`
    string name?;
};

# Contains a list of each type of object and the number of objects of that type referencing the office.
public type OfficeReferenceCountList record {
    # A list of each type of object and the number of objects of that type referencing the office.
    OfficeReferenceCount[] referencesCounts?;
};

# This resource provides a method that enables you to retrieve a list of financing types.
public type FinancingTypes record {
    # The id of the financing type.
    # 
    # Example: `conv` (for `Conventional`)
    string financingTypeId?;
    # The name of the office.
    string name?;
};

# 
public type FormGroupForUpdate record {
    # The name of the office.
    string name;
};

# Contains information about a task date type.
public type TaskDateType record {
    # The id of the task date type.
    # 
    # Example: `tdd` (for `Task Due Date`)
    string taskDateTypeId?;
    # The name of the task date type. 
    # 
    # Possible values are:
    # 
    # - `Specific Calendar Date`
    # - `Task Due Date`
    # - `Actual Close Date`
    # - `Binding Date`
    # - `Contingency Removal Date`
    # - `Contract Date`
    # - `Expected Closing Date`
    # - `Listing Date`
    # - `Listing Expiration Date`
    # - `Offer Date`
    string name?;
};

# The `SpecialCircumstanceTypes` resource provides a method that enables you to retrieve a list of special circumstance types, such as `Short Sale` and `Foreclosure`. These are the values that you can select for the **Special circumstances** field that appears on the **Room Details** page.
public type SpecialCircumstanceTypes record {
    # The id of the special circumstance type.
    # 
    # Example: `ss` (for `Short Sale`)
    string specialCircumstanceTypeId?;
    # The name of the office.
    string name?;
};

# 
public type AccountStatus string;

# Contains a list of forms in a form library.
public type FormSummaryList record {
    # A list of forms.
    FormSummary[] forms?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains information about an origin of lead.
public type OriginOfLead record {
    # The id of the origin of lead.
    # 
    # Example: `tru` (for `Trulia`)
    string originOfLeadId?;
    # The name of the origin of lead. Possible values are:
    # 
    # - `Realtor.com`
    # - `Trulia`
    # - `Zillow`
    # - `Company Website`
    # - `Agent Website`
    # - `Other Online`
    # - `Mobile App`
    # - `Social Media`
    # - `Personal Referral`
    # - `Company Referral`
    # - `Repeat Client`
    # - `Corporate Relocation`
    # - `Print Marketing`
    # - `Prospecting`
    # - `Other`
    # - `REO (Real Estate Owned)`
    string name?;
};

# Contains details about the office that you want to create.
public type OfficeForCreate record {
    # The name of the office.
    string name;
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # First line of the office street address.
    string address1?;
    # Second line of the office street address.
    string address2?;
    # City name or metropolitan area of the office address.
    string city?;
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # Postal code or ZIP code of the office address.
    string postalCode?;
    # The two-letter country code of the office address (for example, "UK" for United Kingdom).
    string countryId?;
    # The id of the time zone for the office address.
    # 
    # Example: `eastern` (for the Eastern US Time Zone)
    string timeZoneId?;
    # Phone number of the office.
    string phone?;
};

# This object contains details about user permissions. These permissions are associated only with Rooms v5.
public type ClassicManagerPermissions record {
    # When set to **true**, the user is visible in company rooms.
    # 
    # **Note**: Inherited managers are automatically added to rooms and are visible in those rooms unless this setting is set to **false**. Inherited managers are users who oversee others and have the **auto-access to rooms of members the user manages** permission enabled.
    boolean isVisibleInTransactionRooms?;
    # When set to **true**, the user can delete company rooms.
    boolean canDeleteCompanyRooms?;
    # When set to **true**, the user can delete company documents.
    boolean canDeleteCompanyDocuments?;
    # When set to **true**, the user can manage company rooms.
    boolean canManageCompanyRooms?;
    # When set to **true**, the user can manage the company's account.
    boolean canManageCompanyAccount?;
    # When set to **true**, the user can manage the company's shared library.
    boolean canManageCompanySharedLibrary?;
    # When set to **true**, the user can manage other users on the company's account.
    boolean canManageCompanyMembers?;
    # When set to **true**, the user can close company rooms.
    boolean canCloseCompanyRooms?;
    # When set to **true**, the user can approve company checklists.
    boolean canApproveCompanyChecklists?;
    # When set to **true**, the user is a system administrator for the company.
    boolean isCompanySystemAdmin?;
    # When set to **true**, the user is a region manager.
    boolean isRegionManager?;
    # When set to **true**, the user is an office manager.
    boolean isOfficeManager?;
    # When set to **true**, the user is automatically added to new company rooms and is visible in those rooms.
    boolean autoAccessToCompanyRooms?;
};

# A complex element containing the number and type of each object referencing the office.
public type OfficeReferenceCount record {
    # The type of object referencing the office.
    string referenceType?;
    # The number of objects of this type referencing the office.
    int referencedCount?;
};

# The `ContactSides` resource provides a method that enables you to retrieve a list of valid values for transaction contact sides.
public type ContactSides record {
    # The id of the contact side.
    # 
    # Example: `L`
    string contactSideId?;
    # The name of the office.
    string name?;
};

# Contains a list of supported currencies.
public type GlobalCurrencies record {
    # A list of currency objects.
    Currency[] currencies?;
};

# This request object contains the information that you want to update for the room user.
public type RoomUserForUpdate record {
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
};

# Contains information about a task responsibility type.
public type TaskResponsibilityType record {
    # The id of the task responsibility type.
    string taskResponsibilityTypeId?;
    # The name of the task responsibility type. The possible values are:
    # 
    # - `Assignee`
    # - `Watcher`
    # - `Reviewer`
    string name?;
};

# Contains details about permissions.
public type Permissions record {
    # When set to **true**, users can see the **Invite** button on the room's **People** tab and can invite people into a room.
    boolean canAddUsersToRooms?;
    # When set to **true**, users can see the **New** button on the **Rooms** tab and can create a room.
    boolean canCreateRooms?;
    # When set to **true**, users can submit rooms for review that are owned by them or someone they manage.
    boolean canSubmitRoomsForReview?;
    # When set to **true**, users can review and close rooms that are owned by them or someone they manage.
    boolean canCloseRooms?;
    # When set to **true**, users can reopen rooms that are owned by them or someone they manage.
    boolean canReopenRooms?;
    # When set to **true**, the user can delete rooms that are owned by them or someone they manage.
    boolean canDeleteOwnedRooms?;
    # When set to **true**, users are automatically added to new rooms when someone with an internal role in their office or region creates or is invited to a room.
    boolean autoAccessToRooms?;
    # When set to **true**, users can export the details, people, and history of a room to a PDF or CSV file.
    boolean canExportRoomActivityDetailsPeople?;
    # When set to **true**, users who also have the `autoAccessToRooms` permission enabled are visible in those rooms.
    boolean isVisibleInRooms?;
    # When set to **true**, users see a **Copy** room option in the room **Actions** menu, which copies the room's detail information to populate a new room.
    boolean canCopyRoomDetails?;
    # When set to **true**, users see a **Edit** room option in the room **Actions** menu, which edits the room's role information.
    boolean canEditAnyRoomRole?;
    # When set to **true**, users see a **Edit** room option in the room **Actions** menu, which edits the invited room's role information.
    boolean canEditInvitedRoomRole?;
    # When set to **true**, users see a **Edit** room option in the room **Actions** menu, which edits the room's side information.
    boolean canEditRoomSide?;
    # When set to **true**, users see a **Manage** room option in the room **Actions** menu, which edits the room's access information.
    boolean canManageAnyUserRoomAccess?;
    # When set to **true**, users see a **Manage** room option in the room **Actions** menu, which edits the invited room's access information.
    boolean canManageInvitedUserRoomAccess?;
    # When set to **true**, shows if he is hidden in room.
    boolean isHiddenInRoom?;
    # When set to **true**, users see a **Manage** room option.
    boolean canManageRoomOwners?;
    # When set to **true**, users see a **Delete** room option.
    boolean canDeleteRooms?;
    # When set to **true**, users see a **ConnectToMortgageCadence** room option.
    boolean canConnectToMortgageCadence?;
    # When set to **true**, users can view all room detail fields that the company Admin has set to **Use**.
    boolean canViewRoomDetails?;
    # When set to **true**, users can view and make edits to any room detail fields.
    boolean canViewAndEditRoomDetails?;
    # When set to **true**, users see a **SendRoomDetailsToLoneWolf** room option.
    boolean canSendRoomDetailsToLoneWolf?;
    # When set to **true**, users can add documents to rooms and share the documents that they own with other people in the room.
    boolean canAddDocuments?;
    # When set to **true**, users can add documents from form groups to rooms.
    boolean canAddDocumentsFromFormGroups?;
    # When set to **true**, users can add documents from form libraries to rooms.
    boolean canAddDocumentsFromFormLibraries?;
    # When a user for whom this permission is set to **true** adds a document, the document is automatically shared with other room users that are in the user's office.
    boolean documentsViewableByOthersInRoomFromOffice?;
    # When a user for whom this permission is set to **true** adds a document, the document is automatically seen and owned by those users' peers. Peers are others in the same office or region who have the same access level as the user.
    boolean documentsAutoOwnedByPeers?;
    # When set to **true**, users can delete documents that they own from rooms.
    boolean canDeleteOwnedDocuments?;
    # When set to **true**, users can manage all documents, including ones that another user has shared with them.
    boolean canManageSharedDocs?;
    # When set to **true**, users have access to **Admin > Forms** and can manage form groups and form libraries for the company.
    boolean canManageFormGroups?;
    # When set to **true**, users can share documents that they do not own (documents that another user has shared with them).
    boolean canShareDocsNotOwned?;
    # When set to **true**, users can add tasks to any task list, including lists that they do not own.
    boolean canAddTasksToAnyTaskLists?;
    # When set to **true**, users can edit editable tasks.
    boolean canEditEditableTasks?;
    # When set to **true**, users can edit tasks in rooms, even if the task owner has not marked the task as editable.
    boolean canEditAnyTasks?;
    # When set to **true**, users can delete deletable tasks.
    boolean canDeleteDeletableTasks?;
    # When set to **true**, users can delete tasks, even if the task owner has not marked the task as deletable.
    boolean canDeleteAnyTasks?;
    # When set to **true**, users see the **Attach Task List** option in the room's **Actions** menu and can apply task lists to rooms.
    boolean canApplyTaskList?;
    # When set to **true**, users can use the **Remove Task List** option in the room's **Actions** menu to remove task lists owned by others.
    # 
    # **Note**: Users can already remove task lists that they own.
    boolean canRemoveAnyTaskList?;
    # When set to **true**, users can use the **Submit Task List** option in the room's **Actions** menu to submit task lists for review.
    boolean canSubmitTaskList?;
    # When set to **true**, users can use the **Submit Task List** option in the room's **Actions** menu to submit task lists for review.
    boolean canAutoSubmitTaskList?;
    # When set to **true**, users can approve or decline a task list. Declining a task list sends it back to open status for the assignee to complete. The assignee also receives a notification.
    boolean canReviewTaskList?;
    # When set to **true** and a room is approved, the task lists associated with the room auto-approve if all of the tasks are approved.
    boolean canAutoApproveTaskList?;
    # When set to **true**, users have access to the **Admin > Company > Task List Templates** menu so that they can create, edit, and delete task list templates for all regions and offices.
    boolean canManageTaskTemplatesForAllRegionsAllOffices?;
    # When set to **true**, users can apply a room template when they create a room.
    boolean canApplyRoomTemplates?;
    # When set to **true**, users can add tasks to rooms.
    boolean canAddTasksToRooms?;
    # When set to **true**, users can review tasks of rooms.
    boolean canReviewAnyTask?;
    # When set to **true**, users can add manage docs on any task of rooms.
    boolean canManageDocsOnAnyTask?;
    # When set to **true**, users can add other users with a lower access level than their own to offices or regions that they oversee and set those users' roles.
    boolean canAddMemberAndSetRoleLowerAccessLevel?;
    # When set to **true**, users can add other users with the same access level as their own to offices or regions that they oversee and set those users' roles.
    boolean canAddMemberAndSetRoleSameAccessLevel?;
    # When set to **true**, users can edit the roles of other users who have a lower access level than their own and that belong to offices or regions that they oversee.
    boolean canChangeMemberRoleLowerAccessLevel?;
    # When set to **true**, users can edit the roles of other users who have the same access level as their own and that belong to offices or regions that they oversee.
    boolean canChangeMemberRoleSameAccessLevel?;
    # When set to **true**, users can change the access level, office, region, and eSignature permission set of other users who have a lower access level than their own.
    boolean canManageMemberLowerAccessLevel?;
    # When set to **true**, users can change the access level, office, region, and eSignature permission set of other users who have the same access level as their own.
    boolean canManageMemberSameAccessLevel?;
    # When set to **true**, users can remove other users who have a lower access level than their own and that belong to offices or regions that they oversee from the company account.
    boolean canRemoveCompanyMemberLowerAccessLevel?;
    # When set to **true**, users can remove other users who have the same access level as their own and that belong to offices or regions that they oversee from the company account.
    boolean canRemoveCompanyMemberSameAccessLevel?;
    # When set to **true**, users can access the **Company Settings** tab under **Rooms > Admin > Company** to manage company account settings and change the company name, contact information, currency, offices, and regions.
    boolean canManageAccount?;
    # When set to **true**, users can access the **Company Logo** section in **Company Settings** to add or change the company logo.
    boolean canManageLogo?;
    # When set to **true**, users can add manage roles and permissions of rooms.
    boolean canManageRolesAndPermissions?;
    # When set to **true**, users see the **Room Details** tab under **Rooms > Admin > Company** and can use it to configure room details. They can also add additional contact fields.
    boolean canManageRoomDetails?;
    # When set to **true**, users see the **Room Templates** option in the **Rooms > Admin** menu, which enables them to add, edit, and delete room templates.
    boolean canManageRoomTemplates?;
    # When set to **true**, users can add manage integration settings of rooms.
    boolean canManageIntegrationSettings?;
};

# Contains a list of task list templates.
public type TaskListTemplateList record {
    # A list of task list templates.
    TaskListTemplate[] taskListTemplates?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# This complex type contains information about assignable roles.
public type AssignableRoles record {
    # The id of the invitee's company-level role. This property lets the requester know what room-level role will give the user the same permissions that they have at the company level. A value is returned only when both the requester and the invitee are internal to the company.
    int currentRoleId?;
    # An array of `role` objects.
    RoleSummary[] roles?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Access level
public type AccessLevel string;

# Details about a contact side.
public type ContactSide record {
    # The id of the contact side.
    # 
    # Example: `L`
    string contactSideId?;
    # The name of the contact side.
    # 
    # Example: `Listing`
    string name?;
};

# Details about a locked account.
public type LockedOutDetails record {
    # The reason the account was locked.
    string reason;
};

# Contains details about a company role.
public type Role record {
    # In Rooms v6, this is the id of the company role assigned to the user.
    int roleId?;
    # The legacy name of the role in Rooms Version 5.
    string legacyRoleId?;
    # The name of the role.
    string name?;
    # When **true**, the role is the default for account administrators.
    boolean isDefaultForAdmin?;
    # When set to **true**, the role is an external role. You assign external roles to people from outside your company when you invite them into a room.
    boolean isExternal?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # When set to **true**, indicates that this role is currently assigned to a user.
    boolean isAssigned?;
    # Contains details about permissions.
    Permissions permissions?;
};

# This object contains information about the region associated with the member.
public type DesignatedRegion record {
    # (Required) The id of the region. This is the id that the system generated when you created the region.
    int regionId;
};

# The fields resource provides a method that enables you to retrieve a specific field set. This is a set of fields that can appear on a room's **Details** tab.
public type Fields record {
    # The id of the field.
    # 
    # Example: `10318d28-xxxx-xxxx-xxxx-d3df664f602c`
    string fieldId?;
    # The id of the DocuSign field definition from which this field derives. When an Admin user configures a field set by using the API, this is the id that they use to add this field definition to the field set. The original field definition associated with this id contains more information about the field, such as the default title, default API name, and configurations such as the maximum length or the maximum value allowed.
    string fieldDefinitionId?;
    # Title of the fields
    string title?;
    # The name that the Rooms API uses for the field. 
    # 
    # Example: `companyContactName`
    # 
    # **Note**: When you create a new room, you use the `apiName` values for fields to specify the details that you want to appear on the room's **Details** tab.
    string apiName?;
    # Type of the fields
    string 'type?;
    # An array of fields.
    Field[] fields?;
    # Contains details about how a field is configured.
    FieldConfiguration configuration?;
    # Contains information about whether the field is required when a room is created or submitted for review.
    CustomData customData?;
};

# The `TransactionSides` resource provides a method that enables you to list possible real estate transaction sides. 
public type TransactionSides record {
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
    # The name of the office.
    string name?;
};

# Contains a list of room contact types.
public type GlobalRoomContactTypes record {
    # A list of room contact types.
    RoomContactType[] roomContactTypes?;
};

# Contains details about a room template.
public type RoomTemplate record {
    # The id of the room template.
    int roomTemplateId?;
    # The name of the office.
    string name?;
    # The total number of task templates that the room template uses.
    int taskTemplateCount?;
};

# Contains information about a state.
public type State record {
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # The name of the state. Possible values are:
    # 
    # - `Alberta`
    # - `Auckland`
    # - `New South Wales`
    # - `Alabama`
    # - `Alaska`
    # - `Bay of Plenty`
    # - `British Columbia`
    # - `Queensland`
    # - `South Australia`
    # - `Manitoba`
    # - `Canterbury`
    # - `Arizona`
    # - `Arkansas`
    # - `New Brunswick`
    # - `Tasmania`
    # - `Hawke's Bay`
    # - `Manawatu-Wanganui`
    # - `Victoria`
    # - `Newfoundland and Labrador`
    # - `California`
    # - `Colorado`
    # - `Western Australia`
    # - `Northwest Territories`
    # - `Northland`
    # - `Otago`
    # - `Australian Capital Territory`
    # - `Nova Scotia`
    # - `Connecticut`
    # - `Delaware`
    # - `Nunavut`
    # - `Northern Territory`
    # - `Southland`
    # - `Taranaki`
    # - `Ontario`
    # - `District of Columbia`
    # - `Florida`
    # - `Prince Edward Island`
    # - `Waikato`
    # - `Wellington`
    # - `Quebec`
    # - `Georgia`
    # - `Guam`
    # - `Saskatchewan`
    # - `West Coast`
    # - `Gisborne District`
    # - `Yukon`
    # - `Hawaii`
    # - `Idaho`
    # - `Marlborough District`
    # - `Nelson City`
    # - `Illinois`
    # - `Indiana`
    # - `Tasman District`
    # - `Chatham Islands Territory`
    # - `Iowa`
    # - `Kansas`
    # - `Kentucky`
    # - `Louisiana`
    # - `Maine`
    # - `Maryland`
    # - `Massachusetts`
    # - `Michigan`
    # - `Minnesota`
    # - `Mississippi`
    # - `Missouri`
    # - `Montana`
    # - `Nebraska`
    # - `Nevada`
    # - `New Hampshire`
    # - `New Jersey`
    # - `New Mexico`
    # - `New York`
    # - `North Carolina`
    # - `North Dakota`
    # - `Ohio`
    # - `Oklahoma`
    # - `Oregon`
    # - `Pennsylvania`
    # - `Puerto Rico`
    # - `Rhode Island`
    # - `South Carolina`
    # - `South Dakota`
    # - `Tennessee`
    # - `Texas`
    # - `US Virgin Islands`
    # - `Utah`
    # - `Vermont`
    # - `Virginia`
    # - `Washington`
    # - `West Virginia`
    # - `Wisconsin`
    # - `Wyoming`
    string name?;
};

# Contains a list of task list summaries.
public type TaskListSummaryList record {
    # A list of task list summaries.
    TaskListSummary[] taskListSummaries?;
};

# This request object contains details about the person who you want to invite.
public type ClassicAdminToInvite record {
    # (Required) The user's first name.
    string firstName;
    # (Required) The user's last name.
    string lastName;
    # (Required) The user's email address.
    string email;
};

# Contains information about a region.
public type Region record {
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # The name of the office.
    string name;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
};

# Contains a list of supported countries.
public type GlobalCountries record {
    # An array of country objects.
    Country[] countries?;
};

# Contains a list of transaction sides.
public type GlobalTransactionSides record {
    # A list of transaction sides.
    TransactionSide[] transactionSides?;
};

# Contains information about a room contact type.
public type RoomContactType record {
    # The id of the room contact type.
    # 
    # Example: `lisagent` (for `Listing Agent`)
    string id?;
    # The name of the room contact type. Possible values are:
    # 
    # - `Seller`
    # - `Listing Agent`
    # - `Buyer`
    # - `Buyer Agent`
    # - `Service Provider`
    # - `Transaction Coordinator`
    # - `Mortgage Provider`
    # - `Title Provider`
    # - `Insurance Provider`
    # - `Home Warranty Provider`
    # - `Survey Provider`
    # - `Escrow Provider`
    # - `Buyer Broker`
    # - `Listing Broker`
    string name?;
};

# The `OriginsOfLeads` resource enables you to get a list of property types (such as ????) that you can specify for rooms.
public type PropertyTypes record {
    # The id of the property type.
    # 
    # Example: `resd` (for `Residential Detached`)
    string propertyTypeId?;
    # The name of the office.
    string name?;
};

# 
public type RoomStatus string;

# Contains details about a user.
public type User record {
    # The id of the user.
    int userId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # When set to **true**, an administrator has locked the user's account. For example, an administrator might want to lock an agent's account after they leave the brokerage until they determine how to transfer the agent's rooms and data to another active user.
    boolean isLockedOut?;
    # The user's status. Read only. Possible values are:
    # 
    # - `Active`: The user is active.
    # - `Pending`: The user has been invited but has not yet accepted the invitation.
    string status?;
    # Access level
    AccessLevel accessLevel?;
    # The id of the user's default office.
    int defaultOfficeId?;
    # In Rooms Version 5, this is the id of the custom job title for a Manager role within your company. For example, your company might have the custom job titles "Transaction Coordinator" and "Office Manager".
    # 
    # **Note**: If you are using Rooms Version 5, you must enter a `titleId` when using the Users::InviteClassicManager method. (The `titleId` property is empty for Agent users on Rooms Version 5.) If you are using Rooms Version 6, use the Users::InviteUser method with the `roleId` property instead.
    int titleId?;
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # The URL for the user's profile image.
    string profileImageUrl?;
    # An array of office ids for the offices in which a user with an `Office` or `Contributor` `accessLevel` has been granted the ability to participate.
    int[] offices?;
    # An array of region ids for the regions in which a user with the `Region accessLevel` has been granted the ability to participate.
    int[] regions?;
    # This object contains details about user permissions. These permissions are associated only with Rooms v5.
    ClassicManagerPermissions permissions?;
};

# Description of a single form in a group.
public type GroupForm record {
    # The id of the form.
    # 
    # Example: `5be324eb-xxxx-xxxx-xxxx-208065181be9`
    string formId?;
    # The name of the office.
    string name?;
    # **True** if the form is required.
    boolean isRequired?;
    # The UTC date and time when the item was last updated. This is a read-only value that the service assigns.
    # 
    # Example: 2019-07-17T17:45:42.783Z
    string lastUpdatedDate?;
};

# Contains a list of seller decision types.
public type GlobalSellerDecisionTypes record {
    # A list of seller decision types.
    SellerDecisionType[] sellerDecisionTypes?;
};

# This request object contains the information to use to update a user's default office. 
public type UserForUpdate record {
    # (Required) The id of the user's default office.
    int defaultOfficeId;
};

# Contains details about the form that you want to add.
public type FormForAdd record {
    # (Required) The id of the form.
    string formId;
};

# Contains a list of time zones.
public type GlobalTimeZones record {
    # A list of time zones.
    TimeZone[] timeZones?;
};

# The `FormLibraries` resource enables you to access standard real estate industry association forms and add them to rooms. 
public type FormLibraries record {
    # The id of the form library.
    # 
    # Example: `402c6e2f-xxxx-xxxx-xxxx-ff3f249f6da9`
    string formsLibraryId?;
    # The name of the office.
    string name?;
    # The number of forms in the form library. 
    # 
    # Example: `50`
    int formCount?;
};

# Contains a list of form groups.
public type FormGroupSummaryList record {
    # A list of form groups.
    FormGroupSummary[] formGroups?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains a list of special circumstance types.
public type GlobalSpecialCircumstanceTypes record {
    # A list of special circumstance types.
    SpecialCircumstanceType[] specialCircumstanceTypes?;
};

# Contains the details required to create a form fill session.
public type ExternalFormFillSessionForCreate record {
    # (Required) The id of the form.
    # 
    # Example: `5be324eb-xxxx-xxxx-xxxx-208065181be9`
    string formId;
    # (Required) The id of the room.
    int roomId;
    # (Optional) This property specifies the origin on which the page is allowed to display in a frame.
    string xFrameAllowedUrl?;
};

# This complex type contains information about room templates.
public type RoomTemplatesSummaryList record {
    # An array of `roomTemplate` objects.
    RoomTemplate[] roomTemplates?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains details about a field in a field set.
public type Field record {
    # An id that uniquely identifies the instance of a `fieldDefinition` within a field set.
    string fieldId?;
    # The id of the DocuSign field definition from which this field derives. When an Admin user configures a field set by using the API, this is the id that they use to add this field definition to the field set. The original field definition associated with this id contains more information about the field, such as the default title, default API name, and configurations such as the maximum length or the maximum value allowed.
    string fieldDefinitionId?;
    # The human-readable title or name of the field.
    # 
    # Example: `Company contact name`
    string title?;
    # The name that the Rooms API uses for the field. 
    # 
    # Example: `companyContactName`
    # 
    # **Note**: When you create a new room, you use the `apiName` values for fields to specify the details that you want to appear on the room's **Details** tab.
    string apiName?;
    # The type of field. The valid values are:
    # 
    # - `Date`
    # - `Text`
    # - `Checkbox`
    # - `Currency`
    # - `Numeric`
    # - `SelectList`
    # - `TextArea`
    # - `Percentage`
    # - `Integer`
    string 'type?;
    # An array of subfields.
    Field[] fields?;
    # Contains details about how a field is configured.
    FieldConfiguration configuration?;
    # Contains information about whether the field is required when a room is created or submitted for review.
    CustomData customData?;
};

# Contains a list of supported states.
public type GlobalStates record {
    # A list of states.
    State[] states?;
};

# A complex element containing the number and type of each object referencing the region.
public type RegionReferenceCount record {
    # The type of object referencing the region.
    string referenceType?;
    # The number of objects of this type referencing the region.
    int referenceCount?;
};

# Contains a list of each type of object and the number of objects of that type referencing the region.
public type RegionReferenceCountList record {
    # A list of each type of object and the number of objects of that type referencing the region.
    RegionReferenceCount[] referenceCounts?;
};

# Information about a room folder.
public type RoomFolder record {
    # The ID of the folder.
    int roomFolderId?;
    # The name of the folder.
    string name?;
    # When **true**, this is the default folder.
    boolean isDefault?;
};

# This request object contains information about the user that you are inviting.
public type UserToInvite record {
    # (Required) The user's first name.
    string firstName;
    # (Required) The user's last name.
    string lastName;
    # (Required) The user's email address.
    string email;
    # (Required) In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who are not part of your organization.
    int roleId;
    # Access level
    AccessLevel accessLevel;
    # (Required) The id of the user's default office.
    int defaultOfficeId;
    # An array of region ids for the regions in which a user with the `Region accessLevel` has been granted the ability to participate. If the value for `accessLevel` is `Region`, this property is required.
    int[] regions?;
    # An array of office ids for the offices in which a user with an `Office` or `Contributor` `accessLevel` has been granted the ability to participate. If the value for `accessLevel` is `Office`, this property is required.
    int[] offices?;
    # (Required) When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. The eSignPermissionProfileId is the id of the eSignature permission set to assign to the member.
    string eSignPermissionProfileId;
    # URL to redirect to after inviting.
    string redirectUrl?;
};

public type DocumentsContentsBody record {
    # Document
    string file?;
};

# The `TaskLists` resource helps you keep track of the documents and activities you must complete before you can close a room.
public type TaskLists record {
    # The id of the task list.
    int taskListId?;
    # The name of the office.
    string name?;
    # The id of the task list template.
    int taskListTemplateId?;
    # The UTC DateTime when the room was submitted for review.
    # 
    # **Note**: In Rooms v5, this is when an agent submitted the room to a manager. In Rooms v6, this is when a member with a role for which the **Submit rooms for review** permission is set to **true** submitted the room to a member with a role for which the **Review and close rooms** permission is set to **true**.
    string submittedForReviewDate?;
    # Approval date
    string approvalDate?;
    # The date on which the reviewer rejected the room. For example, a reviewer might reject closing a room if documentation is missing or the details are inaccurate.
    string rejectedDate?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # Approved by user ID
    int approvedByUserId?;
    # The id of the user who rejected the room.
    int rejectedByUserId?;
    # Task comments
    string comment?;
    # A list of tasks in the task list.
    TaskSummary[] tasks?;
};

# Contains a list of task date types.
public type GlobalTaskDateTypes record {
    # A list of task date types.
    TaskDateType[] taskDateTypes?;
};

# Contains information about a seller decision type.
public type SellerDecisionTypes record {
    # The id of the seller decision type.
    # 
    # Example: `appr` (for `Approved`)
    string sellerDecisionTypeId?;
    # The name of the seller decision type.
    string name?;
};

# This object contains a list of eSignature permission profiles.
public type ESignPermissionProfileList record {
    # An array of eSignature `permissionProfile` objects.
    ESignPermissionProfile[] permissionProfiles?;
};

# Contains details about a room.
public type Room record {
    # The id of the room.
    int roomId?;
    # The id of the company.
    int companyId?;
    # The name of the room.
    string name?;
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The UTC date and time when the item was created. This is a read-only value that the service assigns.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    string createdDate?;
    # The UTC DateTime when the room was submitted for review.
    # 
    # **Note**: In Rooms v5, this is when an agent submitted the room to a manager. In Rooms v6, this is when a member with a role for which the **Submit rooms for review** permission is set to **true** submitted the room to a member with a role for which the **Review and close rooms** permission is set to **true**.
    string submittedForReviewDate?;
    # The UTC date and time when the room was closed.
    string closedDate?;
    # The date on which the reviewer rejected the room. For example, a reviewer might reject closing a room if documentation is missing or the details are inaccurate.
    string rejectedDate?;
    # The id of the user who created the room.
    int createdByUserId?;
    # The id of the user who rejected the room.
    int rejectedByUserId?;
    # The reason why a room was closed. Possible values are:
    # 
    # - `sold`: Property sold.
    # - `dup`: Duplicate room.
    # - `escrcncl`: Escrow canceled.
    # - `inspctn`: Inspection issues.
    # - `exp`: Listing expired.
    # - `lostbuy`: Buyer withdrew.
    # - `list`: Listing withdrawn. 
    # - `newlist`: New listing.
    # - `offrrjct`: Offer not accepted.
    # - `pend`: Pending. An agent might use this status to temporarily hide a room from their Active rooms view if they are blocked on a task. When they are ready to reopen the room, they can quickly find it by filtering for rooms in `pending` status.
    # - `lstcanc`: Listing canceled. 
    # - `lstleave`: Listing released.
    # - `sellwtdw`: Seller withdrew.
    # - `nofin`: Buyer unable to finance.
    # - `disciss`: Property disclosure issue.
    # - `appiss`: Appraisal issues.
    # - `mtgiss`: Mortgage issues. Use when details about why the buyer wasn't able to obtain financing are unknown.
    # - `zoniss`: Zoning issues.
    # - `attiss`: Attorney review issues.
    # - `proplsd`: Property leased. Use for the list side of the transaction.
    # - `tenlease`: Tenant signed lease. Use when an agent helps renters find a to lease.   
    string closedStatusId?;
    # The field data associated with a room. See [Rooms::GetRoomFieldData](/rooms-api/reference/Rooms/Rooms/GetRoomFieldData).
    FieldData fieldData?;
};

# This object contains details about a specific room member.
public type RoomUser record {
    # The id of the user.
    int userId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
    # The id of the user's role.
    int roleId?;
    # When set to **true**, indicates that the user's access to the room has been revoked.
    boolean isRevoked?;
    # The `userId` of the person who invited the room user to the room.
    int invitedByUserId?;
};

# Contains a list of property types.
public type GlobalPropertyTypes record {
    # A list of property types.
    PropertyType[] propertyTypes?;
};

# Contains a list of activity types.
public type GlobalActivityTypes record {
    # A list of activity types.
    ActivityType[] activityTypes?;
};

# Contains a list of task responsibility types.
public type GlobalTaskResponsibilityTypes record {
    # A list of task responsibility types.
    TaskResponsibilityType[] taskResponsibilityTypes?;
};

# Details about an activity type.
public type ActivityType record {
    # The id of the activity type.
    # 
    # Example: `movefrominbx`
    string activityTypeId?;
    # The name of the activity type.
    # 
    # Example: `Document Moved from Inbox`
    string name?;
};

# Contains a list of contact sides.
public type GlobalContactSides record {
    # A list of contact sides.
    ContactSide[] contactSides?;
};

# Details for removal.
public type RoomUserRemovalDetail record {
    # The date on which the users room access should be revoked
    # in ISO 8601 fomat: `1973-12-31T07:54Z`.
    string revocationDate?;
};

# This object contains details about the permissions associated with a eSignature permission profile.
public type ESignAccountRoleSettings record {
    # A Boolean specifying whether users with this eSignature permission profile can manage the Rooms account. This property is read only and has the following values:
    # 
    # - `DS Admin` permission profile: **true**
    # - `DS Sender` permission profile: **false**
    # - `DS Viewer` permission profile: **false**
    boolean allowAccountManagement?;
};

# Contains information about a closing status, or reason for closing a room.
public type ClosingStatus record {
    # The id of the closing status.
    # 
    # Example: `exp`
    string closingStatusId?;
    # The name of the closing status.
    # 
    # Example: `Listing Expired`
    string name?;
};

# A complex element containing summary information on a region; the elements of this object are identical to those of the `Regions` object.
public type RegionSummary record {
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # String that specifies the region name.
    string name?;
    # UTC datetime that the region was created (for example "2019-06-27T19:32:46.943"). Note that the service assigns this value, so it is read-only.
    string createdDate?;
};

# Contains a list of users.
public type UserSummaryList record {
    # A list of users.
    UserSummary[] userSummaries?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# Contains information about a financing type.
public type FinancingType record {
    # The id of the financing type.
    # 
    # Example: `conv` (for `Conventional`)
    string financingTypeId?;
    # The name of the financing type. Possible values are:
    # 
    # - `Cash`
    # - `Conventional`
    # - `FHA`
    # - `VA`
    # - `USDA`
    # - `Bitcoin`
    # - `Other`
    string name?;
};

# This response object contains the URL for the uploaded picture.
public type RoomPicture record {
    # The URL for the uploaded picture.
    string url?;
};

# 
public type MemberSortingOption string;

# Contains information about a real estate transaction side.
public type TransactionSide record {
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
    # The name of the transaction side. Valid values are:
    # 
    # - `List Side`
    # - `Buy Side`
    # - `List & Buy Side`
    # - `Refinance`
    string name?;
};

# Contains information about a parent field on which this field depends.
public type DependsOn record {
    # The child field action that depends on the parent field.
    # 
    # Example: `visibility`
    # 
    # For example, in the console, you must select a country for a list of states to become visible.
    string actionType?;
    # The name that the Rooms API uses for the parent field.
    # 
    # Example: `country`
    string parentApiName?;
};

# User information to grant access
public type DocumentUserForCreate record {
    # The id of the user.
    int userId;
};

# This complex type contains details about the roles that are associated with an account.
public type RoleSummaryList record {
    # An array of `role` objects.
    RoleSummary[] roles?;
    # The number of results returned in this response.
    int resultSetSize?;
    # The starting zero-based index position of the results set. When this property is used as a query parameter, the default value is `0`.
    int startPosition?;
    # The last zero-based index position in the result set.
    int endPosition?;
    # The URI for the next chunk of records based on the search request. This property is `null` for the last set of search results.
    string nextUri?;
    # The URI for the previous chunk of records based on the search request. This property is `null` for the first set of search results.
    string priorUri?;
    # Total row count
    int totalRowCount?;
};

# This request object contains details about the person who you want to invite.
public type ClassicManagerToInvite record {
    # (Required) The user's first name.
    string firstName;
    # (Required) The user's last name.
    string lastName;
    # (Required) The user's email address.
    string email;
    # (Required) The id of the user's default office.
    int defaultOfficeId;
    # (Required) In Rooms v5, this is the id of the custom job title for a Manager role within your company. For example, your company might have the custom job titles "Transaction Coordinator" and "Office Manager".
    # 
    # **Note**: If you are using Rooms v6, use the Users::InviteUser method with the roleId property instead.
    int titleId;
    # Access level
    AccessLevel accessLevel;
    # This object contains details about user permissions. These permissions are associated only with Rooms v5.
    ClassicManagerPermissions permissions;
    # An array of office ids for the offices to which the user belongs.
    # 
    # **Note**: You only specify the `offices` property when the user's `accessLevel` is `office`.
    int[] offices?;
    # An array of region ids for the regions to which the user belongs.
    # 
    # **Note**: You only specify the `regions` property when the user's `accessLevel` is `region`.
    int[] regions?;
    # (Required) When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. The eSignPermissionProfileId is the id of the eSignature permission set to assign to the member.
    string eSignPermissionProfileId?;
};

# Contains a list of valid closing statuses, or reasons for closing a room.
public type GlobalClosingStatuses record {
    # A list of closing statuses (reasons for closing a room).
    ClosingStatus[] closingStatuses?;
};

# Contains details about a room user.
public type RoomUserSummary record {
    # The id of the user.
    int userId?;
    # The user's email address.
    string email?;
    # The user's first name.
    string firstName?;
    # The user's last name.
    string lastName?;
    # The id of the transaction side. Valid values are:
    # 
    # - `buy`
    # - `sell`
    # - `listbuy`
    # - `refi`
    string transactionSideId?;
    # In Rooms v6, this is the id of the company role assigned to the user.
    # 
    # You can assign external roles to users who aren't a part of your organization.
    # 
    # **Note**: If you are using Rooms v6, you must enter a `roleId` in requests. If you are using Rooms v5, you must enter a value for the `titleId` property instead.
    int roleId?;
    # In Rooms Version 5, this is the id of the custom job title for a Manager role within your company. For example, your company might have the custom job titles "Transaction Coordinator" and "Office Manager".
    # 
    # **Note**: If you are using Rooms Version 5, you must enter a `titleId` when using the Users::InviteClassicManager method. (The `titleId` property is empty for Agent users on Rooms Version 5.) If you are using Rooms Version 6, use the Users::InviteUser method with the `roleId` property instead.
    int titleId?;
    # The company name.
    string companyName?;
    # Role name
    string roleName?;
};

# When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. This object contains information about the eSignature permission profile, which controls member access to the eSignature account. 
public type ESignPermissionProfile record {
    # When an administrator or authorized member invites a new user to become an account member, the system also creates an eSignature account for the invitee at the same time. The `eSignPermissionProfileId` is the id of the eSignature permission set to assign to the member.
    string eSignPermissionProfileId?;
    # The name of the eSignature permission profile. Valid values are:
    string name?;
    # This object contains details about the permissions associated with a eSignature permission profile.
    ESignAccountRoleSettings settings?;
};

# Contains details about a form group.
public type FormGroupSummary record {
    # The ID of the form group.
    # 
    # Example: `7b879c89-xxxx-xxxx-xxxx-819d6a85e0a1`
    string formGroupId?;
    # The name of the form group. 
    # 
    # Example: `Apartment Rental`
    string name?;
    # The number of forms in the form group.
    # 
    # Example: `10`
    int formCount?;
};

# Contains details about a specific form library.
public type FormLibrarySummary record {
    # The id of the form library.
    # 
    # Example: `402c6e2f-xxxx-xxxx-xxxx-ff3f249f6da9`
    string formsLibraryId?;
    # The name of the form library.
    # 
    # Example: `MOR - Mainstreet Organization of Realtors`
    string name?;
    # The number of forms in the form library. 
    # 
    # Example: `50`
    int formCount?;
};

# The `RoomContactTypes` resource provides a method that enables you to retrieve a list of room contact types, such as Buyer, Seller, and Listing Agent.
public type RoomContactTypes record {
    # The id of the room contact type.
    # 
    # Example: `lisagent` (for `Listing Agent`)
    string id?;
    # The name of the office.
    string name?;
};

# 
public type RoomUserSortingOption string;

# Object that contains information about an office in the Rooms account.
public type Offices record {
    # The id of the office. This is the id that the system generated when you created the office.
    int officeId?;
    # The name of the office.
    string name;
    # The id of the region. This is the id that the system generated when you created the region.
    int regionId?;
    # First line of the office street address.
    string address1?;
    # Second line of the office street address.
    string address2?;
    # City name or metropolitan area of the office address.
    string city?;
    # A concatenation of the two-letter country code with the state/province/region of the office address.
    # 
    # Example: `US-OH` (for Ohio)
    string stateId?;
    # Postal code or ZIP code of the office address.
    string postalCode?;
    # The two-letter country code of the office address (for example, "UK" for United Kingdom).
    string countryId?;
    # The id of the time zone for the office address.
    # 
    # Example: `eastern` (for the Eastern US Time Zone)
    string timeZoneId?;
    # Phone number of the office.
    string phone?;
    # The UTC DateTime when the office was created.
    # 
    # Example: `2019-07-17T17:45:42.783Z`
    # 
    # **Note**: This value is read-only.
    string createdDate?;
};
