// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
