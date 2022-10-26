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
    # You must include a 'key' parameter in the query string of each request to the Opti Public API. Opti uses this key to authenticate and throttle all requests to the Public API to help provide reliable and rapid services to all of its customers.
    # 
    # API Keys can be acquired and replaced by contacting your [Opti Support](mailto:support@optirtc.com?subject=[Opti%20Developer%20Docs]%20Public%20API%20Throttling) representative. If you are building multiple web sites, ETL workflows, or other applications on top of the Opti Public API, Opti recommends using a different API key for each application to avoid unnecessary throttling from occurring. All throttled requests will return an [HTTP 429 status code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429).
    @display {label: "", kind: "password"}
    string 'key;
|};

public type DataStreamPageResult record {
    DatastreampageresultItems[] Items?;
    int Count?;
};

public type DatapointverbositylistInner record {
    string name;
    string definition;
    boolean isDefault;
    boolean isAvailableInApi;
};

public type DatastreampageresultItems record {
    string title;
    int id;
    int resourceId;
    string validFrom;
    DatastreampageresultLocation location;
    string unitName;
    string unitAbbreviation;
};

public type DataPoint record {
    string id?;
    string timeValue?;
    DatapointValue[] value?;
};

public type DataPointPage record {
    DatapointpageItems[] Items?;
    string NextPageLink?;
    int Count?;
};

public type DatapointpageItems record {
    string id;
    string timeValue;
    DatapointValue[] value;
};

public type DataPointVerbosityList DatapointverbositylistInner[];

public type DatapointValue record {
    int resourceId;
    record {} value;
};

public type DataPointVerbosity record {
    string name?;
    string definition?;
    boolean isDefault?;
    boolean isAvailableInApi?;
};

public type DatastreampageresultLocation record {
    decimal[] coordinates?;
    decimal[] bbox?;
    string 'type?;
};
