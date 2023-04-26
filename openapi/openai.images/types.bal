// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

public type CreateImageEditRequest record {
    # The image to edit. Must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
    record {byte[] fileContent; string fileName;} image;
    # An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.
    record {byte[] fileContent; string fileName;} mask?;
    # A text description of the desired image(s). The maximum length is 1000 characters.
    string prompt;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

public type CreateImageRequest record {
    # A text description of the desired image(s). The maximum length is 1000 characters.
    string prompt;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};

public type ImagesResponse_data record {
    string url?;
    string b64_json?;
};

public type ImagesResponse record {
    int created;
    ImagesResponse_data[] data;
};

public type CreateImageVariationRequest record {
    # The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
    record {byte[] fileContent; string fileName;} image;
    # The number of images to generate. Must be between 1 and 10.
    int? n = 1;
    # The size of the generated images. Must be one of `256x256`, `512x512`, or `1024x1024`.
    string? size = "1024x1024";
    # The format in which the generated images are returned. Must be one of `url` or `b64_json`.
    string? response_format = "url";
    # A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices/end-user-ids).
    string user?;
};
