// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type PlayListDetails record {
    boolean collaborative?;
    string description?;
    string name;
    boolean 'public?;
};

public type UserPlayListDetails record {
    string href?;
    SimplifiedPlaylistObject[] items?;
    int 'limit?;
    string? next?;
    int offset?;
    string? previous?;
    int total?;
};

public type PlaylistTrackInsertionDetails record {
    int position?;
    string[] uris?;
};

public type PlayListReorderDetails record {
    int insert_before?;
    int range_length?;
    int range_start?;
    string snapshot_id?;
    string[] uris?;
};

public type PlaylistTrackDetails record {
    string href?;
    PlaylistTrackObject[] items?;
    int 'limit?;
    string? next?;
    int offset?;
    string? previous?;
    int total?;
};

public type ChangePlayListDetails record {
    boolean collaborative?;
    string description?;
    string name?;
    boolean 'public?;
};

public type CurrentPlaylistDetails record {
    string href?;
    SimplifiedPlaylistObject[] items?;
    int 'limit?;
    string? next?;
    int offset?;
    string? previous?;
    int total?;
};

public type PlaylistObject record {
    boolean collaborative?;
    string description?;
    ExternalUrlObject external_urls?;
    FollowersObject followers?;
    string href?;
    string id?;
    ImageObject[] images?;
    string name?;
    PublicUserObject owner?;
    boolean 'public?;
    string snapshot_id?;
    record  { string href?; PlaylistTrackObject[] items?; int 'limit?; string? next?; int offset?; string? previous?; int total?;}  tracks?;
    string 'type?;
    string uri?;
};

public type ImageObject record {
    int height?;
    string url?;
    int width?;
};

public type SnapshotIdObject record {
    string snapshot_id?;
};

public type ErrorResponseObject record {
    ErrorObject _error?;
};

public type SimplifiedPlaylistObject record {
    boolean collaborative?;
    string description?;
    ExternalUrlObject external_urls?;
    string href?;
    string id?;
    ImageObject[] images?;
    string name?;
    PublicUserObject owner?;
    boolean 'public?;
    string snapshot_id?;
    PlaylistTracksRefObject tracks?;
    string 'type?;
    string uri?;
};

public type PlaylistTrackObject record {
    string added_at?;
    PublicUserObject added_by?;
    boolean is_local?;
    anydata track?;
};

public type ExternalUrlObject record {
    string spotify?;
};

public type FollowersObject record {
    string? href?;
    int total?;
};

public type PublicUserObject record {
    string display_name?;
    ExternalUrlObject external_urls?;
    FollowersObject followers?;
    string href?;
    string id?;
    ImageObject[] images?;
    string 'type?;
    string uri?;
};

public type ErrorObject record {
    string message?;
    int status?;
};

public type PlaylistTracksRefObject record {
    string href?;
    int total?;
};

public type EpisodeObject record {
    string audio_preview_url?;
    string description?;
    int duration_ms?;
    boolean explicit?;
    ExternalUrlObject external_urls?;
    string href?;
    string html_description?;
    string id?;
    ImageObject[] images?;
    boolean is_externally_hosted?;
    boolean is_playable?;
    string language?;
    string[] languages?;
    string name?;
    string release_date?;
    string release_date_precision?;
    EpisodeRestrictionObject restrictions?;
    ResumePointObject resume_point?;
    SimplifiedShowObject show?;
    string 'type?;
    string uri?;
};

public type EpisodeRestrictionObject record {
    string reason?;
};

public type ResumePointObject record {
    boolean fully_played?;
    int resume_position_ms?;
};

public type SimplifiedShowObject record {
    string[] available_markets?;
    CopyrightObject[] copyrights?;
    string description?;
    boolean explicit?;
    ExternalUrlObject external_urls?;
    string href?;
    string html_description?;
    string id?;
    ImageObject[] images?;
    boolean is_externally_hosted?;
    string[] languages?;
    string media_type?;
    string name?;
    string publisher?;
    string 'type?;
    string uri?;
};

public type CopyrightObject record {
    string text?;
    string 'type?;
};

public type SimplifiedArtistObject record {
    ExternalUrlObject external_urls?;
    string href?;
    string id?;
    string name?;
    string 'type?;
    string uri?;
};

public type SimplifiedAlbumObject record {
    string album_group?;
    string album_type?;
    SimplifiedArtistObject[] artists?;
    string[] available_markets?;
    ExternalUrlObject external_urls?;
    string href?;
    string id?;
    ImageObject[] images?;
    string name?;
    string release_date?;
    string release_date_precision?;
    AlbumRestrictionObject restrictions?;
    int total_tracks?;
    string 'type?;
    string uri?;
};

public type AlbumRestrictionObject record {
    string reason?;
};

public type ArtistObject record {
    ExternalUrlObject external_urls?;
    FollowersObject followers?;
    string[] genres?;
    string href?;
    string id?;
    ImageObject[] images?;
    string name?;
    int popularity?;
    string 'type?;
    string uri?;
};

public type ExternalIdObject record {
    string ean?;
    string isrc?;
    string upc?;
};

public type LinkedTrackObject record {
    ExternalUrlObject external_urls?;
    string href?;
    string id?;
    string 'type?;
    string uri?;
};

public type TrackRemovingDetails record {
    string snapshot_id?;
    string[] tracks;
};

public type TrackObject record {
    SimplifiedAlbumObject album?;
    ArtistObject[] artists?;
    string[] available_markets?;
    int disc_number?;
    int duration_ms?;
    boolean explicit?;
    ExternalIdObject external_ids?;
    ExternalUrlObject external_urls?;
    string href?;
    string id?;
    boolean is_local?;
    boolean is_playable?;
    LinkedTrackObject linked_from?;
    string name?;
    int popularity?;
    string preview_url?;
    TrackRestrictionObject restrictions?;
    int track_number?;
    string 'type?;
    string uri?;
};

public type TrackRestrictionObject record {
    string reason?;
};
