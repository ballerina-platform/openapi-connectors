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

# This is a generated connector for [Sinch SMS API v1](https://www.sinch.com/) OpenAPI specification.
# Sinch SMS API is the one of the easiest APIs we offer and enables you to add fast and reliable global SMS to your applications. It allows for sending single messages, scheduled batch sending, message templates and "Only list messages sent from this sender number. Multiple originating numbers can be comma separated.
@display {label: "Sinch SMS", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/sms/api-reference/#authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://us.sms.api.sinch.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List Batches
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + page - The page number starting from 0. 
    # + pageSize - Determines the size of a page. Default: 30 Constraints: max 100 
    # + 'from - Only list messages sent from this sender number. Multiple originating numbers can be comma separated. 
    # + startDate - Only list messages received at or after this date time formatted as [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) Default: Now-24 
    # + endDate - Only list messages received before this date time formatted as [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) 
    # + return - OK 
    remote isolated function listBatches(string servicePlanId, int? page = (), int pageSize = 30, string? 'from = (), string? startDate = (), string? endDate = ()) returns InlineResponse200|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "from": 'from, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Send
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + payload - Send batch object 
    # + return - Created 
    remote isolated function sendSMS(string servicePlanId, SendBatchObject payload) returns SendBatchCreated|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendBatchCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List incoming messages
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + page - The page number starting from 0. 
    # + pageSize - Determines the size of a page Constraints: Max 100 Default: 30 
    # + to - Only list messages sent to this destination. Multiple phone numbers formatted as either [e164](https://en.wikipedia.org/wiki/E.164) or shortcodes can be comma separated. 
    # + startDate - Only list messages received at or after this date time formatted as [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) Default: Now-24 
    # + endDate - Only list messages received before this date time formatted as [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) 
    # + return - OK 
    remote isolated function listInboundMessages(string servicePlanId, int page = 0, int pageSize = 30, string? to = (), string startDate = "Now-24", string? endDate = ()) returns InboundResponseObject|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/inbounds`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "to": to, "start_date": startDate, "end_date": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InboundResponseObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve inbound message
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + inboundId - The inbound ID found when listing inbound messages. 
    # + return - OK 
    remote isolated function retrieveInboundMessage(string servicePlanId, string inboundId) returns InboundResponseObject|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/inbounds/${inboundId}`;
        InboundResponseObject response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Dry run
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + perRecipient - Whether to include per recipient details in the response 
    # + numberOfRecipients - Max number of recipients to include per recipient details for in the response 
    # + payload - Send batch object 
    # + return - OK 
    remote isolated function dryRun(string servicePlanId, SendBatchObject payload, boolean? perRecipient = (), int numberOfRecipients = 100) returns InlineResponse2001|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/dry_run`;
        map<anydata> queryParam = {"per_recipient": perRecipient, "number_of_recipients": numberOfRecipients};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InlineResponse2001 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a batch message
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + return - OK 
    remote isolated function getBatchMessage(string servicePlanId, string batchId) returns SendBatchCreated|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}`;
        SendBatchCreated response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace a batch
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + payload - Send batch object 
    # + return - OK 
    remote isolated function replaceBatch(string servicePlanId, string batchId, SendBatchObject payload) returns SendBatchCreated|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendBatchCreated response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Update a Batch message
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + payload - Update batch request 
    # + return - OK 
    remote isolated function updateBatchMessage(string servicePlanId, string batchId, UpdateBatchReq payload) returns SendBatchCreated|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendBatchCreated response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Cancel a batch message
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + return - Batch deleted 
    remote isolated function cancelBatchMessage(string servicePlanId, string batchId) returns SendBatchObject|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}`;
        SendBatchObject response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Retrieve a delivery report
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + 'type - The type of delivery report. Constraints: Must be summary or full Default: summary 
    # + status - Comma separated list of delivery_report_statuses to include 
    # + code - 	Comma separated list of delivery_receipt_error_codes to include 
    # + return - OK 
    remote isolated function getDeliveryReportByBatchId(string servicePlanId, string batchId, string 'type = "summary", string? status = (), string? code = ()) returns RetrieveDeliveryResponseObj|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}/delivery_report`;
        map<anydata> queryParam = {"type": 'type, "status": status, "code": code};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        RetrieveDeliveryResponseObj response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieve a recipient delivery report
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + batchId - The batch ID you received from sending a message. 
    # + recipientMsisdn - Phone number for which you to want to search. 
    # + return - OK 
    remote isolated function getDeliveryReportByPhoneNumber(string servicePlanId, string batchId, string recipientMsisdn) returns RetrieveRecipientDeliveryResponseObj|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/batches/${batchId}/delivery_report/${recipientMsisdn}`;
        RetrieveRecipientDeliveryResponseObj response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List Groups
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + page - The page number starting from 0 Constraints: 0 or larger Default: 0 
    # + pageSize - Determines the size of a page Constraints: Max 100 Default: 30 
    # + return - OK 
    remote isolated function listGroups(string servicePlanId, int page = 0, int pageSize = 30) returns InlineResponse2002|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create group
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + payload - Group object 
    # + return - Created 
    remote isolated function createGroup(string servicePlanId, GroupObject payload) returns CreateGroupResponse|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateGroupResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieve a group
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + groupId - ID of a group that you are interested in 
    # + return - OK 
    remote isolated function retrieveGroup(string servicePlanId, string groupId) returns CreateGroupResponse|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups/${groupId}`;
        CreateGroupResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Replace a group
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + groupId - ID of a group that you are interested in 
    # + payload - Group information 
    # + return - OK 
    remote isolated function replaceGroup(string servicePlanId, string groupId, GroupsGroupIdBody payload) returns CreateGroupResponse|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups/${groupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateGroupResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Update a group
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + groupId - ID of a group that you are interested in 
    # + payload - Group information 
    # + return - OK 
    remote isolated function updateGroup(string servicePlanId, string groupId, GroupsGroupIdBody1 payload) returns CreateGroupResponse|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups/${groupId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CreateGroupResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get phone numbers for a group
    #
    # + servicePlanId - Your service plan ID. You can find this on your [Dashboard](https://dashboard.sinch.com/sms/api/rest). 
    # + groupId - ID of a group that you are interested in 
    # + return - OK 
    remote isolated function getMembers(string servicePlanId, string groupId) returns Msisdn[]|error {
        string resourcePath = string `/xms/v1/${servicePlanId}/groups/${groupId}/members`;
        Msisdn[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
