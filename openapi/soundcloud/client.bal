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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [SoundCloud API v1.0.0](https://developers.soundcloud.com/) OpenAPI Specification.
# SoundCloud API provides capability to access the online audio distribution platform and music sharing website that 
# enables  you to upload,promote, and share audio, as well as a digital signal processor enabling listeners to stream audio. 
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [SoundCloud account](https://soundcloud.com/)  and obtain tokens 
    # following [this guide](https://developers.soundcloud.com/docs/api/guide).
    #
    # + apiKeyConfig - Provide your API key as `Authorization`. Eg: {"Authorization" : "OAuth <your API key>"}
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, 
                                  string serviceUrl = "https://api.soundcloud.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Likes a playlist.
    #
    # + playlistId - SoundCloud playlist id
    # + return - Success
    remote isolated function likePlaylist(int playlistId) returns json|error {
        string  path = string `/likes/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Unlikes a playlist.
    #
    # + playlistId - SoundCloud playlist id
    # + return - Success
    remote isolated function unlikePlaylist(int playlistId) returns json|error {
        string  path = string `/likes/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Likes a track.
    #
    # + trackId - SoundCloud Track id
    # + return - Success
    remote isolated function likeTrack(int trackId) returns json|error {
        string  path = string `/likes/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Unlikes a track.
    #
    # + trackId - SoundCloud Track id
    # + return - Success
    remote isolated function unlikeTrack(int trackId) returns json|error {
        string  path = string `/likes/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"access": access, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Connections response = check self.clientEp-> get(path, accHeaders, targetType = Connections);
        return response;
    }
    # Returns the authenticated user's connected social account.
    #
    # + connectionId - SoundCloud connection id
    # + return - Success
    remote isolated function getConnectionByID(int connectionId) returns Connection|error {
        string  path = string `/me/connections/${connectionId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"access": access, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TracksList response = check self.clientEp-> get(path, accHeaders, targetType = TracksList);
        return response;
    }
    # Follows a user.
    #
    # + userId - SoundCloud User id
    # + return - Success
    remote isolated function followUser(int userId) returns json|error {
        string  path = string `/me/followings/${userId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> put(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Deletes a user who is followed by the authenticated user.
    #
    # + userId - SoundCloud User id
    # + return - Success
    remote isolated function deleteFollowing(int userId) returns json|error {
        string  path = string `/me/followings/${userId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"limit": 'limit, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"q": q, "access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Returns a playlist.
    #
    # + playlistId - SoundCloud playlist id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + return - Success
    remote isolated function getPlaylist(int playlistId, string? secretToken = (), string[]? access = ()) returns Playlist|error {
        string  path = string `/playlists/${playlistId}`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Playlist response = check self.clientEp-> get(path, accHeaders, targetType = Playlist);
        return response;
    }
    # Updates a playlist.
    #
    # + playlistId - SoundCloud playlist id
    # + payload - Playlist payload
    # + return - Success
    remote isolated function updatePlaylist(int playlistId, CreateUpdatePlaylistRequest payload) returns InlineResponse201|error {
        string  path = string `/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse201 response = check self.clientEp->put(path, request, headers = accHeaders, targetType=InlineResponse201);
        return response;
    }
    # Deletes a playlist.
    #
    # + playlistId - SoundCloud playlist id
    # + return - Success
    remote isolated function deletePlaylist(int playlistId) returns http:Response|error {
        string  path = string `/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Returns a collection of playlist's reposters.
    #
    # + playlistId - SoundCloud playlist id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listReposts(int playlistId, int 'limit = 50) returns MetaUsers|error {
        string  path = string `/playlists/${playlistId}/reposters`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp-> get(path, accHeaders, targetType = MetaUsers);
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
        string  path = string `/playlists/${playlistId}/tracks`;
        map<anydata> queryParam = {"secret_token": secretToken, "access": access, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Reposts a playlist as the authenticated user
    #
    # + playlistId - SoundCloud playlist id
    # + return - Created
    remote isolated function repostPlaylist(int playlistId) returns http:Response|error {
        string  path = string `/reposts/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Removes a repost on a playlist as the authenticated user
    #
    # + playlistId - SoundCloud playlist id
    # + return - Success
    remote isolated function deleteRepost(int playlistId) returns http:Response|error {
        string  path = string `/reposts/playlists/${playlistId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Reposts a track as the authenticated user
    #
    # + trackId - SoundCloud Track id
    # + return - Created
    remote isolated function repostTrackByTrackID(int trackId) returns http:Response|error {
        string  path = string `/reposts/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Removes a repost on a track as the authenticated user
    #
    # + trackId - SoundCloud Track id
    # + return - Success
    remote isolated function deleteRepostOnTrack(int trackId) returns http:Response|error {
        string  path = string `/reposts/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"url": url};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"q": q, "ids": ids, "genres": genres, "tags": tags, "access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Uploads a new track.
    #
    # + return - Success
    remote isolated function uploadNewTrack(TrackDataRequest payload) returns Track|error {
        string  path = string `/tracks`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        Track response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Track);
        return response;
    }
    # Returns a track.
    #
    # + trackId - SoundCloud Track id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + return - Success
    remote isolated function getTrackByID(int trackId, string? secretToken = ()) returns Track|error {
        string  path = string `/tracks/${trackId}`;
        map<anydata> queryParam = {"secret_token": secretToken};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Track response = check self.clientEp-> get(path, accHeaders, targetType = Track);
        return response;
    }
    # Updates a track's information.
    #
    # + trackId - SoundCloud Track id
    # + payload - Track payload
    # + return - Success
    remote isolated function updateTrack(int trackId, TrackMetadataRequest payload) returns Track|error {
        string  path = string `/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Track response = check self.clientEp->put(path, request, headers = accHeaders, targetType=Track);
        return response;
    }
    # Deletes a track.
    #
    # + trackId - SoundCloud Track id
    # + return - Success
    remote isolated function deleteTrack(int trackId) returns http:Response|error {
        string  path = string `/tracks/${trackId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Returns the comments posted on the track(track_id).
    #
    # + trackId - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function getCommentsOnTrack(int trackId, int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2003|error {
        string  path = string `/tracks/${trackId}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2003 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2003);
        return response;
    }
    # Returns the newly created comment on success
    #
    # + trackId - SoundCloud Track id
    # + payload - Body of a comment
    # + return - Success
    remote isolated function addComment(int trackId, Body payload) returns Comment|error {
        string  path = string `/tracks/${trackId}/comments`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Comment);
        return response;
    }
    # Returns a list of users who have favorited or liked the track.
    #
    # + trackId - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function getLikedUsersOfTrack(int trackId, int 'limit = 50, int offset = 0) returns UsersList|error {
        string  path = string `/tracks/${trackId}/favoriters`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        UsersList response = check self.clientEp-> get(path, accHeaders, targetType = UsersList);
        return response;
    }
    # Returns all related tracks of track on SoundCloud.
    #
    # + trackId - SoundCloud Track id
    # + access - Filters content by level of access the user (logged in or anonymous) has to the track. The result list will include only tracks with the specified access. Include all options if you'd like to see all possible tracks. See `Track#access` schema for more details.
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + linkedPartitioning - Returns paginated collection of items (recommended, returning a list without pagination is deprecated and should not be used)
    # + return - Success
    remote isolated function listRelatedTracksOfTrack(int trackId, string[]? access = (), int 'limit = 50, int offset = 0, boolean? linkedPartitioning = ()) returns InlineResponse2001|error {
        string  path = string `/tracks/${trackId}/related`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns a collection of track's reposters.
    #
    # + trackId - SoundCloud Track id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function getRepostCollection(int trackId, int 'limit = 50) returns MetaUsers|error {
        string  path = string `/tracks/${trackId}/reposters`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        MetaUsers response = check self.clientEp-> get(path, accHeaders, targetType = MetaUsers);
        return response;
    }
    # Returns a track's streamable URLs
    #
    # + trackId - SoundCloud Track id
    # + secretToken - A secret token to fetch private playlists/tracks
    # + return - Success
    remote isolated function getStreambleURL(int trackId, string? secretToken = ()) returns Streams|error {
        string  path = string `/tracks/${trackId}/streams`;
        map<anydata> queryParam = {"secret_token": secretToken};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
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
        map<anydata> queryParam = {"q": q, "ids": ids, "limit": 'limit, "offset": offset, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a user.
    #
    # + userId - SoundCloud User id
    # + return - Success
    remote isolated function getUserByID(int userId) returns CompleteUser|error {
        string  path = string `/users/${userId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompleteUser response = check self.clientEp-> get(path, accHeaders, targetType = CompleteUser);
        return response;
    }
    # Returns a list of user's comments.
    #
    # + userId - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + offset - Offset of first result. Deprecated, use `linked_partitioning` instead.
    # + return - Success
    remote isolated function listUserComments(int userId, int 'limit = 50, int offset = 0) returns CommentsList|error {
        string  path = string `/users/${userId}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CommentsList response = check self.clientEp-> get(path, accHeaders, targetType = CommentsList);
        return response;
    }
    # Returns a list of user’s followers.
    #
    # + userId - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listFollowers(int userId, int 'limit = 50) returns InlineResponse200|error {
        string  path = string `/users/${userId}/followers`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
        return response;
    }
    # Returns a list of user’s followings.
    #
    # + userId - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listUserFollowings(int userId, int 'limit = 50) returns InlineResponse200|error {
        string  path = string `/users/${userId}/followings`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse200 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse200);
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
        string  path = string `/users/${userId}/likes/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
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
        string  path = string `/users/${userId}/playlists`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2002 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2002);
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
        string  path = string `/users/${userId}/tracks`;
        map<anydata> queryParam = {"access": access, "limit": 'limit, "linked_partitioning": linkedPartitioning};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2001 response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2001);
        return response;
    }
    # Returns list of user's links added to their profile (website, facebook, instagram).
    #
    # + userId - SoundCloud User id
    # + 'limit - Number of results to return in the collection.
    # + return - Success
    remote isolated function listUserLinks(int userId, int 'limit = 50) returns WebProfiles|error {
        string  path = string `/users/${userId}/web-profiles`;
        map<anydata> queryParam = {"limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WebProfiles response = check self.clientEp-> get(path, accHeaders, targetType = WebProfiles);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
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
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
