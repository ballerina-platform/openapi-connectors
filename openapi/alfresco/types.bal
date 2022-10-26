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

public type NodeAssociationPaging record {
    NodeassociationpagingList list?;
};

public type FavoriteSiteEntry record {
    FavoriteSite entry;
};

public type SitemembershiprequestwithpersonpagingList record {
    Pagination pagination;
    SiteMembershipRequestWithPersonEntry[] entries;
};

public type Rendition record {
    string id?;
    ContentInfo content?;
    string status?;
};

public type SiteMember record {
    string id;
    Person person;
    string role;
    boolean isMemberOfGroup?;
};

public type NodeBodyUpdate record {
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name?;
    string nodeType?;
    string[] aspectNames?;
    record {} properties?;
    PermissionsBody permissions?;
};

public type Node record {
    string id;
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name;
    string nodeType;
    boolean isFolder;
    boolean isFile;
    boolean isLocked = false;
    string modifiedAt;
    UserInfo modifiedByUser;
    string createdAt;
    UserInfo createdByUser;
    string parentId?;
    boolean isLink?;
    boolean isFavorite?;
    ContentInfo content?;
    string[] aspectNames?;
    record {} properties?;
    string[] allowableOperations?;
    PathInfo path?;
    PermissionsInfo permissions?;
    Definition definition?;
};

public type SiteGroupPaging record {
    SitegrouppagingList list;
};

public type NodechildassociationpagingList record {
    Pagination pagination?;
    NodeChildAssociationEntry[] entries?;
    Node 'source?;
};

# Activities describe any past activity in a site,
# for example creating an item of content, commenting on a node,
# liking an item of content.
public type Activity record {
    # The id of the person who performed the activity
    string postPersonId;
    # The unique id of the activity
    int id;
    # The unique id of the site on which the activity was performed
    string siteId?;
    # The date time at which the activity was performed
    string postedAt?;
    # The feed on which this activity was posted
    string feedPersonId;
    # An object summarizing the activity
    record {} activitySummary?;
    # The type of the activity posted
    string activityType;
};

public type SitepagingList record {
    Pagination pagination;
    SiteEntry[] entries;
};

public type NodebodycreateAssociation record {
    string assocType?;
};

public type SiteGroup record {
    string id;
    GroupMember group;
    string role;
};

public type SiteRoleEntry record {
    SiteRole entry;
};

public type SiteMembershipRequestEntry record {
    SiteMembershipRequest entry;
};

public type FavoriteBodyCreate record {
    record {} target;
};

public type RenditionEntry record {
    Rendition entry;
};

public type PathElement record {
    string id?;
    string name?;
    string nodeType?;
    string[] aspectNames?;
};

public type SiteRolePaging record {
    SiterolepagingList list;
};

public type SiteMemberEntry record {
    SiteMember entry;
};

public type FavoriteSiteBodyCreate record {
    string id;
};

public type SitePaging record {
    SitepagingList list;
};

public type SiteMembershipRejectionBody record {
    string comment?;
};

public type PasswordResetBody record {
    # the new password
    string password;
    # the workflow id provided in the reset password email
    string id;
    # the workflow key provided in the reset password email
    string 'key;
};

public type CommentpagingList record {
    Pagination pagination;
    CommentEntry[] entries;
};

public type SiteMembershipRequest record {
    string id;
    string createdAt;
    Site site;
    string message?;
};

public type ActionBodyExec record {
    string actionDefinitionId;
    # The entity upon which to execute the action, typically a node ID or similar.
    string targetId?;
    record {} params?;
};

public type PreferencePaging record {
    PreferencepagingList list;
};

public type GroupBodyCreate record {
    string id;
    string displayName;
    string[] parentIds?;
};

public type DeletednodespagingList record {
    Pagination pagination?;
    DeletedNodeEntry[] entries?;
};

public type Definition record {
    # List of property definitions effective for this node as the result of combining the type with all aspects.
    Property[] properties?;
};

public type SiteMembershipBodyUpdate record {
    string role;
};

public type NodeBodyCreate record {
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name;
    string nodeType;
    string[] aspectNames?;
    record {} properties?;
    PermissionsBody permissions?;
    Definition definition?;
    string relativePath?;
    NodebodycreateAssociation association?;
    ChildAssociationBody[] secondaryChildren?;
    AssociationBody[] targets?;
};

public type PersonNetworkEntry record {
    # A network is the group of users and sites that belong to an organization.
    # Networks are organized by email domain. When a user signs up for an
    # Alfresco account , their email domain becomes their Home Network.
    PersonNetwork entry;
};

public type NodeBodyCopy record {
    string targetParentId;
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name?;
};

public type SharedLinkBodyCreate record {
    string nodeId;
    string expiresAt?;
};

# A specific preference.
public type Preference record {
    # The unique id of the preference
    string id;
    # The value of the preference. Note that this can be of any JSON type.
    string value?;
};

public type AuditEntry record {
    string id;
    string auditApplicationId;
    UserInfo createdByUser;
    string createdAt;
    record {} values?;
};

public type SiteMembershipRequestWithPerson record {
    string id;
    string createdAt;
    Site site;
    Person person;
    string message?;
};

public type SharedlinkpagingList record {
    Pagination pagination;
    SharedLinkEntry[] entries;
};

public type RenditionPaging record {
    RenditionpagingList list?;
};

public type Person record {
    string id;
    string firstName;
    string lastName?;
    string displayName?;
    string description?;
    string avatarId?;
    string email;
    string skypeId?;
    string googleId?;
    string instantMessageId?;
    string jobTitle?;
    string location?;
    Company company?;
    string mobile?;
    string telephone?;
    string statusUpdatedAt?;
    string userStatus?;
    boolean enabled;
    boolean emailNotificationsEnabled = true;
    string[] aspectNames?;
    record {} properties?;
    Capabilities capabilities?;
};

public type FavoriteSite record {
    string id;
};

public type SiteContainer record {
    string id;
    string folderId;
};

public type Site record {
    string id;
    string guid;
    string title;
    string description?;
    string visibility;
    string preset?;
    string role?;
};

public type SiteMembershipRequestBodyUpdate record {
    string message?;
};

public type Group record {
    string id;
    string displayName;
    boolean isRoot;
    string[] parentIds?;
    string[] zones?;
};

public type GroupMember record {
    string id;
    string displayName;
    string memberType;
};

public type SiteMembershipRequestWithPersonEntry record {
    SiteMembershipRequestWithPerson entry;
};

public type CommentBody record {
    string content;
};

public type ActivitypagingList record {
    Pagination pagination;
    ActivityEntry[] entries;
};

public type SiteMembershipApprovalBody record {
    string role?;
};

public type ActionDefinitionEntry record {
    ActionDefinition entry;
};

public type ProbeEntry record {
    ProbeentryEntry entry;
};

public type NodeChildAssociationPaging record {
    NodechildassociationpagingList list?;
};

public type GroupMembershipBodyCreate record {
    string id;
    string memberType;
};

public type NodeChildAssociation record {
    *Node;
    ChildAssociationInfo association?;
};

public type ClientBody record {
    # the client name
    string 'client;
};

public type Association record {
    string targetId;
    string assocType;
};

public type DeletedNodeEntry record {
    DeletedNode entry?;
};

public type ChildAssociationEntry record {
    ChildAssociation entry;
};

public type DeletedNode record {
    *Node;
    UserInfo archivedByUser;
    string archivedAt;
};

public type Download record {
    # number of files added so far in the zip
    int filesAdded?;
    # number of bytes added so far in the zip
    int bytesAdded?;
    # the id of the download node
    string id?;
    # the total number of files to be added in the zip
    int totalFiles?;
    # the total number of bytes to be added in the zip
    int totalBytes?;
    # the current status of the download node creation
    string status?;
};

public type AuditAppEntry record {
    AuditApp entry?;
};

public type Property record {
    string id;
    # the human-readable title
    string title?;
    # the human-readable description
    string description?;
    # the default value
    string defaultValue?;
    # the name of the property type (e.g. d:text)
    string dataType?;
    # define if the property is multi-valued
    boolean isMultiValued?;
    # define if the property is mandatory
    boolean isMandatory?;
    # define if the presence of mandatory properties is enforced
    boolean isMandatoryEnforced?;
    # define if the property is system maintained
    boolean isProtected?;
    # list of constraints defined for the property
    Constraint[] constraints?;
};

public type AuditApp record {
    string id;
    string name?;
    boolean isEnabled = true;
    int maxEntryId?;
    int minEntryId?;
};

public type NodeBodyLock record {
    int timeToExpire?;
    string 'type?;
    string lifetime?;
};

public type AssociationBody record {
    string targetId;
    string assocType;
};

public type SiteRole record {
    Site site;
    string id;
    string guid;
    string role;
};

public type AssociationInfo record {
    string assocType;
};

public type PersonEntry record {
    Person entry;
};

public type AuditEntryPaging record {
    AuditentrypagingList list?;
};

public type FavoritePaging record {
    FavoritepagingList list;
};

public type SharedLink record {
    string id?;
    string expiresAt?;
    string nodeId?;
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name?;
    string title?;
    string description?;
    string modifiedAt?;
    UserInfo modifiedByUser?;
    UserInfo sharedByUser?;
    ContentInfo content?;
    # The allowable operations for the Quickshare link itself. See allowableOperationsOnTarget for the
    # allowable operations pertaining to the linked content node.
    string[] allowableOperations?;
    # The allowable operations for the content node being shared.
    string[] allowableOperationsOnTarget?;
    boolean isFavorite?;
    # A subset of the target node's properties, system properties and properties already available in the SharedLink are excluded.
    record {} properties?;
    string[] aspectNames?;
    PathInfo path?;
};

public type DirectAccessUrlBodyCreate record {
    string expiresAt?;
    # The length of time in seconds that the url is valid for.
    @constraint:Int {minValue: 1}
    int validFor?;
};

public type NodeassociationpagingList record {
    Pagination pagination?;
    NodeAssociationEntry[] entries?;
    Node 'source?;
};

public type FavoritepagingList record {
    Pagination pagination;
    FavoriteEntry[] entries;
};

public type NodepagingList record {
    Pagination pagination?;
    NodeEntry[] entries?;
    Node 'source?;
};

public type Tag record {
    string id;
    string tag;
    decimal count?;
};

public type ProbeentryEntry record {
    string message;
};

public type SiteEntry record {
    Site entry;
};

public type RenditionBodyCreate record {
    string id;
};

public type AuditapppagingList record {
    Pagination pagination?;
    AuditAppEntry[] entries?;
};

public type GroupMemberEntry record {
    GroupMember entry;
};

public type GroupEntry record {
    Group entry;
};

public type SiteMembershipRequestWithPersonPaging record {
    SitemembershiprequestwithpersonpagingList list;
};

public type Company record {
    string organization?;
    string address1?;
    string address2?;
    string address3?;
    string postcode?;
    string telephone?;
    string fax?;
    string email?;
};

public type PersonNetworkPaging record {
    PersonnetworkpagingList list;
};

public type ActivityPaging record {
    ActivitypagingList list;
};

public type NodeAssociation record {
    *Node;
    AssociationInfo association?;
};

public type Constraint record {
    string id;
    # the type of the constraint
    string 'type?;
    # the human-readable constraint title
    string title?;
    # the human-readable constraint description
    string description?;
    record {} parameters?;
};

public type SitecontainerpagingList record {
    Pagination pagination;
    SiteContainerEntry[] entries;
};

public type SiteBodyCreate record {
    string id?;
    string title;
    string description?;
    string visibility;
};

public type SharedLinkEntry record {
    SharedLink entry;
};

public type SitegrouppagingList record {
    Pagination pagination;
    SiteGroupEntry[] entries;
};

public type SitememberpagingList record {
    Pagination pagination;
    SiteMemberEntry[] entries;
};

public type ActionDefinition record {
    # Identifier of the action definition â€” used for example when executing an action
    string id;
    # name of the action definition, e.g. "move"
    string name?;
    # title of the action definition, e.g. "Move"
    string title?;
    # describes the action definition, e.g. "This will move the matched item to another space."
    string description?;
    # QNames of the types this action applies to
    string[] applicableTypes;
    # whether the basic action definition supports action tracking or not
    boolean trackStatus;
    ActionParameterDefinition[] parameterDefinitions?;
};

public type Pagination record {
    # The number of objects in the entries array.
    int count?;
    # A boolean value which is **true** if there are more entities in the collection
    # beyond those in this response. A true value means a request with a larger value
    # for the **skipCount** or the **maxItems** parameter will return more entities.
    boolean hasMoreItems?;
    # An integer describing the total number of entities in the collection.
    # The API might not be able to determine this value,
    # in which case this property will not be present.
    int totalItems?;
    # An integer describing how many entities exist in the collection before
    # those included in this list. If there was no **skipCount** parameter then the
    # default value is 0.
    int skipCount?;
    # The value of the **maxItems** parameter used to generate this list.
    # If there was no **maxItems** parameter then the default value is 100.
    int maxItems?;
};

public type SiteContainerPaging record {
    SitecontainerpagingList list;
};

public type RatingBody record {
    # The rating scheme type. Possible values are likes and fiveStar.
    string id;
    # The rating. The type is specific to the rating scheme, boolean for the likes and an integer for the fiveStar
    string myRating;
};

public type ContentInfo record {
    string mimeType;
    string mimeTypeName?;
    int sizeInBytes?;
    string encoding?;
};

public type Version record {
    string id;
    string versionComment?;
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name;
    string nodeType;
    boolean isFolder;
    boolean isFile;
    string modifiedAt;
    UserInfo modifiedByUser;
    ContentInfo content?;
    string[] aspectNames?;
    record {} properties?;
};

public type RatingEntry record {
    # A person can rate an item of content by liking it. They can also remove
    # their like of an item of content. API methods exist to get a list of
    # ratings and to add a new rating.
    Rating entry;
};

public type NodeBodyMove record {
    string targetParentId;
    # The name must not contain spaces or the following special characters: * " < > \ / ? : and |.
    # The character . must not be used at the end of the name.
    string name?;
};

public type SiterolepagingList record {
    Pagination pagination;
    SiteRoleEntry[] entries;
};

public type VersionpagingList record {
    Pagination pagination?;
    VersionEntry[] entries?;
};

# A network is the group of users and sites that belong to an organization.
# Networks are organized by email domain. When a user signs up for an
# Alfresco account , their email domain becomes their Home Network.
public type PersonNetwork record {
    # This network's unique id
    string id;
    # Is this the home network?
    boolean homeNetwork?;
    boolean isEnabled;
    string createdAt?;
    boolean paidNetwork?;
    string subscriptionLevel?;
    NetworkQuota[] quotas?;
};

public type AuditBodyUpdate record {
    boolean isEnabled?;
};

public type GrouppagingList record {
    Pagination pagination?;
    GroupEntry[] entries?;
};

public type RenditionpagingList record {
    Pagination pagination?;
    RenditionEntry[] entries?;
};

public type VersionEntry record {
    Version entry?;
};

public type GroupMemberPaging record {
    GroupmemberpagingList list?;
};

public type SharedLinkPaging record {
    SharedlinkpagingList list;
};

public type TagpagingList record {
    Pagination pagination;
    TagEntry[] entries;
};

public type PersonPaging record {
    PersonpagingList list?;
};

public type DeletedNodeBodyRestore record {
    string targetParentId?;
    string assocType?;
};

public type NodePaging record {
    NodepagingList list?;
};

public type ActionDefinitionList record {
    ActiondefinitionlistList list?;
};

public type PersonBodyCreate record {
    string id;
    string firstName;
    string lastName?;
    string description?;
    string email;
    string skypeId?;
    string googleId?;
    string instantMessageId?;
    string jobTitle?;
    string location?;
    Company company?;
    string mobile?;
    string telephone?;
    string userStatus?;
    boolean enabled = true;
    boolean emailNotificationsEnabled = true;
    string password;
    string[] aspectNames?;
    record {} properties?;
};

public type SiteMembershipBodyCreate record {
    string role;
    string id;
};

public type NodeEntry record {
    Node entry;
};

public type CommentEntry record {
    Comment entry;
};

public type ActiondefinitionlistList record {
    Pagination pagination?;
    ActionDefinition[] entries?;
};

public type DownloadBodyCreate record {
    string[] nodeIds;
};

public type GroupPaging record {
    GrouppagingList list?;
};

public type ActionParameterDefinition record {
    string name?;
    string 'type?;
    boolean multiValued?;
    boolean mandatory?;
    string displayLabel?;
};

public type PermissionElement record {
    string authorityId?;
    string name?;
    string accessStatus?;
};

public type PersonBodyUpdate record {
    string firstName?;
    string lastName?;
    string description?;
    string email?;
    string skypeId?;
    string googleId?;
    string instantMessageId?;
    string jobTitle?;
    string location?;
    Company company?;
    string mobile?;
    string telephone?;
    string userStatus?;
    boolean enabled?;
    boolean emailNotificationsEnabled?;
    string password?;
    string oldPassword?;
    string[] aspectNames?;
    record {} properties?;
};

public type GroupBodyUpdate record {
    string displayName;
};

public type CommentPaging record {
    CommentpagingList list;
};

public type DownloadEntry record {
    Download entry;
};

public type SiteContainerEntry record {
    SiteContainer entry;
};

# A favorite describes an Alfresco entity that a person has marked as a favorite.
# The target can be a site, file or folder.
public type Favorite record {
    # The guid of the object that is a favorite.
    string targetGuid;
    # The time the object was made a favorite.
    string createdAt?;
    record {} target;
    # A subset of the target favorite properties, system properties and properties already available in the target are excluded.
    record {} properties?;
};

public type PermissionsInfo record {
    boolean isInheritanceEnabled?;
    PermissionElement[] inherited?;
    PermissionElement[] locallySet?;
    string[] settable?;
};

public type ChildAssociation record {
    string childId;
    string assocType;
};

public type AuditEntryEntry record {
    AuditEntry entry?;
};

public type PreferencepagingList record {
    Pagination pagination;
    PreferenceEntry[] entries;
};

public type RatingAggregate record {
    int numberOfRatings;
    int average?;
};

public type NodeAssociationEntry record {
    NodeAssociation entry;
};

public type AuditAppPaging record {
    AuditapppagingList list?;
};

# A person can rate an item of content by liking it. They can also remove
# their like of an item of content. API methods exist to get a list of
# ratings and to add a new rating.
public type Rating record {
    string id;
    RatingAggregate aggregate;
    string ratedAt?;
    # The rating. The type is specific to the rating scheme, boolean for the likes and an integer for the fiveStar.
    string myRating?;
};

public type PermissionsBody record {
    boolean isInheritanceEnabled?;
    PermissionElement[] locallySet?;
};

public type UserInfo record {
    string displayName;
    string id;
};

public type RatingpagingList record {
    Pagination pagination;
    RatingEntry[] entries;
};

public type SiteGroupEntry record {
    SiteGroup entry;
};

public type SharedLinkBodyEmail record {
    string 'client?;
    string message?;
    string locale?;
    string[] recipientEmails?;
};

public type SiteMemberPaging record {
    SitememberpagingList list;
};

public type PersonpagingList record {
    Pagination pagination?;
    PersonEntry[] entries?;
};

public type TagPaging record {
    TagpagingList list;
};

public type SiteMembershipRequestPaging record {
    SitemembershiprequestpagingList list;
};

# Limits and usage of each quota. A network will have quotas for File space,
# the number of sites in the network, the number of people in the network,
# and the number of network administrators
public type NetworkQuota record {
    string id;
    int 'limit;
    int usage;
};

public type PreferenceEntry record {
    # A specific preference.
    Preference entry;
};

public type AssociationEntry record {
    Association entry;
};

public type ActionExecResult record {
    # The unique identifier of the action pending execution
    string id;
};

public type TagBody record {
    string tag;
};

public type DeletedNodesPaging record {
    DeletednodespagingList list?;
};

public type Comment record {
    string id;
    string title;
    string content;
    Person createdBy;
    string createdAt;
    boolean edited;
    Person modifiedBy;
    string modifiedAt;
    boolean canEdit;
    boolean canDelete;
};

public type AuditentrypagingList record {
    Pagination pagination?;
    AuditEntryEntry[] entries?;
};

public type ChildAssociationInfo record {
    string assocType;
    boolean isPrimary;
};

public type ActivityEntry record {
    # Activities describe any past activity in a site,
    # for example creating an item of content, commenting on a node,
    # liking an item of content.
    Activity entry;
};

public type ErrorError record {
    string errorKey?;
    int statusCode;
    string briefSummary;
    string stackTrace;
    string descriptionURL;
    string logId?;
};

public type Error record {
    ErrorError 'error;
};

public type GroupmemberpagingList record {
    Pagination pagination?;
    GroupMemberEntry[] entries?;
};

public type PersonnetworkpagingList record {
    Pagination pagination;
    PersonNetworkEntry[] entries;
};

public type FavoriteEntry record {
    # A favorite describes an Alfresco entity that a person has marked as a favorite.
    # The target can be a site, file or folder.
    Favorite entry;
};

public type ActionExecResultEntry record {
    ActionExecResult entry;
};

public type SitemembershiprequestpagingList record {
    Pagination pagination;
    SiteMembershipRequestEntry[] entries;
};

public type ChildAssociationBody record {
    string childId;
    string assocType;
};

public type SiteBodyUpdate record {
    string title?;
    string description?;
    string visibility?;
};

public type Capabilities record {
    boolean isAdmin?;
    boolean isGuest?;
    boolean isMutable?;
};

public type RevertBody record {
    boolean majorVersion?;
    string comment?;
};

public type NodeChildAssociationEntry record {
    NodeChildAssociation entry;
};

public type VersionPaging record {
    VersionpagingList list?;
};

public type TagEntry record {
    Tag entry;
};

public type PathInfo record {
    PathElement[] elements?;
    string name?;
    boolean isComplete?;
};

public type RatingPaging record {
    RatingpagingList list;
};
