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
    # Represents API Key `access_token`
    @display {label: "", kind: "password"}
    string accessToken;
    # Represents API Key `api_key`
    @display {label: "", kind: "password"}
    string apiKey;
    # Represents API Key `api_secret`
    @display {label: "", kind: "password"}
    string apiSecret;
|};

# Category
public type PostObject record {
    # Is Julia Flagged
    boolean isJuliaFlagged?;
    # Is Flagged
    boolean isFlagged?;
    # Forum
    string forum?;
    # Is Default
    decimal parent?;
    # Author
    Author author?;
    # Is Approved
    boolean isApproved?;
    # Dislikes
    decimal dislikes?;
    # Raw message
    string raw_message?;
    # Post ID
    string id?;
    # Thread
    string thread?;
    # Points
    decimal points?;
    # Created At
    string createdAt?;
    # Is Edited
    boolean isEdited?;
    # Message
    string message?;
    # Is Highlighted
    boolean isHighlighted?;
    # IP Address
    string ipAddress?;
    # Is Spam
    boolean isSpam?;
    # Is Deleted
    boolean isDeleted?;
    # Likes
    decimal likes?;
};

# An object with a single property response which is a Category object.
public type Category record {
    # Code
    decimal code?;
    # Category
    CategoryObject response?;
};

# Thread
public type ThreadObject record {
    # Category ID
    string category?;
    # Reactions
    decimal reactions?;
    # Forum
    string forum?;
    # Title
    string title?;
    # Dislikes
    decimal dislikes?;
    # Is Deleted
    boolean isDeleted?;
    # Author
    string author?;
    # UserScore
    decimal userScore?;
    # Thread ID
    string id?;
    # Is Closed
    boolean isClosed?;
    # Posts
    decimal posts?;
    # Link
    string link?;
    # Likes
    decimal likes?;
    # Message
    string message?;
    # IP Address
    string ipAddress?;
    # Slug
    string slug?;
    # Created At
    string createdAt?;
};

# An object with a single property response which is an array of Category objects.
public type Categories record {
    # Cursor
    Cursor cursor?;
    # Code
    decimal code?;
    # An array of Category objects.
    CategoryObject[] response?;
};

# An object with a single property response which is a Post object.
public type Post record {
    # Code
    decimal code?;
    # Category
    PostObject response?;
};

# An object with a single property response which is a Thread object.
public type DisqusThread record {
    # Code
    decimal code?;
    # Thread
    ThreadObject response?;
};

# An object with a single property response which is an array of Post objects.
public type Posts record {
    # Cursor
    Cursor cursor?;
    # Code
    decimal code?;
    # An array of Post objects.
    PostObject[] response?;
};

# Cursor
public type Cursor record {
    # Prev
    string prev?;
    # Has next
    boolean hasNext?;
    # Next
    string next?;
    # Has prev
    boolean hasPrev?;
    # Total
    string total?;
    # ID
    string id?;
    # More
    boolean more?;
};

# Avatar
public type Avatar record {
    # Permalink
    string permalink?;
    # Cache
    string cache?;
};

# An object with a single property response which is a Forum object.
public type Forum record {
    # Code
    decimal code?;
    # Forum
    ForumObject response?;
};

# Forum
public type ForumObject record {
    # Forum ID
    string id?;
    # Forum name
    string name?;
    # Founder
    string founder?;
    # Favicon
    Favicon favicon?;
};

# An object with a single property response which is an array of Thread objects.
public type Threads record {
    # Cursor
    Cursor cursor?;
    # Code
    decimal code?;
    # An array of Thread objects.
    ThreadObject[] response?;
};

# Author
public type Author record {
    # Username
    string username?;
    # About
    string about?;
    # Name
    string name?;
    # Url
    string url?;
    # Is Following
    boolean isFollowing?;
    # Is Followed By
    boolean isFollowedBy?;
    # Profile Url
    string profileUrl?;
    # Avatar
    Avatar avatar?;
    # Author ID
    string id?;
    # Is Anonymous
    boolean isAnonymous?;
    # Email
    string email?;
};

# Category
public type CategoryObject record {
    # Category ID
    string id?;
    # Forum
    string forum?;
    # Order
    decimal 'order?;
    # Is Default
    boolean isDefault?;
    # Title
    string title?;
};

# Favicon
public type Favicon record {
    # Permalink
    string permalink?;
    # Cache
    string cache?;
};
