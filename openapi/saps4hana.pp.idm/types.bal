// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type ReadMultipleUsersArr ReadMultipleUsers[];

public type Error404 record {
    Error404Error _error;
};

public type ReadSingleUser record {
    string[] schemas?;
    UserMeta meta?;
    string id?;
    string userName?;
    string displayName?;
    boolean active?;
    Emails[] emails?;
};

public type Error405 record {
    Error405Error _error;
};

public type Error406 record {
    Error406Error _error;
};

public type User record {
    string id;
    string userName?;
    string displayName;
    boolean active;
    Emails[] emails?;
};

public type Error404Error record {
    int status;
    string message;
};

public type UserMeta record {
    string resourceType?;
    string created?;
    string lastModified?;
    string location?;
};

public type Error409 record {
    Error409Error _error;
};

public type Success204 record {
    Success204Body body;
};

public type Error401Error record {
    int status;
    string message;
};

public type Error405Error record {
    int status;
    string message;
};

public type ErrorError record {
    int status;
    string message;
};

public type ReadMultipleUsers record {
    string[] schemas?;
    decimal totalResults?;
    decimal itemsPerPage?;
    decimal startIndex?;
    ReadSingleUser[] Resources?;
};

public type Error record {
    ErrorError _error;
};

public type Error409Error record {
    int status;
    string message;
};

public type Error406Error record {
    int status;
    string message;
};

public type Error400Error record {
    int status;
    string message;
};

public type Emails record {
    string value;
    string 'type?;
    boolean primary?;
};

public type Error400 record {
    Error400Error _error;
};

public type Success204Body record {
    int status;
    string message;
};

public type Error401 record {
    Error401Error _error;
};

public type Error403 record {
    Error403Error _error;
};

public type Error403Error record {
    int status;
    string message;
};
