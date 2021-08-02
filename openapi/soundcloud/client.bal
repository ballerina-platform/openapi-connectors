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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ApiKeysConfig record {
    map<string> apiKeys;
};

# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.soundcloud.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # Likes a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + return - Success
    remote isolated function likePlaylist(int playlist_id) returns json|error {
        string  path = string `/likes/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Unlikes a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + return - Success
    remote isolated function unlikePlaylist(int playlist_id) returns json|error {
        string  path = string `/likes/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Likes a track.
    #
    # + track_id - SoundCloud Track id
    # + return - Success
    remote isolated function likeTrack(int track_id) returns json|error {
        string  path = string `/likes/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Unlikes a track.
    #
    # + track_id - SoundCloud Track id
    # + return - Success
    remote isolated function unlikeTrack(int track_id) returns json|error {
        string  path = string `/likes/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Returns the authenticated user’s information.
    #
    # + return - Success
    remote isolated function getUserDetail() returns CompleteUser|error {
        string  path = string `/me`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompleteUser response = check self.clientEp-> get(path, accHeaders, targetType = CompleteUser);
        return response;
    }
    # Returns the authenticated user's activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string  path = string `/me/activities`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp-> get(path, accHeaders, targetType = Activities);
        return response;
    }
    # Recent the authenticated user's activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getOwnActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string  path = string `/me/activities/all/own`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp-> get(path, accHeaders, targetType = Activities);
        return response;
    }
    # Returns the authenticated user's recent track related activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getRecentTrackRelatedActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string  path = string `/me/activities/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp-> get(path, accHeaders, targetType = Activities);
        return response;
    }
    # Returns a list of the authenticated user's connected social accounts.
    #
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function listConnectedSocialAccounts(int 'limit = 50, int offset = 0) returns Connections|error {
        string  path = string `/me/connections`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Connections response = check self.clientEp-> get(path, accHeaders, targetType = Connections);
        return response;
    }
    # Returns the authenticated user's connected social account.
    #
    # + connection_id - SoundCloud connection id
    # + return - Success
    remote isolated function getConnectionByID(int connection_id) returns Connection|error {
        string  path = string `/me/connections/${connection_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Connection response = check self.clientEp-> get(path, accHeaders, targetType = Connection);
        return response;
    }
    # Returns a list of users who are following the authenticated user.
    #
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getFollowers(int 'limit = 50) returns InlineResponse200|error {
        string  path = string `/me/followers`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a list of users who are followed by the authenticated user.
    #
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function listFollowings(int 'limit = 50, int offset = 0) returns InlineResponse200|error {
        string  path = string `/me/followings`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a list of recent tracks from users followed by the authenticated user.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function listRecentTracks(string[]? access = (), int 'limit = 50, int offset = 0) returns TracksList|error {
        string  path = string `/me/followings/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "offset": offset, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TracksList response = check self.clientEp-> get(path, accHeaders, targetType = TracksList);
        return response;
    }
    # Follows a user.
    #
    # + user_id - SoundCloud User id
    # + return - Success
    remote isolated function followUser(int user_id) returns json|error {
        string  path = string `/me/followings/${user_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Deletes a user who is followed by the authenticated user.
    #
    # + user_id - SoundCloud User id
    # + return - Success
    remote isolated function deleteFollowing(int user_id) returns json|error {
        string  path = string `/me/followings/${user_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Returns a list of favorites or liked tracks of the authenticated user.
    #
    # + 'limit - Number of results to return in the collection.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listLikedTracks(int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/me/likes/tracks`;
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns user’s playlists (sets).
    #
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listPlaylist(int 'limit = 50) returns PlaylistsArray|error {
        string  path = string `/me/playlists`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PlaylistsArray response = check self.clientEp-> get(path, accHeaders, targetType = PlaylistsArray);
        return response;
    }
    # Returns a list of user's tracks.
    #
    # + 'limit - Number of results to return in the collection.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listTracks(int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/me/tracks`;
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Performs a playlist search based on a query
    #
    # + q - search
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function searchPlaylist(string q, string[]? access = (), int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2002|error {
        string  path = string `/playlists`;
        map<anydata> queryParam = {"q": q, "access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Creates a playlist.
    #
    # + payload - Create Playlist request
    # + return - Success
    remote isolated function createPlaylist(CreateUpdatePlaylistRequest payload) returns InlineResponse201|error {
        string  path = string `/playlists`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Returns a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + return - Success
    remote isolated function getPlaylist(int playlist_id, string? secretToken = (), string[]? access = ()) returns Playlist|error {
        string  path = string `/playlists/${playlist_id}`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Playlist response = check self.clientEp-> get(path, accHeaders, targetType = Playlist);
        return response;
    }
    # Updates a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + payload - Playlist payload
    # + return - Success
    remote isolated function updatePlaylist(int playlist_id, CreateUpdatePlaylistRequest payload) returns InlineResponse201|error {
        string  path = string `/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->put(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Deletes a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + return - Success
    remote isolated function deletePlaylist(int playlist_id) returns http:Response|error {
        string  path = string `/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Returns a collection of playlist's reposters.
    #
    # + playlist_id - SoundCloud playlist id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listReposts(int playlist_id, int 'limit = 50) returns MetaUsers|error {
        string  path = string `/playlists/${playlist_id}/reposters`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp-> get(path, accHeaders, targetType = MetaUsers);
        return response;
    }
    # Returns tracks under a playlist.
    #
    # + playlist_id - SoundCloud playlist id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function getTracksUnderPlaylist(int playlist_id, string? secretToken = (), string[]? access = (), boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/playlists/${playlist_id}/tracks`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Reposts a playlist as the authenticated user
    #
    # + playlist_id - SoundCloud playlist id
    # + return - Created
    remote isolated function repostPlaylist(int playlist_id) returns http:Response|error {
        string  path = string `/reposts/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Removes a repost on a playlist as the authenticated user
    #
    # + playlist_id - SoundCloud playlist id
    # + return - Success
    remote isolated function deleteRepost(int playlist_id) returns http:Response|error {
        string  path = string `/reposts/playlists/${playlist_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reposts a track as the authenticated user
    #
    # + track_id - SoundCloud Track id
    # + return - Created
    remote isolated function repostTrackByTrackID(int track_id) returns http:Response|error {
        string  path = string `/reposts/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Removes a repost on a track as the authenticated user
    #
    # + track_id - SoundCloud Track id
    # + return - Success
    remote isolated function deleteRepostOnTrack(int track_id) returns http:Response|error {
        string  path = string `/reposts/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Resolves soundcloud.com URLs to Resource URLs to use with the API.
    #
    # + url - SoundCloud URL
    # + return - Found
    remote isolated function resolveSoundCloudURLToResourceURL(string url) returns Found|error {
        string  path = string `/resolve`;
        map<anydata> queryParam = {"url": url, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Found response = check self.clientEp-> get(path, accHeaders, targetType = Found);
        return response;
    }
    # Performs a track search based on a query
    #
    # + q - search
    # + ids - A comma separated list of track ids to filter on
    # + genres - A comma separated list of genres
    # + tags - A comma separated list of tags
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function searchTracks(string q, string? ids = (), string? genres = (), string? tags = (), string[]? access = (), int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/tracks`;
        map<anydata> queryParam = {"q": q, "ids": ids, "genres": genres, "tags": tags, "access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Uploads a new track.
    # + payload - Track detail to be updated
    # + return - Success
    remote isolated function uploadNewTrack(TrackDataRequest payload) returns Track|error {
        string  path = string `/tracks`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Track response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Track);
        return response;
    }
    # Returns a track.
    #
    # + track_id - SoundCloud Track id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + return - Success
    remote isolated function getTrackByID(int track_id, string? secretToken = ()) returns Track|error {
        string  path = string `/tracks/${track_id}`;
        map<anydata> queryParam = {"secret_token": secretToken, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Track response = check self.clientEp-> get(path, accHeaders, targetType = Track);
        return response;
    }
    # Updates a track's information.
    #
    # + track_id - SoundCloud Track id
    # + payload - Track payload
    # + return - Success
    remote isolated function updateTrack(int track_id, TrackMetadataRequest payload) returns Track|error {
        string  path = string `/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Track response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Track);
        return response;
    }
    # Deletes a track.
    #
    # + track_id - SoundCloud Track id
    # + return - Success
    remote isolated function deleteTrack(int track_id) returns http:Response|error {
        string  path = string `/tracks/${track_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Returns the comments posted on the track(track_id).
    #
    # + track_id - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function getCommentsOnTrack(int track_id, int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2003|error {
        string  path = string `/tracks/${track_id}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Returns the newly created comment on success
    #
    # + track_id - SoundCloud Track id
    # + payload - Body of a comment
    # + return - Success
    remote isolated function addComment(int track_id, Body payload) returns Comment|error {
        string  path = string `/tracks/${track_id}/comments`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Comment);
        return response;
    }
    # Returns a list of users who have favorited or liked the track.
    #
    # + track_id - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function getLikedUsersOfTrack(int track_id, int 'limit = 50, int offset = 0) returns UsersList|error {
        string  path = string `/tracks/${track_id}/favoriters`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UsersList response = check self.clientEp-> get(path, accHeaders, targetType = UsersList);
        return response;
    }
    # Returns all related tracks of track on SoundCloud.
    #
    # + track_id - SoundCloud Track id
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listRelatedTracksOfTrack(int track_id, string[]? access = (), int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/tracks/${track_id}/related`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns a collection of track's reposters.
    #
    # + track_id - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getRepostCollection(int track_id, int 'limit = 50) returns MetaUsers|error {
        string  path = string `/tracks/${track_id}/reposters`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp-> get(path, accHeaders, targetType = MetaUsers);
        return response;
    }
    # Returns a track's streamable URLs
    #
    # + track_id - SoundCloud Track id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + return - Success
    remote isolated function getStreambleURL(int track_id, string? secretToken = ()) returns Streams|error {
        string  path = string `/tracks/${track_id}/streams`;
        map<anydata> queryParam = {"secret_token": secretToken, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Streams response = check self.clientEp-> get(path, accHeaders, targetType = Streams);
        return response;
    }
    # Performs a user search based on a query
    #
    # + q - search
    # + ids - A comma separated list of track ids to filter on
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function searchUser(string q, string? ids = (), int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse200|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"q": q, "ids": ids, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a user.
    #
    # + user_id - SoundCloud User id
    # + return - Success
    remote isolated function getUserByID(int user_id) returns CompleteUser|error {
        string  path = string `/users/${user_id}`;
        map<anydata> queryParam = {client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompleteUser response = check self.clientEp-> get(path, accHeaders, targetType = CompleteUser);
        return response;
    }
    # Returns a list of user's comments.
    #
    # + user_id - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function listUserComments(int user_id, int 'limit = 50, int offset = 0) returns CommentsList|error {
        string  path = string `/users/${user_id}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CommentsList response = check self.clientEp-> get(path, accHeaders, targetType = CommentsList);
        return response;
    }
    # Returns a list of user’s followers.
    #
    # + user_id - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listFollowers(int user_id, int 'limit = 50) returns InlineResponse200|error {
        string  path = string `/users/${user_id}/followers`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a list of user’s followings.
    #
    # + user_id - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listUserFollowings(int user_id, int 'limit = 50) returns InlineResponse200|error {
        string  path = string `/users/${user_id}/followings`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a list of user's liked tracks.
    #
    # + user_id - SoundCloud User id
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listUserLikedTracks(int user_id, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/users/${user_id}/likes/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns a list of user's playlists.
    #
    # + user_id - SoundCloud User id
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listUserPlaylist(int user_id, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2002|error {
        string  path = string `/users/${user_id}/playlists`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
        return response;
    }
    # Returns a list of user's tracks.
    #
    # + user_id - SoundCloud User id
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listUserTracks(int user_id, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/users/${user_id}/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns list of user's links added to their profile (website, facebook, instagram).
    #
    # + user_id - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listUserLinks(int user_id, int 'limit = 50) returns WebProfiles|error {
        string  path = string `/users/${user_id}/web-profiles`;
        map<anydata> queryParam = {"limit": 'limit, client_id: self.apiKeys["client_id"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {Authorization: self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebProfiles response = check self.clientEp-> get(path, accHeaders, targetType = WebProfiles);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
