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
    # All request are sent with API key using the HTTP header X-OPENFIGI-APIKEY. With a valid API key, you will be subject  to a higher rate-limit and request size. Sign-up for an [OpenFIGI account](https://www.openfigi.com/) to obtain an API key and Follow this link (https://www.openfigi.com/api)  for more details.
    @display {label: "", kind: "password"}
    string xOpenfigiApikey;
|};

public type MappingJobResult MappingJobResultFigiList;

public type BulkMappingJobResult MappingJobResult[];

# For V3: securityType2 is required when idType is BASE_TICKER or ID_EXCH_SYMBOL.  expiration is required when securityType2 is Option or Warrant.  maturity is required when securityType2 is Pool.
public type MappingJob record {
    # Type of third party identifier
    string idType;
    # The value for the represented third party identifier
    string|int idValue;
    # Exchange code of the desired instrument(s) (cannot use in conjunction with micCode)
    string? exchCode?;
    # ISO market identification code(MIC) of the desired instrument(s) (cannot use in conjunction with exchCode)
    string? micCode?;
    # Currency associated to the desired instrument(s)
    string? currency?;
    # Market sector description of the desired instrument(s)
    string? marketSecDes?;
    # Security type of the desired instrument(s)
    string? securityType?;
    # An alternative security type of the desired instrument(s)
    string? securityType2?;
    # Set to true to include equity instruments that are not listed on an exchange
    boolean? includeUnlistedEquities?;
    # Will filter instruments based on option type
    string? optionType?;
    # At least one entry should be non-null.
    NullableNumberInterval? strike?;
    # At least one entry should be non-null.
    NullableNumberInterval? contractSize?;
    # At least one entry should be non-null.
    NullableNumberInterval? coupon?;
    # At least one entry should be non-null.
    NullableDateInterval? expiration?;
    # At least one entry should be non-null.
    NullableDateInterval? maturity?;
    # State code of the desired instrument(s)
    string? stateCode?;
};

public type FigiResult record {
    # FIGI assigned to the instrument
    string figi?;
    # Enum-like attributes of the instrument
    string? securityType?;
    # Enum-like attributes of the instrument
    string? marketSector?;
    # Various attributes of the instrument
    string? ticker?;
    # Various attributes of the instrument
    string? name?;
    # Enum-like attributes of the instrument
    string? exchCode?;
    # Various attributes of the instrument
    string? shareClassFIGI?;
    # Various attributes of the instrument
    string? compositeFIGI?;
    # Enum-like attributes of the instrument
    string? securityType2?;
    # Various attributes of the instrument
    string? securityDescription?;
    # Exists when API is unable to show non-FIGI fields.
    string? metadata?;
};

public type MappingJobResultFigiList record {
    FigiResult[] data?;
};

public type BulkMappingJob MappingJob[];

# At least one entry should be non-null.
public type NullableNumberInterval decimal[2]?;

# At least one entry should be non-null.
public type NullableDateInterval string[2]?;

public type MappingJobResultFigiNotFound record {
    string warning?;
};

public type Values record {
    string[] values?;
};
