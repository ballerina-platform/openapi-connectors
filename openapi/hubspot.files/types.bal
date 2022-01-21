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

public type StandardError record {
    string status;
    string id?;
    ErrorCategory category;
    record {} subCategory?;
    string message;
    ErrorDetail[] errors;
    record {} context;
    record {} links;
};

# Object for updating folders.
public type FolderUpdateInput record {
    # Id of the folder to change.
    string id;
    # New name. If specified the folder's name and fullPath will change. All children of the folder will be updated accordingly.
    string name?;
    # New parent folder ID. If changed, the folder and all it's children will be moved into the specified folder. parentFolderId and parentFolderPath cannot be specified at the same time.
    int parentFolderId?;
};

# Folder action response
public type FolderActionResponse record {
    # Current status of the task.
    string status;
    # Folder info
    Folder result?;
    # Number of errors resulting from the requested changes.
    int numErrors?;
    # Detailed errors resulting from the task.
    StandardError[] errors?;
    # Timestamp representing when the task was requested.
    string requestedAt?;
    # Timestamp representing when the task was started at.
    string startedAt;
    # When the requested changes have been completed.
    string completedAt;
    # Link to check the status of the task.
    record {} links?;
    # Id of the task.
    string taskId;
};

# Pagination info.
public type Paging record {
    # Next page info
    NextPage next?;
    # Previous page info
    PreviousPage prev?;
};

public type FilesFileidBody record {
    # File data that will replace existing file in the file manager.
    string file?;
    # Character set of given file data.
    string charsetHunch?;
    # JSON String representing FileReplaceOptions
    string options?;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

public type V3FilesBody record {
    # File to be uploaded.
    string file?;
    # Either 'folderId' or 'folderPath' is required. folderId is the ID of the folder the file will be uploaded to.
    string folderId?;
    # Either 'folderPath' or 'folderId' is required. This field represents the destination folder path for the uploaded file. If a path doesn't exist, the system will try to create one.
    string folderPath?;
    # Desired name for the uploaded file.
    string fileName?;
    # Character set of the uploaded file.
    string charsetHunch?;
    # JSON string representing FileUploadOptions.
    string options?;
};

# Folder info
public type Folder record {
    # Id of the folder.
    string id;
    # Timestamp of folder creation.
    string createdAt;
    # Timestamp of folder deletion.
    string archivedAt?;
    # Timestamp of the latest update to the folder.
    string updatedAt;
    # Marks weather the folder is deleted or not.
    boolean archived;
    # Id of the parent folder.
    string parentFolderId?;
    # Name of the folder.
    string name?;
    # Path of the folder in the file manager.
    string path?;
};

# Collection of files
public type CollectionResponseFile record {
    # Array of file info.
    File[] results;
    # Pagination info.
    Paging paging?;
};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

# File action response
public type FileActionResponse record {
    # Current status of the task.
    string status;
    # File
    File result?;
    # Number of errors resulting from the task.
    int numErrors?;
    # Descriptive error messages.
    StandardError[] errors?;
    # Timestamp of when the task was requested.
    string requestedAt?;
    # Timestamp of when the task was started.
    string startedAt;
    # Time of completion of task.
    string completedAt;
    # Link to check the status of the requested task.
    record {} links?;
    # If of the requested task.
    string taskId;
};

public type CollectionResponseFolder record {
    Folder[] results;
    # Pagination info.
    Paging paging?;
};

# Import data input
public type ImportFromUrlInput record {
    # PUBLIC_INDEXABLE: File is publicly accessible by anyone who has the URL. Search engines can index the file. PUBLIC_NOT_INDEXABLE: File is publicly accessible by anyone who has the URL. Search engines *can't* index the file. PRIVATE: File is NOT publicly accessible. Requires a signed URL to see content. Search engines *can't* index the file.
    string access;
    # Time to live. If specified the file will be deleted after the given time frame.
    string ttl?;
    # Name to give the resulting file in the file manager.
    string name?;
    # URL to download the new file from.
    string url;
    # One of folderId or folderPath is required. Destination folder ID for the uploaded file.
    string folderId?;
    # One of folderPath or folderId is required. Destination folder path for the uploaded file. If the folder path does not exist, there will be an attempt to create the folder path.
    string folderPath?;
    # NONE: Do not run any duplicate validation. REJECT: Reject the upload if a duplicate is found. RETURN_EXISTING: If a duplicate file is found, do not upload a new file and return the found duplicate instead.
    string duplicateValidationStrategy;
    # ENTIRE_PORTAL: Look for a duplicate file in the entire account. EXACT_FOLDER: Look for a duplicate file in the provided folder.
    string duplicateValidationScope;
    # If true, it will overwrite existing files if a file with the same name exists in the given folder.
    boolean overwrite;
};

# Object for updating files.
public type FileUpdateInput record {
    # New name for the file.
    string name?;
    # Folder ID where the file should be moved to.  folderId and folderPath cannot be set at the same time.
    string parentFolderId?;
    # Folder path where the file should be moved to. folderId and folderPath cannot be set at the same time.
    string parentFolderPath?;
    # Mark weather the file should be used in new content or not.
    boolean isUsableInContent?;
    # NONE: Do not run any duplicate validation. REJECT: Reject the upload if a duplicate is found. RETURN_EXISTING: If a duplicate file is found, do not upload a new file and return the found duplicate instead.
    string access?;
};

public type SignedUrl record {
    # Timestamp of when the URL will no longer grant access to the file.
    string expiresAt;
    # Signed URL with access to the specified file. Anyone with this URL will be able to access the file until it expires.
    string url;
    # Name of the requested file.
    string name;
    # Extension of the requested file.
    string extension;
    # Type of the file. Can be IMG, DOCUMENT, AUDIO, MOVIE, or OTHER.
    string 'type;
    # Size in bytes of the requested file.
    int size;
    # For image and video files. The height of the file.
    int height?;
    # For image and video files. The width of the file.
    int width?;
};

public type ErrorCategory record {
    string name;
    string httpStatus;
};

# Previous page info
public type PreviousPage record {
    # Before page
    string before;
    # Page link
    string link?;
};

# Object for creating a folder.
public type FolderInput record {
    # Desired name for the folder.
    string name;
    # Folder ID of the parent of the created folder. If not specified, the folder will be created at the root level. parentFolderId and parentFolderPath cannot be set at the same time.
    string parentFolderId?;
    # Path of the parent of the created folder. If not specified the folder will be created at the root level. parentFolderPath and parentFolderId cannot be set at the same time.
    string parentPath?;
};

# Information on the task that has been started, and where to check it's status.
public type ImportFromUrlTaskLocator record {
    # The ID of the task
    string id;
    # Links for where to check information related to the task. The `status` link gives the URL for where to check the status of the task.
    record {} links?;
};

# File
public type File record {
    # File ID.
    string id;
    # Creation time of the file object.
    string createdAt;
    # Deletion time of the file object.
    string archivedAt?;
    # Timestamp of the latest update to the file.
    string updatedAt;
    # If the file is deleted.
    boolean archived;
    # Id of the folder the file is in.
    string parentFolderId?;
    # Name of the file.
    string name?;
    # Path of the file in the file manager.
    string path?;
    # Size in bytes of the file.
    int size?;
    # For image and video files, the height of the content.
    int height?;
    # For image and video files, the width of the content.
    int width?;
    # Encoding of the file.
    string encoding?;
    # Type of the file. Can be IMG, DOCUMENT, AUDIO, MOVIE, or OTHER.
    string 'type?;
    # Extension of the file. For example png.
    string extension?;
    # Default hosting URL of the file. This will use one of HubSpot's provided URLs to serve the file.
    string defaultHostingUrl?;
    # URL of the given file. This URL can change depending on the domain settings of the account. Will use the select file hosting domain.
    string url?;
    # Previously "archied". Indicates if the file should be used when creating new content like web pages.
    boolean isUsableInContent?;
    # File access. Can be PUBLIC_INDEXABLE, PUBLIC_NOT_INDEXABLE, PRIVATE.
    string access;
};

# Next page info
public type NextPage record {
    # After info
    string after;
    # Page link
    string link?;
};

# Information on the task that has been started, and where to check it's status.
public type FolderUpdateTaskLocator record {
    # The ID of the task
    string id;
    # Links for where to check information related to the task. The `status` link gives the URL for where to check the status of the task.
    record {} links?;
};
