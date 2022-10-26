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

# This is a generated connector from [Spotify API v1](https://developer.spotify.com/documentation/web-api/) OpenAPI Specification. 
# Through the Spotify Web API, external applications retrieve Spotify content such as album data and playlists.
@display {label: "Spotify", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create a [Spotify account](www.spotify.com) and obtain tokens following [this guide](https://developer.spotify.com/documentation/general/guides/authorization-guide/). Configure required scopes when obtaining the tokens. 
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.spotify.com/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        return;
    }
    # Get a List of Current User's Playlists
    #
    # + 'limit - 'The maximum number of playlists to return. Default: 20. Minimum: 1. Maximum: 50.' 
    # + offset - 'The index of the first playlist to return. Default: 0 (the first object). Maximum offset: 100.000. Use with `limit` to get the next set of playlists.' 
    # + return - On success, the HTTP status code in the response header is `200` OK and the response body contains an array of simplified [playlist objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedplaylistobject) (wrapped in a [paging object](https://developer.spotify.com/documentation/web-api/reference/#object-pagingobject)) in JSON format. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Please note that the access token has to be tied to a user. 
    @display {label: "My Playlists"}
    remote isolated function getMyPlaylists(@display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns CurrentPlaylistDetails|error {
        string resourcePath = string `/me/playlists`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CurrentPlaylistDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a Playlist
    #
    # + playlistId - The [Spotify ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids) for the playlist. 
    # + market - An [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) or the string `from_token`. Provide this parameter if you want to apply [Track Relinking](https://developer.spotify.com/documentation/general/guides/track-relinking-guide/). For episodes, if a valid user access token is specified in the request header, the country associated with the user account will take priority over this parameter.   *Note: If neither market or user country are provided, the episode is considered unavailable for the client.* 
    # + fields - Filters for the query: a comma-separated list of the fields to return. If omitted, all fields are returned. For example, to get just the playlist''s description and URI: `fields=description,uri`. A dot separator can be used to specify non-reoccurring fields, while parentheses can be used to specify reoccurring fields within objects. For example, to get just the added date and user ID of the adder: `fields=tracks.items(added_at,added_by.id)`. Use multiple parentheses to drill down into nested objects, for example: `fields=tracks.items(track(name,href,album(name,href)))`. Fields can be excluded by prefixing them with an exclamation mark, for example: `fields=tracks.items(track(name,href,album(!name,href)))` 
    # + additionalTypes - A comma-separated list of item types that your client supports besides the default `track` type. Valid types are: `track` and `episode`. **Note** : This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future. In addition to providing this parameter, make sure that your client properly handles cases of new types in the future by checking against the `type` field of each object. 
    # + return - On success, the response body contains a [playlist object](https://developer.spotify.com/documentation/web-api/reference/#object-playlistobject) in JSON format and the HTTP status code in the response header is `200` OK. If an episode is unavailable in the given `market`, its information will not be included in the response. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Requesting playlists that you do not have the user's authorization to access returns error `403` Forbidden. 
    @display {label: "Playlist By Id"}
    remote isolated function getPlaylistById(@display {label: "Playlist Id"} string playlistId, @display {label: "Market"} string? market = (), @display {label: "Fields to Return"} string? fields = (), @display {label: "Additional Types"} string? additionalTypes = ()) returns PlaylistObject|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}`;
        map<anydata> queryParam = {"market": market, "fields": fields, "additional_types": additionalTypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PlaylistObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Change a Playlist's Details
    #
    # + contentType - The content type of the request body: `application/json` 
    # + playlistId - The [Spotify ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids) for the playlist. 
    # + payload - Content to update the playlist 
    # + return - On success the HTTP status code in the response header is `200` OK. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Trying to change a playlist when you do not have the user's authorization returns error `403` Forbidden. 
    @display {label: "Update Playlist"}
    remote isolated function updatePlaylist(@display {label: "Content Type"} string contentType, @display {label: "Playlist Id"} string playlistId, ChangePlayListDetails payload) returns http:Response|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}`;
        map<any> headerValues = {"Content-Type": contentType};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Get a Playlist's Items
    #
    # + playlistId - The [Spotify ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids) for the playlist. 
    # + market - An [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) or the string `from_token`. Provide this parameter if you want to apply [Track Relinking](https://developer.spotify.com/documentation/general/guides/track-relinking-guide/). For episodes, if a valid user access token is specified in the request header, the country associated with the user account will take priority over this parameter.   *Note: If neither market or user country are provided, the episode is considered unavailable for the client.* 
    # + fields - Filters for the query: a comma-separated list of the fields to return. If omitted, all fields are returned. For example, to get just the total number of items and the request limit:   `fields=total,limit`   A dot separator can be used to specify non-reoccurring fields, while parentheses can be used to specify reoccurring fields within objects. For example, to get just the added date and user ID of the adder:   `fields=items(added_at,added_by.id)`   Use multiple parentheses to drill down into nested objects, for example:   `fields=items(track(name,href,album(name,href)))`   Fields can be excluded by prefixing them with an exclamation mark, for example:   `fields=items.track.album(!external_urls,images)` 
    # + 'limit - The maximum number of items to return. Default: 100. Minimum: 1. Maximum: 100. 
    # + offset - The index of the first item to return. Default: 0 (the first object). 
    # + additionalTypes - A comma-separated list of item types that your client supports besides the default `track` type. Valid types are: `track` and `episode`. **Note** : This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future. In addition to providing this parameter, make sure that your client properly handles cases of new types in the future by checking against the `type` field of each object. 
    # + return - On success, the response body contains an array of [track objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedtrackobject) and [episode objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedepisodeobject) (depends on the `additional_types` parameter), wrapped in a [paging object](https://developer.spotify.com/documentation/web-api/reference/#object-pagingobject) in JSON format and the HTTP status code in the response header is `200` OK. If an episode is unavailable in the given `market`, its information will not be included in the response. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Requesting playlists that you do not have the user's authorization to access returns error `403` Forbidden. 
    @display {label: "Playlist Tracks"}
    remote isolated function getPlaylistTracks(@display {label: "Playlist Id"} string playlistId, @display {label: "Market"} string market, @display {label: "Fields to Return"} string? fields = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), string? additionalTypes = ()) returns PlaylistTrackDetails|error {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}/tracks`;
        map<anydata> queryParam = {"market": market, "fields": fields, "limit": 'limit, "offset": offset, "additional_types": additionalTypes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PlaylistTrackDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Reorder or Replace a Playlist's Items
    #
    # + playlistId - The [Spotify ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids) for the playlist. 
    # + uris - A comma-separated list of [Spotify URIs](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids) to set, can be track or episode URIs. For example: `uris=spotify:track:4iV5W9uYEdYUVa79Axb7Rh,spotify:track:1301WleyT98MSxVHPZCA6M,spotify:episode:512ojhOuo1ktJprKbVcKyQ`   A maximum of 100 items can be set in one request. 
    # + payload - Information needed to reorder the playlist 
    # + return - On a successful **reorder** operation, the response body contains a `snapshot_id` in JSON format and the HTTP status code in the response header is `200` OK. The `snapshot_id` can be used to identify your playlist version in future requests. On a successful **replace** operation, the HTTP status code in the response header is `201` Created. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes), the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema), and the existing playlist is unmodified. Trying to set an item when you do not have the user's authorization returns error `403` Forbidden. 
    @display {label: "Reorder or Replace Tracks"}
    remote isolated function reorderOrReplacePlaylistTracks(@display {label: "Playlist Id"} string playlistId, PlayListReorderDetails payload, @display {label: "Track URIs"} string? uris = ()) returns SnapshotIdObject|error? {
        string resourcePath = string `/playlists/${getEncodedUri(playlistId)}/tracks`;
        map<anydata> queryParam = {"uris": uris};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SnapshotIdObject? response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get a List of a User's Playlists
    #
    # + userId - The user's [Spotify user ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids). 
    # + 'limit - The maximum number of playlists to return. Default: 20. Minimum: 1. Maximum: 50. 
    # + offset - The index of the first playlist to return. Default: 0 (the first object). Maximum offset: 100.000. Use with `limit` to get the next set of playlists. 
    # + return - On success, the HTTP status code in the response header is `200` OK and the response body contains an array of simplified [playlist objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedplaylistobject) (wrapped in a [paging object](https://developer.spotify.com/documentation/web-api/reference/#object-pagingobject)) in JSON format. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). 
    @display {label: "Playlist By User Id"}
    remote isolated function getPlayslistsByUserID(@display {label: "User Id"} string userId, @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns UserPlayListDetails|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/playlists`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        UserPlayListDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a Playlist
    #
    # + userId - The user's [Spotify user ID](https://developer.spotify.com/documentation/web-api/#spotify-uris-and-ids). 
    # + payload - Content to create playlist 
    # + return - On success, the response body contains the created [playlist object](https://developer.spotify.com/documentation/web-api/reference/#object-playlistobject) in JSON format and the HTTP status code in the response header is `200` OK or `201` Created. There is also a `Location` response header giving the Web API endpoint for the new playlist. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Trying to create a playlist when you do not have the user's authorization returns error `403` Forbidden. 
    @display {label: "Create Playlist"}
    remote isolated function createPlaylist(@display {label: "User Id"} string userId, PlayListDetails payload) returns PlaylistObject|error {
        string resourcePath = string `/users/${getEncodedUri(userId)}/playlists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PlaylistObject response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get All New Releases
    #
    # + country - A country: an [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Provide this parameter if you want the list of returned items to be relevant to a particular country. If omitted, the returned items will be relevant to all countries. 
    # + 'limit - The maximum number of items to return. Default: 20. Minimum: 1. Maximum: 50. 
    # + offset - The index of the first item to return. Default: 0 (the first object). Use with `limit` to get the next set of items. 
    # + return - On success, the HTTP status code in the response header is `200` OK and the response body contains a `message` and an`albums` object. The `albums` object contains an array of simplified [album objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedalbumobject) (wrapped in a [paging object](https://developer.spotify.com/documentation/web-api/reference/#object-pagingobject)) in JSON format. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Once you have retrieved the list, you can use [Get an Album's Tracks](https://developer.spotify.com/documentation/web-api/reference/#endpoint-get-an-albums-tracks) to drill down further. The results are returned in an order reflected within the Spotify clients, and therefore may not be ordered by date. 
    @display {label: "Get New Releases"}
    remote isolated function getNewReleses(@display {label: "Country"} string? country = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns NewReleasesObject|error {
        string resourcePath = string `/browse/new-releases`;
        map<anydata> queryParam = {"country": country, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        NewReleasesObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get All Featured Playlists
    #
    # + country - A country: an [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Provide this parameter if you want the list of returned items to be relevant to a particular country. If omitted, the returned items will be relevant to all countries. 
    # + locale - The desired language, consisting of a lowercase [ISO 639-1 language code](http://en.wikipedia.org/wiki/ISO_639-1) and an uppercase [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), joined by an underscore. For example: `es_MX`, meaning "Spanish (Mexico)". Provide this parameter if you want the results returned in a particular language (where available). Note that, if `locale` is not supplied, or if the specified language is not available, all strings will be returned in the Spotify default language (American English). The `locale` parameter, combined with the `country` parameter, may give odd results if not carefully matched. For example `country=SE&locale=de_DE` will return a list of categories relevant to Sweden but as German language strings. 
    # + timestamp - A timestamp in [ISO 8601 format](http://en.wikipedia.org/wiki/ISO_8601): `yyyy-MM-ddTHH:mm:ss`. Use this parameter to specify the user's local time to get results tailored for that specific date and time in the day. If not provided, the response defaults to the current UTC time. Example: "2014-10-23T09:00:00" for a user whose local time is 9AM. If there were no featured playlists (or there is no data) at the specified time, the response will revert to the current UTC time. 
    # + 'limit - The maximum number of items to return. Default: 20. Minimum: 1. Maximum: 50. 
    # + offset - The index of the first item to return. Default: 0 (the first object). Use with `limit` to get the next set of items. 
    # + return - On success, the HTTP status code in the response header is `200` OK and the response body contains a `message` and a `playlists` object. The `playlists` object contains an array of simplified [playlist objects](https://developer.spotify.com/documentation/web-api/reference/#object-simplifiedplaylistobject) (wrapped in a [paging object](https://developer.spotify.com/documentation/web-api/reference/#object-pagingobject)) in JSON format. On error, the header status code is an [error code](https://developer.spotify.com/documentation/web-api/#response-status-codes) and the response body contains an [error object](https://developer.spotify.com/documentation/web-api/#response-schema). Once you have retrieved the list of playlist objects, you can use [Get a Playlist](https://developer.spotify.com/web-api/get-playlist/) and [Get a Playlist's Tracks](https://developer.spotify.com/web-api/get-playlists-tracks/) to drill down further. 
    @display {label: "Get Featured Playlists"}
    remote isolated function getFeaturedPlaylists(@display {label: "Country"} string? country = (), @display {label: "Locale"} string? locale = (), @display {label: "Timestamp"} string? timestamp = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns FeaturedPlaylistObject|error {
        string resourcePath = string `/browse/featured-playlists`;
        map<anydata> queryParam = {"country": country, "locale": locale, "timestamp": timestamp, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        FeaturedPlaylistObject response = check self.clientEp->get(resourcePath);
        return response;
    }
}
