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
    http:BearerTokenConfig authConfig;
    http:ClientSecureSocket secureSocketConfig?;
};

# Mail content
public type SendMailRequest record {
    # An object allowing you to specify how to handle unsubscribes.
    record  { # The unsubscribe group to associate with this email.
        int group_id; # An array containing the unsubscribe groups that you would like to be displayed on the unsubscribe preferences page.
        int[] groups_to_display?;}  asm?;
    # An array of objects in which you can specify any attachments you want to include.
    record  { # The Base64 encoded content of the attachment.
        string content; # The content id for the attachment. This is used when the disposition is set to “inline” and the attachment is an image, allowing the file to be displayed within the body of your email.
        string content_id?; # The content-disposition of the attachment specifying how you would like the attachment to be displayed. For example, “inline” results in the attached file being displayed automatically within the message while “attachment” results in the attached file requiring some action to be taken before it is displayed (e.g. opening or downloading the file).
        string disposition?; # The filename of the attachment.
        string filename; # The mime type of the content you are attaching. For example, “text/plain” or “text/html”.
        string 'type?;} [] attachments?;
    # This ID represents a batch of emails to be sent at the same time. Including a batch_id in your request allows you include this email in that batch, and also enables you to cancel or pause the delivery of that batch. For more information, see https://sendgrid.com/docs/API_Reference/Web_API_v3/cancel_schedule_send.html 
    string batch_id?;
    # An array of category names for this message. Each category name may not exceed 255 characters. 
    string[] categories?;
    # An array in which you may specify the content of your email. You can include multiple mime types of content, but you must specify at least one mime type. To include more than one mime type, simply add another object to the array containing the `type` and `value` parameters.
    record  { # The mime type of the content you are including in your email. For example, “text/plain” or “text/html”.
        string 'type; # The actual content of the specified mime type that you are including in your email.
        string value;} [] content;
    # Values that are specific to the entire send that will be carried along with the email and its activity data. Substitutions will not be made on custom arguments, so any string that is entered into this parameter will be assumed to be the custom argument that you would like to be used. This parameter is overridden by personalizations[x].custom_args if that parameter has been defined. Total custom args size may not exceed 10,000 bytes.
    record {} custom_args?;
    # Email details
    EmailObject 'from;
    # An object containing key/value pairs of header names and the value to substitute for them. You must ensure these are properly encoded if they contain unicode characters. Must not be one of the reserved headers.
    record {} headers?;
    # The IP Pool that you would like to send this email from.
    string ip_pool_name?;
    # A collection of different mail settings that you can use to specify how you would like this email to be handled.
    record  { # This allows you to have a blind carbon copy automatically sent to the specified email address for every email that is sent.
        record  { # The email address that you would like to receive the BCC.
            string email?; # Indicates if this setting is enabled.
            boolean enable?;}  bcc?; # Allows you to bypass all unsubscribe groups and suppressions to ensure that the email is delivered to every single recipient. This should only be used in emergencies when it is absolutely necessary that every recipient receives your email.
        record  { # Indicates if this setting is enabled.
            boolean enable?;}  bypass_list_management?; # The default footer that you would like included on every email.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # The HTML content of your footer.
            string html?; # The plain text content of your footer.
            string text?;}  footer?; # This allows you to send a test email to ensure that your request body is valid and formatted correctly.
        record  { # Indicates if this setting is enabled.
            boolean enable?;}  sandbox_mode?; # This allows you to test the content of your email for spam.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # An Inbound Parse URL that you would like a copy of your email along with the spam report to be sent to.
            string post_to_url?; # The threshold used to determine if your content qualifies as spam on a scale from 1 to 10, with 10 being most strict, or most likely to be considered as spam.
            int threshold?;}  spam_check?;}  mail_settings?;
    # An array of messages and their metadata. Each object within personalizations can be thought of as an envelope - it defines who should receive an individual message and how that message should be handled.
    record  { # An array of recipients who will receive a blind carbon copy of your email. Each object within this array may contain the name, but must always contain the email, of a recipient.
        EmailObject[] bcc?; # An array of recipients who will receive a copy of your email. Each object within this array may contain the name, but must always contain the email, of a recipient.
        EmailObject[] cc?; # Values that are specific to this personalization that will be carried along with the email and its activity data. Substitutions will not be made on custom arguments, so any string that is entered into this parameter will be assumed to be the custom argument that you would like to be used. May not exceed 10,000 bytes.
        record {} custom_args?; # A collection of JSON key/value pairs allowing you to specify specific handling instructions for your email. You may not overwrite the following headers: x-sg-id, x-sg-eid, received, dkim-signature, Content-Type, Content-Transfer-Encoding, To, From, Subject, Reply-To, CC, BCC
        record {} headers?; # A unix timestamp allowing you to specify when you want your email to be delivered. Scheduling more than 72 hours in advance is forbidden.
        int send_at?; # The subject of your email. Char length requirements, according to the RFC - http://stackoverflow.com/questions/1592291/what-is-the-email-subject-length-limit#answer-1592310
        string subject?; # A collection of key/value pairs following the pattern "substitution_tag":"value to substitute". All are assumed to be strings. These substitutions will apply to the text and html content of the body of your email, in addition to the `subject` and `reply-to` parameters.
        record {} substitutions?; # An array of recipients. Each object within this array may contain the name, but must always contain the email, of a recipient.
        EmailObject[] to;} [] personalizations;
    # Email details
    EmailObject reply_to?;
    # An object of key/value pairs that define block sections of code to be used as substitutions.
    record {} sections?;
    # A unix timestamp allowing you to specify when you want your email to be delivered. This may be overridden by the personalizations[x].send_at parameter. Scheduling more ta 72 hours in advance is forbidden.
    int send_at?;
    # The global, or “message level”, subject of your email. This may be overridden by personalizations[x].subject.
    string subject;
    # The id of a template that you would like to use. If you use a template that contains a subject and content (either text or html), you do not need to specify those at the personalizations nor message level. 
    string template_id?;
    # Settings to determine how you would like to track the metrics of how your recipients interact with your email.
    record  { # Allows you to track whether a recipient clicked a link in your email.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # Indicates if this setting should be included in the text/plain portion of your email.
            boolean enable_text?;}  click_tracking?; # Allows you to enable tracking provided by Google Analytics.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # The name of the campaign.	
            string utm_campaign?; # Used to differentiate your campaign from advertisements.	
            string utm_content?; # Name of the marketing medium. (e.g. Email)
            string utm_medium?; # Name of the referrer source. (e.g. Google, SomeDomain.com, or Marketing Email)
            string utm_source?; # Used to identify any paid keywords.	
            string utm_term?;}  ganalytics?; # Allows you to track whether the email was opened or not, but including a single pixel image in the body of the content. When the pixel is loaded, we can log that the email was opened.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # Allows you to specify a substitution tag that you can insert in the body of your email at a location that you desire. This tag will be replaced by the open tracking pixel.
            string substitution_tag?;}  open_tracking?; # Allows you to insert a subscription management link at the bottom of the text and html bodies of your email. If you would like to specify the location of the link within your email, you may use the substitution_tag.
        record  { # Indicates if this setting is enabled.
            boolean enable?; # HTML to be appended to the email, with the subscription tracking link. You may control where the link is by using the tag <% %>
            string html?; # A tag that will be replaced with the unsubscribe URL. for example: [unsubscribe_url]. If this parameter is used, it will override both the `text` and `html` parameters. The URL of the link will be placed at the substitution tag’s location, with no additional formatting.
            string substitution_tag?; # Text to be appended to the email, with the subscription tracking link. You may control where the link is by using the tag <% %>
            string text?;}  subscription_tracking?;}  tracking_settings?;
};

public type AlertResponseArr AlertResponse[];

# Alert Content
public type PostAlertsRequest record {
    # The email address the alert will be sent to.
    string? email_to;
    # Required for stats_notification. How frequently the alert will be sent. Example: daily
    string frequency?;
    # Required for usage_alert. When this usage threshold is reached, the alert will be sent. Example: 90
    int percentage?;
    # The type of alert you want to create. Can be either usage_limit or stats_notification. Example: usage_limit
    string 'type;
};

# Created alert details
public type PostAlertsResponse record {
    # A Unix timestamp indicating when the alert was created.
    int created_at;
    # The email address that the alert will be sent to.
    string email_to;
    # If the alert is of type stats_notification, this indicates how frequently the stats notifications will be sent. For example, "daily", "weekly", or "monthly".
    string frequency?;
    # The ID of the alert.
    int id;
    # If the alert is of type usage_limit, this indicates the percentage of email usage that must be reached before the alert will be sent.
    int percentage?;
    # The type of alert.
    string 'type;
    # A Unix timestamp indicating when the alert was last modified.
    int updated_at;
};

# Alert content to update
public type UpdateAlertbyIdRequest record {
    # The new email address you want your alert to be sent to.
    string email_to?;
    # The new frequency at which to send the stats_notification alert. Example: monthly
    string frequency?;
    # The new percentage threshold at which the usage_limit alert will be sent. Example: 90
    int percentage?;
};

# Updated alert details
public type UpdateAlertbyIdResponse record {
    # A Unix timestamp indicating when the alert was created.
    int created_at;
    # The email address that the alert will be sent to.
    string email_to;
    # If the alert is of type stats_notification, this indicates how frequently the stats notifications will be sent. For example: "daily", "weekly", or "monthly".
    string frequency?;
    # The ID of the alert.
    int id;
    # If the alert is of type usage_limit, this indicates the percentage of email usage that must be reached before the alert will be sent.
    int percentage?;
    # The type of alert.
    string 'type;
    # A Unix timestamp indicating when the alert was last modified.
    int updated_at;
};

public type SubuserArr Subuser[];

# New subuser details
public type PostSubusersRequest record {
    # The email address of the subuser.
    string email;
    # The IP addresses that should be assigned to this subuser.
    string[] ips;
    # The password this subuser will use when logging into SendGrid.
    string password;
    # The username for this subuser.
    string username;
};

public type SuppressionBlocksArr SuppressionBlocks[];

public type SpamReportDetailsArr SpamReportDetails[];

# Client endpoint for Sendgrid API
#
# + clientEp - Connector http endpoint
@display {label: "Sendgrid Client"}
public client class Client {
    http:Client clientEp;
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.sendgrid.com/v3") returns error? {
        http:ClientSecureSocket? secureSocketConfig = clientConfig?.secureSocketConfig;
        http:Client httpEp = check new (serviceUrl, { auth: clientConfig.authConfig, secureSocket: secureSocketConfig });
        self.clientEp = httpEp;
    }
    # Send Mail
    #
    # + payload - Mail content
    # + return - No Content
    @display {label: "Send Email"}
    remote isolated function sendMail(@display {label: "Email Content"} SendMailRequest payload) returns error? {
        string  path = string `/mail/send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
         _ = check self.clientEp-> post(path, request, targetType=http:Response);
    }
    # Retrieve all alerts
    #
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Details related to alerts
    @display {label: "Get All Alerts"}
    remote isolated function getAlerts(@display {label: "Subuser's Username"} string? onBehalfOf = ()) returns AlertResponseArr|error {
        string  path = string `/alerts`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AlertResponseArr response = check self.clientEp-> get(path, accHeaders, targetType = AlertResponseArr);
        return response;
    }
    # Create a new Alert
    #
    # + payload - Alert Content
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Created alert details
    @display {label: "Create Alert"}
    remote isolated function postAlerts(@display {label: "Alert Content"} PostAlertsRequest payload, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns PostAlertsResponse|error {
        string  path = string `/alerts`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PostAlertsResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PostAlertsResponse);
        return response;
    }
    # Delete an alert
    #
    # + alert_id - The ID of the alert you would like to retrieve.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Succesful - No Content
    @display {label: "Delete Alert by Id"}
    remote isolated function deleteAlertById(@display {label: "Alert Id"} int alert_id, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns error? {
        string  path = string `/alerts/${alert_id}`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, headers = accHeaders, targetType=http:Response);
    }
    # Update an alert
    #
    # + alert_id - The ID of the alert you would like to retrieve.
    # + payload - Alert content to update
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Updated alert details
    @display {label: "Update Alert by Id"}
    remote isolated function updateAlertbyId(@display {label: "Alert Id"} int alert_id, UpdateAlertbyIdRequest payload, @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns UpdateAlertbyIdResponse|error {
        string  path = string `/alerts/${alert_id}`;
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UpdateAlertbyIdResponse response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=UpdateAlertbyIdResponse);
        return response;
    }
    # List all Subusers
    #
    # + username - The username of this subuser.
    # + 'limit - The number of results you would like to get in each request.
    # + offset - The number of subusers to skip.
    # + return - List of Subusers
    @display {label: "List All Subusers"}
    remote isolated function getSubusers(@display {label: "Username"} string? username = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = ()) returns SubuserArr|error {
        string  path = string `/subusers`;
        map<anydata> queryParam = {username: username, 'limit: 'limit, offset: offset};
        path = path + check getPathForQueryParam(queryParam);
        SubuserArr response = check self.clientEp-> get(path, targetType = SubuserArr);
        return response;
    }
    # Create Subuser
    #
    # + payload - New subuser details
    # + return - Created subuser's details
    remote isolated function postSubusers(@display {label: "New Subuser Details"} PostSubusersRequest payload) returns SubuserPost|error {
        string  path = string `/subusers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubuserPost response = check self.clientEp->post(path, request, targetType=SubuserPost);
        return response;
    }
    # Delete a subuser
    #
    # + subuser_name - Subuser name
    # + return - Successful - No Content
    @display {label: "Update Subuser by Subuser Name"}
    remote isolated function deleteSubuserByName(@display {label: "Subuser Name"} string subuser_name) returns error? {
        string  path = string `/subusers/${subuser_name}`;
        http:Request request = new;
        //TODO: Update the request as needed;
         _ = check self.clientEp-> delete(path, request, targetType =http:Response);
    }
    # Retrieve all blocks
    #
    # + start_time - Refers start of the time range in unix timestamp when a blocked email was created (inclusive).
    # + end_time - Refers end of the time range in unix timestamp when a blocked email was created (inclusive).
    # + 'limit - Limit the number of results to be displayed per page.
    # + offset - The point in the list to begin displaying results.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - List of all blocks
    @display {label: "Get Suppression Blocks"}
    remote isolated function getSuppressionBlocks(@display {label: "Start Time"} int? start_time = (), @display {label: "End Time"} int? end_time = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns SuppressionBlocksArr|error {
        string  path = string `/suppression/blocks`;
        map<anydata> queryParam = {start_time: start_time, end_time: end_time, 'limit: 'limit, offset: offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SuppressionBlocksArr response = check self.clientEp-> get(path, accHeaders, targetType = SuppressionBlocksArr);
        return response;
    }
    # Retrieve all spam reports
    #
    # + start_time - Refers start of the time range in unix timestamp when a spam report was created (inclusive).
    # + end_time - Refers end of the time range in unix timestamp when a spam report was created (inclusive).
    # + 'limit - Limit the number of results to be displayed per page.
    # + offset - Paging offset. The point in the list to begin displaying results.
    # + onBehalfOf - The subuser's username. This header generates the API call as if the subuser account was making the call.
    # + return - Received spam reports
    @display {label: "Get Suppression Spam Reports"}
    remote isolated function getSuppressionSpamReports(@display {label: "Start Time"} int? start_time = (), @display {label: "End Time"} int? end_time = (), @display {label: "Limit"} int? 'limit = (), @display {label: "Offset"} int? offset = (), @display {label: "Subuser's Username"} string? onBehalfOf = ()) returns SpamReportDetailsArr|error {
        string  path = string `/suppression/spam_reports`;
        map<anydata> queryParam = {start_time: start_time, end_time: end_time, 'limit: 'limit, offset: offset};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"on-behalf-of": onBehalfOf};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        SpamReportDetailsArr response = check self.clientEp-> get(path, accHeaders, targetType = SpamReportDetailsArr);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any>   headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
