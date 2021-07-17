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

import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

public type ClientConfig record {
    http:CredentialsConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    # Client initialization.
    #
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Returns error at failure of client initialization
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://server.api.mailchimp.com/3.0") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # List api root resources
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - The API root resource links to all other resources available in the API.
    remote isolated function getRoot(string[]? fields = (), string[]? excludeFields = ()) returns ApiRoot|error {
        string  path = string `/`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        ApiRoot response = check self.clientEp-> get(path, targetType = ApiRoot);
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
        string  path = string `/authorized-apps`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp-> get(path, targetType = InlineResponse2001);
        return response;
    }
    # Get authorized app info
    #
    # + app_id - The unique id for the connected authorized application.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - An authorized app.
    remote isolated function getAuthorizedAppsId(string app_id, string[]? fields = (), string[]? excludeFields = ()) returns InlineResponse2002|error {
        string  path = string `/authorized-apps/${app_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp-> get(path, targetType = InlineResponse2002);
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
        string  path = string `/automations`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "before_start_time": beforeStartTime, "since_start_time": sinceStartTime, "status": status};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp-> get(path, targetType = InlineResponse2003);
        return response;
    }
    # Add automation
    #
    # + payload - Add automation input payload
    # + return - A summary of an individual Automation workflow's settings and content.
    remote isolated function postAutomations(AutomationWorkflow payload) returns AutomationWorkflow1|error {
        string  path = string `/automations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AutomationWorkflow1 response = check self.clientEp->post(path, request, targetType=AutomationWorkflow1);
        return response;
    }
    # Get automation info
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A summary of an individual Automation workflow's settings and content.
    remote isolated function getAutomationsId(string workflow_id, string[]? fields = (), string[]? excludeFields = ()) returns AutomationWorkflow1|error {
        string  path = string `/automations/${workflow_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        AutomationWorkflow1 response = check self.clientEp-> get(path, targetType = AutomationWorkflow1);
        return response;
    }
    # Pause automation emails
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + return - Empty Response
    remote isolated function postAutomationsIdActionsPauseAllEmails(string workflow_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/actions/pause-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Start automation emails
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + return - Empty Response
    remote isolated function postAutomationsIdActionsStartAllEmails(string workflow_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/actions/start-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Archive automation
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + return - Empty Response
    remote isolated function archiveAutomations(string workflow_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/actions/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List automated emails
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + return - A summary of the emails in an Automation workflow.
    remote isolated function getAutomationsIdEmails(string workflow_id) returns AutomationEmails|error {
        string  path = string `/automations/${workflow_id}/emails`;
        AutomationEmails response = check self.clientEp-> get(path, targetType = AutomationEmails);
        return response;
    }
    # Get workflow email info
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + return - A summary of an individual Automation workflow email.
    remote isolated function getAutomationsIdEmailsId(string workflow_id, string workflow_email_id) returns AutomationWorkflowEmail|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}`;
        AutomationWorkflowEmail response = check self.clientEp-> get(path, targetType = AutomationWorkflowEmail);
        return response;
    }
    # Delete workflow email
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + return - Empty Response
    remote isolated function deleteAutomationsIdEmailsId(string workflow_id, string workflow_email_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update workflow email
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + payload - Update workflow email input payload
    # + return - A summary of an individual Automation workflow email.
    remote isolated function patchAutomationEmailWorkflowId(string workflow_id, string workflow_email_id, UpdateInformationAboutASpecificWorkflowEmail payload) returns AutomationWorkflowEmail|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AutomationWorkflowEmail response = check self.clientEp->patch(path, request, targetType=AutomationWorkflowEmail);
        return response;
    }
    # List automated email subscribers
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + return - An automation workflow
    remote isolated function getAutomationsIdEmailsIdQueue(string workflow_id, string workflow_email_id) returns InlineResponse2004|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}/queue`;
        InlineResponse2004 response = check self.clientEp-> get(path, targetType = InlineResponse2004);
        return response;
    }
    # Add subscriber to workflow email
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + payload - Add subscriber to workflow email input payload
    # + return - Information about subscribers in an Automation email queue.
    remote isolated function postAutomationsIdEmailsIdQueue(string workflow_id, string workflow_email_id, SubscriberInAutomationQueue payload) returns SubscriberInAutomationQueue1|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}/queue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriberInAutomationQueue1 response = check self.clientEp->post(path, request, targetType=SubscriberInAutomationQueue1);
        return response;
    }
    # Get automated email subscriber
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + return - Information about subscribers in an Automation email queue.
    remote isolated function getAutomationsIdEmailsIdQueueId(string workflow_id, string workflow_email_id, string subscriber_hash) returns SubscriberInAutomationQueue1|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}/queue/${subscriber_hash}`;
        SubscriberInAutomationQueue1 response = check self.clientEp-> get(path, targetType = SubscriberInAutomationQueue1);
        return response;
    }
    # Pause automated email
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + return - Empty Response
    remote isolated function postAutomationsIdEmailsIdActionsPause(string workflow_id, string workflow_email_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Start automated email
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + workflow_email_id - The unique id for the Automation workflow email.
    # + return - Empty Response
    remote isolated function postAutomationsIdEmailsIdActionsStart(string workflow_id, string workflow_email_id) returns http:Response|error {
        string  path = string `/automations/${workflow_id}/emails/${workflow_email_id}/actions/start`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List subscribers removed from workflow
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + return - A summary of the subscribers who were removed from an Automation workflow.
    remote isolated function getAutomationsIdRemovedSubscribers(string workflow_id) returns RemovedSubscribers|error {
        string  path = string `/automations/${workflow_id}/removed-subscribers`;
        RemovedSubscribers response = check self.clientEp-> get(path, targetType = RemovedSubscribers);
        return response;
    }
    # Remove subscriber from workflow
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + payload - Remove subscriber from workflow input payload
    # + return - A summary of a subscriber removed from an Automation workflow.
    remote isolated function postAutomationsIdRemovedSubscribers(string workflow_id, SubscriberInAutomationQueue2 payload) returns SubscriberRemovedFromAutomationWorkflow|error {
        string  path = string `/automations/${workflow_id}/removed-subscribers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp->post(path, request, targetType=SubscriberRemovedFromAutomationWorkflow);
        return response;
    }
    # Get subscriber removed from workflow
    #
    # + workflow_id - The unique id for the Automation workflow.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + return - A summary of a subscriber removed from an Automation workflow
    remote isolated function getAutomationsIdRemovedSubscribersId(string workflow_id, string subscriber_hash) returns SubscriberRemovedFromAutomationWorkflow|error {
        string  path = string `/automations/${workflow_id}/removed-subscribers/${subscriber_hash}`;
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp-> get(path, targetType = SubscriberRemovedFromAutomationWorkflow);
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
        string  path = string `/campaigns`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "status": status, "before_send_time": beforeSendTime, "since_send_time": sinceSendTime, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "list_id": listId, "folder_id": folderId, "member_id": memberId, "sort_field": sortField, "sort_dir": sortDir};
        path = path + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp-> get(path, targetType = InlineResponse2005);
        return response;
    }
    # Add campaign
    #
    # + payload - Add campaign input payload
    # + return - A summary of an individual campaign's settings and content.
    remote isolated function postCampaigns(Campaign payload) returns Campaign1|error {
        string  path = string `/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Campaign1 response = check self.clientEp->post(path, request, targetType=Campaign1);
        return response;
    }
    # Get campaign info
    #
    # + campaign_id - The unique id for the campaign.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A summary of an individual campaign's settings and content
    remote isolated function getCampaignsId(string campaign_id, string[]? fields = (), string[]? excludeFields = ()) returns Campaign1|error {
        string  path = string `/campaigns/${campaign_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        Campaign1 response = check self.clientEp-> get(path, targetType = Campaign1);
        return response;
    }
    # Delete campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function deleteCampaignsId(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update campaign settings
    #
    # + campaign_id - The unique id for the campaign.
    # + payload - Update campaign input payload
    # + return - A summary of an individual campaign's settings and content
    remote isolated function patchCampaignsId(string campaign_id, Campaign2 payload) returns Campaign1|error {
        string  path = string `/campaigns/${campaign_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Campaign1 response = check self.clientEp->patch(path, request, targetType=Campaign1);
        return response;
    }
    # Cancel campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsCancelSend(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/cancel-send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Replicate campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - A summary of an individual campaign's settings and content
    remote isolated function postCampaignsIdActionsReplicate(string campaign_id) returns Campaign3|error {
        string  path = string `/campaigns/${campaign_id}/actions/replicate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(path, request, targetType = Campaign3);
        return response;
    }
    # Send campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsSend(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Schedule campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + payload - Schedule campaign input payload
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsSchedule(string campaign_id, Body1 payload) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/schedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Unschedule campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsUnschedule(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/unschedule`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Send test email
    #
    # + campaign_id - The unique id for the campaign.
    # + payload - Send test email input payload
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsTest(string campaign_id, Body2 payload) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/test`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Pause rss campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsPause(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Resume rss campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - Empty Response
    remote isolated function postCampaignsIdActionsResume(string campaign_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/actions/resume`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # Resend campaign
    #
    # + campaign_id - The unique id for the campaign.
    # + return - A summary of an individual campaign's settings and content
    remote isolated function postCampaignsIdActionsCreateResend(string campaign_id) returns Campaign3|error {
        string  path = string `/campaigns/${campaign_id}/actions/create-resend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(path, request, targetType = Campaign3);
        return response;
    }
    # Get campaign content
    #
    # + campaign_id - The unique id for the campaign.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - The HTML and plain-text content for a campaign
    remote isolated function getCampaignsIdContent(string campaign_id, string[]? fields = (), string[]? excludeFields = ()) returns CampaignContent|error {
        string  path = string `/campaigns/${campaign_id}/content`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        CampaignContent response = check self.clientEp-> get(path, targetType = CampaignContent);
        return response;
    }
    # Set campaign content
    #
    # + campaign_id - The unique id for the campaign.
    # + payload - Set campaign content input payload
    # + return - The HTML and plain-text content for a campaign
    remote isolated function putCampaignsIdContent(string campaign_id, CampaignContent1 payload) returns CampaignContent|error {
        string  path = string `/campaigns/${campaign_id}/content`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CampaignContent response = check self.clientEp->put(path, request, targetType=CampaignContent);
        return response;
    }
    # List campaign feedback
    #
    # + campaign_id - The unique id for the campaign.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A summary of the comment feedback for a specific campaign
    remote isolated function getCampaignsIdFeedback(string campaign_id, string[]? fields = (), string[]? excludeFields = ()) returns CampaignReports|error {
        string  path = string `/campaigns/${campaign_id}/feedback`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        CampaignReports response = check self.clientEp-> get(path, targetType = CampaignReports);
        return response;
    }
    # Add campaign feedback
    #
    # + campaign_id - The unique id for the campaign.
    # + payload - Add campaign feedback input payload
    # + return - A specific feedback message from a specific campaign
    remote isolated function postCampaignsIdFeedback(string campaign_id, CampaignFeedback payload) returns CampaignFeedback1|error {
        string  path = string `/campaigns/${campaign_id}/feedback`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CampaignFeedback1 response = check self.clientEp->post(path, request, targetType=CampaignFeedback1);
        return response;
    }
    # Get campaign feedback message
    #
    # + campaign_id - The unique id for the campaign.
    # + feedback_id - The unique id for the feedback message.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A specific feedback message from a specific campaign
    remote isolated function getCampaignsIdFeedbackId(string campaign_id, string feedback_id, string[]? fields = (), string[]? excludeFields = ()) returns CampaignFeedback1|error {
        string  path = string `/campaigns/${campaign_id}/feedback/${feedback_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        CampaignFeedback1 response = check self.clientEp-> get(path, targetType = CampaignFeedback1);
        return response;
    }
    # Delete campaign feedback message
    #
    # + campaign_id - The unique id for the campaign.
    # + feedback_id - The unique id for the feedback message.
    # + return - Empty Response
    remote isolated function deleteCampaignsIdFeedbackId(string campaign_id, string feedback_id) returns http:Response|error {
        string  path = string `/campaigns/${campaign_id}/feedback/${feedback_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update campaign feedback message
    #
    # + campaign_id - The unique id for the campaign.
    # + feedback_id - The unique id for the feedback message.
    # + payload - Update campaign feedback messages input payload
    # + return - A specific feedback message from a specific campaign
    remote isolated function patchCampaignsIdFeedbackId(string campaign_id, string feedback_id, CampaignFeedback2 payload) returns CampaignFeedback1|error {
        string  path = string `/campaigns/${campaign_id}/feedback/${feedback_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CampaignFeedback1 response = check self.clientEp->patch(path, request, targetType=CampaignFeedback1);
        return response;
    }
    # Get campaign send checklist
    #
    # + campaign_id - The unique id for the campaign.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - The send checklist for the campaign
    remote isolated function getCampaignsIdSendChecklist(string campaign_id, string[]? fields = (), string[]? excludeFields = ()) returns SendChecklist|error {
        string  path = string `/campaigns/${campaign_id}/send-checklist`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        SendChecklist response = check self.clientEp-> get(path, targetType = SendChecklist);
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
        string  path = string `/lists`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "before_date_created": beforeDateCreated, "since_date_created": sinceDateCreated, "before_campaign_last_sent": beforeCampaignLastSent, "since_campaign_last_sent": sinceCampaignLastSent, "email": email, "sort_field": sortField, "sort_dir": sortDir, "has_ecommerce_store": hasEcommerceStore};
        path = path + check getPathForQueryParam(queryParam);
        SubscriberLists response = check self.clientEp-> get(path, targetType = SubscriberLists);
        return response;
    }
    # Add list
    #
    # + payload - Add list input payload
    # + return - Information about a specific list.
    remote isolated function postLists(SubscriberList payload) returns SubscriberList1|error {
        string  path = string `/lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriberList1 response = check self.clientEp->post(path, request, targetType=SubscriberList1);
        return response;
    }
    # Get list info
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + includeTotalContacts - Return the total_contacts field in the stats response, which contains an approximate contact count for the given list.
    # + return - Information about a specific list
    remote isolated function getListsId(string list_id, string[]? fields = (), string[]? excludeFields = (), boolean? includeTotalContacts = ()) returns SubscriberList1|error {
        string  path = string `/lists/${list_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_total_contacts": includeTotalContacts};
        path = path + check getPathForQueryParam(queryParam);
        SubscriberList1 response = check self.clientEp-> get(path, targetType = SubscriberList1);
        return response;
    }
    # Batch subscribe or unsubscribe
    #
    # + list_id - The unique ID for the list.
    # + payload - Batch subscribe or unsubscribe input payload
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false.
    # + skipDuplicateCheck - If skip_duplicate_check is true, we will ignore duplicates sent in the request when using the batch sub/unsub on the lists endpoint. The status of the first appearance in the request will be saved. This defaults to false.
    # + return - Batch update list members
    remote isolated function postListsId(string list_id, MembersToSubscribeunsubscribeTofromAListInBatch payload, boolean? skipMergeValidation = (), boolean? skipDuplicateCheck = ()) returns BatchUpdateListMembers|error {
        string  path = string `/lists/${list_id}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation, "skip_duplicate_check": skipDuplicateCheck};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchUpdateListMembers response = check self.clientEp->post(path, request, targetType=BatchUpdateListMembers);
        return response;
    }
    # Delete list
    #
    # + list_id - The unique ID for the list.
    # + return - Empty Response
    remote isolated function deleteListsId(string list_id) returns http:Response|error {
        string  path = string `/lists/${list_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update lists
    #
    # + list_id - The unique ID for the list.
    # + payload - Update the settings for a list input payload
    # + return - Information about a specific list
    remote isolated function patchListsId(string list_id, SubscriberList2 payload) returns SubscriberList1|error {
        string  path = string `/lists/${list_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscriberList1 response = check self.clientEp->patch(path, request, targetType=SubscriberList1);
        return response;
    }
    # List abuse reports
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + return - A collection of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program
    remote isolated function getListsIdAbuseReports(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaints|error {
        string  path = string `/lists/${list_id}/abuse-reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        AbuseComplaints response = check self.clientEp-> get(path, targetType = AbuseComplaints);
        return response;
    }
    # Get abuse report
    #
    # + list_id - The unique ID for the list.
    # + report_id - The id for the abuse report.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + return - Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program
    remote isolated function getListsIdAbuseReportsId(string list_id, string report_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaint|error {
        string  path = string `/lists/${list_id}/abuse-reports/${report_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        AbuseComplaint response = check self.clientEp-> get(path, targetType = AbuseComplaint);
        return response;
    }
    # List recent activity
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - Up to the previous 180 days of daily detailed aggregated activity stats for a specific list. Does not include AutoResponder or Automation activity
    remote isolated function getListsIdActivity(string list_id, string[]? fields = (), string[]? excludeFields = ()) returns ListActivity|error {
        string  path = string `/lists/${list_id}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        ListActivity response = check self.clientEp-> get(path, targetType = ListActivity);
        return response;
    }
    # List top email clients
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - The top email clients based on user-agent strings
    remote isolated function getListsIdClients(string list_id, string[]? fields = (), string[]? excludeFields = ()) returns EmailClients|error {
        string  path = string `/lists/${list_id}/clients`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        EmailClients response = check self.clientEp-> get(path, targetType = EmailClients);
        return response;
    }
    # List growth history data
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + sortField - Returns files sorted by the specified field.
    # + sortDir - Determines the order direction for sorted results.
    # + return - A month-by-month summary of a specific list's growth activity
    remote isolated function getListsIdGrowthHistory(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = (), string? sortDir = ()) returns GrowthHistory|error {
        string  path = string `/lists/${list_id}/growth-history`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField, "sort_dir": sortDir};
        path = path + check getPathForQueryParam(queryParam);
        GrowthHistory response = check self.clientEp-> get(path, targetType = GrowthHistory);
        return response;
    }
    # Get growth history by month
    #
    # + list_id - The unique ID for the list.
    # + month - A specific month of list growth history.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A summary of a specific list's growth activity for a specific month and year
    remote isolated function getListsIdGrowthHistoryId(string list_id, string month, string[]? fields = (), string[]? excludeFields = ()) returns GrowthHistory1|error {
        string  path = string `/lists/${list_id}/growth-history/${month}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        GrowthHistory1 response = check self.clientEp-> get(path, targetType = GrowthHistory1);
        return response;
    }
    # List interest categories
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + 'type - Restrict results a type of interest group
    # + return - Information about this list's interest categories
    remote isolated function getListsIdInterestCategories(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = ()) returns InterestGroupings|error {
        string  path = string `/lists/${list_id}/interest-categories`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        InterestGroupings response = check self.clientEp-> get(path, targetType = InterestGroupings);
        return response;
    }
    # Add interest category
    #
    # + list_id - The unique ID for the list.
    # + payload - Add interest category input payload
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application
    remote isolated function postListsIdInterestCategories(string list_id, InterestCategory payload) returns InterestCategory1|error {
        string  path = string `/lists/${list_id}/interest-categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InterestCategory1 response = check self.clientEp->post(path, request, targetType=InterestCategory1);
        return response;
    }
    # Get interest category info
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application
    remote isolated function getListsIdInterestCategoriesId(string list_id, string interest_category_id, string[]? fields = (), string[]? excludeFields = ()) returns InterestCategory1|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        InterestCategory1 response = check self.clientEp-> get(path, targetType = InterestCategory1);
        return response;
    }
    # Delete interest category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + return - Empty Response
    remote isolated function deleteListsIdInterestCategoriesId(string list_id, string interest_category_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update interest category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + payload - Update interest category input payload
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application
    remote isolated function patchListsIdInterestCategoriesId(string list_id, string interest_category_id, InterestCategory2 payload) returns InterestCategory1|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InterestCategory1 response = check self.clientEp->patch(path, request, targetType=InterestCategory1);
        return response;
    }
    # List interests in category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + return - A list of this category's interests
    remote isolated function getListsIdInterestCategoriesIdInterests(string list_id, string interest_category_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Interests|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}/interests`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Interests response = check self.clientEp-> get(path, targetType = Interests);
        return response;
    }
    # Add interest in category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + payload - Add interest in category input payload
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application
    remote isolated function postListsIdInterestCategoriesIdInterests(string list_id, string interest_category_id, Interest payload) returns Interest1|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}/interests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Interest1 response = check self.clientEp->post(path, request, targetType=Interest1);
        return response;
    }
    # Get interest in category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + interest_id - The specific interest or 'group name'.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application
    remote isolated function getListsIdInterestCategoriesIdInterestsId(string list_id, string interest_category_id, string interest_id, string[]? fields = (), string[]? excludeFields = ()) returns Interest1|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}/interests/${interest_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        Interest1 response = check self.clientEp-> get(path, targetType = Interest1);
        return response;
    }
    # Delete interest in category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + interest_id - The specific interest or 'group name'.
    # + return - Empty Response
    remote isolated function deleteListsIdInterestCategoriesIdInterestsId(string list_id, string interest_category_id, string interest_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}/interests/${interest_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update interest in category
    #
    # + list_id - The unique ID for the list.
    # + interest_category_id - The unique ID for the interest category.
    # + interest_id - The specific interest or 'group name'.
    # + payload - Update interest in category input payload
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application
    remote isolated function patchListsIdInterestCategoriesIdInterestsId(string list_id, string interest_category_id, string interest_id, Interest2 payload) returns Interest1|error {
        string  path = string `/lists/${list_id}/interest-categories/${interest_category_id}/interests/${interest_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Interest1 response = check self.clientEp->patch(path, request, targetType=Interest1);
        return response;
    }
    # List segments
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + 'type - Limit results based on segment type.
    # + sinceCreatedAt - Restrict results to segments created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00.
    # + beforeCreatedAt - Restrict results to segments created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00.
    # + includeCleaned - Include cleaned members in response
    # + includeTransactional - Include transactional members in response
    # + includeUnsubscribed - Include unsubscribed members in response
    # + sinceUpdatedAt - Restrict results to segments update after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00.
    # + beforeUpdatedAt - Restrict results to segments update before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00.
    # + return - A list of available segments
    remote isolated function previewASegment(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? sinceCreatedAt = (), string? beforeCreatedAt = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = (), string? sinceUpdatedAt = (), string? beforeUpdatedAt = ()) returns CollectionOfSegments|error {
        string  path = string `/lists/${list_id}/segments`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "since_created_at": sinceCreatedAt, "before_created_at": beforeCreatedAt, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed, "since_updated_at": sinceUpdatedAt, "before_updated_at": beforeUpdatedAt};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfSegments response = check self.clientEp-> get(path, targetType = CollectionOfSegments);
        return response;
    }
    # Add segment
    #
    # + list_id - The unique ID for the list.
    # + payload - Add segment input payload
    # + return - Information about a specific segment
    remote isolated function postListsIdSegments(string list_id, List3 payload) returns List4|error {
        string  path = string `/lists/${list_id}/segments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        List4 response = check self.clientEp->post(path, request, targetType=List4);
        return response;
    }
    # Get segment info
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + includeCleaned - Include cleaned members in response
    # + includeTransactional - Include transactional members in response
    # + includeUnsubscribed - Include unsubscribed members in response
    # + return - Information about a specific segment
    remote isolated function getListsIdSegmentsId(string list_id, string segment_id, string[]? fields = (), string[]? excludeFields = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns List4|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        path = path + check getPathForQueryParam(queryParam);
        List4 response = check self.clientEp-> get(path, targetType = List4);
        return response;
    }
    # Batch add or remove members
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + payload - Batch add or remove members input payload
    # + return - Batch add/remove List members to/from static segment
    remote isolated function postListsIdSegmentsId(string list_id, string segment_id, MembersToAddremoveTofromAStaticSegment payload) returns BatchAddremoveListMembersTofromStaticSegment|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchAddremoveListMembersTofromStaticSegment response = check self.clientEp->post(path, request, targetType=BatchAddremoveListMembersTofromStaticSegment);
        return response;
    }
    # Delete segment
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + return - Empty Response
    remote isolated function deleteListsIdSegmentsId(string list_id, string segment_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update segment
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + payload - Update segment input payload
    # + return - Information about a specific segment
    remote isolated function patchListsIdSegmentsId(string list_id, string segment_id, List5 payload) returns List4|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        List4 response = check self.clientEp->patch(path, request, targetType=List4);
        return response;
    }
    # List members in segment
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + includeCleaned - Include cleaned members in response
    # + includeTransactional - Include transactional members in response
    # + includeUnsubscribed - Include unsubscribed members in response
    # + return - View members in a specific list segment
    remote isolated function getListsIdSegmentsIdMembers(string list_id, string segment_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns SegmentMembers|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        path = path + check getPathForQueryParam(queryParam);
        SegmentMembers response = check self.clientEp-> get(path, targetType = SegmentMembers);
        return response;
    }
    # Add member to segment
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + payload - Add member to segment input payload
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
    remote isolated function postListsIdSegmentsIdMembers(string list_id, string segment_id, Body3 payload) returns ListMembers|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListMembers response = check self.clientEp->post(path, request, targetType=ListMembers);
        return response;
    }
    # Remove list member from segment
    #
    # + list_id - The unique ID for the list.
    # + segment_id - The unique id for the segment.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + return - Empty Response
    remote isolated function deleteListsIdSegmentsIdMembersId(string list_id, string segment_id, string subscriber_hash) returns http:Response|error {
        string  path = string `/lists/${list_id}/segments/${segment_id}/members/${subscriber_hash}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Search for tags on a list by name.
    #
    # + list_id - The unique ID for the list.
    # + name - The search query used to filter tags.  The search query will be compared to each tag as a prefix, so all tags that have a name starting with this field will be returned.
    # + return - A list of tags matching the input query
    remote isolated function searchTagsByName(string list_id, string? name = ()) returns TagSearchResults|error {
        string  path = string `/lists/${list_id}/tag-search`;
        map<anydata> queryParam = {"name": name};
        path = path + check getPathForQueryParam(queryParam);
        TagSearchResults response = check self.clientEp-> get(path, targetType = TagSearchResults);
        return response;
    }
    # List members info
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
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
    remote isolated function getListsIdMembers(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? emailType = (), string? status = (), string? sinceTimestampOpt = (), string? beforeTimestampOpt = (), string? sinceLastChanged = (), string? beforeLastChanged = (), string? uniqueEmailId = (), boolean? vipOnly = (), string? interestCategoryId = (), string? interestIds = (), string? interestMatch = (), string? sortField = (), string? sortDir = (), boolean? sinceLastCampaign = (), string? unsubscribedSince = ()) returns ListMembers1|error {
        string  path = string `/lists/${list_id}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "email_type": emailType, "status": status, "since_timestamp_opt": sinceTimestampOpt, "before_timestamp_opt": beforeTimestampOpt, "since_last_changed": sinceLastChanged, "before_last_changed": beforeLastChanged, "unique_email_id": uniqueEmailId, "vip_only": vipOnly, "interest_category_id": interestCategoryId, "interest_ids": interestIds, "interest_match": interestMatch, "sort_field": sortField, "sort_dir": sortDir, "since_last_campaign": sinceLastCampaign, "unsubscribed_since": unsubscribedSince};
        path = path + check getPathForQueryParam(queryParam);
        ListMembers1 response = check self.clientEp-> get(path, targetType = ListMembers1);
        return response;
    }
    # Add member to list
    #
    # + list_id - The unique ID for the list.
    # + payload - Add members to list input payload
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false.
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed
    remote isolated function postListsIdMembers(string list_id, AddListMembers1 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string  path = string `/lists/${list_id}/members`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListMembers2 response = check self.clientEp->post(path, request, targetType=ListMembers2);
        return response;
    }
    # Get member info
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed
    remote isolated function getListsIdMembersId(string list_id, string subscriber_hash, string[]? fields = (), string[]? excludeFields = ()) returns ListMembers2|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        ListMembers2 response = check self.clientEp-> get(path, targetType = ListMembers2);
        return response;
    }
    # Add or update list member
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + payload - Add or update list member input payload
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false.
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed
    remote isolated function putListsIdMembersId(string list_id, string subscriber_hash, AddListMembers2 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListMembers2 response = check self.clientEp->put(path, request, targetType=ListMembers2);
        return response;
    }
    # Archive list member
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + return - Empty Response
    remote isolated function deleteListsIdMembersId(string list_id, string subscriber_hash) returns http:Response|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update list member
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + payload - Update list member input payload
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false.
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed
    remote isolated function patchListsIdMembersId(string list_id, string subscriber_hash, AddListMembers3 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListMembers2 response = check self.clientEp->patch(path, request, targetType=ListMembers2);
        return response;
    }
    # View recent activity 50
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + action - A comma seperated list of actions to return.
    # + return - The last 50 member events for a list
    remote isolated function getListsIdMembersIdActivity(string list_id, string subscriber_hash, string[]? fields = (), string[]? excludeFields = (), string[]? action = ()) returns MemberActivityEvents|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "action": action};
        path = path + check getPathForQueryParam(queryParam);
        MemberActivityEvents response = check self.clientEp-> get(path, targetType = MemberActivityEvents);
        return response;
    }
    # View recent activity
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + activityFilters - A comma-separated list of activity filters that correspond to a set of activity types, e.g "?activity_filters=open,bounce,click".
    # + return - The member activity events for a given member
    remote isolated function getListsIdMembersIdActivityFeed(string list_id, string subscriber_hash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string[]? activityFilters = ()) returns MemberActivityEvents1|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/activity-feed`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "activity_filters": activityFilters};
        path = path + check getPathForQueryParam(queryParam);
        MemberActivityEvents1 response = check self.clientEp-> get(path, targetType = MemberActivityEvents1);
        return response;
    }
    # List member tags
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + return - A list of tags assigned to a list member
    remote isolated function getListMemberTags(string list_id, string subscriber_hash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfTags|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/tags`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfTags response = check self.clientEp-> get(path, targetType = CollectionOfTags);
        return response;
    }
    # Add or remove member tags
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + payload - Add or remove member tags input payload
    # + return - Empty Response
    remote isolated function postListMemberTags(string list_id, string subscriber_hash, MemberTags payload) returns http:Response|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # List member events
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A collection of events for a given contact
    remote isolated function getListsIdMembersIdEvents(string list_id, string subscriber_hash, int count = 10, int offset = 0, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfEvents|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/events`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfEvents response = check self.clientEp-> get(path, targetType = CollectionOfEvents);
        return response;
    }
    # Add event
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses.
    # + payload - Add event input payload
    # + return - Empty Response
    remote isolated function postListMemberEvents(string list_id, string subscriber_hash, Events payload) returns http:Response|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/events`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # List member goal events
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - The last 50 Goal events for a member on a specific list
    remote isolated function getListsIdMembersIdGoals(string list_id, string subscriber_hash, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfMemberActivityEvents|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/goals`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfMemberActivityEvents response = check self.clientEp-> get(path, targetType = CollectionOfMemberActivityEvents);
        return response;
    }
    # List recent member notes
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + sortField - Returns notes sorted by the specified field.
    # + sortDir - Determines the order direction for sorted results.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + return - The last 10 notes for a specific list member, based on date created
    remote isolated function getListsIdMembersIdNotes(string list_id, string subscriber_hash, string? sortField = (), string? sortDir = (), string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfNotes|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/notes`;
        map<anydata> queryParam = {"sort_field": sortField, "sort_dir": sortDir, "fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfNotes response = check self.clientEp-> get(path, targetType = CollectionOfNotes);
        return response;
    }
    # Add member note
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + payload - Add member note input payload
    # + return - A specific note for a specific member
    remote isolated function postListsIdMembersIdNotes(string list_id, string subscriber_hash, MemberNotes payload) returns MemberNotes1|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MemberNotes1 response = check self.clientEp->post(path, request, targetType=MemberNotes1);
        return response;
    }
    # Get member note
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + note_id - The id for the note.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A specific note for a specific member
    remote isolated function getListsIdMembersIdNotesId(string list_id, string subscriber_hash, string note_id, string[]? fields = (), string[]? excludeFields = ()) returns MemberNotes1|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/notes/${note_id}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        MemberNotes1 response = check self.clientEp-> get(path, targetType = MemberNotes1);
        return response;
    }
    # Delete note
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + note_id - The id for the note.
    # + return - Empty Response
    remote isolated function deleteListsIdMembersIdNotesId(string list_id, string subscriber_hash, string note_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/notes/${note_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update note
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + note_id - The id for the note.
    # + payload - Update note input payload
    # + return - A specific note for a specific member
    remote isolated function patchListsIdMembersIdNotesId(string list_id, string subscriber_hash, string note_id, MemberNotes2 payload) returns MemberNotes1|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/notes/${note_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MemberNotes1 response = check self.clientEp->patch(path, request, targetType=MemberNotes1);
        return response;
    }
    # Delete list member
    #
    # + list_id - The unique ID for the list.
    # + subscriber_hash - The MD5 hash of the lowercase version of the list member's email address.
    # + return - Empty Response
    remote isolated function postListsIdMembersHashActionsDeletePermanent(string list_id, string subscriber_hash) returns http:Response|error {
        string  path = string `/lists/${list_id}/members/${subscriber_hash}/actions/delete-permanent`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List merge fields
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + count - The number of records to return. Default value is 10. Maximum value is 1000
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0.
    # + 'type - The merge field type.
    # + required - The boolean value if the merge field is required.
    # + return - The merge field (formerly merge vars) for a list. These correspond to merge fields in Mailchimp's lists and subscriber profiles
    remote isolated function getListsIdMergeFields(string list_id, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), boolean? required = ()) returns CollectionOfMergeFields|error {
        string  path = string `/lists/${list_id}/merge-fields`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "required": required};
        path = path + check getPathForQueryParam(queryParam);
        CollectionOfMergeFields response = check self.clientEp-> get(path, targetType = CollectionOfMergeFields);
        return response;
    }
    # Add merge field
    #
    # + list_id - The unique ID for the list.
    # + payload - Add merge field input payload
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles
    remote isolated function postListsIdMergeFields(string list_id, MergeField payload) returns MergeField1|error {
        string  path = string `/lists/${list_id}/merge-fields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MergeField1 response = check self.clientEp->post(path, request, targetType=MergeField1);
        return response;
    }
    # Get merge field
    #
    # + list_id - The unique ID for the list.
    # + merge_id - The id for the merge field.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles
    remote isolated function getListsIdMergeFieldsId(string list_id, string merge_id, string[]? excludeFields = (), string[]? fields = ()) returns MergeField1|error {
        string  path = string `/lists/${list_id}/merge-fields/${merge_id}`;
        map<anydata> queryParam = {"exclude_fields": excludeFields, "fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        MergeField1 response = check self.clientEp-> get(path, targetType = MergeField1);
        return response;
    }
    # Delete merge field
    #
    # + list_id - The unique ID for the list.
    # + merge_id - The id for the merge field.
    # + return - Empty Response
    remote isolated function deleteListsIdMergeFieldsId(string list_id, string merge_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/merge-fields/${merge_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update merge field
    #
    # + list_id - The unique ID for the list.
    # + merge_id - The id for the merge field.
    # + payload - Update merge field input payload
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles
    remote isolated function patchListsIdMergeFieldsId(string list_id, string merge_id, MergeField2 payload) returns MergeField1|error {
        string  path = string `/lists/${list_id}/merge-fields/${merge_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MergeField1 response = check self.clientEp->patch(path, request, targetType=MergeField1);
        return response;
    }
    # List webhooks
    #
    # + list_id - The unique ID for the list.
    # + return - Manage webhooks for a specific list
    remote isolated function getListsIdWebhooks(string list_id) returns ListWebhooks|error {
        string  path = string `/lists/${list_id}/webhooks`;
        ListWebhooks response = check self.clientEp-> get(path, targetType = ListWebhooks);
        return response;
    }
    # Add webhook
    #
    # + list_id - The unique ID for the list.
    # + payload - Add webhook input payload
    # + return - Webhook configured for the given list
    remote isolated function postListsIdWebhooks(string list_id, AddWebhook payload) returns ListWebhooks1|error {
        string  path = string `/lists/${list_id}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListWebhooks1 response = check self.clientEp->post(path, request, targetType=ListWebhooks1);
        return response;
    }
    # Get webhook info
    #
    # + list_id - The unique ID for the list.
    # + webhook_id - The webhook's id.
    # + return - Webhook configured for the given list
    remote isolated function getListsIdWebhooksId(string list_id, string webhook_id) returns ListWebhooks1|error {
        string  path = string `/lists/${list_id}/webhooks/${webhook_id}`;
        ListWebhooks1 response = check self.clientEp-> get(path, targetType = ListWebhooks1);
        return response;
    }
    # Delete webhook
    #
    # + list_id - The unique ID for the list.
    # + webhook_id - The webhook's id.
    # + return - Empty Response
    remote isolated function deleteListsIdWebhooksId(string list_id, string webhook_id) returns http:Response|error {
        string  path = string `/lists/${list_id}/webhooks/${webhook_id}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Update webhook
    #
    # + list_id - The unique ID for the list.
    # + webhook_id - The webhook's id.
    # + payload - Update webhook input payload
    # + return - Webhook configured for the given list
    remote isolated function patchListsIdWebhooksId(string list_id, string webhook_id, AddWebhook1 payload) returns ListWebhooks1|error {
        string  path = string `/lists/${list_id}/webhooks/${webhook_id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ListWebhooks1 response = check self.clientEp->patch(path, request, targetType=ListWebhooks1);
        return response;
    }
    # List signup forms
    #
    # + list_id - The unique ID for the list.
    # + return - List Signup Forms.
    remote isolated function getListsIdSignupForms(string list_id) returns ListSignupForms|error {
        string  path = string `/lists/${list_id}/signup-forms`;
        ListSignupForms response = check self.clientEp-> get(path, targetType = ListSignupForms);
        return response;
    }
    # Customize signup form
    #
    # + list_id - The unique ID for the list.
    # + payload - Customize signup form input payload
    # + return - List Signup Forms.
    remote isolated function postListsIdSignupForms(string list_id, SignupForm payload) returns SignupForm1|error {
        string  path = string `/lists/${list_id}/signup-forms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SignupForm1 response = check self.clientEp->post(path, request, targetType=SignupForm1);
        return response;
    }
    # List locations
    #
    # + list_id - The unique ID for the list.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + return - A summary of List's locations
    remote isolated function getListsIdLocations(string list_id, string[]? fields = (), string[]? excludeFields = ()) returns ListLocations|error {
        string  path = string `/lists/${list_id}/locations`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        path = path + check getPathForQueryParam(queryParam);
        ListLocations response = check self.clientEp-> get(path, targetType = ListLocations);
        return response;
    }
    # Search members
    #
    # + query - The search query used to filter results. Query should be a valid email, or a string representing a contact's first or last name.
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation.
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation.
    # + listId - The unique id for the list.
    # + return - Members found for given search term
    remote isolated function getSearchMembers(string query, string[]? fields = (), string[]? excludeFields = (), string? listId = ()) returns Members|error {
        string  path = string `/search-members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "query": query, "list_id": listId};
        path = path + check getPathForQueryParam(queryParam);
        Members response = check self.clientEp-> get(path, targetType = Members);
        return response;
    }
    # Ping
    #
    # + return - API health status
    remote isolated function getPing() returns ApiHealthStatus|error {
        string  path = string `/ping`;
        ApiHealthStatus response = check self.clientEp-> get(path, targetType = ApiHealthStatus);
        return response;
    }
    # Get domain info
    #
    # + domain_name - The domain name.
    # + return - The domains on the account
    remote isolated function getVerifiedDomain(string domain_name) returns VerifiedDomains|error {
        string  path = string `/verified-domains/${domain_name}`;
        VerifiedDomains response = check self.clientEp-> get(path, targetType = VerifiedDomains);
        return response;
    }
    # Delete domain
    #
    # + domain_name - The domain name.
    # + return - Empty Response
    remote isolated function deleteVerifiedDomain(string domain_name) returns http:Response|error {
        string  path = string `/verified-domains/${domain_name}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Verify domain
    #
    # + domain_name - The domain name.
    # + payload - Verify domain input payload
    # + return - The domain being verified for sending.
    remote isolated function verifyDomain(string domain_name, Body4 payload) returns VerifiedDomains|error {
        string  path = string `/verified-domains/${domain_name}/actions/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VerifiedDomains response = check self.clientEp->post(path, request, targetType=VerifiedDomains);
        return response;
    }
    # List sending domains
    #
    # + return - The domains on the account.
    remote isolated function getVerifiedDomains() returns VerifiedDomains1|error {
        string  path = string `/verified-domains`;
        VerifiedDomains1 response = check self.clientEp-> get(path, targetType = VerifiedDomains1);
        return response;
    }
    # Add domain to account
    #
    # + payload - Add domain to account input payload
    # + return - The newly-created domain.
    remote isolated function createVerifiedDomain(VerifiedDomains2 payload) returns VerifiedDomains|error {
        string  path = string `/verified-domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VerifiedDomains response = check self.clientEp->post(path, request, targetType=VerifiedDomains);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
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
