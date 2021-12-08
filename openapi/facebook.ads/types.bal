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

# List summary
public type ListSummary record {
    # Analytics summary for all objects
    record {} insights?;
    # Total number of objects
    int? total_count?;
};

# Ad properties
public type Ad record {
    # Ad labels associated with this ad
    record {}[]? adlabels?;
    # The ID of the ad set, required on creation
    int? adset_id?;
    # The ad set spec for this ad. When the spec is provided, adset_id field is not required.
    record {} adset_spec?;
    # The ID of the ad set, required on creation
    string? audience_id?;
    # Bid amount for this ad which will be used in auction instead of the ad set bid_amount, if specified.
    int? bid_amount?;
    # The domain where conversions happen. Required to create or update an ad in a campaign that shares data with a pixel.
    string? conversion_domain?;
    # This field is required for create. The ID or creative spec of the ad creative to be used by this ad.
    record {} creative;
    # The format of the date.
    string? date_format?;
    # The sequence of the ad within the same campaign
    int? display_sequence?;
    # The ID of the draft ad
    string|int? draft_adgroup_id?;
    # Flag to create a new audience based on users who engage with this ad
    string? engagement_audience?;
    # An execution setting
    string[]? execution_options?;
    # Include the demolink hashes
    boolean? include_demolink_hashes?;
    # Name of the ad
    string? name;
    # Priority
    int? priority?;
    # ID of the source Ad, if applicable
    string|int? source_ad_id?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # With Tracking Specs, you log actions taken by people on your ad.
    record {} tracking_specs?;
};

# Campaign operation response
public type CampaignResponse record {
    # Campaign ID
    string? id?;
    # Sucess status
    boolean? success?;
};

# Adset Budgets
public type AdsetBudgets record {
    # Adset ID
    string? adset_id?;
    # Daily budget
    int? daily_budget?;
    # Lifetime budget
    int? lifetime_budget?;
};

# Ad set list response
public type AdSetList record {
    # An array of ad sets
    AdSet[]? data?;
    # A cursor-paginated edge.
    Paging? paging?;
    # List summary
    ListSummary? summary?;
};

# A cursor-paginated edge.
public type Paging record {
    # Pagination cursor.
    PagingCursors? cursors?;
    # The Graph API endpoint that will return the next page of data. If not included, this is the last page of data. 
    # 
    # Due to how pagination works with visibility and privacy, it is possible that a page may be empty but contain 
    # a next paging link. Stop paging when the next link no longer appears.
    anydata? next?;
    # The Graph API endpoint that will return the previous page of data. If not included, this is the first page of data.
    anydata? previous?;
};

# Ad set update properties
public type AdSetUpdate record {
    # Ad Account ID
    string? account_id?;
    # Specifies list of labels to be associated with this object. This field is optional
    record {}[]? adlabels?;
    # Ad set schedule, representing a delivery schedule for a single day
    AdSetSchedule[]? adset_schedule?;
    # Array of attribution specs
    AttributionSpec[]? attribution_spec?;
    # Bid cap or target cost for this ad set. The bid cap used in a lowest cost bid strategy is defined as the maximum bid you want to pay for a result based on your optimization_goal.
    int? bid_amount?;
    # Bid strategy for this campaign to suit your specific business goals
    string? bid_strategy?;
    # The billing event
    string? billing_event?;
    # Settings of Contextual Bundle to support ads serving in Facebook contextual surfaces
    ContextualBundlingSpec? contextual_bundling_spec?;
    # Order of the adgroup sequence to be shown to users
    string|int[]? creative_sequence?;
    # The daily budget defined in your account currency, allowed only for ad sets with a duration (difference between end_time and start_time) longer than 24 hours.
    int? daily_budget?;
    # Daily impressions. Available only for campaigns with buying_type=FIXED_CPM.
    int? daily_imps?;
    # Daily minimum spend target of the ad set defined in your account currency. To use this field, daily budget must be specified in the Campaign.
    int? daily_min_spend_target?;
    # Daily spend cap of the ad set defined in your account currency. To use this field, daily budget must be specified in the Campaign.
    int? daily_spend_cap?;
    # The billing event
    string? destination_type?;
    # End time, required when lifetime_budget is specified
    string? end_time?;
    # An execution setting
    string[]? execution_options?;
    # Existing customer budget percentage
    int? existing_customer_budget_percentage?;
    # Indicates the ad set must only be used for dynamic creatives. Dynamic creative ads can be created in this ad set. Defaults to false
    boolean? is_dynamic_creative?;
    # Lifetime budget of this campaign. All adsets under this campaign will share this budget. 
    # You can either set budget at the campaign level or at the adset level, not both. 
    int? lifetime_budget?;
    # Lifetime impressions. Available only for campaigns with buying_type=FIXED_CPM
    int? lifetime_imps?;
    # Lifetime minimum spend target of the ad set defined in your account currency. To use this field, lifetime budget must be specified in the Campaign.
    int? lifetime_min_spend_target?;
    # Lifetime spend cap of the ad set defined in your account currency. To use this field, lifetime budget must be specified in the Campaign.
    int? lifetime_spend_cap?;
    # Multi optimization goal weight
    string? multi_optimization_goal_weight?;
    # Ad set name, max length of 400 characters.
    string? name?;
    # What the ad set is optimizing for.
    string? optimization_goal?;
    # What the ad set is optimizing for.
    string? optimization_sub_event?;
    # Defines the pacing type, standard by default or using ad scheduling
    string[]? pacing_type?;
    # RB prediction ID
    string|int? rb_prediction_id?;
    # Reach and frequency prediction ID
    string|int? rf_prediction_id?;
    # The object this campaign is promoting across all its ads
    PromotedObject? promoted_object?;
    # The start time of the set
    string? start_time?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # An ad set's targeting structure. "countries" is required.
    record {} targeting?;
    # Specify ad creative that displays at custom date ranges in a campaign as an array. A list of Adgroup IDs
    int[]?[]? time_based_ad_rotation_id_blocks?;
    # Date range when specific ad creative displays during a campaign. Provide date ranges in an array of UNIX timestamps where each timestamp represents the start time for each date range.
    int[]? time_based_ad_rotation_intervals?;
    # Time start
    string? time_start?;
    # Time stop
    string? time_stop?;
    # Tune for category
    string? tune_for_category?;
};

# Campaign operationupdate properties
public type CampaignUpdate record {
    # Ad Labels associated with this campaign
    record {}[]? adlabels?;
    # A map of child adset IDs to their respective bid amounts required in the process of toggling campaign from autobid to manual bid
    record {} adset_bid_amounts?;
    # Adset Budgets
    AdsetBudgets? adset_budgets?;
    # Bid strategy for this campaign to suit your specific business goals
    string? bid_strategy?;
    # Whether to automatically rebalance budgets daily for all the adsets under this campaign
    boolean? budget_rebalance_flag?;
    # Campaign optimization type
    string? campaign_optimization_type?;
    # Daily budget of this campaign. All adsets under this campaign will share this budget.
    int? daily_budget?;
    # An execution setting
    string[]? execution_options?;
    # To create an iOS 14 campaign, enable SKAdNetwork attribution for this campaign
    boolean? is_skadnetwork_attribution?;
    # Is using l3 schedule
    boolean? is_using_l3_schedule?;
    # An Array of Iterative Split Test Configs created under this campaign
    string[]? iterative_split_test_configs?;
    # Lifetime budget of this campaign. All adsets under this campaign will share this budget. 
    # You can either set budget at the campaign level or at the adset level, not both. 
    int? lifetime_budget?;
    # Name for this campaign
    string? name?;
    # Campaign's objective. If it is specified the API will validate that any ads created under the campaign match that objective.
    string? objective?;
    # The object this campaign is promoting across all its ads
    PromotedObject? promoted_object?;
    # Samrt promotion type
    string? smart_promotion_type?;
    # Special ad categories
    string[]? special_ad_categories;
    # Special ad category country
    string? special_ad_category_country?;
    # A spend cap for the campaign, such that it will not spend more than this cap. Defined as integer value of 
    # subunit in your currency with a minimum value of $100 USD (or approximate local equivalent). 
    int? spend_cap?;
    # Start time
    string? start_time?;
    # Stop time
    string? stop_time?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # Upstream events
    record {} upstream_events?;
};

# Settings of Contextual Bundle to support ads serving in Facebook contextual surfaces
public type ContextualBundlingSpec record {
    # Status
    string? status?;
};

# Ad update properties
public type AdUpdate record {
    # Ad labels associated with this ad
    record {}[]? adlabels?;
    # The ID of the audience
    string? audience_id?;
    # Bid amount for this ad which will be used in auction instead of the ad set bid_amount, if specified. 
    # Any updates to the ad set bid_amount will overwrite this value with the new ad set value.
    int? bid_amount?;
    # The domain where conversions happen. Required to create or update an ad in a campaign that shares data with a pixel.
    string? conversion_domain?;
    # This field is required for create. The ID or creative spec of the ad creative to be used by this ad.
    record {} creative;
    # The sequence of the ad within the same campaign
    int? display_sequence?;
    # The ID of the draft ad
    string|int? draft_adgroup_id?;
    # Flag to create a new audience based on users who engage with this ad
    string? engagement_audience?;
    # An execution setting
    string[]? execution_options?;
    # Include the demolink hashes
    boolean? include_demolink_hashes?;
    # Name of the ad
    string? name?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # With Tracking Specs, you log actions taken by people on your ad.
    record {} tracking_specs?;
};

# Conversion attribution spec used for attributing conversions for optimization. Supported window lengths differ by optimization goal and campaign objective.
public type AttributionSpec record {
    # Event type
    string? event_type?;
    # Window days
    int? window_days?;
};

# Campaign dissociate operation response
public type CampaignDissociateResponse record {
    # Count of objects left to delete
    int? objects_left_to_delete_count?;
    # Deleted object IDs
    string[]? deleted_object_ids?;
};

# Ad list response
public type AdList record {
    # An array of ads
    Ad[]? data?;
    # A cursor-paginated edge.
    Paging? paging?;
    # List summary
    ListSummary? summary?;
};

# Omnichannel object
public type OmnichannelObject record {
    # App objects
    record {}[]? app?;
    # Pixel objects
    record {}[]? pixel?;
    # Onsite objects
    record {}[]? onsite?;
};

# Date range used to aggregate insights metrics
public type TimeRange record {
    # A date in the format of "YYYY-MM-DD", which means from the beginning midnight of that day
    string? since?;
    # A date in the format of "YYYY-MM-DD", which means to the beginning midnight of the following day
    string? until?;
};

# Campaign properties
public type Campaign record {
    # Ad Labels associated with this campaign
    record {}[]? adlabels?;
    # This field will help Facebook make optimizations to delivery, pricing, and limits. All ad sets in this campaign must match the buying type. 
    # Possible values are
    #   - AUCTION (default)
    #   - RESERVED (for reach and frequency ads)
    string? buying_type?;
    # Bid strategy for this campaign to suit your specific business goals
    string? bid_strategy?;
    # Campaign optimization type
    string? campaign_optimization_type?;
    # Daily budget of this campaign. All adsets under this campaign will share this budget.
    int? daily_budget?;
    # An execution setting
    string[]? execution_options?;
    # To create an iOS 14 campaign, enable SKAdNetwork attribution for this campaign
    boolean? is_skadnetwork_attribution?;
    # Is using l3 schedule
    boolean? is_using_l3_schedule?;
    # Array of Iterative Split Test Configs created under this campaign
    string[]? iterative_split_test_configs?;
    # Lifetime budget of this campaign. All adsets under this campaign will share this budget. 
    # You can either set budget at the campaign level or at the adset level, not both. 
    int? lifetime_budget?;
    # Name for this campaign
    string? name?;
    # Campaign's objective. If it is specified the API will validate that any ads created under the campaign match that objective.
    string? objective?;
    # The object this campaign is promoting across all its ads
    PromotedObject? promoted_object?;
    # Used if a campaign has been copied. The ID from the original campaign that was copied.
    string|int? source_campaign_id?;
    # Special ad categories
    string[]? special_ad_categories;
    # Special ad category country
    string? special_ad_category_country?;
    # A spend cap for the campaign, such that it will not spend more than this cap. Defined as integer value of 
    # subunit in your currency with a minimum value of $100 USD (or approximate local equivalent). 
    int? spend_cap?;
    # Start time
    string? start_time?;
    # Stop time
    string? stop_time?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # Topline ID
    string|int? topline_id?;
    # Upstream events
    record {} upstream_events?;
};

# Adgroup operation response
public type AdResponse record {
    # Ad ID
    string? id?;
    # Sucess status
    boolean? success?;
};

# Campaign specifications
public type CampignSpec record {
    # Name of the campaign
    string? name?;
    # Campaign's objective. If it is specified the API will validate that any ads created under the campaign match that objective.
    string? objective?;
    # This field will help Facebook make optimizations to delivery, pricing, and limits. All ad sets in this campaign must match the buying type. 
    # Possible values are
    #   - AUCTION (default)
    #   - RESERVED (for reach and frequency ads)
    string? buying_type?;
};

# The object this campaign is promoting across all its ads
public type PromotedObject record {
    # The ID of a Facebook Application. Usually related to mobile or canvas games being promoted on Facebook for installs or engagement
    int? application_id?;
    # The ID of a Facebook conversion pixel. Used with offsite conversion campaigns
    string|int? pixel_id?;
    # The event from an App Event of a mobile app, not in the standard event list
    string? custom_event_type?;
    # The uri of the mobile / digital store where an application can be bought / downloaded
    string? object_store_url?;
    # The ID of an Offer from a Facebook Page
    string|int? offer_id?;
    # The ID of a Facebook Page
    string? page_id?;
    # The ID of a Product Catalog. Used with Dynamic Product Ads
    string|int? product_catalog_id?;
    # The ID of the product item
    string|int? product_item_id?;
    # The ID of the instagram profile id
    string|int? instagram_profile_id?;
    # The ID of a Product Set within an Ad Set level Product Catalog. Used with Dynamic Product Ads.
    string|int? product_set_id?;
    # The ID of a Facebook Event
    string|int? event_id?;
    # The ID of the offline dataset
    string|int? offline_conversion_data_set_id?;
    # The ID of the fundraiser campaign
    string|int? fundraiser_campaign_id?;
    # The event from an App Event of a mobile app, not in the standard event list.
    string? custom_event_str?;
    # Omnichannel object
    OmnichannelObject? omnichannel_object?;
    # Post conversions
    record {}[]?[]? post_conversions?;
};

# Ad set schedule, representing a delivery schedule for a single day
public type AdSetSchedule record {
    # A 0 based minute of the day representing when the schedule starts
    int? start_minute?;
    # A 0 based minute of the day representing when the schedule ends
    int? end_minute;
    # Array of ints representing which days the schedule is active. Valid values are 0-6 with 0 representing Sunday, 
    # 1 representing Monday, ... and 6 representing Saturday.
    int[]? days;
    # Timezone type
    string? timezone_type?;
};

# Pagination cursor.
public type PagingCursors record {
    # This is the cursor that points to the start of the page of data that has been returned.
    string? before?;
    # This is the cursor that points to the end of the page of data that has been returned.
    string? after?;
};

# Ad set operation response
public type AdSetResponse record {
    # Ad set  ID
    string? id?;
    # Sucess status
    boolean? success?;
};

# Ad set properties
public type AdSet record {
    # Specifies list of labels to be associated with this object. This field is optional
    record {}[]? adlabels?;
    # Ad set schedule, representing a delivery schedule for a single day
    AdSetSchedule[]? adset_schedule?;
    # Array of attribution specs
    AttributionSpec[]? attribution_spec?;
    # Bid cap or target cost for this ad set. The bid cap used in a lowest cost bid strategy is defined as the maximum bid you want to pay for a result based on your optimization_goal.
    int? bid_amount?;
    # Bid strategy for this campaign to suit your specific business goals
    string? bid_strategy?;
    # The billing event
    string? billing_event?;
    # The ad campaign you wish to add this ad set to.
    string|int? campaign_id?;
    # Campaign specifications
    CampignSpec? campaign_spec?;
    # Settings of Contextual Bundle to support ads serving in Facebook contextual surfaces
    ContextualBundlingSpec? contextual_bundling_spec?;
    # Order of the adgroup sequence to be shown to users
    string|int[]? creative_sequence?;
    # The daily budget defined in your account currency, allowed only for ad sets with a duration (difference between end_time and start_time) longer than 24 hours.
    int? daily_budget?;
    # Daily impressions. Available only for campaigns with buying_type=FIXED_CPM.
    int? daily_imps?;
    # Daily minimum spend target of the ad set defined in your account currency. To use this field, daily budget must be specified in the Campaign.
    int? daily_min_spend_target?;
    # Daily spend cap of the ad set defined in your account currency. To use this field, daily budget must be specified in the Campaign.
    int? daily_spend_cap?;
    # The billing event
    string? destination_type?;
    # End time, required when lifetime_budget is specified
    string? end_time?;
    # An execution setting
    string[]? execution_options?;
    # Existing customer budget percentage
    int? existing_customer_budget_percentage?;
    # Indicates the ad set must only be used for dynamic creatives. Dynamic creative ads can be created in this ad set. Defaults to false
    boolean? is_dynamic_creative?;
    # Lifetime budget of this campaign. All adsets under this campaign will share this budget. 
    # You can either set budget at the campaign level or at the adset level, not both. 
    int? lifetime_budget?;
    # Lifetime impressions. Available only for campaigns with buying_type=FIXED_CPM
    int? lifetime_imps?;
    # Lifetime minimum spend target of the ad set defined in your account currency. To use this field, lifetime budget must be specified in the Campaign.
    int? lifetime_min_spend_target?;
    # Lifetime spend cap of the ad set defined in your account currency. To use this field, lifetime budget must be specified in the Campaign.
    int? lifetime_spend_cap?;
    # Multi optimization goal weight
    string? multi_optimization_goal_weight?;
    # Ad set name, max length of 400 characters.
    string? name;
    # What the ad set is optimizing for.
    string? optimization_goal?;
    # What the ad set is optimizing for.
    string? optimization_sub_event?;
    # Defines the pacing type, standard by default or using ad scheduling
    string[]? pacing_type?;
    # Reach and frequency prediction ID
    string|int? rf_prediction_id?;
    # The source adset id that this ad is copied from (if applicable).
    string|int? source_adset_id?;
    # The object this campaign is promoting across all its ads
    PromotedObject? promoted_object?;
    # The start time of the set
    string? start_time?;
    # Only ACTIVE and PAUSED are valid during creation. Other statuses can be used for update
    string? status?;
    # An ad set's targeting structure. "countries" is required.
    record {} targeting?;
    # Specify ad creative that displays at custom date ranges in a campaign as an array. A list of Adgroup IDs
    int[]?[]? time_based_ad_rotation_id_blocks?;
    # Date range when specific ad creative displays during a campaign. Provide date ranges in an array of UNIX timestamps where each timestamp represents the start time for each date range.
    int[]? time_based_ad_rotation_intervals?;
    # Time start
    string? time_start?;
    # Time stop
    string? time_stop?;
    # Tune for category
    string? tune_for_category?;
};

# Campaign list response
public type CampaignList record {
    # An array of campaigns
    Campaign[]? data?;
    # A cursor-paginated edge.
    Paging? paging?;
    # List summary
    ListSummary? summary?;
};
