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
    OAuth2ClientCredentialsGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://sap-wls.authentication.eu10.hana.ondemand.com/oauth/token";
|};

public type BusinessContext record {
    # Business System
    @constraint:String {maxLength: 255}
    string businessSystem?;
    # The type of business object whose business partners are screened. Possible values are `SO` for _Sales Order_, `OD` for _Outbound Delivery_, `PO` for _Purchase Order_, `PC` for _Purchase Contract_, `PA` for _Purchase Scheduling Agreement_, `SC` for _Sales Contract_, `SA` for _Sales Scheduling Agreement_, `APMPAYMENTREQUEST` for _Payment_, `SQ` for _Sales Quotation_, `ID` for _Inbound Delivery_ and `PR` for _Purchase Requisition_.
    @constraint:String {maxLength: 255}
    string businessObjectType?;
    # Document ID
    @constraint:String {maxLength: 255}
    string documentId?;
};

public type BusinessPartner record {
    @constraint:String {maxLength: 255}
    string name?;
    @constraint:String {maxLength: 255}
    string street?;
    @constraint:String {maxLength: 255}
    string city?;
    @constraint:String {maxLength: 2}
    string countryISOCode?;
    @constraint:String {maxLength: 255}
    string postalCode?;
    @constraint:String {maxLength: 255}
    string inputKey?;
    boolean logicalDelete?;
    # Date on which the record was logically deleted in UTC
    string logicalDeleteOn?;
};

public type Error record {
    # Error code
    string code?;
    # Error text
    string message?;
};

public type DeletionResult record {
    # Number of (logically) deleted records
    int number?;
    # Description of deletion result
    string text?;
};

public type ScreeningDecision record {
    # Externally provided Key of Business Partner Input
    @constraint:String {maxLength: 255}
    string inputKey?;
    # Screening Hit Decision [ N - No Hit, C - Confirmed Hit, P - Possible Hit]
    @constraint:String {maxLength: 1}
    string status?;
};

# Business Partners
public type BusinessPartners BusinessPartner[];

# Screening Decisions
public type ScreeningDecisions ScreeningDecision[];
