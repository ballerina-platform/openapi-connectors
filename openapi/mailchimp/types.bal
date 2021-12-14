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

# The member activity events for a given member.
public type MemberActivityEvents1 record {
    # An array of objects, each representing a contact event. There are multiple possible types, see the [activity schema documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#activity-schemas).
    record {}[] activity?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# View members in a specific list segment.
public type SegmentMembers record {
    # An array of objects, each representing a specific list member.
    ListMembers3[] members?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about this list's interest categories.
public type InterestGroupings record {
    # The ID for the list that this category belongs to.
    string list_id?;
    # This array contains individual interest categories.
    InterestCategory3[] categories?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Update information about an individual Automation workflow email.
public type UpdateInformationAboutASpecificWorkflowEmail record {
    # Settings for the campaign including the email subject, from name, and from email address.
    CampaignSettings settings?;
    # The delay settings for an automation email.
    AutomationDelay delay?;
};

# The tracking options for the Automation.
public type AutomationTrackingOptions record {
    # Whether to [track opens](https://mailchimp.com/help/about-open-tracking/). Defaults to `true`.
    boolean opens?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the HTML version of the Automation. Defaults to `true`.
    boolean html_clicks?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the plain-text version of the Automation. Defaults to `true`.
    boolean text_clicks?;
    # Deprecated
    boolean goal_tracking?;
    # Whether to enable e-commerce tracking.
    boolean ecomm360?;
    # The custom slug for [Google Analytics](https://mailchimp.com/help/integrate-google-analytics-with-mailchimp/) tracking (max of 50 bytes).
    string google_analytics?;
    # The custom slug for [ClickTale](https://mailchimp.com/help/additional-tracking-options-for-campaigns/) tracking (max of 50 bytes).
    string clicktale?;
    # Deprecated
    SalesforceCrmTracking1 salesforce?;
    # Deprecated
    CapsuleCrmTracking1 capsule?;
};

# The verified domains currently on the account.
public type VerifiedDomains2 record {
    # The e-mail address at the domain you want to verify. This will receive a two-factor challenge to be used in the verify action.
    string verification_email;
};

# The verified domains currently on the account.
public type VerifiedDomains1 record {
    # The domains on the account
    VerifiedDomains[] domains?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
};

# The settings specific to A/B test campaigns.
public type AbTestOptions record {
    # The combination that performs the best. This may be determined automatically by click rate, open rate, or total revenue -- or you may choose manually based on the reporting data you find the most valuable. For Multivariate Campaigns testing send_time, winner_criteria is ignored. For Multivariate Campaigns with 'manual' as the winner_criteria, the winner must be chosen in the Mailchimp web application.
    string winner_criteria;
    # The number of minutes to wait before choosing the winning campaign. The value of wait_time must be greater than 0 and in whole hours, specified in minutes.
    int wait_time?;
    # The percentage of recipients to send the test combinations to, must be a value between 10 and 100.
    int test_size?;
    # The possible subject lines to test. If no subject lines are provided, settings.subject_line will be used.
    string[] subject_lines?;
    # The possible send times to test. The times provided should be in the format YYYY-MM-DD HH:MM:SS. If send_times are provided to test, the test_size will be set to 100% and winner_criteria will be ignored.
    string[] send_times?;
    # The possible from names. The number of from_names provided must match the number of reply_to_addresses. If no from_names are provided, settings.from_name will be used.
    string[] from_names?;
    # The possible reply-to addresses. The number of reply_to_addresses provided must match the number of from_names. If no reply_to_addresses are provided, settings.reply_to will be used.
    string[] reply_to_addresses?;
};

# The possible sources of any events that can trigger the webhook and whether they are enabled.
public type Sources1 record {
    # Whether the webhook is triggered by subscriber-initiated actions.
    boolean user?;
    # Whether the webhook is triggered by admin-initiated actions in the web interface.
    boolean admin?;
    # Whether the webhook is triggered by actions initiated via the API.
    boolean api?;
};

# Information about subscribers in an Automation email queue.
public type SubscriberInAutomationQueue record {
    # The list member's email address.
    string email_address;
};

# A list of tags matching the input query.
public type TagSearchResults record {
    # A list of matching tags.
    TagSearchResultsTags[] tags?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
};

# The merge field (formerly merge vars) for a list. These correspond to merge fields in Mailchimp's lists and subscriber profiles.
public type CollectionOfMergeFields record {
    # An array of objects, each representing a merge field resource.
    MergeField3[] merge_fields?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Stats for the list. Many of these are cached for at least five minutes.
public type Statistics record {
    # The number of active members in the list.
    int member_count?;
    # The number of contacts in the list, including subscribed, unsubscribed, pending, cleaned, deleted, transactional, and those that need to be reconfirmed. Requires include_total_contacts query parameter to be included.
    int total_contacts?;
    # The number of members who have unsubscribed from the list.
    int unsubscribe_count?;
    # The number of members cleaned from the list.
    int cleaned_count?;
    # The number of active members in the list since the last campaign was sent.
    int member_count_since_send?;
    # The number of members who have unsubscribed since the last campaign was sent.
    int unsubscribe_count_since_send?;
    # The number of members cleaned from the list since the last campaign was sent.
    int cleaned_count_since_send?;
    # The number of campaigns in any status that use this list.
    int campaign_count?;
    # The date and time the last campaign was sent to this list in ISO 8601 format. This is updated when a campaign is sent to 10 or more recipients.
    string campaign_last_sent?;
    # The number of merge vars for this list (not EMAIL, which is required).
    int merge_field_count?;
    # The average number of subscriptions per month for the list (not returned if we haven't calculated it yet).
    decimal avg_sub_rate?;
    # The average number of unsubscriptions per month for the list (not returned if we haven't calculated it yet).
    decimal avg_unsub_rate?;
    # The target number of subscriptions per month for the list to keep it growing (not returned if we haven't calculated it yet).
    decimal target_sub_rate?;
    # The average open rate (a percentage represented as a number between 0 and 100) per campaign for the list (not returned if we haven't calculated it yet).
    decimal open_rate?;
    # The average click rate (a percentage represented as a number between 0 and 100) per campaign for the list (not returned if we haven't calculated it yet).
    decimal click_rate?;
    # The date and time of the last time someone subscribed to this list in ISO 8601 format.
    string last_sub_date?;
    # The date and time of the last time someone unsubscribed from this list in ISO 8601 format.
    string last_unsub_date?;
};

# An array of objects, each representing an authorized application.
public type InlineResponse2001 record {
    # An array of objects, each representing an authorized application.
    InlineResponse2001Apps[] apps?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An array of objects, each representing an Automation workflow.
public type InlineResponse2003 record {
    # An array of objects, each representing an Automation workflow.
    AutomationWorkflow2[] automations?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An authorized app.
public type InlineResponse2002 record {
    # The ID for the application.
    int id?;
    # The name of the application.
    string name?;
    # A short description of the application.
    string description?;
    # An array of usernames for users who have linked the app.
    string[] users?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An array of campaigns.
public type InlineResponse2005 record {
    # An array of campaigns.
    Campaign4[] campaigns?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An automation workflow
public type InlineResponse2004 record {
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # A string that uniquely identifies an email in an Automation workflow.
    string email_id?;
    # An array of objects, each representing a subscriber queue for an email in an Automation workflow.
    SubscriberInAutomationQueue3[] queue?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The schedule for sending the RSS Campaign.
public type SendingSchedule record {
    # The hour to send the campaign in local time. Acceptable hours are 0-23. For example, '4' would be 4am in [your account's default time zone](https://mailchimp.com/help/set-account-defaults/).
    int hour?;
    # The days of the week to send a daily RSS Campaign.
    DailySendingDays daily_send?;
    # The day of the week to send a weekly RSS Campaign.
    string weekly_send_day?;
    # The day of the month to send a monthly RSS Campaign. Acceptable days are 0-31, where '0' is always the last day of a month. Months with fewer than the selected number of days will not have an RSS campaign sent out that day. For example, RSS Campaigns set to send on the 30th will not go out in February.
    decimal monthly_send_date?;
};

# The settings for your campaign, including subject, from name, reply-to address, and more.
public type CampaignSettings1 record {
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the campaign.
    string title?;
    # The 'from' name on the campaign (not an email address).
    string from_name?;
    # The reply-to email address for the campaign. Note: while this field is not required for campaign creation, it is required for sending.
    string reply_to?;
    # Use Mailchimp Conversation feature to manage out-of-office replies.
    boolean use_conversation?;
    # The campaign's custom 'To' name. Typically the first name [merge field](https://mailchimp.com/help/getting-started-with-merge-tags/).
    string to_name?;
    # If the campaign is listed in a folder, the id for that folder.
    string folder_id?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the campaign. Defaults to `true`.
    boolean authenticate?;
    # Automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the campaign.
    boolean auto_footer?;
    # Automatically inline the CSS included with the campaign content.
    boolean inline_css?;
    # Automatically tweet a link to the [campaign archive](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) page when the campaign is sent.
    boolean auto_tweet?;
    # An array of [Facebook](https://mailchimp.com/help/connect-or-disconnect-the-facebook-integration/) page ids to auto-post to.
    string[] auto_fb_post?;
    # Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to `true`.
    boolean fb_comments?;
    # The id of the template to use.
    int template_id?;
};

# The settings for your campaign, including subject, from name, reply-to address, and more.
public type CampaignSettings2 record {
    # The subject line for the campaign.
    string subject_line;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the campaign.
    string title?;
    # The 'from' name on the campaign (not an email address).
    string from_name;
    # The reply-to email address for the campaign.
    string reply_to;
    # Use Mailchimp Conversation feature to manage out-of-office replies.
    boolean use_conversation?;
    # The campaign's custom 'To' name. Typically the first name [merge field](https://mailchimp.com/help/getting-started-with-merge-tags/).
    string to_name?;
    # If the campaign is listed in a folder, the id for that folder.
    string folder_id?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the campaign. Defaults to `true`.
    boolean authenticate?;
    # Automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the campaign.
    boolean auto_footer?;
    # Automatically inline the CSS included with the campaign content.
    boolean inline_css?;
    # Automatically tweet a link to the [campaign archive](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) page when the campaign is sent.
    boolean auto_tweet?;
    # An array of [Facebook](https://mailchimp.com/help/connect-or-disconnect-the-facebook-integration/) page ids to auto-post to.
    string[] auto_fb_post?;
    # Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to `true`.
    boolean fb_comments?;
    # The id of the template to use.
    int template_id?;
};

# List settings for the Automation.
public type List record {
    # The id of the List.
    string list_id?;
    # The id of the store.
    string store_id?;
};

# A summary of an individual Automation workflow email.
public type AutomationWorkflowEmail1 record {
    # A string that uniquely identifies the Automation email.
    string id?;
    # The ID used in the Mailchimp web application. View this automation in your Mailchimp account at `https://{dc}.admin.mailchimp.com/campaigns/show/?id={web_id}`.
    int web_id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # The position of an Automation email in a workflow.
    int position?;
    # The delay settings for an Automation email.
    AutomationDelay1 delay?;
    # The date and time the campaign was created in ISO 8601 format.
    string create_time?;
    # The date and time the campaign was started in ISO 8601 format.
    string start_time?;
    # The link to the campaign's archive version in ISO 8601 format.
    string archive_url?;
    # The current status of the campaign.
    string status?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    #  The date and time a campaign was sent in ISO 8601 format
    string send_time?;
    # How the campaign's content is put together ('template', 'drag_and_drop', 'html', 'url').
    string content_type?;
    # Determines if the automation email needs its blocks refreshed by opening the web-based campaign editor.
    boolean needs_block_refresh?;
    # Determines if the campaign contains the *|BRAND:LOGO|* merge tag.
    boolean has_logo_merge_tag?;
    # List settings for the campaign.
    List11 recipients?;
    # Settings for the campaign including the email subject, from name, and from email address.
    CampaignSettings5 settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions1 tracking?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # Available triggers for Automation workflows.
    AutomationTrigger1 trigger_settings?;
    # For sent campaigns, a summary of opens and clicks.
    CampaignReportSummary3 report_summary?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The last 50 member events for a list.
public type MemberActivityEvents record {
    # An array of objects, each representing a member event.
    MemberActivity2[] activity?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles.
public type MergeField3 record {
    # An unchanging id for the merge field.
    int merge_id?;
    # The tag used in Mailchimp campaigns and for the /members endpoint.
    string tag?;
    # The name of the merge field.
    string name?;
    # The type for the merge field.
    string 'type?;
    # The boolean value if the merge field is required.
    boolean required?;
    # The default value for the merge field if `null`.
    string default_value?;
    # Whether the merge field is displayed on the signup form.
    boolean 'public?;
    # The order that the merge field displays on the list signup form.
    int display_order?;
    # Extra options for some merge field types.
    MergeFieldOptions2 options?;
    # Extra text to help the subscriber fill out the form.
    string help_text?;
    # A string that identifies this merge field collections' list.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles.
public type MergeField2 record {
    # The tag used in Mailchimp campaigns and for the /members endpoint.
    string tag?;
    # The name of the merge field.
    string name;
    # The boolean value if the merge field is required.
    boolean required?;
    # The default value for the merge field if `null`.
    string default_value?;
    # Whether the merge field is displayed on the signup form.
    boolean 'public?;
    # The order that the merge field displays on the list signup form.
    int display_order?;
    # Extra options for some merge field types.
    MergeFieldOptions1 options?;
    # Extra text to help the subscriber fill out the form.
    string help_text?;
};

# Settings for the campaign including the email subject, from name, and from email address.
public type CampaignSettings5 record {
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the campaign.
    string title?;
    # The 'from' name on the campaign (not an email address).
    string from_name?;
    # The reply-to email address for the campaign.
    string reply_to?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the campaign. Defaults to `true`.
    boolean authenticate?;
    # Automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the campaign.
    boolean auto_footer?;
    # Automatically inline the CSS included with the campaign content.
    boolean inline_css?;
    # Automatically tweet a link to the [campaign archive](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) page when the campaign is sent.
    boolean auto_tweet?;
    # An array of [Facebook](https://mailchimp.com/help/connect-or-disconnect-the-facebook-integration/) page ids to auto-post to.
    string[] auto_fb_post?;
    # Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to `true`.
    boolean fb_comments?;
    # The id for the template used in this campaign.
    int template_id?;
    # Whether the campaign uses the drag-and-drop editor.
    boolean drag_and_drop?;
};

# The settings for your campaign, including subject, from name, reply-to address, and more.
public type CampaignSettings3 record {
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the campaign.
    string title?;
    # The 'from' name on the campaign (not an email address).
    string from_name?;
    # The reply-to email address for the campaign.
    string reply_to?;
    # Use Mailchimp Conversation feature to manage replies.
    boolean use_conversation?;
    # The campaign's custom 'To' name. Typically the first name [merge field](https://mailchimp.com/help/getting-started-with-merge-tags/).
    string to_name?;
    # If the campaign is listed in a folder, the id for that folder.
    string folder_id?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the campaign. Defaults to `true`.
    boolean authenticate?;
    # Automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the campaign.
    boolean auto_footer?;
    # Automatically inline the CSS included with the campaign content.
    boolean inline_css?;
    # Automatically tweet a link to the [campaign archive](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) page when the campaign is sent.
    boolean auto_tweet?;
    # An array of [Facebook](https://mailchimp.com/help/connect-or-disconnect-the-facebook-integration/) page ids to auto-post to.
    string[] auto_fb_post?;
    # Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to `true`.
    boolean fb_comments?;
    # Send this campaign using [Timewarp](https://mailchimp.com/help/use-timewarp/).
    boolean timewarp?;
    # The id for the template used in this campaign.
    int template_id?;
    # Whether the campaign uses the drag-and-drop editor.
    boolean drag_and_drop?;
};

# The settings for your campaign, including subject, from name, reply-to address, and more.
public type CampaignSettings4 record {
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the campaign.
    string title?;
    # The 'from' name on the campaign (not an email address).
    string from_name?;
    # The reply-to email address for the campaign.
    string reply_to?;
    # Use Mailchimp Conversation feature to manage out-of-office replies.
    boolean use_conversation?;
    # The campaign's custom 'To' name. Typically the first name [merge field](https://mailchimp.com/help/getting-started-with-merge-tags/).
    string to_name?;
    # If the campaign is listed in a folder, the id for that folder.
    string folder_id?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the campaign. Defaults to `true`.
    boolean authenticate?;
    # Automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the campaign.
    boolean auto_footer?;
    # Automatically inline the CSS included with the campaign content.
    boolean inline_css?;
    # Automatically tweet a link to the [campaign archive](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) page when the campaign is sent.
    boolean auto_tweet?;
    # An array of [Facebook](https://mailchimp.com/help/connect-or-disconnect-the-facebook-integration/) page ids to auto-post to.
    string[] auto_fb_post?;
    # Allows Facebook comments on the campaign (also force-enables the Campaign Archive toolbar). Defaults to `true`.
    boolean fb_comments?;
    # Send this campaign using [Timewarp](https://mailchimp.com/help/use-timewarp/).
    boolean timewarp?;
    # The id for the template used in this campaign.
    int template_id?;
    # Whether the campaign uses the drag-and-drop editor.
    boolean drag_and_drop?;
};

# Member activity events.
public type MemberActivity2 record {
    # The type of action recorded for the subscriber.
    string action?;
    # The date and time recorded for the action.
    string timestamp?;
    # For clicks, the URL the subscriber clicked on.
    string url?;
    # The type of campaign that was sent.
    string 'type?;
    # The web-based ID for the campaign.
    string campaign_id?;
    # If set, the campaign's title.
    string title?;
    # The ID of the parent campaign.
    string parent_campaign?;
};

# A single marketing permission a subscriber has either opted-in to or opted-out of.
public type MarketingPermission1 record {
    # The id for the marketing permission on the list
    string marketing_permission_id?;
    # The text of the marketing permission.
    string text?;
    # If the subscriber has opted-in to the marketing permission.
    boolean enabled?;
};

# A summary of an individual Automation workflow's settings and content.
public type AutomationWorkflow1 record {
    # A string that identifies the Automation.
    string id?;
    # The date and time the Automation was created in ISO 8601 format.
    string create_time?;
    # The date and time the Automation was started in ISO 8601 format.
    string start_time?;
    # The current status of the Automation.
    string status?;
    # The total number of emails sent for the Automation.
    int emails_sent?;
    # List settings for the Automation.
    List9 recipients?;
    # The settings for the Automation workflow.
    AutomationCampaignSettings1 settings?;
    # The tracking options for the Automation.
    AutomationTrackingOptions tracking?;
    # Available triggers for Automation workflows.
    AutomationTrigger1 trigger_settings?;
    # A summary of opens and clicks for sent campaigns.
    CampaignReportSummary2 report_summary?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles.
public type MergeField1 record {
    # An unchanging id for the merge field.
    int merge_id?;
    # The tag used in Mailchimp campaigns and for the /members endpoint.
    string tag?;
    # The name of the merge field.
    string name?;
    # The type for the merge field.
    string 'type?;
    # The boolean value if the merge field is required.
    boolean required?;
    # The default value for the merge field if `null`.
    string default_value?;
    # Whether the merge field is displayed on the signup form.
    boolean 'public?;
    # The order that the merge field displays on the list signup form.
    int display_order?;
    # Extra options for some merge field types.
    MergeFieldOptions2 options?;
    # Extra text to help the subscriber fill out the form.
    string help_text?;
    # A string that identifies this merge field collections' list.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of an individual Automation workflow's settings and content.
public type AutomationWorkflow2 record {
    # A string that identifies the Automation.
    string id?;
    # The date and time the Automation was created in ISO 8601 format.
    string create_time?;
    # The date and time the Automation was started in ISO 8601 format.
    string start_time?;
    # The current status of the Automation.
    string status?;
    # The total number of emails sent for the Automation.
    int emails_sent?;
    # List settings for the Automation.
    List9 recipients?;
    # The settings for the Automation workflow.
    AutomationCampaignSettings1 settings?;
    # The tracking options for the Automation.
    AutomationTrackingOptions tracking?;
    # Available triggers for Automation workflows.
    AutomationTrigger1 trigger_settings?;
    # A summary of opens and clicks for sent campaigns.
    CampaignReportSummary2 report_summary?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
public type CampaignDefaults record {
    # The default from name for campaigns sent to this list.
    string from_name;
    # The default from email for campaigns sent to this list.
    string from_email;
    # The default subject line for campaigns sent to this list.
    string subject;
    # The default language for this lists's forms.
    string language;
};

# The settings for the Automation workflow.
public type AutomationCampaignSettings1 record {
    # The title of the Automation.
    string title?;
    # The 'from' name for the Automation (not an email address).
    string from_name?;
    # The reply-to email address for the Automation.
    string reply_to?;
    # Whether to use Mailchimp Conversation feature to manage replies
    boolean use_conversation?;
    # The Automation's custom 'To' name, typically the first name [merge field](https://mailchimp.com/help/getting-started-with-merge-tags/).
    string to_name?;
    # Whether Mailchimp [authenticated](https://mailchimp.com/help/about-email-authentication/) the Automation. Defaults to `true`.
    boolean authenticate?;
    # Whether to automatically append Mailchimp's [default footer](https://mailchimp.com/help/about-campaign-footers/) to the Automation.
    boolean auto_footer?;
    # Whether to automatically inline the CSS included with the Automation content.
    boolean inline_css?;
};

# A specific note for a specific member.
public type MemberNotes record {
    # The content of the note. Note length is limited to 1,000 characters.
    string note?;
};

# For sent campaigns, a summary of opens, clicks, and e-commerce data.
public type CampaignReportSummary1 record {
    # The total number of opens for a campaign.
    int opens?;
    # The number of unique opens.
    int unique_opens?;
    # The number of unique opens divided by the total number of successful deliveries.
    decimal open_rate?;
    # The total number of clicks for an campaign.
    int clicks?;
    # The number of unique clicks.
    int subscriber_clicks?;
    # The number of unique clicks divided by the total number of successful deliveries.
    decimal click_rate?;
    # E-Commerce stats for a campaign.
    EcommerceReport1 ecommerce?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type ListMembers record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # Email address for a subscriber.
    string email_address?;
    # An identifier for the address across all of Mailchimp.
    string unique_email_id?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # Open and click rates for this subscriber.
    SubscriberStats stats?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscriber confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # Star rating for this member, between 1 and 5.
    int member_rating?;
    # The date and time the member's info was last changed in ISO 8601 format.
    string last_changed?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The list member's email client.
    string email_client?;
    # Subscriber location information.
    Location1 location?;
    # The most recent Note added about this member.
    Notes last_note?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# List settings for the campaign.
public type List11 record {
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The name of the list.
    string list_name?;
    # A description of the [segment](https://mailchimp.com/help/getting-started-with-groups/) used for the campaign. Formatted as a string marked up with HTML.
    string segment_text?;
    # Count of the recipients on the associated list. Formatted as an integer.
    int recipient_count?;
    # An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
    SegmentOptions1 segment_opts?;
};

public type ActionsTestBody record {
    # An array of email addresses to send the test email to.
    string[] test_emails;
    # Choose the type of test email to send.
    string send_type;
};

# Do particular authorization constraints around this collection limit creation of new instances?
public type CollectionAuthorization record {
    # May the user create additional instances of this resource?
    boolean may_create;
    # How many total instances of this resource are allowed? This is independent of any filter conditions applied to the query. As a special case, -1 indicates unlimited.
    int max_instances;
    # How many total instances of this resource are already in use? This is independent of any filter conditions applied to the query. Value may be larger than max_instances. As a special case, -1 is returned when access is unlimited.
    int current_total_instances?;
};

# The tracking options for a campaign.
public type CampaignTrackingOptions1 record {
    # Whether to [track opens](https://mailchimp.com/help/about-open-tracking/). Defaults to `true`.
    boolean opens?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the HTML version of the campaign. Defaults to `true`.
    boolean html_clicks?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the plain-text version of the campaign. Defaults to `true`.
    boolean text_clicks?;
    # Deprecated
    boolean goal_tracking?;
    # Whether to enable e-commerce tracking.
    boolean ecomm360?;
    # The custom slug for [Google Analytics](https://mailchimp.com/help/integrate-google-analytics-with-mailchimp/) tracking (max of 50 bytes).
    string google_analytics?;
    # The custom slug for [Click Tale](https://mailchimp.com/help/additional-tracking-options-for-campaigns/) tracking (max of 50 bytes).
    string clicktale?;
    # Deprecated
    SalesforceCrmTracking1 salesforce?;
    # Deprecated
    CapsuleCrmTracking2 capsule?;
};

# For sent campaigns, a summary of opens and clicks.
public type CampaignReportSummary3 record {
    # The total number of opens for a campaign.
    int opens?;
    # The number of unique opens.
    int unique_opens?;
    # The number of unique opens divided by the total number of successful deliveries.
    decimal open_rate?;
    # The total number of clicks for an campaign.
    int clicks?;
    # The number of unique clicks.
    int subscriber_clicks?;
    # The number of unique clicks divided by the total number of successful deliveries.
    decimal click_rate?;
};

# A summary of opens and clicks for sent campaigns.
public type CampaignReportSummary2 record {
    # The total number of opens for a campaign.
    int opens?;
    # The number of unique opens.
    int unique_opens?;
    # The number of unique opens divided by the total number of successful deliveries.
    decimal open_rate?;
    # The total number of clicks for an campaign.
    int clicks?;
    # The number of unique clicks.
    int subscriber_clicks?;
    # The number of unique clicks, divided by the total number of successful deliveries.
    decimal click_rate?;
};

# A specific note for a specific member.
public type MemberNotes1 record {
    # The note id.
    int id?;
    # The date and time the note was created in ISO 8601 format.
    string created_at?;
    # The author of the note.
    string created_by?;
    # The date and time the note was last updated in ISO 8601 format.
    string updated_at?;
    # The content of the note.
    string note?;
    # The unique id for the list.
    string list_id?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A specific note for a specific member.
public type MemberNotes2 record {
    # The content of the note. Note length is limited to 1,000 characters.
    string note?;
};

# A specific note for a specific member.
public type MemberNotes3 record {
    # The note id.
    int id?;
    # The date and time the note was created in ISO 8601 format.
    string created_at?;
    # The author of the note.
    string created_by?;
    # The date and time the note was last updated in ISO 8601 format.
    string updated_at?;
    # The content of the note.
    string note?;
    # The unique id for the list.
    string list_id?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The delay settings for an automation email.
public type AutomationDelay record {
    # The delay amount for an automation email.
    int amount?;
    # The type of delay for an automation email.
    string 'type?;
    # Whether the delay settings describe before or after the delay action of an automation email.
    string direction?;
    # The action that triggers the delay of an automation emails.
    string action;
};

# A month-by-month summary of a specific list's growth activity.
public type GrowthHistory record {
    # An array of objects, each representing a monthly growth report for a list.
    GrowthHistory2[] history?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The send checklist for the campaign.
public type SendChecklist record {
    # Whether the campaign is ready to send.
    boolean is_ready?;
    # A list of feedback items to review before sending your campaign.
    SendChecklistItems[] items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A specific feedback message from a specific campaign.
public type CampaignFeedback2 record {
    # The block id for the editable block that the feedback addresses.
    int block_id?;
    # The content of the feedback.
    string message?;
    # The status of feedback.
    boolean is_complete?;
};

# A specific feedback message from a specific campaign.
public type CampaignFeedback1 record {
    # The individual id for the feedback item.
    int feedback_id?;
    # If a reply, the id of the parent feedback item.
    int parent_id?;
    # The block id for the editable block that the feedback addresses.
    int block_id?;
    # The content of the feedback.
    string message?;
    # The status of feedback.
    boolean is_complete?;
    # The login name of the user who created the feedback.
    string created_by?;
    # The date and time the feedback item was created in ISO 8601 format.
    string created_at?;
    # The date and time the feedback was last updated in ISO 8601 format.
    string updated_at?;
    # The source of the feedback.
    string 'source?;
    # The unique id for the campaign.
    string campaign_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A specific feedback message from a specific campaign.
public type CampaignFeedback3 record {
    # The individual id for the feedback item.
    int feedback_id?;
    # If a reply, the id of the parent feedback item.
    int parent_id?;
    # The block id for the editable block that the feedback addresses.
    int block_id?;
    # The content of the feedback.
    string message;
    # The status of feedback.
    boolean is_complete?;
    # The login name of the user who created the feedback.
    string created_by?;
    # The date and time the feedback item was created in ISO 8601 format.
    string created_at?;
    # The date and time the feedback was last updated in ISO 8601 format.
    string updated_at?;
    # The source of the feedback.
    string 'source?;
    # The unique id for the campaign.
    string campaign_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options, specific to an RSS campaign.
public type RssOptions record {
    # The URL for the RSS feed.
    string feed_url;
    # The frequency of the RSS Campaign.
    string frequency;
    # The schedule for sending the RSS Campaign.
    SendingSchedule schedule?;
    # Whether to add CSS to images in the RSS feed to constrain their width in campaigns.
    boolean constrain_rss_img?;
};

public type ListLocation record {
    # The name of the country.
    string country?;
    # The ISO 3166 2 digit country code.
    string cc?;
    # The percent of subscribers in the country.
    decimal percent?;
    # The total number of subscribers in the country.
    int total?;
};

# Available triggers for Automation workflows.
public type AutomationTrigger1 record {
    # The type of Automation workflow.
    string workflow_type;
    # The title of the workflow type.
    string workflow_title?;
    # A workflow's runtime settings for an Automation.
    AutomationWorkflowRuntimeSettings runtime?;
    # The number of emails in the Automation workflow.
    int workflow_emails_count?;
};

# Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application.
public type InterestCategory record {
    # The text description of this category. This field appears on signup forms and is often phrased as a question.
    string title;
    # The order that the categories are displayed in the list. Lower numbers display first.
    int display_order?;
    # Determines how this category’s interests appear on signup forms.
    string 'type;
};

# The possible sources of any events that can trigger the webhook and whether they are enabled.
public type Sources record {
    # Whether the webhook is triggered by subscriber-initiated actions.
    boolean user?;
    # Whether the webhook is triggered by admin-initiated actions in the web interface.
    boolean admin?;
    # Whether the webhook is triggered by actions initiated via the API.
    boolean api?;
};

# Information about a specific list.
public type SubscriberList2 record {
    # The name of the list.
    string name;
    # [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
    ListContact1 contact;
    # The [permission reminder](https://mailchimp.com/help/edit-the-permission-reminder/) for the list.
    string permission_reminder;
    # Whether campaigns for this list use the [Archive Bar](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) in archives by default.
    boolean use_archive_bar?;
    # [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
    CampaignDefaults campaign_defaults;
    # The email address to send [subscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_subscribe?;
    # The email address to send [unsubscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_unsubscribe?;
    # Whether the list supports [multiple formats for emails](https://mailchimp.com/help/change-audience-name-defaults/). When set to `true`, subscribers can choose whether they want to receive HTML or plain-text emails. When set to `false`, subscribers will receive HTML emails, with a plain-text alternative backup.
    boolean email_type_option;
    # Whether or not to require the subscriber to confirm subscription via email.
    boolean double_optin?;
    # Whether or not the list has marketing permissions (eg. GDPR) enabled.
    boolean marketing_permissions?;
};

# Information about a specific list.
public type SubscriberList3 record {
    # A string that uniquely identifies this list.
    string id?;
    # The ID used in the Mailchimp web application. View this list in your Mailchimp account at `https://{dc}.admin.mailchimp.com/lists/members/?id={web_id}`.
    int web_id?;
    # The name of the list.
    string name?;
    # [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
    ListContact2 contact?;
    # The [permission reminder](https://mailchimp.com/help/edit-the-permission-reminder/) for the list.
    string permission_reminder?;
    # Whether campaigns for this list use the [Archive Bar](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) in archives by default.
    boolean use_archive_bar?;
    # [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
    CampaignDefaults1 campaign_defaults?;
    # The email address to send [subscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_subscribe?;
    # The email address to send [unsubscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_unsubscribe?;
    # The date and time that this list was created in ISO 8601 format.
    string date_created?;
    # An auto-generated activity score for the list (0-5).
    int list_rating?;
    # Whether the list supports [multiple formats for emails](https://mailchimp.com/help/change-audience-name-defaults/). When set to `true`, subscribers can choose whether they want to receive HTML or plain-text emails. When set to `false`, subscribers will receive HTML emails, with a plain-text alternative backup.
    boolean email_type_option?;
    # Our [url shortened](https://mailchimp.com/help/share-your-signup-form/) version of this list's subscribe form.
    string subscribe_url_short?;
    # The full version of this list's subscribe form (host will vary).
    string subscribe_url_long?;
    # The list's [Email Beamer](https://mailchimp.com/help/use-email-beamer-to-create-a-campaign/) address.
    string beamer_address?;
    # Legacy - visibility settings are no longer used
    string visibility?;
    # Whether or not to require the subscriber to confirm subscription via email.
    boolean double_optin?;
    # Whether or not this list has a welcome automation connected. Welcome Automations: welcomeSeries, singleWelcome, emailFollowup.
    boolean has_welcome?;
    # Whether or not the list has marketing permissions (eg. GDPR) enabled.
    boolean marketing_permissions?;
    # Any list-specific modules installed for this list.
    string[] modules?;
    # Stats for the list. Many of these are cached for at least five minutes.
    Statistics stats?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A single marketing permission a subscriber has either opted-in to or opted-out of.
public type MarketingPermission record {
    # The id for the marketing permission on the list
    string marketing_permission_id?;
    # If the subscriber has opted-in to the marketing permission.
    boolean enabled?;
};

# Information about a specific list.
public type SubscriberList1 record {
    # A string that uniquely identifies this list.
    string id?;
    # The ID used in the Mailchimp web application. View this list in your Mailchimp account at `https://{dc}.admin.mailchimp.com/lists/members/?id={web_id}`.
    int web_id?;
    # The name of the list.
    string name?;
    # [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
    ListContact2 contact?;
    # The [permission reminder](https://mailchimp.com/help/edit-the-permission-reminder/) for the list.
    string permission_reminder?;
    # Whether campaigns for this list use the [Archive Bar](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) in archives by default.
    boolean use_archive_bar?;
    # [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
    CampaignDefaults1 campaign_defaults?;
    # The email address to send [subscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_subscribe?;
    # The email address to send [unsubscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_unsubscribe?;
    # The date and time that this list was created in ISO 8601 format.
    string date_created?;
    # An auto-generated activity score for the list (0-5).
    int list_rating?;
    # Whether the list supports [multiple formats for emails](https://mailchimp.com/help/change-audience-name-defaults/). When set to `true`, subscribers can choose whether they want to receive HTML or plain-text emails. When set to `false`, subscribers will receive HTML emails, with a plain-text alternative backup.
    boolean email_type_option?;
    # Our [url shortened](https://mailchimp.com/help/share-your-signup-form/) version of this list's subscribe form.
    string subscribe_url_short?;
    # The full version of this list's subscribe form (host will vary).
    string subscribe_url_long?;
    # The list's [Email Beamer](https://mailchimp.com/help/use-email-beamer-to-create-a-campaign/) address.
    string beamer_address?;
    # Legacy - visibility settings are no longer used
    string visibility?;
    # Whether or not to require the subscriber to confirm subscription via email.
    boolean double_optin?;
    # Whether or not this list has a welcome automation connected. Welcome Automations: welcomeSeries, singleWelcome, emailFollowup.
    boolean has_welcome?;
    # Whether or not the list has marketing permissions (eg. GDPR) enabled.
    boolean marketing_permissions?;
    # Any list-specific modules installed for this list.
    string[] modules?;
    # Stats for the list. Many of these are cached for at least five minutes.
    Statistics stats?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A specific feedback message from a specific campaign.
public type CampaignFeedback record {
    # The block id for the editable block that the feedback addresses.
    int block_id?;
    # The content of the feedback.
    string message;
    # The status of feedback.
    boolean is_complete?;
};

# A summary of a subscriber removed from an Automation workflow.
public type SubscriberRemovedFromAutomationWorkflow record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # A string that uniquely identifies a list.
    string list_id?;
    # The list member's email address.
    string email_address?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A new event for a specific list member
public type Events record {
    # The name for this type of event ('purchased', 'visited', etc). Must be 2-30 characters in length
    string name;
    # An optional list of properties
    record {} properties?;
    # Events created with the is_syncing value set to `true` will not trigger automations.
    boolean is_syncing?;
    # The date and time the event occurred in ISO 8601 format.
    string occurred_at?;
};

# A summary of an individual Automation workflow email.
public type AutomationWorkflowEmail record {
    # A string that uniquely identifies the Automation email.
    string id?;
    # The ID used in the Mailchimp web application. View this automation in your Mailchimp account at `https://{dc}.admin.mailchimp.com/campaigns/show/?id={web_id}`.
    int web_id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # The position of an Automation email in a workflow.
    int position?;
    # The delay settings for an Automation email.
    AutomationDelay1 delay?;
    # The date and time the campaign was created in ISO 8601 format.
    string create_time?;
    # The date and time the campaign was started in ISO 8601 format.
    string start_time?;
    # The link to the campaign's archive version in ISO 8601 format.
    string archive_url?;
    # The current status of the campaign.
    string status?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    #  The date and time a campaign was sent in ISO 8601 format
    string send_time?;
    # How the campaign's content is put together ('template', 'drag_and_drop', 'html', 'url').
    string content_type?;
    # Determines if the automation email needs its blocks refreshed by opening the web-based campaign editor.
    boolean needs_block_refresh?;
    # Determines if the campaign contains the *|BRAND:LOGO|* merge tag.
    boolean has_logo_merge_tag?;
    # List settings for the campaign.
    List11 recipients?;
    # Settings for the campaign including the email subject, from name, and from email address.
    CampaignSettings5 settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions1 tracking?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # Available triggers for Automation workflows.
    AutomationTrigger1 trigger_settings?;
    # For sent campaigns, a summary of opens and clicks.
    CampaignReportSummary3 report_summary?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Use this template to generate the HTML content of the campaign
public type TemplateContent record {
    # The id of the template to use.
    int id;
    # Content for the sections of the template. Each key should be the unique [mc:edit area](https://mailchimp.com/help/create-editable-content-areas-with-mailchimps-template-language/) name from the template.
    record {} sections?;
};

# A summary of an individual Automation workflow's settings and content.
public type AutomationWorkflow record {
    # List settings for the Automation.
    List recipients;
    # The settings for the Automation workflow.
    AutomationCampaignSettings settings?;
    # Trigger settings for the Automation.
    AutomationTrigger trigger_settings;
};

# A collection of subscriber lists for this account. Lists contain subscribers who have opted-in to receive correspondence from you or your organization.
public type SubscriberLists record {
    # An array of objects, each representing a list.
    SubscriberList3[] lists;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # Do particular authorization constraints around this collection limit creation of new instances?
    CollectionAuthorization constraints?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Submit a response to the verification challenge and verify a domain for sending.
public type ActionsVerifyBody record {
    # The code that was sent to the email address provided when adding a new domain to verify.
    string code;
};

# The schedule for sending the RSS Campaign.
public type SendingSchedule1 record {
    # The hour to send the campaign in local time. Acceptable hours are 0-23. For example, '4' would be 4am in [your account's default time zone](https://mailchimp.com/help/set-account-details/).
    int hour?;
    # The days of the week to send a daily RSS Campaign.
    DailySendingDays daily_send?;
    # The day of the week to send a weekly RSS Campaign.
    string weekly_send_day?;
    # The day of the month to send a monthly RSS Campaign. Acceptable days are 0-31, where '0' is always the last day of a month. Months with fewer than the selected number of days will not have an RSS campaign sent out that day. For example, RSS Campaigns set to send on the 30th will not go out in February.
    decimal monthly_send_date?;
};

# [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
public type RssOptions1 record {
    # The URL for the RSS feed.
    string feed_url;
    # The frequency of the RSS Campaign.
    string frequency;
    # The schedule for sending the RSS Campaign.
    SendingSchedule schedule?;
    # Whether to add CSS to images in the RSS feed to constrain their width in campaigns.
    boolean constrain_rss_img?;
};

# Deprecated
public type CapsuleCrmTracking record {
    # Update contact notes for a campaign based on subscriber email addresses.
    boolean notes?;
};

# [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
public type RssOptions3 record {
    # The URL for the RSS feed.
    string feed_url?;
    # The frequency of the RSS Campaign.
    string frequency?;
    # The schedule for sending the RSS Campaign.
    SendingSchedule schedule?;
    # The date the campaign was last sent.
    string last_sent?;
    # Whether to add CSS to images in the RSS feed to constrain their width in campaigns.
    boolean constrain_rss_img?;
};

# [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
public type RssOptions2 record {
    # The URL for the RSS feed.
    string feed_url;
    # The frequency of the RSS Campaign.
    string frequency;
    # The schedule for sending the RSS Campaign.
    SendingSchedule1 schedule?;
    # The date the campaign was last sent.
    string last_sent?;
    # Whether to add CSS to images in the RSS feed to constrain their width in campaigns.
    boolean constrain_rss_img?;
};

public type CollectionOfTagsTags record {
    # The unique id for the tag.
    int id?;
    # The name of the tag.
    string name?;
    # The date and time the tag was added to the list member in ISO 8601 format.
    string date_added?;
};

# Use this template to generate the HTML content for the campaign.
public type TemplateContent1 record {
    # The id of the template to use.
    int id;
    # Content for the sections of the template. Each key should be the unique [mc:edit area](https://mailchimp.com/help/create-editable-content-areas-with-mailchimps-template-language/) name from the template.
    record {} sections?;
};

# The [conditions of the segment](https://mailchimp.com/help/save-and-manage-segments/). Static and fuzzy segments don't have conditions.
public type Conditions record {
    # Match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

public type AbTestOptions1Combinations record {
    # Unique ID for the combination.
    string id?;
    # The index of `variate_settings.subject_lines` used.
    int subject_line?;
    # The index of `variate_settings.send_times` used.
    int send_time?;
    # The index of `variate_settings.from_names` used.
    int from_name?;
    # The index of `variate_settings.reply_to_addresses` used.
    int reply_to?;
    # The index of `variate_settings.contents` used.
    int content_description?;
    # The number of recipients for this combination.
    int recipients?;
};

# The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
public type CampaignSocialCard record {
    # The url for the header image for the card.
    string image_url?;
    # A short summary of the campaign to display.
    string description?;
    # The title for the card. Typically the subject line of the campaign.
    string title?;
};

# The email client.
public type EmailClient record {
    # The name of the email client.
    string 'client?;
    # The number of subscribed members who used this email client.
    int members?;
};

# A collection of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program.
public type AbuseComplaints record {
    # An array of objects, each representing an abuse report resource.
    AbuseComplaint3[] abuse_reports?;
    # The list id for the abuse report.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The settings specific to A/B test campaigns.
public type AbTestOptions1 record {
    # ID for the winning combination.
    string winning_combination_id?;
    # ID of the campaign that was sent to the remaining recipients based on the winning combination.
    string winning_campaign_id?;
    # The combination that performs the best. This may be determined automatically by click rate, open rate, or total revenue -- or you may choose manually based on the reporting data you find the most valuable. For Multivariate Campaigns testing send_time, winner_criteria is ignored. For Multivariate Campaigns with 'manual' as the winner_criteria, the winner must be chosen in the Mailchimp web application.
    string winner_criteria;
    # The number of minutes to wait before choosing the winning campaign. The value of wait_time must be greater than 0 and in whole hours, specified in minutes.
    int wait_time?;
    # The percentage of recipients to send the test combinations to, must be a value between 10 and 100.
    int test_size?;
    # The possible subject lines to test. If no subject lines are provided, settings.subject_line will be used.
    string[] subject_lines?;
    # The possible send times to test. The times provided should be in the format YYYY-MM-DD HH:MM:SS. If send_times are provided to test, the test_size will be set to 100% and winner_criteria will be ignored.
    string[] send_times?;
    # The possible from names. The number of from_names provided must match the number of reply_to_addresses. If no from_names are provided, settings.from_name will be used.
    string[] from_names?;
    # The possible reply-to addresses. The number of reply_to_addresses provided must match the number of from_names. If no reply_to_addresses are provided, settings.reply_to will be used.
    string[] reply_to_addresses?;
    # Descriptions of possible email contents. To set campaign contents, make a PUT request to /campaigns/{campaign_id}/content with the field 'variate_contents'.
    string[] contents?;
    # Combinations of possible variables used to build emails.
    AbTestOptions1Combinations[] combinations?;
};

# The settings specific to A/B test campaigns.
public type AbTestOptions2 record {
    # ID for the winning combination.
    string winning_combination_id?;
    # ID of the campaign that was sent to the remaining recipients based on the winning combination.
    string winning_campaign_id?;
    # The combination that performs the best. This may be determined automatically by click rate, open rate, or total revenue -- or you may choose manually based on the reporting data you find the most valuable. For Multivariate Campaigns testing send_time, winner_criteria is ignored. For Multivariate Campaigns with 'manual' as the winner_criteria, the winner must be chosen in the Mailchimp web application.
    string winner_criteria?;
    # The number of minutes to wait before choosing the winning campaign. The value of wait_time must be greater than 0 and in whole hours, specified in minutes.
    int wait_time?;
    # The percentage of recipients to send the test combinations to, must be a value between 10 and 100.
    int test_size?;
    # The possible subject lines to test. If no subject lines are provided, settings.subject_line will be used.
    string[] subject_lines?;
    # The possible send times to test. The times provided should be in the format YYYY-MM-DD HH:MM:SS. If send_times are provided to test, the test_size will be set to 100% and winner_criteria will be ignored.
    string[] send_times?;
    # The possible from names. The number of from_names provided must match the number of reply_to_addresses. If no from_names are provided, settings.from_name will be used.
    string[] from_names?;
    # The possible reply-to addresses. The number of reply_to_addresses provided must match the number of from_names. If no reply_to_addresses are provided, settings.reply_to will be used.
    string[] reply_to_addresses?;
    # Descriptions of possible email contents. To set campaign contents, make a PUT request to /campaigns/{campaign_id}/content with the field 'variate_contents'.
    string[] contents?;
    # Combinations of possible variables used to build emails.
    AbTestOptions1Combinations[] combinations?;
};

# Ecommerce stats for the list member if the list is attached to a store.
public type EcommerceStats record {
    # The total revenue the list member has brought in.
    decimal total_revenue?;
    # The total number of orders placed by the list member.
    decimal number_of_orders?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
};

# [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
public type CampaignDefaults1 record {
    # The default from name for campaigns sent to this list.
    string from_name?;
    # The default from email for campaigns sent to this list.
    string from_email?;
    # The default subject line for campaigns sent to this list.
    string subject?;
    # The default language for this lists's forms.
    string language?;
};

# A summary of an individual campaign's settings and content.
public type Campaign1 record {
    # A string that uniquely identifies this campaign.
    string id?;
    # The ID used in the Mailchimp web application. View this campaign in your Mailchimp account at `https://{dc}.admin.mailchimp.com/campaigns/show/?id={web_id}`.
    int web_id?;
    # If this campaign is the child of another campaign, this identifies the parent campaign. For Example, for RSS or Automation children.
    string parent_campaign_id?;
    # There are four types of [campaigns](https://mailchimp.com/help/getting-started-with-campaigns/) you can create in Mailchimp. A/B Split campaigns have been deprecated and variate campaigns should be used instead.
    string 'type?;
    # The date and time the campaign was created in ISO 8601 format.
    string create_time?;
    # The link to the campaign's archive version in ISO 8601 format.
    string archive_url?;
    # The original link to the campaign's archive version.
    string long_archive_url?;
    # The current status of the campaign.
    string status?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    # The date and time a campaign was sent.
    string send_time?;
    # How the campaign's content is put together.
    string content_type?;
    # Determines if the campaign needs its blocks refreshed by opening the web-based campaign editor. Deprecated and will always return false.
    boolean needs_block_refresh?;
    # Determines if the campaign qualifies to be resent to non-openers.
    boolean resendable?;
    # List settings for the campaign.
    List8 recipients?;
    # The settings for your campaign, including subject, from name, reply-to address, and more.
    CampaignSettings4 settings?;
    # The settings specific to A/B test campaigns.
    AbTestOptions2 variate_settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions tracking?;
    # [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
    RssOptions3 rss_opts?;
    # [A/B Testing](https://mailchimp.com/help/about-ab-testing-campaigns/) options for a campaign.
    AbTestingOptions ab_split_opts?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # For sent campaigns, a summary of opens, clicks, and e-commerce data.
    CampaignReportSummary1 report_summary?;
    # Updates on campaigns in the process of sending.
    CampaignDeliveryStatus delivery_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of an individual campaign's settings and content.
public type Campaign3 record {
    # A string that uniquely identifies this campaign.
    string id?;
    # The ID used in the Mailchimp web application. View this campaign in your Mailchimp account at `https://{dc}.admin.mailchimp.com/campaigns/show/?id={web_id}`.
    int web_id?;
    # If this campaign is the child of another campaign, this identifies the parent campaign. For Example, for RSS or Automation children.
    string parent_campaign_id?;
    # There are four types of [campaigns](https://mailchimp.com/help/getting-started-with-campaigns/) you can create in Mailchimp. A/B Split campaigns have been deprecated and variate campaigns should be used instead.
    string 'type;
    # The date and time the campaign was created in ISO 8601 format.
    string create_time?;
    # The link to the campaign's archive version.
    string archive_url?;
    # The original link to the campaign's archive version.
    string long_archive_url?;
    # The current status of the campaign.
    string status?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    # The date and time a campaign was sent in ISO 8601 format.
    string send_time?;
    # How the campaign's content is put together ('template', 'drag_and_drop', 'html', 'url').
    string content_type?;
    # Determines if the campaign needs its blocks refreshed by opening the web-based campaign editor. Deprecated and will always return false.
    boolean needs_block_refresh?;
    # Determines if the campaign qualifies to be resent to non-openers.
    boolean resendable?;
    # List settings for the campaign.
    List7 recipients?;
    # The settings for your campaign, including subject, from name, reply-to address, and more.
    CampaignSettings3 settings?;
    # The settings specific to A/B test campaigns.
    AbTestOptions1 variate_settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions tracking?;
    # [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
    RssOptions2 rss_opts?;
    # [A/B Testing](https://mailchimp.com/help/about-ab-testing-campaigns/) options for a campaign.
    AbTestingOptions ab_split_opts?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # For sent campaigns, a summary of opens and clicks.
    CampaignReportSummary report_summary?;
    # Updates on campaigns in the process of sending.
    CampaignDeliveryStatus delivery_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of an individual campaign's settings and content.
public type Campaign2 record {
    # List settings for the campaign.
    List2 recipients?;
    # The settings for your campaign, including subject, from name, reply-to address, and more.
    CampaignSettings2 settings;
    # The settings specific to A/B test campaigns.
    AbTestOptions variate_settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions tracking?;
    # [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
    RssOptions1 rss_opts?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
};

# A summary of an individual campaign's settings and content.
public type Campaign4 record {
    # A string that uniquely identifies this campaign.
    string id?;
    # The ID used in the Mailchimp web application. View this campaign in your Mailchimp account at `https://{dc}.admin.mailchimp.com/campaigns/show/?id={web_id}`.
    int web_id?;
    # If this campaign is the child of another campaign, this identifies the parent campaign. For Example, for RSS or Automation children.
    string parent_campaign_id?;
    # There are four types of [campaigns](https://mailchimp.com/help/getting-started-with-campaigns/) you can create in Mailchimp. A/B Split campaigns have been deprecated and variate campaigns should be used instead.
    string 'type?;
    # The date and time the campaign was created in ISO 8601 format.
    string create_time?;
    # The link to the campaign's archive version in ISO 8601 format.
    string archive_url?;
    # The original link to the campaign's archive version.
    string long_archive_url?;
    # The current status of the campaign.
    string status?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    # The date and time a campaign was sent.
    string send_time?;
    # How the campaign's content is put together.
    string content_type?;
    # Determines if the campaign needs its blocks refreshed by opening the web-based campaign editor. Deprecated and will always return false.
    boolean needs_block_refresh?;
    # Determines if the campaign qualifies to be resent to non-openers.
    boolean resendable?;
    # List settings for the campaign.
    List8 recipients?;
    # The settings for your campaign, including subject, from name, reply-to address, and more.
    CampaignSettings4 settings?;
    # The settings specific to A/B test campaigns.
    AbTestOptions2 variate_settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions tracking?;
    # [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options for a campaign.
    RssOptions3 rss_opts?;
    # [A/B Testing](https://mailchimp.com/help/about-ab-testing-campaigns/) options for a campaign.
    AbTestingOptions ab_split_opts?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # For sent campaigns, a summary of opens, clicks, and e-commerce data.
    CampaignReportSummary1 report_summary?;
    # Updates on campaigns in the process of sending.
    CampaignDeliveryStatus delivery_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Batch update list members.
public type BatchUpdateListMembers record {
    # An array of objects, each representing a new member that was added to the list.
    ListMembers5[] new_members?;
    # An array of objects, each representing an existing list member whose subscription status was updated.
    ListMembers5[] updated_members?;
    # An array of objects, each representing an email address that could not be added to the list or updated and an error message providing more details.
    BatchUpdateListMembersErrors[] errors?;
    # The total number of items matching the query, irrespective of pagination.
    int total_created?;
    # The total number of items matching the query, irrespective of pagination.
    int total_updated?;
    # The total number of items matching the query, irrespective of pagination.
    int error_count?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Add or remove tags on a member by declaring a tag either active or inactive on a member.
public type MemberTag record {
    # The name of the tag.
    string name;
    # The status for the tag on the member, pass in active to add a tag or inactive to remove it.
    string status;
};

# Choose whether the campaign should use [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/). Cannot be set to `true` for campaigns using [Timewarp](https://mailchimp.com/help/use-timewarp/).
public type BatchDelivery record {
    # The delay, in minutes, between batches.
    int batch_delay;
    # The number of batches for the campaign send.
    int batch_count;
};

# Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program.
public type AbuseComplaint3 record {
    # The id for the abuse report
    int id?;
    # The campaign id for the abuse report
    string campaign_id?;
    # The list id for the abuse report.
    string list_id?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # Date for the abuse report
    string date?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of a specific list's growth activity for a specific month and year.
public type GrowthHistory2 record {
    # The list id for the growth activity report.
    string list_id?;
    # The month that the growth history is describing.
    string month?;
    # (deprecated)
    int existing?;
    # (deprecated)
    int imports?;
    # (deprecated)
    int optins?;
    # Total subscribed members on the list at the end of the month.
    int subscribed?;
    # Newly unsubscribed members on the list for a specific month.
    int unsubscribed?;
    # Newly reconfirmed members on the list for a specific month.
    int reconfirm?;
    # Newly cleaned (hard-bounced) members on the list for a specific month.
    int cleaned?;
    # Pending members on the list for a specific month.
    int pending?;
    # Newly deleted members on the list for a specific month.
    int deleted?;
    # Subscribers that have been sent transactional emails via Mandrill.
    int 'transactional?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of a specific list's growth activity for a specific month and year.
public type GrowthHistory1 record {
    # The list id for the growth activity report.
    string list_id?;
    # The month that the growth history is describing.
    string month?;
    # (deprecated)
    int existing?;
    # (deprecated)
    int imports?;
    # (deprecated)
    int optins?;
    # Total subscribed members on the list at the end of the month.
    int subscribed?;
    # Newly unsubscribed members on the list for a specific month.
    int unsubscribed?;
    # Newly reconfirmed members on the list for a specific month.
    int reconfirm?;
    # Newly cleaned (hard-bounced) members on the list for a specific month.
    int cleaned?;
    # Pending members on the list for a specific month.
    int pending?;
    # Newly deleted members on the list for a specific month.
    int deleted?;
    # Subscribers that have been sent transactional emails via Mandrill.
    int 'transactional?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Deprecated
public type SalesforceCrmTracking record {
    # Create a campaign in a connected Salesforce account.
    boolean campaign?;
    # Update contact notes for a campaign based on subscriber email addresses.
    boolean notes?;
};

# Collection of Element style for List Signup Forms.
public type CollectionOfElementStyleForListSignupForms record {
    # A string that identifies the element selector.
    string selector?;
    # A collection of options for a selector.
    AnOptionForSignupFormStyles[] options?;
};

# A workflow's runtime settings for an Automation.
public type AutomationWorkflowRuntimeSettings record {
    # The days an Automation workflow can send.
    string[] days?;
    # The hours an Automation workflow can send.
    Hours hours?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type AddListMembers1 record {
    # Email address for a subscriber.
    string email_address;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/view-and-edit-contact-languages/) for subscriber.
    boolean vip?;
    # Subscriber location information.
    Location location?;
    # The marketing permissions for the subscriber.
    MarketingPermission[] marketing_permissions?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscribe confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # The tags that are associated with a member.
    string[] tags?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type AddListMembers2 record {
    # Email address for a subscriber. This value is required only if the email address is not already present on the list.
    string email_address;
    # Subscriber's status. This value is required only if the email address is not already present on the list.
    string status_if_new;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # Subscriber location information.
    Location location?;
    # The marketing permissions for the subscriber.
    MarketingPermission[] marketing_permissions?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscriber confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type AddListMembers3 record {
    # Email address for a subscriber.
    string email_address?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # Subscriber location information.
    Location location?;
    # The marketing permissions for the subscriber.
    MarketingPermission[] marketing_permissions?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscriber confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
};

# Deprecated
public type SalesforceCrmTracking1 record {
    # Create a campaign in a connected Salesforce account.
    boolean campaign?;
    # Update contact notes for a campaign based on a subscriber's email address.
    boolean notes?;
};

# List signup form.
public type SignupForm record {
    # Options for customizing your signup form header.
    SignupFormHeaderOptions header?;
    # The signup form body content.
    CollectionOfContentForListSignupForms[] contents?;
    # An array of objects, each representing an element style for the signup form.
    CollectionOfElementStyleForListSignupForms[] styles?;
};

# Extra options for some merge field types.
public type MergeFieldOptions record {
    # In an address field, the default country code if none supplied.
    int default_country?;
    # In a phone field, the phone number type: US or International.
    string phone_format?;
    # In a date or birthday field, the format of the date.
    string date_format?;
    # In a radio or dropdown non-group field, the available options for members to pick from.
    string[] choices?;
    # In a text field, the default length of the text field.
    int size?;
};

# E-Commerce stats for a campaign.
public type EcommerceReport1 record {
    # The total orders for a campaign.
    int total_orders?;
    # The total spent for a campaign. Calculated as the sum of all order totals with no deductions.
    decimal total_spent?;
    # The total revenue for a campaign. Calculated as the sum of all order totals minus shipping and tax totals.
    decimal total_revenue?;
};

public type SegmentIdMembersBody record {
    # Email address for a subscriber.
    string email_address;
};

# Up to the previous 180 days of daily detailed aggregated activity stats for a specific list. Does not include AutoResponder or Automation activity.
public type ListActivity record {
    # Recent list activity.
    DailyListActivity[] activity?;
    # The unique id for the list.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
public type ListContact2 record {
    # The company name for the list.
    string company?;
    # The street address for the list contact.
    string address1?;
    # The street address for the list contact.
    string address2?;
    # The city for the list contact.
    string city?;
    # The state for the list contact.
    string state?;
    # The postal or zip code for the list contact.
    string zip?;
    # A two-character ISO3166 country code. Defaults to US if invalid.
    string country?;
    # The phone number for the list contact.
    string phone?;
};

# An object representing all segmentation options.
public type SegmentOptions2 record {
    # The id for an existing saved segment.
    int saved_segment_id?;
    # Segment match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

# An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
public type SegmentOptions1 record {
    # The id for an existing saved segment.
    int saved_segment_id?;
    # The prebuilt segment id, if a prebuilt segment has been designated for this campaign.
    string prebuilt_segment_id?;
    # Segment match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

# Webhook configured for the given list.
public type ListWebhooks2 record {
    # An string that uniquely identifies this webhook.
    string id?;
    # A valid URL for the Webhook.
    string url?;
    # The events that can trigger the webhook and whether they are enabled.
    Events2 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources1 sources?;
    # The unique id for the list.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A specific event for a contact.
public type Event record {
    # The date and time the event occurred in ISO 8601 format.
    string occurred_at?;
    # The name for this type of event ('purchased', 'visited', etc). Must be 2-30 characters in length
    string name?;
    # An optional list of properties
    record {} properties?;
};

# [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
public type ListContact1 record {
    # The company name for the list.
    string company;
    # The street address for the list contact.
    string address1;
    # The street address for the list contact.
    string address2?;
    # The city for the list contact.
    string city;
    # The state for the list contact.
    string state;
    # The postal or zip code for the list contact.
    string zip;
    # A two-character ISO3166 country code. Defaults to US if invalid.
    string country;
    # The phone number for the list contact.
    string phone?;
};

# The API root resource links to all other resources available in the API.
public type ApiRoot record {
    # The Mailchimp account ID.
    string account_id?;
    # The ID associated with the user who owns this API key. If you can login to multiple accounts, this ID will be the same for each account.
    string login_id?;
    # The name of the account.
    string account_name?;
    # The account email address.
    string email?;
    # The first name tied to the account.
    string first_name?;
    # The last name tied to the account.
    string last_name?;
    # The username tied to the account.
    string username?;
    # URL of the avatar for the user.
    string avatar_url?;
    # The [user role](https://mailchimp.com/help/manage-user-levels-in-your-account/) for the account.
    string role?;
    # The date and time that the account was created in ISO 8601 format.
    string member_since?;
    # The type of pricing plan the account is on.
    string pricing_plan_type?;
    # Date of first payment for monthly plans.
    string first_payment?;
    # The timezone currently set for the account.
    string account_timezone?;
    # The user-specified industry associated with the account.
    string account_industry?;
    # Information about the account contact.
    AccountContact contact?;
    # Legacy - whether the account includes [Mailchimp Pro](https://mailchimp.com/help/about-mailchimp-pro/).
    boolean pro_enabled?;
    # The date and time of the last login for this account in ISO 8601 format.
    string last_login?;
    # The total number of subscribers across all lists in the account.
    int total_subscribers?;
    # The [average campaign statistics](https://mailchimp.com/resources/research/email-marketing-benchmarks/?utm_source=mc-api&utm_medium=docs&utm_campaign=apidocs) for all campaigns in the account's specified industry.
    IndustryStats1 industry_stats?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Webhook configured for the given list.
public type ListWebhooks1 record {
    # An string that uniquely identifies this webhook.
    string id?;
    # A valid URL for the Webhook.
    string url?;
    # The events that can trigger the webhook and whether they are enabled.
    Events2 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources1 sources?;
    # The unique id for the list.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type SendChecklistItems record {
    # The item type.
    string 'type?;
    # The ID for the specific item.
    int id?;
    # The heading for the specific item.
    string heading?;
    # Details about the specific feedback item.
    string details?;
};

# Partial matches of the provided search query.
public type PartialMatches record {
    # An array of objects, each representing a specific list member.
    ListMembers4[] members?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
};

# The last 10 notes for a specific list member, based on date created.
public type CollectionOfNotes record {
    # An array of objects, each representing a note resource.
    MemberNotes3[] notes?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application.
public type Interest record {
    # The name of the interest. This can be shown publicly on a subscription form.
    string name;
    # The display order for interests.
    int display_order?;
};

# Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program.
public type AbuseComplaint record {
    # The id for the abuse report
    int id?;
    # The campaign id for the abuse report
    string campaign_id?;
    # The list id for the abuse report.
    string list_id?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # Date for the abuse report
    string date?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The days of the week to send a daily RSS Campaign.
public type DailySendingDays record {
    # Sends the daily RSS Campaign on Sundays.
    boolean sunday?;
    # Sends the daily RSS Campaign on Mondays.
    boolean monday?;
    # Sends the daily RSS Campaign on Tuesdays.
    boolean tuesday?;
    # Sends the daily RSS Campaign on Wednesdays.
    boolean wednesday?;
    # Sends the daily RSS Campaign on Thursdays.
    boolean thursday?;
    # Sends the daily RSS Campaign on Fridays.
    boolean friday?;
    # Sends the daily RSS Campaign on Saturdays.
    boolean saturday?;
};

# Information about the account contact.
public type AccountContact record {
    # The company name for the account.
    string company?;
    # The street address for the account contact.
    string addr1?;
    # The street address for the account contact.
    string addr2?;
    # The city for the account contact.
    string city?;
    # The state for the account contact.
    string state?;
    # The zip code for the account contact.
    string zip?;
    # The country for the account contact.
    string country?;
};

# A summary of List's locations.
public type ListLocations record {
    # An array of objects, each representing a list's top subscriber locations.
    ListLocation[] locations?;
    # The unique id for the list.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Members to add/remove to/from a static segment
public type MembersToAddremoveTofromAStaticSegment record {
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. A maximum of 500 members can be sent.
    string[] members_to_add?;
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. A maximum of 500 members can be sent.
    string[] members_to_remove?;
};

public type CampaignContentVariateContents record {
    # Label used to identify the content option.
    string content_label?;
    # The plain-text portion of the campaign. If left unspecified, we'll generate this automatically.
    string plain_text?;
    # The raw HTML for the campaign.
    string html?;
};

# A summary of the emails in an Automation workflow.
public type AutomationEmails record {
    # An array of objects, each representing an email in an Automation workflow.
    AutomationWorkflowEmail1[] emails?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of an individual campaign's settings and content.
public type Campaign record {
    # There are four types of [campaigns](https://mailchimp.com/help/getting-started-with-campaigns/) you can create in Mailchimp. A/B Split campaigns have been deprecated and variate campaigns should be used instead.
    string 'type;
    # List settings for the campaign.
    List1 recipients?;
    # The settings for your campaign, including subject, from name, reply-to address, and more.
    CampaignSettings1 settings?;
    # The settings specific to A/B test campaigns.
    AbTestOptions variate_settings?;
    # The tracking options for a campaign.
    CampaignTrackingOptions tracking?;
    # [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options, specific to an RSS campaign.
    RssOptions rss_opts?;
    # The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/).
    CampaignSocialCard social_card?;
    # How the campaign's content is put together. The old drag and drop editor uses 'template' while the new editor uses 'multichannel'. Defaults to template.
    string content_type?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type ListMembers5 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # Email address for a subscriber.
    string email_address?;
    # An identifier for the address across all of Mailchimp.
    string unique_email_id?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # Open and click rates for this subscriber.
    SubscriberStats stats?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscriber confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # Star rating for this member, between 1 and 5.
    int member_rating?;
    # The date and time the member's info was last changed in ISO 8601 format.
    string last_changed?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The list member's email client.
    string email_client?;
    # Subscriber location information.
    Location1 location?;
    # The most recent Note added about this member.
    Notes last_note?;
    # The number of tags applied to this member.
    int tags_count?;
    # The tags applied to this member.
    ListMembers1Tags[] tags?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type ListMembers4 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # Email address for a subscriber.
    string email_address?;
    # An identifier for the address across all of Mailchimp.
    string unique_email_id?;
    # The contact's full name.
    string full_name?;
    # The ID used in the Mailchimp web application. View this member in your Mailchimp account at `https://{dc}.admin.mailchimp.com/lists/members/view?id={web_id}`.
    int web_id?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # A subscriber's reason for unsubscribing.
    string unsubscribe_reason?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # Open and click rates for this subscriber.
    SubscriberStats1 stats?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscribe confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # Star rating for this member, between 1 and 5.
    int member_rating?;
    # The date and time the member's info was last changed in ISO 8601 format.
    string last_changed?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The list member's email client.
    string email_client?;
    # Subscriber location information.
    Location1 location?;
    # The marketing permissions for the subscriber.
    MarketingPermission1[] marketing_permissions?;
    # The most recent Note added about this member.
    Notes last_note?;
    # The source from which the subscriber was added to this list.
    string 'source?;
    # The number of tags applied to this member.
    int tags_count?;
    # Returns up to 50 tags applied to this member. To retrieve all tags see [Member Tags](https://mailchimp.com/developer/marketing/api/list-member-tags/).
    ListMembers1Tags[] tags?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type ListMembers3 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # Email address for a subscriber.
    string email_address?;
    # An identifier for the address across all of Mailchimp.
    string unique_email_id?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # Open and click rates for this subscriber.
    SubscriberStats stats?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscriber confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # Star rating for this member, between 1 and 5.
    int member_rating?;
    # The date and time the member's info was last changed in ISO 8601 format.
    string last_changed?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The list member's email client.
    string email_client?;
    # Subscriber location information.
    Location1 location?;
    # The most recent Note added about this member.
    Notes last_note?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type ListMembers2 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # Email address for a subscriber.
    string email_address?;
    # An identifier for the address across all of Mailchimp.
    string unique_email_id?;
    # The contact's full name.
    string full_name?;
    # The ID used in the Mailchimp web application. View this member in your Mailchimp account at `https://{dc}.admin.mailchimp.com/lists/members/view?id={web_id}`.
    int web_id?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # A subscriber's reason for unsubscribing.
    string unsubscribe_reason?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # Open and click rates for this subscriber.
    SubscriberStats1 stats?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscribe confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
    # Star rating for this member, between 1 and 5.
    int member_rating?;
    # The date and time the member's info was last changed in ISO 8601 format.
    string last_changed?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The list member's email client.
    string email_client?;
    # Subscriber location information.
    Location1 location?;
    # The marketing permissions for the subscriber.
    MarketingPermission1[] marketing_permissions?;
    # The most recent Note added about this member.
    Notes last_note?;
    # The source from which the subscriber was added to this list.
    string 'source?;
    # The number of tags applied to this member.
    int tags_count?;
    # Returns up to 50 tags applied to this member. To retrieve all tags see [Member Tags](https://mailchimp.com/developer/marketing/api/list-member-tags/).
    ListMembers1Tags[] tags?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Manage members of a specific Mailchimp list, including currently subscribed, unsubscribed, and bounced members.
public type ListMembers1 record {
    # An array of objects, each representing a specific list member.
    ListMembers4[] members?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The hours an Automation workflow can send.
public type Hours record {
    # When to send the Automation email.
    string 'type;
};

public type BatchUpdateListMembersErrors record {
    # The email address that could not be added or updated.
    string email_address?;
    # The error message indicating why the email address could not be added or updated.
    string _error?;
    # A unique code that identifies this specifc error.
    string error_code?;
};

# The HTML and plain-text content for a campaign.
public type CampaignContent record {
    # Content options for multivariate campaigns.
    CampaignContentVariateContents[] variate_contents?;
    # The plain-text portion of the campaign. If left unspecified, we'll generate this automatically.
    string plain_text?;
    # The raw HTML for the campaign.
    string html?;
    # The Archive HTML for the campaign.
    string archive_html?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The [average campaign statistics](https://mailchimp.com/resources/research/email-marketing-benchmarks/?utm_source=mc-api&utm_medium=docs&utm_campaign=apidocs) for all campaigns in the account's specified industry.
public type IndustryStats1 record {
    # The average unique open rate for all campaigns in the account's specified industry.
    decimal open_rate?;
    # The average bounce rate for all campaigns in the account's specified industry.
    decimal bounce_rate?;
    # The average unique click rate for all campaigns in the account's specified industry.
    decimal click_rate?;
};

# The most recent Note added about this member.
public type Notes record {
    # The note id.
    int note_id?;
    # The date and time the note was created in ISO 8601 format.
    string created_at?;
    # The author of the note.
    string created_by?;
    # The content of the note.
    string note?;
};

# A list of available segments.
public type CollectionOfSegments record {
    # An array of objects, each representing a list segment.
    List6[] segments?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Subscriber location information.
public type Location1 record {
    # The location latitude.
    decimal latitude?;
    # The location longitude.
    decimal longitude?;
    # The time difference in hours from GMT.
    int gmtoff?;
    # The offset for timezones where daylight saving time is observed.
    int dstoff?;
    # The unique code for the location country.
    string country_code?;
    # The timezone for the location.
    string timezone?;
};

# Exact matches of the provided search query.
public type ExactMatches record {
    # An array of objects, each representing a specific list member.
    ListMembers4[] members?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
};

# Information about subscribers in an Automation email queue.
public type SubscriberInAutomationQueue3 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # A string that uniquely identifies an email in an Automation workflow.
    string email_id?;
    # A string that uniquely identifies a list.
    string list_id?;
    # The list member's email address.
    string email_address;
    # The date and time of the next send for the workflow email in ISO 8601 format.
    string next_send?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about subscribers in an Automation email queue.
public type SubscriberInAutomationQueue2 record {
    # The list member's email address.
    string email_address;
};

# Information about subscribers in an Automation email queue.
public type SubscriberInAutomationQueue1 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # A string that uniquely identifies an email in an Automation workflow.
    string email_id?;
    # A string that uniquely identifies a list.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The list member's email address.
    string email_address?;
    # The date and time of the next send for the workflow email in ISO 8601 format.
    string next_send?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of the comment feedback for a specific campaign.
public type CampaignReports record {
    # A collection of feedback items for a campaign.
    CampaignFeedback3[] feedback?;
    # The unique id for the campaign.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An authorized app.
public type InlineResponse2001Apps record {
    # The ID for the application.
    int id?;
    # The name of the application.
    string name?;
    # A short description of the application.
    string description?;
    # An array of usernames for users who have linked the app.
    string[] users?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The settings for the Automation workflow.
public type AutomationCampaignSettings record {
    # The 'from' name for the Automation (not an email address).
    string from_name?;
    # The reply-to email address for the Automation.
    string reply_to?;
};

# Subscriber location information.
public type Location record {
    # The location latitude.
    decimal latitude?;
    # The location longitude.
    decimal longitude?;
};

# The HTML and plain-text content for a campaign
public type CampaignContent1 record {
    # The plain-text portion of the campaign. If left unspecified, we'll generate this automatically.
    string plain_text?;
    # The raw HTML for the campaign.
    string html?;
    # When importing a campaign, the URL where the HTML lives.
    string url?;
    # Use this template to generate the HTML content of the campaign
    TemplateContent template?;
    # Available when uploading an archive to create campaign content. The archive should include all campaign content and images. [Learn more](https://mailchimp.com/help/import-a-custom-html-template/).
    UploadArchive archive?;
    # Content options for [Multivariate Campaigns](https://mailchimp.com/help/about-multivariate-campaigns/). Each content option must provide HTML content and may optionally provide plain text. For campaigns not testing content, only one object should be provided.
    CampaignscampaignIdcontentVariateContents[] variate_contents?;
};

# The tracking options for a campaign.
public type CampaignTrackingOptions record {
    # Whether to [track opens](https://mailchimp.com/help/about-open-tracking/). Defaults to `true`. Cannot be set to false for variate campaigns.
    boolean opens?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the HTML version of the campaign. Defaults to `true`. Cannot be set to false for variate campaigns.
    boolean html_clicks?;
    # Whether to [track clicks](https://mailchimp.com/help/enable-and-view-click-tracking/) in the plain-text version of the campaign. Defaults to `true`. Cannot be set to false for variate campaigns.
    boolean text_clicks?;
    # Deprecated
    boolean goal_tracking?;
    # Whether to enable e-commerce tracking.
    boolean ecomm360?;
    # The custom slug for [Google Analytics](https://mailchimp.com/help/integrate-google-analytics-with-mailchimp/) tracking (max of 50 bytes).
    string google_analytics?;
    # The custom slug for [ClickTale](https://mailchimp.com/help/additional-tracking-options-for-campaigns/) tracking (max of 50 bytes).
    string clicktale?;
    # Deprecated
    SalesforceCrmTracking salesforce?;
    # Deprecated
    CapsuleCrmTracking capsule?;
};

# A list of this category's interests
public type Interests record {
    # An array of this category's interests
    Interest3[] interests?;
    # The unique list id that the interests belong to.
    string list_id?;
    # The id for the interest category.
    string category_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A single instance of a goal activity.
public type Goal record {
    # The id for a Goal event.
    int goal_id?;
    # The name/type of Goal event triggered.
    string event?;
    # The date and time the user last triggered the Goal event in ISO 8601 format.
    string last_visited_at?;
    # Any extra data passed with the Goal event.
    string data?;
};

# A list of tags assigned to a list member.
public type MemberTags record {
    # A list of tags assigned to the list member.
    MemberTag[] tags;
    # When is_syncing is true, automations based on the tags in the request will not fire
    boolean is_syncing?;
};

# Deprecated
public type CapsuleCrmTracking2 record {
    # Update contact notes for a campaign based on a subscriber's email address.
    boolean notes?;
};

# Deprecated
public type CapsuleCrmTracking1 record {
    # Update contact notes for a campaign based on a subscriber's email addresses.
    boolean notes?;
};

# The last 50 Goal events for a member on a specific list.
public type CollectionOfMemberActivityEvents record {
    # The last 50 Goal events triggered by a member.
    Goal[] goals?;
    # The list id.
    string list_id?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type TagSearchResultsTags record {
    # The unique id for the tag.
    int id?;
    # The name of the tag.
    string name?;
};

# Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed.
public type AddListMembers record {
    # Email address for a subscriber.
    string email_address?;
    # Type of email this member asked to get ('html' or 'text').
    string email_type?;
    # Subscriber's current status.
    string status?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # The key of this object's properties is the ID of the interest in question.
    record {} interests?;
    # If set/detected, the [subscriber's language](https://mailchimp.com/help/view-and-edit-contact-languages/).
    string language?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # Subscriber location information.
    Location location?;
    # IP address the subscriber signed up from.
    string ip_signup?;
    # The date and time the subscriber signed up for the list in ISO 8601 format.
    string timestamp_signup?;
    # The IP address the subscriber used to confirm their opt-in status.
    string ip_opt?;
    # The date and time the subscribe confirmed their opt-in status in ISO 8601 format.
    string timestamp_opt?;
};

# Configure a webhook for the given list.
public type AddWebhook record {
    # A valid URL for the Webhook.
    string url?;
    # The events that can trigger the webhook and whether they are enabled.
    Events1 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources sources?;
};

# List Signup Forms.
public type ListSignupForms record {
    # List signup form.
    SignupForm2[] signup_forms?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Trigger settings for the Automation.
public type AutomationTrigger record {
    # The type of Automation workflow. Currently only supports 'abandonedCart'.
    string workflow_type;
};

# The events that can trigger the webhook and whether they are enabled.
public type Events1 record {
    # Whether the webhook is triggered when a list subscriber is added.
    boolean subscribe?;
    # Whether the webhook is triggered when a list member unsubscribes.
    boolean unsubscribe?;
    # Whether the webhook is triggered when a subscriber's profile is updated.
    boolean profile?;
    # Whether the webhook is triggered when a subscriber's email address is cleaned from the list.
    boolean cleaned?;
    # Whether the webhook is triggered when a subscriber's email address is changed.
    boolean upemail?;
    # Whether the webhook is triggered when a campaign is sent or cancelled.
    boolean campaign?;
};

# The [conditions of the segment](https://mailchimp.com/help/save-and-manage-segments/). Static and fuzzy segments don't have conditions.
public type Conditions1 record {
    # Match type.
    string 'match?;
    # An array of segment conditions.
    record {}[][] conditions?;
};

# The events that can trigger the webhook and whether they are enabled.
public type Events2 record {
    # Whether the webhook is triggered when a list subscriber is added.
    boolean subscribe?;
    # Whether the webhook is triggered when a list member unsubscribes.
    boolean unsubscribe?;
    # Whether the webhook is triggered when a subscriber's profile is updated.
    boolean profile?;
    # Whether the webhook is triggered when a subscriber's email address is cleaned from the list.
    boolean cleaned?;
    # Whether the webhook is triggered when a subscriber's email address is changed.
    boolean upemail?;
    # Whether the webhook is triggered when a campaign is sent or cancelled.
    boolean campaign?;
};

# The conditions of the segment. Static segments (tags) and fuzzy segments don't have conditions.
public type Conditions2 record {
    # Match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

# [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
public type ListContact record {
    # The company name for the list.
    string company;
    # The street address for the list contact.
    string address1;
    # The street address for the list contact.
    string address2?;
    # The city for the list contact.
    string city;
    # The state for the list contact.
    string state?;
    # The postal or zip code for the list contact.
    string zip?;
    # A two-character ISO3166 country code. Defaults to US if invalid.
    string country;
    # The phone number for the list contact.
    string phone?;
};

# Configure a webhook for the given list.
public type AddWebhook1 record {
    # A valid URL for the Webhook.
    string url?;
    # The events that can trigger the webhook and whether they are enabled.
    Events1 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources sources?;
};

# Members found for given search term
public type Members record {
    # Exact matches of the provided search query.
    ExactMatches exact_matches?;
    # Partial matches of the provided search query.
    PartialMatches full_search?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application.
public type Interest1 record {
    # The id for the interest category.
    string category_id?;
    # The ID for the list that this interest belongs to.
    string list_id?;
    # The ID for the interest.
    string id?;
    # The name of the interest. This can be shown publicly on a subscription form.
    string name?;
    # The number of subscribers associated with this interest.
    string subscriber_count?;
    # The display order for interests.
    int display_order?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Options for customizing your signup form header.
public type SignupFormHeaderOptions record {
    # Header image URL.
    string image_url?;
    # Header text.
    string text?;
    # Image width, in pixels.
    string image_width?;
    # Image height, in pixels.
    string image_height?;
    # Alt text for the image.
    string image_alt?;
    # The URL that the header image will link to.
    string image_link?;
    # Image alignment.
    string image_align?;
    # Image border width.
    string image_border_width?;
    # Image border style.
    string image_border_style?;
    # Image border color.
    string image_border_color?;
    # Image link target.
    string image_target?;
};

# The top email clients based on user-agent strings.
public type EmailClients record {
    # An array of top email clients.
    EmailClient[] clients?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of the subscribers who were removed from an Automation workflow.
public type RemovedSubscribers record {
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # An array of objects, each representing a subscriber who was removed from an Automation workflow.
    SubscriberRemovedFromAutomationWorkflow1[] subscribers?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application.
public type Interest3 record {
    # The id for the interest category.
    string category_id?;
    # The ID for the list that this interest belongs to.
    string list_id?;
    # The ID for the interest.
    string id?;
    # The name of the interest. This can be shown publicly on a subscription form.
    string name?;
    # The number of subscribers associated with this interest.
    string subscriber_count?;
    # The display order for interests.
    int display_order?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application.
public type Interest2 record {
    # The name of the interest. This can be shown publicly on a subscription form.
    string name;
    # The display order for interests.
    int display_order?;
};

# List settings for the campaign.
public type List1 record {
    # The unique list id.
    string list_id;
    # An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
    SegmentOptions segment_opts?;
};

# List settings for the campaign.
public type List2 record {
    # The unique list id.
    string list_id;
    # An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
    SegmentOptions1 segment_opts?;
};

# Information about a specific list segment.
public type List3 record {
    # The name of the segment.
    string name;
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. Passing an empty array will create a static segment without any subscribers. This field cannot be provided with the options field.
    string[] static_segment?;
    # The [conditions of the segment](https://mailchimp.com/help/save-and-manage-segments/). Static and fuzzy segments don't have conditions.
    Conditions options?;
};

# Information about a specific segment.
public type List4 record {
    # The unique id for the segment.
    int id?;
    # The name of the segment.
    string name?;
    # The number of active subscribers currently included in the segment.
    int member_count?;
    # The type of segment. Static segments are now known as tags. Learn more about [tags](https://mailchimp.com/help/getting-started-tags?utm_source=mc-api&utm_medium=docs&utm_campaign=apidocs).
    string 'type?;
    # The date and time the segment was created in ISO 8601 format.
    string created_at?;
    # The date and time the segment was last updated in ISO 8601 format.
    string updated_at?;
    # The conditions of the segment. Static segments (tags) and fuzzy segments don't have conditions.
    Conditions2 options?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific list segment.
public type List5 record {
    # The name of the segment.
    string name;
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. Passing an empty array for an existing static segment will reset that segment and remove all members. This field cannot be provided with the `options` field.
    string[] static_segment?;
    # The [conditions of the segment](https://mailchimp.com/help/save-and-manage-segments/). Static and fuzzy segments don't have conditions.
    Conditions1 options?;
};

# Information about a specific segment.
public type List6 record {
    # The unique id for the segment.
    int id?;
    # The name of the segment.
    string name?;
    # The number of active subscribers currently included in the segment.
    int member_count?;
    # The type of segment. Static segments are now known as tags. Learn more about [tags](https://mailchimp.com/help/getting-started-tags?utm_source=mc-api&utm_medium=docs&utm_campaign=apidocs).
    string 'type?;
    # The date and time the segment was created in ISO 8601 format.
    string created_at?;
    # The date and time the segment was last updated in ISO 8601 format.
    string updated_at?;
    # The conditions of the segment. Static segments (tags) and fuzzy segments don't have conditions.
    Conditions2 options?;
    # The list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# List settings for the campaign.
public type List7 record {
    # The unique list id.
    string list_id;
    # The name of the list.
    string list_name?;
    # A description of the [segment](https://mailchimp.com/help/save-and-manage-segments/) used for the campaign. Formatted as a string marked up with HTML.
    string segment_text?;
    # Count of the recipients on the associated list. Formatted as an integer.
    int recipient_count?;
    # An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
    SegmentOptions1 segment_opts?;
};

# List settings for the campaign.
public type List8 record {
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The name of the list.
    string list_name?;
    # A description of the [segment](https://mailchimp.com/help/create-and-send-to-a-segment/) used for the campaign. Formatted as a string marked up with HTML.
    string segment_text?;
    # Count of the recipients on the associated list. Formatted as an integer.
    int recipient_count?;
    # An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
    SegmentOptions1 segment_opts?;
};

# List settings for the Automation.
public type List9 record {
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # List Name.
    string list_name?;
    # An object representing all segmentation options.
    SegmentOptions2 segment_opts?;
    # The id of the store.
    string store_id?;
};

# Extra options for some merge field types.
public type MergeFieldOptions1 record {
    # In an address field, the default country code if none supplied.
    int default_country?;
    # In a phone field, the phone number type: US or International.
    string phone_format?;
    # In a date or birthday field, the format of the date.
    string date_format?;
    # In a radio or dropdown non-group field, the available options for members to pick from.
    string[] choices?;
};

# Extra options for some merge field types.
public type MergeFieldOptions2 record {
    # In an address field, the default country code if none supplied.
    int default_country?;
    # In a phone field, the phone number type: US or International.
    string phone_format?;
    # In a date or birthday field, the format of the date.
    string date_format?;
    # In a radio or dropdown non-group field, the available options for members to pick from.
    string[] choices?;
    # In a text field, the default length of the text field.
    int size?;
};

# List signup form.
public type SignupForm1 record {
    # Options for customizing your signup form header.
    SignupFormHeaderOptions header?;
    # The signup form body content.
    CollectionOfContentForListSignupForms[] contents?;
    # An array of objects, each representing an element style for the signup form.
    CollectionOfElementStyleForListSignupForms[] styles?;
    # Signup form URL.
    string signup_form_url?;
    # The signup form's list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# List signup form.
public type SignupForm2 record {
    # Options for customizing your signup form header.
    SignupFormHeaderOptions header?;
    # The signup form body content.
    CollectionOfContentForListSignupForms[] contents?;
    # An array of objects, each representing an element style for the signup form.
    CollectionOfElementStyleForListSignupForms[] styles?;
    # Signup form URL.
    string signup_form_url?;
    # The signup form's list id.
    string list_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type BatchAddremoveListMembersTofromStaticSegmentErrors record {
    # Email addresses added to the static segment or removed
    string[] email_addresses?;
    # The error message indicating why the email addresses could not be added or updated.
    string _error?;
};

# Members to subscribe to or unsubscribe from a list.
public type MembersToSubscribeunsubscribeTofromAListInBatch record {
    # An array of objects, each representing an email address and the subscription status for a specific list. Up to 500 members may be added or updated with each API call.
    AddListMembers[] members;
    # Whether this batch operation will change existing members' subscription status.
    boolean update_existing?;
};

# Available when uploading an archive to create campaign content. The archive should include all campaign content and images. [Learn more](https://mailchimp.com/help/import-a-custom-html-template/).
public type UploadArchive record {
    # The base64-encoded representation of the archive file.
    string archive_content;
    # The type of encoded file. Defaults to zip.
    string archive_type?;
};

# The verified domains currently on the account.
public type VerifiedDomains record {
    # The name of this domain.
    string domain?;
    # Whether the domain has been verified for sending.
    boolean verified?;
    # Whether domain authentication is enabled for this domain.
    boolean authenticated?;
    # The e-mail address receiving the two-factor challenge for this domain.
    string verification_email?;
    # The date/time that the two-factor challenge was sent to the verification email.
    string verification_sent?;
};

# Updates on campaigns in the process of sending.
public type CampaignDeliveryStatus record {
    # Whether Campaign Delivery Status is enabled for this account and campaign.
    boolean enabled?;
    # Whether a campaign send can be canceled.
    boolean can_cancel?;
    # The current state of a campaign delivery.
    string status?;
    # The total number of emails confirmed sent for this campaign so far.
    int emails_sent?;
    # The total number of emails canceled for this campaign.
    int emails_canceled?;
};

# Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application.
public type InterestCategory1 record {
    # The unique list id for the category.
    string list_id?;
    # The id for the interest category.
    string id?;
    # The text description of this category. This field appears on signup forms and is often phrased as a question.
    string title?;
    # The order that the categories are displayed in the list. Lower numbers display first.
    int display_order?;
    # Determines how this category’s interests appear on signup forms.
    string 'type?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application.
public type InterestCategory2 record {
    # The text description of this category. This field appears on signup forms and is often phrased as a question.
    string title;
    # The order that the categories are displayed in the list. Lower numbers display first.
    int display_order?;
    # Determines how this category’s interests appear on signup forms.
    string 'type;
};

# Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application.
public type InterestCategory3 record {
    # The unique list id for the category.
    string list_id?;
    # The id for the interest category.
    string id?;
    # The text description of this category. This field appears on signup forms and is often phrased as a question.
    string title?;
    # The order that the categories are displayed in the list. Lower numbers display first.
    int display_order?;
    # Determines how this category’s interests appear on signup forms.
    string 'type?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# This object represents a link from the resource where it is found to another resource or action that may be performed.
public type ResourceLink record {
    # As with an HTML 'rel' attribute, this describes the type of link.
    string rel?;
    # This property contains a fully-qualified URL that can be called to retrieve the linked resource or perform the linked action.
    string href?;
    # The HTTP method that should be used when accessing the URL defined in 'href'.
    string method?;
    # For GETs, this is a URL representing the schema that the response should conform to.
    string targetSchema?;
    # For HTTP methods that can receive bodies (POST and PUT), this is a URL representing the schema that the body should conform to.
    string schema?;
};

# An object representing all segmentation options. This object should contain a `saved_segment_id` to use an existing segment, or you can create a new segment by including both `match` and `conditions` options.
public type SegmentOptions record {
    # The id for an existing saved segment.
    int saved_segment_id?;
    # Segment match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

# Collection of Content for List Signup Forms.
public type CollectionOfContentForListSignupForms record {
    # The content section name.
    string section?;
    # The content section text.
    string value?;
};

public type ActionsScheduleBody record {
    # The UTC date and time to schedule the campaign for delivery in ISO 8601 format. Campaigns may only be scheduled to send on the quarter-hour (:00, :15, :30, :45).
    string schedule_time;
    # Choose whether the campaign should use [Timewarp](https://mailchimp.com/help/use-timewarp/) when sending. Campaigns scheduled with Timewarp are localized based on the recipients' time zones. For example, a Timewarp campaign with a `schedule_time` of 13:00 will be sent to each recipient at 1:00pm in their local time. Cannot be set to `true` for campaigns using [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/).
    boolean timewarp?;
    # Choose whether the campaign should use [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/). Cannot be set to `true` for campaigns using [Timewarp](https://mailchimp.com/help/use-timewarp/).
    BatchDelivery batch_delivery?;
};

# A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles.
public type MergeField record {
    # The tag used in Mailchimp campaigns and for the /members endpoint.
    string tag?;
    # The name of the merge field.
    string name;
    # The type for the merge field.
    string 'type;
    # The boolean value if the merge field is required.
    boolean required?;
    # The default value for the merge field if `null`.
    string default_value?;
    # Whether the merge field is displayed on the signup form.
    boolean 'public?;
    # The order that the merge field displays on the list signup form.
    int display_order?;
    # Extra options for some merge field types.
    MergeFieldOptions options?;
    # Extra text to help the subscriber fill out the form.
    string help_text?;
};

public type ListMembers1Tags record {
    # The tag id.
    int id?;
    # The name of the tag
    string name?;
};

# Manage webhooks for a specific list.
public type ListWebhooks record {
    # An array of objects, each representing a specific list member.
    ListWebhooks2[] webhooks?;
    # The list id.
    string list_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The delay settings for an Automation email.
public type AutomationDelay1 record {
    # The delay amount for an Automation email.
    int amount?;
    # The type of delay for an Automation email.
    string 'type?;
    # Whether the delay settings describe before or after the delay action of an Automation email.
    string direction?;
    # The action that triggers the delay of an Automation email.
    string action?;
    # The user-friendly description of the action that triggers an Automation email.
    string action_description?;
    # The user-friendly description of the delay and trigger action settings for an Automation email.
    string full_description?;
};

public type CampaignscampaignIdcontentVariateContents record {
    # The label used to identify the content option.
    string content_label;
    # The plain-text portion of the campaign. If left unspecified, we'll generate this automatically.
    string plain_text?;
    # The raw HTML for the campaign.
    string html?;
    # When importing a campaign, the URL for the HTML.
    string url?;
    # Use this template to generate the HTML content for the campaign.
    TemplateContent1 template?;
    # Available when uploading an archive to create campaign content. The archive should include all campaign content and images. [Learn more](https://mailchimp.com/help/import-a-custom-html-template/).
    UploadArchive archive?;
};

# Batch add/remove List members to/from static segment
public type BatchAddremoveListMembersTofromStaticSegment record {
    # An array of objects, each representing a new member that was added to the static segment.
    ListMembers5[] members_added?;
    # An array of objects, each representing an existing list member that got deleted from the static segment.
    ListMembers5[] members_removed?;
    # An array of objects, each representing an array of email addresses that could not be added to the segment or removed and an error message providing more details.
    BatchAddremoveListMembersTofromStaticSegmentErrors[] errors?;
    # The total number of items matching the query, irrespective of pagination.
    int total_added?;
    # The total number of items matching the query, irrespective of pagination.
    int total_removed?;
    # The total number of items matching the query, irrespective of pagination.
    int error_count?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# [A/B Testing](https://mailchimp.com/help/about-ab-testing-campaigns/) options for a campaign.
public type AbTestingOptions record {
    # The type of AB split to run.
    string split_test?;
    # How we should evaluate a winner. Based on 'opens', 'clicks', or 'manual'.
    string pick_winner?;
    # How unit of time for measuring the winner ('hours' or 'days'). This cannot be changed after a campaign is sent.
    string wait_units?;
    # The amount of time to wait before picking a winner. This cannot be changed after a campaign is sent.
    int wait_time?;
    # The size of the split groups. Campaigns split based on 'schedule' are forced to have a 50/50 split. Valid split integers are between 1-50.
    int split_size?;
    # For campaigns split on 'From Name', the name for Group A.
    string from_name_a?;
    # For campaigns split on 'From Name', the name for Group B.
    string from_name_b?;
    # For campaigns split on 'From Name', the reply-to address for Group A.
    string reply_email_a?;
    # For campaigns split on 'From Name', the reply-to address for Group B.
    string reply_email_b?;
    # For campaigns split on 'Subject Line', the subject line for Group A.
    string subject_a?;
    # For campaigns split on 'Subject Line', the subject line for Group B.
    string subject_b?;
    # The send time for Group A.
    string send_time_a?;
    # The send time for Group B.
    string send_time_b?;
    # The send time for the winning version.
    string send_time_winner?;
};

# A list of tags assigned to a list member.
public type CollectionOfTags record {
    # A list of tags assigned to the list member.
    CollectionOfTagsTags[] tags?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Open and click rates for this subscriber.
public type SubscriberStats1 record {
    # A subscriber's average open rate.
    decimal avg_open_rate?;
    # A subscriber's average clickthrough rate.
    decimal avg_click_rate?;
    # Ecommerce stats for the list member if the list is attached to a store.
    EcommerceStats ecommerce_data?;
};

# A collection of events for a given contact
public type CollectionOfEvents record {
    # An array of objects, each representing an event.
    Event[] events?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of a subscriber removed from an Automation workflow.
public type SubscriberRemovedFromAutomationWorkflow1 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string id?;
    # A string that uniquely identifies an Automation workflow.
    string workflow_id?;
    # A string that uniquely identifies a list.
    string list_id?;
    # The list member's email address.
    string email_address?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific list.
public type SubscriberList record {
    # The name of the list.
    string name;
    # [Contact information displayed in campaign footers](https://mailchimp.com/help/about-campaign-footers/) to comply with international spam laws.
    ListContact contact;
    # The [permission reminder](https://mailchimp.com/help/edit-the-permission-reminder/) for the list.
    string permission_reminder;
    # Whether campaigns for this list use the [Archive Bar](https://mailchimp.com/help/about-email-campaign-archives-and-pages/) in archives by default.
    boolean use_archive_bar?;
    # [Default values for campaigns](https://mailchimp.com/help/edit-your-emails-subject-preview-text-from-name-or-from-email-address/) created for this list.
    CampaignDefaults campaign_defaults;
    # The email address to send [subscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_subscribe?;
    # The email address to send [unsubscribe notifications](https://mailchimp.com/help/change-subscribe-and-unsubscribe-notifications/) to.
    string notify_on_unsubscribe?;
    # Whether the list supports [multiple formats for emails](https://mailchimp.com/help/change-audience-name-defaults/). When set to `true`, subscribers can choose whether they want to receive HTML or plain-text emails. When set to `false`, subscribers will receive HTML emails, with a plain-text alternative backup.
    boolean email_type_option;
    # Whether or not to require the subscriber to confirm subscription via email.
    boolean double_optin?;
    # Whether or not the list has marketing permissions (eg. GDPR) enabled.
    boolean marketing_permissions?;
};

# Open and click rates for this subscriber.
public type SubscriberStats record {
    # A subscriber's average open rate.
    decimal avg_open_rate?;
    # A subscriber's average clickthrough rate.
    decimal avg_click_rate?;
};

# Settings for the campaign including the email subject, from name, and from email address.
public type CampaignSettings record {
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The title of the Automation.
    string title?;
    # The 'from' name for the Automation (not an email address).
    string from_name?;
    # The reply-to email address for the Automation.
    string reply_to?;
};

# An option for Signup Form Styles.
public type AnOptionForSignupFormStyles record {
    # A string that identifies the property.
    string property?;
    # A string that identifies value of the property.
    string value?;
};

# One day's worth of list activity. Doesn't include Automation activity.
public type DailyListActivity record {
    # The date for the activity summary.
    string day?;
    # The total number of emails sent on the date for the activity summary.
    int emails_sent?;
    # The number of unique opens.
    int unique_opens?;
    # The number of clicks.
    int recipient_clicks?;
    # The number of hard bounces.
    int hard_bounce?;
    # The number of soft bounces
    int soft_bounce?;
    # The number of subscribes.
    int subs?;
    # The number of unsubscribes.
    int unsubs?;
    # The number of subscribers who may have been added outside of the [double opt-in process](https://mailchimp.com/help/about-double-opt-in/), such as imports or API activity.
    int other_adds?;
    # The number of subscribers who may have been removed outside of unsubscribing or reporting an email as spam (for example, deleted subscribers).
    int other_removes?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# For sent campaigns, a summary of opens and clicks.
public type CampaignReportSummary record {
    # The total number of opens for a campaign.
    int opens?;
    # The number of unique opens.
    int unique_opens?;
    # The number of unique opens divided by the total number of successful deliveries.
    decimal open_rate?;
    # The total number of clicks for an campaign.
    int clicks?;
    # The number of unique clicks.
    int subscriber_clicks?;
    # The number of unique clicks divided by the total number of successful deliveries.
    decimal click_rate?;
    # E-Commerce stats for a campaign.
    EcommerceReport1 ecommerce?;
};
