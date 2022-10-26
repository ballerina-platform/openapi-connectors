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
    string refreshUrl = "https://accounts.zoho.com/oauth/v2/token";
|};

public type Errors record {
    int code?;
    string message?;
};

public type Invoice record {
    int code?;
    string message?;
    InvoiceInfo[] contact?;
};

public type InvoicelistPageContext record {
    int page?;
    int per_page?;
    boolean has_more_page?;
    string report_name?;
    string applied_filter?;
    string sort_column?;
    string sort_order?;
};

public type SuccessOperation record {
    # Operation status
    int code?;
    # Message
    string message?;
};

public type InvoiceInfo record {
    int invoice_id?;
    boolean ach_payment_initiated?;
    string customer_name?;
    int customer_id?;
    string status?;
    string invoice_number?;
};

public type ContactInfo record {
    int contact_id?;
    string contact_name?;
    string company_name?;
    string contact_type?;
    string status?;
    int payment_terms?;
    string payment_terms_label?;
    int currency_id?;
    string currency_code?;
    int outstanding_receivable_amount?;
    decimal unused_credits_receivable_amount?;
    string first_name?;
    string last_name?;
    string email?;
    string phone?;
    string mobile?;
    string created_time?;
    string last_modified_time?;
};

public type ContactList record {
    int code?;
    string message?;
    ContactInfo[] contacts?;
    ContactlistPageContext page_context?;
};

public type ContactlistPageContext record {
    int page?;
    int per_page?;
    boolean has_more_page?;
    string applied_filter?;
    string sort_column?;
    string sort_order?;
};

public type Contact record {
    int code?;
    string message?;
    ContactInfo[] contact?;
};

public type InvoiceList record {
    int code?;
    string message?;
    InvoiceInfo[] invoices?;
    InvoicelistPageContext page_context?;
};
