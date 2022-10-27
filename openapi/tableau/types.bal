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

# Extension settings of a Tableau server.
public type TableauExtensionsDashboardV1Serversettings record {
    TableauExtensionsDashboardV1Blocklistitem[] block_list_items?;
    # Specifies whether sandboxed extensions are allowed to run on the site.
    boolean extensions_enabled?;
};

public type TableauAnalyticsextensionsV1Sitesettings record {
    boolean enabled?;
};

public type TableauAnalyticsextensionsV1Connectionitem record {
    string connection_luid?;
    # Required. The location of an external service (TabPy, Rserve, EINSTEIN_DISCOVERY, Generic API, or other) that responds to your analytics extension requests. The case sensitive value must be a URI, IPv4 or IPv6 address that is a maximum of 255 Unicode characters. 
    #  
    #  Starting in Tableau 2022.1 / Online April 2022, a host address can include path information (`www.example.com/path`), where previous versions supported only the root domain name (`www.example.com`).
    string host?;
    # Required. Integer between 1 and 65535.
    int port?;
    # For Tableau Online: The value is always true. 
    #  
    #  For on premise Tableau servers:  Optional. Set to true if authentication is enabled on the external service. If  true, username and password are required. Default is false.
    boolean is_auth_enabled?;
    # For Tableau Online: A username is always required.
    string username?;
    # For Tableau Online: A password is always required.
    string password?;
    # For Tableau Online: The value is always true. 
    #  
    #  For on premise Tableau servers:  Optional. Set to true if authentication is enabled on the external service. If  true, username and password are required. Default is false.
    boolean is_ssl_enabled?;
    TableauAnalyticsextensionsV1Connectionbrief connection_brief?;
};

public type TableauAnalyticsextensionsV1Serversettings record {
    boolean enabled?;
};

public type TableauAnalyticsextensionsV1Connectionlist record {
    TableauAnalyticsextensionsV1Connectionitem[] connectionList?;
};

public type TableauError record {
    string httpErrorCode?;
    string message?;
};

public type TableauAnalyticsextensionsV1Connectionbrief record {
    # Required. The title of the connection.
    string connection_name?;
    # Required. The kind of service responding to analytics extension requests. The value can be: TABPY, for a [Tableau TabPy](https://github.com/tableau/TabPy) server; GENERIC_API for your custom service that complies with the [Analytics Extensions API spec](https://tableau.github.io/analytics-extensions-api/docs/ae_intro.html); or RSERVE, for an [Rserve](https://www.tableau.com/solutions/r) service; or EINSTEIN_DISCOVERY for your instance of [Einstein Discovery](https://help.tableau.com/current/server-linux/en-us/config_r_tabpy.htm).
    string connection_type?;
};

# List of dashboard extensions allowed to run on a site.
public type TableauExtensionsDashboardV1Safelistitems record {
    TableauExtensionsDashboardV1Safelistitem[] safe_list_items?;
};

public type TableauAnalyticsextensionsV1Connectionmapping record {
    string workbook_luid?;
    string connection_luid?;
};

# List of dashboard extensions blocked from running on a server.
public type TableauExtensionsDashboardV1Blocklistitems record {
    TableauExtensionsDashboardV1Blocklistitem[] block_list_items?;
};

# Dashboard extension settings of a site.
public type TableauExtensionsDashboardV1Sitesettings record {
    # Specifies whether extensions are allowed to run on the site.
    boolean extensions_enabled?;
    # Specifies whether sandboxed extensions are allowed to run on the site.
    boolean allow_sandboxed?;
    TableauExtensionsDashboardV1Safelistitem[] safe_list_items?;
};

public type TableauAnalyticsextensionsV1Connectionmetadatalist record {
    TableauAnalyticsextensionsV1Connectionmetadata[] connectionMetadataList?;
};

public type TableauAnalyticsextensionsV1Connectionmetadata record {
    string connection_luid?;
    TableauAnalyticsextensionsV1Connectionbrief connection_brief?;
};

# A dashboard extension that is allowed to run on a site.
public type TableauExtensionsDashboardV1Safelistitem record {
    string safe_list_item_luid?;
    # Location (URL) of the dashboard extension to be allowed on a site.
    string url?;
    # When true, the extension has access to underlying data of a workbook. This setting is only effective when the extension is on the site safe list. Default is false.
    boolean allow_full_data?;
    # When true, the user will be prompted to grant an extension access to the underlying data of a workbook. This setting is only effective when the extension is on the site safe list. Default is false.
    boolean prompt_needed?;
};

# A dashboard extension that is blocked from running on a server.
public type TableauExtensionsDashboardV1Blocklistitem record {
    # Location of the dashboard extension to be blocked from a site.
    string url?;
    string block_list_item_luid?;
};
