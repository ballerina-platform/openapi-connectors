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
    string refreshUrl = "https://identity.xero.com/connect/token";
|};

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
