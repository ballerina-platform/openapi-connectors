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

public type ThirdPartyDependenciesDataArr ThirdPartyDependenciesData[];

# Node information (Node can be a room, folder or file)
public type Node record {
    # &#128640; Since v4.15.0
    int authParentId?;
    # Version of last change in this node or a node further down the tree.
    int branchVersion?;
    # &#128679; Deprecated since v4.10.0
    Node[] children?;
    # Classification ID:
    int classification?;
    # &#128679; Deprecated since v4.2.0
    int cntAdmins?;
    # &#128679; Deprecated since v4.11.0
    int cntChildren?;
    # Returns the number of comments of this node.
    int cntComments?;
    # Number of deleted versions of this file / folder
    int cntDeletedVersions?;
    # Returns the number of Download Shares of this node.
    int cntDownloadShares?;
    # &#128640; Since v4.11.0
    int cntFiles?;
    # &#128640; Since v4.11.0
    int cntFolders?;
    # &#128640; Since v4.11.0
    int cntRooms?;
    # Returns the number of Upload Shares of this node.
    int cntUploadShares?;
    # &#128679; Deprecated since v4.2.0
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
    boolean hasActivitiesLog?;
    # &#128679; Deprecated since v4.10.0
    boolean hasRecycleBin?;
    # MD5 hash of file
    string hash?;
    # Node ID
    int id;
    # Inherit permissions from parent room
    boolean inheritPermissions?;
    # &#128640; Since v4.11.0
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
    string parentPath?;
    # Node permissions
    NodePermissions permissions?;
    # Quota in byte
    int quota?;
    # Retention period for deleted nodes in days
    int recycleBinRetentionPeriod?;
    # Node size in byte
    int size?;
    # &#128640; Since v4.22.0
    string timestampCreation?;
    # &#128640; Since v4.22.0
    string timestampModification?;
    # Node type
    string 'type;
    # Modification date
    string updatedAt?;
    # User information
    UserInfo updatedBy?;
};

# Room information
public type RoomData record {
    # &#128679; Deprecated since v4.10.0
    RoomData[] children?;
    # &#128679; Deprecated since v4.2.0
    int cntAdmins?;
    # Returns the number of Download Shares of this node.
    int cntDownloadShares?;
    # Returns the number of Upload Shares of this node.
    int cntUploadShares?;
    # &#128679; Deprecated since v4.2.0
    int cntUsers?;
    # Expiration date
    string createdAt?;
    # User information
    UserInfo createdBy?;
    # &#128679; Deprecated since v4.10.0
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

# Request model for creating an upload channel
public type CreateShareUploadChannelRequest record {
    # &#128640; Since v4.15.0
    boolean directS3Upload?;
    # File name
    string name;
    # Password
    string password?;
    # File size in byte
    int size?;
    # &#128640; Since v4.22.0
    string timestampCreation?;
    # &#128640; Since v4.22.0
    string timestampModification?;
};

# List of generated presigned URLs
public type PresignedUrlList record {
    # List of S3 presigned URLs
    PresignedUrl[] urls;
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

# Authentication method
public type AuthMethod record {
    # Is enabled
    boolean isEnabled;
    # Authentication methods:
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

# S3 file upload part information
public type S3FileUploadPart record {
    # Corresponding part ETag
    string partEtag;
    # Corresponding part number
    int partNumber;
};

# System information (default language and authentication methods)
public type SystemInfo record {
    # &#128679; Deprecated since v4.13.0
    AuthMethod[] authMethods;
    # &#128640; Since v4.13.0
    boolean hideLoginInputFields;
    # System default language
    string languageDefault;
    # &#128640; Since v4.15.0
    boolean s3EnforceDirectUpload;
    # &#128640; Since v4.14.0
    string[] s3Hosts;
    # &#128640; Since v4.21.0
    boolean useS3Storage;
};

# Request model for generating download URL
public type PublicDownloadTokenGenerateRequest record {
    # Password (only for password-protected shares)
    string password?;
};

# List of Active Directories
public type ActiveDirectoryAuthInfo record {
    # List of available Active Directories
    ActiveDirectory[] items;
};

# User file key
public type UserFileKey record {
    # File key information
    FileKey fileKey;
    # Unique identifier for the user
    int userId;
};

# User information
public type UserInfo record {
    # &#128640; Since v4.11.0
    string avatarUuid;
    # &#128679; Deprecated since v4.11.0
    string displayName?;
    # &#128640; Since v4.11.0
    string email?;
    # &#128640; Since v4.11.0
    string firstName;
    # Unique identifier for the user
    int id;
    # &#128640; Since v4.11.0
    string lastName;
    # &#128679; Deprecated since v4.18.0
    string title?;
    # &#128640; Since v4.13.0
    string userName;
    # &#128640; Since v4.11.0
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

# List of user file keys
public type UserFileKeyList record {
    # List of user file keys
    UserFileKey[] items?;
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

# DRACOON server time
public type SdsServerTime record {
    # DRACOON server time
    string time?;
};

# OpenID Connect provider information
public type OpenIdProvider record {
    # ID
    int id;
    # Is available for all customers
    boolean isGlobalAvailable;
    # Issuer identifier of the IDP
    string issuer;
    # Name of the claim which is used for the user mapping.
    string mappingClaim;
    # Name of the IDP
    string name;
    # URL of the user management UI.
    string userManagementUrl?;
};

# Download URL
public type PublicDownloadTokenGenerateResponse record {
    # Download URL
    string downloadUrl?;
    # &#128679; Deprecated since v4.3.0
    string token;
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
    string status;
};

# Chunk upload response
public type ChunkUploadResponse record {
    # Hash value of transferred chunk
    string hash;
    # Chunk size
    int size;
};

# Request model for completing a S3 file upload
public type CompleteS3ShareUploadRequest record {
    # List of S3 file upload parts
    S3FileUploadPart[] parts;
    # List of user file keys
    UserFileKey[] userFileKeyList?;
};

# Public key container
public type PublicKeyContainer record {
    # &#128640; Since v4.24.0
    string createdAt?;
    # &#128640; Since v4.24.0
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
    boolean hasDownloadLimit;
    # Encryption state
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected;
    # Downloads limit reached
    boolean limitReached;
    # &#128640; Since v4.11.0
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

# File key information
public type FileKey record {
    # Initial vector
    string iv;
    # Encryption key
    string 'key;
    # Authentication tag
    string tag;
    # Version
    string 'version;
};

# List of user public keys
public type UserUserPublicKeyList record {
    # List of user public keys
    UserUserPublicKey[] items;
};

# Software version information
public type SoftwareVersionData record {
    # Build date
    string buildDate;
    # &#128640; Since v4.24.0
    boolean isDracoonCloud?;
    # REST API version
    string restApiVersion;
    # Revision number
    string scmRevisionNumber;
    # DRACOON server version
    string sdsServerVersion;
};

public type Body1 record {
    string file?;
};

# Private key container
public type PrivateKeyContainer record {
    # &#128640; Since v4.24.0
    string createdAt?;
    # &#128640; Since v4.24.0
    int createdBy?;
    # Expiration date
    string expireAt?;
    # Private key
    string privateKey;
    # Version
    string 'version;
};

# Request model for generating presigned URLs
public type GeneratePresignedUrlsRequest record {
    # First part number of a range of requested presigned URLs (for S3 it is: `1`)
    int firstPartNumber;
    # Last part number of a range of requested presigned URLs
    int lastPartNumber;
    # `Content-Length` header size for each presigned URL (in bytes)
    int size;
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

# Public key information
public type UserUserPublicKey record {
    # Unique identifier for the user
    int id?;
    # Public key container
    PublicKeyContainer publicKeyContainer?;
};

# Upload Share information
public type PublicUploadShare record {
    # Creation date
    string createdAt;
    # &#128640; Since v4.11.0
    string creatorName;
    # &#128640; Since v4.11.0
    string creatorUsername?;
    # Expiration date
    string expireAt?;
    # Encryption state
    boolean isEncrypted?;
    # Is share protected by password
    boolean isProtected;
    # &#128679; Deprecated since v4.2.0
    float maxSize?;
    # &#128679; Deprecated since v4.2.0
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

# Upload channel information
public type CreateShareUploadChannelResponse record {
    # &#128679; Deprecated since v4.3.0
    string token?;
    # Upload (channel) ID
    string uploadId;
    # (public) Upload URL
    string uploadUrl;
};
