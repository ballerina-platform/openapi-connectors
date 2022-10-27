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
    # Represents API Key `user_key`
    @display {label: "", kind: "password"}
    string userKey;
|};

public type FeedsVO record {
    string category?;
    CompanyBasicVO company?;
    string enclosure_image?;
    string feed_date?;
    string id?;
    string owler_feed_url?;
    string publisher_logo?;
    string publisher_name?;
    string source_url?;
    string title?;
};

public type SectorVO record {
    string name?;
    string parent_industry?;
};

public type Company record {
    Acquisition[] acquisition?;
    Ceo ceo?;
    int company_id;
    string company_type?;
    string description?;
    string employee_count?;
    string facebook_link?;
    string founded_date?;
    Funding[] funding?;
    Address hq_address?;
    string[] industries?;
    string linkedin_link?;
    string logo_url;
    string name;
    string perm_id?;
    int[] portfolio_company_ids?;
    string profile_url;
    string revenue?;
    SectorVO[] sectors?;
    string short_name?;
    Stock stock?;
    string twitter_link?;
    string website;
    string youtube_link?;
};

public type Address record {
    string city?;
    string country?;
    string phone?;
    string postal_code?;
    string state?;
    string street1?;
    string street2?;
};

public type CompanySearchResultVO record {
    int company_id;
    string company_type?;
    string description?;
    Address hq_address?;
    string logo_url;
    string name;
    string perm_id?;
    string profile_url;
    string short_name?;
    Stock stock?;
    string website;
};

public type Funding record {
    string amount?;
    string date?;
    Investor[] investor?;
    string 'type?;
    string undisclosed?;
};

public type CompanyCompetitorVO record {
    CompanyBasicVO[] competitor?;
};

public type FuzzyResults record {
};

public type Ceo record {
    string ceo_rating?;
    string first_name?;
    string image_url?;
    string last_name?;
};

public type Acquisition record {
    string acquirer_company_id?;
    string amount?;
    string company_id?;
    string date?;
    string name?;
    string status?;
    string undisclosed?;
    string website?;
};

public type BasicResults record {
    CompanyBasicSearchVO[] company?;
};

public type CompanyBasicSearchVO record {
    int company_id?;
    Address hq_address?;
    string name?;
    string perm_id?;
    string profile_url?;
    string short_name?;
    string website?;
};

public type CompanyBasicVO record {
    int company_id;
    string logo_url;
    string name;
    string profile_url;
    string short_name?;
    string website;
};

public type Results record {
    FeedsVO[] feeds?;
    string pagination_id?;
};

public type Competitors record {
    CompetitorBasicVO[] competitor?;
    string pagination_id?;
};

public type CompetitorBasicVO record {
    int company_id;
    string logo_url;
    string name;
    string profile_url;
    int score;
    string short_name?;
    string website;
};

public type Investor record {
    string company_id?;
    string name?;
    string website?;
};

public type Stock record {
    string exchange?;
    string ticker?;
};
