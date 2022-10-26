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

# This is a generated connector for [SoundCloud API v1.0.0](https://developers.soundcloud.com/) OpenAPI Specification.
# SoundCloud API provides capability to access the online audio distribution platform and music sharing website that enables  you to upload,promote, and share audio, as well as a digital signal processor enabling listeners to stream audio. 
@display {label: "SoundCloud", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [SoundCloud account](https://soundcloud.com/)  and obtain tokens following [this guide](https://developers.soundcloud.com/docs/api/guide).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://api.soundcloud.com") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Likes a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + return - Success 
    remote isolated function likePlaylist(int playlistId) returns json|error {
        string resourcePath = string `/likes/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlikes a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + return - Success 
    remote isolated function unlikePlaylist(int playlistId) returns json|error {
        string resourcePath = string `/likes/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Likes a track.
    #
    # + trackId - SoundCloud Track id 
    # + return - Success 
    remote isolated function likeTrack(int trackId) returns json|error {
        string resourcePath = string `/likes/tracks/${getEncodedUri(trackId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unlikes a track.
    #
    # + trackId - SoundCloud Track id 
    # + return - Success 
    remote isolated function unlikeTrack(int trackId) returns json|error {
        string resourcePath = string `/likes/tracks/${getEncodedUri(trackId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Returns the authenticated user’s information.
    #
    # + return - Success 
    remote isolated function getUserDetail() returns CompleteUser|error {
        string resourcePath = string `/me`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompleteUser response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns the authenticated user's activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function getActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string resourcePath = string `/me/activities`;
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Recent the authenticated user's activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function getOwnActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string resourcePath = string `/me/activities/all/own`;
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns the authenticated user's recent track related activities.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function getRecentTrackRelatedActivities(string[]? access = (), int 'limit = 50) returns Activities|error {
        string resourcePath = string `/me/activities/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Activities response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of the authenticated user's connected social accounts.
    #
    # + 'limit - Number of results to return in the collection. 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function listConnectedSocialAccounts(int 'limit = 50, @deprecated int offset = 0) returns Connections|error {
        string resourcePath = string `/me/connections`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Connections response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns the authenticated user's connected social account.
    #
    # + connectionId - SoundCloud connection id 
    # + return - Success 
    remote isolated function getConnectionByID(int connectionId) returns Connection|error {
        string resourcePath = string `/me/connections/${getEncodedUri(connectionId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Connection response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of users who are following the authenticated user.
    #
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function getFollowers(int 'limit = 50) returns InlineResponse200|error {
        string resourcePath = string `/me/followers`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of users who are followed by the authenticated user.
    #
    # + 'limit - Number of results to return in the collection. 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function listFollowings(int 'limit = 50, @deprecated int offset = 0) returns InlineResponse200|error {
        string resourcePath = string `/me/followings`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of recent tracks from users followed by the authenticated user.
    #
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function listRecentTracks(string[]? access = (), int 'limit = 50, @deprecated int offset = 0) returns TracksList|error {
        string resourcePath = string `/me/followings/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "offset": offset};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        TracksList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Follows a user.
    #
    # + userId - SoundCloud User id 
    # + return - Success 
    remote isolated function followUser(int userId) returns User|json|error {
        string resourcePath = string `/me/followings/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        User|json response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes a user who is followed by the authenticated user.
    #
    # + userId - SoundCloud User id 
    # + return - Success 
    remote isolated function deleteFollowing(int userId) returns json|error {
        string resourcePath = string `/me/followings/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Returns a list of favorites or liked tracks of the authenticated user.
    #
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function listLikedTracks(int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string resourcePath = string `/me/likes/tracks`;
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns user’s playlists (sets).
    #
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function listPlaylist(int 'limit = 50) returns PlaylistsArray|error {
        string resourcePath = string `/me/playlists`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PlaylistsArray response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user's tracks.
    #
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function listTracks(int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string resourcePath = string `/me/tracks`;
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Performs a playlist search based on a query
    #
    # + q - search 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function searchPlaylist(string q, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = (), @deprecated int offset = 0) returns InlineResponse2002|error {
        string resourcePath = string `/playlists`;
        map<anydata> queryParam = {"q": q, "access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, "offset": offset};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Creates a playlist.
    #
    # + payload - Create Playlist request 
    # + return - Success 
    remote isolated function createPlaylist(CreateUpdatePlaylistRequest payload) returns InlineResponse201|error {
        string resourcePath = string `/playlists`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + secretToken - A secret token to fetch private playlists/tracks 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + return - Success 
    remote isolated function getPlaylist(int playlistId, string? secretToken = (), string[]? access = ()) returns Playlist|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Playlist response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + payload - Playlist payload 
    # + return - Success 
    remote isolated function updatePlaylist(int playlistId, CreateUpdatePlaylistRequest payload) returns InlineResponse201|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse201 response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + return - Success 
    remote isolated function deletePlaylist(int playlistId) returns http:Response|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Returns a collection of playlist's reposters.
    #
    # + playlistId - SoundCloud playlist id 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function listReposts(int playlistId, int 'limit = 50) returns MetaUsers|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}/reposters`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns tracks under a playlist.
    #
    # + playlistId - SoundCloud playlist id 
    # + secretToken - A secret token to fetch private playlists/tracks 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function getTracksUnderPlaylist(int playlistId, string? secretToken = (), string[]? access = (), boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}/tracks`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access, "linked_partitioning": linkedPartitioning};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Reposts a playlist as the authenticated user
    #
    # + playlistId - SoundCloud playlist id 
    # + return - Created 
    remote isolated function repostPlaylist(int playlistId) returns http:Response|error {
        string resourcePath = string `/reposts/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Removes a repost on a playlist as the authenticated user
    #
    # + playlistId - SoundCloud playlist id 
    # + return - Success 
    remote isolated function deleteRepost(int playlistId) returns http:Response|error {
        string resourcePath = string `/reposts/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Reposts a track as the authenticated user
    #
    # + trackId - SoundCloud Track id 
    # + return - Created 
    remote isolated function repostTrackByTrackID(int trackId) returns http:Response|error {
        string resourcePath = string `/reposts/tracks/${getEncodedUri(trackId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Removes a repost on a track as the authenticated user
    #
    # + trackId - SoundCloud Track id 
    # + return - Success 
    remote isolated function deleteRepostOnTrack(int trackId) returns http:Response|error {
        string resourcePath = string `/reposts/tracks/${getEncodedUri(trackId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Resolves soundcloud.com URLs to Resource URLs to use with the API.
    #
    # + url - SoundCloud URL 
    # + return - Found 
    remote isolated function resolveSoundCloudURLToResourceURL(string url) returns http:Response|error {
        string resourcePath = string `/resolve`;
        map<anydata> queryParam = {"url": url};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
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
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function searchTracks(string q, string? ids = (), string? genres = (), string? tags = (), string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = (), @deprecated int offset = 0) returns InlineResponse2001|error {
        string resourcePath = string `/tracks`;
        map<anydata> queryParam = {"q": q, "ids": ids, "genres": genres, "tags": tags, "access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, "offset": offset};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a track.
    #
    # + trackId - SoundCloud Track id 
    # + secretToken - A secret token to fetch private playlists/tracks 
    # + return - Success 
    remote isolated function getTrackByID(int trackId, string? secretToken = ()) returns Track|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}`;
        map<anydata> queryParam = {"secret_token": secretToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Track response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Deletes a track.
    #
    # + trackId - SoundCloud Track id 
    # + return - Success 
    remote isolated function deleteTrack(int trackId) returns http:Response|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Returns the comments posted on the track(track_id).
    #
    # + trackId - SoundCloud Track id 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function getCommentsOnTrack(int trackId, int 'limit = 50, boolean? linkedPartitioning = (), @deprecated int offset = 0) returns InlineResponse2003|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns the newly created comment on success
    #
    # + trackId - SoundCloud Track id 
    # + payload - Body of a comment 
    # + return - Success 
    remote isolated function addComment(int trackId, TrackIdCommentsBody payload) returns Comment|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/comments`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json; charset=utf-8");
        Comment response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns a list of users who have favorited or liked the track.
    #
    # + trackId - SoundCloud Track id 
    # + 'limit - Number of results to return in the collection. 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function getLikedUsersOfTrack(int trackId, int 'limit = 50, @deprecated int offset = 0) returns UsersList|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/favoriters`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        UsersList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns all related tracks of track on SoundCloud.
    #
    # + trackId - SoundCloud Track id 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function listRelatedTracksOfTrack(int trackId, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = (), @deprecated int offset = 0) returns InlineResponse2001|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/related`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning, "offset": offset};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a collection of track's reposters.
    #
    # + trackId - SoundCloud Track id 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function getRepostCollection(int trackId, int 'limit = 50) returns MetaUsers|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/reposters`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a track's streamable URLs
    #
    # + trackId - SoundCloud Track id 
    # + secretToken - A secret token to fetch private playlists/tracks 
    # + return - Success 
    remote isolated function getStreambleURL(int trackId, string? secretToken = ()) returns Streams|error {
        string resourcePath = string `/tracks/${getEncodedUri(trackId)}/streams`;
        map<anydata> queryParam = {"secret_token": secretToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Streams response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Performs a user search based on a query
    #
    # + q - search 
    # + ids - A comma separated list of track ids to filter on 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function searchUser(string q, string? ids = (), int 'limit = 50, boolean? linkedPartitioning = (), @deprecated int offset = 0) returns InlineResponse200|error {
        string resourcePath = string `/users`;
        map<anydata> queryParam = {"q": q, "ids": ids, "limit": 'limit, "linked_partitioning": linkedPartitioning, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a user.
    #
    # + userId - SoundCloud User id 
    # + return - Success 
    remote isolated function getUserByID(int userId) returns CompleteUser|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CompleteUser response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user's comments.
    #
    # + userId - SoundCloud User id 
    # + 'limit - Number of results to return in the collection. 
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead. 
    # # Deprecated parameters
    # + offset -
    # + return - Success 
    remote isolated function listUserComments(int userId, int 'limit = 50, @deprecated int offset = 0) returns CommentsList|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        CommentsList response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user’s followers.
    #
    # + userId - SoundCloud User id 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function listFollowers(int userId, int 'limit = 50) returns InlineResponse200|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/followers`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user’s followings.
    #
    # + userId - SoundCloud User id 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function listUserFollowings(int userId, int 'limit = 50) returns InlineResponse200|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/followings`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user's liked tracks.
    #
    # + userId - SoundCloud User id 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function listUserLikedTracks(int userId, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/likes/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user's playlists.
    #
    # + userId - SoundCloud User id 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function listUserPlaylist(int userId, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2002|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/playlists`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns a list of user's tracks.
    #
    # + userId - SoundCloud User id 
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details. 
    # + 'limit - Number of results to return in the collection. 
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used) 
    # + return - Success 
    remote isolated function listUserTracks(int userId, string[]? access = (), int 'limit = 50, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        map<Encoding> queryParamEncoding = {"access": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Returns list of user's links added to their profile (website, facebook, instagram).
    #
    # + userId - SoundCloud User id 
    # + 'limit - Number of results to return in the collection. 
    # + return - Success 
    remote isolated function listUserLinks(int userId, int 'limit = 50) returns WebProfiles|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/web-profiles`;
        map<anydata> queryParam = {"limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WebProfiles response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
