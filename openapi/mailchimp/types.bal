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

# The shipping address for the order.
public type ShippingAddress1 record {
    # The name associated with an order's shipping address.
    string name?;
    # The shipping address for the order.
    string address1?;
    # An additional field for the shipping address.
    string address2?;
    # The city in the order's shipping address.
    string city?;
    # The state or normalized province in the order's shipping address.
    string province?;
    # The two-letter code for the province or state the order's shipping address is located in.
    string province_code?;
    # The postal or zip code in the order's shipping address.
    string postal_code?;
    # The country in the order's shipping address.
    string country?;
    # The two-letter code for the country in the shipping address.
    string country_code?;
    # The longitude for the shipping address location.
    decimal longitude?;
    # The latitude for the shipping address location.
    decimal latitude?;
    # The phone number for the order's shipping address
    string phone?;
    # The company associated with an order's shipping address.
    string company?;
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

# Add a new Batch Webook.
public type BatchWebhook record {
    # A valid URL for the Webhook.
    string url;
};

# Information about a specific order line.
public type EcommerceOrderLineItem1 record {
    # A unique identifier for the product associated with the order line item.
    string product_id?;
    # A unique identifier for the product variant associated with the order line item.
    string product_variant_id?;
    # The quantity of an order line item.
    int quantity?;
    # The price of an order line item.
    decimal price?;
    # The total discount amount applied to this line item.
    decimal discount?;
};

# Information about a specific order line.
public type EcommerceOrderLineItem2 record {
    # A unique identifier for the order line item.
    string id;
    # A unique identifier for the product associated with the order line item.
    string product_id;
    # A unique identifier for the product variant associated with the order line item.
    string product_variant_id;
    # The quantity of an order line item.
    int quantity;
    # The price of an order line item.
    decimal price;
    # The total discount amount applied to this line item.
    decimal discount?;
};

# Information about a specific order line.
public type EcommerceOrderLineItem3 record {
    # A unique identifier for an order line item.
    string id?;
    # A unique identifier for the product associated with an order line item.
    string product_id?;
    # The name of the product for an order line item.
    string product_title?;
    # A unique identifier for the product variant associated with an order line item.
    string product_variant_id?;
    # The name of the product variant for an order line item.
    string product_variant_title?;
    # The image URL for a product.
    string image_url?;
    # The order line item quantity.
    int quantity?;
    # The order line item price.
    decimal price?;
    # The total discount amount applied to a line item.
    decimal discount?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of reports containing campaigns marked as Sent.
public type CampaignReports1 record {
    # An array of objects, each representing a report resource.
    CampaignReport1[] reports?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific order line.
public type EcommerceOrderLineItem4 record {
    # A unique identifier for the product associated with the order line item.
    string product_id?;
    # A unique identifier for the product variant associated with the order line item.
    string product_variant_id?;
    # The quantity of an order line item.
    int quantity?;
    # The price of an order line item.
    decimal price?;
    # The total discount amount applied to this line item.
    decimal discount?;
};

# A summary of an individual page's properties.
public type LandingPage record {
    # The name of this landing page.
    string name?;
    # The title of this landing page seen in the browser's title bar.
    string title?;
    # The description of this landing page.
    string description?;
    # The ID of the store associated with this landing page.
    string store_id?;
    # The list's ID associated with this landing page.
    string list_id?;
    # The type of template the landing page has.
    string 'type?;
    # The template_id of this landing page.
    int template_id?;
    # The tracking settings applied to this landing page.
    TrackingSettings tracking?;
};

# A list of available images and files stored in the File Manager for the account.
public type FileManager record {
    #  A list of files and images in an account.
    GalleryFile3[] files?;
    # The total size of all File Manager files in bytes.
    decimal total_file_size?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse20011ReportSummaryAverageOrderAmount record {
    decimal amount?;
    string currency_code?;
};

# abandonedCart automation details.
public type AbandonedCartAutomation record {
    # Whether this store supports the abandonedCart automation.
    boolean is_supported?;
    # Unique ID of automation parent campaign.
    string id?;
    # Status of the abandonedCart automation.
    string status?;
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

# Campaign feedback details.
public type CampaignAdvice record {
    # The sentiment type for a feedback message.
    string 'type?;
    # The advice message.
    string message?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of this account's tracked conversations.
public type TrackedConversations record {
    # A list of conversations.
    Conversation1[] conversations?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse2009 record {
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
    # Audience settings
    InlineResponse2009Audience audience?;
    InlineResponse2009Budget budget?;
    string canceled_at?;
    # Channel settings
    InlineResponse2009Channel 'channel?;
    InlineResponse2009Content content?;
    string create_time?;
    string email_source_name?;
    string end_time?;
    # Check if this ad is connected to a facebook page
    InlineResponse2009Feedback feedback?;
    # Check if this ad has audience setup
    boolean has_audience?;
    # Check if this ad has content
    boolean has_content?;
    boolean has_segment?;
    # Unique ID of an Outreach
    string id?;
    # Check if this ad is connected to a facebook page
    boolean is_connected?;
    # Title or name of an Outreach
    string name?;
    boolean needs_attention?;
    string paused_at?;
    string published_time?;
    # List settings for the outreach
    List10 recipients?;
    InlineResponse2009ReportSummary report_summary?;
    # Outreach report availability
    boolean show_report?;
    # Connected Site
    InlineResponse2009Site site?;
    string start_time?;
    # Campaign, Ad, or Page status
    string status?;
    # The URL of the thumbnail for this outreach
    string thumbnail?;
    # Supported Campaign, Ad, Page type
    string 'type?;
    string updated_at?;
    boolean was_canceled_by_facebook?;
    # Web ID
    int web_id?;
};

# The clicks and visits data from the last five weeks.
public type WeeklyClicksAndVisitsData record {
    # The total number of clicks in a week.
    WeeklyClicksAndVisitsDataClicks[] clicks?;
    # The total number of visits in a week.
    WeeklyClicksAndVisitsDataVisits[] visits?;
    # Represent daily clicks and visits data
    DailyClicksAndVisitsDataUniqueVisits[] unique_visits?;
};

# Information about a specific connected site.
public type ConnectedSite3 record {
    # The unique identifier for the site.
    string foreign_id?;
    # The unique identifier for the ecommerce store that's associated with the connected site (if any). The store_id for a specific connected site can't change.
    string store_id?;
    # The platform of the connected site.
    string platform?;
    # The connected site domain.
    string domain?;
    # The script used to connect your site with Mailchimp.
    Script1 site_script?;
    # The date and time the connected site was created in ISO 8601 format.
    string created_at?;
    # The date and time the connected site was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The Connected Site associated with the store.
public type ConnectedSite2 record {
    # The unique identifier for the connected site.
    string site_foreign_id?;
    # The script used to connect your site with Mailchimp.
    Script site_script?;
};

# Update information about an individual Automation workflow email.
public type UpdateInformationAboutASpecificWorkflowEmail record {
    # Settings for the campaign including the email subject, from name, and from email address.
    CampaignSettings settings?;
    # The delay settings for an automation email.
    AutomationDelay delay?;
};

# Information about a specific connected site.
public type ConnectedSite1 record {
    # The unique identifier for the site.
    string foreign_id?;
    # The unique identifier for the ecommerce store that's associated with the connected site (if any). The store_id for a specific connected site can't change.
    string store_id?;
    # The platform of the connected site.
    string platform?;
    # The connected site domain.
    string domain?;
    # The script used to connect your site with Mailchimp.
    Script1 site_script?;
    # The date and time the connected site was created in ISO 8601 format.
    string created_at?;
    # The date and time the connected site was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific template.
public type TemplateInstance record {
    # The name of the template.
    string name;
    # The id of the folder the template is currently in.
    string folder_id?;
    # The raw HTML for the template. We  support the Mailchimp [Template Language](https://mailchimp.com/help/getting-started-with-mailchimps-template-language/) in any HTML code passed via the API.
    string html;
};

# Information about an Ecommerce Store's specific Promo Code.
public type EcommercePromoCode record {
    # A unique identifier for the promo code. Restricted to UTF-8 characters with max length 50.
    string id;
    # The discount code. Restricted to UTF-8 characters with max length 50.
    string code;
    # The url that should be used in the promotion campaign restricted to UTF-8 characters with max length 2000.
    string redemption_url;
    # Number of times promo code has been used.
    int usage_count?;
    # Whether the promo code is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
};

public type InlineResponse2009AudienceTargetingSpecsInterests record {
    string name?;
};

# Information about a specific connected site.
public type ConnectedSite record {
    # The unique identifier for the site.
    string foreign_id;
    # The connected site domain.
    string domain;
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
    VerifiedDomains3[] domains?;
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

# The verified domains currently on the account.
public type VerifiedDomains3 record {
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

# A list of member's subscriber activity in a specific campaign.
public type EmailActivity record {
    # An array of members that were sent the campaign.
    EmailActivity2[] emails?;
    # The unique id for the sent campaign.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A list of members who have unsubscribed from a specific campaign.
public type Unsubscribes record {
    # An array of objects, each representing a member who unsubscribed from a campaign.
    Unsubscribes2[] unsubscribes?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type EcommercestoresstoreIdordersPromos record {
    # The Promo Code
    string code;
    # The amount of discount applied on the total price. For example if the total cost was $100 and the customer paid $95.5, amount_discounted will be 4.5 For free shipping set amount_discounted to 0
    decimal amount_discounted;
    # Type of discount. For free shipping set type to fixed
    string 'type;
};

# Information about a specific cart.
public type EcommerceCart1 record {
    # A unique identifier for the cart.
    string id?;
    # Information about a specific customer.
    EcommerceCustomer6 customer?;
    # A string that uniquely identifies the campaign associated with a cart.
    string campaign_id?;
    # The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations.
    string checkout_url?;
    # The three-letter ISO 4217 code for the currency that the cart uses.
    string currency_code?;
    # The order total for the cart.
    decimal order_total?;
    # The total tax for the cart.
    decimal tax_total?;
    # An array of the cart's line items.
    EcommerceCartLineItem5[] lines?;
    # The date and time the cart was created in ISO 8601 format.
    string created_at?;
    # The date and time the cart was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific cart.
public type EcommerceCart2 record {
    # Information about a specific customer. Orders for existing customers should include only the `id` parameter in the `customer` object body.
    EcommerceCustomer1 customer?;
    # A string that uniquely identifies the campaign associated with a cart.
    string campaign_id?;
    # The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations.
    string checkout_url?;
    # The three-letter ISO 4217 code for the currency that the cart uses.
    string currency_code?;
    # The order total for the cart.
    decimal order_total?;
    # The total tax for the cart.
    decimal tax_total?;
    # An array of the cart's line items.
    EcommerceCartLineItem1[] lines?;
};

# Information about a specific cart.
public type EcommerceCart3 record {
    # A unique identifier for the cart.
    string id?;
    # Information about a specific customer.
    EcommerceCustomer6 customer?;
    # A string that uniquely identifies the campaign associated with a cart.
    string campaign_id?;
    # The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations.
    string checkout_url?;
    # The three-letter ISO 4217 code for the currency that the cart uses.
    string currency_code?;
    # The order total for the cart.
    decimal order_total?;
    # The total tax for the cart.
    decimal tax_total?;
    # An array of the cart's line items.
    EcommerceCartLineItem5[] lines?;
    # The date and time the cart was created in ISO 8601 format.
    string created_at?;
    # The date and time the cart was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An object describing the click activity for the campaign.
public type Clicks record {
    # The total number of clicks for the campaign.
    int clicks_total?;
    # The total number of unique clicks for links across a campaign.
    int unique_clicks?;
    # The total number of subscribers who clicked on a campaign.
    int unique_subscriber_clicks?;
    # The number of unique clicks divided by the total number of successful deliveries.
    decimal click_rate?;
    # The date and time of the last recorded click for the campaign in ISO 8601 format.
    string last_click?;
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

# A collection of ecommerce products.
public type InlineResponse2007 record {
    # Represent Products
    InlineResponse2007Products[] products?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of landing pages.
public type InlineResponse2006 record {
    # The landing pages on the account
    LandingPage3[] landing_pages?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of feedback based on a campaign's statistics.
public type CampaignAdviceReport record {
    # An array of objects, each representing a point of campaign feedback.
    CampaignAdvice[] advice?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Default content for a template.
public type TemplateDefaultContent record {
    # The sections that you can edit in the template, including each section's default content.
    record {} sections?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of connected sites in the account.
public type ConnectedSites record {
    # An array of objects, each representing a connected site.
    ConnectedSite3[] sites?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An individual file listed in the File Manager.
public type GalleryFile record {
    # The id of the folder.
    int folder_id?;
    # The name of the file.
    string name;
    # The base64-encoded contents of the file.
    string file_data;
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

# A collection of a cart's line items.
public type CartLines record {
    # The store id.
    string store_id?;
    # The cart id.
    string cart_id?;
    # An array of objects, each representing a cart's line item.
    EcommerceCartLineItem5[] lines?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A summary of an individual landing page's settings and content.
public type LandingPageReport1 record {
    # A string that uniquely identifies this landing page.
    string id?;
    # The name of this landing page the user will see.
    string name?;
    # The name of the landing page the user's customers will see.
    string title?;
    # The landing page url.
    string url?;
    # The time this landing page was published.
    string published_at?;
    # The time this landing page was unpublished.
    string unpublished_at?;
    # The status of the landing page.
    string status?;
    # The list id connected to this landing page.
    string list_id?;
    # The number of visits to this landing pages.
    int visits?;
    # The number of unique visits to this landing pages.
    int unique_visits?;
    # The number of subscribes to this landing pages.
    int subscribes?;
    # The number of clicks to this landing pages.
    int clicks?;
    # The percentage of people who visited your landing page and were added to your list.
    decimal conversion_rate?;
    # Represent landing page timeseries report
    LandingPageReportTimeseries timeseries?;
    # Represent ecommerce report of landing page
    LandingPageReportEcommerce ecommerce?;
    # The ID used in the Mailchimp web application.
    int web_id?;
    # List Name
    string list_name?;
    # A list of tags associated to the landing page.
    Tag[] signup_tags?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A summary of social activity for the campaign, tracked by EepURL.
public type EepurlActivity record {
    # A summary of Twitter activity for a campaign.
    TwitterStats twitter?;
    # A summary of the click-throughs on the campaign's URL.
    ClickSummary clicks?;
    # A summary of the top referrers for the campaign.
    Referrer[] referrers?;
    # The shortened link used for tracking.
    string eepurl?;
    # The unique id for the campaign.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
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

# A webhook configured for batch status updates.
public type BatchWebhook1 record {
    # A string that uniquely identifies this Batch Webhook.
    string id?;
    # A valid URL for the Webhook.
    string url?;
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

# Update an existing Batch Webook.
public type BatchWebhook2 record {
    # A valid URL for the Webhook.
    string url;
};

# A webhook configured for batch status updates.
public type BatchWebhook3 record {
    # A string that uniquely identifies this Batch Webhook.
    string id?;
    # A valid URL for the Webhook.
    string url?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of a product's images.
public type EcommerceProductImages record {
    # The store id.
    string store_id?;
    # The product id.
    string product_id?;
    # An array of objects, each representing a product image resource.
    EcommerceProductImage5[] images?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A summary of the interaction with the campaign.
public type MemberActivity1 record {
    # The date and time recorded for the action in ISO 8601 format.
    string timestamp?;
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

# A folder used to organize campaigns.
public type CampaignFolder1 record {
    # The name of the folder.
    string name?;
    # A string that uniquely identifies this campaign folder.
    string id?;
    # The number of campaigns in the folder.
    int count?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A folder used to organize campaigns.
public type CampaignFolder2 record {
    # Name to associate with the folder.
    string name;
};

# A folder used to organize campaigns.
public type CampaignFolder3 record {
    # The name of the folder.
    string name?;
    # A string that uniquely identifies this campaign folder.
    string id?;
    # The number of campaigns in the folder.
    int count?;
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

# E-Commerce stats for a campaign.
public type EcommerceReport record {
    # The total orders for a campaign.
    int total_orders?;
    # The total spent for a campaign. Calculated as the sum of all order totals with no deductions.
    decimal total_spent?;
    # The total revenue for a campaign. Calculated as the sum of all order totals minus shipping and tax totals.
    decimal total_revenue?;
    # Currency code
    string currency_code?;
};

# Statistics for the top-performing email domains in a campaign.
public type DomainPerformance record {
    # The top 5 email domains based on total delivered emails.
    EmailDomain[] domains?;
    # The total number of emails sent for the campaign.
    int total_sent?;
    # The unique id for the campaign.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Messages from a specific conversation.
public type CollectionOfConversationMessages record {
    # An array of objects, each representing a conversation messages resources.
    ConversationMessage2[] conversation_messages?;
    # A string that identifies this conversation.
    string conversation_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific customer. For existing customers include only the `id` parameter in the `customer` object body.
public type EcommerceCustomer record {
    # A unique identifier for the customer. Limited to 50 characters.
    string id;
    # The customer's email address.
    string email_address?;
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status?;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's address.
    Address1 address?;
};

# Report summary of facebook ad
public type InlineResponse20011ReportSummary record {
    # Reach
    int reach?;
    # Number of impressions
    int impressions?;
    # Total number of clicks
    int clicks?;
    # Click rate
    decimal click_rate?;
    # Number of unique clicks
    int unique_clicks?;
    # Number of first time buyers
    int first_time_buyers?;
    # Represent ecommerce report summary
    InlineResponse20011ReportSummaryEcommerce ecommerce?;
    # Total number of products sold
    int total_products_sold?;
    # Total number of orders
    int total_orders?;
    # Represent average order amount report summary 
    InlineResponse20011ReportSummaryAverageOrderAmount average_order_amount?;
    # Represent average order amount report summary of cost per click
    InlineResponse20011ReportSummaryAverageOrderAmount cost_per_click?;
    # Represent report summery of average order amount
    InlineResponse20011ReportSummaryAverageOrderAmount average_daily_budget?;
    # Number of likes
    int likes?;
    # Number of comments
    int comments?;
    # Number of shares
    int shares?;
    # Whether the duration extended
    boolean has_extended_ad_duration?;
    # Represent report summary extended
    InlineResponse20011ReportSummaryExtendedAt extended_at?;
    # Return on investment
    decimal return_on_investment?;
};

public type InlineResponse2009ReportSummaryEcommerce record {
    decimal total_revenue?;
    string currency_code?;
    decimal average_order_revenue?;
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

# Details about an individual conversation. Conversation tracking is a feature available to paid accounts that lets you view replies to your campaigns in your Mailchimp account.
public type Conversation1 record {
    # A string that uniquely identifies this conversation.
    string id?;
    # The total number of messages in this conversation.
    int message_count?;
    # The unique identifier of the campaign for this conversation.
    string campaign_id?;
    # The unique identifier of the list for this conversation.
    string list_id?;
    # The number of unread messages in this conversation.
    int unread_messages?;
    # A label representing the sender of this message.
    string from_label?;
    # A label representing the email of the sender of this message.
    string from_email?;
    # The subject of the message.
    string subject?;
    # The most recent message in the conversation.
    LastMessage last_message?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The most recent message in the conversation.
public type LastMessage record {
    # A label representing the sender of this message.
    string from_label?;
    # A label representing the email of the sender of this message.
    string from_email?;
    # The subject of this message.
    string subject?;
    # The plain-text content of the message.
    string message?;
    # Whether this message has been marked as read.
    boolean read?;
    # The date and time the message was either sent or received in ISO 8601 format.
    string timestamp?;
};

# Information about a specific order line.
public type EcommerceOrderLineItem5 record {
    # A unique identifier for an order line item.
    string id?;
    # A unique identifier for the product associated with an order line item.
    string product_id?;
    # The name of the product for an order line item.
    string product_title?;
    # A unique identifier for the product variant associated with an order line item.
    string product_variant_id?;
    # The name of the product variant for an order line item.
    string product_variant_title?;
    # The image URL for a product.
    string image_url?;
    # The order line item quantity.
    int quantity?;
    # The order line item price.
    decimal price?;
    # The total discount amount applied to a line item.
    decimal discount?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The status of a batch request
public type Batch record {
    # A string that uniquely identifies this batch request.
    string id?;
    # The status of the batch call. [Learn more](https://mailchimp.com/developer/marketing/guides/run-async-requests-batch-endpoint/#check-the-status-of-a-batch-operation) about the batch operation status.
    string status?;
    # The total number of operations to complete as part of this batch request. For GET requests requiring pagination, each page counts as a separate operation.
    int total_operations?;
    # The number of completed operations. This includes operations that returned an error.
    int finished_operations?;
    # The number of completed operations that returned an error.
    int errored_operations?;
    # The date and time when the server received the batch request in ISO 8601 format.
    string submitted_at?;
    # The date and time when all operations in the batch request completed in ISO 8601 format.
    string completed_at?;
    # The URL of the gzipped archive of the results of all the operations.
    string response_body_url?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Audience settings
public type InlineResponse2009Audience record {
    # Type of the audience
    string 'type?;
    # List or Facebook based audience
    string source_type?;
    # Represent audience email source 
    InlineResponse2009AudienceEmailSource email_source?;
    # To include list contacts as part of audience
    boolean include_source_in_target?;
    # To find similar audience in given country
    string lookalike_country_code?;
    # Represent audience target type spec
    InlineResponse2009AudienceTargetingSpecs targeting_specs?;
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

# List settings for the outreach
public type List10 record {
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
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

# Do particular authorization constraints around this collection limit creation of new instances?
public type CollectionAuthorization record {
    # May the user create additional instances of this resource?
    boolean may_create;
    # How many total instances of this resource are allowed? This is independent of any filter conditions applied to the query. As a special case, -1 indicates unlimited.
    int max_instances;
    # How many total instances of this resource are already in use? This is independent of any filter conditions applied to the query. Value may be larger than max_instances. As a special case, -1 is returned when access is unlimited.
    int current_total_instances?;
};

# A single instance of a campaign referral.
public type Referrer record {
    # A referrer (truncated to 100 bytes).
    string referrer?;
    # The number of clicks a single referrer generated.
    int clicks?;
    # The timestamp for the first click from this referrer.
    string first_click?;
    # The timestamp for the last click from this referrer.
    string last_click?;
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

# A list of campaign folders
public type CampaignFolders record {
    # An array of objects representing campaign folders.
    CampaignFolder3[] folders?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of a member's opens activity in a specific campaign.
public type OpenActivity record {
    # The unique id for the campaign.
    string campaign_id?;
    # The unique id for the list.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The status of the member, namely if they are subscribed, unsubscribed, deleted, non-subscribed, transactional, pending, or need reconfirmation.
    string contact_status?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The total number of times the this campaign was opened by the list member.
    int opens_count?;
    # An array of timestamps for each time a list member opened the campaign. If a list member opens an email multiple times, this will return a separate timestamp for each open event.
    MemberActivity1[] opens?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific customer.
public type EcommerceCustomer3 record {
    # A unique identifier for the customer.
    string id?;
    # The customer's email address.
    string email_address?;
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status?;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's total order count.
    int orders_count?;
    # The total amount the customer has spent.
    decimal total_spent?;
    # The customer's address.
    Address1 address?;
    # The date and time the customer was created in ISO 8601 format.
    string created_at?;
    # The date and time the customer was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific customer.
public type EcommerceCustomer2 record {
    # A unique identifier for the customer. Limited to 50 characters.
    string id;
    # The customer's email address.
    string email_address;
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's address.
    Address1 address?;
};

# A specific note for a specific member.
public type MemberNotes2 record {
    # The content of the note. Note length is limited to 1,000 characters.
    string note?;
};

# Information about a specific customer. Orders for existing customers should include only the `id` parameter in the `customer` object body.
public type EcommerceCustomer5 record {
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status?;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's address.
    Address1 address?;
};

# Information about a specific customer. Orders for existing customers should include only the `id` parameter in the `customer` object body.
public type EcommerceCustomer4 record {
    # A unique identifier for the customer. Limited to 50 characters.
    string id;
    # The customer's email address.
    string email_address;
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's address.
    Address1 address?;
};

# Report details about a sent campaign.
public type CampaignReport record {
    # A string that uniquely identifies this campaign.
    string id?;
    # The title of the campaign.
    string campaign_title?;
    # The type of campaign (regular, plain-text, ab_split, rss, automation, variate, or auto).
    string 'type?;
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The name of the list.
    string list_name?;
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    # The number of abuse reports generated for this campaign.
    int abuse_reports?;
    # The total number of unsubscribed members for this campaign.
    int unsubscribed?;
    # The date and time a campaign was sent in ISO 8601 format.
    string send_time?;
    # For RSS campaigns, the date and time of the last send in ISO 8601 format.
    string rss_last_send?;
    # An object describing the bounce summary for the campaign.
    Bounces bounces?;
    # An object describing the forwards and forward activity for the campaign.
    Forwards forwards?;
    # An object describing the open activity for the campaign.
    Opens opens?;
    # An object describing the click activity for the campaign.
    Clicks clicks?;
    # An object describing campaign engagement on Facebook.
    FacebookLikes facebook_likes?;
    # The average campaign statistics for your industry.
    IndustryStats industry_stats?;
    # The average campaign statistics for your list. This won't be present if we haven't calculated it yet for this list.
    ListStats list_stats?;
    # General stats about different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
    AbSplitStats ab_split?;
    # An hourly breakdown of sends, opens, and clicks if a campaign is sent using timewarp.
    CampaignReports1Timewarp[] timewarp?;
    # An hourly breakdown of the performance of the campaign over the first 24 hours.
    CampaignReports1Timeseries[] timeseries?;
    # The url and password for the [VIP report](https://mailchimp.com/help/share-a-campaign-report/).
    ShareReport share_report?;
    # E-Commerce stats for a campaign.
    EcommerceReport ecommerce?;
    # Updates on campaigns in the process of sending.
    CampaignDeliveryStatus delivery_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The store address.
public type Address record {
    # The store's mailing address.
    string address1?;
    # An additional field for the store's mailing address.
    string address2?;
    # The city the store is located in.
    string city?;
    # The store's state name or normalized province.
    string province?;
    # The two-letter code for the store's province or state.
    string province_code?;
    # The store's postal or zip code.
    string postal_code?;
    # The store's country.
    string country?;
    # The two-letter code for to the store's country.
    string country_code?;
    # The longitude of the store location.
    decimal longitude?;
    # The latitude of the store location.
    decimal latitude?;
};

# Information about a specific customer. Orders for existing customers should include only the `id` parameter in the `customer` object body.
public type EcommerceCustomer1 record {
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status?;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's address.
    Address1 address?;
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

# Information about a specific order line.
public type EcommerceOrderLineItem record {
    # A unique identifier for the order line item.
    string id;
    # A unique identifier for the product associated with the order line item.
    string product_id;
    # A unique identifier for the product variant associated with the order line item.
    string product_variant_id;
    # The quantity of an order line item.
    int quantity;
    # The price of an order line item.
    decimal price;
    # The total discount amount applied to this line item.
    decimal discount?;
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

# Information about a specific customer.
public type EcommerceCustomer6 record {
    # A unique identifier for the customer.
    string id?;
    # The customer's email address.
    string email_address?;
    # The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers).
    boolean opt_in_status?;
    # The customer's company.
    string company?;
    # The customer's first name.
    string first_name?;
    # The customer's last name.
    string last_name?;
    # The customer's total order count.
    int orders_count?;
    # The total amount the customer has spent.
    decimal total_spent?;
    # The customer's address.
    Address1 address?;
    # The date and time the customer was created in ISO 8601 format.
    string created_at?;
    # The date and time the customer was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A folder used to organize templates.
public type TemplateFolder record {
    # The name of the folder.
    string name;
};

# The HTML content for a landing page.
public type LandingPageContent record {
    # The raw HTML for the landing page.
    string html?;
    # The JSON Structure for the landing page
    string 'json?;
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

# Information about a specific cart line item.
public type EcommerceCartLineItem1 record {
    # A unique identifier for the product associated with the cart line item.
    string product_id?;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id?;
    # The quantity of a cart line item.
    int quantity?;
    # The price of a cart line item.
    decimal price?;
};

# Information about a specific cart line item.
public type EcommerceCartLineItem2 record {
    # A unique identifier for the cart line item.
    string id;
    # A unique identifier for the product associated with the cart line item.
    string product_id;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id;
    # The quantity of a cart line item.
    int quantity;
    # The price of a cart line item.
    decimal price;
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

# Information about a specific cart line item.
public type EcommerceCartLineItem5 record {
    # A unique identifier for the cart line item.
    string id?;
    # A unique identifier for the product associated with the cart line item.
    string product_id?;
    # The name of the product for the cart line item.
    string product_title?;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id?;
    # The name of the product variant for the cart line item.
    string product_variant_title?;
    # The quantity of a cart line item.
    int quantity?;
    # The price of a cart line item.
    decimal price?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific cart line item.
public type EcommerceCartLineItem3 record {
    # A unique identifier for the cart line item.
    string id?;
    # A unique identifier for the product associated with the cart line item.
    string product_id?;
    # The name of the product for the cart line item.
    string product_title?;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id?;
    # The name of the product variant for the cart line item.
    string product_variant_title?;
    # The quantity of a cart line item.
    int quantity?;
    # The price of a cart line item.
    decimal price?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An individual store in an account.
public type EcommerceStore record {
    # The unique identifier for the store.
    string id;
    # The unique identifier for the list associated with the store. The `list_id` for a specific store cannot change.
    string list_id;
    # The name of the store.
    string name;
    # The e-commerce platform of the store.
    string platform?;
    # The store domain. This parameter is required for Connected Sites and Google Ads.
    string domain?;
    # Whether to disable automations because the store is currently [syncing](https://mailchimp.com/developer/marketing/docs/e-commerce/#pausing-store-automations).
    boolean is_syncing?;
    # The email address for the store.
    string email_address?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code;
    # The currency format for the store. For example: `$`, `£`, etc.
    string money_format?;
    # The primary locale for the store. For example: `en`, `de`, etc.
    string primary_locale?;
    # The timezone for the store.
    string timezone?;
    # The store phone number.
    string phone?;
    # The store address.
    Address address?;
};

# A breakdown of clicks by different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
public type AbSplit record {
    # Stats for Group A.
    GroupA a?;
    # Stats for Group B.
    GroupB b?;
};

# Information about a specific cart line item.
public type EcommerceCartLineItem4 record {
    # A unique identifier for the product associated with the cart line item.
    string product_id?;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id?;
    # The quantity of a cart line item.
    int quantity?;
    # The price of a cart line item.
    decimal price?;
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

# A summary of the click-throughs on the campaign's URL.
public type ClickSummary record {
    # The total number of clicks to the campaign's URL.
    int clicks?;
    # The timestamp for the first click to the URL.
    string first_click?;
    # The timestamp for the last click to the URL.
    string last_click?;
    # A summary of the top click locations.
    Location2[] locations?;
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

public type InlineResponse2007Products record {
    string title?;
    string sku?;
    string image_url?;
    decimal total_revenue?;
    decimal total_purchased?;
    string currency_code?;
    int recommendation_total?;
    int recommendation_purchased?;
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

# General stats about different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
public type AbSplitStats record {
    # Stats for Campaign A.
    CampaignA a?;
    # Stats for Campaign B.
    CampaignB b?;
};

# Details about an individual conversation. Conversation tracking is a feature available to paid accounts that lets you view replies to your campaigns in your Mailchimp account.
public type Conversation record {
    # A string that uniquely identifies this conversation.
    string id?;
    # The total number of messages in this conversation.
    int message_count?;
    # The unique identifier of the campaign for this conversation.
    string campaign_id?;
    # The unique identifier of the list for this conversation.
    string list_id?;
    # The number of unread messages in this conversation.
    int unread_messages?;
    # A label representing the sender of this message.
    string from_label?;
    # A label representing the email of the sender of this message.
    string from_email?;
    # The subject of the message.
    string subject?;
    # The most recent message in the conversation.
    LastMessage last_message?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A summary of an individual landing page's settings and content.
public type LandingPageReport record {
    # A string that uniquely identifies this landing page.
    string id?;
    # The name of this landing page the user will see.
    string name?;
    # The name of the landing page the user's customers will see.
    string title?;
    # The landing page url.
    string url?;
    # The time this landing page was published.
    string published_at?;
    # The time this landing page was unpublished.
    string unpublished_at?;
    # The status of the landing page.
    string status?;
    # The list id connected to this landing page.
    string list_id?;
    # The number of visits to this landing pages.
    int visits?;
    # The number of unique visits to this landing pages.
    int unique_visits?;
    # The number of subscribes to this landing pages.
    int subscribes?;
    # The number of clicks to this landing pages.
    int clicks?;
    # The percentage of people who visited your landing page and were added to your list.
    decimal conversion_rate?;
    # The timeseries report of the landing page
    LandingPageReportTimeseries timeseries?;
    # The ecommerce report of the landing page
    LandingPageReportEcommerce ecommerce?;
    # The ID used in the Mailchimp web application.
    int web_id?;
    # List Name
    string list_name?;
    # A list of tags associated to the landing page.
    Tag[] signup_tags?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Connected Site
public type InlineResponse2009Site record {
    # The ID of this connected site.
    int id?;
    # The name of the connected site
    string name?;
    # The URL for this connected site.
    string url?;
};

# The billing address for the order.
public type BillingAddress record {
    # The name associated with the billing address.
    string name?;
    # The billing address for the order.
    string address1?;
    # An additional field for the billing address.
    string address2?;
    # The city in the billing address.
    string city?;
    # The state or normalized province in the billing address.
    string province?;
    # The two-letter code for the province in the billing address.
    string province_code?;
    # The postal or zip code in the billing address.
    string postal_code?;
    # The country in the billing address.
    string country?;
    # The two-letter code for the country in the billing address.
    string country_code?;
    # The longitude for the billing address location.
    decimal longitude?;
    # The latitude for the billing address location.
    decimal latitude?;
    # The phone number for the billing address
    string phone?;
    # The company associated with the billing address.
    string company?;
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

public type CampaignReports1Timeseries record {
    # The date and time for the series in ISO 8601 format.
    string timestamp?;
    # The number of emails sent in the timeseries.
    int emails_sent?;
    # The number of unique opens in the timeseries.
    int unique_opens?;
    # The number of clicks in the timeseries.
    int recipients_clicks?;
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

# Submit a response to the verification challenge and verify a domain for sending.
public type Body4 record {
    # The code that was sent to the email address provided when adding a new domain to verify.
    string code;
};

# The url and password for the [VIP report](https://mailchimp.com/help/share-a-campaign-report/).
public type ShareReport record {
    # The URL for the VIP report.
    string share_url?;
    # If password protected, the password for the VIP report.
    string share_password?;
};

# Use this template to generate the HTML content of the campaign
public type TemplateContent record {
    # The id of the template to use.
    int id;
    # Content for the sections of the template. Each key should be the unique [mc:edit area](https://mailchimp.com/help/create-editable-content-areas-with-mailchimps-template-language/) name from the template.
    record  { }  sections?;
};

public type Body2 record {
    # An array of email addresses to send the test email to.
    string[] test_emails;
    # Choose the type of test email to send.
    string send_type;
};

public type Body3 record {
    # Email address for a subscriber.
    string email_address;
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

# A collection of the store's promo rules.
public type PromoRules record {
    # The store id.
    string store_id?;
    # An array of objects, each representing promo rules defined for a store.
    EcommercePromoRule3[] promo_rules?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Details for the automations attached to this store.
public type Automations record {
    # abandonedCart automation details.
    AbandonedCartAutomation abandoned_cart?;
    # abandonedBrowse automation details. abandonedBrowse is also known as Product Retargeting Email or Retarget Site Visitors on the web.
    AbandonedBrowseAutomation abandoned_browse?;
};

public type Body1 record {
    # The UTC date and time to schedule the campaign for delivery in ISO 8601 format. Campaigns may only be scheduled to send on the quarter-hour (:00, :15, :30, :45).
    string schedule_time;
    # Choose whether the campaign should use [Timewarp](https://mailchimp.com/help/use-timewarp/) when sending. Campaigns scheduled with Timewarp are localized based on the recipients' time zones. For example, a Timewarp campaign with a `schedule_time` of 13:00 will be sent to each recipient at 1:00pm in their local time. Cannot be set to `true` for campaigns using [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/).
    boolean timewarp?;
    # Choose whether the campaign should use [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/). Cannot be set to `true` for campaigns using [Timewarp](https://mailchimp.com/help/use-timewarp/).
    BatchDelivery batch_delivery?;
};

# A list of reports containing child campaigns for a specific campaign.
public type CampaignSubreports record {
    # An array of objects, each representing a report resource.
    CampaignReport1[] reports?;
    # Unique identifier of the parent campaign
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of a store's products.
public type Products record {
    # The store id.
    string store_id?;
    # An array of objects, each representing a store product.
    EcommerceProduct3[] products?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific product.
public type EcommerceProduct3 record {
    # A unique identifier for the product.
    string id?;
    # The currency code
    string currency_code?;
    # The title of a product.
    string title?;
    # The handle of a product.
    string 'handle?;
    # The URL for a product.
    string url?;
    # The description of a product.
    string description?;
    # The type of product.
    string 'type?;
    # The vendor for a product.
    string vendor?;
    # The image URL for a product.
    string image_url?;
    # Returns up to 50 of the product's variants. To retrieve all variants use [Product Variants](https://mailchimp.com/developer/marketing/api/ecommerce-product-variants/).
    EcommerceProductVariant6[] variants?;
    # An array of the product's images.
    EcommerceProductImage5[] images?;
    # The date and time the product was published in ISO 8601 format.
    string published_at_foreign?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific product.
public type EcommerceProduct2 record {
    # The title of a product.
    string title?;
    # The handle of a product.
    string 'handle?;
    # The URL for a product.
    string url?;
    # The description of a product.
    string description?;
    # The type of product.
    string 'type?;
    # The vendor for a product.
    string vendor?;
    # The image URL for a product.
    string image_url?;
    # An array of the product's variants. At least one variant is required for each product. A variant can use the same `id` and `title` as the parent product.
    EcommerceProductVariant1[] variants?;
    # An array of the product's images.
    EcommerceProductImage1[] images?;
    # The date and time the product was published in ISO 8601 format.
    string published_at_foreign?;
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

# Information about a specific product.
public type EcommerceProduct1 record {
    # A unique identifier for the product.
    string id?;
    # The currency code
    string currency_code?;
    # The title of a product.
    string title?;
    # The handle of a product.
    string 'handle?;
    # The URL for a product.
    string url?;
    # The description of a product.
    string description?;
    # The type of product.
    string 'type?;
    # The vendor for a product.
    string vendor?;
    # The image URL for a product.
    string image_url?;
    # Returns up to 50 of the product's variants. To retrieve all variants use [Product Variants](https://mailchimp.com/developer/marketing/api/ecommerce-product-variants/).
    EcommerceProductVariant6[] variants?;
    # An array of the product's images.
    EcommerceProductImage5[] images?;
    # The date and time the product was published in ISO 8601 format.
    string published_at_foreign?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse2009ContentAttachments record {
    string name?;
    string link_url?;
    string description?;
    string image_url?;
    string call_to_action?;
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
    record  { }  sections?;
};

# The [conditions of the segment](https://mailchimp.com/help/save-and-manage-segments/). Static and fuzzy segments don't have conditions.
public type Conditions record {
    # Match type.
    string 'match?;
    # Segment match conditions. There are multiple possible types, see the [condition types documentation](https://mailchimp.com/developer/marketing/docs/alternative-schemas/#segment-condition-schemas).
    record {}[] conditions?;
};

public type CampaignReports1Timewarp record {
    # For campaigns sent with timewarp, the time zone group the member is apart of.
    int gmt_offset?;
    # The number of opens.
    int opens?;
    # The date and time of the last open in ISO 8601 format.
    string last_open?;
    # The number of unique opens.
    int unique_opens?;
    # The number of clicks.
    int clicks?;
    # The date and time of the last click in ISO 8601 format.
    string last_click?;
    # The number of unique clicks.
    int unique_clicks?;
    # The number of bounces.
    int bounces?;
};

# An object describing the bounce summary for the campaign.
public type Bounces record {
    # The total number of hard bounced email addresses.
    int hard_bounces?;
    # The total number of soft bounced email addresses.
    int soft_bounces?;
    # The total number of addresses that were syntax-related bounces.
    int syntax_errors?;
};

public type LandingPageReportEcommerce record {
    # The total revenue of this landing page.
    decimal total_revenue?;
    # The user's currency code.
    string currency_code?;
    # The total number of orders associated with this landing page.
    int total_orders?;
    # The average order revenue of this landing page.
    decimal average_order_revenue?;
};

# Information about a specific product variant.
public type EcommerceProductVariant record {
    # A unique identifier for the product variant.
    string id;
    # The title of a product variant.
    string title;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
};

public type LandingPageReportTimeseries record {
    # The clicks and visits data from the last seven days.
    DailyClicksAndVisitsData daily_stats?;
    # The clicks and visits data from the last five weeks.
    WeeklyClicksAndVisitsData weekly_stats?;
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

# Campaigns and Snippets found for given search term.
public type Campaigns record {
    # An array of matching campaigns and snippets.
    CampaignsResults[] results?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

public type DailyClicksAndVisitsDataVisits record {
    string date?;
    int val?;
};

# The email client.
public type EmailClient record {
    # The name of the email client.
    string 'client?;
    # The number of subscribed members who used this email client.
    int members?;
};

# An individual folder listed in the File Manager.
public type GalleryFolder record {
    # The name of the folder.
    string name;
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

# An array of Chimp Chatter messages. There's a maximum of 200 messages present for an account.
public type InlineResponse200 record {
    # An array of Chimp Chatter messages. There's a maximum of 200 messages present for an account.
    ChimpChatter[] chimp_chatter?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse2009Budget record {
    # Duration of the ad in seconds
    int duration?;
    # Total budget of the ad
    decimal total_amount?;
    # Currency code
    string currency_code?;
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

# An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'.
public type ProblemDetailDocument record {
    # An absolute URI that identifies the problem type. When dereferenced, it should provide human-readable documentation for the problem type.
    string 'type;
    # A short, human-readable summary of the problem type. It shouldn't change based on the occurrence of the problem, except for purposes of localization.
    string title;
    # The HTTP status code (RFC2616, Section 6) generated by the origin server for this occurrence of the problem.
    int status;
    # A human-readable explanation specific to this occurrence of the problem. [Learn more about errors](/developer/guides/get-started-with-mailchimp-api-3/#Errors).
    string detail;
    # A string that identifies this specific occurrence of the problem. Please provide this ID when contacting support.
    string instance;
};

public type Body record {
    # An array of objects that describes operations to perform.
    Operations[] operations;
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

# The customer's address.
public type Address1 record {
    # The mailing address of the customer.
    string address1?;
    # An additional field for the customer's mailing address.
    string address2?;
    # The city the customer is located in.
    string city?;
    # The customer's state name or normalized province.
    string province?;
    # The two-letter code for the customer's province or state.
    string province_code?;
    # The customer's postal or zip code.
    string postal_code?;
    # The customer's country.
    string country?;
    # The two-letter code for the customer's country.
    string country_code?;
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

# Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program.
public type AbuseComplaint2 record {
    # The id for the abuse report
    int id?;
    # The campaign id for the abuse report
    string campaign_id?;
    # The unique id of the list for the abuse report.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
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

# Choose whether the campaign should use [Batch Delivery](https://mailchimp.com/help/schedule-batch-delivery/). Cannot be set to `true` for campaigns using [Timewarp](https://mailchimp.com/help/use-timewarp/).
public type BatchDelivery record {
    # The delay, in minutes, between batches.
    int batch_delay;
    # The number of batches for the campaign send.
    int batch_count;
};

# Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program.
public type AbuseComplaint1 record {
    # The id for the abuse report
    int id?;
    # The campaign id for the abuse report
    string campaign_id?;
    # The unique id of the list for the abuse report.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
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

# The shipping address for the order.
public type ShippingAddress record {
    # The name associated with an order's shipping address.
    string name?;
    # The shipping address for the order.
    string address1?;
    # An additional field for the shipping address.
    string address2?;
    # The city in the order's shipping address.
    string city?;
    # The state or normalized province in the order's shipping address.
    string province?;
    # The two-letter code for the province or state in the shipping address.
    string province_code?;
    # The postal or zip code in the shipping address.
    string postal_code?;
    # The country in the shipping address.
    string country?;
    # The two-letter code for the country in the shipping address.
    string country_code?;
    # The longitude for the shipping address location.
    decimal longitude?;
    # The latitude for the shipping address location.
    decimal latitude?;
    # The phone number for the order's shipping address.
    string phone?;
    # The company associated with the shipping address.
    string company?;
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

# Stats for Campaign A.
public type CampaignA record {
    # Bounces for Campaign A.
    int bounces?;
    # Abuse reports for Campaign A.
    int abuse_reports?;
    # Unsubscribes for Campaign A.
    int unsubs?;
    # Recipient Clicks for Campaign A.
    int recipient_clicks?;
    # Forwards for Campaign A.
    int forwards?;
    # Opens from forwards for Campaign A.
    int forwards_opens?;
    # Opens for Campaign A.
    int opens?;
    # The last open for Campaign A.
    string last_open?;
    # Unique opens for Campaign A.
    int unique_opens?;
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

# Stats for Campaign B.
public type CampaignB record {
    # Bounces for Campaign B.
    int bounces?;
    # Abuse reports for Campaign B.
    int abuse_reports?;
    # Unsubscribes for Campaign B.
    int unsubs?;
    # Recipients clicks for Campaign B.
    int recipient_clicks?;
    # Forwards for Campaign B.
    int forwards?;
    # Opens for forwards from Campaign B.
    int forwards_opens?;
    # Opens for Campaign B.
    int opens?;
    # The last open for Campaign B.
    string last_open?;
    # Unique opens for Campaign B.
    int unique_opens?;
};

# abandonedBrowse automation details. abandonedBrowse is also known as Product Retargeting Email or Retarget Site Visitors on the web.
public type AbandonedBrowseAutomation record {
    # Whether this store supports the abandonedBrowse automation.
    boolean is_supported?;
    # Unique ID of automation parent campaign.
    string id?;
    # Status of the abandonedBrowse automation.
    string status?;
};

# A summary of batch requests that have been made.
public type BatchOperations record {
    # An array of objects representing batch calls.
    Batch1[] batches?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
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

# Information about a specific product image.
public type EcommerceProductImage record {
    # A unique identifier for the product image.
    string id;
    # The URL for a product image.
    string url;
    # The list of product variants using the image.
    string[] variant_ids?;
};

public type InlineResponse2009AudienceTargetingSpecsLocations record {
    string[] countries?;
    string[] regions?;
    string[] cities?;
    string[] zips?;
};

public type InlineResponse2009AudienceEmailSource record {
    # Email source name
    string name?;
    # Type of the email source
    string 'type?;
    # Is the source reference a segment
    boolean is_segment?;
    # Segment type if this source is tied to a segment
    string segment_type?;
    # Associated list name to the source
    string list_name?;
};

# Top open locations for a specific campaign.
public type OpenLocations record {
    # An array of objects, each representing a top location for opens.
    OpenLocationsLocations[] locations?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A workflow's runtime settings for an Automation.
public type AutomationWorkflowRuntimeSettings record {
    # The days an Automation workflow can send.
    string[] days?;
    # The hours an Automation workflow can send.
    Hours hours?;
};

public type InlineResponse2009ReportSummary record {
    int opens?;
    int unique_opens?;
    decimal open_rate?;
    int clicks?;
    int subscriber_clicks?;
    decimal click_rate?;
    int visits?;
    int unique_visits?;
    decimal conversion_rate?;
    int subscribes?;
    InlineResponse2009ReportSummaryEcommerce ecommerce?;
    decimal impressions?;
    int reach?;
    int engagements?;
    int total_sent?;
};

# A folder used to organize templates.
public type TemplateFolder1 record {
    # The name of the folder.
    string name?;
    # A string that uniquely identifies this template folder.
    string id?;
    # The number of templates in the folder.
    int count?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A folder used to organize templates.
public type TemplateFolder2 record {
    # The name of the folder.
    string name;
};

# A folder used to organize templates.
public type TemplateFolder3 record {
    # The name of the folder.
    string name?;
    # A string that uniquely identifies this template folder.
    string id?;
    # The number of templates in the folder.
    int count?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of a member's opens activity in a specific campaign.
public type OpenActivity1 record {
    # The unique id for the campaign.
    string campaign_id?;
    # The unique id for the list.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The status of the member, namely if they are subscribed, unsubscribed, deleted, non-subscribed, transactional, pending, or need reconfirmation.
    string contact_status?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The total number of times the this campaign was opened by the list member.
    int opens_count?;
    # An array of timestamps for each time a list member opened the campaign. If a list member opens an email multiple times, this will return a separate timestamp for each open event.
    MemberActivity1[] opens?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A folder used to organize campaigns.
public type CampaignFolder record {
    # Name to associate with the folder.
    string name;
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

# A collection of orders in an account.
public type Orders record {
    # An array of objects, each representing an order resource.
    EcommerceOrder3[] orders?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A list of all folders in the File Manager.
public type FileManagerFolders record {
    # A list of all folders in the File Manager.
    GalleryFolder3[] folders?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type DailyClicksAndVisitsDataUniqueVisits record {
    string date?;
    int val?;
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

# The outreach associated with this order. For example, an email campaign or Facebook ad.
public type Outreach1 record {
    # A unique identifier for the outreach. Can be an email campaign ID.
    string id?;
    # The name for the outreach.
    string name?;
    # The type of the outreach.
    string 'type?;
    # The date and time the Outreach was published in ISO 8601 format.
    string published_time?;
};

# Information about a specific order.
public type EcommerceOrder record {
    # A unique identifier for the order.
    string id;
    # Information about a specific customer. For existing customers include only the `id` parameter in the `customer` object body.
    EcommerceCustomer customer;
    # A string that uniquely identifies the campaign for an order.
    string campaign_id?;
    # The URL for the page where the buyer landed when entering the shop.
    string landing_site?;
    # The order status. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string financial_status?;
    # The fulfillment status for the order. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string fulfillment_status?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code;
    # The total for the order.
    decimal order_total;
    # The URL for the order.
    string order_url?;
    # The total amount of the discounts to be applied to the price of the order.
    decimal discount_total?;
    # The tax total for the order.
    decimal tax_total?;
    # The shipping total for the order.
    decimal shipping_total?;
    # The Mailchimp tracking code for the order. Uses the 'mc_tc' parameter in E-Commerce tracking URLs.
    string tracking_code?;
    # The date and time the order was processed in ISO 8601 format.
    string processed_at_foreign?;
    # The date and time the order was cancelled in ISO 8601 format. Note: passing a value for this parameter will cancel the order being created.
    string cancelled_at_foreign?;
    # The date and time the order was updated in ISO 8601 format.
    string updated_at_foreign?;
    # The shipping address for the order.
    ShippingAddress shipping_address?;
    # The billing address for the order.
    BillingAddress billing_address?;
    # The promo codes applied on the order
    EcommercestoresstoreIdordersPromos[] promos?;
    # An array of the order's line items.
    EcommerceOrderLineItem[] lines;
    # The outreach associated with this order. For example, an email campaign or Facebook ad.
    Outreach outreach?;
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

public type InlineResponse20011ReportSummaryExtendedAt record {
    string datetime?;
    string timezone?;
};

# Stats for Group A.
public type GroupA record {
    # The total number of clicks for Group A.
    int total_clicks_a?;
    # The percentage of total clicks for Group A.
    decimal click_percentage_a?;
    # The number of unique clicks for Group A.
    int unique_clicks_a?;
    # The percentage of unique clicks for Group A.
    decimal unique_click_percentage_a?;
};

# Stats for Group B.
public type GroupB record {
    # The total number of clicks for Group B.
    int total_clicks_b?;
    # The percentage of total clicks for Group B.
    decimal click_percentage_b?;
    # The number of unique clicks for Group B.
    int unique_clicks_b?;
    # The percentage of unique clicks for Group B.
    decimal unique_click_percentage_b?;
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

# A list of template folders
public type TemplateFolders record {
    # An array of objects representing template folders.
    TemplateFolder3[] folders?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The average campaign statistics for your industry.
public type IndustryStats record {
    # The type of business industry associated with your account. For example: retail, education, etc.
    string 'type?;
    # The industry open rate.
    decimal open_rate?;
    # The industry click rate.
    decimal click_rate?;
    # The industry bounce rate.
    decimal bounce_rate?;
    # The industry unopened rate.
    decimal unopen_rate?;
    # The industry unsubscribe rate.
    decimal unsub_rate?;
    # The industry abuse rate.
    decimal abuse_rate?;
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
    Events1 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources sources?;
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

# The status of a batch request
public type Batch1 record {
    # A string that uniquely identifies this batch request.
    string id?;
    # The status of the batch call. [Learn more](https://mailchimp.com/developer/marketing/guides/run-async-requests-batch-endpoint/#check-the-status-of-a-batch-operation) about the batch operation status.
    string status?;
    # The total number of operations to complete as part of this batch request. For GET requests requiring pagination, each page counts as a separate operation.
    int total_operations?;
    # The number of completed operations. This includes operations that returned an error.
    int finished_operations?;
    # The number of completed operations that returned an error.
    int errored_operations?;
    # The date and time when the server received the batch request in ISO 8601 format.
    string submitted_at?;
    # The date and time when all operations in the batch request completed in ISO 8601 format.
    string completed_at?;
    # The URL of the gzipped archive of the results of all the operations.
    string response_body_url?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A report of links clicked in a specific campaign.
public type ClickDetailReport2 record {
    # The unique id for the link.
    string id?;
    # The URL for the link in the campaign.
    string url?;
    # The number of total clicks for a link.
    int total_clicks?;
    # The percentage of total clicks a link generated for a campaign.
    decimal click_percentage?;
    # Number of unique clicks for a link.
    int unique_clicks?;
    # The percentage of unique clicks a link generated for a campaign.
    decimal unique_click_percentage?;
    # The date and time for the last recorded click for a link in ISO 8601 format.
    string last_click?;
    # A breakdown of clicks by different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
    AbSplit ab_split?;
    # The campaign id.
    string campaign_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A report of links clicked in a specific campaign.
public type ClickDetailReport1 record {
    # The unique id for the link.
    string id?;
    # The URL for the link in the campaign.
    string url?;
    # The number of total clicks for a link.
    int total_clicks?;
    # The percentage of total clicks a link generated for a campaign.
    decimal click_percentage?;
    # Number of unique clicks for a link.
    int unique_clicks?;
    # The percentage of unique clicks a link generated for a campaign.
    decimal unique_click_percentage?;
    # The date and time for the last recorded click for a link in ISO 8601 format.
    string last_click?;
    # A breakdown of clicks by different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
    AbSplit ab_split?;
    # The campaign id.
    string campaign_id?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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
    Events1 events?;
    # The possible sources of any events that can trigger the webhook and whether they are enabled.
    Sources sources?;
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

# A collection of orders in a store.
public type Orders1 record {
    # The unique identifier for the store.
    string store_id?;
    # An array of objects, each representing an order in a store.
    EcommerceOrder3[] orders?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list an account's available templates.
public type Templates record {
    # All of an account's saved or custom templates.
    TemplateInstance3[] templates?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A member who unsubscribed from a specific campaign.
public type Unsubscribes1 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The date and time the member opted-out in ISO 8601 format.
    string timestamp?;
    # If available, the reason listed by the member for unsubscribing.
    string reason?;
    # The campaign id.
    string campaign_id?;
    # The list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A member who unsubscribed from a specific campaign.
public type Unsubscribes2 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The date and time the member opted-out in ISO 8601 format.
    string timestamp?;
    # If available, the reason listed by the member for unsubscribing.
    string reason?;
    # The campaign id.
    string campaign_id?;
    # The list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about an Ecommerce Store's specific Promo Rule.
public type EcommercePromoRule2 record {
    # The title that will show up in promotion campaign. Restricted to UTF-8 characters with max length of 100 bytes.
    string title?;
    # The description of a promotion restricted to UTF-8 characters with max length 255.
    string description?;
    # The date and time when the promotion is in effect in ISO 8601 format.
    string starts_at?;
    # The date and time when the promotion ends. Must be after starts_at and in ISO 8601 format.
    string ends_at?;
    # The amount of the promo code discount. If 'type' is 'fixed', the amount is treated as a monetary value. If 'type' is 'percentage', amount must be a decimal value between 0.0 and 1.0, inclusive.
    float amount?;
    # Type of discount. For free shipping set type to fixed.
    string 'type?;
    # The target that the discount applies to.
    string target?;
    # Whether the promo rule is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
};

# Members to add/remove to/from a static segment
public type MembersToAddremoveTofromAStaticSegment record {
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. A maximum of 500 members can be sent.
    string[] members_to_add?;
    # An array of emails to be used for a static segment. Any emails provided that are not present on the list will be ignored. A maximum of 500 members can be sent.
    string[] members_to_remove?;
};

# Information about an Ecommerce Store's specific Promo Rule
public type EcommercePromoRule1 record {
    # A unique identifier for the promo rule. If Ecommerce platform does not support promo rule, use promo code id as promo rule id. Restricted to UTF-8 characters with max length 50.
    string id?;
    # The title that will show up in promotion campaign. Restricted to UTF-8 characters with max length of 100 bytes.
    string title?;
    # The description of a promotion restricted to UTF-8 characters with max length 255.
    string description?;
    # The date and time when the promotion is in effect in ISO 8601 format.
    string starts_at?;
    # The date and time when the promotion ends. Must be after starts_at and in ISO 8601 format.
    string ends_at?;
    # The amount of the promo code discount. If 'type' is 'fixed', the amount is treated as a monetary value. If 'type' is 'percentage', amount must be a decimal value between 0.0 and 1.0, inclusive.
    float amount?;
    # Type of discount. For free shipping set type to fixed.
    string 'type?;
    # The target that the discount applies to.
    string target?;
    # Whether the promo rule is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of an order's line items.
public type OrderLines record {
    # The store id.
    string store_id?;
    # The order id.
    string order_id?;
    # An array of objects, each representing an order's line item.
    EcommerceOrderLineItem5[] lines?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type CampaignContentVariateContents record {
    # Label used to identify the content option.
    string content_label?;
    # The plain-text portion of the campaign. If left unspecified, we'll generate this automatically.
    string plain_text?;
    # The raw HTML for the campaign.
    string html?;
};

# API health status.
public type ApiHealthStatus record {
    # This will return a constant string value if the request is successful. Ex. "Everything's Chimpy!"
    string health_status?;
};

# The script used to connect your site with Mailchimp.
public type Script1 record {
    # The URL used for any integrations that offer built-in support for connected sites.
    string url?;
    # A pre-built script that you can copy-and-paste into your site to integrate it with Mailchimp.
    string fragment?;
};

# Report details about a sent campaign.
public type CampaignReport1 record {
    # A string that uniquely identifies this campaign.
    string id?;
    # The title of the campaign.
    string campaign_title?;
    # The type of campaign (regular, plain-text, ab_split, rss, automation, variate, or auto).
    string 'type?;
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The name of the list.
    string list_name?;
    # The subject line for the campaign.
    string subject_line?;
    # The preview text for the campaign.
    string preview_text?;
    # The total number of emails sent for this campaign.
    int emails_sent?;
    # The number of abuse reports generated for this campaign.
    int abuse_reports?;
    # The total number of unsubscribed members for this campaign.
    int unsubscribed?;
    # The date and time a campaign was sent in ISO 8601 format.
    string send_time?;
    # For RSS campaigns, the date and time of the last send in ISO 8601 format.
    string rss_last_send?;
    # An object describing the bounce summary for the campaign.
    Bounces bounces?;
    # An object describing the forwards and forward activity for the campaign.
    Forwards forwards?;
    # An object describing the open activity for the campaign.
    Opens opens?;
    # An object describing the click activity for the campaign.
    Clicks clicks?;
    # An object describing campaign engagement on Facebook.
    FacebookLikes facebook_likes?;
    # The average campaign statistics for your industry.
    IndustryStats industry_stats?;
    # The average campaign statistics for your list. This won't be present if we haven't calculated it yet for this list.
    ListStats list_stats?;
    # General stats about different groups of an A/B Split campaign. Does not return information about Multivariate Campaigns.
    AbSplitStats ab_split?;
    # An hourly breakdown of sends, opens, and clicks if a campaign is sent using timewarp.
    CampaignReports1Timewarp[] timewarp?;
    # An hourly breakdown of the performance of the campaign over the first 24 hours.
    CampaignReports1Timeseries[] timeseries?;
    # The url and password for the [VIP report](https://mailchimp.com/help/share-a-campaign-report/).
    ShareReport share_report?;
    # E-Commerce stats for a campaign.
    EcommerceReport ecommerce?;
    # Updates on campaigns in the process of sending.
    CampaignDeliveryStatus delivery_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about an Ecommerce Store's specific Promo Rule
public type EcommercePromoRule3 record {
    # A unique identifier for the promo rule. If Ecommerce platform does not support promo rule, use promo code id as promo rule id. Restricted to UTF-8 characters with max length 50.
    string id?;
    # The title that will show up in promotion campaign. Restricted to UTF-8 characters with max length of 100 bytes.
    string title?;
    # The description of a promotion restricted to UTF-8 characters with max length 255.
    string description?;
    # The date and time when the promotion is in effect in ISO 8601 format.
    string starts_at?;
    # The date and time when the promotion ends. Must be after starts_at and in ISO 8601 format.
    string ends_at?;
    # The amount of the promo code discount. If 'type' is 'fixed', the amount is treated as a monetary value. If 'type' is 'percentage', amount must be a decimal value between 0.0 and 1.0, inclusive.
    float amount?;
    # Type of discount. For free shipping set type to fixed.
    string 'type?;
    # The target that the discount applies to.
    string target?;
    # Whether the promo rule is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
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

# A collection of a product's variants.
public type EcommerceProductVariants record {
    # The store id.
    string store_id?;
    # The product id.
    string product_id?;
    # An array of objects, each representing a product's variants.
    EcommerceProductVariant6[] variants?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific product variant.
public type EcommerceProductVariant6 record {
    # A unique identifier for the product variant.
    string id?;
    # The title of a product variant.
    string title?;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
    # The date and time the product was created in ISO 8601 format.
    string created_at?;
    # The date and time the product was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The hours an Automation workflow can send.
public type Hours record {
    # When to send the Automation email.
    string 'type;
};

# An object describing the forwards and forward activity for the campaign.
public type Forwards record {
    # How many times the campaign has been forwarded.
    int forwards_count?;
    # How many times the forwarded campaign has been opened.
    int forwards_opens?;
};

# A single email domain's performance
public type EmailDomain record {
    # The name of the domain (gmail.com, hotmail.com, yahoo.com).
    string domain?;
    # The number of emails sent to that specific domain.
    int emails_sent?;
    # The number of bounces at a domain.
    int bounces?;
    # The number of opens for a domain.
    int opens?;
    # The number of clicks for a domain.
    int clicks?;
    # The total number of unsubscribes for a domain.
    int unsubs?;
    # The number of successful deliveries for a domain.
    int delivered?;
    # The percentage of total emails that went to this domain.
    decimal emails_pct?;
    # The percentage of total bounces from this domain.
    decimal bounces_pct?;
    # The percentage of total opens from this domain.
    decimal opens_pct?;
    # The percentage of total clicks from this domain.
    decimal clicks_pct?;
    # The percentage of total unsubscribes from this domain.
    decimal unsubs_pct?;
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

# A list of abuse complaints for a specific list.
public type AbuseComplaints1 record {
    # An array of objects, each representing an abuse report resource.
    AbuseComplaint2[] abuse_reports?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
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

# The tracking settings applied to this landing page.
public type TrackingSettings record {
    # Use cookies to track unique visitors and calculate overall conversion rate. Learn more [here](https://mailchimp.com/help/use-track-mailchimp/).
    boolean track_with_mailchimp?;
    # Google offers restricted data processing in connection with the California Consumer Privacy Act (CCPA) to restrict how Google uses certain identifiers and other data processed in the provision of its services. You can learn more about Google's restricted data processing within Google Ads [here](https://privacy.google.com/businesses/rdp/).
    boolean enable_restricted_data_processing?;
};

# Check if this ad is connected to a facebook page
public type InlineResponse2009Feedback record {
    # Feedback regarding the content of this Ad.
    string content?;
    # Feedback regarding the audience of this Ad.
    string audience?;
    # Feedback regarding the budget of this Ad.
    string budget?;
    # Feedback regarding the compliance of this Ad.
    string compliance?;
};

# A subscriber who clicked a specific URL in a specific campaign.
public type ClickDetailMember1 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The total number of times the subscriber clicked on the link.
    int clicks?;
    # The campaign id.
    string campaign_id?;
    # The id for the tracked URL in the campaign.
    string url_id?;
    # The list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The status of the member, namely if they are subscribed, unsubscribed, deleted, non-subscribed, transactional, pending, or need reconfirmation.
    string contact_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type CampaignsResults record {
    # A summary of an individual campaign's settings and content.
    Campaign4 campaign?;
    string snippet?;
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

# Information about an Ecommerce Store's specific Promo Code
public type EcommercePromoCode1 record {
    # A unique identifier for the promo Code.
    string id?;
    # The discount code. Restricted to UTF-8 characters with max length 50.
    string code?;
    # The url that should be used in the promotion campaign restricted to UTF-8 characters with max length 2000.
    string redemption_url?;
    # Number of times promo code has been used.
    int usage_count?;
    # Whether the promo code is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The billing address for the order.
public type BillingAddress1 record {
    # The name associated with an order's billing address.
    string name?;
    # The billing address for the order.
    string address1?;
    # An additional field for the billing address.
    string address2?;
    # The city in the billing address.
    string city?;
    # The state or normalized province in the billing address.
    string province?;
    # The two-letter code for the province or state in the billing address.
    string province_code?;
    # The postal or zip code in the billing address.
    string postal_code?;
    # The country in the billing address.
    string country?;
    # The two-letter code for the country in the billing address.
    string country_code?;
    # The longitude for the billing address location.
    decimal longitude?;
    # The latitude for the billing address location.
    decimal latitude?;
    # The phone number for the billing address.
    string phone?;
    # The company associated with the billing address.
    string company?;
};

# Information about an Ecommerce Store's specific Promo Code
public type EcommercePromoCode3 record {
    # A unique identifier for the promo Code.
    string id?;
    # The discount code. Restricted to UTF-8 characters with max length 50.
    string code?;
    # The url that should be used in the promotion campaign restricted to UTF-8 characters with max length 2000.
    string redemption_url?;
    # Number of times promo code has been used.
    int usage_count?;
    # Whether the promo code is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about an Ecommerce Store's specific Promo Code.
public type EcommercePromoCode2 record {
    # The discount code. Restricted to UTF-8 characters with max length 50.
    string code?;
    # The url that should be used in the promotion campaign restricted to UTF-8 characters with max length 2000.
    string redemption_url?;
    # Number of times promo code has been used.
    int usage_count?;
    # Whether the promo code is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
};

# The clicks and visits data from the last seven days.
public type DailyClicksAndVisitsData record {
    DailyClicksAndVisitsDataClicks[] clicks?;
    DailyClicksAndVisitsDataVisits[] visits?;
    DailyClicksAndVisitsDataUniqueVisits[] unique_visits?;
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

# An individual click location.
public type Location2 record {
    # The two-digit country code for a recorded click.
    string country?;
    # If available, a specific region where the click was recorded.
    string region?;
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

# A collection of a store's carts.
public type Carts record {
    # The store id.
    string store_id?;
    # An array of objects, each representing a cart.
    EcommerceCart3[] carts?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific cart.
public type EcommerceCart record {
    # A unique identifier for the cart.
    string id;
    # Information about a specific customer. For existing customers include only the `id` parameter in the `customer` object body.
    EcommerceCustomer customer;
    # A string that uniquely identifies the campaign for a cart.
    string campaign_id?;
    # The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations.
    string checkout_url?;
    # The three-letter ISO 4217 code for the currency that the cart uses.
    string currency_code;
    # The order total for the cart.
    decimal order_total;
    # The total tax for the cart.
    decimal tax_total?;
    # An array of the cart's line items.
    EcommerceCartLineItem[] lines;
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

# Information about a specific product variant.
public type EcommerceProductVariant1 record {
    # The title of a product variant.
    string title?;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
};

# Information about a specific product variant.
public type EcommerceProductVariant4 record {
    # A unique identifier for the product variant.
    string id;
    # The title of a product variant.
    string title;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
};

# Information about a specific product variant.
public type EcommerceProductVariant5 record {
    # The title of a product variant.
    string title?;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
};

public type InlineResponse20011AudienceActivityImpressions record {
    string date?;
    int impressions?;
};

# Information about a specific product variant.
public type EcommerceProductVariant2 record {
    # A unique identifier for the product variant.
    string id;
    # The title of a product variant.
    string title;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
};

# Information about a specific product variant.
public type EcommerceProductVariant3 record {
    # A unique identifier for the product variant.
    string id?;
    # The title of a product variant.
    string title?;
    # The URL for a product variant.
    string url?;
    # The stock keeping unit (SKU) of a product variant.
    string sku?;
    # The price of a product variant.
    decimal price?;
    # The inventory quantity of a product variant.
    int inventory_quantity?;
    # The image URL for a product variant.
    string image_url?;
    # The backorders of a product variant.
    string backorders?;
    # The visibility of a product variant.
    string visibility?;
    # The date and time the product was created in ISO 8601 format.
    string created_at?;
    # The date and time the product was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Subscriber location information.
public type Location record {
    # The location latitude.
    decimal latitude?;
    # The location longitude.
    decimal longitude?;
};

# An individual folder listed in the File Manager.
public type GalleryFolder1 record {
    # The unique id for the folder.
    int id?;
    # The name of the folder.
    string name?;
    # The number of files in the folder.
    int file_count?;
    # The date and time a file was added to the File Manager in ISO 8601 format.
    string created_at?;
    # The username of the profile that created the folder.
    string created_by?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual folder listed in the File Manager.
public type GalleryFolder3 record {
    # The unique id for the folder.
    int id?;
    # The name of the folder.
    string name?;
    # The number of files in the folder.
    int file_count?;
    # The date and time a file was added to the File Manager in ISO 8601 format.
    string created_at?;
    # The username of the profile that created the folder.
    string created_by?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual message in a conversation. Conversation tracking is a feature available to paid accounts that lets you view replies to your campaigns in your Mailchimp account.
public type ConversationMessage record {
    # A label representing the email of the sender of this message
    string from_email;
    # The subject of this message
    string subject?;
    # The plain-text content of the message
    string message?;
    # Whether this message has been marked as read
    boolean read;
};

# An individual folder listed in the File Manager.
public type GalleryFolder2 record {
    # The name of the folder.
    string name;
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

# A collection of the store's promo codes.
public type PromoCodes record {
    # The store id.
    string store_id?;
    # An array of objects, each representing promo codes defined for a store.
    EcommercePromoCode3[] promo_codes?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# The outreach associated with this order. For example, an email campaign or Facebook ad.
public type Outreach record {
    # A unique identifier for the outreach. Can be an email campaign ID.
    string id?;
};

# A subscriber who clicked a specific URL in a specific campaign.
public type ClickDetailMember record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The total number of times the subscriber clicked on the link.
    int clicks?;
    # The campaign id.
    string campaign_id?;
    # The id for the tracked URL in the campaign.
    string url_id?;
    # The list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The status of the member, namely if they are subscribed, unsubscribed, deleted, non-subscribed, transactional, pending, or need reconfirmation.
    string contact_status?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse20011AudienceActivity record {
    InlineResponse20011AudienceActivityClicks[] clicks?;
    InlineResponse20011AudienceActivityImpressions[] impressions?;
    InlineResponse20011AudienceActivityRevenue[] revenue?;
};

# An individual tweet.
public type TwitterStatus record {
    # The body of the tweet.
    string status?;
    # The Twitter handle for the author of the tweet.
    string screen_name?;
    # The individual id for the tweet.
    string status_id?;
    # A timestamp for the tweet.
    string datetime?;
    # A 'true' or 'false' status of whether the tweet is a retweet.
    boolean is_retweet?;
};

# Deprecated
public type CapsuleCrmTracking2 record {
    # Update contact notes for a campaign based on a subscriber's email address.
    boolean notes?;
};

public type Operations record {
    # The HTTP method to use for the operation.
    string method;
    # The relative path to use for the operation.
    string path;
    # Any request query parameters. Example parameters: {"count":10, "offset":0}
    record  { }  params?;
    # A string containing the JSON body to use with the request.
    string body?;
    # An optional client-supplied id returned with the operation results.
    string operation_id?;
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

public type DailyClicksAndVisitsDataClicks record {
    string date?;
    int val?;
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
    record  { }  merge_fields?;
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

# A list of subscribers who were sent a specific campaign.
public type SentTo record {
    # An array of objects, each representing a campaign recipient.
    SentTo1[] sent_to?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A list of URLs and unique IDs included in HTML and plain-text versions of a campaign.
public type ClickDetailReport record {
    # An array of objects, each representing a specific URL contained in the campaign.
    ClickDetailReport2[] urls_clicked?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

public type WeeklyClicksAndVisitsDataClicks record {
    string date?;
    int val?;
};

# The average campaign statistics for your list. This won't be present if we haven't calculated it yet for this list.
public type ListStats record {
    # The average number of subscriptions per month for the list.
    decimal sub_rate?;
    # The average number of unsubscriptions per month for the list.
    decimal unsub_rate?;
    # The average open rate (a percentage represented as a number between 0 and 100) per campaign for the list.
    decimal open_rate?;
    # The average click rate (a percentage represented as a number between 0 and 100) per campaign for the list.
    decimal click_rate?;
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

# An individual message in a conversation. Conversation tracking is a feature available to paid accounts that lets you view replies to your campaigns in your Mailchimp account.
public type ConversationMessage2 record {
    # A string that uniquely identifies this message
    string id?;
    # A string that identifies this message's conversation
    string conversation_id?;
    # The unique identifier of the list for this conversation.
    int list_id?;
    # A label representing the sender of this message
    string from_label?;
    # A label representing the email of the sender of this message
    string from_email?;
    # The subject of this message
    string subject?;
    # The plain-text content of the message
    string message?;
    # Whether this message has been marked as read
    boolean read?;
    # The date and time the message was either sent or received in ISO 8601 format.
    string timestamp?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual message in a conversation. Conversation tracking is a feature available to paid accounts that lets you view replies to your campaigns in your Mailchimp account.
public type ConversationMessage1 record {
    # A string that uniquely identifies this message
    string id?;
    # A string that identifies this message's conversation
    string conversation_id?;
    # The unique identifier of the list for this conversation.
    int list_id?;
    # A label representing the sender of this message
    string from_label?;
    # A label representing the email of the sender of this message
    string from_email?;
    # The subject of this message
    string subject?;
    # The plain-text content of the message
    string message?;
    # Whether this message has been marked as read
    boolean read?;
    # The date and time the message was either sent or received in ISO 8601 format.
    string timestamp?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An object describing campaign engagement on Facebook.
public type FacebookLikes record {
    # The number of recipients who liked the campaign on Facebook.
    int recipient_likes?;
    # The number of unique likes.
    int unique_likes?;
    # The number of Facebook likes for the campaign.
    int facebook_likes?;
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

public type InlineResponse20011AudienceActivityClicks record {
    string date?;
    int clicks?;
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

# Manage webhooks for batch requests.
public type BatchWebhooks record {
    # An array of objects, each representing a Batch Webhook.
    BatchWebhook3[] webhooks?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific product image.
public type EcommerceProductImage5 record {
    # A unique identifier for the product image.
    string id?;
    # The URL for a product image.
    string url?;
    # The list of product variants using the image.
    string[] variant_ids?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific product image.
public type EcommerceProductImage4 record {
    # A unique identifier for the product image.
    string id?;
    # The URL for a product image.
    string url?;
    # The list of product variants using the image.
    string[] variant_ids?;
};

# Information about a specific product image.
public type EcommerceProductImage3 record {
    # A unique identifier for the product image.
    string id?;
    # The URL for a product image.
    string url?;
    # The list of product variants using the image.
    string[] variant_ids?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A collection of members who clicked on a specific link within a campaign.
public type ClickDetailMembers record {
    # An array of objects, each representing a member who clicked a specific link within a campaign.
    ClickDetailMember1[] members?;
    # The campaign id.
    string campaign_id?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific product image.
public type EcommerceProductImage2 record {
    # A unique identifier for the product image.
    string id;
    # The URL for a product image.
    string url;
    # The list of product variants using the image.
    string[] variant_ids?;
};

# Information about a specific product.
public type EcommerceProduct record {
    # A unique identifier for the product.
    string id;
    # The title of a product.
    string title;
    # The handle of a product.
    string 'handle?;
    # The URL for a product.
    string url?;
    # The description of a product.
    string description?;
    # The type of product.
    string 'type?;
    # The vendor for a product.
    string vendor?;
    # The image URL for a product.
    string image_url?;
    # An array of the product's variants. At least one variant is required for each product. A variant can use the same `id` and `title` as the parent product.
    EcommerceProductVariant[] variants;
    # An array of the product's images.
    EcommerceProductImage[] images?;
    # The date and time the product was published.
    string published_at_foreign?;
};

# Information about a specific product image.
public type EcommerceProductImage1 record {
    # A unique identifier for the product image.
    string id?;
    # The URL for a product image.
    string url?;
    # The list of product variants using the image.
    string[] variant_ids?;
};

public type BatchAddremoveListMembersTofromStaticSegmentErrors record {
    # Email addresses added to the static segment or removed
    string[] email_addresses?;
    # The error message indicating why the email addresses could not be added or updated.
    string _error?;
};

public type InlineResponse20011AudienceActivityRevenue record {
    string date?;
    decimal revenue?;
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

public type Tag record {
    # The unique id for the tag.
    int tag_id?;
    # The name of the tag.
    string tag_name?;
};

# A subscriber's status for a specific campaign.
public type SentTo1 record {
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An individual merge var and value for a member.
    record {} merge_fields?;
    # [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber.
    boolean vip?;
    # The status of the member ('sent', 'hard' for hard bounce, or 'soft' for soft bounce).
    string status?;
    # The number of times a campaign was opened by this member.
    int open_count?;
    # The date and time of the last open for this member in ISO 8601 format.
    string last_open?;
    # For A/B Split Campaigns, the group the member was apart of ('a', 'b', or 'winner').
    string absplit_group?;
    # For campaigns sent with timewarp, the time zone group the member is apart of.
    int gmt_offset?;
    # The campaign id.
    string campaign_id?;
    # The unique list id.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about an Ecommerce Store's specific Promo Rule.
public type EcommercePromoRule record {
    # A unique identifier for the promo rule. If Ecommerce platform does not support promo rule, use promo code id as promo rule id. Restricted to UTF-8 characters with max length 50.
    string id;
    # The title that will show up in promotion campaign. Restricted to UTF-8 characters with max length of 100 bytes.
    string title?;
    # The description of a promotion restricted to UTF-8 characters with max length 255.
    string description;
    # The date and time when the promotion is in effect in ISO 8601 format.
    string starts_at?;
    # The date and time when the promotion ends. Must be after starts_at and in ISO 8601 format.
    string ends_at?;
    # The amount of the promo code discount. If 'type' is 'fixed', the amount is treated as a monetary value. If 'type' is 'percentage', amount must be a decimal value between 0.0 and 1.0, inclusive.
    float amount;
    # Type of discount. For free shipping set type to fixed.
    string 'type;
    # The target that the discount applies to.
    string target;
    # Whether the promo rule is currently enabled.
    boolean enabled?;
    # The date and time the promotion was created in ISO 8601 format.
    string created_at_foreign?;
    # The date and time the promotion was updated in ISO 8601 format.
    string updated_at_foreign?;
};

# A summary of an individual landing page's settings and content.
public type LandingPage3 record {
    # A string that uniquely identifies this landing page.
    string id?;
    # The name of this landing page.
    string name?;
    # The title of this landing page seen in the browser's title bar.
    string title?;
    # The description of this landing page.
    string description?;
    # The template_id of this landing page.
    int template_id?;
    # The status of this landing page.
    string status?;
    # The list's ID associated with this landing page.
    string list_id?;
    # The ID of the store associated with this landing page.
    string store_id?;
    # The ID used in the Mailchimp web application.
    int web_id?;
    # Created by mobile or web
    string created_by_source?;
    # The url of the published landing page.
    string url?;
    # The time this landing page was created.
    string created_at?;
    # The time this landing page was published.
    string published_at?;
    # The time this landing page was unpublished.
    string unpublished_at?;
    # The time this landing page was updated at.
    string updated_at?;
    # The tracking settings applied to this landing page.
    TrackingSettings tracking?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of an individual page's properties.
public type LandingPage2 record {
    # The name of this landing page.
    string name?;
    # The title of this landing page seen in the browser's title bar.
    string title?;
    # The description of this landing page.
    string description?;
    # The ID of the store associated with this landing page.
    string store_id?;
    # The list's ID associated with this landing page.
    string list_id?;
    # The tracking settings applied to this landing page.
    TrackingSettings tracking?;
};

public type WeeklyClicksAndVisitsDataVisits record {
    string date?;
    int val?;
};

# A summary of an individual landing page's settings and content.
public type LandingPage1 record {
    # A string that uniquely identifies this landing page.
    string id?;
    # The name of this landing page.
    string name?;
    # The title of this landing page seen in the browser's title bar.
    string title?;
    # The description of this landing page.
    string description?;
    # The template_id of this landing page.
    int template_id?;
    # The status of this landing page.
    string status?;
    # The list's ID associated with this landing page.
    string list_id?;
    # The ID of the store associated with this landing page.
    string store_id?;
    # The ID used in the Mailchimp web application.
    int web_id?;
    # Created by mobile or web
    string created_by_source?;
    # The url of the published landing page.
    string url?;
    # The time this landing page was created.
    string created_at?;
    # The time this landing page was published.
    string published_at?;
    # The time this landing page was unpublished.
    string unpublished_at?;
    # The time this landing page was updated at.
    string updated_at?;
    # The tracking settings applied to this landing page.
    TrackingSettings tracking?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual file listed in the File Manager.
public type GalleryFile1 record {
    # The unique id of the file.
    int id?;
    # The id of the folder.
    int folder_id?;
    # The type of file in the File Manager.
    string 'type?;
    # The name of the file.
    string name?;
    # The url of the full-size file.
    string full_size_url?;
    # The url of the thumbnail preview.
    string thumbnail_url?;
    # The size of the file in bytes.
    int size?;
    # The date and time a file was added to the File Manager in ISO 8601 format.
    string created_at?;
    # The username of the profile that uploaded the file.
    string created_by?;
    # The width of the image.
    int width?;
    # The height of an image.
    int height?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual file listed in the File Manager.
public type GalleryFile2 record {
    # The id of the folder. Setting `folder_id` to `0` will remove a file from its current folder.
    int folder_id?;
    # The name of the file.
    string name?;
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

# An individual file listed in the File Manager.
public type GalleryFile3 record {
    # The unique id of the file.
    int id?;
    # The id of the folder.
    int folder_id?;
    # The type of file in the File Manager.
    string 'type?;
    # The name of the file.
    string name?;
    # The url of the full-size file.
    string full_size_url?;
    # The url of the thumbnail preview.
    string thumbnail_url?;
    # The size of the file in bytes.
    int size?;
    # The date and time a file was added to the File Manager in ISO 8601 format.
    string created_at?;
    # The username of the profile that uploaded the file.
    string created_by?;
    # The width of the image.
    int width?;
    # The height of an image.
    int height?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

public type InlineResponse2009AudienceTargetingSpecs record {
    int gender?;
    int min_age?;
    int max_age?;
    InlineResponse2009AudienceTargetingSpecsLocations locations?;
    InlineResponse2009AudienceTargetingSpecsInterests[] interests?;
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

public type InlineResponse2009Content record {
    string title?;
    string link_url?;
    string message?;
    string description?;
    string image_url?;
    string call_to_action?;
    InlineResponse2009ContentAttachments[] attachments?;
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

# The script used to connect your site with Mailchimp.
public type Script record {
    # The URL used for any integrations that offer built-in support for connected sites.
    string url?;
    # A pre-built script that you can copy-and-paste into your site to integrate it with Mailchimp.
    string fragment?;
};

# A collection of stores in the account.
public type EcommerceStores record {
    # An array of objects, each representing a store.
    EcommerceStore3[] stores?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of a member's subscriber activity in a specific campaign, including opens, clicks, and bounces.
public type EmailActivity1 record {
    # The unique id for the campaign.
    string campaign_id?;
    # The unique id for the list.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An array of objects, each showing an interaction with the email.
    MemberActivity[] activity?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A list of a member's subscriber activity in a specific campaign, including opens, clicks, and bounces.
public type EmailActivity2 record {
    # The unique id for the campaign.
    string campaign_id?;
    # The unique id for the list.
    string list_id?;
    # The status of the list used, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The MD5 hash of the lowercase version of the list member's email address.
    string email_id?;
    # Email address for a subscriber.
    string email_address?;
    # An array of objects, each showing an interaction with the email.
    MemberActivity[] activity?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# A collection of the store's customers.
public type Customers record {
    # The store id.
    string store_id?;
    # An array of objects, each representing a customer of a store.
    EcommerceCustomer6[] customers?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific order.
public type EcommerceOrder3 record {
    # A unique identifier for the order.
    string id?;
    # Information about a specific customer.
    EcommerceCustomer6 customer?;
    # The unique identifier for the store.
    string store_id?;
    # A string that uniquely identifies the campaign associated with an order.
    string campaign_id?;
    # The URL for the page where the buyer landed when entering the shop.
    string landing_site?;
    # The order status. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string financial_status?;
    # The fulfillment status for the order. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string fulfillment_status?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The order total associated with an order.
    decimal order_total?;
    # The URL for the order.
    string order_url?;
    # The total amount of the discounts to be applied to the price of the order.
    decimal discount_total?;
    # The tax total associated with an order.
    decimal tax_total?;
    # The shipping total for the order.
    decimal shipping_total?;
    # The Mailchimp tracking code for the order. Uses the 'mc_tc' parameter in E-Commerce tracking URLs.
    string tracking_code?;
    # The date and time the order was processed in ISO 8601 format.
    string processed_at_foreign?;
    # The date and time the order was cancelled in ISO 8601 format.
    string cancelled_at_foreign?;
    # The date and time the order was updated in ISO 8601 format.
    string updated_at_foreign?;
    # The shipping address for the order.
    ShippingAddress1 shipping_address?;
    # The billing address for the order.
    BillingAddress1 billing_address?;
    # The promo codes applied on the order
    Orders1Promos[] promos?;
    # An array of the order's line items.
    EcommerceOrderLineItem5[] lines?;
    # The outreach associated with this order. For example, an email campaign or Facebook ad.
    Outreach1 outreach?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific order.
public type EcommerceOrder2 record {
    # Information about a specific customer. Orders for existing customers should include only the `id` parameter in the `customer` object body.
    EcommerceCustomer1 customer?;
    # A string that uniquely identifies the campaign associated with an order.
    string campaign_id?;
    # The URL for the page where the buyer landed when entering the shop.
    string landing_site?;
    # The order status. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string financial_status?;
    # The fulfillment status for the order. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string fulfillment_status?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The order total associated with an order.
    decimal order_total?;
    # The URL for the order.
    string order_url?;
    # The total amount of the discounts to be applied to the price of the order.
    decimal discount_total?;
    # The tax total associated with an order.
    decimal tax_total?;
    # The shipping total for the order.
    decimal shipping_total?;
    # The Mailchimp tracking code for the order. Uses the 'mc_tc' parameter in E-Commerce tracking URLs.
    string tracking_code?;
    # The date and time the order was processed in ISO 8601 format.
    string processed_at_foreign?;
    # The date and time the order was cancelled in ISO 8601 format. Note: passing a value for this parameter will cancel the order being edited.
    string cancelled_at_foreign?;
    # The date and time the order was updated in ISO 8601 format.
    string updated_at_foreign?;
    # The shipping address for the order.
    ShippingAddress1 shipping_address?;
    # The billing address for the order.
    BillingAddress1 billing_address?;
    # The promo codes applied on the order. Note: Patch will completely replace the value of promos with the new one provided.
    EcommercestoresstoreIdordersPromos[] promos?;
    # An array of the order's line items.
    EcommerceOrderLineItem1[] lines?;
    # The outreach associated with this order. For example, an email campaign or Facebook ad.
    Outreach outreach?;
};

public type Orders1Promos record {
    # The Promo Code
    string code?;
    # The amount of discount applied on the total price. For example if the total cost was $100 and the customer paid $95.5, amount_discounted will be 4.5 For free shipping set amount_discounted to 0
    decimal amount_discounted?;
    # Type of discount. For free shipping set type to fixed
    string 'type?;
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

# Information about a specific order.
public type EcommerceOrder1 record {
    # A unique identifier for the order.
    string id?;
    # Information about a specific customer.
    EcommerceCustomer6 customer?;
    # The unique identifier for the store.
    string store_id?;
    # A string that uniquely identifies the campaign associated with an order.
    string campaign_id?;
    # The URL for the page where the buyer landed when entering the shop.
    string landing_site?;
    # The order status. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string financial_status?;
    # The fulfillment status for the order. Use this parameter to trigger [Order Notifications](https://mailchimp.com/developer/marketing/docs/e-commerce/#order-notifications).
    string fulfillment_status?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The order total associated with an order.
    decimal order_total?;
    # The URL for the order.
    string order_url?;
    # The total amount of the discounts to be applied to the price of the order.
    decimal discount_total?;
    # The tax total associated with an order.
    decimal tax_total?;
    # The shipping total for the order.
    decimal shipping_total?;
    # The Mailchimp tracking code for the order. Uses the 'mc_tc' parameter in E-Commerce tracking URLs.
    string tracking_code?;
    # The date and time the order was processed in ISO 8601 format.
    string processed_at_foreign?;
    # The date and time the order was cancelled in ISO 8601 format.
    string cancelled_at_foreign?;
    # The date and time the order was updated in ISO 8601 format.
    string updated_at_foreign?;
    # The shipping address for the order.
    ShippingAddress1 shipping_address?;
    # The billing address for the order.
    BillingAddress1 billing_address?;
    # The promo codes applied on the order
    Orders1Promos[] promos?;
    # An array of the order's line items.
    EcommerceOrderLineItem5[] lines?;
    # The outreach associated with this order. For example, an email campaign or Facebook ad.
    Outreach1 outreach?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# Information about a specific cart line item.
public type EcommerceCartLineItem record {
    # A unique identifier for the cart line item.
    string id;
    # A unique identifier for the product associated with the cart line item.
    string product_id;
    # A unique identifier for the product variant associated with the cart line item.
    string product_variant_id;
    # The quantity of a cart line item.
    int quantity;
    # The price of a cart line item.
    decimal price;
};

# An object describing the open activity for the campaign.
public type Opens record {
    # The total number of opens for a campaign.
    int opens_total?;
    # The total number of unique opens.
    int unique_opens?;
    # The number of unique opens divided by the total number of successful deliveries.
    decimal open_rate?;
    # The date and time of the last recorded open in ISO 8601 format.
    string last_open?;
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

# Information about subscribers in a Customer Journey's audience.
public type SubscriberInCustomerJourneysAudience record {
    # The list member's email address.
    string email_address;
};

# A Chimp Chatter message
public type ChimpChatter record {
    string title?;
    string message?;
    # The type of activity
    string 'type?;
    # The date and time this activity was updated.
    string update_time?;
    # URL to a report that includes this activity
    string url?;
    # If it exists, list ID for the associated list
    string list_id?;
    # If it exists, campaign ID for the associated campaign
    string campaign_id?;
};

# Information about a specific template.
public type TemplateInstance3 record {
    # The individual id for the template.
    int id?;
    # The type of template (user, base, or gallery).
    string 'type?;
    # The name of the template.
    string name?;
    # Whether the template uses the drag and drop editor.
    boolean drag_and_drop?;
    # Whether the template contains media queries to make it responsive.
    boolean responsive?;
    # If available, the category the template is listed in.
    string category?;
    # The date and time the template was created in ISO 8601 format.
    string date_created?;
    # The date and time the template was edited in ISO 8601 format.
    string date_edited?;
    # The login name for template's creator.
    string created_by?;
    # The login name who last edited the template.
    string edited_by?;
    # User templates are not 'deleted,' but rather marked as 'inactive.' Returns whether the template is still active.
    boolean active?;
    # The id of the folder the template is currently in.
    string folder_id?;
    # If available, the URL for a thumbnail of the template.
    string thumbnail?;
    # The URL used for [template sharing](https://mailchimp.com/help/share-a-template/).
    string share_url?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# A summary of the interaction with the campaign.
public type MemberActivity record {
    # One of the following actions: 'open', 'click', or 'bounce'
    string action?;
    # If the action is a 'bounce', the type of bounce received: 'hard', 'soft'.
    string 'type?;
    # The date and time recorded for the action in ISO 8601 format.
    string timestamp?;
    # If the action is a 'click', the URL on which the member clicked.
    string url?;
    # The IP address recorded for the action.
    string ip?;
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

# Information about a specific template.
public type TemplateInstance1 record {
    # The individual id for the template.
    int id?;
    # The type of template (user, base, or gallery).
    string 'type?;
    # The name of the template.
    string name?;
    # Whether the template uses the drag and drop editor.
    boolean drag_and_drop?;
    # Whether the template contains media queries to make it responsive.
    boolean responsive?;
    # If available, the category the template is listed in.
    string category?;
    # The date and time the template was created in ISO 8601 format.
    string date_created?;
    # The date and time the template was edited in ISO 8601 format.
    string date_edited?;
    # The login name for template's creator.
    string created_by?;
    # The login name who last edited the template.
    string edited_by?;
    # User templates are not 'deleted,' but rather marked as 'inactive.' Returns whether the template is still active.
    boolean active?;
    # The id of the folder the template is currently in.
    string folder_id?;
    # If available, the URL for a thumbnail of the template.
    string thumbnail?;
    # The URL used for [template sharing](https://mailchimp.com/help/share-a-template/).
    string share_url?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# Information about a specific template.
public type TemplateInstance2 record {
    # The name of the template.
    string name;
    # The id of the folder the template is currently in.
    string folder_id?;
    # The raw HTML for the template. We  support the Mailchimp [Template Language](https://mailchimp.com/help/getting-started-with-mailchimps-template-language/) in any HTML code passed via the API.
    string html;
};

public type InlineResponse20011ReportSummaryEcommerce record {
    decimal total_revenue?;
    string currency_code?;
};

# An individual store in an account.
public type EcommerceStore2 record {
    # The name of the store.
    string name?;
    # The e-commerce platform of the store.
    string platform?;
    # The store domain.
    string domain?;
    # Whether to disable automations because the store is currently [syncing](https://mailchimp.com/developer/marketing/docs/e-commerce/#pausing-store-automations).
    boolean is_syncing?;
    # The email address for the store.
    string email_address?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The currency format for the store. For example: `$`, `£`, etc.
    string money_format?;
    # The primary locale for the store. For example: `en`, `de`, etc.
    string primary_locale?;
    # The timezone for the store.
    string timezone?;
    # The store phone number.
    string phone?;
    # The store address.
    Address address?;
};

# An individual store in an account.
public type EcommerceStore1 record {
    # The unique identifier for the store.
    string id?;
    # The unique identifier for the list that's associated with the store. The `list_id` for a specific store can't change.
    string list_id?;
    # The name of the store.
    string name?;
    # The e-commerce platform of the store.
    string platform?;
    # The store domain.  The store domain must be unique within a user account.
    string domain?;
    # Whether to disable automations because the store is currently [syncing](https://mailchimp.com/developer/marketing/docs/e-commerce/#pausing-store-automations).
    boolean is_syncing?;
    # The email address for the store.
    string email_address?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The currency format for the store. For example: `$`, `£`, etc.
    string money_format?;
    # The primary locale for the store. For example: `en`, `de`, etc.
    string primary_locale?;
    # The timezone for the store.
    string timezone?;
    # The store phone number.
    string phone?;
    # The store address.
    Address address?;
    # The Connected Site associated with the store.
    ConnectedSite2 connected_site?;
    # Details for the automations attached to this store.
    Automations automations?;
    # The status of the list connected to the store, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The date and time the store was created in ISO 8601 format.
    string created_at?;
    # The date and time the store was last updated in ISO 8601 format.
    string updated_at?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
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

# An individual store in an account.
public type EcommerceStore3 record {
    # The unique identifier for the store.
    string id?;
    # The unique identifier for the list that's associated with the store. The `list_id` for a specific store can't change.
    string list_id?;
    # The name of the store.
    string name?;
    # The e-commerce platform of the store.
    string platform?;
    # The store domain.  The store domain must be unique within a user account.
    string domain?;
    # Whether to disable automations because the store is currently [syncing](https://mailchimp.com/developer/marketing/docs/e-commerce/#pausing-store-automations).
    boolean is_syncing?;
    # The email address for the store.
    string email_address?;
    # The three-letter ISO 4217 code for the currency that the store accepts.
    string currency_code?;
    # The currency format for the store. For example: `$`, `£`, etc.
    string money_format?;
    # The primary locale for the store. For example: `en`, `de`, etc.
    string primary_locale?;
    # The timezone for the store.
    string timezone?;
    # The store phone number.
    string phone?;
    # The store address.
    Address address?;
    # The Connected Site associated with the store.
    ConnectedSite2 connected_site?;
    # Details for the automations attached to this store.
    Automations automations?;
    # The status of the list connected to the store, namely if it's deleted or disabled.
    boolean list_is_active?;
    # The date and time the store was created in ISO 8601 format.
    string created_at?;
    # The date and time the store was last updated in ISO 8601 format.
    string updated_at?;
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

# A summary of Twitter activity for a campaign.
public type TwitterStats record {
    # The number of tweets including a link to the campaign.
    int tweets?;
    # The day and time of the first recorded tweet with a link to the campaign.
    string first_tweet?;
    # The day and time of the last recorded tweet with a link to the campaign.
    string last_tweet?;
    # The number of retweets that include a link to the campaign.
    int retweets?;
    # A summary of tweets that include a link to the campaign.
    TwitterStatus[] statuses?;
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

# A detailed report of any campaign emails that were opened by a list member.
public type OpenDetailReport record {
    # An array of objects, each representing a list member who opened a campaign email. Each members object will contain information about the number of total opens by a single member, as well as timestamps for each open event.
    OpenActivity1[] members?;
    # The campaign id.
    string campaign_id?;
    # The total number of opens matching the query regardless of pagination.
    int total_opens?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

# An option for Signup Form Styles.
public type AnOptionForSignupFormStyles record {
    # A string that identifies the property.
    string property?;
    # A string that identifies value of the property.
    string value?;
};

public type OpenLocationsLocations record {
    # The ISO 3166 2 digit country code.
    string country_code?;
    # An internal code for the region representing the more specific location area such as city or state. When this is blank, it indicates we know the country, but not the region.
    string region?;
    # The name of the region, if we have one. For blank "region" values, this will be "Rest of Country".
    string region_name?;
    # The number of unique campaign opens for a region.
    int opens?;
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

# A collection of landing pages.
public type InlineResponse20012 record {
    LandingPageReport1[] landing_pages?;
    # The total number of items matching the query regardless of pagination.
    int total_items?;
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
};

public type InlineResponse20011 record {
    # A list of link types and descriptions for the API schema documents.
    ResourceLink[] _links?;
    # Audience settings
    InlineResponse2009Audience audience?;
    InlineResponse20011AudienceActivity audience_activity?;
    InlineResponse2009Budget budget?;
    string canceled_at?;
    # Channel settings
    InlineResponse2009Channel 'channel?;
    string create_time?;
    string email_source_name?;
    string end_time?;
    boolean has_segment?;
    # Unique ID of an Outreach
    string id?;
    # Title or name of an Outreach
    string name?;
    boolean needs_attention?;
    string paused_at?;
    string published_time?;
    # List settings for the outreach
    List10 recipients?;
    # Report summary of facebook ad
    InlineResponse20011ReportSummary report_summary?;
    # Outreach report availability
    boolean show_report?;
    string start_time?;
    # Campaign, Ad, or Page status
    string status?;
    # The URL of the thumbnail for this outreach
    string thumbnail?;
    # Supported Campaign, Ad, Page type
    string 'type?;
    string updated_at?;
    boolean was_canceled_by_facebook?;
    # Web ID
    int web_id?;
};

# Channel settings
public type InlineResponse2009Channel record {
    # Is this for facebook feed
    boolean fb_placement_feed?;
    # Is this for facebook audience
    boolean fb_placement_audience?;
    # Is this for instagram feed
    boolean ig_placement_feed?;
};