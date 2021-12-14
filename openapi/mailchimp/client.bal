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

# This is a generated connector for [Mailchimp Marketing API v3.0.52](https://mailchimp.com/developer/marketing/) OpenAPI Specification. 
# The Mailchimp Marketing API allow to manage audiences, control automation workflows, sync email activity with your database and more.
@display {label: "Mailchimp", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mailchimp account](https://login.mailchimp.com/signup/) and navigate to the [API Keys section](https://us1.admin.mailchimp.com/account/api/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://server.api.mailchimp.com/3.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List api root resources
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - The API root resource links to all other resources available in the API. 
    remote isolated function getRoot(string[]? fields = (), string[]? excludeFields = ()) returns ApiRoot|error {
        string resourcePath = string `/`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ApiRoot response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List authorized apps
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - An array of objects, each representing an authorized application. 
    remote isolated function getAuthorizedApps(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns InlineResponse2001|error {
        string resourcePath = string `/authorized-apps`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get authorized app info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + appId - The unique id for the connected authorized application. 
    # + return - An authorized app. 
    remote isolated function getAuthorizedAppsId(string appId, string[]? fields = (), string[]? excludeFields = ()) returns InlineResponse2002|error {
        string resourcePath = string `/authorized-apps/${appId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List automations
    #
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + beforeCreateTime - Restrict the response to automations created before this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreateTime - Restrict the response to automations created after this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeStartTime - Restrict the response to automations started before this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceStartTime - Restrict the response to automations started after this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + status - Restrict the results to automations with the specified status. 
    # + return - An array of objects, each representing an Automation workflow. 
    remote isolated function getAutomations(int count = 10, int offset = 0, string[]? fields = (), string[]? excludeFields = (), string? beforeCreateTime = (), string? sinceCreateTime = (), string? beforeStartTime = (), string? sinceStartTime = (), string? status = ()) returns InlineResponse2003|error {
        string resourcePath = string `/automations`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "before_start_time": beforeStartTime, "since_start_time": sinceStartTime, "status": status};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add automation
    #
    # + payload - Add automation input payload 
    # + return - A summary of an individual Automation workflow's settings and content. 
    remote isolated function postAutomations(AutomationWorkflow payload) returns AutomationWorkflow1|error {
        string resourcePath = string `/automations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationWorkflow1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get automation info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of an individual Automation workflow's settings and content. 
    remote isolated function getAutomationsId(string workflowId, string[]? fields = (), string[]? excludeFields = ()) returns AutomationWorkflow1|error {
        string resourcePath = string `/automations/${workflowId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AutomationWorkflow1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Pause automation emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdActionsPauseAllEmails(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/actions/pause-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Start automation emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdActionsStartAllEmails(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/actions/start-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Archive automation
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function archiveAutomations(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/actions/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List automated emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of the emails in an Automation workflow. 
    remote isolated function getAutomationsIdEmails(string workflowId) returns AutomationEmails|error {
        string resourcePath = string `/automations/${workflowId}/emails`;
        AutomationEmails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get workflow email info
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - A summary of an individual Automation workflow email. 
    remote isolated function getAutomationsIdEmailsId(string workflowId, string workflowEmailId) returns AutomationWorkflowEmail|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}`;
        AutomationWorkflowEmail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function deleteAutomationsIdEmailsId(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + payload - Update workflow email input payload 
    # + return - A summary of an individual Automation workflow email. 
    remote isolated function patchAutomationEmailWorkflowId(string workflowId, string workflowEmailId, UpdateInformationAboutASpecificWorkflowEmail payload) returns AutomationWorkflowEmail|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationWorkflowEmail response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List automated email subscribers
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - An automation workflow 
    remote isolated function getAutomationsIdEmailsIdQueue(string workflowId, string workflowEmailId) returns InlineResponse2004|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}/queue`;
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add subscriber to workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + payload - Add subscriber to workflow email input payload 
    # + return - Information about subscribers in an Automation email queue. 
    remote isolated function postAutomationsIdEmailsIdQueue(string workflowId, string workflowEmailId, SubscriberInAutomationQueue payload) returns SubscriberInAutomationQueue1|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}/queue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberInAutomationQueue1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get automated email subscriber
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Information about subscribers in an Automation email queue. 
    remote isolated function getAutomationsIdEmailsIdQueueId(string workflowId, string workflowEmailId, string subscriberHash) returns SubscriberInAutomationQueue1|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}/queue/${subscriberHash}`;
        SubscriberInAutomationQueue1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Pause automated email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdEmailsIdActionsPause(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Start automated email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdEmailsIdActionsStart(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${workflowId}/emails/${workflowEmailId}/actions/start`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List subscribers removed from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of the subscribers who were removed from an Automation workflow. 
    remote isolated function getAutomationsIdRemovedSubscribers(string workflowId) returns RemovedSubscribers|error {
        string resourcePath = string `/automations/${workflowId}/removed-subscribers`;
        RemovedSubscribers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove subscriber from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + payload - Remove subscriber from workflow input payload 
    # + return - A summary of a subscriber removed from an Automation workflow. 
    remote isolated function postAutomationsIdRemovedSubscribers(string workflowId, SubscriberInAutomationQueue2 payload) returns SubscriberRemovedFromAutomationWorkflow|error {
        string resourcePath = string `/automations/${workflowId}/removed-subscribers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get subscriber removed from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - A summary of a subscriber removed from an Automation workflow 
    remote isolated function getAutomationsIdRemovedSubscribersId(string workflowId, string subscriberHash) returns SubscriberRemovedFromAutomationWorkflow|error {
        string resourcePath = string `/automations/${workflowId}/removed-subscribers/${subscriberHash}`;
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaigns
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The campaign type. 
    # + status - The status of the campaign. 
    # + beforeSendTime - Restrict the response to campaigns sent before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceSendTime - Restrict the response to campaigns sent after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCreateTime - Restrict the response to campaigns created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreateTime - Restrict the response to campaigns created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + listId - The unique id for the list. 
    # + folderId - The unique folder id. 
    # + memberId - Retrieve campaigns sent to a particular list member. Member ID is The MD5 hash of the lowercase version of the list member’s email address. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - An array of campaigns 
    remote isolated function getCampaigns(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? status = (), string? beforeSendTime = (), string? sinceSendTime = (), string? beforeCreateTime = (), string? sinceCreateTime = (), string? listId = (), string? folderId = (), string? memberId = (), string? sortField = (), string? sortDir = ()) returns InlineResponse2005|error {
        string resourcePath = string `/campaigns`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "status": status, "before_send_time": beforeSendTime, "since_send_time": sinceSendTime, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "list_id": listId, "folder_id": folderId, "member_id": memberId, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add campaign
    #
    # + payload - Add campaign input payload 
    # + return - A summary of an individual campaign's settings and content. 
    remote isolated function postCampaigns(Campaign payload) returns Campaign1|error {
        string resourcePath = string `/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get campaign info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function getCampaignsId(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns Campaign1|error {
        string resourcePath = string `/campaigns/${campaignId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Campaign1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function deleteCampaignsId(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update campaign settings
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Update campaign input payload 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function patchCampaignsId(string campaignId, Campaign2 payload) returns Campaign1|error {
        string resourcePath = string `/campaigns/${campaignId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Cancel campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsCancelSend(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/cancel-send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Replicate campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function postCampaignsIdActionsReplicate(string campaignId) returns Campaign3|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/replicate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Send campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsSend(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Schedule campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Schedule campaign input payload 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsSchedule(string campaignId, ActionsScheduleBody payload) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/schedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unschedule campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsUnschedule(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/unschedule`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Send test email
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Send test email input payload 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsTest(string campaignId, ActionsTestBody payload) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/test`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Pause rss campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsPause(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Resume rss campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsResume(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/resume`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Resend campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function postCampaignsIdActionsCreateResend(string campaignId) returns Campaign3|error {
        string resourcePath = string `/campaigns/${campaignId}/actions/create-resend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get campaign content
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - The HTML and plain-text content for a campaign 
    remote isolated function getCampaignsIdContent(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignContent|error {
        string resourcePath = string `/campaigns/${campaignId}/content`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignContent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set campaign content
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Set campaign content input payload 
    # + return - The HTML and plain-text content for a campaign 
    remote isolated function putCampaignsIdContent(string campaignId, CampaignContent1 payload) returns CampaignContent|error {
        string resourcePath = string `/campaigns/${campaignId}/content`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignContent response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List campaign feedback
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of the comment feedback for a specific campaign 
    remote isolated function getCampaignsIdFeedback(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignReports|error {
        string resourcePath = string `/campaigns/${campaignId}/feedback`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignReports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add campaign feedback
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Add campaign feedback input payload 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function postCampaignsIdFeedback(string campaignId, CampaignFeedback payload) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${campaignId}/feedback`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFeedback1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get campaign feedback message
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function getCampaignsIdFeedbackId(string campaignId, string feedbackId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${campaignId}/feedback/${feedbackId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignFeedback1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete campaign feedback message
    #
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + return - Empty Response 
    remote isolated function deleteCampaignsIdFeedbackId(string campaignId, string feedbackId) returns http:Response|error {
        string resourcePath = string `/campaigns/${campaignId}/feedback/${feedbackId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update campaign feedback message
    #
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + payload - Update campaign feedback messages input payload 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function patchCampaignsIdFeedbackId(string campaignId, string feedbackId, CampaignFeedback2 payload) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${campaignId}/feedback/${feedbackId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFeedback1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get campaign send checklist
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - The send checklist for the campaign 
    remote isolated function getCampaignsIdSendChecklist(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns SendChecklist|error {
        string resourcePath = string `/campaigns/${campaignId}/send-checklist`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SendChecklist response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get lists info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + beforeDateCreated - Restrict response to lists created before the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceDateCreated - Restrict results to lists created after the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCampaignLastSent - Restrict results to lists created before the last campaign send date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCampaignLastSent - Restrict results to lists created after the last campaign send date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + email - Restrict results to lists that include a specific subscriber's email address. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + hasEcommerceStore - Restrict results to lists that contain an active, connected, undeleted ecommerce store. 
    # + return - A collection of subscriber lists for this account. Lists contain subscribers who have opted-in to receive correspondence from you or your organization 
    remote isolated function getLists(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? beforeDateCreated = (), string? sinceDateCreated = (), string? beforeCampaignLastSent = (), string? sinceCampaignLastSent = (), string? email = (), string? sortField = (), string? sortDir = (), boolean? hasEcommerceStore = ()) returns SubscriberLists|error {
        string resourcePath = string `/lists`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "before_date_created": beforeDateCreated, "since_date_created": sinceDateCreated, "before_campaign_last_sent": beforeCampaignLastSent, "since_campaign_last_sent": sinceCampaignLastSent, "email": email, "sort_field": sortField, "sort_dir": sortDir, "has_ecommerce_store": hasEcommerceStore};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriberLists response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add list
    #
    # + payload - Add list input payload 
    # + return - Information about a specific list. 
    remote isolated function postLists(SubscriberList payload) returns SubscriberList1|error {
        string resourcePath = string `/lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberList1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get list info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + includeTotalContacts - Return the total_contacts field in the stats response, which contains an approximate contact count for the given list. 
    # + return - Information about a specific list 
    remote isolated function getListsId(string listId, string[]? fields = (), string[]? excludeFields = (), boolean? includeTotalContacts = ()) returns SubscriberList1|error {
        string resourcePath = string `/lists/${listId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_total_contacts": includeTotalContacts};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriberList1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Batch subscribe or unsubscribe
    #
    # + listId - The unique ID for the list. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + skipDuplicateCheck - If skip_duplicate_check is true, we will ignore duplicates sent in the request when using the batch sub/unsub on the lists endpoint. The status of the first appearance in the request will be saved. This defaults to false. 
    # + payload - Batch subscribe or unsubscribe input payload 
    # + return - Batch update list members 
    remote isolated function postListsId(string listId, MembersToSubscribeunsubscribeTofromAListInBatch payload, boolean? skipMergeValidation = (), boolean? skipDuplicateCheck = ()) returns BatchUpdateListMembers|error {
        string resourcePath = string `/lists/${listId}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation, "skip_duplicate_check": skipDuplicateCheck};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchUpdateListMembers response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete list
    #
    # + listId - The unique ID for the list. 
    # + return - Empty Response 
    remote isolated function deleteListsId(string listId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update lists
    #
    # + listId - The unique ID for the list. 
    # + payload - Update the settings for a list input payload 
    # + return - Information about a specific list 
    remote isolated function patchListsId(string listId, SubscriberList2 payload) returns SubscriberList1|error {
        string resourcePath = string `/lists/${listId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberList1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List abuse reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + return - A collection of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program 
    remote isolated function getListsIdAbuseReports(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaints|error {
        string resourcePath = string `/lists/${listId}/abuse-reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaints response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get abuse report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + reportId - The id for the abuse report. 
    # + return - Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program 
    remote isolated function getListsIdAbuseReportsId(string listId, string reportId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaint|error {
        string resourcePath = string `/lists/${listId}/abuse-reports/${reportId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaint response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List recent activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - Up to the previous 180 days of daily detailed aggregated activity stats for a specific list. Does not include AutoResponder or Automation activity 
    remote isolated function getListsIdActivity(string listId, string[]? fields = (), string[]? excludeFields = ()) returns ListActivity|error {
        string resourcePath = string `/lists/${listId}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListActivity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List top email clients
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - The top email clients based on user-agent strings 
    remote isolated function getListsIdClients(string listId, string[]? fields = (), string[]? excludeFields = ()) returns EmailClients|error {
        string resourcePath = string `/lists/${listId}/clients`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EmailClients response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List growth history data
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - A month-by-month summary of a specific list's growth activity 
    remote isolated function getListsIdGrowthHistory(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = (), string? sortDir = ()) returns GrowthHistory|error {
        string resourcePath = string `/lists/${listId}/growth-history`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GrowthHistory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get growth history by month
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + month - A specific month of list growth history. 
    # + return - A summary of a specific list's growth activity for a specific month and year 
    remote isolated function getListsIdGrowthHistoryId(string listId, string month, string[]? fields = (), string[]? excludeFields = ()) returns GrowthHistory1|error {
        string resourcePath = string `/lists/${listId}/growth-history/${month}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GrowthHistory1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List interest categories
    #
    # + listId - The unique ID for the list. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - Restrict results a type of interest group 
    # + return - Information about this list's interest categories 
    remote isolated function getListsIdInterestCategories(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = ()) returns InterestGroupings|error {
        string resourcePath = string `/lists/${listId}/interest-categories`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InterestGroupings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add interest category
    #
    # + listId - The unique ID for the list. 
    # + payload - Add interest category input payload 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function postListsIdInterestCategories(string listId, InterestCategory payload) returns InterestCategory1|error {
        string resourcePath = string `/lists/${listId}/interest-categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InterestCategory1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get interest category info
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function getListsIdInterestCategoriesId(string listId, string interestCategoryId, string[]? fields = (), string[]? excludeFields = ()) returns InterestCategory1|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InterestCategory1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete interest category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + return - Empty Response 
    remote isolated function deleteListsIdInterestCategoriesId(string listId, string interestCategoryId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update interest category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + payload - Update interest category input payload 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function patchListsIdInterestCategoriesId(string listId, string interestCategoryId, InterestCategory2 payload) returns InterestCategory1|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InterestCategory1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List interests in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - A list of this category's interests 
    remote isolated function getListsIdInterestCategoriesIdInterests(string listId, string interestCategoryId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Interests|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}/interests`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Interests response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + payload - Add interest in category input payload 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function postListsIdInterestCategoriesIdInterests(string listId, string interestCategoryId, Interest payload) returns Interest1|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}/interests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Interest1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function getListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId, string[]? fields = (), string[]? excludeFields = ()) returns Interest1|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}/interests/${interestId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Interest1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + return - Empty Response 
    remote isolated function deleteListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}/interests/${interestId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + payload - Update interest in category input payload 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function patchListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId, Interest2 payload) returns Interest1|error {
        string resourcePath = string `/lists/${listId}/interest-categories/${interestCategoryId}/interests/${interestId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Interest1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List segments
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + 'type - Limit results based on segment type. 
    # + sinceCreatedAt - Restrict results to segments created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCreatedAt - Restrict results to segments created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + sinceUpdatedAt - Restrict results to segments update after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeUpdatedAt - Restrict results to segments update before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + return - A list of available segments 
    remote isolated function previewASegment(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? sinceCreatedAt = (), string? beforeCreatedAt = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = (), string? sinceUpdatedAt = (), string? beforeUpdatedAt = ()) returns CollectionOfSegments|error {
        string resourcePath = string `/lists/${listId}/segments`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "since_created_at": sinceCreatedAt, "before_created_at": beforeCreatedAt, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed, "since_updated_at": sinceUpdatedAt, "before_updated_at": beforeUpdatedAt};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfSegments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add segment
    #
    # + listId - The unique ID for the list. 
    # + payload - Add segment input payload 
    # + return - Information about a specific segment 
    remote isolated function postListsIdSegments(string listId, List3 payload) returns List4|error {
        string resourcePath = string `/lists/${listId}/segments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        List4 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get segment info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + return - Information about a specific segment 
    remote isolated function getListsIdSegmentsId(string listId, string segmentId, string[]? fields = (), string[]? excludeFields = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns List4|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        List4 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Batch add or remove members
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Batch add or remove members input payload 
    # + return - Batch add/remove List members to/from static segment 
    remote isolated function postListsIdSegmentsId(string listId, string segmentId, MembersToAddremoveTofromAStaticSegment payload) returns BatchAddremoveListMembersTofromStaticSegment|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchAddremoveListMembersTofromStaticSegment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + return - Empty Response 
    remote isolated function deleteListsIdSegmentsId(string listId, string segmentId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Update segment input payload 
    # + return - Information about a specific segment 
    remote isolated function patchListsIdSegmentsId(string listId, string segmentId, List5 payload) returns List4|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        List4 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List members in segment
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + return - View members in a specific list segment 
    remote isolated function getListsIdSegmentsIdMembers(string listId, string segmentId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns SegmentMembers|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SegmentMembers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member to segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Add member to segment input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed. 
    remote isolated function postListsIdSegmentsIdMembers(string listId, string segmentId, SegmentIdMembersBody payload) returns ListMembers|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove list member from segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function deleteListsIdSegmentsIdMembersId(string listId, string segmentId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/segments/${segmentId}/members/${subscriberHash}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Search for tags on a list by name.
    #
    # + listId - The unique ID for the list. 
    # + name - The search query used to filter tags.  The search query will be compared to each tag as a prefix, so all tags that have a name starting with this field will be returned. 
    # + return - A list of tags matching the input query 
    remote isolated function searchTagsByName(string listId, string? name = ()) returns TagSearchResults|error {
        string resourcePath = string `/lists/${listId}/tag-search`;
        map<anydata> queryParam = {"name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TagSearchResults response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List members info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + emailType - The email type. 
    # + status - The subscriber's status. 
    # + sinceTimestampOpt - Restrict results to subscribers who opted-in after the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeTimestampOpt - Restrict results to subscribers who opted-in before the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceLastChanged - Restrict results to subscribers whose information changed after the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeLastChanged - Restrict results to subscribers whose information changed before the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + uniqueEmailId - A unique identifier for the email address across all Mailchimp lists. 
    # + vipOnly - A filter to return only the list's VIP members. Passing `true` will restrict results to VIP list members, passing `false` will return all list members. 
    # + interestCategoryId - The unique id for the interest category. 
    # + interestIds - Used to filter list members by interests. Must be accompanied by interest_category_id and interest_match. The value must be a comma separated list of interest ids present for any supplied interest categories. 
    # + interestMatch - Used to filter list members by interests. Must be accompanied by interest_category_id and interest_ids. "any" will match a member with any of the interest supplied, "all" will only match members with every interest supplied, and "none" will match members without any of the interest supplied. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + sinceLastCampaign - Filter subscribers by those subscribed/unsubscribed/pending/cleaned since last email campaign send. Member status is required to use this filter. 
    # + unsubscribedSince - Filter subscribers by those unsubscribed since a specific date. Using any status other than unsubscribed with this filter will result in an error. 
    # + return - Manage members of a specific Mailchimp list, including currently subscribed, unsubscribed, and bounced members 
    remote isolated function getListsIdMembers(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? emailType = (), string? status = (), string? sinceTimestampOpt = (), string? beforeTimestampOpt = (), string? sinceLastChanged = (), string? beforeLastChanged = (), string? uniqueEmailId = (), boolean? vipOnly = (), string? interestCategoryId = (), string? interestIds = (), string? interestMatch = (), string? sortField = (), string? sortDir = (), boolean? sinceLastCampaign = (), string? unsubscribedSince = ()) returns ListMembers1|error {
        string resourcePath = string `/lists/${listId}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "email_type": emailType, "status": status, "since_timestamp_opt": sinceTimestampOpt, "before_timestamp_opt": beforeTimestampOpt, "since_last_changed": sinceLastChanged, "before_last_changed": beforeLastChanged, "unique_email_id": uniqueEmailId, "vip_only": vipOnly, "interest_category_id": interestCategoryId, "interest_ids": interestIds, "interest_match": interestMatch, "sort_field": sortField, "sort_dir": sortDir, "since_last_campaign": sinceLastCampaign, "unsubscribed_since": unsubscribedSince};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListMembers1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member to list
    #
    # + listId - The unique ID for the list. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Add members to list input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function postListsIdMembers(string listId, AddListMembers1 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${listId}/members`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get member info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function getListsIdMembersId(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListMembers2 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or update list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Add or update list member input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function putListsIdMembersId(string listId, string subscriberHash, AddListMembers2 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Archive list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMembersId(string listId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Update list member input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function patchListsIdMembersId(string listId, string subscriberHash, AddListMembers3 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # View recent activity 50
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + action - A comma seperated list of actions to return. 
    # + return - The last 50 member events for a list 
    remote isolated function getListsIdMembersIdActivity(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), string[]? action = ()) returns MemberActivityEvents|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "action": action};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}, "action": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberActivityEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # View recent activity
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + activityFilters - A comma-separated list of activity filters that correspond to a set of activity types, e.g "?activity_filters=open,bounce,click". 
    # + return - The member activity events for a given member 
    remote isolated function getListsIdMembersIdActivityFeed(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string[]? activityFilters = ()) returns MemberActivityEvents1|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/activity-feed`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "activity_filters": activityFilters};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}, "activity_filters": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberActivityEvents1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List member tags
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - A list of tags assigned to a list member 
    remote isolated function getListMemberTags(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfTags|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/tags`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfTags response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or remove member tags
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + payload - Add or remove member tags input payload 
    # + return - Empty Response 
    remote isolated function postListMemberTags(string listId, string subscriberHash, MemberTags payload) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List member events
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - A collection of events for a given contact 
    remote isolated function getListsIdMembersIdEvents(string listId, string subscriberHash, int count = 10, int offset = 0, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfEvents|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/events`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add event
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses. 
    # + payload - Add event input payload 
    # + return - Empty Response 
    remote isolated function postListMemberEvents(string listId, string subscriberHash, Events payload) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/events`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List member goal events
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - The last 50 Goal events for a member on a specific list 
    remote isolated function getListsIdMembersIdGoals(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfMemberActivityEvents|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/goals`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfMemberActivityEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List recent member notes
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + sortField - Returns notes sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - The last 10 notes for a specific list member, based on date created 
    remote isolated function getListsIdMembersIdNotes(string listId, string subscriberHash, string? sortField = (), string? sortDir = (), string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfNotes|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/notes`;
        map<anydata> queryParam = {"sort_field": sortField, "sort_dir": sortDir, "fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfNotes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + payload - Add member note input payload 
    # + return - A specific note for a specific member 
    remote isolated function postListsIdMembersIdNotes(string listId, string subscriberHash, MemberNotes payload) returns MemberNotes1|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MemberNotes1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get member note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - A specific note for a specific member 
    remote isolated function getListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId, string[]? fields = (), string[]? excludeFields = ()) returns MemberNotes1|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/notes/${noteId}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberNotes1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/notes/${noteId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + payload - Update note input payload 
    # + return - A specific note for a specific member 
    remote isolated function patchListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId, MemberNotes2 payload) returns MemberNotes1|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/notes/${noteId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MemberNotes1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Delete list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function postListsIdMembersHashActionsDeletePermanent(string listId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/members/${subscriberHash}/actions/delete-permanent`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List merge fields
    #
    # + listId - The unique ID for the list. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The merge field type. 
    # + required - The boolean value if the merge field is required. 
    # + return - The merge field (formerly merge vars) for a list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function getListsIdMergeFields(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), boolean? required = ()) returns CollectionOfMergeFields|error {
        string resourcePath = string `/lists/${listId}/merge-fields`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "required": required};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfMergeFields response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add merge field
    #
    # + listId - The unique ID for the list. 
    # + payload - Add merge field input payload 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function postListsIdMergeFields(string listId, MergeField payload) returns MergeField1|error {
        string resourcePath = string `/lists/${listId}/merge-fields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MergeField1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function getListsIdMergeFieldsId(string listId, string mergeId, string[]? excludeFields = (), string[]? fields = ()) returns MergeField1|error {
        string resourcePath = string `/lists/${listId}/merge-fields/${mergeId}`;
        map<anydata> queryParam = {"exclude_fields": excludeFields, "fields": fields};
        map<Encoding> queryParamEncoding = {"exclude_fields": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MergeField1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMergeFieldsId(string listId, string mergeId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/merge-fields/${mergeId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + payload - Update merge field input payload 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function patchListsIdMergeFieldsId(string listId, string mergeId, MergeField2 payload) returns MergeField1|error {
        string resourcePath = string `/lists/${listId}/merge-fields/${mergeId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MergeField1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List webhooks
    #
    # + listId - The unique ID for the list. 
    # + return - Manage webhooks for a specific list 
    remote isolated function getListsIdWebhooks(string listId) returns ListWebhooks|error {
        string resourcePath = string `/lists/${listId}/webhooks`;
        ListWebhooks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add webhook
    #
    # + listId - The unique ID for the list. 
    # + payload - Add webhook input payload 
    # + return - Webhook configured for the given list 
    remote isolated function postListsIdWebhooks(string listId, AddWebhook payload) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${listId}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListWebhooks1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get webhook info
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + return - Webhook configured for the given list 
    remote isolated function getListsIdWebhooksId(string listId, string webhookId) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${listId}/webhooks/${webhookId}`;
        ListWebhooks1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete webhook
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + return - Empty Response 
    remote isolated function deleteListsIdWebhooksId(string listId, string webhookId) returns http:Response|error {
        string resourcePath = string `/lists/${listId}/webhooks/${webhookId}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update webhook
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + payload - Update webhook input payload 
    # + return - Webhook configured for the given list 
    remote isolated function patchListsIdWebhooksId(string listId, string webhookId, AddWebhook1 payload) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${listId}/webhooks/${webhookId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListWebhooks1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List signup forms
    #
    # + listId - The unique ID for the list. 
    # + return - List Signup Forms. 
    remote isolated function getListsIdSignupForms(string listId) returns ListSignupForms|error {
        string resourcePath = string `/lists/${listId}/signup-forms`;
        ListSignupForms response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Customize signup form
    #
    # + listId - The unique ID for the list. 
    # + payload - Customize signup form input payload 
    # + return - List Signup Forms. 
    remote isolated function postListsIdSignupForms(string listId, SignupForm payload) returns SignupForm1|error {
        string resourcePath = string `/lists/${listId}/signup-forms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SignupForm1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List locations
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - A summary of List's locations 
    remote isolated function getListsIdLocations(string listId, string[]? fields = (), string[]? excludeFields = ()) returns ListLocations|error {
        string resourcePath = string `/lists/${listId}/locations`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListLocations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search members
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + query - The search query used to filter results. Query should be a valid email, or a string representing a contact's first or last name. 
    # + listId - The unique id for the list. 
    # + return - Members found for given search term 
    remote isolated function getSearchMembers(string query, string[]? fields = (), string[]? excludeFields = (), string? listId = ()) returns Members|error {
        string resourcePath = string `/search-members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "query": query, "list_id": listId};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Members response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get domain info
    #
    # + domainName - The domain name. 
    # + return - The domains on the account 
    remote isolated function getVerifiedDomain(string domainName) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains/${domainName}`;
        VerifiedDomains response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete domain
    #
    # + domainName - The domain name. 
    # + return - Empty Response 
    remote isolated function deleteVerifiedDomain(string domainName) returns http:Response|error {
        string resourcePath = string `/verified-domains/${domainName}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Verify domain
    #
    # + domainName - The domain name. 
    # + payload - Verify domain input payload 
    # + return - The domain being verified for sending. 
    remote isolated function verifyDomain(string domainName, ActionsVerifyBody payload) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains/${domainName}/actions/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifiedDomains response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List sending domains
    #
    # + return - The domains on the account. 
    remote isolated function getVerifiedDomains() returns VerifiedDomains1|error {
        string resourcePath = string `/verified-domains`;
        VerifiedDomains1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add domain to account
    #
    # + payload - Add domain to account input payload 
    # + return - The newly-created domain. 
    remote isolated function createVerifiedDomain(VerifiedDomains2 payload) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifiedDomains response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
