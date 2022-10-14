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

public type FileArr File[];

public type FileslistArr Fileslist[];

public type BulkDeleteRequest record {
    BulkDeleteAssetsArray assets?;
};

public type DeleteJobsResponse record {
    BulkDeleteResponseArray deleteJobs?;
};

public type BulkDeleteResponse record {
    # unique Identifier for the delete job
    string id;
    # time when the delete job submitted
    string timestamp;
    # overall status of delete job
    string status;
};

public type Notmodified record {
    string id?;
    string message?;
};

public type ErrorBody record {
    string code?;
    string logref?;
    string message?;
};

public type Rangenotsatisfiable record {
    string id?;
    string message?;
};

public type Fileslist record {
    string objectKey?;
    int partNo?;
    string created?;
};

public type Error record {
    string id?;
    string message?;
};

@constraint:Array {maxLength: 1, minLength: 1}
public type BulkDeleteAssetsArray BulkDeleteAsset[];

public type BulkDeleteAsset record {
    # Unique identifier for asset instance
    @constraint:String {maxLength: 32, minLength: 32}
    string id;
    # files created after this time are considered for deletion, If not provided, all the files created before submittion of job get deleted.
    # UTC aligned date-time with ISO date format is supported.
    # "2020-03-01Z"
    # "2020-03-01T09Z"
    # "2020-03-01T09:12Z"
    # "2020-03-01T09:12:28Z"
    # "2020-03-01T09:12:28.110Z"
    string timeFrom?;
    # files created before this time are considered for deletion, If not provided, all the files created before submittion of job get deleted. UTC aligned date-time with ISO date format is supported.
    # UTC aligned date-time with ISO date format is supported.
    # "2020-06-01Z"
    # "2020-06-01T09Z"
    # "2020-06-01T09:12Z"
    # "2020-06-01T09:12:28Z"
    # "2020-06-01T09:12:28.110Z"
    string timeTo?;
};

public type Badrequest record {
    string id?;
    string message?;
};

public type BulkDeleteResponseArray BulkDeleteResponse[];

public type BulkDeleteJobResponse record {
    # unique Identifier for delete job
    string id;
    # time when the delete job submitted
    string timestamp;
    # overall status of the job
    string status;
    @constraint:Array {maxLength: 1, minLength: 1}
    AssetStatus[] assets;
};

public type AssetStatus record {
    # asset id
    string id;
    # path from which the files are getting deleted. Default value is '/' considered as root path.
    string path;
    # files created after this time are considered for deletion
    string timeFrom?;
    # files created before this time are considered for deletion
    string timeTo?;
    # status of file deletion for this asset id
    string status;
    # total number of files to be deleted
    int filesToBeDeleted;
    # total files delete
    int filesDeleted;
    # total files remaining for deletion due to either the job is still in progress or job failed due to some error
    int filesRemaining;
    # error due to which file deletion failed for this asset id. if files deletion is successful then this field will be null.
    string 'error?;
};

public type Conflict record {
    string id?;
    string message?;
};

public type Unauthorized record {
    string id?;
    string message?;
};

public type IotFileError record {
    ErrorBody[] errors?;
};

public type Notfound record {
    string id?;
    string message?;
};

public type File record {
    string name?;
    string path?;
    string 'type?;
    int size?;
    string timestamp?;
    string created?;
    string updated?;
    string createdBy?;
    string updatedBy?;
    string description?;
    int etag?;
};
