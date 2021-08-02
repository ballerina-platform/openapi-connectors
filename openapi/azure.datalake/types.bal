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

# The information about files and folders.
public type Path record {
    # The path of the file or folder
    string name?;
    # Determines if the resource is a folder or a file
    boolean isDirectory?;
    # The timestamp when the file was modified for the last time
    string lastModified?;
    # Unique identifier of the file or folder
    string eTag?;
    # Determines the size of the file in bytes
    int contentLength?;
    # The name of the owner
    string owner?;
    # The name of a group
    string 'group?;
    # Permissions set to the file/folder
    string permissions?;
};

# The service error response object.
public type DataLakeStorageError record {
    # The service error response object.
    DatalakestorageerrorError _error?;
};

public type FilesystemList record {
    Filesystem[] filesystems?;
};

public type PathList record {
    Path[] paths?;
};

# Information about file system
public type Filesystem record {
    # The path of the file system
    string name?;
    # The timestamp when the file system was modified for the last time
    string lastModified?;
    # Unique identifier of the file system
    string eTag?;
};

# The service error response object.
public type DatalakestorageerrorError record {
    # The service error code
    string code?;
    # The service error message
    string message?;
};
