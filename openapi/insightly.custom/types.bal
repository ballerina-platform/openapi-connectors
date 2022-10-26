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

import ballerina/http;
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

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
