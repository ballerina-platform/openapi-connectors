// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# The author of this Post.
public type PostAuthor record {
    # The display name.
    string displayName?;
    # The identifier of the creator.
    string id?;
    # The creator's avatar.
    CommentAuthorImage image?;
    # The URL of the creator's Profile page.
    string url?;
};

public type PostImages record {
    string url?;
};

public type PostPerUserInfo record {
    # ID of the Blog that the post resource belongs to.
    string blogId?;
    # True if the user has Author level access to the post.
    boolean hasEditAccess?;
    # The kind of this entity. Always blogger#postPerUserInfo.
    string kind?;
    # ID of the Post resource.
    string postId?;
    # ID of the User.
    string userId?;
};

# The location for geotagged posts.
public type PostLocation record {
    # Location's latitude.
    float lat?;
    # Location's longitude.
    float lng?;
    # Location name.
    string name?;
    # Location's viewport span. Can be used when rendering a map preview.
    string span?;
};

public type User record {
    # Profile summary information.
    string about?;
    # The container of blogs for this user.
    UserBlogs blogs?;
    # The timestamp of when this profile was created, in seconds since epoch.
    string created?;
    # The display name.
    string displayName?;
    # The identifier for this User.
    string id?;
    # The kind of this entity. Always blogger#user.
    string kind?;
    # This user's locale
    UserLocale locale?;
    # The API REST URL to fetch this resource from.
    string selfLink?;
    # The user's profile page.
    string url?;
};

# Data about the blog containing this comment.
public type CommentBlog record {
    # The identifier of the blog containing this comment.
    string id?;
};

public type Page record {
    # The author of this Page.
    PageAuthor author?;
    # Data about the blog containing this Page.
    PageBlog blog?;
    # The body content of this Page, in HTML.
    string content?;
    # Etag of the resource.
    string etag?;
    # The identifier for this resource.
    string id?;
    # The kind of this entity. Always blogger#page.
    string kind?;
    # RFC 3339 date-time when this Page was published.
    string published?;
    # The API REST URL to fetch this resource from.
    string selfLink?;
    # The status of the page for admin resources (either LIVE or DRAFT).
    string status?;
    # The title of this entity. This is the name displayed in the Admin user interface.
    string title?;
    # RFC 3339 date-time when this Page was last updated.
    string updated?;
    # The URL that this Page is displayed at.
    string url?;
};

# The creator's avatar.
public type CommentAuthorImage record {
    # The creator's avatar URL.
    string url?;
};

public type PostList record {
    # Etag of the response.
    string etag?;
    # The list of Posts for this Blog.
    Post[] items?;
    # The kind of this entity. Always blogger#postList.
    string kind?;
    # Pagination token to fetch the next page, if one exists.
    string nextPageToken?;
    # Pagination token to fetch the previous page, if one exists.
    string prevPageToken?;
};

# Data about the comment this is in reply to.
public type CommentInreplyto record {
    # The identified of the parent of this comment.
    string id?;
};

public type PostUserInfo record {
    # The kind of this entity. Always blogger#postUserInfo.
    string kind?;
    Post post?;
    PostPerUserInfo post_user_info?;
};

public type Blog record {
    # The JSON custom meta-data for the Blog.
    string customMetaData?;
    # The description of this blog. This is displayed underneath the title.
    string description?;
    # The identifier for this resource.
    string id?;
    # The kind of this entry. Always blogger#blog.
    string kind?;
    # The locale this Blog is set to.
    BlogLocale locale?;
    # The name of this blog. This is displayed as the title.
    string name?;
    # The container of pages in this blog.
    BlogPages pages?;
    # The container of posts in this blog.
    BlogPosts posts?;
    # RFC 3339 date-time when this blog was published.
    string published?;
    # The API REST URL to fetch this resource from.
    string selfLink?;
    # The status of the blog.
    string status?;
    # RFC 3339 date-time when this blog was last updated.
    string updated?;
    # The URL where this blog is published.
    string url?;
};

public type PostUserInfosList record {
    # The list of Posts with User information for the post, for this Blog.
    PostUserInfo[] items?;
    # The kind of this entity. Always blogger#postList.
    string kind?;
    # Pagination token to fetch the next page, if one exists.
    string nextPageToken?;
};

# This user's locale
public type UserLocale record {
    # The country this blog's locale is set to.
    string country?;
    # The language this blog is authored in.
    string language?;
    # The language variant this blog is authored in.
    string variant?;
};

public type Comment record {
    # The author of this Comment.
    CommentAuthor author?;
    # Data about the blog containing this comment.
    CommentBlog blog?;
    # The actual content of the comment. May include HTML markup.
    string content?;
    # The identifier for this resource.
    string id?;
    # Data about the comment this is in reply to.
    CommentInreplyto inReplyTo?;
    # The kind of this entry. Always blogger#comment.
    string kind?;
    # Data about the post containing this comment.
    CommentPost post?;
    # RFC 3339 date-time when this comment was published.
    string published?;
    # The API REST URL to fetch this resource from.
    string selfLink?;
    # The status of the comment (only populated for admin users).
    string status?;
    # RFC 3339 date-time when this comment was last updated.
    string updated?;
};

# The container of comments on this Post.
public type PostReplies record {
    # The List of Comments for this Post.
    Comment[] items?;
    # The URL of the comments on this post.
    string selfLink?;
    # The count of comments on this post.
    string totalItems?;
};

# The container of posts in this blog.
public type BlogPosts record {
    # The List of Posts for this Blog.
    Post[] items?;
    # The URL of the container for posts in this blog.
    string selfLink?;
    # The count of posts in this blog.
    int totalItems?;
};

public type Post record {
    # The author of this Post.
    PostAuthor author?;
    # Data about the blog containing this Post.
    PostBlog blog?;
    # The content of the Post. May contain HTML markup.
    string content?;
    # The JSON meta-data for the Post.
    string customMetaData?;
    # Etag of the resource.
    string etag?;
    # The identifier of this Post.
    string id?;
    # Display image for the Post.
    PostImages[] images?;
    # The kind of this entity. Always blogger#post.
    string kind?;
    # The list of labels this Post was tagged with.
    string[] labels?;
    # The location for geotagged posts.
    PostLocation location?;
    # RFC 3339 date-time when this Post was published.
    string published?;
    # Comment control and display setting for readers of this post.
    string readerComments?;
    # The container of comments on this Post.
    PostReplies replies?;
    # The API REST URL to fetch this resource from.
    string selfLink?;
    # Status of the post. Only set for admin-level requests.
    string status?;
    # The title of the Post.
    string title?;
    # The title link URL, similar to atom's related link.
    string titleLink?;
    # RFC 3339 date-time when this Post was last updated.
    string updated?;
    # The URL where this Post is displayed.
    string url?;
};

public type BlogUserInfo record {
    Blog blog?;
    BlogPerUserInfo blog_user_info?;
    # The kind of this entity. Always blogger#blogUserInfo.
    string kind?;
};

public type BlogList record {
    # Admin level list of blog per-user information.
    BlogUserInfo[] blogUserInfos?;
    # The list of Blogs this user has Authorship or Admin rights over.
    Blog[] items?;
    # The kind of this entity. Always blogger#blogList.
    string kind?;
};

# The container of pages in this blog.
public type BlogPages record {
    # The URL of the container for pages in this blog.
    string selfLink?;
    # The count of pages in this blog.
    int totalItems?;
};

# The locale this Blog is set to.
public type BlogLocale record {
    # The country this blog's locale is set to.
    string country?;
    # The language this blog is authored in.
    string language?;
    # The language variant this blog is authored in.
    string variant?;
};

public type PageviewsCounts record {
    # Count of page views for the given time range.
    string count?;
    # Time range the given count applies to.
    string timeRange?;
};

# Data about the blog containing this Post.
public type PostBlog record {
    # The identifier of the Blog that contains this Post.
    string id?;
};

# The container of blogs for this user.
public type UserBlogs record {
    # The URL of the Blogs for this user.
    string selfLink?;
};

# The author of this Comment.
public type CommentAuthor record {
    # The display name.
    string displayName?;
    # The identifier of the creator.
    string id?;
    # The creator's avatar.
    CommentAuthorImage image?;
    # The URL of the creator's Profile page.
    string url?;
};

# Data about the post containing this comment.
public type CommentPost record {
    # The identifier of the post containing this comment.
    string id?;
};

public type CommentList record {
    # Etag of the response.
    string etag?;
    # The List of Comments for a Post.
    Comment[] items?;
    # The kind of this entry. Always blogger#commentList.
    string kind?;
    # Pagination token to fetch the next page, if one exists.
    string nextPageToken?;
    # Pagination token to fetch the previous page, if one exists.
    string prevPageToken?;
};

# The author of this Page.
public type PageAuthor record {
    # The display name.
    string displayName?;
    # The identifier of the creator.
    string id?;
    # The creator's avatar.
    CommentAuthorImage image?;
    # The URL of the creator's Profile page.
    string url?;
};

public type PageList record {
    # Etag of the response.
    string etag?;
    # The list of Pages for a Blog.
    Page[] items?;
    # The kind of this entity. Always blogger#pageList.
    string kind?;
    # Pagination token to fetch the next page, if one exists.
    string nextPageToken?;
};

# Data about the blog containing this Page.
public type PageBlog record {
    # The identifier of the blog containing this page.
    string id?;
};

public type BlogPerUserInfo record {
    # ID of the Blog resource.
    string blogId?;
    # True if the user has Admin level access to the blog.
    boolean hasAdminAccess?;
    # The kind of this entity. Always blogger#blogPerUserInfo.
    string kind?;
    # The Photo Album Key for the user when adding photos to the blog.
    string photosAlbumKey?;
    # Access permissions that the user has for the blog (ADMIN, AUTHOR, or READER).
    string role?;
    # ID of the User.
    string userId?;
};

public type Pageviews record {
    # Blog Id.
    string blogId?;
    # The container of posts in this blog.
    PageviewsCounts[] counts?;
    # The kind of this entry. Always blogger#page_views.
    string kind?;
};
