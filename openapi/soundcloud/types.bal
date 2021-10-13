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

public type Connections Connection[];

# SoundCloud User object
public type User record {
    # URL to a JPEG image
    string avatar_url?;
    # city
    string city?;
    # country
    string country?;
    # profile creation datetime
    string created_at?;
    # description
    string description?;
    # discogs name
    string discogs_name?;
    # first name
    string first_name?;
    # number of followers
    int followers_count?;
    # number of followed users
    int followings_count?;
    # first and last name
    string full_name?;
    # unique identifier
    int id?;
    # kind of resource
    string kind?;
    # last modified datetime
    string last_modified?;
    # last name
    string last_name?;
    # myspace name
    string myspace_name?;
    # permalink of the resource
    string permalink?;
    # URL to the SoundCloud.com page
    string permalink_url?;
    # subscription plan of the user
    string plan?;
    # number of public playlists
    int playlist_count?;
    # number of favorited public tracks
    int public_favorites_count?;
    # number of reposts from user
    int reposts_count?;
    # a list subscriptions associated with the user
    anydata[][] subscriptions?;
    # number of public tracks
    int track_count?;
    # API resource URL
    string uri?;
    # username
    string username?;
    # a URL to the website
    string website?;
    # a custom title for the website
    string website_title?;
};

# Soundcloud Playlist Object
public type InlineResponse201 record {
    # URL to a JPEG image.
    string artwork_url?;
    # Created timestamp.
    string created_at?;
    # Playlist description.
    string description?;
    # is downloadable.
    boolean downloadable?;
    # Playlist duration.
    int duration?;
    # European Article Number.
    string ean?;
    # Embeddable by.
    string embeddable_by?;
    # Playlist genre.
    string genre?;
    # Playlist identifier.
    int id?;
    # Type of Soundcloud object (playlist).
    string kind?;
    # Label user identifier.
    int label_id?;
    # Label name.
    string label_name?;
    # Last modified timestamp.
    string last_modified?;
    # License.
    string license?;
    # Playlist permalink.
    string permalink?;
    # Playlist permalink URL.
    string permalink_url?;
    # Type of playlist.
    string playlist_type?;
    # Purchase title.
    string purchase_title?;
    # Purchase URL.
    string purchase_url?;
    # Release.
    string release?;
    # Day of release.
    int release_day?;
    # Month of release.
    int release_month?;
    # Year of release.
    int release_year?;
    # Type of sharing (private/public).
    string sharing?;
    # Is streamable.
    boolean streamable?;
    # Tags.
    string tag_list?;
    # Playlist title.
    string title?;
    # Count of tracks.
    int track_count?;
    # List of tracks.
    InlineResponse201Tracks[] tracks?;
    # Playlist type.
    string 'type?;
    # Playlist URI.
    string uri?;
    # SoundCloud User object.
    MetaUser? user?;
    # User identifier.
    int user_id?;
};

public type  InlineResponse200 Users|UsersList;

public type CreateupdateplaylistrequestPlaylist record {
    # Description of the playlist
    string description?;
    # public or private
    string sharing?;
    # Title of the playlist
    string title?;
    # List of tracks to add to playlist
    CreateupdateplaylistrequestPlaylistTracks[] tracks?;
};

public type MetaUsers record {
    MetaUser[] collection?;
    string next_href?;
};

public type Users record {
    User[] collection?;
    string next_href?;
};

# SoundCloud User object
public type UserslistInner record {
    # URL to a JPEG image
    string avatar_url?;
    # city
    string city?;
    # country
    string country?;
    # description
    string description?;
    # discogs name
    string discogs_name?;
    # first name
    string first_name?;
    # number of followers
    int followers_count?;
    # number of followed users
    int followings_count?;
    # first and last name
    string full_name?;
    # unique identifier
    int id?;
    # kind of resource
    string kind?;
    # last modified datetime
    string last_modified?;
    # last name
    string last_name?;
    # myspace name
    string myspace_name?;
    # permalink of the resource
    string permalink?;
    # URL to the SoundCloud.com page
    string permalink_url?;
    # subscription plan of the user
    string plan?;
    # number of public playlists
    int playlist_count?;
    # number of favorited public tracks
    int public_favorites_count?;
    # number of reposts from user
    int reposts_count?;
    # a list subscriptions associated with the user
    anydata[][] subscriptions?;
    # number of public tracks
    int track_count?;
    # API resource URL
    string uri?;
    # username
    string username?;
    # a URL to the website
    string website?;
    # a custom title for the website
    string website_title?;
};

@deprecated
public type UsersList UserslistInner[];

# SoundCloud User object.
public type MetaUser record {
    # URL to a JPEG image
    string avatar_url?;
    # profile creation datetime
    string created_at?;
    # unique identifier
    int id?;
    # kind of resource
    string kind?;
    # last modified datetime
    string last_modified?;
    # permalink of the resource
    string permalink?;
    # URL to the SoundCloud.com page
    string permalink_url?;
    # API resource URL
    string uri?;
    # username
    string username?;
};

# Soundcloud Playlist Object
public type Playlist record {
    # URL to a JPEG image.
    string artwork_url?;
    # Created timestamp.
    string created_at?;
    # Playlist description.
    string description?;
    # is downloadable.
    boolean downloadable?;
    # Playlist duration.
    int duration?;
    # European Article Number.
    string ean?;
    # Embeddable by.
    string embeddable_by?;
    # Playlist genre.
    string genre?;
    # Playlist identifier.
    int id?;
    # Type of Soundcloud object (playlist).
    string kind?;
    # SoundCloud User object.
    MetaUser? label?;
    # Label user identifier.
    int label_id?;
    # Label name.
    string label_name?;
    # Last modified timestamp.
    string last_modified?;
    # License.
    string license?;
    # Count of playlist likes.
    int likes_count?;
    # Playlist permalink.
    string permalink?;
    # Playlist permalink URL.
    string permalink_url?;
    # Type of playlist.
    string playlist_type?;
    # Purchase title.
    string purchase_title?;
    # Purchase URL.
    string purchase_url?;
    # Release.
    string release?;
    # Day of release.
    int release_day?;
    # Month of release.
    int release_month?;
    # Year of release.
    int release_year?;
    # Type of sharing (private/public).
    string sharing?;
    # Is streamable.
    boolean streamable?;
    # Tags.
    string tag_list?;
    # Tags.
    string? tags?;
    # Playlist title.
    string title?;
    # Count of tracks.
    int track_count?;
    # List of tracks.
    Track[] tracks?;
    # tracks URI.
    string? tracks_uri?;
    # Playlist type.
    string 'type?;
    # Playlist URI.
    string uri?;
    # SoundCloud User object.
    MetaUser? user?;
    # User identifier.
    int user_id?;
};

@deprecated
public type PlaylistsArray Playlist[];

public type ActivitiesCollection record {
    # Created timestamp.
    string created_at?;
    # Origin.
    record {} origin?;
    # Type of activity (track).
    string 'type?;
};

public type WebprofilesInner record {
    # Timestamp of when the link was added to the profile.
    string created_at?;
    # Id
    int id?;
    # Kind
    string kind?;
    # Service or platform
    string 'service?;
    # Link's title
    string title?;
    # URL of the external link
    string url?;
    # Username extracted from the external link
    string username?;
};

@deprecated
public type TracksList Track[];

public type TrackstrackIdcommentsComment record {
    # Comment's content
    string body;
    # Timestamp of a comment. String or float representation is supported
    string|decimal timestamp?;
};

public type Streams record {
    string hls_mp3_128_url?;
    string hls_opus_64_url?;
    string http_mp3_128_url?;
    string preview_mp3_128_url?;
};

# SoundCloud Complete User object
public type CompleteUser record {
    # URL to a JPEG image.
    string avatar_url?;
    # city.
    string city?;
    # country.
    string country?;
    # description.
    string description?;
    # discogs name.
    string discogs_name?;
    # first name.
    string first_name?;
    # number of followers.
    int followers_count?;
    # number of followed users.
    int followings_count?;
    # first and last name.
    string full_name?;
    # unique identifier
    int id?;
    # kind of resource.
    string kind?;
    # last modified timestamp.
    string last_modified?;
    # last name.
    string last_name?;
    # locale.
    string locale?;
    # myspace name
    string myspace_name?;
    # permalink of the resource.
    string permalink?;
    # URL to the SoundCloud.com page.
    string permalink_url?;
    # subscription plan of the user.
    string plan?;
    # number of public playlists.
    int playlist_count?;
    # boolean if email is confirmed.
    boolean primary_email_confirmed?;
    # number of private playlists.
    int private_playlists_count?;
    # number of private tracks.
    int private_tracks_count?;
    # number of favorited public tracks
    int public_favorites_count?;
    # user's upload quota
    CompleteuserQuota quota?;
    # number of reposts from user
    int reposts_count?;
    # a list subscriptions associated with the user
    anydata[][] subscriptions?;
    # number of public tracks.
    int track_count?;
    # API resource URL.
    string uri?;
    # username
    string username?;
    # a URL to the website.
    string website?;
    # a custom title for the website.
    string website_title?;
};

# User's activities.
public type Activities record {
    ActivitiesCollection[] collection?;
    string future_href?;
    string next_href?;
};

public type CreateUpdatePlaylistRequest record {
    CreateupdateplaylistrequestPlaylist playlist?;
};

# User's Comment
public type Comment record {
    # Comment body.
    string body?;
    # Created timestamp.
    string created_at?;
    # Identifier.
    int id?;
    # Kind (comment).
    string kind?;
    # Timestamp.
    string timestamp?;
    # Track's identifier.
    int track_id?;
    # Comment's URL.
    string uri?;
    # SoundCloud User object
    CommentUser user?;
    # User's identifier.
    int user_id?;
};

# SoundCloud User object
public type CommentUser record {
    # URL to a JPEG image.
    string avatar_url?;
    # number of followers.
    int followers_count?;
    # number of followed users.
    int followings_count?;
    # unique identifier
    int id?;
    # kind of resource.
    string kind?;
    # last modified timestamp.
    string last_modified?;
    # permalink of the resource.
    string permalink?;
    # URL to the SoundCloud.com page.
    string permalink_url?;
    # number of reposts from user
    int reposts_count?;
    # API resource URL.
    string uri?;
    # username
    string username?;
};

# Soundcloud Track object.
public type InlineResponse201Tracks record {
    # URL to a JPEG image.
    string artwork_url?;
    # Tempo.
    int bpm?;
    # Number of comments.
    int comment_count?;
    # Is commentable.
    boolean commentable?;
    # Created timestamp.
    string created_at?;
    # Track description.
    string description?;
    # NUmber of downloads.
    int download_count?;
    # Is downloadable.
    string downloadable?;
    # Track duration.
    int duration?;
    # Embeddable by.
    string embeddable_by?;
    # Number of favoritings.
    int favoritings_count?;
    # Genre
    string genre?;
    # Track identifier.
    int id?;
    # ISRC code.
    string isrc?;
    # Key signature.
    string key_signature?;
    # Type of object (track).
    string kind?;
    # Label user name.
    string label_name?;
    # License
    string license?;
    # Permalink URL.
    string permalink_url?;
    # Number of plays.
    int playback_count?;
    # Purchase title.
    string purchase_title?;
    # Purchase URL.
    string purchase_url?;
    # Release.
    string release?;
    # Day of release.
    int release_day?;
    # Month of release.
    int release_month?;
    # Year of release.
    int release_year?;
    # Type of sharing (public/private).
    string sharing?;
    # URL to stream.
    string stream_url?;
    # Is streamable.
    boolean streamable?;
    # Tags.
    string tag_list?;
    # Track title.
    string title?;
    # Track URI.
    string uri?;
    # SoundCloud User object.
    MetaUser? user?;
    # Is user's favourite.
    boolean user_favorite?;
    # Number of plays by a user.
    int user_playback_count?;
    # Waveform URL.
    string waveform_url?;
};

public type Tracks record {
    Track[] collection?;
    string next_href?;
};

public type Comments record {
    Comment[] collection?;
    string? next_href?;
};

public type Connection record {
    # Created timestamp.
    string created_at?;
    # Full Name.
    string display_name?;
    # Unique identifier
    int id?;
    # Kind of resource.
    string kind?;
    boolean post_favorite?;
    boolean post_publish?;
    # Service.
    string 'service?;
    # Type.
    string 'type?;
    # The external link URI.
    string uri?;
};

public type Error record {
    int code?;
    string? _error?;
    anydata[] errors?;
    string link?;
    string message?;
    string status?;
};

public type TrackMetadataRequest record {
    TrackmetadatarequestTrack track?;
};

public type Found record {
    # Location URL of the resource.
    string location?;
    # Status code.
    string status?;
};

public type TrackDataRequest record {
    string 'track\[artwork\_data\]?;
    string 'track\[asset\_data\]?;
    boolean 'track\[commentable\]?;
    string 'track\[description\]?;
    boolean 'track\[downloadable\]?;
    # who can embed this track "all", "me", or "none"
    string 'track\[embeddable\_by\]?;
    string 'track\[genre\]?;
    string 'track\[isrc\]?;
    string 'track\[label\_name\]?;
    # Possible values: no-rights-reserved, all-rights-reserved, cc-by, cc-by-nc, cc-by-nd, cc-by-sa, cc-by-nc-nd, cc-by-nc-sa
    string 'track\[license\]?;
    string 'track\[permalink\]?;
    string 'track\[purchase\_url\]?;
    string 'track\[release\]?;
    # string, formatted as yyyy-mm-dd, representing release date
    string 'track\[release\_date\]?;
    string 'track\[sharing\]?;
    boolean 'track\[streamable\]?;
    # The tag_list property contains a list of tags separated by spaces. Multiword tags are quoted in double quotes. We also support machine tags that follow the pattern NAMESPACE:KEY=VALUE. For example: geo:lat=43.555 camel:size=medium “machine:tag=with space” Machine tags are not revealed to the user on the track pages.
    string 'track\[tag\_list\]?;
    string 'track\[title\]?;
};

# user's upload quota
public type CompleteuserQuota record {
    # unlimited upload quota.
    boolean unlimited_upload_quota?;
    # upload seconds used.
    int upload_seconds_used?;
};

@deprecated
public type CommentsList Comment[];

public type CreateupdateplaylistrequestPlaylistTracks record {
    # SoundCloud track id
    string id;
};

public type TooManyRequests record {
    *Error;
    string spam_warning_urn?;
};

public type  InlineResponse2001 Tracks|TracksList;

public type Playlists record {
    Playlist[] collection?;
    string next_href?;
};

public type  InlineResponse2003 Comments|CommentsList;

public type  InlineResponse2002 Playlists|PlaylistsArray;

public type TrackIdCommentsBody record {
    TrackstrackIdcommentsComment comment?;
};

# Soundcloud Track object.
public type Track record {
    # Level of access the user (logged in or anonymous) has to the track.
    #   * `playable` - user is allowed to listen to a full track.
    #   * `preview` - user is allowed to preview a track, meaning a snippet is available
    #   * `blocked` - user can only see the metadata of a track, no streaming is possible
    string? access?;
    # URL to a JPEG image.
    string artwork_url?;
    # List of countries where track is available.
    string available_country_codes?;
    # Tempo.
    int bpm?;
    # Number of comments.
    int comment_count?;
    # Is commentable.
    boolean commentable?;
    # Created timestamp.
    string created_at?;
    # Track description.
    string description?;
    # NUmber of downloads.
    int download_count?;
    # URL to download a track.
    string download_url?;
    # Is downloadable.
    string downloadable?;
    # Track duration.
    int duration?;
    # Embeddable by.
    string embeddable_by?;
    # Number of favoritings.
    int favoritings_count?;
    # Genre
    string genre?;
    # Track identifier.
    int id?;
    # ISRC code.
    string isrc?;
    # Key signature.
    string key_signature?;
    # Type of object (track).
    string kind?;
    # Label user name.
    string label_name?;
    # License
    string license?;
    # Permalink URL.
    string permalink_url?;
    # Number of plays.
    int playback_count?;
    # Purchase title.
    string purchase_title?;
    # Purchase URL.
    string purchase_url?;
    # Release.
    string release?;
    # Day of release.
    int release_day?;
    # Month of release.
    int release_month?;
    # Year of release.
    int release_year?;
    # Number of reposts.
    int reposts_count?;
    # Secret URL.
    string secret_uri?;
    # Type of sharing (public/private).
    string sharing?;
    # URL to stream.
    string stream_url?;
    # Is streamable.
    boolean streamable?;
    # Tags.
    string tag_list?;
    # Track title.
    string title?;
    # Track URI.
    string uri?;
    # SoundCloud User object.
    MetaUser? user?;
    # Is user's favourite.
    boolean user_favorite?;
    # Number of plays by a user.
    int user_playback_count?;
    # Waveform URL.
    string waveform_url?;
};

# User's links added to their profile
# User's links added to their profile
public type WebProfiles WebprofilesInner[];

public type TrackmetadatarequestTrack record {
    boolean commentable?;
    string description?;
    boolean downloadable?;
    # who can embed this track "all", "me", or "none"
    string embeddable_by?;
    string genre?;
    string isrc?;
    string label_name?;
    # Possible values: no-rights-reserved, all-rights-reserved, cc-by, cc-by-nc, cc-by-nd, cc-by-sa, cc-by-nc-nd, cc-by-nc-sa
    string license?;
    string permalink?;
    string purchase_url?;
    string release?;
    # string, formatted as yyyy-mm-dd, representing release date
    string release_date?;
    string sharing?;
    boolean streamable?;
    # The tag_list property contains a list of tags separated by spaces. Multiword tags are quoted in double quotes. We also support machine tags that follow the pattern NAMESPACE:KEY=VALUE. For example: geo:lat=43.555 camel:size=medium “machine:tag=with space” Machine tags are not revealed to the user on the track pages.
    string tag_list?;
    string title?;
};
