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
    http:BearerTokenConfig auth;
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

public type LayoutTemplateCreateRequest record {
    # Name of the object for identification in Pardot.
    string name;
    # HTML content of this layout template encoded as JSON string.
    string layoutContent;
    # HTML content encoded as JSON string that controls form display logic. Uses default values if not provided.
    string formContent?;
    # HTML content encoded as JSON string that controls the site search content. Uses default values if not provided.
    string siteSearchContent?;
    # True if not supplying custom CSS styling.
    boolean isIncludeDefaultCss?;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
};

public type CustomRedirectsUpdateRequest record {
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
    # Name of the object for identification in Pardot.
    string name?;
    # A fully qualified URL. The visitor who clicks the custom redirect will be directed to this location. E.g. https://example.com/content.html
    string destinationUrl?;
    # Pardot Campaign related to this object.
    int campaignId?;
    # ID of the tracker domain to use in the URL for this object. Uses the primary tracker domain for the account if not specified on create.
    int trackerDomainId?;
    # Vanity URL path (excluding protocol and host). Must be unique for each tracker domain. E.g. /my-link. The value assumes empty (/) if not specified on create.
    string vanityUrlPath?;
    # Campaign source
    string gaSource?;
    # Campaign medium
    string gaMedium?;
    # Campaign keyword
    string gaTerm?;
    # Campaign content
    string gaContent?;
    # Campaign ID
    string gaCampaign?;
};

public type FileUpdateRequest record {
    # Name of the object for identification in Pardot. Uses the name of the file being uploaded if not specified on create.
    string name?;
    # Pardot campaign related to this object. Uses null if not specified on create.
    int campaignId?;
    # ID of the TrackerDomain to use in the URL for this object. Uses the primary tracker domain for the account if not specified on create.
    int trackerDomainId?;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
    # Vanity URL path (excluding protocol and host). Must be unique for each tracker domain. For example /my-link. The value assumes empty (/) if not specified on create.
    string vanityUrlPath?;
};

public type CustomRedirectsCreateRequest record {
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
    # Name of the object for identification in Pardot.
    string name;
    # A fully qualified URL. The visitor who clicks the custom redirect will be directed to this location. E.g. https://example.com/content.html
    string destinationUrl;
    # Pardot Campaign related to this object.
    int campaignId;
    # ID of the tracker domain to use in the URL for this object. Uses the primary tracker domain for the account if not specified on create.
    int trackerDomainId?;
    # Vanity URL path (excluding protocol and host). Must be unique for each tracker domain. E.g. /my-link. The value assumes empty (/) if not specified on create.
    string vanityUrlPath?;
    # Campaign source
    string gaSource?;
    # Campaign medium
    string gaMedium?;
    # Campaign keyword
    string gaTerm?;
    # Campaign content
    string gaContent?;
    # Campaign ID
    string gaCampaign?;
};

public type ListCreateRequest record {
    # Name of the object for identification in Pardot.
    string name;
    # Description of the list object.
    string description?;
    # Description of the list object.
    string title?;
    # True if the list is public.
    boolean isPublic?;
    # Pardot campaign related to this object. Uses null if not specified on create.
    int campaignId?;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
};

public type ExternalActivityCreateRequest record {
    # Name of the extension for this activity.
    string extension;
    # The type of external activity for this record. It must be a value from one of the registered types in the account.
    string 'type;
    # The email address of the prospect related to this external activity. If there are multiple prospects with the specified email address, the one with the most recent activity is selected.
    string email;
    # Any string value related to this activity. This value isn’t checked and can be any value. The value can be 100 characters or less.
    string value;
    # The date the external activity happened. It can be used by the user to backdate the activity. If not specified, then the current date is used. Must be in ISO8601 format with offset. Example- 2021-01-01T11:08:00+00:00
    string activityDate?;
};

public type LayoutTemplateUpdateRequest record {
    # Name of the object for identification in Pardot.
    string name?;
    # HTML content of this layout template encoded as JSON string.
    string layoutContent?;
    # HTML content encoded as JSON string that controls form display logic. Uses default values if not provided.
    string formContent?;
    # HTML content encoded as JSON string that controls the site search content. Uses default values if not provided.
    string siteSearchContent?;
    # True if not supplying custom CSS styling.
    boolean isIncludeDefaultCss?;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
};

public type FileCreateRequestObject record {
    # File content
    string file;
    # File create request
    FileCreateRequest input;
};

public type CustomFieldCreateRequest record {
    # Name of the object for identification in Pardot.
    string name;
    # User-defined ID of the object.
    string fieldId;
    # Possible values- Text, "Radio Button", Checkbox, Dropdown, Textarea, Multi-Select, Hidden, Number, Date, "CRM User"
    string 'type;
    # True if it records multiple responses, false otherwise.
    boolean isRecordMultipleResponses?;
    # Salesforce Id of the object.
    string salesforceId?;
    # True if values are used false otherwise.
    boolean isUseValues?;
    # Write-Only field on create operation. Possible values- Countries, "Country Codes", "US States", "US State Codes", "Canadian Provinces", "Canadian Province Codes", "US States and Canadian Provinces", "US State and Canadian Province Codes", "Japanese Prefectures", "Japanese Prefecture Codes"
    string valuesPrefill;
    # True if the custom field is required.
    boolean isRequired?;
};

public type Record record {
};

# File create request
public type FileCreateRequest record {
    # Name of the object for identification in Pardot. Uses the name of the file being uploaded if not specified on create.
    string name;
    # Pardot campaign related to this object. Uses null if not specified on create.
    int campaignId;
    # ID of the TrackerDomain to use in the URL for this object. Uses the primary tracker domain for the account if not specified on create.
    int trackerDomainId;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId;
    # Vanity URL path (excluding protocol and host). Must be unique for each tracker domain. For example /my-link. The value assumes empty (/) if not specified on create.
    string vanityUrlPath;
};

public type CustomFieldUpdateRequest record {
    # Name of the object for identification in Pardot.
    string name;
    # User-defined ID of the object.
    string fieldId;
    # Possible values- Text, "Radio Button", Checkbox, Dropdown, Textarea, Multi-Select, Hidden, Number, Date, "CRM User"
    string 'type;
    # True if it records multiple responses, false otherwise.
    boolean isRecordMultipleResponses?;
    # Salesforce Id of the object.
    string salesforceId?;
    # True if values are used false otherwise.
    boolean isUseValues?;
    # Write-Only field on create operation. Possible values- Countries, "Country Codes", "US States", "US State Codes", "Canadian Provinces", "Canadian Province Codes", "US States and Canadian Provinces", "US State and Canadian Province Codes", "Japanese Prefectures", "Japanese Prefecture Codes"
    string valuesPrefill?;
    # True if the custom field is required.
    boolean isRequired?;
};

public type ListUpdateRequest record {
    # Name of the object for identification in Pardot.
    string name?;
    # Description of the list object.
    string description?;
    # Description of the list object.
    string title?;
    # True if the list is public.
    boolean isPublic?;
    # Pardot campaign related to this object. Uses null if not specified on create.
    int campaignId?;
    # ID of the folder containing this object. Uses the asset type's uncategorized folder if not specified on create.
    int folderId?;
};
