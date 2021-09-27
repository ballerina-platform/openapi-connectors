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

import ballerina/http;
import ballerina/url;
import ballerina/lang.'string;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector for [Flat API v2.13.0](https://flat.io/developers/docs/api/) OpenAPI specification.
# The Flat API allows you to easily extend the abilities of the [Flat Platform](https://flat.io), with a wide range of use cases including the following:
# * Creating and importing new music scores using MusicXML, MIDI, Guitar Pro (GP3, GP4, GP5, GPX, GP), PowerTab, TuxGuitar and MuseScore files
# * Browsing, updating, copying, exporting the user's scores (for example in MP3, WAV or MIDI)
# * Managing educational resources with Flat for Education: creating & updating the organization accounts, the classes, rosters and assignments.
# The Flat API is built on HTTP. Our API is RESTful It has predictable resource URLs. It returns HTTP response codes to indicate errors. It also accepts and returns JSON in the HTTP body.
# The [schema](/swagger.yaml) of this API follows the [OpenAPI Initiative (OAI) specification](https://www.openapis.org/), you can use and work with [compatible Swagger tools](http://swagger.io/open-source-integrations/).
# This API features Cross-Origin Resource Sharing (CORS) implemented in compliance with [W3C spec](https://www.w3.org/TR/cors/).
# You can use your favorite HTTP/REST library for your programming language to use Flat's API. This specification and reference is [available on Github](https://github.com/FlatIO/api-reference).
# Getting Started and learn more:
# * [API Overview and introduction](https://flat.io/developers/docs/api/)
# * [Authentication (Personal Access Tokens or OAuth2)](https://flat.io/developers/docs/api/authentication.html)
# * [SDKs](https://flat.io/developers/docs/api/sdks.html)
# * [Rate Limits](https://flat.io/developers/docs/api/rate-limits.html)
# * [Changelog](https://flat.io/developers/docs/api/changelog.html)
@display {label: "Flatapi", iconPath: "resources/flatapi.svg"} 
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Flat Platform Account](https://flat.io/auth/signup) and obtain tokens following [this guide](https://flat.io/developers/docs/api/authentication.html).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.flat.io/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get current user profile
    #
    # + onlyId - Only return the user id
    # + return - Current user details
    remote isolated function getAuthenticatedUser(boolean onlyId = false) returns UserDetails|error {
        string  path = string `/me`;
        map<anydata> queryParam = {"onlyId": onlyId};
        path = path + check getPathForQueryParam(queryParam);
        UserDetails response = check self.clientEp-> get(path, targetType = UserDetails);
        return response;
    }
    # Create a new score
    #
    # + return - Score created
    remote isolated function createScore(ScoreCreation payload) returns ScoreDetails|error {
        string  path = string `/scores`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreDetails response = check self.clientEp->post(path, request, targetType=ScoreDetails);
        return response;
    }
    # Get a score's metadata
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Score details
    remote isolated function getScore(string score, string? sharingKey = ()) returns ScoreDetails|error {
        string  path = string `/scores/${score}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ScoreDetails response = check self.clientEp-> get(path, targetType = ScoreDetails);
        return response;
    }
    # Edit a score's metadata
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - Score details
    remote isolated function editScore(string score, ScoreModification payload) returns ScoreDetails|error {
        string  path = string `/scores/${score}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreDetails response = check self.clientEp->put(path, request, targetType=ScoreDetails);
        return response;
    }
    # Delete a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + now - If `true`, the score deletion will be scheduled to be done ASAP
    # + return - The score has been removed
    remote isolated function deleteScore(string score, boolean now = false) returns http:Response|error {
        string  path = string `/scores/${score}`;
        map<anydata> queryParam = {"now": now};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Untrash a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - The score has been untrashed
    remote isolated function untrashScore(string score) returns http:Response|error {
        string  path = string `/scores/${score}/untrash`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List submissions related to the score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - List of submissions
    remote isolated function getScoreSubmissions(string score) returns AssignmentSubmission[]|error {
        string  path = string `/scores/${score}/submissions`;
        AssignmentSubmission[] response = check self.clientEp-> get(path, targetType = AssignmentSubmissionArr);
        return response;
    }
    # Fork a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Score details
    remote isolated function forkScore(string score, ScoreFork payload, string? sharingKey = ()) returns ScoreDetails|error {
        string  path = string `/scores/${score}/fork`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreDetails response = check self.clientEp->post(path, request, targetType=ScoreDetails);
        return response;
    }
    # List the collaborators
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - List of collaborators
    remote isolated function getScoreCollaborators(string score, string? sharingKey = ()) returns ResourceCollaborator[]|error {
        string  path = string `/scores/${score}/collaborators`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ResourceCollaborator[] response = check self.clientEp-> get(path, targetType = ResourceCollaboratorArr);
        return response;
    }
    # Add a new collaborator
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - The newly added collaborator metadata
    remote isolated function addScoreCollaborator(string score, ResourceCollaboratorCreation payload) returns ResourceCollaborator|error {
        string  path = string `/scores/${score}/collaborators`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResourceCollaborator response = check self.clientEp->post(path, request, targetType=ResourceCollaborator);
        return response;
    }
    # Get a collaborator
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + collaborator - Unique identifier of a **collaborator permission**, or unique identifier of a **User**, or unique identifier of a **Group**
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Collaborator information
    remote isolated function getScoreCollaborator(string score, string collaborator, string? sharingKey = ()) returns ResourceCollaborator|error {
        string  path = string `/scores/${score}/collaborators/${collaborator}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ResourceCollaborator response = check self.clientEp-> get(path, targetType = ResourceCollaborator);
        return response;
    }
    # Delete a collaborator
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + collaborator - Unique identifier of a **collaborator permission**, or unique identifier of a **User**, or unique identifier of a **Group**
    # + return - The collaborator has been removed
    remote isolated function removeScoreCollaborator(string score, string collaborator) returns http:Response|error {
        string  path = string `/scores/${score}/collaborators/${collaborator}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List the audio or video tracks linked to a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + assignment - An assignment id with which all the tracks returned will be related to
    # + listAutoTrack - If true, and if available, return last automatically synchronized Flat's mp3 export as an additional track
    # + return - List of tracks
    remote isolated function listScoreTracks(string score, string? sharingKey = (), string? assignment = (), boolean? listAutoTrack = ()) returns ScoreTrack[]|error {
        string  path = string `/scores/${score}/tracks`;
        map<anydata> queryParam = {"sharingKey": sharingKey, "assignment": assignment, "listAutoTrack": listAutoTrack};
        path = path + check getPathForQueryParam(queryParam);
        ScoreTrack[] response = check self.clientEp-> get(path, targetType = ScoreTrackArr);
        return response;
    }
    # Add a new video or audio track to the score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - Created track
    remote isolated function addScoreTrack(string score, ScoreTrackCreation payload) returns ScoreTrack|error {
        string  path = string `/scores/${score}/tracks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreTrack response = check self.clientEp->post(path, request, targetType=ScoreTrack);
        return response;
    }
    # Retrieve the details of an audio or video track linked to a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + track - Unique identifier of a score audio track
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Track details
    remote isolated function getScoreTrack(string score, string track, string? sharingKey = ()) returns ScoreTrack|error {
        string  path = string `/scores/${score}/tracks/${track}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ScoreTrack response = check self.clientEp-> get(path, targetType = ScoreTrack);
        return response;
    }
    # Update an audio or video track linked to a score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + track - Unique identifier of a score audio track
    # + return - Updated track
    remote isolated function updateScoreTrack(string score, string track, ScoreTrackUpdate payload) returns ScoreTrack|error {
        string  path = string `/scores/${score}/tracks/${track}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreTrack response = check self.clientEp->put(path, request, targetType=ScoreTrack);
        return response;
    }
    # Remove an audio or video track linked to the score
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + track - Unique identifier of a score audio track
    # + return - Track removed
    remote isolated function deleteScoreTrack(string score, string track) returns http:Response|error {
        string  path = string `/scores/${score}/tracks/${track}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List comments
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + 'type - Filter the comments by type
    # + sort - Sort
    # + direction - Sort direction
    # + return - The comments of the score
    remote isolated function getScoreComments(string score, string? sharingKey = (), string? 'type = (), string? sort = (), string? direction = ()) returns ScoreComment[]|error {
        string  path = string `/scores/${score}/comments`;
        map<anydata> queryParam = {"sharingKey": sharingKey, "type": 'type, "sort": sort, "direction": direction};
        path = path + check getPathForQueryParam(queryParam);
        ScoreComment[] response = check self.clientEp-> get(path, targetType = ScoreCommentArr);
        return response;
    }
    # Post a new comment
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - The new comment
    remote isolated function postScoreComment(string score, ScoreCommentCreation payload, string? sharingKey = ()) returns ScoreComment|error {
        string  path = string `/scores/${score}/comments`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreComment response = check self.clientEp->post(path, request, targetType=ScoreComment);
        return response;
    }
    # Update an existing comment
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + comment - Unique identifier of a sheet music comment
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - The edited comment
    remote isolated function updateScoreComment(string score, string comment, ScoreCommentUpdate payload, string? sharingKey = ()) returns ScoreComment|error {
        string  path = string `/scores/${score}/comments/${comment}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreComment response = check self.clientEp->put(path, request, targetType=ScoreComment);
        return response;
    }
    # Delete a comment
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + comment - Unique identifier of a sheet music comment
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - The comment has been deleted
    remote isolated function deleteScoreComment(string score, string comment, string? sharingKey = ()) returns http:Response|error {
        string  path = string `/scores/${score}/comments/${comment}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Mark the comment as resolved
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + comment - Unique identifier of a sheet music comment
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - The comment has been marked as resolved
    remote isolated function markScoreCommentResolved(string score, string comment, string? sharingKey = ()) returns http:Response|error {
        string  path = string `/scores/${score}/comments/${comment}/resolved`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Mark the comment as unresolved
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + comment - Unique identifier of a sheet music comment
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - The comment has been unmarked as resolved
    remote isolated function markScoreCommentUnresolved(string score, string comment, string? sharingKey = ()) returns http:Response|error {
        string  path = string `/scores/${score}/comments/${comment}/resolved`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List the revisions
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - List of revisions
    remote isolated function getScoreRevisions(string score, string? sharingKey = ()) returns ScoreRevision[]|error {
        string  path = string `/scores/${score}/revisions`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ScoreRevision[] response = check self.clientEp-> get(path, targetType = ScoreRevisionArr);
        return response;
    }
    # Create a new revision
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + return - The new created revision metadata
    remote isolated function createScoreRevision(string score, ScoreRevisionCreation payload) returns ScoreRevision|error {
        string  path = string `/scores/${score}/revisions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScoreRevision response = check self.clientEp->post(path, request, targetType=ScoreRevision);
        return response;
    }
    # Get a score revision
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + revision - Unique identifier of a score revision. You can use `last` to fetch the information related to the last version created.
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Revision metadata
    remote isolated function getScoreRevision(string score, string revision, string? sharingKey = ()) returns ScoreRevision|error {
        string  path = string `/scores/${score}/revisions/${revision}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        ScoreRevision response = check self.clientEp-> get(path, targetType = ScoreRevision);
        return response;
    }
    # Get a score revision data
    #
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + revision - Unique identifier of a score revision. You can use `last` to fetch the information related to the last version created.
    # + format - The format of the file you will retrieve
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + parts - An optional a set of parts uuid to be exported. This parameter must be composed of parts uuids
    # + onlyCached - Only return files already generated and cached in Flat's production
    # + url - Returns a json with the `url` in it instead of redirecting
    # + return - Revision data
    remote isolated function getScoreRevisionData(string score, string revision, string format, string? sharingKey = (), string? parts = (), boolean? onlyCached = (), boolean? url = ()) returns string|error {
        string  path = string `/scores/${score}/revisions/${revision}/${format}`;
        map<anydata> queryParam = {"sharingKey": sharingKey, "parts": parts, "onlyCached": onlyCached, "url": url};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # List the collections
    #
    # + parent - List the collection contained in this `parent` collection.
    # + sort - Sort
    # + direction - Sort direction
    # + 'limit - This is the maximum number of objects that may be returned
    # + next - An opaque string cursor to fetch the next page of data.
    # + previous - An opaque string cursor to fetch the previous page of data.
    # + return - List of collections
    remote isolated function listCollections(string parent = "root", string? sort = (), string? direction = (), int 'limit = 25, string? next = (), string? previous = ()) returns Collection[]|error {
        string  path = string `/collections`;
        map<anydata> queryParam = {"parent": parent, "sort": sort, "direction": direction, "limit": 'limit, "next": next, "previous": previous};
        path = path + check getPathForQueryParam(queryParam);
        Collection[] response = check self.clientEp-> get(path, targetType = CollectionArr);
        return response;
    }
    # Create a new collection
    #
    # + return - Collection created
    remote isolated function createCollection(CollectionCreation payload) returns Collection|error {
        string  path = string `/collections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collection response = check self.clientEp->post(path, request, targetType=Collection);
        return response;
    }
    # Get collection details
    #
    # + collection - Unique identifier of the collection.
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Collection details
    remote isolated function getCollection(string collection, string? sharingKey = ()) returns Collection|error {
        string  path = string `/collections/${collection}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        Collection response = check self.clientEp-> get(path, targetType = Collection);
        return response;
    }
    # Update a collection's metadata
    #
    # + collection - Unique identifier of the collection.
    # + return - Collection details
    remote isolated function editCollection(string collection, CollectionModification payload) returns Collection|error {
        string  path = string `/collections/${collection}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collection response = check self.clientEp->put(path, request, targetType=Collection);
        return response;
    }
    # Delete the collection
    #
    # + collection - Unique identifier of the collection.
    # + return - Collection deleted
    remote isolated function deleteCollection(string collection) returns http:Response|error {
        string  path = string `/collections/${collection}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Untrash a collection
    #
    # + collection - Unique identifier of the collection.
    # + return - The score has been untrashed
    remote isolated function untrashCollection(string collection) returns http:Response|error {
        string  path = string `/collections/${collection}/untrash`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List the scores contained in a collection
    #
    # + collection - Unique identifier of the collection.
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + sort - Sort
    # + direction - Sort direction
    # + 'limit - This is the maximum number of objects that may be returned
    # + next - An opaque string cursor to fetch the next page of data.
    # + previous - An opaque string cursor to fetch the previous page of data.
    # + return - List of scores
    remote isolated function listCollectionScores(string collection, string? sharingKey = (), string? sort = (), string? direction = (), int 'limit = 25, string? next = (), string? previous = ()) returns ScoreDetails[]|error {
        string  path = string `/collections/${collection}/scores`;
        map<anydata> queryParam = {"sharingKey": sharingKey, "sort": sort, "direction": direction, "limit": 'limit, "next": next, "previous": previous};
        path = path + check getPathForQueryParam(queryParam);
        ScoreDetails[] response = check self.clientEp-> get(path, targetType = ScoreDetailsArr);
        return response;
    }
    # Add a score to the collection
    #
    # + collection - Unique identifier of the collection.
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Score details
    remote isolated function addScoreToCollection(string collection, string score, string? sharingKey = ()) returns ScoreDetails|error {
        string  path = string `/collections/${collection}/scores/${score}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        ScoreDetails response = check self.clientEp-> put(path, request, targetType = ScoreDetails);
        return response;
    }
    # Delete a score from the collection
    #
    # + collection - Unique identifier of the collection.
    # + score - Unique identifier of the score document. This can be a Flat Score unique identifier (i.e. `ScoreDetails.id`) or, if the score is also a Google Drive file, the Drive file unique identifier prefixed with `drive-` (e.g. `drive-0B000000000`).
    # + sharingKey - This sharing key must be specified to access to a score or collection with a `privacy` mode set to `privateLink` and the current user is not a collaborator of the document.
    # + return - Score removed from the collection
    remote isolated function deleteScoreFromCollection(string collection, string score, string? sharingKey = ()) returns http:Response|error {
        string  path = string `/collections/${collection}/scores/${score}`;
        map<anydata> queryParam = {"sharingKey": sharingKey};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get a public user profile
    #
    # + user - This route parameter is the unique identifier of the user. You can specify an email instead of an unique identifier. If you are executing this request authenticated, you can use `me` as a value instead of the current User unique identifier to work on the current authenticated user.
    # + return - The user public details
    remote isolated function getUser(string user) returns UserPublic|error {
        string  path = string `/users/${user}`;
        UserPublic response = check self.clientEp-> get(path, targetType = UserPublic);
        return response;
    }
    # List liked scores
    #
    # + user - Unique identifier of a Flat user. If you authenticated, you can use `me` to refer to the current user.
    # + ids - Return only the identifiers of the scores
    # + return - List of liked scores
    remote isolated function gerUserLikes(string user, boolean? ids = ()) returns ScoreDetails[]|error {
        string  path = string `/users/${user}/likes`;
        map<anydata> queryParam = {"ids": ids};
        path = path + check getPathForQueryParam(queryParam);
        ScoreDetails[] response = check self.clientEp-> get(path, targetType = ScoreDetailsArr);
        return response;
    }
    # List user's scores
    #
    # + user - Unique identifier of a Flat user. If you authenticated, you can use `me` to refer to the current user.
    # + parent - Filter the score forked from the score id `parent`
    # + return - The user scores
    remote isolated function getUserScores(string user, string? parent = ()) returns ScoreDetails[]|error {
        string  path = string `/users/${user}/scores`;
        map<anydata> queryParam = {"parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        ScoreDetails[] response = check self.clientEp-> get(path, targetType = ScoreDetailsArr);
        return response;
    }
    # List the organization users
    #
    # + sort - The order to sort the user list
    # + direction - Sort direction
    # + next - An opaque string cursor to fetch the next page of data.
    # + previous - An opaque string cursor to fetch the previous page of data.
    # + role - Filter users by role
    # + q - The query to search
    # + 'group - Filter users by group
    # + noActiveLicense - Filter users who don't have an active license
    # + licenseExpirationDate - Filter users by license expiration date or `active` / `notActive`
    # + onlyIds - Return only user ids
    # + 'limit - This is the maximum number of objects that may be returned
    # + return - List of users
    remote isolated function listOrganizationUsers(string[]? sort = (), string? direction = (), string? next = (), string? previous = (), string[]? role = (), string? q = (), string[]? 'group = (), boolean? noActiveLicense = (), string[]? licenseExpirationDate = (), boolean? onlyIds = (), int 'limit = 25) returns UserDetailsAdmin[]|error {
        string  path = string `/organizations/users`;
        map<anydata> queryParam = {"sort": sort, "direction": direction, "next": next, "previous": previous, "role": role, "q": q, "group": 'group, "noActiveLicense": noActiveLicense, "licenseExpirationDate": licenseExpirationDate, "onlyIds": onlyIds, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        UserDetailsAdmin[] response = check self.clientEp-> get(path, targetType = UserDetailsAdminArr);
        return response;
    }
    # Create a new user account
    #
    # + return - New user created
    remote isolated function createOrganizationUser(UserCreation payload) returns UserDetailsAdmin|error {
        string  path = string `/organizations/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserDetailsAdmin response = check self.clientEp->post(path, request, targetType=UserDetailsAdmin);
        return response;
    }
    # Count the organization users using the provided filters
    #
    # + role - Filter users by role
    # + q - The query to search
    # + 'group - Filter users by group
    # + noActiveLicense - Filter users who don't have an active license
    # + return - Number of users
    remote isolated function countOrgaUsers(string[]? role = (), string? q = (), string[]? 'group = (), boolean? noActiveLicense = ()) returns UserDetailsAdmin[]|error {
        string  path = string `/organizations/users/count`;
        map<anydata> queryParam = {"role": role, "q": q, "group": 'group, "noActiveLicense": noActiveLicense};
        path = path + check getPathForQueryParam(queryParam);
        UserDetailsAdmin[] response = check self.clientEp-> get(path, targetType = UserDetailsAdminArr);
        return response;
    }
    # Update account information
    #
    # + user - Unique identifier of the Flat account
    # + return - User updated
    remote isolated function updateOrganizationUser(string user, UserAdminUpdate payload) returns UserDetailsAdmin|error {
        string  path = string `/organizations/users/${user}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UserDetailsAdmin response = check self.clientEp->put(path, request, targetType=UserDetailsAdmin);
        return response;
    }
    # Remove an account from Flat
    #
    # + user - Unique identifier of the Flat account
    # + convertToIndividual - If `true`, the account will be only removed from the organization and converted into an individual account on our public website, https://flat.io.
    # + return - User deleted
    remote isolated function removeOrganizationUser(string user, boolean? convertToIndividual = ()) returns http:Response|error {
        string  path = string `/organizations/users/${user}`;
        map<anydata> queryParam = {"convertToIndividual": convertToIndividual};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List the organization invitations
    #
    # + role - Filter users by role
    # + 'limit - This is the maximum number of objects that may be returned
    # + next - An opaque string cursor to fetch the next page of data.
    # + previous - An opaque string cursor to fetch the previous page of data.
    # + return - List of invitations
    remote isolated function listOrganizationInvitations(string? role = (), int 'limit = 50, string? next = (), string? previous = ()) returns OrganizationInvitation[]|error {
        string  path = string `/organizations/invitations`;
        map<anydata> queryParam = {"role": role, "limit": 'limit, "next": next, "previous": previous};
        path = path + check getPathForQueryParam(queryParam);
        OrganizationInvitation[] response = check self.clientEp-> get(path, targetType = OrganizationInvitationArr);
        return response;
    }
    # Create a new invitation to join the organization
    #
    # + return - New invitation created
    remote isolated function createOrganizationInvitation(OrganizationInvitationCreation payload) returns OrganizationInvitation|error {
        string  path = string `/organizations/invitations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrganizationInvitation response = check self.clientEp->post(path, request, targetType=OrganizationInvitation);
        return response;
    }
    # Remove an organization invitation
    #
    # + invitation - Unique identifier of the invitation
    # + return - The invitation has been removed
    remote isolated function removeOrganizationInvitation(string invitation) returns http:Response|error {
        string  path = string `/organizations/invitations/${invitation}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List LTI 1.x credentials
    #
    # + return - The list of LTI Credentials
    remote isolated function listLtiCredentials() returns LtiCredentials[]|error {
        string  path = string `/organizations/lti/credentials`;
        LtiCredentials[] response = check self.clientEp-> get(path, targetType = LtiCredentialsArr);
        return response;
    }
    # Create a new couple of LTI 1.x credentials
    #
    # + return - The LTI Credentials
    remote isolated function createLtiCredentials(LtiCredentialsCreation payload) returns LtiCredentials|error {
        string  path = string `/organizations/lti/credentials`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        LtiCredentials response = check self.clientEp->post(path, request, targetType=LtiCredentials);
        return response;
    }
    # Revoke LTI 1.x credentials
    #
    # + credentials - Credentials unique identifier
    # + return - Credentials revoked
    remote isolated function revokeLtiCredentials(string credentials) returns http:Response|error {
        string  path = string `/organizations/lti/credentials/${credentials}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List the classes available for the current user
    #
    # + state - Filter the classes by state
    # + return - The list of classes
    remote isolated function listClasses(string state = "active") returns ClassDetails[]|error {
        string  path = string `/classes`;
        map<anydata> queryParam = {"state": state};
        path = path + check getPathForQueryParam(queryParam);
        ClassDetails[] response = check self.clientEp-> get(path, targetType = ClassDetailsArr);
        return response;
    }
    # Create a new class
    #
    # + return - The new class details
    remote isolated function createClass(ClassCreation payload) returns ClassDetails|error {
        string  path = string `/classes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClassDetails response = check self.clientEp->post(path, request, targetType=ClassDetails);
        return response;
    }
    # Get the details of a single class
    #
    # + 'class - Unique identifier of the class
    # + return - The new class details
    remote isolated function getClass(string 'class) returns ClassDetails|error {
        string  path = string `/'classes/${'class}`;
        ClassDetails response = check self.clientEp-> get(path, targetType = ClassDetails);
        return response;
    }
    # Update the class
    #
    # + 'class - Unique identifier of the class
    # + payload - Details of the Class
    # + return - The new class details
    remote isolated function updateClass(string 'class, ClassUpdate payload) returns ClassDetails|error {
        string  path = string `/'classes/${'class}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClassDetails response = check self.clientEp->put(path, request, targetType=ClassDetails);
        return response;
    }
    # Archive the class
    #
    # + 'class - Unique identifier of the class
    # + return - The class details
    remote isolated function archiveClass(string 'class) returns ClassDetails|error {
        string  path = string `/'classes/${'class}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClassDetails response = check self.clientEp-> post(path, request, targetType = ClassDetails);
        return response;
    }
    # Unarchive the class
    #
    # + 'class - Unique identifier of the class
    # + return - The class details
    remote isolated function unarchiveClass(string 'class) returns ClassDetails|error {
        string  path = string `/'classes/${'class}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClassDetails response = check self.clientEp-> delete(path, request, targetType = ClassDetails);
        return response;
    }
    # Activate the class
    #
    # + 'class - Unique identifier of the class
    # + return - The class details
    remote isolated function activateClass(string 'class) returns ClassDetails|error {
        string  path = string `/'classes/${'class}/activate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClassDetails response = check self.clientEp-> post(path, request, targetType = ClassDetails);
        return response;
    }
    # Add a user to the class
    #
    # + 'class - Unique identifier of the class
    # + user - Unique identifier of the user
    # + return - The user has been added to the class
    remote isolated function addClassUser(string 'class, string user) returns http:Response|error {
        string  path = string `/'classes/${'class}/users/${user}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a user from the class
    #
    # + 'class - Unique identifier of the class
    # + user - Unique identifier of the user
    # + return - The user has been removed from the class
    remote isolated function deleteClassUser(string 'class, string user) returns http:Response|error {
        string  path = string `/'classes/${'class}/users/${user}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List the submissions for a student
    #
    # + 'class - Unique identifier of the class
    # + user - Unique identifier of the user
    # + return - The list of submissions
    remote isolated function listClassStudentSubmissions(string 'class, string user) returns AssignmentSubmission[]|error {
        string  path = string `/'classes/${'class}/students/${user}/submissions`;
        AssignmentSubmission[] response = check self.clientEp-> get(path, targetType = AssignmentSubmissionArr);
        return response;
    }
    # Assignments listing
    #
    # + 'class - Unique identifier of the class
    # + return - List of assignments for the class
    remote isolated function listAssignments(string 'class) returns Assignment[]|error {
        string  path = string `/'classes/${'class}/assignments`;
        Assignment[] response = check self.clientEp-> get(path, targetType = AssignmentArr);
        return response;
    }
    # Assignment creation
    #
    # + 'class - Unique identifier of the class
    # + return - The assignment has been created
    remote isolated function createAssignment(string 'class, AssignmentCreation payload) returns Assignment|error {
        string  path = string `/'classes/${'class}/assignments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Assignment response = check self.clientEp->post(path, request, targetType=Assignment);
        return response;
    }
    # Copy an assignment
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - The new created assingment
    remote isolated function copyAssignment(string 'class, string assignment, AssignmentCopy payload) returns Assignment|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/copy`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Assignment response = check self.clientEp->post(path, request, targetType=Assignment);
        return response;
    }
    # Archive the assignment
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - The assignment details
    remote isolated function archiveAssignment(string 'class, string assignment) returns Assignment|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Assignment response = check self.clientEp-> post(path, request, targetType = Assignment);
        return response;
    }
    # Unarchive the assignment.
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - The assignment details
    remote isolated function unarchiveAssignment(string 'class, string assignment) returns Assignment|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Assignment response = check self.clientEp-> delete(path, request, targetType = Assignment);
        return response;
    }
    # List the students' submissions
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - The submissions
    remote isolated function getSubmissions(string 'class, string assignment) returns AssignmentSubmission[]|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions`;
        AssignmentSubmission[] response = check self.clientEp-> get(path, targetType = AssignmentSubmissionArr);
        return response;
    }
    # Create or edit a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - The submission
    remote isolated function createSubmission(string 'class, string assignment, AssignmentSubmissionUpdate payload) returns AssignmentSubmission|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssignmentSubmission response = check self.clientEp->put(path, request, targetType=AssignmentSubmission);
        return response;
    }
    # CSV Grades exports
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - List of submissions
    remote isolated function exportSubmissionsReviewsAsCsv(string 'class, string assignment) returns string|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/csv`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Excel Grades exports
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + return - List of submissions
    remote isolated function exportSubmissionsReviewsAsExcel(string 'class, string assignment) returns string|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/excel`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Get a student submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - A submission
    remote isolated function getSubmission(string 'class, string assignment, string submission) returns AssignmentSubmission|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}`;
        AssignmentSubmission response = check self.clientEp-> get(path, targetType = AssignmentSubmission);
        return response;
    }
    # Edit a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - The submission
    remote isolated function editSubmission(string 'class, string assignment, string submission, AssignmentSubmissionUpdate payload) returns AssignmentSubmission|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssignmentSubmission response = check self.clientEp->put(path, request, targetType=AssignmentSubmission);
        return response;
    }
    # Delete a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - The submission has been deleted
    remote isolated function deleteSubmission(string 'class, string assignment, string submission) returns http:Response|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get the history of the submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - The history of the submission
    remote isolated function getSubmissionHistory(string 'class, string assignment, string submission) returns AssignmentSubmissionHistory[]|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}/history`;
        AssignmentSubmissionHistory[] response = check self.clientEp-> get(path, targetType = AssignmentSubmissionHistoryArr);
        return response;
    }
    # List the feedback comments of a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - The comments of the score
    remote isolated function getSubmissionComments(string 'class, string assignment, string submission) returns AssignmentSubmissionComment[]|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}/comments`;
        AssignmentSubmissionComment[] response = check self.clientEp-> get(path, targetType = AssignmentSubmissionCommentArr);
        return response;
    }
    # Add a feedback comment to a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + return - The comment
    remote isolated function postSubmissionComment(string 'class, string assignment, string submission, AssignmentSubmissionCommentCreation payload) returns AssignmentSubmissionComment|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssignmentSubmissionComment response = check self.clientEp->post(path, request, targetType=AssignmentSubmissionComment);
        return response;
    }
    # Update a feedback comment to a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + comment - Unique identifier of the comment
    # + return - The comment
    remote isolated function updateSubmissionComment(string 'class, string assignment, string submission, string comment, AssignmentSubmissionCommentCreation payload) returns AssignmentSubmissionComment|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}/comments/${comment}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AssignmentSubmissionComment response = check self.clientEp->put(path, request, targetType=AssignmentSubmissionComment);
        return response;
    }
    # Delete a feedback comment to a submission
    #
    # + 'class - Unique identifier of the class
    # + assignment - Unique identifier of the assignment
    # + submission - Unique identifier of the submission
    # + comment - Unique identifier of the comment
    # + return - The comment has been deleted
    remote isolated function deleteSubmissionComment(string 'class, string assignment, string submission, string comment) returns http:Response|error {
        string  path = string `/'classes/${'class}/assignments/${assignment}/submissions/${submission}/comments/${comment}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Join a class
    #
    # + enrollmentCode - The enrollment code, available to the teacher in `ClassDetails`
    # + return - The new class details
    remote isolated function enrollClass(string enrollmentCode) returns ClassDetails|error {
        string  path = string `/classes/enroll/${enrollmentCode}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ClassDetails response = check self.clientEp-> post(path, request, targetType = ClassDetails);
        return response;
    }
    # Get group information
    #
    # + 'group - Unique identifier of a Flat group
    # + return - The group details
    remote isolated function getGroupDetails(string 'group) returns GroupDetails|error {
        string  path = string `/'groups/${'group}`;
        GroupDetails response = check self.clientEp-> get(path, targetType = GroupDetails);
        return response;
    }
    # List group's users
    #
    # + 'group - Unique identifier of a Flat group
    # + 'source - Filter the users by their source
    # + return - The list of users member of the group
    remote isolated function listGroupUsers(string 'group, string? 'source = ()) returns UserPublic[]|error {
        string  path = string `/'groups/${'group}/users`;
        map<anydata> queryParam = {"source": 'source};
        path = path + check getPathForQueryParam(queryParam);
        UserPublic[] response = check self.clientEp-> get(path, targetType = UserPublicArr);
        return response;
    }
    # List group's scores
    #
    # + 'group - Unique identifier of a Flat group
    # + parent - Filter the score forked from the score id `parent`
    # + return - The group's scores
    remote isolated function getGroupScores(string 'group, string? parent = ()) returns ScoreDetails[]|error {
        string  path = string `/'groups/${'group}/scores`;
        map<anydata> queryParam = {"parent": parent};
        path = path + check getPathForQueryParam(queryParam);
        ScoreDetails[] response = check self.clientEp-> get(path, targetType = ScoreDetailsArr);
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
