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
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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
    string tokenUrl = "https://api.vimeo.com/oauth/access_token";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.vimeo.com/oauth/access_token";
|};

public type CategoryArr Category[];

public type ChannelArr Channel[];

public type GroupArr Group[];

public type VideoArr Video[];

public type UserArr User[];

public type TagArr Tag[];

public type CommentArr Comment[];

public type CreditArr Credit[];

public type PictureArr Picture[];

public type TextTrackArr TextTrack[];

public type ContentRatingArr ContentRating[];

public type CreativeCommonsArr CreativeCommons[];

public type LanguageArr Language[];

public type AlbumArr Album[];

public type Activity31Arr Activity31[];

public type OnDemandPageArr OnDemandPage[];

public type PortfolioArr Portfolio[];

public type PresetsArr Presets[];

public type ProjectArr Project[];

public type OnDemandGenreArr OnDemandGenre[];

public type OnDemandRegionArr OnDemandRegion[];

public type OnDemandSeasonArr OnDemandSeason[];

public type DomainArr Domain[];

public type MeondemandpagesBuyPrice record {
    # The purchase price of this video in AUD.
    decimal AUD?;
    # The purchase price of this video in CAD.
    decimal CAD?;
    # The purchase price of this video in CHF.
    decimal CHF?;
    # The purchase price of this video in DKK.
    decimal DKK?;
    # The purchase price of this video in EUR.
    decimal EUR?;
    # The purchase price of this video in GBP.
    decimal GBP?;
    # The purchase price of this video in JPY.
    decimal JPY?;
    # The purchase price of this video in KRW.
    decimal KRW?;
    # The purchase price of this video in NOK.
    decimal NOK?;
    # The purchase price of this video in PLN.
    decimal PLN?;
    # The purchase price of this video in SEK.
    decimal SEK?;
    # The purchase price of this video in USD when `type` is `film`, or the purchase price of the entire collection in USD when `type` is `series`.
    decimal USD?;
};

# Information about the user's Like interactions with this video.
public type OndemandvideoMetadataInteractionsLikes record {
    # Whether the user has liked this video.
    boolean added;
    # The time in ISO 8601 format when the user liked this video.
    string added_time;
    # The URI for the user to like this video.
    string uri;
};

# Information about the user's usage for the current period.
public type UserUploadQuotaPeriodic record {
    # The number of bytes remaining in your upload quota for the current period.
    decimal? free;
    # The total number of bytes that you can upload per period.
    decimal? max;
    # The time in ISO 8601 format when your upload quota resets.
    string? reset_date;
    # The number of bytes that you've already uploaded against your quota in the current period.
    decimal? used;
};

public type UserWebsites record {
    # The website's description.
    string? description;
    # The URL of the website.
    string link;
    # The name of the website.
    string? name;
};

public type MevideosPrivacy record {
    # Whether a user can add the video to an album, channel, or group.
    boolean add?;
    # The privacy level required to comment on the video.
    string comments?;
    # Whether a user can download the video. Not available to users with a Basic membership
    boolean download?;
    # The video's embed settings. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for details on adding and removing domains.
    string embed?;
    # The video's privacy setting. When privacy is `users`, `application/json` is the only valid content type. Basic users can't set privacy to `unlisted`.
    string view?;
};

# A list of resource URIs related to the video.
public type VideoMetadataConnections record {
    # Information about the comments on this video.
    VideoMetadataConnectionsComments comments;
    # Information about the users credited in this video.
    VideoMetadataConnectionsCredits? credits;
    # Information about the users who have liked this video.
    VideoMetadataConnectionsLikes likes;
    # Information about this video's ondemand data.
    VideoMetadataConnectionsOndemand ondemand;
    # Information about this video's thumbnails.
    VideoMetadataConnectionsPictures pictures;
    # The DRM playback status connection for this video.
    VideoMetadataConnectionsPlayback playback;
    # The recommendations for this video.
    VideoMetadataConnectionsRecommendations? recommendations;
    # Related content for this video.
    VideoMetadataConnectionsRelated? related;
    # Information about the video's season.
    VideoMetadataConnectionsSeason season;
    # Information about this video's text tracks.
    VideoMetadataConnectionsTexttracks texttracks;
    # Information about this video's VOD trailer.
    VideoMetadataConnectionsTrailer trailer;
    # Information about the user privacy of this video, if the video privacy is `users`.
    VideoMetadataConnectionsUsersWithAccess users_with_access;
    # Information about the versions of this video.
    VideoMetadataConnectionsVersions versions;
};

public type OnDemandRegion record {
    # The ISO 3166-1 alpha-2 code for this country.
    string country_code;
    # The descriptive name of this country.
    string country_name;
    # The region container's relative URI.
    string uri;
};

# The video version's metadata.
public type VideoversionsMetadata record {
    VideoversionsMetadataConnections connections;
};

public type OndemandpageEpisodesBuy record {
    # Whether all the videos on this On Demand page can be purchased as a whole.
    boolean active;
    # The default price to buy an episode.
    decimal? price;
};

public type PlayProgressive record {
    # The time in ISO 8601 format when this video file was created.
    string created_time;
    # The FPS of the video file.
    decimal fps;
    # The height in pixels of the video.
    decimal? height;
    # The direct link to this video file.
    string link;
    # The time in ISO 8601 format when the link to this video file expires.
    string link_expiration_time;
    # The URLs for logging events.
    record {} log?;
    # The MD5 hash of the video file.
    string md5;
    # The file size in bytes of this video.
    decimal? size;
    # The type of the video file:
    # 
    # Option descriptions:
    #  * `source` - The video is a source file.
    #  * `video/mp4` - The video is in MP4 format.
    #  * `video/webm` - The video is in WebM format.
    #  * `vp6/x-video` - The video is in VP6 format.
    string? 'type;
    # The width in pixels of the video.
    decimal? width;
};

# Information about this season.
public type OndemandvideoMetadataConnectionsSeason record {
    # The name of the season on this connection.
    string name;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type OndemandpagesondemandIdvideosvideoIdBuy record {
    OndemandpagesondemandIdvideosvideoIdBuyPrice price?;
};

# The group's privacy settings.
public type GroupPrivacy record {
    # Who can comment on the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can comment on the group.
    #  * `members` - Only members can comment on the group.
    string comment;
    # Who can invite new members to the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can invite new members to join.
    #  * `members` - Only group members can invite new members to join.
    string invite;
    # Who can join the group:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can join the group.
    #  * `members` - Only people with a Vimeo account can join the group.
    string 'join;
    # Who can add videos to the group:
    # 
    # Option descriptions:
    #  * `all` - Anyone can add videos to the group.
    #  * `members` - Only group members can add videos to the group.
    string videos;
    # Who can view the group:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the group.
    #  * `members` - Only group members can view the group.
    string view;
};

public type PictureSizes record {
    # The height of the image.
    decimal? height;
    # The direct link to the image.
    string link;
    # The direct link to the image with a play button overlay.
    string link_with_play_button?;
    # The width of the image.
    decimal width;
};

# User actions that have involved the group. This data requires a bearer token with the `private` scope.
public type GroupMetadataInteractions record {
    # An action indicating that someone has joined the group. This data requires a bearer token with the `private` scope.
    GroupMetadataInteractionsJoin 'join;
};

public type Endpoint record {
    # All HTTP methods permitted on this endpoint.
    string[] methods;
    # The path section of the URL, which, when appended to the API host `https:///api.vimeo.com`, builds a full API endpoint.
    string path;
};

public type Picture record {
    # Whether this picture is the active picture for its parent resource.
    boolean active;
    # The upload URL for the picture. This field appears when you create the picture resource for the first time.
    string link?;
    # The picture's resource key string.
    string resource_key;
    # An array containing reference information about all available image files.
    PictureSizes[] sizes;
    # The type of the picture:
    # 
    # Option descriptions:
    #  * `caution` - An image that is appropriate for all ages.
    #  * `custom` - A custom image for the video.
    #  * `default` - The default image for the video.
    string 'type;
    # The picture's URI.
    string uri;
};

public type OndemandpagePreorder record {
    # Whether this page is available for preorder.
    boolean active;
    # The time in ISO 8601 format when the preorder was cancelled.
    string cancel_time;
    # The time in ISO 8601 format when the preorder was released to the public.
    string publish_time;
    # The time in ISO 8601 format when the preorder started.
    string time;
};

# The list of resource URIs related to the user.
public type UserMetadataConnections record {
    # Information about the albums created by this user.
    UserMetadataConnectionsAlbums albums;
    # Information about the appearances of this user in other videos.
    UserMetadataConnectionsAppearances appearances;
    # Information on the users that the current user has blocked. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsBlock block;
    # Information about this user's followed categories.
    UserMetadataConnectionsCategories categories;
    # Information about this user's subscribed channels.
    UserMetadataConnectionsChannels channels;
    # Information about this user's feed.
    UserMetadataConnectionsFeed feed;
    # Information about this user's folders.
    UserMetadataConnectionsFolders folders;
    # Information about the user's followers.
    UserMetadataConnectionsFollowers followers;
    # Information about the users that the current user is following.
    UserMetadataConnectionsFollowing following;
    # Information about the groups created by this user.
    UserMetadataConnectionsGroups groups;
    # Information about the videos that this user has liked.
    UserMetadataConnectionsLikes likes;
    # Information about the channels that this user moderates.
    UserMetadataConnectionsModeratedChannels moderated_channels;
    # Information about this user's portraits.
    UserMetadataConnectionsPictures pictures;
    # Information about this user's portfolios.
    UserMetadataConnectionsPortfolios portfolios;
    # A collection of recommended channels for the current user to follow. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsRecommendedChannels recommended_channels;
    # A Collection of recommended users for the current user to follow. This data requires a bearer token with the `private` scope.
    UserMetadataConnectionsRecommendedUsers recommended_users;
    # Information about the videos that have been shared with this user.
    UserMetadataConnectionsShared shared;
    # Information about the videos uploaded by this user.
    UserMetadataConnectionsVideos videos;
    # Information about the videos that this user has watched.
    UserMetadataConnectionsWatchedVideos watched_videos;
    # Information about the videos that this user wants to watch later.
    UserMetadataConnectionsWatchlater watchlater;
};

# A list of resource URIs related to the album.
public type PortfolioMetadataConnections record {
    # Information about the videos contained within this portfolio.
    PortfolioMetadataConnectionsVideos videos;
};

public type MeondemandpagesEpisodesRentPrice record {
    # The default price to rent an episode. This field is applicable only when `type` is `series`. *Required if `episodes.rent.active` is true.
    decimal USD?;
};

public type OndemandPagesBody record {
    # An array of accepted currencies.
    # 
    # Option descriptions:
    #  * `AUD` - Australian Dollar
    #  * `CAD` - Canadian Dollar
    #  * `CHF` - Swiss Franc
    #  * `DKK` - Danish Krone
    #  * `EUR` - Euro
    #  * `GBP` - British Pound
    #  * `JPY` - Japanese Yen
    #  * `KRW` - South Korean Won
    #  * `NOK` - Norwegian Krone
    #  * `PLN` - Polish Zloty
    #  * `SEK` - Swedish Krona
    #  * `USD` - US Dollar
    string accepted_currencies?;
    MeondemandpagesBuy buy?;
    # One or more ratings, either as a comma-separated list or as a JSON array depending on the request format.
    string content_rating;
    # The description of the On Demand page.
    string description;
    # The custom domain of the On Demand page.
    string domain_link?;
    MeondemandpagesEpisodes episodes?;
    # The custom string to use in this On Demand page's Vimeo URL.
    string link?;
    # The name of the On Demand page.
    string name;
    MeondemandpagesRent rent?;
    MeondemandpagesSubscription subscription?;
    # The type of On Demand page.
    string 'type;
};

public type UserIdVideosBody record {
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The title of the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    MevideosPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
    MevideosUpload upload;
};

public type VideoIdCreditsBody1 record {
    # The email address of the credited person.
    string email;
    # The name of the credited person.
    string name;
    # The role of the credited person.
    string role;
    # The URI of the Vimeo user who should be given credit in this video.
    string user_uri;
};

# Information about the channels related to this category.
public type CategoryMetadataConnectionsChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A list of resource URIs related to the channel.
public type ChannelMetadataInteractions record {
    # An action indicating that the authenticated user is the owner of the channel and may therefore add other users as channel moderators. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsAddModerators add_moderators;
    # When a channel appears in the context of adding or removing a video from it (`/videos/{video_id}/available_channels`), include information about adding or removing the video. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsAddTo? add_to;
    # An action indicating if the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsFollow follow;
    # An action indicating that the authenticated user is a moderator of the channel and may therefore add or remove videos from the channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataInteractionsModerateVideos moderate_videos;
};

public type OndemandgenreMetadata record {
    # A collection of information connected to this resource.
    OndemandgenreMetadataConnections connections;
};

public type MevideosEmbedLogosCustom record {
    # Show or hide your custom logo.
    boolean active?;
    # The URL that loads when the user clicks your custom logo.
    string link?;
    # Whether always to show the custom logo or to hide it after time with the rest of the UI.
    boolean sticky?;
};

# Subscription information for an On Demand video.
public type VideoMetadataInteractionsSubscribe record {
    # Whether the video has DRM.
    boolean drm?;
    # The time in ISO 8601 format when the subscription expires.
    string expires_time?;
    # The tine in ISO 8601 format when the subscription was purchased.
    string purchase_time?;
    # The stream type.
    string 'stream?;
};

public type OnDemandPromotion record {
    # The type of access that this promotion grants:
    # 
    # Option descriptions:
    #  * `default` - Grants discounts on existing product offerings.
    #  * `vip` - Grants free access either to VOD content before it is released or to access types that aren't part of the existing product offerings.
    string access_type;
    # The type of discount for which this promotion can be used.
    # 
    # Option descriptions:
    #  * `dollars` - The discount is a certain fixed amount.
    #  * `free` - The discount is the full purchase price. VIP access promotions always use this discount type.
    #  * `percent` - The discount is a certain percentage of the full price.
    string discount_type;
    # Whether this promotion grants download access to On Demand content.
    boolean download;
    # The prefix string for batch codes, or the null value for single codes.
    string? label;
    # The video's metadata.
    OndemandpromotionMetadata metadata;
    # The percentage amount that is deducted from the product price.
    decimal percent_off;
    # The type of product to which this promotion can be applied. Only `buy` and `rent` are available for the VIP access type:
    # 
    # Option descriptions:
    #  * `any` - The promotion can be applied to any product.
    #  * `buy` - The promotion can be applied to a buyable single video.
    #  * `buy_episode` - The promotion can be applied to a buyable single episode.
    #  * `rent` - The promotion can be applied to a rentable single video.
    #  * `rent_episode` - The promotion can be applied to a rentable single episode.
    #  * `subscribe` - The promotion can be applied to a subscription.
    string product_type;
    # The amount of time that the user has access to the VOD content after redeeming a promo code.
    # 
    # Option descriptions:
    #  * `1_week` - Access lasts for one week.
    #  * `1_year` - Access lasts for one year.
    #  * `24_hour` - Access lasts for 24 hours.
    #  * `30_days` - Access lasts for 30 days.
    #  * `3_month` - Access lasts for 3 months.
    #  * `48_hour` - Access lasts for 48 hours.
    #  * `6_month` - Access lasts for 6 months.
    #  * `72_hour` - Access lasts for 72 hours.
    string? stream_period;
    # The total amount of times that this promotion can be used.
    decimal total;
    # The way in which this promotion can generate promo codes:
    # 
    # Option descriptions:
    #  * `batch` - Provides many unique promo codes that can only be used once each.
    #  * `batch_prefix` - Similar to `batch`, except that all codes have a similar prefix string. This mode is deprecated, yet it may still appear for some users.
    #  * `single` - Provides a single promo code with many uses.
    string 'type;
    # The promotion's canonical relative URI.
    string uri;
};

public type ChannelIdModeratorsBody1 record {
    # The URI of the user to add as a moderator.
    string user_uri;
};

# Information about the albums created by this user.
public type UserMetadataConnectionsAlbums record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of albums on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A list of resource URIs related to the activity.
public type Activity31MetadataConnections record {
    # Related content for this activity.
    Activity31MetadataConnectionsRelated? related;
};

# Information about this user's subscribed channels.
public type UserMetadataConnectionsChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type PicturesPosterIdBody record {
    # Whether to make this picture the active picture.
    boolean active?;
};

# Information about the groups related to this category.
public type CategoryMetadataConnectionsGroups record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of groups on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the comments associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsComments record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of comments on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the video's season.
public type VideoMetadataConnectionsSeason record {
    # The name of this season.
    string name;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type ChannelsChannelIdBody record {
    # The description of the channel.
    string description?;
    # The link to access the channel. You can use a custom name in the URL in place of a numeric channel ID, as in `/channels/{url_custom}`. Submitting `""` for this field removes the link alias.
    string link?;
    # The name of the channel.
    string name?;
    # The privacy level of the channel.
    string privacy?;
};

public type AlbumsAlbumIdBody1 record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # The custom domain a user has selected for their album.
    string? domain?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name?;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
    # The custom Vimeo URL a user has selected for their album.
    string? url?;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain?;
};

public type Project record {
    # The time in ISO 8601 format when the project was created.
    string created_time;
    # The project's metadata.
    ProjectMetadata metadata;
    # The time in ISO 8601 format when the project was last modified.
    string modified_time;
    # The name of the folder.
    string name;
    # The resource key string of the project.
    string resource_key;
    # The URI of the project.
    string uri;
    # The owner of the project.
    User user;
};

public type MevideosRatingsMpaa record {
    # The reason for the video's MPAA rating.
    # 
    # Option descriptions:
    #  * `at` - Adult themes
    #  * `bn` - Brief nudity
    #  * `n` - Nudity
    #  * `sl` - Strong language
    #  * `ss` - Sexual situations
    #  * `v` - Violence
    string reason?;
};

public type AuthError record {
    # The name of the error.
    string 'error;
    # The description of the error.
    string error_description;
};

public type TexttracksTexttrackIdBody record {
    # Whether the text track is active, meaning that it appears in the player. Only one text track per language, and type, can be active.
    boolean active?;
    # The language of the text track. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language?;
    # The name of the text track.
    string name?;
    # The text track type.
    string 'type?;
};

public type ContentRating record {
    # The code that uniquely identifies this content rating:
    # 
    # Option descriptions:
    #  * `drugs` - Drug or alcohol use.
    #  * `language` - Profanity or sexually suggestive content.
    #  * `nudity` - Nudity.
    #  * `safe` - Suitable for all audiences.
    #  * `unrated` - No rating.
    #  * `violence` - Violent or graphic content.
    string code;
    # The description of this content rating.
    string name;
    # The canonical relative URI of the content rating.
    string? uri;
};

public type VideosVideoIdBody1 record {
    # A list of values describing the content in this video. You can find the full list in the [`/contentratings`](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The new description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The new title for the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    VideosvideoIdPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
};

public type Group record {
    # The time in ISO 8601 format when the group was created.
    string created_time;
    # The group's description.
    string? description;
    # The link to the group.
    string link;
    # Metadata about the group.
    GroupMetadata metadata;
    # The time in ISO 8601 format when the group was last modified.
    string modified_time;
    # The group's display name.
    string name;
    # The active picture for this group.
    Picture pictures;
    # The group's privacy settings.
    GroupPrivacy privacy;
    # The resource key of the group.
    string resource_key;
    # The canonical relative URI of this group.
    string uri;
    # The owner of the group.
    User user?;
};

# A list of resource URIs related to the video.
public type VideoMetadataInteractions record {
    # The Buy interaction for a On Demand video.
    VideoMetadataInteractionsBuy? buy;
    # When a video is referenced by a channel URI, if the user is a moderator of the channel, include information about removing the video from the channel.
    VideoMetadataInteractionsChannel? channel;
    # Information about whether the authenticated user has liked this video.
    VideoMetadataInteractionsLike like;
    # The Rent interaction for an On Demand video.
    VideoMetadataInteractionsRent? rent;
    # Information about where and how to report a video.
    VideoMetadataInteractionsReport report;
    # Subscription information for an On Demand video.
    VideoMetadataInteractionsSubscribe? subscribe?;
    # Information about removing this video from the user's list of watched videos.
    VideoMetadataInteractionsWatched watched;
    # Information about whether this video appears on the authenticated user's Watch Later list.
    VideoMetadataInteractionsWatchlater watchlater;
};

# An object containing information about how the authenticated user can interact with this On Demand page.
public type OndemandvideoInteractions record {
    # Information about how the authenticated user can interact with the connection to the video's On Demand page.
    OndemandvideoInteractionsPage page;
};

# Information about this video's VOD trailer.
public type VideoMetadataConnectionsTrailer record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The trailer connection resource key.
    string resource_key;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about whether this video appears on the authenticated user's Watch Later list.
public type VideoMetadataInteractionsWatchlater record {
    # Whether the user has added the video to their Watch later list.
    boolean added;
    # The time in ISO 8601 format when the user added the video to their Watch Later list.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type ChannelsBody record {
    # The description of the channel.
    string description?;
    # The link to access the channel. You can use a custom name in the URL in place of a numeric channel ID, as in `/channels/{url_custom}`.
    string link?;
    # The name of the channel.
    string name;
    # The privacy level of the channel.
    string privacy;
};

# Information about the likes associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsLikes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of likes on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type OndemandseasonMetadata record {
    OndemandseasonMetadataConnections connections;
};

# The video's metadata.
public type VideoMetadata record {
    # A list of resource URIs related to the video.
    VideoMetadataConnections connections;
    # A list of resource URIs related to the video.
    VideoMetadataInteractions interactions;
};

public type VideoIdTagsBody record {
    # The name of the tag to apply. See our documentation on [batch requests](https://developer.vimeo.com/api/common-formats#batch-requests) for more information.
    string name;
    # The page number of the results to show.
    decimal page?;
    # The number of items to show on each page of results, up to a maximum of 100.
    decimal per_page?;
};

# Information about the user's followers.
public type UserMetadataConnectionsFollowers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of followers on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the user privacy of this video, if the video privacy is `users`.
public type VideoMetadataConnectionsUsersWithAccess record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MeondemandpagesBuy record {
    # Whether the Buy action is active. *Required if `rent.active` is false.
    boolean active?;
    # Whether people who buy the video can download it. To use this field, `type` must be `film`.
    boolean download?;
    MeondemandpagesBuyPrice price?;
};

public type PurchaseInteraction record {
    # Information on purchasing this video.
    PurchaseinteractionBuy? buy?;
    # Information on renting this video.
    record {} rent?;
    # Information on subscribing to this video.
    PurchaseinteractionSubscribe? subscribe?;
};

public type OndemandpageMetadataConnectionsMetadataConnections record {
    # Information about the comments associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsComments comments;
    # Information about the genres associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsGenres genres;
    # Information about the likes associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsLikes likes;
    # Information about the pictures associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsPictures pictures;
    # Information about the seasons associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsSeasons seasons;
    # Information about the videos associated with this page.
    OndemandpageMetadataConnectionsMetadataConnectionsVideos videos;
};

public type VideosVideoIdBody record {
    OndemandpagesondemandIdvideosvideoIdBuy buy?;
    # The position of this video in the On Demand collection.
    decimal position?;
    # The video release year.
    decimal release_year?;
    OndemandpagesondemandIdvideosvideoIdRent rent?;
    # The type of video that you are adding to the On Demand page.
    string 'type;
};

public type VideoIdCommentsBody record {
    # The text of the comment.
    string text;
};

public type MeBody record {
    # The user's bio.
    string bio?;
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint. You must provide a comma-separated list if you are using a query string or an array if you are using JSON.
    string[] content_filter?;
    # The user's custom Vimeo URL slug.
    string link?;
    # The user's location.
    string location?;
    # The user's display name.
    string name?;
    # The default password for all future videos that this user uploads. To use this field, the `videos.privacy.view` field must be `password`.
    string password?;
    MeVideos videos?;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add videos. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddVideos record {
    # An array of HTTP methods allowed on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Interactions for On Demand pages that are in this genre.
public type OndemandgenreInteractionsPage record {
    # Whether this On Demand genre was added.
    boolean added;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The URI to access the On Demand page.
    string uri;
};

# A standard connection object indicating how to get all the videos in this project.
public type ProjectMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information related to the block status of this user.
public type UserMetadataInteractionsBlock record {
    # Whether a user is blocking the current user.
    boolean added;
    # The time in ISO 8601 format when the block occurred, or the null value if no block exists.
    string? added_time;
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The URI to block or unblock the user.
    string uri;
};

public type OndemandpageMetadataConnectionsMetadata record {
    OndemandpageMetadataConnectionsMetadataConnections connections;
};

# Information provided to channel moderators about which users they have specifically permitted to access a private channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataConnectionsPrivacyUsers record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about this user's folders.
public type UserMetadataConnectionsFolders record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of folders on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The DRM playback status connection for this video.
public type VideoMetadataConnectionsPlayback record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MeondemandpagesSubscription record {
    MeondemandpagesSubscriptionMonthly monthly?;
};

public type VideoSpatialDirectorTimeline record {
    # The director timeline pitch, from -90 (minimum) to 90 (maximum).
    decimal pitch?;
    # The director timeline roll.
    decimal roll?;
    # The director timeline time code.
    decimal time_code?;
    # The director timeline yaw, from 0 (minimum) to 360 (maximum).
    decimal yaw?;
};

public type ApiApp record {
    # The name of the API app.
    string name;
    # The canonical URI of the API app.
    string uri;
};

public type CreditsCreditIdBody record {
    # The name of the person being credited.
    string name?;
    # The role of the person being credited.
    string role?;
};

public type MeondemandpagesSubscriptionMonthlyPrice record {
    # The monthly subscription price in USD. *Required if `subscription.active` is true.
    decimal USD?;
};

public type PresetsPresetIdBody record {
    # Disable the outro.
    string outro?;
};

public type UserIdAlbumsBody record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
};

public type PrivacyUsersBody record {
    # The array of either the user URIs or the user IDs to permit to view the private channel.
    string[] users;
};

public type AuthorizeVimeoOauth1Body record {
    # The grant type. Must be set to `vimeo_oauth1`.
    string grant_type;
    # The OAuth 1 token.
    string token;
    # The OAuth 1 token secret.
    string token_secret;
};

# Metadata about the channel.
public type ChannelMetadata record {
    # A collection of information that is connected to this resource.
    ChannelMetadataConnections connections;
    # A list of resource URIs related to the channel.
    ChannelMetadataInteractions? interactions;
};

# When a channel appears in the context of adding or removing a video from it (`/videos/{video_id}/available_channels`), include information about adding or removing the video. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsAddTo record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# A collection of information about the buttons that appear on the interface of the embeddable player.
public type EmbedsettingsButtons record {
    # Whether the Embed button appears in the embeddable player for this video.
    boolean embed;
    # Whether the Fullscreen button appears in the embeddable player for this video.
    boolean fullscreen;
    # Whether the HD button appears in the embeddable player for this video.
    boolean hd;
    # Whether the Like button appears in the embeddable player for this video.
    boolean like;
    # Whether the Scaling button appears in the embeddable player for this video.
    boolean scaling;
    # Whether the Share button appears in the embeddable player for this video.
    boolean share;
    # Whether the Watch Later button appears in the embeddable player for this video.
    boolean watchlater;
};

# Information about the groups created by this user.
public type UserMetadataConnectionsGroups record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of groups on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The container of this category's parent category, if the current category is a subcategory.
public type CategoryParent record {
    # The URL to access the parent category in a browser.
    string link;
    # The display name that identifies the parent category.
    string name;
    # The unique identifier to access the parent of this category resource.
    string uri;
};

# When a video is referenced by a channel URI, if the user is a moderator of the channel, include information about removing the video from the channel.
public type VideoMetadataInteractionsChannel record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UsersUserIdBody record {
    # The user's bio.
    string bio?;
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint. You must provide a comma-separated list if you are using a query string or an array if you are using JSON.
    string[] content_filter?;
    # The user's custom Vimeo URL slug.
    string link?;
    # The user's location.
    string location?;
    # The user's display name.
    string name?;
    # The default password for all future videos that this user uploads. To use this field, the `videos.privacy.view` field must be `password`.
    string password?;
    MeVideos videos?;
};

public type OndemandPagesBody1 record {
    # An array of accepted currencies.
    # 
    # Option descriptions:
    #  * `AUD` - Australian Dollar
    #  * `CAD` - Canadian Dollar
    #  * `CHF` - Swiss Franc
    #  * `DKK` - Danish Krone
    #  * `EUR` - Euro
    #  * `GBP` - British Pound
    #  * `JPY` - Japanese Yen
    #  * `KRW` - South Korean Won
    #  * `NOK` - Norwegian Krone
    #  * `PLN` - Polish Zloty
    #  * `SEK` - Swedish Krona
    #  * `USD` - US Dollar
    string accepted_currencies?;
    MeondemandpagesBuy buy?;
    # One or more ratings, either as a comma-separated list or as a JSON array depending on the request format.
    string content_rating;
    # The description of the On Demand page.
    string description;
    # The custom domain of the On Demand page.
    string domain_link?;
    MeondemandpagesEpisodes episodes?;
    # The custom string to use in this On Demand page's Vimeo URL.
    string link?;
    # The name of the On Demand page.
    string name;
    MeondemandpagesRent rent?;
    MeondemandpagesSubscription subscription?;
    # The type of On Demand page.
    string 'type;
};

public type MeondemandpagesEpisodesBuy record {
    # Whether episodes can be bought.
    boolean active?;
    # Whether people who buy the episode can download it. To use this field, `type` must be `series`.
    boolean download?;
    MeondemandpagesEpisodesBuyPrice price?;
};

# A collection of information relating to custom logos in the embeddable player.
public type EmbedsettingsLogosCustom record {
    # Whether the custom logo appears in the embeddable player.
    boolean active;
    # The URL that loads upon clicking the custom logo.
    string link;
    # Whether the custom logo appears even when the player interface is hidden.
    boolean sticky;
};

# Information about the members or moderators of this group.
public type GroupMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The outro link settings. Present only if the type is `link`.
public type PresetsSettingsOutroLink record {
    # The name of the outro link.
    string name?;
    # The URL of the outro link.
    string url?;
};

public type VideoIdCategoriesBody record {
    # The array of the names of the categories that you're suggesting.
    string[] category;
};

# Information about this video's text tracks.
public type VideoMetadataConnectionsTexttracks record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of text tracks on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about subscribing to this On Demand page, if enabled.
public type OndemandpageSubscription record {
    # Whether this product is active.
    boolean active;
    # The link to this product on Vimeo.
    string? link;
    # The product's rental period.
    string period?;
    # The accepted currencies and respective pricing for this product.
    record {} price;
};

# An action indicating if the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsFollow record {
    # Whether the authenticated user has followed this channel. This data requires a bearer token with the `private` scope.
    boolean added;
    # The time in ISO 8601 format that the user followed this channel, or the null value if the user hasn't followed the channel. This data requires a bearer token with the `private` scope.
    string? added_time;
    # Whether the authenticated user is a moderator or subscriber. This data requires a bearer token with the `private` scope.
    # 
    # Option descriptions:
    #  * `moderator` - The authenticated user is a moderator.
    #  * `subscriber` - The authenticated user is a subscriber.
    string? 'type;
    # The URI for following or unfollowing this channel. PUT to this URI to follow the channel, or DELETE to this URI to unfollow the channel. This data requires a bearer token with the `private` scope.
    string uri;
};

public type UserPreferencesVideosPrivacy record {
    # Whether other users can add the user's videos.
    boolean add?;
    # The user's privacy preference for comments:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can comment on the user's videos.
    #  * `contacts` - Only contacts can comment on the user's videos.
    #  * `nobody` - No one can comment on the user's videos.
    string comments?;
    # Whether other users can download the user's videos.
    boolean download?;
    # The user's privacy preference for embeds:
    # 
    # Option descriptions:
    #  * `private` - Only the user can embed their own videos.
    #  * `public` - Anyone can embed the user's videos.
    #  * `whitelist` - Only those on the whitelist can embed the user's videos.
    string embed?;
    # The user's privacy preference for views:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the user's videos.
    #  * `contacts` - Only contacts can view the user's videos.
    #  * `disable` - Views are disabled for the user's videos.
    #  * `nobody` - No one except the user can view the user's videos.
    #  * `password` - Only those with the password can view the user's videos.
    #  * `unlisted` - Anybody can view the user's videos if they have a link.
    #  * `users` - Only other Vimeo members can view the user's videos.
    string view?;
};

public type Video record {
    # The categories to which this video belongs.
    Category[] categories;
    # The content ratings of this video.
    string[] content_rating;
    # The context of the video's subscription, if this video is part of a subscription.
    VideoContext context;
    # The time in ISO 8601 format when the video was created.
    string created_time;
    # A brief explanation of the video's content.
    string? description;
    # The video's duration in seconds.
    decimal duration;
    # Information about embedding this video.
    EmbedSettings embed;
    # The video's height in pixels.
    decimal height;
    # The video's primary language.
    string? language;
    # The time in ISO 8601 format when the user last modified the video.
    string? last_user_action_event_date?;
    # The [Creative Commons](http://creativecommons.org/licenses/) license used for the video:
    # 
    # Option descriptions:
    #  * `by` - Attribution
    #  * `by-nc` - Attribution Non-Commercial
    #  * `by-nc-nd` - Attribution Non-Commercial No Derivatives
    #  * `by-nc-sa` - Attribution Non-Commercial Share Alike
    #  * `by-nd` - Attribution No Derivatives
    #  * `by-sa` - Attribution Share Alike
    #  * `cc0` - Public Domain Dedication
    string license;
    # The link to the video.
    string link;
    # The video's metadata.
    VideoMetadata metadata;
    # The time in ISO 8601 format when the video metadata was last modified.
    string modified_time;
    # The video's title.
    string name;
    # Information about the folder that contains this video.
    Project parent_folder?;
    # The privacy-enabled password to watch this video. Only users can see their own video passwords. This data requires a bearer token with the `private` scope.
    string password?;
    # The active picture for this video.
    Picture pictures;
    # The video's privacy setting.
    VideoPrivacy privacy;
    # The time in ISO 8601 format when the video was released.
    string release_time;
    # The resource key string of the video.
    string resource_key;
    # 360 spatial data.
    VideoSpatial spatial;
    # A collection of stats associated with this video.
    VideoStats stats;
    # The status code for the availability of the video. This field is deprecated in favor of `upload` and `transcode`.
    # 
    # Option descriptions:
    #  * `available` - The video is available.
    #  * `quota_exceeded` - The user's quota is exceeded with this video.
    #  * `total_cap_exceeded` - The user has exceeded their total cap with this video.
    #  * `transcode_starting` - Transcoding is beginning for the video.
    #  * `transcoding` - Transcoding is underway for the video.
    #  * `transcoding_error` - There was an error in transcoding the video.
    #  * `unavailable` - The video is unavailable.
    #  * `uploading` - The video is being uploaded.
    #  * `uploading_error` - There was an error in uploading the video.
    string? status;
    # An array of all tags assigned to this video.
    Tag[] tags;
    # The transcode information for a video upload.
    VideoTranscode? transcode;
    # The upload information for this video.
    VideoUpload? upload;
    # The video's canonical relative URI.
    string uri;
    # The video owner.
    User user;
    # The video's width in pixels.
    decimal width;
};

public type PicturesPictureIdBody record {
    # Whether this thumbnail is the default.
    boolean active?;
};

public type Domain record {
    # Whether to permit HD embeds on this domain.
    boolean allow_hd;
    # The domain name.
    string domain;
    # The URI of the domain.
    string uri;
};

# The video's metadata.
public type OndemandpromotionMetadata record {
    # A list of resource URIs related to the On Demand promotion.
    OndemandpromotionMetadataConnections connections;
};

# A collection of stats associated with this video.
public type VideoStats record {
    # The current total number of times that the video has been played.
    decimal? plays;
};

# Information about the videos in this preset.
public type PresetsMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information on the users that the current user has blocked. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsBlock record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of blocked users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about the users credited in this video.
public type VideoMetadataConnectionsCredits record {
    # An array of HTTP methods permitted on this URI.
    string[] options?;
    # The total number of users on this connection.
    decimal total?;
    # The API URI that resolves to the connection data.
    string uri?;
};

public type OnDemandSeason record {
    # The description for this season.
    string description;
    OndemandseasonMetadata metadata;
    # The descriptive name of the season.
    string name;
    # The position of the season relative to other seasons in the series.
    decimal position;
    # The unique identifier for this On Demand season.
    string resource_key;
    # The type of season.
    string 'type;
    # The season container's relative URI.
    string uri;
    # The creator of this On Demand page.
    User user;
};

public type OnDemandPage record {
    # The background image for the On Demand page on Vimeo.
    Picture background;
    # The primary and secondary colors used for rendering this On Demand page.
    OndemandpageColors colors;
    # An array of the page's content ratings.
    string[] content_rating;
    # The time in ISO 8601 format when the page was created.
    string created_time?;
    # The description of this On Demand page.
    string? description;
    # The link to this page on its own domain.
    string? domain_link;
    # Information about this On Demand page's episodes, if the page is for a series.
    OndemandpageEpisodes episodes;
    # This On Demand page's film, if it is a film.
    Video film?;
    # All the genres assigned to this page.
    OnDemandGenre[] genres;
    # The link to the page on Vimeo.
    string link;
    # Metadata about the On Demand page.
    OndemandpageMetadata metadata;
    # he time in ISO 8601 format when the page was last modified.
    string modified_time?;
    # A descriptive title of this On Demand page.
    string name;
    # The active poster for this On Demand page.
    Picture pictures;
    OndemandpagePreorder preorder;
    OndemandpagePublished published;
    # The rating of this page.
    decimal? rating;
    # The VOD resource key.
    string resource_key;
    # The creator-designated SKU for this On Demand page.
    string? sku?;
    # Information about subscribing to this On Demand page, if enabled.
    OndemandpageSubscription? subscription;
    # The graphical theme for this On Demand page.
    string theme;
    # The thumbnail image for the On Demand page on Vimeo.
    Picture thumbnail;
    # The trailer for this On Demand page.
    Video trailer;
    # Whether this On Demand page is for a film or a series.
    # 
    # Option descriptions:
    #  * `film` - The On Demand page is for a film.
    #  * `series` - The On Demand page is for a series.
    string 'type;
    # The relative URI of the On Demand page.
    string uri;
    # The user who created this On Demand page.
    User user;
};

public type MevideosEmbedLogos record {
    MevideosEmbedLogosCustom custom?;
    # Show or hide the Vimeo logo.
    boolean vimeo?;
};

public type OndemandpagesondemandIdPreorder record {
    # If set to true, you will enable pre-orders on the On Demand page.
    boolean active?;
    # The time that the On Demand page will be published. *Required if `preorder.active` is `true`.
    string publish_time?;
};

public type OndemandpagesondemandIdvideosvideoIdRentPrice record {
    # The rental price of this video in AUD.
    decimal AUD?;
    # The rental price of this video in CAD.
    decimal CAD?;
    # The rental price of this video in CHF.
    decimal CHF?;
    # The rental price of this video in DKK.
    decimal DKK?;
    # The rental price of this video in EUR.
    decimal EUR?;
    # The rental price of this video in GBP.
    decimal GBP?;
    # The rental price of this video in JPY.
    decimal JPY?;
    # The rental price of this video in KRW.
    decimal KRW?;
    # The rental price of this video in NOK.
    decimal NOK?;
    # The rental price of this video in PLN.
    decimal PLN?;
    # The rental price of this video in SEK.
    decimal SEK?;
    # The rental price of this video in USD. *Required if `rent.active` is true.
    decimal USD?;
};

public type ChannelIdTagsBody record {
    # An array of tags to assign.
    string[] tag;
};

# A collection of information relating to the embeddable player's title bar.
public type EmbedsettingsTitle record {
    # How the embeddable player handles the video title:
    # 
    # Option descriptions:
    #  * `hide` - The title is hidden.
    #  * `show` - The title is shown.
    string name;
    # How the embeddable player handles the video owner's information:
    # 
    # Option descriptions:
    #  * `hide` - The owner's information is hidden.
    #  * `show` - The owner's information is shown.
    string owner;
    # How the embeddable player handles the video owner's portrait:
    # 
    # Option descriptions:
    #  * `hide` - The owner's portrait is hidden
    #  * `show` - The owner's portrait is shown.
    string portrait;
};

# Information about this video's thumbnails.
public type VideoMetadataConnectionsPictures record {
    # An array of HTTP methods allowed on this URI.
    string[] options;
    # Total number of thumbnails on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Language record {
    # The code that represents this language.
    string code;
    # The name of the language.
    string name;
};

# The upload information for this version.
public type VideoversionsUpload record {
    # The approach for uploading the video.
    string approach?;
    # The URI for completing the upload.
    string complete_uri?;
    # The HTML form for uploading a video through the post approach.
    string form?;
    # The link of the video to capture through the pull approach.
    string link?;
    # The redirect URL for the upload app.
    string redirect_url?;
    # The file size in bytes of the uploaded video.
    decimal size?;
    # The status code for the availability of the uploaded video:
    # 
    # Option descriptions:
    #  * `complete` - The upload is complete.
    #  * `error` - The upload ended with an error.
    #  * `in_progress` - The upload is underway.
    string status;
    # The link for sending video file data.
    string upload_link?;
};

public type ProjectsProjectIdBody1 record {
    # The name of the project.
    string name;
};

public type VideoIdCommentsBody1 record {
    # The text of the comment.
    string text;
};

# Related content for this activity.
public type Activity31MetadataConnectionsRelated record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos related to this tag.
public type TagMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type VideoversionsMetadataConnections record {
    # Data from video associated with version
    VideoversionsMetadataConnectionsVideo video;
};

# Information about this user's portfolios.
public type UserMetadataConnectionsPortfolios record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of portfolios on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosSpatial record {
    # The 360 director timeline.
    MevideosSpatialDirectorTimeline[] director_timeline?;
    # The 360 field of view: default 50, minimum 30, maximum 90.
    decimal field_of_view?;
    # The 360 spatial projection.
    string projection?;
    # The 360 spatial stereo format.
    string stereo_format?;
};

# A collection of recommended channels for the current user to follow. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsRecommendedChannels record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of channels on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type MeondemandpagesRentPrice record {
    # The rental price of this video in AUD.
    decimal AUD?;
    # The rental price of this video in CAD.
    decimal CAD?;
    # The rental price of this video in CHF.
    decimal CHF?;
    # The rental price of this video in DKK.
    decimal DKK?;
    # The rental price of this video in EUR.
    decimal EUR?;
    # The rental price of this video in GBP.
    decimal GBP?;
    # The rental price of this video in JPY.
    decimal JPY?;
    # The rental price of this video in KRW.
    decimal KRW?;
    # The rental price of this video in NOK.
    decimal NOK?;
    # The rental price of this video in PLN.
    decimal PLN?;
    # The rental price of this video in SEK.
    decimal SEK?;
    # The rental price of this video in USD when `type` is `film`, or the rental price of the entire collection in USD when `type` is `series`.
    decimal USD?;
};

public type ChannelIdModeratorsBody record {
    # The URI of a user to add as a moderator.
    string user_uri;
};

# The contents of the presets group.
public type PresetsSettings record {
    PresetsSettingsButtons buttons;
    PresetsSettingsLogos logos;
    PresetsSettingsOutro outro;
};

# The video's privacy setting.
public type VideoPrivacy record {
    # Whether the video can be added to collections.
    boolean add;
    # Who can comment on the video:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can comment on the video.
    #  * `contacts` - Only contacts can comment on the video.
    #  * `nobody` - No one can comment on the video.
    string comments;
    # The video's download permission setting.
    boolean download;
    # The video's embed permission setting:
    # 
    # Option descriptions:
    #  * `private` - The video is private.
    #  * `public` - Anyone can embed the video.
    string embed;
    # The general privacy setting for the video:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the video.
    #  * `contacts` - Only contacts can view the video.
    #  * `disable` - Hide from vimeo
    #  * `nobody` - No one besides the owner can view the video.
    #  * `password` - Anyone with the video's password can view the video.
    #  * `unlisted` - Not searchable from vimeo.com
    #  * `users` - Only people with a Vimeo account can view the video.
    string view;
};

# Information about the user's upload space remaining for the current period.
public type UserUploadQuotaSpace record {
    # The number of bytes remaining in your upload quota.
    decimal free;
    # The maximum number of bytes allotted to your upload quota.
    decimal? max;
    # Whether the values of the upload_quota.space fields are for the lifetime quota or the periodic quota.
    string showing;
    # The number of bytes that you've already uploaded against your quota.
    decimal used;
};

public type MeFollowingBody record {
    # An array of user URIs for the list of users to follow.
    string[] users;
};

public type UserIdFollowingBody record {
    # An array of user URIs for the list of users to follow.
    string[] users;
};

public type VideoIdVersionsBody record {
    # The name of the version
    string file_name;
    VideosvideoIdversionsUpload upload;
};

public type VideoIdTexttracksBody1 record {
    # Active text tracks appear in the player and are visible to other users. Only one text track per language can be active.
    boolean active?;
    # The language of the text track. For a complete list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language;
    # The name of the text track.
    string name;
    # The type of the text track.
    string 'type;
};

public type MeondemandpagesEpisodes record {
    MeondemandpagesEpisodesBuy buy?;
    MeondemandpagesEpisodesRent rent?;
};

# Information about the channels that this user moderates.
public type UserMetadataConnectionsModeratedChannels record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of channels on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type OauthAccessTokenBody record {
    # The authorization code received from the authorization server.
    string code;
    # The grant type. Must be set to `authorization_code`.
    string grant_type;
    # The redirect URI. Must match the URI from `/oauth/authorize`.
    string redirect_uri;
};

public type PresetsPresetIdBody1 record {
    # Disable the outro.
    string outro?;
};

public type MevideosRatings record {
    MevideosRatingsMpaa mpaa?;
    MevideosRatingsTv tv?;
};

public type MeVideosBody record {
    # A list of values describing the content in this video. Find the full list in the [/contentratings](https://developer.vimeo.com/api/endpoints/videos#GET/contentratings) endpoint.
    string[] content_rating?;
    # The description of the video.
    string description?;
    MevideosEmbed embed?;
    # The Creative Commons license.
    string license?;
    # The video's default language. For a full list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string locale?;
    # The title of the video.
    string name?;
    # The password. When you set `privacy.view` to `password`, you must provide the password as an additional parameter.
    string password?;
    MevideosPrivacy privacy?;
    MevideosRatings ratings?;
    MevideosReviewPage review_page?;
    MevideosSpatial spatial?;
    MevideosUpload upload;
};

# The upload information for this video.
public type VideoUpload record {
    # The approach for uploading the video.
    string approach?;
    # The URI for completing the upload.
    string complete_uri?;
    # The HTML form for uploading a video through the post approach.
    string form?;
    # The link of the video to capture through the pull approach.
    string link?;
    # The redirect URL for the upload app.
    string redirect_url?;
    # The file size in bytes of the uploaded video.
    decimal size?;
    # The status code for the availability of the uploaded video:
    # 
    # Option descriptions:
    #  * `complete` - The upload is complete.
    #  * `error` - The upload ended with an error.
    #  * `in_progress` - The upload is underway.
    string status;
    # The link for sending video file data.
    string upload_link?;
};

public type OndemandseasonMetadataConnections record {
    # The Videos connection.
    OndemandseasonMetadataConnectionsVideos videos;
};

public type OnDemandVideo record {
    # Information about purchasing this video.
    OndemandvideoBuy? buy;
    # Description of the On Demand video.
    string description?;
    # The duration of the On Demand video.
    string duration?;
    # The episode number of the On Demand video.
    decimal episode?;
    # An object containing information about how the authenticated user can interact with this On Demand page.
    OndemandvideoInteractions interactions;
    # The link to this video on Vimeo.
    string link;
    # Metadata information about this video.
    OndemandvideoMetadata metadata;
    # The title of the On Demand video.
    string name?;
    # An array of HTTP methods permitted on this URI.
    string[] options?;
    # The active picture for this video.
    Picture pictures?;
    # The user's most recent play position in seconds for this video.
    decimal play_progress;
    # Describes the manual position of this video relative to the other videos owned by this On Demand page.
    decimal position?;
    # The time in ISO 8601 format when the On Demand video was created or published.
    string release_date?;
    # The year that this On Demand video was released.
    decimal? release_year;
    # Information about renting this video.
    OndemandvideoRent? rent;
    # The type of the On Demand video:
    # 
    # Option descriptions:
    #  * `extra` - The On Demand video is an extra feature.
    #  * `main` - The On Demand video is a main feature.
    #  * `trailer` - The On Demand video is a trailer.
    string 'type;
    # The video container's relative URI.
    string uri;
    # The owner of the video.
    User user?;
};

public type TextTrack record {
    # Whether this text track is active.
    boolean active;
    # The read-only URL of the text track file, intended for use with HLS playback.
    string hls_link;
    # The time in ISO 8601 format when the read-only HLS playback text track file expires.
    string hls_link_expires_time;
    # The language code for this text track. To see a full list, request
    # `/languages?filter=texttrack`.
    string? language;
    # The read-only URL of the text track file. You can upload to this link when you create it for the first time.
    string link;
    # The time in ISO 8601 format when the text track link expires.
    string link_expires_time;
    # The descriptive name of this text track.
    string? name;
    # The type of the text track:
    # 
    # Option descriptions:
    #  * `captions` - The text track is for captions.
    #  * `subtitles` - The text track is for subtitles.
    string? 'type;
    # The relative URI of the text track.
    string uri;
};

public type MevideosEmbed record {
    MevideosEmbedButtons buttons?;
    # The main color of the embed player.
    string color?;
    MevideosEmbedLogos logos?;
    # Show or hide the playbar.
    boolean playbar?;
    MevideosEmbedTitle title?;
    # Show or hide the volume selector.
    boolean volume?;
};

public type OndemandpagesondemandIdvideosvideoIdRent record {
    OndemandpagesondemandIdvideosvideoIdRentPrice price?;
};

public type UploadAttempt record {
    # The video to upload.
    Video clip?;
    # The completion URI of the upload.
    string complete_uri?;
    # The HTML upload form.
    string form?;
    # The ticket identifier string for the upload.
    string ticket_id;
    # The upload URL.
    string upload_link;
    # The upload URI.
    string uri;
    # The owner of the uploaded video.
    User user;
};

public type OndemandIdRegionsBody record {
    # An array of country codes.
    string[] countries;
};

# The primary and secondary colors used for rendering this On Demand page.
public type OndemandpageColors record {
    # The hexadecimal color code for the page's primary color.
    string primary;
    # The hexadecimal color code for the page's secondary color.
    string secondary;
};

public type AlbumsAlbumIdBody record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # The custom domain a user has selected for their album.
    string? domain?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name?;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
    # The custom Vimeo URL a user has selected for their album.
    string? url?;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain?;
};

# The Buy interaction for a On Demand video.
public type VideoMetadataInteractionsBuy record {
    # The currency code for the current user's region.
    string? currency;
    # Formatted price to display to buy an On Demand video.
    string? display_price;
    # The user's download access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for download.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to download the video.
    #  * `unavailable` - The video isn't available for download.
    string download;
    # Whether the video has DRM.
    boolean drm;
    # The URL to buy the On Demand video on Vimeo.
    string? link;
    # The numeric value of the price for buying the On Demand video.
    decimal? price;
    # The time in ISO 8601 format when the On Demand video was purchased.
    string? purchase_time;
    # The user's streaming access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for streaming.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to stream the video.
    #  * `unavailable` - The video isn't available for streaming
    string 'stream;
    # The product URI to purchase the On Demand video.
    string? uri;
};

# Information about the pictures associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsPictures record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of pictures on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos contained within this portfolio.
public type PortfolioMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information related to the followed status of this user.
public type UserMetadataInteractionsFollow record {
    # Whether a user is following the current user.
    boolean added;
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The URI to follow the user.
    string uri;
};

# The user's metadata.
public type UserMetadata record {
    # The list of resource URIs related to the user.
    UserMetadataConnections connections;
    UserMetadataInteractions interactions;
};

# A collection of information connected to this resource.
public type OndemandgenreMetadataConnections record {
    # Information about the On Demand pages related to this group.
    OndemandgenreMetadataConnectionsPages pages;
};

# Information about removing this video from the user's list of watched videos.
public type VideoMetadataInteractionsWatched record {
    # Whether the user has watched the video.
    boolean added;
    # The time in ISO 8601 format when the user watched the video.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosUpload record {
    # The upload approach.
    string approach;
    # The public URL at which the video is hosted. The URL must be valid for at least 24 hours. Use this parameter when `approach` is `pull`.
    string link?;
    # The app's redirect URL. Use this parameter when `approach` is `post`.
    string redirect_url?;
    # The size in bytes of the video to upload.
    string size?;
};

public type PresetsSettingsOutro record {
    # A comma-separated list of video URIs. Present only if the type is `uploaded_clips`.
    string? clips?;
    # The outro link settings. Present only if the type is `link`.
    PresetsSettingsOutroLink? link?;
    # The outro text. Present only if the type is `text`.
    string? text?;
    # The preset outro type:
    string 'type;
    # A comma-separated list of video URIs. Present only if type is `no idea`.
    string? videos?;
};

# A collection of information that is connected to this resource, including videos, genres, and pictures connections.
public type OndemandpageMetadataConnections record {
    OndemandpageMetadataConnectionsMetadata metadata;
};

public type Presets record {
    # Metadata about the album.
    PresetsMetadata metadata;
    # The display name of the presets group.
    string name;
    # The contents of the presets group.
    PresetsSettings settings;
    # The canonical relative URI of the presets object.
    string uri;
    # The owner of the preset.
    User user;
};

# Information about this comment's replies.
public type CommentMetadataConnectionsReplies record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of replies on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The project's metadata.
public type ProjectMetadata record {
    # A list of resource URIs related to the project.
    ProjectMetadataConnections connections;
};

public type OndemandpagesondemandIdvideosvideoIdBuyPrice record {
    # The purchase price of this video in AUD.
    decimal AUD?;
    # The purchase price of this video in CAD.
    decimal CAD?;
    # The purchase price of this video in CHF.
    decimal CHF?;
    # The purchase price of this video in DKK.
    decimal DKK?;
    # The purchase price of this video in EUR.
    decimal EUR?;
    # The purchase price of this video in GBP.
    decimal GBP?;
    # The purchase price of this video in JPY.
    decimal JPY?;
    # The purchase price of this video in KRW.
    decimal KRW?;
    # The purchase price of this video in NOK.
    decimal NOK?;
    # The purchase price of this video in PLN.
    decimal PLN?;
    # The purchase price of this video in SEK.
    decimal SEK?;
    # The purchase price of this video in USD. *Required if `buy.active` is true.
    decimal USD?;
};

# Information about this user's feed.
public type UserMetadataConnectionsFeed record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

# The Rent interaction for an On Demand video.
public type VideoMetadataInteractionsRent record {
    # The currency code for the current user's region.
    string? currency;
    # Formatted price to display to rent an On Demand video.
    string? display_price;
    # Whether the video has DRM.
    boolean drm;
    # The time in ISO 8601 format when the rental period for the video expires.
    string? expires_time;
    # The URL to rent the On Demand video on Vimeo.
    string? link;
    # The numeric value of the price for buying the On Demand video.
    decimal? price;
    # The time in ISO 8601 format when the On Demand video was rented.
    string? purchase_time;
    # The user's streaming access to this On Demand video:
    # 
    # Option descriptions:
    #  * `available` - The video is available for streaming.
    #  * `purchased` - The user has purchased the video.
    #  * `restricted` - The user isn't permitted to stream the video.
    #  * `unavailable` - The video isn't available for streaming.
    string 'stream;
    # The product URI to rent the On Demand video.
    string? uri;
};

# Information about the videos that this user has liked.
public type UserMetadataConnectionsLikes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of likes on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Activity31 record {
    # The category that this event occurred for. This will be preset for only "category" activity types.
    Category category?;
    # The channel that this event occurred for. This will be present for only "channel" activity types.
    Channel channel?;
    # Video associated with ths activity.
    Video clip;
    # The group that this event occurred for. This will be present for only "group" activity types.
    Group group?;
    # The activity's metadata.
    Activity31Metadata metadata;
    # The tag that this event occurred for. This will be present for only "tag" activity types.
    Tag tag?;
    # Time that the event occurred.
    string time;
    # Activity type
    string 'type;
    # The user that this event occurred for. This will be present for "like", "appearance", and "share" activity types.
    User user?;
};

public type MeProjectsBody record {
    # The name of the project.
    string name;
};

# A collection of information that is connected to this resource.
public type GroupMetadataConnections record {
    # Information about the members or moderators of this group.
    GroupMetadataConnectionsUsers users;
    # Information about the videos contained within this group.
    GroupMetadataConnectionsVideos videos;
};

public type CreativeCommons record {
    # The code that uniquely identifies this Creative Commons license:
    # 
    # Option descriptions:
    #  * `by` - Attribution
    #  * `by-nc` - Attribution Non-Commercial
    #  * `by-nc-nd` - Attribution Non-Commercial No Derivatives
    #  * `by-nc-sa` - Attribution Non-Commercial Share Alike
    #  * `by-nd` - Attribution No Derivatives
    #  * `by-sa` - Attribution Share Alike
    #  * `cc0` - Public Domain Dedication
    string code;
    # The description of this Creative Commons license.
    string name;
    # The canonical relative URI of the Creative Commons license.
    string? uri;
};

# Information about this user's followed categories.
public type UserMetadataConnectionsCategories record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of categories on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MeondemandpagesEpisodesBuyPrice record {
    # The purchase price per episode. *Required if `episodes.buy.active` is true.
    decimal USD?;
};

public type CommentsCommentIdBody record {
    # The next text of the comment.
    string text;
};

# A collection of information about the logo in the corner of the embeddable player.
public type EmbedsettingsLogos record {
    # A collection of information relating to custom logos in the embeddable player.
    EmbedsettingsLogosCustom custom;
    # Whether the Vimeo logo appears in the embeddable player for this video.
    boolean vimeo;
};

public type MevideosReviewPage record {
    # Enable or disable video review.
    boolean active?;
};

# 360 spatial data.
public type VideoSpatial record {
    # 360 director timeline.
    VideoSpatialDirectorTimeline[] director_timeline;
    # The 360 field of view, from 30 (minimum) to 90 (maximum). The default is 50.
    decimal? field_of_view;
    # The 360 spatial projection:
    # 
    # Option descriptions:
    #  * `cubical` - The spatial projection is cubical.
    #  * `cylindrical` - The spatial projection is cylindrical.
    #  * `dome` - The spatial projection is dome-shaped.
    #  * `equirectangular` - The spatial projection is equirectangular.
    #  * `pyramid` - The spatial projection is pyramid-shaped.
    string? projection;
    # The 360 stereo format:
    # 
    # Option descriptions:
    #  * `left-right` - The stereo format is left-right.
    #  * `mono` - The audio is monaural.
    #  * `top-bottom` - The stereo format is top-bottom.
    string? stereo_format;
};

# The activity's metadata.
public type Activity31Metadata record {
    # A list of resource URIs related to the activity.
    Activity31MetadataConnections connections;
};

# Embed data for the album.
public type AlbumEmbed record {
    # The responsive HTML code to embed the playlist on a website. This is present only when `privacy.view` isn't password and when the album has embeddable videos.
    string? html;
};

# Metadata about the On Demand page.
public type OndemandpageMetadata record {
    # A collection of information that is connected to this resource, including videos, genres, and pictures connections.
    OndemandpageMetadataConnections connections;
    # The user's available purchase interactions.
    PurchaseInteraction interactions;
};

# A list of resource URIs related to the On Demand promotion.
public type OndemandpromotionMetadataConnections record {
    # Information about the codes associated with this promotion.
    OndemandpromotionMetadataConnectionsCodes codes;
};

# The recommendations for this video.
public type VideoMetadataConnectionsRecommendations record {
    # An array of HTTP methods allowed on this URI.
    string[] options?;
    # The API URI that resolves to the connection data.
    string uri?;
};

public type UserPreferences record {
    UserPreferencesVideos videos?;
};

public type ChannelIdVideosBody record {
    # The URI of a video to add.
    string video_uri;
};

public type MeondemandpagesEpisodesRent record {
    # Whether episodes can be rented
    boolean active?;
    # The period in which this episode can be rented for.
    string period?;
    MeondemandpagesEpisodesRentPrice price?;
};

public type AlbumIdVideosBody1 record {
    # A comma-separated list of video URIs.
    string videos;
};

public type OndemandvideoMetadataInteractions record {
    # Information about the user's Like interactions with this video.
    OndemandvideoMetadataInteractionsLikes likes;
    # Information about the user's Watch Later interactions with this video.
    OndemandvideoMetadataInteractionsWatchlater watchlater;
};

# Information about renting this video.
public type OndemandvideoRent record {
    # Whether this On Demand video can be rented.
    boolean active;
    # A map of currency type to price.
    record {} price;
    # Whether this On Demand video has been rented.
    boolean purchased?;
};

public type OndemandpagesondemandIdPublish record {
    # Whether to publish the On Demand page.
    boolean active?;
};

public type BackgroundsBackgroundIdBody record {
    # Whether to make this background the active background.
    boolean active?;
};

# Information about the videos that this user has watched.
public type UserMetadataConnectionsWatchedVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MevideosRatingsTv record {
    # The reason for the video's TV rating.
    # 
    # Option descriptions:
    #  * `d` - Suggestive dialogue
    #  * `fv` - Fantasy violence
    #  * `l` - Language
    #  * `ss` - Sexual situations
    #  * `v` - Violence
    string reason?;
};

# Information about the comments on this video.
public type VideoMetadataConnectionsComments record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of comments on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the seasons associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsSeasons record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of seasons on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Metadata about the category.
public type CategoryMetadata record {
    # A collection of information that is connected to this resource.
    CategoryMetadataConnections connections;
    # The permissible actions related to the category.
    CategoryMetadataInteractions interactions;
};

public type VideosvideoIdPrivacy record {
    # Whether a user can add the video to an album, channel, or group.
    boolean add?;
    # The privacy level required to comment on the video.
    string comments?;
    # Whether a user can download the video. Not available to users with a Basic membership.
    boolean download?;
    # The video's new embed settings. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for details on adding and removing domains.
    string embed?;
    # The video's new privacy setting. When privacy is `users`, `application/json` is the only valid content type. Basic users can't set privacy to `unlisted`.
    string view?;
};

public type CommentMetadata record {
    CommentMetadataConnections connections;
};

# Information about the genres associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsGenres record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of genres on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# A list of resource URIs related to the album.
public type AlbumMetadataInteractions record {
    # An action indicating that the authenticated user is an admin of the album and may therefore add custom thumbnails. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddCustomThumbnails add_custom_thumbnails;
    # An action indicating that the authenticated user is an admin of the album and may therefore add custom logos. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddLogos add_logos;
    # An action indicating that the authenticated user is an admin of the album and may therefore add videos. This data requires a bearer token with the `private` scope.
    AlbumMetadataInteractionsAddVideos add_videos;
};

# A list of resource URIs related to the project.
public type ProjectMetadataConnections record {
    # A standard connection object indicating how to get all the videos in this project.
    ProjectMetadataConnectionsVideos videos;
};

public type CategorySubcategories record {
    # The URL to access the subcategory in a browser.
    string link;
    # The display name that identifies the subcategory.
    string name;
    # The unique identifier to access the subcategory resource.
    string uri;
};

# The permissible actions related to the category.
public type CategoryMetadataInteractions record {
    # An action indicating if the authenticated user has followed this category.
    CategoryMetadataInteractionsFollow follow;
};

# Metadata about the album.
public type PortfolioMetadata record {
    # A list of resource URIs related to the album.
    PortfolioMetadataConnections connections;
};

# Appears only when the user has upload access and is looking at their own user record.
public type UserUploadQuota record {
    # Information about the user's lifetime upload usage.
    UserUploadQuotaLifetime lifetime;
    # Information about the user's usage for the current period.
    UserUploadQuotaPeriodic periodic;
    # Information about the user's upload space remaining for the current period.
    UserUploadQuotaSpace space;
};

public type OndemandIdPromotionsBody record {
    # The promotion access type, which is a purchase option that isn't available on the container. VIP promotions always make the content free of charge. If you use this type, you must further define the promotion with the `download` or `stream_period` fields.
    # 
    # Option descriptions:
    #  * `default` - Promotions grant discount on the existing purchase options for an On Demand Container.
    #  * `vip` - Promotions can be used to grant free access to VOD content before it is released, or to offer a purchase option that isn't available on the container. "vip" promotions will always make the content free, and must be further defined with the `download` or `stream_period` fields.
    string access_type?;
    # The promotion code. This field is ignored for batch promotions.
    string code?;
    # The type of discount offered by the promo code. When `access_type` is `vip`, the value of this field must be `free`.
    # 
    # Option descriptions:
    #  * `free` - Reduces the price to zero.
    #  * `percent` - Reduces the price by an amount defined in the "percent_off" field.
    string discount_type?;
    # Whether the promotion grants download access to VOD content. This is necessary only when not previously defined in the On Demand container or when `access_type` is `vip` or `product_type` is `buy`.
    boolean download;
    # The end of the promotion period. If you don't specify a value, the promotion will never expire.
    string end_time?;
    # The description of a batch promotion. This field is ignored for single promotions.
    string label?;
    # The percentage of the discount by using this promo code. This field is applicable only when `discount_type` is `percent`.
    decimal percent_off?;
    # The type of transaction to which the promotion applies. When `access_type` is `default`, the default value is `any`, but the default value is `rent` when `access_type` is `vip`. Also, when `access_type` is `vip`, the only valid product types are `buy` and `rent`.
    string product_type?;
    # The start of the promotion period. If you don't specify a value, the start time defaults to the time that the promotion was created.
    string start_time?;
    # The amount of time that a user has access to the VOD content upon redeeming a promo code. This field is necessary only when not defined in the On Demand container or when creating promotions when `access_type` is `vip` or `product_type` is `rent`.
    string stream_period;
    # The number of promotions to generate when `type` is `batch`, or the number of uses of the promotion when `type` is `single`.
    decimal total;
    # The type of promotion. When `access_type` is `vip`, the value for this field must be `batch`.
    # 
    # Option descriptions:
    #  * `batch` - Generates many random promo codes with one use each.
    #  * `single` - Generates one promo code that can be used many times.
    string 'type;
};

public type Portfolio record {
    # The time in ISO 8601 format when the portfolio was created.
    string created_time;
    # The portfolio's description.
    string? description;
    # The link to the portfolio.
    string link;
    # Metadata about the album.
    PortfolioMetadata metadata;
    # The time in ISO 8601 format when the portfolio's data was last modified.
    string modified_time;
    # The display name of the portfolio.
    string name;
    # The default video sort order for the portfolio:
    # 
    # Option descriptions:
    #  * `alphabetical` - The default sort order is alphabetical by name.
    #  * `clips` - The default sort order is video creation date.
    #  * `modified` - The default sort order is the order in which the videos were modified.
    #  * `recent` - The default sort order is the order in which the videos were added.
    string sort;
    # The canonical relative URI of the portfolio.
    string uri;
};

# Information about the appearances of this user in other videos.
public type UserMetadataConnectionsAppearances record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of appearances on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserPreferencesVideos record {
    UserPreferencesVideosPrivacy privacy?;
};

# Information about the users following or moderating this channel.
public type ChannelMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# The context of the video's subscription, if this video is part of a subscription.
public type VideoContext record {
    # The contextual action:
    # 
    # Option descriptions:
    #  * `Added to` - An Added To action.
    #  * `Appearance by` - An Appearance By action.
    #  * `Liked by` - A Liked By action.
    #  * `Uploaded by` - An Unloaded By action.
    string action;
    # The contextual resource: a user, group, or channel representation, or an object of a tag.
    record {} 'resource;
    # The contextual resource type.
    string resource_type;
};

# Information about the codes associated with this promotion.
public type OndemandpromotionMetadataConnectionsCodes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of uses on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type PresetsSettingsButtons record {
    # Whether the preset includes Embed button settings.
    boolean embed;
    # Whether the preset includes HD button settings.
    boolean hd;
    # Whether the preset includes Like button settings.
    boolean like;
    # Whether the present includes Share button settings.
    boolean share;
    # Whether the preset includes Vote button settings.
    boolean vote;
    # Whether the preset includes Watch Later button settings.
    boolean watchlater;
};

# The privacy settings of the album.
public type AlbumPrivacy record {
    # The privacy-enabled password to see this album. Present only when `privacy.view` is `password`.
    string password?;
    # Who can view the album:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the album.
    #  * `embed_only` - Only owner can see album, can be embedded off-site
    #  * `password` - Only those with the password can view the album.
    string view;
};

public type OndemandvideoMetadataConnections record {
    # Information about this season.
    OndemandvideoMetadataConnectionsSeason season;
};

# A collection of information that is connected to this resource.
public type TagMetadataConnections record {
    # Information about the videos related to this tag.
    TagMetadataConnectionsVideos videos;
};

public type EmbedSettings record {
    # A collection of information about the buttons that appear on the interface of the embeddable player.
    EmbedsettingsButtons buttons;
    # The primary player color, which controls the color of the progress bar, buttons, and more.
    string color;
    # A collection of information about the logo in the corner of the embeddable player.
    EmbedsettingsLogos logos;
    # Whether the playbar appears in the embeddable player for this video.
    boolean playbar;
    # Whether the speed controls appear in the embeddable player for this video.
    boolean speed;
    # A collection of information relating to the embeddable player's title bar.
    EmbedsettingsTitle title;
    # The URI of the embed preset.
    string uri?;
    # Whether the volume controls appear in the embeddable player for this video.
    boolean volume;
};

public type OnDemandPromotionCode record {
    # A promotion code that can be redeemed on Vimeo.
    string code;
    # A link to redeem the promotion code instantly.
    string link;
    # The total amount of times this code can be used.
    decimal max_uses;
    # The number of times that this code has been used.
    decimal uses;
};

public type MeAlbumsBody record {
    # The hexadecimal code for the color of the player buttons.
    string brand_color?;
    # The description of the album.
    string description?;
    # Whether to hide Vimeo navigation when displaying the album.
    boolean hide_nav?;
    # The type of layout for presenting the album.
    string layout?;
    # The name of the album.
    string name;
    # The album's password. Required only if **privacy** is `password`.
    string password?;
    # The privacy level of the album.
    string privacy?;
    # Whether album videos should use the review mode URL.
    boolean review_mode?;
    # The default sort order of the album's videos.
    string sort?;
    # The color theme of the album.
    string theme?;
};

public type Play record {
    # Progressive files.
    PlayProgressive[] progressive?;
    # The play status of the video:
    # 
    # Option descriptions:
    #  * `playable` - The video is playable.
    #  * `purchase_required` - The video must be purchased.
    #  * `restricted` - Playback for the video is restricted.
    #  * `unavailable` - The video is unavailable.
    string status;
};

public type VideoVersions record {
    # Whether this video version is the currently active one.
    boolean active;
    # The API app associated with the video version.
    ApiApp app;
    # The time in ISO 8601 for when the video version was created.
    string created_time;
    # The duration of the video version in seconds.
    decimal? duration;
    # The file name of the video version.
    string filename;
    # The size in byes of the video version file.
    decimal? filesize;
    # The video version's metadata.
    VideoversionsMetadata metadata;
    # The time in ISO 8601 format when the video version was last modified.
    string modified_time;
    # The Play representation.
    Play play;
    # The upload information for this version.
    VideoversionsUpload? upload;
    # The time in ISO 8601 format when the video version was uploaded.
    string? upload_date;
    # The version's canonical relative URI.
    string uri;
    # The owner of the video version.
    User user;
};

public type ChannelIdCategoriesBody record {
    # The array of category URIs to add.
    string[] channels;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add custom logos. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddLogos record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about how the authenticated user can interact with the connection to the video's On Demand page.
public type OndemandvideoInteractionsPage record {
    # Whether this On Demand page was added.
    boolean added;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The URI to access the On Demand page.
    string uri;
};

# A list of resource URIs related to the album.
public type PresetsMetadataConnections record {
    # Information about the videos in this preset.
    PresetsMetadataConnectionsVideos videos;
};

public type MeVideos record {
    MeVideosPrivacy privacy?;
};

public type Tag record {
    # The normalized canonical tag name.
    string canonical;
    # Metadata about the group.
    TagMetadata metadata;
    # The tag value.
    string name;
    # The tag's resource key string.
    string resource_key;
    # The canonical relative URI of the tag.
    string uri;
};

# Information regarding where and how to report a user.
public type UserMetadataInteractionsReport record {
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # List of valid reasons for reporting a video.
    string[] reason;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserMetadataInteractions record {
    UserMetadataInteractionsAddPrivacyUser add_privacy_user?;
    # Information related to the block status of this user.
    UserMetadataInteractionsBlock block;
    # Information related to the followed status of this user.
    UserMetadataInteractionsFollow follow;
    # Information regarding where and how to report a user.
    UserMetadataInteractionsReport report;
};

# An action indicating that someone has joined the group. This data requires a bearer token with the `private` scope.
public type GroupMetadataInteractionsJoin record {
    # Whether the authenticated user has followed this group. This data requires a bearer token with the `private` scope.
    boolean added;
    # The time in ISO 8601 format when the user joined this group. This data requires a bearer token with the `private` scope.
    string? added_time;
    # The user's title, or the null value if not applicable. This data requires a bearer token with the `private` scope.
    string? title;
    # Whether the authenticated user is a moderator or subscriber. This data requires a bearer token with the `private` scope.
    # 
    # Option descriptions:
    #  * `member` - The authenticated user is a member.
    #  * `moderator` - The authenticated user is a moderator.
    string? 'type;
    # The URI for following. PUT to this URI to follow, or DELETE to this URI to unfollow. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about this On Demand page's episodes, if the page is for a series.
public type OndemandpageEpisodes record {
    OndemandpageEpisodesBuy buy;
    OndemandpageEpisodesRent rent;
};

# Information about the users related to this category.
public type CategoryMetadataConnectionsUsers record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type ProjectsProjectIdBody record {
    # The name of the project.
    string name;
};

public type AuthorizeClientBody record {
    # The grant type. Must be set to `client_credentials`.
    string grant_type;
    # A space-separated list of the authentication [scopes](https://developer.vimeo.com/api/authentication#supported-scopes) that you want to access. The default is `public`.
    string scope;
};

public type VideoIdSetAlbumThumbnailBody record {
    # The video frame time in seconds to use as the album thumbnail.
    decimal time_code?;
};

# Information about the users who have liked this video.
public type VideoMetadataConnectionsLikes record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of likes on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Album record {
    # Whether an album should allow continuous play.
    boolean allow_continuous_play;
    # Whether an album should allow downloads.
    boolean allow_downloads;
    # Whether an album should allow sharing.
    boolean allow_share;
    # Hexadecimal color code for the decorative color. For example, album videos use this color for player buttons.
    string? brand_color;
    # The time in ISO 8601 format that the album was created.
    string created_time;
    # The custom logo for this album.
    Picture custom_logo;
    # A brief description of the album's content.
    string? description;
    # The custom domain a user has selected for their album.
    string? domain;
    # The total duration in seconds of all the videos in the album.
    decimal duration;
    # Embed data for the album.
    AlbumEmbed embed;
    # Whether to show the album's custom brand color in the player of the album's embedded playlist.
    boolean? embed_brand_color;
    # Whether to show the album's custom logo in the player of the album's embedded playlist.
    boolean? embed_custom_logo;
    # Whether to hide the Vimeo navigation when viewing the album.
    boolean hide_nav;
    # Whether to hide the Vimeo logo in the player of the album's embedded playlist.
    boolean? hide_vimeo_logo;
    # The album's layout preference
    string layout;
    # The URL to access the album.
    string link;
    # Metadata about the album.
    AlbumMetadata metadata;
    # The time in ISO 8601 format when the album was last modified.
    string modified_time;
    # The album's display name.
    string name;
    # The active image for the album; defaults to the thumbnail of the last video added to the album.
    Picture pictures;
    # The privacy settings of the album.
    AlbumPrivacy privacy;
    # The album resource key.
    string resource_key;
    # Whether album videos should use the review mode URL.
    boolean review_mode;
    # Sort type of the album.
    string sort;
    # The album's color theme preference
    string theme;
    # The album's URI.
    string uri;
    # The custom Vimeo URL a user has selected for their album.
    string? url;
    # Whether the user has opted in to use a custom domain for their album.
    boolean use_custom_domain;
    # The owner of the album.
    User user;
    # Whether an album should show the brand color in the web layout.
    boolean web_brand_color;
    # Whether an album's custom logo should be shown in the web layout.
    boolean web_custom_logo;
};

public type MevideosEmbedTitle record {
    # Show or hide the video title, or enable the user to determine whether the video title appears.
    string name?;
    # Show or hide the owner information, or enable the user to determine whether the owner information appears.
    string owner?;
    # Show or hide the owner portrait, or enable the user to determine whether the owner portrait appears.
    string portrait?;
};

# Metadata about the group.
public type GroupMetadata record {
    # A collection of information that is connected to this resource.
    GroupMetadataConnections connections;
    # User actions that have involved the group. This data requires a bearer token with the `private` scope.
    GroupMetadataInteractions interactions;
};

# Information about this user's portraits.
public type UserMetadataConnectionsPictures record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of pictures on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos associated with this page.
public type OndemandpageMetadataConnectionsMetadataConnectionsVideos record {
    # The total number of extra videos.
    decimal extra_total;
    # The total number of main videos.
    decimal main_total;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
    # The total number of viewable videos.
    decimal viewable_total;
};

# Information on purchasing this video.
public type PurchaseinteractionBuy record {
    # Whether the On Demand video for purchase has DRM.
    boolean drm?;
};

public type CommentIdRepliesBody record {
    # The reply to the comment.
    string text;
};

# Information about the On Demand pages related to this group.
public type OndemandgenreMetadataConnectionsPages record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};

public type OndemandpageEpisodesRent record {
    # Whether all the videos on this On Demand page can be rented as a whole.
    boolean active;
    # The rental period for the video:
    # 
    # Option descriptions:
    #  * `1 day` - The rental period is one day.
    #  * `1 month` - The rental period is one month.
    #  * `1 week` - The rental period is one week.
    #  * `1 year` - The rental period is one year.
    #  * `2 day` - The rental period is two days.
    #  * `24 hour` - The rental period is 24 hours.
    #  * `3 day` - The rental period is three days.
    #  * `3 month` - The rental period is three months.
    #  * `30 day` - The rental period is 30 days.
    #  * `48 hour` - The rental period is 48 hours.
    #  * `6 month` - The rental period is six months.
    #  * `60 day` - The rental period is 60 days.
    #  * `7 day` - The rental period is 7 days.
    #  * `72 hour` - The rental period is 72 hours.
    string? period;
    # The default price to rent an episode.
    decimal? price;
};

# The transcode information for a video upload.
public type VideoTranscode record {
    # Status code for this video's availability.
    string status?;
};

public type LegacyError record {
    # User-friendly error message
    string 'error;
};

# Metadata information about this video.
public type OndemandvideoMetadata record {
    OndemandvideoMetadataConnections connections;
    OndemandvideoMetadataInteractions interactions;
};

# Information about the versions of this video.
public type VideoMetadataConnectionsVersions record {
    # The URI of the current version of the video.
    string current_uri?;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of versions on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type MeondemandpagesRent record {
    # Whether the video can be rented. *Required if `buy.active` is false.
    boolean active?;
    # The period in which this can be rented for.
    string period?;
    MeondemandpagesRentPrice price?;
};

# Metadata about the group.
public type TagMetadata record {
    # A collection of information that is connected to this resource.
    TagMetadataConnections connections;
};

public type Channel record {
    # The categories to which this channel belongs as specified by the channel moderators.
    Category[] categories;
    # The time in ISO 8601 format when the channel was created.
    string created_time;
    # A brief explanation of the channel's content.
    string? description;
    # The banner that appears by default at the top of the channel page.
    Picture header;
    # The URL to access the channel in a browser.
    string link;
    # Metadata about the channel.
    ChannelMetadata metadata;
    # The time in ISO 8601 format when the album was last modified.
    string modified_time;
    # The display name that identifies the channel.
    string name;
    # The active image for the channel; defaults to the thumbnail of the last video added to the channel.
    Picture pictures;
    # The privacy settings of the channel.
    ChannelPrivacy privacy;
    # The channel resource key.
    string resource_key;
    # An array of all tags assigned to this channel.
    Tag[] tags;
    # The unique identifier to access the channel resource.
    string uri;
    # The Vimeo user who owns the channel.
    User user;
};

public type PresetsSettingsLogos record {
    # Whether the preset includes custom logo settings.
    boolean custom;
    # Whether the present includes sticky custom logo settings.
    boolean sticky_custom;
    # Whether the preset includes Vimeo logo settings.
    boolean vimeo;
};

# Information on subscribing to this video.
public type PurchaseinteractionSubscribe record {
    # Whether the On Demand subscription has DRM.
    boolean drm?;
    # The time in ISO 8601 format when the On Demand video will expire.
    string? expires_time?;
    # The URL to purchase this On Demand subscription on Vimeo.
    string? link?;
    # The time in ISO 8601 format when the On Demand was purchased.
    string? purchase_time?;
    # The user's streaming access to this On Demand subscription:
    # 
    # Option descriptions:
    #  * `available` - The On Demand subscription is available for streaming.
    #  * `purchased` - The On Demand subscription has been purchased.
    #  * `restricted` - Streaming for the On Demand subscription is restricted.
    #  * `unavailable` - The On Demand subscription is unavailable.
    string 'stream?;
    # The On Demand subscription's product URI.
    string? uri?;
};

public type AlbumIdVideosBody record {
    # A comma-separated list of video URIs.
    string videos;
};

# Data from video associated with version
public type VideoversionsMetadataConnectionsVideo record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is an admin of the album and may therefore add custom thumbnails. This data requires a bearer token with the `private` scope.
public type AlbumMetadataInteractionsAddCustomThumbnails record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about the videos that this user wants to watch later.
public type UserMetadataConnectionsWatchlater record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Metadata about the album.
public type PresetsMetadata record {
    # A list of resource URIs related to the album.
    PresetsMetadataConnections connections;
};

# Information about this video's ondemand data.
public type VideoMetadataConnectionsOndemand record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The On Demand connection resource key.
    string resource_key;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is a moderator of the channel and may therefore add or remove videos from the channel. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsModerateVideos record {
    # An array of HTTP methods allowed on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type MevideosSpatialDirectorTimeline record {
    # The timeline pitch. This value must be between -90 and 90.
    decimal pitch;
    # The timeline roll.
    decimal roll?;
    # The 360 director timeline time code.
    decimal time_code;
    # The timeline yaw. This value must be between 0 and 360.
    decimal yaw;
};

# Information about the videos that belong to this channel.
public type ChannelMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# An action indicating that the authenticated user is the owner of the channel and may therefore add other users as channel moderators. This data requires a bearer token with the `private` scope.
public type ChannelMetadataInteractionsAddModerators record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

# Information about purchasing this video.
public type OndemandvideoBuy record {
    # Whether this On Demand video can be purchased.
    boolean active;
    # A map of currency type to price.
    record {} price;
    # Whether this On Demand video has been purchased.
    boolean purchased?;
};

public type Category record {
    # The active icon for the category.
    Picture icon?;
    # The last time, in ISO 8601 format, that a video was featured.
    string last_video_featured_time;
    # The URL to access the category in a browser.
    string link;
    # Metadata about the category.
    CategoryMetadata metadata;
    # The display name that identifies the category.
    string name;
    # The container of this category's parent category, if the current category is a subcategory.
    CategoryParent? parent;
    # The active picture for this category; defaults to vertical color bars.
    Picture pictures;
    # The resource key of the category.
    string resource_key;
    # All the subcategories that belong to this category, if the current category is a top-level parent.
    CategorySubcategories[] subcategories?;
    # Whether the category isn't a subcategory of another category.
    boolean top_level;
    # The unique identifier to access the category resource.
    string uri;
};

public type User record {
    # The user's account type:
    # 
    # Option descriptions:
    #  * `basic` - The user has a Vimeo Basic subscription.
    #  * `business` - The user has a Vimeo Business subscription.
    #  * `live_business` - The user has a Vimeo Business Live subscription.
    #  * `live_premium` - The user has a Vimeo Premium subscription.
    #  * `live_pro` - The user has a Vimeo PRO Live subscription.
    #  * `plus` - The user has a Vimeo Plus subscription.
    #  * `pro` - The user has a Vimeo Pro subscription.
    #  * `pro_unlimited` - The user has a Vimeo PRO Unlimited subscription.
    #  * `producer` - The user has a Vimeo Producer subscription.
    string account;
    # The user's bio.
    string? bio;
    # The user's content filters:
    # 
    # Option descriptions:
    #  * `drugs` - Drugs or alcohol use.
    #  * `language` - Profanity or sexually suggestive content.
    #  * `nudity` - Nudity.
    #  * `safe` - Suitable for all audiences.
    #  * `unrated` - No rating.
    #  * `violence` - Violent or graphic content.
    string[] content_filter?;
    # The time in ISO 8601 format when the user account was created.
    string created_time;
    # The user's email address. This data requires a bearer token with the `email` scope.
    string email?;
    # The absolute URL of this user's profile page.
    string link;
    # The user's location.
    string? location;
    # The user's metadata.
    UserMetadata metadata;
    # The user's display name.
    string name;
    # The active portrait of this user.
    Picture pictures;
    UserPreferences preferences?;
    # The user's resource key string.
    string resource_key;
    # Appears only when the user has upload access and is looking at their own user record.
    UserUploadQuota upload_quota;
    # The user's canonical relative URI.
    string uri;
    # The user's websites.
    UserWebsites[] websites;
};

public type MeVideosPrivacy record {
    # Whether a user can add the video to an album, channel, or group. This value becomes the default add setting for all future videos uploaded by the user.
    boolean add?;
    # Who can comment on the video. This value becomes the default comment setting for all future videos that this user uploads.
    string comments?;
    # Whether a user can download the video. This value becomes the default download setting for all future videos that this user uploads.
    boolean download?;
    # The privacy for embed videos. The `whitelist` value enables you to define all valid embed domains. See our [documentation](https://developer.vimeo.com/api/endpoints/videos#/{video_id}/privacy/domains) for adding and removing domains.
    string embed?;
    # Who can view the video. This value becomes the default view setting for all future videos that this user uploads.
    string view?;
};

# The privacy settings of the channel.
public type ChannelPrivacy record {
    # Who can view the channel:
    # 
    # Option descriptions:
    #  * `anybody` - Anyone can view the channel.
    #  * `moderators` - Only moderators can view the channel.
    #  * `users` - Only registered users can view the channel.
    string view;
};

public type PagesOndemandIdBody record {
    # The custom string to use in this On Demand page's Vimeo URL.
    string link?;
    OndemandpagesondemandIdPreorder preorder?;
    OndemandpagesondemandIdPublish publish?;
    # Whether to publish the On Demand page automatically after all videos are finished transcoding.
    boolean publish_when_ready?;
};

public type MevideosEmbedButtons record {
    # Show or hide the Embed button.
    boolean embed?;
    # Show or hide the Fullscreen button.
    boolean fullscreen?;
    # Show or hide the HD button.
    boolean hd?;
    # Show or hide the Like button.
    boolean like?;
    # Show or hide the Scaling button (shown only in Fullscreen mode).
    boolean scaling?;
    # Show or hide the Share button.
    boolean share?;
    # Show or hide the Watch Later button.
    boolean watchlater?;
};

public type OndemandgenreInteractions record {
    # Interactions for On Demand pages that are in this genre.
    OndemandgenreInteractionsPage page;
};

public type PicturesPortraitsetIdBody record {
    # Whether the picture is the user's active portrait.
    boolean active?;
};

public type Credit record {
    # The name of the person credited.
    string name;
    # The character that this person portrayed, or the job that this person performed.
    string role;
    # The unique identifier to access the credits resource.
    string uri;
    # The Vimeo user associated with this credit.
    User user?;
    # The video associated with this credit.
    Video video?;
};

public type VideoIdPicturesBody1 record {
    # Whether the image created by the `time` field should be the default thumbnail for the video.
    boolean active?;
    # Creates an image of the video from the given time offset.
    decimal time?;
};

# The Videos connection.
public type OndemandseasonMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection ∂data.
    string uri;
};

# A collection of information that is connected to this resource.
public type AlbumMetadataConnections record {
    # Information about the videos that belong to this album.
    AlbumMetadataConnectionsVideos videos;
};

# A Collection of recommended users for the current user to follow. This data requires a bearer token with the `private` scope.
public type UserMetadataConnectionsRecommendedUsers record {
    # An array of HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options;
    # The total number of users on this connection. This data requires a bearer token with the `private` scope.
    decimal total;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri;
};

public type Auth record {
    # The access token string.
    string access_token;
    # The API application associated with the token.
    ApiApp app;
    # The date and time that the token expires.
    string expires_on?;
    # The refresh token string.
    string refresh_token?;
    # The scope or scopes that the token supports.
    string scope;
    # The token type:
    # 
    # Option descriptions:
    #  * `bearer` - The token is of the `bearer` type.
    string token_type;
    # The user associated with the token.
    User user?;
};

# Information about the videos that have been shared with this user.
public type UserMetadataConnectionsShared record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type VideoIdCreditsBody record {
    # The email address of the credited person.
    string email;
    # The name of the credited person.
    string name;
    # The role of the credited person.
    string role;
    # The URI of the Vimeo user who should be given credit in this video.
    string user_uri;
};

# Information about the users that the current user is following.
public type UserMetadataConnectionsFollowing record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of users on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type PicturesPortraitsetIdBody1 record {
    # Whether the picture is the user's active portrait.
    boolean active?;
};

# Information about the user's lifetime upload usage.
public type UserUploadQuotaLifetime record {
    # The number of bytes remaining in your lifetime maximum.
    decimal? free;
    # The total number of bytes that you can upload across the lifetime of your account.
    decimal? max;
    # The number of bytes that you've already uploaded against your lifetime limit.
    decimal? used;
};

# Related content for this video.
public type VideoMetadataConnectionsRelated record {
    # An array of HTTP methods allowed on this URI.
    string[] options?;
    # The API URI that resolves to the connection data.
    string uri?;
};

# Metadata about the album.
public type AlbumMetadata record {
    # A collection of information that is connected to this resource.
    AlbumMetadataConnections connections;
    # A list of resource URIs related to the album.
    AlbumMetadataInteractions? interactions;
};

public type OndemandpagePublished record {
    # Whether this On Demand page has been published.
    boolean enabled;
    # The time in IS 8601 format when this page was published.
    string time;
};

public type Comment record {
    # The time in ISO 8601 format when the comment was posted.
    string created_on;
    CommentMetadata metadata;
    # The resource key string for the comment.
    string resource_key;
    # The content of the comment.
    string text;
    # The Vimeo content to which the comment relates:
    # 
    # Option descriptions:
    #  * `video` - The comment is about a video.
    string 'type;
    # The unique identifier to access the comment resource.
    string uri;
    # The user who posted the comment.
    User user;
};

# A collection of information that is connected to this resource.
public type CategoryMetadataConnections record {
    # Information about the channels related to this category.
    CategoryMetadataConnectionsChannels channels;
    # Information about the groups related to this category.
    CategoryMetadataConnectionsGroups groups;
    # Information about the users related to this category.
    CategoryMetadataConnectionsUsers users;
    # Information about the videos related to this category.
    CategoryMetadataConnectionsVideos videos;
};

public type OnDemandGenre record {
    # The canonical name or URL slug of the genre.
    string canonical;
    OndemandgenreInteractions interactions;
    # The Vimeo URL for this genre.
    string link;
    OndemandgenreMetadata metadata;
    # The descriptive name of the genre.
    string name;
    # The relative URI of the On Demand genre.
    string uri;
};

# Information about the videos related to this category.
public type CategoryMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type Error record {
    # The error message that developers receive.
    string developer_message;
    # The error message that non-developer users receive.
    string 'error;
    # The error code.
    decimal error_code;
    # A link to more information about the error.
    string link;
};

public type MeondemandpagesSubscriptionMonthly record {
    # Whether monthly subscription is active. *Required if `rent.active` and `buy.active` are false.
    boolean active?;
    MeondemandpagesSubscriptionMonthlyPrice price?;
};

# A collection of information that is connected to this resource.
public type ChannelMetadataConnections record {
    # Information provided to channel moderators about which users they have specifically permitted to access a private channel. This data requires a bearer token with the `private` scope.
    ChannelMetadataConnectionsPrivacyUsers privacy_users;
    # Information about the users following or moderating this channel.
    ChannelMetadataConnectionsUsers users;
    # Information about the videos that belong to this channel.
    ChannelMetadataConnectionsVideos videos;
};

public type CustomThumbnailsThumbnailIdBody record {
    # Whether to make this the active album thumbnail.
    boolean active?;
};

public type VideoIdPicturesBody record {
    # Whether the image created by the `time` field should be the default thumbnail for the video.
    boolean active?;
    # Creates an image of the video from the given time offset.
    decimal time?;
};

public type VideoIdSetAlbumThumbnailBody1 record {
    # The video frame time in seconds to use as the album thumbnail.
    decimal time_code?;
};

# Information about the videos contained within this group.
public type GroupMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

public type GroupsBody record {
    # The description of the new group.
    string description?;
    # The name of the new group.
    string name;
};

# Information about the user's Watch Later interactions with this video.
public type OndemandvideoMetadataInteractionsWatchlater record {
    # Whether the user has added this video to their Watch Later queue.
    boolean added;
    # The time in ISO 8601 format when the user added this video to their Watch Later queue.
    string added_time;
    # The URI for the user to add this video to their Watch Later queue.
    string uri;
};

public type LogosLogoIdBody record {
    # Whether to make this the active album logo.
    boolean active?;
};

public type UserMetadataInteractionsAddPrivacyUser record {
    # An array of the HTTP methods permitted on this URI. This data requires a bearer token with the `private` scope.
    string[] options?;
    # The API URI that resolves to the connection data. This data requires a bearer token with the `private` scope.
    string uri?;
};

public type VideosvideoIdversionsUpload record {
    # Upload approach
    string approach;
    # If your upload approach is pull, Vimeo will download the video hosted at this public URL. This URL must be valid for at least 24 hours.
    string link?;
    # The app's redirect URL. Use this parameter when `approach` is `post`.
    string redirect_url?;
    # Upload size
    string size?;
};

public type VideoIdTexttracksBody record {
    # Active text tracks appear in the player and are visible to other users. Only one text track per language can be active.
    boolean active?;
    # The language of the text track. For a complete list of valid languages, use the [/languages?filter=texttracks](https://developer.vimeo.com/api/endpoints/videos#GET/languages) endpoint.
    string language;
    # The name of the text track.
    string name;
    # The type of the text track.
    string 'type;
};

# Information about the videos that belong to this album.
public type AlbumMetadataConnectionsVideos record {
    # An array of the HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about the videos uploaded by this user.
public type UserMetadataConnectionsVideos record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The total number of videos on this connection.
    decimal total;
    # The API URI that resolves to the connection data.
    string uri;
};

# Information about where and how to report a video.
public type VideoMetadataInteractionsReport record {
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # A list of valid reasons for reporting a video.
    string[] reason;
    # The API URI that resolves to the connection data.
    string uri;
};

public type UserIdProjectsBody record {
    # The name of the project.
    string name;
};

# An action indicating if the authenticated user has followed this category.
public type CategoryMetadataInteractionsFollow record {
    # Whether the authenticated user has followed this category.
    boolean added;
    # The time in ISO 8601 format that the user followed this category, or the null value if the user hasn't followed this category.
    string? added_time;
    # The URI for following or unfollowing this category: PUT to this URI to follow the category, or DELETE to this URI to unfollow the category.
    string uri;
};

public type CommentMetadataConnections record {
    # Information about this comment's replies.
    CommentMetadataConnectionsReplies replies;
};

# Information about whether the authenticated user has liked this video.
public type VideoMetadataInteractionsLike record {
    # Whether the user has liked the video.
    boolean added;
    # The time in ISO 8601 format when the user liked the video.
    string added_time;
    # An array of HTTP methods permitted on this URI.
    string[] options;
    # The API URI that resolves to the connection data.
    string uri;
};
