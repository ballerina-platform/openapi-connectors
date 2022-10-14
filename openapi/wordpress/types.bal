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

public type PostArr Post[];

public type RevisionArr Revision[];

public type PageArr Page[];

public type MediaArr Media[];

public type TypeArr Type[];

public type StatusArr Status[];

public type CommentArr Comment[];

public type TaxonomyArr Taxonomy[];

public type CategoryArr Category[];

public type TagArr Tag[];

public type UserArr User[];

# Type of resource.
public type FormdataMediaType string;

# Maximum number of items to be returned in result set. Default 10
public type FormdataPerPage int;

# Current page of the collection. Default 1
public type FormdataPage int;

public type MediaIdBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The title for the object.
    record {} title?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Alternative text to display when resource is not displayed.
    string alt_text?;
    # The caption for the resource.
    string caption?;
    # The description for the resource
    string description?;
    # The id for the associated post of the resource.
    string post?;
};

# Ensure result set excludes posts assigned to specific authors.
public type FormdataAuthorExclude string;

# The excerpt for the object
public type FormdataExcerpt string;

# Alternative text to display when resource is not displayed.
public type FormdataMimeType string;

public type Page record {
    *CommonPostPage;
    # The id for the parent of the object.
    int parent?;
    # The order of the object in relation to other object of its type.
    int menu_order?;
    # The theme file to use to display the object.
    string template?;
};

# Order sort attribute ascending or descending. Default desc
public type FormdataOrder string;

# Whether or not comments are open on the object
public type FormdataCommentStatus string;

# HTML title for the resource.
public type FormdataName string;

# Whether to hide resources not assigned to any posts.
public type FormdataHideEmpty boolean;

# The content for the object.
public type FormdataContent string;

public type UsersBody record {
    # The user name for the resource.
    string username?;
    # HTML title for the resource.
    string name;
    # The first name for the resource.
    string first_name?;
    # The last name for the resource.
    string last_name?;
    # Email of the resource.
    string email?;
    # URL of the resource.
    string url?;
    # The description for the resource
    string description?;
    # The nickname for the resource.
    string nickname?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Roles assigned to the resource.
    string[] roles?;
    # The A password to protect access to the post.
    string password?;
    # All capabilities used by the resource.
    string[] capabilities?;
};

# The order of the object in relation to other object of its type.
public type FormdataMenuOrder int;

# Limit result set to that from a specific author email. Requires authorization.
public type FormdataAuthorEmail string;

# Whether or not the object should be treated as sticky.
public type FormdataSticky boolean;

# Limit response to resources published before a given ISO8601 compliant date.
public type FormdataBefore string;

# Ensure result set includes specific ids.
public type FormdataInclude string;

public type Status record {
    # Whether posts with this resource should be private.
    boolean 'private?;
    # Whether posts with this resource should be protected.
    boolean protected?;
    # Whether posts of this resource should be shown in the front end of the site.
    boolean 'public?;
    # Whether posts with this resource should be publicly-queryable.
    boolean queryable?;
    # Whether to include posts in the edit listing for their post type.
    boolean show_in_list?;
    # The title for the resource.
    string name?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
};

# Limit result set to posts assigned a specific status.Default publish
public type FormdataStatus string;

public type Media record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The globally unique identifier for the object.
    record {} guid?;
    # Unique identifier for the object.
    int id?;
    # The date the object was last modified, in the site's timezone.
    string modified?;
    # The date the object was last modified, as GMT.
    string modified_gmt?;
    # The A password to protect access to the post.
    string password?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
    # A named status for the object.
    string status?;
    # Type of Post for the object.
    string 'type?;
    # The title for the object.
    string title?;
    # The id for the author of the object.
    int author?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Alternative text to display when resource is not displayed
    string alt_text?;
    # The caption for the resource.
    string caption?;
    # The description for the resource.
    string description?;
    # Type of resource.
    string media_type?;
    # Mime type of resource.
    string mime_type?;
    # Details about the resource file, specific to its type.
    string media_details?;
    # The id for the associated post of the resource.
    int post?;
    # URL to the original resource file.
    string source_url?;
};

# The description for the resource
public type FormdataDescription string;

# All capabilities used by the resource.
public type FormdataCapabilities string[];

public type PostsBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The title for the object.
    record {} title?;
    # The content for the object.
    string content?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # The excerpt for the object
    record {} excerpt?;
    # The id of the featured media for the object.
    string featured_media?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Whether or not the object should be treated as sticky.
    boolean sticky?;
    # Limit result set to all items that have the specified term assigned in the categories taxonomy.
    string[] categories?;
    # Limit result set to all items that have the specified term assigned in the tags taxonomy.
    string[] tags?;
};

public type TagsBody record {
    # The description for the resource
    string description?;
    # HTML title for the resource.
    string name;
    # Limit result set to posts with a specific slug.
    string slug?;
};

# Limit result set to that of a particular comment karma. Requires authorization
public type FormdataKarma string;

# Offset the result set by a specific number of items.
public type FormdataOffset string;

# The date the object was published, as GMT.
public type FormdataDateGmt string;

# The caption for the resource.
public type FormdataCaption string;

public type Revision record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The globally unique identifier for the object.
    record {} guid?;
    # Unique identifier for the object.
    int id?;
    # The date the object was last modified, in the site's timezone.
    string modified?;
    # The date the object was last modified, as GMT.
    string modified_gmt?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
    # The title for the object.
    string title?;
    # The content for the object.
    record {} content?;
    # The id for the author of the object.
    int author?;
    # The excerpt for the object
    record {} excerpt?;
    # The id for the parent of the object.
    int parent?;
};

# The id of the featured media for the object.
public type FormdataFeaturedMedia string;

public type UsersIdBody record {
    # The user name for the resource.
    string username?;
    # HTML title for the resource.
    string name;
    # The first name for the resource.
    string first_name?;
    # The last name for the resource.
    string last_name?;
    # Email of the resource.
    string email?;
    # URL of the resource.
    string url?;
    # The description for the resource
    string description?;
    # The nickname for the resource.
    string nickname?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Roles assigned to the resource.
    string[] roles?;
    # The A password to protect access to the post.
    string password?;
    # All capabilities used by the resource.
    string[] capabilities?;
};

# The id for the parent of the object.
public type FormdataParent int;

# Limit result set to all items that have the specified term assigned in the categories taxonomy.
public type FormdataCategories string[];

# URL of the resource.
public type FormdataUrl string;

# The last name for the resource.
public type FormdataLastName string;

# The theme file to use to display the object.
public type FormdataTemplate int;

public type PagesBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The id for the parent of the object.
    int parent?;
    # The title for the object.
    record {} title?;
    # The content for the object.
    string content?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # The excerpt for the object
    record {} excerpt?;
    # The id of the featured media for the object.
    string featured_media?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # The order of the object in relation to other object of its type.
    int menu_order?;
    # The theme file to use to display the object.
    int template?;
};

public type User record {
    # Unique identifier for the object.
    int id?;
    # Login name for the resource.
    string username?;
    # Display name for the resource.
    string name?;
    # First name for the resource.
    string first_name?;
    # Last name for the resource.
    string last_name?;
    # The email address for the resource.
    string email?;
    # URL of the resource.
    string url?;
    # Description of the resource.
    string description?;
    # Author URL to the resource.
    string link?;
    # The nickname for the resource.
    string nickname?;
    # An alphanumeric identifier for the resource.
    string slug?;
    # Registration date for the resource.
    string registered_date?;
    # Roles assigned to the resource.
    string[] roles?;
    # Password for the resource (never included).
    string password?;
    # All capabilities assigned to the resource.
    string[] capabilities?;
    # Any extra capabilities assigned to the resource.
    string[] extra_capabilities?;
    # Avatar URLs for the resource.
    string[] avatar_urls?;
};

public type Category record {
    *Tag;
    # The id for the parent of the object.
    int parent?;
};

# The title for the object.
public type FormdataTitle string;

public type Taxonomy record {
    *Type;
    # Whether or not the term cloud should be displayed.
    boolean show_cloud?;
    # Types associated with resource.
    string[] types?;
};

public type PostsIdBody record {
    # Current page of the collection. Default 1
    int page?;
    # Maximum number of items to be returned in result set. Default 10
    int per_page?;
    # Limit results to those matching a string.
    string search?;
    # Limit response to resources published after a given ISO8601 compliant date.
    string after?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # Ensure result set excludes posts assigned to specific authors.
    string author_exclude?;
    # Limit response to resources published before a given ISO8601 compliant date.
    string before?;
    # Ensure result set excludes specific ids.
    string exclude?;
    # Ensure result set includes specific ids.
    string include?;
    # Offset the result set by a specific number of items.
    string offset?;
    # Order sort attribute ascending or descending. Default desc
    string 'order?;
    # Sort collection by object attribute. Default date
    string orderby?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # Use WP Query arguments to modify the response; private query vars require appropriate authorization.
    string filter?;
    # Limit result set to all items that have the specified term assigned in the categories taxonomy.
    string[] categories?;
    # Limit result set to all items that have the specified term assigned in the tags taxonomy.
    string[] tags?;
};

# Whether or not the object can be pinged.
public type FormdataPingStatus string;

public type TagsIdBody record {
    # The description for the resource
    string description?;
    # HTML title for the resource.
    string name;
    # Limit result set to posts with a specific slug.
    string slug?;
};

# The first name for the resource.
public type FormdataFirstName string;

public type FormdataReassign string;

# Limit response to resources published after a given ISO8601 compliant date.
public type FormdataAfter string;

public type CategoriesIdBody record {
    # The description for the resource
    string description?;
    # HTML title for the resource.
    string name;
    # Limit result set to posts with a specific slug.
    string slug?;
    # The id for the parent of the object.
    int parent?;
};

# Roles assigned to the resource.
public type FormdataRoles string[];

public type CategoriesBody record {
    # The description for the resource
    string description?;
    # HTML title for the resource.
    string name;
    # Limit result set to posts with a specific slug.
    string slug?;
    # The id for the parent of the object.
    int parent?;
};

# Limit result set to posts assigned to specific authors.
public type FormdataAuthor string;

# The user name for the resource.
public type FormdataUsername string;

# Sort collection by object attribute. Default date
public type FormdataOrderby string;

# Limit result set to comments assigned a specific type. Requires authorization. Default comment
public type FormdataType string;

public type Comment record {
    # Unique identifier for the object.
    int id?;
    # The id for the author of the object.
    int author?;
    # Email address for the object author.
    string author_email?;
    # IP address for the object author.
    string author_ip?;
    # Display name for the object author.
    string author_name?;
    # URL for the object author.
    string author_url?;
    # User agent for the object author.
    string author_user_agent?;
    # The content for the object.
    record {} content?;
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # Karma for the object
    string karma?;
    # URL to the object.
    string link?;
    # The id for the parent of the object.
    int parent?;
    # The id for the associated post of the resource.
    int post?;
    # A named status for the object.
    string status?;
    # Type of Post for the object.
    string 'type?;
    # Avatar URLs for the object author.
    string author_avatar_urls?;
};

# Limit results to those matching a string.
public type FormdataSearch string;

# Alternative text to display when resource is not displayed.
public type FormdataAltText string;

public type Post record {
    *CommonPostPage;
    # The format for the object.
    string format?;
    # Whether or not the object should be treated as sticky.
    boolean sticky?;
    # The terms assigned to the object in the category taxonomy.
    int[] categories?;
    # he terms assigned to the object in the post_tag taxonomy.
    int[] tags?;
};

# Use WP Query arguments to modify the response; private query vars require appropriate authorization.
public type FormdataFilter string;

public type PagesIdBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The id for the parent of the object.
    int parent?;
    # The title for the object.
    record {} title?;
    # The content for the object.
    string content?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # The excerpt for the object
    record {} excerpt?;
    # The id of the featured media for the object.
    string featured_media?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # The order of the object in relation to other object of its type.
    int menu_order?;
    # The theme file to use to display the object.
    int template?;
};

public type CommonPostPage record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The globally unique identifier for the object.
    record {} guid?;
    # Unique identifier for the object.
    int id?;
    # URL to the object.
    string link?;
    # The date the object was last modified, in the site's timezone.
    string modified?;
    # The date the object was last modified, as GMT.
    string modified_gmt?;
    # The A password to protect access to the post.
    string password?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
    # A named status for the object.
    string status?;
    # Type of Post for the object.
    string 'type?;
    # The title for the object.
    record {} title?;
    # The content for the object.
    record {} content?;
    # The id for the author of the object.
    int author?;
    # The excerpt for the object
    record {} excerpt?;
    # The id of the featured media for the object.
    int featured_media?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
};

public type CommentsBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The title for the object.
    record {} title?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Alternative text to display when resource is not displayed.
    string alt_text?;
    # The caption for the resource.
    string caption?;
    # The description for the resource
    string description?;
    # The id for the associated post of the resource.
    string post?;
};

# Limit result set to posts with a specific slug.
public type FormdataSlug string;

# Ensure result set excludes specific ids.
public type FormdataParentExclude string;

# Limit result set to all items that have the specified term assigned in the tags taxonomy.
public type FormdataTags string[];

# The A password to protect access to the post.
public type FormdataPassword string;

# Ensure result set excludes specific ids.
public type FormdataExclude string;

# Email of the resource.
public type FormdataEmail string;

public type Type record {
    # All capabilities used by the resource.
    string[] capabilities?;
    # A human-readable description of the resource.
    string description?;
    # Whether or not the resource should have children.
    boolean hierarchical?;
    # Human-readable labels for the resource for various contexts.
    record {} labels?;
    # The title for the resource.
    string name?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
};

# The date the object was published, in the site's timezone.
public type FormdataDate string;

public type MediaBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The title for the object.
    record {} title?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Alternative text to display when resource is not displayed.
    string alt_text?;
    # The caption for the resource.
    string caption?;
    # The description for the resource
    string description?;
    # The id for the associated post of the resource.
    string post?;
};

# The nickname for the resource.
public type FormdataNickname string;

public type CommentsIdBody record {
    # The date the object was published, in the site's timezone.
    string date?;
    # The date the object was published, as GMT.
    string date_gmt?;
    # The A password to protect access to the post.
    string password?;
    # Limit result set to posts with a specific slug.
    string slug?;
    # Limit result set to posts assigned a specific status.Default publish
    string status?;
    # The title for the object.
    record {} title?;
    # Limit result set to posts assigned to specific authors.
    int author?;
    # Whether or not comments are open on the object
    string comment_status?;
    # Whether or not the object can be pinged.
    string ping_status?;
    # Alternative text to display when resource is not displayed.
    string alt_text?;
    # The caption for the resource.
    string caption?;
    # The description for the resource
    string description?;
    # The id for the associated post of the resource.
    string post?;
};

# The id for the associated post of the resource.
public type FormdataPost string;

public type Tag record {
    # Unique identifier for the object.
    int id?;
    # Number of published posts for the resource.
    int count?;
    # The description for the resource.
    string description?;
    # URL to the object.
    string link?;
    # The title for the resource.
    string name?;
    # An alphanumeric identifier for the object unique to its type.
    string slug?;
    # Type attribution for the resource.
    string taxonomy?;
};
