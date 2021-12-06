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
    http:CredentialsConfig auth;
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

# This is a generated connector for [BulkSMS API v1](https://www.bulksms.com/developer/) OpenAPI Specification.
# BulkSMS API provides capability to access you to submit and receive [BulkSMS](https://www.bulksms.com/) messages. 
# You can also get  access to past messages and see your account profile. Dates are formatted according to ISO-8601, 
# such as `1970-01-01T10:00:00+01:00` for 1st January 1970, 10AM UTC+1. It currently supports operations on messages, 
# numbers, user profile, webhooks, and batch messages.
@display {label: "BulkSMS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [BulkSMS account](https://www.bulksms.com/) and obtain tokens following 
    # [this guide](https://www.bulksms.com/developer/json/v1/#section/Authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.bulksms.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Lists webhooks
    #
    # + return - Array of Webhooks
    remote isolated function listWebhooks() returns Webhook[]|error {
        string  path = string `/webhooks`;
        Webhook[] response = check self.clientEp-> get(path, targetType = WebhookArr);
        return response;
    }
    # Creates a webhook
    #
    # + payload - Contains the property values for your new webhook
    # + return - Contains the webhook you created
    remote isolated function createWebhook(WebhookEntry payload) returns Webhook|error {
        string  path = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, targetType=Webhook);
        return response;
    }
    # Reads a webhook
    #
    # + id - The `id` of the webhook
    # + return - The properties of a specific webhook
    remote isolated function getWebhookByID(string id) returns Webhook|error {
        string  path = string `/webhooks/${id}`;
        Webhook response = check self.clientEp-> get(path, targetType = Webhook);
        return response;
    }
    # Updates a webhook
    #
    # + id - The `id` of the webhook
    # + payload - Contains the new property values for the webhook
    # + return - The properties of the updated webhook
    remote isolated function updateWebhook(string id, WebhookEntry payload) returns Webhook|error {
        string  path = string `/webhooks/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, targetType=Webhook);
        return response;
    }
    # Deletes a webhook
    #
    # + id - The `id` of the webhook
    # + return - The webhook was deleted successfully
    remote isolated function deleteWebhook(string id) returns http:Response|error {
        string  path = string `/webhooks/${id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Gets profile
    #
    # + return - A Profile object
    remote isolated function getProfile() returns Profile|error {
        string  path = string `/profile`;
        Profile response = check self.clientEp-> get(path, targetType = Profile);
        return response;
    }
    # Retrieves Messages
    #
    # + 'limit - The maximum number of messages that are returned.  The default is 1000.
    # + filter - See the message filtering for more information.
    # + sortOrder - The default value is DESCENDING
    # + return - Contains the requested array of messages
    remote isolated function retrieveMessages(int? 'limit = (), string? filter = (), string? sortOrder = ()) returns Message[]|error {
        string  path = string `/messages`;
        map<anydata> queryParam = {"limit": 'limit, "filter": filter, "sortOrder": sortOrder};
        path = path + check getPathForQueryParam(queryParam);
        Message[] response = check self.clientEp-> get(path, targetType = MessageArr);
        return response;
    }
    # Sends batch messages
    #
    # + payload - Contains details of the message (or messages) that you want to send.
    # + deduplicationId - Safeguards against the possibility of sending the same messages more than once.
    # + autoUnicode - Specifies how to deal with message text that contains characters not present in the GSM 03.38 character set.
    # + scheduleDate - Allows you to send a message in the future.
    # + scheduleDescription - A note that is stored together with a scheduled submission, which could be used to more easily identify the scheduled submission at a later date.
    # + return - An array of the messages that were created from the request
    remote isolated function sendBatchMessages(SubmissionEntry[] payload, int? deduplicationId = (), boolean autoUnicode = false, string? scheduleDate = (), string? scheduleDescription = ()) returns Message[]|error {
        string  path = string `/messages`;
        map<anydata> queryParam = {"deduplication-id": deduplicationId, "auto-unicode": autoUnicode, "schedule-date": scheduleDate, "schedule-description": scheduleDescription};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Message[] response = check self.clientEp->post(path, request, targetType=MessageArr);
        return response;
    }
    # Sends message by simple GET or POST
    #
    # + to - The phone number of the recipient.
    # + body - The text you want to send.
    # + deduplicationId - Refer to the `deduplication-id` parameter.
    # + return - An array of messages
    remote isolated function sendMessage(string to, string body, int? deduplicationId = ()) returns Message[]|error {
        string  path = string `/messages/send`;
        map<anydata> queryParam = {"to": to, "body": body, "deduplication-id": deduplicationId};
        path = path + check getPathForQueryParam(queryParam);
        Message[] response = check self.clientEp-> get(path, targetType = MessageArr);
        return response;
    }
    # Lists Related Messages
    #
    # + id - The `id` of the sent message
    # + return - An array of related messages.  If the `id` is not a sent message, the array will be empty.
    remote isolated function getSentMessages(string id) returns Message[]|error {
        string  path = string `/messages/${id}/relatedReceivedMessages`;
        Message[] response = check self.clientEp-> get(path, targetType = MessageArr);
        return response;
    }
    # Shows Message
    #
    # + id - The `id` of the message you want to retrieve
    # + return - The message detail
    remote isolated function getMessage(string id) returns Message|error {
        string  path = string `/messages/${id}`;
        Message response = check self.clientEp-> get(path, targetType = Message);
        return response;
    }
    # Lists blocked numbers
    #
    # + minId - Records with an `id` that is greater or equal to min-id will be returned. The default value is `0`.  You can add 1 to an id that you previously retrieved, to return subsequent records.
    # + 'limit - The maximum number of records to return. The default value is `10000`. The value cannot be greater than 10000.
    # + return - A list of BlockedNumber objects
    remote isolated function listBlockedNumbers(int? minId = (), int? 'limit = ()) returns BlockedNumber|error {
        string  path = string `/blocked-numbers`;
        map<anydata> queryParam = {"min-id": minId, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        BlockedNumber response = check self.clientEp-> get(path, targetType = BlockedNumber);
        return response;
    }
    # Creates a blocked number
    #
    # + payload - Maximum size: `1000` items
    # + return - Empty body upon success
    remote isolated function createBlockedNumber(PhoneNumber[] payload) returns http:Response|error {
        string  path = string `/blocked-numbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
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
