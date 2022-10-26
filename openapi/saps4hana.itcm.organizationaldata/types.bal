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
    string tokenUrl = "https://colgate-dev1.authentication.us30.hana.ondemand.com/oauth/token";
|};

public type SalesDivisionResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type SalesOrganizationResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type DistributionChannelResponseNotFound record {
    string message?;
    string externalid?;
    string timestamp?;
};

public type SalesOrganizationResponse record {
    string externalId?;
    string message?;
    ExternalSalesOrganizationDTO 'sales\-organization?;
    string timestamp?;
};

public type SalesAreaResponse record {
    string externalid?;
    string message?;
    ExternalSalesAreaDTO 'sales\-areas?;
    string timestamp?;
};

public type ExternalSalesOrganizationDescriptionDTO record {
    string description?;
    @constraint:String {maxLength: 2}
    string languageKey?;
};

public type ExternalSalesDivisionDTO record {
    ExternalSalesDivisionDescriptionDTO[] descriptions?;
    @constraint:String {maxLength: 40, minLength: 1}
    string externalId;
};

public type SalesDivisionResponse record {
    string externalid?;
    string message?;
    ExternalSalesDivisionDTO 'sales\-divisions?;
    string timestamp?;
};

public type ExternalDistributionChannelDescriptionDTO record {
    string description?;
    @constraint:String {maxLength: 2}
    string languageKey?;
};

public type SalesDivisionDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesOrganizationDTO record {
    ExternalSalesOrganizationDescriptionDTO[] descriptions?;
    string externalCompanyCodeId?;
    @constraint:String {maxLength: 40, minLength: 1}
    string externalId;
};

public type ExternalDistributionChannelDTO record {
    ExternalDistributionChannelDescriptionDTO[] descriptions?;
    @constraint:String {maxLength: 40, minLength: 1}
    string externalId;
};

public type SalesOrganizationDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type SalesOrgDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesDivisionDescriptionDTO record {
    string description?;
    @constraint:String {maxLength: 2, minLength: 1}
    string languageKey?;
};

public type ResponseMessage record {
    string message?;
    string uri?;
    string timestamp?;
};

public type ResponseUnauthorizedMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type SalesAreaDeleteResponse record {
    string externalid?;
    string message?;
    string timestamp?;
};

public type ResponseNotFoundMessage record {
    string message?;
    string 'error?;
    string timestamp?;
};

public type ExternalSalesAreaDTO record {
    ExternalSalesAreaDescriptionDTO[] descriptions?;
    string externalDistributionChannel?;
    @constraint:String {maxLength: 40, minLength: 1}
    string externalId;
    string externalSalesDivision?;
    string externalSalesOrganization?;
};

public type DistributionChannelResponse record {
    ExternalDistributionChannelDTO 'distribution\-channels?;
    string externalid?;
    string message?;
    string timestamp?;
};

public type ExternalSalesAreaDescriptionDTO record {
    string description?;
    string languageKey?;
};

public type SalesAreaResponseNotFound record {
    int count?;
    ExternalDistributionChannelDTO[] 'distribution\-channels?;
    string message?;
    string timestamp?;
};

public type ResponseForbiddenMessage record {
    string message?;
    string timestamp?;
    string uri?;
};

public type ResponseCreated record {
    string externalId?;
    string message?;
    string timestamp?;
};

public type DistributionChannelDeleteResponse record {
    string message?;
    string externalid?;
    string timestamp?;
};
