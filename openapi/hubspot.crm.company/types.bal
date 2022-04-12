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

public type FilterGroup record {
    Filter[] filters;
};

public type SimplePublicObjectWithForwardPaging record {
    int total;
    SimplePublicObject[] results;
    ForwardPaging paging?;
};

public type AssociatedIdArrayWithForwardPaging record {
    AssociatedId[] results;
    ForwardPaging paging?;
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

public type SimplePublicObjectArray record {
    SimplePublicObjectBatchInput[] inputs;
};

public type ForwardPaging record {
    NextPage next?;
};

public type SimplePublicObjectId record {
    string id;
};

public type SimplePublicObjectBatch record {
    string status;
    SimplePublicObject[] results;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
};

public type SimplePublicObjectIdArray record {
    SimplePublicObjectId[] inputs;
};

public type AssociatedIdArray record {
    AssociatedId[] results;
    Paging paging?;
};

public type SimplePublicObject record {
    string id;
    record {} properties;
    string createdAt;
    string updatedAt;
    boolean archived?;
    string archivedAt?;
};

public type SimplePublicObjectWithAssociationsArray record {
    SimplePublicObjectWithAssociations[] results;
    ForwardPaging paging?;
};

public type Paging record {
    NextPage next?;
    PreviousPage prev?;
};

public type PublicObjectSearchRequest record {
    FilterGroup[] filterGroups;
    string[] sorts;
    string query?;
    string[] properties;
    int 'limit;
    int after;
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

public type SimplePublicObjectInputArray record {
    SimplePublicObjectInput[] inputs;
};

# Company properties
public type SimplePublicObjectInput record {
    # Company properties object
    record {} properties;
};

public type SimplePublicObjectBatchWithErrors record {
    string status;
    SimplePublicObject[] results;
    int numErrors?;
    StandardError[] errors?;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
};

public type ErrorCategory record {
    string httpStatus;
    string name;
};

public type SimplePublicObjectWithAssociations record {
    string id;
    record {} properties;
    string createdAt;
    string updatedAt;
    boolean archived?;
    string archivedAt?;
    record {} associations?;
};

public type Filter record {
    string value?;
    string propertyName;
    string operator;
};

public type PreviousPage record {
    string before;
    string link?;
};

public type SimplePublicObjectBatchInput record {
    record {} properties;
    string id;
};

public type SimplePublicObjectIdReadArray record {
    string[] properties;
    string idProperty?;
    SimplePublicObjectId[] inputs;
};

public type AssociatedId record {
    string id;
    string 'type;
};

public type NextPage record {
    string after;
    string link?;
};
