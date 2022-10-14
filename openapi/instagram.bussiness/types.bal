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

# Comment response.
public type CommentResponse record {
    # ID of the comment.
    string id?;
};

# Comment information.
public type Comment record {
    # ID of the comment.
    string id?;
    # Time when the comment is created.
    string timestamp?;
    # Comment content.
    string text?;
    # The boolean that shows if the comment is hidden.
    boolean hidden?;
    # The number of likes.
    int like_count?;
    # Comment media.
    string media?;
    # Replies for comment.
    string replies?;
    # Comment author.
    string user?;
    # The username for the user.
    string username?;
};

# An object containing the media data requested.
public type Comments record {
    # An array containing comments.
    Comment[] data?;
    # A cursor-paginated edge.
    Paging paging?;
};

# A cursor-paginated edge.
public type Paging record {
    # Pagination cursor.
    PagingCursors cursors?;
    # The Graph API endpoint that will return the next page of data. If not included, this is the last page of data. 
    # 
    # Due to how pagination works with visibility and privacy, it is possible that a page may be empty but contain 
    # a next paging link. Stop paging when the next link no longer appears.
    anydata next?;
    # The Graph API endpoint that will return the previous page of data. If not included, this is the first page of data.
    anydata previous?;
};

# An object containing the media data requested.
public type Media record {
    # An array containing requested media fields.
    MediaFieldsObject[] data?;
    # A cursor-paginated edge.
    Paging paging?;
};

# Media fields.
public type MediaFieldsObject record {
    # The Media's ID.
    string id?;
    # The Media's caption text. Not returnable for Media in albums.
    string caption?;
    # The Media's type. Can be `IMAGE`, `VIDEO`, or `CAROUSEL_ALBUM`.
    string media_type?;
    # Media URL. 
    # Will be omitted from responses if the media contains copyrighted material, or has been flagged for a copyright violation.
    string media_url?;
    # The Media's permanent URL.
    string permalink?;
    # The Media's thumbnail image URL. Only available on VIDEO Media.
    string thumbnail_url?;
    # ISO 8601 formatted creation date in UTC (default is UTC ±00:00)
    string timestamp?;
    # Username of user who created the media.
    string username?;
    # ID of Instagram user who created the media. 
    # Only returned if the app user making the query also created the media, otherwise username field will be returned instead.
    string owner?;
    # Count of comments on the media. 
    # Excludes comments on album child media and the media's caption. Includes replies on comments.
    int comments_count?;
    # Instagram media ID.
    string ig_id?;
    # Indicates if comments are enabled or disabled. Excludes album children.
    boolean is_comment_enabled?;
    # Count of likes on the media. 
    # Excludes likes on album child media and likes on promoted posts created from the media. Includes replies on comments.
    int like_count?;
    # Surface where the media is published. 
    # Can be AD, FEED, IGTV, or STORY. Will return FEED instead of IGTV if targeting an Instagram TV video created on or after October 5, 2021.
    string media_product_type?;
    # Shortcode to the media.
    int shortcode?;
    # Instagram TV media title. Will not be returned if targeting an Instagram TV video created on or after October 5, 2021.
    string video_title?;
};

# Values
public type MediametricobjectValues record {
    # Value
    anydata[] value?;
};

# Bussiness discover data object.
public type BussinessDiscoveryData record {
    # Information about the Instagram Business account.
    BussinessdiscoverydataBusinessDiscovery business_discovery?;
};

# Media metrics
public type MediaMetrics record {
    # Array of media metrics.
    MediaMetricObject[] data?;
};

# User metric object.
public type UserMetricObject record {
    # Name
    string name?;
    # Period
    string period?;
    # Values
    MediametricobjectValues values?;
    # Title
    string title?;
    # Description
    string description?;
    # ID
    string id?;
};

# Information about the Instagram Business account.
public type BussinessdiscoverydataBusinessDiscovery record {
    # The bio of the person.
    string biography?;
    # The unique identifier of the Instagram business account.
    string id?;
    # Instagram ID.
    string ig_id?;
    # The followers count of the profile.
    int followers_count?;
    # The follows count of the profile.
    int follows_count?;
    # The media count of the profile.
    int media_count?;
    # The name of the person.
    string name?;
    # The profile picture of the person.
    string profile_picture_url?;
    # The username of the person.
    string username?;
    # The website of the person.
    string website?;
    # An object containing the media data requested.
    Media media?;
};

# Hashtag response.
public type HashtagResponse record {
    # The hashtag's ID (included by default). IDs are static and global.
    string id?;
    # The hashtag's name, without the leading hash symbol.
    string name?;
};

# Media metric object.
public type MediaMetricObject record {
    # Name
    string name?;
    # Period
    string period?;
    # Values
    MediametricobjectValues values?;
    # Title
    string title?;
    # Description
    string description?;
    # ID
    string id?;
};

public type Hashtags record {
    # An array containing hashtag IDs.
    HashtagResponse[] data?;
};

# Pagination cursor.
public type PagingCursors record {
    # This is the cursor that points to the start of the page of data that has been returned.
    string before?;
    # This is the cursor that points to the end of the page of data that has been returned.
    string after?;
};

# Array of user metrics
public type UserMetrics record {
    # Array of user metrics
    UserMetricObject[] data?;
};
