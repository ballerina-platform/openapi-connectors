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

import ballerina/constraint;

public type AlertResponseArr AlertResponse[];

public type SubuserArr Subuser[];

public type SuppressionBlocksArr SuppressionBlocks[];

public type SpamReportDetailsArr SpamReportDetails[];

@constraint:String {maxLength: 255}
public type SendemailrequestCategoriesItemsString string;

# This allows you to test the content of your email for spam.
public type SendemailrequestMailSettingsSpamCheck record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # An Inbound Parse URL that you would like a copy of your email along with the spam report to be sent to.
    string post_to_url?;
    # The threshold used to determine if your content qualifies as spam on a scale from 1 to 10, with 10 being most strict, or most likely to be considered as spam.
    @constraint:Int {minValue: 1, maxValue: 10}
    int threshold?;
};

# Details of the subuser
public type Subuser record {
    # Whether or not the user is enabled or disabled.
    boolean disabled;
    # The email address to contact this subuser.
    string email;
    # The ID of this subuser.
    decimal id;
    # The name by which this subuser will be referred.
    string username;
};

# This allows you to have a blind carbon copy automatically sent to the specified email address for every email that is sent.
public type SendemailrequestMailSettingsBcc record {
    # The email address that you would like to receive the BCC.
    string email?;
    # Indicates if this setting is enabled.
    boolean enable?;
};

# Error details
public type ErrorDetails record {
    # The field that generated the error.
    string? 'field?;
    # The error message.
    string message;
};

public type InlineResponse400 record {
    string 'field?;
    string message?;
};

# Credit allocations
public type SubuserPostCreditAllocation record {
    # Credit allocation type
    string 'type?;
};

# Global error response
public type GlobalErrorresponse record {
    # Error details
    ErrorDetails[] errors?;
};

public type ErrorsErrors record {
    # The field that has the error.
    string? 'field?;
    # The message the API caller will receive.
    string message?;
};

# This allows you to send a test email to ensure that your request body is valid and formatted correctly.
public type SendemailrequestMailSettingsSandboxMode record {
    # Indicates if this setting is enabled.
    boolean enable?;
};

# Allows you to bypass all unsubscribe groups and suppressions to ensure that the email is delivered to every single recipient. This should only be used in emergencies when it is absolutely necessary that every recipient receives your email.
public type SendemailrequestMailSettingsBypassListManagement record {
    # Indicates if this setting is enabled.
    boolean enable?;
};

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

# An object allowing you to specify how to handle unsubscribes.
public type SendemailrequestAsm record {
    # The unsubscribe group to associate with this email.
    int group_id;
    # An array containing the unsubscribe groups that you would like to be displayed on the unsubscribe preferences page.
    @constraint:Array {maxLength: 25}
    int[] groups_to_display?;
};

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

# The default footer that you would like included on every email.
public type SendemailrequestMailSettingsFooter record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # The HTML content of your footer.
    string html?;
    # The plain text content of your footer.
    string text?;
};

# Allows you to enable tracking provided by Google Analytics.
public type SendemailrequestTrackingSettingsGanalytics record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # The name of the campaign.	
    string utm_campaign?;
    # Used to differentiate your campaign from advertisements.	
    string utm_content?;
    # Name of the marketing medium. (e.g. Email)
    string utm_medium?;
    # Name of the referrer source. (e.g. Google, SomeDomain.com, or Marketing Email)
    string utm_source?;
    # Used to identify any paid keywords.	
    string utm_term?;
};

public type SendEmailRequest record {
    # An object allowing you to specify how to handle unsubscribes.
    SendemailrequestAsm asm?;
    # An array of objects in which you can specify any attachments you want to include.
    SendemailrequestAttachments[] attachments?;
    # This ID represents a batch of emails to be sent at the same time. Including a batch_id in your request allows you include this email in that batch, and also enables you to cancel or pause the delivery of that batch. For more information, see https://sendgrid.com/docs/API_Reference/Web_API_v3/cancel_schedule_send.html 
    string batch_id?;
    # An array of category names for this message. Each category name may not exceed 255 characters. 
    @constraint:Array {maxLength: 10}
    SendemailrequestCategoriesItemsString[] categories?;
    # An array in which you may specify the content of your email. You can include multiple mime types of content, but you must specify at least one mime type. To include more than one mime type, simply add another object to the array containing the `type` and `value` parameters.
    SendemailrequestContent[] content;
    # Values that are specific to the entire send that will be carried along with the email and its activity data. Substitutions will not be made on custom arguments, so any string that is entered into this parameter will be assumed to be the custom argument that you would like to be used. This parameter is overridden by personalizations[x].custom_args if that parameter has been defined. Total custom args size may not exceed 10,000 bytes.
    record {} custom_args?;
    # Email details
    EmailObject 'from;
    # An object containing key/value pairs of header names and the value to substitute for them. You must ensure these are properly encoded if they contain unicode characters. Must not be one of the reserved headers.
    record {} headers?;
    # The IP Pool that you would like to send this email from.
    @constraint:String {maxLength: 64, minLength: 2}
    string ip_pool_name?;
    # A collection of different mail settings that you can use to specify how you would like this email to be handled.
    SendemailrequestMailSettings mail_settings?;
    # An array of messages and their metadata. Each object within personalizations can be thought of as an envelope - it defines who should receive an individual message and how that message should be handled.
    @constraint:Array {maxLength: 1000}
    SendemailrequestPersonalizations[] personalizations;
    # Email details
    EmailObject reply_to?;
    # An object of key/value pairs that define block sections of code to be used as substitutions.
    record {} sections?;
    # A unix timestamp allowing you to specify when you want your email to be delivered. This may be overridden by the personalizations[x].send_at parameter. Scheduling more ta 72 hours in advance is forbidden.
    int send_at?;
    # The global, or “message level”, subject of your email. This may be overridden by personalizations[x].subject.
    @constraint:String {minLength: 1}
    string subject;
    # The id of a template that you would like to use. If you use a template that contains a subject and content (either text or html), you do not need to specify those at the personalizations nor message level. 
    string template_id?;
    # Settings to determine how you would like to track the metrics of how your recipients interact with your email.
    SendemailrequestTrackingSettings tracking_settings?;
};

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

# Alert Object
public type PostAlertsRequest record {
    # The email address the alert will be sent to.
    # Example: test@example.com
    string? email_to;
    # Required for stats_notification. How frequently the alert will be sent. Example: daily
    string frequency?;
    # Required for usage_alert. When this usage threshold is reached, the alert will be sent. Example: 90
    int percentage?;
    # The type of alert you want to create. Can be either usage_limit or stats_notification. Example: usage_limit
    string 'type;
};

# Email details
public type EmailObject record {
    # Email Address
    string email;
    # The name of the person to whom you are sending an email.
    string name?;
};

public type UpdateAlertbyIdRequest record {
    # The new email address you want your alert to be sent to.
    # Example: test@example.com
    string email_to?;
    # The new frequency at which to send the stats_notification alert. Example: monthly
    string frequency?;
    # The new percentage threshold at which the usage_limit alert will be sent. Example: 90
    int percentage?;
};

# Alert details
public type AlertResponse record {
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
    int updated_at?;
};

public type SendemailrequestPersonalizations record {
    # An array of recipients who will receive a blind carbon copy of your email. Each object within this array may contain the name, but must always contain the email, of a recipient.
    @constraint:Array {maxLength: 1000}
    EmailObject[] bcc?;
    # An array of recipients who will receive a copy of your email. Each object within this array may contain the name, but must always contain the email, of a recipient.
    @constraint:Array {maxLength: 1000}
    EmailObject[] cc?;
    # Values that are specific to this personalization that will be carried along with the email and its activity data. Substitutions will not be made on custom arguments, so any string that is entered into this parameter will be assumed to be the custom argument that you would like to be used. May not exceed 10,000 bytes.
    record {} custom_args?;
    # A collection of JSON key/value pairs allowing you to specify specific handling instructions for your email. You may not overwrite the following headers: x-sg-id, x-sg-eid, received, dkim-signature, Content-Type, Content-Transfer-Encoding, To, From, Subject, Reply-To, CC, BCC
    record {} headers?;
    # A unix timestamp allowing you to specify when you want your email to be delivered. Scheduling more than 72 hours in advance is forbidden.
    int send_at?;
    # The subject of your email. Char length requirements, according to the RFC - http://stackoverflow.com/questions/1592291/what-is-the-email-subject-length-limit#answer-1592310
    @constraint:String {minLength: 1}
    string subject?;
    # A collection of key/value pairs following the pattern "substitution_tag":"value to substitute". All are assumed to be strings. These substitutions will apply to the text and html content of the body of your email, in addition to the `subject` and `reply-to` parameters.
    record {} substitutions?;
    # An array of recipients. Each object within this array may contain the name, but must always contain the email, of a recipient.
    @constraint:Array {maxLength: 1000, minLength: 1}
    EmailObject[] to;
};

# Allows you to track whether a recipient clicked a link in your email.
public type SendemailrequestTrackingSettingsClickTracking record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # Indicates if this setting should be included in the text/plain portion of your email.
    boolean enable_text?;
};

public type SendemailrequestContent record {
    # The mime type of the content you are including in your email. For example, “text/plain” or “text/html”.
    @constraint:String {minLength: 1}
    string 'type;
    # The actual content of the specified mime type that you are including in your email.
    @constraint:String {minLength: 1}
    string value;
};

# Details of the blocks
public type SuppressionBlocks record {
    # A Unix timestamp indicating when the email address was added to the blocks list.
    int created;
    # The email address that was added to the block list.
    string email;
    # An explanation for the reason of the block.
    string reason;
    # The status of the block.
    string status;
};

# Created subuser's details
public type SubuserPost record {
    # Authorization tokens
    string authorization_token?;
    # Credit allocations
    SubuserPostCreditAllocation credit_allocation?;
    # The email address for this subuser.
    string email;
    # Signup session token
    string signup_session_token?;
    # The user ID for this subuser.
    decimal user_id;
    # The username of the subuser.
    string username;
};

public type SendemailrequestAttachments record {
    # The Base64 encoded content of the attachment.
    @constraint:String {minLength: 1}
    string content;
    # The content id for the attachment. This is used when the disposition is set to “inline” and the attachment is an image, allowing the file to be displayed within the body of your email.
    string content_id?;
    # The content-disposition of the attachment specifying how you would like the attachment to be displayed. For example, “inline” results in the attached file being displayed automatically within the message while “attachment” results in the attached file requiring some action to be taken before it is displayed (e.g. opening or downloading the file).
    string disposition = "attachment";
    # The filename of the attachment.
    string filename;
    # The mime type of the content you are attaching. For example, “text/plain” or “text/html”.
    @constraint:String {minLength: 1}
    string 'type?;
};

# Settings to determine how you would like to track the metrics of how your recipients interact with your email.
public type SendemailrequestTrackingSettings record {
    # Allows you to track whether a recipient clicked a link in your email.
    SendemailrequestTrackingSettingsClickTracking click_tracking?;
    # Allows you to enable tracking provided by Google Analytics.
    SendemailrequestTrackingSettingsGanalytics ganalytics?;
    # Allows you to track whether the email was opened or not, but including a single pixel image in the body of the content. When the pixel is loaded, we can log that the email was opened.
    SendemailrequestTrackingSettingsOpenTracking open_tracking?;
    # Allows you to insert a subscription management link at the bottom of the text and html bodies of your email. If you would like to specify the location of the link within your email, you may use the substitution_tag.
    SendemailrequestTrackingSettingsSubscriptionTracking subscription_tracking?;
};

# List of errors
public type Errors record {
    # Error message
    ErrorsErrors[] errors?;
};

# A collection of different mail settings that you can use to specify how you would like this email to be handled.
public type SendemailrequestMailSettings record {
    # This allows you to have a blind carbon copy automatically sent to the specified email address for every email that is sent.
    SendemailrequestMailSettingsBcc bcc?;
    # Allows you to bypass all unsubscribe groups and suppressions to ensure that the email is delivered to every single recipient. This should only be used in emergencies when it is absolutely necessary that every recipient receives your email.
    SendemailrequestMailSettingsBypassListManagement bypass_list_management?;
    # The default footer that you would like included on every email.
    SendemailrequestMailSettingsFooter footer?;
    # This allows you to send a test email to ensure that your request body is valid and formatted correctly.
    SendemailrequestMailSettingsSandboxMode sandbox_mode?;
    # This allows you to test the content of your email for spam.
    SendemailrequestMailSettingsSpamCheck spam_check?;
};

# Allows you to track whether the email was opened or not, but including a single pixel image in the body of the content. When the pixel is loaded, we can log that the email was opened.
public type SendemailrequestTrackingSettingsOpenTracking record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # Allows you to specify a substitution tag that you can insert in the body of your email at a location that you desire. This tag will be replaced by the open tracking pixel.
    string substitution_tag?;
};

# Allows you to insert a subscription management link at the bottom of the text and html bodies of your email. If you would like to specify the location of the link within your email, you may use the substitution_tag.
public type SendemailrequestTrackingSettingsSubscriptionTracking record {
    # Indicates if this setting is enabled.
    boolean enable?;
    # HTML to be appended to the email, with the subscription tracking link. You may control where the link is by using the tag <% %>
    string html?;
    # A tag that will be replaced with the unsubscribe URL. for example: [unsubscribe_url]. If this parameter is used, it will override both the `text` and `html` parameters. The URL of the link will be placed at the substitution tag’s location, with no additional formatting.
    string substitution_tag?;
    # Text to be appended to the email, with the subscription tracking link. You may control where the link is by using the tag <% %>
    string text?;
};

# Spam report details
public type SpamReportDetails record {
    # A Unix timestamp indicating when the spam report was made.
    int created;
    # The email address of the recipient who marked your message as spam.
    string email;
    # The IP address that the message was sent on.
    string ip;
};
