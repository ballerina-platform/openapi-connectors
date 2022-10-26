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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

public type Paging record {
    NextPage next?;
    PreviousPage prev?;
};

# A summary detailing which list contains the imported objects.
public type PublicObjectListRecord record {
    # The ID of the list containing the imported objects.
    string listId;
    # The type of object contained in the list.
    string objectType;
};

public type PublicImportCollectionResponse record {
    PublicImportResponse[] results;
    Paging paging?;
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

public type PublicImportErrorCollection record {
    PublicImportError[] results;
    ForwardPaging paging?;
};

public type ImportRowCore record {
    int fileId;
    string pageName?;
    int lineNumber;
};

public type ActionResponse record {
    string status;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
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

public type ForwardPaging record {
    NextPage next?;
};

public type PublicImportError record {
    string errorType;
    string objectType?;
    string invalidValue?;
    string extraContext?;
    string objectTypeId?;
    int knownColumnNumber;
    ImportRowCore sourceData;
    int createdAt;
    string id;
};

public type PreviousPage record {
    string before;
    string link?;
};

# An object detailing a summary of the import record outputs
public type PublicImportMetadata record {
    # The lists containing the imported objects.
    PublicObjectListRecord[] objectLists;
    # Summarized outcomes of each row a developer attempted to import into HubSpot.
    record {} counters;
    # The IDs of files uploaded in the File Manager API.
    string[] fileIds;
};

public type V3ImportsBody record {
    # A list of files containing the data to import
    string files?;
    # JSON formatted metadata about the import. This includes a name for the import and the column mappings for each file. See the overview tab for more on the required format.
    string importRequest?;
};

# A current summary of the import, whether complete or not.
public type PublicImportResponse record {
    # The status of the import.
    string state;
    # Import request in JSON
    record {} importRequestJson?;
    # Created date/time
    string createdAt;
    # An object detailing a summary of the import record outputs
    PublicImportMetadata metadata;
    # Import name
    string importName?;
    # Updated date/time
    string updatedAt;
    # Whether or not the import is a list of people disqualified from receiving emails.
    boolean optOutImport;
    # ID of the import
    string id;
};

public type NextPage record {
    string after;
    string link?;
};
