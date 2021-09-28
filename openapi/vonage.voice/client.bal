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
    http:BearerTokenConfig auth;
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

# This is a generated connector for [Vonage Voice API v1.3.6](https://nexmo-api-specification.herokuapp.com/api/voice) OpenAPI specification.
# The Voice API lets you create outbound calls, control in-progress calls and get information about historical calls. 
# More information about the Voice API can be found at https://developer.nexmo.com/voice/voice-api/overview.
@display {label: "Vonage Voice", iconPath: "resources/vonage.voice.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://dashboard.nexmo.com/) and obtain tokens following [this guide](https://dashboard.nexmo.com/getting-started/voice).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.nexmo.com/v1/calls") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get details of your calls
    #
    # + status - Filter by call status
    # + dateStart - Return the records that occurred after this point in time
    # + dateEnd - Return the records that occurred before this point in time
    # + pageSize - Return this amount of records in the response
    # + recordIndex - Return calls from this index in the response
    # + 'order - Either ascending or  descending order.
    # + conversationUuid - Return all the records associated with a specific conversation.
    # + return - OK
    remote isolated function getCalls(string? status = (), string? dateStart = (), string? dateEnd = (), int pageSize = 10, int recordIndex = 0, string 'order = "asc", string? conversationUuid = ()) returns GetCallsResponse|error {
        string  path = string `/`;
        map<anydata> queryParam = {"status": status, "date_start": dateStart, "date_end": dateEnd, "page_size": pageSize, "record_index": recordIndex, "order": 'order, "conversation_uuid": conversationUuid};
        path = path + check getPathForQueryParam(queryParam);
        GetCallsResponse response = check self.clientEp-> get(path, targetType = GetCallsResponse);
        return response;
    }
    # Create an outbound call
    #
    # + payload - Call Details
    # + return - Created
    remote isolated function createCall(Body payload) returns CreateCallResponse|error {
        string  path = string `/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateCallResponse response = check self.clientEp->post(path, request, targetType=CreateCallResponse);
        return response;
    }
    # Get detail of a specific call
    #
    # + uuid - UUID of the Call
    # + return - Ok
    remote isolated function getCall(string uuid) returns GetCallResponse|error {
        string  path = string `/${uuid}`;
        GetCallResponse response = check self.clientEp-> get(path, targetType = GetCallResponse);
        return response;
    }
    # Modify an in progress call
    #
    # + uuid - UUID of the Call
    # + payload - Request Body
    # + return - No Content
    remote isolated function updateCall(string uuid, Body1 payload) returns http:Response|error {
        string  path = string `/${uuid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Play an audio file into a call
    #
    # + uuid - UUID of the Call Leg
    # + payload - action to perform
    # + return - Ok
    remote isolated function startStream(string uuid, StartStreamRequest payload) returns StartStreamResponse|error {
        string  path = string `/${uuid}/stream`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StartStreamResponse response = check self.clientEp->put(path, request, targetType=StartStreamResponse);
        return response;
    }
    # Stop playing an audio file into a call
    #
    # + uuid - UUID of the Call Leg
    # + return - Ok
    remote isolated function stopStream(string uuid) returns StopStreamResponse|error {
        string  path = string `/${uuid}/stream`;
        http:Request request = new;
        //TODO: Update the request as needed;
        StopStreamResponse response = check self.clientEp-> delete(path, request, targetType = StopStreamResponse);
        return response;
    }
    # Play text to speech into a call
    #
    # + uuid - UUID of the Call Leg
    # + payload - Action to perform
    # + return - Ok
    remote isolated function startTalk(string uuid, StartTalkRequest payload) returns StartTalkResponse|error {
        string  path = string `/${uuid}/talk`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        StartTalkResponse response = check self.clientEp->put(path, request, targetType=StartTalkResponse);
        return response;
    }
    # Stop text to speech in a call
    #
    # + uuid - UUID of the Call Leg
    # + return - Ok
    remote isolated function stopTalk(string uuid) returns StopTalkResponse|error {
        string  path = string `/${uuid}/talk`;
        http:Request request = new;
        //TODO: Update the request as needed;
        StopTalkResponse response = check self.clientEp-> delete(path, request, targetType = StopTalkResponse);
        return response;
    }
    # Play DTMF tones into a call
    #
    # + uuid - UUID of the Call Leg
    # + payload - action to perform
    # + return - Ok
    remote isolated function startDTMF(string uuid, DTMFRequest payload) returns DTMFResponse|error {
        string  path = string `/${uuid}/dtmf`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DTMFResponse response = check self.clientEp->put(path, request, targetType=DTMFResponse);
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
