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
    string refreshUrl = "https://medium.com/v1/tokens";
|};

# Container object for user info
public type UserResponse record {
    # Represents a user
    User data?;
};

# Represents a user
public type User record {
    # A unique identifier for the user.
    string id?;
    # The user’s username on Medium.
    string username?;
    # The user’s name on Medium.
    string name?;
    # The URL to the user’s profile on Medium
    string url?;
    # The URL to the user’s avatar on Medium
    string imageUrl?;
};

# list of contributors for a given publication
public type ContributorResponse record {
    Contributor[] data?;
};

# Details of Post
public type PostDetails record {
    # A unique identifier for the post.
    string id?;
    # The post’s title
    string title?;
    # The userId of the post’s author
    string authorId?;
    # The post’s tags
    string[] tags?;
    # The URL of the post on Medium
    string url?;
    # The canonical URL of the post. If canonicalUrl was not specified in the creation of the post, this field will not be present.
    string canonicalUrl?;
    # The publish status of the post.
    string publishStatus?;
    # The post’s published date. If created as a draft, this field will not be present.
    int publishedAt?;
    # The license of the post.
    string license?;
    # The URL to the license of the post.
    string licenseUrl?;
};

public type Post record {
    # The title of the post. Note that this title is used for SEO and when rendering the post as a listing, but will not appear in the actual post—for that, the title must be specified in the content field as well. Titles longer than 100 characters will be ignored. In that case, a title will be synthesized from the first content in the post when it is published.
    string title;
    # The format of the "content" field. There are two valid values, "html", and "markdown"
    string contentFormat;
    # The body of the post, in a valid, semantic, HTML fragment, or Markdown. Further markups may be supported in the future. For a full list of accepted HTML tags, see here. If you want your title to appear on the post page, you must also include it as part of the post content.
    string content;
    # Tags to classify the post. Only the first three will be used. Tags longer than 25 characters will be ignored.
    string[] tags?;
    # The original home of this content, if it was originally published elsewhere.
    string canonicalUrl?;
    # The status of the post. Valid values are `public`, `draft`, or `unlisted`. The default is `public`.
    string publishStatus = "public";
    # The license of the post. Valid values are `all-rights-reserved`, `cc-40-by`, `cc-40-by-sa`, `cc-40-by-nd`, `cc-40-by-nc`, `cc-40-by-nc-nd`, `cc-40-by-nc-sa`, `cc-40-zero`, `public-domain`. The default is `all-rights-reserved`.
    string license = "all-rights-reserved";
};

# Publications provide a way for authors to work collaboratively within a common narrative framework, brand or point of view.
public type Publication record {
    # A unique identifier for the publication.
    string id?;
    # The publication’s name on Medium.
    string name?;
    # Short description of the publication
    string description?;
    # The URL to the publication’s homepage
    string url?;
    # The URL to the publication’s image/logo
    string imageUrl?;
};

# Contributor
public type Contributor record {
    # An ID for the publication. This can be lifted from response of publications above
    string publicationId?;
    # A user ID of the contributor.
    string userId?;
    # Role of the user identified by userId in the publication identified by `publicationId`. *editor* or *writer*
    string role?;
};

# Container object for publication list.
public type PublicationResponse record {
    Publication[] data?;
};

# Container object for post info
public type PostResponse record {
    # Details of Post
    PostDetails data?;
};
