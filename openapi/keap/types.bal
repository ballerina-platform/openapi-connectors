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

public type GoalEventResultDTOArr GoalEventResultDTO[];

public type ContactCreditCardArr ContactCreditCard[];

public type EntryLongStringArr EntryLongString[];

public type RestHookArr RestHook[];

public type StringArr string[];

public type SalesPipelineArr SalesPipeline[];

public type InvoicePaymentArr InvoicePayment[];

public type Appointment record {
    # Required for pop-up reminders
    int contact_id?;
    string description?;
    string end_date;
    string location?;
    # Value in minutes before start_date to show pop-up reminder.  Acceptable values are [5,10,15,30,60,120,240,480,1440,2880]
    int remind_time?;
    string start_date;
    string title;
    # Required only for pop-up reminders
    int user?;
};

public type SubscriptionPlan record {
    boolean active?;
    int cycle?;
    int frequency?;
    int id?;
    int number_of_cycles?;
    decimal plan_price?;
    int subscription_plan_index?;
    string subscription_plan_name?;
    string url?;
};

public type EcommerceReportingTransaction record {
    decimal amount?;
    string collection_method?;
    int contact_id?;
    string currency?;
    string errors?;
    string gateway?;
    string gateway_account_name?;
    int id?;
    string order_ids?;
    EcommerceReportingOrder[] orders?;
    string paymentDate?;
    string status?;
    boolean test?;
    string transaction_date?;
    string 'type?;
};

public type SalesPipeline record {
    boolean end_stage?;
    boolean is_default?;
    int stage_count?;
    int stage_id?;
    string stage_name?;
    int stage_order?;
};

public type Address record {
    string country_code?;
    string line1?;
    string line2?;
    string locality?;
    string region?;
    string zip_code?;
    string zip_four?;
};

public type CreateOrPatchCompany record {
    CompanyAddress address?;
    string company_name;
    CustomFieldValue[] custom_fields?;
    string email_address?;
    CompanyFaxNumber fax_number?;
    string notes?;
    string opt_in_reason?;
    CompanyPhoneNumber phone_number?;
    string website?;
};

public type Product record {
    int id?;
    string product_desc?;
    string product_name?;
    ProductOption[] product_options?;
    decimal product_price?;
    string product_short_desc?;
    string sku?;
    int status?;
    boolean subscription_only?;
    SubscriptionPlan[] subscription_plans?;
    string url?;
};

public type Users record {
    int count?;
    string next?;
    string previous?;
    RestUser[] users?;
};

public type AffiliateList record {
    Affiliate[] affiliates?;
    int count?;
    string next?;
    string previous?;
};

public type Affiliate record {
    string code?;
    int contact_id?;
    int id?;
    string name?;
    boolean notify_on_lead?;
    boolean notify_on_sale?;
    int parent_id?;
    string status?;
    int track_leads_for?;
};

public type Item record {
    int id?;
    string name?;
    int next_item_id?;
    int previous_item_id?;
    string 'type?;
};

public type EmailSentQueryResultWithContent record {
    string clicked_date?;
    int contact_id?;
    string headers?;
    # Base64 encoded HTML
    string html_content?;
    int id?;
    string opened_date?;
    string original_provider?;
    string original_provider_id?;
    # Base64 encoded plain text
    string plain_content?;
    string received_date?;
    string sent_date?;
    string sent_from_address?;
    string sent_from_reply_address?;
    string sent_to_address?;
    string sent_to_bcc_addresses?;
    string sent_to_cc_addresses?;
    string subject?;
};

public type Goal record {
    HistoricalCounts historical_contact_counts?;
    int id?;
    string name?;
    int[] next_sequence_ids?;
    int[] previous_sequence_ids?;
    string 'type?;
};

public type FaxNumber record {
    string 'field;
    string number?;
    string 'type?;
};

public type EcommerceReportingOrderContactDetails record {
    string company_name?;
    string email?;
    string first_name?;
    int id?;
    string job_title?;
    string last_name?;
};

public type EcommerceReportingPaymentGateway record {
    int merchant_account_id?;
    boolean use_default?;
};

public type RestAffiliateClawback record {
    decimal amount?;
    int contact_id?;
    string date_earned?;
    string description?;
    string family_name?;
    string given_name?;
    int invoice_id?;
    string product_name?;
    int sale_affiliate_id?;
    string sold_by_family_name?;
    string sold_by_given_name?;
    string subscription_plan_name?;
};

public type Subscription record {
    boolean active?;
    boolean allow_tax?;
    boolean auto_charge?;
    decimal billing_amount?;
    string billing_cycle?;
    int billing_frequency?;
    int contact_id?;
    int credit_card_id?;
    string end_date?;
    int id?;
    string next_bill_date?;
    int payment_gateway_id?;
    int product_id?;
    int quantity?;
    int sale_affiliate_id?;
    string start_date?;
    int subscription_plan_id?;
    boolean use_default_payment_gateway?;
};

public type EcommerceReportingSimpleProduct record {
    string description?;
    int id?;
    string name?;
    boolean shippable?;
    string sku?;
    boolean taxable?;
};

public type Tags record {
    int count?;
    string next?;
    string previous?;
    Tag[] tags?;
};

public type ContactAddress record {
    string country_code?;
    string 'field;
    string line1?;
    string line2?;
    string locality?;
    # Field used to store postal codes containing a combination of letters and numbers ex. 'EC1A', 'S1 2HE', '75000'
    string postal_code?;
    string region?;
    # Mainly used in the United States, this is typically numeric. ex. '85001', '90002' Note: this is to be used instead of 'postal_code', not in addition to.
    string zip_code?;
    # Last four of a full zip code ex. '8244', '4320'. This field is supplemental to the zip_code field, otherwise will be ignored.
    string zip_four?;
};

public type EcommerceReportingPaymentPlan record {
    boolean auto_charge?;
    int credit_card_id?;
    int days_between_payments?;
    decimal initial_payment_amount?;
    string initial_payment_date?;
    int number_of_payments?;
    EcommerceReportingPaymentGateway payment_gateway?;
    string plan_start_date?;
};

public type RestApplicationConfigurationModuleTask record {
    string appointment_types?;
    boolean share_opportunity_with_related_user?;
};

public type CreateOrderItem record {
    string description?;
    # Overridable price of the product, if not specified, the default will be used. Must be greater than or equal to 0.
    string price?;
    # The id of the product to be added to the order.
    int product_id;
    # Quantity must be greater than or equal to 1
    int quantity;
};

public type CreateProduct record {
    boolean active?;
    string product_desc?;
    string product_name;
    decimal product_price?;
    string product_short_desc?;
    string sku?;
    boolean subscription_only?;
};

public type RestPartialContact record {
    string ScoreValue?;
    ContactAddress[] addresses?;
    string anniversary?;
    string birthday?;
    CompanyReference company?;
    string company_name?;
    string contact_type?;
    CustomFieldValue[] custom_fields?;
    string date_created?;
    EmailAddress[] email_addresses?;
    boolean email_opted_in?;
    string email_status?;
    string family_name?;
    FaxNumber[] fax_numbers?;
    string given_name?;
    int id?;
    string job_title?;
    string last_updated?;
    int lead_source_id?;
    string middle_name?;
    int owner_id?;
    PhoneNumber[] phone_numbers?;
    string preferred_locale?;
    string preferred_name?;
    string prefix?;
    SocialAccount[] social_accounts?;
    string source_type?;
    string spouse_name?;
    string suffix?;
    string time_zone?;
    string website?;
};

public type EmailAddress record {
    string email?;
    string 'field;
};

public type CompanyPhoneNumber record {
    string extension?;
    string number?;
    string 'type?;
};

public type CreditCardAdded record {
    ContactAddress address?;
    string card_type?;
    int contact_id?;
    string email_address?;
    string expiration_month?;
    string expiration_year?;
    int id?;
    string maestro_issue_number?;
    string maestro_start_date_month?;
    string maestro_start_date_year?;
    string name_on_card?;
    string validation_message?;
    string validation_status?;
};

public type AffiliatePaymentList record {
    int count?;
    string next?;
    RestAffiliatePayment[] payments?;
    string previous?;
};

public type Note record {
    string body?;
    int contact_id?;
    string date_created?;
    int id?;
    string last_updated?;
    NoteUser last_updated_by?;
    string title?;
    string 'type?;
    int user_id?;
};

public type TaggedContact record {
    BasicContact contact?;
    string date_applied?;
};

public type RestApplicationConfigurationModuleAffiliate record {
    boolean choose_affiliate?;
    RestApplicationConfigurationModuleAffiliateCommission commission?;
    string custom_affiliate_url?;
    boolean display_affiliate_ip_address?;
    boolean do_not_notify_affiliate?;
    boolean skip_pay_if_unused?;
    boolean use_referral_history_if_no_tracking_cookie?;
};

public type TaggedCompanyList record {
    TaggedCompany[] companies?;
    int count?;
    string next?;
    string previous?;
};

public type ContactTagList record {
    int count?;
    string next?;
    string previous?;
    ContactTag[] tags?;
};

public type EmailSentCreateError record {
    EmailSentCreate email?;
    string error_message?;
};

public type RestApplicationConfigurationModuleOpportunityStatesWin record {
    string reasons?;
    string stage?;
};

public type ContactOrigin record {
    string date;
    string ip_address;
};

public type CreateTagCategory record {
    # The category description
    string description?;
    # The category name
    string name;
};

public type ProductStatusList record {
    int count?;
    string next?;
    string previous?;
    ProductStatus[] product_statuses?;
    string sync_token?;
};

public type ObjectModel record {
    CustomFieldMetaData[] custom_fields?;
    # These fields are not transmitted by default on this model, but can be requested by specifying them in a comma-separated list in the optional_properties query parameter.
    string[] optional_properties?;
};

public type AddressInformation record {
    string company?;
    string country_code?;
    string first_name?;
    boolean is_invoice_to_company?;
    string last_name?;
    string line1?;
    string line2?;
    string locality?;
    string middle_name?;
    string phone?;
    string region?;
    string zip_code?;
    string zip_four?;
};

public type UpdateEmailAddress record {
    boolean opted_in;
    string reason;
};

public type SimpleOpportunityStage record {
    StageDetails details?;
    int id;
    string name?;
    string[] reasons?;
};

public type StackTraceElement record {
    string className?;
    string fileName?;
    int lineNumber?;
    string methodName?;
    boolean nativeMethod?;
};

public type SequencePath record {
    int id?;
    Item[] items?;
};

public type RestApplicationConfigurationModuleApplicationCompany record {
    string caller_id_number?;
    string city?;
    string country?;
    string email?;
    string name?;
    string phone?;
    string phone_ext?;
    string state?;
    string street_address_1?;
    string street_address_2?;
    string web_logo_url?;
    string website?;
    string zip?;
};

public type UpdateNote record {
    string body?;
    int contact_id?;
    string title?;
    string 'type?;
    int user_id?;
};

public type AffiliateProgram record {
    int affiliate_id?;
    int id?;
    string name?;
    string notes?;
    int priority?;
};

public type ContactTag record {
    string date_applied?;
    SimpleTag tag?;
};

public type Merchant record {
    string account_name?;
    int id?;
    boolean is_test?;
    string 'type?;
};

public type ContactCreditCard record {
    string card_number?;
    string card_type?;
    int id?;
    string validation_status?;
};

public type CreateProductImage record {
    # SHA256 checksum of image in Hex.
    string checksum?;
    # The image data, base64 encoded.
    string file_data;
    # The name of the file with extension, must match file data.  Acceptable file types:  [.png, .gif, .jpg, .jpeg].
    string file_name;
};

public type CampaignLandingPageNodeDTO record {
    string formId?;
    string id?;
    string landingPageId?;
    string[] leadBucketIds?;
    string name?;
    record {} properties?;
    boolean ready?;
    string 'type?;
};

public type RequestCompanyReference record {
    int id?;
};

public type HistoricalCounts record {
    int '24\_hours?;
    int '30\_days?;
};

public type CreateAffiliate record {
    string code;
    int contact_id;
    string name?;
    boolean notify_on_lead?;
    boolean notify_on_sale?;
    int parent_id?;
    string password;
    string status?;
    int track_leads_for?;
};

public type InvoicePayment record {
    decimal amount?;
    int id?;
    int invoice_id?;
    string last_updated?;
    string note?;
    string pay_date?;
    string pay_status?;
    int payment_id?;
    int refund_invoice_payment_id?;
    boolean skip_commission?;
};

public type ProvincesByCode record {
    # A key-value pair of province code and province name.
    record {} provinces;
};

public type RestUser record {
    Address address?;
    string company_name?;
    int created_by?;
    string date_created?;
    string email_address?;
    string family_name?;
    FaxNumber[] fax_numbers?;
    string given_name?;
    int global_user_id?;
    int id;
    string infusionsoft_id?;
    string job_title?;
    string last_updated?;
    int last_updated_by?;
    string middle_name?;
    boolean partner?;
    PhoneNumber[] phone_numbers?;
    string preferred_name?;
    string status?;
    string time_zone?;
    string website?;
};

public type AffiliateRedirect record {
    int affiliate_id?;
    int id?;
    string local_url_code?;
    string name?;
    int[] program_ids?;
    string redirect_url?;
};

public type CampaignNodeDTO record {
    string id?;
    string name?;
    record {} properties?;
    boolean ready?;
    string 'type?;
};

public type AffiliateCommissionList record {
    AffiliateCommission[] commissions?;
    int count?;
    string next?;
    string previous?;
};

public type ProductStatus record {
    Product product?;
    string status?;
};

public type RestApplicationConfigurationModuleOpportunityStatesActive record {
    string stages?;
};

public type CreateUser record {
    boolean admin?;
    string email;
    string given_name;
    boolean partner?;
};

public type CreateRestCustomFieldOption record {
    string label?;
    CreateRestCustomFieldOption[] options?;
};

public type ContactList record {
    RestPartialContact[] contacts?;
    int count?;
    string next?;
    string previous?;
};

public type AchieveApiGoalEvent record {
    int contact_id;
};

public type RestApplicationConfigurationModuleForms record {
    boolean spam_filters_enabled?;
};

public type SetOfIds record {
    int[] ids;
};

public type EmailSentCreate record {
    string clicked_date?;
    int contact_id?;
    string headers?;
    # Base64 encoded HTML
    string html_content?;
    int id?;
    string opened_date?;
    # Provider that sent the email case insensitive, must be in list [GOOGLE, INFUSIONSOFT].  If omitted gets mapped to UNKNOWN.
    string original_provider?;
    # Provider id that sent the email, must be unique when combined with provider.  If omitted a UUID without dashes is autogenerated for the record.
    string original_provider_id?;
    # Base64 encoded text
    string plain_content?;
    # The email address of the synced email account that generated this message.
    string provider_source_id?;
    string received_date?;
    string sent_date?;
    string sent_from_address?;
    string sent_from_reply_address?;
    string sent_to_address;
    string sent_to_bcc_addresses?;
    string sent_to_cc_addresses?;
    string subject?;
};

public type ProductList record {
    int count?;
    string next?;
    string previous?;
    Product[] products?;
    string sync_token?;
};

public type OrderItemTax record {
    decimal amount?;
    int id?;
    string name?;
    int orderItemId?;
    decimal rate?;
    int taxTemplateId?;
};

public type Relationship record {
    int id?;
    int linked_contact_id?;
    int relationship_type_id?;
};

public type OrderItem record {
    int billingCycle?;
    decimal cost?;
    string description?;
    decimal discount?;
    int frequency?;
    int id?;
    int jobRecurringId?;
    string name?;
    string notes?;
    int numberOfPayments?;
    OrderItemTax[] orderItemTaxes?;
    decimal price?;
    Product product?;
    int quantity?;
    boolean recurringBilling?;
    decimal specialAmount?;
    int specialId?;
    int specialPctOrAmt?;
    string 'type?;
};

public type PhoneNumber record {
    string extension?;
    string 'field;
    string number?;
    string 'type?;
};

public type SubscriptionList record {
    int count?;
    string next?;
    string previous?;
    Subscription[] subscriptions?;
};

public type EmailSendRequestAttachment record {
    # The content of the attachment, encoded in Base64
    string file_data?;
    # The filename of the attached file, including extension
    string file_name?;
};

public type CountriesByCode record {
    # A key-value pair of country code and country name.
    record {} countries;
};

public type Tag record {
    TagCategory category?;
    # The tag description
    string description?;
    # The id for the tag
    int id;
    # The tag name
    string name;
};

public type AccountProfile record {
    ContactAddress address?;
    # The goals of this business, ie. Grow Business, Convert more leads
    string[] business_goals?;
    string business_primary_color?;
    string business_secondary_color?;
    # The type of business
    string business_type?;
    string currency_code?;
    string email?;
    string language_tag?;
    string logo_url?;
    string name?;
    string phone?;
    string phone_ext?;
    string time_zone?;
    string website?;
};

public type RestApplicationConfigurationModuleAffiliateCommission record {
    string calculation_type?;
    int levels?;
    string participant_types?;
};

public type CustomFieldMetaData record {
    string field_name?;
    string field_type?;
    int id?;
    string label?;
    CustomFieldOption[] options?;
    string record_type?;
};

public type CustomFieldValue record {
    record {} content?;
    int id?;
};

public type Company record {
    CompanyAddress address?;
    string company_name?;
    CustomFieldValue[] custom_fields?;
    string email_address?;
    boolean email_opted_in?;
    string email_status?;
    CompanyFaxNumber fax_number?;
    int id?;
    string notes?;
    CompanyPhoneNumber phone_number?;
    string website?;
};

public type Task record {
    boolean completed?;
    string completion_date?;
    BasicContact contact?;
    string creation_date?;
    string description?;
    string due_date?;
    string modification_date?;
    int priority?;
    # Value in minutes before start_date to show pop-up reminder.  Acceptable values are [5,10,15,30,60,120,240,480,1440,2880]
    int remind_time?;
    string title?;
    string 'type?;
    string url?;
    int user_id?;
};

public type CompanyList record {
    Company[] companies?;
    int count?;
    string next?;
    string previous?;
};

public type EntryLongString record {
    string 'key?;
};

public type EcommerceReportingShippingInformation record {
    string city?;
    string company?;
    string country?;
    string first_name?;
    int id?;
    boolean invoiceToCompany?;
    string last_name?;
    string middle_name?;
    string phone?;
    string state?;
    string street1?;
    string street2?;
    string zip?;
};

public type RestApplicationConfigurationModuleFulfillment record {
    string default_message_fields?;
    string default_message_to?;
};

public type CheckListItemDetails record {
    string description?;
    string done_date?;
    int id?;
    int instance_id?;
    int item_order?;
    boolean required?;
};

public type TaskList record {
    int count?;
    string next?;
    string previous?;
    string sync_token?;
    Task[] tasks?;
};

public type CreateOrder record {
    int contact_id;
    int lead_affiliate_id?;
    string order_date;
    CreateOrderItem[] order_items;
    string order_title;
    string order_type;
    # Uses multiple strings as promo codes. The corresponding discount will be applied to the order.
    string[] promo_codes?;
    int sales_affiliate_id?;
    AddressInformation shipping_address?;
};

public type CreateRestCustomField record {
    string field_type;
    # An optional tab group to place the field under in the interface.  If not specified, will default to the 'Custom Fields' tab.
    int group_id?;
    string label;
    CreateRestCustomFieldOption[] options?;
    # An optional user group to choose from when selecting values for User or UserListBox fields.
    int user_group_id?;
};

public type CreateSubscription record {
    # If true, it will disable the check to see if there is already an identical subscription for the contact. Default is false.
    boolean allow_duplicate?;
    # Only works if the product the product subscription is for is taxable. Default is false.
    boolean allow_tax?;
    # Defaults to true.
    boolean auto_charge?;
    # Must be 0 or greater. Default is the price in the product subscription.
    decimal billing_amount?;
    int contact_id;
    # Default is the contact's most recently used card, if auto charge is true. Default is 0 otherwise.
    int credit_card_id?;
    # The first day the subscription will bill, in EST. Must not be in the past. Default is today.
    string first_bill_date?;
    # Default is the app's default merchant.
    int payment_gateway_id?;
    # Must be greater than 0. Default is 1.
    int quantity?;
    int sale_affiliate_id?;
    # Id of the product subscription.
    int subscription_plan_id?;
};

public type RestEmailAddress record {
    string email;
    boolean opted_in;
    string status;
};

public type OpportunityContact record {
    string company_name?;
    string email?;
    string first_name?;
    int id;
    string job_title?;
    string last_name?;
    string phone_number?;
};

public type RestApplicationConfigurationModuleTemplate record {
    int default_country_code?;
    int default_user_id?;
};

public type CategoryReference record {
    # The id for the tag category
    int id;
};

public type RestHook record {
    string eventKey?;
    string hookUrl?;
    string 'key?;
    string status?;
};

public type RestApplicationConfigurationModuleEMail record {
    boolean append_contact_key_to_links?;
    string default_opt_in_link?;
    string default_opt_out_link?;
    string hide_emails_to_and_from_domains?;
    string whitelisted_domains?;
};

public type ProductOptionValue record {
    int id?;
    int index?;
    boolean is_default?;
    string label?;
    decimal price_adjustment?;
    string sku?;
};

public type FullContact record {
    string ScoreValue?;
    ContactAddress[] addresses?;
    string anniversary?;
    string birthday?;
    CompanyReference company?;
    string company_name?;
    string contact_type?;
    CustomFieldValue[] custom_fields?;
    string date_created?;
    EmailAddress[] email_addresses?;
    boolean email_opted_in?;
    string email_status?;
    string family_name?;
    FaxNumber[] fax_numbers?;
    string given_name?;
    int id?;
    string job_title?;
    string last_updated?;
    int lead_source_id?;
    string middle_name?;
    string opt_in_reason?;
    ContactOrigin origin?;
    int owner_id?;
    PhoneNumber[] phone_numbers?;
    string preferred_locale?;
    string preferred_name?;
    string prefix?;
    Relationship[] relationships?;
    SocialAccount[] social_accounts?;
    string source_type?;
    string spouse_name?;
    string suffix?;
    int[] tag_ids?;
    string time_zone?;
    string website?;
};

public type RestApplicationConfigurationModuleApplication record {
    RestApplicationConfigurationModuleApplicationCompany company?;
    string default_view_locale?;
    RestApplicationConfigurationModuleApplicationFeaturesEnabled features_enabled?;
    string time_zone?;
};

public type CreateContactOrigin record {
    string ip_address;
};

public type CreateOrPatchContact record {
    ContactAddress[] addresses?;
    string anniversary?;
    string birthday?;
    RequestCompanyReference company?;
    string contact_type?;
    CustomFieldValue[] custom_fields?;
    EmailAddress[] email_addresses?;
    string family_name?;
    FaxNumber[] fax_numbers?;
    string given_name?;
    string job_title?;
    int lead_source_id?;
    string middle_name?;
    string opt_in_reason?;
    CreateContactOrigin origin?;
    int owner_id?;
    PhoneNumber[] phone_numbers?;
    string preferred_locale?;
    string preferred_name?;
    string prefix?;
    SocialAccount[] social_accounts?;
    string source_type?;
    string spouse_name?;
    string suffix?;
    string time_zone?;
    string website?;
};

public type OpportunityList record {
    int count?;
    string next?;
    Opportunity[] opportunities?;
    string previous?;
};

public type Order record {
    EcommerceReportingOrderContactDetails contact?;
    string creation_date?;
    int id?;
    int lead_affiliate_id?;
    string modification_date?;
    string notes?;
    string order_date?;
    OrderItem[] order_items?;
    PaymentPlan payment_plan?;
    decimal refund_total?;
    int sales_affiliate_id?;
    AddressInformation shipping_information?;
    string status?;
    string title?;
    decimal total?;
    decimal total_due?;
    decimal total_paid?;
};

public type GoalEventResultDTO record {
    int campaign_id?;
    int goal_id?;
    string message?;
    boolean success?;
};

public type FileList record {
    int count?;
    FileDescriptor[] files?;
    string next?;
    string previous?;
};

public type Setting record {
    string value?;
};

public type AffiliateCommission record {
    float amount_earned?;
    string contact_first_name?;
    int contact_id?;
    string contact_last_name?;
    string date_earned?;
    string description?;
    int invoice_id?;
    string product_name?;
    int sales_affiliate_id?;
    string sold_by_first_name?;
    string sold_by_last_name?;
};

public type Sequence record {
    int active_contact_count?;
    int active_contact_count_completed?;
    HistoricalCounts historical_contact_count?;
    int id?;
    string name?;
    SequencePath[] paths?;
};

public type TransactionList record {
    int count?;
    string next?;
    string previous?;
    EcommerceReportingTransaction[] transactions?;
};

public type AffiliateClawbackList record {
    RestAffiliateClawback[] clawbacks?;
    int count?;
    string next?;
    string previous?;
};

public type UpsertContact record {
    ContactAddress[] addresses?;
    string anniversary?;
    string birthday?;
    RequestCompanyReference company?;
    string contact_type?;
    CustomFieldValue[] custom_fields?;
    string duplicate_option?;
    EmailAddress[] email_addresses?;
    string family_name?;
    FaxNumber[] fax_numbers?;
    string given_name?;
    string job_title?;
    int lead_source_id?;
    string middle_name?;
    string opt_in_reason?;
    CreateContactOrigin origin?;
    int owner_id?;
    PhoneNumber[] phone_numbers?;
    string preferred_locale?;
    string preferred_name?;
    string prefix?;
    SocialAccount[] social_accounts?;
    string source_type?;
    string spouse_name?;
    string suffix?;
    string time_zone?;
    string website?;
};

public type EmailSendRequest record {
    # Email field of each Contact record to address the email to, such as 'Email', 'EmailAddress2', 'EmailAddress3' or '_CustomFieldName', defaulting to the contact's primary email
    string address_field?;
    # Attachments to be sent with each copy of the email, maximum of 10 with size of 1MB each
    EmailSendRequestAttachment[] attachments?;
    # An array of Contact Ids to receive the email
    int[] contacts;
    # The HTML-formatted content of the email, encoded in Base64
    string html_content?;
    # The plain-text content of the email, encoded in Base64
    string plain_content?;
    # The subject line of the email
    string subject;
    # The infusionsoft user to send the email on behalf of
    int user_id;
};

public type Campaign record {
    int active_contact_count?;
    int completed_contact_count?;
    int created_by_global_id?;
    string date_created?;
    string error_message?;
    Goal[] goals?;
    int id?;
    boolean locked?;
    string name?;
    string published_date?;
    boolean published_status?;
    string published_time_zone?;
    Sequence[] sequences?;
    string time_zone?;
};

public type RestApplicationConfigurationModuleContactAddressLabels record {
    string line_1?;
    string line_2?;
    string line_3?;
};

public type RestApplicationConfiguration record {
    RestApplicationConfigurationModuleAffiliate affiliate?;
    RestApplicationConfigurationModuleApplication application?;
    RestApplicationConfigurationModuleAppointment appointment?;
    RestApplicationConfigurationModuleContact contact?;
    RestApplicationConfigurationModuleECommerce ecommerce?;
    RestApplicationConfigurationModuleEMail email?;
    RestApplicationConfigurationModuleForms forms?;
    RestApplicationConfigurationModuleFulfillment fulfillment?;
    RestApplicationConfigurationModuleInvoice invoice?;
    RestApplicationConfigurationModuleNote note?;
    RestApplicationConfigurationModuleOpportunity opportunity?;
    RestApplicationConfigurationModuleTask task?;
    RestApplicationConfigurationModuleTemplate template?;
};

public type BasicContact record {
    string email?;
    string first_name?;
    int id?;
    string last_name?;
};

public type PaymentPlan record {
    boolean auto_charge?;
    int credit_card_id?;
    int days_between_payments;
    decimal initial_payment_amount?;
    string initial_payment_date?;
    int number_of_payments;
    PaymentGateway payment_gateway?;
    string plan_start_date;
};

public type Throwable record {
    Throwable cause?;
    string localizedMessage?;
    string message?;
    StackTraceElement[] stackTrace?;
    Throwable[] suppressed?;
};

public type UserInfoDTO record {
    string email;
    string family_name;
    string given_name;
    int global_user_id;
    string infusionsoft_id;
    string middle_name?;
    string preferred_name?;
    string sub;
};

public type AffiliateProgramList record {
    int count?;
    string next?;
    string previous?;
    AffiliateProgram[] programs?;
};

public type SimpleTag record {
    string category?;
    int id?;
    string name?;
};

public type RestApplicationConfigurationModuleInvoice record {
    string tax_label?;
};

public type CreateTag record {
    CategoryReference category?;
    # The tag description
    string description?;
    # The tag name
    string name;
};

public type SimpleUser record {
    string first_name?;
    int id?;
    string last_name?;
};

public type TaggedContactList record {
    TaggedContact[] contacts?;
    int count?;
    string next?;
    string previous?;
};

public type CompanyReference record {
    string company_name?;
    int id?;
};

public type NoteList record {
    int count?;
    string next?;
    Note[] notes?;
    string previous?;
};

public type AffiliateSummary record {
    int affiliate_id?;
    decimal amount_earned?;
    decimal balance?;
    decimal clawbacks?;
};

public type PaymentResult record {
    int id?;
    int invoice_id?;
    decimal payment_amount?;
    string payment_status?;
    int transaction_id?;
};

public type RestHookRequest record {
    string eventKey?;
    string hookUrl?;
};

public type EmailSentCreateList record {
    EmailSentCreate[] emails?;
    EmailSentCreateError[] errors?;
};

public type RedirectList record {
    int count?;
    string next?;
    string previous?;
    AffiliateRedirect[] redirects?;
};

public type CompanyAddress record {
    string country_code?;
    string line1?;
    string line2?;
    string locality?;
    string region?;
    string zip_code?;
    string zip_four?;
};

public type CreateProductSubscription record {
    boolean active?;
    string cycle_type;
    int frequency?;
    int number_of_cycles?;
    decimal plan_price;
    int subscription_plan_index?;
};

public type RestApplicationConfigurationModuleNote record {
    string appointment_types?;
    boolean share_opportunity_with_related_user?;
};

public type RestApplicationConfigurationModuleContact record {
    RestApplicationConfigurationModuleContactAddressLabels address_labels?;
    string contact_types?;
    string default_new_contact_form?;
    boolean disable_contact_edit_in_client_login?;
    string fax_types?;
    string phone_types?;
    string suffix_types?;
    string title_types?;
};

public type RestApplicationConfigurationModuleApplicationFeaturesEnabled record {
    boolean marketing?;
};

public type RestApplicationConfigurationModuleAppointment record {
    string appointment_types?;
    boolean share_opportunity_with_related_user?;
};

public type EcommerceReportingOrderItem record {
    decimal cost?;
    string description?;
    decimal discount?;
    int id?;
    int jobRecurringId?;
    string name?;
    string notes?;
    decimal price?;
    EcommerceReportingSimpleProduct product?;
    int quantity?;
    decimal specialAmount?;
    int specialId?;
    int specialPctOrAmt?;
    SubscriptionPlan subscriptionPlan?;
    string 'type?;
};

public type CustomFieldOption record {
    string id?;
    string label?;
    CustomFieldOption[] options?;
};

public type PaymentGateway record {
    int merchant_account_id?;
    boolean use_default?;
};

public type Opportunity record {
    int affiliate_id?;
    OpportunityContact contact;
    CustomFieldValue[] custom_fields?;
    string date_created?;
    string estimated_close_date?;
    int id?;
    int include_in_forecast?;
    string last_updated?;
    string next_action_date?;
    string next_action_notes?;
    string opportunity_notes?;
    string opportunity_title;
    decimal projected_revenue_high?;
    decimal projected_revenue_low?;
    SimpleOpportunityStage stage;
    SimpleUser user?;
};

public type AppointmentList record {
    Appointment[] appointments?;
    int count?;
    string next?;
    string previous?;
    string sync_token?;
};

public type TagCategory record {
    # The category description
    string description?;
    # The id for the tag category
    int id;
    # The category name
    string name;
};

public type FileUpload record {
    string file_name;
    boolean 'public?;
    string file_data;
    int contact_id;
    boolean is_public;
    string file_association;
};

public type ProductOption record {
    boolean allow_spaces?;
    boolean can_contain_character?;
    boolean can_contain_number?;
    boolean can_end_with_character?;
    boolean can_end_with_number?;
    boolean can_start_with_character?;
    boolean can_start_with_number?;
    int display_index?;
    int id?;
    string label?;
    int max_chars?;
    int min_chars?;
    string name?;
    boolean required?;
    string text_message?;
    string 'type?;
    ProductOptionValue[] values?;
};

public type TaggedCompany record {
    BasicCompany company?;
    string date_applied?;
};

public type FileInformation record {
    string file_data?;
    FileDescriptor file_descriptor?;
};

public type NoteUser record {
    string family_name?;
    string given_name?;
    int user_id?;
};

public type CompanyFaxNumber record {
    string number?;
    string 'type?;
};

public type RestApplicationConfigurationModuleECommerce record {
    string credit_card_types?;
    string currency?;
    int default_charge_max_retry_attempts?;
    string default_country?;
    string default_merchant?;
    int default_number_of_days_between_charge_attempts?;
    string default_tax?;
    boolean default_to_auto_charge?;
    int merchant_account_max_retry_attempts?;
    string payment_types?;
    string promo_codes?;
    boolean track_cost_per_unit?;
    boolean track_inventory?;
};

public type CreatePayment record {
    boolean apply_to_commissions?;
    boolean charge_now?;
    int credit_card_id?;
    # Used when charge_now:false or inserting historical data. ex `2017-01-01T22:17:59.039Z`
    string date?;
    string notes?;
    string payment_amount?;
    string payment_gateway_id?;
    string payment_method_type?;
};

public type ProductSubscription record {
    boolean active?;
    string cycle_type;
    int frequency?;
    int id;
    int number_of_cycles?;
    decimal plan_price;
    int subscription_plan_index?;
    string subscription_plan_name?;
    string url?;
};

public type Error record {
    Throwable cause?;
    string localizedMessage?;
    string message?;
    StackTraceElement[] stackTrace?;
    Throwable[] suppressed?;
};

public type SocialAccount record {
    string name?;
    string 'type?;
};

public type EmailSentQueryResultList record {
    int count?;
    EmailSentQueryResult[] emails?;
    string next?;
    string previous?;
};

public type AffiliateSummaryList record {
    int count?;
    AffiliateSummary[] summaries?;
};

public type CreditCard record {
    ContactAddress address?;
    string card_number?;
    string card_type?;
    string email_address?;
    string expiration_month?;
    string expiration_year?;
    string maestro_issue_number?;
    string maestro_start_date_month?;
    string maestro_start_date_year?;
    string name_on_card?;
    string verification_code?;
};

public type FileDescriptor record {
    string category?;
    int contact_id?;
    int created_by?;
    string date_created?;
    string download_url?;
    string file_box_type?;
    string file_name?;
    int file_size?;
    int id;
    string last_updated?;
    boolean 'public?;
    string remote_file_key?;
};

public type RestAffiliatePayment record {
    decimal amount?;
    string date?;
    int id?;
    string notes?;
    string 'type?;
};

public type RequestNote record {
    string body?;
    int contact_id;
    string title?;
    string 'type?;
    int user_id?;
};

public type RestMerchantAccountResponse record {
    int default_merchant_account?;
    Merchant[] merchant_accounts?;
};

public type EcommerceReportingOrder record {
    boolean allow_payment?;
    boolean allow_paypal?;
    EcommerceReportingOrderContactDetails contact?;
    string creation_date?;
    int id?;
    int lead_affiliate_id?;
    string modification_date?;
    string notes?;
    string order_date?;
    EcommerceReportingOrderItem[] order_items?;
    EcommerceReportingPaymentPlan payment_plan?;
    boolean recurring?;
    decimal refund_total?;
    int sales_affiliate_id?;
    EcommerceReportingShippingInformation shipping_information?;
    string source_type?;
    string status?;
    string terms?;
    string title?;
    decimal total?;
    decimal total_due?;
    decimal total_paid?;
};

public type RestApplicationConfigurationModuleOpportunityStatesLoss record {
    string reasons?;
    string stage?;
};

public type TagId record {
    int[] tagIds?;
};

public type BasicCompany record {
    string company_name?;
    string email?;
    int id?;
};

public type StageDetails record {
    CheckListItemDetails[] check_list_items?;
    int probability?;
    int stage_order?;
    int target_num_days?;
};

public type OrderList record {
    int count?;
    string next?;
    EcommerceReportingOrder[] orders?;
    string previous?;
};

public type RestApplicationConfigurationModuleOpportunityStates record {
    RestApplicationConfigurationModuleOpportunityStatesActive active?;
    RestApplicationConfigurationModuleOpportunityStatesLoss loss?;
    RestApplicationConfigurationModuleOpportunityStatesWin win?;
};

public type RestApplicationConfigurationModuleOpportunity record {
    string default_stage?;
    RestApplicationConfigurationModuleOpportunityStates states?;
};

public type CampaignList record {
    Campaign[] campaigns?;
    int count?;
    string next?;
    string previous?;
};

public type EmailSentQueryResult record {
    string clicked_date?;
    int contact_id?;
    string headers?;
    int id?;
    string opened_date?;
    string original_provider?;
    string original_provider_id?;
    string received_date?;
    string sent_date?;
    string sent_from_address?;
    string sent_from_reply_address?;
    string sent_to_address?;
    string sent_to_bcc_addresses?;
    string sent_to_cc_addresses?;
    string subject?;
};
