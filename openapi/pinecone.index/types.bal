// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    string apiKey;
|};

public type CollectionsList CollectionName[];

# The unique name of a collection.
public type CollectionName string;

public type Index record {
    IndexDatabase database?;
    IndexStatus status?;
};

public type CollectionDefinition record {
    # The unique name of a collection.
    CollectionName name;
    # The unique name of an index.
    IndexName 'source;
};

public type IndexesList IndexName[];

# The current status of a collection.
public type CollectionState string;

# The vector similarity metric of the index
public type IndexMetric string;

# The number of dimensions in the vector representation
@constraint:Int {minValue: 1, maxValue: 20000}
public type VectorDimensionality int;

# The current status of a index.
public type IndexState string;

public type IndexConfiguration record {
    # The desired number of replicas for the index.
    @constraint:Int {minValue: 1}
    int replicas?;
    # The pod type
    PodType pod_type?;
};

# The unique name of an index.
@constraint:String {maxLength: 45, minLength: 1}
public type IndexName string;

public type IndexStatus record {
    string host?;
    int port?;
    # The current status of a index.
    IndexState state?;
    boolean ready?;
};

public type IndexDefinition record {
    # The unique name of an index.
    IndexName name;
    # The number of dimensions in the vector representation
    VectorDimensionality dimension;
    # The vector similarity metric of the index
    IndexMetric metric?;
    # The number of pods for the index to use,including replicas.
    @constraint:Int {minValue: 1}
    int pods = 1;
    # The number of replicas. Replicas duplicate your index. They provide higher availability and throughput.
    @constraint:Int {minValue: 1}
    int replicas = 1;
    # The pod type
    PodType pod_type?;
    # Configuration for the behavior of Pinecone's internal metadata index. By default, all metadata is indexed; when metadata_config is present, only specified metadata fields are indexed.
    IndexMetadataConfig metadata_config?;
    # The unique name of a collection.
    CollectionName source_collection?;
};

public type IndexDatabase record {
    # The unique name of an index.
    IndexName name?;
    # The vector similarity metric of the index
    IndexMetric metric?;
    # The number of dimensions in the vector representation
    VectorDimensionality dimension?;
    @constraint:Int {minValue: 1}
    int replicas?;
    @constraint:Int {minValue: 1}
    int shards?;
    @constraint:Int {minValue: 1}
    int pods?;
    # The pod type
    PodType pod_type?;
};

# Configuration for the behavior of Pinecone's internal metadata index. By default, all metadata is indexed; when metadata_config is present, only specified metadata fields are indexed.
public type IndexMetadataConfig record {
    string[] indexed?;
};

public type Collection record {
    # The unique name of a collection.
    CollectionName name;
    int size;
    # The current status of a collection.
    CollectionState status;
};

# The pod type
public type PodType string;

public type ErrorMessage string;
