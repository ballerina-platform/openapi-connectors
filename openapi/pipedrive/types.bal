// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type DeleteFiltersResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletefiltersresponse200Data? data?;
};

public type SearchItemResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Searchitemresponse200Data? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type DeleteProductResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteproductresponse200Data? data?;
};

public type StageResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # Updated Stage object
    Stageresponse200Data? data?;
};

# The response data
public type Deleteroleassignmentresponse200Data record {
    # The ID of the Role the User was removed from
    record {} id?;
};

public type GetProductFieldResponse200 record {
    # If the response is successful or not
    boolean? success?;
    ProductFieldData? data?;
};

public type Product record {
    # The ID of the deal-product (the ID of the Product attached to the Deal)
    int? id?;
    # The ID of the Deal
    int? deal_id?;
    # Order number of the Product
    int? order_nr?;
    # The ID of the Product
    int? product_id?;
    # The ID of the Product variation
    int? product_variation_id?;
    # Price value of the Product
    int? item_price?;
    # Discount percentage of the Product
    int? discount_percentage?;
    # Duration of the Product
    int? duration?;
    # The type of the duration. (For example hourly, daily, etc.)
    string? duration_unit?;
    # The Product sum without the discount
    decimal? sum_no_discount?;
    # The sum of all the Products attached to the Deal
    decimal? sum?;
    # The currency associated with the Deal Product
    string? currency?;
    # If Product is enabled or not
    boolean? enabled_flag?;
    # The date and time when the Product was added to the Deal
    string? add_time?;
    # The date and time when the Deal Product was last edited
    string? last_edit?;
    # Comments of the Product
    string? comments?;
    # Boolean indicates if the Product is activated or not
    boolean? active_flag?;
    # The Product tax
    decimal? tax?;
    # The Product name
    string? name?;
    # Formatted sum of the Product
    string? sum_formatted?;
    # Formatted quantity of the Product
    string? quantity_formatted?;
    # Quantity of the Product
    int? quantity?;
    ProductProduct? product?;
};

public type Deletedealparticipantresponse200Data record {
    # The ID of the Deal Participant that was deleted
    int? id?;
};

public type UpdateTeamRequest record {
    # The Team name
    string? name?;
    # The Team description
    string? description?;
    # The Team manager ID
    int? manager_id?;
    # List of User IDs
    int[]? users?;
    # Flag that indicates if the Team is activated
    record {} active_flag?;
    # Flag that indicates if the Team is deleted
    record {} deleted_flag?;
};

public type LeadResponse404 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type Getorganizationsresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsOrganization? organization?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
    # The picture that is associated with the item
    Getorganizationsresponse200RelatedObjectsPicture? picture?;
};

public type LinkFileToItemResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The File data
    Getassociatedfilesresponse200Data? data?;
};

public type Getdealsresponse200RelatedObjects record {
    # The User who is associated with the Deal
    Getdealsresponse200RelatedObjectsUser? user?;
    # The Organization which is associated with the Deal
    Getdealsresponse200RelatedObjectsOrganization? organization?;
    # The Person who is associated with the Deal
    Getdealsresponse200RelatedObjectsPerson? person?;
};

public type Deleteorganizationresponse200Data record {
    # The ID of the Organization that was deleted
    int? id?;
};

# Movements between Stages
public type Getpipelinemovementstatisticsresponse200DataMovementsBetweenStages record {
    # The count of the Deals that have been moved between Stages
    int? count?;
};

public type GetProductAttachementResponse200 record {
    # If the response is successful or not
    boolean? success?;
    BasicDealProductRequestData? data?;
};

public type BasicPersonRequest record {
    # Person name
    string? name?;
    # ID of the user who will be marked as the owner of this person. When omitted, the authorized user ID will be used.
    int? owner_id?;
    # ID of the organization this person will belong to.
    int? org_id?;
    # Email addresses (one or more) associated with the person, presented in the same manner as received by GET request of a person.
    string[]? email?;
    # Phone numbers (one or more) associated with the person, presented in the same manner as received by GET request of a person.
    string[]? phone?;
    # Visibility of the person. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
};

public type AddActivityRequest record {
    # Due date of the Activity. Format: YYYY-MM-DD
    string? due_date?;
    # Due time of the Activity in UTC. Format: HH:MM
    string? due_time?;
    # Duration of the Activity. Format: HH:MM
    string? duration?;
    # The ID of the Deal this Activity is associated with
    int? deal_id?;
    # The ID of the Person this Activity is associated with
    int? person_id?;
    # The ID of the Organization this Activity is associated with
    int? org_id?;
    # Note of the Activity (HTML format)
    string? note?;
    # The address of the Activity. Pipedrive will automatically check if the location matches a geo-location on Google maps.
    string? location?;
    # Additional details about the Activity that is synced to your external calendar. Unlike the note added to the Activity, the description is publicly visible to any guests added to the Activity.
    string? public_description?;
    # Subject of the Activity. When value for subject is not set, it will be given a default value `Call`.
    string? subject?;
    # Type of the Activity. This is in correlation with the `key_string` parameter of ActivityTypes. When value for type is not set, it will be given a default value `Call`.
    string? 'type?;
    # The ID of the User whom the Activity is assigned to. If omitted, the Activity is assigned to the authorized User.
    int? user_id?;
    # List of multiple Persons (participants) this Activity is associated with. If omitted, single participant from `person_id` field is used. It requires a structure as follows: `[{"person_id":1,"primary_flag":true}]`
    record {}[] participants?;
    # Set the Activity as 'Busy' or 'Free'. If the flag is set to `true`, your customers will not be able to book that time slot through any Scheduler links. The flag can also be unset by never setting it or overriding it with `null`. When the value of the flag is unset (`null`), the flag defaults to 'Busy' if it has a time set, and 'Free' if it is an all-day event without specified time.
    boolean? busy_flag?;
    # Attendees of the Activity. This can be either your existing Pipedrive contacts or an external email address. It requires a structure as follows: `[{"email_address":"mail@example.org"}]` or `[{"person_id":1, "email_address":"mail@example.org"}]`
    record {}[] attendees?;
    # Whether the Activity is done or not. 0 = Not done, 1 = Done
    record {} done?;
};

public type AddDealParticipantResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The object of Participant
    PersonItem? data?;
    Getdealsresponse200RelatedObjects? related_objects?;
};

public type Deleteactivitiesresponse200Data record {
    # An array of IDs of Activities that were deleted
    int[]? id?;
};

public type Addpersonfollowerresponse200Data record {
    # The ID of the User who was added as a follower to a Person
    int? user_id?;
    # The ID of the Follower
    int? id?;
    # The ID of the Person to whom the follower was added
    int? person_id?;
    # The date and time when the Follower was added to a Person. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
};

public type Getpipelineconversionstatisticsresponse200DataStageConversions record {
    # The Stage ID from where conversion starts
    int? from_stage_id?;
    # The Stage ID to where conversion ends
    int? to_stage_id?;
    # Conversion rate
    int? conversion_rate?;
};

public type GetOneMailThreadResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The mail thread object
    BaseMailThreadData? data?;
};

# The object of UserConnections
public type Userconnectionsresponse200Data record {
    # The third party ID or false in case the ID is not found
    string? google?;
};

public type Addactivityresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsUser? user?;
    Getactivitiesresponse200RelatedObjectsDeal? deal?;
    Addactivityresponse200RelatedObjectsPerson? person?;
    Addactivityresponse200RelatedObjectsOrganization? organization?;
};

public type Searchpersonsresponse200Data record {
    # The array of found items
    Searchpersonsresponse200DataItems[]? items?;
};

public type UserResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Usersresponse200Data? data?;
};

public type AddFileAndLinkItRequest record {
    # The file type
    string? file_type;
    # The title of the file
    string? title;
    # The item type
    string? item_type;
    # ID of the item to associate the file with
    int? item_id;
    # The location type to send the file to. Only `googledrive` is supported at the moment.
    string? remote_location;
};

public type AddFileAndLinkItResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The File data
    Getassociatedfilesresponse200Data? data?;
};

# The response data
public type Addroleresponse200Data record {
    # The ID of the created Role
    record {} id?;
};

public type AddRecurringSubscriptionRequest record {
    # ID of the Deal this Recurring Subscription is associated with
    int? deal_id;
    # The currency of the Recurring Subscription. Accepts a 3-character currency code.
    string? currency;
    # Description of the Recurring Subscription
    string? description?;
    # Interval between payments
    string? cadence_type;
    # Shows how many payments the Subscription has. Note that one field must be set: `cycles_count` or `infinite`. If `cycles_count` is set, then `cycle_amount` and `start_date` are also required.
    int? cycles_count?;
    # Amount of each payment
    int? cycle_amount;
    # Start date of the Recurring Subscription. Format: YYYY-MM-DD
    string? start_date;
    # This indicates that the Recurring Subscription will last until it's manually canceled or deleted. Note that only one field must be set: `cycles_count` or `infinite`.
    boolean? infinite?;
    # Array of additional payments. It requires a minimum structure as follows: [{ amount:SUM, description:DESCRIPTION, due_at:PAYMENT_DATE }]. Replace SUM with a payment amount, DESCRIPTION with an explanation string, PAYMENT_DATE with a date (format YYYY-MM-DD).
    record {}[] payments?;
    # Indicates that the Deal value must be set to Recurring Subscription's MRR value
    boolean? update_deal_value?;
};

public type OrganizationRelationshipWithCalculatedFields record {
    *OrganizationRelationshipWithCalculatedFields1;
    *OrganizationRelationshipWithCalculatedFields2;
};

public type OrganizationRelationshipDetails record {
    *OrganizationRelationshipWithCalculatedFields;
    *OrganizationRelationshipDetails1;
};

public type UpdateFileResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The File data
    Getassociatedfilesresponse200Data? data?;
};

public type Getactivitiesresponse200AdditionalData record {
    # Pagination details of the list
    Additionaldata2Pagination? pagination?;
};

public type GetGoalsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Getgoalsresponse200Data? data?;
};

public type Getwebhooksresponse200Data record {
    # The ID of the Webhook
    int? id?;
    # The ID of the Company related to the Webhook
    int? company_id?;
    # The ID of the User who owns the Webhook
    int? owner_id?;
    # The ID of the User related to the Webhook
    int? user_id?;
    # The Webhook action
    string? event_action?;
    # The Webhook object
    string? event_object?;
    # The subscription URL of the Webhook
    string? subscription_url?;
    # The Webhook's status
    record {} is_active?;
    # The date when the Webhook was added
    string? add_time?;
    # The date when the Webhook was removed (if removed)
    string? remove_time?;
    # The type of the Webhook
    string? 'type?;
    # The username of the `subscription_url` of the Webhook
    string? http_auth_user?;
    # The password of the `subscription_url` of the Webhook
    string? http_auth_password?;
    # Any additional data related to the Webhook
    record {} additional_data?;
    # The removal reason of the Webhook (if removed)
    string? remove_reason?;
    # The last delivery time of the Webhook
    string? last_delivery_time?;
    # The last delivery HTTP status of the Webhook
    int? last_http_status?;
    # The ID of the admin of the Webhook
    int? admin_id?;
};

public type GetAssociatedMailMessagesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Mail Messages
    MailMessages[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type DealCountAndActivityInfo record {
    *DealCountAndActivityInfo1;
    *DealCountAndActivityInfo2;
};

public type Deletestagesresponse200Data record {
    # The list of deleted Stage IDs
    int[]? id?;
};

public type InlineResponse403 record {
    # If the response is successful or not
    boolean? success?;
    # The error message
    string? message?;
};

public type Searchdealsresponse200DataItems record {
    # Search result relevancy
    decimal? result_score?;
    Searchdealsresponse200DataItem? item?;
};

public type UpdateSubscriptionInstallmentRequest record {
    # Array of payments. It requires a minimum structure as follows: [{ amount:SUM, description:DESCRIPTION, due_at:PAYMENT_DATE }]. Replace SUM with a payment amount, DESCRIPTION with a explanation string, PAYMENT_DATE with a date (format YYYY-MM-DD).
    record {}[] payments;
    # Indicates that the Deal value must be set to Installment Subscription's total value
    boolean? update_deal_value?;
};

# Moved Deals average age in days
public type Getpipelinemovementstatisticsresponse200DataAverageAgeInDays record {
    # Moved Deals average age across all Stages
    int? across_all_stages?;
    # Moved Deals average age by Stages
    Getpipelinemovementstatisticsresponse200DataAverageAgeInDaysByStages[]? by_stages?;
};

public type LinkFileToItemRequest record {
    # The item type
    string? item_type;
    # ID of the item to associate the file with
    int? item_id;
    # The remote item id
    string? remote_id;
    # The location type to send the file to. Only `googledrive` is supported at the moment.
    string? remote_location;
};

public type AddDealRequest record {
    # Deal title
    string? title?;
    # Value of the deal. If omitted, value will be set to 0.
    string? value?;
    # Currency of the deal. Accepts a 3-character currency code. If omitted, currency will be set to the default currency of the authorized user.
    string? currency?;
    # ID of the user who will be marked as the owner of this deal. If omitted, the authorized user ID will be used.
    int? user_id?;
    # ID of the person this deal will be associated with
    int? person_id?;
    # ID of the organization this deal will be associated with
    int? org_id?;
    # ID of the stage this deal will be placed in a pipeline (note that you can't supply the ID of the pipeline as this will be assigned automatically based on `stage_id`). If omitted, the deal will be placed in the first stage of the default pipeline.
    int? stage_id?;
    # open = Open, won = Won, lost = Lost, deleted = Deleted. If omitted, status will be set to open.
    string? status?;
    # The expected close date of the Deal. In ISO 8601 format: YYYY-MM-DD.
    string? expected_close_date?;
    # Deal success probability percentage. Used/shown only when `deal_probability` for the pipeline of the deal is enabled.
    decimal? probability?;
    # Optional message about why the deal was lost (to be used when status=lost)
    string? lost_reason?;
    # Visibility of the deal. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # Optional creation date & time of the deal in UTC. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
};

public type AddOrganizationRequest record {
    # Organization name
    string? name?;
    # The ID of the user who will be marked as the owner of this Organization. When omitted, the authorized User ID will be used.
    int? owner_id?;
    # Visibility of the organization. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # Optional creation date & time of the organization in UTC. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
};

public type DeleteProductFieldsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteproductfieldsresponse200Data? data?;
};

# The User language details
public type User2Language record {
    # The language code. E.g. en
    string? language_code?;
    # The country code. E.g. US
    string? country_code?;
};

public type AddDealProductRequest record {
    # Price at which this product will be added to the deal
    decimal? item_price?;
    # Quantity – e.g. how many items of this product will be added to the deal
    int? quantity?;
    # Discount %. If omitted, will be set to 0
    decimal? discount_percentage?;
    # Duration of the product (when product durations are not enabled for the company or if omitted, defaults to 1)
    decimal? duration?;
    # ID of the product variation to use. When omitted, no variation will be used.
    int? product_variation_id?;
    # Any textual comment associated with this product-deal attachment. Visible and editable in the application UI.
    string? comments?;
    # Whether the product is enabled on the deal or not. This makes it possible to add products to a deal with specific price and discount criteria - but keep them disabled, which refrains them from being included in deal price calculation. When omitted, the product will be marked as enabled by default.
    record {} enabled_flag?;
    # ID of the product that will be attached
    int? product_id?;
};

public type UpdateLeadRequest record {
    # The name of the Lead
    string? title?;
    # The ID of the User which will be the owner of the created Lead. If not provided, the user making the request will be used.
    int? owner_id?;
    # The IDs of the Lead Labels which will be associated with the Lead
    string[]? label_ids?;
    # The ID of a Person which this Lead will be linked to. If the Person does not exist yet, it needs to be created first. A Lead always has to be linked to a Person or Organization or both.
    int? person_id?;
    # The ID of an Organization which this Lead will be linked to. If the Organization does not exist yet, it needs to be created first. A Lead always has to be linked to a Person or Organization or both.
    int? organization_id?;
    # A flag indicating whether the Lead is archived or not
    boolean? is_archived?;
    # The potential value of the Lead.
    LeadsValue? value?;
    # The date of when the Deal which will be created from the Lead is expected to be closed. In ISO 8601 format: YYYY-MM-DD.
    string? expected_close_date?;
    # Visibility of the lead. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # A flag indicating whether the Lead was seen by someone in the Pipedrive UI
    boolean? was_seen?;
};

public type GetOrganizationRelationshipsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Organization Relationships
    OrganizationRelationshipDetails[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getorganizationrelationshipsresponse200RelatedObjects? related_objects?;
};

# The total weighted values of the Deals grouped by Deal currency. The weighted value is calculated as probability times Deal value.
public type Getdealssummaryresponse200DataWeightedValuesTotal record {
    # The total weighted value of the Deals in the Deal currency group
    decimal? value?;
    # The number of Deals in the Deal currency group
    int? count?;
    # The total weighted value of the Deals formatted with Deal currency. E.g. €50
    string? value_formatted?;
};

public type DeleteOrganizationsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deleteorganizationsresponse200Data? data?;
};

public type MergePersonsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
};

# The response data
public type Deleteroleresponse200Data record {
    # The ID of the deleted Role
    record {} id?;
};

public type Getorganizationrelationshipsresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsOrganization? organization?;
};

public type AddOrganizationResponse200 record {
    # If the response is successful or not
    boolean? success?;
    BaseOrganizationItemWithEditNameFlagData? data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

public type DeleteMailThreadResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # An array of mail threads
    BaseMailThread[]? data?;
};

# Parties of the mail thread
public type Basemailthread2Parties record {
    # Recipients of the mail thread
    Basemailthread2PartiesTo[]? to?;
    # Senders of the mail thread
    Basemailthread2PartiesTo[]? 'from?;
};

public type GetPersonsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Persons
    PersonItem[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

# The Pipeline object
public type Addpipelineresponse200Data record {
    # The ID of the Pipeline
    int? id?;
    # The name of the Pipeline
    string? name?;
    # The Pipeline title displayed in the URL
    string? url_title?;
    # Defines the order of Pipelines. First order (`order_nr=0`) is the default Pipeline.
    int? order_nr?;
    # Whether this Pipeline will be made inactive (hidden) or active
    boolean? active?;
    # Whether Deal probability is disabled or enabled for this Pipeline
    boolean? deal_probability?;
    # The Pipeline creation time. Format: YYYY-MM-DD HH:MM:SS.
    string? add_time?;
    # The Pipeline update time. Format: YYYY-MM-DD HH:MM:SS.
    string? update_time?;
};

public type ActivityResponseObjectData record {
    *ActivityResponseObject1;
    *ActivityResponseObject2;
};

public type UpdatePipelineResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Pipeline object
    record {} data?;
};

public type GetGoalResultResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Getgoalresultresponse200Data? data?;
};

public type DeleteOrganizationResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deleteorganizationresponse200Data? data?;
};

public type UpdateActivityRequest record {
    # Due date of the Activity. Format: YYYY-MM-DD
    string? due_date?;
    # Due time of the Activity in UTC. Format: HH:MM
    string? due_time?;
    # Duration of the Activity. Format: HH:MM
    string? duration?;
    # The ID of the Deal this Activity is associated with
    int? deal_id?;
    # The ID of the Person this Activity is associated with
    int? person_id?;
    # The ID of the Organization this Activity is associated with
    int? org_id?;
    # Note of the Activity (HTML format)
    string? note?;
    # The address of the Activity. Pipedrive will automatically check if the location matches a geo-location on Google maps.
    string? location?;
    # Additional details about the Activity that is synced to your external calendar. Unlike the note added to the Activity, the description is publicly visible to any guests added to the Activity.
    string? public_description?;
    # Subject of the Activity
    string? subject?;
    # Type of the Activity. This is in correlation with the `key_string` parameter of ActivityTypes.
    string? 'type?;
    # The ID of the User whom the Activity is assigned to
    int? user_id?;
    # List of multiple Persons (participants) this Activity is associated with. It requires a structure as follows: `[{"person_id":1,"primary_flag":true}]`
    record {}[] participants?;
    # Set the Activity as 'Busy' or 'Free'. If the flag is set to `true`, your customers will not be able to book that time slot through any Scheduler links. The flag can also be unset by never setting it or overriding it with `null`. When the value of the flag is unset (`null`), the flag defaults to 'Busy' if it has a time set, and 'Free' if it is an all-day event without specified time.
    boolean? busy_flag?;
    # Attendees of the Activity. This can be either your existing Pipedrive contacts or an external email address. It requires a structure as follows: `[{"email_address":"mail@example.org"}]` or `[{"person_id":1, "email_address":"mail@example.org"}]`
    record {}[] attendees?;
    # Whether the Activity is done or not. 0 = Not done, 1 = Done
    record {} done?;
};

public type Deletepipelineresponse200Data record {
    # Deleted Pipeline ID
    int? id?;
};

public type AddSubscriptionInstallmentRequest record {
    # ID of the Deal this Installment Subscription is associated with
    int? deal_id;
    # The currency of the Installment Subscription. Accepts a 3-character currency code.
    string? currency;
    # Array of payments. It requires a minimum structure as follows: [{ amount:SUM, description:DESCRIPTION, due_at:PAYMENT_DATE }]. Replace SUM with a payment amount, DESCRIPTION with an explanation string, PAYMENT_DATE with a date (format YYYY-MM-DD).
    record {}[] payments;
    # Indicates that the Deal value must be set to the Installment Subscription's total value
    boolean? update_deal_value?;
};

public type Email record {
    # Email
    string? value?;
    # Boolean that indicates if email is primary for the Person or not
    boolean? primary?;
    # Label that indicates the type of the email. (Possible values - work, home or other)
    string? label?;
};

public type Getuserpermissionsresponse200Data record {
    # If the User can add custom fields
    boolean? can_add_custom_fields?;
    # If the User can add Products
    boolean? can_add_products?;
    # If the User can add prospects as Leads
    boolean? can_add_prospects_as_leads?;
    # If the User can bulk edit items
    boolean? can_bulk_edit_items?;
    # If the User can change visibility of items
    boolean? can_change_visibility_of_items?;
    # If the User can convert Deals to Leads
    boolean? can_convert_deals_to_leads?;
    # If the User can create workflows
    boolean? can_create_own_workflow?;
    # If the User can delete Activities
    boolean? can_delete_activities?;
    # If the User can delete custom fields
    boolean? can_delete_custom_fields?;
    # If the User can delete Deals
    boolean? can_delete_deals?;
    # If the User can edit custom fields
    boolean? can_edit_custom_fields?;
    # If the User can edit Deals' closed date
    boolean? can_edit_deals_closed_date?;
    # If the User can edit Products
    boolean? can_edit_products?;
    # If the User can edit shared filters
    boolean? can_edit_shared_filters?;
    # If the User can export data from item lists
    boolean? can_export_data_from_lists?;
    # If the User can follow other Users
    boolean? can_follow_other_users?;
    # If the User can merge Deals
    boolean? can_merge_deals?;
    # If the User can merge Organizations
    boolean? can_merge_organizations?;
    # If the User can merge people
    boolean? can_merge_people?;
    # If the User can modify labels
    boolean? can_modify_labels?;
    # If the User can see company-wide statistics
    boolean? can_see_company_wide_statistics?;
    # If the User can see the summary on the Deals page
    boolean? can_see_deals_list_summary?;
    # If the User can see the names of hidden items
    boolean? can_see_hidden_items_names?;
    # If the User can see other Users
    boolean? can_see_other_users?;
    # If the User can see other Users' statistics
    boolean? can_see_other_users_statistics?;
    # If the User can see security dashboard
    boolean? can_see_security_dashboard?;
    # If the User can share filters
    boolean? can_share_filters?;
    # If the User can share insights
    boolean? can_share_insights?;
    # If the User can use API
    boolean? can_use_api?;
    # If the User can use email tracking
    boolean? can_use_email_tracking?;
    # If the User can use import
    boolean? can_use_import?;
};

public type DeleteCallLogResponse200 record {
    # If the response is successful or not
    boolean? success?;
};

public type Searchdealsresponse200DataItemStage record {
    # The ID of the stage of the Deal
    int? id?;
    # The name of the stage of the Deal
    string? name?;
};

# The Person this Note is attached to
public type Getnotesresponse200Person record {
    # The name of the Person this Note is attached to
    string? name?;
};

public type Getassociatedfollowersresponse2001 record {
    # If the request was successful or not
    boolean? success?;
    # The array of followers
    Follower[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type GetPipelineResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Pipeline object
    record {} data?;
};

public type GetActivityTypesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of ActivityTypes
    Getactivitytypesresponse200Data[]? data?;
};

public type AddPersonFollowerRequest record {
    # ID of the user
    int? user_id;
};

public type Getactivitiesresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsUser? user?;
    Getactivitiesresponse200RelatedObjectsDeal? deal?;
    Getactivitiesresponse200RelatedObjectsPerson? person?;
    Getactivitiesresponse200RelatedObjectsOrganization? organization?;
};

public type GetDealsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Deals
    DealNonStrict[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getdealsresponse200RelatedObjects? related_objects?;
};

# The Organization which is associated with the Deal
public type Getdealsresponse200RelatedObjectsOrganization record {
    # The name of the Organization associated with the Deal
    string? name?;
    # The number of people connected with the Organization that is associated with the Deal
    int? people_count?;
    # The ID of the owner of the Organization that is associated with the Deal
    int? owner_id?;
    # The address of the Organization that is associated with the Deal
    string? address?;
    # If the associated Organization is activated or not
    boolean? active_flag?;
    # The CC email of the Organization associated with the Deal
    string? cc_email?;
};

public type Deleteorganizationsresponse200Data record {
    # The IDs of the Organizations that were deleted
    decimal[]? id?;
};

public type Deleteproductfieldsresponse200Data record {
    # Array of all the IDs of the deleted Product Fields
    int[]? id?;
};

public type AddStageRequest record {
    # Name of the Stage
    string? name;
    # The ID of the Pipeline to add Stage to.
    int? pipeline_id;
    # Deal success probability percentage. Used/shown when Deal weighted values are used
    int? deal_probability?;
    # Whether Deals in this stage can become rotten
    int? rotten_flag?;
    # The number of days the Deals not updated in this Stage would become rotten. Applies only if the `rotten_flag` is set.
    int? rotten_days?;
};

public type DeletePipelineResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletepipelineresponse200Data? data?;
};

public type Getpersonproductsresponse200DealIdDeal record {
    # The ID of the Deal
    int? id?;
    # The ID of the company
    int? company_id?;
    # The ID of the Deal creator
    int? creator_user_id?;
    # The ID of the User
    int? user_id?;
    # The ID of the Person associated with the Deal
    int? person_id?;
    # The ID of the Organization associated with the Deal
    int? org_id?;
    # The ID of the Deal stage
    int? stage_id?;
    # The title of the Deal
    string? title?;
    # The value of the Deal
    decimal? value?;
    # The currency associated with the Deal
    string? currency?;
    # The creation date and time of the Deal
    string? add_time?;
    # First creation date and time of the Deal
    string? first_add_time?;
    # The last updated date and time of the Deal
    string? update_time?;
    # The last updated date and time of the Deal stage
    string? stage_change_time?;
    # If the Deal is activated or not
    boolean? active?;
    # If the Deal is deleted or not
    boolean? deleted?;
    # The status of the Deal
    string? status?;
    # The success probability percentage of the Deal
    decimal? probability?;
    # The date of the next activity associated with the Deal
    string? next_activity_date?;
    # The time of the next activity associated with the Deal
    string? next_activity_time?;
    # The ID of the next activity associated with the Deal
    int? next_activity_id?;
    # The ID of the last activity associated with the Deal
    int? last_activity_id?;
    # The date of the last activity associated with the Deal
    string? last_activity_date?;
    # The reason for losing the Deal
    string? lost_reason?;
    # The visibility of the Deal
    string? visible_to?;
    # The date and time of closing the Deal
    string? close_time?;
    # The ID of pipeline associated with the Deal
    int? pipeline_id?;
    # The date and time of changing the Deal status as won
    string? won_time?;
    # The date and time of the first time changing the Deal status as won
    string? first_won_time?;
    # The date and time of changing the Deal status as lost
    string? lost_time?;
    # The number of Products associated with the Deal
    int? products_count?;
    # The number of Files associated with the Deal
    int? files_count?;
    # The number of Notes associated with the Deal
    int? notes_count?;
    # The number of Followers associated with the Deal
    int? followers_count?;
    # The number of emails associated with the Deal
    int? email_messages_count?;
    # The number of Activities associated with the Deal
    int? activities_count?;
    # The number of completed Activities associated with the Deal
    int? done_activities_count?;
    # The number of incomplete Activities associated with the Deal
    int? undone_activities_count?;
    # The number of Participants associated with the Deal
    int? participants_count?;
    # The expected close date of the Deal
    string? expected_close_date?;
    # The date and time of the last incoming email associated with the Deal
    string? last_incoming_mail_time?;
    # The date and time of the last outgoing email associated with the Deal
    string? last_outgoing_mail_time?;
    # The label assigned to the Deal
    string? label?;
};

public type WebhookResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The status of the response
    string? status?;
    Getwebhooksresponse200Data? data?;
};

public type Getactivitiesresponse200RelatedObjectsPerson record {
    # The ID of the Person associated with the item
    record {} PERSON_ID?;
};

public type Updatefieldrequest2 record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. All active items must be supplied and already existing items must have their ID supplied. New items only require a label. Example: `[{"id":123,"label":"Existing Item"},{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
};

public type ListPermittedUsersResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Listpermittedusersresponse200Data? data?;
};

public type GetMailThreadsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of mail threads
    BaseMailThread[]? data?;
};

public type Updatefieldrequest1 record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. All active items must be supplied and already existing items must have their ID supplied. New items only require a label. Example: `[{"id":123,"label":"Existing Item"},{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
};

public type Dealpersondatawithid1Email record {
    # The type of the email
    string? label?;
    # The email of the associated Person
    string? value?;
    # If this is the primary email or not
    boolean? primary?;
};

public type Fieldsresponse200Data record {
    # The ID of the Field. Value is `null` in case of subfields.
    int? id?;
    # The key of the Field. For custom fields this is generated upon creation.
    string? 'key?;
    # The name of the Field
    string? name?;
    # The order number of the Field
    int? order_nr?;
    record {} field_type?;
    # The creation time of the Field
    string? add_time?;
    # The update time of the Field
    string? update_time?;
    # The ID of the user who created or most recently updated the Field, only applicable for custom fields
    int? last_updated_by_user_id?;
    # The active flag of the Field
    boolean? active_flag?;
    # The edit flag of the Field
    boolean? edit_flag?;
    # Not used
    boolean? index_visible_flag?;
    # Not used
    boolean? details_visible_flag?;
    # Not used
    boolean? add_visible_flag?;
    # Not used
    boolean? important_flag?;
    # Whether or not the Field of an Item can be edited in bulk
    boolean? bulk_edit_allowed?;
    # Whether ot not Items can be searched by this Field
    boolean? searchable_flag?;
    # Whether or not Items can be filtered by this Field
    boolean? filtering_allowed?;
    # Whether or not Items can be sorted by this Field
    boolean? sortable_flag?;
    # Whether or not the Field is mandatory
    boolean? mandatory_flag?;
    # The options of the Field. When there are no options, `null` is returned.
    record {}[] options?;
    # The deleted options of the Field. Only present when there is at least 1 deleted option.
    record {}[] options_deleted?;
    # Whether or not the Field is a subfield of another Field. Only present if Field is subfield.
    boolean? is_subfield?;
    # Subfields of the Field. Only present when Field has subfields.
    record {}[] subfields?;
};

public type PersonCountEmailDealAndActivityInfo record {
    *PersonCountAndEmailInfo;
    *DealCountAndActivityInfo;
};

public type Searchitemresponse200Data record {
    # The array of found items
    Searchitemresponse200DataItems[]? items?;
    # The array of related items if `search_for_related_items` was enabled
    Searchitemresponse200DataItems[]? related_items?;
};

public type BaseOrganizationItem1 record {
    # The ID of the Organization
    int? id?;
    # The ID of the Company related to the Organization
    int? company_id?;
    record {*Owner1; *Owner2;} owner_id?;
    # The name of the Organization
    string? name?;
    # If the Organization is activated or not
    boolean? active_flag?;
    record {} picture_id?;
    # The country code of the Organization
    string? country_code?;
    # The first character of the Organization name
    string? first_char?;
    # The creation date and time of the Organization
    string? add_time?;
    # The last updated date and time of the Organization
    string? update_time?;
    # The visibility group ID of who can see the Organization
    string? visible_to?;
    # The ID of the label
    int? label?;
    # The name of the Organization owner
    string? owner_name?;
    # The CC email of the Organization
    string? cc_email?;
};

public type UpdateTeamWithAdditionalProperties record {
    *UpdateTeamRequest;
    # The Team creation time. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # ID of the User who created the Team
    int? created_by_user_id?;
};

public type OrganizationCountAndAddressInfo record {
    *OrganizationCountAndAddressInfo1;
    *OrganizationCountAndAddressInfo2;
};

public type AddPersonPictureResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The picture that is associated with the item
    Getorganizationsresponse200RelatedObjectsPicture? data?;
};

public type UserIds record {
    # If the response is successful or not
    boolean? success?;
    # List of User IDs
    int[]? data?;
};

public type GetOrganizationsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Organizations
    BaseOrganizationItem[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

# Picture ID
#
public type PictureId record {
    *PictureId1;
    *PictureId2;
};

public type Searchproductsresponse200DataItems record {
    # Search result relevancy
    decimal? result_score?;
    Searchproductsresponse200DataItem? item?;
};

# The Pipeline object
public type Getpipelinemovementstatisticsresponse200Data record {
    # Movements between Stages
    Getpipelinemovementstatisticsresponse200DataMovementsBetweenStages? movements_between_stages?;
    # Deals summary
    Getpipelinemovementstatisticsresponse200DataNewDeals? new_deals?;
    # Deals summary
    Getpipelinemovementstatisticsresponse200DataNewDeals? deals_left_open?;
    # Deals summary
    Getpipelinemovementstatisticsresponse200DataNewDeals? won_deals?;
    # Deals summary
    Getpipelinemovementstatisticsresponse200DataNewDeals? lost_deals?;
    # Moved Deals average age in days
    Getpipelinemovementstatisticsresponse200DataAverageAgeInDays? average_age_in_days?;
};

public type DeleteActivityTypesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteactivitytypesresponse200Data? data?;
};

public type Dealpersondatawithid1Phone record {
    # The type of the phone number
    string? label?;
    # The phone number of the Person associated with the Deal
    string? value?;
    # If this is the primary phone number or not
    boolean? primary?;
};

public type FieldsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Fieldsresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type ListPersonsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Persons
    PersonItem[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Listpersonsresponse200RelatedObjects? related_objects?;
};

# The File data
public type Getassociatedfilesresponse200Data record {
    # The ID of the File
    int? id?;
    # The ID of the User to associate the File with
    int? user_id?;
    # The ID of the Deal to associate the File with
    int? deal_id?;
    # The ID of the Person to associate the File with
    int? person_id?;
    # The ID of the Organization to associate the File with
    int? org_id?;
    # The ID of the Product to associate the File with
    int? product_id?;
    # The ID of the Activity to associate the File with
    int? activity_id?;
    # The date and time when the File was added/created. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # The last updated date and time of the File. Format: YYYY-MM-DD HH:MM:SS
    string? update_time?;
    # The original name of the File
    string? file_name?;
    # The size of the File
    string? file_size?;
    # Whether the User is active or not. false = Not activated, true = Activated
    boolean? active_flag?;
    # Whether the File was uploaded as inline or not
    boolean? inline_flag?;
    # The location type to send the File to. Only googledrive is supported at the moment.
    string? remote_location?;
    # The ID of the remote item
    string? remote_id?;
    # The ID of the inline attachment
    string? cid?;
    # The location of the cloud storage
    string? s3_bucket?;
    # The ID of the mail message to associate the File with
    string? mail_message_id?;
    # The ID of the mail template to associate the File with
    string? mail_template_id?;
    # The name of the Deal associated with the File
    string? deal_name?;
    # The name of the Person associated with the File
    string? person_name?;
    # The name of the Organization associated with the File
    string? org_name?;
    # The name of the Product associated with the File
    string? product_name?;
    # The URL of the download File
    string? url?;
    # The visible name of the File
    string? name?;
    # The description of the File
    string? description?;
};

# The additional data of the list
public type Fieldsresponse200AdditionalData record {
    # Pagination start
    int? 'start?;
    # Items shown per page
    int? 'limit?;
    # If there are more list items in the collection than displayed or not
    boolean? more_items_in_collection?;
};

public type Getgoalresultresponse200Data record {
    # Numeric progress of the goal
    int? progress?;
    Addorupdategoalresponse200DataGoal? goal?;
};

public type DeleteGoalResponse200 record {
    # If the request was successful or not
    boolean? success?;
};

public type DealNonStrict record {
    *DealNonStrict1;
    *BaseDeal;
};

public type Deleteorganizationfollowerresponse200Data record {
    # The ID of the follower that was deleted from the Organization
    int? id?;
};

public type DeleteOrganizationFollowerResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deleteorganizationfollowerresponse200Data? data?;
};

# Updated Stage object
public type Stageresponse200Data record {
    # The ID of the Stage
    int? id?;
    # Defines the order of the Stage
    int? order_nr?;
    # The name of the Stage
    string? name?;
    # If the Stage is active or deleted
    boolean? active_flag?;
    # The Deal success probability percentage. Used/shown when the Deal weighted values are used.
    int? deal_probability?;
    # The ID of the Pipeline to add the Stage to
    int? pipeline_id?;
    # Whether Deals in this Stage can become rotten
    int? rotten_flag?;
    # The number of days the Deals are not updated in this Stage would become rotten. Applies only if the `rotten_flag` is set.
    int? rotten_days?;
    # The Stage creation time. Format: YYYY-MM-DD HH:MM:SS.
    string? add_time?;
    # The Stage update time. Format: YYYY-MM-DD HH:MM:SS.
    string? update_time?;
};

public type Mergeorganizationsresponse200Data record {
    # The ID of the merged Organization
    int? id?;
};

public type Findproductsbynameresponse200Data record {
    # The ID of the Product
    int? id?;
    # The ID of the price variation of the Product
    string? variation_id?;
    # The name of the Product
    string? name?;
    # The title of the Product
    string? title?;
    # The name of the price variation of the Product
    string? variation_name?;
    # The value corresponding to the Product price
    decimal? price?;
    # The Product price with the currency format
    string? price_formatted?;
};

public type AddPersonResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
    Listproductsresponse200RelatedObjects? related_objects?;
};

public type SearchProductsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Searchproductsresponse200Data? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type ProductProduct record {
    # The ID of the product
    decimal? id?;
    # The name of the product
    string? name?;
    # Product code
    string? code?;
    # The unit in which this product is sold
    string? unit?;
    # Tax percentage
    decimal? tax?;
    # Whether this product is active or not
    decimal? active_flag?;
    # Whether this product is selected in Deals or not
    decimal? selectable?;
    # Visibility of the product
    record {} visible_to?;
    # Information about the Pipedrive User who owns the product
    record {} owner_id?;
    # Object of objects, each containing: currency (string), price (number), cost (number, optional), overhead_cost (number, optional)
    record {} prices?;
};

public type AddOrganizationRelationshipResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Addorganizationrelationshipresponse200Data? data?;
    Getorganizationrelationshipsresponse200RelatedObjects? related_objects?;
};

public type GetPermissionSetsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Permission Set
    Getpermissionsetsresponse200Data[]? data?;
};

public type DeleteRoleAssignment record {
    # ID of the user
    int? user_id;
};

public type GetNoteFieldsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getnotefieldsresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type AddRoleAssignmentRequest record {
    # ID of the user
    int? user_id;
};

public type GetStagesResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Stages
    Stages[]? data?;
};

public type Deletedealfollowerresponse200Data record {
    # The ID of the Deal Follower that was deleted
    int? id?;
};

public type AddUserRoleAssignmentRequest record {
    # ID of the role
    int? role_id;
};

# The assignment data of the Role
#
public type RoleAssignment record {
    *BaseRoleRequest;
    *RoleAssignment1;
};

public type GetDealParticipantsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Participants
    PersonItem[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getdealsresponse200RelatedObjects? related_objects?;
};

public type Listpermittedusersresponse200Data record {
    # The list of permitted Users IDs
    int[]? id?;
};

# Parameters that accompany the goal type
public type GoalTypeParams record {
    # Pipeline ID of the goal
    string? pipeline_id?;
};

public type AddTeamRequest record {
    # The Team name
    string? name;
    # The Team description
    string? description?;
    # The Team manager ID
    int? manager_id;
    # List of User IDs
    int[]? users?;
};

public type AddRoleResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Addroleresponse200Data? data?;
};

public type AddOrganizationRelationshipRequest record {
    # ID of the base organization for the returned calculated values
    int? org_id?;
    # The type of organization relationship
    string? 'type?;
    # The owner of this relationship. If type is `parent`, then the owner is the parent and the linked organization is the daughter.
    int? rel_owner_org_id?;
    # The linked organization in this relationship. If type is `parent`, then the linked organization is the daughter.
    int? rel_linked_org_id?;
};

public type GetAssociatedUpdatesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getassociatedupdatesresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getassociatedupdatesresponse200RelatedObjects? related_objects?;
};

public type GetUserPermissionsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getuserpermissionsresponse200Data? data?;
};

public type GetAssociatedFilesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Files
    Getassociatedfilesresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type Deleteactivitytypesresponse200Data record {
    # The IDs of deleted ActivityTypes
    int[]? id?;
};

public type DealCountAndActivityInfo1 record {
    # The count of open Deals related with the item
    int? open_deals_count?;
    # The count of related open Deals related with the item
    int? related_open_deals_count?;
    # The count of closed Deals related with the item
    int? closed_deals_count?;
    # The count of related closed Deals related with the item
    int? related_closed_deals_count?;
    # The count of won Deals related with the item
    int? won_deals_count?;
    # The count of related won Deals related with the item
    int? related_won_deals_count?;
    # The count of lost Deals related with the item
    int? lost_deals_count?;
    # The count of related lost Deals related with the item
    int? related_lost_deals_count?;
};

public type Addorupdategoalresponse200DataGoal record {
    # ID of the goal
    string? id?;
    # ID of the creator of the goal
    string? owner_id?;
    # The title of the goal
    string? title?;
    # Type of the goal
    GoalType? 'type?;
    # Who is the goal assigned to
    GoalAssignee? assignee?;
    # Interval of the goal
    string? interval?;
    # Duration of the goal
    GoalDuration? duration?;
    # Expected outcome of the goal
    GoalExpectedOutcome? expected_outcome?;
    # If the goal is currently active or not
    boolean? is_active?;
    # The IDs of the reports that belong to the goal
    int[]? report_ids?;
};

public type DealCountAndActivityInfo2 record {
    # The date of the next activity associated with the Deal
    string? next_activity_date?;
    # The time of the next activity associated with the Deal
    string? next_activity_time?;
    # The ID of the next activity associated with the Deal
    int? next_activity_id?;
    # The ID of the last activity associated with the Deal
    int? last_activity_id?;
    # The date of the last activity associated with the Deal
    string? last_activity_date?;
};

public type ActivityResponseObject1 record {
    # Due date of the Activity. Format: YYYY-MM-DD
    string? due_date?;
    # Due time of the Activity in UTC. Format: HH:MM
    string? due_time?;
    # Duration of the Activity. Format: HH:MM
    string? duration?;
    # The ID of the Deal this Activity is associated with
    int? deal_id?;
    # The ID of the Person this Activity is associated with
    int? person_id?;
    # The ID of the Organization this Activity is associated with
    int? org_id?;
    # Note of the Activity (HTML format)
    string? note?;
    # The address of the Activity. Pipedrive will automatically check if the location matches a geo-location on Google maps.
    string? location?;
    # Additional details about the Activity that is synced to your external calendar. Unlike the note added to the Activity, the description is publicly visible to any guests added to the Activity.
    string? public_description?;
};

public type ActivityResponseObject2 record {
    # The Activity ID, generated when the Activity was created
    int? id?;
    # Whether the Activity is done or not
    boolean? done?;
    # Subject of the Activity
    string? subject?;
    # Type of the Activity. This is in correlation with the `key_string` parameter of ActivityTypes.
    string? 'type?;
    # The ID of the User whom the Activity is assigned to
    int? user_id?;
    # List of multiple Persons (participants) this Activity is associated with
    record {}[]? participants?;
    # Marks if the Activity is set as 'Busy' or 'Free'. If the flag is set to `true`, your customers will not be able to book that time slot through any Scheduler links. The flag can also be unset. When the value of the flag is unset (`null`), the flag defaults to 'Busy' if it has a time set, and 'Free' if it is an all-day event without specified time.
    boolean? busy_flag?;
    # Attendees of the Activity. This can be either your existing Pipedrive contacts or an external email address.
    record {}[]? attendees?;
    # The User's company ID
    int? company_id?;
    # If the Activity references some other object, it is indicated here. For example, value `Salesphone` refers to Activities created with Caller.
    string? reference_type?;
    # Together with the `reference_type`, gives the ID of the other object
    int? reference_id?;
    # The ID of Marketplace app, which is connected to this Activity
    string? conference_meeting_client?;
    # The link to join the meeting which is associated with this Activity
    string? conference_meeting_url?;
    # The meeting ID of the meeting provider (Zoom, MS Teams etc.) that is associated with this Activity
    string? conference_meeting_id?;
    # The creation date and time of the Activity in UTC. Format: YYYY-MM-DD HH:MM:SS.
    string? add_time?;
    # The date and time this Activity was marked as done. Format: YYYY-MM-DD HH:MM:SS.
    string? marked_as_done_time?;
    # The date and time of latest notifications sent about this Activity to the participants or the attendees of this Activity
    string? last_notification_time?;
    # The ID of the User who triggered the sending of the latest notifications about this Activity to the participants or the attendees of this Activity
    int? last_notification_user_id?;
    # The ID of the language the notifications are sent in
    int? notification_language_id?;
    # The ID of the Lead in the UUID format this Activity is associated with
    string? lead_id?;
    # Whether the Activity is active or not
    boolean? active_flag?;
    # The last update date and time of the Activity. Format: YYYY-MM-DD HH:MM:SS.
    string? update_time?;
    # The ID of the User who was the last to update this Activity
    int? update_user_id?;
    # For the Activity which syncs to Google calendar, this is the Google event ID. NB! This field is related to old Google calendar sync and will be deprecated soon.
    string? gcal_event_id?;
    # The Google calendar ID that this Activity syncs to. NB! This field is related to old Google calendar sync and will be deprecated soon.
    string? google_calendar_id?;
    # The Google calendar API etag (version) that is used for syncing this Activity. NB! This field is related to old Google calendar sync and will be deprecated soon.
    string? google_calendar_etag?;
    # For Activities that sync to an external calendar, this setting indicates if the Activity syncs with context (what are the Deals, Persons, Organizations this Activity is related to)
    string? calendar_sync_include_context?;
    # The timezone the Activity was created in an external calendar
    string? source_timezone?;
    # The rule for the recurrence of the Activity. Is important for activities synced into Pipedrive from an external calendar. Example: "RRULE:FREQ=WEEKLY;BYDAY=WE"
    string? rec_rule?;
    # Additional rules for the recurrence of the Activity, extend the `rec_rule`. Is important for activities synced into Pipedrive from an external calendar.
    string? rec_rule_extension?;
    # The ID of parent Activity for a recurrent Activity if the current Activity is an exception to recurrence rules
    int? rec_master_activity_id?;
    # The list of recurring Activity instances. It is in a structure as follows: `[{due_date: "2020-06-24", due_time: "10:00:00"}]`
    record {}[]? series?;
    # The ID of the User who created the Activity
    int? created_by_user_id?;
    # Subfield of location field. Indicates apartment/suite number.
    string? location_subpremise?;
    # Subfield of location field. Indicates house number.
    string? location_street_number?;
    # Subfield of location field. Indicates street name.
    string? location_route?;
    # Subfield of location field. Indicates district/sublocality.
    string? location_sublocality?;
    # Subfield of location field. Indicates city/town/village/locality.
    string? location_locality?;
    # Subfield of location field. Indicates state/county.
    string? location_admin_area_level_1?;
    # Subfield of location field. Indicates region.
    string? location_admin_area_level_2?;
    # Subfield of location field. Indicates country.
    string? location_country?;
    # Subfield of location field. Indicates ZIP/postal code.
    string? location_postal_code?;
    # Subfield of location field. Indicates full/combined address.
    string? location_formatted_address?;
    # Subfield of location field. Indicates latitude.
    decimal? location_lat?;
    # Subfield of location field. Indicates longitude.
    decimal? location_long?;
    # Name of the Organization this Activity is associated with
    string? org_name?;
    # Name of the Person this Activity is associated with
    string? person_name?;
    # Name of the Deal this Activity is associated with
    string? deal_title?;
    # Name of the User this Activity is owned by
    string? owner_name?;
    # The bcc email address of the Person
    string? person_dropbox_bcc?;
    # The bcc email address of the Deal
    string? deal_dropbox_bcc?;
    # The ID of the User to whom the Activity is assigned to. Equal to `user_id`.
    int? assigned_to_user_id?;
    # The file that is attached to this Activity. For example, this can be a reference to an audio note file generated with Pipedrive mobile app.
    record {}? file?;
};

public type Searchdealsresponse200DataItemOrganization record {
    # The ID of the Organization the Deal is associated with
    int? id?;
    # The name of the Organization the Deal is associated with
    string? name?;
};

public type DeleteFileResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletefileresponse200Data? data?;
};

# The additional data in the Role
public type Getroleresponse200AdditionalData record {
    # The settings for the Role
    Getroleresponse200AdditionalDataSettings? settings?;
};

# The response data
public type Addorupdaterolesettingresponse200Data record {
    # The ID of the Role
    int? id?;
    # The setting
    decimal? deal_default_visibility?;
};

public type UpdatePersonResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
    Listproductsresponse200RelatedObjects? related_objects?;
};

public type Paymentresponse200DataItems record {
    # The ID of the Payment
    int? id?;
    # The ID of the Subscription this Payment is associated with
    int? subscription_id?;
    # The ID of the Deal this Payment is associated with
    int? deal_id?;
    # The Payment status
    boolean? is_active?;
    # The Payment amount
    float? amount?;
    # The currency of the Payment
    string? currency?;
    # Difference between the amount of the current Payment and the previous Payment. The value can be either positive or negative.
    float? change_amount?;
    # Date when Payment occurs
    string? due_at?;
    # Represents the movement of revenue in comparison with the previous Payment. Possible values are: `New` - first Payment of the subscription. `Recurring` - no movement. `Expansion` - current Payment amount > previous Payment amount. `Contraction` - current Payment amount < previous Payment amount. `Churn` - last Payment of the subscription.
    string? revenue_movement_type?;
    # The type of the Payment. Possible values are: `Recurring` - payments occur over fixed intervals of time, `Additional` - extra payment not the recurring payment of the recurring subscription, `Installment` - payment of the installment subscription.
    string? payment_type?;
    # The description of the Payment
    string? description?;
    # The creation time of the Payment
    string? add_time?;
    # The update time of the Payment
    string? update_time?;
};

public type UpdateOrganizationRelationshipResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Addorganizationrelationshipresponse200Data? data?;
    Getorganizationrelationshipsresponse200RelatedObjects? related_objects?;
};

# The creator of the Deal
public type DealCreator record {
    # The ID of the Deal creator
    int? id?;
    # The name of the Deal creator
    string? name?;
    # The email of the Deal creator
    string? email?;
    # If the creator has a picture or not
    boolean? has_pic?;
    # The creator picture hash
    string? pic_hash?;
    # If the creator is activated or not
    boolean? active_flag?;
    # The ID of the Deal creator
    int? value?;
};

public type PaymentResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Paymentresponse200Data? data?;
};

public type PictureId1 record {
    # The ID of the picture associated with the item
    int? id?;
};

public type PictureId2 record {
    # The type of item the picture is related to
    string? item_type?;
    # The ID of related item
    int? item_id?;
    # If the associated picture is activated or not
    boolean? active_flag?;
    # The add time of the picture
    string? add_time?;
    # The update time of the picture
    string? update_time?;
    # The ID of the User who added the picture
    int? added_by_user_id?;
    Pictures? pictures?;
};

public type Deletefiltersresponse200Data record {
    # The array of the IDs of the deleted filter
    int[]? id?;
};

public type BasePipelineWithSelectedFlag record {
    *Pipeline1;
    *Pipeline2;
};

public type DeleteFieldsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletefieldsresponse200Data? data?;
};

public type Adddealfollowerresponse200Data record {
    # The User ID who added the Follower
    int? user_id?;
    # The Follower ID
    int? id?;
    # The ID of the Deal which the Follower was added to
    int? deal_id?;
    # The date and time when the Deal Follower was added
    string? add_time?;
};

public type BaseResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The status of the response
    string? status?;
};

public type Searchpersonsresponse200DataItemOwner record {
    # The ID of the owner of the Person
    int? id?;
};

public type GetRecentsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}|record {}[] data?;
    Getrecentsresponse200AdditionalData? additional_data?;
};

# The Global Message data
public type Getglobalmessagesresponse200Data record {
    # The ID of the Global Message
    int? id?;
    # The ID of the User related to the Global Message
    int? user_id?;
    # The ID of the Company related to the Global Message
    int? company_id?;
    # The Global Message type info
    Getglobalmessagesresponse200TypeInfo? type_info?;
    # The User data for the Global Message (such as `user_id`, `name`, `email`, `phone`)
    record {} user_data?;
    # HTML for each returned Global Message to render views
    string? html?;
};

public type UpdateStageRequest record {
    # Name of the Stage
    string? name?;
    # The ID of the Pipeline to add Stage to.
    int? pipeline_id?;
    # Deal success probability percentage. Used/shown when Deal weighted values are used
    int? deal_probability?;
    # Whether Deals in this stage can become rotten
    int? rotten_flag?;
    # The number of days the Deals not updated in this Stage would become rotten. Applies only if the `rotten_flag` is set.
    int? rotten_days?;
    # An order number for this stage. Order numbers should be used to order the stages in the pipeline.
    int? order_nr?;
};

public type AddOrUpdateRoleSettingRequest record {
    string? setting_key;
    # Possible values for `default_visibility` settings: `1`, `3`, `5` or `7`
    decimal? value;
};

public type User2 record {
    # The User company ID
    int? company_id?;
    # The User company name
    string? company_name?;
    # The User company domain
    string? company_domain?;
    # The User company country
    string? company_country?;
    # The User company industry
    string? company_industry?;
    # The User language details
    User2Language? language?;
};

public type User1 record {
    # The User ID
    int? id?;
    # The User name
    string? name?;
    # The User default currency
    string? default_currency?;
    # The User locale
    string? locale?;
    # The User language ID
    int? lang?;
    # The User email
    string? email?;
    # The User phone
    string? phone?;
    # Boolean that indicates if the User is activated
    boolean? activated?;
    # The User last login date and time. Format: YYYY-MM-DD HH:MM:SS
    string? last_login?;
    # The User creation date and time. Format: YYYY-MM-DD HH:MM:SS
    string? created?;
    # The User last modification date and time. Format: YYYY-MM-DD HH:MM:SS
    string? modified?;
    # The variation of signup flow (if exists). E.g. google
    string? signup_flow_variation?;
    # Boolean that indicates if the User has created a Company
    boolean? has_created_company?;
    # Indication if the User is admin (1 = true, 0 = false)
    record {} is_admin?;
    # Boolean that indicates if the User is activated
    boolean? active_flag?;
    # The User timezone name
    string? timezone_name?;
    # The User timezone offset
    string? timezone_offset?;
    # The ID of the User role
    int? role_id?;
    # The User icon URL
    string? icon_url?;
    # Boolean that indicates if the requested User is the same which is logged in (in this case, always true)
    boolean? is_you?;
};

public type Postfilterresponse200Data record {
    # The ID of the created filter
    int? id?;
    # The name of the created filter
    string? name?;
    # The activity flag of the created filter
    boolean? active_flag?;
    string? 'type?;
    # If the created filter is temporary or not
    boolean? temporary_flag?;
    # The User ID of the created filter
    int? user_id?;
    # The add time of the created filter
    string? add_time?;
    # The update time of the created filter
    string? update_time?;
    # The visibility group ID of the created filter
    int? visible_to?;
    # The custom view ID of the created filter
    int? custom_view_id?;
    # The created filter conditions object
    record {} conditions?;
};

public type BaseMailThread1 record {
    # ID of the mail thread
    int? id?;
    # The connection account ID
    string? account_id?;
    # ID of the user whom mail message will be assigned to
    int? user_id?;
    # The subject
    string? subject?;
    # A snippet
    string? snippet?;
    # Whether the mail thread is read
    record {} read_flag?;
    # Mail tracking status
    string? mail_tracking_status?;
    # Whether the mail thread has an attachment
    record {} has_attachments_flag?;
    # Whether the mail thread has inline attachments
    record {} has_inline_attachments_flag?;
    # Whether the mail thread has real attachments (which are not inline)
    record {} has_real_attachments_flag?;
    # Whether the mail thread is deleted
    record {} deleted_flag?;
    # Whether the mail thread is synced
    record {} synced_flag?;
    # Whether one of the parties of the mail thread is Bcc
    record {} smart_bcc_flag?;
    # Whether the link tracking of the mail thread is enabled
    record {} mail_link_tracking_enabled_flag?;
    # We strongly advise you to avoid the use of this property. We will soon deprecate this property
    boolean? write_flag?;
};

public type AddOrUpdateProductFieldResponse200 record {
    # Name of the field
    string? name;
    # When field_type is either set or enum, possible options on update must be supplied as an array of objects each containing id and label, for example: [{"id":1, "label":"red"},{"id":2, "label":"blue"},{"id":3, "label":"lilac"}]
    record {}[] options?;
};

public type DuplicateDealResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Deal object
    DealStrict? data?;
};

public type MailMessageResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The email service specific status code and it is returned through the response body.
    int? statusCode?;
    # The status text of the response.
    string? statusText?;
    # The service name of the response.
    string? 'service?;
    Mailmessageresponse200Data? data?;
};

public type DeleteDealProductResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletedealproductresponse200Data? data?;
};

public type AddProductFollowerRequest record {
    # ID of the user
    int? user_id;
};

public type Listproductsresponse200Data record {
    # The array of Products
    Product[]? items?;
};

public type DealsCountAndActivityInfo1 record {
    # The count of open Deals related with the item
    int? open_deals_count?;
    # The count of related open Deals related with the item
    int? related_open_deals_count?;
    # The count of closed Deals related with the item
    int? closed_deals_count?;
    # The count of related closed Deals related with the item
    int? related_closed_deals_count?;
    # The count of won Deals related with the item
    int? won_deals_count?;
    # The count of related won Deals related with the item
    int? related_won_deals_count?;
    # The count of lost Deals related with the item
    int? lost_deals_count?;
    # The count of related lost Deals related with the item
    int? related_lost_deals_count?;
};

public type AddFilterRequest record {
    # The name of the filter
    string? name;
    # The conditions of the filter as a JSON object. It requires a minimum structure as follows: {"glue":"and","conditions":[{"glue":"and","conditions": [CONDITION_OBJECTS]},{"glue":"or","conditions":[CONDITION_OBJECTS]}]}. Replace CONDITION_OBJECTS with JSON objects of the following structure: {"object":"","field_id":"", "operator":"","value":"", "extra_value":""} or leave the array empty. Depending on the object type you should use another API endpoint to get field_id. There are five types of objects you can choose from: "person", "deal", "organization", "product", "activity" and you can use these types of operators depending on what type of a field you have: "IS NOT NULL", "IS NULL", "<=", ">=", "<", ">", "!=", "=", "LIKE '%$%'", "NOT LIKE '%$%'", "LIKE '$%'", "NOT LIKE '$%'", "LIKE '%$'", "NOT LIKE '%$'". To get a better understanding of how filters work try creating them directly from the Pipedrive application.
    record {} conditions;
    # The type of filter to create
    record {} 'type;
};

public type Deletepersonsresponse200Data record {
    # The list of deleted Persons IDs
    int[]? id?;
};

public type DealsCountAndActivityInfo2 record {
    # The date of the next activity associated with the Deal
    string? next_activity_date?;
    # The time of the next activity associated with the Deal
    string? next_activity_time?;
    # The ID of the next activity associated with the Deal
    int? next_activity_id?;
    # The ID of the last activity associated with the Deal
    int? last_activity_id?;
    # The date of the last activity associated with the Deal
    string? last_activity_date?;
};

# Member of a thread
public type Basemailthread2PartiesTo record {
    # ID of the mail thread participant
    int? id?;
    # Name of the mail thread participant
    string? name?;
    # Whether the mail thread participant was last to send an email
    boolean? latest_sent?;
    # Email address of the mail thread participant
    string? email_address?;
    # Message time
    decimal? message_time?;
    # ID of the linked person
    int? linked_person_id?;
    # Email of the linked person
    string? linked_person_name?;
    # ID of the mail message party
    int? mail_message_party_id?;
    # Linked Organization ID
    int? linked_organization_id?;
};

public type Deleteactivityresponse200Data record {
    # The ID of the Activity that was deleted
    int? id?;
};

public type Paymentresponse200Data record {
    Paymentresponse200DataItems[]? items?;
};

public type AddOrganizationFollowerRequest record {
    # The ID of the user
    int? user_id;
};

public type AddActivityResponse200 record {
    boolean? success?;
    ActivityResponseObjectData? data?;
    Addactivityresponse200AdditionalData? additional_data?;
    Addactivityresponse200RelatedObjects? related_objects?;
};

public type GetAssociatedActivitiesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Activities
    ActivityResponseObjectData[]? data?;
    ActivityDistributionDataWithAdditionalData? additional_data?;
};

public type BaseOrganizationItemWithEditNameFlagData record {
    *BaseOrganizationItem;
    # If the company ID of the Organization and company ID of the request is same or not
    boolean? edit_name?;
};

public type BaseOrganizationItem record {
    *BaseOrganizationItem1;
    *AdditionalBaseOrganizationItemInfo;
};

public type Stages record {
    *Stages1;
    *Stages2;
};

public type OneLeadResponse200 record {
    boolean? success?;
    Getleadsresponse200Data? data?;
};

# The details of the sub-role
#
public type SubRole record {
    *BaseRoleRequest;
    *SubRole1;
};

public type DeleteFieldResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletefieldresponse200Data? data?;
};

public type GetFilesResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of all uploaded files
    Getassociatedfilesresponse200Data[]? data?;
    Getfilesresponse200AdditionalData? additional_data?;
};

public type OrganizationCountAndAddressInfo2 record {
    # The full address of the Organization
    string? address?;
    # The sub-premise of the Organization location
    string? address_subpremise?;
    # The street number of the Organization location
    string? address_street_number?;
    # The route of the Organization location
    string? address_route?;
    # The sub-locality of the Organization location
    string? address_sublocality?;
    # The locality of the Organization location
    string? address_locality?;
    # The level 1 admin area of the Organization location
    string? address_admin_area_level_1?;
    # The level 2 admin area of the Organization location
    string? address_admin_area_level_2?;
    # The country of the Organization location
    string? address_country?;
    # The postal code of the Organization location
    string? address_postal_code?;
    # The formatted Organization location
    string? address_formatted_address?;
};

public type DeleteStagesResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletestagesresponse200Data? data?;
};

public type OrganizationCountAndAddressInfo1 record {
    # The count of email messages related to the Organization
    int? email_messages_count?;
    # The count of Persons related to the Organization
    int? people_count?;
    # The count of Activities related to the Organization
    int? activities_count?;
    # The count of done Activities related to the Organization
    int? done_activities_count?;
    # The count of undone Activities related to the Organization
    int? undone_activities_count?;
    # The count of files related to the Organization
    int? files_count?;
    # The count of notes related to the Organization
    int? notes_count?;
    # The count of followers related to the Organization
    int? followers_count?;
};

# The follower that is associated with the item
public type Getorganizationresponse200AdditionalDataFollowers record {
    # The user ID of the follower
    record {} FOLLOWER_USER_ID?;
};

public type AddOrganizationFollowerResponse200 record {
    # If the request was successful or not
    boolean? success?;
    OrganizationFollower? data?;
};

public type Getdealactivitiesresponse200RelatedObjects record {
    Addactivityresponse200RelatedObjectsOrganization? organization?;
    Addactivityresponse200RelatedObjectsPerson? person?;
    Getactivitiesresponse200RelatedObjectsDeal? deal?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
};

public type AddLeadRequest record {
    # The name of the Lead
    string? title;
    # The ID of the User which will be the owner of the created Lead. If not provided, the user making the request will be used.
    int? owner_id?;
    # The IDs of the Lead Labels which will be associated with the Lead
    string[]? label_ids?;
    # The ID of a Person which this Lead will be linked to. If the Person does not exist yet, it needs to be created first. This property is required unless `organization_id` is specified.
    int? person_id?;
    # The ID of an Organization which this Lead will be linked to. If the Organization does not exist yet, it needs to be created first. This property is required unless `person_id` is specified.
    int? organization_id?;
    # The potential value of the Lead.
    LeadsValue? value?;
    # The date of when the Deal which will be created from the Lead is expected to be closed. In ISO 8601 format: YYYY-MM-DD.
    string? expected_close_date?;
    # Visibility of the Lead. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # A flag indicating whether the Lead was seen by someone in the Pipedrive UI
    boolean? was_seen?;
};

public type Searchproductsresponse200DataItemOwner record {
    # The ID of the owner of the Product
    int? id?;
};

public type Usersresponse200Data record {
    # The User ID
    int? id?;
    # The User name
    string? name?;
    # The User default currency
    string? default_currency?;
    # The User locale
    string? locale?;
    # The User language ID
    int? lang?;
    # The User email
    string? email?;
    # The User phone
    string? phone?;
    # Boolean that indicates if the User is activated
    boolean? activated?;
    # The User last login date and time. Format: YYYY-MM-DD HH:MM:SS
    string? last_login?;
    # The User creation date and time. Format: YYYY-MM-DD HH:MM:SS
    string? created?;
    # The User last modification date and time. Format: YYYY-MM-DD HH:MM:SS
    string? modified?;
    # The variation of signup flow (if exists). E.g. google
    string? signup_flow_variation?;
    # Boolean that indicates if the User has created a Company
    boolean? has_created_company?;
    # Indication if the User is admin (1 = true, 0 = false)
    record {} is_admin?;
    # Boolean that indicates if the User is activated
    boolean? active_flag?;
    # The User timezone name
    string? timezone_name?;
    # The User timezone offset
    string? timezone_offset?;
    # The ID of the User role
    int? role_id?;
    # The User icon URL
    string? icon_url?;
    # Boolean that indicates if the requested User is the same which is logged in (in this case, always true)
    boolean? is_you?;
};

public type GetAllMailMessagesOfMailThreadResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of the mail messages of the mail thread
    MailMessages[]? data?;
};

public type SearchPersonsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Searchpersonsresponse200Data? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type SearchOrganizationResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Searchorganizationresponse200Data? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type Getrecentsresponse200AdditionalData record {
    # Timestamp in UTC. Format: YYYY-MM-DD HH:MM:SS
    string? since_timestamp?;
    # Timestamp in UTC. Format: YYYY-MM-DD HH:MM:SS
    string? last_timestamp_on_page?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? pagination?;
};

public type LeadIdResponse200 record {
    boolean? success?;
    Leadidresponse200Data? data?;
};

public type Getgoalsresponse200Data record {
    Goal[]? goals?;
};

public type Searchorganizationresponse200Data record {
    # The array of found items
    Searchorganizationresponse200DataItems[]? items?;
};

public type Leadidresponse200Data record {
    string? id?;
};

public type OrganizationRelationshipWithCalculatedFields2 record {
    # The calculated type of the Relationship with the linked Organization
    string? calculated_type?;
    # The ID of the linked Organization
    int? calculated_related_org_id?;
};

public type OrganizationRelationshipWithCalculatedFields1 record {
    # The ID of the Organization Relationship
    int? id?;
    # The type of the Relationship
    string? 'type?;
    record {} rel_owner_org_id?;
    record {} rel_linked_org_id?;
    # The creation date and time of the Relationship
    string? add_time?;
    # The last updated date and time of the Relationship
    string? update_time?;
    # If the Relationship is active or not
    string? active_flag?;
};

public type UpdateFileRequest record {
    # Visible name of the file
    string? name?;
    # Description of the file
    string? description?;
};

public type UpdateRecurringSubscriptionRequest record {
    # Description of the Recurring Subscription
    string? description?;
    # Amount of each payment
    int? cycle_amount?;
    # Array of additional payments. It requires a minimum structure as follows: [{ amount:SUM, description:DESCRIPTION, due_at:PAYMENT_DATE }]. Replace SUM with a payment amount, DESCRIPTION with an explanation string, PAYMENT_DATE with a date (format YYYY-MM-DD).
    record {}[] payments?;
    # Indicates that the Deal value must be set to Recurring Subscription's MRR value
    boolean? update_deal_value?;
    # All payments after that date will be affected. Format: YYYY-MM-DD
    string? effective_date;
};

public type AddUserRequest record {
    # Name of the user
    string? name;
    # Email of the user
    string? email;
    # Whether the user is active or not. `false` = Not activated, `true` = Activated
    boolean? active_flag;
};

public type AddLeadLabelRequest record {
    # The name of the Lead Label
    string? name;
    # The color of the label. Only a subset of colors can be used.
    string? color;
};

public type ResponseCallLogObject record {
    *AddCallLogRequest;
    *ResponseCallLogObject1;
};

public type DeleteTeamUserRequest record {
    # List of User IDs
    int[]? users;
};

public type Getfilesresponse200AdditionalData record {
    # Pagination details of the list
    record {} pagination?;
};

public type DeleteGlobalMessageResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The Global Message data
    Getglobalmessagesresponse200Data? data?;
    # The total time of the controller processing
    decimal? handle_time?;
    # The list of timers formatted by name and elapsed time in ms (such as `app`, `app_xss_clean`, `db_connect`)
    record {} _req_time_ctx_ms?;
};

public type Noterequest1 record {
    # Content of the note in HTML format. Subject to sanitization on the back-end.
    string? content;
    # ID of the user who will be marked as the author of this note. Only an admin can change the author.
    int? user_id?;
    # The ID of the lead the note will be attached to
    string? lead_id?;
    # The ID of the deal the note will be attached to
    int? deal_id?;
    # The ID of the person this note will be attached to
    int? person_id?;
    # The ID of the organization this note will be attached to
    int? org_id?;
    # Optional creation date & time of the Note in UTC. Can be set in the past or in the future. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # If set, then results are filtered by note to lead pinning state (`lead_id` is also required)
    record {} pinned_to_lead_flag?;
    # If set, then results are filtered by note to deal pinning state (`deal_id` is also required).
    record {} pinned_to_deal_flag?;
    # If set, then results are filtered by note to organization pinning state (`org_id` is also required).
    record {} pinned_to_organization_flag?;
    # If set, then results are filtered by note to person pinning state (`person_id` is also required).
    record {} pinned_to_person_flag?;
};

public type ProductField record {
    *ProductField1;
    *ProductField2;
};

public type GetCurrenciesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Currencies
    Getcurrenciesresponse200Data[]? data?;
};

public type Searchorganizationresponse200DataItems record {
    # Search result relevancy
    decimal? result_score?;
    Searchorganizationresponse200DataItem? item?;
};

public type SinglePermissionSetResponse200 record {
    # The ID of User Permission Set
    int? id?;
    # The name of Permission Set
    string? name?;
    # The number of Users assigned to this Permission Set
    int? assignment_count?;
    # A permission assigned to this Permission Set
    string[]? contents?;
};

public type RelationshipOrganizationInfoItemWithActiveFlag2 record {
    # If the associated Organization is active or not
    boolean? active_flag?;
};

public type GetCommentsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Comments
    Getcommentsresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type Deleteproductfieldresponse200Data record {
    # The ID of the deleted Product Field
    record {} id?;
};

public type RelationshipOrganizationInfoItemWithActiveFlag1 record {
    *RelationshipOrganizationInfoItem1;
    *RelationshipOrganizationInfoItem2;
};

public type UpdateUserRequest record {
    # Whether the user is active or not. `false` = Not activated, `true` = Activated
    boolean? active_flag;
};

public type Searchpersonsresponse200DataItems record {
    # Search result relevancy
    decimal? result_score?;
    Searchpersonsresponse200DataItem? item?;
};

# The Organization which is associated with the Deal
public type DealOrganizationDataWithId1 record {
    # The name of the Organization associated with the Deal
    string? name?;
    # The number of people connected with the Organization that is associated with the Deal
    int? people_count?;
    # The ID of the owner of the Organization that is associated with the Deal
    int? owner_id?;
    # The address of the Organization that is associated with the Deal
    string? address?;
    # If the associated Organization is activated or not
    boolean? active_flag?;
    # The CC email of the Organization associated with the Deal
    string? cc_email?;
};

# Details of the role
public type AddRoleRequest record {
    # The ID of the parent Role
    int? parent_role_id?;
    # The name of the Role
    string? name?;
};

public type AdditionalData2 record {
    # Pagination details of the list
    Additionaldata2Pagination? pagination?;
};

public type AdditionalData1 record {
    # Total quantity of the Products
    int? products_quantity_total?;
    # Total sum of the Products
    int? products_sum_total?;
    # Is variations enabled or not
    boolean? variations_enabled?;
    # Total formatted quantity of the Products
    string? products_quantity_total_formatted?;
    # Total formatted sum of the Products
    string? products_sum_total_formatted?;
};

public type UpdateActivityResponse200 record {
    boolean? success?;
    ActivityResponseObjectData? data?;
    Addactivityresponse200RelatedObjects? related_objects?;
};

public type OneNoteResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Getnotesresponse200Data? data?;
};

public type InlineResponse200 record {
    # If the response is successful or not
    boolean? success?;
    ResponseCallLogObject? data?;
};

public type AddCallLogAudioFileRequest record {
    # Audio file supported by the HTML5 specification
    string? file;
};

public type DeleteActivityResponse200 record {
    boolean? success?;
    Deleteactivityresponse200Data? data?;
};

# Who is the goal assigned to
public type GoalAssignee record {
    # ID of the goal assignee
    record {} id?;
    # Type of the assignee
    string? 'type?;
};

public type DealOrganizationDataWithId2 record {
    # The ID of the Organization associated with the Deal
    int? value?;
};

public type Listpermittedusersresponse2001 record {
    # If the response is successful or not
    boolean? success?;
    # The list of permitted Users IDs
    decimal[]? data?;
};

public type BaseTeam record {
    # The Team ID
    int? id?;
    *UpdateTeamWithAdditionalProperties;
};

public type Searchdealsresponse200Data record {
    # The array of Deals
    Searchdealsresponse200DataItems[]? items?;
};

public type Phone record {
    # Phone number
    string? value?;
    # Boolean that indicates if phone number is primary for the Person or not
    boolean? primary?;
    # Label that indicates the type of the phone number. (Possible values - work, home, mobile or other)
    string? label?;
};

public type UpdateLeadLabelRequest record {
    # The name of the Lead Label
    string? name?;
    # The color of the label. Only a subset of colors can be used.
    string? color?;
};

public type Deleteproductresponse200Data record {
    # The ID of removed Product
    record {} id?;
};

public type PersonItem1 record {
    # The ID of the Person
    int? id?;
    # The ID of the Company related to the Person
    int? company_id?;
    # If the Person is activated or not
    boolean? active_flag?;
    # List of phone data related to the Person
    Phone[]? phone?;
    # List of email data related to the Person
    Email[]? email?;
    # The first letter of the name of the Person
    string? first_char?;
    # The date and time when the Person was added/created. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # The last updated date and time of the Person. Format: YYYY-MM-DD HH:MM:SS
    string? update_time?;
    # The visibility group ID of who can see the Person
    string? visible_to?;
    # Picture ID
    PictureId? picture_id?;
    # The label assigned to the Person
    int? label?;
    # The name of the Organization associated with the Person
    string? org_name?;
    # The name of the owner associated with the Person
    string? owner_name?;
    # The CC email associated with the Person
    string? cc_email?;
};

public type Body record {
    # Name of the field
    string? name;
    # When `field_type` is either `set` or `enum`, possible options must be supplied as a JSON-encoded sequential array, for example:</br>`[{"label":"red"}, {"label":"blue"}, {"label":"lilac"}]`
    record {}[] options?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td><tr><td>`text`</td><td>Long text (up to 65k characters)</td><tr><td>`double`</td><td>Numeric value</td><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td><tr><td>`enum`</td><td>Options field with a single possible chosen option</td><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td><tr><td>`people`</td><td>Person field (contains a product ID which is stored on the same account)</td><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td><tr><td>`address`</td><td>Address field (autocompleted by Google Maps)</dd></table>
    string? field_type;
};

public type DealNonStrict1 record {
    # The ID of the Deal
    int? id?;
    # The creator of the Deal
    DealCreator? creator_user_id?;
    record {*DealUserDataWithId1; *DealUserDataWithId2;} user_id?;
    record {*DealPersonDataWithId1; *DealPersonDataWithId2;} person_id?;
    record {*DealOrganizationDataWithId1; *DealOrganizationDataWithId2;} org_id?;
};

public type UpdateMailThreadDetailsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The mail thread object
    BaseMailThread? data?;
};

public type GetProductFollowersResponseSuccess record {
    # If the response is successful or not
    boolean? success?;
    # The list of Followers
    GetproductfollowersresponsesuccessData[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type Addactivityresponse200RelatedObjectsOrganization record {
    # The ID of the Organization associated with the item
    record {} ORGANIZATION_ID?;
};

public type DealStrict1 record {
    # The ID of the Deal
    int? id?;
    # The ID of the Deal creator
    int? creator_user_id?;
    # The ID of the User
    int? user_id?;
    # The ID of the Person associated with the Deal
    int? person_id?;
    # The ID of the Organization associated with the Deal
    int? org_id?;
};

public type Follower record {
    # The ID of the User
    int? user_id?;
    # The ID of the User follower
    int? id?;
    # The ID of the Person
    int? person_id?;
    # The date and time when the Follower was added to the Person
    string? add_time?;
};

public type GetCurrentUserResponse200 record {
    # If the response is successful or not
    boolean? success?;
    User? data?;
};

# The count of Activities related to the User grouped by Activity type
public type Activitydistributiondatawithadditionaldata1ActivityDistributionAssignedToUserIdActivities record {
    # The count of Activities related to a specific type
    int? ACTIVITY_TYPE_NAME?;
};

public type Getleadlabelsresponse200Data record {
    # The unique ID of the Lead Label
    string? id?;
    # The name of the Lead Label
    string? name?;
    # The color of the label. Only a subset of colors can be used.
    string? color?;
    # The date and time of when the Lead Label was created. In ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
    string? add_time?;
    # The date and time of when the Lead Label was last updated. In ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
    string? update_time?;
};

public type GetproductResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Product? data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

public type OneCommentResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Getcommentsresponse200Data? data?;
};

public type GetFileResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The File data
    Getassociatedfilesresponse200Data? data?;
};

public type Getpersonproductsresponse200DealId record {
    Getpersonproductsresponse200DealIdDeal? deal?;
    Getpersonproductsresponse200DealIdProduct? product?;
};

public type Getproductresponse2001 record {
    # If the response is successful or not
    boolean? success?;
    Product? data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

public type SearchDealsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Searchdealsresponse200Data? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type AddFileRequest record {
    # A single file, supplied in the multipart/form-data encoding and contained within the given boundaries.
    string? file;
    # ID of the deal to associate file(s) with
    int? deal_id?;
    # ID of the person to associate file(s) with
    int? person_id?;
    # ID of the organization to associate file(s) with
    int? org_id?;
    # ID of the product to associate file(s) with
    int? product_id?;
    # ID of the activity to associate file(s) with
    int? activity_id?;
};

public type OrganizationRelationshipRequest record {
    # ID of the base organization for the returned calculated values
    int? org_id?;
    # The type of organization relationship
    string? 'type?;
    # The owner of this relationship. If type is `parent`, then the owner is the parent and the linked organization is the daughter.
    int? rel_owner_org_id?;
    # The linked organization in this relationship. If type is `parent`, then the linked organization is the daughter.
    int? rel_linked_org_id?;
};

public type DeleteRoleAssignmentResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Deleteroleassignmentresponse200Data? data?;
};

public type GetUserSettingsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getusersettingsresponse200Data? data?;
};

public type Subscriptionsidresponse200Data record {
    # The ID of the Subscription
    int? id?;
    # The ID of the User who created Subscription
    int? user_id?;
    # The ID of the Deal this Subscription associated with
    int? deal_id?;
    # Description of the recurring Subscription
    string? description?;
    # The Subscription status
    boolean? is_active?;
    # Shows how many payments a Recurring Subscription has
    int? cycles_count?;
    # Amount of each payment
    int? cycle_amount?;
    # Indicates that the Recurring Subscription will last until it's manually canceled or deleted
    boolean? infinite?;
    # The currency of the Subscription
    string? currency?;
    # Interval between payments
    string? cadence_type?;
    # The start date of the Recurring Subscription
    string? start_date?;
    # The end date of the Subscription
    string? end_date?;
    # The total value of all payments
    float? lifetime_value?;
    # The final status of the Subscription
    string? final_status?;
    # The creation time of the Subscription
    string? add_time?;
    # The update time of the Subscription
    string? update_time?;
};

public type CallLogResponse500 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type Getdealresponse200AdditionalData record {
    # The Cc email of the Deal
    string? dropbox_email?;
};

public type DeletePersonResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletepersonresponse200Data? data?;
};

public type Userassignmentstopermissionsetresponse200Data record {
    # The ID of the assignment of the Permission Set
    int? id?;
    # The ID of the User in the Permission Set
    int? user_id?;
    # The ID of the Permission Set
    int? permission_set_id?;
    # The name of the Permission Set
    string? name?;
};

public type BasicDealProductRequestData2 record {
    # The ID of the deal-product (the ID of the Product attached to the Deal)
    int? id?;
    # The ID of the Company
    int? company_id?;
    # The ID of the Deal
    int? deal_id?;
    # The ID of the Product
    int? product_id?;
    # The type of the duration. (For example hourly, daily, etc.)
    string? duration_unit?;
    # The Product sum without the discount
    decimal? sum_no_discount?;
    # The sum of all the Products attached to the Deal
    decimal? sum?;
    # The currency associated with the Deal Product
    string? currency?;
    # The date and time when the Product was added to the Deal
    string? add_time?;
    # The date and time when the Deal Product was last edited
    string? last_edit?;
    # Boolean indicates if the Product is activated or not
    boolean? active_flag?;
    # The Product tax
    decimal? tax?;
    # The Product name
    string? name?;
};

public type BasicDealProductRequestData1 record {
    # Price at which this product will be added to the deal
    decimal? item_price?;
    # Quantity – e.g. how many items of this product will be added to the deal
    int? quantity?;
    # Discount %. If omitted, will be set to 0
    decimal? discount_percentage?;
    # Duration of the product (when product durations are not enabled for the company or if omitted, defaults to 1)
    decimal? duration?;
    # ID of the product variation to use. When omitted, no variation will be used.
    int? product_variation_id?;
    # Any textual comment associated with this product-deal attachment. Visible and editable in the application UI.
    string? comments?;
    # Whether the product is enabled on the deal or not. This makes it possible to add products to a deal with specific price and discount criteria - but keep them disabled, which refrains them from being included in deal price calculation. When omitted, the product will be marked as enabled by default.
    record {} enabled_flag?;
};

public type GetDealsTimelineResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # Open and won Deals grouped into periods by defined interval, amount and date-type dealField (`field_key`)
    Getdealstimelineresponse200Data? data?;
};

public type Getcurrenciesresponse200Data record {
    # ID of the Currency
    int? id?;
    # Code of the Currency
    string? code?;
    # Name of the Currency
    string? name?;
    # The amount of decimal points of the Currency
    int? decimal_points?;
    # Symbol of the Currency
    string? symbol?;
    # Whether the Currency is active or not
    boolean? active_flag?;
    # Whether the Currency is a custom one or not
    boolean? is_custom_flag?;
};

public type Getusersettingsresponse200Data record {
    # If the vendors are allowed to install custom Marketplace apps with functionality and content in the Pipedrive UI or not
    boolean? marketplace_allow_custom_install_url?;
    # If the vendors are allowed to extend their Marketplace apps with functionality and content in the Pipedrive UI or not
    boolean? marketplace_app_extensions_vendor?;
    # If the vendors are allowed to be part of the Marketplace team or not
    boolean? marketplace_team?;
    # Number of results shown in list by default
    decimal? list_limit?;
    # If beta app is enabled
    boolean? beta_app?;
    # Prevent salesphone call to override
    boolean? prevent_salesphone_callto_override?;
    # The destination of File upload
    string? file_upload_destination?;
    # The call to link syntax
    string? callto_link_syntax?;
    # If the expected close date of the Deal is filled automatically or not
    boolean? autofill_deal_expected_close_date?;
    # Allow the vendors to duplicate a Person
    string? person_duplicate_condition?;
};

public type DeleteFilterResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletefilterresponse200Data? data?;
};

public type OrganizationRelationshipDetails1 record {
    # The name of the linked Organization
    string? related_organization_name?;
};

public type Deletefieldresponse200Data record {
    # The ID of the Field that was deleted
    int? id?;
};

public type Searchproductsresponse200Data record {
    # The array of found items
    Searchproductsresponse200DataItems[]? items?;
};

public type GetDealActivitiesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Activities
    ActivityResponseObjectData[]? data?;
    ActivityDistributionDataWithAdditionalData? additional_data?;
    Getdealactivitiesresponse200RelatedObjects? related_objects?;
};

public type DeleteActivitiesResponse200 record {
    boolean? success?;
    Deleteactivitiesresponse200Data? data?;
};

public type CreateFieldRequest record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. Example: `[{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`address`</td><td>Address field (has multiple subfields, autocompleted by Google Maps)</td></tr><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td></tr><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td></tr><tr><td>`double`</td><td>Numeric value</td></tr><tr><td>`enum`</td><td>Options field with a single possible chosen option</td></tr><tr><td>`int`</td><td>Integer value</td></tr><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td></tr><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td></tr><tr><td>`people`</td><td>Person field (contains a person ID which is stored on the same account)</td></tr><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td></tr><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td></tr><tr><td>`text`</td><td>Long text (up to 65k characters)</td></tr><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td></tr><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td></tr><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td></tr><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td></tr><tr><td>`visible_to`</td><td>System field that keeps item's visibility setting</td></tr></table>
    string? field_type?;
};

public type ListProductsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Listproductsresponse200Data? data?;
    record {*AdditionalData1; *AdditionalData2;} additional_data?;
    Listproductsresponse200RelatedObjects? related_objects?;
};

# Expected outcome of the goal
public type GoalExpectedOutcome record {
    # Numeric target of the goal
    int? target?;
    # Tracking metric of the goal
    string? tracking_metric?;
};

public type GetActivityResponse200 record {
    boolean? success?;
    ActivityResponseObjectData? data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

public type UpdateProductResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Product? data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

public type GetLeadsResponse200 record {
    boolean? success?;
    Getleadsresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type CancelRecurringSubscriptionRequest record {
    # Subscription termination date. All payments after specified date will be deleted. Default value is the current date.
    string? end_date?;
};

public type AddGoalRequest record {
    # Title of the goal.
    string? title?;
    # Who is this goal assigned to. It requires the following JSON structure: { "id": "1", "type": "person" }. `type` can be either `person`, `company` or `team`. ID of the assignee person, company or team.
    record {} assignee?;
    # Type of the goal. It requires the following JSON structure: { "name": "deals_started", "params": { "pipeline_id": 1 } }. Type can be one of: `deals_won`, `deals_progressed`, `activities_completed`, `activities_added`, `deals_started` or `revenue_forecast`. `params` can include `pipeline_id`, `stage_id` or `activity_type_id`. `stage_id` is related to only `deals_progressed` type of goals and `activity_type_id` to `activities_completed` or `activities_added` types of goals. To track goal in all pipelines set `pipeline_id` as `null`.
    record {} 'type?;
    # Expected outcome of the goal. Expected outcome can be tracked either by `quantity` or by `sum`. It requires the following JSON structure: { "target": "50", "tracking_metric": "quantity" } or { "target": "50", "tracking_metric": "sum", "currency_id": 1 }. `currency_id` should only be added to `sum` type of goals.
    record {} expected_outcome?;
    # Date when the goal starts and ends. It requires the following JSON structure: { "start": "2019-01-01", "end": "2022-12-31" }. Date in format of YYYY-MM-DD. "end" can be set to `null` for an infinite, open-ended goal.
    record {} duration?;
    # Interval of the goal
    string? interval?;
};

public type MailMessages record {
    *MailMessages1;
    *MailMessages2;
};

# The Global Message type info
public type Getglobalmessagesresponse200TypeInfo record {
    # The Global Message type for validation checks
    string? message_type?;
    # Whether a User can dismiss the Global Message or not
    boolean? dismissible_flag?;
    # Sorts messages by priority DESC (from 0 to 10)
    int? priority?;
};

public type GetAssociatedFollowersResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The list of Followers
    Follower[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

# The User who is associated with the Deal
public type DealUserDataWithId1 record {
    # The ID of the User
    int? id?;
    # The Name of the User
    string? name?;
    # The email of the User
    string? email?;
    # If the User has a picture or not
    boolean? has_pic?;
    # The User picture hash
    string? pic_hash?;
    # If the User is activated or not
    boolean? active_flag?;
};

# The distribution of Activities related to the Organization grouped by the User ID
public type Activitydistributiondatawithadditionaldata1ActivityDistribution record {
    # The ID of the User
    Activitydistributiondatawithadditionaldata1ActivityDistributionAssignedToUserId? ASSIGNED_TO_USER_ID?;
};

public type GetproductfollowersresponsesuccessData record {
    # The ID of the User
    int? user_id?;
    # The ID of the User follower
    int? id?;
    # The ID of the Product
    int? product_id?;
    # The date and time when the Follower was added to the Person
    string? add_time?;
};

public type DealUserDataWithId2 record {
    # The ID of the User
    int? value?;
};

public type BasicOrganization record {
    # Organization name
    string? name?;
    # The ID of the user who will be marked as the owner of this Organization. When omitted, the authorized User ID will be used.
    int? owner_id?;
    # Visibility of the organization. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
};

public type Getdealupdatesresponse200Data record {
    # The type of the Deal update. (Possible object types - dealChange, note, activity, mailMessage, invoice, document, file)
    string? 'object?;
    # The creation date and time of the update
    string? timestamp?;
    # The data related to the update
    record {} data?;
};

# Deals values formatted
public type Getpipelinemovementstatisticsresponse200DataNewDealsFormattedValues record {
    # Deals value formatted
    string? CURRENCY_ID?;
};

public type PersonNameInfoWithOrgAndOwnerId record {
    *PersonNameInfoWithOrgAndOwnerId1;
    *PersonNameInfoWithOrgAndOwnerId2;
};

public type PipelineRequest record {
    # The name of the Pipeline
    string? name;
    # Whether Deal probability is disabled or enabled for this Pipeline
    record {} deal_probability?;
    # Defines the order of Pipelines. First order (`order_nr=0`) is the default Pipeline.
    int? order_nr?;
    # Whether this Pipeline will be made inactive (hidden) or active
    record {} active?;
};

public type GetFilterResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The filter object
    Getfiltersresponse200Data? data?;
};

public type GetRoleSubrolesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of sub-roles
    SubRole[]? data?;
    # The additional data in the Role list
    Getrolesresponse200AdditionalData? additional_data?;
};

public type Pipeline2 record {
    # A boolean that shows if the Pipeline is selected from a filter or not
    boolean? selected?;
};

public type Addactivityresponse200RelatedObjectsPerson record {
    # The ID of the Person associated with the item
    record {} PERSON_ID?;
};

public type GetNotesResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Notes
    Getnotesresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

public type GetUserRoleAssignmentsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Role assignments
    RoleAssignment[]? data?;
    # The additional data in the Role list
    Getrolesresponse200AdditionalData? additional_data?;
};

public type AddOrUpdateGoalResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Addorupdategoalresponse200Data? data?;
};

public type Searchdealsresponse200DataItemPerson record {
    # The ID of the Person the Deal is associated with
    int? id?;
    # The name of the Person the Deal is associated with
    string? name?;
};

public type Getpersonproductsresponse200Data record {
    Getpersonproductsresponse200DealId? DEAL_ID?;
};

public type AddPersonRequest record {
    # Person name
    string? name?;
    # ID of the user who will be marked as the owner of this person. When omitted, the authorized user ID will be used.
    int? owner_id?;
    # ID of the organization this person will belong to.
    int? org_id?;
    # Email addresses (one or more) associated with the person, presented in the same manner as received by GET request of a person.
    string[]? email?;
    # Phone numbers (one or more) associated with the person, presented in the same manner as received by GET request of a person.
    string[]? phone?;
    # Visibility of the person. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # Optional creation date & time of the person in UTC. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
};

public type DeleteStageResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletestageresponse200Data? data?;
};

# Moved Deals average age by the Stage
public type Getpipelinemovementstatisticsresponse200DataAverageAgeInDaysByStages record {
    # The Stage ID
    int? stage_id?;
    # Average Deals age in specific Stage
    int? value?;
};

public type MailMessages1 record {
    # ID of the mail thread
    int? id?;
    # The connection account ID
    string? account_id?;
    # ID of the user whom mail message will be assigned to
    int? user_id?;
    # The subject
    string? subject?;
    # A snippet
    string? snippet?;
    # Whether the mail thread is read
    record {} read_flag?;
    # Mail tracking status
    string? mail_tracking_status?;
    # Whether the mail thread has an attachment
    record {} has_attachments_flag?;
    # Whether the mail thread has inline attachments
    record {} has_inline_attachments_flag?;
    # Whether the mail thread has real attachments (which are not inline)
    record {} has_real_attachments_flag?;
    # Whether the mail thread is deleted
    record {} deleted_flag?;
    # Whether the mail thread is synced
    record {} synced_flag?;
    # Whether one of the parties of the mail thread is Bcc
    record {} smart_bcc_flag?;
    # Whether the link tracking of the mail thread is enabled
    record {} mail_link_tracking_enabled_flag?;
    # We strongly advise you to avoid the use of this property. We will soon deprecate this property
    boolean? write_flag?;
};

public type MailMessages2 record {
    # Senders of the mail thread
    Basemailthread2PartiesTo[]? 'from?;
    # Recipients of the mail thread
    Basemailthread2PartiesTo[]? to?;
    # Participants of the Cc
    Basemailthread2PartiesTo[]? cc?;
    # Participants of the Bcc
    Basemailthread2PartiesTo[]? bcc?;
    # A link to the mail thread message
    string? body_url?;
    # ID of the mail thread
    int? mail_thread_id?;
    # If the mail message has a draft status then the value is the mail message object as JSON formatted string, otherwise `null`.
    string? draft?;
    # Whether the mail thread message has a body
    decimal? has_body_flag?;
    # Whether the mail thread message is sent
    decimal? sent_flag?;
    # Whether the mail thread message is sent from Pipedrive
    decimal? sent_from_pipedrive_flag?;
    # The time when the mail message was received or created
    string? message_time?;
    # The time when the mail message was inserted to database
    string? add_time?;
    # The time when the mail message was updated in database received
    string? update_time?;
};

public type MergePersonsRequest record {
    # The ID of the Person that will not be overwritten. This Person’s data will be prioritized in case of conflict with the other Person.
    int? merge_with_id;
};

public type FailResponse record {
    # If the response is successful or not
    boolean? success?;
    # The error message
    string? _error?;
};

# The settings for the Role
public type Getroleresponse200AdditionalDataSettings record {
    # The default visibility level of the Deals for the Role
    decimal? deal_default_visibility?;
    # The default visibility level of the Leads for the Role
    decimal? lead_default_visibility?;
    # The default visibility level of the Organizations for the Role
    decimal? org_default_visibility?;
    # The default visibility level of the People for the Role
    decimal? person_default_visibility?;
    # The default visibility level of the Products for the Role
    decimal? product_default_visibility?;
    # The access level of the Deals for the Role (only for default Role)
    decimal? deal_access_level?;
    # The access level of the Organizations for the Role (only for default Role)
    decimal? org_access_level?;
    # The access level of the People for the Role (only for default Role)
    decimal? person_access_level?;
    # The access level of the Products for the Role (only for default Role)
    decimal? product_access_level?;
};

# The Deal object
#
public type DealStrict record {
    *DealStrict1;
    *BaseDeal;
};

public type Getdealsbynameresponse200AdditionalData record {
    # The additional data of the list
    Fieldsresponse200AdditionalData? pagination?;
};

public type Pipeline1 record {
    # The ID of the Pipeline
    int? id?;
    # The name of the Pipeline
    string? name?;
    # The Pipeline title displayed in the URL
    string? url_title?;
    # Defines the order of Pipelines. First order (`order_nr=0`) is the default Pipeline.
    int? order_nr?;
    # Whether this Pipeline will be made inactive (hidden) or active
    boolean? active?;
    # Whether Deal probability is disabled or enabled for this Pipeline
    boolean? deal_probability?;
    # The Pipeline creation time. Format: YYYY-MM-DD HH:MM:SS.
    string? add_time?;
    # The Pipeline update time. Format: YYYY-MM-DD HH:MM:SS.
    string? update_time?;
};

public type AddDealFollowerRequest record {
    # ID of the user
    int? user_id;
};

# The additional data in the Role list
public type Getrolesresponse200AdditionalData record {
    # The pagination details in the Role list
    Getrolesresponse200AdditionalDataPagination? pagination?;
};

public type AdditionalBaseOrganizationItemInfo record {
    *OrganizationCountAndAddressInfo;
    *DealsCountAndActivityInfo;
};

public type Mailmessageresponse200Data record {
    # ID of the mail message.
    int? id?;
    # The array of mail message sender (object)
    Mailmessageresponse200DataFrom[]? 'from?;
    # The array of mail message receiver (object)
    Mailmessageresponse200DataFrom[]? to?;
    # The array of mail message copies (object)
    Mailmessageresponse200DataFrom[]? cc?;
    # The array of mail message blind copies (object)
    Mailmessageresponse200DataFrom[]? bcc?;
    # The mail message body URL
    string? body_url?;
    # The connection account ID
    string? account_id?;
    # ID of the user whom mail message will be assigned to
    int? user_id?;
    # ID of the mail message thread
    int? mail_thread_id?;
    # The subject of mail message
    string? subject?;
    # The snippet of mail message. Snippet length is up to 225 characters.
    string? snippet?;
    # The status of tracking mail message. Value is `null` if tracking is not enabled.
    string? mail_tracking_status?;
    # Whether the link tracking in mail message body is enabled.
    record {} mail_link_tracking_enabled_flag?;
    # Whether the mail message is read or not by the user
    record {} read_flag?;
    # If the mail message has a draft status then the value is the mail message object as JSON formatted string, otherwise `null`.
    string? draft?;
    # Whether the mail message is a draft or not
    record {} draft_flag?;
    # Whether the mail message is synced with the provider or not
    record {} synced_flag?;
    # Whether the mail message is deleted or not
    record {} deleted_flag?;
    # Whether the mail message has a body or not
    record {} has_body_flag?;
    # Whether the mail message has been sent or not
    record {} sent_flag?;
    # Whether the mail message has been sent from Pipedrive app or not
    record {} sent_from_pipedrive_flag?;
    # Whether the mail message has been created by Smart Email BCC feature or not
    record {} smart_bcc_flag?;
    # Creation or receival time of the mail message
    string? message_time?;
    # The insertion into the database time of the mail message
    string? add_time?;
    # The updating time in the database of the mail message
    string? update_time?;
    # Whether the mail message has an attachment or not
    record {} has_attachments_flag?;
    # Whether the mail message has an inline attachment or not
    record {} has_inline_attachments_flag?;
    # Whether the mail message has an attachment (which is not inline) or not
    record {} has_real_attachments_flag?;
    # We strongly advise you to avoid the use of this property. We will soon deprecate this property.
    boolean? write_flag?;
};

public type GetPersonProductsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Deal Products
    Getpersonproductsresponse200Data[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type Deleteproductfollowerresponse200Data record {
    # The ID of removed Follower
    record {} id?;
};

public type AddDealFollowerResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Adddealfollowerresponse200Data? data?;
};

public type Deletedealsresponse200Data record {
    # The list of deleted Deals IDs
    int[]? id?;
};

public type Deletestageresponse200Data record {
    # Deleted Stage ID
    int? id?;
};

# Details of the role
public type BaseRoleRequest record {
    # The ID of the parent Role
    int? parent_role_id?;
    # The name of the Role
    string? name?;
};

public type DeleteOrganizationRelationshipResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteorganizationrelationshipresponse200Data? data?;
};

public type Owner2 record {
    # The ID of the owner
    int? value?;
};

public type Owner1 record {
    # The ID of the User
    int? id?;
    # The name of the User
    string? name?;
    # The email of the User
    string? email?;
    # Whether the User has picture or not. 0 = No picture, 1 = Has picture.
    int? has_pic?;
    # The User picture hash
    string? pic_hash?;
    # If the User is activated or not
    boolean? active_flag?;
};

public type Deletedealproductresponse200Data record {
    # The ID of an attached Product that was deleted from the Deal
    int? id?;
    # The ID of an attached Product that was deleted from the Deal
    int? product_attachment_id?;
};

public type BasicDealProductRequest record {
    # Price at which this product will be added to the deal
    decimal? item_price?;
    # Quantity – e.g. how many items of this product will be added to the deal
    int? quantity?;
    # Discount %. If omitted, will be set to 0
    decimal? discount_percentage?;
    # Duration of the product (when product durations are not enabled for the company or if omitted, defaults to 1)
    decimal? duration?;
    # ID of the product variation to use. When omitted, no variation will be used.
    int? product_variation_id?;
    # Any textual comment associated with this product-deal attachment. Visible and editable in the application UI.
    string? comments?;
    # Whether the product is enabled on the deal or not. This makes it possible to add products to a deal with specific price and discount criteria - but keep them disabled, which refrains them from being included in deal price calculation. When omitted, the product will be marked as enabled by default.
    record {} enabled_flag?;
};

public type GetPersonResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
    Getpersonresponse200AdditionalData? additional_data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

public type Getassociateddealsresponse200RelatedObjects record {
    Addactivityresponse200RelatedObjectsOrganization? organization?;
    Addactivityresponse200RelatedObjectsPerson? person?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
};

public type Deletefileresponse200Data record {
    # The ID of the File
    int? id?;
};

public type GetFiltersResponse200 record {
    # If the response is successful or not
    boolean? success?;
};

public type Searchpersonsresponse200DataItemOrganization record {
    # The ID of the Organization the Person is associated with
    int? id?;
    # The name of the Organization the Person is associated with
    string? name?;
};

public type BaseOrganizationItemWithEditNameFlag record {
    *BaseOrganizationItem;
    *BaseOrganizationItemWithEditNameFlag1;
};

# The Person who is associated with the Deal
public type Getdealsresponse200RelatedObjectsPerson record {
    # If the associated Person is activated or not
    boolean? active_flag?;
    # The name of the Person associated with the Deal
    string? name?;
    # The emails of the Person associated with the Deal
    Dealpersondatawithid1Email[]? email?;
    # The phone numbers of the Person associated with the Deal
    Dealpersondatawithid1Phone[]? phone?;
    # The ID of the owner of the Person that is associated with the Deal
    int? owner_id?;
};

public type Getpersonresponse200AdditionalData record {
    # Dropbox email for the Person
    string? dropbox_email?;
};

public type Deletedealresponse200Data record {
    # The ID of the Deal that was deleted
    int? id?;
};

public type GetStageDealsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Deals
    DealStrict[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
};

# The additional data of the list
public type ActivityDistributionDataWithAdditionalData2 record {
    # Pagination start
    int? 'start?;
    # Items shown per page
    int? 'limit?;
    # If there are more list items in the collection than displayed or not
    boolean? more_items_in_collection?;
};

public type GetActivitiesResponse200 record {
    boolean? success?;
    ActivityResponseObjectData[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

public type DeleteDealFollowerResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletedealfollowerresponse200Data? data?;
};

public type DeleteDealParticipantResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletedealparticipantresponse200Data? data?;
};

public type ActivityDistributionDataWithAdditionalData1 record {
    # The distribution of Activities related to the Organization grouped by the User ID
    Activitydistributiondatawithadditionaldata1ActivityDistribution? activity_distribution?;
};

# The Person who is associated with the Deal
public type DealPersonDataWithId1 record {
    # If the associated Person is activated or not
    boolean? active_flag?;
    # The name of the Person associated with the Deal
    string? name?;
    # The emails of the Person associated with the Deal
    Dealpersondatawithid1Email[]? email?;
    # The phone numbers of the Person associated with the Deal
    Dealpersondatawithid1Phone[]? phone?;
    # The ID of the owner of the Person that is associated with the Deal
    int? owner_id?;
};

public type DealPersonDataWithId2 record {
    # The ID of the Person associated with the Deal
    int? value?;
};

public type GetOrganizationResponse200 record {
    # If the response is successful or not
    boolean? success?;
    OrganizationItem1? data?;
    Getorganizationresponse200AdditionalData? additional_data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

public type Searchitembyfieldresponse200Data record {
    # The ID of the item
    int? id?;
    # The value of the searched `field_key`
    anydata? '\$field\_key?;
};

# The total values of the Deals grouped by Deal currency
public type Getdealssummaryresponse200DataValuesTotal record {
    # The total value of Deals in the Deal currency group
    decimal? value?;
    # The number of Deals in the Deal currency group
    int? count?;
    # The total value of Deals converted into the company default currency
    decimal? value_converted?;
    # The total value of Deals formatted with Deal currency. E.g. €50
    string? value_formatted?;
    # The value_converted formatted with Deal currency. E.g. US$50.10
    string? value_converted_formatted?;
};

public type GetAssociatedPersonUpdatesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getassociatedpersonupdatesresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getdealupdatesresponse200RelatedObjects? related_objects?;
};

public type AdditionalPersonInfo record {
    *PersonNameInfoWithOrgAndOwnerId;
    *PersonCountEmailDealAndActivityInfo;
};

public type AddCallLogAudioFileResponse200 record {
    # If the response is successful or not
    boolean? success?;
};

public type Searchitemresponse200DataItems record {
    # Search result relevancy
    decimal? result_score?;
    # Item
    record {} item?;
};

public type GetPipelinesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # Pipelines array
    BasePipelineWithSelectedFlag[]? data?;
};

public type DeleteProductFieldResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteproductfieldresponse200Data? data?;
};

# The Deal this Note is attached to
public type Getnotesresponse200Deal record {
    # The title of the Deal this Note is attached to
    string? title?;
};

public type Listpersonsresponse200RelatedObjects record {
    Addactivityresponse200RelatedObjectsOrganization? organization?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
};

public type BaseMailThread2 record {
    # Parties of the mail thread
    Basemailthread2Parties? parties?;
    # Parties of the drafted mail thread
    record {}[] drafts_parties?;
    # Folders in which messages from thread are being stored
    string[]? folders?;
    # Version
    decimal? 'version?;
    # A snippet from a draft
    string? snippet_draft?;
    # A snippet from a message sent
    string? snippet_sent?;
    # An amount of messages
    int? message_count?;
    # Whether the mail thread has any drafts
    decimal? has_draft_flag?;
    # Whether the mail thread has messages sent
    decimal? has_sent_flag?;
    # Whether the mail thread is archived
    record {} archived_flag?;
    # Whether the mail thread is shared
    record {} shared_flag?;
    # Whether the mail thread has been deleted externally
    record {} external_deleted_flag?;
    # Whether the mail thread was initialized by others
    record {} first_message_to_me_flag?;
    # Last message timestamp
    string? last_message_timestamp?;
    # The time when the mail thread has had the first message received or created
    string? first_message_timestamp?;
    # The last time when the mail thread has had a message sent
    string? last_message_sent_timestamp?;
    # The last time when the mail thread has had a message received
    string? last_message_received_timestamp?;
    # The time when the mail thread was inserted to database
    string? add_time?;
    # The time when the mail thread was updated in database received
    string? update_time?;
    # The ID of the deal
    int? deal_id?;
    # Status of the deal
    string? deal_status?;
    # The ID of the lead
    string? lead_id?;
    # Whether all the mail thread messages have been sent
    decimal? all_messages_sent_flag?;
};

public type Createfieldrequest2 record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. Example: `[{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`address`</td><td>Address field (has multiple subfields, autocompleted by Google Maps)</td></tr><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td></tr><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td></tr><tr><td>`double`</td><td>Numeric value</td></tr><tr><td>`enum`</td><td>Options field with a single possible chosen option</td></tr><tr><td>`int`</td><td>Integer value</td></tr><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td></tr><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td></tr><tr><td>`people`</td><td>Person field (contains a person ID which is stored on the same account)</td></tr><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td></tr><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td></tr><tr><td>`text`</td><td>Long text (up to 65k characters)</td></tr><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td></tr><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td></tr><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td></tr><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td></tr><tr><td>`visible_to`</td><td>System field that keeps item's visibility setting</td></tr></table>
    string? field_type?;
};

public type Createfieldrequest1 record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. Example: `[{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`address`</td><td>Address field (has multiple subfields, autocompleted by Google Maps)</td></tr><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td></tr><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td></tr><tr><td>`double`</td><td>Numeric value</td></tr><tr><td>`enum`</td><td>Options field with a single possible chosen option</td></tr><tr><td>`int`</td><td>Integer value</td></tr><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td></tr><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td></tr><tr><td>`people`</td><td>Person field (contains a person ID which is stored on the same account)</td></tr><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td></tr><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td></tr><tr><td>`text`</td><td>Long text (up to 65k characters)</td></tr><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td></tr><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td></tr><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td></tr><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td></tr><tr><td>`visible_to`</td><td>System field that keeps item's visibility setting</td></tr></table>
    string? field_type?;
};

public type Searchorganizationresponse200DataItem record {
    # The ID of the Organization
    int? id?;
    # The type of the item
    string? 'type?;
    # The name of the Organization
    string? name?;
    # The address of the Organization
    string? address?;
    # The visibility of the Organization
    int? visible_to?;
    Searchdealsresponse200DataItemOwner? owner?;
    # Custom fields
    int? custom_fields?;
    # An array of Notes
    string[]? notes?;
};

public type UpdateFilterRequest record {
    # The name of the filter
    string? name?;
    # The conditions of the filter as a JSON object. It requires a minimum structure as follows: {"glue":"and","conditions":[{"glue":"and","conditions": [CONDITION_OBJECTS]},{"glue":"or","conditions":[CONDITION_OBJECTS]}]}. Replace CONDITION_OBJECTS with JSON objects of the following structure: {"object":"","field_id":"", "operator":"","value":"", "extra_value":""} or leave the array empty. Depending on the object type you should use another API endpoint to get field_id. There are five types of objects you can choose from: "person", "deal", "organization", "product", "activity" and you can use these types of operators depending on what type of a field you have: "IS NOT NULL", "IS NULL", "<=", ">=", "<", ">", "!=", "=", "LIKE '%$%'", "NOT LIKE '%$%'", "LIKE '$%'", "NOT LIKE '$%'", "LIKE '%$'", "NOT LIKE '%$'". To get a better understanding of how filters work try creating them directly from the Pipedrive application.
    record {} conditions;
};

public type CallLogResponse400 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type GetLeadSourcesResponse200 record {
    boolean? success?;
    Getleadsourcesresponse200Data[]? data?;
};

public type UserConnectionsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The object of UserConnections
    Userconnectionsresponse200Data? data?;
};

# The summary of Deals
public type Getdealssummaryresponse200Data record {
    # The total values of the Deals grouped by Deal currency
    Getdealssummaryresponse200DataValuesTotal? values_total?;
    # The total weighted values of the Deals grouped by Deal currency. The weighted value is calculated as probability times Deal value.
    Getdealssummaryresponse200DataWeightedValuesTotal? weighted_values_total?;
    # The total number of Deals
    int? total_count?;
    # The total value of Deals converted into the company default currency
    decimal? total_currency_converted_value?;
    # The total weighted value of Deals converted into the company default currency
    decimal? total_weighted_currency_converted_value?;
    # The total converted value of Deals formatted with the company default currency. E.g. US$5,100.96
    string? total_currency_converted_value_formatted?;
    # The total weighted value of Deals formatted with the company default currency. E.g. US$5,100.96
    string? total_weighted_currency_converted_value_formatted?;
};

public type TeamsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    BaseTeam[]? data?;
};

public type Getactivitiesresponse200RelatedObjectsDeal record {
    # The ID of the Deal which is associated with the item
    Getactivitiesresponse200RelatedObjectsDealDealId? DEAL_ID?;
};

public type Getassociatedpersonupdatesresponse200Data record {
    # The type of the Person update. (Possible object types - personChange, note, activity, file)
    string? 'object?;
    # The creation date and time of the update
    string? timestamp?;
    # The data related to the update
    record {} data?;
};

# The mail thread object
#
public type BaseMailThreadData record {
    *BaseMailThread1;
    *BaseMailThread2;
};

public type MergeOrganizationsResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Mergeorganizationsresponse200Data? data?;
};

public type Getnotefieldsresponse200Data record {
    # The ID of the Field
    int? id?;
    # The key of the Field
    string? 'key?;
    # The name of the Field
    string? name?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`address`</td><td>Address field (has multiple subfields, autocompleted by Google Maps)</td></tr><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td></tr><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td></tr><tr><td>`double`</td><td>Numeric value</td></tr><tr><td>`enum`</td><td>Options field with a single possible chosen option</td></tr><tr><td>`int`</td><td>Integer value</td></tr><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td></tr><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td></tr><tr><td>`people`</td><td>Person field (contains a person ID which is stored on the same account)</td></tr><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td></tr><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td></tr><tr><td>`text`</td><td>Long text (up to 65k characters)</td></tr><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td></tr><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td></tr><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td></tr><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td></tr><tr><td>`visible_to`</td><td>System field that keeps item's visibility setting</td></tr></table>
    string? field_type?;
    # The active flag of the Field
    boolean? active_flag?;
    # The edit flag of the Field
    boolean? edit_flag?;
    # Not used
    boolean? bulk_edit_allowed?;
    # Whether or not the Field is mandatory
    boolean? mandatory_flag?;
    # The options of the Field. When there are no options, `null` is returned.
    record {}[] options?;
};

public type OrganizationFollower record {
    *OrganizationFollower1;
    *OrganizationFollower2;
};

public type ProductField2 record {
    # The ID of the Product Field
    int? id?;
    # The key of the Product Field
    string? 'key?;
    # Position (index) of the Product Field in the detail view
    int? order_nr?;
    # The Product Field creation time. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # The Product Field last update time. Format: YYYY-MM-DD HH:MM:SS
    string? update_time?;
    # The ID of the last user to update the Product Field
    int? last_updated_by_user_id?;
    # Whether or not the Product Field is currently active
    boolean? active_flag?;
    # Whether or not the Product Field Name and metadata is editable
    boolean? edit_flag?;
    # Whether or not the Product Field is visible in the Add Product Modal
    boolean? add_visible_flag?;
    # Whether or not the Product Field is marked as important
    boolean? important_flag?;
    # Whether or not the Product Field data can be edited
    boolean? bulk_edit_allowed?;
    # Whether or not the Product Field is searchable
    boolean? searchable_flag?;
    # Whether or not the Product Field value can be used when filtering searches
    boolean? filtering_allowed?;
    # Whether or not the Product Field is sortable
    boolean? sortable_flag?;
    # Whether or not the Product Field is mandatory when creating products
    boolean? mandatory_flag?;
};

public type CreateUpdateDeleteActivityTypeResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getactivitytypesresponse200Data? data?;
};

# Duration of the goal
public type GoalDuration record {
    # Start date of the goal
    string? 'start?;
    # End date of the goal
    string? end?;
};

public type ProductField1 record {
    # Name of the field
    string? name;
    # When `field_type` is either `set` or `enum`, possible options must be supplied as a JSON-encoded sequential array, for example:</br>`[{"label":"red"}, {"label":"blue"}, {"label":"lilac"}]`
    record {}[] options?;
    # Type of the field<table><tr><th>Value</th><th>Description</th></tr><tr><td>`varchar`</td><td>Text (up to 255 characters)</td><tr><td>`varchar_auto`</td><td>Autocomplete text (up to 255 characters)</td><tr><td>`text`</td><td>Long text (up to 65k characters)</td><tr><td>`double`</td><td>Numeric value</td><tr><td>`monetary`</td><td>Monetary field (has a numeric value and a currency value)</td><tr><td>`date`</td><td>Date (format YYYY-MM-DD)</td><tr><td>`set`</td><td>Options field with a possibility of having multiple chosen options</td><tr><td>`enum`</td><td>Options field with a single possible chosen option</td><tr><td>`user`</td><td>User field (contains a user ID of another Pipedrive user)</td><tr><td>`org`</td><td>Organization field (contains an organization ID which is stored on the same account)</td><tr><td>`people`</td><td>Person field (contains a product ID which is stored on the same account)</td><tr><td>`phone`</td><td>Phone field (up to 255 numbers and/or characters)</td><tr><td>`time`</td><td>Time field (format HH:MM:SS)</td><tr><td>`timerange`</td><td>Time-range field (has a start time and end time value, both HH:MM:SS)</td><tr><td>`daterange`</td><td>Date-range field (has a start date and end date value, both YYYY-MM-DD)</td><tr><td>`address`</td><td>Address field (autocompleted by Google Maps)</dd></table>
    string? field_type;
};

public type CallLogResponse409 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

# Pagination details of the list
public type Additionaldata2Pagination record {
    # Pagination start
    int? 'start?;
    # Items shown per page
    int? 'limit?;
    # Whether there are more list items in the collection than displayed
    boolean? more_items_in_collection?;
    # Next pagination start
    int? next_start?;
};

# The Pipeline object
public type Getpipelineconversionstatisticsresponse200Data record {
    # The Stage conversions
    Getpipelineconversionstatisticsresponse200DataStageConversions[]? stage_conversions?;
    # Won conversion
    int? won_conversion?;
    # Lost conversion
    int? lost_conversion?;
};

public type CallLogResponse404 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type CallLogResponse403 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type GetGlobalMessagesResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The array of Global Messages
    Getglobalmessagesresponse200Data[]? data?;
    # The total time of the controller processing
    decimal? handle_time?;
    # The list of timers formatted by name and elapsed time in ms (such as `app`, `app_xss_clean`, `app_sanitizer_xss`)
    record {} _req_time_ctx_ms?;
};

public type GetDealsByNameResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getdealsbynameresponse200Data[]? data?;
    Getdealsbynameresponse200AdditionalData? additional_data?;
};

public type CallLogResponse410 record {
    boolean? success?;
    # The description of the error
    string? _error?;
    # A message describing how to solve the problem
    string? error_info?;
    record {} data?;
    record {} additional_data?;
};

public type SearchItemByFieldResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of results
    Searchitembyfieldresponse200Data[]? data?;
    Getactivitiesresponse200AdditionalData? additional_data?;
};

public type UsersResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Usersresponse200Data[]? data?;
};

public type ActivityDistributionDataWithAdditionalData record {
    *ActivityDistributionDataWithAdditionalData1;
    *ActivityDistributionDataWithAdditionalData2;
};

public type AddOrUpdateLeadLabelResponse200 record {
    boolean? success?;
    Getleadlabelsresponse200Data? data?;
};

public type AddProductRequest record {
    # Name of the product.
    string? name?;
    # Product code.
    string? code?;
    # Unit in which this product is sold
    string? unit?;
    # Tax percentage
    decimal? tax?;
    # Whether this product will be made active or not.
    decimal? active_flag?;
    # Whether this product can be selected in Deals or not.
    decimal? selectable?;
    # Visibility of the product. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # ID of the user who will be marked as the owner of this product. When omitted, the authorized user ID will be used.
    int? owner_id?;
    # Array of objects, each containing: `currency` (string), `price` (number), `cost` (number, optional), `overhead_cost` (number, optional). Note that there can only be one price per product per currency. When `prices` is omitted altogether, no prices will be set up for the product
    record {}[] prices?;
};

public type UnathorizedResponse record {
    # If the response is successful or not
    boolean? success?;
    # The error message
    string? _error?;
    # The response error code
    int? errorCode?;
};

# The User who is associated with the Deal
public type Getdealsresponse200RelatedObjectsUser record {
    # The ID of the User
    int? id?;
    # The Name of the User
    string? name?;
    # The email of the User
    string? email?;
    # If the User has a picture or not
    boolean? has_pic?;
    # The User picture hash
    string? pic_hash?;
    # If the User is activated or not
    boolean? active_flag?;
};

public type GetLeadLabelsResponse200 record {
    boolean? success?;
    Getleadlabelsresponse200Data[]? data?;
};

public type NoteRequest record {
    # Content of the note in HTML format. Subject to sanitization on the back-end.
    string? content;
    # ID of the user who will be marked as the author of this note. Only an admin can change the author.
    int? user_id?;
    # The ID of the lead the note will be attached to
    string? lead_id?;
    # The ID of the deal the note will be attached to
    int? deal_id?;
    # The ID of the person this note will be attached to
    int? person_id?;
    # The ID of the organization this note will be attached to
    int? org_id?;
    # Optional creation date & time of the Note in UTC. Can be set in the past or in the future. Requires admin user API token. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
    # If set, then results are filtered by note to lead pinning state (`lead_id` is also required)
    record {} pinned_to_lead_flag?;
    # If set, then results are filtered by note to deal pinning state (`deal_id` is also required).
    record {} pinned_to_deal_flag?;
    # If set, then results are filtered by note to organization pinning state (`org_id` is also required).
    record {} pinned_to_organization_flag?;
    # If set, then results are filtered by note to person pinning state (`person_id` is also required).
    record {} pinned_to_person_flag?;
};

# The response data
public type Addroleassignmentresponse200Data record {
    # The ID of the User that was added to the Role
    int? user_id?;
    # The ID of the Role the User was added to
    int? role_id?;
};

public type UpdateOrganizationResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
    Getorganizationsresponse200RelatedObjects? related_objects?;
};

public type Pictures record {
    # The URL of the 128*128 picture
    string? '128?;
    # The URL of the 512*512 picture
    string? '512?;
};

public type AddCallLogRequest record {
    # The ID of the owner of the call log
    int? user_id?;
    # If specified, this activity will be converted into a call log, with the information provided. When this field is used, you don't need to specify `deal_id`, `person_id` or `org_id`, as they will be ignored in favor of the values already available in the activity.
    int? activity_id?;
    # Name of the activity this call is attached to
    string? subject?;
    # Call duration in seconds
    string? duration?;
    # Describes the outcome of the call
    string? outcome;
    # The number that made the call
    string? from_phone_number?;
    # The number called
    string? to_phone_number;
    # The date and time of the start of the call in UTC. Format: YYYY-MM-DD HH:MM:SS.
    string? start_time;
    # The date and time of the end of the call in UTC. Format: YYYY-MM-DD HH:MM:SS.
    string? end_time;
    # The ID of the Person this call is associated with
    int? person_id?;
    # The ID of the Organization this call is associated with
    int? org_id?;
    # The ID of the Deal this call is associated with
    int? deal_id?;
    # Note for the call log in HTML format
    string? note?;
};

public type FieldResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Fieldsresponse200Data? data?;
};

# The array of Deals filtered by name
public type Getdealsbynameresponse200Data record {
    # The ID of the Deal
    int? id?;
    # The title of the Deal
    string? title?;
    # The ID of the User who is associated with the Deal
    int? user_id?;
    # The visibility of the Deal
    string? visible_to?;
    # The status of the Deal
    string? status?;
    # The value of the Deal
    decimal? value?;
    # The currency associated with the Deal
    string? currency?;
    # The name of the Person associated with the Deal
    string? person_name?;
    # The ID of the Person associated with the Deal
    int? person_id?;
    # The name of the Organization associated with the Deal
    string? organization_name?;
    # The ID of the Person associated with the Deal
    int? organization_id?;
    # The Deal value formatted with selected currency. E.g. US$500
    string? formatted_value?;
    # The Cc email of the Deal
    string? cc_email?;
};

public type AddTeamUserRequest record {
    # List of User IDs
    int[]? users;
};

# The filter object
public type Getfiltersresponse200Data record {
    # The ID of the filter
    int? id?;
    # The name of the filter
    string? name?;
    # The active flag of the filter
    boolean? active_flag?;
    # The type of the item
    string? 'type?;
    # The owner of the filter
    int? user_id?;
    # The date and time when the filter was added
    string? add_time?;
    # The date and time when the filter was updated
    string? update_time?;
    # The visibility group ID of who can see then filter
    int? visible_to?;
    # Used by Pipedrive webapp
    int? custom_view_id?;
};

public type FindProductsByNameResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Findproductsbynameresponse200Data? data?;
    # Any additional data related to the Products
    record {} additional_data?;
};

public type DeleteUserRoleAssignmentRequest record {
    # ID of the role
    int? role_id;
};

public type Getassociatedupdatesresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsOrganization? organization?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
};

public type GetDealsSummaryResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The summary of Deals
    Getdealssummaryresponse200Data? data?;
};

public type Getorganizationresponse200AdditionalData record {
    # The follower that is associated with the item
    Getorganizationresponse200AdditionalDataFollowers? followers?;
    # Dropbox email for the Organization
    string? dropbox_email?;
};

# The potential value of the Lead.
public type LeadsValue record {
    # Amount
    decimal? amount;
    # Currency
    string? currency;
};

public type AddWebhookRequest record {
    # A full, valid, publicly accessible URL. Determines where to send the notifications. Please note that you cannot use Pipedrive API endpoints as the `subscription_url`.
    string? subscription_url;
    # Type of action to receive notifications about. Wildcard will match all supported actions.
    string? event_action;
    # Type of object to receive notifications about. Wildcard will match all supported objects.
    string? event_object;
    # The ID of the user this webhook will be authorized with. If not set, current authorized user will be used. Note that this does not filter only certain user's events — rather, this specifies the user's permissions under which each event is checked. Events about objects the selected user is not entitled to access are not sent. If you want to receive notifications for all events, a top-level admin user should be used.
    int? user_id?;
    # HTTP basic auth username of the subscription URL endpoint (if required).
    string? http_auth_user?;
    # HTTP basic auth password of the subscription URL endpoint (if required).
    string? http_auth_password?;
};

public type PostFilterResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Postfilterresponse200Data? data?;
};

public type Goal record {
    # ID of the goal
    string? id?;
    # ID of the creator of the goal
    string? owner_id?;
    # The title of the goal
    string? title?;
    # Type of the goal
    GoalType? 'type?;
    # Who is the goal assigned to
    GoalAssignee? assignee?;
    # Interval of the goal
    string? interval?;
    # Duration of the goal
    GoalDuration? duration?;
    # Expected outcome of the goal
    GoalExpectedOutcome? expected_outcome?;
    # If the goal is currently active or not
    boolean? is_active?;
    # The IDs of the reports that belong to the goal
    int[]? report_ids?;
};

# The picture that is associated with the item
public type Getorganizationsresponse200RelatedObjectsPicture record {
    # The ID of the picture
    record {} PICTURE_ID?;
};

public type SubRole1 record {
    # The ID of the Role
    int? id?;
    # If the Role is active or not
    boolean? active_flag?;
    # The number of Users assigned to this Role
    string? assignment_count?;
    # The number of sub-roles
    string? sub_role_count?;
};

public type GetRolesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Roles
    SubRole[]? data?;
    # The additional data in the Role list
    Getrolesresponse200AdditionalData? additional_data?;
};

# The Organization this Note is attached to
public type Getnotesresponse200Organization record {
    # The name of the Organization this Note is attached to
    string? name?;
};

public type UpdateRoleResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Updateroleresponse200Data? data?;
};

public type OrganizationItem1 record {
    # Please refer to response schema of <a href="https://developers.pipedrive.com/docs/api/v1/Activities#getActivity">Activity</a>
    record {} last_activity?;
    # Please refer to response schema of <a href="https://developers.pipedrive.com/docs/api/v1/Activities#getActivity">Activity</a>
    record {} next_activity?;
};

public type PersonCountAndEmailInfo record {
    *PersonCountAndEmailInfo1;
    *PersonCountAndEmailInfo2;
};

public type DeleteDealResponse200 record {
    # If the request was successful or not
    boolean? success?;
    Deletedealresponse200Data? data?;
};

public type Getdealupdatesresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsDeal? deal?;
    Getactivitiesresponse200RelatedObjectsOrganization? organization?;
    Getactivitiesresponse200RelatedObjectsUser? user?;
    Addactivityresponse200RelatedObjectsPerson? person?;
};

public type GetProductFieldsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # Array containing data for all Product Fields
    ProductField[]? data?;
    # Additional data for the Product Field, such as pagination
    record {} additional_data?;
};

# The User who created the Note
public type Getnotesresponse200User record {
    # The Email of the Note creator
    string? email?;
    # The URL of the Note creator avatar picture
    string? icon_url?;
    # If the Note is created by you or not
    boolean? is_you?;
    # The name of the Note creator
    string? name?;
};

public type Deleteorganizationrelationshipresponse200Data record {
    # The ID of the deleted Organization Relationship
    int? id?;
};

public type Deletefilterresponse200Data record {
    # The ID of the deleted filter
    int? id?;
};

public type Getassociatedupdatesresponse200Data record {
    # The type of the Person update. (Possible object types - organizationChange, dealChange, file, activity)
    string? 'object?;
    # The creation date and time of the update
    string? timestamp?;
    # The data related to the update
    record {} data?;
};

public type GetRoleSettingsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The settings for the Role
    Getroleresponse200AdditionalDataSettings? data?;
};

# Deals values
public type Getpipelinemovementstatisticsresponse200DataNewDealsValues record {
    # Deals value
    int? CURRENCY_ID?;
};

public type AddPersonFollowerResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Addpersonfollowerresponse200Data? data?;
};

public type TeamResponse200 record {
    # If the response is successful or not
    boolean? success?;
    record {} data?;
};

public type DeleteNoteResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # If the response is successful or not
    boolean? data?;
};

public type Commentpostputobject1 record {
    # Content of the comment in HTML format. Subject to sanitization on the back-end.
    string? content;
};

public type Dealresponse200AdditionalData record {
    # The array of filter ID's with what this added Deal matches
    int[]? matches_filters?;
};

public type Newfollowerresponse200Data record {
    # The ID of the user that was added as Follower
    int? user_id?;
    # The ID of the Follower
    int? id?;
    # The ID of the Product
    int? product_id?;
    # The Follower creation time. Format: YYYY-MM-DD HH:MM:SS
    string? add_time?;
};

public type DealResponse200 record {
    # If the response is successful or not
    boolean? success?;
    DealNonStrict? data?;
    Dealresponse200AdditionalData? additional_data?;
    Getdealsresponse200RelatedObjects? related_objects?;
};

public type OrganizationFollower2 record {
    # The user ID of the follower related to the item
    int? user_id?;
    # The ID of the follower
    int? id?;
    # The date and time of adding the follower to the item
    int? add_time?;
};

public type OrganizationFollower1 record {
    # The ID of the Organization
    int? org_id?;
};

public type MergeDealsRequest record {
    # ID of the deal that the deal will be merged with
    int? merge_with_id;
};

public type Listproductsresponse200RelatedObjects record {
    Getactivitiesresponse200RelatedObjectsUser? user?;
};

public type UpdateActivityTypeRequest record {
    # The name of the ActivityType
    string? name?;
    # Icon graphic to use for representing this activity type.
    string? icon_key?;
    # A designated color for the ActivityType in 6-character HEX format (e.g. `FFFFFF` for white, `000000` for black)
    string? color?;
    # An order number for this ActivityType. Order numbers should be used to order the types in the ActivityType selections.
    int? order_nr?;
};

public type ProductRequest record {
    # Name of the product.
    string? name?;
    # Product code.
    string? code?;
    # Unit in which this product is sold
    string? unit?;
    # Tax percentage
    decimal? tax?;
    # Whether this product will be made active or not.
    decimal? active_flag?;
    # Whether this product can be selected in Deals or not.
    decimal? selectable?;
    # Visibility of the product. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # ID of the user who will be marked as the owner of this product. When omitted, the authorized user ID will be used.
    int? owner_id?;
    # Array of objects, each containing: `currency` (string), `price` (number), `cost` (number, optional), `overhead_cost` (number, optional). Note that there can only be one price per product per currency. When `prices` is omitted altogether, no prices will be set up for the product
    record {}[] prices?;
};

public type Getpermissionsetsresponse200Data record {
    # The ID of User Permission Set
    int? id?;
    # The name of Permission Set
    string? name?;
    # The number of Users assigned to this Permission Set
    int? assignment_count?;
};

public type Stages1 record {
    # The ID of the Stage
    int? id?;
    # Defines the order of the Stage
    int? order_nr?;
    # The name of the Stage
    string? name?;
    # If the Stage is active or deleted
    boolean? active_flag?;
    # The Deal success probability percentage. Used/shown when the Deal weighted values are used.
    int? deal_probability?;
    # The ID of the Pipeline to add the Stage to
    int? pipeline_id?;
    # Whether Deals in this Stage can become rotten
    int? rotten_flag?;
    # The number of days the Deals are not updated in this Stage would become rotten. Applies only if the `rotten_flag` is set.
    int? rotten_days?;
    # The Stage creation time. Format: YYYY-MM-DD HH:MM:SS.
    string? add_time?;
    # The Stage update time. Format: YYYY-MM-DD HH:MM:SS.
    string? update_time?;
};

public type Stages2 record {
    # The name of the Pipeline
    string? pipeline_name?;
    # Pipeline Deal probability. When `true`, overrides the Stage probability.
    boolean? pipeline_deal_probability?;
};

public type DeleteCommentResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # If the response is successful or not
    boolean? data?;
};

public type Deletefieldsresponse200Data record {
    # The list of deleted Field IDs
    int[]? id?;
};

public type DeletePersonsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletepersonsresponse200Data? data?;
};

public type Mailmessageresponse200DataFrom record {
    # ID of the mail participant
    int? id?;
    # Mail address of the mail participant
    string? email_address?;
    # Name of the mail participant
    string? name?;
    # ID of the linked person to the mail message
    int? linked_person_id?;
    # Name of the linked person to the mail message
    string? linked_person_name?;
    # ID of the mail message participant
    int? mail_message_party_id?;
};

public type MergeDealsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Deal object
    DealStrict? data?;
};

# The object of Participant
#
public type PersonItem record {
    *PersonItem1;
    *AdditionalPersonInfo;
};

public type Searchpersonsresponse200DataItem record {
    # The ID of the Person
    int? id?;
    # The type of the item
    string? 'type?;
    # The name of the Person
    string? name?;
    # An array of phone numbers
    string[]? phones?;
    # An array of email addresses
    string[]? emails?;
    # The visibility of the Person
    int? visible_to?;
    Searchpersonsresponse200DataItemOwner? owner?;
    Searchpersonsresponse200DataItemOrganization? organization?;
    # Custom fields
    int? custom_fields?;
    # An array of Notes
    string[]? notes?;
};

public type GetPipelineConversionStatisticsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Pipeline object
    Getpipelineconversionstatisticsresponse200Data? data?;
};

# The ID of the Deal which is associated with the item
public type Getactivitiesresponse200RelatedObjectsDealDealId record {
    # The ID of the Deal associated with the item
    int? id?;
    # The title of the Deal associated with the item
    string? title?;
    # The status of the Deal associated with the item
    string? status?;
    # The value of the Deal that is associated with the item
    decimal? value?;
    # The currency of the Deal value
    string? currency?;
    # The ID of the stage the Deal is currently at
    int? stage_id?;
    # The ID of the pipeline the Deal is in
    int? pipeline_id?;
};

public type Pipelinerequest1 record {
    # The name of the Pipeline
    string? name?;
    # Whether Deal probability is disabled or enabled for this Pipeline
    record {} deal_probability?;
    # Defines the order of Pipelines. First order (`order_nr=0`) is the default Pipeline.
    int? order_nr?;
    # Whether this Pipeline will be made inactive (hidden) or active
    record {} active?;
};

public type CommentPostPutObject record {
    # Content of the comment in HTML format. Subject to sanitization on the back-end.
    string? content;
};

public type Getactivitiesresponse200RelatedObjectsOrganization record {
    # The ID of the Organization associated with the item
    record {} ORGANIZATION_ID?;
};

public type AddPersonPictureRequest record {
    # One image supplied in the multipart/form-data encoding.
    string? file;
    # X coordinate to where start cropping form (in pixels)
    int? crop_x?;
    # Y coordinate to where start cropping form (in pixels)
    int? crop_y?;
    # Width of cropping area (in pixels)
    int? crop_width?;
    # Height of cropping area (in pixels)
    int? crop_height?;
};

public type Getactivitiesresponse200RelatedObjectsUser record {
    record {} USER_ID?;
};

public type UpdateFieldRequest record {
    # Name of the field
    string? name?;
    # When `field_type` is either set or enum, possible options must be supplied as a JSON-encoded sequential array of objects. All active items must be supplied and already existing items must have their ID supplied. New items only require a label. Example: `[{"id":123,"label":"Existing Item"},{"label":"New Item"}]`
    string? options?;
    # Whether the field is available in 'add new' modal or not (both in web and mobile app)
    boolean? add_visible_flag?;
};

public type MergeOrganizationsRequest record {
    # The ID of the Organization that the Organization will be merged with
    int? merge_with_id;
};

public type UpdateTeamRequest2 record {
    # Flag that indicates if the Team is activated
    record {} active_flag?;
    # Flag that indicates if the Team is deleted
    record {} deleted_flag?;
};

public type Getpersonproductsresponse200DealIdProduct record {
    # The ID of the Product
    int? id?;
    # The ID of the company
    int? company_id?;
    # The name of the product
    string? name?;
    # Product code
    string? code?;
    # The Description of the Product
    string? description?;
    # Unit in which this product is sold
    string? unit?;
    # Tax percentage
    decimal? tax?;
    # Category of the Product
    string? category?;
    # Whether this product will be made active or not
    decimal? active_flag?;
    # Whether this product can be selected in Deals or not
    decimal? selectable?;
    # The First letter of the Product name
    string? first_char?;
    # Visibility of the product. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # The ID of the user who will be marked as the owner of this product. When omitted, authorized user ID will be used.
    int? owner_id?;
    # Files count
    int? files_count?;
    # Followers count
    int? followers_count?;
    # The date and time when the Product was added to the Deal
    string? add_time?;
    # The date and time when the Product was updated to the Deal
    string? update_time?;
    # The ID of the Deal
    int? deal_id?;
};

public type UpdateTeamRequest1 record {
    # The Team name
    string? name;
    # The Team description
    string? description?;
    # The Team manager ID
    int? manager_id;
    # List of User IDs
    int[]? users?;
};

public type UpdateMailThreadDetailsRequest record {
    # The ID of the deal this thread is associated with
    int? deal_id?;
    # The ID of the lead this thread is associated with
    string? lead_id?;
    # Whether this thread is shared with other users in your company
    record {} shared_flag?;
    # Whether this thread read or unread
    record {} read_flag?;
    # Whether this thread is archived or not. You can only archive threads that belong to Inbox folder. Archived threads will disappear from Inbox.
    record {} archived_flag?;
};

public type GetAddProductAttachementResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The added Product object attached to the Deal
    record {# The ID of the deal-product (the ID of the Product attached to the Deal)
        int? product_attachment_id?;} data?;
};

public type AddOrUpdateRoleSettingResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Addorupdaterolesettingresponse200Data? data?;
};

public type Addactivityresponse200AdditionalData record {
    # This field will be deprecated
    int? updates_story_id?;
};

public type Addorganizationrelationshipresponse200Data record {
    # The ID of the Organization Relationship
    int? id?;
    # The type of the Relationship
    string? 'type?;
    record {*RelationshipOrganizationInfoItem1; *RelationshipOrganizationInfoItem2;} rel_owner_org_id?;
    record {*RelationshipOrganizationInfoItem1; *RelationshipOrganizationInfoItem2;} rel_linked_org_id?;
    # The creation date and time of the Relationship
    string? add_time?;
    # The last updated date and time of the Relationship
    string? update_time?;
    # If the Relationship is active or not
    string? active_flag?;
};

public type BasicGoalRequest record {
    # Title of the goal.
    string? title?;
    # Who is this goal assigned to. It requires the following JSON structure: { "id": "1", "type": "person" }. `type` can be either `person`, `company` or `team`. ID of the assignee person, company or team.
    record {} assignee?;
    # Type of the goal. It requires the following JSON structure: { "name": "deals_started", "params": { "pipeline_id": 1 } }. Type can be one of: `deals_won`, `deals_progressed`, `activities_completed`, `activities_added`, `deals_started` or `revenue_forecast`. `params` can include `pipeline_id`, `stage_id` or `activity_type_id`. `stage_id` is related to only `deals_progressed` type of goals and `activity_type_id` to `activities_completed` or `activities_added` types of goals. To track goal in all pipelines set `pipeline_id` as `null`.
    record {} 'type?;
    # Expected outcome of the goal. Expected outcome can be tracked either by `quantity` or by `sum`. It requires the following JSON structure: { "target": "50", "tracking_metric": "quantity" } or { "target": "50", "tracking_metric": "sum", "currency_id": 1 }. `currency_id` should only be added to `sum` type of goals.
    record {} expected_outcome?;
    # Date when the goal starts and ends. It requires the following JSON structure: { "start": "2019-01-01", "end": "2022-12-31" }. Date in format of YYYY-MM-DD. "end" can be set to `null` for an infinite, open-ended goal.
    record {} duration?;
    # Interval of the goal
    string? interval?;
};

public type Deletepersonresponse200Data record {
    # The ID of the deleted Person
    int? id?;
};

public type Getleadsourcesresponse200Data record {
    # The unique name of a Lead Source
    string? name?;
};

public type GetAssociatedDealsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The array of Deals
    DealNonStrict[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getassociateddealsresponse200RelatedObjects? related_objects?;
};

public type RelationshipOrganizationInfoItem1 record {
    # The name of the Organization associated with the item
    string? name?;
    # The number of people connected with the Organization that is associated with the item
    int? people_count?;
    # The ID of the owner of the Organization that is associated with the item
    int? owner_id?;
    # The address of the Organization
    string? address?;
    # The CC email of the Organization associated with the item
    string? cc_email?;
};

public type RelationshipOrganizationInfoItem2 record {
    # The ID of the Organization
    int? value?;
};

public type GetRoleResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The details of the sub-role
    SubRole? data?;
    # The additional data in the Role
    Getroleresponse200AdditionalData? additional_data?;
};

public type PersonNameInfoWithOrgAndOwnerId1 record {
    record {*Owner1; *Owner2;} owner_id?;
    record {*RelationshipOrganizationInfoItemWithActiveFlag1; *RelationshipOrganizationInfoItemWithActiveFlag2;} org_id?;
};

public type PersonNameInfoWithOrgAndOwnerId2 record {
    # The name of the Person
    string? name?;
    # The first name of the Person
    string? first_name?;
    # The last name of the Person
    string? last_name?;
};

public type Searchdealsresponse200DataItem record {
    # The ID of the Deal
    int? id?;
    # The type of the Item
    string? 'type?;
    # The title of the Deal
    string? title?;
    # The value of the Deal
    int? value?;
    # The currency of the Deal
    int? currency?;
    # The status of the Deal
    string? status?;
    # The visibility of the Deal
    int? visible_to?;
    Searchdealsresponse200DataItemOwner? owner?;
    Searchdealsresponse200DataItemStage? stage?;
    Searchdealsresponse200DataItemPerson? person?;
    Searchdealsresponse200DataItemOrganization? organization?;
    # Custom fields
    int? custom_fields?;
    # An array of Notes
    string[]? notes?;
};

public type GetStageResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The Stage object
    record {} data?;
};

public type Addorupdategoalresponse200Data record {
    Addorupdategoalresponse200DataGoal? goal?;
};

public type UserAssignmentsToPermissionSetResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # An array of the assignments of the User
    Userassignmentstopermissionsetresponse200Data[]? data?;
};

public type Searchdealsresponse200DataItemOwner record {
    # The ID of the owner of the Deal
    int? id?;
};

# The response data
public type Updateroleresponse200Data record {
    # The ID of the updated role
    record {} id?;
};

public type DealsCountAndActivityInfo record {
    *DealsCountAndActivityInfo1;
    *DealsCountAndActivityInfo2;
};

public type AddCallLogResponse200 record {
    # If the response is successful or not
    boolean? success?;
    ResponseCallLogObject? data?;
};

# The ID of the User
public type Activitydistributiondatawithadditionaldata1ActivityDistributionAssignedToUserId record {
    # The count of Activities related to the User grouped by Activity type
    Activitydistributiondatawithadditionaldata1ActivityDistributionAssignedToUserIdActivities? activities?;
    # The name of the User
    string? name?;
    # The overall count of Activities for the User
    int? activity_count?;
    # The percentage of Activities belongs to the User
    int? share?;
};

# Open and won Deals grouped into periods by defined interval, amount and date-type dealField (`field_key`)
public type Getdealstimelineresponse200Data record {
    # The start date and time of the period
    string? period_start?;
    # The end date and time of the period
    string? period_end?;
    # The array of Deal objects
    DealStrict[]? deals?;
    # The total values of Deals for the given period
    Getdealstimelineresponse200DataTotals? totals?;
};

public type GetOrganizationRelationshipResponse200 record {
    # If the response is successful or not
    boolean? success?;
    OrganizationRelationshipWithCalculatedFields? data?;
    Getorganizationrelationshipsresponse200RelatedObjects? related_objects?;
};

public type AddDealParticipantRequest record {
    # ID of the person
    int? person_id;
};

public type BasicDeal record {
    # Deal title
    string? title?;
    # Value of the deal. If omitted, value will be set to 0.
    string? value?;
    # Currency of the deal. Accepts a 3-character currency code. If omitted, currency will be set to the default currency of the authorized user.
    string? currency?;
    # ID of the user who will be marked as the owner of this deal. If omitted, the authorized user ID will be used.
    int? user_id?;
    # ID of the person this deal will be associated with
    int? person_id?;
    # ID of the organization this deal will be associated with
    int? org_id?;
    # ID of the stage this deal will be placed in a pipeline (note that you can't supply the ID of the pipeline as this will be assigned automatically based on `stage_id`). If omitted, the deal will be placed in the first stage of the default pipeline.
    int? stage_id?;
    # open = Open, won = Won, lost = Lost, deleted = Deleted. If omitted, status will be set to open.
    string? status?;
    # The expected close date of the Deal. In ISO 8601 format: YYYY-MM-DD.
    string? expected_close_date?;
    # Deal success probability percentage. Used/shown only when `deal_probability` for the pipeline of the deal is enabled.
    decimal? probability?;
    # Optional message about why the deal was lost (to be used when status=lost)
    string? lost_reason?;
    # Visibility of the deal. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
};

public type OrganizationItem record {
    *BaseOrganizationItemWithEditNameFlag;
    *OrganizationItem1;
};

public type BaseOrganizationItemWithEditNameFlag1 record {
    # If the company ID of the Organization and company ID of the request is same or not
    boolean? edit_name?;
};

public type User record {
    *User1;
    *User2;
};

public type AddActivityTypeRequest record {
    # The name of the ActivityType
    string? name;
    # Icon graphic to use for representing this activity type.
    string? icon_key;
    # A designated color for the ActivityType in 6-character HEX format (e.g. `FFFFFF` for white, `000000` for black)
    string? color?;
};

public type DeleteDealsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deletedealsresponse200Data? data?;
};

# The pagination details in the Role list
public type Getrolesresponse200AdditionalDataPagination record {
    # Pagination start
    int? 'start?;
    # Items shown per page
    int? 'limit?;
    # Whether there are more list items in the collection than displayed
    boolean? more_items_in_collection?;
};

public type BaseDeal record {
    # The ID of the Deal stage
    int? stage_id?;
    # The title of the Deal
    string? title?;
    # The value of the Deal
    decimal? value?;
    # The currency associated with the Deal
    string? currency?;
    # The creation date and time of the Deal
    string? add_time?;
    # The last updated date and time of the Deal
    string? update_time?;
    # The last updated date and time of the Deal stage
    string? stage_change_time?;
    # If the Deal is activated or not
    boolean? active?;
    # If the Deal is deleted or not
    boolean? deleted?;
    # The status of the Deal
    string? status?;
    # The success probability percentage of the Deal
    decimal? probability?;
    # The date of the next activity associated with the Deal
    string? next_activity_date?;
    # The time of the next activity associated with the Deal
    string? next_activity_time?;
    # The ID of the next activity associated with the Deal
    int? next_activity_id?;
    # The ID of the last activity associated with the Deal
    int? last_activity_id?;
    # The date of the last activity associated with the Deal
    string? last_activity_date?;
    # The reason for losing the Deal
    string? lost_reason?;
    # The visibility of the Deal
    string? visible_to?;
    # The date and time of closing the Deal
    string? close_time?;
    # The ID of pipeline associated with the Deal
    int? pipeline_id?;
    # The date and time of changing the Deal status as won
    string? won_time?;
    # The date and time of the first time changing the Deal status as won
    string? first_won_time?;
    # The date and time of changing the Deal status as lost
    string? lost_time?;
    # The number of Products associated with the Deal
    int? products_count?;
    # The number of Files associated with the Deal
    int? files_count?;
    # The number of Notes associated with the Deal
    int? notes_count?;
    # The number of Followers associated with the Deal
    int? followers_count?;
    # The number of emails associated with the Deal
    int? email_messages_count?;
    # The number of Activities associated with the Deal
    int? activities_count?;
    # The number of completed Activities associated with the Deal
    int? done_activities_count?;
    # The number of incomplete Activities associated with the Deal
    int? undone_activities_count?;
    # The number of Participants associated with the Deal
    int? participants_count?;
    # The expected close date of the Deal
    string? expected_close_date?;
    # The date and time of the last incoming email associated with the Deal
    string? last_incoming_mail_time?;
    # The date and time of the last outgoing email associated with the Deal
    string? last_outgoing_mail_time?;
    # The label assigned to the Deal
    string? label?;
    # The order number of the Deal stage associated with the Deal
    int? stage_order_nr?;
    # The name of the Person associated with the Deal
    string? person_name?;
    # The name of the Organization associated with the Deal
    string? org_name?;
    # The subject of the next activity associated with the Deal
    string? next_activity_subject?;
    # The type of the next activity associated with the Deal
    string? next_activity_type?;
    # The duration of the next activity associated with the Deal
    string? next_activity_duration?;
    # The note of the next activity associated with the Deal
    string? next_activity_note?;
    # The Deal value formatted with selected currency. E.g. US$500
    string? formatted_value?;
    # Probability times Deal value. Probability can either be Deal probability or if not set, then stage probability.
    decimal? weighted_value?;
    # The weighted_value formatted with selected currency. E.g. US$500
    string? formatted_weighted_value?;
    # The currency associated with the Deal
    string? weighted_value_currency?;
    # The date and time of changing the Deal status as rotten
    string? rotten_time?;
    # The name of the Deal owner
    string? owner_name?;
    # The Cc email of the Deal
    string? cc_email?;
    # If the Organization that is associated with the Deal is hidden or not
    boolean? org_hidden?;
    # If the Person that is associated with the Deal is hidden or not
    boolean? person_hidden?;
};

public type AddRoleAssignmentResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Addroleassignmentresponse200Data? data?;
};

public type AddFileResponse200 record {
    # If the request was successful or not
    boolean? success?;
    # The File data
    Getassociatedfilesresponse200Data? data?;
};

# The mail thread object
#
public type BaseMailThread record {
    *BaseMailThread1;
    *BaseMailThread2;
};

public type GetDealResponse200 record {
    # If the response is successful or not
    boolean? success?;
    DealNonStrict? data?;
    Getdealresponse200AdditionalData? additional_data?;
    Getdealsresponse200RelatedObjects? related_objects?;
};

public type ProductFieldData record {
    *ProductField1;
    *ProductField2;
};

public type GetWebhooksResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The status of the response
    string? status?;
    # The array of Webhooks
    Getwebhooksresponse200Data[]? data?;
};

public type BasicDealProductRequestData record {
    *BasicDealProductRequestData1;
    *BasicDealProductRequestData2;
};

public type PersonCountAndEmailInfo1 record {
    # The count of email messages related to the Person
    int? email_messages_count?;
    # The count of activities related to the Person
    int? activities_count?;
    # The count of done activities related to the Person
    int? done_activities_count?;
    # The count of undone activities related to the Person
    int? undone_activities_count?;
    # The count of files related to the Person
    int? files_count?;
    # The count of notes related to the Person
    int? notes_count?;
    # The count of followers related to the Person
    int? followers_count?;
};

public type PersonCountAndEmailInfo2 record {
    # The date and time of the last incoming email associated with the Person
    string? last_incoming_mail_time?;
    # The date and time of the last outgoing email associated with the Person
    string? last_outgoing_mail_time?;
};

public type NewFollowerResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Newfollowerresponse200Data? data?;
};

public type AddPipelineResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Pipeline object
    Addpipelineresponse200Data? data?;
};

public type SubscriptionsIdResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Subscriptionsidresponse200Data? data?;
};

public type Searchproductsresponse200DataItem record {
    # The ID of the Product
    int? id?;
    # The type of the item
    string? 'type?;
    # The name of the Product
    string? name?;
    # The code of the Product
    int? code?;
    # The visibility of the Product
    int? visible_to?;
    Searchproductsresponse200DataItemOwner? owner?;
    # Custom fields
    int? custom_fields?;
};

public type Getactivitytypesresponse200Data record {
    # The ID of the ActivityType
    int? id?;
    # The name of the ActivityType
    string? name?;
    # Icon graphic to use for representing this activity type.
    string? icon_key?;
    # A designated color for the ActivityType in 6-character HEX format (e.g. `FFFFFF` for white, `000000` for black)
    string? color?;
    # An order number for this ActivityType. Order numbers should be used to order the types in the ActivityType selections.
    int? order_nr?;
    # A string that is generated by the API based on the given name of the ActivityType upon creation
    string? key_string?;
    # The active flag of the ActivityType
    boolean? active_flag?;
    # Whether the ActivityType is a custom one or not
    boolean? is_custom_flag?;
    # The creation time of the ActivityType
    string? add_time?;
    # The update time of the ActivityType
    string? update_time?;
};

public type DeleteProductFollowerResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Deleteproductfollowerresponse200Data? data?;
};

public type GetUserCallLogsResponse200 record {
    # If the response is successful or not
    boolean? success?;
};

public type GetProductsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # Array containing data for all Products
    Getproductresponse2001[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getactivitiesresponse200RelatedObjects? related_objects?;
};

# Type of the goal
public type GoalType record {
    # Name of the goal type
    string? name?;
    # Parameters that accompany the goal type
    GoalTypeParams? params?;
};

public type Getleadsresponse200Data record {
    # The unique ID of the Lead in the UUID format
    string? id?;
    # The title of the Lead
    string? title?;
    # The ID of the User who owns the Lead
    int? owner_id?;
    # The ID of the User who created the Lead
    int? creator_id?;
    # The IDs of the Lead Labels which are associated with the Lead
    string[]? label_ids?;
    # The ID of a Person which this Lead is linked to
    int? person_id?;
    # The ID of an Organization which this Lead is linked to
    int? organization_id?;
    # Defines where the Lead comes from. Will be `API` if the Lead was created through the Public API and will be `Manually created` if the Lead was created manually through the UI.
    string? source_name?;
    # A flag indicating whether the Lead is archived or not
    boolean? is_archived?;
    # A flag indicating whether the Lead was seen by someone in the Pipedrive UI
    boolean? was_seen?;
    # The potential value of the Lead.
    LeadsValue? value?;
    # The date of when the Deal which will be created from the Lead is expected to be closed. In ISO 8601 format: YYYY-MM-DD.
    string? expected_close_date?;
    # The ID of the next activity associated with the Lead
    int? next_activity_id?;
    # The date and time of when the Lead was created. In ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
    string? add_time?;
    # The date and time of when the Lead was last updated. In ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
    string? update_time?;
    # Visibility of the Lead. If omitted, visibility will be set to the default visibility setting of this item type for the authorized user.<table><tr><th>Value</th><th>Description</th></tr><tr><td>`1`</td><td>Owner &amp; followers (private)</td></tr><tr><td>`3`</td><td>Entire company (shared)</td></tr></table>
    record {} visible_to?;
    # The CC email of the lead
    string? cc_email?;
};

public type ResponseCallLogObject1 record {
    # The call log ID, generated when the call log was created
    string? id?;
    # If the call log has an audio recording attached, the value should be true
    boolean? has_recording?;
    # The Company ID of the owner of the call log
    int? company_id?;
};

public type Getnotesresponse200Data record {
    # The ID of the Note
    int? id?;
    # If Note is active or deleted
    boolean? active_flag?;
    # The creation date and time of the Note
    string? add_time?;
    # Content of the Note in HTML format. Subject to sanitization on the back-end.
    string? content?;
    # The Deal this Note is attached to
    Getnotesresponse200Deal? deal?;
    # The ID of the Lead the Note is attached to
    string? lead_id?;
    # The ID of the Deal the Note is attached to
    int? deal_id?;
    # The ID of the User who updated the Note last
    int? last_update_user_id?;
    # The ID of the Organization this Note is attached to
    int? org_id?;
    # The Organization this Note is attached to
    Getnotesresponse200Organization? organization?;
    # The Person this Note is attached to
    Getnotesresponse200Person? person?;
    # The ID of the Person this Note is attached to
    int? person_id?;
    # If true, then the results are filtered by Note to Deal pinning state.
    boolean? pinned_to_deal_flag?;
    # If true, then the results are filtered by Note to Organization pinning state.
    boolean? pinned_to_organization_flag?;
    # If true, then the results are filtered by Note to Person pinning state.
    boolean? pinned_to_person_flag?;
    # The last updated date and time of the Note
    string? update_time?;
    # The User who created the Note
    Getnotesresponse200User? user?;
    # The ID of the Note creator
    int? user_id?;
};

public type Getcommentsresponse200Data record {
    # The ID of the Note
    string? uuid?;
    # If Note is active or deleted
    boolean? active_flag?;
    # The creation date and time of the Note
    string? add_time?;
    # The creation date and time of the Note
    string? update_time?;
    # Content of the Note in HTML format. Subject to sanitization on the back-end.
    string? content?;
    # The ID of the object that the comment is attached to, will be the id of the note
    string? object_id?;
    # The type of object that the comment is attached to, will be "note"
    string? object_type?;
    # The ID of the User who created the comment
    int? user_id?;
    # The ID of the User who last updated the comment
    int? updater_id?;
    # The ID of the company
    int? company_id?;
};

public type RoleAssignment1 record {
    # The User ID
    int? user_id?;
    # The Role ID
    int? role_id?;
    # Whether the Role is active or not
    boolean? active_flag?;
    # The assignment type
    string? 'type?;
};

public type WebhooksBadRequestResponse record {
    # If the response is successful or not
    boolean? success?;
    # The status of the response
    string? status?;
    # List of errors
    record {} errors?;
};

public type DeleteRoleResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The response data
    Deleteroleresponse200Data? data?;
};

# The total values of Deals for the given period
public type Getdealstimelineresponse200DataTotals record {
    # The number of Deals for the given period
    int? count?;
    # The total values of Deals grouped by Deal currency
    record {} values?;
    # The total weighted values of Deals for the given period grouped by Deal currency. The weighted value of a Deal is calculated as probability times Deal value.
    record {} weighted_values?;
    # The number of open Deals for the given period
    int? open_count?;
    # The total values of open Deals for the given period grouped by Deal currency
    record {} open_values?;
    # The total weighted values of open Deals for the given period grouped by Deal currency. The weighted value of a Deal is calculated as probability times Deal value.
    record {} weighted_open_values?;
    # The number of won Deals for the given period
    int? won_count?;
    # The total values of won Deals for the given period grouped by Deal currency
    record {} won_values?;
};

public type GetDealUpdatesResponse200 record {
    # If the response is successful or not
    boolean? success?;
    Getdealupdatesresponse200Data[]? data?;
    # The additional data of the list
    Fieldsresponse200AdditionalData? additional_data?;
    Getdealupdatesresponse200RelatedObjects? related_objects?;
};

# Deals summary
public type Getpipelinemovementstatisticsresponse200DataNewDeals record {
    # Deals count
    int? count?;
    # IDs of the Deals that have been moved
    int[]? deals_ids?;
    # Deals values
    Getpipelinemovementstatisticsresponse200DataNewDealsValues? values?;
    # Deals values formatted
    Getpipelinemovementstatisticsresponse200DataNewDealsFormattedValues? formatted_values?;
};

public type GetPipelineMovementStatisticsResponse200 record {
    # If the response is successful or not
    boolean? success?;
    # The Pipeline object
    Getpipelinemovementstatisticsresponse200Data? data?;
};
