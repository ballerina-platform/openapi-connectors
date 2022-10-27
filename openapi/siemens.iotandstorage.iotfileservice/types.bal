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
    string refreshUrl = "https://oauth.simple.api/token";
|};

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
