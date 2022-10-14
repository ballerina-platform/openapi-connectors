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

public type ErrorReponse record {
    MessageResponse[] errors?;
};

public type MessageResponse record {
    string message;
};

public type RepositoryValidateBody record {
    string[] filename?;
};

public type RepositoryPrivateBody record {
    string[] filename?;
};

public type InlineResponse201 record {
    @constraint:Int {minValue: 1}
    int id;
};

public type InlineResponse2001 record {
    int rowsDeleted;
};

public type InlineResponse200 record {
    string message;
};

public type InlineResponse500 record {
    InlineResponse500Errors[] errors;
};

public type InlineResponse202 record {
    int rowsAdded;
    int rowsChanged;
    int rowsDeleted;
};

public type InlineResponse500Errors record {
    string message;
};
