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

public type ArticleIndexArr ArticleIndex[];

public type ArticleMeArr ArticleMe[];

public type CommentArr Comment[];

public type FollowerArr Follower[];

public type FollowedTagArr FollowedTag[];

public type ListingArr Listing[];

public type jsonArr json[];

public type UserArr User[];

public type PodcastEpisodeArr PodcastEpisode[];

public type ReadingListArr ReadingList[];

public type TagArr Tag[];

public type ArticleVideoArr ArticleVideo[];

public type WebhookIndexArr WebhookIndex[];

public type ArticleVideo record {
    # The preview image of the video
    string cloudinary_video_url;
    int id;
    string path;
    string title;
    string type_of;
    ArticlevideoUser user;
    int user_id;
    # The duration of the video.
    # 
    # If the video duration is below 1 hour, the format will be `mm:ss`,
    # if it's 1 hour or above the format will be `h:mm:ss`.
    string video_duration_in_minutes;
    string video_source_url;
};

public type ListingcreateListing record {
    # Set it to "draft" to create an unpublished listing
    string action?;
    # The body of the listing in Markdown format.
    string body_markdown;
    ListingCategory category;
    # True if users are allowed to contact the listing's owner
    # via DEV connect, false otherwise.
    # 
    # Defaults to false.
    boolean contact_via_connect?;
    # Date and time of expiration.
    string expires_at?;
    # Geographical area or city for the listing.
    string location?;
    # The id of the organization the user is creating the listing for.
    # 
    # Only users belonging to an organization can assign the listing to it.
    int organization_id?;
    # Comma separated list of tags.
    # 
    # A maximum of 8 tags are allowed.
    string tag_list?;
    # Tags related to the listing.
    # 
    # A maximum of 8 tags are allowed and it takes precedence over `tag_list`.
    string[] tags?;
    string title;
};

# Organization
public type Organization record {
    string? github_username?;
    # Date of joining
    string joined_at?;
    string? location?;
    string name?;
    # Profile image (640x640)
    string profile_image?;
    string? story?;
    string? summary?;
    string? tag_line?;
    string? tech_stack?;
    string? twitter_username?;
    string type_of?;
    string url?;
    string username?;
};

public type User record {
    string? github_username;
    int id;
    # Date of joining (formatted with strftime `"%b %e, %Y"`)
    string joined_at;
    string? location;
    string name;
    # Profile image (320x320)
    string profile_image;
    string? summary;
    string? twitter_username;
    string type_of;
    string username;
    string? website_url;
};

public type ArticleCreate record {
    ArticlecreateArticle article?;
};

public type ArticleMe record {
    # The body of the article in Markdown format
    string body_markdown;
    string canonical_url;
    int comments_count;
    string? cover_image;
    string description;
    # Flare tag of the article
    ArticleFlareTag flare_tag?;
    int id;
    # The organization the resource belongs to
    SharedOrganization organization?;
    int page_views_count;
    string path;
    int positive_reactions_count;
    int public_reactions_count;
    boolean published;
    string published_at;
    # Crossposting or published date time
    string published_timestamp;
    # Reading time, in minutes
    int reading_time_minutes;
    string slug;
    string[] tag_list;
    string title;
    string type_of;
    string url;
    # The resource creator
    SharedUser user;
};

public type ListingCreate record {
    ListingcreateListing listing?;
};

public type ArticlevideoUser record {
    # The user's name
    string name?;
};

# The resource creator
public type SharedUser record {
    string? github_username?;
    string name?;
    # Profile image (640x640)
    string profile_image?;
    # Profile image (90x90)
    string profile_image_90?;
    string? twitter_username?;
    string username?;
    string? website_url?;
};

public type ArticleIndex record {
    string canonical_url;
    int comments_count;
    string? cover_image;
    string created_at;
    string? crossposted_at;
    string description;
    string? edited_at;
    # Flare tag of the article
    ArticleFlareTag flare_tag?;
    int id;
    string last_comment_at;
    # The organization the resource belongs to
    SharedOrganization organization?;
    string path;
    int positive_reactions_count;
    int public_reactions_count;
    string published_at;
    # Crossposting or published date time
    string published_timestamp;
    string readable_publish_date;
    # Reading time, in minutes
    int reading_time_minutes;
    string slug;
    string social_image;
    string[] tag_list;
    string tags;
    string title;
    string type_of;
    string url;
    # The resource creator
    SharedUser user;
};

public type PodcastepisodePodcast record {
    string image_url?;
    string slug?;
    string title?;
};

public type PodcastEpisode record {
    int id;
    string image_url;
    string path;
    PodcastepisodePodcast podcast;
    string title;
    string type_of;
};

# The organization the resource belongs to
public type SharedOrganization record {
    string name?;
    # Profile image (640x640)
    string profile_image?;
    # Profile image (90x90)
    string profile_image_90?;
    string slug?;
    string username?;
};

public type WebhookcreateWebhookEndpoint record {
    # An array of events identifiers
    string[] events;
    # The name of the requester, eg. "DEV"
    string 'source;
    string target_url;
};

# Webhook
public type WebhookShow record {
    string created_at?;
    # An array of events identifiers
    string[] events?;
    int id?;
    # The name of the requester, eg. "DEV"
    string 'source?;
    string target_url?;
    string type_of?;
    # The resource creator
    SharedUser user?;
};

# Profile image
public type ProfileImage record {
    # Discriminates what is the type of the profile image owner (user or organization)
    string image_of?;
    # Profile image (640x640)
    string profile_image?;
    # Profile image (90x90)
    string profile_image_90?;
    string type_of?;
};

public type APIError record {
    string 'error;
    int status;
};

public type ArticleShow record {
    string body_html;
    string body_markdown;
    string canonical_url;
    int comments_count;
    string? cover_image;
    string created_at;
    string? crossposted_at;
    string description;
    string? edited_at;
    # Flare tag of the article
    ArticleFlareTag flare_tag?;
    int id;
    string last_comment_at;
    # The organization the resource belongs to
    SharedOrganization organization?;
    string path;
    int positive_reactions_count;
    int public_reactions_count;
    string published_at;
    # Crossposting or published date time
    string published_timestamp;
    string readable_publish_date;
    # Reading time, in minutes
    int reading_time_minutes;
    string slug;
    string social_image;
    string tag_list;
    string[] tags;
    string title;
    string type_of;
    string url;
    # The resource creator
    SharedUser user;
};

# Webhook creation payload
public type WebhookCreate record {
    WebhookcreateWebhookEndpoint webhook_endpoint?;
};

public type Comment record {
    # HTML formatted comment
    string body_html;
    Comment[] children;
    string created_at;
    string id_code;
    string type_of;
    # The resource creator
    SharedUser user;
};

public type ListingupdateListing record {
    # This param can be provided by itself to invoke some actions:
    # 
    # - `bump` bumps the listing and charge either the
    #   organization or the user
    # - `publish` publishes a draft listing
    # - `unpublish` unpublishes a published listing
    # 
    # It will take priority on any other param in the payload.
    string action?;
    # The body of the listing in Markdown format.
    string body_markdown?;
    ListingCategory category?;
    # True if users are allowed to contact the listing's owner
    # via DEV connect, false otherwise.
    # 
    # Defaults to false.
    boolean contact_via_connect?;
    # Date and time of expiration.
    string expires_at?;
    # Geographical area or city for the listing.
    string location?;
    # Comma separated list of tags.
    # 
    # A maximum of 8 tags are allowed.
    string tag_list?;
    # Tags related to the listing.
    # 
    # A maximum of 8 tags are allowed and it takes precedence over `tag_list`.
    string[] tags?;
    string title?;
};

public type Follower record {
    # Date the user became a follower
    string created_at;
    # Follow id
    int id;
    string name;
    string path;
    # Profile image (60x60)
    string profile_image;
    string type_of;
    string username;
};

public type FollowedTag record {
    # Tag id
    int id;
    string name;
    float points;
};

public type ListingUpdate record {
    ListingupdateListing listing?;
};

public type ArticleUpdate record {
    ArticleupdateArticle article?;
};

public type ArticleupdateArticle record {
    # The body of the article.
    # 
    # It can contain an optional front matter. For example
    # 
    # ```markdown
    # ---
    # title: Hello, World!
    # published: true
    # tags: discuss, help
    # date: 20190701T10:00Z
    # series: Hello series
    # canonical_url: https://example.com/blog/hello
    # cover_image: article_published_cover_image
    # ---
    # ```
    # 
    # `date`, `series` and `canonical_url` are optional.
    # `date` is the publication date-time
    # `series` is the name of the series the article belongs to
    # `canonical_url` is the canonical URL of the article
    # `cover_image` is the main image of the article
    # 
    # *If the markdown contains a front matter, it will take precedence
    # on the equivalent params given in the payload.*
    string body_markdown?;
    string canonical_url?;
    string description?;
    string main_image?;
    # Only users belonging to an organization can assign the article to it
    int organization_id?;
    # True to create a published article, false otherwise. Defaults to false
    boolean published?;
    # Article series name.
    # 
    # All articles belonging to the same series need to have the same name
    # in this parameter.
    # 
    # To remove an article from a series, the `null` value can be used.
    string series?;
    string[] tags?;
    string title?;
};

# Webhook
public type WebhookIndex record {
    string created_at?;
    # An array of events identifiers
    string[] events?;
    int id?;
    # The name of the requester, eg. "DEV"
    string 'source?;
    string target_url?;
    string type_of?;
};

# Flare tag of the article
public type ArticleFlareTag record {
    # Background color (hexadecimal)
    string bg_color_hex?;
    string name?;
    # Text color (hexadecimal)
    string text_color_hex?;
};

public type ArticlecreateArticle record {
    # The body of the article.
    # 
    # It can contain an optional front matter. For example
    # 
    # ```markdown
    # ---
    # title: Hello, World!
    # published: true
    # tags: discuss, help
    # date: 20190701T10:00Z
    # series: Hello series
    # canonical_url: https://example.com/blog/hello
    # cover_image: article_published_cover_image
    # ---
    # ```
    # 
    # `date`, `series` and `canonical_url` are optional.
    # `date` is the publication date-time
    # `series` is the name of the series the article belongs to
    # `canonical_url` is the canonical URL of the article
    # `cover_image` is the main image of the article
    # 
    # *If the markdown contains a front matter, it will take precedence
    # on the equivalent params given in the payload.*
    string body_markdown?;
    string canonical_url?;
    string description?;
    string main_image?;
    # Only users belonging to an organization can assign the article to it
    int organization_id?;
    # True to create a published article, false otherwise. Defaults to false
    boolean published?;
    # Article series name.
    # 
    # All articles belonging to the same series need to have the same name
    # in this parameter.
    string series?;
    string[] tags?;
    string title?;
};

public type Listing record {
    string body_markdown;
    ListingCategory category;
    int id;
    # The organization the resource belongs to
    SharedOrganization organization?;
    string processed_html;
    boolean published;
    string slug;
    string tag_list;
    string[] tags;
    string title;
    string type_of;
    # The resource creator
    SharedUser user;
};

public type ListingCategory string;

public type ReadingList record {
    ArticleIndex article;
    string created_at;
    # Follow id
    int id;
    string status;
    string type_of;
};

public type Tag record {
    # Background color (hexadecimal)
    string bg_color_hex;
    int id;
    string name;
    # Text color (hexadecimal)
    string text_color_hex;
};
