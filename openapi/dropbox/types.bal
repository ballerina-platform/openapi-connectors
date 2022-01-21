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

# Revision arguments.
public type ListRevisionsArg record {
    # The path to the file you want to see the revisions of.
    string path?;
    # The maximum number of revision entries returned. The default for this field is 10.
    int 'limit?;
    # Determines the behavior of the API in listing the revisions for a given file path or id. The default for this union is path.
    ListRevisionsMode mode?;
};

# Search arguments.
public type SearchArg record {
    # Options for more targeted search results.
    SearchOptions options?;
    # Options for search results match fields.
    SearchMatchFieldOptions match_field_options?;
    # The string to search for. May match across multiple fields based on the request arguments.
    string query;
};

# Indicates what type of match was found for a given item.
public type SearchMatchType record {
    # Type of search match.
    string '\.tag?;
};

# Restricts search to the given file status. The default for this union is active.
public type FileStatus string;

# Restricts search to only the file categories specified. Only supported for active file search.
public type FileCategory string;

# A subset of the property fields described by the corresponding `PropertyGroupTemplate`.
# 
# Properties are always added to a Dropbox file as a PropertyGroup. 
# The possible key names and value types in this group are defined by the corresponding `PropertyGroupTemplate`. 
# This datatype comes from an imported namespace originally defined in the file_properties namespace.
public type PropertyGroup record {
    # The actual properties associated with the template. There can be up to 32 property types per template.
    PropertyField[] fields?;
    # A unique identifier for the associated template.
    string template_id?;
};

# If set to a valid list of template IDs, FileMetadata.property_groups is set if there exists property data associated with the file and each of the listed templates. This field is optional.
public type TemplateFilterBase record {
    # Only templates with an ID in the supplied list will be returned (a subset of templates will be returned).
    string[] filter_some?;
};

public type AlphaResolvedVisibility record {
    # This is what the effective policy would be, if you selected this option. 
    # 
    # The resolved policy is obtained after considering external effects such as shared folder settings and team policy. 
    # This value is guaranteed to be provided.
    string '\.tag?;
};

# Metadata for a file.
public type FileMetadata record {
    # The last component of the path (including extension). 
    # 
    # This never contains a slash.
    string name?;
    # Additional information if the file has custom properties with the property template specified.
    PropertyGroup[] property_groups?;
    # A unique identifier for the current revision of a file. 
    # 
    # This field is the same rev as elsewhere in the API and can be used to detect changes and avoid conflicts.
    string rev?;
    # For files, this is the modification time set by the desktop client when the file was added to Dropbox. 
    # 
    # Since this time is not verified (the Dropbox server stores whatever the desktop client sends up), this
    # should only be used for display purposes (such as sorting) and not, for
    # example, to determine if a file has changed or not.
    string client_modified?;
    # Set if this file is a symlink. This field is optional.
    SymlinkInfo symlink_info?;
    # The cased path to be used for display purposes only. 
    # 
    # In rare instances the casing will not correctly match the user's filesystem, but this behavior will match 
    # the path provided in the Core API v1, and at least the last path component will have the correct casing. 
    # Changes to only the casing of paths won't be returned by :route:`list_folder/continue`.
    # This field will be null if the file or folder is not mounted.
    string path_display?;
    # This flag will only be present if include_has_explicit_shared_members  is true in :route:`list_folder` or :route:`get_metadata`. 
    # 
    # If this  flag is present, it will be true if this file has any explicit shared  members. This is different 
    # from sharing_info in that this could be true  in the case where a file has explicit members but is not 
    # contained within a shared folder.
    boolean has_explicit_shared_members?;
    # The lowercased full path in the user's Dropbox.
    # 
    # This always starts with a slash. This field will be null if the file or folder is not mounted.
    string path_lower?;
    # The last time the file was modified on Dropbox.
    string server_modified?;
    # Sharing info for a file which is contained by a shared folder.
    FileSharingInfo sharing_info?;
    # Additional information if the file is a photo or video. This field is optional. 
    # 
    # This field will not be set on entries returned by list_folder, list_folder/continue, or get_thumbnail_batch, 
    # starting December 2, 2019.
    MediaInfo media_info?;
    # A hash of the file content. This field can be used to verify data integrity. 
    # 
    # For more information see our :link:`Content hash /developers/reference/content-hash` page.
    string content_hash?;
    # A unique identifier for the file.
    string id?;
    # The file size in bytes.
    int size?;
    # If true, file can be downloaded directly; else the file must be exported.
    # 
    # The default for this field is `true`
    boolean is_downloadable?;
    # Export information for a file.
    ExportMetadata export_info?;
    # If present, the metadata associated with the file's current lock. This field is optional.
    FileLockMetadata file_lock_info?;
};

# Shared links with errors arguments.
public type CreateSharedLinkWithSettingsArg record {
    # The path to be shared by the shared link.
    string path?;
    # The requested settings for the newly created shared link. This field is optional.
    SharedLinkSettings settings?;
};

# The type of audience who can benefit from the access level specified by the `link_access_level` field. This field is optional.
public type LinkAudience record {
    # Type of LinkAudience
    string '\.tag?;
};

# GPS coordinates for a photo or video.
public type GpsCoordinates record {
    # Latitude of the GPS coordinates.
    int latitude?;
    # Longitude of the GPS coordinates.
    int longitude?;
};

# he list of HighlightSpan determines which parts of the file title should be highlighted.
public type HighlightSpan record {
    # String to be determined whether it should be highlighted or not.
    string highlight_str?;
    # The string should be highlighted or not
    boolean is_highlighted?;
};

public type VisibilityPolicyDisallowedReason record {
    # If allowed is false, this will provide the reason that the user is not permitted to set the visibility to this policy. 
    # This field is optional.
    string '\.tag?;
};

# Commit information.
public type CommitInfoWithProperties record {
    # If there's a conflict, as determined by mode, have the Dropbox server try to autorename the file to avoid conflict. 
    # The default for this field is False.
    boolean autorename?;
    # If true, this tells the clients that this modification shouldn't result in a user notification.
    # 
    # Normally, users are made aware of any file modifications in their Dropbox account via notifications in the client software. 
    # The default for this field is False. 
    boolean mute?;
    # The value to store as the client_modified timestamp. 
    # 
    # Dropbox automatically records the time at which the file was written to the Dropbox servers. 
    # It can also record an additional timestamp, provided by Dropbox desktop clients, mobile clients, and API 
    # apps of when the file was actually created or modified. This field is optional. 
    string client_modified?;
    # Selects what to do if the file already exists. The default for this union is add.
    WriteMode mode?;
    # Path in the user's Dropbox to save the file.
    string path?;
    # List of custom properties to add to file.
    PropertyGroup[] property_groups?;
    # Be more strict about how each WriteMode detects conflict. 
    # 
    # For example, always return a conflict error when mode = WriteMode.update and the given "rev" doesn't match the 
    # existing file's "rev", even if the existing file has been deleted. This also forces a conflict even when the 
    # target path refers to a file with identical contents. The default for this field is False. 
    boolean strict_conflict?;
};

# Additional information if the file is a photo or video. This field is optional. 
# 
# This field will not be set on entries returned by list_folder, list_folder/continue, or get_thumbnail_batch, 
# starting December 2, 2019.
public type MediaInfo record {
    # Type of MediaInfo
    string '\.tag?;
    # Vedio metadata.
    PhotoVedioMetadata metadata?;
};

# Themporary link arguments.
public type GetTemporaryLinkArg record {
    # The path to the file you want a temporary link to.
    string path?;
};

# Determines the behavior of the API in listing the revisions for a given file path or id. The default for this union is path.
public type ListRevisionsMode record {
    # Type of ListRevisionsMode
    string '\.tag?;
};

# The current visibility of the link after considering the shared links policies of the the team 
# (in case the link's owner is part of a team) and the shared folder (in case the linked file is part of a shared folder). This field is optional. 
# 
# This field is shown only if the caller has access to this info (the link's owner always has access to this data). 
# For some links, an effective_audience value is returned instead.
public type ResolvedVisibility record {
    # Type of ResolvedVisibility
    string '\.tag?;
};

# Delete arguments.
public type DeleteArg record {
    # Path in the user's Dropbox to delete.
    string path?;
    # Perform delete if given "rev" matches the existing file's latest "rev". This field is optional. 
    # 
    # This field does not support deleting a folder. 
    string parent_rev?;
};

# Sharing info for a file which is contained by a shared folder.
public type FileSharingInfo record {
    # True if the file or folder is inside a read-only shared folder.
    boolean read_only?;
    # ID of shared folder that holds this file.
    string parent_shared_folder_id?;
    # The last user who modified the file.
    # 
    # This field will be null if the user's account has been deleted.
    string modified_by?;
};

# Selects what to do if the file already exists. The default for this union is add.
public type WriteMode record {
    # Type of WriteMode
    string '\.tag?;
    # Overwrite if the given "rev" matches the existing file's "rev".
    # 
    # The autorename strategy is to append the string "conflicted copy" to the file name. 
    # For example, "document.txt" might become "document (conflicted copy).txt" or "document (Panda's conflicted copy).txt".
    string update?;
};

# Photo metadata.
public type PhotoMetadata record {
    # Dimensions for a photo or video.
    Dimensions dimensions?;
    # GPS coordinates for a photo or video.
    GpsCoordinates location?;
    # The timestamp when the photo/video is taken.
    string time_taken?;
};

# If present, the metadata associated with the file's current lock. This field is optional.
public type FileLockMetadata record {
    # True if caller holds the file lock. This field is optional.
    boolean is_lockholder?;
    # The display name of the lock holder. This field is optional.
    string lockholder_name?;
    # The account ID of the lock holder if known. This field is optional.
    string lockholder_account_id?;
    # The timestamp of the lock was created. This field is optional.
    string created?;
};

# The metadata for the matched file or folder.
public type MetadataV2 record {
    # Metadata for a file.
    FileMetadata metadata?;
};

# Folder link metadata.
public type FolderLinkMetadata record {
    # The linked file name (including extension). This never contains a slash.
    string name?;
    # URL of the shared link.
    string url?;
    # Expiration time, if set. By default the link won't expire. This field is optional.
    string expires?;
    # The lowercased full path in the user's Dropbox. This always starts with a slash. This field is optional. 
    # 
    # This field will only be present only if the linked file is in the authenticated user's dropbox. 
    string path_lower?;
    # Information about a team.
    Team content_owner_team_info?;
    # The link's access permissions.
    LinkPermissions link_permissions?;
    # Information about a team member.
    TeamMemberInfo team_member_info?;
    # A unique identifier for the linked file.
    string id?;
};

# Options for more targeted search results.
public type SearchOptions record {
    # Scopes the search to a path in the user's Dropbox. Searches the entire Dropbox if not specified. This field is optional.
    string path?;
    # The string to search for. May match across multiple fields based on the request arguments.
    int max_results?;
    # Specified property of the order of search results. By default, results are sorted by relevance.
    SearchOrderBy order_by?;
    # Restricts search to the given file status. The default for this union is active.
    FileStatus file_status?;
    # Restricts search to only match on filenames. The default for this field is False.
    boolean filename_only?;
    # Restricts search to only the extensions specified. Only supported for active file search. This field is optional.
    string[] file_extensions?;
    # Restricts search to only the file categories specified. Only supported for active file search. This field is optional.
    FileCategory[] file_categories?;
};

# The link's access permissions.
public type LinkPermissions record {
    # The shared link's requested visibility. This field is optional.
    # 
    # This can be overridden by the team and shared folder policies. The final visibility, after considering these 
    # policies, can be found in resolved_visibility. This is shown only if the caller is the link's owner and 
    # resolved_visibility is returned instead of effective_audience. 
    RequestedVisibility requested_visibility?;
    # The current visibility of the link after considering the shared links policies of the the team 
    # (in case the link's owner is part of a team) and the shared folder (in case the linked file is part of a shared folder). This field is optional. 
    # 
    # This field is shown only if the caller has access to this info (the link's owner always has access to this data). 
    # For some links, an effective_audience value is returned instead.
    ResolvedVisibility resolved_visibility?;
    # Whether the caller can revoke the shared link.
    boolean can_revoke?;
    # The failure reason for revoking the link. This field will only be present if the can_revoke is false. This field is optional.
    SharedLinkAccessFailureReason revoke_failure_reason?;
    # A list of policies that the user might be able to set for the visibility.
    VisibilityPolicy[] visibility_policies?;
    # Whether the user can set the expiry settings of the link. This refers to the ability to create a new expiry and modify an existing expiry.
    boolean can_set_expiry?;
    # Whether the user can remove the expiry of the link.
    boolean can_remove_expiry?;
    # Whether the link can be downloaded or not.
    boolean allow_download?;
    # Whether the user can allow downloads via the link. This refers to the ability to remove a no-download restriction on the link.
    boolean can_allow_download?;
    # Whether the user can disallow downloads via the link. This refers to the ability to impose a no-download restriction on the link.
    boolean can_disallow_download?;
    # The type of audience who can benefit from the access level specified by the `link_access_level` field. This field is optional.
    LinkAudience effective_audience?;
    # The access level that the link will grant to its users. This field is optional.
    # 
    # A link can grant additional rights to a user beyond their current access level. For example, if a user was 
    # invited as a viewer to a file, and then opens a link with `link_access_level` set to `editor`, then they will 
    # gain editor privileges. The `link_access_level` is a property of the link, and does not depend on who is calling 
    # this API. In particular, `link_access_level` does not take into account the API caller's current permissions to the content. 
    LinkAccessLevel link_access_level?;
    # A list of link audience options the user might be able to set as the new audience. This field is optional.
    LinkAudienceOption[] audience_options?;
    # Whether the user can set a password for the link. This field is optional.
    boolean can_set_password?;
    # Whether the user can remove the password of the link. This field is optional.
    boolean can_remove_password?;
    # Whether the user is required to provide a password to view the link. This field is optional.
    boolean require_password?;
    # Whether the user can use extended sharing controls, based on their account type. This field is optional.
    boolean can_use_extended_sharing_controls?;
};

# Download arguments.
public type DownloadArg record {
    # The path of the file to download.
    string path?;
};

# Delete result.
public type DeleteResult record {
    # Indicates that there used to be a file or folder at this path, but it no longer exists.
    DeletedMetadata metadata?;
};

# Metadata arguments.
public type GetMetadataArg record {
    # If set to a valid list of template IDs, FileMetadata.property_groups is set if there exists property data associated with the file and each of the listed templates. This field is optional.
    TemplateFilterBase include_property_groups?;
    # If true, the results will include a flag for each file indicating whether or not that file has any explicit members. The default for this field is False.
    boolean include_has_explicit_shared_members?;
    # If true, DeletedMetadata will be returned for deleted file or folder, otherwise LookupError.not_found will be returned. The default for this field is False.
    boolean include_deleted?;
    # If true, FileMetadata.media_info is set for photo and video. The default for this field is False.
    boolean include_media_info?;
    # The path of a file or folder on Dropbox.
    string path?;
};

# Information about a team member.
public type TeamMemberInfo record {
    # ID of user as a member of a team. This field will only be present.
    # 
    # if the member is in the same team as current user.
    string member_id?;
    # The display name of the user.
    string display_name?;
    # Information about a team.
    Team team_info?;
};

# Set if this file is a symlink. This field is optional.
public type SymlinkInfo record {
    # The target this symlink points to.
    string target?;
};

# The failure reason for revoking the link. This field will only be present if the can_revoke is false. This field is optional.
public type SharedLinkAccessFailureReason record {
    # Type of SharedLinkAccessFailureReason
    string '\.tag?;
};

# Indicates that there used to be a file or folder at this path, but it no longer exists.
public type DeletedMetadata record {
    # The last component of the path (including extension). This never contains a slash.
    string name?;
    # The lowercased full path in the user's Dropbox.
    # 
    # This always starts with a slash. 
    # This field will be null if the file or folder is not mounted. This field is optional. 
    string path_lower?;
    # The cased path to be used for display purposes only. This field is optional. 
    # 
    # In rare instances the casing will not correctly match the user's filesystem, but this behavior will match 
    # the path provided in the Core API v1, and at least the last path component will have the correct casing. 
    # Changes to only the casing of paths won't be returned by list_folder/continue. This field will be null if 
    # the file or folder is not mounted. 
    string path_display?;
    # A unique identifier for the file or folder.
    string id?;
};

# The shared link's requested visibility. This field is optional.
# 
# This can be overridden by the team and shared folder policies. The final visibility, after considering these 
# policies, can be found in resolved_visibility. This is shown only if the caller is the link's owner and 
# resolved_visibility is returned instead of effective_audience. 
public type RequestedVisibility record {
    # Type of RequestedVisibility
    string '\.tag?;
};

# Metadata of the created folder.
public type CreateFolderResult record {
    # Metadata for a folder.
    FolderMetadata metadata?;
};

# List revision result.
public type ListRevisionsResult record {
    # If the file identified by the latest revision in the response is either deleted or moved.
    boolean is_deleted?;
    # The time of deletion if the file was deleted. This field is optional.
    string server_deleted?;
    # The revisions for the file. Only revisions that are not deleted will show up here.
    FileMetadata[] entries?;
};

# Relocation arguments.
public type RelocationArg record {
    # Path in the user's Dropbox to be copied or moved.
    string from_path?;
    # Path in the user's Dropbox that is the destination.
    string to_path?;
    # Allow moves by owner even if it would result in an ownership transfer for the content being moved. 
    # This does not apply to copies.
    boolean allow_ownership_transfer?;
    # If there's a conflict, have the Dropbox server try to autorename the file to avoid the conflict.
    boolean autorename?;
};

# Restore arguments.
public type RestoreArg record {
    # The path to the file you want to restore.
    string path?;
    # The revision to restore for the file.
    string rev?;
};

# File link metadata.
public type FileLinkMetadata record {
    *FolderLinkMetadata;
    # The modification time set by the desktop client when the file was added to Dropbox. 
    # 
    # Since this time is not verified (the Dropbox server stores whatever the desktop client sends up), 
    # this should only be used for display purposes (such as sorting) and not, for example, to determine if a 
    # file has changed or not. 
    string client_modified?;
    # The last time the file was modified on Dropbox.
    string server_modified?;
    # A unique identifier for the current revision of a file. This field is the same rev as elsewhere in the API and can be used to detect changes and avoid conflicts.
    string rev?;
    # The file size in bytes.
    int size?;
};

# Information about a team.
public type Team record {
    # The team's unique ID.
    string id?;
    # The name of the team.
    string name?;
};

# The metadata of a shared link.
public type SharedLinkMetadata FileLinkMetadata|FolderLinkMetadata;

# Arguments to create a folder.
public type CreateFolderArg record {
    # Path in the user's Dropbox to create.
    string path?;
    # If there's a conflict, have the Dropbox server try to autorename the folder to avoid the conflict.
    boolean autorename?;
};

# The matches for the search query.
public type SearchMatch record {
    # Indicates what type of match was found for a given item.
    SearchMatchType match_type?;
    # The metadata for the matched file or folder.
    MetadataV2 metadata?;
    # The list of HighlightSpan determines which parts of the file title should be highlighted. This field is optional.
    HighlightSpan[] highlight_spans?;
};

public type VisibilityPolicy record {
    # The shared link's requested visibility. This field is optional.
    # 
    # This can be overridden by the team and shared folder policies. The final visibility, after considering these 
    # policies, can be found in resolved_visibility. This is shown only if the caller is the link's owner and 
    # resolved_visibility is returned instead of effective_audience. 
    RequestedVisibility policy?;
    AlphaResolvedVisibility resolved_policy?;
    # Whether the user is permitted to set the visibility to this policy.
    boolean allowed?;
    VisibilityPolicyDisallowedReason disallowed_reason?;
};

# Metadata of the relocated object.
public type RelocationResult record {
    # Metadata for a file.
    FileMetadata metadata?;
};

# Sharing info for a folder which is contained in a shared folder or is a shared folder mount point.
public type FolderSharingInfo record {
    # True if the file or folder is inside a read-only shared folder.
    boolean read_only?;
    # Set if the folder is contained by a shared folder.
    string parent_shared_folder_id?;
    # Specifies that the folder can only be traversed.
    # 
    # The user can only see a limited subset of the contents of this folder because they don't have read access to 
    # this folder. They do, however, have access to some sub folder.
    boolean traverse_only?;
    # If this folder is a shared folder mount point, the ID of the shared folder mounted at this location.
    string shared_folder_id?;
    # Specifies that the folder cannot be accessed by the user.
    boolean no_access?;
};

# Dimensions for a photo or video.
public type Dimensions record {
    # Width of the photo/video.
    int width?;
    # Height of the photo/video.
    int height?;
};

# Metadata for a folder.
public type FolderMetadata record {
    # The last component of the path (including extension). 
    # 
    # This never contains a slash.
    string name?;
    # The cased path to be used for display purposes only. 
    # 
    # In rare instances the casing will not correctly match the user's filesystem, but this behavior will match 
    # the path provided in the Core API v1, and at least the last path component will have the correct casing. 
    # Changes to only the casing of paths won't be returned by :route:`list_folder/continue`.
    # This field will be null if the file or folder is not mounted.
    string path_display?;
    # The lowercased full path in the user's Dropbox. 
    # 
    # This always starts with a slash. 
    # This field will be null if the file or folder is not mounted.
    string path_lower?;
    # Sharing info for a folder which is contained in a shared folder or is a shared folder mount point.
    FolderSharingInfo sharing_info?;
    # Additional information if the file has custom properties with the property template specified.
    # 
    # **Note:** Only properties associated with user-owned templates, not team-owned templates, can be attached 
    # to folders.
    PropertyGroup[] property_groups?;
    # A unique identifier for the folder.
    string id?;
};

# Search result.
public type SearchResult record {
    # A list (possibly empty) of matches for the query.
    SearchMatch[] matches?;
    # Pass the cursor into `search/continue:2` to fetch the next page of results. This field is optional.
    int cursor?;
    # Used for paging. If true, indicates there is another page of results available that can be fetched by calling `search/continue:2` with the cursor.
    boolean has_more?;
};

# The requested settings for the newly created shared link. This field is optional.
public type SharedLinkSettings record {
    # Boolean flag to enable or disable password protection. This field is optional.
    boolean require_password?;
    # If require_password is true, this is needed to specify the password to access the link. This field is optional.
    string link_password?;
    # Expiration time of the shared link. By default the link won't expire.
    string expires?;
    # The new audience who can benefit from the access level specified by the link's access level specified in the 
    # `link_access_level` field of `LinkPermissions`. This field is optional. 
    # 
    # This is used in conjunction with team policies and shared folder policies to determine the final effective 
    # audience type in the `effective_audience` field of `LinkPermissions`.
    string audience?;
    # Requested access level you want the audience to gain from this link.
    # 
    # **Note** modifying access level for an existing link is not supported. This field is optional.
    string access?;
    # Boolean flag to allow or not download capabilities for shared links. This field is optional.
    boolean allow_download?;
};

# Vedio metadata.
public type PhotoVedioMetadata record {
    # Dimensions for a photo or video.
    Dimensions dimensions?;
    # GPS coordinates for a photo or video.
    GpsCoordinates location?;
    # The timestamp when the photo/video is taken.
    string time_taken?;
    # The duration of the video in milliseconds. This field is optional.
    int duration?;
};

# If allowed is false, this will provide the reason that the user is not permitted to set the visibility to this policy. This field is optional.
public type LinkAudienceDisallowedReason record {
    # Type of LinkAudience
    string '\.tag?;
};

# Link audience options the user might be able to set as the new audience.
public type LinkAudienceOption record {
    # The type of audience who can benefit from the access level specified by the `link_access_level` field. This field is optional.
    LinkAudience audience?;
    # Whether the user calling this API can select this audience option
    boolean allowed?;
    # If allowed is false, this will provide the reason that the user is not permitted to set the visibility to this policy. This field is optional.
    LinkAudienceDisallowedReason disallowed_reason?;
};

# The access level that the link will grant to its users. This field is optional.
# 
# A link can grant additional rights to a user beyond their current access level. For example, if a user was 
# invited as a viewer to a file, and then opens a link with `link_access_level` set to `editor`, then they will 
# gain editor privileges. The `link_access_level` is a property of the link, and does not depend on who is calling 
# this API. In particular, `link_access_level` does not take into account the API caller's current permissions to the content. 
public type LinkAccessLevel record {
    # Type of LinkAudience
    string '\.tag?;
};

# Export information for a file.
public type ExportMetadata record {
    # Format to which the file can be exported to. This field is optional
    string export_as?;
    # Additional formats to which the file can be exported. This field is optional. 
    # 
    # These values can be specified as the export_format in /files/export. 
    string[] export_options?;
};

# Raw key/value data to be associated with a Dropbox file.
# 
# Property fields are added to Dropbox files as a PropertyGroup. 
# This datatype comes from an imported namespace originally defined in the file_properties namespace.
public type PropertyField record {
    # Key of the property field associated with a file and template.
    # 
    # Keys can be up to 256 bytes.
    string name?;
    # Value of the property field associated with a file and template.
    # 
    # Values can be up to 1024 bytes.
    string value?;
};

# Specified property of the order of search results. By default, results are sorted by relevance.
public type SearchOrderBy string;

# Options for search results match fields.
public type SearchMatchFieldOptions record {
    # Whether to include highlight span from file title. The default for this field is False.
    boolean include_highlights?;
};

# Temporary link result.
public type GetTemporaryLinkResult record {
    # The temporary link which can be used to stream content the file.
    string link?;
    # Metadata for a file.
    FileMetadata metadata?;
};
