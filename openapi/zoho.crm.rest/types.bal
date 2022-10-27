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
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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
    string tokenUrl = "https://accounts.zoho.com/oauth/v2/token";
|};

# Represents the name, ID, and email ID of the record owner.
public type Owner record {
    # Name
    string name?;
    # Owner ID
    string id?;
    # Email
    string email?;
};

public type RecordsdataInfo record {
    int per_page?;
    int count?;
    int page?;
    boolean more_records?;
};

public type LeadResponse record {
    string Contacts?;
    string? Deals?;
    string Account?;
};

public type ResponseData record {
    string code?;
    ResponseDetails details?;
    string message?;
    string status?;
};

public type ConvertLeadResponse record {
    LeadResponse[] data?;
};

public type Response record {
    ResponseData[] data?;
};

public type LeadData record {
    Lead[] data?;
};

public type By record {
    string name?;
    string id?;
};

public type RecordsData record {
    Record[] data?;
    RecordsdataInfo info?;
};

public type Lead record {
    # Specify if the Lead details must be overwritten in the Contact/Account/Deal based on lead conversion mapping configuration.
    boolean overwrite?;
    # Specify whether the lead owner must get notified about the lead conversion via email.
    boolean notify_lead_owner?;
    # Specify whether the user to whom the contact/account is assigned to must get notified about the lead conversion via email.
    boolean notify_new_entity_owner?;
    # Use this key to associate an account with the lead being converted. Pass the unique and valid account ID.
    string Accounts?;
    # Use this key to associate a contact with the lead being converted. Pass the unique and valid contact ID.
    string Contacts?;
    # Use this key to assign record owner for the new contact and account. Pass the unique and valid user ID.
    string assign_to?;
    LeadDeals Deals?;
    record {} carry_over_tags?;
};

public type Record record {
    # Represents the name, ID, and email ID of the record owner.
    Owner Owner?;
    # Represents the symbol of the currency of the organization. For instance, '₹'.
    string '\$currency\_symbol?;
    # Represents if the record is a part of review process.
    boolean '\$process\_flow?;
    # Represents the exchange rate set for the organization.
    int Exchange_Rate?;
    # Represents the currency of the organization.
    string Currency?;
    # Represents if the current record is approved.
    boolean '\$approved?;
    # Represents the details of the approval process.
    record {} '\$approval?;
    # Represents the date and time at which the record was created.
    string Created_Time?;
    # Represents the date and time at which the record was last modified.
    string Modified_Time?;
    # Represents if the user can edit records in the current module.
    boolean '\$editable?;
    # Represents the name, ID, and email of the user who created the current record.
    record {} Created_By?;
    # Represents the name, ID, and email of the user who last modified the record.
    record {} Modified_By?;
    # Represents if the current record is a part of orchestration.
    boolean? '\$orchestration?;
};

public type ResponseDetails record {
    string Modified_Time?;
    By Modified_By?;
    string Created_Time?;
    string id?;
    By Created_By?;
};

public type LeadDeals record {
    string Deal_Name;
    string Closing_Date;
    string Stage;
};
