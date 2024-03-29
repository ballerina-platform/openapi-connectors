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
import ballerina/io;
import ballerina/time;
import ballerinax/aws.s3;


# This is a generated connector for [MFT REST API v1.0](https://documenter.getpostman.com/view/12285357/UV5WEe66) OpenAPI specification.
# The [MFT REST API](https://documenter.getpostman.com/view/12285357/UV5WEe66)  provides a secure AS2 secured channel for such communications, and offers your company, multiple ways to upload/download files, or automate the exchange through integration mechanisms.
@display {label: "Aayu MFTG AS2", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final string as2From;
    final string username;
    final string password;
    private string authToken = "";
    private time:Utc expirationTime = [0, 0];

    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [MFT account](https://console.mftgateway.com/auth/register) and obtain tokens following [this guide](https://aayutechnologies.com/docs/product/mft-gateway/user-guide/).
    # (Note : Token Validity is 1h)
    #
    # + username - Valid email address used to sign in [MFTG console](https://console.mftgateway.com/)
    # + password - Valid Password used to sign in [MFTG console](https://console.mftgateway.com/)
    # + as2From - Station AS2 identifier (which message is send from)
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(string username, string password, string as2From, ConnectionConfig config = {}, string serviceUrl = "https://api.mftgateway.com") returns error? {        
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        self.as2From = as2From;
        self.username = username;
        self.password = password;
        self.authToken = check self.getToken(username, password);
        return;
    }

    # Get a valid token
    # Returns the current token (if valid) or creates a new token using username & password provided.
    #
    # + username - Valid email address used to sign in [MFTG console](https://console.mftgateway.com/)
    # + password - Valid Password used to sign in [MFTG console](https://console.mftgateway.com/)
    # + return - Valid token
    isolated function getToken(string username, string password) returns string|error {
        
        lock {
            if (time:utcDiffSeconds(self.expirationTime, time:utcNow()) < ZERO_SECONDS) {
        http:Request request = new;
                request.setPayload({username, password}, "application/json");
                SuccessfulAuthorizationResponse response = check self.clientEp->post(string `/authorize`, request);
                self.expirationTime = time:utcAddSeconds(time:utcNow(), VALIDITY_PERIOD);
                self.authToken =  response.api_token;
    }
            return self.authToken;
    }
    }

    // # Authorize
    // #
    // # + payload - Username & password as payload
    // # + return - Successful Authorization 
    // remote isolated function authorize(AuthorizeRequest payload) returns SuccessfulAuthorizationResponse|error {
    //     string resourcePath = string `/authorize`;
    //     http:Request request = new;
    //     json jsonBody = check payload.cloneWithType(json);
    //     request.setPayload(jsonBody, "application/json");
    //     SuccessfulAuthorizationResponse response = check self.clientEp->post(resourcePath, request);
    //     return response;
    // }
    // # Refresh Auth Token
    // #
    // # + payload - Metadata provided on token refresh. 
    // # + return - Successful Auth Token Refresh 
    // remote isolated function refreshAuthToken(RefreshAuthTokenRequest payload) returns SuccessfulAuthorizationResponse|error {
    //     string resourcePath = string `/refresh-session`;
    //     http:Request request = new;
    //     json jsonBody = check payload.cloneWithType(json);
    //     request.setPayload(jsonBody, "application/json");
    //     SuccessfulAuthorizationResponse response = check self.clientEp->post(resourcePath, request);
    //     return response;
    // }

    # Sends AS2 Message. Recommend less than 3MB. 
    #
    # + as2To - Partner AS2 identifier which intends to receive the message 
    # + payload - File payload as byte array
    # + subject - Subject of the message. If not specified, the default subject configured for the intended partner will be applied. 
    # + attachmentName - Name of the message attachment (Only applicable when sending a message with single attachment) 
    # + contentType - Content type of the message payload. For multiple attachments, content type should be **multipart/form-data** with valid form content 
    # + return - Accepted for Processing 
    remote isolated function sendAS2Message(string as2To, string contentType, byte[] payload, string? subject = (), string? attachmentName = ()) returns SuccessfulMessageSubmitResponse|error {
        string resourcePath = string `/message/submit`;
        map<any> headerValues = {"AS2-From": self.as2From, "AS2-To": as2To, "Subject": subject, "Attachment-Name": attachmentName, "Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        request.setBinaryPayload(payload, contentType);
        SuccessfulMessageSubmitResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }

    # Sends AS2 Message. Recommend for large messages. The message will be uploading to AWS S3 bucket.
    # As a prerequisite, Enable (AWS S3 integration)[https://console.mftgateway.com/integration/s3] in MFT gateway.
    # Create new credentials & obtain `awsAccessKeyID`, `awsSecretAcessKey`
    #
    # + as2To - Partner AS2 identifier which intends to receive the message
    # + payload - File payload as stream
    # + awsAccessKeyID - AWS access key ID (Enable & download credentials from https://console.mftgateway.com/integration/s3)
    # + awsSecretAccessKey - AWS secret access key (Enable & download credentials from https://console.mftgateway.com/integration/s3)
    # + awsS3BucketName - Name of the AWS S3 bucket (Enable AWS S3 integration https://console.mftgateway.com/integration/s3, Obtain the S3 bucket name from console)
    # + attachmentName - Name of the message attachment
    # + return - An error on failure or else `()`
    remote isolated function sendLargeAS2Message(string as2To, stream<io:Block, io:Error?> payload, string awsAccessKeyID, string awsSecretAccessKey, string awsS3BucketName, string attachmentName) returns error? {
        s3:ConnectionConfig amazonS3Config = {
            accessKeyId: awsAccessKeyID,
            secretAccessKey: awsSecretAccessKey,
            region: "us-east-1"
        };
        string s3Path = string `${awsS3BucketName}/AS2/send/${self.as2From}/${as2To}`;
        s3:Client amazonS3Client = check new (amazonS3Config);
        return amazonS3Client->createObject(s3Path, attachmentName, payload);
    }

    # List Received Messages
    #
    # + sortDir - Sort direction of messages 
    # + pageLength - Length of a page. An integer value greater than or equal to 1 and less than or equal to 100 is accepted. 
    # + pageOffset - Page offset, supports non-negative integer values 
    # + stationAS2Id - AS2 identifier of the AS2 Station that received these messages 
    # + partnerAS2Id - AS2 identifier of the AS2 Partner that sent these messages 
    # + as2MessageId - AS2 message identifier of the required AS2 message(s) 
    # + subject - Any subject string to filter messages against 
    # + fetchAll - Fetch all messages including already been "marked as read" within the API scope 
    # + return - Successful 
    remote isolated function listReceivedMessages(string sortDir = "desc", int pageLength = 10, int pageOffset = 0, string? stationAS2Id = (), string? partnerAS2Id = (), string? as2MessageId = (), string? subject = (), boolean fetchAll = false) returns SuccessfulMessageListRetrievalResponse|error {
        string resourcePath = string `/message/inbox`;
        map<anydata> queryParam = {"sortDir": sortDir, "pageLength": pageLength, "pageOffset": pageOffset, "stationAS2Id": stationAS2Id, "partnerAS2Id": partnerAS2Id, "as2MessageId": as2MessageId, "subject": subject, "fetchAll": fetchAll};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve an Inbox (Received) Message
    #
    # + as2MessageId - AS2 ID of the message to be retrieved 
    # + markAsRead - If this is set to **true**, the message will be "marked as read" upon retrieval. Any message list queries with `fetchAll` query param set to `false`, will not return the corresponding message afterwards. You can combine this and the `fetchAll` query parameter, to ensure one-time processing of received messages.   *(Note that this marking will be applied only at API scope; "marked as read" messages may still appear as unread on the MFT Gateway webapp inbox.)* 
    # + return - Successfully Retrieved 
    remote isolated function retrieveInboxMessage(string as2MessageId, boolean markAsRead = true) returns AS2Message|error {
        string resourcePath = string `/message/inbox/${getEncodedUri(as2MessageId)}`;
        map<anydata> queryParam = {"markAsRead": markAsRead};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AS2Message response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Inbox (Received) Message
    #
    # + as2MessageId - AS2 ID of the message to be deleted 
    # + return - Successfully Deleted 
    remote isolated function deleteInboxMessage(string as2MessageId) returns SuccessfulMessageDeletionResponse|error {
        string resourcePath = string `/message/inbox/${getEncodedUri(as2MessageId)}`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageDeletionResponse response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Mark Received Message As UnRead
    #
    # + as2MessageId - AS2 ID of the message to be marked as unread 
    # + return - Successfully marked as Unread 
    remote isolated function markReceivedMessageAsUnRead(string as2MessageId) returns ResponseWithMessage|error {
        string resourcePath = string `/message/inbox/${getEncodedUri(as2MessageId)}/markUnread`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ResponseWithMessage response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Retrieve Inbox (Received) Message Attachment(s)
    #
    # + as2MessageId - AS2 ID of the message to retrieve attachments of 
    # + return - Successfully Retrieved 
    remote isolated function retrieveInboxMessageAttachments(string as2MessageId) returns SuccessfulAttachmentListResponse|error {
        string resourcePath = string `/message/inbox/${getEncodedUri(as2MessageId)}/attachments`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulAttachmentListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve Inbox (Received) Message MDN
    #
    # + as2MessageId - AS2 ID of the message to retrieve MDN of 
    # + return - Successfully Retrieved 
    remote isolated function retrieveInboxMessageMDN(string as2MessageId) returns SuccessfulMDNRetrievalResponse|error {
        string resourcePath = string `/message/inbox/${getEncodedUri(as2MessageId)}/mdn`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMDNRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Batch Delete Inbox (Received) Messages
    #
    # + payload - AS2 IDs of the messages to be deleted 
    # + return - Successfully Deleted 
    remote isolated function batchDeleteInboxMessages(MessageBatchOperationRequest payload) returns SuccessfulMessageBatchDeletionResponse|error {
        string resourcePath = string `/message/inbox/delete`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessfulMessageBatchDeletionResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Sent Messages
    #
    # + sortDir - Sort direction of messages 
    # + pageLength - Length of a page. An integer value greater than or equal to 1 and less than or equal to 100 is accepted. 
    # + pageOffset - Page offset, supports non-negative integer values 
    # + stationAS2Id - AS2 identifier of the AS2 Station that sent these messages 
    # + partnerAS2Id - AS2 identifier of the AS2 Partner that received these messages 
    # + as2MessageId - AS2 message identifier of the required AS2 message(s) 
    # + subject - Any subject string to filter messages against 
    # + return - Successful 
    remote isolated function listSentMessages(string sortDir = "desc", int pageLength = 10, int pageOffset = 0, string? stationAS2Id = (), string? partnerAS2Id = (), string? as2MessageId = (), string? subject = ()) returns SuccessfulMessageListRetrievalResponse|error {
        string resourcePath = string `/message/outbox`;
        map<anydata> queryParam = {"sortDir": sortDir, "pageLength": pageLength, "pageOffset": pageOffset, "stationAS2Id": stationAS2Id, "partnerAS2Id": partnerAS2Id, "as2MessageId": as2MessageId, "subject": subject};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Queued Messages
    #
    # + sortDir - Sort direction of messages 
    # + pageLength - Length of a page. An integer value greater than or equal to 1 and less than or equal to 100 is accepted. 
    # + pageOffset - Page offset, supports non-negative integer values 
    # + stationAS2Id - AS2 identifier of the AS2 Station that will be sending these messages 
    # + partnerAS2Id - AS2 identifier of the AS2 Partner that will be receiving these messages 
    # + as2MessageId - AS2 message identifier of the required AS2 message(s) 
    # + subject - Any subject string to filter messages against 
    # + return - Successful 
    remote isolated function listQueuedMessages(string sortDir = "desc", int pageLength = 10, int pageOffset = 0, string? stationAS2Id = (), string? partnerAS2Id = (), string? as2MessageId = (), string? subject = ()) returns SuccessfulMessageListRetrievalResponse|error {
        string resourcePath = string `/message/outbox/queued`;
        map<anydata> queryParam = {"sortDir": sortDir, "pageLength": pageLength, "pageOffset": pageOffset, "stationAS2Id": stationAS2Id, "partnerAS2Id": partnerAS2Id, "as2MessageId": as2MessageId, "subject": subject};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Failed Messages
    #
    # + sortDir - Sort direction of messages 
    # + pageLength - Length of a page. An integer value greater than or equal to 1 and less than or equal to 100 is accepted. 
    # + pageOffset - Page offset, supports non-negative integer values 
    # + stationAS2Id - AS2 identifier of the AS2 Station that that was intended to sent these messages 
    # + partnerAS2Id - AS2 identifier of the AS2 Partner that was intended to receive these messages 
    # + as2MessageId - AS2 message identifier of the required AS2 message(s) 
    # + subject - Any subject string to filter messages against 
    # + return - Successful 
    remote isolated function listFailedMessages(string sortDir = "desc", int pageLength = 10, int pageOffset = 0, string? stationAS2Id = (), string? partnerAS2Id = (), string? as2MessageId = (), string? subject = ()) returns SuccessfulMessageListRetrievalResponse|error {
        string resourcePath = string `/message/outbox/failed`;
        map<anydata> queryParam = {"sortDir": sortDir, "pageLength": pageLength, "pageOffset": pageOffset, "stationAS2Id": stationAS2Id, "partnerAS2Id": partnerAS2Id, "as2MessageId": as2MessageId, "subject": subject};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # List Incompleted Messages
    #
    # + sortDir - Sort direction of messages 
    # + pageLength - Length of a page. An integer value greater than or equal to 1 and less than or equal to 100 is accepted. 
    # + pageOffset - Page offset, supports non-negative integer values 
    # + stationAS2Id - AS2 identifier of the AS2 Station that sent these messages 
    # + partnerAS2Id - AS2 identifier of the AS2 Partner that received these messages 
    # + as2MessageId - AS2 message identifier of the required AS2 message(s) 
    # + subject - Any subject string to filter messages against 
    # + return - Successful 
    remote isolated function listincompletedmessages(string sortDir = "desc", int pageLength = 10, int pageOffset = 0, string? stationAS2Id = (), string? partnerAS2Id = (), string? as2MessageId = (), string? subject = ()) returns SuccessfulMessageListRetrievalResponse|error {
        string resourcePath = string `/message/outbox/incomplete`;
        map<anydata> queryParam = {"sortDir": sortDir, "pageLength": pageLength, "pageOffset": pageOffset, "stationAS2Id": stationAS2Id, "partnerAS2Id": partnerAS2Id, "as2MessageId": as2MessageId, "subject": subject};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve Outbox (Sent/Queued/Failed/Incomplete) Message
    #
    # + as2MessageId - AS2 ID of the message to be retrieved 
    # + return - Successfully Retrieved 
    remote isolated function retrieveOutboxMessage(string as2MessageId) returns AS2Message|error {
        string resourcePath = string `/message/outbox/${getEncodedUri(as2MessageId)}`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AS2Message response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Delete Outbox (Sent/Queued/Failed) Message
    #
    # + as2MessageId - AS2 ID of the message to be deleted 
    # + return - Successfully Deleted 
    remote isolated function deleteOutboxMessage(string as2MessageId) returns SuccessfulMessageDeletionResponse|error {
        string resourcePath = string `/message/outbox/${getEncodedUri(as2MessageId)}`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMessageDeletionResponse response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve Outbox (Sent/Queued/Failed) Message Attachment(s)
    #
    # + as2MessageId - AS2 ID of the message to retrieve attachments of 
    # + return - Successfully Retrieved 
    remote isolated function retrieveOutboxMessageAttachments(string as2MessageId) returns SuccessfulAttachmentListResponse|error {
        string resourcePath = string `/message/outbox/${getEncodedUri(as2MessageId)}/attachments`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulAttachmentListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve Outbox (Sent/Queued/Failed) Message MDN
    #
    # + as2MessageId - AS2 ID of the message to retrieve MDN of 
    # + return - Successfully Retrieved 
    remote isolated function retrieveOutboxMessageMDN(string as2MessageId) returns SuccessfulMDNRetrievalResponse|error {
        string resourcePath = string `/message/outbox/${getEncodedUri(as2MessageId)}/mdn`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulMDNRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Batch Delete Outbox (Sent/Queued/Failed) Messages
    #
    # + payload - AS2 IDs of the messages to be deleted 
    # + return - Successfully Deleted 
    remote isolated function batchDeleteOutboxMessages(MessageBatchOperationRequest payload) returns SuccessfulMessageBatchDeletionResponse|error {
        string resourcePath = string `/message/outbox/delete`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessfulMessageBatchDeletionResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # List Certificates
    #
    # + certType - Certificate type to filter. Allowed values: 'STATION', 'PARTNER', 'HTTPS', 'PARTNER_CHAIN' and 'HTTPS_CHAIN' Defaults to null (all certificates) 
    # + return - Successful Certificate List Retrieval 
    remote isolated function listCertificates(string? certType = ()) returns SuccessfulCertListRetrievalResponse|error {
        string resourcePath = string `/certificate`;
        map<anydata> queryParam = {"certType": certType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulCertListRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Retrieve Certificate Metadata
    #
    # + alias - Alias of the certificate to retrieve 
    # + return - A certificate with given alias found 
    remote isolated function retrieveCertificateMetadata(string alias) returns SuccessfulCertRetrievalResponse|error {
        string resourcePath = string `/certificate/${alias}`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        SuccessfulCertRetrievalResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Create Station
    #
    # + payload - Station metadata in form on a record `CreateStationRequest`
    # + return - Successfully Created 
    remote isolated function createStation(CreateStationRequest payload) returns SuccessfulStationCreationResponse|error {
        string resourcePath = string `/station`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessfulStationCreationResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
    # Create Partner
    #
    # + payload - Partner metadata in form on a record
    # + return - Successfully Created 
    remote isolated function createPartner(CreatePartnerRequest payload) returns SuccessfulPartnerCreationResponse|error {
        string resourcePath = string `/partner`;
        map<any> headerValues = {"Authorization": check self.getToken(self.username, self.password)};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SuccessfulPartnerCreationResponse response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}