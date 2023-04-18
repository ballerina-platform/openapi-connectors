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

public type DescribeIndexStatsRequest record {
    # If this parameter is present, the operation only affects vectors that satisfy the filter. See https://www.pinecone.io/docs/metadata-filtering/.
    VectorFilter filter?;
};

public type QueryRequest record {
    # An index namespace name
    NamespaceName namespace?;
    # The number of results to return for each query.
    @constraint:Int {maxValue: 10000}
    int topK;
    # If this parameter is present, the operation only affects vectors that satisfy the filter. See https://www.pinecone.io/docs/metadata-filtering/.
    VectorFilter filter?;
    boolean includeValues = false;
    boolean includeMetadata = false;
    # Vector dense data. This should be the same length as the dimension of the index being queried.
    VectorData vector?;
    # Vector sparse data. Represented as a list of indices and a list of corresponded values, which must be the same length.
    SparseVectorData sparseVector?;
    # The unique ID of a vector
    VectorId id?;
};

public type UpdateRequest record {
    # The vector's unique ID
    string id;
    # Vector dense data. This should be the same length as the dimension of the index being queried.
    VectorData values?;
    # Vector sparse data. Represented as a list of indices and a list of corresponded values, which must be the same length.
    SparseVectorData sparseValues?;
    VectorMetadata setMetadata?;
    # An index namespace name
    NamespaceName namespace?;
};

public type DescribeIndexStatsResponse record {
    record {|IndexNamespaceStats...;|} namespaces?;
    # The number of dimensions in the vector representation
    VectorDimensionality dimension?;
    # The fullness of the index, regardless of whether a metadata filter expression was passed. The granularity of this metric is 10%.
    float indexFullness?;
    int totalVectorCount?;
};

# The response for the `Fetch` operation.
public type FetchResponse record {
    record {|Vector...;|} vectors?;
    # The namespace of the vectors.
    string namespace?;
};

# The number of dimensions in the vector representation
@constraint:Int {minValue: 1, maxValue: 20000}
public type VectorDimensionality int;

# Vector dense data. This should be the same length as the dimension of the index being queried.
public type VectorData float[];

# An index namespace name
public type NamespaceName string;

public type IndexNamespaceStats record {
    int vectorCount?;
};

public type UpdateResponse record {
};

public type VectorMetadata record {
};

public type DeleteResponse record {
};

public type UpsertResponse record {
    int upsertedCount?;
};

public type QueryResponse record {
    QueryMatch[] matches?;
    # An index namespace name
    NamespaceName namespace?;
};

public type QueryMatch record {
    # The unique ID of a vector
    VectorId id;
    float score?;
    # Vector dense data. This should be the same length as the dimension of the index being queried.
    VectorData values?;
    # Vector sparse data. Represented as a list of indices and a list of corresponded values, which must be the same length.
    SparseVectorData sparseValues?;
    VectorMetadata metadata?;
};

public type UpsertRequest record {
    Vector[] vectors;
    # An index namespace name
    NamespaceName namespace?;
};

# Vector sparse data. Represented as a list of indices and a list of corresponded values, which must be the same length.
public type SparseVectorData record {
    # The indices of the sparse data.
    int[] indices;
    # The corresponding values of the sparse data, which must be the same length as the indices.
    float[] values;
};

# If this parameter is present, the operation only affects vectors that satisfy the filter. See https://www.pinecone.io/docs/metadata-filtering/.
public type VectorFilter record {
};

public type ErrorMessage string;

public type Vector record {
    # The unique ID of a vector
    VectorId id?;
    # Vector dense data. This should be the same length as the dimension of the index being queried.
    VectorData values?;
    # Vector sparse data. Represented as a list of indices and a list of corresponded values, which must be the same length.
    SparseVectorData sparseValues?;
    VectorMetadata metadata?;
};

public type DeleteRequest record {
    VectorId[] ids?;
    boolean deleteAll?;
    # An index namespace name
    NamespaceName namespace?;
    # If this parameter is present, the operation only affects vectors that satisfy the filter. See https://www.pinecone.io/docs/metadata-filtering/.
    VectorFilter filter?;
};

# The unique ID of a vector
public type VectorId string;
