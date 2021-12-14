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

public type BulkUpdateRequest record {
    string action?;
    string[] remove_tags?;
    boolean archive?;
    # this is limited to 100 bitlink ids
    string[] links?;
    string[] add_tags?;
};

public type FullShorten record {
    string domain?;
    string title?;
    # Always include a specific group and custom domain in your shorten calls.
    string group_guid?;
    string[] tags?;
    Deeplink[] deeplinks?;
    string long_url;
};

public type ViewMetric record {
    string value?;
    int views?;
};

public type BillingSignature record {
    string field_account_id?;
    string iframe_id?;
    string tenant_id?;
    string token?;
    string 'key?;
    string signature?;
};

# Deep Linking object
public type MinimalDeeplinkApp record {
    string guid?;
    string os?;
};

# the unit of time queried for (minute, hour, day, week, month)
public type TimeUnit string;

public type Tags record {
    string[] tags?;
};

public type LaunchpadButtonAppearance record {
    string launchpad_id?;
    string button_background?;
    string text_color?;
};

public type MethodLimit record {
    int count?;
    int 'limit?;
    string name?;
};

public type CityMetrics record {
    *BaseMetrics;
    CityMetric[] metrics?;
    OtherMetrics other_metrics?;
};

# a single tier
public type Tier record {
    string display_name?;
    string name?;
    string family?;
    int price?;
    string billing_period_type?;
    DefaultConsumableFeature[] consumable_features?;
    int sort_order?;
    boolean is_self_service?;
    DefaultAccessFeature[] access_features?;
    string display_icon?;
    boolean is_paid?;
    string description?;
};

public type PaymentInvoices record {
    PaymentInvoice[] payment_invoices?;
};

public type PurchaseBSDResponse record {
    int order_id?;
    string domain?;
    string total?;
    string organization_guid?;
};

public type InvitationForLogin record {
    string invited_org_name;
    string invited_org_guid;
    string token;
    string invited_by_email;
    string invited_by;
};

public type UpdateOverrideRules record {
    string rules?;
};

public type BillingContact record {
    string first_name?;
    string last_name?;
    string description?;
    string phone?;
    string billing_contact_id?;
    string email?;
};

public type LaunchpadLinkPerformance record {
    string unit_reference?;
    LaunchpadClicks[] link_clicks?;
    string performance_start?;
    string performance_end?;
    int units?;
    string unit?;
};

public type GroupClicksByFacetRollup record {
    int units?;
    FacetCountItem[] data?;
    string unit_reference?;
    string unit?;
};

public type BitlinkOverrideHistory record {
    int total_count?;
    BitlinkHistory[] bitlinks?;
};

public type LaunchpadQRCode record {
    string launchpad_id?;
    string qr_code?;
    string link?;
};

# INTERNAL_ERROR
public type InternalError record {
    *Error;
};

public type FormCapturePayload record {
    string submit_text?;
    string name?;
    string response_status?;
    FormPage[] pages?;
    string 'version?;
    string group_guid?;
    string login?;
    string skip_text?;
    string org_guid?;
};

public type PlanLimit record {
    int count?;
    int 'limit?;
    string name?;
    string description?;
};

public type Group record {
    *HasReferences;
    string name?;
    string[] bsds?;
    string created?;
    boolean is_active?;
    string modified?;
    string organization_guid?;
    string role?;
    string guid?;
};

public type BulkShortenUploads record {
    BulkShortenUpload[] uploads;
};

public type BillingAccountID record {
    string billing_account_id?;
};

public type DomainAgreements record {
    DomainAgreement[] domain_agreements?;
};

public type PlatformLimit record {
    string endpoint?;
    MethodLimit[] methods?;
};

public type BillingPaymentMethodID string;

public type BulkUpdate record {
    string[] links?;
};

public type LaunchpadButtonSortOrder record {
    int sort_order;
    string button_id;
};

public type CityMetric record {
    string city?;
    string region?;
    string subregion?;
    int clicks?;
    string country?;
};

public type ClickstreamSink record {
    # Descriptive name for the sink
    string name?;
    # Delivery schedule
    string schedule?;
    # Time of deactivation, if any
    string deactivated?;
    # Location of the sink
    string destination?;
    # Last modified time
    string modified?;
    # Sink creation time
    string created?;
    # Sink origin ID classification
    int sink_origin_id?;
    # Unique short id of client
    string client_id?;
    # Provider of sink
    string provider?;
    # Last synced time
    string last_sync?;
    # Unique short id
    string id?;
    # Unique short id of clickstream
    string clickstream_id?;
};

# the tier default values for a single consumable feature
public type DefaultConsumableFeature record {
    int 'limit?;
    string name?;
};

public type Groups record {
    Group[] groups;
};

# BAD_GATEWAY
public type BadGateway record {
    *Error;
};

public type UserPreferenceBody record {
    boolean is_active?;
    string preference?;
    string value?;
};

public type Deeplink record {
    string app_uri_path?;
    string install_type?;
    string install_url?;
    string app_id?;
};

public type CustomdomainbodySslCert record {
    boolean custom_cert?;
    int valid_end?;
    string issuer?;
};

public type AddCustomBitlink record {
    string bitlink_id?;
    string custom_bitlink?;
};

public type WebhookCreate record {
    string name;
    string url;
    string group_guid?;
    boolean fetch_tags?;
    boolean is_active?;
    string organization_guid;
    string client_id?;
    string client_secret?;
    string oauth_url?;
    string event;
};

public type Tiers Tier[];

public type Shorten record {
    string group_guid?;
    string domain?;
    string long_url;
};

public type ReferrersByDomains record {
    int units?;
    string facet?;
    ReferrersByDomain[] referrers_by_domain?;
    string unit_reference?;
    string unit?;
};

public type BaseChannel record {
    string group_guid?;
    string guid?;
    string name?;
    # ISO_TIMESTAMP
    string modified?;
    # ISO TIMESTAMP
    string created?;
};

public type NSQLookup record {
    NSQProducer[] producers?;
};

public type BitlinkOverrides record {
    *HasReferences;
    string created?;
    string rules?;
    string group_guid?;
    string modified?;
    int 'version?;
    # The fully qualified URL to the Override which is the Bitly link to use. Ex: https://foo.com/bar
    string link?;
    string id?;
};

public type PurchaseBSD record {
    string domain?;
    # ISO_TIMESTAMP
    string agreed_at?;
    string organization_guid?;
    string[] agreement_keys?;
};

# information about given custom domain
public type CustomDomainBody record {
    MinimalDeeplinkApp[] deeplink_apps?;
    boolean hsts_enabled?;
    boolean upgrade_insecure_requests?;
    string custom_domain?;
    string validation_error?;
    int created?;
    boolean is_active?;
    string root_redirect?;
    string ssl_configuration_error?;
    boolean ssl_autoconfigure_error?;
    string[] group_guids?;
    CustomdomainbodySslCert ssl_cert?;
    string wildcard_redirect?;
    string configuration_last_check_ts?;
    boolean https_enabled?;
    string validation_status?;
    boolean https_bitlinks?;
};

public type UserUpdate record {
    string default_group_guid?;
    string name?;
};

public type TwoFactor record {
    string phone_number;
    string status?;
    string country_code;
};

public type Organizations record {
    Organization[] organizations;
};

public type CreateOauthAppReq record {
    string[] redirect_uris?;
    string name?;
    string organization_guid?;
    string link?;
    string[] ip_allowlist?;
    string description?;
};

public type Event record {
    string ui_action;
    string referrer?;
    string action;
    string initiated_by;
    string group_guid?;
    string ui_action_date;
    string login;
    string org_guid;
};

public type Webhook record {
    *HasReferences;
    string status?;
    string modified_by?;
    string name?;
    string created?;
    string url?;
    string deactivated?;
    boolean fetch_tags?;
    boolean is_active?;
    string modified?;
    string organization_guid?;
    string client_id?;
    string group_guid?;
    string client_secret?;
    string oauth_url?;
    string guid?;
    string event?;
};

# UNPROCESSABLE_ENTITY
public type UnprocessableEntity record {
    *Error;
};

public type Clicks record {
    int units?;
    string unit_reference?;
    string unit?;
    LinkClicks[] link_clicks?;
};

public type OAuthAppWithOwnerLogin record {
    string owner_login?;
    string link?;
    string name?;
    string client_id?;
    string description?;
};

public type Bitlinks record {
    Pagination pagination?;
    BitlinkBody[] links?;
};

public type PlanLimits record {
    *HasReferences;
    string organization_guid?;
    PlanLimit[] plan_limits?;
};

public type CampaignChannelClicks record {
    int created_ts?;
    string channel_guid?;
    int total_clicks?;
    string channel_name?;
    string campaign_guid?;
    ChannelBitlinks channel_bitlinks?;
    CampaignClickData[] clicks?;
};

public type DeviceMetrics record {
    *BaseMetrics;
    DeviceMetric[] metrics?;
};

public type Email record {
    boolean is_primary?;
    boolean is_verified?;
    string email?;
};

public type SortedLinks record {
    ClickLink[] sorted_links?;
    BitlinkBody[] links?;
};

public type FieldError record {
    string 'field?;
    string message?;
    string error_code?;
};

public type ConsumableFeature record {
    string name?;
    # ISO_TIMESTAMP
    string created?;
    # ISO_TIMESTAMP
    string modified?;
    int 'limit?;
    boolean is_tier_default?;
    string id?;
};

public type Metrics record {
    *BaseMetrics;
    Metric[] metrics?;
};

public type CustomDomains record {
    boolean upgrade_required?;
    CustomDomainBody[] custom_domains?;
};

public type SubscriptionCancelledDate record {
    # ISO timestamp
    string subscription_cancelled_date?;
};

public type ClicksCount record {
    string _error?;
    int clicks?;
    string bitlink_id?;
};

public type ExpandBitlink record {
    string bitlink_id?;
};

public type Views record {
    ViewMetric[] launchpad_views?;
    int units?;
    string facet?;
    string unit?;
    string unit_reference?;
};

public type BitlinkUpdate record {
    boolean archived?;
    string[] tags?;
    string created_at?;
    string title?;
    DeeplinkRule[] deeplinks?;
    string created_by?;
    string long_url?;
    string client_id?;
    string[] custom_bitlinks?;
    string link?;
    string[] launchpad_ids?;
    string id?;
};

public type DeeplinkRule record {
    string bitlink?;
    string install_url?;
    # ISO timestamp
    string created?;
    string app_uri_path?;
    # ISO timestamp
    string modified?;
    string install_type?;
    string app_guid?;
    string guid?;
    string os?;
    string brand_guid?;
};

public type DeeplinkMetric record {
    int app_installs?;
    int store_visits?;
    int interstital_views?;
    int app_opens?;
    int web_opens?;
};

public type DeviceMetric record {
    int clicks?;
    string device_type?;
};

public type EncodingLogin record {
    string[] encoding_login?;
};

public type ClickstreamSinkUpdate record {
    *ClickstreamSinkNew;
    # False if sink should be activated
    boolean deactivated?;
    # Delivery schedule
    string schedule?;
};

public type CustomDomain record {
    string custom_domain?;
    string organization_guid?;
};

public type Campaign record {
    *HasReferences;
    string name?;
    # ISO timestamp
    string created?;
    string group_guid?;
    # ISO timestamp
    string modified?;
    string created_by?;
    string guid?;
    string description?;
};

# CONFLICT
public type Conflict record {
    *Error;
};

public type InstallPreference string;

public type LaunchpadClicks record {
    string domain?;
    string bitlink_id?;
    string keyword?;
    string title?;
    boolean is_active?;
    string long_url?;
    string date?;
    int clicks?;
};

# UPGRADE_REQUIRED
public type UpgradeRequired record {
    *Error;
};

public type BaseChannelBitlink record {
    string campaign_guid?;
    string bitlink_id?;
};

public type InvitationsForLogin record {
    InvitationForLogin[] invitations?;
};

# FORBIDDEN
public type Forbidden record {
    *Error;
};

public type UMGroupPreferences record {
    UMGroupPreference[] preferences?;
};

public type Channels record {
    Channel[] channels?;
};

public type BillingDowngrade record {
    string[] group_guids?;
    string tier_name?;
};

public type ClickstreamSinkFile record {
    # start of period
    string date_from?;
    # end of period
    string date_to?;
    # Unique id of the file
    string file_id?;
    # use this url with follow redirects to download the file
    string download_url?;
    # time of creation
    string created?;
};

public type Launchpad record {
    string launchpad_id?;
    string domain?;
    string keyword?;
    boolean is_active;
    LaunchpadButtons[] buttons?;
    LaunchpadAppearance launchpad_appearance?;
    string scheme?;
};

public type OrganizationUpdate record {
    string name;
};

public type ClickstreamSinkFiles record {
    # start of period
    string date_from?;
    ClickstreamSinkFile[] objects?;
    # Unique short id of sink file
    string id?;
    # Unique short id of clickstream
    string clickstream_id?;
    # end of period
    string date_to?;
};

public type CountryCodes CountryCode[];

# the tier default values for a single access feature
public type DefaultAccessFeature record {
    boolean has_access?;
    string name?;
};

public type TwoFactorCode record {
    string code;
};

public type InvitationGroup record {
    string group_guid?;
    string role_name?;
    string created?;
};

public type BSDsResponse record {
    string[] bsds?;
};

public type Clickstream record {
    # Descriptive name for the clickstream
    string name?;
    # Clickstream creation time
    string created?;
    # Time of deactivation, if any
    string deactivated?;
    # Last modified time
    string modified?;
    # Clickstream query
    string query?;
    # Unique short id
    string id?;
};

public type DomainRegister record {
    string redirect_url?;
};

public type OrganizationGUID record {
    string organization_guid?;
};

public type LaunchpadPresetTheme record {
    string button_text_color?;
    string display_name?;
    string avatar_text_color?;
    string launchpad_text_color?;
    boolean is_active?;
    string background?;
    string avatar_background?;
    int theme_id?;
    string button_background?;
};

public type ShareableReport record {
    string bitlink_id?;
    string shareable_report?;
};

public type GroupPreferences record {
    string group_guid?;
    string domain_preference?;
};

public type WebhookUpdate record {
    string name?;
    string url?;
    string group_guid?;
    boolean fetch_tags?;
    boolean is_active?;
    string organization_guid?;
    string client_id?;
    string client_secret?;
    string oauth_url?;
    string guid;
    string event?;
};

public type SocialAccounts string;

public type AccessFeature record {
    boolean has_access;
    string name;
    # ISO_TIMESTAMP
    string created;
    # ISO_TIMESTAMP
    string modified;
    boolean is_tier_default;
    string id;
};

public type DeeplinkApp record {
    string third_party_app_id;
    int created_ts?;
    string scheme?;
    string install_url;
    string name;
    string legacy_app_id?;
    string icon_url?;
    string organization_guid?;
    int modified_ts?;
    string guid?;
    string apple_app_entitlement_id?;
    string[] android_sha256?;
    string os;
};

public type AppAssociationDetail record {
    int priority?;
    boolean fallback?;
    string app_guid?;
    string os?;
};

public type EmailBody record {
    string status?;
    boolean is_primary?;
    string email?;
};

public type UserRole record {
    string group_guid?;
    string login;
    string role_name?;
    string organization_guid?;
};

public type SSOVerifySlug record {
    boolean available?;
    string url_slug?;
};

public type Metric record {
    int value?;
    string 'key?;
};

public type FacetCountData record {
    int total_count?;
    int ts?;
    FacetCountItem[] items?;
};

# NOT_FOUND
public type NotFound record {
    *Error;
};

public type DomainAgreement record {
    string content?;
    string url?;
    string agreement_key?;
    string title?;
};

public type UpgradeOrgBody record {
    BillingInfo billing_info?;
    string payment_provider?;
    string stripe_token?;
    string rate_plan_name?;
    string org_guid?;
    string payment_method_id?;
};

public type DeleteShare record {
    string account_login?;
    SocialAccounts account_type?;
};

public type Payments record {
    string payment_number?;
    string payment_date?;
    decimal payment_amount?;
};

public type Users record {
    Pagination pagination?;
    UserInternal[] users?;
};

public type LaunchpadButton record {
    string launchpad_id?;
    string bitlink?;
    string button_id?;
    string keyword?;
    string title?;
    boolean is_pinned?;
    boolean is_active;
    string domain?;
    string schedule_end?;
    int sort_order?;
    string long_url?;
    string scheme?;
    string schedule_start?;
};

public type CreateOverrideRules record {
    string rules;
    string group_guid?;
};

public type ReferrersByDomain record {
    Metric[] referrers?;
    string network?;
};

public type ClicksForBitlinks record {
    ClicksCount[] clicks?;
};

public type BulkShortenUpload record {
    string status;
    string name;
    string created;
    string group_guid;
    string report_url;
    string uploaded_by;
    string org_guid;
};

public type DeactivateUser record {
    record {*Feedback;} feedback?;
    string confirm_text?;
};

public type UserPreference record {
    string created?;
    boolean is_active?;
    string modified?;
    string value?;
    string preference?;
    string login?;
    boolean expired?;
    string last_seen?;
};

public type ContactInfo record {
    string first_name;
    string last_name;
    BillingAddress address;
};

public type BaseMetrics record {
    int units?;
    string facet?;
    string unit_reference?;
    string unit?;
};

public type ConsumableFeatureFull record {
    int count?;
    string name?;
    # ISO_TIMESTAMP
    string created?;
    boolean is_limited?;
    # ISO_TIMESTAMP
    string modified?;
    int 'limit?;
    boolean is_tier_default?;
    string id?;
    boolean is_enforced?;
};

public type OAuthApp record {
    string link?;
    string name?;
    string client_id?;
    string description?;
};

public type Authorizations record {
    Authorization[] authorizations?;
};

# EXPECTATION_FAILED
public type ExpectationFailed record {
    *Error;
};

public type UpdateLaunchpad record {
    string launchpad_id?;
    string domain?;
    boolean is_active;
    LaunchpadAppearance launchpad_appearance?;
    string keyword?;
};

public type ActivityLog record {
    string action_description?;
    # ISO timestamp
    string ts?;
    string user?;
    string action?;
    string org_guid?;
    string ip_address?;
    string id?;
    record {} metadata?;
};

public type DeeplinkRules record {
    DeeplinkRule[] rules?;
};

public type BitlinkHistory record {
    *HasReferences;
    # The backhalf of the underlying hash link
    string hash?;
    string group_guid?;
    string created_at?;
    boolean is_active?;
    string long_url?;
    string deactivated_at?;
    string login?;
    # The domain and backhalf of the underlying hash link
    string target_bitlink_id?;
    # The domain and backhalf of the parent override
    string id?;
};

public type BSDSearchResult record {
    string 'type?;
    string domain?;
    string subdomain?;
    string link?;
    string zone?;
};

public type CampaignClicksData record {
    int created_ts?;
    string description?;
    string brand_guid?;
    CampaignChannelClicks[] campaign_channels?;
    string created_by?;
    int modified_ts?;
    int total_clicks?;
    string guid?;
    string name?;
};

public type UpdateApp record {
    string[] ip_allowlist?;
    string[] redirect_uris?;
    string link?;
    string name?;
    string description?;
};

public type FeatureUsage record {
    # an array of all of the organizations consumable features
    ConsumableFeatureFull[] consumable_features;
    # an array of all of the organizations access features
    AccessFeature[] access_features;
};

public type InvitationsCreate record {
    string role_name;
    string[] emails;
    InvitationGroup[] groups?;
    string created?;
};

public type UserPreferences record {
    UserPreference[] preferences?;
};

public type BulkShortenValidate record {
    string group_guid?;
    string email?;
    string custom_domain?;
    string filename;
};

public type ClickstreamSinkNew record {
    # Location of the sink
    string destination?;
    # Descriptive name for the sink
    string name?;
    # Auth key for syncing to destination
    string auth_key?;
    # Provider of sink
    string provider?;
};

public type Organization record {
    *HasReferences;
    string name?;
    string[] bsds?;
    string created?;
    boolean is_active?;
    string modified?;
    string tier_display_name?;
    string tier_family?;
    string tier?;
    string role?;
    string guid?;
};

public type SSOSettings record {
    string slo_endpoint?;
    string default_group_guid?;
    string idp_url?;
    string certificate?;
    string organization_guid?;
    string saml_endpoint?;
    string identity_provider?;
    string[] domains?;
    string issuer_url?;
    string url_slug?;
};

public type CreateLaunchpad record {
    string group_guid;
    string domain;
    string keyword;
};

public type UserPasswordChange record {
    string original_password;
    string new_password;
};

public type BillingInfo record {
    BillingAddress billing_address?;
    BillingContact billing_contact?;
};

public type BillingAddress record {
    string city?;
    string country?;
    string state?;
    string address_1?;
    string address_2?;
    string zip_code?;
};

public type Authorization record {
    OAuthAppWithOwnerLogin app?;
    string id?;
    string client_id?;
    # ISO timestamp
    string created?;
};

public type BitlinkQR record {
    # Data URI of QR Code image
    string qr_code?;
    string link?;
    string id?;
};

public type LaunchpadButtonRequest record {
    string bitlink?;
    string title?;
    boolean is_active?;
    boolean is_pinned?;
    string schedule_end?;
    string long_url?;
    string domain?;
    string schedule_start?;
};

public type CityViewMetrics record {
    *BaseMetrics;
    ViewMetric[] launchpad_views?;
    OtherViewMetrics other_metrics?;
};

public type ClickMetric record {
    int clicks?;
    string value?;
};

public type UpdateButtonSortOrder record {
    LaunchpadButtonSortOrder[] buttons?;
};

public type Charges record {
    decimal charge_amount?;
    string processing_type?;
    decimal tax_amount?;
    string charge_name?;
};

public type CountItem record {
    int count?;
    string ts?;
};

public type FormSelectOptions record {
    string display?;
    string 'key?;
};

public type LaunchpadAppearance record {
    string launchpad_id?;
    string avatar_preference?;
    boolean hide_bitly_logo;
    string display_name?;
    string avatar_background_color?;
    string launchpad_text_color?;
    string description?;
    LaunchpadButtonAppearance button_appearance?;
    string avatar_image_url?;
    string style_preference?;
    string background?;
    int theme_id?;
    string avatar_text_color?;
    string layout?;
};

public type LaunchpadPresetThemes LaunchpadPresetTheme[];

public type CreatePaymentMethod record {
    string stripe_token?;
};

public type InvitationsError record {
    string message?;
    string[] emails?;
};

public type OtherViewMetrics record {
    int other_city_views?;
    int no_city_views?;
};

public type ClickstreamBody record {
    # Clickstream brand identifier
    string brand_guid?;
};

public type CreateShare record {
    string text?;
    string bitlink?;
    SocialAccounts account_type?;
    string account_id?;
    string group_guid?;
};

public type UserOnboardingSurvey record {
    string first_name?;
    string last_name?;
    string created?;
    string modified?;
    string company_size?;
    string organization_name?;
    string[] use_cases?;
    decimal 'version?;
    string[] use_cases_other?;
    string department?;
    string login?;
    string job_title?;
    string department_other?;
    string team_type?;
};

public type OtherMetrics record {
    int other_city_clicks?;
    int no_city_clicks?;
};

public type CampaignModify record {
    string group_guid?;
    string[] channel_guids?;
    string description?;
    string name?;
};

public type UpdateCustomBitlink record {
    string bitlink_id?;
};

public type Webhooks record {
    Webhook[] webhooks?;
};

public type ConsumableFeatures record {
    ConsumableFeature[] consumable_features?;
};

public type Share record {
    int numeric_id?;
    SocialAccounts account_type?;
    string account_id?;
    string text?;
    string link?;
    string account_name?;
};

public type CampaignClicks record {
    string unit_reference?;
    boolean rollup?;
    int 'limit?;
    int units?;
    CampaignClicksData data?;
    string unit?;
};

# TEMPORARILY_UNAVAILABLE
public type TemporarilyUnavailable record {
    *Error;
};

public type ShortenBitlinkBody record {
    *HasReferences;
    boolean archived?;
    string[] tags?;
    string created_at?;
    DeeplinkRule[] deeplinks?;
    string long_url?;
    string[] custom_bitlinks?;
    string link?;
    string id?;
};

public type DataExportQuery record {
    string archived?;
    int unit_reference?;
    string link_deeplinks?;
    string[] tags?;
    string[] campaign_ids?;
    int modified_after?;
    string keyword?;
    int created_after?;
    string custom_bitlink?;
    int units?;
    string query?;
    string report_type?;
    int created_before?;
    string[] emails?;
    string unit?;
};

public type FormPage record {
    FormField[] fields?;
};

# the number of units queried for
public type UnitAmount int;

public type InvitationsAccept record {
    string[] tokens?;
};

public type CampaignClickData record {
    int ts?;
    int clicks?;
};

public type Pagination record {
    int total?;
    int size?;
    string prev?;
    int page?;
    string next?;
};

public type ThirdPartyAppData record {
    string third_party_app_id?;
    string install_url?;
    string os?;
    string name?;
    string icon_url?;
};

public type ViewsSummary record {
    int units?;
    int total_views?;
    string unit_reference?;
    string unit?;
};

public type BitlinkBody record {
    *HasReferences;
    *BitlinkUpdate;
};

public type FacetCountItem record {
    int count?;
    string value?;
};

public type CustomBitlinkHistory record {
    string hash?;
    string uuid?;
    string keyword?;
    string created?;
    string group_guid?;
    string first_created?;
    boolean is_active?;
    string long_url?;
    string deactivated?;
    string bsd?;
    string login?;
};

public type AppAssociations record {
    InstallPreference android_install_preference?;
    InstallPreference ios_install_preference?;
    AppAssociationDetail[] android_apps?;
    string custom_domain?;
    AppAssociationDetail[] ios_apps?;
};

public type FormField record {
    string field_type?;
    string name?;
    boolean required?;
    string label?;
    FormConfig config?;
    string response?;
};

public type CustomBitlink record {
    BitlinkBody bitlink?;
    CustomBitlinkHistory[] bitlink_history?;
    string custom_bitlink?;
};

public type GroupBitlinksCount record {
    int units?;
    CountItem[] data?;
    string unit_reference?;
    string unit?;
};

public type ChannelBitlink record {
    string keyword_link?;
    int created_ts;
    string bitlink_id;
    string channel_guid;
    string title?;
    string[] campaign_ids?;
    int total_clicks?;
    string aggregate_link?;
    string campaign_guid;
    string link?;
    string client_id?;
    string long_url?;
    CampaignClickData[] clicks?;
};

public type ActivityLogs record {
    string next_page?;
    ActivityLog[] activity?;
};

public type PaymentInvoice record {
    decimal total_tax?;
    string description?;
    Charges charges?;
    string invoice_id?;
    string invoice_date?;
    Payments[] payments?;
    string invoice_number?;
    decimal total?;
    decimal subtotal?;
    string invoice_due_date?;
};

# TIMEOUT
public type Timeout record {
    *Error;
};

public type Channel record {
    *BaseChannel;
    *HasReferences;
};

public type Invitation record {
    string role_name;
    string email;
    InvitationGroup[] groups?;
    string created?;
};

public type ClicksSummary record {
    int units?;
    string unit?;
    int total_clicks?;
    string unit_reference?;
};

public type Campaigns record {
    Campaign[] campaigns?;
};

public type ExpandedBitlink record {
    string long_url?;
    string created_at?;
    string link?;
    string id?;
};

public type GroupClicksByFacet record {
    int units?;
    FacetCountData[] data?;
    string unit_reference?;
    string unit?;
};

# BAD_REQUEST
public type BadRequest record {
    *Error;
};

# custom domain in validation queue
public type DomainValidate record {
    string custom_domain?;
    string organization_guid?;
};

public type DeeplinkMetricsRollup record {
    # data returned up to this reference timestamp
    UnitReferenceTimeStamp unit_reference?;
    DeeplinkMetric ios?;
    DeeplinkMetric other?;
    # the number of units queried for
    UnitAmount units?;
    DeeplinkMetric android?;
    # the unit of time queried for (minute, hour, day, week, month)
    TimeUnit unit?;
};

public type BulkShortenUploadData record {
    record {} headers;
    string upload_url;
    string bucket;
    string filename;
};

public type ShareAccounts record {
    ShareAccount[] share_accounts?;
};

public type ChannelModify record {
    *BaseChannel;
    BaseChannelBitlink[] bitlinks?;
};

public type UMGroupPreference record {
    string created?;
    string group_guid?;
    string modified?;
    string value?;
    string preference?;
    boolean expired?;
    string last_seen?;
};

public type GroupClicks record {
    int units?;
    CountItem[] data?;
    string unit_reference?;
    string unit?;
};

public type Invitations record {
    Invitation[] invitations?;
};

public type User record {
    string default_group_guid?;
    string name;
    string created;
    boolean is_active;
    string modified;
    boolean is_sso_user;
    boolean is_2fa_enabled;
    string login;
    Email[] emails;
};

public type OrgTierHistory record {
    string status?;
    # ISO timestamp
    string created?;
    # ISO timestamp
    string deactivated?;
    # ISO timestamp
    string tier_change_date?;
    # ISO timestamp
    string activated?;
    # ISO timestamp
    string modified?;
    string tier_name?;
    string org_guid?;
};

# an array of org emails
public type OrgEmails record {
    OrgEmail[] emails?;
};

public type ClickLink record {
    int clicks?;
    string id?;
};

public type AccessFeatures record {
    AccessFeature[] access_features;
};

public type TwoFactorVerify record {
    boolean is_valid;
    boolean is_expired;
};

public type UserInternal record {
    *User;
    string role_name?;
};

public type Feedback record {
    string selection?;
    string optional_text?;
};

public type LaunchpadButtons LaunchpadButton[];

public type BillingAccount record {
    string last_four_digits?;
    decimal subscription_price?;
    BillingInfo billing_info?;
    string account_id?;
    # ISO timestamp
    string end_date?;
    ContactInfo contact_info?;
    string account_num?;
    string card_type?;
    string subscription_status?;
    # ISO timestamp
    string renewal_date?;
};

# Info needed for domain validation
public type PublicValidate record {
    string custom_domain?;
    string organization_guid?;
};

# UNAUTHORIZED
public type Unauthorized record {
    *Error;
};

public type CountryCode record {
    string CountryName?;
    string ISO3?;
    string ISO2?;
    int CallingCode?;
};

public type GroupUpdate record {
    string[] bsds?;
    string name?;
    string organization_guid?;
};

public type GroupBitlinksCountRollup record {
    int units?;
    int total_clicks?;
    string unit_reference?;
    string unit?;
};

public type ShareAccount record {
    int numeric_id?;
    string account_login?;
    SocialAccounts account_type?;
    string account_id?;
    string oauth_error?;
    boolean primary?;
    boolean visible?;
    # ISO timestamp
    string connected?;
    string account_name?;
};

public type ChannelBitlinks record {
    int total?;
    ChannelBitlink[] bitlinks?;
};

# SSL Certification
public type PublicSSLCert record {
    boolean custom_cert?;
    int valid_end?;
    string issuer?;
};

public type DeeplinkApps record {
    DeeplinkApp[] apps?;
};

public type Launchpads record {
    Launchpad[] launchpads?;
};

public type PaymentInvoiceDetail record {
    PaymentInvoice invoice_summary?;
    BillingAccount billing_account?;
};

public type ClickMetrics record {
    *BaseMetrics;
    ClickMetric[] metrics?;
};

public type HasReferences record {
    record {} references?;
};

public type PlatformLimits record {
    PlatformLimit[] platform_limits?;
};

public type OAuthApps record {
    OAuthApp[] applications?;
};

public type Error record {
    string message?;
    FieldError[] errors?;
    string 'resource?;
    string description?;
};

public type BSDSearchResults record {
    BSDSearchResult[] results?;
};

public type SSOSlug record {
    string url_slug?;
};

public type FormConfig record {
    FormSelectOptions[] options?;
};

public type NSQProducer record {
    int http_port?;
    string broadcast_address?;
    int tcp_port?;
    string hostname?;
    string remote_address?;
    string 'version?;
};

public type LinkClicks record {
    string date?;
    int clicks?;
};

# update custom domain fields
public type DomainUpdate record {
    boolean https_enabled?;
    boolean hsts_enabled?;
    boolean upgrade_insecure_requests?;
    string wildcard_redirect?;
    string root_redirect?;
};

# TOO_MANY_REQUESTS
public type TooManyRequests record {
    *Error;
};

public type OrgEmailBody record {
    string login?;
    string org_guid?;
    string email?;
};

public type OrgEmail record {
    string org_guid?;
    int created_ts?;
    string login?;
    string email?;
};

public type DomainStatus record {
    string status?;
    string domain?;
    string price?;
    string zone?;
};

# data returned up to this reference timestamp
public type UnitReferenceTimeStamp string;
