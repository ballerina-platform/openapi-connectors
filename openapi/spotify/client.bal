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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

type ImageObjectArr ImageObject[];

@display {label: "Spotify Client"}
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.spotify.com/v1") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    @display {label: "My Playlists"}
    remote isolated function getMyPlaylists(@display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns CurrentPlaylistDetails|error {
        string  path = string `/me/playlists`;
        map<anydata> queryParam = {'limit: 'limit, offset: offset};
        path = path + check getPathForQueryParam(queryParam);
        CurrentPlaylistDetails response = check self.clientEp-> get(path, targetType = CurrentPlaylistDetails);
        return response;
    }
    @display {label: "Playlist By Id"}
    remote isolated function getPlaylistById(@display {label: "Playlist Id"} string playlist_id, @display {label: "Market"} string? market = (), @display {label: "Fields to Return"} string? fields = (), @display {label: "Additional Types"} string? additional_types = ()) returns PlaylistObject|error {
        string  path = string `/playlists/${playlist_id}`;
        map<anydata> queryParam = {market: market, fields: fields, additional_types: additional_types};
        path = path + check getPathForQueryParam(queryParam);
        PlaylistObject response = check self.clientEp-> get(path, targetType = PlaylistObject);
        return response;
    }
    @display {label: "Update Playlist"}
    remote isolated function updatePlaylist(@display {label: "Content Type"} string 'Content\-Type, @display {label: "Playlist Id"} string playlist_id, ChangePlayListDetails payload) returns error? {
        string  path = string `/playlists/${playlist_id}`;
        map<string|string[]> accHeaders = {'Content\-Type: 'Content\-Type};
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
    }
    @display {label: "Playlist Cover"}
    remote isolated function getPlaylistCover(@display {label: "Playlist Id"} string playlist_id) returns ImageObjectArr|error {
        string  path = string `/playlists/${playlist_id}/images`;
        ImageObjectArr response = check self.clientEp-> get(path, targetType = ImageObjectArr);
        return response;
    }
    @display {label: "Update Playlist Cover"}
    remote isolated function updatePlaylistCover(@display {label: "Content Type"} string 'Content\-Type, @display {label: "Playlist Id"} string playlist_id) returns error? {
        string  path = string `/playlists/${playlist_id}/images`;
        map<string|string[]> accHeaders = {'Content\-Type: 'Content\-Type};
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> put(path, request, headers = accHeaders, targetType=http:Response);
    }
    @display {label: "Playlist Tracks"}
    remote isolated function getPlaylistTracks(@display {label: "Playlist Id"} string playlist_id, @display {label: "Market"} string market, @display {label: "Fields to Return"} string? fields = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), string? additional_types = ()) returns PlaylistTrackDetails|error {
        string  path = string `/playlists/${playlist_id}/tracks`;
        map<anydata> queryParam = {market: market, fields: fields, 'limit: 'limit, offset: offset, additional_types: additional_types};
        path = path + check getPathForQueryParam(queryParam);
        PlaylistTrackDetails response = check self.clientEp-> get(path, targetType = PlaylistTrackDetails);
        return response;
    }
    @display {label: "Reorder or Replace Tracks"}
    remote isolated function reorderOrReplacePlaylistTracks(@display {label: "Playlist Id"} string playlist_id, PlayListReorderDetails payload, @display {label: "Track URIs"} string? uris = ()) returns SnapshotIdObject|error {
        string  path = string `/playlists/${playlist_id}/tracks`;
        map<anydata> queryParam = {uris: uris};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SnapshotIdObject response = check self.clientEp->put(path, request, targetType=SnapshotIdObject);
        return response;
    }
    @display {label: "Playlist By User Id"}
    remote isolated function getPlayslistsByUserID(@display {label: "User Id"} string user_id, @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns UserPlayListDetails|error {
        string  path = string `/users/${user_id}/playlists`;
        map<anydata> queryParam = {'limit: 'limit, offset: offset};
        path = path + check getPathForQueryParam(queryParam);
        UserPlayListDetails response = check self.clientEp-> get(path, targetType = UserPlayListDetails);
        return response;
    }
    @display {label: "Create Playlist"}
    remote isolated function createPlaylist(@display {label: "User Id"} string user_id, PlayListDetails payload) returns PlaylistObject|error {
        string  path = string `/users/${user_id}/playlists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PlaylistObject response = check self.clientEp->post(path, request, targetType=PlaylistObject);
        return response;
    }
}

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
