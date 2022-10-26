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

# This is a generated connector for [Vonage Voice API v1.3.6](https://nexmo-api-specification.herokuapp.com/api/voice) OpenAPI specification.
# The Voice API lets you create outbound calls, control in-progress calls and get information about historical calls. 
# More information about the Voice API can be found at https://developer.nexmo.com/voice/voice-api/overview.
@display {label: "Vonage Voice", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://dashboard.nexmo.com/) and obtain tokens following [this guide](https://dashboard.nexmo.com/getting-started/voice).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://api.nexmo.com/v1/calls") returns error? {
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
        string resourcePath = string `/`;
        map<anydata> queryParam = {"status": status, "date_start": dateStart, "date_end": dateEnd, "page_size": pageSize, "record_index": recordIndex, "order": 'order, "conversation_uuid": conversationUuid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetCallsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create an outbound call
    #
    # + payload - Call Details 
    # + return - Created 
    remote isolated function createCall(Body payload) returns CreateCallResponse|error {
        string resourcePath = string `/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateCallResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get detail of a specific call
    #
    # + uuid - UUID of the Call 
    # + return - Ok 
    remote isolated function getCall(string uuid) returns GetCallResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}`;
        GetCallResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Modify an in progress call
    #
    # + uuid - UUID of the Call 
    # + payload - Request Body 
    # + return - No Content 
    remote isolated function updateCall(string uuid, UuidBody payload) returns http:Response|error {
        string resourcePath = string `/${getEncodedUri(uuid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Play an audio file into a call
    #
    # + uuid - UUID of the Call Leg 
    # + payload - action to perform 
    # + return - Ok 
    remote isolated function startStream(string uuid, StartStreamRequest payload) returns StartStreamResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}/stream`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StartStreamResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Stop playing an audio file into a call
    #
    # + uuid - UUID of the Call Leg 
    # + return - Ok 
    remote isolated function stopStream(string uuid) returns StopStreamResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}/stream`;
        StopStreamResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Play text to speech into a call
    #
    # + uuid - UUID of the Call Leg 
    # + payload - Action to perform 
    # + return - Ok 
    remote isolated function startTalk(string uuid, StartTalkRequest payload) returns StartTalkResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}/talk`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StartTalkResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Stop text to speech in a call
    #
    # + uuid - UUID of the Call Leg 
    # + return - Ok 
    remote isolated function stopTalk(string uuid) returns StopTalkResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}/talk`;
        StopTalkResponse response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Play DTMF tones into a call
    #
    # + uuid - UUID of the Call Leg 
    # + payload - action to perform 
    # + return - Ok 
    remote isolated function startDTMF(string uuid, DTMFRequest payload) returns DTMFResponse|error {
        string resourcePath = string `/${getEncodedUri(uuid)}/dtmf`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DTMFResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
}
