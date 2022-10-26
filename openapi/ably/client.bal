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

# This is a generated connector for [Ably REST API v1.1.0](https://ably.com/documentation/rest-api) OpenAPI specification.
# The [Ably REST API](https://www.ably.io/documentation/rest-api) provides a way for a wide range of server and client devices to communicate with the Ably service over REST.
# The REST API does not provide a realtime long-lived connection to Ably, but in all other respects is a simple subset of the full [realtime messaging API](https://ably.com/documentation/realtime).
@display {label: "Ably", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Ably account](https://ably.com/) and obtain tokens following [this guide](https://ably.com/documentation/core-features/versions/v1.1/authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://rest.ably.io") returns error? {
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
    # Enumerate all active channels of the application
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + 'limit - Optionally specifies the maximum number of results to return. A limit greater than 1000 is unsupported 
    # + prefix - Optionally limits the query to only those channels whose name starts with the given prefix 
    # + 'by - optionally specifies whether to return just channel names (by=id) or ChannelDetails (by=value) 
    # + return - OK 
    remote isolated function getMetadataOfAllChannels(string? xAblyVersion = (), string? format = (), int 'limit = 100, string? prefix = (), string? 'by = ()) returns InlineResponse2xx|error {
        string resourcePath = string `/channels`;
        map<anydata> queryParam = {"format": format, "limit": 'limit, "prefix": prefix, "by": 'by};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        InlineResponse2xx response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get metadata of a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels). 
    # + return - OK 
    remote isolated function getMetadataOfChannel(string channelId, string? xAblyVersion = (), string? format = ()) returns ChannelDetails|error {
        string resourcePath = string `/channels/${getEncodedUri(channelId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ChannelDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get message history for a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels). 
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time. 
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid. 
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time. 
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point. 
    # + return - OK 
    remote isolated function getMessagesByChannel(string channelId, string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards") returns Message[]|error {
        string resourcePath = string `/channels/${getEncodedUri(channelId)}/messages`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        Message[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Publish a message to a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels). 
    # + payload - Message 
    # + return - OK 
    remote isolated function publishMessagesToChannel(string channelId, Message payload, string? xAblyVersion = (), string? format = ()) returns InlineResponse2xx1|error {
        string resourcePath = string `/channels/${getEncodedUri(channelId)}/messages`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2xx1 response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Get presence of a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels). 
    # + clientId - Optional filter to restrict members present with that clientId 
    # + connectionId - Optional filter to restrict members present with that connectionId 
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid. 
    # + return - OK 
    remote isolated function getPresenceOfChannel(string channelId, string? xAblyVersion = (), string? format = (), string? clientId = (), string? connectionId = (), int 'limit = 100) returns PresenceMessage[]|error {
        string resourcePath = string `/channels/${getEncodedUri(channelId)}/presence`;
        map<anydata> queryParam = {"format": format, "clientId": clientId, "connectionId": connectionId, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PresenceMessage[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get presence history of a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels). 
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time. 
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid. 
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time. 
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point. 
    # + return - OK 
    remote isolated function getPresenceHistoryOfChannel(string channelId, string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards") returns PresenceMessage[]|error {
        string resourcePath = string `/channels/${getEncodedUri(channelId)}/presence/history`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PresenceMessage[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Request an access token
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + keyName - The [key name](https://www.ably.io/documentation/rest-api/token-request-spec#api-key-format) comprises of the app ID and key ID of an API key. 
    # + payload - Request Body 
    # + return - OK 
    remote isolated function requestAccessToken(string keyName, KeynameRequesttokenBody payload, string? xAblyVersion = (), string? format = ()) returns TokenDetails|error {
        string resourcePath = string `/keys/${getEncodedUri(keyName)}/requestToken`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TokenDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # List channel subscriptions
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channel - Filter to restrict to subscriptions associated with that channel. 
    # + deviceId - Optional filter to restrict to devices associated with that deviceId. Cannot be used with clientId. 
    # + clientId - Optional filter to restrict to devices associated with that clientId. Cannot be used with deviceId. 
    # + 'limit - The maximum number of records to return. 
    # + return - OK 
    remote isolated function getPushSubscriptionsOnChannels(string? xAblyVersion = (), string? format = (), string? channel = (), string? deviceId = (), string? clientId = (), int 'limit = 100) returns DeviceDetails|error {
        string resourcePath = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format, "channel": channel, "deviceId": deviceId, "clientId": clientId, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Subscribe a device to a channel
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + payload - Request Body 
    # + return - OK 
    remote isolated function subscribePushDeviceToChannel(PushChannelsubscriptionsBody payload, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string resourcePath = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Delete a registered device's update token
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + channel - Filter to restrict to subscriptions associated with that channel. 
    # + deviceId - Must be set when clientId is empty, cannot be used with clientId. 
    # + clientId - Must be set when deviceId is empty, cannot be used with deviceId. 
    # + return - OK 
    remote isolated function deletePushDeviceDetails(string? xAblyVersion = (), string? format = (), string? channel = (), string? deviceId = (), string? clientId = ()) returns http:Response|error {
        string resourcePath = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format, "channel": channel, "deviceId": deviceId, "clientId": clientId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # List all channels with at least one subscribed device
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + return - OK 
    remote isolated function getChannelsWithPushSubscribers(string? xAblyVersion = (), string? format = ()) returns string[]|error {
        string resourcePath = string `/push/channels`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        string[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List devices registered for receiving push notifications
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Optional filter to restrict to devices associated with that deviceId. 
    # + clientId - Optional filter to restrict to devices associated with that clientId. 
    # + 'limit - The maximum number of records to return. 
    # + return - OK 
    remote isolated function getRegisteredPushDevices(string? xAblyVersion = (), string? format = (), string? deviceId = (), string? clientId = (), int 'limit = 100) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format, "deviceId": deviceId, "clientId": clientId, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Register a device for receiving push notifications
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + payload - Device Details 
    # + return - OK 
    remote isolated function registerPushDevice(DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeviceDetails response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Unregister matching devices for push notifications
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Optional filter to restrict to devices associated with that deviceId. Cannot be used with clientId. 
    # + clientId - Optional filter to restrict to devices associated with that clientId. Cannot be used with deviceId. 
    # + return - OK 
    remote isolated function unregisterAllPushDevices(string? xAblyVersion = (), string? format = (), string? deviceId = (), string? clientId = ()) returns http:Response|error {
        string resourcePath = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format, "deviceId": deviceId, "clientId": clientId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Get a device registration
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Device's ID. 
    # + return - OK 
    remote isolated function getPushDeviceDetails(string deviceId, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations/${getEncodedUri(deviceId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Update a device registration
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Device's ID. 
    # + payload - Device Details 
    # + return - OK 
    remote isolated function putPushDeviceDetails(string deviceId, DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations/${getEncodedUri(deviceId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeviceDetails response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Unregister a single device for push notifications
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Device's ID. 
    # + return - OK 
    remote isolated function unregisterPushDevice(string deviceId, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string resourcePath = string `/push/deviceRegistrations/${getEncodedUri(deviceId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->delete(resourcePath, headers = httpHeaders);
        return response;
    }
    # Update a device registration
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Device's ID. 
    # + payload - Device Details 
    # + return - OK 
    remote isolated function patchPushDeviceDetails(string deviceId, DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations/${getEncodedUri(deviceId)}`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeviceDetails response = check self.clientEp->patch(resourcePath, request, httpHeaders);
        return response;
    }
    # Reset a registered device's update token
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + deviceId - Device's ID. 
    # + return - OK 
    remote isolated function updatePushDeviceDetails(string deviceId, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string resourcePath = string `/push/deviceRegistrations/${getEncodedUri(deviceId)}/resetUpdateToken`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Publish a push notification to device(s)
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + payload - Request Body 
    # + return - OK 
    remote isolated function publishPushNotificationToDevices(PushPublishBody payload, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string resourcePath = string `/push/publish`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Retrieve usage statistics for an application
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time. 
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid. 
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time. 
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point. 
    # + unit - Specifies the unit of aggregation in the returned results. 
    # + return - OK 
    remote isolated function getStats(string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards", string unit = "minute") returns json|error {
        string resourcePath = string `/stats`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction, "unit": unit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Get the service time
    #
    # + xAblyVersion - The version of the API you wish to use. 
    # + format - The response format you would like 
    # + return - OK 
    remote isolated function getTime(string? xAblyVersion = (), string? format = ()) returns int[]|error {
        string resourcePath = string `/time`;
        map<anydata> queryParam = {"format": format};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        int[] response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
