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

import ballerina/constraint;

public type ThirdPartyDependenciesDataArr ThirdPartyDependenciesData[];

# Subscribed download share information
public type SubscribedDownloadShare record {
    # Auth parent room ID
    int authParentId?;
    # Share ID
    int id;
};

# List of (last admin user) rooms
public type LastAdminUserRoomList record {
    # List of last admin rooms
    LastAdminUserRoom[] items;
};

# Customer information
public type Customer record {
    # &#128679; Deprecated since v4.8.0
    # 
    # Customer activation code string:
    # 
    # * valid only for types `free` and `demo`
    # 
    # * for `pay` customers it is empty
    string activationCode?;
    # Company name
    string companyName;
    # Creation date
    string createdAt;
    # List of customer attributes
    CustomerAttributes customerAttributes?;
    # Customer type
    string customerContractType;
    # &#128640; Since v4.21.0
    # 
    # Customer UUID
    string customerUuid;
    # Unique identifier for the customer
    int id;
    # Customer is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean isLocked = false;
    # Date of last seen login for the customer
    string lastLoginAt?;
    # &#128679; Deprecated since v4.7.0
    # 
    # Customer lock status:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # Please use `isLocked` instead.
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean lockStatus;
    # Provider customer ID
    string providerCustomerId?;
    # Maximal disc space which can be allocated by customer in bytes. -1 for unlimited
    int quotaMax;
    # Used amount of disc space in bytes
    int quotaUsed;
    # Number of days left for trial period (relevant only for type `demo`)
    # 
    # (not used)
    int trialDaysLeft?;
    # Modification date
    string updatedAt?;
    # Maximal number of users
    int userMax;
    # Number of users which are already allocated.
    int userUsed;
    # &#128640; Since v4.19.0
    # 
    # Maximal number of webhooks
    int webhooksMax?;
};

# Node information (Node can be a room, folder or file)
public type Node record {
    # &#128640; Since v4.15.0
    # 
    # Auth parent room ID
    int authParentId?;
    # Version of last change in this node or a node further down the tree.
    int branchVersion?;
    # &#128679; Deprecated since v4.10.0
    # 
    # Child nodes list (if requested)
    # 
    # (for rooms / folders only)
    Node[] children?;
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    int classification?;
    # &#128679; Deprecated since v4.2.0
    # 
    # Number of admins (for rooms only)
    int cntAdmins?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Number of direct children
    # 
    # (no recursion; for rooms / folders only)
    int cntChildren?;
    # Returns the number of comments of this node.
    int cntComments?;
    # Number of deleted versions of this file / folder
    # 
    # (for rooms / folders only)
    int cntDeletedVersions?;
    # Returns the number of Download Shares of this node.
    int cntDownloadShares?;
    # &#128640; Since v4.11.0
    # 
    # Amount of direct child files where this node is the parent node
    # 
    # (no recursion; for rooms / folders only)
    int cntFiles?;
    # &#128640; Since v4.11.0
    # 
    # Amount of direct child folders where this node is the parent node
    # 
    # (no recursion; for rooms / folders only)
    int cntFolders?;
    # &#128640; Since v4.11.0
    # 
    # Amount of direct child rooms where this node is the parent node
    # 
    # (no recursion; for rooms only)
    int cntRooms?;
    # Returns the number of Upload Shares of this node.
    int cntUploadShares?;
    # &#128679; Deprecated since v4.2.0
    # 
    # Number of users (for rooms only)
    int cntUsers?;
    # Creation date
    string createdAt?;
    # User information
    UserInfo createdBy?;
    # Encryption states
    EncryptionInfo encryptionInfo?;
    # Expiration date
    string expireAt?;
    # File type / extension (for files only)
    string fileType?;
    # Is activities log active (for rooms only)
    boolean hasActivitiesLog = true;
    # &#128679; Deprecated since v4.10.0
    # 
    # Is recycle bin active (for rooms only)
    # 
    # Recycle bin is always on (disabling is not possible).
    boolean hasRecycleBin?;
    # MD5 hash of file
    string hash?;
    # Node ID
    int id;
    # Inherit permissions from parent room
    # 
    # (default: `false` if `parentId` is `0`; otherwise: `true`)
    boolean inheritPermissions?;
    # &#128640; Since v4.11.0
    # 
    # Determines whether node is browsable by client (for rooms only)
    boolean isBrowsable?;
    # Encryption state
    boolean isEncrypted?;
    # Node is marked as favorite (for rooms / folders only)
    boolean isFavorite?;
    # Media server media token
    string mediaToken?;
    # File media type (for files only)
    string mediaType?;
    # Name
    string name;
    # User notes
    string notes?;
    # Parent node ID (room or folder)
    int parentId?;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string parentPath?;
    # Node permissions
    NodePermissions permissions?;
    # Quota in byte
    int quota?;
    # Retention period for deleted nodes in days
    @constraint:Int {maxValue: 9999}
    int recycleBinRetentionPeriod?;
    # Node size in byte
    int size?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    string timestampModification?;
    # Node type
    string 'type;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

public type AccessKeyUploadIdBody record {
    string file?;
};

# Upload Share information
public type UploadShare record {
    # Share access key to generate secure link
    string accessKey;
    # Total amount of existing files uploaded with this share.
    int cntFiles?;
    # Total amount of uploads conducted with this share.
    int cntUploads?;
    # Creation date
    string createdAt;
    # User information
    UserInfo createdBy;
    # Upload Share URL
    string dataUrl?;
    # Expiration date
    string expireAt?;
    # Number of days after which uploaded files expire
    int filesExpiryPeriod?;
    # Share ID
    int id;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # Encryption state
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected;
    # Maximal total size of uploaded files (in bytes)
    int maxSize?;
    # Maximal amount of files to upload
    int maxSlots?;
    # Alias name
    string name;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every upload.
    boolean notifyCreator;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient email addresses
    string recipients?;
    # &#128640; Since v4.11.0
    # 
    # Show creator first and last name.
    boolean showCreatorName?;
    # &#128640; Since v4.11.0
    # 
    # Show creator email address.
    boolean showCreatorUsername?;
    # Allow display of already uploaded files
    boolean showUploadedFiles?;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient MSISDNs
    string smsRecipients?;
    # Target room or folder ID
    int targetId;
    # Path to shared upload node
    string targetPath?;
    # Node type
    string targetType?;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Moved node information
public type MoveNode record {
    # Source node ID
    int id;
    # New node name
    string name?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# List of parent nodes
public type NodeParentList record {
    # List of node parents
    NodeParent[] items?;
};

# Set of password policies
public type PasswordPoliciesConfig record {
    # Encryption password policies
    EncryptionPasswordPolicies encryptionPasswordPolicies?;
    # Login password policies
    LoginPasswordPolicies loginPasswordPolicies?;
    # Shares password policies
    SharesPasswordPolicies sharesPasswordPolicies?;
};

# List of S3 tags
public type S3TagList record {
    # List of configured S3 tags
    S3Tag[] items?;
};

# Request model for updating subscriptions
public type UpdateSubscriptionsBulkRequest record {
    # Creates or deletes a subscription on each item in an array of objects.
    boolean isSubscribed;
    # List of ids
    int[] objectIds;
};

# List of event types
public type EventTypeList record {
    # List of event types
    EventType[] items;
};

# Request model for updating files
public type UpdateFilesBulkRequest record {
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    int classification?;
    # Expiration information
    ObjectExpiration expiration?;
    # List of ids
    int[] objectIds;
};

# Request model for creating a folder
public type CreateFolderRequest record {
    # Name
    string name;
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # Parent node ID (room or folder)
    int parentId;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# Request model for deleting Upload Shares
public type DeleteUploadSharesRequest record {
    # List of share IDs
    int[] shareIds;
};

# List of Download Shares
public type DownloadShareList record {
    # List of Download Shares
    DownloadShare[] items;
    # Range information
    Range range;
};

# List of users
public type RoomUserList record {
    # List of room-user mappings
    RoomUser[] items;
    # Range information
    Range range;
};

# Request model for creating an OpenID Connect IDP configuration
public type CreateOpenIdIdpConfigRequest record {
    # URL of the authorization endpoint
    string authorizationEndPointUrl;
    # ID of the OpenID client
    string clientId;
    # Secret, which client uses at authentication.
    string clientSecret;
    # Name of the claim which is used for the user mapping fallback.
    string fallbackMappingClaim?;
    # &#128640; Since v4.11.0
    # 
    # Flow, which is used at authentication
    string flow?;
    # Issuer identifier of the IDP
    # 
    # The value is a case sensitive URL.
    string issuer;
    # URL of the JWKS endpoint
    string jwksEndPointUrl;
    # Name of the claim which is used for the user mapping.
    string mappingClaim;
    # Name of the IDP
    string name;
    # PKCE code challenge method.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    string pkceChallengeMethod = "plain";
    # Determines whether PKCE is enabled.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    boolean pkceEnabled = false;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris;
    # List of requested scopes
    string[] scopes;
    # URL of the token endpoint
    string tokenEndPointUrl;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImportEnabled = false;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int userImportGroup?;
    # URL of the user info endpoint
    string userInfoEndPointUrl;
    # &#128640; Since v4.23.0
    # 
    # Source, which is used to get user information at the import or update of a user.
    string userInfoSource?;
    # URL of the user management UI.
    # 
    # Use empty string to remove.
    string userManagementUrl?;
    # Determines if the DRACOON account is updated with data from AD / IDP.
    # 
    # For OpenID Connect, the scopes `email` and `profile` are needed.
    boolean userUpdateEnabled = false;
};

# Request model for updating an Active Directory configuration
public type UpdateActiveDirectoryConfigRequest record {
    # If `userImport` is set to `true`,
    # 
    # the user must be member of this Active Directory group to receive a newly created DRACOON account.
    string adExportGroup?;
    # Unique name for an Active Directory configuration
    string alias?;
    # DEPRECATED, will be ignored
    # 
    # Determines whether a room is created for each user that is created by automatic import (like a home folder).
    # 
    # Room's name will equal the user's login name.
    boolean createHomeFolder?;
    # DEPRECATED, will be ignored
    # 
    # ID of the room in which the individual rooms for users will be created.
    int homeFolderParent?;
    # Search scope of Active Directory; only users below this node can log on.
    string ldapUsersDomain?;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int sdsImportGroup?;
    # Distinguished Name (DN) of Active Directory administrative account
    string serverAdminName?;
    # Password of Active Directory administrative account
    string serverAdminPassword?;
    # IPv4 or IPv6 address or host name
    string serverIp?;
    # Port
    int serverPort?;
    # SSL finger print of Active Directory server.
    # 
    # Mandatory for LDAPS connections.
    # 
    # Format: `Algorithm/Fingerprint`
    string sslFingerPrint?;
    # Determines whether LDAPS should be used instead of plain LDAP.
    boolean useLdaps?;
    # Name of Active Directory attribute that is used as login name.
    string userFilter?;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImport?;
};

# Request model for setting a user file key
public type UserFileKeySetRequest record {
    # File ID
    int fileId;
    # File key information
    FileKey fileKey;
    # Unique identifier for the user
    int userId;
};

# OpenID Connect IDP configuration
public type OpenIdIdpConfig record {
    # URL of the authorization endpoint
    string authorizationEndPointUrl?;
    # ID of the OpenID client
    string clientId?;
    # Secret, which client uses at authentication.
    string clientSecret?;
    # Name of the claim which is used for the user mapping fallback.
    string fallbackMappingClaim?;
    # &#128640; Since v4.11.0
    # 
    # Flow, which is used at authentication
    string flow?;
    # ID
    int id;
    # Issuer identifier of the IDP
    # 
    # The value is a case sensitive URL.
    string issuer?;
    # URL of the JWKS endpoint
    string jwksEndPointUrl?;
    # Name of the claim which is used for the user mapping.
    string mappingClaim?;
    # Name of the IDP
    string name?;
    # PKCE code challenge method.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    string pkceChallengeMethod?;
    # Determines whether PKCE is enabled.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    boolean pkceEnabled = false;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris?;
    # List of requested scopes
    # 
    # Usually `openid` and the names of the requested claims.
    string[] scopes?;
    # URL of the token endpoint
    string tokenEndPointUrl?;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImportEnabled = false;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int userImportGroup?;
    # URL of the user info endpoint
    string userInfoEndPointUrl?;
    # &#128640; Since v4.23.0
    # 
    # Source, which is used to get user information at the import or update of a user.
    string userInfoSource?;
    # URL of the user management UI.
    # 
    # Use empty string to remove.
    string userManagementUrl?;
    # Determines if the DRACOON account is updated with data from AD / IDP.
    # 
    # For OpenID Connect, the scopes `email` and `profile` are needed.
    boolean userUpdateEnabled = false;
};

# List of webhooks
public type WebhookList record {
    # List of webhooks
    Webhook[] items;
    # Range information
    Range range;
};

# Request model for creating a node comment
public type CreateNodeCommentRequest record {
    # Comment text
    string text;
};

# List of request models for setting a user file key(s)
public type UserFileKeySetBatchRequest record {
    # List of user file keys
    UserFileKeySetRequest[] items;
};

# Room information
public type RoomData record {
    # &#128679; Deprecated since v4.10.0
    # 
    # List of rooms, where this room is a parent (if exist)
    RoomData[] children?;
    # &#128679; Deprecated since v4.2.0
    # 
    # Number of admins (for rooms only)
    int cntAdmins?;
    # Returns the number of Download Shares of this node.
    int cntDownloadShares?;
    # Returns the number of Upload Shares of this node.
    int cntUploadShares?;
    # &#128679; Deprecated since v4.2.0
    # 
    # Number of users (for rooms only)
    int cntUsers?;
    # Expiration date
    string createdAt?;
    # User information
    UserInfo createdBy?;
    # &#128679; Deprecated since v4.10.0
    # 
    # Is recycle bin active (for rooms only)
    # 
    # Recycle bin is always on (disabling is not possible).
    boolean hasRecycleBin;
    # Room ID
    int id;
    # Encryption state
    boolean isEncrypted;
    # Node is marked as favorite (for rooms / folders only)
    boolean isFavorite?;
    # Is user granted room permissions
    boolean isGranted;
    # Name
    string name;
    # Parent node ID (room or folder)
    int parentId?;
    # Node permissions
    NodePermissions permissions?;
    # Quota in byte
    int quota?;
    # Retention period for deleted nodes in days
    @constraint:Int {maxValue: 9999}
    int recycleBinRetentionPeriod;
    # Room size
    int size?;
    # Node type
    string 'type?;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Group information
public type RoomGroup record {
    # Unique identifier for the group
    int id;
    # Is user granted room permissions
    boolean isGranted;
    # Group name
    string name;
    # Behaviour when new users are added to the group:
    # 
    # * `autoallow`
    # 
    # * `pending`
    # 
    # 
    # 
    # Only relevant if `adminGroupIds` has items.
    string newGroupMemberAcceptance = "autoallow";
    # Node permissions
    NodePermissions permissions?;
};

# Request model for setting the customer settings
public type CustomerSettingsRequest record {
    # Homeroom Parent Name
    string homeRoomParentName?;
    # Homeroom Quota in bytes
    int homeRoomQuota?;
    # Homerooms active
    boolean homeRoomsActive?;
};

# Group information
public type Group record {
    # Amount of users
    int cntUsers;
    # Creation date
    string createdAt;
    # User information
    UserInfo createdBy;
    # Expiration date
    string expireAt?;
    # List of roles
    RoleList groupRoles?;
    # Unique identifier for the group
    int id;
    # Group name
    string name;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Request model for updating auth token settings
public type UpdateAuthTokenRestrictions record {
    # &#128640; Since v4.13.0
    # 
    # Restricted OAuth access token validity (in seconds)
    int accessTokenValidity?;
    # &#128640; Since v4.13.0
    # 
    # Defines if OAuth token restrictions are enabled
    boolean overwriteEnabled;
    # &#128640; Since v4.13.0
    # 
    # Restricted OAuth refresh token validity (in seconds)
    int refreshTokenValidity?;
};

# User lockout information
public type UserLockout record {
    # Determines whether user lockout is enabled
    boolean enabled;
    # Amount of minutes a user has to wait to make another login attempt after `maxNumberOfLoginFailures` has been exceeded
    int lockoutPeriod?;
    # Maximum allowed number of failed login attempts
    int maxNumberOfLoginFailures?;
};

# Node permissions
public type NodePermissions record {
    # User / Group may update metadata of nodes: rename files and folders, change classification, etc.
    boolean change;
    # User / Group may upload files, create folders and copy / move files to this room, overwriting is not possible.
    boolean create;
    # User / Group may overwrite and remove files / folders, move files from this room.
    boolean delete;
    # User / Group may permanently remove files / folders from the recycle bin.
    boolean deleteRecycleBin;
    # User / Group may grant all of the above permissions to other users and groups independently,
    # 
    # may update room metadata and create / update / delete subordinary rooms, has all permissions.
    boolean manage;
    # User / Group may create Download Shares for files and containers view all previously created Download Shares in this room.
    boolean manageDownloadShare;
    # User / Group may create Upload Shares for containers, view all previously created Upload Shares in this room.
    boolean manageUploadShare;
    # User / Group may see all rooms, files and folders in the room and download everything, copy files from this room.
    boolean read;
    # User / Group may look up files / folders in the recycle bin.
    boolean readRecycleBin;
    # User / Group may restore files / folders from recycle bin - room permissions required.
    boolean restoreRecycleBin;
};

# List of OpenID Connect providers
public type OpenIdAuthInfo record {
    # List of available OpenID Connect identity providers
    OpenIdProvider[] items;
};

# List of pending assignments
public type PendingAssignmentList record {
    # List of pending assignment information
    PendingAssignmentData[] items;
    # Range information
    Range range?;
};

# Request model for creating an Active Directory configuration
public type CreateActiveDirectoryConfigRequest record {
    # If `userImport` is set to `true`,
    # 
    # the user must be member of this Active Directory group to receive a newly created DRACOON account.
    string adExportGroup?;
    # Unique name for an Active Directory configuration
    string alias;
    # DEPRECATED, will be ignored
    # 
    # Determines whether a room is created for each user that is created by automatic import (like a home folder).
    # 
    # Room's name will equal the user's login name.
    boolean createHomeFolder = false;
    # DEPRECATED, will be ignored
    # 
    # ID of the room in which the individual rooms for users will be created.
    int homeFolderParent?;
    # Search scope of Active Directory; only users below this node can log on.
    string ldapUsersDomain;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int sdsImportGroup?;
    # Distinguished Name (DN) of Active Directory administrative account
    string serverAdminName;
    # Password of Active Directory administrative account
    string serverAdminPassword;
    # IPv4 or IPv6 address or host name
    string serverIp;
    # Port
    int serverPort;
    # SSL finger print of Active Directory server.
    # 
    # Mandatory for LDAPS connections.
    # 
    # Format: `Algorithm/Fingerprint`
    string sslFingerPrint?;
    # Determines whether LDAPS should be used instead of plain LDAP.
    boolean useLdaps = false;
    # Name of Active Directory attribute that is used as login name.
    string userFilter;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImport = false;
};

# List of subscribed upload shares
public type SubscribedUploadShareList record {
    # List of subscribed upload shares
    SubscribedUploadShare[] items;
    # Range information
    Range range;
};

public type InlineResponse400 ChunkUploadResponse|ErrorResponse;

# Request model for updating an OpenID Connect IDP configuration
public type UpdateOpenIdIdpConfigRequest record {
    # URL of the authorization endpoint
    string authorizationEndPointUrl?;
    # ID of the OpenID client
    string clientId?;
    # Secret, which client uses at authentication.
    string clientSecret?;
    # Name of the claim which is used for the user mapping fallback.
    string fallbackMappingClaim?;
    # &#128640; Since v4.11.0
    # 
    # Flow, which is used at authentication
    string flow?;
    # Issuer identifier of the IDP
    # 
    # The value is a case sensitive URL.
    string issuer?;
    # URL of the JWKS endpoint
    string jwksEndPointUrl?;
    # Name of the claim which is used for the user mapping.
    string mappingClaim?;
    # Name of the IDP
    string name?;
    # PKCE code challenge method.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    string pkceChallengeMethod?;
    # Determines whether PKCE is enabled.
    # 
    # cf. [RFC 7636](https://tools.ietf.org/html/rfc7636)
    boolean pkceEnabled?;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris?;
    # Set `true` to reset `fallbackMappingClaim`.
    boolean resetFallbackMappingClaim?;
    # List of requested scopes
    # 
    # Usually `openid` and the names of the requested claims.
    string[] scopes?;
    # URL of the token endpoint
    string tokenEndPointUrl?;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImportEnabled?;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int userImportGroup?;
    # URL of the user info endpoint
    string userInfoEndPointUrl?;
    # &#128640; Since v4.23.0
    # 
    # Source, which is used to get user information at the import or update of a user.
    string userInfoSource?;
    # URL of the user management UI.
    # 
    # Use empty string to remove.
    string userManagementUrl?;
    # Determines if the DRACOON account is updated with data from AD / IDP.
    # 
    # For OpenID Connect, the scopes `email` and `profile` are needed.
    boolean userUpdateEnabled?;
};

# Request model for updating user account information
public type UpdateUserAccountRequest record {
    # Accept EULA
    # 
    # Present, if EULA is system global active.
    # 
    # cf. `GET system/config/settings/general` - `eulaEnabled`
    # 
    # If accepted can not be undone.
    boolean acceptEULA?;
    # Email 
    string email?;
    # User first name
    string firstName?;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    # 
    # Do NOT use `gender`! It will be ignored.
    string gender?;
    # &#128640; Since v4.20.0
    # 
    # IETF language tag
    string language?;
    # User last name
    string lastName?;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # Phone number
    string phone?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# Request model for creating an upload channel
public type CreateShareUploadChannelRequest record {
    # &#128640; Since v4.15.0
    # 
    # Upload direct to S3
    boolean directS3Upload = false;
    # File name
    string name;
    # Password
    string password?;
    # File size in byte
    int size?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# Request model for updating shares password policies
public type UpdateSharesPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules?;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength?;
    # Determines whether a password must NOT contain word(s) from a dictionary
    boolean rejectDictionaryWords?;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns?;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo?;
};

# List of generated presigned URLs
public type PresignedUrlList record {
    # List of S3 presigned URLs
    PresignedUrl[] urls;
};

# List of groups
public type UserGroupList record {
    # List of user-group mappings
    UserGroup[] items;
    # Range information
    Range range;
};

# Request model for creating a RADIUS configuration
public type RadiusConfigCreateRequest record {
    # Failover server information
    FailoverServer failoverServer?;
    # RADIUS Server IP Address
    string ipAddress;
    # Sequence order of concatenated PIN and one-time token
    boolean otpPinFirst = true;
    # RADIUS Server Port
    int port;
    # Shared Secret to access the RADIUS server
    string sharedSecret;
};

# Request model for setting user profile attributes
public type ProfileAttributesRequest record {
    # List of key-value pairs
    KeyValueEntry[] items;
};

# File information
public type PublicUploadedFileData record {
    # Creation date
    string createdAt;
    # Hash value of transferred file
    string hash?;
    # Name
    string name;
    # File size in byte
    int size;
};

# System defaults
public type SystemDefaults record {
    # Default expiration period for Download Shares in days.
    int downloadShareDefaultExpirationPeriod?;
    # Default expiration period for all uploaded files in days.
    int fileDefaultExpirationPeriod?;
    # &#128640; Since v4.13.0
    # 
    # Defines if login fields should be hidden
    boolean hideLoginInputFields?;
    # Define which language should be default.
    string languageDefault?;
    # &#128640; Since v4.12.0
    # 
    # Defines if new users get the role Non Member Viewer by default
    boolean nonmemberViewerDefault?;
    # Default expiration period for Upload Shares in days.
    int uploadShareDefaultExpirationPeriod?;
};

# Notification scope information
public type NotificationScope record {
    # Scope ID
    int id;
    # Name
    string name;
};

# Information of all available algorithms
public type AlgorithmVersionInfoList record {
    # List of file key algorithms
    AlgorithmVersionInfo[] fileKeyAlgorithms;
    # List of key pair algorithms
    AlgorithmVersionInfo[] keyPairAlgorithms;
};

# Request model for switching notification channel status
public type NotificationChannelActivationRequest record {
    # Channel ID
    int channelId;
    # Determines whether channel is enabled
    boolean isEnabled;
};

# User information
public type UserItem record {
    # &#128640; Since v4.11.0
    # 
    # Avatar UUID
    string avatarUuid;
    # Creation date
    string createdAt?;
    # Email 
    string email?;
    # Expiration date
    string expireAt?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    string gender = "n";
    # &#128679; Deprecated since v4.27.0
    # 
    # User has manageable rooms
    boolean hasManageableRooms?;
    # Homeroom ID
    int homeRoomId?;
    # Unique identifier for the user
    int id;
    # User has generated private key.
    # 
    # Possible if client-side encryption is active for this customer
    boolean isEncryptionEnabled?;
    # User is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # User is locked and can not login anymore.
    boolean isLocked;
    # Last successful logon date
    string lastLoginSuccessAt?;
    # User last name
    string lastName;
    # &#128679; Deprecated since v4.7.0
    # 
    # User lock status:
    # 
    # * `0` - locked
    # 
    # * `1` - Web access allowed
    # 
    # * `2` - Web and mobile access allowed
    # 
    # 
    # 
    # Please use `isLocked` instead.
    int lockStatus;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login;
    # Phone number
    string phone?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # User custom attributes (list of key-value pairs)
    UserAttributes userAttributes?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName;
    # List of roles
    RoleList userRoles?;
};

# Authentication method
public type AuthMethod record {
    # Is enabled
    boolean isEnabled;
    # Authentication methods:
    # 
    # * `basic`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    string name;
    # Priority (smaller values have higher priority)
    int priority;
};

# Error information
public type ErrorResponse record {
    # HTTP status code
    int code;
    # Debug information
    string debugInfo?;
    # Internal error code
    int errorCode?;
    # HTTP status code description
    string message;
};

# Request model for granting user(s) to the room
public type RoomUsersAddBatchRequest record {
    # List of room-user mappings
    RoomUsersAddBatchRequestItem[] items;
};

# S3 file upload part information
public type S3FileUploadPart record {
    # Corresponding part ETag
    string partEtag;
    # Corresponding part number
    int partNumber;
};

# List of groups
public type RoomGroupList record {
    # List of room-group mappings
    RoomGroup[] items;
    # Range information
    Range range;
};

# User information
public type RoleUser record {
    # &#128679; Deprecated since v4.11.0
    # 
    # Display name
    # 
    # use information from `UserInfo` instead to combine a display name
    string displayName;
    # &#128679; Deprecated since v4.11.0
    # 
    # Unique identifier for the user
    # 
    # use `id` from `UserInfo` instead
    int id;
    # Is user member of the role
    boolean isMember;
    # User information
    UserInfo userInfo;
};

# Subscribed node information
public type SubscribedNode record {
    # Auth parent room ID
    int authParentId?;
    # Node ID
    int id;
    # Node type
    string 'type?;
};

# Webhook information
public type Webhook record {
    # Creation date
    string createdAt;
    # User information
    UserInfo createdBy?;
    # List of names of event types
    string[] eventTypeNames;
    # Expiration date / time
    string expireAt;
    # Last HTTP status code when a webhook is disabled due to delivery failures
    int failStatus?;
    # ID
    int id;
    # Is enabled
    boolean isEnabled;
    # Name
    string name;
    # Secret; used for event message signatures
    string secret?;
    # Modification date
    string updatedAt;
    # User information
    UserInfo updatedBy?;
    # URL
    string url;
};

# Missing keys information
public type MissingKeysResponse record {
    # List of file keys
    FileFileKeys[] files?;
    # List of user ID and file ID mappings
    UserIdFileIdItem[] items?;
    # Range information
    Range range?;
    # List of user public keys
    UserUserPublicKey[] users?;
};

# System information (default language and authentication methods)
public type SystemInfo record {
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    AuthMethod[] authMethods;
    # &#128640; Since v4.13.0
    # 
    # Defines if login fields should be hidden
    boolean hideLoginInputFields;
    # System default language
    # 
    # cf. [RFC 5646](https://tools.ietf.org/html/rfc5646)
    string languageDefault;
    # &#128640; Since v4.15.0
    # 
    # Determines whether S3 direct upload is enforced or not
    boolean s3EnforceDirectUpload;
    # &#128640; Since v4.14.0
    # 
    # List of S3 Hosts for CSP header
    string[] s3Hosts;
    # &#128640; Since v4.21.0
    # 
    # Defines if S3 is used as storage backend
    boolean useS3Storage;
};

# Deleted node information (Deleted node can be a folder or file)
public type DeletedNodeSummary record {
    # Number of deleted versions of this file
    int cntVersions;
    # First deleted version
    string firstDeletedAt;
    # Last deleted version
    string lastDeletedAt;
    # Node ID of last deleted version
    int lastDeletedNodeId;
    # Node name
    string name;
    # Parent node ID (room or folder)
    int parentId;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string parentPath;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    string timestampModification?;
    # Node type
    string 'type;
};

# Customer information
public type NewCustomerResponse record {
    # &#128679; Deprecated since v4.8.0
    # 
    # Customer activation code string:
    # 
    # * valid only for types `free` and `demo`
    # 
    # * for `pay` customers it is empty
    string activationCode?;
    # Company name
    string companyName;
    # Creation date
    string createdAt?;
    # List of customer attributes
    CustomerAttributes customerAttributes?;
    # Customer type
    string customerContractType;
    # &#128640; Since v4.21.0
    # 
    # Customer UUID
    string customerUuid;
    # First administrator user
    FirstAdminUser firstAdminUser;
    # Unique identifier for the customer
    int id?;
    # Customer is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean isLocked = false;
    # &#128679; Deprecated since v4.7.0
    # 
    # Customer lock status:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # Please use `isLocked` instead.
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean lockStatus;
    # Provider customer ID
    string providerCustomerId?;
    # Maximal disc space which can be allocated by customer in bytes. -1 for unlimited
    int quotaMax;
    # Number of days left for trial period (relevant only for type `demo`)
    # 
    # (not used)
    int trialDays?;
    # Maximal number of users
    int userMax;
    # &#128640; Since v4.19.0
    # 
    # Maximal number of webhooks
    int webhooksMax?;
};

# Request model for generating download URL
public type PublicDownloadTokenGenerateRequest record {
    # Password (only for password-protected shares)
    string password?;
};

# List of groups
public type GroupList record {
    # List of groups
    Group[] items;
    # Range information
    Range range;
};

# Copied node information
public type CopyNode record {
    # Source node ID
    int id;
    # New node name
    string name?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# Request model for deleting nodes from recycle bin
public type DeleteDeletedNodesRequest record {
    # List of deleted node IDs
    int[] deletedNodeIds;
};

# Download URL
public type DownloadTokenGenerateResponse record {
    # Download URL
    string downloadUrl;
    # &#128679; Deprecated since v4.3.0
    # 
    # Download token
    string token;
};

# List of users
public type GroupUserList record {
    # List of group-user mappings
    GroupUser[] items;
    # Range information
    Range range;
};

# Request model for restoring deleted nodes
public type RestoreDeletedNodesRequest record {
    # List of deleted node IDs
    int[] deletedNodeIds;
    # Preserve Download Share Links and point them to the new node.
    boolean keepShareLinks = false;
    # Node parent ID
    # 
    # (default: previous parent ID)
    int parentId?;
    # Node conflict resolution strategy:
    # 
    # * `autorename`
    # 
    # * `overwrite`
    # 
    # * `fail`
    string resolutionStrategy = "autorename";
};

# Log operation
public type LogOperation record {
    # Operation type ID
    int id;
    # Determines whether log operation is deprecated or not
    boolean isDeprecated;
    # Operation name
    string name;
};

# Authentication token
public type LoginResponse record {
    # Authentication token
    string token;
};

# Subscribed upload share information
public type SubscribedUploadShare record {
    # Share ID
    int id;
    # Target room or folder ID
    int targetNodeId?;
};

# Request model for revoking group(s) from the room
public type RoomGroupsDeleteBatchRequest record {
    # List of group IDs
    int[] ids;
};

# Request model for updating a list of Download Shares
public type UpdateUploadSharesBulkRequest record {
    # Expiration information
    ObjectExpiration expiration?;
    # Number of days after which uploaded files expire
    int filesExpiryPeriod?;
    # Maximal total size of uploaded files (in bytes)
    int maxSize?;
    # Maximal amount of files to upload
    int maxSlots?;
    # List of ids
    int[] objectIds;
    # Set 'true' to reset 'filesExpiryPeriod' for Upload Share
    boolean resetFilesExpiryPeriod?;
    # Set 'true' to reset 'maxSize' for Upload Share
    boolean resetMaxSize?;
    # Set 'true' to reset 'maxSlots' for Upload Share
    boolean resetMaxSlots?;
    # Show creator first and last name.
    boolean showCreatorName?;
    # Show creator email address.
    boolean showCreatorUsername?;
    # Allow display of already uploaded files
    boolean showUploadedFiles?;
};

# Group information
public type GroupInfo record {
    # Unique identifier for the group
    int id;
    # Group name
    string name;
};

# Request model for creating a webhook
public type CreateWebhookRequest record {
    # List of names of event types
    string[] eventTypeNames;
    # Is enabled
    boolean isEnabled?;
    # Name
    string name;
    # Secret; used for event message signatures
    string secret?;
    # If set to true, an example event is being created
    boolean triggerExampleEvent?;
    # URL (must begin with the `HTTPS` scheme)
    string url;
};

# General settings
public type GeneralSettingsInfo record {
    # Activation status of client-side encryption.
    # 
    # Can only be enabled once; disabling is not possible.
    boolean cryptoEnabled?;
    # Enable email notification button
    boolean emailNotificationButtonEnabled?;
    # Each user has to confirm the EULA at first login.
    boolean eulaEnabled?;
    # &#128640; Since v4.10.0
    # 
    # Homeroom Parent ID
    int homeRoomParentId?;
    # &#128640; Since v4.10.0
    # 
    # Homerooms active
    boolean homeRoomsActive?;
    # &#128679; Deprecated since v4.12.0
    # 
    # Determines if the media server is enabled
    boolean mediaServerEnabled?;
    # &#128640; Since v4.9.0
    # 
    # Defines if S3 tags are enabled
    boolean s3TagsEnabled?;
    # Allow sending of share passwords via SMS
    boolean sharePasswordSmsEnabled?;
    # Defines if S3 is used as storage backend
    boolean useS3Storage?;
    # Allow weak password
    # 
    # * A weak password has to fulfill the following criteria:
    # 
    #    * is at least 8 characters long
    # 
    #    * contains letters and numbers
    # 
    # * A strong password has to fulfill the following criteria in addition:
    # 
    #    * contains at least one special character
    # 
    #    * contains upper and lower case characters
    boolean weakPasswordEnabled?;
};

# List of Active Directories
public type ActiveDirectoryAuthInfo record {
    # List of available Active Directories
    ActiveDirectory[] items;
};

# Expiration information
public type ObjectExpiration record {
    # enabled / disabled
    boolean enableExpiration;
    # Expiration date
    string expireAt?;
};

# List of violated password policies
public type PasswordPolicyViolationResponse record {
    # HTTP status code
    int code;
    # Debug information
    string debugInfo?;
    # Internal error code
    int errorCode?;
    # HTTP status code description
    string message;
    # List of violated password policies
    ViolatedPasswordPolicy[] violatedPasswordPolicies?;
};

# User file key
public type UserFileKey record {
    # File key information
    FileKey fileKey;
    # Unique identifier for the user
    int userId;
};

# General settings
public type GeneralSettings record {
    # Auth token restrictions
    AuthTokenRestrictions authTokenRestrictions?;
    # Activation status of client-side encryption.
    # 
    # Can only be enabled once; disabling is not possible.
    boolean cryptoEnabled?;
    # Enable email notification button
    boolean emailNotificationButtonEnabled?;
    # Each user has to confirm the EULA at first login.
    boolean eulaEnabled?;
    # &#128640; Since v4.13.0
    # 
    # Defines if login fields should be hidden
    boolean hideLoginInputFields?;
    # &#128679; Deprecated since v4.12.0
    # 
    # Determines if the media server is enabled
    boolean mediaServerEnabled?;
    # &#128640; Since v4.9.0
    # 
    # Defines if S3 tags are enabled
    boolean s3TagsEnabled?;
    # Allow sending of share passwords via SMS
    boolean sharePasswordSmsEnabled?;
    # Defines if S3 is used as storage backend
    boolean useS3Storage?;
    # &#128679; Deprecated since v4.14.0
    # 
    # Allow weak password
    # 
    # * A weak password has to fulfill the following criteria:
    # 
    #    * is at least 8 characters long
    # 
    #    * contains letters and numbers
    # 
    # * A strong password has to fulfill the following criteria in addition:
    # 
    #    * contains at least one special character
    # 
    #    * contains upper and lower case characters
    # 
    # Please use `GET /system/config/policies/passwords` API to get configured password policies.
    boolean weakPasswordEnabled?;
};

# Role information
public type Role record {
    # Role description
    string description;
    # Unique identifier for the role
    int id;
    # List of reachable right over role
    Right[] items?;
    # Role (unique) name
    string name;
};

# Request model for deleting nodes
public type DeleteNodesRequest record {
    # List of node IDs
    int[] nodeIds;
};

# Request model for granting group(s) to the room
public type RoomGroupsAddBatchRequest record {
    # List of room-group mappings
    RoomGroupsAddBatchRequestItem[] items;
};

# Request model for creating a group
public type CreateGroupRequest record {
    # Expiration information
    ObjectExpiration expiration?;
    # Group name
    string name;
};

# Request item model for granting user to the room
public type RoomUsersAddBatchRequestItem record {
    # Unique identifier for the user
    int id;
    # Node permissions
    NodePermissions permissions;
};

# Request model for updating a list of Download Shares
public type UpdateDownloadSharesBulkRequest record {
    # Expiration information
    ObjectExpiration expiration?;
    # Max allowed downloads
    int maxDownloads?;
    # List of ids
    int[] objectIds;
    # Set 'true' to reset 'maxDownloads' for Download Share.
    boolean resetMaxDownloads?;
    # Show creator first and last name.
    boolean showCreatorName?;
    # Show creator email address.
    boolean showCreatorUsername?;
};

# Request model for creating an user
public type CreateUserRequest record {
    # User Authentication Data
    UserAuthData authData?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    UserAuthMethod[] authMethods?;
    # Email 
    string email?;
    # Expiration information
    ObjectExpiration expiration?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    # 
    # Do NOT use `gender`! It will be ignored.
    string gender = "n";
    # &#128640; Since v4.12.0
    # 
    # Determines whether user has the role NONMEMBER_VIEWER
    boolean isNonmemberViewer?;
    # User last name
    string lastName;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Determines whether user has to change his / her initial password.
    # 
    # use `authDate.mustChangePassword` instead
    boolean needsToChangePassword?;
    # &#128640; Since v4.9.0
    # 
    # Notify user about his new account
    # 
    # * default: `true` for `basic` auth type
    # 
    # * default: `false` for `active_directory`, `openid` and `radius` auth types
    boolean notifyUser?;
    # &#128679; Deprecated since v4.13.0
    # 
    # An initial password may be preset
    # 
    # use `authData` instead
    string password?;
    # Phone number
    string phone?;
    # IETF language tag
    string receiverLanguage?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# List of user IDs
public type UserIds record {
    # List of user IDs
    int[] ids;
};

# Login password policies
public type LoginPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength;
    # Number of passwords to archive
    # 
    # (must be between `0` and `10`; `0` means that password history is disabled)
    @constraint:Int {minValue: 1, maxValue: 10}
    int numberOfArchivedPasswords;
    # Password expiration information
    PasswordExpiration passwordExpiration;
    # Determines whether a password must NOT contain word(s) from a dictionary
    boolean rejectDictionaryWords;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo;
    # Modification date
    string updatedAt;
    # User information
    UserInfo updatedBy;
    # User lockout information
    UserLockout userLockout;
};

# Download Share information
public type DownloadShare record {
    # Share access key to generate secure link
    string accessKey;
    # &#128679; Deprecated since v4.11.0
    # 
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    # 
    # 
    # 
    # (default: classification from parent room)
    int classification?;
    # Downloads counter (incremented on each download)
    int cntDownloads;
    # Creation date
    string createdAt;
    # User information
    UserInfo createdBy;
    # Path to shared download node
    string dataUrl?;
    # Expiration date
    string expireAt?;
    # Share ID
    int id;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # Encrypted share
    # 
    # (this only applies to shared files, not folders)
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected?;
    # Max allowed downloads
    int maxDownloads?;
    # Alias name
    string name;
    # Source node ID
    int nodeId;
    # Path to shared download node
    string nodePath?;
    # Node type
    string nodeType?;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every download.
    boolean notifyCreator;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient email addresses
    string recipients?;
    # Show creator first and last name.
    boolean showCreatorName?;
    # Show creator email address.
    boolean showCreatorUsername?;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient MSISDNs
    string smsRecipients?;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Violated password policy information
public type ViolatedPasswordPolicy record {
    # Message from password validator
    string message?;
    # Name of the violated password policy
    string name?;
};

# Request model for updating a set of password policies
public type UpdatePasswordPoliciesConfig record {
    # Request model for updating encryption password policies
    UpdateEncryptionPasswordPolicies encryptionPasswordPolicies?;
    # Request model for updating login password policies
    UpdateLoginPasswordPolicies loginPasswordPolicies?;
    # Request model for updating shares password policies
    UpdateSharesPasswordPolicies sharesPasswordPolicies?;
};

# Auth token restrictions
public type AuthTokenRestrictions record {
    # &#128640; Since v4.13.0
    # 
    # Restricted OAuth access token validity (in seconds)
    int accessTokenValidity?;
    # &#128640; Since v4.13.0
    # 
    # Restricted OAuth refresh token validity (in seconds)
    int refreshTokenValidity?;
    # &#128640; Since v4.13.0
    # 
    # Defines if OAuth token restrictions are enabled
    boolean restrictionEnabled?;
};

# List of subscribed download shares
public type SubscribedDownloadShareList record {
    # List of subscribed download shares
    SubscribedDownloadShare[] items;
    # Range information
    Range range;
};

# Infrastructure properties
public type InfrastructureProperties record {
    # &#128640; Since v4.21.0
    # 
    # Determines if the DRACOON Core is deployed in the cloud environment
    boolean isDracoonCloud?;
    # Determines if the media server is enabled
    boolean mediaServerConfigEnabled?;
    # Suggested S3 Region
    string s3DefaultRegion?;
    # &#128640; Since v4.15.0
    # 
    # Enforce direct upload to S3
    boolean s3EnforceDirectUpload?;
    # Allow sending of share passwords via SMS
    boolean smsConfigEnabled?;
    # &#128640; Since v4.21.0
    # 
    # Current tenant UUID
    string tenantUuid?;
};

# User information
public type UserInfo record {
    # &#128640; Since v4.11.0
    # 
    # Avatar UUID
    string avatarUuid;
    # &#128679; Deprecated since v4.11.0
    # 
    # Display name
    # 
    # use other fields from `UserInfo` instead to combine a display name
    string displayName?;
    # &#128640; Since v4.11.0
    # 
    # Email 
    string email?;
    # &#128640; Since v4.11.0
    # 
    # User first name (mandatory if `userType` is `internal`)
    string firstName;
    # Unique identifier for the user
    int id;
    # &#128640; Since v4.11.0
    # 
    # User last name (mandatory if `userType` is `internal`)
    string lastName;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # &#128640; Since v4.13.0
    # 
    # Username (only returned for `internal` users)
    string userName;
    # &#128640; Since v4.11.0
    # 
    # User type:
    # 
    # * `internal` - ordinary DRACOON user
    # 
    # * `external` - external user without DRACOON account
    # 
    # * `system` - system user (non human &#128125;)
    # 
    # * `deleted` - deleted DRACOON user
    string userType;
};

# Active Directory information
public type ActiveDirectory record {
    # Unique name for an Active Directory configuration
    string alias;
    # ID
    int id;
    # Is available for all customers
    boolean isGlobalAvailable;
};

# Request model for testing connection for Active Directory configuration
public type TestActiveDirectoryConfigRequest record {
    # Search scope of Active Directory; only users below this node can log on.
    string ldapUsersDomain;
    # Distinguished Name (DN) of Active Directory administrative account
    string serverAdminName;
    # Password of Active Directory administrative account
    string serverAdminPassword;
    # IPv4 or IPv6 address or host name
    string serverIp;
    # Port
    int serverPort;
    # SSL finger print of Active Directory server.
    # 
    # Mandatory for LDAPS connections.
    # 
    # Format: `Algorithm/Fingerprint`
    string sslFingerPrint?;
    # Determines whether LDAPS should be used instead of plain LDAP.
    boolean useLdaps = false;
};

# Request model for updating a S3 configuration
public type S3ConfigUpdateRequest record {
    # Access Key ID
    string accessKey?;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 bucket name
    # 
    # use `bucketUrl` instead
    string bucketName?;
    # S3 object storage bucket URL
    string bucketUrl?;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 object storage endpoint URL
    # 
    # use `bucketUrl` instead
    string endpointUrl?;
    # S3 region
    string region?;
    # Secret Access Key
    string secretKey?;
};

# Algorithm information
public type AlgorithmVersionInfo record {
    # Algorithm description
    string description;
    # Algorithm status
    # 
    # Derived from preference value and threshold
    string status;
    # Algorithm version
    string 'version;
};

# List of customers
public type CustomerList record {
    # List of customers
    Customer[] items;
    # Range information
    Range range;
};

# Request model for updating group's metadata
public type UpdateGroupRequest record {
    # Expiration information
    ObjectExpiration expiration?;
    # Group name
    string name?;
};

# User custom attributes (list of key-value pairs)
# 
# # Deprecated
@deprecated
public type UserAttributes record {
    # List of key-value pairs
    KeyValueEntry[] items;
};

# Request model for enabling customer encryption
public type EnableCustomerEncryptionRequest record {
    # Key pair container
    UserKeyPairContainer dataSpaceRescueKey;
    # Set `true` to enable encryption for this customer
    boolean enableCustomerEncryption;
};

# Room information
public type LastAdminUserRoom record {
    # Room ID
    int id;
    # Determines whether user is last admin of a room due to being the last member of last admin group
    boolean lastAdminInGroup;
    # ID of the last admin group where the user is the only remaining member
    # 
    # (returned only if `lastAdminInGroup` is `true`)
    int lastAdminInGroupId?;
    # Room name
    string name;
    # Parent room ID
    int parentId?;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string parentPath;
};

# List of user file keys
# 
# # Deprecated
@deprecated
public type UserFileKeyList record {
    # List of user file keys
    UserFileKey[] items?;
};

# Request model for completing an upload
public type CompleteUploadRequest record {
    # File key information
    FileKey fileKey?;
    # New file name to store with
    string fileName?;
    # Preserve Download Share Links and point them to the new node.
    boolean keepShareLinks?;
    # Node conflict resolution strategy:
    # 
    # * `autorename`
    # 
    # * `overwrite`
    # 
    # * `fail`
    string resolutionStrategy?;
    # List of user file keys
    UserFileKeyList userFileKeyList?;
};

# Request model for handling pending assignments
public type PendingAssignmentsRequest record {
    # List of pending assignments
    PendingAssignment[] items;
};

# Shares password policies
public type SharesPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules?;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength?;
    # Determines whether a password must NOT contain word(s) from a dictionary
    boolean rejectDictionaryWords?;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns?;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo?;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Third-party dependency information
public type ThirdPartyDependenciesData record {
    # Third party dependencies artifactId
    string artifactId;
    # Third party dependencies description
    string description;
    # Third party dependencies groupId
    string groupId;
    # Third party dependencies id
    string id;
    # Third party dependencies licenses type
    string[] licenses;
    # Third party dependencies name
    string name;
    # Third party dependencies type
    string 'type;
    # Third party dependencies url
    string url;
    # Third party dependencies version
    string 'version;
};

# List of users
public type UserList record {
    # List of users
    UserItem[] items;
    # Range information
    Range range;
};

# Request model for creating a room
public type CreateRoomRequest record {
    # List of group ids
    # 
    # A room requires at least one admin (user or group)
    int[] adminGroupIds?;
    # List of user ids
    # 
    # A room requires at least one admin (user or group)
    int[] adminIds?;
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    # 
    # 
    # 
    # Provided (or default) classification is taken from room
    # 
    # when file gets uploaded without any classification.
    int classification = 2;
    # Is activities log active (for rooms only)
    boolean hasActivitiesLog = true;
    # &#128679; Deprecated since v4.10.0
    # 
    # Is recycle bin active (for rooms only)
    # 
    # Recycle bin is always on (disabling is not possible).
    boolean hasRecycleBin?;
    # Inherit permissions from parent room
    # 
    # (default: `false` if `parentId` is `0`; otherwise: `true`)
    boolean inheritPermissions?;
    # Name
    string name;
    # Behaviour when new users are added to the group:
    # 
    # * `autoallow`
    # 
    # * `pending`
    # 
    # 
    # 
    # Only relevant if `adminGroupIds` has items.
    string newGroupMemberAcceptance = "autoallow";
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # Parent room ID or `null` (not 0) to create a top level room
    int parentId?;
    # Quota in byte
    int quota?;
    # Retention period for deleted nodes in days
    @constraint:Int {maxValue: 9999}
    int recycleBinRetentionPeriod?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# RADIUS configuration
public type RadiusConfig record {
    # Failover server information
    FailoverServer failoverServer?;
    # RADIUS Server IP Address
    string ipAddress;
    # Sequence order of concatenated PIN and one-time token
    boolean otpPinFirst;
    # RADIUS Server Port
    int port;
    # Shared Secret to access the RADIUS server
    string sharedSecret;
};

# Request model for updating an OAuth client
public type UpdateOAuthClientRequest record {
    # Validity of the access token in seconds.
    int accessTokenValidity?;
    # &#128640; Since v4.22.0
    # 
    # Validity of the approval interval in seconds.
    int approvalValidity?;
    # Name, which is shown at the client configuration and authorization.
    string clientName?;
    # Secret, which client uses at authentication.
    string clientSecret?;
    # Determines whether client is a confidential or public client.
    string clientType?;
    # Authorized grant types
    # 
    # * `authorization_code`
    # 
    # * `implicit`
    # 
    # * `password`
    # 
    # * `client_credentials`
    # 
    # * `refresh_token`
    # 
    # 
    # 
    # cf. [RFC 6749](https://tools.ietf.org/html/rfc6749)
    string[] grantTypes;
    # Determines whether client is enabled.
    boolean isEnabled?;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris?;
    # Validity of the refresh token in seconds.
    int refreshTokenValidity?;
};

# User information
public type RoomUser record {
    # &#128679; Deprecated since v4.11.0
    # 
    # Display name
    # 
    # use information from `UserInfo` instead to combine a display name
    string displayName;
    # &#128679; Deprecated since v4.11.0
    # 
    # Email 
    # 
    # use `email` from `UserInfo` instead
    string email;
    # &#128679; Deprecated since v4.11.0
    # 
    # Unique identifier for the user
    # 
    # use `id` from `UserInfo` instead
    int id;
    # Is user granted room permissions
    boolean isGranted;
    # &#128679; Deprecated since v4.11.0
    # 
    # User login name
    string login;
    # Node permissions
    NodePermissions permissions?;
    # Public key container
    PublicKeyContainer publicKeyContainer?;
    # User information
    UserInfo userInfo;
};

# Room information
public type LastAdminGroupRoom record {
    # Room ID
    int id;
    # Room name
    string name;
    # Parent room ID
    int parentId?;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string parentPath;
};

# List of key-value pairs
public type ConfigOptionList record {
    # List of key-value pairs
    KeyValueEntry[] items;
};

# DRACOON server time
public type SdsServerTime record {
    # DRACOON server time
    string time?;
};

# Password reset information
public type ResetPasswordTokenValidateResponse record {
    # &#128679; Deprecated since v4.14.0
    # 
    # Allow weak password
    # 
    # Please use `loginPasswordPolicies` instead
    boolean allowSystemGlobalWeakPassword?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    string gender = "n";
    # User last name
    string lastName;
    # Login password policies
    LoginPasswordPolicies loginPasswordPolicies?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
};

# Request model for creating a S3 tag
public type S3TagCreateRequest record {
    # Determines whether S3 is mandatory or not
    boolean isMandatory = false;
    # S3 tag key
    string 'key;
    # S3 tag value
    string value;
};

# User avatar information
public type Avatar record {
    # Avatar URI
    string avatarUri;
    # Avatar UUID
    string avatarUuid;
    # Determines whether user updated his / her avatar with own image
    boolean isCustomAvatar;
};

# Request model for handling encryption settings for a room
public type EncryptRoomRequest record {
    # Key pair container
    UserKeyPairContainer dataRoomRescueKey?;
    # Encryption state
    boolean isEncrypted;
    # Use system emergency password (rescue key) for files in this room
    boolean useDataSpaceRescueKey?;
};

# Eventlog settings
public type EventlogConfig record {
    # Is eventlog enabled?
    boolean enabled?;
    # Determines whether user’s IP address is logged.
    boolean logIpEnabled?;
    # Retention period (in days) of event log entries.
    # 
    # After that period, all entries are deleted.
    # 
    # Recommended value: 7
    int retentionPeriod?;
};

# OpenID Connect provider information
public type OpenIdProvider record {
    # ID
    int id;
    # Is available for all customers
    boolean isGlobalAvailable;
    # Issuer identifier of the IDP
    # 
    # The value is a case sensitive URL.
    string issuer;
    # Name of the claim which is used for the user mapping.
    string mappingClaim;
    # Name of the IDP
    string name;
    # URL of the user management UI.
    # 
    # Use empty string to remove.
    string userManagementUrl?;
};

# User information
public type UserAccount record {
    # User Authentication Data
    UserAuthData authData;
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    UserAuthMethod[] authMethods?;
    # Customer information
    CustomerData customer;
    # Email 
    string email?;
    # Expiration date
    string expireAt?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    string gender = "n";
    # User has manageable rooms
    boolean hasManageableRooms;
    # Homeroom ID
    int homeRoomId?;
    # Unique identifier for the user
    int id;
    # User has generated private key.
    # 
    # Possible if client-side encryption is active for this customer
    boolean isEncryptionEnabled?;
    # User is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # User is locked and can not login anymore.
    boolean isLocked;
    # &#128640; Since v4.20.0
    # 
    # IETF language tag
    string language;
    # Last failed logon date
    string lastLoginFailAt?;
    # &#128679; Deprecated since v4.6.0
    # 
    # Last failed logon IP address
    string lastLoginFailIp?;
    # Last successful logon date
    string lastLoginSuccessAt?;
    # &#128679; Deprecated since v4.6.0
    # 
    # Last successful logon IP address
    string lastLoginSuccessIp?;
    # User last name
    string lastName;
    # &#128679; Deprecated since v4.7.0
    # 
    # User lock status:
    # 
    # * `0` - locked
    # 
    # * `1` - Web access allowed
    # 
    # * `2` - Web and mobile access allowed
    # 
    # 
    # 
    # Please use `isLocked` instead.
    int lockStatus;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # &#128640; Since v4.13.0
    # 
    # If `true`, the user must set the `email` at the first login.
    boolean mustSetEmail = false;
    # User has accepted EULA.
    # 
    # Present, if EULA is system global active.
    # 
    # cf. `GET system/config/settings/general` - `eulaEnabled`
    boolean needsToAcceptEULA?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Determines whether user has to change his / her password
    boolean needsToChangePassword;
    # &#128679; Deprecated since v4.13.0
    # 
    # If `true`, the user must change the `userName` at the first login.
    boolean needsToChangeUserName = false;
    # Phone number
    string phone?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # User custom attributes (list of key-value pairs)
    UserAttributes userAttributes?;
    # All groups the user is member of
    UserGroup[] userGroups?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName;
    # List of roles
    RoleList userRoles;
};

# Request model for completing a S3 file upload
public type CompleteS3FileUploadRequest record {
    # File key information
    FileKey fileKey?;
    # New file name to store with
    string fileName?;
    # Preserve Download Share Links and point them to the new node.
    boolean keepShareLinks = false;
    # List of S3 file upload parts
    S3FileUploadPart[] parts;
    # Node conflict resolution strategy:
    # 
    # * `autorename`
    # 
    # * `overwrite`
    # 
    # * `fail`
    string resolutionStrategy = "autorename";
};

# List of subscribed nodes
public type SubscribedNodeList record {
    # List of subscribed nodes
    SubscribedNode[] items;
    # Range information
    Range range;
};

# List of (last admin group) rooms
public type LastAdminGroupRoomList record {
    # List of last admin rooms
    LastAdminGroupRoom[] items;
};

# Pending assignment information
public type PendingAssignment record {
    # Unique identifier for the group
    int groupId;
    # Room ID
    int roomId;
    # Room name
    string roomName;
    # Acceptance state:
    # 
    # * `ACCEPTED`
    # 
    # * `WAITING`
    # 
    # * `DENIED`
    string state;
    # Unique identifier for the user
    int userId;
};

# Request model for updating system defaults
public type UpdateSystemDefaults record {
    # Default expiration period for Download Shares in days.
    int downloadShareDefaultExpirationPeriod?;
    # Default expiration period for all uploaded files in days.
    int fileDefaultExpirationPeriod?;
    # Define which language should be default.
    string languageDefault?;
    # &#128640; Since v4.12.0
    # 
    # Defines if new users get the role Non Member Viewer by default
    boolean nonmemberViewerDefault?;
    # Default expiration period for Upload Shares in days.
    int uploadShareDefaultExpirationPeriod?;
};

# Authentication settings
public type AuthConfig record {
    # List of authentication methods
    AuthMethod[] authMethods;
};

# Download URL
public type PublicDownloadTokenGenerateResponse record {
    # Download URL
    string downloadUrl?;
    # &#128679; Deprecated since v4.3.0
    # 
    # Download token
    string token;
};

# Request model for updating a webhook
public type UpdateWebhookRequest record {
    # List of names of event types
    string[] eventTypeNames?;
    # Is enabled
    boolean isEnabled?;
    # Name
    string name?;
    # Secret; used for event message signatures
    string secret?;
    # If set to true, an example event is being created
    boolean triggerExampleEvent?;
    # URL (must begin with the `HTTPS` scheme)
    string url?;
};

# Group information
public type UserGroup record {
    # Unique identifier for the group
    int id;
    # Determines whether user is a member of the group or not
    boolean isMember;
    # Group name
    string name;
};

# Presigned URL information
public type PresignedUrl record {
    # Corresponding part number
    int partNumber;
    # S3 presigned URL
    string url;
};

# S3 file upload status information
public type S3ShareUploadStatus record {
    # Error information
    ErrorResponse errorDetails?;
    # File name
    string fileName;
    # File size in byte
    int size?;
    # S3 file upload status:
    # 
    # * `transfer` - upload in progress
    # 
    # * `finishing` - completing file upload
    # 
    # * `done` - file upload successully done
    # 
    # * `error` - an error occurred while file upload
    string status;
};

# Request model for updating room's metadata
public type UpdateRoomRequest record {
    # Name
    string name?;
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # Quota in byte
    int quota?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    string timestampModification?;
};

# Active Directory configuration
public type ActiveDirectoryConfig record {
    # If `userImport` is set to `true`,
    # 
    # the user must be member of this Active Directory group to receive a newly created DRACOON account.
    string adExportGroup;
    # Unique name for an Active Directory configuration
    string alias;
    # &#128679; Deprecated since v4.10.0
    # 
    # DEPRECATED, will be ignored
    # 
    # Determines whether a room is created for each user that is created by automatic import (like a home folder).
    # 
    # Room's name will equal the user's login name.
    boolean createHomeFolder = false;
    # &#128679; Deprecated since v4.10.0
    # 
    # DEPRECATED, will be ignored
    # 
    # ID of the room in which the individual rooms for users will be created.
    int homeFolderParent?;
    # ID
    int id;
    # Search scope of Active Directory; only users below this node can log on.
    string ldapUsersDomain;
    # User group that is assigned to users who are created by automatic import.
    # 
    # Reset with `0`
    int sdsImportGroup?;
    # Distinguished Name (DN) of Active Directory administrative account
    string serverAdminName;
    # IPv4 or IPv6 address or host name
    string serverIp;
    # Port
    @constraint:Int {maxValue: 65535}
    int serverPort;
    # SSL finger print of Active Directory server.
    # 
    # Mandatory for LDAPS connections.
    # 
    # Format: `Algorithm/Fingerprint`
    string sslFingerPrint?;
    # Determines whether LDAPS should be used instead of plain LDAP.
    boolean useLdaps;
    # Name of Active Directory attribute that is used as login name.
    string userFilter;
    # Determines if a DRACOON account is automatically created for a new user
    # 
    # who successfully logs on with his / her AD / IDP account.
    boolean userImport;
};

# File key information
public type FileFileKeys record {
    # File key container
    FileKeyContainer fileKeyContainer?;
    # File ID
    int id?;
};

# New password
public type ResetPasswordWithTokenRequest record {
    # New password
    string password;
};

# Notification configuration information
public type NotificationConfig record {
    # List of notification channel IDs
    int[] channelIds;
    # Event type name
    string eventTypeName;
    # Notification configuration ID
    int id;
    # Scope ID
    int scopeId;
};

# List of deleted versions of nodes
public type DeletedNodeVersionsList record {
    # List of deleted nodes
    DeletedNode[] items;
    # Range information
    Range range;
};

# Request model for creating an Upload Share
public type CreateUploadShareRequest record {
    # &#128679; Deprecated since v4.20.0
    # 
    # Language tag for messages to creator
    string creatorLanguage?;
    # Expiration information
    ObjectExpiration expiration?;
    # Number of days after which uploaded files expire
    int filesExpiryPeriod?;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notification email content
    string mailBody?;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient email addresses
    string mailRecipients?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notification email subject
    string mailSubject?;
    # Maximal total size of uploaded files (in bytes)
    int maxSize?;
    # Maximal amount of files to upload
    int maxSlots?;
    # Alias name
    # 
    # (default: name of the shared node)
    string name?;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every upload.
    boolean notifyCreator = false;
    # Password
    string password?;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notify recipients via email
    # 
    # Please use `POST /shares/uploads/{share_id}/email` API instead.
    boolean sendMail = false;
    # &#128679; Deprecated since v4.11.0
    # 
    # Send share password via SMS
    # 
    # Please use `textMessageRecipients` attribute instead.
    boolean sendSms = false;
    # &#128640; Since v4.11.0
    # 
    # Show creator first and last name.
    boolean showCreatorName = false;
    # &#128640; Since v4.11.0
    # 
    # Show creator email address.
    boolean showCreatorUsername = false;
    # Allow display of already uploaded files
    boolean showUploadedFiles = false;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient MSISDNs
    string smsRecipients?;
    # Target room or folder ID
    int targetId;
    # &#128640; Since v4.11.0
    # 
    # List of recipient FQTNs
    # 
    # E.123 / E.164 Format
    string[] textMessageRecipients?;
};

# Request model for handling webhook assignments
public type RoomWebhookAssignment record {
    # Determines whether webhook is assigned to the room.
    boolean isAssigned;
    # Webhook ID
    int webhookId;
};

# Chunk upload response
public type ChunkUploadResponse record {
    # Hash value of transferred chunk
    string hash;
    # Chunk size
    int size;
};

# Request model for creating an OAuth client
public type CreateOAuthClientRequest record {
    # Validity of the access token in seconds.
    int accessTokenValidity?;
    # &#128640; Since v4.22.0
    # 
    # Validity of the approval interval in seconds.
    int approvalValidity?;
    # ID of the OAuth client
    string clientId?;
    # Name, which is shown at the client configuration and authorization.
    string clientName;
    # Secret, which client uses at authentication.
    string clientSecret?;
    # Determines whether client is a confidential or public client.
    string clientType?;
    # Authorized grant types
    # 
    # * `authorization_code`
    # 
    # * `implicit`
    # 
    # * `password`
    # 
    # * `client_credentials`
    # 
    # * `refresh_token`
    # 
    # 
    # 
    # cf. [RFC 6749](https://tools.ietf.org/html/rfc6749)
    string[] grantTypes;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris?;
    # Validity of the refresh token in seconds.
    int refreshTokenValidity?;
};

# Request model for updating folder's metadata
public type UpdateFolderRequest record {
    # Folder name
    string name?;
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# S3 configuration
public type S3Config record {
    # Determines whether Access Key ID is defined
    boolean accessKeyDefined;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 bucket name
    # 
    # use `bucketUrl` instead
    string bucketName?;
    # S3 object storage bucket URL
    string bucketUrl;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 object storage endpoint URL
    # 
    # use `bucketUrl` instead
    string endpointUrl?;
    # S3 region
    string region?;
    # Determines whether Access Secret Key is defined
    boolean secretKeyDefined;
};

# User Authentication Data
public type UserAuthData record {
    # ID of the user's Active Directory.
    int adConfigId?;
    # User login name
    string login?;
    # Authentication method
    # 
    # 
    # 
    # Authentication methods:
    # 
    # * `basic`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    string method;
    # Determines whether user has to change his / her password
    # 
    # * default: `true` for `basic` auth type
    # 
    # * default: `false` for `active_directory`, `openid` and `radius` auth types
    boolean mustChangePassword?;
    # ID of the user's OIDC provider.
    int oidConfigId?;
    # Password (only relevant for `basic` authentication type)
    # 
    # *NOT* your Active Directory, OpenID or RADIUS password!
    string password?;
};

# S3 file upload status information
public type S3FileUploadStatus record {
    # Error information
    ErrorResponse errorDetails?;
    # Node information (Node can be a room, folder or file)
    Node node?;
    # S3 file upload status:
    # 
    # * `transfer` - upload in progress
    # 
    # * `finishing` - completing file upload
    # 
    # * `done` - file upload successully done
    # 
    # * `error` - an error occurred while file upload
    string status;
};

# List of log operations
public type LogOperationList record {
    # List of all log operations
    LogOperation[] operationList;
};

# List of nodes
public type NodeList record {
    # List of nodes
    Node[] items;
    # Range information
    Range range;
};

# Request model for creating a key pair
public type CreateKeyPairRequest record {
    # Private key container
    PrivateKeyContainer previousPrivateKey;
    # Private key container
    PrivateKeyContainer privateKeyContainer;
    # Public key container
    PublicKeyContainer publicKeyContainer;
};

# Webhook information
public type RoomWebhook record {
    # Determines whether webhook is assigned to the room.
    boolean isAssigned;
    # Webhook information
    Webhook webhook;
};

# List of webhooks
public type RoomWebhookList record {
    # List of webhooks
    RoomWebhook[] items;
    # Range information
    Range range;
};

# Request model for completing a S3 file upload
public type CompleteS3ShareUploadRequest record {
    # List of S3 file upload parts
    S3FileUploadPart[] parts;
    # List of user file keys
    UserFileKey[] userFileKeyList?;
};

# Request model for creating an upload channel
public type CreateFileUploadRequest record {
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    # 
    # 
    # 
    # (default: classification from parent room)
    int classification?;
    # &#128640; Since v4.15.0
    # 
    # Upload direct to S3
    boolean directS3Upload = false;
    # Expiration information
    ObjectExpiration expiration?;
    # File name
    string name;
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # Parent node ID (room or folder)
    int parentId;
    # File size in byte
    int size?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# Pending user information
# 
# # Deprecated
@deprecated
public type PendingUserData record {
    # Display name
    # 
    # use information from `UserInfo` instead to combine a display name
    string displayName;
    # Email 
    # 
    # use `email` from `UserInfo` instead
    string email;
    # Unique identifier for the user
    int id;
    # User login name
    string login;
};

# Public key container
public type PublicKeyContainer record {
    # &#128640; Since v4.24.0
    # 
    # Creation date
    string createdAt?;
    # &#128640; Since v4.24.0
    # 
    # Created by user
    int createdBy?;
    # Expiration date
    string expireAt?;
    # Public key
    string publicKey;
    # Version
    string 'version;
};

# Download Share information
public type PublicDownloadShare record {
    # Creation date
    string createdAt;
    # Creator name
    string creatorName;
    # Creator username
    string creatorUsername?;
    # Expiration date
    string expireAt?;
    # File key information
    FileKey fileKey?;
    # File name
    string fileName;
    # &#128640; Since v4.11.0
    # 
    # Determines whether Download Share has a limit for amount of downloads
    boolean hasDownloadLimit;
    # Encryption state
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected;
    # Downloads limit reached
    boolean limitReached;
    # &#128640; Since v4.11.0
    # 
    # * `application/zip` (for folders and rooms)
    # 
    # * actual file media type (for files only)
    string mediaType;
    # Share display name (alias name)
    string name?;
    # User notes
    string notes?;
    # Private key container
    PrivateKeyContainer privateKeyContainer?;
    # File size or container size not compressed (in bytes)
    int size;
};

# Request model for copying nodes
public type CopyNodesRequest record {
    # List of nodes to be copied
    CopyNode[] items?;
    # Preserve Download Share Links and point them to the new node.
    boolean keepShareLinks?;
    # &#128679; Deprecated since v4.5.0
    # 
    # Node IDs
    # 
    # Please use `items` instead.
    int[] nodeIds?;
    # Node conflict resolution strategy:
    # 
    # * `autorename`
    # 
    # * `overwrite`
    # 
    # * `fail`
    string resolutionStrategy?;
};

# Failover server information
public type FailoverServer record {
    # RADIUS Failover Server is active
    boolean failoverEnabled;
    # RADIUS Failover Server IP Address
    # 
    # Required if failover server is enabled.
    string failoverIpAddress;
    # RADIUS Failover Server Port
    # 
    # Required if failover server is enabled.
    int failoverPort;
};

# List of OpenID Connect providers
public type OpenIdAuthResources record {
    # List of available OpenID Connect identity providers
    OpenIdProvider[] openIdProviders;
};

# Request model for deleting Download Shares
public type DeleteDownloadSharesRequest record {
    # List of share IDs
    int[] shareIds;
};

# Pending group information
# 
# # Deprecated
@deprecated
public type PendingGroupData record {
    # Unique identifier for the group
    # 
    # use `id` from `GroupInfo` instead
    int id;
    # Group name
    # 
    # use `name` from `GroupInfo` instead
    string name;
};

# First administrator user
public type FirstAdminUser record {
    # User Authentication Data
    UserAuthData authData?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    UserAuthMethod[] authMethods?;
    # Email 
    string email?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    string gender = "n";
    # &#128679; Deprecated since v4.7.0
    # 
    # Language ID or ISO 639-1 code
    string language?;
    # User last name
    string lastName;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Determines whether user has to change his / her initial password.
    # 
    # use `authDate.mustChangePassword` instead
    boolean needsToChangePassword?;
    # &#128679; Deprecated since v4.13.0
    # 
    # If `true`, the user must change the `userName` at the first login.
    boolean needsToChangeUserName = false;
    # Notify user about his new account
    # 
    # * default: `true` for `basic` auth type
    # 
    # * default: `false` for `active_directory`, `openid` and `radius` auth types
    boolean notifyUser?;
    # &#128679; Deprecated since v4.13.0
    # 
    # An initial password may be preset
    # 
    # use `authData` instead
    string password?;
    # Phone number
    string phone?;
    # IETF language tag
    string receiverLanguage?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# Right information
public type Right record {
    # Right description
    string description;
    # Unique identifier for the right
    int id;
    # Right (unique) name
    string name;
};

# Pending assignment information
public type PendingAssignmentData record {
    # &#128679; Deprecated since v4.2.0
    # 
    # Unique identifier for the group
    int groupId?;
    # Group information
    GroupInfo groupInfo;
    # Pending group information
    PendingGroupData pendingGroupData;
    # Pending user information
    PendingUserData pendingUserData;
    # Room ID
    int roomId;
    # Room name
    string roomName;
    # Acceptance state:
    # 
    # * `ACCEPTED`
    # 
    # * `WAITING`
    # 
    # * `DENIED`
    string state;
    # &#128679; Deprecated since v4.2.0
    # 
    # Unique identifier for the user
    int userId?;
    # User information
    UserInfo userInfo;
};

# List of customer attributes
public type CustomerAttributes record {
    # List of customer attributes
    KeyValueEntry[] items;
};

# Syslog event information
# 
# # Deprecated
@deprecated
public type SyslogEvent record {
    # Attribute 1
    string attribute1?;
    # Attribute 2
    string attribute2?;
    # Attribute 3
    string attribute3?;
    # Auth parent source ID
    string authParentSource?;
    # Auth parent target ID
    string authParentTarget?;
    # Unique identifier for the customer
    int customerId?;
    # Event ID
    int id;
    # Event description
    string message;
    # Object ID 1
    int objectId1?;
    # Object ID 2
    int objectId2?;
    # Object name 1
    string objectName1?;
    # Object type 2
    string objectName2?;
    # Object type 1
    int objectType1?;
    # Object type 2
    int objectType2?;
    # Operation type ID
    int operationId?;
    # Operation name
    string operationName?;
    # Operation status:
    # 
    # * `0` - Success
    # 
    # * `2` - Error
    int status?;
    # Event timestamp
    string time;
    # Client
    string userClient?;
    # Unique identifier for the user
    int userId;
    # User IP
    string userIp?;
    # Username
    string userName?;
};

# Customer information
public type UpdateCustomerResponse record {
    # &#128679; Deprecated since v4.8.0
    # 
    # Customer activation code string:
    # 
    # * valid only for types `free` and `demo`
    # 
    # * for `pay` customers it is empty
    string activationCode?;
    # Company name
    string companyName;
    # Creation date
    string createdAt?;
    # List of customer attributes
    CustomerAttributes customerAttributes?;
    # Customer type
    string customerContractType;
    # &#128640; Since v4.21.0
    # 
    # Customer UUID
    string customerUuid;
    # Unique identifier for the customer
    int id;
    # Customer is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean isLocked = false;
    # &#128679; Deprecated since v4.7.0
    # 
    # Customer lock status:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # Please use `isLocked` instead.
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean lockStatus;
    # Provider customer ID
    string providerCustomerId?;
    # Maximal disc space which can be allocated by customer in bytes. -1 for unlimited
    int quotaMax;
    # Number of days left for trial period (relevant only for type `demo`)
    # 
    # (not used)
    int trialDays?;
    # Modification date
    string updatedAt?;
    # Maximal number of users
    int userMax;
    # &#128640; Since v4.19.0
    # 
    # Maximal number of webhooks
    int webhooksMax?;
};

# List of notification scopes
public type NotificationScopeList record {
    # List of notification scopes
    NotificationScope[] items;
};

# Request model for reseting user's login password
public type ResetPasswordRequest record {
    # IETF language tag
    string creatorLanguage?;
    # &#128679; Deprecated since v4.7.0
    # 
    # Language ID or ISO 639-1 code
    string language?;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# List of log events
public type LogEventList record {
    # List of log events
    LogEvent[] items;
    # Range information
    Range range;
};

# List of Upload Shares
public type UploadShareList record {
    # List of Upload Shares
    UploadShare[] items;
    # Range information
    Range range;
};

# Request model for updating login password policies
public type UpdateLoginPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules?;
    # &#128679; Deprecated since v4.24.0
    # 
    # Determines whether a login password change should be enforced for all users
    # 
    # Only takes effect, if login password policies get stricter
    boolean enforceLoginPasswordChange?;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength?;
    # Number of passwords to archive
    # 
    # (must be between `0` and `10`; `0` means that password history is disabled)
    @constraint:Int {minValue: 1, maxValue: 10}
    int numberOfArchivedPasswords?;
    # Password expiration information
    PasswordExpiration passwordExpiration?;
    # Determines whether a password must NOT contain word(s) from a dictionary
    boolean rejectDictionaryWords?;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns?;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo?;
    # User lockout information
    UserLockout userLockout?;
};

# Request model for updating user's password
public type ChangeUserPasswordRequest record {
    # New password
    string newPassword;
    # Old password
    string oldPassword;
};

# OAuth client approval information
public type OAuthApproval record {
    # ID of the OAuth client
    string clientId;
    # Name, which is shown at the client configuration and authorization.
    string clientName;
    # Expiration date of the approval
    string expiresAt?;
};

# Deleted node information (Deleted node can be a folder or file)
public type DeletedNode record {
    # Last access date
    string accessedAt?;
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    # 
    # 
    # 
    # (default: classification from parent room)
    int classification?;
    # Creation date
    string createdAt?;
    # User information
    UserInfo createdBy?;
    # Deletion date
    string deletedAt?;
    # User information
    UserInfo deletedBy?;
    # Expiration date
    string expireAt?;
    # Node ID
    int id?;
    # Encryption state
    boolean isEncrypted?;
    # Node name
    string name;
    # User notes
    string notes?;
    # Parent node ID (room or folder)
    int parentId;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string parentPath;
    # Node size in byte
    int size?;
    # Node type
    string 'type;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# File key information
public type FileKey record {
    # Initial vector
    string iv;
    # Encryption key
    string 'key;
    # Authentication tag
    # 
    # (needed with authenticated encryption)
    string tag;
    # Version
    string 'version;
};

# List of user public keys
public type UserUserPublicKeyList record {
    # List of user public keys
    UserUserPublicKey[] items;
};

# List of syslog events
# 
# # Deprecated
@deprecated
public type SyslogEventList record {
    # List of log events
    SyslogEvent[] items;
    # Range information
    Range range;
};

# Software version information
public type SoftwareVersionData record {
    # Build date
    string buildDate;
    # &#128640; Since v4.24.0
    # 
    # Determines if the DRACOON Core is deployed in the cloud environment
    boolean isDracoonCloud?;
    # REST API version
    string restApiVersion;
    # Revision number
    string scmRevisionNumber;
    # DRACOON server version
    string sdsServerVersion;
};

# RADIUS challenge reply
public type RadiusChallengeResponse record {
    # HTTP status code
    int code;
    # Debug information
    string debugInfo?;
    # Internal error code
    int errorCode?;
    # HTTP status code description
    string message;
    # RADIUS Reply-Message
    # 
    # Instruction how to handle the situation.
    string replyMessage;
    # For RADIUS Access-Challenge
    # 
    # If a `replyState` is returned, it must be included as `state` in the following request.
    string replyState;
};

# Request model for updating eventlog settings
public type UpdateEventlogConfig record {
    # Is eventlog enabled?
    boolean enabled?;
    # Determines whether user’s IP address is logged.
    boolean logIpEnabled?;
    # Retention period (in days) of event log entries.
    # 
    # After that period, all entries are deleted.
    # 
    # Recommended value: 7
    int retentionPeriod?;
};

# User ID and file ID mapping
public type UserIdFileIdItem record {
    # File ID
    int fileId?;
    # Unique identifier for the user
    int userId?;
};

# Audit user permissions report
public type AuditUserPermission record {
    # Node permissions
    NodePermissions permissions;
    # User first name
    string userFirstName;
    # Unique identifier for the user
    int userId;
    # User last name
    string userLastName;
    # User login name
    string userLogin;
};

# Request model for updating a node comment
public type ChangeNodeCommentRequest record {
    # Comment text
    string text;
};

# OAuth authorization
public type OAuthAuthorization record {
    # ID of the OAuth client
    string clientId;
    # Name, which is shown at the client configuration and authorization.
    string clientName;
    # &#128640; Since v4.13.0
    # 
    # Creation date of the authorization
    string createdAt?;
    # Expiration date of the authorization
    string expiresAt?;
    # &#128640; Since v4.12.0
    # 
    # ID of the OAuth authorization
    int id?;
    # &#128640; Since v4.25.0
    # 
    # Determines whether authorization matches the one from Authorization Header
    boolean isCurrentAuthorization?;
    # &#128640; Since v4.12.0
    # 
    # Determines whether client is a standard client.
    boolean isStandard?;
    # &#128640; Since v4.13.0
    # 
    # Usage date of the authorization
    # 
    # (Time of last usage.)
    string usedAt?;
    # &#128640; Since v4.12.0
    # 
    # User agent category.
    string userAgentCategory;
    # &#128640; Since v4.12.0
    # 
    # User agent info.
    string userAgentInfo?;
    # &#128640; Since v4.12.0
    # 
    # User agent OS.
    string userAgentOs?;
    # &#128640; Since v4.12.0
    # 
    # User agent type.
    string userAgentType?;
};

# Request model for revoking user(s) from the room
public type RoomUsersDeleteBatchRequest record {
    # List of user IDs
    int[] ids;
};

# Request model for sending an email of a Download Share link
public type DownloadShareLinkEmail record {
    # Notification email content
    string body;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # List of recipient email addresses
    string[] recipients;
};

# Private key container
public type PrivateKeyContainer record {
    # &#128640; Since v4.24.0
    # 
    # Creation date
    string createdAt?;
    # &#128640; Since v4.24.0
    # 
    # Created by user
    int createdBy?;
    # Expiration date
    string expireAt?;
    # Private key
    string privateKey;
    # Version
    string 'version;
};

# Request model for updating syslog settings
public type UpdateSyslogConfig record {
    # Is syslog enabled?
    boolean enabled?;
    # Syslog server (IP or FQDN)
    string host?;
    # Determines whether user’s IP address is logged.
    boolean logIpEnabled?;
    # Syslog server port
    int port?;
    # Protocol to connect to syslog server
    string protocol?;
};

# Event type information
public type EventType record {
    # ID
    int id;
    # Name
    string name;
    # Usable as customer admin webhook
    boolean usableCustomerAdminWebhook;
    # Usable as node webhook
    boolean usableNodeWebhook;
    # Usable as push notification
    boolean usablePushNotification;
    # Usable as tenant webhook
    boolean usableTenantWebhook;
};

# Request model for updating a RADIUS configuration
public type RadiusConfigUpdateRequest record {
    # Failover server information
    FailoverServer failoverServer?;
    # RADIUS Server IP Address
    string ipAddress?;
    # Sequence order of concatenated PIN and one-time token
    boolean otpPinFirst?;
    # RADIUS Server Port
    int port?;
    # Shared Secret to access the RADIUS server
    string sharedSecret?;
};

# Password expiration information
public type PasswordExpiration record {
    # Determines whether password expiration is enabled
    boolean enabled;
    # Maximum allowed password age (in days)
    int maxPasswordAge?;
};

# List of user IDs
public type ChangeGroupMembersRequest record {
    # List of user IDs
    int[] ids;
};

# Parent node
public type NodeParent record {
    # Node ID
    int id;
    # Node name
    string name;
    # Parent node ID (room or folder)
    int parentId?;
    # Node type
    string 'type;
};

# List of notification channels
public type NotificationChannelList record {
    # List of notification channels
    NotificationChannel[] items;
};

# File key container
public type FileKeyContainer record {
    # Initial vector
    string iv;
    # Encryption key
    string 'key;
    # Authentication tag
    # 
    # (needed with authenticated encryption)
    string tag?;
    # Version
    string 'version;
};

# S3 tag information
public type S3Tag record {
    # S3 tag ID
    int id?;
    # Determines whether S3 is mandatory or not
    boolean isMandatory?;
    # S3 tag key
    string 'key?;
    # S3 tag value
    string value?;
};

# Request model for ZIP download
public type ZipDownloadRequest record {
    # List of node IDs
    int[] nodeIds;
};

# Request model for generating presigned URLs
public type GeneratePresignedUrlsRequest record {
    # First part number of a range of requested presigned URLs (for S3 it is: `1`)
    int firstPartNumber;
    # Last part number of a range of requested presigned URLs
    int lastPartNumber;
    # `Content-Length` header size for each presigned URL (in bytes)
    # 
    # *MUST* be >= 5 MB except the last part.
    int size;
};

# Request model for updating general settings
public type UpdateGeneralSettings record {
    # Request model for updating auth token settings
    UpdateAuthTokenRestrictions authTokenRestrictions?;
    # Activation status of client-side encryption.
    # 
    # Can only be enabled once; disabling is not possible.
    boolean cryptoEnabled?;
    # Enable email notification button
    boolean emailNotificationButtonEnabled?;
    # Each user has to confirm the EULA at first login.
    boolean eulaEnabled?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Defines if login fields should be hidden
    boolean hideLoginInputFields?;
    # &#128679; Deprecated since v4.12.0
    # 
    # Determines if the media server is enabled
    boolean mediaServerEnabled?;
    # &#128640; Since v4.9.0
    # 
    # Defines if S3 tags are enabled
    boolean s3TagsEnabled?;
    # Allow sending of share passwords via SMS
    boolean sharePasswordSmsEnabled?;
    # &#128679; Deprecated since v4.14.0
    # 
    # Allow weak password
    # 
    # * A weak password has to fulfill the following criteria:
    # 
    #    * is at least 8 characters long
    # 
    #    * contains letters and numbers
    # 
    # * A strong password has to fulfill the following criteria in addition:
    # 
    #    * contains at least one special character
    # 
    #    * contains upper and lower case characters
    # 
    # Please use `PUT /system/config/policies/passwords` API to change configured password policies.
    boolean weakPasswordEnabled?;
};

# Request model for creating a customer
public type NewCustomerRequest record {
    # &#128679; Deprecated since v4.8.0
    # 
    # Customer activation code string:
    # 
    # * valid only for types `free` and `demo`
    # 
    # * for `pay` customers it is empty
    string activationCode?;
    # Company name
    string companyName?;
    # List of customer attributes
    CustomerAttributes customerAttributes?;
    # Customer type
    string customerContractType;
    # First administrator user
    FirstAdminUser firstAdminUser;
    # Customer is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean isLocked = false;
    # &#128679; Deprecated since v4.7.0
    # 
    # Customer lock status:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # Please use `isLocked` instead.
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean lockStatus = false;
    # Provider customer ID
    string providerCustomerId?;
    # Maximal disc space which can be allocated by customer in bytes. -1 for unlimited
    int quotaMax;
    # Number of days left for trial period (relevant only for type `demo`)
    # 
    # (not used)
    int trialDays?;
    # Maximal number of users
    int userMax;
    # &#128640; Since v4.19.0
    # 
    # Maximal number of webhooks
    int webhooksMax?;
};

# Upload channel information
public type CreateFileUploadResponse record {
    # &#128679; Deprecated since v4.3.0
    # 
    # Upload token
    string token;
    # Upload (channel) ID
    string uploadId;
    # (public) Upload URL
    string uploadUrl;
};

# Request model for updating favorites
public type UpdateFavoritesBulkRequest record {
    # Sets the favorite attribute to true or false on each file in an array of nodes.
    boolean isFavorite;
    # List of ids
    int[] objectIds;
};

# Request model for updating file's metadata
public type UpdateFileRequest record {
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    int classification?;
    # Expiration information
    ObjectExpiration expiration?;
    # File name
    string name?;
    # User notes
    # 
    # Use empty string to remove.
    string notes?;
    # &#128640; Since v4.22.0
    # 
    # Time the node was created on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampCreation?;
    # &#128640; Since v4.22.0
    # 
    # Time the content of a node was last modified on external file system
    # 
    # (default: current server datetime in UTC format)
    string timestampModification?;
};

# Key-value pair
public type KeyValueEntry record {
    # Entry key
    string 'key;
    # Entry value
    string value;
};

# List of S3 tag IDs
public type S3TagIds record {
    # List of S3 tag IDs
    int[] ids;
};

# List of rooms
public type RoomTreeDataList record {
    # List of room data information
    RoomData[] items;
    # Range information
    Range range;
};

# Log event information
public type LogEvent record {
    # Attribute 1
    string attribute1?;
    # Attribute 2
    string attribute2?;
    # Attribute 3
    string attribute3?;
    # Auth parent source ID
    string authParentSource?;
    # Auth parent target ID
    string authParentTarget?;
    # Unique identifier for the customer
    int customerId?;
    # Event ID
    int id;
    # Event description
    string message;
    # Object ID 1
    int objectId1?;
    # Object ID 2
    int objectId2?;
    # Object name 1
    string objectName1?;
    # Object name 2
    string objectName2?;
    # Object type 1
    int objectType1?;
    # Object type 2
    int objectType2?;
    # Operation type ID
    int operationId?;
    # Operation name
    string operationName?;
    # Operation status:
    # 
    # * `0` - Success
    # 
    # * `2` - Error
    int status?;
    # Event timestamp
    string time;
    # Client
    string userClient?;
    # Unique identifier for the user
    int userId;
    # User IP
    string userIp?;
    # Username
    string userName?;
};

# Customer information
public type CustomerData record {
    # User accounts limit
    int accountsLimit;
    # User accounts used
    int accountsUsed;
    # &#128679; Deprecated since v4.11.0
    # 
    # Total number of files
    # 
    # Visible only with at least one global role.
    int cntFiles?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Total number of folders
    # 
    # Visible only with at least one global role.
    int cntFolders?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Total number of rooms
    # 
    # Visible only with at least one global role.
    int cntRooms?;
    # Clientside encryption for customer enabled
    boolean customerEncryptionEnabled;
    # Unique identifier for the customer
    int id;
    # Customer is Provider Customer
    boolean isProviderCustomer;
    # Customer name
    string name;
    # Space limit (in bytes). -1 for unlimited
    int spaceLimit;
    # Space used (in bytes)
    int spaceUsed;
};

# Encryption states
public type EncryptionInfo record {
    # DRACOON key state
    string dataSpaceKeyState;
    # Room key state
    string roomKeyState;
    # User key state
    string userKeyState;
};

# List of roles
public type RoleList record {
    # List of roles
    Role[] items;
};

# Request model for creating a S3 configuration
public type S3ConfigCreateRequest record {
    # Access Key ID
    string accessKey;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 bucket name
    # 
    # use `bucketUrl` instead
    string bucketName?;
    # S3 object storage bucket URL
    string bucketUrl?;
    # &#128679; Deprecated since v4.24.0
    # 
    # S3 object storage endpoint URL
    # 
    # use `bucketUrl` instead
    string endpointUrl?;
    # S3 region
    string region?;
    # Secret Access Key
    string secretKey;
};

# Range information
public type Range record {
    # Range limit. Maximum 500.
    int 'limit;
    # Range offset
    int offset;
    # Total items available
    int total;
};

# Group information
public type RoleGroup record {
    # Unique identifier for the group
    int id;
    # Is group member of the role
    boolean isMember;
    # Group name
    string name;
};

# Response model for testing connection for Active Directory configuration
public type TestActiveDirectoryConfigResponse record {
    # Search scope of Active Directory; only users below this node can log on.
    string ldapUsersDomain;
    # Distinguished Name (DN) of Active Directory administrative account
    string serverAdminName;
    # Password of Active Directory administrative account
    string serverAdminPassword;
    # IPv4 or IPv6 address or host name
    string serverIp;
    # Port
    int serverPort;
    # SSL finger print of Active Directory server.
    # 
    # Mandatory for LDAPS connections.
    # 
    # Format: `Algorithm/Fingerprint`
    string sslFingerPrint?;
    # Determines whether LDAPS should be used instead of plain LDAP.
    boolean useLdaps;
};

# Public key information
public type UserUserPublicKey record {
    # Unique identifier for the user
    int id?;
    # Public key container
    PublicKeyContainer publicKeyContainer?;
};

# Notification channel information
public type NotificationChannel record {
    # Channel frequency (aggregation window size in minutes)
    int frequency;
    # Channel ID
    int id;
    # Determines whether channel is enabled
    boolean isEnabled;
    # Name
    string name;
    # Channel type (only `EMAIL` available at the moment)
    string 'type;
};

# Request model for handling webhook assignments
public type UpdateRoomWebhookRequest record {
    # Assign a webhook to a room to use it for node actions within the room 
    RoomWebhookAssignment[] items;
};

# Customer settings
public type CustomerSettingsResponse record {
    # Homeroom Parent ID
    int homeRoomParentId?;
    # Homeroom Parent Name
    string homeRoomParentName?;
    # Homeroom Quota in bytes
    int homeRoomQuota?;
    # Homerooms active
    boolean homeRoomsActive;
};

# User profile attributes
public type ProfileAttributes record {
    # List of key-value pairs
    KeyValueEntry[] items;
    # Range information
    Range range;
};

# Password character rules
public type CharacterRules record {
    # Characters which a password must contain:
    # 
    # * `alpha` - at least one alphabetical character (`uppercase` OR `lowercase`)
    # 
    # * `uppercase` - at least one uppercase character
    # 
    # * `lowercase` - at least one lowercase character
    # 
    # * `numeric` - at least one numeric character
    # 
    # * `special` - at least one special character (letters and digits excluded)
    # 
    # * `all` - combination of `uppercase`, `lowercase`, `numeric` and `special` (available only in request models)
    # 
    # * `none` - none of the above
    string[] mustContainCharacters;
    # Number of characteristics to enforce
    # 
    # e.g. from `["uppercase", "lowercase", "numeric", "special"]`
    # 
    # all 4 character sets can be enforced; but also only 2 of them
    @constraint:Int {maxValue: 4}
    int numberOfCharacteristicsToEnforce;
};

# User Authentication Data Update Request
public type UserAuthDataUpdateRequest record {
    # ID of the user's Active Directory.
    int adConfigId?;
    # User login name
    string login?;
    # Authentication method
    # 
    # 
    # 
    # Authentication methods:
    # 
    # * `basic`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    string method?;
    # ID of the user's OIDC provider.
    int oidConfigId?;
};

# Request model for moving nodes
public type MoveNodesRequest record {
    # List of nodes to be moved
    MoveNode[] items?;
    # Preserve Download Share Links and point them to the new node.
    boolean keepShareLinks?;
    # &#128679; Deprecated since v4.5.0
    # 
    # Node IDs
    # 
    # Please use `items` instead.
    int[] nodeIds?;
    # Node conflict resolution strategy:
    # 
    # * `autorename`
    # 
    # * `overwrite`
    # 
    # * `fail`
    string resolutionStrategy?;
};

# List of node comments
public type CommentList record {
    # List of node comments
    Comment[] items;
    # Range information
    Range range;
};

# List of groups with assigned role
public type RoleGroupList record {
    # List of role-group mappings
    RoleGroup[] items;
    # Range information
    Range range;
};

# Request model for updating user's metadata
public type UpdateUserRequest record {
    # User Authentication Data Update Request
    UserAuthDataUpdateRequest authData?;
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    UserAuthMethod[] authMethods?;
    # Email 
    string email?;
    # Expiration information
    ObjectExpiration expiration?;
    # User first name
    string firstName?;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    # 
    # Do NOT use `gender`! It will be ignored.
    string gender?;
    # User is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # User is locked and can not login anymore.
    boolean isLocked?;
    # User last name
    string lastName?;
    # &#128679; Deprecated since v4.7.0
    # 
    # User lock status:
    # 
    # * `0` - locked
    # 
    # * `1` - Web access allowed
    # 
    # * `2` - Web and mobile access allowed
    # 
    # 
    # 
    # Please use `isLocked` instead.
    int lockStatus?;
    # Phone number
    string phone?;
    # IETF language tag
    string receiverLanguage?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# Encryption password policies
public type EncryptionPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules?;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength?;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns?;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo?;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# List of users with assigned role
public type RoleUserList record {
    # List of role-user mappings
    RoleUser[] items;
    # Range information
    Range range;
};

# Request model for updating a Download Share
public type UpdateDownloadShareRequest record {
    # Country shorthand symbol (cf. ISO 3166-2)
    string defaultCountry?;
    # Expiration information
    ObjectExpiration expiration?;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # Max allowed downloads
    int maxDownloads?;
    # Alias name
    string name?;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every download.
    boolean notifyCreator?;
    # Access password, not allowed for encrypted shares
    string password?;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # Set 'true' to reset 'maxDownloads' for Download Share.
    boolean resetMaxDownloads?;
    # Set 'true' to reset 'password' for Download Share.
    boolean resetPassword?;
    # Show creator first and last name.
    boolean showCreatorName?;
    # Show creator email address.
    boolean showCreatorUsername?;
    # List of recipient FQTNs
    # 
    # E.123 / E.164 Format
    string[] textMessageRecipients?;
};

# Request model for sending an email of an Upload Share link
public type UploadShareLinkEmail record {
    # Notification email content
    string body;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # List of recipient email addresses
    string[] recipients;
};

# User information
public type GroupUser record {
    # &#128679; Deprecated since v4.11.0
    # 
    # Display name
    # 
    # use information from `UserInfo` instead to combine a display name
    string displayName;
    # &#128679; Deprecated since v4.11.0
    # 
    # Email 
    # 
    # use `email` from `UserInfo` instead
    string email;
    # &#128679; Deprecated since v4.11.0
    # 
    # Unique identifier for the user
    # 
    # use `id` from `UserInfo` instead
    int id;
    # Determines whether user is a member of the group or not
    boolean isMember;
    # &#128679; Deprecated since v4.11.0
    # 
    # User login name
    string login;
    # User information
    UserInfo userInfo;
};

# List of deleted nodes
public type DeletedNodeSummaryList record {
    # List of deleted nodes (summary)
    DeletedNodeSummary[] items;
    # Range information
    Range range;
};

# OAuth client information
public type OAuthClient record {
    # Validity of the access token in seconds.
    int accessTokenValidity?;
    # &#128640; Since v4.22.0
    # 
    # Validity of the approval interval in seconds.
    int approvalValidity?;
    # ID of the OAuth client
    string clientId;
    # Name, which is shown at the client configuration and authorization.
    string clientName?;
    # Secret, which client uses at authentication.
    string clientSecret?;
    # Determines whether client is a confidential or public client.
    string clientType?;
    # Authorized grant types
    # 
    # * `authorization_code`
    # 
    # * `implicit`
    # 
    # * `password`
    # 
    # * `client_credentials`
    # 
    # * `refresh_token`
    # 
    # 
    # 
    # cf. [RFC 6749](https://tools.ietf.org/html/rfc6749)
    string[] grantTypes;
    # Determines whether client is enabled.
    boolean isEnabled?;
    # Determines whether client is an external client.
    boolean isExternal?;
    # Determines whether client is a standard client.
    boolean isStandard?;
    # URIs, to which a user is redirected after authorization.
    string[] redirectUris?;
    # Validity of the refresh token in seconds.
    int refreshTokenValidity?;
};

# User information
public type UserData record {
    # User Authentication Data
    UserAuthData authData;
    # &#128679; Deprecated since v4.13.0
    # 
    # Authentication methods:
    # 
    # * `sql`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    # 
    # use `authData` instead
    UserAuthMethod[] authMethods?;
    # &#128640; Since v4.11.0
    # 
    # Avatar UUID
    string avatarUuid;
    # Email 
    string email?;
    # Expiration date
    string expireAt?;
    # User first name
    string firstName;
    # &#128679; Deprecated since v4.12.0
    # 
    # Gender
    string gender = "n";
    # User has manageable rooms
    boolean hasManageableRooms?;
    # Homeroom ID
    int homeRoomId?;
    # Unique identifier for the user
    int id;
    # User has generated private key.
    # 
    # Possible if client-side encryption is active for this customer
    boolean isEncryptionEnabled?;
    # User is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # User is locked and can not login anymore.
    boolean isLocked;
    # Last successful logon date
    string lastLoginSuccessAt?;
    # User last name
    string lastName;
    # &#128679; Deprecated since v4.7.0
    # 
    # User lock status:
    # 
    # * `0` - locked
    # 
    # * `1` - Web access allowed
    # 
    # * `2` - Web and mobile access allowed
    # 
    # 
    # 
    # Please use `isLocked` instead.
    int lockStatus;
    # &#128679; Deprecated since v4.13.0
    # 
    # User login name
    string login?;
    # Phone number
    string phone?;
    # Public key container
    PublicKeyContainer publicKeyContainer?;
    # &#128679; Deprecated since v4.18.0
    # 
    # Job title
    string title?;
    # User custom attributes (list of key-value pairs)
    UserAttributes userAttributes?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName;
    # List of roles
    RoleList userRoles?;
};

# Request model for performing an authentication
public type LoginRequest record {
    # Authentication methods
    string authType?;
    # &#128679; Deprecated since v4.7.0
    # 
    # Language ID or ISO 639-1 code
    string language?;
    # &#128679; Deprecated since v4.7.0
    # 
    # User login name
    string login?;
    # Password
    string password;
    # For RADIUS Access-Challenge
    # 
    # If a `replyState` is returned, it must be included as `state` in the following request.
    string state?;
    # RADIUS Token
    string token?;
    # &#128640; Since v4.13.0
    # 
    # Username
    string userName?;
};

# Request model for configuring a room
public type ConfigRoomRequest record {
    # List of group ids
    # 
    # A room requires at least one admin (user or group)
    int[] adminGroupIds?;
    # List of user ids
    # 
    # A room requires at least one admin (user or group)
    int[] adminIds?;
    # Classification ID:
    # 
    # * `1` - public
    # 
    # * `2` - internal
    # 
    # * `3` - confidential
    # 
    # * `4` - strictly confidential
    # 
    # 
    # 
    # Provided (or default) classification is taken from room
    # 
    # when file gets uploaded without any classification.
    int classification?;
    # Is activities log active (for rooms only)
    boolean hasActivitiesLog?;
    # &#128679; Deprecated since v4.10.0
    # 
    # Is recycle bin active (for rooms only)
    # 
    # Recycle bin is always on (disabling is not possible).
    boolean hasRecycleBin?;
    # Inherit permissions from parent room
    # 
    # (default: `false` if `parentId` is `0`; otherwise: `true`)
    boolean inheritPermissions?;
    # Behaviour when new users are added to the group:
    # 
    # * `autoallow`
    # 
    # * `pending`
    # 
    # 
    # 
    # Only relevant if `adminGroupIds` has items.
    string newGroupMemberAcceptance?;
    # Retention period for deleted nodes in days
    @constraint:Int {maxValue: 9999}
    int recycleBinRetentionPeriod?;
    # Take over existing permissions
    boolean takeOverPermissions?;
};

# Request model for updating encryption password policies
public type UpdateEncryptionPasswordPolicies record {
    # Password character rules
    CharacterRules characterRules?;
    # Minimum number of characters a password must contain
    @constraint:Int {minValue: 1, maxValue: 1024}
    int minLength?;
    # Determines whether a password must NOT contain keyboard patterns (e.g. `qwertz`, `asdf`)
    # 
    # (min. 4 character pattern)
    boolean rejectKeyboardPatterns?;
    # Determines whether a password must NOT contain user info (first name, last name, email, user name)
    boolean rejectUserInfo?;
};

# List of group IDs
public type GroupIds record {
    # List of group IDs
    int[] ids;
};

# Ranged list of attributes
public type AttributesResponse record {
    # List of key-value pairs
    KeyValueEntry[] items;
    # Range information
    Range range;
};

# Request model for updating an Upload Share
public type UpdateUploadShareRequest record {
    # Country shorthand symbol (cf. ISO 3166-2)
    string defaultCountry?;
    # Expiration information
    ObjectExpiration expiration?;
    # Number of days after which uploaded files expire
    int filesExpiryPeriod?;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # Maximal total size of uploaded files (in bytes)
    int maxSize?;
    # Maximal amount of files to upload
    int maxSlots?;
    # Alias name
    string name?;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every upload.
    boolean notifyCreator?;
    # Password
    string password?;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # Set 'true' to reset 'filesExpiryPeriod' for Upload Share
    boolean resetFilesExpiryPeriod?;
    # Set 'true' to reset 'maxSize' for Upload Share
    boolean resetMaxSize?;
    # Set 'true' to reset 'maxSlots' for Upload Share
    boolean resetMaxSlots?;
    # Set 'true' to reset 'password' for Upload Share.
    boolean resetPassword?;
    # Show creator first and last name.
    boolean showCreatorName?;
    # Show creator email address.
    boolean showCreatorUsername?;
    # Allow display of already uploaded files
    boolean showUploadedFiles?;
    # List of recipient FQTNs
    # 
    # E.123 / E.164 Format
    string[] textMessageRecipients?;
};

# List of Active Directory configurations
public type ActiveDirectoryConfigList record {
    # List of Active Directory configurations
    ActiveDirectoryConfig[] items;
};

# Audit node report
public type AuditNodeResponse record {
    # List of assigned users with permissions
    AuditUserPermission[] auditUserPermissionList;
    # Number of direct children
    # 
    # (no recursion; for rooms only)
    int nodeCntChildren;
    # Creation date
    string nodeCreatedAt?;
    # User information
    UserInfo nodeCreatedBy?;
    # Is activities log active (for rooms only)
    boolean nodeHasActivitiesLog = true;
    # &#128679; Deprecated since v4.10.0
    # 
    # Is recycle bin active (for rooms only)
    # 
    # Recycle bin is always on (disabling is not possible).
    boolean nodeHasRecycleBin?;
    # Node ID
    int nodeId;
    # Encryption state
    boolean nodeIsEncrypted?;
    # Node name
    string nodeName;
    # Parent node ID (room or folder)
    int nodeParentId?;
    # Parent node path
    # 
    # `/` if node is a root node (room)
    string nodeParentPath;
    # Quota in byte
    int nodeQuota?;
    # Retention period for deleted nodes in days
    @constraint:Int {maxValue: 9999}
    int nodeRecycleBinRetentionPeriod?;
    # Node size in byte
    int nodeSize?;
    # Modification date
    string nodeUpdatedAt?;
    # User information
    UserInfo nodeUpdatedBy?;
};

# Upload Share information
public type PublicUploadShare record {
    # Creation date
    string createdAt;
    # &#128640; Since v4.11.0
    # 
    # Creator name
    string creatorName;
    # &#128640; Since v4.11.0
    # 
    # Creator username
    string creatorUsername?;
    # Expiration date
    string expireAt?;
    # Encryption state
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected;
    # &#128679; Deprecated since v4.2.0
    # 
    # Maximal total size of uploaded files (in bytes)
    decimal maxSize?;
    # &#128679; Deprecated since v4.2.0
    # 
    # Maximal amount of files to upload
    int maxSlots;
    # Share display name (alias name)
    string name?;
    # User notes
    string notes?;
    # Remaining size
    int remainingSize?;
    # Remaining slots
    int remainingSlots?;
    # Allow display of already uploaded files
    boolean showUploadedFiles?;
    # List of (public) uploaded files
    PublicUploadedFileData[] uploadedFiles?;
    # List of user public keys
    UserUserPublicKeyList userUserPublicKeyList?;
};

# Node comment information
public type Comment record {
    # Creation date
    string createdAt;
    # User information
    UserInfo createdBy;
    # Comment ID
    int id;
    # Determines whether comment was edited or not
    boolean isChanged;
    # Determines whether comment was deleted or not
    boolean isDeleted;
    # Comment text
    string text;
    # Modification date
    string updatedAt;
    # User information
    UserInfo updatedBy;
};

# Authentication method
# 
# # Deprecated
@deprecated
public type UserAuthMethod record {
    # Authentication method
    # 
    # 
    # 
    # Authentication methods:
    # 
    # * `basic`
    # 
    # * `active_directory`
    # 
    # * `radius`
    # 
    # * `openid`
    string authId;
    # Is enabled
    boolean isEnabled;
    # Authentication method options
    KeyValueEntry[] options?;
};

# Key pair container
public type UserKeyPairContainer record {
    # Private key container
    PrivateKeyContainer privateKeyContainer;
    # Public key container
    PublicKeyContainer publicKeyContainer;
};

# Request item model for granting group to the room
public type RoomGroupsAddBatchRequestItem record {
    # Unique identifier for the group
    int id;
    # Behaviour when new users are added to the group:
    # 
    # * `autoallow`
    # 
    # * `pending`
    # 
    # 
    # 
    # Only relevant if `adminGroupIds` has items.
    string newGroupMemberAcceptance = "autoallow";
    # Node permissions
    NodePermissions permissions;
};

# Upload channel information
public type CreateShareUploadChannelResponse record {
    # &#128679; Deprecated since v4.3.0
    # 
    # Upload token
    string token?;
    # Upload (channel) ID
    string uploadId;
    # (public) Upload URL
    string uploadUrl;
};

# List of notification configurations
public type NotificationConfigList record {
    # List of notification configurations
    NotificationConfig[] items;
};

# Request model for creating a Download Share
public type CreateDownloadShareRequest record {
    # &#128679; Deprecated since v4.20.0
    # 
    # Language tag for messages to creator
    string creatorLanguage?;
    # Expiration information
    ObjectExpiration expiration?;
    # File key information
    FileKey fileKey?;
    # &#128640; Since v4.11.0
    # 
    # Internal notes
    string internalNotes?;
    # Key pair container
    UserKeyPairContainer keyPair?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notification email content
    string mailBody?;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient email addresses
    string mailRecipients?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notification email subject
    string mailSubject?;
    # Max allowed downloads
    int maxDownloads?;
    # Alias name
    # 
    # (default: name of the shared node)
    string name?;
    # Source node ID
    int nodeId;
    # User notes
    string notes?;
    # &#128679; Deprecated since v4.20.0
    # 
    # Notify creator on every download.
    boolean notifyCreator = false;
    # Access password, not allowed for encrypted shares
    string password?;
    # Language tag for messages to receiver
    string receiverLanguage?;
    # &#128679; Deprecated since v4.11.0
    # 
    # Notify recipients via email
    # 
    # Please use `POST /shares/downloads/{share_id}/email` API instead.
    boolean sendMail = false;
    # &#128679; Deprecated since v4.11.0
    # 
    # Send share password via SMS
    # 
    # Please use `textMessageRecipients` attribute instead.
    boolean sendSms = false;
    # Show creator first and last name.
    boolean showCreatorName = false;
    # Show creator email address.
    boolean showCreatorUsername = false;
    # &#128679; Deprecated since v4.11.0
    # 
    # CSV string of recipient MSISDNs
    string smsRecipients?;
    # &#128640; Since v4.11.0
    # 
    # List of recipient FQTNs
    # 
    # E.123 / E.164 Format
    string[] textMessageRecipients?;
};

# Syslog settings
public type SyslogConfig record {
    # Is syslog enabled?
    boolean enabled?;
    # Syslog server (IP or FQDN)
    string host?;
    # Determines whether user’s IP address is logged.
    boolean logIpEnabled?;
    # Syslog server port
    int port?;
    # Protocol to connect to syslog server
    string protocol?;
};

# Request model for updating notification configuration
public type NotificationConfigChangeRequest record {
    # List of notification channel IDs.
    # 
    # Leave empty to disable notifications.
    int[] channelIds;
};

# Request model for updating a customer
public type UpdateCustomerRequest record {
    # Company name
    string companyName?;
    # Customer type
    string customerContractType;
    # Customer is locked:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean isLocked = false;
    # &#128679; Deprecated since v4.7.0
    # 
    # Customer lock status:
    # 
    # * `false` - unlocked
    # 
    # * `true` - locked
    # 
    # 
    # 
    # Please use `isLocked` instead.
    # 
    # All users of this customer will be blocked and can not login anymore.
    boolean lockStatus = false;
    # Provider customer ID
    string providerCustomerId?;
    # Maximal disc space which can be allocated by customer in bytes. -1 for unlimited
    int quotaMax?;
    # Maximal number of users
    int userMax?;
    # &#128640; Since v4.19.0
    # 
    # Maximal number of webhooks
    int webhooksMax?;
};

# Recover usernames for email
public type RecoverUserNameRequest record {
    # IETF language tag
    string creatorLanguage?;
    # Email 
    string email;
};
