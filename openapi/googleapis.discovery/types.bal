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

public type JsonschemaVariantMap record {
    string '\$ref?;
    string type_value?;
};

# Media upload parameters.
public type RestmethodMediaupload record {
    # MIME Media Ranges for acceptable media uploads to this method.
    string[] accept?;
    # Maximum size of a media upload, such as "1MB", "2GB" or "3TB".
    string maxSize?;
    # Supported upload protocols.
    RestmethodMediauploadProtocols protocols?;
};

public type RestResource record {
    # Methods on this resource.
    record {} methods?;
    # Sub-resources on this resource.
    record {} resources?;
};

# Supports the Resumable Media Upload protocol.
public type RestmethodMediauploadProtocolsResumable record {
    # True if this endpoint supports uploading multipart media.
    boolean multipart?;
    # The URI path to be used for upload. Should be used in conjunction with the basePath property at the api-level.
    string path?;
};

public type JsonSchema record {
    # A reference to another schema. The value of this property is the "id" of another schema.
    string '\$ref?;
    JsonSchema additionalProperties?;
    # Additional information about this property.
    JsonschemaAnnotations annotations?;
    # A description of this object.
    string description?;
    # Values this parameter may take (if it is an enum).
    string[] 'enum?;
    # The descriptions for the enums. Each position maps to the corresponding value in the "enum" array.
    string[] enumDescriptions?;
    # An additional regular expression or key that helps constrain the value. For more details see: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.23
    string format?;
    # Unique identifier for this schema.
    string id?;
    JsonSchema items?;
    # Whether this parameter goes in the query or the path for REST requests.
    string location?;
    # The maximum value of this parameter.
    string maximum?;
    # The minimum value of this parameter.
    string minimum?;
    # The regular expression this parameter must conform to. Uses Java 6 regex format: http://docs.oracle.com/javase/6/docs/api/java/util/regex/Pattern.html
    string pattern?;
    # If this is a schema for an object, list the schema for each property of this object.
    record {} properties?;
    # The value is read-only, generated by the service. The value cannot be modified by the client. If the value is included in a POST, PUT, or PATCH request, it is ignored by the service.
    boolean readOnly?;
    # Whether this parameter may appear multiple times.
    boolean repeated?;
    # Whether the parameter is required.
    boolean required?;
    # The value type for this schema. A list of values can be found here: http://tools.ietf.org/html/draft-zyp-json-schema-03#section-5.1
    string 'type?;
    # In a variant data type, the value of one property is used to determine how to interpret the entire entity. Its value must exist in a map of descriminant values to schema names.
    JsonschemaVariant variant?;
};

# The schema for the response.
public type RestmethodResponse record {
    # Schema ID for the response schema.
    string '\$ref?;
};

# The scope value.
public type RestdescriptionAuthOauth2Scopes record {
    # Description of scope.
    string description?;
};

public type RestDescription record {
    # Authentication information.
    RestdescriptionAuth auth?;
    # [DEPRECATED] The base path for REST requests.
    string basePath?;
    # [DEPRECATED] The base URL for REST requests.
    string baseUrl?;
    # The path for REST batch requests.
    string batchPath?;
    # Indicates how the API name should be capitalized and split into various parts. Useful for generating pretty class names.
    string canonicalName?;
    # The description of this API.
    string description?;
    # Indicate the version of the Discovery API used to generate this doc.
    string discoveryVersion?;
    # A link to human readable documentation for the API.
    string documentationLink?;
    # The ETag for this response.
    string etag?;
    # Enable exponential backoff for suitable methods in the generated clients.
    boolean exponentialBackoffDefault?;
    # A list of supported features for this API.
    string[] features?;
    # Links to 16x16 and 32x32 icons representing the API.
    DirectorylistIcons icons?;
    # The ID of this API.
    string id?;
    # The kind for this response.
    string kind?;
    # Labels for the status of this API, such as labs or deprecated.
    string[] labels?;
    # API-level methods for this API.
    record {} methods?;
    # The name of this API.
    string name?;
    # The domain of the owner of this API. Together with the ownerName and a packagePath values, this can be used to generate a library for this API which would have a unique fully qualified name.
    string ownerDomain?;
    # The name of the owner of this API. See ownerDomain.
    string ownerName?;
    # The package of the owner of this API. See ownerDomain.
    string packagePath?;
    # Common parameters that apply across all apis.
    record {} parameters?;
    # The protocol described by this document.
    string protocol?;
    # The resources in this API.
    record {} resources?;
    # The version of this API.
    string revision?;
    # The root URL under which all API services live.
    string rootUrl?;
    # The schemas for this API.
    record {} schemas?;
    # The base path for all REST requests.
    string servicePath?;
    # The title of this API.
    string title?;
    # The version of this API.
    string 'version?;
    boolean version_module?;
};

public type DirectorylistItems record {
    # The description of this API.
    string description?;
    # A link to the discovery document.
    string discoveryLink?;
    # The URL for the discovery REST document.
    string discoveryRestUrl?;
    # A link to human readable documentation for the API.
    string documentationLink?;
    # Links to 16x16 and 32x32 icons representing the API.
    DirectorylistIcons icons?;
    # The id of this API.
    string id?;
    # The kind for this response.
    string kind?;
    # Labels for the status of this API, such as labs or deprecated.
    string[] labels?;
    # The name of the API.
    string name?;
    # True if this version is the preferred version to use.
    boolean preferred?;
    # The title of this API.
    string title?;
    # The version of the API.
    string 'version?;
};

# Supports uploading as a single HTTP request.
public type RestmethodMediauploadProtocolsSimple record {
    # True if this endpoint supports upload multipart media.
    boolean multipart?;
    # The URI path to be used for upload. Should be used in conjunction with the basePath property at the api-level.
    string path?;
};

# Supported upload protocols.
public type RestmethodMediauploadProtocols record {
    # Supports the Resumable Media Upload protocol.
    RestmethodMediauploadProtocolsResumable resumable?;
    # Supports uploading as a single HTTP request.
    RestmethodMediauploadProtocolsSimple simple?;
};

public type DirectoryList record {
    # Indicate the version of the Discovery API used to generate this doc.
    string discoveryVersion?;
    # The individual directory entries. One entry per api/version pair.
    DirectorylistItems[] items?;
    # The kind for this response.
    string kind?;
};

# In a variant data type, the value of one property is used to determine how to interpret the entire entity. Its value must exist in a map of descriminant values to schema names.
public type JsonschemaVariant record {
    # The name of the type discriminant property.
    string discriminant?;
    # The map of discriminant value to schema to use for parsing..
    JsonschemaVariantMap[] 'map?;
};

# Authentication information.
public type RestdescriptionAuth record {
    # OAuth 2.0 authentication information.
    RestdescriptionAuthOauth2 oauth2?;
};

# OAuth 2.0 authentication information.
public type RestdescriptionAuthOauth2 record {
    # Available OAuth 2.0 scopes.
    record {} scopes?;
};

# Links to 16x16 and 32x32 icons representing the API.
public type DirectorylistIcons record {
    # The URL of the 16x16 icon.
    string x16?;
    # The URL of the 32x32 icon.
    string x32?;
};

# Additional information about this property.
public type JsonschemaAnnotations record {
    # A list of methods for which this property is required on requests.
    string[] required?;
};

public type RestMethod record {
    # Description of this method.
    string description?;
    # Whether this method requires an ETag to be specified. The ETag is sent as an HTTP If-Match or If-None-Match header.
    boolean etagRequired?;
    # The URI path of this REST method in (RFC 6570) format without level 2 features ({+var}). Supplementary to the path property.
    string flatPath?;
    # HTTP method used by this method.
    string httpMethod?;
    # A unique ID for this method. This property can be used to match methods between different versions of Discovery.
    string id?;
    # Media upload parameters.
    RestmethodMediaupload mediaUpload?;
    # Ordered list of required parameters, serves as a hint to clients on how to structure their method signatures. The array is ordered such that the "most-significant" parameter appears first.
    string[] parameterOrder?;
    # Details for all parameters in this method.
    record {} parameters?;
    # The URI path of this REST method. Should be used in conjunction with the basePath property at the api-level.
    string path?;
    # The schema for the request.
    RestmethodRequest request?;
    # The schema for the response.
    RestmethodResponse response?;
    # OAuth 2.0 scopes applicable to this method.
    string[] scopes?;
    # Whether this method supports media downloads.
    boolean supportsMediaDownload?;
    # Whether this method supports media uploads.
    boolean supportsMediaUpload?;
    # Whether this method supports subscriptions.
    boolean supportsSubscription?;
    # Indicates that downloads from this method should use the download service URL (i.e. "/download"). Only applies if the method supports media download.
    boolean useMediaDownloadService?;
};

# The schema for the request.
public type RestmethodRequest record {
    # Schema ID for the request schema.
    string '\$ref?;
    # parameter name.
    string parameterName?;
};
