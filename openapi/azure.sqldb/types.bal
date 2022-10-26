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
    http:BearerTokenConfig auth;
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

# A list of managed databases.
public type ManagedDatabaseListResult record {
    # Link to retrieve next page of results.
    string nextLink?;
    # Array of results.
    ManagedDatabase[] value?;
};

# Contains the information necessary to perform a complete database restore operation.
public type CompleteDatabaseRestoreDefinition record {
    # The last backup name to apply
    string lastBackupName;
};

# The managed database's properties.
public type ManagedDatabaseProperties record {
    # Collation of the metadata catalog.
    string catalogCollation?;
    # Collation of the managed database.
    string collation?;
    # Managed database create mode. PointInTimeRestore: Create a database by restoring a point in time backup of an existing database. SourceDatabaseName, SourceManagedInstanceName and PointInTime must be specified. RestoreExternalBackup: Create a database by restoring from external backup files. Collation, StorageContainerUri and StorageContainerSasToken must be specified. Recovery: Creates a database by restoring a geo-replicated backup. RecoverableDatabaseId must be specified as the recoverable database resource ID to restore.
    string createMode?;
    # Creation date of the database.
    string creationDate?;
    # Geo paired region.
    string defaultSecondaryLocation?;
    # Earliest restore point in time for point in time restore.
    string earliestRestorePoint?;
    # Instance Failover Group resource identifier that this managed database belongs to.
    string failoverGroupId?;
    # The resource identifier of the recoverable database associated with create operation of this database.
    string recoverableDatabaseId?;
    # The restorable dropped database resource id to restore when creating this database.
    string restorableDroppedDatabaseId?;
    # Conditional. If createMode is PointInTimeRestore, this value is required. Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database.
    string restorePointInTime?;
    # The resource identifier of the source database associated with create operation of this database.
    string sourceDatabaseId?;
    # Status of the database.
    string status?;
    # Conditional. If createMode is RestoreExternalBackup, this value is required. Specifies the storage container sas token.
    string storageContainerSasToken?;
    # Conditional. If createMode is RestoreExternalBackup, this value is required. Specifies the uri of the storage container where backups for this restore are stored.
    string storageContainerUri?;
};

# ARM tracked top level resource.
public type TrackedResource Resource;

# ARM resource.
public type Resource record {
    # Resource ID.
    string id?;
    # Resource name.
    string name?;
    # Resource type.
    string 'type?;
};

# A managed database resource.
public type ManagedDatabase TrackedResource;

# An managed database update.
public type ManagedDatabaseUpdate record {
    # The managed database's properties.
    ManagedDatabaseProperties properties?;
    # Resource tags.
    record {} tags?;
};
