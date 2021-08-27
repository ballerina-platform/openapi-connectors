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

public type BatchResponseBodySchema record {
    record  { record {} body?; record {} headers?; string path; int status;} [] responses;
};

public type Schema record {
    record {}[] data?;
};

public type ErrorSchema record {
    int code;
    anydata details?;
    int errno;
    string _error;
    string info?;
    string message?;
};

public type BatchRequests record {
    record {} body?;
    record {} headers?;
    string method?;
    string path;
};

public type Schema3 record {
    record {}[] data?;
};

public type Schema4 record {
    record {}[] data?;
};

public type Schema1 record {
    record  { string bucket; string collection; string host;} [] data?;
};

public type Schema2 record {
    record {}[] data?;
};

public type Objectschema1 record {
    record  { int cache_expires?; record {} schema?;}  data?;
    record  { string[] read?; string[] 'record\:create?; string[] write?;}  permissions?;
};

public type Objectschema2 record {
    record  { string[] members?;}  data?;
    record  { string[] read?; string[] write?;}  permissions?;
};

public type Defaults record {
    record {} body?;
    record {} headers?;
    string method?;
    string path?;
};

public type Objectschema3 record {
    record  { record {} 'collection\:schema?; record {} 'group\:schema?; record {} 'record\:schema?;}  data?;
    record  { string[] 'collection\:create?; string[] 'group\:create?; string[] read?; string[] write?;}  permissions?;
};

public type ObjectSchema record {
    record {} data?;
    record  { string[] read?; string[] write?;}  permissions?;
};

public type BatchPayloadSchema record {
    Defaults defaults?;
    BatchRequests[] requests;
};
