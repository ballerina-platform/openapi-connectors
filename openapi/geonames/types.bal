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
    # Represents API Key `username`
    @display {label: "", kind: "password"}
    string username;
|};

public type Timezone record {
    string sunrise?;
    decimal lng?;
    string countryCode?;
    int gmtOffset?;
    int rawOffset?;
    string sunset?;
    string timezoneId?;
    int dstOffset?;
    string countryName?;
    string time?;
    decimal lat?;
};

public type GeonamesInner record {
    string ing?;
    int geonameid?;
    string countrycode?;
    string name?;
    string fclName?;
    string toponymName?;
    string fcodeName?;
    string wikipedia?;
    string lat?;
    string fcl?;
    int population?;
    string fcode?;
};

public type PostalCodeResponse record {
    Geonames geonames?;
};

public type Earthquake record {
    string datetime?;
    decimal depth?;
    decimal lng?;
    string src?;
    string eqid?;
    decimal magnitude?;
    decimal lat?;
};

public type EarthquakeResponse record {
    Earthquake[] earthquakes?;
};

public type WeatherResponse WeatherObservation[];

public type PostalCodes record {
    PostalCode[] postalcodes?;
};

public type PostalCode record {
    string adminCode1?;
    string adminCode2?;
    string adminCode3?;
    string adminName1?;
    string adminName2?;
    string adminName3?;
    string countryCode?;
    string distance?;
    decimal lat?;
    decimal lng?;
    string placeName?;
    string postalCode?;
};

public type Geonames GeonamesInner[];

public type WeatherObservationResponse record {
    WeatherObservation WeatherObservation?;
};

public type WeatherObservation record {
    string clouds?;
    string cloudsCode?;
    string countrycode?;
    string datetime?;
    string dewPoint?;
    decimal elevation?;
    decimal hectoPascAltimeter?;
    decimal humidity?;
    string ICAO?;
    decimal lat?;
    decimal ing?;
    string observation?;
    decimal seaLevelPressure?;
    string stationName?;
    string temperature?;
    string weatherCondition?;
    string windSpeed?;
    int windDirection?;
};

public type SearchResponse record {
    int totalResultsCount?;
    Geonames geonames?;
};
