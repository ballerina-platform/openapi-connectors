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

public type Customer record {
    # Email addresses that are associated with the Constant Contact account owner.
    string contact_email?;
    # The account owner's contact phone number (up to 25 characters in length).
    @constraint:String {maxLength: 25}
    string contact_phone?;
    # The uppercase two-letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> representing the organization's country.
    string country_code?;
    # The readOnly encoded account ID that uniquely identifies the account.
    string encoded_account_id?;
    # The account owner's first name.
    string first_name?;
    # The account owner's last name.
    string last_name?;
    # The name of the organization that is associated with this account.
    string organization_name?;
    # The phone number of the organization that is associated with this account.
    string organization_phone?;
    # The uppercase two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> for the organization's state. This property is required if the <code>country_code</code> is US (United States).
    string state_code?;
    # The time zone that is automatically set based on the <code>state_code</code> setting; as defined in the IANA time-zone database (see http://www.iana.org/time-zones).
    string time_zone_id?;
    # The organization's website URL.
    string website?;
    CustomerPhysicalAddress physical_address?;
    CompanyLogo company_logo?;
};

# The next link in the page or null if there are no additional pages
public type Next2 record {
    # The next link in the page or null if there are no additional pages.
    string href;
};

public type BulkEmailCampaignSummariesPage record {
    # Lists and provides details about each bulk email campaign activity including total unique counts for tracked activities.
    BulkEmailCampaignSummary[] bulk_email_campaign_summaries;
    # Links_2
    Links2 _links;
};

public type ActivityLinks record {
    ActivitylinksSelf self?;
    ActivitylinksResults results?;
};

public type ActivityReference record {
    # The ID (UUID) that uniquely identifies a campaign activity.
    string campaign_activity_id?;
    # The purpose of the individual campaign activity in the larger email campaign effort. Valid values are: <ul>
    #   <li>primary_email — The main email marketing campaign that you send to contacts. The <code>primary_email</code> contains the complete email content.</li>
    #   <li>permalink — A permanent link to a web accessible version of the <code>primary_email</code> content without any personalized email information. For example, permalinks do not contain any of the contact details that you add to the <code>primary_email</code> email content. </li>
    #   <li>resend — An email campaign that you resend to contacts that did not open the email campaign.</li>
    # </ul> Constant Contact creates a <code>primary_email</code> and a <code>permalink</code> role campaign activity when you create an email campaign.
    string role?;
};

# Generic bulk activity status response object
public type Activity record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Name of the file used for an add_contacts activity.
    string source_file_name?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    # Activity status
    ActivityStatus status?;
    # Activity status export link
    ActivityStatusExportLink _links?;
};

public type TagAddRemoveContacts record {
    # Select the source used to identify contacts to which a tag is added or removed. Source types are mutually exclusive.
    TagaddremovecontactsSource 'source;
    # Use to exclude specified contacts from being added or removed from a tag. Only applicable if the specified source is either <code>all_active_contacts</code> or <code>list_ids</code>.
    TagaddremovecontactsExclude exclude?;
    # An array of tags (<code>tag_id</code>) to add to all contacts meeting the specified source criteria.
    @constraint:Array {maxLength: 50}
    string[] tag_ids;
};

public type ContactXrefs record {
    # An array of cross-referenced V3 API <code>contact_id</code> and V2 API <code>sequence_id</code> values. Response is sorted ascending by <code>sequence_id</code>.
    @constraint:Array {maxLength: 500}
    ContactXref[] xrefs?;
};

# Link to an activity result resource; as an example, for file_export, the link to the exported contacts file.
public type ActivitystatusexportlinkResults record {
    # Link to an activity result resource
    string href?;
};

public type EmailScheduleResponse EmailscheduleresponseInner[];

# The usage tier that is associated with a client's Constant Contact account and is used to calculate the monthly billing price.
public type TierObject record {
    # Identifies the tier usage type that is associated with the billing plan.
    string usage_type?;
    # The number of active contacts (default) used within the current tier.
    float current_usage?;
    # The billing tier level that is associated with a client account. By default, the system determines the tier level to use based on the number of active contacts currently in the client account at the time of billing. Billing tiers may differ. The following shows an example billing tier: <ul>
    #   <li>level <code>1</code> = 0 - 500 contacts</li>
    #   <li>level <code>2</code> = 501 - 1000 contacts</li>
    #   <li>level <code>3</code> = 1001 - ...</li>
    # </ul>
    int tier?;
    # The minimum number of active contacts for the tier level.
    float tier_min?;
    # The maximum number of active contacts for the tier level.
    float tier_max?;
    # The billing price set for the tier used to bill the client account each month.
    float price?;
    # The currency (ISO currency code) used to price the tier for a client account.
    string currency_code?;
};

public type EmailCampaignActivityInput record {
    # The email format you are using to create the email campaign activity. The V3 API supports creating emails using <code>format_type</code> 5 (custom code emails).
    int format_type;
    # The email sender's name to display for the email campaign activity.
    @constraint:String {maxLength: 100}
    string from_name;
    # The sender's email address to use for the email campaign activity. You must use a confirmed Constant Contact account email address. Make a GET call to <code>/account/emails</code> to return a collection of account emails and their confirmation status.
    @constraint:String {maxLength: 80}
    string from_email;
    # The sender's email address to use if the contact replies to the email campaign activity. You must use a confirmed Constant Contact account email address. Make a GET call to <code>/account/emails</code> to return a collection of account emails and their confirmation status.
    @constraint:String {maxLength: 80}
    string reply_to_email;
    # The text to display in the subject line that describes the email campaign activity.
    string subject;
    # The email preheader for the email campaign activity. Contacts will view your preheader as a short summary that follows the subject line in their email client. Only <code>format_type</code> 3, 4, and 5 email campaign activities use the preheader property.
    string preheader?;
    # The HTML content for the email campaign activity. Only <code>format_type</code> 5 (custom code emails) can contain <code>html_content</code>. When creating a <code>format_type</code> 5 custom code email, make sure that you include <code>[[trackingImage]]</code> in the <code>&lt;body&gt;</code> element of your HTML.
    @constraint:String {maxLength: 150000}
    string html_content;
    EmailPhysicalAddress physical_address_in_footer?;
};

public type EmailCampaignName record {
    # The updated email campaign name. The email campaign name must be unique.
    @constraint:String {maxLength: 80}
    string name;
};

# Links_2
public type Links2 record {
    # Link
    string href?;
    # The next link in the page or null if there are no additional pages
    Next2 next?;
};

public type PagedEmailCampaignResponse record {
    Paginglinks2 _links?;
    EmailCampaigns[] campaigns?;
};

# The average click and open rates for a provided contact. The basic information provided is contact id, open rate, click rate, and emails included in the calculation.
public type ContactOpenAndClickRates record {
    # The unique ID of the contact for which the report is being generated.
    string contact_id;
    # The number of activities included in the calculation.
    int included_activities_count;
    # The average rate the contact opened emails sent to them.
    decimal average_open_rate;
    # The average rate the contact clicked on links in emails sent to them.
    decimal average_click_rate;
};

public type BulkEmailCampaignSummary record {
    # The ID that uniquely identifies an email campaign.
    string campaign_id;
    # Identifies the email campaign type.
    string campaign_type;
    # The date and time that the email campaign was last sent.
    string last_sent_date;
    UniqueEmailCounts unique_counts;
};

# You can export contact objects to a CSV file. By default, all contacts in the user's account are exported if none of the following properties are included: <br/><li> By contact_id - you can specify up to 500 specific contacts. <li>list_id - you can specify up to 50 lists. You can use the status parameter with list_id<li>status - you can export contacts by status (unsubscribed, active, removed); this property can be used with list_ids.
public type ContactsExport record {
    # Exports up to 500 specific contacts. This property is mutually exclusive with <code>list_ids</code>.
    @constraint:Array {maxLength: 500}
    string[] contact_ids?;
    # Exports all of the contacts inside of up to 50 contact lists. This property is mutually exclusive with <code>contact_ids</code>.
    @constraint:Array {maxLength: 50}
    string[] list_ids?;
    # Specify the <code>segment_id</code> from which you want to export all contacts that meet the specified <code>segment_criteria</code>. This property is mutually exclusive with <code>contact_ids</code> and <code>list_ids</code>. You can only specify one <code>segment_id</code>.
    int segment_id?;
    # Use this array to export specific contact fields. You must export <code>email_address</code> to successfully export <code>email_optin_source</code>, <code>email_optin_date</code>, <code>email_optout_source</code>, <code>email_optout_date</code>, or <code>email_optout_reason</code>.
    string[] fields?;
    # Allows you to export only contacts that have a specific status value. Possible values are <code>active</code>, <code>unsubscribed</code>, or <code>removed</code>
    string status?;
};

public type ActivityTagging record {
    # The system assigned UUID that uniquely identifies an activity.
    string activity_id?;
    # The activity processing state.
    string state?;
    # Timestamp showing when processing started for the activity, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when processing completed for the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when the activity was first requested, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when the activity was last updated, in ISO-8601 format.
    string updated_at?;
    # The processing percent complete for the activity.
    int percent_done?;
    # An array of error message strings describing the errors that occurred.
    string[] activity_errors?;
    # Provides the status for the requested activity.
    ActivityTaggingStatus status?;
    ActivityLinks _links?;
};

# Select the source used to identify contacts to which a tag is added or removed. Source types are mutually exclusive.
public type TagaddremovecontactsSource record {
    # An array of contacts IDs.
    @constraint:Array {maxLength: 500}
    string[] contact_ids?;
    # An array of list IDs ( <code>list_id</code> ).
    @constraint:Array {maxLength: 50}
    string[] list_ids?;
    # An array of tags ( <code>tag_id</code> ).
    @constraint:Array {maxLength: 50}
    string[] tag_ids?;
    # Use to identify contacts with an active status.
    boolean all_active_contacts?;
    # Use to identify newly subscribed contacts.
    boolean new_subscriber?;
};

public type Tags record {
    # Lists all tags and provides tag details.
    Tag2[] tags?;
    Paginglinks2 _links?;
};

public type WebhooksSubscription record {
    # Identifies the topic using an integer to indicate the type of topic.
    int topic_id?;
    # Your webhook callback URI. Constant Contact automatically sends POST requests to this URI to notify you about the topic.
    string hook_uri?;
    # The name of the topic.
    string topic_name?;
    # A description of what the topic is and when Constant Contact notifies you concerning it.
    string topic_description?;
};

# Generic bulk activity status response object
public type ActivitiesActivities record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Name of the file used for an add_contacts activity.
    string source_file_name?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    # Activity status
    ActivityStatus status?;
    # Activity status export link
    ActivityStatusExportLink _links?;
};

public type AccountEmailCreateResponse record {
    # An email address associated with a Constant Contact account owner.
    @constraint:String {maxLength: 80}
    string email_address?;
    # The unique ID for an email address in a Constant Contact account.
    @constraint:Int {minValue: 1}
    int email_id?;
    # The confirmation status of the account email address. When you add a new email address to an account, Constant Contact automatically sends an email to that address with a link to confirm it. You can use any account email address with a <code>CONFIRMED</code> status to create an email campaign.
    string confirm_status?;
};

public type CampaignActivityStatsQueryResultEmail record {
    # Array of errors indicating any partial failures in the query
    StatsError[] errors?;
    # An array of results containing statistics for each requested campaign activity
    CampaignActivityStatsResultGenericStatsEmailActivity[] results?;
};

public type ActivityGenericStatus record {
    # The total number of tags that this activity will delete.
    int items_total_count?;
    # The number of tags that this activity has currently deleted.
    int items_completed_count?;
};

public type CampaignStatsResultGenericStatsEmailPercentsEmail record {
    # The ID that uniquely identifies the campaign (UUID).
    string campaign_id?;
    StatsEmail stats?;
    PercentsEmail percents?;
    # The date and time that the campaign stats were last refreshed.
    string last_refresh_time?;
};

# Paging links
public type PagingLinks record {
    # Link
    Link next?;
};

# A contact subresource describing the contact's email_address.
public type EmailAddress record {
    # The email address of the contact. The email address must be unique for each contact.
    @constraint:String {maxLength: 80}
    string address;
    # Identifies the type of permission that the Constant Contact account has to send email to the contact. Types of permission: explicit, implicit, not_set, pending_confirmation, temp_hold, unsubscribed.
    string permission_to_send?;
    # Date and time that the email_address was created, in ISO-8601 format. System generated.
    string created_at?;
    # Date and time that the email_address was last updated, in ISO-8601 format. System generated.
    string updated_at?;
    # Describes who opted-in the email_address; valid values are Contact or Account. Your integration must accurately identify <code>opt_in_source</code> for compliance reasons; value is set on POST, and is read-only going forward.
    string opt_in_source?;
    # Date and time that the email_address was opted-in to receive email from the account, in ISO-8601 format. System generated.
    string opt_in_date?;
    # Describes the source of the unsubscribed/opt-out action: either Account or Contact. If the Contact opted-out, then the account cannot send any campaigns to this contact until the contact opts back in. If the Account, then the account can add the contact back to any lists and send to them. Displayed only if contact has been unsubscribed/opt-out.
    string opt_out_source?;
    # Date and time that the contact unsubscribed/opted-out of receiving email from the account, in ISO-8601 format. Displayed only if contact has been unsubscribed/opt-out. System generated.
    string opt_out_date?;
    # The reason, as provided by the contact, that they unsubscribed/opted-out of receiving email campaigns.
    @constraint:String {maxLength: 255}
    string opt_out_reason?;
    # Indicates if the contact confirmed their email address after they subscribed to receive emails. Possible values: pending, confirmed, off.
    string confirm_status?;
};

public type CampaignStatsQueryResultEmail record {
    # An array of errors indicating any partial failures in the query.
    StatsError[] errors?;
    # An array of results listing statistics for each requested <code>campaign_id</code>.
    CampaignStatsResultGenericStatsEmailPercentsEmail[] results?;
};

public type ActivityErrors record {
    # Message describing the error condition.
    string message?;
};

public type WebhooksTestSend record {
    # Identifies the topic using an integer to indicate the type of topic.
    int topic_id?;
    # The webhook callback URI. Constant Contact automatically sends POST requests to this URI to notify you about the topic.
    string hook_uri?;
    # The name of the topic.
    string topic_name?;
    # A description of what the topic is and when Constant Contact notifies you concerning it. When you use the test send API method, Constant Contact will immediately send a test event to you.
    string topic_description?;
};

# Use this endpoint to retrieve (GET), update (PUT), or DELETE an existing contact resource specified using the <code>contact_id</code> path parameter.
public type Contactresource2 record {
    # Unique ID for each contact resource
    string contact_id?;
    # A contact subresource describing the contact's email_address.
    EmailAddress email_address?;
    # The first name of the contact.
    @constraint:String {maxLength: 50}
    string first_name?;
    # The last name of the contact.
    @constraint:String {maxLength: 50}
    string last_name?;
    # The job title of the contact.
    @constraint:String {maxLength: 50}
    string job_title?;
    # The name of the company where the contact works.
    @constraint:String {maxLength: 50}
    string company_name?;
    # The month value for the contact's birthday. Valid values are from 1 through 12. You must use this property with <code>birthday_month</code>.
    int birthday_month?;
    # The day value for the contact's birthday. Valid values are from 1 through 12. You must use this property with <code>birthday_day</code>.
    int birthday_day?;
    # The anniversary date for the contact. For example, this value could be the date when the contact first became a customer of an organization in Constant Contact. Valid date formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D,M-D-YYYY, or M-DD-YYYY.
    @constraint:String {maxLength: 10}
    string anniversary?;
    # Identifies who last updated the contact; valid values are Contact or Account
    string update_source?;
    # Describes who added the contact; valid values are <code>Contact</code> or <code>Account</code>. Your integration must accurately identify <code>create_source</code> for compliance reasons; value is set when contact is created.
    string create_source?;
    # System generated date and time that the resource was created, in ISO-8601 format.
    string created_at?;
    # System generated date and time that the contact was last updated, in ISO-8601 format.
    string updated_at?;
    # For deleted contacts (<code>email_address</code> contains <code>opt_out_source</code> and <code>opt_out_date</code>), shows the date of deletion.
    string deleted_at?;
    # Array of up to 25 <code>custom_field</code> key value pairs.
    @constraint:Array {maxLength: 25}
    ContactCustomField[] custom_fields?;
    # Array of phone_numbers subresources. A contact can have up to 2 phone numbers.
    @constraint:Array {maxLength: 2}
    PhoneNumber[] phone_numbers?;
    # Array of street_addresses subresources. A contact can have 1 street address.
    @constraint:Array {maxLength: 1}
    StreetAddress[] street_addresses?;
    # Array of list_id's to which the contact is subscribed, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] list_memberships?;
    # Array of tags (<code>tag_id</code>) assigned to the contact, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] taggings?;
    # An array of up to 150 notes about the contact.
    @constraint:Array {maxLength: 150}
    Note[] notes?;
};

public type ContactDelete record {
    # Specify up to 500 contacts by <code>contact_id</code> to delete; mutually exclusive with <code>list_ids</code>.
    @constraint:Array {maxLength: 500}
    string[] contact_ids?;
    # The contacts on the lists (up to 50) specified will be deleted; mutually exclusive with <code>contact_ids</code>.
    @constraint:Array {maxLength: 50}
    string[] list_ids?;
};

public type Paginglinks2 record {
    # Links_2
    Links2 next?;
};

public type Next record {
};

# A note about the contact.
public type Note record {
    # The ID that uniquely identifies the note (UUID format).
    string note_id?;
    # The date that the note was created.
    string created_at?;
    # The content for the note.
    @constraint:String {maxLength: 2000}
    string content?;
};

public type Link2 record {
    string href?;
};

# Specifies client billing plan details including the type of plan, the plan tiers used, the current billing status, and the day of the month that the client is billed. When a client account is first provisioned, the `plan_type` defaults to a `Trial` account. After you change an account `billing_status` from `Trial` to any other `billing_status`, you cannot change it back to a `Trial` account.
public type PlanTiersObject record {
    # The billing plan that is associated with a client's Constant Contact account. The billing plan determines which Constant Contact product features that the client account can access. <ul>
    #   <li><code>TRIAL</code>: A non-billed account with an expiration date that allows clients to try limited Constant Contact product features.</li>
    #   <li><code>GOOD</code>: A billed <b>Email</b> client account plan.</li>
    #   <li><code>BETTER</code>: A billed <b>Email Plus</b> client account plan.</li>
    #   <li><code>BEST</code>: A billed <b>Personal Marketer</b> client account plan.</li>
    #   <li><code>LITE</code>: A <b>Website Builder</b> client account plan.</li>
    # </ul>
    string plan_type?;
    # Lists the billing plan tiers that are currently associated with a client account.
    TierObject[] current_tiers?;
    # The client's account billing status. When you first create a client account the <code>billing_status</code> defaults to <code>Trial</code>. Billing status values include:
    #   <ul>
    #     <li><code>Trial</code> - A non-paying trial client account (default value).</li>
    #     <li><code>Open</code> - An active and paying client account.</li>
    #     <li><code>Canceled</code> - A canceled client account.</li>
    #     <li><code>Trial End</code> - The trial period has ended for this client account.</li>
    #   </ul>
    string billing_status?;
    # This property is required when an account is not set up to use single billing. For trial accounts, the value is intially set to <code>null</code>. The value can only be changed when changing the <code>plan_type</code> from a trial account to a different type of plan, otherwise the value you enter is ignored. You can choose to enter a specific day of month or except the default value, which is the day that the <code>plan_type</code> value changes from a trial account plan to a different plan. Valid <code>billing_day_of_month</code> values include <code>1</code> through and including <code>31</code>.
    int billing_day_of_month?;
};

public type OpensTrackingActivitiesPage record {
    # Lists contacts that opened the specified <code>campaign_activity_id</code>.
    OpensTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links?;
};

public type DidNotOpensTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies an email campaign activity.
    string campaign_activity_id;
    # The type of tracking activity that is associated with this <code>campaign_activity_id</code> and used for reporting purposes.
    string tracking_activity_type;
    # The email address used to send the email campaign activity to a contact.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The date and time that the contact was sent the email campaign activity.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

# Specifies the date and time a client requests to cancel their Constant Contact account and changes the account `billing_status` to `Canceled`. By default, this is the current date and time in ISO format. In the request body, you can optionally specify a future cancellation date (in ISO format) and a reason (`reason_code`) that the client wants to cancel their account.
public type AccountCancellation record {
    # Specifies the reason that the client is canceling their Constant Contact account as follows:
    #   <ul>
    #     <li><code>1</code>  Cost Too High</li>
    #     <li><code>2</code>  Using A Competitive Service</li>
    #     <li><code>3</code>  Not Doing Email Marketing</li>
    #     <li><code>11</code> Something Missing Or Not Working </li>
    #     <li><code>12</code> Doing It In-House</li>
    #     <li><code>14</code> Poor Results</li>
    #     <li><code>21</code> Too Difficult To Use</li>
    #     <li><code>27</code> Canceled Online by Customer</li>
    #     <li><code>30</code> Dissatisfied With Billing Policies</li>
    #   </ul>
    int reason_id?;
    # The client account cancellation date and time in ISO-8601 format.
    string effective_date?;
};

public type EmailscheduleresponseInner record {
    # The date when Constant Contact will send the email campaign activity to contacts in ISO-8601 format. For example, <code>2022-05-17</code> and <code>2022-05-17T16:37:59.091Z</code> are valid dates.
    string scheduled_date?;
};

# Link
public type Link record {
    # Link
    string href?;
};

public type WebhooksSubscriptionResponse record {
    # Identifies the topic using an integer to indicate the type of topic.
    int topic_id?;
    # Your webhook callback URI. Constant Contact automatically sends POST requests to this URI to notify you about the topic.
    string hook_uri?;
    # The name of the topic.
    string topic_name?;
    # A description of what the topic is and when Constant Contact notifies you concerning it.
    string topic_description?;
};

# Activity status
public type ActivityStatus record {
    # The total number of items to be processed.
    int items_total_count?;
    # The number of items processed in the activity request.
    int items_completed_count?;
    # The total number of contacts in an import contacts request.
    int person_count?;
    # The number of non-correctable errors encountered during an import contacts request.
    int error_count?;
    # The number of correctable errors. Correctable errors are: invalid email address format, birthday or anniversary format error, or does not have minimal contact information (no name or email address). Correctable errors are available in the product UI to correct.
    int correctable_count?;
    # The number of contacts that cannot be added to a list because they were previously unsubscribed, valid for contacts_file_ or json_import requests.
    int cannot_add_to_list_count?;
    # The number of lists processed in an add_ or remove_list_membership activity request.
    int list_count?;
};

public type AccountEmails AccountemailsInner[];

# Provides the status for the requested activity.
public type ActivityTaggingStatus record {
    # The total number of items processed for the requested activity.
    int items_total_count?;
    # The total number of items for which processing completed for the requested activity.
    int items_completed_count?;
};

# The contact's email address and related properties.
public type EmailAddressPut record {
    # The email address of the contact. The email address must be unique for each contact.
    @constraint:String {maxLength: 80}
    string address;
    # Identifies the type of permission that the Constant Contact account has to send email to the contact. Types of permission: explicit, implicit, not_set, pending_confirmation, temp_hold, unsubscribed.
    string permission_to_send?;
    # Date and time that the email_address was created, in ISO-8601 format. System generated.
    string created_at?;
    # Date and time that the email_address was last updated, in ISO-8601 format. System generated.
    string updated_at?;
    # Date and time that the email_address was opted-in to receive email from the account, in ISO-8601 format. System generated.
    string opt_in_date?;
    # Describes the source of the unsubscribed/opt-out action: either Account or Contact. If the Contact opted-out, then the account cannot send any campaigns to this contact until the contact opts back in. If the Account, then the account can add the contact back to any lists and send to them. Displayed only if contact has been unsubscribed/opt-out.
    string opt_out_source?;
    # Date and time that the contact unsubscribed/opted-out of receiving email from the account, in ISO-8601 format. Displayed only if contact has been unsubscribed/opt-out. System generated.
    string opt_out_date?;
    # The reason, as provided by the contact, that they unsubscribed/opted-out of receiving email campaigns.
    @constraint:String {maxLength: 255}
    string opt_out_reason?;
    # Indicates if the contact confirmed their email address after they subscribed to receive emails. Possible values: pending, confirmed, off.
    string confirm_status?;
};

public type CustomerPhysicalAddress record {
    # Line 1 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line1;
    # Line 2 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line2?;
    # Line 3 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line3?;
    # The city where the organization is located.
    string city;
    # The two letter ISO 3166-1 code for the organization's state and only used if the <code>country_code</code> is <code>US</code> or <code>CA</code>. If not, exclude this property from the request body.
    @constraint:String {maxLength: 2}
    string state_code?;
    # Use if the state where the organization is physically located is not in the United States or Canada. If  <code>country_code</code> is  <code>US</code> or <code>CA</code>, exclude this property from the request body.
    string state_name?;
    # The postal code address (ZIP code) of the organization. This property is required if the <code>state_code</code> is <code>US</code> or <code>CA</code>, otherwise exclude this property from the request body.
    string postal_code?;
    # The two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> for the organization's country.
    string country_code;
};

# Link to the activity status to use in tracking the request status.
public type ActivitydeletelistresponseLinksSelf record {
    # Link to the activity status to use in tracking the request
    string href?;
};

public type SegmentsDTO record {
    # Lists all segments for the account.
    SegmentMaster[] segments;
    Links _links?;
};

public type SendsTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies an email campaign activity.
    string campaign_activity_id;
    # The type of tracking activity that is associated with this <code>campaign_activity_id</code> and used for reporting purposes.
    string tracking_activity_type;
    # The email address used to send the email campaign activity to a contact.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The date and time that you sent the email campaign to the contact.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

public type ContactCampaignActivitiesSummary record {
    # Unique id of the contact that will have their activity summarized.
    string contact_id;
    # A summary of all the actions for a contact.
    CampaignActivitySummary[] campaign_activities;
    # Links_2
    Links2 _links?;
};

public type StreetAddressPut record {
    # Describes the type of address; valid values are home, work, or other.
    string kind;
    # Number and street of the address.
    @constraint:String {maxLength: 255}
    string street?;
    # The name of the city where the contact lives.
    @constraint:String {maxLength: 50}
    string city?;
    # The name of the state or province where the contact lives.
    @constraint:String {maxLength: 50}
    string state?;
    # The zip or postal code of the contact.
    @constraint:String {maxLength: 50}
    string postal_code?;
    # The name of the country where the contact lives.
    @constraint:String {maxLength: 50}
    string country?;
};

public type ContactCreateOrUpdateResponse record {
    # The unique identifier for the contact that the V3 API created or updated.
    string contact_id?;
    # Identifies if the V3 API created a new contact or updated an existing contact.
    string action?;
};

# A page of tracking activities for a contact that can include sends,
# opens, clicks, bounces, opt-outs and forwards to a friend. If it exists, a
# link to the next page of tracking activities is provided.
public type ContactTrackingActivitiesPage record {
    # The list of contact tracking activities in descending date order.
    ContactTrackingActivity[] tracking_activities?;
    # Links_2
    Links2 _links?;
};

public type BouncesTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies the email campaign activity.
    string campaign_activity_id;
    # The type of email tracking activity, <code>em_bounces</code>, that this report includes.
    string tracking_activity_type;
    # The contact's email address that was used when the email campaign activity bounced.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The one-character string used to specify the reason for the email bounce. Valid codes include:
    # 
    # <ul><li><code>B</code> - Non-existent address; the contact's Internet Service Provider (ISP) indicates that the email address doesn't exist.</li>
    # 
    # <li><code>D</code> - Undeliverable; after repeated delivery attempts, no response was received from the contact's ISP.</li>
    # 
    # <li><code>F</code> - Full; the contact's mailbox is full.</li>
    # 
    # <li><code>S</code> - Suspended; the contact's address was reported as non-existent by the ISP and is suspended from delivery.</li>
    # 
    # <li><code>V</code> - Vacation/autoreply; the contact set an autoreply, but the message was delivered.</li>
    # 
    # <li><code>X</code> - Other; the contact's ISP specified another reason that the message cannot be delivered.</li>
    # 
    # <li><code>Z</code> - Blocked; the recipient's ISP chose not to deliver the email. For example, the ISP may have flagged the email as spam.</li></ul>
    string bounce_code;
    # The contact's most current email address. If <code>email_address</code> was updated after the email bounce activity occurred, <code>current_ email_address</code> displays the updated address. If updates were not made to <code>email_address</code>, the <code>email_address</code> and <code>current_email_address</code> are the same.
    string current_email_address?;
    # The date and time that the email bounce tracking activity occurred.
    string created_time;
    # If applicable, the date when the contact was deleted.
    string deleted_at?;
};

# The contact's email address and related properties.
public type EmailAddressPost record {
    # The contact's email address
    @constraint:String {maxLength: 80}
    string address;
    # Identifies the type of permission that the Constant Contact account has been granted to send email to the contact. Types of permission: explicit, implicit, not_set, pending_confirmation, temp_hold, unsubscribed.
    string permission_to_send?;
};

# Status
public type ActivitydeletestatusStatus record {
    # The number of lists if request specifies contacts to delete by list_ids.
    int list_count?;
    # The total number of contacts to delete.
    int items_total_count?;
    # The number of contacts deleted.
    int items_completed_count?;
};

# Activity status for contacts_json_import and contacts_file_import activities
public type ActivityImport record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Name of the file used for an file_import activity.
    string source_file_name?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    # Status
    ActivityimportStatus status?;
    # Activity status link
    ActivityStatusLink _links?;
};

public type Provision record {
    # A valid email address to associate with the client account.
    @constraint:String {maxLength: 80}
    string contact_email;
    # The contact phone number to associate with the client account.
    @constraint:String {maxLength: 25, minLength: 5}
    string contact_phone?;
    # The two-letter country code (ISO 3166-1 code) that specifies the country in which the client resides.
    @constraint:String {maxLength: 3, minLength: 2}
    string country_code;
    # The name of organization that identifies the client account.
    @constraint:String {maxLength: 50, minLength: 1}
    string organization_name?;
    # The organization phone number. To set the organization phone number using the user interface, select <b>My Settings</b> and in the <b>Organization Information</b> section, select <b>Edit Organization Information</b>.
    @constraint:String {maxLength: 25, minLength: 5}
    string organization_phone?;
    # The two-letter state code that represents the US state (<code>country_code</code> is <code>US</code> ) or Canadian province (<code>country_code</code> is <code>CA</code>) where the client's organization is physically located. Leave the <code>state_code</code> blank for non-US states and Canadian provinces.
    string state_code;
    # The offical time zone to use to represent the physical location associated with the client account.
    string time_zone_id?;
    # The client's website URL. Specifying the website URL eliminates the need for clients to provide that information. Requires a valid URL starting with http:// or https://.
    string website?;
    # A unique login name to associate with the client account. The name must only contain alphanumeric characters and '-', '_', '@','.','+'. 
    @constraint:String {maxLength: 50, minLength: 6}
    string login_name;
    # Required if not using Single Sign On (SSO) or external authenticator. The password to associate with the client account. Passwords must be a minimum of six characters in length and have no spaces. The password is not returned in the response payload for security reasons. If using SSO authentication, use <code>external_provider</code> and <code>external_id</code> instead of <code>password</code>.
    @constraint:String {maxLength: 80, minLength: 6}
    string password?;
    # The client account owner's first name.
    @constraint:String {maxLength: 80, minLength: 2}
    string first_name?;
    # The client account owner's last name.
    @constraint:String {maxLength: 80, minLength: 2}
    string last_name?;
    # The unique client account identifier that partners define and use for billing and reporting purposes.
    @constraint:String {maxLength: 80}
    string partner_account_id?;
    # The currency to use when billing the client account. Valid values are: <code>en_US</code> (default, US Dollars) or <code>en_GB</code> (British Pounds).
    string billing_locale?;
    # By default, if the client account is setup as a managed account <code>managed_site_owner</code> is automatically set to <code>true</code> and attempting to override the setting with <code>false</code> is ignored. This helps to avoid getting an account into an unknown state.
    boolean managed_site_owner?;
    # If a partner account is setup to allow for single billing and the <code>managed_site_owner</code> property is set to <code>true</code>, use this property to enable the single billing feature for the client account. See your account manager for more information.
    boolean enable_single_billing?;
    # When creating accounts for users who have opted-out of any marketing communications, set  the <code> gdpr_opt_out</code>  to <code>true</code>  so that Constant Contact does not send any marketing communications to the account.
    boolean gdpr_opt_out?;
    # The ID used to uniquely identify the client account for the external authenticator. Do not use the <code>password</code> property when using an external authenticator.
    @constraint:String {maxLength: 255}
    string external_id?;
    # The name of the provider who externally authenticates this customer. For example, PayPal or Yahoo. Do not use the <code>password</code> property when using an external authenticator.
    @constraint:String {maxLength: 80}
    string external_provider?;
};

# Activity status link
public type ActivityStatusLink record {
    # HATEOS-style link to the activity status (this object).
    ActivitystatusexportlinkSelf self?;
};

public type WebhooksSubscriptionPutResp record {
    # Identifies the topic using an integer to indicate the type of topic.
    int topic_id?;
    # Your webhook callback URI. Constant Contact automatically sends POST requests to this URI to notify you about the topic.
    string hook_uri?;
};

# The link returned in the response that you use to retrieve the status for the specified activity.
public type Activitylinks2Self record {
    # The link returned in the response that you use to retrieve the status for the specified activity
    string href?;
};

public type ActivitydeletelistresponseLinks record {
    # Link to the activity status to use in tracking the request status.
    ActivitydeletelistresponseLinksSelf self?;
};

# The <code>source</code> object specifies which contacts to remove from your targeted lists using one of three mutually exclusive properties.
public type ListactivityremovecontactsSource record {
    # Specifies which contacts to remove from your target lists as an array of up to 50 contact <code>list_id</code> values. This property is mutually exclusive with <code>contact_ids</code> and <code>all_active_contacts</code>.
    @constraint:Array {maxLength: 50}
    string[] list_ids?;
    # Removes all active contacts from your targeted lists. This property is mutually exclusive with <code>contact_ids</code> and <code>list_ids</code>.
    boolean all_active_contacts?;
    # Specifies which contacts to remove from your target lists as an array of <code>contact_id</code> values. This property is mutually exclusive with <code>list_ids</code> and <code>all_active_contacts</code>.
    @constraint:Array {maxLength: 500}
    string[] contact_ids?;
};

public type CampaignActivitySummary record {
    # The unique id of the activity for an e-mail campaign.
    string campaign_activity_id;
    # The last date at which the email was sent to this contact.
    string start_on;
    # The number of times the email has bounced for this contact.
    int em_bounces;
    # The number of times this contact has clicked a link in this email.
    int em_clicks;
    # The number of times this contact has forwarded this email.
    int em_forwards;
    # The number of times this contact has opened this email.
    int em_opens;
    # The number of times the email was sent to this contact.
    int em_sends;
    # The number of times this contact has opted out.
    int em_unsubscribes;
};

public type TagIdList500Limit record {
    # The tag IDs (<code>tag_ids</code>) to delete.
    @constraint:Array {maxLength: 500}
    string[] tag_ids;
};

public type ClicksTrackingActivitiesPage record {
    # The list of click tracking activities
    ClicksTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links?;
};

# Custom fields allow Constant Contact users to add custom content to a contact that can be used to personalize emails in addition to the standard set of variables available for email personalization.
public type Customfieldresource2 record {
    # The custom_field's unique ID
    string custom_field_id?;
    # The display name for the custom_field shown in the UI as free-form text
    @constraint:String {maxLength: 50}
    string label;
    # Unique name for the custom_field constructed from the label by replacing blanks with underscores.
    @constraint:String {maxLength: 50}
    string name?;
    # Specifies the type of value the custom_field field accepts: string or date.
    string 'type;
    # System generated date and time that the resource was updated, in ISO-8601 format.
    string updated_at?;
    # Date and time that the resource was created, in ISO-8601 format. System generated.
    string created_at?;
};

public type ContactList record {
    # Unique ID for the contact list
    string list_id?;
    # The name given to the contact list
    string name?;
    # Text describing the list.
    string description?;
    # Identifies whether or not the account has favorited the contact list.
    boolean favorite?;
    # System generated date and time that the resource was created, in ISO-8601 format.
    string created_at?;
    # Date and time that the list was last updated, in ISO-8601 format. System generated.
    string updated_at?;
    # The number of contacts in the contact list.
    int membership_count?;
};

public type ForwardsTrackingActivitiesPage record {
    # The list of contacts that forwarded the specified email campaign activity. 
    ForwardsTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links?;
};

public type ContactPostRequest record {
    # The contact's email address and related properties.
    EmailAddressPost email_address?;
    # The first name of the contact.
    @constraint:String {maxLength: 50}
    string first_name?;
    # The last name of the contact.
    @constraint:String {maxLength: 50}
    string last_name?;
    # The job title of the contact.
    @constraint:String {maxLength: 50}
    string job_title?;
    # The name of the company where the contact works.
    @constraint:String {maxLength: 50}
    string company_name?;
    # Describes who added the contact; valid values are <code>Contact</code> or <code>Account</code>. Your integration must accurately identify <code>create_source</code> for compliance reasons; value is set on POST, and is read-only going forward.
    string create_source?;
    # The month value for the contact's birthday. Valid values are from 1 through 12. The <code>birthday_month</code> property is required if you use <code>birthday_day</code>.
    int birthday_month?;
    # The day value for the contact's birthday. Valid values are from 1 through 31. The <code>birthday_day</code> property is required if you use <code>birthday_month</code>.
    int birthday_day?;
    # The anniversary date for the contact. For example, this value could be the date when the contact first became a customer of an organization in Constant Contact. Valid date formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D,M-D-YYYY, or M-DD-YYYY.
    @constraint:String {maxLength: 10}
    string anniversary?;
    # Array of up to 25 <code>custom_field</code> key value pairs.
    @constraint:Array {maxLength: 25}
    ContactCustomField[] custom_fields?;
    # Array of up to 2 phone_numbers subresources.
    @constraint:Array {maxLength: 2}
    PhoneNumberPut[] phone_numbers?;
    # Array of street_addresses subresources. A contact can have 1 street address.
    StreetAddressPut[] street_addresses?;
    # Array of list_id's to which the contact is being subscribed, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] list_memberships?;
    # Array of tags (<code>tag_id</code>) assigned to the contact, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] taggings?;
    # An array of notes about the contact.
    @constraint:Array {maxLength: 150}
    Note[] notes?;
};

public type ContactcreateorupdateinputStreetAddress record {
    # The type of street address for the contact. Valid values are home, work, or other.
    string kind;
    # The number and street of the contact's address.
    @constraint:String {maxLength: 255}
    string street?;
    # The name of the city for the contact's address.
    @constraint:String {maxLength: 50}
    string city?;
    # The name of the state or province for the contact's address.
    @constraint:String {maxLength: 50}
    string state?;
    # The zip or postal code for the contact's address.
    @constraint:String {maxLength: 50}
    string postal_code?;
    # The name of the country for the contact's address.
    @constraint:String {maxLength: 50}
    string country?;
};

# Custom fields allow Constant Contact users to add custom content to a contact that can be used to personalize emails in addition to the standard set of variables available for email personalization.
public type CustomFieldResource record {
    # The custom_field's unique ID
    string custom_field_id?;
    # The display name for the custom_field shown in the UI as free-form text
    @constraint:String {maxLength: 50}
    string label;
    # Unique name for the custom_field constructed from the label by replacing blanks with underscores.
    @constraint:String {maxLength: 50}
    string name?;
    # Specifies the type of value the custom_field field accepts: string or date.
    string 'type;
    # System generated date and time that the resource was updated, in ISO-8601 format.
    string updated_at?;
    # Date and time that the resource was created, in ISO-8601 format. System generated.
    string created_at?;
};

# Use this endpoint to retrieve (GET) a collection of existing contacts, or to create (POST) a new contact.
public type Contacts record {
    # Collection of contacts
    Contactresource2[] contacts?;
    # Total number of contacts in the response.
    int contacts_count?;
    # Paging links
    PagingLinks _links?;
    # If you use the <code>segment_id</code> query parameter to filter results based on a segment, this property indicates that the V3 API accepted your request and is still processing it.
    string status?;
};

# Link to the activity status (this object) to retrieve the activity status.
public type ActivitydeletestatusLinks record {
    # Link to the activity status (this object) to retrieve the activity status.
    ActivitydeletestatusLinksSelf self?;
};

public type ActivityListsMembership record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    ActivitylistsmembershipStatus status?;
    # Activity status link
    ActivityStatusLink _links?;
};

public type EmailCampaignComplete record {
    # The unique and descriptive name that you specify for the email campaign.
    @constraint:String {maxLength: 80}
    string name;
    # The content of the email campaign as an array that contains a single email campaign activity object.
    EmailCampaignActivityInput[] email_campaign_activities;
};

public type PhoneNumber record {
    # Unique ID for the phone number
    string phone_number_id?;
    # The contact's phone number, 1 of 2 allowed per contact, no more than 25 characters
    @constraint:String {maxLength: 25}
    string phone_number?;
    # Describes the type of phone number; valid values are home, work, mobile, or other.
    string kind?;
    # Date and time that the street address was created, in ISO-8601 format. System generated.
    string created_at?;
    # Date and time that the phone_number was last updated, in ISO-8601 format. System generated.
    string updated_at?;
    # Identifies who last updated the phone_number; valid values are Contact or Account
    string update_source?;
    # Describes who added the phone_number; valid values are Contact or Account.
    string create_source?;
};

public type CrossReference record {
    # Identifies an email campaign in the V2 API.
    string v2_email_campaign_id?;
    # <p>Identifies a campaign in the V3 API. In the V3 API, each campaign contains one or more activities. For more information, see <a href="/api_guide/v3_v2_email_campaign_deltas.html" target_"blank">V3 Email Campaign Resource Changes<a/>.<p>
    string campaign_id?;
    # <p>Identifies a campaign activity in the V3 API. In the V3 API, each campaign contains one or more activities. Email type activities represent the detailed information in an email and contain properties like <code>from_email</code> and <code>from_name</code>. For more information, see <a href="/api_guide/v3_v2_email_campaign_deltas.html" target_"blank">V3 Campaign Resource Changes<a/>.<p>
    string campaign_activity_id?;
};

public type Tag record {
    # The ID that uniquely identifies a tag (UUID format)
    string tag_id?;
    # The unique tag name.
    string name?;
    # The total number of contacts who are assigned this tag.
    int contacts_count?;
    # The system generated date and time when the tag was created (ISO-8601 format).
    string created_at?;
    # The system generated date and time when the tag was last updated (ISO-8601 format).
    string updated_at?;
    # The source used to tag contacts.
    string tag_source?;
};

# Link to the activity status (this object) to retrieve the activity status.
public type ActivitydeletestatusLinksSelf record {
    # Link to the activity status (this object)
    string href?;
};

public type StatsError record {
    # The unique error key.
    string error_key?;
    # A error description.
    string error_message?;
};

public type ListXrefs record {
    # An array of cross-referenced V3 API <code>list_id</code> and V2 API <code>sequence_id</code> properties. Response is sorted ascending by <code>sequence_id</code>.
    @constraint:Array {maxLength: 500}
    ListXref[] xrefs?;
};

public type OpensTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies an email campaign activity.
    string campaign_activity_id;
    # The type of tracking activity that is associated with this <code>campaign_activity_id</code> and used for reporting purposes.
    string tracking_activity_type;
    # The email address used to send the email campaign activity to a contact.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The type of device that the contact used to open the email campaign activity.
    string device_type?;
    # The date and time that the contact opened the email campaign activity.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

public type CrossReferenceResponse record {
    # An array of objects that contain a <code>v2_email_campaign_id</code> cross-referenced with a V3 <code>campaign_id</code> and a V3 <code>campaign_activity_id</code> value.
    CrossReference[] xrefs?;
};

# HATEOS-style link to the activity status (this object).
public type ActivitystatusexportlinkSelf record {
    # HATEOS-style link to the activity status (this object)
    string href?;
};

public type ProvisionResponse record {
    # The system generated ID used to uniquely identify a client account.
    string encoded_account_id?;
    # The system generated ID used to uniquely identify the provisioning of a client account.
    string provision_uuid?;
};

public type ActivityGeneric record {
    # The ID that uniquely identifies the activity.
    string activity_id;
    # The processing state for the activity.
    string state;
    # The system generated date and time that the resource was created, in ISO-8601 format.
    string created_at?;
    # The system generated date and time that the resource was last updated, in ISO-8601 format.
    string updated_at?;
    # The percentage complete for the specified activity.
    int percent_done?;
    # An array of error messages if errors occurred for a specified activity. The system returns an empty array if no errors occur.
    ActivityErrors[] activity_errors?;
    ActivityGenericStatus status?;
    Activitylinks2 _links?;
};

public type ActivityDeleteListResponse record {
    # Unique ID for the delete list batch job
    string activity_id?;
    # The state of the delete list request: processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Date and time that the request was received, in ISO-8601 formmat.
    string created_at?;
    # Date and time that the request status was updated, in ISO-8601 format.
    string updated_at?;
    # Job completion percentage
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    ActivitydeletelistresponseLinks _links?;
};

# Activity status for contact_exports activity
public type ActivityExportStatus record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    # Status
    ActivityexportstatusStatus status?;
    # Activity status export link
    ActivityStatusExportLink _links?;
};

public type DidNotOpensTrackingActivitiesPage record {
    # Lists contacts that did not open the specified <code>campaign_activity_id</code>.
    DidNotOpensTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links?;
};

# The base contact tracking activity representing sends, opt-outs and forwards to a friend. The basic information provided is campaign activity id, tracking activity type and time the tracking activity occurred.
public type ContactTrackingActivity record {
    # The contact id.
    string contact_id;
    # The unique id of the activity for an e-mail campaign.
    string campaign_activity_id;
    # The time the tracking activity occurred
    string created_time?;
    # The type of the tracking activity (send, open, click, bounce, opt-out or forward to a friend)
    string tracking_activity_type;
};

public type AuthInfoResponse record {
    # The scopes associated with your access token as an array containing scope strings.
    string[] scopes?;
};

public type CreateOrUpdateContactCustomField record {
    # The unique ID for the <code>custom_field</code>.
    string custom_field_id?;
    # The value of the <code>custom_field</code>.
    @constraint:String {maxLength: 255}
    string value?;
};

public type PaginationLinks record {
    Link2 next?;
};

public type ContactCreateOrUpdateInput record {
    # The email address for the contact. This method identifies each unique contact using their email address. If the email address exists in the account, this method updates the contact. If the email address is new, this method creates a new contact.
    @constraint:String {maxLength: 50}
    string email_address;
    # The first name of the contact.
    @constraint:String {maxLength: 50}
    string first_name?;
    # The last name of the contact.
    @constraint:String {maxLength: 50}
    string last_name?;
    # The job title of the contact.
    @constraint:String {maxLength: 50}
    string job_title?;
    # The name of the company where the contact works.
    @constraint:String {maxLength: 50}
    string company_name?;
    # The phone number for the contact.
    @constraint:String {maxLength: 25}
    string phone_number?;
    # The contact lists you want to add the contact to as an array of up to 50 contact <code>list_id</code> values. You must include at least one <code>list_id</code>.
    @constraint:Array {maxLength: 50, minLength: 1}
    string[] list_memberships;
    # The custom fields you want to add to the contact as an array of up to 50 custom field objects.
    @constraint:Array {maxLength: 50}
    CreateOrUpdateContactCustomField[] custom_fields?;
    # The anniversary date for the contact. For example, this value could be the date when the contact first became a customer of an organization in Constant Contact. Valid date formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D,M-D-YYYY, or M-DD-YYYY.
    string anniversary?;
    # The month value for the contact's birthday. Valid values are from 1 through 12. The <code>birthday_month</code> property is required if you use <code>birthday_day</code>.
    int birthday_month?;
    # The day value for the contact's birthday. Valid values are from 1 through 31. The <code>birthday_day</code> property is required if you use <code>birthday_month</code>.
    int birthday_day?;
    ContactcreateorupdateinputStreetAddress street_address?;
};

public type ActivitylinksSelf record {
    string href?;
};

public type UserprivilegesresourceInner record {
    # Identifies a user privilege in Constant Contact.
    int privilege_id?;
    # The name of the Constant Contact user privilege.
    string privilege_name?;
};

public type ActivitylistsmembershipStatus record {
    # Total number of contacts to add to or remove from lists.
    int items_total_count?;
    # The number of contacts processed.
    int items_completed_count?;
    # The number of lists specified in the request.
    int list_count?;
};

public type ContactPutRequest record {
    # The contact's email address and related properties.
    EmailAddressPut email_address?;
    # The contact's first name
    @constraint:String {maxLength: 50}
    string first_name?;
    # The contact's last name
    @constraint:String {maxLength: 50}
    string last_name?;
    # The contact's job title
    @constraint:String {maxLength: 50}
    string job_title?;
    # Name of the company the contact works for.
    @constraint:String {maxLength: 50}
    string company_name?;
    # Accepts values from 1-12; must be used with <code>birthday_day</code>
    int birthday_month?;
    # Accepts values from 1-31; must be used with <code>birthday_month</code>
    int birthday_day?;
    # The anniversary date; Accepted formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D, MM-DD-YYYY, M-D-YYYY
    @constraint:String {maxLength: 10}
    string anniversary?;
    # Identifies who last updated the contact; valid values are <code>Contact</code> or <code>Account</code>.
    string update_source;
    # Array of up to 25 custom_field subresources.
    @constraint:Array {maxLength: 25}
    ContactCustomField[] custom_fields?;
    # Array of up to 2 phone_numbers subresources.
    @constraint:Array {maxLength: 2}
    PhoneNumberPut[] phone_numbers?;
    # Array of street_addresses subresources. A contact can have 1 street address.
    StreetAddressPut[] street_addresses?;
    # Array of up to 50 <code>list_ids</code> to which the contact is subscribed.
    @constraint:Array {maxLength: 50}
    string[] list_memberships?;
    # Array of tags (<code>tag_id</code>) assigned to the contact, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] taggings?;
    # An array of notes about the contact listed by most recent note first.
    @constraint:Array {maxLength: 150}
    Note[] notes?;
};

# Status
public type ActivityexportstatusStatus record {
    # The total number of contacts to export.
    int items_total_count?;
    # The number of contacts processed for export.
    int items_completed_count?;
};

public type EmailCampaignActivity record {
    # Identifies a campaign activity in the V3 API.
    string campaign_activity_id?;
    # Identifies a campaign in the V3 API.
    string campaign_id?;
    # The purpose of the individual campaign activity in the larger email campaign effort. Valid values are: <ul>
    #   <li>primary_email — The main email marketing campaign that you send to contacts. The <code>primary_email</code> contains the complete email content.</li>
    #   <li>permalink — A permanent link to a web accessible version of the <code>primary_email</code> content without any personalized email information. For example, permalinks do not contain any of the contact details that you add to the <code>primary_email</code> email content. </li>
    #   <li>resend — An email campaign that you resend to contacts that did not open the email campaign.</li>
    # </ul> Constant Contact creates a <code>primary_email</code> and a <code>permalink</code> role campaign activity when you create an email campaign.
    string role?;
    # The contacts that Constant Contact sends the email campaign activity to as an array of contact <code>list_id</code> values. You cannot use contact lists and segments at the same time in an email campaign activity.
    string[] contact_list_ids?;
    # The contacts that Constant Contact sends the email campaign activity to as an array containing a single <code>segment_id</code> value. Only <code>format_type</code> 3, 4, and 5 email campaign activities support segments. You cannot use contact lists and segments at the same time in an email campaign activity.
    int[] segment_ids?;
    # The current status of the email campaign activity. Valid values are: <ul>
    #   <li>DRAFT — An email campaign activity that you have created but have not sent to contacts.</li>
    #   <li>SCHEDULED — An email campaign activity that you have scheduled for Constant Contact to send to contacts.</li>
    #   <li>EXECUTING — An email campaign activity Constant Contact is currently sending to contacts. Email campaign activities are only in this status briefly.</li>
    #   <li>DONE — An email campaign activity that you successfully sent to contacts.</li>
    #   <li>ERROR — An email campaign activity that encountered an error.</li>
    #   <li>REMOVED — An email campaign that a user deleted. Users can view and restore deleted emails through the UI.</li>
    # </ul>
    string current_status?;
    # Identifies the type of email format. Valid values are: <ul>
    #   <li>1 - A legacy custom code email created using the V2 API, the V3 API, or the legacy UI HTML editor.</li>
    #   <li>2 - An email created using the second generation email editor UI.</li>
    #   <li>3 - An email created using the third generation email editor UI. This email editor features an improved drag and drop UI and mobile responsiveness.</li>
    #   <li>4 - An email created using the fourth generation email editor UI.</li>
    #   <li>5 - A custom code email created using the V3 API or the new UI HTML editor.</li>
    # </ul>
    int format_type?;
    # The email "From Email" field for the email campaign activity. You must use a confirmed Constant Contact account email address. Make a GET call to <code>/account/emails</code> to return a collection of account emails and their confirmation status.
    string from_email;
    # The email "From Name" field for the email campaign activity.
    string from_name;
    # The email "Reply To Email" field for the email campaign activity. You must use a confirmed Constant Contact account email address. Make a GET call to <code>/account/emails</code> to return a collection of account emails and their confirmation status.
    string reply_to_email;
    # The email "Subject" field for the email campaign activity.
    string subject;
    # The HTML or XHTML content for the email campaign activity. Only <code>format_type</code> 1 and 5 (legacy custom code emails or modern custom code emails) can contain <code>html_content</code>.
    string html_content?;
    # Identifies the email layout and design template that the email campaign activity is using as a base.
    string template_id?;
    # The permanent link to a web accessible version of the email campaign content without any personalized email information. The permalink URL becomes accessible after you send an email campaign to contacts.
    string permalink_url?;
    # The email preheader for the email campaign activity. Only <code>format_type</code> 3, 4, and 5 email campaign activities use the preheader property.
    string preheader?;
    EmailPhysicalAddress physical_address_in_footer?;
    # An object that contains optional properties for legacy format type emails (<code>format_type</code> 1 and 2). If you attempt to add a property that does apply to the email <code>format_type</code>, the API will ignore the property.
    EmailcampaignactivityDocumentProperties document_properties?;
};

# Specifies the type of billing plan (`plan_type`) and the billing date (`billing_day_of_month`) used for a client account.
public type PlanInfo record {
    # The type of billing plan (<code>plan_type</code>) to associate with a client's Constant Contact account. The type of billing plan determines which Constant Contact product features that the client account can access. The billing plan type that you enter must already exist in your plan group or a 400 error message is returned. After changing the <code>plan_type</code> from <code>TRIAL</code> to any other billing plan type, you cannot change it back to <code>TRIAL</code>.
    #   <ul>
    #     <li><code>TRIAL</code>: A non-billed account with an expiration date that allows clients to try Constant Contact product features.</li>
    #     <li><code>GOOD</code>: A billed <b>Email</b> client account plan.</li>
    #     <li><code>BETTER</code>: A billed <b>Email Plus</b> client account plan.</li>
    #     <li><code>BEST</code>: A billed <b>Personal Marketer</b> client account plan.</li>
    #     <li><code>LITE</code>: A <b>Website Builder</b> client account plan.</li>
    #   </ul>
    string plan_type?;
    # This property is required if a client account is not set up to use single billing. You can choose to enter a specific day of the month or accept the default value, which is the day on which the <code>plan_type</code> value changes from a <code>TRIAL</code> plan to a different <code>plan_type</code>. For trial accounts, the value defaults to null. You can only change the <code>billing_day_of_month</code> when changing the <code>plan_type</code> value from <code>TRIAL</code> to a different <code>plan_type</code>, otherwise the value you enter is ignored.
    int billing_day_of_month?;
};

public type UniqueEmailCounts record {
    # The total number of unique sends.
    int sends;
    # The total number of unique opens.
    int opens;
    # The total number of unique clicks.
    int clicks;
    # The total number of unique forwards.
    int forwards;
    # The total number of unique optouts (unsubscribes).
    int optouts;
    # The total number of unique abuse count (spam).
    int abuse;
    # The total number of unique bounce count.
    int bounces;
    # The total number of unique non-opens
    int not_opened;
};

public type SegmentName record {
    # The segment's unique descriptive name.
    string name;
};

public type OptoutsTrackingActivitiesPage record {
    # The list of opt-out tracking activities
    OptoutsTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links;
};

public type SendsTrackingActivitiesPage record {
    # Lists the contacts to which the email campaign activity (<code>campaign_activity_id</code>) was sent.
    SendsTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links?;
};

# An object that contains optional properties for legacy format type emails (<code>format_type</code> 1 and 2). If you attempt to add a property that does apply to the email <code>format_type</code>, the API will ignore the property.
public type EmailcampaignactivityDocumentProperties record {
    # Contains style sheet elements for XHTML letter format emails. This property applies only to <code>format_type</code> 1.
    @constraint:String {maxLength: 150000}
    string style_content?;
    # Email message format. Valid values are <code>HTML</code> and <code>XHTML</code>. By default, the value is <code>HTML</code>. For more information, see the <a href="http://www.constantcontact.com/display_media.jsp?id=87" target="_blank">Advanced Editor User's Guide</a>. This property applies only to <code>format_type</code> 1. You cannot change this property after you create an email.
    string letter_format?;
    # The greeting used in the email message. This property applies only to <code>format_type</code> 1.
    @constraint:String {maxLength: 50}
    string greeting_salutation?;
    # The type of name the campaign uses to greet the contact. Valid values are <code>F</code> (First Name), <code>L</code> (Last Name), <code>B</code> (First and Last Name), or <code>N</code> (No greeting). By default, the value is <code>N</code>. This property applies only to <code>format_type</code> 1.
    string greeting_name_type?;
    # A fallback text string the campaign uses to greet the contact when the <code>greeting_name_type</code> is not available or set to <code>N</code>. This property applies only to <code>format_type</code> 1.
    @constraint:String {maxLength: 1500}
    string greeting_secondary?;
    # If <code>true</code>, the email footer includes a link for subscribing to the list. If <code>false</code>, the message footer does not include a link for subscribing to the list. By default, the value is <code>false</code>. This property applies only to <code>format_type</code> 1.
    string subscribe_link_enabled?;
    # The text displayed as the name for the subscribe link in the email footer. This property applies only to <code>format_type</code> 1.
    @constraint:String {maxLength: 80}
    string subscribe_link_name?;
    # Contains the text content that Constant Contact displays to contacts when their email client cannot display HTML email. If you do not specify text content, Constant Contact displays "Greetings!" as the text content. This property applies only to <code>format_type</code> 1.
    @constraint:String {maxLength: 150000}
    string text_content?;
    # If <code>true</code>, Constant Contact displays your <code>permission_reminder</code> message to contacts at top of the email. If <code>false</code>, Constant Contact does not display the message. By default, the value is <code>false</code>. This property applies to <code>format_type</code> 1 and 2.
    string permission_reminder_enabled?;
    # The message text Constant Contact displays at the top of the email message to remind users that they are subscribed to an email list. This property applies to <code>format_type</code> 1 and 2.
    @constraint:String {maxLength: 1500}
    string permission_reminder?;
    # If <code>true</code>, Constant Contact displays the view as web page email message. If <code>false</code> Constant Contact does not display the message. By default, the value is <code>false</code>. This property applies to <code>format_type</code> 1 and 2.
    string view_as_webpage_enabled?;
    # The text Constant Contact displays before the view as web page link at the top of the email. This property applies to <code>format_type</code> 1 and 2.
    @constraint:String {maxLength: 50}
    string view_as_webpage_text?;
    # The name of the link that users can click to view the email as a web page. This property applies to <code>format_type</code> 1 and 2.
    string view_as_webpage_link_name?;
    # If <code>true</code>, when the user forwards an email message the footer includes a link for subscribing to the list. If <code>false</code>, when a user forwards an email message the footer does not include a link for subscribing to the list. By default, the value is <code>false</code>. This property applies to <code>format_type</code> 1 and 2.
    string forward_email_link_enabled?;
    # The text displayed as the name for the forward email link in the footer when a user forwards an email. This property applies to <code>format_type</code> 1 and 2.
    @constraint:String {maxLength: 80}
    string forward_email_link_name?;
};

# Activity status for contact_delete activity
public type ActivityDeleteStatus record {
    # Unique ID for the activity.
    string activity_id?;
    # The state of the request: initialized - request has been received processing - request is being processed completed - job completed cancelled - request was cancelled failed - job failed to complete timed_out - the request timed out before completing
    string state?;
    # Timestamp showing when we began processing the activity request, in ISO-8601 format.
    string started_at?;
    # Timestamp showing when we completed processing the activity, in ISO-8601 format.
    string completed_at?;
    # Timestamp showing when we created the activity, in ISO-8601 format.
    string created_at?;
    # Timestamp showing when we last updated the activity, in ISO-8601 format.
    string updated_at?;
    # Shows the percent done for an activity that we are still processing.
    int percent_done?;
    # Array of messages describing the errors that occurred.
    string[] activity_errors?;
    # Status
    ActivitydeletestatusStatus status?;
    # Link to the activity status (this object) to retrieve the activity status.
    ActivitydeletestatusLinks _links?;
};

public type ContactsJsonImport record {
    # An array containing the contacts to import.
    JsonImportContact[] import_data;
    # Specify which contact lists you are adding all imported contacts to as an array of up to 50 contact <code>list_id</code> string values.
    @constraint:Array {maxLength: 50, minLength: 1}
    string[] list_ids;
};

public type CompanyLogo record {
    # The internal URL used to get the company logo image file hosted locally in your account's MyLibrary.
    string url?;
    # The external URL used to get the company logo image file that is hosted on an external website.
    string external_url?;
    # The internal ID used to identify the image hosted in your account's MyLibrary.
    string internal_id?;
};

public type EmailCampaign record {
    # Lists the role and unique activity ID of each campaign activity that is associated with an Email Campaign.
    ActivityReference[] campaign_activities?;
    # The unique ID used to identify the email campaign (UUID format).
    string campaign_id?;
    # The system generated date and time that this email campaign was created. This string is readonly and is in ISO-8601 format.
    string created_at?;
    # The current status of the email campaign. Valid values are: <ul>
    #   <li>Draft — An email campaign that you have created but have not sent to contacts.</li>
    #   <li>Scheduled — An email campaign that you have scheduled for Constant Contact to send to contacts.</li>
    #   <li>Executing — An email campaign that Constant Contact is currently sending to contacts. Email campaign activities are only in this status briefly.</li>
    #   <li>Done — An email campaign that you successfully sent to contacts.</li>
    #   <li>Error — An email campaign activity that encountered an error.</li>
    #   <li>Removed — An email campaign that a user deleted. Users can view and restore deleted emails through the UI.</li>
    # </ul>
    string current_status?;
    # The descriptive name the user provides to identify this campaign. Campaign names must be unique for each account ID.
    @constraint:String {maxLength: 80}
    string name?;
    # Identifies the type of campaign that you select when creating the campaign. Newsletter and Custom Code email campaigns are the primary types.
    string 'type?;
    # The code used to identify the email campaign `type`. <ul>
    #   <li> 1  (Default) </li>
    #   <li> 2  (Bulk Email) </li>
    #   <li> 10 (Newsletter) </li>
    #   <li> 11 (Announcement) </li>
    #   <li> 12 (Product/Service News) </li>
    #   <li> 14 (Business Letter) </li>
    #   <li> 15 (Card) </li>
    #   <li> 16 (Press release)</li>
    #   <li> 17 (Flyer) </li>
    #   <li> 18 (Feedback Request) </li>
    #   <li> 19 (Ratings and Reviews) </li>
    #   <li> 20 (Event Announcement) </li>
    #   <li> 21 (Simple Coupon) </li>
    #   <li> 22 (Sale Promotion) </li>
    #   <li> 23 (Product Promotion) </li>
    #   <li> 24 (Membership Drive) </li>
    #   <li> 25 (Fundraiser) </li>
    #   <li> 26 (Custom Code Email)</li>
    #   <li> 57 (A/B Test)</li>
    # </ul>
    int type_code?;
    # The system generated date and time showing when the campaign was last updated. This string is read only and is in ISO-8601 format.
    string updated_at?;
};

public type ActivitylinksResults record {
    # Use this link to view activity results.
    string href?;
};

public type EmailsendhistoryInner record {
    # Uniquely identifies each send history object using the number of times that you sent the email campaign activity as a sequence starting at <code>1</code>. For example, when you send a specific email campaign activity twice this method returns an object with a <code>send_id</code> of 1 for the first send and an object with a <code>send_id</code> of 2 for the second send.
    @constraint:Int {minValue: 1}
    int send_id?;
    # The contacts lists that Constant Contact sent email campaign activity to as an array of contact <code>list_id</code> strings.
    string[] contact_list_ids?;
    # The contact segments that Constant Contact sent the email campaign activity to as an array of <code>segment_id</code> integers.
    int[] segment_ids?;
    # The number of contacts that Constant Contact sent this email campaign activity to. This property is specific to each send history object. When you resend an email campaign activity, Constant Contact only sends it to new contacts in the contact lists or segments you are using.
    int count?;
    # The system generated date and time that Constant Contact sent the email campaign activity to contacts in ISO-8601 format.
    string run_date?;
    # The send status for the email campaign activity. Valid values are: <ul> 
    #   <li><code>COMPLETED</code>: Constant Contact successfully sent the email campaign activity.</li>
    #   <li><code>ERRORED</code>: Constant Contact encountered an error when sending the email campaign activity.<li>
    # </ul>
    string send_status?;
    # The reason why the send attempt completed or encountered an error. This method returns <code>0</code> if Constant Contact successfully sent the email campaign activity to contacts. Possible <code>reason_code</code> values are: <ul>
    #       <li>0 — Constant Contact successfully sent the email to contacts.</li>
    #       <li>1 — An error occurred when sending this email. Try scheduling it again, or contact <a href='http://support.constantcontact.com' target='_blank'>Customer Support</a>.</li>
    #       <li>2 — We were unable to send the email. Please contact our <a href='http://knowledgebase.constantcontact.com/articles/KnowledgeBase/5782-contact-an-account-review-and-deliverability-specialist' target='_blank'>Account Review Team</a> for more information.</li>
    #       <li>3 — This Constant Contact account cannot currently send emails. This can be due to billing or product expiration.</li>
    #       <li>4 — You're not able to send the email to that many contacts. Remove contacts from the contact lists you are using or select a list with fewer contacts.</li>
    #       <li>5 — The email is currently in staging. For more information, see the <a href='http://knowledgebase.constantcontact.com/articles/KnowledgeBase/7402-email-staging' target='_blank>Email Staging Knowledge Base article</a>.</li>
    #       <li>6 — Constant Contact was unable to finish sending this email to all of the contacts on your list. Please contact <a href='http://support.constantcontact.com' target='_blank'>Customer Support</a> for more information.</li>
    #       <li>7 — The email contains invalid images. This can be caused when one or more images in the email are longer available in your image library.</li>
    #       <li>8 — The email contains a link URL that exceeds 1005 characters.</li>
    #       <li>9 — Constant Contact was unable to verify your authenticated Sender address. Please contact <a href='http://support.constantcontact.com' target='_blank'>Customer Support</a> for more information.</li>
    #       <li>10 — Constant Contact was unable to verify your authenticated Sender address. Please contact <a href='http://support.constantcontact.com' target='_blank'>Customer Support</a> for more information.</li>
    #       <li>11 — This Constant Contact account cannot send survey invitations.</li>
    #       <li>12 — Constant Contact attempted to send the email, but there were no eligible contacts to send it to. This can be caused by an invalid contact list, a contact list with no contacts, or a contact list with no new contacts during a resend. This method displays <code>reason_code</code> 12 as a send attempt with a <code>send_status</code> of COMPLETED and a <code>count</code> of 0.</li>
    # </ul>
    int reason_code?;
};

public type ListActivityRemoveContacts record {
    # The <code>source</code> object specifies which contacts to remove from your targeted lists using one of three mutually exclusive properties.
    ListactivityremovecontactsSource 'source;
    # Specifies which lists (up to 50) to remove your source contacts from.
    @constraint:Array {maxLength: 50}
    string[] list_ids;
};

# Use this endpoint to retrieve (GET) all custom_fields in the user's account, or to create (POST) a new custom_field.
public type CustomFields record {
    # CustomFields array
    @constraint:Array {maxLength: 100}
    Customfieldresource2[] custom_fields?;
    # Paging links
    PagingLinks _links?;
};

# Activity status export link
public type ActivityStatusExportLink record {
    # HATEOS-style link to the activity status (this object).
    ActivitystatusexportlinkSelf self?;
    # Link to an activity result resource; as an example, for file_export, the link to the exported contacts file.
    ActivitystatusexportlinkResults results?;
};

public type SegmentMaster record {
    # The segment's unique descriptive name.
    string name?;
    # The system generated number that uniquely identifies the segment.
    int segment_id?;
    # The system generated date and time that the segment was created (ISO-8601 format).
    string created_at?;
    # The system generated date and time that the segment's <code>name</code> or <code>segment_criteria</code> was last updated (ISO-8601 format).
    string edited_at?;
};

public type EmailScheduleInput record {
    # The date when Constant Contact will send the email campaign activity to contacts in ISO-8601 format. For example, <code>2022-05-17</code> and <code>2022-05-17T16:37:59.091Z</code> are valid dates. Use <code>"0"</code> as the date to have Constant Contact immediately send the email campaign activity to contacts.
    string scheduled_date;
};

public type CustomFieldInput record {
    # The display name for the custom_field shown in the UI as free-form text
    @constraint:String {maxLength: 50}
    string label;
    # Specifies the type of value the custom_field field accepts: string or date.
    string 'type;
};

public type ClicksTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies the email campaign activity.
    string campaign_activity_id;
    # The type of report tracking activity that is associated with the specified <code>campaign_activity_id</code>.
    string tracking_activity_type;
    # The email address used to send the email campaign activity to a contact.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The type of device that the contact was using when they clicked the URL link for the email campaign activity.
    string device_type?;
    # The ID used to uniquely identify the URL link.
    string url_id;
    # The text used for the URL link.
    string link_url;
    # The date and time that the contact clicked the specified URL link for the email campaign activity.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

public type WebhooksSubscriptionBody record {
    # The callback URI you would like to use to receive webhook notifications. Constant Contact will automatically send POST notifications about your chosen topic to this URI.
    string hook_uri?;
};

public type EmailSendHistory EmailsendhistoryInner[];

public type PhoneNumberPut record {
    # The contact's phone number, 1 of 2 allowed per contact, no more than 25 characters
    @constraint:String {maxLength: 25}
    string phone_number?;
    # Describes the type of phone number; valid values are home, work, mobile, or other.
    string kind?;
};

# An array of webhook subscriptions.
public type WebhooksSubscriptionCollection WebhooksSubscription[];

public type UserPrivilegesResource UserprivilegesresourceInner[];

public type EmailLinks record {
    # The unique ID for an email campaign activity.
    string campaign_activity_id?;
    # An array of objects that contain the contact click count and link metadata for each unique link URL in an email campaign activity. By default, this method combines results for duplicate link URLs.
    EmailLinkClickCount[] link_click_counts?;
};

public type SegmentData record {
    # The segment's unique descriptive name.
    string name;
    # The <code>segment_criteria</code> specifies the contact data that Constant Contact uses to evaluate and identify contacts that meet your criteria. The <code>segment_criteria</code> must be formatted as single-string escaped JSON. The top-level <code>group</code> <code>type</code> must be <code>add</code>.
    @constraint:String {maxLength: 20000}
    string segment_criteria;
};

# Use to exclude specified contacts from being added or removed from a tag. Only applicable if the specified source is either <code>all_active_contacts</code> or <code>list_ids</code>.
public type TagaddremovecontactsExclude record {
    # Identifies the contacts, by <code>contact_id</code>, to exclude from the add or remove tags activity.
    string[] contact_ids?;
};

public type ForwardsTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies the email campaign activity.
    string campaign_activity_id;
    # The type of report tracking activity that is associated with the specified <code>campaign_activity_id</code>.
    string tracking_activity_type;
    # The contact's email address.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The time that the contact forwarded the email campaign activity.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

public type EmailCampaigns record {
    # The unique ID used to identify the email campaign (UUID format).
    string campaign_id?;
    # The system generated date and time that this email campaign was created. This string is readonly and is in ISO-8601 format.
    string created_at?;
    # The current status of the email campaign. Valid values are: <ul>
    #   <li>Draft — An email campaign that you have created but have not sent to contacts.</li>
    #   <li>Scheduled — An email campaign that you have scheduled for Constant Contact to send to contacts.</li>
    #   <li>Executing — An email campaign that Constant Contact is currently sending to contacts. Email campaign activities are only in this status briefly.</li>
    #   <li>Done — An email campaign that you successfully sent to contacts.</li>
    #   <li>Error — An email campaign activity that encountered an error.</li>
    #   <li>Removed — An email campaign that a user deleted. Users can view and restore deleted emails through the UI.</li>
    # </ul>
    string current_status?;
    # The descriptive name the user provides to identify this campaign. Campaign names must be unique for each account ID.
    @constraint:String {maxLength: 80}
    string name?;
    # Identifies the type of campaign that you select when creating the campaign. Newsletter and Custom Code email campaigns are the primary types.
    string 'type?;
    # The code used to identify the email campaign `type`. <ul>
    #   <li> 1  (Default) </li>
    #   <li> 2  (Bulk Email) </li>
    #   <li> 10 (Newsletter) </li>
    #   <li> 11 (Announcement) </li>
    #   <li> 12 (Product/Service News) </li>
    #   <li> 14 (Business Letter) </li>
    #   <li> 15 (Card) </li>
    #   <li> 16 (Press release)</li>
    #   <li> 17 (Flyer) </li>
    #   <li> 18 (Feedback Request) </li>
    #   <li> 19 (Ratings and Reviews) </li>
    #   <li> 20 (Event Announcement) </li>
    #   <li> 21 (Simple Coupon) </li>
    #   <li> 22 (Sale Promotion) </li>
    #   <li> 23 (Product Promotion) </li>
    #   <li> 24 (Membership Drive) </li>
    #   <li> 25 (Fundraiser) </li>
    #   <li> 26 (Custom Code Email)</li>
    #   <li> 57 (A/B Test)</li>
    # </ul>
    int type_code?;
    # The system generated date and time showing when the campaign was last updated. This string is read only and is in ISO-8601 format.
    string updated_at?;
};

public type StatsEmailActivity record {
    # Number of unique email bounces.
    int em_bounces?;
    # Number of unique recipients who clicked any link in the email.
    int em_clicks?;
    # Total number of non-unique email clicks.
    int em_clicks_all?;
    # Number of non-unique email clicks on a standard desktop or laptop computer.
    int em_clicks_all_computer?;
    # Number of non-unique email clicks on a mobile phone or similar small mobile device (e.g. iPhone).
    int em_clicks_all_mobile?;
    # Number of non-unique email clicks on a small tablet type computer (e.g. iPad).
    int em_clicks_all_tablet?;
    # Number of non-unique email clicks on an unknown device (e.g. Game Console or Wearable).
    int em_clicks_all_other?;
    # Number of non-unique email clicks for which the device type was not captured. This will account for any clicks prior to when device type was collected and stored.
    int em_clicks_all_none?;
    # Number of unique recipients who forwarded the email using the forward to a friend feature (not available for all types of emails).
    int em_forwards?;
    # Number of unique recipients who did not open the email. This is calculated as follows: <code>em_not_opened</code> is equal to <code>em_sends - em_opens - em_bounces</code>. This value is reported as zero if the calculation results in a negative value.
    int em_not_opened?;
    # Number of unique recipients who opened the email.
    int em_opens?;
    # Total number of non-unique email opens.
    int em_opens_all?;
    # Number of non-unique email opens on a standard desktop or laptop computer.
    int em_opens_all_computer?;
    # Number of non-unique email opens on a mobile phone or similar small mobile device (e.g. iPhone).
    int em_opens_all_mobile?;
    # Number of non-unique email opens on a small tablet type computer (e.g. iPad).
    int em_opens_all_tablet?;
    # Number of non-unique email opens on an unknown device (e.g. Game Console or Wearable).
    int em_opens_all_other?;
    # Number of non-unique email opens for which the device type was not captured. This will account for any opens prior to when device type was collected and stored.
    int em_opens_all_none?;
    # Number of unique recipients who unsubscribed due to this email.
    int em_optouts?;
    # Number of unique email sends.
    int em_sends?;
    # Number of abuse (spam) complaints received.
    int em_abuse?;
    # Unique number bounced because as blocked by the receiving system.
    int em_bounces_blocked?;
    # Unique number that bounced back with a mailbox full message.
    int em_bounces_mailbox_full?;
    # Unique number that bounced as a non-existent address.
    int em_bounces_nonexistent_address?;
    # Unique number that bounced without an identifiable cause.
    int em_bounces_other?;
    # Unique number that bounced as suspended. Email address bounces as suspended when multiple non-existent bounces have been received for the same address.
    int em_bounces_suspended?;
    # Unique number that bounced as undeliverable.
    int em_bounces_undeliverable?;
    # Unique number that bounced back with a vacation or out of office autoreply.
    int em_bounces_vacation?;
};

# Use this endpoint to retrieve (GET), update (PUT), or DELETE an existing contact resource specified using the <code>contact_id</code> path parameter.
public type ContactResource record {
    # Unique ID for each contact resource
    string contact_id?;
    # A contact subresource describing the contact's email_address.
    EmailAddress email_address?;
    # The first name of the contact.
    @constraint:String {maxLength: 50}
    string first_name?;
    # The last name of the contact.
    @constraint:String {maxLength: 50}
    string last_name?;
    # The job title of the contact.
    @constraint:String {maxLength: 50}
    string job_title?;
    # The name of the company where the contact works.
    @constraint:String {maxLength: 50}
    string company_name?;
    # The month value for the contact's birthday. Valid values are from 1 through 12. You must use this property with <code>birthday_month</code>.
    int birthday_month?;
    # The day value for the contact's birthday. Valid values are from 1 through 12. You must use this property with <code>birthday_day</code>.
    int birthday_day?;
    # The anniversary date for the contact. For example, this value could be the date when the contact first became a customer of an organization in Constant Contact. Valid date formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D,M-D-YYYY, or M-DD-YYYY.
    @constraint:String {maxLength: 10}
    string anniversary?;
    # Identifies who last updated the contact; valid values are Contact or Account
    string update_source?;
    # Describes who added the contact; valid values are <code>Contact</code> or <code>Account</code>. Your integration must accurately identify <code>create_source</code> for compliance reasons; value is set when contact is created.
    string create_source?;
    # System generated date and time that the resource was created, in ISO-8601 format.
    string created_at?;
    # System generated date and time that the contact was last updated, in ISO-8601 format.
    string updated_at?;
    # For deleted contacts (<code>email_address</code> contains <code>opt_out_source</code> and <code>opt_out_date</code>), shows the date of deletion.
    string deleted_at?;
    # Array of up to 25 <code>custom_field</code> key value pairs.
    @constraint:Array {maxLength: 25}
    ContactCustomField[] custom_fields?;
    # Array of phone_numbers subresources. A contact can have up to 2 phone numbers.
    @constraint:Array {maxLength: 2}
    PhoneNumber[] phone_numbers?;
    # Array of street_addresses subresources. A contact can have 1 street address.
    @constraint:Array {maxLength: 1}
    StreetAddress[] street_addresses?;
    # Array of list_id's to which the contact is subscribed, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] list_memberships?;
    # Array of tags (<code>tag_id</code>) assigned to the contact, up to a maximum of 50.
    @constraint:Array {maxLength: 50}
    string[] taggings?;
    # An array of up to 150 notes about the contact.
    @constraint:Array {maxLength: 150}
    Note[] notes?;
};

public type BouncesTrackingActivitiesPage record {
    # The list of email bounce tracking activities associated with a given 'campaign_activity_id'.
    BouncesTrackingActivity[] tracking_activities;
    # Links_2
    Links2 _links;
};

public type TagPost record {
    # Specify a unique name to use to identify the tag. Tag names must be at least one character in length and not more than 255 characters.
    @constraint:String {maxLength: 255, minLength: 1}
    string name;
    # The source used to identify the contacts to tag.
    string tag_source?;
};

public type PercentsEmail record {
    # Percentage of emails sent to unique recipients that bounced.
    decimal bounce?;
    # Percentage of recipients who opened the email who also clicked one or more links in it.
    decimal click?;
    # Percentage of clicks that came from a standard desktop or laptop computer.
    decimal desktop_click?;
    # Percentage of opens that came from a standard desktop or laptop computer.
    decimal desktop_open?;
    # Percentage of recipients that received the email (did not bounce) but did not open it.
    decimal did_not_open?;
    # Percentage of clicks that came from a mobile phone, tablet computer, or similar small mobile device (e.g. iPhone or iPad).
    decimal mobile_click?;
    # Percentage of opens that came from a mobile phone, tablet computer, or similar small mobile device (e.g. iPhone or iPad).
    decimal mobile_open?;
    # Percentage of recipients that received the email (did not bounce) and opened it.
    decimal open?;
    # Percentage of recipients that received the email (did not bounce) and chose to unsubscribe.
    decimal unsubscribe?;
};

public type OptoutsTrackingActivity record {
    # The ID that uniquely identifies a contact.
    string contact_id;
    # The ID that uniquely identifies the email campaign activity.
    string campaign_activity_id;
    # The type of report tracking activity that is associated with the specified <code>campaign_activity_id</code>.
    string tracking_activity_type;
    # The contact's email address.
    string email_address;
    # The first name of the contact.
    string first_name?;
    # The last name of the contact.
    string last_name?;
    # The opt-out reason, if the contact entered a reason.
    string opt_out_reason?;
    # The time that the contact chose to opt-out from receiving future email campaign activities.
    string created_time;
    # If applicable, displays the date that the contact was deleted.
    string deleted_at?;
};

public type Activitylinks2 record {
    # The link returned in the response that you use to retrieve the status for the specified activity.
    Activitylinks2Self self?;
};

# Custom fields allow Constant Contact users to add custom content to a contact that can be used to personalize emails in addition to the standard set of variables available for email personalization.
public type ContactCustomField record {
    # The custom_field's unique ID
    string custom_field_id;
    # The custom_field value.
    @constraint:String {maxLength: 255}
    string value;
};

public type AccountemailsInner record {
    # An email address associated with a Constant Contact account owner.
    @constraint:String {maxLength: 80}
    string email_address?;
    # The unique ID for an email address in a Constant Contact account.
    @constraint:Int {minValue: 1}
    int email_id?;
    # The confirmation status of the account email address. When you add a new email address to an account, Constant Contact automatically sends an email to that address with a link to confirm it. You can use any account email address with a <code>CONFIRMED</code> status to create an email campaign.
    string confirm_status?;
    # The date that the email address changed to <code>CONFIRMED</code> status in ISO-8601 format.
    string confirm_time?;
    # Describes who confirmed the email address. Valid values are:
    #   <ul>
    #   <li>SITE_OWNER — The Constant Contact account owner confirmed the email address.</li>
    #   <li>SUPPORT — Constant Contact support staff confirmed the email address.</li>
    #   <li>FORCEVERIFY — Constant Contact confirmed the email address without sending a confirmation email.</li>
    #   <li>PARTNER — A Constant Contact partner confirmed the email address.</li>
    #   </ul>
    string confirm_source_type?;
    # Specifies the current role of a confirmed email address in an account. Each email address can have multiple roles or no role. Possible role values are: <ul> <li>CONTACT — The contact email for the Constant Contact account owner. Each account can only have one <code>CONTACT</code> role email.</li> <li>BILLING — The billing address for the Constant Contact account. Each account can only have one <code>BILLING</code> role email.</li> <li>JOURNALING — An email address that Constant Contact forwards all sent email campaigns to as part of the partner journaling compliance feature.</li> <li>REPLY_TO — The contact email used in the email campaign signature. Each account can only have one <code>REPLY_TO</code> role email.</li> <li>OTHER — An email address that does not fit into the other categories.</li> </ul> You can use any confirmed email address in the email campaign <code>from_email</code> and <code>reply_to_email</code> headers.
    string[] roles?;
    # The planned role for an unconfirmed email address. Possible role values are: <ul> <li>CONTACT — The contact email for the Constant Contact account owner. Each account can only have one <code>CONTACT</code> role email.</li> <li>BILLING — The billing address for the Constant Contact account. Each account can only have one <code>BILLING</code> role email.</li> <li>JOURNALING — The email address that Constant Contact forwards all sent email campaigns to as part of the partner journaling compliance feature.</li> <li>REPLY_TO — The contact email used in the email campaign signature. Each account can only have one <code>REPLY_TO</code> role email. </li> <li>OTHER — An email address that does not fit into the other categories.</li> </ul>
    string[] pending_roles?;
};

public type EmailLinkClickCount record {
    # The URL of a link in an email campaign activity. This URL is not normalized and appears the same as the URL in the email campaign activity.
    string link_url?;
    # The ID for a unique link URL in an email campaign activity.
    string url_id?;
    # The number of unique contacts that clicked the link.
    int unique_clicks?;
    # If the link uses the click segmentation feature, this property contains the action that contacts trigger when they click the link. Currently the only available action is <code>add</code>, which adds contacts that click the link to a contact list.
    string list_action?;
    # If the link uses the click segmentation feature, this property contains the contact list linked with the <code>list_action</code> property.
    string list_id?;
    # Link tags are not currently available in email campaigns. By default, this method combines results for duplicate link URLs. Link tags will allow users to get a separate link click report for each unique <code>link_tag</code> value they use, even if URLs are not unique.
    string link_tag?;
};

public type PartneraccountSiteOwnerList record {
    # The obfuscated ID used to uniquely identify a client account.
    string encoded_account_id?;
    # The total number of subscriber contacts that are associated with a client account.
    int subscriber_count?;
    # The name of the organization associated with this client account.
    string organization_name?;
    # The user name that identifies a client account.
    string site_owner_name?;
    # The client's account billing status. When you first create a client account the `billing status` defaults to `Trial`. Billing status values include: <ul>
    #   <li><code>Trial</code> - A non-paying trial client account (default value).</li>
    #   <li><code>Open</code> - An active and paying client account.</li>
    #   <li><code>Canceled</code> - A canceled client account.</li>
    #   <li><code>Trial End</code> - The trial period has ended for this client account.</li>
    # </ul>
    string billing_status?;
    # The system generated date and time (ISO-8601) showing when the client last logged into their Constant Contact account. If a client has not logged into their account, the value is `null`. This property does not display in the results.
    string last_login_date?;
};

public type Tag2 record {
    # The ID that uniquely identifies a tag (UUID format)
    string tag_id?;
    # The unique tag name.
    string name?;
    # The total number of contacts who are assigned this tag.
    int contacts_count?;
    # The system generated date and time when the tag was created (ISO-8601 format).
    string created_at?;
    # The system generated date and time when the tag was last updated (ISO-8601 format).
    string updated_at?;
    # The source used to tag contacts.
    string tag_source?;
};

public type Activities record {
    # A list of bulk activity jobs and status submitted by the account over the past 10 days.
    ActivitiesActivities[] activities?;
    # Paging links
    PagingLinks _links?;
};

# The cross-referenced pair of V3 API <code>list_id</code> and V2 API <code>sequence_id</code> for a list. Response is sorted ascending by <code>sequence_id</code>.
public type ContactXref record {
    # The V2 API contact unique identifier
    string sequence_id?;
    # The V3 API contact unique identifier
    string contact_id?;
};

public type AccountEmailInput record {
    # The new email address you want to add to a Constant Contact account.
    @constraint:String {maxLength: 80}
    string email_address?;
};

public type ContactListArray record {
    Contactlist2[] lists?;
    # The total number of contact lists.
    int lists_count?;
    # Paging links
    PagingLinks _links?;
};

public type ActivitiesContactsFileImportBody record {
    # The CSV file you are importing. The column headings that you can use in the file are: `first_name`,
    # `last_name`, `email`, `phone`, `job_title`, `anniversary`, `birthday_day`, `birthday_month`, `company_name`, `street`, `street2`, `city`, `state`, `zip`, and `country`. The only required column heading is `email`.
    # 
    # 
    # You can also use custom fields as column headings. Enter the custom field name prefixed with `cf:` as the column heading. For example, use `cf:first_name` as the header name if you have a custom field named "first_name". The custom field must already exist in the Constant Contact account you are using. Depending on the custom field data type, you can enter dates or strings as the value of the custom field. Each contact can contain up to 25 different custom fields.
    string file;
    # Specify which contact lists you are adding all imported contacts to as an array of up to 50 contact `list_id` values.
    @constraint:Array {maxLength: 50}
    string[] list_ids;
};

public type CampaignActivityStatsResultGenericStatsEmailActivity record {
    # The unique ID used to identify the campaign (UUID).
    string campaign_id?;
    # The unique ID used to identify the campaign activity (UUID).
    string campaign_activity_id?;
    StatsEmailActivity stats?;
    # The time at which the campaign activity stats were last refreshed in ISO 8601 format (e.g. '2015-08-25T22:00:09.908Z').
    string last_refresh_time?;
};

# Status
public type ActivityimportStatus record {
    # The total number of rows in the import file.
    int items_total_count?;
    # The total number of contacts in the import file.
    int person_count?;
    # The number of non-correctable errors encountered during the file import.
    int error_count?;
    # The number of correctable errors. Correctable errors are: invalid email address format, birthday or anniversary format error, or does not have minimal contact information (no name or email address). Correctable errors are available in the product UI to correct.
    int correctable_count?;
    # The number of previously unsubscribed contacts in the import - they cannot be added to a list.
    int cannot_add_to_list_count?;
};

# The cross-referenced pair of V3 API <code>list_id</code> and V2 API <code>sequence_id</code> for a list. Response is sorted ascending by <code>sequence_id</code>.
public type ListXref record {
    # The V2 API list unique identifier
    string sequence_id?;
    # The V3 API list unique identifier
    string list_id?;
};

public type ListActivityAddContacts record {
    # The <code>source</code> object specifies which contacts you are adding to your targeted lists using one of four mutually exclusive properties.
    ListactivityaddcontactsSource 'source;
    # Specifies which lists (up to 50) you are adding your source contacts to.
    @constraint:Array {maxLength: 50}
    string[] list_ids;
};

public type TagPut record {
    # The new tag name to use. The tag name must be unique.
    @constraint:String {maxLength: 255, minLength: 1}
    string name;
};

# The <code>source</code> object specifies which contacts you are adding to your targeted lists using one of four mutually exclusive properties.
public type ListactivityaddcontactsSource record {
    # Specifies which contacts you are adding to lists as an array of up to 50 contact <code>list_id</code> values. This property is mutually exclusive with <code>contact_ids</code>, <code>all_active_contacts</code>, and <code>segment_id</code>.
    @constraint:Array {maxLength: 50}
    string[] list_ids?;
    # Adds all active contacts to your targeted lists. This property is mutually exclusive with <code>contact_ids</code>, <code>list_ids</code>, and <code>segment_id</code>.
    boolean all_active_contacts?;
    # Specifies which contacts (up to 500) you are adding to lists as an array of <code>contact_id</code> values. This property is mutually exclusive with <code>list_ids</code>, <code>all_active_contacts</code>, and <code>segment_id</code>.
    @constraint:Array {maxLength: 500}
    string[] contact_ids?;
    # Specifies which contacts you are adding to lists as a single <code>segment_id</code> value. This property is mutually exclusive with <code>list_ids</code>, <code>all_active_contacts</code>, and <code>contact_ids</code>.
    int segment_id?;
};

public type StatsEmail record {
    # Number of unique email bounces.
    int em_bounces?;
    # Number of unique recipients who clicked any link in the email.
    int em_clicks?;
    # Total number of non-unique email clicks.
    int em_clicks_all?;
    # Number of non-unique email clicks on a standard desktop or laptop computer.
    int em_clicks_all_computer?;
    # Number of non-unique email clicks on a mobile phone or similar small mobile device (e.g. iPhone).
    int em_clicks_all_mobile?;
    # Number of non-unique email clicks on a small tablet type computer (e.g. iPad).
    int em_clicks_all_tablet?;
    # Number of non-unique email clicks on an unknown device (e.g. Game Console or Wearable).
    int em_clicks_all_other?;
    # Number of non-unique email clicks for which the device type was not captured. This will account for any clicks prior to when device type was collected and stored.
    int em_clicks_all_none?;
    # Number of unique recipients who forwarded the email using the forward to a friend feature (not available for all types of emails).
    int em_forwards?;
    # Number of unique recipients who did not open the email. This is calculated as follows: <code>em_not_opened</code> is equal to <code>em_sends - em_opens - em_bounces</code>. This value is reported as zero if the calculation results in a negative value.
    int em_not_opened?;
    # Number of unique recipients who opened the email.
    int em_opens?;
    # Total number of non-unique email opens.
    int em_opens_all?;
    # Number of non-unique email opens on a standard desktop or laptop computer.
    int em_opens_all_computer?;
    # Number of non-unique email opens on a mobile phone or similar small mobile device (e.g. iPhone).
    int em_opens_all_mobile?;
    # Number of non-unique email opens on a small tablet type computer (e.g. iPad).
    int em_opens_all_tablet?;
    # Number of non-unique email opens on an unknown device (e.g. Game Console or Wearable).
    int em_opens_all_other?;
    # Number of non-unique email opens for which the device type was not captured. This will account for any opens prior to when device type was collected and stored.
    int em_opens_all_none?;
    # Number of unique recipients who unsubscribed due to this email.
    int em_optouts?;
    # Number of unique email sends.
    int em_sends?;
};

public type ListInput record {
    # The name given to the contact list
    @constraint:String {maxLength: 255}
    string name;
    # Identifies whether or not the account has favorited the contact list.
    boolean favorite = false;
    # Text describing the list.
    string description?;
};

public type EmailCampaignActivityPreview record {
    # The unique ID for an email campaign activity.
    string campaign_activity_id?;
    # The "from email" email header for the email campaign activity.
    string from_email?;
    # The "from name" email header for the email campaign activity.
    string from_name?;
    # The email preheader for the email campaign activity. Only <code>format_type</code> 3, 4, and 5 email campaign activities use the preheader property.
    string preheader?;
    # An HTML preview of the email campaign activity.
    string preview_html_content?;
    # A plain text preview of the email campaign activity.
    string preview_text_content?;
    # The email "Reply To Email" field for the email campaign activity.
    string reply_to_email?;
    # The email "Subject" field for the email campaign activity.
    string subject?;
};

public type StreetAddress record {
    # Unique ID for the street address
    string street_address_id?;
    # Describes the type of address; valid values are home, work, or other.
    string kind;
    # Number and street of the address.
    @constraint:String {maxLength: 255}
    string street?;
    # The name of the city where the contact lives.
    @constraint:String {maxLength: 50}
    string city?;
    # The name of the state or province where the contact lives.
    @constraint:String {maxLength: 50}
    string state?;
    # The zip or postal code of the contact.
    @constraint:String {maxLength: 50}
    string postal_code?;
    # The name of the country where the contact lives.
    @constraint:String {maxLength: 50}
    string country?;
    # Date and time that the street address was created, in ISO-8601 format. System generated.
    string created_at?;
    # Date and time that the street address was last updated, in ISO-8601 format. System generated.
    string updated_at?;
};

public type PartnerAccount record {
    # Lists all Constant Contact client accounts that are managed under a partner account.
    PartneraccountSiteOwnerList[] site_owner_list;
    PaginationLinks _links?;
};

public type EmailTestSendInput record {
    # The recipients of the test email as an array of email address strings. You can send a test email to up to 5 different email addresses at a time.
    @constraint:Array {maxLength: 5}
    string[] email_addresses;
    # A personal message for the recipients of the test email. Constant Contact displays this message before the email campaign activity content.
    string personal_message?;
};

public type CustomerPut record {
    # The confirmed email address that is associated with the account owner.
    string contact_email?;
    # The account owner's contact phone number (up to 25 characters in length).
    @constraint:String {maxLength: 25}
    string contact_phone?;
    # The two-letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> representing the organization's country.
    string country_code?;
    # The read only encoded account ID that uniquely identifies the account.
    string encoded_account_id?;
    # The account owner's first name.
    string first_name?;
    # The account owner's last name.
    string last_name?;
    # The name of the organization that is associated with this account.
    string organization_name?;
    # The phone number of the organization that is associated with this account.
    string organization_phone?;
    # The two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> used to specify the state to associate with the account. This property is required if the <code>country_code</code> is US (United States).
    string state_code?;
    # The time zone to use for the account; as defined in the IANA time-zone database (see http://www.iana.org/time-zones).
    string time_zone_id?;
    # The organization's website URL.
    string website?;
};

public type Links record {
    Next next;
};

public type SegmentDetail record {
    # The segment's unique descriptive name.
    string name?;
    # The segment's contact selection criteria formatted as single-string escaped JSON.
    @constraint:String {maxLength: 20000}
    string segment_criteria?;
    # The system generated number that uniquely identifies the segment.
    int segment_id?;
    # The system generated date and time (ISO-8601) that the segment was created.
    string created_at?;
    # The system generated date and time (ISO-8601) that the segment's <code>name</code> or <code> segment_criteria</code> was last updated.
    string edited_at?;
};

public type AuthToken record {
    # A valid OAuth2.0 access token.
    string token;
};

public type AccountPhysicalAddress record {
    # Line 1 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line1;
    # Line 2 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line2?;
    # Line 3 of the organization's street address.
    @constraint:String {maxLength: 80, minLength: 1}
    string address_line3?;
    # The city where the organization is located.
    string city;
    # The two letter ISO 3166-1 code for the organization's state and only used if the <code>country_code</code> is <code>US</code> or <code>CA</code>. If not, exclude this property from the request body.
    @constraint:String {maxLength: 2}
    string state_code?;
    # Use if the state where the organization is physically located is not in the United States or Canada. If  <code>country_code</code> is  <code>US</code> or <code>CA</code>, exclude this property from the request body.
    string state_name?;
    # The postal code address (ZIP code) of the organization. This property is required if the <code>state_code</code> is <code>US</code> or <code>CA</code>, otherwise exclude this property from the request body.
    string postal_code?;
    # The two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> for the organization's country.
    string country_code;
};

public type JsonImportContact record {
    # The email address of the contact. This method identifies each unique contact using their email address.
    @constraint:String {maxLength: 50}
    string email;
    # The first name of the contact.
    @constraint:String {maxLength: 50}
    string first_name?;
    # The last name of the contact.
    @constraint:String {maxLength: 50}
    string last_name?;
    # The job title of the contact.
    @constraint:String {maxLength: 50}
    string job_title?;
    # The name of the company where the contact works.
    @constraint:String {maxLength: 50}
    string company_name?;
    # The month value for the contact's birthday. Valid values are from 1 through 12. The <code>birthday_month</code> property is required if you use <code>birthday_day</code>.
    int birthday_month?;
    # The day value for the contact's birthday. Valid values are from 1 through 31. The <code>birthday_day</code> property is required if you use <code>birthday_month</code>.
    int birthday_day?;
    # The anniversary date for the contact. For example, this value could be the date when the contact first became a customer of an organization in Constant Contact. Valid date formats are MM/DD/YYYY, M/D/YYYY, YYYY/MM/DD, YYYY/M/D, YYYY-MM-DD, YYYY-M-D,M-D-YYYY, or M-DD-YYYY.
    string anniversary?;
    # The phone number for the contact.
    @constraint:String {maxLength: 50}
    string phone?;
    # Line one of the street address for the contact.
    @constraint:String {maxLength: 255}
    string street?;
    # Line two of the street address for the contact. This value is automatically appended to the <code>street</code> value.
    @constraint:String {maxLength: 255}
    string street2?;
    # The name of the city where the contact lives.
    @constraint:String {maxLength: 50}
    string city?;
    # The name of the state or province where the contact lives.
    @constraint:String {maxLength: 50}
    string state?;
    # The zip or postal code of the contact.
    @constraint:String {maxLength: 50}
    string zip?;
    # The name of the country where the contact lives.
    @constraint:String {maxLength: 50}
    string country?;
    # The name of this property is dynamic based on the custom fields you want to import. Use a key-value pair where the key is an existing custom field name prefixed with <code>cf:</code>, and the value is a custom field string value. For example, if you have a custom field named <code>first_name</code> you can use <code>"cf:first_name":"Joe"</code>. Each contact can contain up to 25 different custom fields.
    @constraint:String {maxLength: 255}
    string 'cf\:custom\_field\_name?;
};

public type Contactlist2 record {
    # Unique ID for the contact list
    string list_id?;
    # The name given to the contact list
    string name?;
    # Text describing the list.
    string description?;
    # Identifies whether or not the account has favorited the contact list.
    boolean favorite?;
    # System generated date and time that the resource was created, in ISO-8601 format.
    string created_at?;
    # Date and time that the list was last updated, in ISO-8601 format. System generated.
    string updated_at?;
    # The number of contacts in the contact list.
    int membership_count?;
};

public type EmailPhysicalAddress record {
    # Line 1 of the organization's street address.
    string address_line1;
    # Line 2 of the organization's street address.
    string address_line2?;
    # Line 3 of the organization's street address.
    string address_line3?;
    # An optional address field for the organization. Only <code>format_type</code> 3, 4, and 5 can use this property.
    string address_optional?;
    # The city where the organization sending the email campaign is located.
    string city?;
    # The uppercase two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> for the organization's country.
    string country_code;
    # The full name of the country where the organization sending the email is located. Automatically generated using the <code>country_code</code>.
    string country_name?;
    # The name of the organization that is sending the email campaign.
    string organization_name;
    # The postal code address (ZIP code) of the organization.
    string postal_code?;
    # The uppercase two letter <a href='https://en.wikipedia.org/wiki/ISO_3166-1' target='_blank'>ISO 3166-1 code</a> for the organization's state. This property is required if the <code>country_code</code> is US (United States).
    string state_code?;
    # The full state name for a <code>state_code</code> that is inside the United States. Automatically generated using the <code>state_code</code>.
    string state_name?;
    # The full state name for a <code>state_code</code> that is outside the United States. This property is not read only.
    string state_non_us_name?;
};
