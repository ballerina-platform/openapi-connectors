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

public type CustomObjectsRecordsArr CustomObjectsRecords[];

public type APICustomFieldMetadataArr APICustomFieldMetadata[];

public type APICustomObjectArr APICustomObject[];

public type CustomObject record {
    string OBJECT_NAME?;
    string SINGULAR_LABEL?;
    string PLURAL_LABEL?;
    string DESCRIPTION?;
    string RECORD_NAME_LABEL?;
    string RECORD_NAME_TYPE?;
    string RECORD_NAME_DISPLAY_FORMAT?;
    boolean ENABLE_NAVBAR?;
    boolean ENABLE_WORKFLOWS?;
    int CREATED_USER_ID?;
    string DATE_CREATED_UTC?;
    string DATE_UPDATED_UTC?;
};

public type APICustomFieldDependency record {
    string CONTROLLING_FIELD_ID?;
    APICustomFieldOptionsFilter[] OPTIONS_FILTERS?;
};

public type CustomObjectsRecords record {
    int RECORD_ID?;
    string RECORD_NAME;
    int OWNER_USER_ID?;
    string DATE_CREATED_UTC?;
    @constraint:String {maxLength: 11}
    string VISIBLE_TO?;
    int VISIBLE_TEAM_ID?;
    APICustomField[] CUSTOMFIELDS?;
};

public type Customobjectsrecords1 record {
    string RECORD_NAME;
    int OWNER_USER_ID?;
    @constraint:String {maxLength: 11}
    string VISIBLE_TO?;
    int VISIBLE_TEAM_ID?;
    APICustomField[] CUSTOMFIELDS?;
};

public type Customobjectsrecords2 record {
    string RECORD_NAME;
    int OWNER_USER_ID?;
    @constraint:String {maxLength: 11}
    string VISIBLE_TO?;
    int VISIBLE_TEAM_ID?;
    APICustomField[] CUSTOMFIELDS?;
};

public type Customobjectsrecords3 record {
    string RECORD_NAME;
    int OWNER_USER_ID?;
    @constraint:String {maxLength: 11}
    string VISIBLE_TO?;
    int VISIBLE_TEAM_ID?;
    APICustomField[] CUSTOMFIELDS?;
};

public type APICustomFieldMetadata record {
    string FIELD_NAME;
    int FIELD_ORDER;
    @constraint:String {maxLength: 12}
    string FIELD_FOR;
    @constraint:String {maxLength: 255}
    string FIELD_LABEL;
    @constraint:String {maxLength: 20}
    string FIELD_TYPE;
    @constraint:String {maxLength: 1000}
    string FIELD_HELP_TEXT?;
    string DEFAULT_VALUE?;
    boolean EDITABLE?;
    boolean VISIBLE?;
    APICustomFieldOption[] CUSTOM_FIELD_OPTIONS?;
    APICustomFieldDependency DEPENDENCY?;
    string JOIN_OBJECT?;
};

public type APICustomFieldOption record {
    int OPTION_ID?;
    @constraint:String {maxLength: 100}
    string OPTION_VALUE;
    boolean OPTION_DEFAULT;
};

public type APICustomField record {
    string FIELD_NAME?;
    record {} FIELD_VALUE?;
};

public type CustomObjectsRecords1 record {
    string RECORD_NAME;
    int OWNER_USER_ID?;
    @constraint:String {maxLength: 11}
    string VISIBLE_TO?;
    int VISIBLE_TEAM_ID?;
    APICustomField[] CUSTOMFIELDS?;
};

public type APICustomFieldOptionsFilter record {
    string CONTROLLING_VALUE?;
    int[] OPTION_IDS?;
};

public type APICustomObject record {
    string OBJECT_NAME?;
    string SINGULAR_LABEL?;
    string PLURAL_LABEL?;
    string DESCRIPTION?;
    string RECORD_NAME_LABEL?;
    string RECORD_NAME_TYPE?;
    string RECORD_NAME_DISPLAY_FORMAT?;
    boolean ENABLE_NAVBAR?;
    boolean ENABLE_WORKFLOWS?;
    int CREATED_USER_ID?;
    string DATE_CREATED_UTC?;
    string DATE_UPDATED_UTC?;
};

public type CustomFieldMetadata record {
    string FIELD_NAME;
    int FIELD_ORDER;
    @constraint:String {maxLength: 12}
    string FIELD_FOR;
    @constraint:String {maxLength: 255}
    string FIELD_LABEL;
    @constraint:String {maxLength: 20}
    string FIELD_TYPE;
    @constraint:String {maxLength: 1000}
    string FIELD_HELP_TEXT?;
    string DEFAULT_VALUE?;
    boolean EDITABLE?;
    boolean VISIBLE?;
    APICustomFieldOption[] CUSTOM_FIELD_OPTIONS?;
    APICustomFieldDependency DEPENDENCY?;
    string JOIN_OBJECT?;
};
