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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [BulkSMS API v1](https://www.bulksms.com/developer/) OpenAPI Specification.
# BulkSMS API provides capability to access you to submit and receive [BulkSMS](https://www.bulksms.com/) messages. You can also get  access to past messages and see your account profile. Dates are formatted according to ISO-8601, such as `1970-01-01T10:00:00+01:00` for 1st January 1970, 10AM UTC+1. It currently supports operations on messages, numbers, user profile, webhooks, and batch messages.
@display {label: "BulkSMS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create an [BulkSMS account](https://www.bulksms.com/) and obtain tokens following [this guide](https://www.bulksms.com/developer/json/v1/#section/Authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.bulksms.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Lists webhooks
    #
    # + return - Array of Webhooks 
    remote isolated function listWebhooks() returns Webhook[]|error {
        string resourcePath = string `/webhooks`;
        Webhook[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a webhook
    #
    # + payload - Contains the property values for your new webhook 
    # + return - Contains the webhook you created 
    remote isolated function createWebhook(WebhookEntry payload) returns Webhook|error {
        string resourcePath = string `/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Reads a webhook
    #
    # + id - The `id` of the webhook 
    # + return - The properties of a specific webhook 
    remote isolated function getWebhookByID(string id) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(id)}`;
        Webhook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a webhook
    #
    # + id - The `id` of the webhook 
    # + payload - Contains the new property values for the webhook 
    # + return - The properties of the updated webhook 
    remote isolated function updateWebhook(string id, WebhookEntry payload) returns Webhook|error {
        string resourcePath = string `/webhooks/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes a webhook
    #
    # + id - The `id` of the webhook 
    # + return - The webhook was deleted successfully 
    remote isolated function deleteWebhook(string id) returns http:Response|error {
        string resourcePath = string `/webhooks/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets profile
    #
    # + return - A Profile object 
    remote isolated function getProfile() returns Profile|error {
        string resourcePath = string `/profile`;
        Profile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves Messages
    #
    # + 'limit - The maximum number of messages that are returned.  The default is 1000. The value of `limit` is not a guarantee that a specific number of messages will be in the response, even if there are more messages available.  Consider the case where you have 150 messages and you specify `limit=50`.  It is possible that only 49 messages will be returned.  The  way to make sure that there are no more messages is to submit a new call using the `id` filter field with the `<` operator (described below). 
    # + filter - See the message filtering for more information. 
    # + sortOrder - The default value is DESCENDING If the `sortOrder` is DESCENDING, the newest messages be first in the result.  ASCENDING places the oldest messages on top of the response. 
    # + return - Contains the requested array of messages 
    remote isolated function retrieveMessages(int? 'limit = (), string? filter = (), string? sortOrder = ()) returns Message[]|error {
        string resourcePath = string `/messages`;
        map<anydata> queryParam = {"limit": 'limit, "filter": filter, "sortOrder": sortOrder};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Message[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Sends batch messages
    #
    # + deduplicationId - Safeguards against the possibility of sending the same messages more than once. If a communication failure occurs during a submission, you cannot be sure that the submission was processed; therefore you would have to submit it again. When you post the retry, you must use the `deduplication-id` of the original post. The BulkSMS system uses this ID to check that the request was not previously processed. (If it was previously processed, the submission will succeed, and the behaviour will be indistinguishable to you from a non-duplicated submission). The ID expires after about 12 hours. 
    # + autoUnicode - Specifies how to deal with message text that contains characters not present in the GSM 03.38 character set. Messages that contain only GSM 03.38 characters are not affected by this setting.  If the value is `true` then a message containing non-GSM 03.38 characters will be transmitted as a Unicode SMS (which is most likely more costly).  Please note: when `auto-unicode` is `true` and the value of the `encoding` property is specified as `UNICODE`, the message will always be sent as `UNICODE`. If the value is `false` and the `encoding` property is `TEXT` then non-GSM 03.38 characters will be replaced by the `?` character. When using this setting on the API, you should take case to ensure that your message is _clean_.   Invisible unicode and unexpected characters could unintentionally convert an message to `UNICODE`.  A common mistake is to use the backtick character (\`) which is unicode and will turn your `TEXT` message into a `UNICODE` message. 
    # + scheduleDate - Allows you to send a message in the future. An example value is `2019-02-18T13:00:00+02:00`.  It encodes to `2019-02-18T13%3A00%3A00%2B02%3A00`. Credits are deducted from your account immediately. Once submitted, scheduled messages cannot be changed or cancelled. The date can be a maximum of two years in the future. If the value is in the past, the message will be sent immediately. The date format requires you to supply an offset from UTC. You can decide to use the offset of your timezone, or maybe the zone of the recipient's location is more appropriate. If the destination is a group, the group members are determined at the time that you submit the message; not the time the message is scheduled to be sent. 
    # + scheduleDescription - A note that is stored together with a scheduled submission, which could be used to more easily identify the scheduled submission at a later date. The value of this field is ignored if the `schedule-date` is not provided. A value that is longer than 256 characters is truncated. 
    # + payload - Contains details of the message (or messages) that you want to send. 
    # + return - An array of the messages that were created from the request 
    remote isolated function sendBatchMessages(SubmissionEntry[] payload, int? deduplicationId = (), boolean autoUnicode = false, string? scheduleDate = (), string? scheduleDescription = ()) returns Message[]|error {
        string resourcePath = string `/messages`;
        map<anydata> queryParam = {"deduplication-id": deduplicationId, "auto-unicode": autoUnicode, "schedule-date": scheduleDate, "schedule-description": scheduleDescription};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Message[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Sends message by simple GET or POST
    #
    # + to - The phone number of the recipient. 
    # + body - The text you want to send. 
    # + deduplicationId - Refer to the `deduplication-id` parameter. 
    # + return - An array of messages 
    remote isolated function sendMessage(string to, string body, int? deduplicationId = ()) returns Message[]|error {
        string resourcePath = string `/messages/send`;
        map<anydata> queryParam = {"to": to, "body": body, "deduplication-id": deduplicationId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Message[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists Related Messages
    #
    # + id - The `id` of the sent message 
    # + return - An array of related messages.  If the `id` is not a sent message, the array will be empty. 
    remote isolated function getSentMessages(string id) returns Message[]|error {
        string resourcePath = string `/messages/${getEncodedUri(id)}/relatedReceivedMessages`;
        Message[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Shows Message
    #
    # + id - The `id` of the message you want to retrieve 
    # + return - The message detail 
    remote isolated function getMessage(string id) returns Message|error {
        string resourcePath = string `/messages/${getEncodedUri(id)}`;
        Message response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists blocked numbers
    #
    # + minId - Records with an `id` that is greater or equal to min-id will be returned. The default value is `0`.  You can add 1 to an id that you previously retrieved, to return subsequent records. 
    # + 'limit - The maximum number of records to return. The default value is `10000`. The value cannot be greater than 10000. 
    # + return - A list of BlockedNumber objects 
    remote isolated function listBlockedNumbers(int? minId = (), int? 'limit = ()) returns BlockedNumber|error {
        string resourcePath = string `/blocked-numbers`;
        map<anydata> queryParam = {"min-id": minId, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BlockedNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a blocked number
    #
    # + payload - Maximum size: `1000` items 
    # + return - Empty body upon success 
    remote isolated function createBlockedNumber(PhoneNumber[] payload) returns http:Response|error {
        string resourcePath = string `/blocked-numbers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
