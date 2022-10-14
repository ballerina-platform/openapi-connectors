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

# User fields.
public type UserFieldsObject record {
    # The User's account type. Can be BUSINESS, MEDIA_CREATOR, or PERSONAL.
    string account_type?;
    # The app user's app-scoped ID (version 11.0+) or raw user ID (version 10.0 and lower).
    string id?;
    # The number of Media on the User. This field requires the instagram_graph_user_media permission.
    string media_count?;
    # The User's username.
    string username?;
};

# Media fields.
public type MediaFieldsObject record {
    # The Media's ID.
    string id?;
    # The Media's caption text. Not returnable for Media in albums.
    string caption?;
    # The Media's type. Can be `IMAGE`, `VIDEO`, or `CAROUSEL_ALBUM`.
    string media_type?;
    # The Media's URL.
    string media_url?;
    # The Media's permanent URL. Will be omitted if the Media contains copyrighted material, or has been flagged for a copyright violation.
    string permalink?;
    # The Media's thumbnail image URL. Only available on VIDEO Media.
    string thumbnail_url?;
    # The Media's publish date in ISO 8601 format.
    string timestamp?;
    # The Media owner's username.
    string username?;
};

# Pagination cursor.
public type PagingCursors record {
    # This is the cursor that points to the start of the page of data that has been returned.
    string before?;
    # This is the cursor that points to the end of the page of data that has been returned.
    string after?;
};
