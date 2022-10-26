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

public type CarrierResourceModel record {
    # A URL that gives more information about the linked resource. A null value would mean that no further information is available for that resource. Use this resource to get detailed information about the carrier.
    string resourceLocation?;
    CarrierModel 'resource?;
};

public type CarriersPaginationModel record {
    # This is an integer that matches the offset given in the request and dictates the number of items to skip while fetching results. For example, there is a preset limit of 20 results per page. If there are 30 total results and offset is set to 20, then the response will show the second "page" of results, with items 21 to 30.
    int offset?;
    # Total number of available items in the API response.
    int total?;
    # A link used to fetch the previous set or page of items in the API response.
    string previous?;
    # A link used to fetch the next set or page of items in the API response.
    string next?;
    CarrierResourceModel[] items?;
};

public type GetCarrierResponse record {
    *CarrierServerResponse;
};

public type GetCarriersResponse record {
    *CarrierServerResponse;
};

# Receiving Server Response
public type CarrierServerResponse record {
    # This is the HTTP status code.
    int status?;
    # This is the HTTP status message.
    string message?;
    # A URL that gives more information about the linked resource. A 'null' value would mean that no further information is available for that resource. Use this resource to get detailed information about the carrier.
    string resourceLocation?;
};

public type CarrierModel record {
    # A string consisting of carrier code and service level.
    string code?;
    # This is the service level code associated with the carrier. There are multiple levels for one type of service. Each level has a specific code. (e.g. For FDX the codes are 1D, 2D, GD, etc.)
    string serviceLevelCode?;
    # This is the name of the associated carrier.
    string name?;
    # A boolean that indicates the carrier is a freight carrier. The value 1 (True) means this carrier supports heavy weight orders or large items.
    int isFreightCarrier?;
    # A boolean that indicates whether or not the carrier is restricted. The value 1 (True) means this carrier is not available for general use. If required, contact customer care for possible enablement.
    int isRestrictedCarrier?;
    # A boolean that indicates the carrier uses a national government postal service, either for aggregated or for last mile delivery.
    int isPostalCarrier?;
    # A boolean that indicates if the carrier supports US territories. (e.g. Puerto Rico, Guam, etc.)
    int isTerritorySupported?;
    # A boolean that indicates if the carrier supports PO box delivery.
    int isPoBoxSupported?;
    # A boolean that indicates the carrier supports delivery to military addresses (APO, FPO).
    int isApoFpoSupported?;
    # A boolean that indicates the carrier requires pickup. A 0 (False) value would mean that the carrier supports delivery to doorstep. This feature is related to third party carriers.
    int isPickupRequired?;
    # A boolean that indicates the carrier requires a signature upon delivery of the order.
    int isSignatureRequired?;
    # A boolean that indicates the carrier is self-insured for damages that occur to an order while in transit.
    int isSelfInsured?;
    # A boolean that indicates the carrier can transport orders that include dangerous goods. (e.g. chemicals, etc.)
    int isDangerousGoodsSupported?;
    # A boolean that indicates orders transported by the carrier will recieive a tracking ID so that it can be tracked after leaving the warehouse through to delivery.
    int isTrackable?;
    # A boolean that indicates the carrier provides special services specific to the handling of media. (e.g. books, videotapes, DVDs, CDs, printed music and other sound recordings)
    int isMediaSupported?;
    # The minimum number of days the carrier takes for shipping the order.
    int minimumShippingDays?;
    # The maximum number of days the carrier takes for shipping the order.
    int maximumShippingDays?;
};
