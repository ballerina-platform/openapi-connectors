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

public type AssociationArr Association[];

public type FolderArr Folder[];

# The Object Type
public type ObjectType string;

public type User record {
    # Xero identifier
    string Id;
    # Key is Name, but returns Email address of user who created the file
    string Name?;
    # First name of user
    string FirstName?;
    # Last name of user
    string LastName?;
    # Last name of user
    string FullName?;
};

public type Association record {
    # The unique identifier of the file
    string FileId?;
    # The identifier of the object that the file is being associated with (e.g. InvoiceID, BankTransactionID, ContactID)
    string ObjectId?;
    # The Object Group that the object is in. These roughly correlate to the endpoints that can be used to retrieve the object via the core accounting API.
    ObjectGroup ObjectGroup?;
    # The Object Type
    ObjectType ObjectType?;
};

# The Object Group that the object is in. These roughly correlate to the endpoints that can be used to retrieve the object via the core accounting API.
public type ObjectGroup string;

public type UploadObject record {
    string body;
    # exact name of the file you are uploading
    string name;
    string filename;
    string mimeType?;
};

public type Folders record {
    Folder[] Folders?;
};

public type FileObject record {
    # File Name
    string Name?;
    # MimeType of the file (image/png, image/jpeg, application/pdf, etc..)
    string MimeType?;
    # Numeric value in bytes
    int Size?;
    # Created date in UTC
    string CreatedDateUtc?;
    # Updated date in UTC
    string UpdatedDateUtc?;
    User User?;
    # File object's UUID
    string Id?;
    # Folder relation object's UUID
    string FolderId?;
};

public type Files record {
    int TotalCount?;
    int Page?;
    int PerPage?;
    FileObject[] Items?;
};

public type Folder record {
    # The name of the folder
    string Name?;
    # The number of files in the folder
    int FileCount?;
    # The email address used to email files to the inbox. Only the inbox will have this element.
    string Email?;
    # to indicate if the folder is the Inbox. The Inbox cannot be renamed or deleted.
    boolean IsInbox?;
    # Xero unique identifier for a folder  Files
    string Id?;
};
