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
    string apiKey;
|};

public type Response record {
    Gif data?;
    # The Meta Object contains basic information regarding the request, whether it was successful, and the response given by the API.  Check `responses` to see a description of types of response codes the API might give you under different cirumstances.
    Meta meta?;
};

# The Meta Object contains basic information regarding the request, whether it was successful, and the response given by the API.  Check `responses` to see a description of types of response codes the API might give you under different cirumstances.
public type Meta record {
    # HTTP Response Message
    string msg?;
    # A unique ID paired with this response from the API.
    string response_id?;
    # HTTP Response Code
    int status?;
};

# The Pagination Object contains information relating to the number of total results available as well as the number of results fetched and their relative positions.
public type Pagination record {
    # Total number of items returned.
    int count?;
    # Position in pagination.
    int offset?;
    # Total number of items available.
    int total_count?;
};

public type PaginatedResponse record {
    Gif[] data?;
    # The Meta Object contains basic information regarding the request, whether it was successful, and the response given by the API.  Check `responses` to see a description of types of response codes the API might give you under different cirumstances.
    Meta meta?;
    # The Pagination Object contains information relating to the number of total results available as well as the number of results fetched and their relative positions.
    Pagination pagination?;
};

# The User Object contains information about the user associated with a GIF and URLs to assets such as that user's avatar image, profile, and more.
public type User record {
    # The URL for this user's avatar image.
    string avatar_url?;
    # The URL for the banner image that appears atop this user's profile page.
    string banner_url?;
    # The display name associated with this user (contains formatting the base username might not).
    string display_name?;
    # The URL for this user's profile.
    string profile_url?;
    # The Twitter username associated with this user, if applicable.
    string twitter?;
    # The username associated with this user.
    string username?;
};

public type Gif record {
    # The unique bit.ly URL for this GIF
    string bitly_url?;
    # Currently unused
    string content_url?;
    # The date this GIF was added to the GIPHY database.
    string create_datetime?;
    # A URL used for embedding this GIF
    string embded_url?;
    # An array of featured tags for this GIF (Note: Not available when using the Public Beta Key)
    string[] featured_tags?;
    # This GIF's unique ID
    string id?;
    GifImages images?;
    # The creation or upload date from this GIF's source.
    string import_datetime?;
    # The MPAA-style rating for this content. Examples include Y, G, PG, PG-13 and R
    string rating?;
    # The unique slug used in this GIF's URL
    string slug?;
    # The page on which this GIF was found
    string 'source?;
    # The URL of the webpage on which this GIF was found.
    string source_post_url?;
    # The top level domain of the source URL.
    string source_tld?;
    # An array of tags for this GIF (Note: Not available when using the Public Beta Key)
    string[] tags?;
    # The date on which this gif was marked trending, if applicable.
    string trending_datetime?;
    # Type of the gif. By default, this is almost always gif
    string 'type?;
    # The date on which this GIF was last updated.
    string update_datetime?;
    # The unique URL for this GIF
    string url?;
    # The User Object contains information about the user associated with a GIF and URLs to assets such as that user's avatar image, profile, and more.
    User user?;
    # The username this GIF is attached to, if applicable
    string username?;
};

public type Image record {
    # The number of frames in this GIF.
    string frames?;
    # The height of this GIF in pixels.
    string height?;
    # The URL for this GIF in .MP4 format.
    string mp4?;
    # The size in bytes of the .MP4 file corresponding to this GIF.
    string mp4_size?;
    # The size of this GIF in bytes.
    string size?;
    # The publicly-accessible direct URL for this GIF.
    string url?;
    # The URL for this GIF in .webp format.
    string webp?;
    # The size in bytes of the .webp file corresponding to this GIF.
    string webp_size?;
    # The width of this GIF in pixels.
    string width?;
};

public type GifImages record {
    record {*Image;} downsized?;
    record {*Image;} downsized_large?;
    record {*Image;} downsized_medium?;
    record {*Image;} downsized_small?;
    record {*Image;} downsized_still?;
    record {*Image;} fixed_height?;
    record {*Image;} fixed_height_downsampled?;
    record {*Image;} fixed_height_small?;
    record {*Image;} fixed_height_small_still?;
    record {*Image;} fixed_height_still?;
    record {*Image;} fixed_width?;
    record {*Image;} fixed_width_downsampled?;
    record {*Image;} fixed_width_small?;
    record {*Image;} fixed_width_small_still?;
    record {*Image;} fixed_width_still?;
    record {*Image;} looping?;
    record {*Image;} original?;
    record {*Image;} original_still?;
    record {*Image;} preview?;
    record {*Image;} preview_gif?;
};
