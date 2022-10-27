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

import ballerina/http;
import ballerina/constraint;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Provides Auth configurations needed when communicating with a remote HTTP endpoint.
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|ApiKeysConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API key `Authorization`
    @display {label: "", kind: "password"}
    string authorization;
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://connect.squareup.com/oauth2/token";
|};

public type V1EmployeeArr V1Employee[];

public type V1EmployeeRoleArr V1EmployeeRole[];

public type V1OrderArr V1Order[];

public type V1PaymentArr V1Payment[];

public type V1RefundArr V1Refund[];

public type V1SettlementArr V1Settlement[];

@constraint:String {minLength: 1}
public type LoyaltyeventlocationfilterLocationidsItemsString string;

@constraint:String {maxLength: 40, minLength: 1}
public type DisputeEvidenceidsItemsString string;

@constraint:String {maxLength: 191}
public type GiftcardCustomeridsItemsString string;

@constraint:String {minLength: 1}
public type BatchretrieveordersrequestOrderidsItemsString string;

@constraint:String {minLength: 1}
public type LoyaltyprogramLocationidsItemsString string;

@constraint:String {minLength: 1}
public type ShiftfilterLocationidsItemsString string;

@constraint:String {minLength: 1}
public type ShiftfilterTeammemberidsItemsString string;

# Represents a collection of catalog objects for the purpose of applying a
# `PricingRule`. Including a catalog object will include all of its subtypes.
# For example, including a category in a product set will include all of its
# items and associated item variations in the product set. Including an item in
# a product set will also include its item variations.
public type CatalogProductSet record {
    # If set to `true`, the product set will include every item in the catalog.
    # Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
    boolean all_products?;
    # User-defined name for the product set. For example, "Clearance Items"
    # or "Winter Sale Items".
    string name?;
    # Unique IDs for any `CatalogObject` included in this product set.
    # All objects in this set must be included in an order for a pricing rule to apply.
    # 
    # Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
    # 
    # Max: 500 catalog object IDs.
    string[] product_ids_all?;
    #  Unique IDs for any `CatalogObject` included in this product set. Any
    # number of these catalog objects can be in an order for a pricing rule to apply.
    # 
    # This can be used with `product_ids_all` in a parent `CatalogProductSet` to
    # match groups of products for a bulk discount, such as a discount for an
    # entree and side combo.
    # 
    # Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
    # 
    # Max: 500 catalog object IDs.
    string[] product_ids_any?;
    # If set, there must be exactly this many items from `products_any` or `products_all`
    # in the cart for the discount to apply.
    # 
    # Cannot be combined with either `quantity_min` or `quantity_max`.
    int quantity_exact?;
    # If set, the pricing rule will apply to a maximum of this many items from
    # `products_any` or `products_all`.
    int quantity_max?;
    # If set, there must be at least this many items from `products_any` or `products_all`
    # in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if
    # `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
    int quantity_min?;
};

# Provides details about the reward tier discount. DEPRECATED at version 2020-12-16. Discount details
# are now defined using a catalog pricing rule and other catalog objects. For more information, see
# [Get discount details for the reward](https://developer.squareup.com/docs/loyalty-api/overview#get-discount-details).
public type LoyaltyProgramRewardDefinition record {
    # The list of catalog objects to which this reward can be applied. They are either all item-variation ids or category ids, depending on the `type` field.
    # DEPRECATED at version 2020-12-16. You can find this information in the `product_set_data.product_ids_any` field
    # of the `PRODUCT_SET` catalog object referenced by the pricing rule.
    string[] catalog_object_ids?;
    # The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. You can find this information
    # in the `discount_data.discount_type` field of the `DISCOUNT` catalog object referenced by the pricing rule.
    string discount_type;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money fixed_discount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money max_discount_money?;
    # The fixed percentage of the discount. Present if `discount_type` is `FIXED_PERCENTAGE`.
    # For example, a 7.25% off discount will be represented as "7.25". DEPRECATED at version 2020-12-16. You can find this
    # information in the `discount_data.percentage` field of the `DISCOUNT` catalog object referenced by the pricing rule.
    string percentage_discount?;
    # Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. You can find this information in the
    # `discount_target_scope` field of the `PRICING_RULE` catalog object and the `product_set_data` field of the `PRODUCT_SET`
    # catalog object referenced by the pricing rule. For `ORDER` scopes, the target scope is `WHOLE_PURCHASE` and `all_products`
    # is true. For `ITEM_VARIATION` and `CATEGORY` scopes, the target scope is `LINE_ITEM` and `product_ids_any` is a list of
    # catalog object IDs of the given type.
    string scope;
};

# A response that includes the loyalty reward.
public type RetrieveLoyaltyRewardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a contract to redeem loyalty points for a [reward tier](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an ISSUED, REDEEMED, or DELETED state. For more information, see [Redeem loyalty rewards](https://developer.squareup.com/docs/loyalty-api/overview#redeem-loyalty-rewards).
    LoyaltyReward reward?;
};

# The response returned by the `CancelInvoice` request.
public type CancelInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice?;
};

# A file to be uploaded as dispute evidence.
public type DisputeEvidenceFile record {
    # The file name including the file extension. For example: "receipt.tiff".
    @constraint:String {maxLength: 40, minLength: 1}
    string filename?;
    # Dispute evidence files must be application/pdf, image/heic, image/heif, image/jpeg, image/png, or image/tiff formats.
    @constraint:String {maxLength: 40, minLength: 1}
    string filetype?;
};

# 
public type GetTerminalRefundRequest record {
};

# Filter events by location.
public type LoyaltyEventLocationFilter record {
    # The [location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) IDs for loyalty events to query.
    # If multiple values are specified, the endpoint uses 
    # a logical OR to combine them.
    LoyaltyeventlocationfilterLocationidsItemsString[] location_ids;
};

public type InvoiceDeliveryMethodinvoicedeliverymethod anydata;

# A request to create a loyalty reward.
public type CreateLoyaltyRewardRequest record {
    # A unique string that identifies this `CreateLoyaltyReward` request. 
    # Keys can be any valid string, but must be unique for every request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # Represents a contract to redeem loyalty points for a [reward tier](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an ISSUED, REDEEMED, or DELETED state. For more information, see [Redeem loyalty rewards](https://developer.squareup.com/docs/loyalty-api/overview#redeem-loyalty-rewards).
    LoyaltyReward reward;
};

# Request object for the [UpdateLocation](https://developer.squareup.com/reference/square_2021-08-18/locations-api/update-location) endpoint.
public type UpdateLocationRequest record {
    # 
    Location location?;
};

# 
public type CreateBookingRequest record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking;
    # A unique key to make this request an idempotent operation.
    @constraint:String {maxLength: 255}
    string idempotency_key?;
};

public type Status anydata;

# V1EmployeeRole
public type V1EmployeeRole record {
    # The time when the employee entity was created, in ISO 8601 format. Is set by Square when the Role is created.
    string created_at?;
    # The role's unique ID, Can only be set by Square.
    string id?;
    # If true, employees with this role have all permissions, regardless of the values indicated in permissions.
    boolean is_owner?;
    # The role's merchant-defined name.
    string name;
    # The role's permissions.
    string[] permissions;
    # The time when the employee entity was most recently updated, in ISO 8601 format. Is set by Square when the Role updated.
    string updated_at?;
};

# A reference to a Catalog object at a specific version. In general this is
# used as an entry point into a graph of catalog objects, where the objects exist
# at a specific version.
public type CatalogObjectReference record {
    # The version of the object.
    int catalog_version?;
    # The ID of the referenced object.
    string object_id?;
};

# Payment include an` itemizations` field that lists the items purchased,
# along with associated fees, modifiers, and discounts. Each itemization has an
# `itemization_type` field that indicates which of the following the itemization
# represents:
# 
# <ul>
# <li>An item variation from the merchant's item library</li>
# <li>A custom monetary amount</li>
# <li>
# An action performed on a Square gift card, such as activating or
# reloading it.
# </li>
# </ul>
# 
# *Note**: itemization information included in a `Payment` object reflects
# details collected **at the time of the payment**. Details such as the name or
# price of items might have changed since the payment was processed.
public type V1PaymentItemization record {
    # 
    V1Money discount_money?;
    # All discounts applied to this itemization.
    V1PaymentDiscount[] discounts?;
    # 
    V1Money gross_sales_money?;
    # V1PaymentItemDetail
    V1PaymentItemDetail item_detail?;
    # The name of the item variation purchased, if any.
    string item_variation_name?;
    # The type of purchase that the itemization represents, such as an ITEM or CUSTOM_AMOUNT
    string itemization_type?;
    # All modifier options applied to this itemization.
    V1PaymentModifier[] modifiers?;
    # The item's name.
    string name?;
    # 
    V1Money net_sales_money?;
    # Notes entered by the merchant about the item at the time of payment, if any.
    string notes?;
    # The quantity of the item purchased. This can be a decimal value.
    decimal quantity?;
    # 
    V1Money single_quantity_money?;
    # All taxes applied to this itemization.
    V1PaymentTax[] taxes?;
    # 
    V1Money total_money?;
};

# A request to create a gift card activity.
public type CreateGiftCardActivityRequest record {
    # Represents an action performed on a gift card that affects its state or balance.
    GiftCardActivity gift_card_activity;
    # A unique string that identifies the `CreateGiftCardActivity` request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
};

# Determines item visibility in Ecom (Online Store) and Online Checkout.
public type EcomVisibility string;

# 
public type BatchRetrieveInventoryChangesResponse record {
    # The current calculated inventory changes for the requested objects
    # and locations.
    InventoryChange[] changes?;
    # The pagination cursor to be used in a subsequent request. If unset,
    # this is the final response.
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The response to a request for a set of `BreakType` objects. The response contains
# the requested `BreakType` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type ListBreakTypesResponse record {
    #  A page of `BreakType` results.
    BreakType[] break_types?;
    # The value supplied in the subsequent request to fetch the next page
    # of `BreakType` results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# An employee object that is used by the external API.
public type Employee record {
    # A read-only timestamp in RFC 3339 format.
    string created_at?;
    # The employee's email address
    string email?;
    # The employee's first name.
    string first_name?;
    # UUID for this object.
    string id?;
    # Whether this employee is the owner of the merchant. Each merchant
    # has one owner employee, and that employee has full authority over
    # the account.
    boolean is_owner?;
    # The employee's last name.
    string last_name?;
    # A list of location IDs where this employee has access to.
    string[] location_ids?;
    # The employee's phone number in E.164 format, i.e. "+12125554250"
    string phone_number?;
    # Specifies the status of the employees being fetched.
    string status?;
    # A read-only timestamp in RFC 3339 format.
    string updated_at?;
};

# The hourly wage rate that a team member earns on a `Shift` for doing the job
# specified by the `title` property of this object.
public type TeamMemberWage record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money hourly_rate?;
    # The UUID for this object.
    string id?;
    # The `TeamMember` that this wage is assigned to.
    string team_member_id?;
    # The job title that this wage relates to.
    string title?;
};

# 
public type V1ListEmployeesRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format.
    string begin_created_at?;
    # If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format
    string begin_updated_at?;
    # If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format.
    string end_created_at?;
    # If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format.
    string end_updated_at?;
    # If provided, the endpoint returns only employee entities with the specified external_id.
    string external_id?;
    # The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
    int 'limit?;
    # The order in which employees are listed in the response, based on their created_at field.      Default value: ASC
    string 'order?;
    # If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE).
    string status?;
};

# 
public type CatalogDiscountModifyTaxBasis string;

# Whether to the tax amount should be additional to or included in the CatalogItem price.
public type TaxInclusionType string;

# Describes when the loyalty program expires.
public type LoyaltyProgramExpirationPolicy record {
    # The number of months before points expire, in `P[n]M` RFC 3339 duration format. For example, a value of `P12M` represents a duration of 12 months. 
    # Points are valid through the last day of the month in which they are scheduled to expire. For example, with a  `P12M` duration, points earned on July 6, 2020 expire on August 1, 2021.
    @constraint:String {minLength: 1}
    string expiration_duration;
};

# The current state of a cash drawer shift.
public type CashDrawerShiftState string;

# Describes the request to cancel (void) a payment using 
# [CancelPayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/cancel-payment). 
# You can only cancel a payment that is approved (not completed).
# For more information, see 
# [Delayed capture of a payment](https://developer.squareup.com/docs/payments-api/take-payments/card-payments#delayed-capture-of-a-card-payment).
public type CancelPaymentRequest record {
};

# The payment the cardholder disputed.
public type DisputedPayment record {
    # Square-generated unique ID of the payment being disputed.
    @constraint:String {maxLength: 192, minLength: 1}
    string payment_id?;
};

# Reflects the current status of a card payment. Contains only non-confidential information.
public type CardPaymentDetails record {
    # For EMV payments, the cryptogram generated for the payment.
    @constraint:String {maxLength: 16}
    string application_cryptogram?;
    # For EMV payments, the application ID identifies the EMV application used for the payment.
    @constraint:String {maxLength: 32}
    string application_identifier?;
    # For EMV payments, the human-readable name of the EMV application used for the payment.
    @constraint:String {maxLength: 16}
    string application_name?;
    # The status code returned by the card issuer that describes the payment's
    # authorization status.
    @constraint:String {maxLength: 10}
    string auth_result_code?;
    # The status code returned from the Address Verification System (AVS) check. The code can be
    # `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
    @constraint:String {maxLength: 50}
    string avs_status?;
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # The timeline for card payments.
    CardPaymentTimeline card_payment_timeline?;
    # The status code returned from the Card Verification Value (CVV) check. The code can be
    # `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
    @constraint:String {maxLength: 50}
    string cvv_status?;
    # Details about the device that took the payment.
    DeviceDetails device_details?;
    # The method used to enter the card's details for the payment. The method can be
    # `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
    @constraint:String {maxLength: 50}
    string entry_method?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # Whether the card must be physically present for the payment to
    # be refunded.  If set to `true`, the card must be present.
    boolean refund_requires_card_presence?;
    # The statement description sent to the card networks.
    # 
    # Note: The actual statement description varies and is likely to be truncated and appended with
    # additional information on a per issuer basis.
    @constraint:String {maxLength: 50}
    string statement_description?;
    # The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED, or
    # FAILED.
    @constraint:String {maxLength: 50}
    string status?;
    # For EMV payments, the method used to verify the cardholder's identity. The method can be
    # `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
    @constraint:String {maxLength: 50}
    string verification_method?;
    # For EMV payments, the results of the cardholder verification. The result can be
    # `SUCCESS`, `FAILURE`, or `UNKNOWN`.
    @constraint:String {maxLength: 50}
    string verification_results?;
};

# Defines the fields that are included in the request body for
# the __RetrieveLocation__ endpoint.
public type RetrieveLocationRequest record {
};

# Represents a Square seller.
public type Merchant record {
    # The business name of the merchant.
    string business_name?;
    # The country code associated with the merchant account, in ISO 3166 format.
    string country;
    # The currency associated with the merchant account, in ISO 4217 format.
    string currency?;
    # The Square-issued ID of the merchant.
    string id?;
    # The language code associated with the merchant account, in BCP 47 format.
    string language_code?;
    # The ID of the main `Location` for this merchant.
    string main_location_id?;
    # The merchant status, active or inactive.
    string status?;
};

# Indicates the current verification status of a `BankAccount` object.
public type BankAccountStatus string;

# A request to get a `TeamMemberWage`.
public type GetTeamMemberWageRequest record {
};

# Filtering criteria to use for a `SearchOrders` request. Multiple filters
# are ANDed together.
public type SearchOrdersFilter record {
    # A filter based on the order `customer_id` and any tender `customer_id`
    # associated with the order. It does not filter based on the
    # [FulfillmentRecipient](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderFulfillmentRecipient) `customer_id`.
    SearchOrdersCustomerFilter customer_filter?;
    # Filter for `Order` objects based on whether their `CREATED_AT`,
    # `CLOSED_AT`, or `UPDATED_AT` timestamps fall within a specified time range.
    # You can specify the time range and which timestamp to filter for. You can filter
    # for only one time range at a time.
    # 
    # For each time range, the start time and end time are inclusive. If the end time
    # is absent, it defaults to the time of the first request for the cursor.
    # 
    # __Important:__ If you use the `DateTimeFilter` in a `SearchOrders` query,
    # you must set the `sort_field` in [OrdersSort](https://developer.squareup.com/reference/square_2021-08-18/objects/SearchOrdersSort)
    # to the same field you filter for. For example, if you set the `CLOSED_AT` field
    # in `DateTimeFilter`, you must set the `sort_field` in `SearchOrdersSort` to
    # `CLOSED_AT`. Otherwise, `SearchOrders` throws an error.
    # [Learn more about filtering orders by time range.](https://developer.squareup.com/docs/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range)
    SearchOrdersDateTimeFilter date_time_filter?;
    # Filter based on [order fulfillment](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderFulfillment) information.
    SearchOrdersFulfillmentFilter fulfillment_filter?;
    # A filter based on order `source` information.
    SearchOrdersSourceFilter source_filter?;
    # Filter by the current order `state`.
    SearchOrdersStateFilter state_filter?;
};

# Defines the request parameters for the `AcceptDispute` endpoint.
public type AcceptDisputeRequest record {
};

# Represents a bank account. For more information about 
# linking a bank account to a Square account, see 
# [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
public type BankAccount record {
    # The last few digits of the account number.
    @constraint:String {minLength: 1}
    string account_number_suffix;
    # The financial purpose of the associated bank account.
    string account_type;
    # Read only. Name of actual financial institution. 
    # For example "Bank of America".
    @constraint:String {maxLength: 100}
    string bank_name?;
    # The ISO 3166 Alpha-2 country code where the bank account is based.
    string country;
    # Indicates whether it is possible for Square to send money to this bank account.
    boolean creditable;
    # The 3-character ISO 4217 currency code indicating the operating
    # currency of the bank account. For example, the currency code for US dollars
    # is `USD`.
    string currency;
    # Reference identifier that will be displayed to UK bank account owners
    # when collecting direct debit authorization. Only required for UK bank accounts.
    string debit_mandate_reference_id?;
    # Indicates whether it is possible for Square to take money from this 
    # bank account.
    boolean debitable;
    # A Square-assigned, unique identifier for the bank account based on the
    # account information. The account fingerprint can be used to compare account
    # entries and determine if the they represent the same real-world bank account.
    string fingerprint?;
    # Name of the account holder. This name must match the name 
    # on the targeted bank account record.
    @constraint:String {minLength: 1}
    string holder_name;
    # The unique, Square-issued identifier for the bank account.
    @constraint:String {maxLength: 30, minLength: 1}
    string id;
    # The location to which the bank account belongs.
    string location_id?;
    # Primary identifier for the bank. For more information, see 
    # [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    @constraint:String {maxLength: 40}
    string primary_bank_identification_number;
    # Client-provided identifier for linking the banking account to an entity
    # in a third-party system (for example, a bank account number or a user identifier).
    string reference_id?;
    # Secondary identifier for the bank. For more information, see 
    # [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    @constraint:String {maxLength: 40}
    string secondary_bank_identification_number?;
    # Read-only. The current verification status of this BankAccount object.
    string status;
    # The current version of the `BankAccount`.
    int 'version?;
};

# 
public type SearchCatalogObjectsRequest record {
    # Return objects modified after this [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), in RFC 3339
    # format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects with a
    # timestamp equal to `begin_time` will not be included in the response.
    string begin_time?;
    # The pagination cursor returned in the previous response. Leave unset for an initial request.
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # If `true`, deleted objects will be included in the results. Deleted objects will have their
    # `is_deleted` field set to `true`.
    boolean include_deleted_objects?;
    # If `true`, the response will include additional objects that are related to the
    # requested object, as follows:
    # 
    # If a CatalogItem is returned in the object field of the response,
    # its associated CatalogCategory, CatalogTax objects,
    # CatalogImage objects and CatalogModifierList objects
    # will be included in the `related_objects` field of the response.
    # 
    # If a CatalogItemVariation is returned in the object field of the
    # response, its parent CatalogItem will be included in the `related_objects` field of
    # the response.
    boolean include_related_objects?;
    # A limit on the number of results to be returned in a single page. The limit is advisory -
    # the implementation may return more or fewer results. If the supplied limit is negative, zero, or
    # is higher than the maximum limit of 1,000, it will be ignored.
    int 'limit?;
    # The desired set of object types to appear in the search results.
    string[] object_types?;
    # A query composed of one or more different types of filters to narrow the scope of targeted objects when calling the `SearchCatalogObjects` endpoint.
    # 
    # Although a query can have multiple filters, only certain query types can be combined per call to [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-objects).
    # Any combination of the following types may be used together:
    # - [exact_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryExact)
    # - [prefix_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryPrefix)
    # - [range_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryRange)
    # - [sorted_attribute_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQuerySortedAttribute)
    # - [text_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryText)
    # All other query types cannot be combined with any others.
    # 
    # When a query filter is based on an attribute, the attribute must be searchable.
    # Searchable attributes are listed as follows, along their parent types that can be searched for with applicable query filters.
    # 
    # * Searchable attribute and objects queryable by searchable attributes **
    # - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, 'CatalogModifierList`, `CatalogItemOption`, `CatalogItemOptionValue`
    # - `description`: `CatalogItem`, `CatalogItemOptionValue`
    # - `abbreviation`: `CatalogItem`
    # - `upc`: `CatalogItemVariation`
    # - `sku`: `CatalogItemVariation`
    # - `caption`: `CatalogImage`
    # - `display_name`: `CatalogItemOption`
    # 
    # For example, to search for [CatalogItem](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItem) objects by searchable attributes, you can use
    # the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable query filter.
    CatalogQuery query?;
};

# Represents the naming used for loyalty points.
public type LoyaltyProgramTerminology record {
    # A singular unit for a point (for example, 1 point is called 1 star).
    @constraint:String {minLength: 1}
    string one;
    # A plural unit for point (for example, 10 points is called 10 stars).
    @constraint:String {minLength: 1}
    string other;
};

# Describes a gift card activity of the DEACTIVATE type.
public type GiftCardActivityDeactivate record {
    Reason reason;
};

# Defines the parameters that can be included in the body of
# a request to the [RegisterDomain](https://developer.squareup.com/reference/square_2021-08-18/apple-pay-api/register-domain) endpoint.
public type RegisterDomainRequest record {
    # A domain name as described in RFC-1034 that will be registered with ApplePay.
    @constraint:String {maxLength: 255, minLength: 1}
    string domain_name;
};

# Specifies customer attributes as the sort key to customer profiles returned from a search.
public type CustomerSortField string;

# 
public type TerminalCheckoutQueryFilter record {
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange created_at?;
    # The `TerminalCheckout` objects associated with a specific device. If no device is specified, then all
    # `TerminalCheckout` objects for the merchant are displayed.
    string device_id?;
    # Filtered results with the desired status of the `TerminalCheckout`.
    # Options: PENDING, IN_PROGRESS, CANCELED, COMPLETED
    string status?;
};

# A request to get an `EmployeeWage`.
public type GetEmployeeWageRequest record {
};

# Indicates whether this is a line-item or order-level discount.
public type OrderLineItemDiscountScope string;

# Defines the fields that are included in the response from the
# [CreateSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/create-subscription) endpoint.
public type CreateSubscriptionResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# A request to update a `WorkweekConfig` object.
public type UpdateWorkweekConfigRequest record {
    # Sets the day of the week and hour of the day that a business starts a
    # workweek. This is used to calculate overtime pay.
    WorkweekConfig workweek_config;
};

# 
public type V1RetrieveOrderRequest record {
};

# 
public type V1TenderEntryMethod string;

# Defines the fields that are included in the response body of
# a request to the `CreateCustomerCard` endpoint.
# 
# Either `errors` or `card` is present in a given response (never both).
public type CreateCustomerCardResponse record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type V1UpdateOrderRequestAction string;

# A [CatalogModifier](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogModifier).
public type OrderLineItemModifier record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money base_price_money?;
    # The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogModifier).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this modifier references.
    int catalog_version?;
    # The name of the item modifier.
    @constraint:String {maxLength: 255}
    string name?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_price_money?;
    # A unique ID that identifies the modifier only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Defines the fields that are included in the request body of a request
# to the `CreateCustomerCard` endpoint.
public type CreateCustomerCardRequest record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address billing_address?;
    # A card nonce representing the credit card to link to the customer.
    # 
    # Card nonces are generated by the Square payment form when customers enter
    # their card information. For more information, see
    # [Walkthrough: Integrate Square Payments in a Website](https://developer.squareup.com/docs/web-payments/take-card-payment).
    # 
    # __NOTE:__ Card nonces generated by digital wallets (such as Apple Pay)
    # cannot be used to create a customer card.
    string card_nonce;
    # The full name printed on the credit card.
    string cardholder_name?;
    # An identifying token generated by [Payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
    # Verification tokens encapsulate customer device information and 3-D Secure
    # challenge results to indicate that Square has verified the buyer identity.
    string verification_token?;
};

# Defines an accrual rule, which is how buyers can earn points.
public type LoyaltyProgramAccrualRule record {
    # The type of the accrual rule that defines how buyers can earn points.
    string accrual_type;
    # When the accrual rule is item-based or category-based, this field specifies the ID 
    # of the [catalog object](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) that buyers can purchase to earn points. 
    # If `accrual_type` is `ITEM_VARIATION`, the object is an item variation. 
    # If `accrual_type` is `CATEGORY`, the object is a category.
    string catalog_object_id?;
    # When the accrual rule is spend-based (`accrual_type` is `SPEND`), this field 
    # lists the IDs of any `CATEGORY` catalog objects that are excluded from points accrual. 
    # 
    # You can use the [BatchRetrieveCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/batch-retrieve-catalog-objects) 
    # endpoint to retrieve information about the excluded categories.
    string[] excluded_category_ids?;
    # When the accrual rule is spend-based (`accrual_type` is `SPEND`), this field 
    # lists the IDs of any `ITEM_VARIATION` catalog objects that are excluded from points accrual. 
    # 
    # You can use the [BatchRetrieveCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/batch-retrieve-catalog-objects) 
    # endpoint to retrieve information about the excluded item variations.
    string[] excluded_item_variation_ids?;
    # The number of points that 
    # buyers earn based on the `accrual_type`.
    @constraint:Int {minValue: 1}
    int points?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money spend_amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money visit_minimum_amount_money?;
};

# Defines the fields that are included in the response body of
# a request to the [UpdateOrder](https://developer.squareup.com/reference/square_2021-08-18/orders-api/update-order) endpoint.
public type UpdateOrderResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# 
public type CatalogInfoRequest record {
};

# 
public type GetDeviceCodeRequest record {
};

# A record of the hourly rate, start, and end times for a single work shift
# for an employee. This might include a record of the start and end times for breaks
# taken during the shift.
public type Shift record {
    # A list of all the paid or unpaid breaks that were taken during this shift.
    Break[] breaks?;
    # A read-only timestamp in RFC 3339 format; presented in UTC.
    string created_at?;
    # The ID of the employee this shift belongs to. DEPRECATED at version 2020-08-26. Use `team_member_id` instead.
    string employee_id?;
    # RFC 3339; shifted to the timezone + offset. Precision up to the minute is
    # respected; seconds are truncated.
    string end_at?;
    # The UUID for this object.
    @constraint:String {maxLength: 255}
    string id?;
    # The ID of the location this shift occurred at. The location should be based on
    # where the employee clocked in.
    string location_id?;
    # RFC 3339; shifted to the location timezone + offset. Precision up to the
    # minute is respected; seconds are truncated.
    @constraint:String {minLength: 1}
    string start_at;
    # Describes the working state of the current `Shift`.
    string status?;
    # The ID of the team member this shift belongs to. Replaced `employee_id` at version "2020-08-26".
    string team_member_id?;
    # The read-only convenience value that is calculated from the location based
    # on the `location_id`. Format: the IANA timezone database identifier for the
    # location timezone.
    string timezone?;
    # A read-only timestamp in RFC 3339 format; presented in UTC.
    string updated_at?;
    # Used for resolving concurrency issues. The request fails if the version
    # provided does not match the server version at the time of the request. If not provided,
    # Square executes a blind write; potentially overwriting data from another
    # write.
    int 'version?;
    # The hourly wage rate used to compensate an employee for this shift.
    ShiftWage wage?;
};

# Defines the fields that are included in the response body of
# a request to the [RetrieveCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/retrieve-customer-group) endpoint.
# 
# Either `errors` or `group` is present in a given response (never both).
public type RetrieveCustomerGroupResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a group of customer profiles. 
    # 
    # Customer groups can be created, be modified, and have their membership defined using 
    # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
    CustomerGroup group?;
};

# Filter based on [order fulfillment](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderFulfillment) information.
public type SearchOrdersFulfillmentFilter record {
    # A list of [fulfillment states](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderFulfillmentState) to filter
    # for. The list returns orders if any of its fulfillments match any of the
    # fulfillment states listed in this field.
    string[] fulfillment_states?;
    # A list of [fulfillment types](https://developer.squareup.com/reference/square_2021-08-18/enums/OrderFulfillmentType) to filter
    # for. The list returns orders if any of its fulfillments match any of the fulfillment types
    # listed in this field.
    string[] fulfillment_types?;
};

# 
public type SearchAvailabilityRequest record {
    # Query conditions to search for availabilities of bookings.
    SearchAvailabilityQuery query;
};

# Defines the request body for the [SearchCatalogItems](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-items) endpoint.
public type SearchCatalogItemsRequest record {
    # The category id query expression to return items containing the specified category IDs.
    string[] category_ids?;
    # The pagination token, returned in the previous response, used to fetch the next batch of pending results.
    string cursor?;
    # The customer-attribute filter to return items or item variations matching the specified
    # custom attribute expressions. A maximum number of 10 custom attribute expressions are supported in
    # a single call to the [SearchCatalogItems](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-items) endpoint.
    CustomAttributeFilter[] custom_attribute_filters?;
    # The enabled-location query expression to return items and item variations having specified enabled locations.
    string[] enabled_location_ids?;
    # The maximum number of results to return per page. The default value is 100.
    @constraint:Int {maxValue: 100}
    int 'limit?;
    # The product types query expression to return items or item variations having the specified product types.
    string[] product_types?;
    # The order to sort the results by item names. The default sort order is ascending (`ASC`).
    string sort_order?;
    # The stock-level query expression to return item variations with the specified stock levels.
    string[] stock_levels?;
    # The text filter expression to return items or item variations containing specified text in
    # the `name`, `description`, or `abbreviation` attribute value of an item, or in
    # the `name`, `sku`, or `upc` attribute value of an item variation.
    string text_filter?;
};

# Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
public type Snippet record {
    # The snippet code, which can contain valid HTML, JavaScript, or both.
    @constraint:String {maxLength: 65535, minLength: 1}
    string content;
    # The timestamp of when the snippet was initially added to the site, in RFC 3339 format.
    string created_at?;
    # The Square-assigned ID for the snippet.
    @constraint:String {maxLength: 48}
    string id?;
    # The ID of the site that contains the snippet.
    string site_id?;
    # The timestamp of when the snippet was last updated on the site, in RFC 3339 format.
    string updated_at?;
};

# Represents the transfer of a quantity of product inventory at a
# particular time from one location to another.
public type InventoryTransfer record {
    # The Square-generated ID of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked.
    @constraint:String {maxLength: 100}
    string catalog_object_id?;
    # The [type](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked.Tracking is only
    # supported for the `ITEM_VARIATION` type.
    @constraint:String {maxLength: 14}
    string catalog_object_type?;
    # An RFC 3339-formatted timestamp that indicates when Square
    # received the transfer request.
    @constraint:String {maxLength: 34}
    string created_at?;
    # The Square-generated ID of the [Employee](https://developer.squareup.com/reference/square_2021-08-18/objects/Employee) responsible for the
    # inventory transfer.
    @constraint:String {maxLength: 100}
    string employee_id?;
    # The Square-generated ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the related
    # quantity of items was tracked before the transfer.
    @constraint:String {maxLength: 100}
    string from_location_id?;
    # A unique ID generated by Square for the
    # `InventoryTransfer`.
    @constraint:String {maxLength: 100}
    string id?;
    # A client-generated RFC 3339-formatted timestamp that indicates when
    # the transfer took place. For write actions, the `occurred_at` timestamp
    # cannot be older than 24 hours or in the future relative to the time of the
    # request.
    @constraint:String {maxLength: 34}
    string occurred_at?;
    # The number of items affected by the transfer as a decimal string.
    # Can support up to 5 digits after the decimal point.
    @constraint:String {maxLength: 26}
    string quantity?;
    # An optional ID provided by the application to tie the
    # `InventoryTransfer` to an external system.
    @constraint:String {maxLength: 255}
    string reference_id?;
    # Provides information about the application used to generate a change.
    SourceApplication 'source?;
    # The [inventory state](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryState) for the quantity of
    # items being transferred.
    string state?;
    # The Square-generated ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the related
    # quantity of items was tracked after the transfer.
    @constraint:String {maxLength: 100}
    string to_location_id?;
};

# 
public type ListTeamMemberBookingProfilesResponse record {
    # The cursor for paginating through the results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The list of team member booking profiles.
    TeamMemberBookingProfile[] team_member_booking_profiles?;
};

# 
public type CreateDeviceCodeRequest record {
    # 
    DeviceCode device_code;
    # A unique string that identifies this CreateDeviceCode request. Keys can
    # be any valid string but must be unique for every CreateDeviceCode request.
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
};

# Provides metadata when the event `type` is `ADJUST_POINTS`.
public type LoyaltyEventAdjustPoints record {
    # The Square-assigned ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36}
    string loyalty_program_id?;
    # The number of points added or removed.
    int points;
    # The reason for the adjustment of points.
    string reason?;
};

# 
public type RetrieveCashDrawerShiftRequest record {
    # The ID of the location to retrieve cash drawer shifts from.
    @constraint:String {minLength: 1}
    string location_id;
};

# 
public type V1EmployeeRolePermissions string;

# Group of standard measurement units.
public type StandardUnitDescriptionGroup record {
    # IETF language tag.
    string language_code?;
    # List of standard (non-custom) measurement units in this description group.
    StandardUnitDescription[] standard_unit_descriptions?;
};

# The query filter to return the search result(s) by exact match of the specified `attribute_name` and any of
# the `attribute_values`.
public type CatalogQuerySet record {
    # The name of the attribute to be searched. Matching of the attribute name is exact.
    @constraint:String {minLength: 1}
    string attribute_name;
    # The desired values of the search attribute. Matching of the attribute values is exact and case insensitive.
    # A maximum of 250 values may be searched in a request.
    string[] attribute_values;
};

# The transaction type used in the disputed payment.
public type TransactionType string;

# 
public type OrderUpdatedObject record {
    # 
    OrderUpdated order_updated?;
};

# Defines the fields that are included in the response body of
# a request to the [AddGroupToCustomer](https://developer.squareup.com/reference/square_2021-08-18/customers-api/add-group-to-customer) endpoint.
public type AddGroupToCustomerResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type V1PaymentSurchargeType string;

# An image file to use in Square catalogs. It can be associated with catalog
# items, item variations, and categories.
public type CatalogImage record {
    # A caption that describes what is shown in the image. Displayed in the
    # Square Online Store. This is a searchable attribute for use in applicable query filters
    # using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-objects).
    string caption?;
    # The internal name to identify this image in calls to the Square API.
    # This is a searchable attribute for use in applicable query filters
    # using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-objects).
    # It is not unique and should not be shown in a buyer facing context.
    string name?;
    # The URL of this image, generated by Square after an image is uploaded
    # using the [CreateCatalogImage](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/create-catalog-image) endpoint.
    string url?;
};

# 
public type OrderFulfillmentUpdatedObject record {
    # 
    OrderFulfillmentUpdated order_fulfillment_updated?;
};

# A query composed of one or more different types of filters to narrow the scope of targeted objects when calling the `SearchCatalogObjects` endpoint.
# 
# Although a query can have multiple filters, only certain query types can be combined per call to [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-objects).
# Any combination of the following types may be used together:
# - [exact_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryExact)
# - [prefix_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryPrefix)
# - [range_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryRange)
# - [sorted_attribute_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQuerySortedAttribute)
# - [text_query](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogQueryText)
# All other query types cannot be combined with any others.
# 
# When a query filter is based on an attribute, the attribute must be searchable.
# Searchable attributes are listed as follows, along their parent types that can be searched for with applicable query filters.
# 
# * Searchable attribute and objects queryable by searchable attributes **
# - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, 'CatalogModifierList`, `CatalogItemOption`, `CatalogItemOptionValue`
# - `description`: `CatalogItem`, `CatalogItemOptionValue`
# - `abbreviation`: `CatalogItem`
# - `upc`: `CatalogItemVariation`
# - `sku`: `CatalogItemVariation`
# - `caption`: `CatalogImage`
# - `display_name`: `CatalogItemOption`
# 
# For example, to search for [CatalogItem](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItem) objects by searchable attributes, you can use
# the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable query filter.
public type CatalogQuery record {
    # The query filter to return the search result by exact match of the specified attribute name and value.
    CatalogQueryExact exact_query?;
    # The query filter to return the item variations containing the specified item option value IDs.
    CatalogQueryItemVariationsForItemOptionValues item_variations_for_item_option_values_query?;
    # The query filter to return the items containing the specified item option IDs.
    CatalogQueryItemsForItemOptions items_for_item_options_query?;
    # The query filter to return the items containing the specified modifier list IDs.
    CatalogQueryItemsForModifierList items_for_modifier_list_query?;
    # The query filter to return the items containing the specified tax IDs.
    CatalogQueryItemsForTax items_for_tax_query?;
    # The query filter to return the search result whose named attribute values are prefixed by the specified attribute value.
    CatalogQueryPrefix prefix_query?;
    # The query filter to return the search result whose named attribute values fall between the specified range.
    CatalogQueryRange range_query?;
    # The query filter to return the search result(s) by exact match of the specified `attribute_name` and any of
    # the `attribute_values`.
    CatalogQuerySet set_query?;
    # The query expression to specify the key to sort search results.
    CatalogQuerySortedAttribute sorted_attribute_query?;
    # The query filter to return the search result whose searchable attribute values contain all of the specified keywords or tokens, independent of the token order or case.
    CatalogQueryText text_query?;
};

# The response to a request to update a `WorkweekConfig` object. The response contains
# the updated `WorkweekConfig` object and might contain a set of `Error` objects if
# the request resulted in errors.
public type UpdateWorkweekConfigResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Sets the day of the week and hour of the day that a business starts a
    # workweek. This is used to calculate overtime pay.
    WorkweekConfig workweek_config?;
};

# The parameters of a `Shift` search query, which includes filter and sort options.
public type ShiftQuery record {
    # Defines a filter used in a search for `Shift` records. `AND` logic is
    # used by Square's servers to apply each filter property specified.
    ShiftFilter filter?;
    # Sets the sort order of search results.
    ShiftSort sort?;
};

# Returns a list of gift card activities. You can optionally specify a filter to retrieve a
# subset of activites.
public type ListGiftCardActivitiesRequest record {
    # The timestamp for the beginning of the reporting period, in RFC 3339 format.
    # Inclusive. Default: The current time minus one year.
    string begin_time?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # If you do not provide the cursor, the call returns the first page of the results.
    string cursor?;
    # The timestamp for the end of the reporting period, in RFC 3339 format.
    # Inclusive. Default: The current time.
    string end_time?;
    # If you provide a gift card ID, the endpoint returns activities that belong 
    # to the specified gift card. Otherwise, the endpoint returns all gift card activities for 
    # the seller.
    @constraint:String {maxLength: 50}
    string gift_card_id?;
    # If you provide a limit value, the endpoint returns the specified number 
    # of results (or less) per page. A maximum value is 100. The default value is 50.
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # If you provide a location ID, the endpoint returns gift card activities for that location. 
    # Otherwise, the endpoint returns gift card activities for all locations.
    string location_id?;
    # The order in which the endpoint returns the activities, based on `created_at`.
    # - `ASC` - Oldest to newest.
    # - `DESC` - Newest to oldest (default).
    string sort_order?;
    # If you provide a type, the endpoint returns gift card activities of this type. 
    # Otherwise, the endpoint returns all types of gift card activities.
    string 'type?;
};

# Defines the fields in a `DeprecatedCreateDisputeEvidenceFile` response.
public type DeprecatedCreateDisputeEvidenceFileResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # 
    DisputeEvidence evidence?;
};

# Supported booking statuses.
public type BookingStatus string;

# Defines the fields that are included in requests to the
# [UpdateOrder](https://developer.squareup.com/reference/square_2021-08-18/orders-api/update-order) endpoint.
public type UpdateOrderRequest record {
    # The [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot-notation)
    # fields to clear. For example, `line_items[uid].note`.
    # For more information, see [Deleting fields](https://developer.squareup.com/docs/orders-api/manage-orders#delete-fields).
    string[] fields_to_clear?;
    # A value you specify that uniquely identifies this update request.
    # 
    # If you are unsure whether a particular update was applied to an order successfully,
    # you can reattempt it with the same idempotency key without
    # worrying about creating duplicate updates to the order.
    # The latest order version is returned.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency).
    @constraint:String {maxLength: 192}
    string idempotency_key?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# 
public type SnippetResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
    Snippet snippet?;
};

# The type of fulfillment.
public type OrderFulfillmentType string;

# A rounding adjustment of the money being returned. Commonly used to apply cash rounding
# when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
public type OrderRoundingAdjustment record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # The name of the rounding adjustment from the original sale order.
    string name?;
    # A unique ID that identifies the rounding adjustment only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Specifies the action for Square to take for processing the invoice. For example, 
# email the invoice, charge a customer's card on file, or do nothing. DEPRECATED at
# version 2021-01-21. The corresponding `request_method` field is replaced by the
# `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source` fields.
public type InvoiceRequestMethod string;

# 
public type UpdateItemTaxesRequest record {
    # IDs for the CatalogItems associated with the CatalogTax objects being updated.
    string[] item_ids;
    # IDs of the CatalogTax objects to disable.
    string[] taxes_to_disable?;
    # IDs of the CatalogTax objects to enable.
    string[] taxes_to_enable?;
};

# Represents a create request for a `TeamMember` object.
public type CreateTeamMemberRequest record {
    # A unique string that identifies this `CreateTeamMember` request.
    # Keys can be any valid string, but must be unique for every request.
    # For more information, see [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency).
    # 
    # The minimum length is 1 and the maximum length is 45.
    string idempotency_key?;
    # A record representing an individual team member for a business.
    TeamMember team_member?;
};

# 
public type ListDeviceCodesResponse record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint. This value is present only if the request
    # succeeded and additional results are available.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # The queried DeviceCode.
    DeviceCode[] device_codes?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

public type Info anydata;

# V1Order
public type V1Order record {
    # For Bitcoin transactions, the price of the buyer's order in satoshi (100 million satoshi equals 1 BTC).
    decimal btc_price_satoshi?;
    # For Bitcoin transactions, the address that the buyer sent Bitcoin to.
    string btc_receive_address?;
    # The email address of the order's buyer.
    string buyer_email?;
    # A note provided by the buyer when the order was created, if any.
    string buyer_note?;
    # A note provided by the merchant when the order's state was set to CANCELED, if any.
    string canceled_note?;
    # A note provided by the merchant when the order's state was set to COMPLETED, if any
    string completed_note?;
    # The time when the order was created, in ISO 8601 format.
    string created_at?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The time when the order expires if no action is taken, in ISO 8601 format.
    string expires_at?;
    # The order's unique identifier.
    string id?;
    # The history of actions associated with the order.
    V1OrderHistoryEntry[] order_history?;
    # The unique identifier of the payment associated with the order.
    string payment_id?;
    # The promo code provided by the buyer, if any.
    string promo_code?;
    # The name of the order's buyer.
    string recipient_name?;
    # The phone number to use for the order's delivery.
    string recipient_phone_number?;
    # A note provided by the merchant when the order's state was set to REFUNDED, if any.
    string refunded_note?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address shipping_address?;
    # Whether the tax is an ADDITIVE tax or an INCLUSIVE tax.
    string state?;
    # 
    V1Money subtotal_money?;
    # A tender represents a discrete monetary exchange. Square represents this
    # exchange as a money object with a specific currency and amount, where the
    # amount is given in the smallest denomination of the given currency.
    # 
    # Square POS can accept more than one form of tender for a single payment (such
    # as by splitting a bill between a credit card and a gift card). The `tender`
    # field of the Payment object lists all forms of tender used for the payment.
    # 
    # Split tender payments behave slightly differently from single tender payments:
    # 
    # The receipt_url for a split tender corresponds only to the first tender listed
    # in the tender field. To get the receipt URLs for the remaining tenders, use
    # the receipt_url fields of the corresponding Tender objects.
    # 
    # *A note on gift cards**: when a customer purchases a Square gift card from a
    # merchant, the merchant receives the full amount of the gift card in the
    # associated payment.
    # 
    # When that gift card is used as a tender, the balance of the gift card is
    # reduced and the merchant receives no funds. A `Tender` object with a type of
    # `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the
    # associated payment.
    V1Tender tender?;
    # 
    V1Money total_discount_money?;
    # 
    V1Money total_price_money?;
    # 
    V1Money total_shipping_money?;
    # 
    V1Money total_tax_money?;
    # The time when the order was last modified, in ISO 8601 format.
    string updated_at?;
};

# 
public type GiftCardActivityDeactivateReason string;

# The line item being returned in an order.
public type OrderReturnLineItem record {
    # The list of references to `OrderReturnDiscount` entities applied to the return line item. Each
    # `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level
    # `OrderReturnDiscount` applied to the return line item. On reads, the applied amount
    # is populated.
    OrderLineItemAppliedDiscount[] applied_discounts?;
    # The list of references to `OrderReturnTax` entities applied to the return line item. Each
    # `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level
    # `OrderReturnTax` applied to the return line item. On reads, the applied amount
    # is populated.
    OrderLineItemAppliedTax[] applied_taxes?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money base_price_money?;
    # The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) ID applied to this return line item.
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this line item references.
    int catalog_version?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money gross_return_money?;
    # The type of line item: an itemized return, a non-itemized return (custom amount),
    # or the return of an unactivated gift card sale.
    string item_type?;
    # The name of the line item.
    @constraint:String {maxLength: 512}
    string name?;
    # The note of the return line item.
    @constraint:String {maxLength: 2000}
    string note?;
    # The quantity returned, formatted as a decimal number.
    # For example, `"3"`.
    # 
    # Line items with a `quantity_unit` can have non-integer quantities.
    # For example, `"1.70000"`.
    @constraint:String {maxLength: 12, minLength: 1}
    string quantity;
    # Contains the measurement unit for a quantity and a precision that
    # specifies the number of digits after the decimal point for decimal quantities.
    OrderQuantityUnit quantity_unit?;
    # The [CatalogModifier](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogModifier)s applied to this line item.
    OrderReturnLineItemModifier[] return_modifiers?;
    # The `uid` of the line item in the original sale order.
    @constraint:String {maxLength: 60}
    string source_line_item_uid?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_discount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tax_money?;
    # A unique ID for this return line-item entry.
    @constraint:String {maxLength: 60}
    string uid?;
    # The name of the variation applied to this return line item.
    @constraint:String {maxLength: 255}
    string variation_name?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money variation_total_price_money?;
};

# V1PaymentModifier
public type V1PaymentModifier record {
    # 
    V1Money applied_money?;
    # The ID of the applied modifier option, if available. Modifier options applied in older versions of Square Register might not have an ID.
    string modifier_option_id?;
    # The modifier option's name.
    string name?;
};

# Options to control the properties of a `CatalogModifierList` applied to a `CatalogItem` instance.
public type CatalogItemModifierListInfo record {
    # If `true`, enable this `CatalogModifierList`. The default value is `true`.
    boolean enabled?;
    # If 0 or larger, the largest number of `CatalogModifier`s that can be selected from this `CatalogModifierList`.
    int max_selected_modifiers?;
    # If 0 or larger, the smallest number of `CatalogModifier`s that must be selected from this `CatalogModifierList`.
    int min_selected_modifiers?;
    # The ID of the `CatalogModifierList` controlled by this `CatalogModifierListInfo`.
    @constraint:String {minLength: 1}
    string modifier_list_id;
    # A set of `CatalogModifierOverride` objects that override whether a given `CatalogModifier` is enabled by default.
    CatalogModifierOverride[] modifier_overrides?;
};

# Describes a gift card activity of the BLOCK type.
public type GiftCardActivityBlock record {
    Reason reason;
};

# A request to delete a loyalty reward.
public type DeleteLoyaltyRewardRequest record {
};

# Indicates the method used to enter the card's details.
public type TenderCardDetailsEntryMethod string;

# 
public type CancelBookingResponse record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines parameters in a
# [CreateSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/create-subscription) endpoint request.
public type CreateSubscriptionRequest record {
    # The date when the subscription should be canceled, in
    # YYYY-MM-DD format (for example, 2025-02-29). This overrides the plan configuration
    # if it comes before the date the subscription would otherwise end.
    string canceled_date?;
    # The ID of the [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) [card](https://developer.squareup.com/reference/square_2021-08-18/objects/Card) to charge.
    # If not specified, Square sends an invoice via email. For an example to
    # create a customer and add a card on file, see [Subscriptions Walkthrough](https://developer.squareup.com/docs/subscriptions-api/walkthrough).
    string card_id?;
    # The ID of the [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) profile.
    @constraint:String {minLength: 1}
    string customer_id;
    # A unique string that identifies this `CreateSubscription` request.
    # If you do not provide a unique string (or provide an empty string as the value),
    # the endpoint treats each request as independent.
    # 
    # For more information, see [Idempotency keys](https://developer.squareup.com/docs/working-with-apis/idempotency).
    string idempotency_key?;
    # The ID of the location the subscription is associated with.
    @constraint:String {minLength: 1}
    string location_id;
    # The ID of the subscription plan created using the Catalog API.
    # For more information, see
    # [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan) and 
    # [Subscriptions Walkthrough](https://developer.squareup.com/docs/subscriptions-api/walkthrough).
    @constraint:String {minLength: 1}
    string plan_id;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money price_override_money?;
    # The start date of the subscription, in YYYY-MM-DD format. For example,
    # 2013-01-15. If the start date is left empty, the subscription begins
    # immediately.
    string start_date?;
    # The tax to add when billing the subscription.
    # The percentage is expressed in decimal form, using a `'.'` as the decimal
    # separator and without a `'%'` sign. For example, a value of 7.5
    # corresponds to 7.5%.
    @constraint:String {maxLength: 10}
    string tax_percentage?;
    # The timezone that is used in date calculations for the subscription. If unset, defaults to
    # the location timezone. If a timezone is not configured for the location, defaults to "America/New_York".
    # Format: the IANA Timezone Database identifier for the location timezone. For
    # a list of time zones, see [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
    string timezone?;
};

# 
public type CashDrawerShiftEvent record {
    # The event time in ISO 8601 format.
    string created_at?;
    # An optional description of the event, entered by the employee that
    # created the event.
    string description?;
    # The ID of the employee that created the event.
    string employee_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money event_money?;
    # The type of cash drawer shift event.
    string event_type?;
    # The unique ID of the event.
    string id?;
};

# Indicates the state of a tracked item quantity in the lifecycle of goods.
public type InventoryState string;

# This model gives the details of a cash drawer shift.
# The cash_payment_money, cash_refund_money, cash_paid_in_money,
# and cash_paid_out_money fields are all computed by summing their respective
# event types.
public type CashDrawerShift record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money cash_paid_in_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money cash_paid_out_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money cash_payment_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money cash_refunds_money?;
    # The time when the shift was closed, in ISO 8601 format.
    string closed_at?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money closed_cash_money?;
    # The ID of the employee that closed the cash drawer shift by auditing
    # the cash drawer contents.
    string closing_employee_id?;
    # The free-form text description of a cash drawer by an employee.
    string description?;
    # 
    CashDrawerDevice device?;
    # The IDs of all employees that were logged into Square Point of Sale at any
    # point while the cash drawer shift was open.
    string[] employee_ids?;
    # The time when the shift ended, in ISO 8601 format.
    string ended_at?;
    # The ID of the employee that ended the cash drawer shift.
    string ending_employee_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money expected_cash_money?;
    # The shift unique ID.
    string id?;
    # The time when the shift began, in ISO 8601 format.
    string opened_at?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money opened_cash_money?;
    # The ID of the employee that started the cash drawer shift.
    string opening_employee_id?;
    # The shift current state.
    string state?;
};

# Indicates which products matched by a CatalogPricingRule
# will be excluded if the pricing rule uses an exclude set.
public type ExcludeStrategy string;

# 
public type ListCatalogRequest record {
    # The specific version of the catalog objects to be included in the response. 
    # This allows you to retrieve historical
    # versions of objects. The specified version value is matched against
    # the [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s' `version` attribute.
    int catalog_version?;
    # The pagination cursor returned in the previous response. Leave unset for an initial request.
    # The page size is currently set to be 100.
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # An optional case-insensitive, comma-separated list of object types to retrieve.
    # 
    # The valid values are defined in the [CatalogObjectType](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) enum, including
    # `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,
    # `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`.
    # 
    # If this is unspecified, the operation returns objects of all the types at the version of the Square API used to make the request.
    string types?;
};

# 
public type OrderCreatedObject record {
    # 
    OrderCreated order_created?;
};

# A `Shift` search query filter parameter that sets a range of days that
# a `Shift` must start or end in before passing the filter condition.
public type ShiftWorkday record {
    # A range defined by two dates. Used for filtering a query for Connect v2
    # objects that have date properties.
    DateRange date_range?;
    # Location-specific timezones convert workdays to datetime filters.
    # Every location included in the query must have a timezone or this field
    # must be provided as a fallback. Format: the IANA timezone database
    # identifier for the relevant timezone.
    string default_timezone?;
    # The strategy on which the dates are applied.
    string match_shifts_by?;
};

# Defines the parameters for a `SubmitEvidence` request.
public type SubmitEvidenceRequest record {
};

# Describes pricing adjustments that are blocked from manual and 
# automatic application to a line item. For more information, see 
# [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
public type OrderLineItemPricingBlocklists record {
    # A list of discounts blocked from applying to the line item. 
    # Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or 
    # the `discount_catalog_object_id` (for catalog discounts).
    OrderLineItemPricingBlocklistsBlockedDiscount[] blocked_discounts?;
    # A list of taxes blocked from applying to the line item. 
    # Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or 
    # the `tax_catalog_object_id` (for catalog taxes).
    OrderLineItemPricingBlocklistsBlockedTax[] blocked_taxes?;
};

# 
public type V1TenderType string;

# A request to get a `Shift` by ID.
public type GetShiftRequest record {
};

# 
public type InventoryAdjustmentGroup record {
    # Representative `from_state` for adjustments within the group. For example, for a group adjustment from `IN_STOCK` to `SOLD`,
    # there can be two component adjustments in the group: one from `IN_STOCK`to `COMPOSED` and the other one from `COMPOSED` to `SOLD`.
    # Here, the representative `from_state` for the `InventoryAdjustmentGroup` is `IN_STOCK`.
    string from_state?;
    # A unique ID generated by Square for the
    # `InventoryAdjustmentGroup`.
    @constraint:String {maxLength: 100}
    string id?;
    # The inventory adjustment of the composed variation.
    @constraint:String {maxLength: 100}
    string root_adjustment_id?;
    # Representative `to_state` for adjustments within group. For example, for a group adjustment from `IN_STOCK` to `SOLD`,
    # the two component adjustments in the group can be from `IN_STOCK` to `COMPOSED` and from `COMPOSED` to `SOLD`. 
    # Here, the representative `to_state` of the `InventoryAdjustmentGroup` is `SOLD`.
    string to_state?;
};

# Indicates the financial purpose of the bank account.
public type BankAccountType string;

# The possible subscription event info codes.
public type SubscriptionEventInfoCode string;

# Describes a `DeleteInvoice` response.
public type DeleteInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
};

# The state of the order.
public type OrderState string;

# Describes a `UpdateInvoice` request.
public type UpdateInvoiceRequest record {
    # The list of fields to clear.
    # For examples, see [Update an invoice](https://developer.squareup.com/docs/invoices-api/overview#update-an-invoice).
    string[] fields_to_clear?;
    # A unique string that identifies the `UpdateInvoice` request. If you do not
    # provide `idempotency_key` (or provide an empty string as the value), the endpoint
    # treats each request as independent.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 128}
    string idempotency_key?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice;
};

# Represents the line item type.
public type OrderLineItemItemType string;

# Defines the visibility of a custom attribute to applications other than their
# creating application.
public type CatalogCustomAttributeDefinitionAppVisibility string;

# 
public type RetrieveInventoryChangesRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # The [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) IDs to look up as a comma-separated
    # list. An empty list queries all locations.
    string location_ids?;
};

# A request to unlink a customer to a gift card
public type UnlinkCustomerFromGiftCardRequest record {
    # 
    @constraint:String {maxLength: 191, minLength: 1}
    string customer_id;
};

# DeviceCode.Status enum.
public type DeviceCodeStatus string;

# A request for a set of `EmployeeWage` objects.
public type ListEmployeeWagesRequest record {
    # A pointer to the next page of `EmployeeWage` results to fetch.
    string cursor?;
    # Filter the returned wages to only those that are associated with the specified employee.
    string employee_id?;
    # The maximum number of `EmployeeWage` results to return per page. The number can range between
    # 1 and 200. The default is 200.
    @constraint:Int {minValue: 1, maxValue: 200}
    int 'limit?;
};

# 
public type BatchChangeInventoryRequest record {
    # The set of physical counts and inventory adjustments to be made.
    # Changes are applied based on the client-supplied timestamp and may be sent
    # out of order.
    InventoryChange[] changes?;
    # A client-supplied, universally unique identifier (UUID) for the
    # request.
    # 
    # See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) in the
    # [API Development 101](https://developer.squareup.com/docs/basics/api101/overview) section for more
    # information.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # Indicates whether the current physical count should be ignored if
    # the quantity is unchanged since the last physical count. Default: `true`.
    boolean ignore_unchanged_counts?;
};

# 
public type CatalogInfoResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # 
    CatalogInfoResponseLimits limits?;
    # Group of standard measurement units.
    StandardUnitDescriptionGroup standard_unit_description_group?;
};

# A request to retrieve a loyalty account.
public type RetrieveLoyaltyAccountRequest record {
};

# The response to the request to create a `BreakType`. The response contains
# the created `BreakType` object and might contain a set of `Error` objects if
# the request resulted in errors.
public type CreateBreakTypeResponse record {
    # A defined break template that sets an expectation for possible `Break`
    # instances on a `Shift`.
    BreakType break_type?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. Discount details
# are now defined using a catalog pricing rule and other catalog objects. For more information, see
# [Get discount details for the reward](https://developer.squareup.com/docs/loyalty-api/overview#get-discount-details).
public type LoyaltyProgramRewardDefinitionScope string;

# A request to search for loyalty accounts.
public type SearchLoyaltyAccountsRequest record {
    # A pagination cursor returned by a previous call to 
    # this endpoint. Provide this to retrieve the next set of 
    # results for the original query.
    # 
    # For more information, 
    # see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The maximum number of results to include in the response.
    @constraint:Int {minValue: 1, maxValue: 30}
    int 'limit?;
    # The search criteria for the loyalty accounts.
    SearchLoyaltyAccountsRequestLoyaltyAccountQuery query?;
};

# Contains query criteria for the search.
public type SearchOrdersQuery record {
    # Filtering criteria to use for a `SearchOrders` request. Multiple filters
    # are ANDed together.
    SearchOrdersFilter filter?;
    # Sorting criteria for a `SearchOrders` request. Results can only be sorted
    # by a timestamp field.
    SearchOrdersSort sort?;
};

# Contains information defining a custom attribute. Custom attributes are
# intended to store additional information about a catalog object or to associate a
# catalog object with an entity in another system. Do not use custom attributes
# to store any sensitive information (personally identifiable information, card details, etc.).
# [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
public type CatalogCustomAttributeDefinition record {
    # The set of Catalog Object Types that this Custom Attribute may be applied to.
    # Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included.
    string[] allowed_object_types;
    # The visibility of a custom attribute to applications other than the application
    # that created the attribute.
    string app_visibility?;
    # __Read-only.__ The number of custom attributes that reference this
    # custom attribute definition. Set by the server in response to a ListCatalog
    # request with `include_counts` set to `true`.  If the actual count is greater
    # than 100, `custom_attribute_usage_count` will be set to `100`.
    int custom_attribute_usage_count?;
    # Seller-oriented description of the meaning of this Custom Attribute,
    # any constraints that the seller should observe, etc. May be displayed as a tooltip in Square UIs.
    @constraint:String {maxLength: 255}
    string description?;
    # The name of the desired custom attribute key that can be used to access
    # the custom attribute value on catalog objects. Cannot be modified after the
    # custom attribute definition has been created.
    # Must be between 1 and 60 characters, and may only contain the characters `[a-zA-Z0-9_-]`.
    @constraint:String {maxLength: 60, minLength: 1}
    string 'key?;
    #  The name of this definition for API and seller-facing UI purposes.
    # The name must be unique within the (merchant, application) pair. Required.
    # May not be empty and may not exceed 255 characters. Can be modified after creation.
    @constraint:String {maxLength: 255, minLength: 1}
    string name;
    # 
    CatalogCustomAttributeDefinitionNumberConfig number_config?;
    # Configuration associated with `SELECTION`-type custom attribute definitions.
    CatalogCustomAttributeDefinitionSelectionConfig selection_config?;
    # The visibility of a custom attribute in seller-facing UIs (including Square Point
    # of Sale applications and Square Dashboard). May be modified.
    string seller_visibility?;
    # Provides information about the application used to generate a change.
    SourceApplication source_application?;
    # Configuration associated with Custom Attribute Definitions of type `STRING`.
    CatalogCustomAttributeDefinitionStringConfig string_config?;
    # The type of this custom attribute. Cannot be modified after creation.
    # Required.
    string 'type;
};

# V1PaymentItemDetail
public type V1PaymentItemDetail record {
    # The name of the item's merchant-defined category, if any.
    string category_name?;
    # The unique ID of the item purchased, if any.
    string item_id?;
    # The unique ID of the item variation purchased, if any.
    string item_variation_id?;
    #  The item's merchant-defined SKU, if any.
    string sku?;
};

# 
public type BatchRetrieveCatalogObjectsRequest record {
    # The specific version of the catalog objects to be included in the response. 
    # This allows you to retrieve historical versions of objects. The specified version value is matched against
    # the [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s' `version` attribute.
    int catalog_version?;
    # If `true`, the response will include additional objects that are related to the
    # requested objects, as follows:
    # 
    # If the `objects` field of the response contains a CatalogItem, its associated
    # CatalogCategory objects, CatalogTax objects, CatalogImage objects and
    # CatalogModifierLists will be returned in the `related_objects` field of the
    # response. If the `objects` field of the response contains a CatalogItemVariation,
    # its parent CatalogItem will be returned in the `related_objects` field of
    # the response.
    boolean include_related_objects?;
    # The IDs of the CatalogObjects to be retrieved.
    string[] object_ids;
};

# Defines the body parameters that can be included in a request to the
# `CreateCustomer` endpoint.
public type CreateCustomerRequest record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The birthday associated with the customer profile, in RFC 3339 format. The year is optional. The timezone and time are not allowed.
    # For example, `0000-09-21T00:00:00-00:00` represents a birthday on September 21 and `1998-09-21T00:00:00-00:00` represents a birthday on September 21, 1998.
    # You can also specify this value in `YYYY-MM-DD` format.
    string birthday?;
    # A business name associated with the customer profile.
    string company_name?;
    # The email address associated with the customer profile.
    string email_address?;
    # The family name (that is, the last name) associated with the customer profile.
    string family_name?;
    # The given name (that is, the first name) associated with the customer profile.
    string given_name?;
    # The idempotency key for the request.	For more information, see
    # [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    string idempotency_key?;
    # A nickname for the customer profile.
    string nickname?;
    # A custom note associated with the customer profile.
    string note?;
    # The 11-digit phone number associated with the customer profile.
    string phone_number?;
    # An optional second ID used to associate the customer profile with an
    # entity in another system.
    string reference_id?;
};

# An object representing a team member's wage information.
public type WageSetting record {
    # The timestamp, in RFC 3339 format, describing when the wage setting object was created.
    # For example, "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z".
    string created_at?;
    # Whether the team member is exempt from the overtime rules of the seller's country.
    boolean is_overtime_exempt?;
    # Required. The ordered list of jobs that the team member is assigned to.
    # The first job assignment is considered the team member's primary job.
    # 
    # The minimum length is 1 and the maximum length is 12.
    JobAssignment[] job_assignments?;
    # The unique ID of the `TeamMember` whom this wage setting describes.
    string team_member_id?;
    # The timestamp, in RFC 3339 format, describing when the wage setting object was last updated.
    # For example, "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z".
    string updated_at?;
    # Used for resolving concurrency issues. The request fails if the version
    # provided does not match the server version at the time of the request. If not provided,
    # Square executes a blind write, potentially overwriting data from another write. For more information,
    # see [optimistic concurrency](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency).
    int 'version?;
};

# Represents a time period - either a single period or a repeating period.
public type CatalogTimePeriod record {
    # An iCalendar (RFC 5545) [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which
    # specifies the name, timing, duration and recurrence of this time period.
    # 
    # Example:
    # 
    # ```
    # DTSTART:20190707T180000
    # DURATION:P2H
    # RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR
    # ```
    # 
    # Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported.
    # `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT`
    # and `END:VEVENT` is not required in the request. The response will always
    # include them.
    string event?;
};

# 
public type RetrieveBusinessBookingProfileResponse record {
    # 
    BusinessBookingProfile business_booking_profile?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type OrderUpdated record {
    # The timestamp for when the order was created, in RFC 3339 format.
    string created_at?;
    # The ID of the seller location that this order is associated with.
    string location_id?;
    # The order's unique ID.
    string order_id?;
    # The state of the order.
    string state?;
    # The timestamp for when the order was last updated, in RFC 3339 format.
    string updated_at?;
    # The version number, which is incremented each time an update is committed to the order.
    # Orders that were not created through the API do not include a version number and
    # therefore cannot be updated.
    # 
    # [Read more about working with versions.](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders)
    int 'version?;
};

# Represents an applied portion of a discount to a line item in an order.
# 
# Order scoped discounts have automatically applied discounts present for each line item.
# Line-item scoped discounts must have applied discounts added manually for any applicable line
# items. The corresponding applied money is automatically computed based on participating
# line items.
public type OrderLineItemAppliedDiscount record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The `uid` of the discount that the applied discount represents. It must
    # reference a discount present in the `order.discounts` field.
    # 
    # This field is immutable. To change which discounts apply to a line item,
    # you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
    @constraint:String {maxLength: 60, minLength: 1}
    string discount_uid;
    # A unique ID that identifies the applied discount only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# 
public type RetrieveTransactionRequest record {
};

# Defines the fields that are included in the response body of
# a request to the [CreateCard](#endpoint-cards-createcard) endpoint.
# 
# Note: if there are errors processing the request, the card field will not be
# present.
public type CreateCardResponse record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# Represents a line item in an order. Each line item describes a different
# product to purchase, with its own quantity and price details.
public type OrderLineItem record {
    # The list of references to discounts applied to this line item. Each
    # `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level
    # `OrderLineItemDiscounts` applied to the line item. On reads, the amount
    # applied is populated.
    # 
    # An `OrderLineItemAppliedDiscount` is automatically created on every line item for all
    # `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records
    # for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any
    # line items.
    # 
    # To change the amount of a discount, modify the referenced top-level discount.
    OrderLineItemAppliedDiscount[] applied_discounts?;
    # The list of references to taxes applied to this line item. Each
    # `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a
    # top-level `OrderLineItemTax` applied to the line item. On reads, the
    # amount applied is populated.
    # 
    # An `OrderLineItemAppliedTax` is automatically created on every line
    # item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax`
    # records for `LINE_ITEM` scoped taxes must be added in requests for the tax
    # to apply to any line items.
    # 
    # To change the amount of a tax, modify the referenced top-level tax.
    OrderLineItemAppliedTax[] applied_taxes?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money base_price_money?;
    # The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) ID applied to this line item.
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this line item references.
    int catalog_version?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money gross_sales_money?;
    # The type of line item: an itemized sale, a non-itemized sale (custom amount), or the
    # activation or reloading of a gift card.
    string item_type?;
    # Application-defined data attached to this line item. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # The [CatalogModifier](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogModifier)s applied to this line item.
    OrderLineItemModifier[] modifiers?;
    # The name of the line item.
    @constraint:String {maxLength: 512}
    string name?;
    # The note of the line item.
    @constraint:String {maxLength: 2000}
    string note?;
    # Describes pricing adjustments that are blocked from manual and 
    # automatic application to a line item. For more information, see 
    # [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
    OrderLineItemPricingBlocklists pricing_blocklists?;
    # The quantity purchased, formatted as a decimal number.
    # For example, `"3"`.
    # 
    # Line items with a quantity of `"0"` are automatically removed
    # when paying for or otherwise completing the order.
    # 
    # Line items with a `quantity_unit` can have non-integer quantities.
    # For example, `"1.70000"`.
    @constraint:String {maxLength: 12, minLength: 1}
    string quantity;
    # Contains the measurement unit for a quantity and a precision that
    # specifies the number of digits after the decimal point for decimal quantities.
    OrderQuantityUnit quantity_unit?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_discount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tax_money?;
    # A unique ID that identifies the line item only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
    # The name of the variation applied to this line item.
    @constraint:String {maxLength: 255}
    string variation_name?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money variation_total_price_money?;
};

# 
public type MeasurementUnitGeneric string;

# A request to retrieve a loyalty reward.
public type RetrieveLoyaltyRewardRequest record {
};

# An additional seller-defined and customer-facing field to include on the invoice. For more information, 
# see [Custom fields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
# 
# Adding custom fields to an invoice requires an 
# [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
public type InvoiceCustomField record {
    # The label or title of the custom field. This field is required for a custom field.
    @constraint:String {maxLength: 30}
    string label?;
    # The location of the custom field on the invoice. This field is required for a custom field.
    string placement?;
    # The text of the custom field. If omitted, only the label is rendered.
    @constraint:String {maxLength: 2000}
    string value?;
};

# Represents the quantity of an item variation that is physically present
# at a specific location, verified by a seller or a seller's employee. For example,
# a physical count might come from an employee counting the item variations on
# hand or from syncing with an external system.
public type InventoryPhysicalCount record {
    # The Square-generated ID of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked.
    @constraint:String {maxLength: 100}
    string catalog_object_id?;
    # The [type](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked. Tracking is only
    # supported for the `ITEM_VARIATION` type.
    @constraint:String {maxLength: 14}
    string catalog_object_type?;
    # An RFC 3339-formatted timestamp that indicates when the physical count is received.
    @constraint:String {maxLength: 34}
    string created_at?;
    # The Square-generated ID of the [Employee](https://developer.squareup.com/reference/square_2021-08-18/objects/Employee) responsible for the
    # physical count.
    @constraint:String {maxLength: 100}
    string employee_id?;
    # A unique Square-generated ID for the
    # [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryPhysicalCount).
    @constraint:String {maxLength: 100}
    string id?;
    # The Square-generated ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the related
    # quantity of items is being tracked.
    @constraint:String {maxLength: 100}
    string location_id?;
    # A client-generated RFC 3339-formatted timestamp that indicates when
    # the physical count was examined. For physical count updates, the `occurred_at`
    # timestamp cannot be older than 24 hours or in the future relative to the
    # time of the request.
    @constraint:String {maxLength: 34}
    string occurred_at?;
    # The number of items affected by the physical count as a decimal string.
    # The number can support up to 5 digits after the decimal point.
    @constraint:String {maxLength: 26}
    string quantity?;
    # An optional ID provided by the application to tie the
    # [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-08-18/objects/InventoryPhysicalCount) to an external
    # system.
    @constraint:String {maxLength: 255}
    string reference_id?;
    # Provides information about the application used to generate a change.
    SourceApplication 'source?;
    # The current [inventory state](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryState) for the related
    # quantity of items.
    string state?;
};

# Represents the rule of conversion between a stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation)
# and a non-stockable sell-by or receive-by `CatalogItemVariation` that
# share the same underlying stock.
public type CatalogStockConversion record {
    # The converted equivalent quantity of the non-stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) 
    # in its measurement unit. The `stockable_quantity` value and this `nonstockable_quantity` value together
    # define the conversion ratio between stockable item variation and the non-stockable item variation.
    # It accepts a decimal number in a string format that can take up to 10 digits before the decimal point
    # and up to 5 digits after the decimal point.
    @constraint:String {maxLength: 16, minLength: 1}
    string nonstockable_quantity;
    # References to the stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation)
    # for this stock conversion. Selling, receiving or recounting the non-stockable `CatalogItemVariation` 
    # defined with a stock conversion results in adjustments of this stockable `CatalogItemVariation`.
    # This immutable field must reference a stockable `CatalogItemVariation`
    # that shares the parent [CatalogItem](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItem) of the converted `CatalogItemVariation.`
    @constraint:String {minLength: 1}
    string stockable_item_variation_id;
    # The quantity of the stockable item variation (as identified by `stockable_item_variation_id`) 
    # equivalent to the non-stockable item variation quantity (as specified in `nonstockable_quantity`) 
    # as defined by this stock conversion.  It accepts a decimal number in a string format that can take
    # up to 10 digits before the decimal point and up to 5 digits after the decimal point.
    @constraint:String {maxLength: 16, minLength: 1}
    string stockable_quantity;
};

# Defines the fields that are included in the response body of
# a request to the `DeleteCustomerCard` endpoint.
public type DeleteCustomerCardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a query (including filtering criteria) used to search for subscriptions.
public type SearchSubscriptionsQuery record {
    # Represents a set of SearchSubscriptionsQuery filters used to limit the set of Subscriptions returned by SearchSubscriptions.
    SearchSubscriptionsFilter filter?;
};

# A request to retrieve gift cards by using nonces.
public type RetrieveGiftCardFromNonceRequest record {
    # The nonce of the gift card to retrieve.
    @constraint:String {minLength: 1}
    string nonce;
};

# 
public type V1RefundType string;

# A response that includes loyalty accounts that satisfy the search criteria.
public type SearchLoyaltyAccountsResponse record {
    # The pagination cursor to use in a subsequent 
    # request. If empty, this is the final response.
    # For more information, 
    # see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The loyalty accounts that met the search criteria,  
    # in order of creation date.
    LoyaltyAccount[] loyalty_accounts?;
};

# 
public type SearchTerminalCheckoutsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Limits the number of results returned for a single request.
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # 
    TerminalCheckoutQuery query?;
};

# Sets the sort order of search results.
public type ShiftSort record {
    # The field to sort on.
    string 'field?;
    # The order in which results are returned. Defaults to DESC.
    string 'order?;
};

# 
public type DisputeEvidenceCreatedWebhookObject record {
    # Represents a dispute a cardholder initiated with their bank.
    Dispute 'object?;
};

# A whole number or unreduced fractional ratio.
public type QuantityRatio record {
    # The whole or fractional quantity as the numerator.
    int quantity?;
    # The whole or fractional quantity as the denominator. 
    # In the case of fractional quantity this field is the denominator and quantity is the numerator.
    # When unspecified, the value is `1`. For example, when `quantity=3` and `quantity_donominator` is unspecified,
    # the quantity ratio is `3` or `3/1`.
    int quantity_denominator?;
};

# Defines parameters in a
# [CancelSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/cancel-subscription) endpoint request.
public type CancelSubscriptionRequest record {
};

# A response that includes the loyalty account.
public type RetrieveLoyaltyAccountResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Describes a loyalty account. For more information, see
    # [Manage Loyalty Accounts Using the Loyalty API](https://developer.squareup.com/docs/loyalty-api/overview).
    LoyaltyAccount loyalty_account?;
};

# Represents a response from a retrieve request containing a `TeamMember` object or error messages.
public type RetrieveTeamMemberResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # A record representing an individual team member for a business.
    TeamMember team_member?;
};

# Describes a slot available for booking, encapsulating appointment segments, the location and starting time.
public type Availability record {
    # The list of appointment segments available for booking
    AppointmentSegment[] appointment_segments?;
    # The ID of the location available for booking.
    string location_id?;
    # The RFC 3339 timestamp specifying the beginning time of the slot available for booking.
    string start_at?;
};

# 
public type RetrieveInventoryAdjustmentRequest record {
};

# Determines the billing cadence of a [Subscription](https://developer.squareup.com/reference/square_2021-08-18/objects/Subscription)
public type SubscriptionCadence string;

# The query filter to return the items containing the specified item option IDs.
public type CatalogQueryItemsForItemOptions record {
    # A set of `CatalogItemOption` IDs to be used to find associated
    # `CatalogItem`s. All Items that contain all of the given Item Options (in any order)
    # will be returned.
    string[] item_option_ids?;
};

# The response to a request for a set of `WorkweekConfig` objects. The response contains
# the requested `WorkweekConfig` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type ListWorkweekConfigsResponse record {
    # The value supplied in the subsequent request to fetch the next page of
    # `EmployeeWage` results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # A page of `EmployeeWage` results.
    WorkweekConfig[] workweek_configs?;
};

# Defines fields in a `RetrieveDispute` response.
public type RetrieveDisputeResponse record {
    # Represents a dispute a cardholder initiated with their bank.
    Dispute dispute?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# Defines the response returned by[CompletePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/complete-payment).
public type CompletePaymentResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# Defines the fields that are included in the response body of
# a request to the [ListTransactions](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/list-transactions) endpoint.
# 
# One of `errors` or `transactions` is present in a given response (never both).
public type ListTransactionsResponse record {
    # A pagination cursor for retrieving the next set of results,
    # if any remain. Provide this value as the `cursor` parameter in a subsequent
    # request to this endpoint.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # An array of transactions that match your query.
    Transaction[] transactions?;
};

# Represents a transaction processed with Square, either with the
# Connect API or with Square Point of Sale.
# 
# The `tenders` field of this object lists all methods of payment used to pay in
# the transaction.
public type Transaction record {
    # If the transaction was created in the Square Point of Sale app, this value
    # is the ID generated for the transaction by Square Point of Sale.
    # 
    # This ID has no relationship to the transaction's canonical `id`, which is
    # generated by Square's backend servers. This value is generated for bookkeeping
    # purposes, in case the transaction cannot immediately be completed (for example,
    # if the transaction is processed in offline mode).
    # 
    # It is not currently possible with the Connect API to perform a transaction
    # lookup by this value.
    @constraint:String {maxLength: 192}
    string client_id?;
    # The timestamp for when the transaction was created, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string created_at?;
    # The transaction's unique ID, issued by Square payments servers.
    @constraint:String {maxLength: 192}
    string id?;
    # The ID of the transaction's associated location.
    @constraint:String {maxLength: 50}
    string location_id?;
    # The order_id is an identifier for the order associated with this transaction, if any.
    @constraint:String {maxLength: 192}
    string order_id?;
    # The Square product that processed the transaction.
    string product?;
    # If the transaction was created with the [Charge](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/charge)
    # endpoint, this value is the same as the value provided for the `reference_id`
    # parameter in the request to that endpoint. Otherwise, it is not set.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # Refunds that have been applied to any tender in the transaction.
    Refund[] refunds?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address shipping_address?;
    # The tenders used to pay in the transaction.
    Tender[] tenders?;
};

# The type of the accrual rule that defines how buyers can earn points.
public type LoyaltyProgramAccrualRuleType string;

# Additional details about BANK_ACCOUNT type payments.
public type BankAccountPaymentDetails record {
    # The ownership type of the bank account performing the transfer.
    # The type can be `INDIVIDUAL`, `COMPANY`, or `UNKNOWN`.
    @constraint:String {maxLength: 50}
    string account_ownership_type?;
    # ACH-specific details about `BANK_ACCOUNT` type payments with the `transfer_type` of `ACH`.
    ACHDetails ach_details?;
    # The name of the bank associated with the bank account.
    @constraint:String {maxLength: 100}
    string bank_name?;
    # The two-letter ISO code representing the country the bank account is located in.
    @constraint:String {maxLength: 2, minLength: 2}
    string country?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # Uniquely identifies the bank account for this seller and can be used
    # to determine if payments are from the same bank account.
    @constraint:String {maxLength: 255}
    string fingerprint?;
    # The statement description as sent to the bank.
    @constraint:String {maxLength: 1000}
    string statement_description?;
    # The type of the bank transfer. The type can be `ACH` or `UNKNOWN`.
    @constraint:String {maxLength: 50}
    string transfer_type?;
};

# Defines the fields that are included in the response body of
# a request to the [Charge](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/charge) endpoint.
# 
# One of `errors` or `transaction` is present in a given response (never both).
public type ChargeResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a transaction processed with Square, either with the
    # Connect API or with Square Point of Sale.
    # 
    # The `tenders` field of this object lists all methods of payment used to pay in
    # the transaction.
    Transaction 'transaction?;
};

# Indicates whether the program is currently active.
public type LoyaltyProgramStatus string;

# A category to which a `CatalogItem` instance belongs.
public type CatalogCategory record {
    # The category name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
};

# Specifies how searched customers profiles are sorted, including the sort key and sort order.
public type CustomerSort record {
    # Use one or more customer attributes as the sort key to sort searched customer profiles. 
    # For example, use the creation date (`created_at`) of customers or default attributes as the sort key.
    # 
    # 
    # Default: `DEFAULT`.
    string 'field?;
    # Indicates the order in which results should be sorted based on the
    # sort field value. Strings use standard alphabetic comparison
    # to determine order. Strings representing numbers are sorted as strings.
    # 
    # Default: `ASC`.
    string 'order?;
};

# 
public type TipSettings record {
    # Indicates whether tipping is enabled for this checkout. Defaults to false.
    boolean allow_tipping?;
    # Indicates whether custom tip amounts are allowed during the checkout flow. Defaults to false.
    boolean custom_tip_field?;
    # Indicates whether tip options should be presented on the screen before presenting
    # the signature screen during card payment. Defaults to false.
    boolean separate_tip_screen?;
    # Enables the "Smart Tip Amounts" behavior.
    # Exact tipping options depend on the region in which the Square seller is active.
    # 
    # For payments under 10.00, in the Australia, Canada, Ireland, United Kingdom, and United States, tipping options are presented as no tip, .50, 1.00 or 2.00.
    # 
    # For payment amounts of 10.00 or greater, tipping options are presented as the following percentages: 0%, 5%, 10%, 15%.
    # 
    # If set to true, the `tip_percentages` settings is ignored.
    # Defaults to false.
    # 
    # To learn more about smart tipping, see [Accept Tips with the Square App](https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app).
    boolean smart_tipping?;
    # A list of tip percentages that should be presented during the checkout flow, specified as
    # up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to 15, 20, and 25.
    int[] tip_percentages?;
};

# A `CatalogItemOptionValue` links an item variation to an item option as
# an item option value. For example, a t-shirt item may offer a color option and
# a size option. An item option value would represent each variation of t-shirt:
# For example, "Color:Red, Size:Small" or "Color:Blue, Size:Medium".
public type CatalogItemOptionValueForItemVariation record {
    # The unique id of an item option.
    string item_option_id?;
    # The unique id of the selected value for the item option.
    string item_option_value_id?;
};

# 
public type V1RetrievePaymentRequest record {
};

# A range defined by two dates. Used for filtering a query for Connect v2
# objects that have date properties.
public type DateRange record {
    # A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
    # extended format for calendar dates.
    # The end of a date range (inclusive).
    string end_date?;
    # A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
    # extended format for calendar dates.
    # The beginning of a date range (inclusive).
    string start_date?;
};

# Describes a request to retrieve a refund using 
# [GetPaymentRefund](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/get-payment-refund).
public type GetPaymentRefundRequest record {
};

# Indicates a card's type, such as `CREDIT` or `DEBIT`.
public type CardType string;

# A request to create a new loyalty account.
public type CreateLoyaltyAccountRequest record {
    # A unique string that identifies this `CreateLoyaltyAccount` request. 
    # Keys can be any valid string, but must be unique for every request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # Describes a loyalty account. For more information, see
    # [Manage Loyalty Accounts Using the Loyalty API](https://developer.squareup.com/docs/loyalty-api/overview).
    LoyaltyAccount loyalty_account;
};

# Describes a gift card activity of the CLEAR_BALANCE type.
public type GiftCardActivityClearBalance record {
    Reason reason;
};

# A response that contains one or more `GiftCardActivity`. The response might contain a set of `Error` objects
# if the request resulted in errors.
public type ListGiftCardActivitiesResponse record {
    # When a response is truncated, it includes a cursor that you can use in a
    # subsequent request to fetch the next set of activities. If empty, this is
    # the final response.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # Gift card activities retrieved.
    GiftCardActivity[] gift_card_activities?;
};

# 
public type V1ListEmployeeRolesResponse record {
    # 
    V1EmployeeRole[] items?;
};

# Defines the parameters that can be included in the body of
# a request to the `CreateCheckout` endpoint.
public type CreateCheckoutRequest record {
    # The basic primitive of a multi-party transaction. The value is optional.
    # The transaction facilitated by you can be split from here.
    # 
    # If you provide this value, the `amount_money` value in your `additional_recipients` field
    # cannot be more than 90% of the `total_money` calculated by Square for your order.
    # The `location_id` must be a valid seller location where the checkout is occurring.
    # 
    # This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.
    # 
    # This field is currently not supported in the Square Sandbox.
    ChargeRequestAdditionalRecipient[] additional_recipients?;
    # If `true`, Square Checkout collects shipping information on your behalf and stores 
    # that information with the transaction information in the Square Seller Dashboard.
    # 
    # Default: `false`.
    boolean ask_for_shipping_address?;
    # A unique string that identifies this checkout among others you have created. It can be
    # any valid string but must be unique for every order sent to Square Checkout for a given location ID.
    # 
    # The idempotency key is used to avoid processing the same order more than once. If you are 
    # unsure whether a particular checkout was created successfully, you can attempt it again with
    # the same idempotency key and all the same other parameters without worrying about creating duplicates.
    # 
    # You should use a random number/string generator native to the language
    # you are working in to generate strings for your idempotency keys.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 192, minLength: 1}
    string idempotency_key;
    # The email address to display on the Square Checkout confirmation page
    # and confirmation email that the buyer can use to contact the seller.
    # 
    # If this value is not set, the confirmation page and email display the
    # primary email address associated with the seller's Square account.
    # 
    # Default: none; only exists if explicitly set.
    @constraint:String {maxLength: 254}
    string merchant_support_email?;
    # An optional note to associate with the `checkout` object.
    # 
    # This value cannot exceed 60 characters.
    @constraint:String {maxLength: 60}
    string note?;
    # 
    CreateOrderRequest 'order;
    # If provided, the buyer's email is prepopulated on the checkout page
    # as an editable text field.
    # 
    # Default: none; only exists if explicitly set.
    @constraint:String {maxLength: 254}
    string pre_populate_buyer_email?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address pre_populate_shipping_address?;
    # The URL to redirect to after the checkout is completed with `checkoutId`,
    # `transactionId`, and `referenceId` appended as URL parameters. For example,
    # if the provided redirect URL is `http://www.example.com/order-complete`, a
    # successful transaction redirects the customer to:
    # 
    # <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>
    # 
    # If you do not provide a redirect URL, Square Checkout displays an order
    # confirmation page on your behalf; however, it is strongly recommended that
    # you provide a redirect URL so you can verify the transaction results and
    # finalize the order through your existing/normal confirmation workflow.
    # 
    # Default: none; only exists if explicitly set.
    @constraint:String {maxLength: 800}
    string redirect_url?;
};

# The response to a request to delete a `Shift`. The response might contain a set of 
# `Error` objects if the request resulted in errors.
public type DeleteShiftResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The field to use for sorting.
public type InvoiceSortField string;

# The order (e.g., chronological or alphabetical) in which results from a request are returned.
public type SortOrder string;

# 
public type V1ListOrdersRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # The maximum number of payments to return in a single response. This value cannot exceed 200.
    int 'limit?;
    # The order in which payments are listed in the response.
    string 'order?;
};

# A response that contains one or more `GiftCard`. The response might contain a set of `Error`
# objects if the request resulted in errors.
public type ListGiftCardsResponse record {
    # When a response is truncated, it includes a cursor that you can use in a
    # subsequent request to fetch the next set of gift cards. If empty, this is
    # the final response.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # Gift cards retrieved.
    GiftCard[] gift_cards?;
};

# Represents a retrieve request for the wage setting of a team member.
public type RetrieveWageSettingRequest record {
};

# A record representing an individual team member for a business.
public type TeamMember record {
    # An object that represents a team member's assignment to locations.
    TeamMemberAssignedLocations assigned_locations?;
    # The timestamp, in RFC 3339 format, describing when the team member was created.
    # For example, "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z".
    string created_at?;
    # The email address associated with the team member.
    string email_address?;
    # The family name (that is, the last name) associated with the team member.
    string family_name?;
    # The given name (that is, the first name) associated with the team member.
    string given_name?;
    # The unique ID for the team member.
    string id?;
    # Whether the team member is the owner of the Square account.
    boolean is_owner?;
    # The team member's phone number, in E.164 format. For example:
    # +14155552671 - the country code is 1 for US
    # +551155256325 - the country code is 55 for BR
    string phone_number?;
    # A second ID used to associate the team member with an entity in another system.
    string reference_id?;
    # Describes the status of the team member.
    string status?;
    # The timestamp, in RFC 3339 format, describing when the team member was last updated.
    # For example, "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z".
    string updated_at?;
};

# 
public type CaptureTransactionRequest record {
};

# A tax applicable to an item.
public type CatalogTax record {
    # If `true`, the fee applies to custom amounts entered into the Square Point of Sale
    # app that are not associated with a particular `CatalogItem`.
    boolean applies_to_custom_amounts?;
    # Whether the tax is calculated based on a payment's subtotal or total.
    string calculation_phase?;
    # A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
    boolean enabled?;
    # Whether the tax is `ADDITIVE` or `INCLUSIVE`.
    string inclusion_type?;
    # The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign.
    # A value of `7.5` corresponds to 7.5%.
    string percentage?;
};

# Possible subscription status values.
public type SubscriptionStatus string;

# Request object for fetching all `BankAccount`
# objects linked to a account.
public type ListBankAccountsRequest record {
    # The pagination cursor returned by a previous call to this endpoint.
    # Use it in the next `ListBankAccounts` request to retrieve the next set 
    # of results.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # Upper limit on the number of bank accounts to return in the response. 
    # Currently, 1000 is the largest supported limit. You can specify a limit 
    # of up to 1000 bank accounts. This is also the default limit.
    int 'limit?;
    # Location ID. You can specify this optional filter 
    # to retrieve only the linked bank accounts belonging to a specific location.
    string location_id?;
};

# Stores details about an external payment. Contains only non-confidential information.
# For more information, see 
# [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
public type ExternalPaymentDetails record {
    # A description of the external payment source. For example, 
    # "Food Delivery Service".
    @constraint:String {maxLength: 255}
    string 'source;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money source_fee_money?;
    # An ID to associate the payment to its originating source.
    @constraint:String {maxLength: 255}
    string source_id?;
    # The type of external payment the seller received. It can be one of the following:
    # - CHECK - Paid using a physical check.
    # - BANK_TRANSFER - Paid using external bank transfer.
    # - OTHER\_GIFT\_CARD - Paid using a non-Square gift card.
    # - CRYPTO - Paid using a crypto currency.
    # - SQUARE_CASH - Paid using Square Cash App.
    # - SOCIAL - Paid using peer-to-peer payment applications.
    # - EXTERNAL - A third-party application gathered this payment outside of Square.
    # - EMONEY - Paid using an E-money provider.
    # - CARD - A credit or debit card that Square does not support.
    # - STORED_BALANCE - Use for house accounts, store credit, and so forth.
    # - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay for meals
    # - OTHER - A type not listed here.
    @constraint:String {maxLength: 50}
    string 'type;
};

# Sets the day of the week and hour of the day that a business starts a
# workweek. This is used to calculate overtime pay.
public type WorkweekConfig record {
    # A read-only timestamp in RFC 3339 format; presented in UTC.
    string created_at?;
    # The UUID for this object.
    string id?;
    # The local time at which a business week ends. Represented as a
    # string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are
    # truncated).
    @constraint:String {minLength: 1}
    string start_of_day_local_time;
    # The day of the week on which a business week ends for
    # compensation purposes.
    string start_of_week;
    # A read-only timestamp in RFC 3339 format; presented in UTC.
    string updated_at?;
    # Used for resolving concurrency issues. The request fails if the version
    # provided does not match the server version at the time of the request. If not provided,
    # Square executes a blind write; potentially overwriting data from another
    # write.
    int 'version?;
};

# 
public type CancelTerminalRefundRequest record {
};

# Defines the fields that can be included in a request to the
# [DeleteCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/delete-customer-group) endpoint.
public type DeleteCustomerGroupRequest record {
};

# A response that contains a `GiftCard`. The response might contain a set of `Error` objects if the request
# resulted in errors.
public type CreateGiftCardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# Defines the fields that are included in the response body of
# a request to the `BatchRetrieveOrders` endpoint.
public type BatchRetrieveOrdersResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The requested orders. This will omit any requested orders that do not exist.
    Order[] orders?;
};

# Defines an appointment segment of a booking.
public type AppointmentSegment record {
    # The time span in minutes of an appointment segment.
    @constraint:Int {maxValue: 1500}
    int duration_minutes;
    # The ID of the [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) object representing the service booked in this segment.
    @constraint:String {minLength: 1}
    string service_variation_id;
    # The current version of the item variation representing the service booked in this segment.
    int service_variation_version;
    # The ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-08-18/objects/TeamMember) object representing the team member booked in this segment.
    @constraint:String {minLength: 1}
    string team_member_id;
};

# The wrapper object for the Catalog entries of a given object type.
# 
# The type of a particular `CatalogObject` is determined by the value of the
# `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance.
# For example, the following list shows some instances of `CatalogObject` of a given `type` and
# their corresponding data attribute that can be set:
# - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object.
# - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object.
# - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object.
# - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object.
# - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object.
# - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object.
# - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object.
# - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object.
# - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object.
# - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object.
# - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object.
# - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object.
# - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.
# 
# 
# For a more detailed discussion of the Catalog data model, please see the
# [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
public type CatalogObject record {
    # A list of locations where the object is not present, even if `present_at_all_locations` is `true`.
    # This can include locations that are deactivated.
    string[] absent_at_location_ids?;
    # The Connect v1 IDs for this object at each location where it is present, where they
    # differ from the object's Connect V2 ID. The field will only be present for objects that
    # have been created or modified by legacy APIs.
    CatalogV1Id[] catalog_v1_ids?;
    # A category to which a `CatalogItem` instance belongs.
    CatalogCategory category_data?;
    # Contains information defining a custom attribute. Custom attributes are
    # intended to store additional information about a catalog object or to associate a
    # catalog object with an entity in another system. Do not use custom attributes
    # to store any sensitive information (personally identifiable information, card details, etc.).
    # [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
    CatalogCustomAttributeDefinition custom_attribute_definition_data?;
    # A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair
    # is a [CatalogCustomAttributeValue](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogCustomAttributeValue) object. The key is the `key` attribute
    # value defined in the associated [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogCustomAttributeDefinition)
    # object defined by the application making the request.
    # 
    # If the `CatalogCustomAttributeDefinition` object is
    # defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by
    # the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of
    # `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"`
    # if the application making the request is different from the application defining the custom attribute definition.
    # Otherwise, the key used in the map is simply `"cocoa_brand"`.
    # 
    # Application-defined custom attributes that are set at a global (location-independent) level.
    # Custom attribute values are intended to store additional information about a catalog object
    # or associations with an entity in another system. Do not use custom attributes
    # to store any sensitive information (personally identifiable information, card details, etc.).
    record {} custom_attribute_values?;
    # A discount applicable to items.
    CatalogDiscount discount_data?;
    # An identifier to reference this object in the catalog. When a new `CatalogObject`
    # is inserted, the client should set the id to a temporary identifier starting with
    # a "`#`" character. Other objects being inserted or updated within the same request
    # may use this identifier to refer to the new object.
    # 
    # When the server receives the new object, it will supply a unique identifier that
    # replaces the temporary identifier for all future references.
    @constraint:String {minLength: 1}
    string id;
    # An image file to use in Square catalogs. It can be associated with catalog
    # items, item variations, and categories.
    CatalogImage image_data?;
    # Identifies the `CatalogImage` attached to this `CatalogObject`.
    string image_id?;
    # If `true`, the object has been deleted from the database. Must be `false` for new objects
    # being inserted. When deleted, the `updated_at` field will equal the deletion time.
    boolean is_deleted?;
    # A [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
    CatalogItem item_data?;
    # A group of variations for a `CatalogItem`.
    CatalogItemOption item_option_data?;
    # An enumerated value that can link a
    # `CatalogItemVariation` to an item option as one of
    # its item option values.
    CatalogItemOptionValue item_option_value_data?;
    # An item variation (i.e., product) in the Catalog object model. Each item
    # may have a maximum of 250 item variations.
    CatalogItemVariation item_variation_data?;
    # Represents the unit used to measure a `CatalogItemVariation` and
    # specifies the precision for decimal quantities.
    CatalogMeasurementUnit measurement_unit_data?;
    # A modifier applicable to items at the time of sale.
    CatalogModifier modifier_data?;
    # A list of modifiers applicable to items at the time of sale.
    # 
    # For example, a "Condiments" modifier list applicable to a "Hot Dog" item
    # may contain "Ketchup", "Mustard", and "Relish" modifiers.
    # Use the `selection_type` field to specify whether or not multiple selections from
    # the modifier list are allowed.
    CatalogModifierList modifier_list_data?;
    # If `true`, this object is present at all locations (including future locations), except where specified in
    # the `absent_at_location_ids` field. If `false`, this object is not present at any locations (including future locations),
    # except where specified in the `present_at_location_ids` field. If not specified, defaults to `true`.
    boolean present_at_all_locations?;
    # A list of locations where the object is present, even if `present_at_all_locations` is `false`.
    # This can include locations that are deactivated.
    string[] present_at_location_ids?;
    # Defines how discounts are automatically applied to a set of items that match the pricing rule
    # during the active time period.
    CatalogPricingRule pricing_rule_data?;
    # Represents a collection of catalog objects for the purpose of applying a
    # `PricingRule`. Including a catalog object will include all of its subtypes.
    # For example, including a category in a product set will include all of its
    # items and associated item variations in the product set. Including an item in
    # a product set will also include its item variations.
    CatalogProductSet product_set_data?;
    # A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
    CatalogQuickAmountsSettings quick_amounts_settings_data?;
    # Describes a subscription plan. For more information, see
    # [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
    CatalogSubscriptionPlan subscription_plan_data?;
    # A tax applicable to an item.
    CatalogTax tax_data?;
    # Represents a time period - either a single period or a repeating period.
    CatalogTimePeriod time_period_data?;
    # The type of this object. Each object type has expected
    # properties expressed in a structured format within its corresponding `*_data` field below.
    string 'type;
    # Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"`
    # would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
    string updated_at?;
    # The version of the object. When updating an object, the version supplied
    # must match the version in the database, otherwise the write will be rejected as conflicting.
    int 'version?;
};

# Indicates the associated currency for an amount of money. Values correspond
# to [ISO 4217](https://wikipedia.org/wiki/ISO_4217).
public type Currency string;

# 
public type SearchCatalogObjectsResponse record {
    # The pagination cursor to be used in a subsequent request. If unset, this is the final response.
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # When the associated product catalog was last updated. Will
    # match the value for `end_time` or `cursor` if either field is included in the `SearchCatalog` request.
    string latest_time?;
    # The CatalogObjects returned.
    CatalogObject[] objects?;
    # A list of CatalogObjects referenced by the objects in the `objects` field.
    CatalogObject[] related_objects?;
};

# 
public type CatalogInfoResponseLimits record {
    # The maximum number of object IDs that may be included in a single
    # `/v2/catalog/batch-delete` request.
    int batch_delete_max_object_ids?;
    # The maximum number of object IDs that may appear in a `/v2/catalog/batch-retrieve`
    # request.
    int batch_retrieve_max_object_ids?;
    # The maximum number of objects that may appear within a single batch in a
    # `/v2/catalog/batch-upsert` request.
    int batch_upsert_max_objects_per_batch?;
    # The maximum number of objects that may appear across all batches in a
    # `/v2/catalog/batch-upsert` request.
    int batch_upsert_max_total_objects?;
    # The maximum number of results that may be returned in a page of a
    # `/v2/catalog/search` response.
    int search_max_page_limit?;
    # The maximum number of item IDs that may be included in a single
    # `/v2/catalog/update-item-modifier-lists` request.
    int update_item_modifier_lists_max_item_ids?;
    # The maximum number of modifier list IDs to be disabled that may be included in
    # a single `/v2/catalog/update-item-modifier-lists` request.
    int update_item_modifier_lists_max_modifier_lists_to_disable?;
    # The maximum number of modifier list IDs to be enabled that may be included in
    # a single `/v2/catalog/update-item-modifier-lists` request.
    int update_item_modifier_lists_max_modifier_lists_to_enable?;
    # The maximum number of item IDs that may be included in a single
    # `/v2/catalog/update-item-taxes` request.
    int update_item_taxes_max_item_ids?;
    # The maximum number of tax IDs to be disabled that may be included in a single
    # `/v2/catalog/update-item-taxes` request.
    int update_item_taxes_max_taxes_to_disable?;
    # The maximum number of tax IDs to be enabled that may be included in a single
    # `/v2/catalog/update-item-taxes` request.
    int update_item_taxes_max_taxes_to_enable?;
};

# 
public type RetrieveCatalogObjectResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The wrapper object for the Catalog entries of a given object type.
    # 
    # The type of a particular `CatalogObject` is determined by the value of the
    # `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance.
    # For example, the following list shows some instances of `CatalogObject` of a given `type` and
    # their corresponding data attribute that can be set:
    # - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object.
    # - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object.
    # - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object.
    # - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object.
    # - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object.
    # - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object.
    # - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object.
    # - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object.
    # - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object.
    # - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object.
    # - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object.
    # - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object.
    # - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.
    # 
    # 
    # For a more detailed discussion of the Catalog data model, please see the
    # [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
    CatalogObject 'object?;
    # A list of `CatalogObject`s referenced by the object in the `object` field.
    CatalogObject[] related_objects?;
};

# The set of search requirements.
public type SearchLoyaltyRewardsRequestLoyaltyRewardQuery record {
    # The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) to which the loyalty reward belongs.
    string loyalty_account_id;
    # The status of the loyalty reward.
    string status?;
};

# 
public type CreateDeviceCodeResponse record {
    # 
    DeviceCode device_code?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a phase in the process of calculating order totals.
# Service charges are applied after the indicated phase.
# 
# [Read more about how order totals are calculated.](https://developer.squareup.com/docs/orders-api/how-it-works#how-totals-are-calculated)
public type OrderServiceChargeCalculationPhase string;

# 
public type ProductType string;

# Represents a period of time during which a business location is open.
public type BusinessHoursPeriod record {
    # The day of week for this time period.
    string day_of_week?;
    # The end time of a business hours period, specified in local time using partial-time
    # RFC 3339 format.
    string end_local_time?;
    # The start time of a business hours period, specified in local time using partial-time
    # RFC 3339 format.
    string start_local_time?;
};

# Defines the parameters for a `DeleteDisputeEvidence` request.
public type DeleteDisputeEvidenceRequest record {
};

# Present only when `GiftCardActivityType` is UNBLOCK.
public type GiftCardActivityUnblock record {
    Reason reason;
};

# Indicates whether a CatalogModifierList supports multiple selections.
public type CatalogModifierListSelectionType string;

# 
public type ListCashDrawerShiftEventsRequest record {
    # Opaque cursor for fetching the next page of results.
    string cursor?;
    # Number of resources to be returned in a page of results (200 by
    # default, 1000 max).
    @constraint:Int {maxValue: 1000}
    int 'limit?;
    # The ID of the location to list cash drawer shifts for.
    @constraint:String {minLength: 1}
    string location_id;
};

# Defines the fields that can be included in a request to the
# [RetrieveCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/retrieve-customer-group) endpoint.
public type RetrieveCustomerGroupRequest record {
};

# Response object returned by the [UpdateLocation](https://developer.squareup.com/reference/square_2021-08-18/locations-api/update-location) endpoint.
public type UpdateLocationResponse record {
    # Information on errors encountered during the request.
    Error[] errors?;
    # 
    Location location?;
};

# Represents a refund processed for a Square transaction.
public type Refund record {
    # Additional recipients (other than the merchant) receiving a portion of this refund.
    # For example, fees assessed on a refund of a purchase by a third party integration.
    AdditionalRecipient[] additional_recipients?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # The timestamp for when the refund was created, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string created_at?;
    # The refund's unique ID.
    @constraint:String {maxLength: 255}
    string id;
    # The ID of the refund's associated location.
    @constraint:String {maxLength: 50}
    string location_id;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money processing_fee_money?;
    # The reason for the refund being issued.
    @constraint:String {maxLength: 192}
    string reason;
    # The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`,
    # or `FAILED`).
    string status;
    # The ID of the refunded tender.
    @constraint:String {maxLength: 192}
    string tender_id;
    # The ID of the transaction that the refunded tender is part of.
    @constraint:String {maxLength: 192}
    string transaction_id;
};

# 
public type CreateTerminalRefundResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # 
    TerminalRefund refund?;
};

# Represents a response from an update request containing the updated `WageSetting` object
# or error messages.
public type UpdateWageSettingResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # An object representing a team member's wage information.
    WageSetting wage_setting?;
};

# 
public type RetrieveInventoryTransferResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents the transfer of a quantity of product inventory at a
    # particular time from one location to another.
    InventoryTransfer transfer?;
};

# A request to list gift cards. You can optionally specify a filter to retrieve a subset of 
# gift cards.
public type ListGiftCardsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # If a cursor is not provided, it returns the first page of the results. 
    # For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
    string cursor?;
    # If a value is provided, returns only the gift cards linked to the specified customer
    @constraint:String {maxLength: 191}
    string customer_id?;
    # If a value is provided, it returns only that number of results per page.
    # The maximum number of results allowed per page is 50. The default value is 30.
    @constraint:Int {minValue: 1, maxValue: 50}
    int 'limit?;
    # If the state is provided, it returns the gift cards in the specified state 
    # (see [GiftCardStatus](https://developer.squareup.com/reference/square_2021-08-18/enums/GiftCardStatus)).
    # Otherwise, it returns the gift cards of all states.
    string state?;
    # If a type is provided, gift cards of this type are returned 
    # (see [GiftCardType](https://developer.squareup.com/reference/square_2021-08-18/enums/GiftCardType)).
    # If no type is provided, it returns gift cards of all types.
    string 'type?;
};

# Represents an update request for a `TeamMember` object.
public type UpdateTeamMemberRequest record {
    # A record representing an individual team member for a business.
    TeamMember team_member?;
};

# 
public type RetrieveBookingRequest record {
};

# The category of the seller’s cancellation policy.
public type BusinessAppointmentSettingsCancellationPolicy string;

# Filter events by event type.
public type LoyaltyEventTypeFilter record {
    # The loyalty event types used to filter the result.
    # If multiple values are specified, the endpoint uses a 
    # logical OR to combine them.
    string[] types;
};

# A filter based on order `source` information.
public type SearchOrdersSourceFilter record {
    # Filters by the [Source](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderSource) `name`. The filter returns any orders
    # with a `source.name` that matches any of the listed source names.
    # 
    # Max: 10 source names.
    string[] source_names?;
};

# 
public type SearchAvailabilityResponse record {
    # List of slots available for booking.
    Availability[] availabilities?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines the parameters for a `DeprecatedCreateDisputeEvidenceFile` request.
public type DeprecatedCreateDisputeEvidenceFileRequest record {
    # The MIME type of the uploaded file.
    # The type can be image/heic, image/heif, image/jpeg, application/pdf, image/png, or image/tiff.
    @constraint:String {maxLength: 40, minLength: 1}
    string content_type?;
    # The type of evidence you are uploading.
    string evidence_type?;
    # The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
};

# The response to a request to update a `Shift`. The response contains
# the updated `Shift` object and might contain a set of `Error` objects if
# the request resulted in errors.
public type UpdateShiftResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # A record of the hourly rate, start, and end times for a single work shift
    # for an employee. This might include a record of the start and end times for breaks
    # taken during the shift.
    Shift shift?;
};

# Defines the fields that are included in the response body of
# a request to the [RemoveGroupFromCustomer](https://developer.squareup.com/reference/square_2021-08-18/customers-api/remove-group-from-customer)
# endpoint.
public type RemoveGroupFromCustomerResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type TerminalRefundQueryFilter record {
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange created_at?;
    # `TerminalRefund` objects associated with a specific device. If no device is specified, then all
    # `TerminalRefund` objects for the signed-in account are displayed.
    string device_id?;
    # Filtered results with the desired status of the `TerminalRefund`.
    # Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, or `COMPLETED`.
    string status?;
};

# A request for a filtered and sorted set of `Shift` objects.
public type SearchShiftsRequest record {
    # An opaque cursor for fetching the next page.
    string cursor?;
    # The number of resources in a page (200 by default).
    @constraint:Int {minValue: 1, maxValue: 200}
    int 'limit?;
    # The parameters of a `Shift` search query, which includes filter and sort options.
    ShiftQuery query?;
};

# Defines the fields that are included in the response body of
# a request to the `CreateOrder` endpoint.
# 
# Either `errors` or `order` is present in a given response, but never both.
public type CreateOrderResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# V1PaymentDiscount
public type V1PaymentDiscount record {
    # 
    V1Money applied_money?;
    # The ID of the applied discount, if available. Discounts applied in older versions of Square Register might not have an ID.
    string discount_id?;
    # The discount's name.
    string name?;
};

# Indicates how the discount is applied to the associated line item or order.
public type OrderLineItemDiscountType string;

# Defines the fields that are included in the response from the
# [ListSubscriptionEvents](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/list-subscription-events)
# endpoint.
public type ListSubscriptionEventsResponse record {
    # When a response is truncated, it includes a cursor that you can
    # use in a subsequent request to fetch the next set of events.
    # If empty, this is the final response.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The `SubscriptionEvents` retrieved.
    SubscriptionEvent[] subscription_events?;
};

# Defines the fields in a `SubmitEvidence` response.
public type SubmitEvidenceResponse record {
    # Represents a dispute a cardholder initiated with their bank.
    Dispute dispute?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# Describes a request to update a payment using 
# [UpdatePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/update-payment).
public type UpdatePaymentRequest record {
    # A unique string that identifies this `UpdatePayment` request. Keys can be any valid string
    # but must be unique for every `UpdatePayment` request.
    # 
    # The maximum is 45 characters.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency).
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# 
public type RenewTokenRequest record {
    # The token you want to renew.
    @constraint:String {maxLength: 1024, minLength: 2}
    string access_token?;
};

# Represents a discount being returned that applies to one or more return line items in an
# order.
# 
# Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals.
# The amount distributed to each return line item is relative to that item’s contribution to the
# order subtotal.
public type OrderReturnDiscount record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogDiscount).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this discount references.
    int catalog_version?;
    # The discount's name.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the tax, as a string representation of a decimal number.
    # A value of `"7.25"` corresponds to a percentage of 7.25%.
    # 
    # `percentage` is not set for amount-based discounts.
    @constraint:String {maxLength: 10}
    string percentage?;
    # Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped
    # discounts, the server generates references in `applied_discounts` on all
    # `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount is only applied to
    # `OrderReturnLineItem`s with references in their `applied_discounts` field.
    string scope?;
    # The discount `uid` from the order that contains the original application of this discount.
    @constraint:String {maxLength: 60}
    string source_discount_uid?;
    # The type of the discount. If it is created by the API, it is `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
    # 
    # Discounts that do not reference a catalog object ID must have a type of
    # `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
    string 'type?;
    # A unique ID that identifies the returned discount only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Represents a dispute a cardholder initiated with their bank.
public type Dispute record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # The ID of the dispute in the card brand system, generated by the card brand.
    @constraint:String {maxLength: 40, minLength: 1}
    string brand_dispute_id?;
    # The card brand used in the disputed payment.
    string card_brand?;
    # The timestamp when the dispute was created, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string created_at?;
    # The unique ID for this `Dispute`, generated by Square.
    @constraint:String {maxLength: 40, minLength: 1}
    string dispute_id?;
    # The payment the cardholder disputed.
    DisputedPayment disputed_payment?;
    # The time when the next action is due, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string due_at?;
    # The IDs of the evidence associated with the dispute.
    DisputeEvidenceidsItemsString[] evidence_ids?;
    # The unique ID for this `Dispute`, generated by Square.
    @constraint:String {maxLength: 40, minLength: 1}
    string id?;
    # The ID of the location where the dispute originated.
    @constraint:String {maxLength: 40, minLength: 1}
    string location_id?;
    # The dispute reason why the cardholder initiated the dispute with their bank.
    string reason?;
    # The timestamp when the dispute was reported, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string reported_at?;
    # The timestamp when the dispute was reported, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string reported_date?;
    # The current state of this dispute.
    string state?;
    # The timestamp when the dispute was last updated, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string updated_at?;
    # The current version of the `Dispute`.
    int 'version?;
};

# Defines the body parameters that can be provided in a request to the
# __CreateMobileAuthorizationCode__ endpoint.
public type CreateMobileAuthorizationCodeRequest record {
    # The Square location ID the authorization code should be tied to.
    @constraint:String {maxLength: 191, minLength: 1}
    string location_id?;
};

# A request to retrieve gift cards by their GANs.
public type RetrieveGiftCardFromGANRequest record {
    # The gift card account number (GAN) of the gift card to retrieve.
    # The maximum length of a GAN is 255 digits to account for third-party GANs that have been imported.
    # Square-issued gift cards have 16-digit GANs.
    @constraint:String {maxLength: 255, minLength: 1}
    string gan;
};

# A mapping between a temporary client-supplied ID and a permanent server-generated ID.
# 
# When calling [UpsertCatalogObject](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/upsert-catalog-object) or
# [BatchUpsertCatalogObjects](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/batch-upsert-catalog-objects) to
# create a [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance, you can supply
# a temporary ID for the to-be-created object, especially when the object is to be referenced
# elsewhere in the same request body. This temporary ID can be any string unique within
# the call, but must be prefixed by "#".
# 
# After the request is submitted and the object created, a permanent server-generated ID is assigned
# to the new object. The permanent ID is unique across the Square catalog.
public type CatalogIdMapping record {
    # The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
    string client_object_id?;
    # The permanent ID for the CatalogObject created by the server.
    string object_id?;
};

# V1Settlement
public type V1Settlement record {
    # The Square-issued unique identifier for the bank account associated with the settlement.
    string bank_account_id?;
    # The entries included in this settlement.
    V1SettlementEntry[] entries?;
    # The settlement's unique identifier.
    string id?;
    # The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format.
    string initiated_at?;
    # The settlement's current status.
    string status?;
    # 
    V1Money total_money?;
};

# Defines the response returned by [GetRefund](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/get-payment-refund).
# 
# Note: If there are errors processing the request, the refund field might not be
# present or it might be present in a FAILED state.
public type GetPaymentRefundResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a refund of a payment made using Square. Contains information about
    # the original payment and the amount of money refunded.
    PaymentRefund refund?;
};

# 
public type BatchRetrieveCatalogObjectsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # A list of [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s returned.
    CatalogObject[] objects?;
    # A list of [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s referenced by the object in the `objects` field.
    CatalogObject[] related_objects?;
};

# Defines parameters in a
# [SearchSubscriptions](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/search-subscriptions) endpoint
# request.
public type SearchSubscriptionsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The upper limit on the number of subscriptions to return
    # in the response.
    # 
    # Default: `200`
    @constraint:Int {minValue: 1}
    int 'limit?;
    # Represents a query (including filtering criteria) used to search for subscriptions.
    SearchSubscriptionsQuery query?;
};

# V1Refund
public type V1Refund record {
    # The time when the merchant initiated the refund for Square to process, in ISO 8601 format.
    string created_at?;
    # Indicates whether or not the refund is associated with an exchange. If is_exchange is true, the refund reflects the value of goods returned in the exchange not the total money refunded.
    boolean is_exchange?;
    # 
    string merchant_id?;
    # A Square-issued ID associated with the refund. For single-tender refunds, payment_id is the ID of the original payment ID. For split-tender refunds, payment_id is the ID of the original tender. For exchange-based refunds (is_exchange == true), payment_id is the ID of the original payment ID even if the payment includes other tenders.
    string payment_id?;
    # The time when Square processed the refund on behalf of the merchant, in ISO 8601 format.
    string processed_at?;
    # The merchant-specified reason for the refund.
    string reason?;
    # All of the additive taxes associated with the refund.
    V1PaymentTax[] refunded_additive_tax?;
    # 
    V1Money refunded_additive_tax_money?;
    # 
    V1Money refunded_discount_money?;
    # All of the inclusive taxes associated with the refund.
    V1PaymentTax[] refunded_inclusive_tax?;
    # 
    V1Money refunded_inclusive_tax_money?;
    # 
    V1Money refunded_money?;
    # 
    V1Money refunded_processing_fee_money?;
    # 
    V1Money refunded_surcharge_money?;
    # A list of all surcharges associated with the refund.
    V1PaymentSurcharge[] refunded_surcharges?;
    # 
    V1Money refunded_tax_money?;
    # 
    V1Money refunded_tip_money?;
    # The type of refund
    string 'type?;
};

# Provides information about the subscription event.
public type SubscriptionEventInfo record {
    InfoCode code?;
    # A human-readable explanation for the event.
    string detail?;
};

# Represents a tax being returned that applies to one or more return line items in an order.
# 
# Fixed-amount, order-scoped taxes are distributed across all non-zero return line item totals.
# The amount distributed to each return line item is relative to that item’s contribution to the
# order subtotal.
public type OrderReturnTax record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogTax).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this tax references.
    int catalog_version?;
    # The tax's name.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the tax, as a string representation of a decimal number.
    # For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
    @constraint:String {maxLength: 10}
    string percentage?;
    # Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped
    # taxes, Square generates references in `applied_taxes` on all
    # `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax is only applied to
    # `OrderReturnLineItem`s with references in their `applied_discounts` field.
    string scope?;
    # The tax `uid` from the order that contains the original tax charge.
    @constraint:String {maxLength: 60}
    string source_tax_uid?;
    # Indicates the calculation method used to apply the tax.
    string 'type?;
    # A unique ID that identifies the returned tax only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Represents a refund of a payment made using Square. Contains information about
# the original payment and the amount of money refunded.
public type PaymentRefund record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money app_fee_money?;
    # The timestamp of when the refund was created, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string created_at?;
    # The unique ID for this refund, generated by Square.
    @constraint:String {maxLength: 255, minLength: 1}
    string id;
    # The location ID associated with the payment this refund is attached to.
    @constraint:String {maxLength: 50}
    string location_id?;
    # The ID of the order associated with the refund.
    @constraint:String {maxLength: 192}
    string order_id?;
    # The ID of the payment associated with this refund.
    @constraint:String {maxLength: 192}
    string payment_id?;
    # Processing fees and fee adjustments assessed by Square for this refund.
    ProcessingFee[] processing_fee?;
    # The reason for the refund.
    @constraint:String {maxLength: 192}
    string reason?;
    # The refund's status:
    # - `PENDING` - Awaiting approval.
    # - `COMPLETED` - Successfully completed.
    # - `REJECTED` - The refund was rejected.
    # - `FAILED` - An error occurred.
    @constraint:String {maxLength: 50}
    string status?;
    # The timestamp of when the refund was last updated, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string updated_at?;
};

# Defines the visibility of a custom attribute to sellers in Square
# client applications, Square APIs or in Square UIs (including Square Point
# of Sale applications and Square Dashboard).
public type CatalogCustomAttributeDefinitionSellerVisibility string;

# The query filter to return the items containing the specified tax IDs.
public type CatalogQueryItemsForTax record {
    # A set of `CatalogTax` IDs to be used to find associated `CatalogItem`s.
    string[] tax_ids;
};

# Indicates whether this is a line-item or order-level tax.
public type OrderLineItemTaxScope string;

# 
public type V1ListSettlementsRequestStatus string;

# Defines the parameters that can be included in the body of
# a request to the [Charge](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/charge) endpoint.
# 
# Deprecated - recommend using [CreatePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/create-payment)
public type ChargeRequest record {
    # The basic primitive of multi-party transaction. The value is optional.
    # The transaction facilitated by you can be split from here.
    # 
    # If you provide this value, the `amount_money` value in your additional_recipients
    # must not be more than 90% of the `amount_money` value in the charge request.
    # The `location_id` must be the valid location of the app owner merchant.
    # 
    # This field requires the `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.
    # 
    # This field is currently not supported in sandbox.
    AdditionalRecipient[] additional_recipients?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address billing_address?;
    # The buyer's email address, if available. This value is optional,
    # but this transaction is ineligible for chargeback protection if it is not
    # provided.
    string buyer_email_address?;
    # A payment token generated from the [Card.tokenize()](https://developer.squareup.com/reference/sdks/web/payments/objects/Card#Card.tokenize) that represents the card
    # to charge.
    # 
    # The application that provides a payment token to this endpoint must be the
    # _same application_ that generated the payment token with the Web Payments SDK.
    # Otherwise, the nonce is invalid.
    # 
    # Do not provide a value for this field if you provide a value for
    # `customer_card_id`.
    @constraint:String {maxLength: 192}
    string card_nonce?;
    # The ID of the customer card on file to charge. Do
    # not provide a value for this field if you provide a value for `card_nonce`.
    # 
    # If you provide this value, you _must_ also provide a value for
    # `customer_id`.
    @constraint:String {maxLength: 192}
    string customer_card_id?;
    # The ID of the customer to associate this transaction with. This field
    # is required if you provide a value for `customer_card_id`, and optional
    # otherwise.
    @constraint:String {maxLength: 50}
    string customer_id?;
    # If `true`, the request will only perform an Auth on the provided
    # card. You can then later perform either a Capture (with the
    # [CaptureTransaction](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/capture-transaction) endpoint) or a Void
    # (with the [VoidTransaction](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/void-transaction) endpoint).
    # 
    # Default value: `false`
    boolean delay_capture?;
    # A value you specify that uniquely identifies this
    # transaction among transactions you've created.
    # 
    # If you're unsure whether a particular transaction succeeded,
    # you can reattempt it with the same idempotency key without
    # worrying about double-charging the buyer.
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/working-with-apis/idempotency) for more information.
    @constraint:String {maxLength: 192, minLength: 1}
    string idempotency_key;
    # An optional note to associate with the transaction.
    # 
    # This value cannot exceed 60 characters.
    @constraint:String {maxLength: 60}
    string note?;
    # The ID of the order to associate with this transaction.
    # 
    # If you provide this value, the `amount_money` value of your request must
    # __exactly match__ the value of the order's `total_money` field.
    @constraint:String {maxLength: 192}
    string order_id?;
    # An optional ID you can associate with the transaction for your own
    # purposes (such as to associate the transaction with an entity ID in your
    # own database).
    # 
    # This value cannot exceed 40 characters.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address shipping_address?;
    # A token generated by SqPaymentForm's verifyBuyer() that represents
    # customer's device info and 3ds challenge result.
    string verification_token?;
};

# Defines the fields that are included in the response body of
# a request to the [RetrieveCard](#endpoint-cards-retrievecard) endpoint.
# 
# Note: if there are errors processing the request, the card field will not be
# present.
public type RetrieveCardResponse record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# 
public type CatalogCustomAttributeDefinitionNumberConfig record {
    # An integer between 0 and 5 that represents the maximum number of
    # positions allowed after the decimal in number custom attribute values
    # For example:
    # 
    # - if the precision is 0, the quantity can be 1, 2, 3, etc.
    # - if the precision is 1, the quantity can be 0.1, 0.2, etc.
    # - if the precision is 2, the quantity can be 0.01, 0.12, etc.
    # 
    # Default: 5
    @constraint:Int {maxValue: 5}
    int precision?;
};

# V1PaymentSurcharge
public type V1PaymentSurcharge record {
    # 
    V1Money amount_money?;
    # 
    V1Money applied_money?;
    # The name of the surcharge.
    string name?;
    # The amount of the surcharge as a percentage. The percentage is provided as a string representing the decimal equivalent of the percentage. For example, "0.7" corresponds to a 7% surcharge. Exactly one of rate or amount_money should be set.
    string rate?;
    # A Square-issued unique identifier associated with the surcharge.
    string surcharge_id?;
    # Indicates whether the surcharge is taxable.
    boolean taxable?;
    # The list of taxes that should be applied to the surcharge.
    V1PaymentTax[] taxes?;
    # Indicates the source of the surcharge. For example, if it was applied as an automatic gratuity for a large group.
    string 'type?;
};

# 
public type TerminalRefund record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # The ID of the application that created the refund.
    string app_id?;
    # Present if the status is `CANCELED`.
    string cancel_reason?;
    # The time when the `TerminalRefund` was created, as an RFC 3339 timestamp.
    string created_at?;
    # The RFC 3339 duration, after which the refund is automatically canceled.
    # A `TerminalRefund` that is `PENDING` is automatically `CANCELED` and has a cancellation reason
    # of `TIMED_OUT`.
    # 
    # Default: 5 minutes from creation.
    # 
    # Maximum: 5 minutes
    string deadline_duration?;
    # The unique ID of the device intended for this `TerminalRefund`.
    # The Id can be retrieved from /v2/devices api.
    string device_id?;
    # A unique ID for this `TerminalRefund`.
    @constraint:String {maxLength: 255, minLength: 10}
    string id?;
    # The location of the device where the `TerminalRefund` was directed.
    string location_id?;
    # The reference to the Square order ID for the payment identified by the `payment_id`.
    string order_id?;
    # The unique ID of the payment being refunded.
    @constraint:String {minLength: 1}
    string payment_id;
    # A description of the reason for the refund.
    # Note: maximum 192 characters
    @constraint:String {maxLength: 192}
    string reason?;
    # The reference to the payment refund created by completing this `TerminalRefund`.
    string refund_id?;
    # The status of the `TerminalRefund`.
    # Options: `PENDING`, `IN_PROGRESS`, `CANCELED`, or `COMPLETED`.
    string status?;
    # The time when the `TerminalRefund` was last updated, as an RFC 3339 timestamp.
    string updated_at?;
};

# A request to update a `Shift` object.
public type UpdateShiftRequest record {
    # A record of the hourly rate, start, and end times for a single work shift
    # for an employee. This might include a record of the start and end times for breaks
    # taken during the shift.
    Shift shift;
};

# 
public type V1ListEmployeesRequestStatus string;

# A request to search for loyalty events.
public type SearchLoyaltyEventsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for your original query.
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The maximum number of results to include in the response. 
    # The last page might contain fewer events. 
    # The default is 30 events.
    @constraint:Int {minValue: 1, maxValue: 30}
    int 'limit?;
    # Represents a query used to search for loyalty events.
    LoyaltyEventQuery query?;
};

# Enumerates the possible status of a `Shift`.
public type ShiftStatus string;

# 
public type V1SettlementStatus string;

# A collection of various money amounts.
public type OrderMoneyAmounts record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money discount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money service_charge_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money tax_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money tip_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
};

# The summary of a closed cash drawer shift.
# This model contains only the money counted to start a cash drawer shift, counted
# at the end of the shift, and the amount that should be in the drawer at shift
# end based on summing all cash drawer shift events.
public type CashDrawerShiftSummary record {
    # The shift close time in ISO 8601 format.
    string closed_at?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money closed_cash_money?;
    # An employee free-text description of a cash drawer shift.
    string description?;
    # The shift end time in ISO 8601 format.
    string ended_at?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money expected_cash_money?;
    # The shift unique ID.
    string id?;
    # The shift start time in ISO 8601 format.
    string opened_at?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money opened_cash_money?;
    # The shift current state.
    string state?;
};

# 
public type RetrieveInventoryCountResponse record {
    # The current calculated inventory counts for the requested object and
    # locations.
    InventoryCount[] counts?;
    # The pagination cursor to be used in a subsequent request. If unset,
    # this is the final response.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Sorting criteria for a `SearchOrders` request. Results can only be sorted
# by a timestamp field.
public type SearchOrdersSort record {
    # The field to sort by.
    # 
    # __Important:__ When using a [DateTimeFilter](https://developer.squareup.com/reference/square_2021-08-18/objects/SearchOrdersFilter),
    # `sort_field` must match the timestamp field that the `DateTimeFilter` uses to
    # filter. For example, if you set your `sort_field` to `CLOSED_AT` and you use a
    # `DateTimeFilter`, your `DateTimeFilter` must filter for orders by their `CLOSED_AT` date.
    # If this field does not match the timestamp field in `DateTimeFilter`,
    # `SearchOrders` returns an error.
    # 
    # Default: `CREATED_AT`.
    string sort_field;
    # The chronological order in which results are returned. Defaults to `DESC`.
    string sort_order?;
};

# Present only when `GiftCardActivityType` is LOAD.
public type GiftCardActivityLoad record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # If you are not using the Orders API, this field is required because it is used to identify a buyer 
    # to perform compliance checks.
    string[] buyer_payment_instrument_ids?;
    # The `line_item_uid` of the gift card’s line item in the order associated with the activity.
    # It is populated along with `order_id` and is required if using the Square Orders API.
    string line_item_uid?;
    # The `order_id` of the order associated with the activity.
    # It is populated along with `line_item_uid` and is required if using the Square Orders API.
    string order_id?;
    # A client-specified ID to associate an entity, in another system, with this gift card
    # activity. This can be used to track the order or payment related information when the Square Orders
    # API is not being used.
    string reference_id?;
};

# The booking profile of a seller's team member, including the team member's ID, display name, description and whether the team member can be booked as a service provider.
public type TeamMemberBookingProfile record {
    # The description of the team member.
    string description?;
    # The display name of the team member.
    string display_name?;
    # Indicates whether the team member can be booked through the Bookings API or the seller's online booking channel or site (`true) or not (`false`).
    boolean is_bookable?;
    # The URL of the team member's image for the bookings profile.
    string profile_image_url?;
    # The ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-08-18/objects/TeamMember) object for the team member associated with the booking profile.
    string team_member_id?;
};

# A batch of catalog objects.
public type CatalogObjectBatch record {
    # A list of CatalogObjects belonging to this batch.
    CatalogObject[] objects;
};

# Retrieves details for a specific Card. Accessible via
# HTTP requests at GET https://connect.squareup.com/v2/cards/{card_id}
public type RetrieveCardRequest record {
};

# Describes a `GetInvoice` request.
public type GetInvoiceRequest record {
};

# A response that includes loyalty account created.
public type CreateLoyaltyAccountResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Describes a loyalty account. For more information, see
    # [Manage Loyalty Accounts Using the Loyalty API](https://developer.squareup.com/docs/loyalty-api/overview).
    LoyaltyAccount loyalty_account?;
};

# Defines the request parameters for the `RetrieveDispute` endpoint.
public type RetrieveDisputeRequest record {
};

# Represents a `ListSites` response. The response can include either `sites` or `errors`.
public type ListSitesResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The sites that belong to the seller.
    Site[] sites?;
};

# Defines the fields that are included in the response body of
# a request to the __CreateMobileAuthorizationCode__ endpoint.
public type CreateMobileAuthorizationCodeResponse record {
    # Generated authorization code that connects a mobile application instance
    # to a Square account.
    @constraint:String {maxLength: 191}
    string authorization_code?;
    # Represents an error encountered during a request to the Connect API.
    # 
    # See [Handling errors](https://developer.squareup.com/docs/build-basics/handling-errors) for more information.
    Error 'error?;
    # The timestamp when `authorization_code` expires in
    # [RFC 3339](https://tools.ietf.org/html/rfc3339) format, e.g., "2016-09-04T23:59:33.123Z".
    @constraint:String {maxLength: 48, minLength: 20}
    string expires_at?;
};

# Indicates the specific day  of the week.
public type DayOfWeek string;

# Request object to fetch a specific `BankAccount`
# by the object ID.
public type GetBankAccountRequest record {
};

# 
public type V1ListRefundsResponse record {
    # 
    V1Refund[] items?;
};

# A defined break template that sets an expectation for possible `Break`
# instances on a `Shift`.
public type BreakType record {
    # A human-readable name for this type of break. The name is displayed to
    # employees in Square products.
    @constraint:String {minLength: 1}
    string break_name;
    # A read-only timestamp in RFC 3339 format.
    string created_at?;
    # Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
    # this break. Precision less than minutes is truncated.
    @constraint:String {minLength: 1}
    string expected_duration;
    # The UUID for this object.
    @constraint:String {maxLength: 255}
    string id?;
    # Whether this break counts towards time worked for compensation
    # purposes.
    boolean is_paid;
    # The ID of the business location this type of break applies to.
    @constraint:String {minLength: 1}
    string location_id;
    # A read-only timestamp in RFC 3339 format.
    string updated_at?;
    # Used for resolving concurrency issues. The request fails if the version
    # provided does not match the server version at the time of the request. If a value is not
    # provided, Square's servers execute a "blind" write; potentially
    # overwriting another writer's data.
    int 'version?;
};

# Describes a request to create a payment using 
# [CreatePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/create-payment).
public type CreatePaymentRequest record {
    # If set to `true` and charging a Square Gift Card, a payment might be returned with
    # `amount_money` equal to less than what was requested. For example, a request for $20 when charging
    # a Square Gift Card with a balance of $5 results in an APPROVED payment of $5. You might choose
    # to prompt the buyer for an additional payment to cover the remainder or cancel the Gift Card
    # payment. This field cannot be `true` when `autocomplete = true`.
    # 
    # For more information, see
    # [Partial amount with Square Gift Cards](https://developer.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).
    # 
    # Default: false
    boolean accept_partial_authorization?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money app_fee_money?;
    # If set to `true`, this payment will be completed when possible. If
    # set to `false`, this payment is held in an approved state until either
    # explicitly completed (captured) or canceled (voided). For more information, see
    # [Delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments#delayed-capture-of-a-card-payment).
    # 
    # Default: true
    boolean autocomplete?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address billing_address?;
    # The buyer's email address.
    @constraint:String {maxLength: 255}
    string buyer_email_address?;
    # Stores details about a cash payment. Contains only non-confidential information. For more information, see 
    # [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
    CashPaymentDetails cash_details?;
    # The [Customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) ID of the customer associated with the payment.
    # 
    # This is required if the `source_id` refers to a card on file created using the Customers API.
    string customer_id?;
    # The duration of time after the payment's creation when Square automatically cancels the
    # payment. This automatic cancellation applies only to payments that do not reach a terminal state
    # (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.
    # 
    # This parameter should be specified as a time duration, in RFC 3339 format, with a minimum value
    # of 1 minute.
    # 
    # Note: This feature is only supported for card payments. This parameter can only be set for a delayed
    # capture payment (`autocomplete=false`).
    # 
    # Default:
    # 
    # - Card-present payments: "PT36H" (36 hours) from the creation time.
    # - Card-not-present payments: "P7D" (7 days) from the creation time.
    string delay_duration?;
    # Stores details about an external payment. Contains only non-confidential information.
    # For more information, see 
    # [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
    ExternalPaymentDetails external_details?;
    # A unique string that identifies this `CreatePayment` request. Keys can be any valid string
    # but must be unique for every `CreatePayment` request.
    # 
    # Max: 45 characters
    # 
    # Note: The number of allowed characters might be less than the stated maximum, if multi-byte
    # characters are used.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
    # The location ID to associate with the payment. If not specified, the default location is
    # used.
    string location_id?;
    # An optional note to be entered by the developer when creating a payment.
    # 
    # Limit 500 characters.
    @constraint:String {maxLength: 500}
    string note?;
    # Associates a previously created order with this payment.
    string order_id?;
    # A user-defined ID to associate with the payment.
    # 
    # You can use this field to associate the payment to an entity in an external system 
    # (for example, you might specify an order ID that is generated by a third-party shopping cart).
    # 
    # Limit 40 characters.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address shipping_address?;
    # The ID for the source of funds for this payment. This can be a payment token 
    # (card nonce) generated by the Square payment form or a card on file made with the 
    # Customers API. If recording a payment that the seller 
    # received outside of Square, specify either "CASH" or "EXTERNAL". 
    # For more information, see 
    # [Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    @constraint:String {minLength: 1}
    string source_id;
    # Optional additional payment information to include on the customer's card statement
    # as part of the statement description. This can be, for example, an invoice number, ticket number,
    # or short description that uniquely identifies the purchase.
    # 
    # Note that the `statement_description_identifier` might get truncated on the statement description
    # to fit the required information including the Square identifier (SQ *) and name of the
    # seller taking the payment.
    @constraint:String {maxLength: 20}
    string statement_description_identifier?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money tip_money?;
    # An identifying token generated by [payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
    # Verification tokens encapsulate customer device information and 3-D Secure
    # challenge results to indicate that Square has verified the buyer identity.
    # 
    # For more information, see [SCA Overview](https://developer.squareup.com/docs/sca-overview).
    string verification_token?;
};

# Represents a single physical count, inventory, adjustment, or transfer
# that is part of the history of inventory changes for a particular
# [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance.
public type InventoryChange record {
    # Represents a change in state or quantity of product inventory at a
    # particular time and location.
    InventoryAdjustment adjustment?;
    # Represents the unit used to measure a `CatalogItemVariation` and
    # specifies the precision for decimal quantities.
    CatalogMeasurementUnit measurement_unit?;
    # The ID of the [CatalogMeasurementUnit](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogMeasurementUnit) object representing the catalog measurement unit associated with the inventory change.
    string measurement_unit_id?;
    # Represents the quantity of an item variation that is physically present
    # at a specific location, verified by a seller or a seller's employee. For example,
    # a physical count might come from an employee counting the item variations on
    # hand or from syncing with an external system.
    InventoryPhysicalCount physical_count?;
    # Represents the transfer of a quantity of product inventory at a
    # particular time from one location to another.
    InventoryTransfer transfer?;
    # Indicates how the inventory change is applied. See
    # [InventoryChangeType](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryChangeType) for all possible values.
    string 'type?;
};

# The type of the loyalty event.
public type LoyaltyEventType string;

# 
public type DeleteCatalogObjectResponse record {
    # The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # of this deletion in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
    string deleted_at?;
    # The IDs of all catalog objects deleted by this request.
    # Multiple IDs may be returned when associated objects are also deleted, for example
    # a catalog item variation will be deleted (and its ID included in this field)
    # when its parent catalog item is deleted.
    string[] deleted_object_ids?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type CancelTerminalCheckoutResponse record {
    # 
    TerminalCheckout checkout?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# Defines the fields in a `ListDisputeEvidence` response.
public type ListDisputeEvidenceResponse record {
    # The pagination cursor to be used in a subsequent request.
    # If unset, this is the final response. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The list of evidence previously uploaded to the specified dispute.
    DisputeEvidence[] evidence?;
};

# Represents the parameters in a search for `TeamMember` objects.
public type SearchTeamMembersQuery record {
    # Represents a filter used in a search for `TeamMember` objects. `AND` logic is applied
    # between the individual fields, and `OR` logic is applied within list-based fields.
    # For example, setting this filter value:
    # ```
    # filter = (locations_ids = ["A", "B"], status = ACTIVE)
    # ```
    # returns only active team members assigned to either location "A" or "B".
    SearchTeamMembersFilter filter?;
};

# 
public type V1ListSettlementsRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
    string begin_time?;
    # The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
    string end_time?;
    # The maximum number of settlements to return in a single response. This value cannot exceed 200.
    int 'limit?;
    # The order in which settlements are listed in the response.
    string 'order?;
    # Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED).
    string status?;
};

# Represents a Square gift card.
public type GiftCard record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money balance_money?;
    # The timestamp when the gift card was created, in RFC 3339 format. 
    # In the case of a digital gift card, it is the time when you create a card 
    # (using the Square Point of Sale application, Seller Dashboard, or Gift Cards API).  
    # In the case of a plastic gift card, it is the time when Square associates the card with the 
    # seller at the time of activation.
    string created_at?;
    # The IDs of the customers to whom this gift card is linked.
    GiftcardCustomeridsItemsString[] customer_ids?;
    # The gift card account number.
    string gan?;
    GANSource gan_source?;
    # The Square-assigned ID of the gift card.
    string id?;
    Status state?;
    Type 'type;
};

# Describes a `SearchInvoices` request.
public type SearchInvoicesRequest record {
    # A pagination cursor returned by a previous call to this endpoint. 
    # Provide this cursor to retrieve the next set of results for your original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of invoices to return (200 is the maximum `limit`). 
    # If not provided, the server uses a default limit of 100 invoices.
    int 'limit?;
    # Describes query criteria for searching invoices.
    InvoiceQuery query;
};

# A location's physical or mobile type.
public type LocationType string;

# Stores information about an invoice. You use the Invoices API to create and manage
# invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
public type Invoice record {
    # The payment methods that customers can use to pay an invoice on the Square-hosted invoice page.
    InvoiceAcceptedPaymentMethods accepted_payment_methods?;
    # The timestamp when the invoice was created, in RFC 3339 format.
    string created_at?;
    # Additional seller-defined fields to render on the invoice. These fields are visible to sellers and buyers
    # on the Square-hosted invoice page and in emailed or PDF copies of invoices. For more information, see
    # [Custom fields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
    # 
    # Adding custom fields to an invoice requires an 
    # [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
    # 
    # Max: 2 custom fields
    InvoiceCustomField[] custom_fields?;
    InvoiceDeliveryMethodinvoicedeliverymethod delivery_method?;
    # The description of the invoice. This is visible to the customer receiving the invoice.
    @constraint:String {maxLength: 65536, minLength: 1}
    string description?;
    # The Square-assigned ID of the invoice.
    string id?;
    # A user-friendly invoice number. The value is unique within a location.
    # If not provided when creating an invoice, Square assigns a value.
    # It increments from 1 and padded with zeros making it 7 characters long
    # (for example, 0000001 and 0000002).
    @constraint:String {maxLength: 191, minLength: 1}
    string invoice_number?;
    # The ID of the location that this invoice is associated with. 
    # 
    # If specified in a `CreateInvoice` request, the value must match the `location_id` of the associated order.
    @constraint:String {maxLength: 255, minLength: 1}
    string location_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money next_payment_amount_money?;
    # The ID of the [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) for which the invoice is created. 
    # This field is required when creating an invoice, and the order must be in the `OPEN` state.
    # 
    # To view the line items and other information for the associated order, call the 
    # [RetrieveOrder](https://developer.squareup.com/reference/square_2021-08-18/orders-api/retrieve-order) endpoint using the order ID.
    @constraint:String {maxLength: 255, minLength: 1}
    string order_id?;
    # The payment schedule for the invoice, represented by one or more payment requests that
    # define payment settings, such as amount due and due date. An invoice supports the following payment request combinations:
    # - One balance
    # - One deposit with one balance
    # - 2–12 installments 
    # - One deposit with 2–12 installments
    # 
    # This field is required when creating an invoice. It must contain at least one payment request. 
    # All payment requests for the invoice must equal the total order amount. For more information, see 
    # [Payment requests](https://developer.squareup.com/docs/invoices-api/overview#payment-requests).
    # 
    # Adding `INSTALLMENT` payment requests to an invoice requires an 
    # [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
    InvoicePaymentRequest[] payment_requests?;
    # Provides customer data that Square uses to deliver an invoice.
    InvoiceRecipient primary_recipient?;
    # The URL of the Square-hosted invoice page.
    # After you publish the invoice using the `PublishInvoice` endpoint, Square hosts the invoice
    # page and returns the page URL in the response.
    string public_url?;
    # The timestamp when the invoice is scheduled for processing, in RFC 3339 format.
    # After the invoice is published, Square processes the invoice on the specified date,
    # according to the delivery method and payment request settings.
    # 
    # If the field is not set, Square processes the invoice immediately after it is published.
    string scheduled_at?;
    # The status of the invoice.
    string status?;
    # The ID of the [subscription](https://developer.squareup.com/reference/square_2021-08-18/objects/Subscription) associated with the invoice.
    # This field is present only on subscription billing invoices.
    string subscription_id?;
    # The time zone used to interpret calendar dates on the invoice, such as `due_date`.
    # When an invoice is created, this field is set to the `timezone` specified for the seller
    # location. The value cannot be changed.
    # 
    # For example, a payment `due_date` of 2021-03-09 with a `timezone` of America/Los\_Angeles
    # becomes overdue at midnight on March 9 in America/Los\_Angeles (which equals a UTC timestamp
    # of 2021-03-10T08:00:00Z).
    string timezone?;
    # The title of the invoice.
    @constraint:String {maxLength: 255, minLength: 1}
    string title?;
    # The timestamp when the invoice was last updated, in RFC 3339 format.
    string updated_at?;
    # The Square-assigned version number, which is incremented each time an update is committed to the invoice.
    int 'version?;
};

# A record of an employee's break during a shift.
public type Break record {
    # The `BreakType` that this `Break` was templated on.
    @constraint:String {minLength: 1}
    string break_type_id;
    # RFC 3339; follows the same timezone information as `Shift`. Precision up to
    # the minute is respected; seconds are truncated.
    string end_at?;
    # Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
    # the break.
    @constraint:String {minLength: 1}
    string expected_duration;
    # The UUID for this object.
    string id?;
    # Whether this break counts towards time worked for compensation
    # purposes.
    boolean is_paid;
    # A human-readable name.
    @constraint:String {minLength: 1}
    string name;
    # RFC 3339; follows the same timezone information as `Shift`. Precision up to
    # the minute is respected; seconds are truncated.
    @constraint:String {minLength: 1}
    string start_at;
};

# Defines the body parameters that can be included in a request to the
# [CreateCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/create-customer-group) endpoint.
public type CreateCustomerGroupRequest record {
    # Represents a group of customer profiles. 
    # 
    # Customer groups can be created, be modified, and have their membership defined using 
    # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
    CustomerGroup group;
    # The idempotency key for the request. For more information, see [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency).
    string idempotency_key?;
};

# 
public type CheckoutOptionsPaymentType string;

# 
public type ObtainTokenResponse record {
    # A valid OAuth access token. OAuth access tokens are 64 bytes long.
    # Provide the access token in a header with every request to Connect API
    # endpoints. See [OAuth API: Walkthrough](https://developer.squareup.com/docs/oauth-api/walkthrough)
    # for more information.
    @constraint:String {maxLength: 1024, minLength: 2}
    string access_token?;
    # The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
    @constraint:String {maxLength: 48, minLength: 20}
    string expires_at?;
    # Then OpenID token belonging to this this person. Only present if the
    # OPENID scope is included in the authorize request.
    string id_token?;
    # The ID of the authorizing merchant's business.
    @constraint:String {maxLength: 191, minLength: 8}
    string merchant_id?;
    # __LEGACY FIELD__. The ID of the subscription plan the merchant signed
    # up for. Only present if the merchant signed up for a subscription during
    # authorization.
    string plan_id?;
    # A refresh token. OAuth refresh tokens are 64 bytes long.
    # For more information, see [OAuth access token management](https://developer.squareup.com/docs/oauth-api/how-it-works#oauth-access-token-management).
    @constraint:String {maxLength: 1024, minLength: 2}
    string refresh_token?;
    # A boolean indicating the access token is a short-lived access token.
    # The short-lived access token returned in the response will expire in 24 hours.
    boolean short_lived?;
    # __LEGACY FIELD__. The ID of a subscription plan the merchant signed up
    # for. Only present if the merchant signed up for a subscription during authorization.
    string subscription_id?;
    # This value is always _bearer_.
    @constraint:String {maxLength: 10, minLength: 2}
    string token_type?;
};

# Possible types of CatalogObjects returned from the Catalog, each
# containing type-specific properties in the `*_data` field corresponding to the object type.
public type CatalogObjectType string;

# Represents a customer subscription to a subscription plan.
# For an overview of the `Subscription` type, see
# [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
public type Subscription record {
    # The subscription cancellation date, in YYYY-MM-DD format (for
    # example, 2013-01-15). On this date, the subscription status changes
    # to `CANCELED` and the subscription billing stops.
    # If you don't set this field, the subscription plan dictates if and
    # when subscription ends.
    # 
    # You cannot update this field, you can only clear it.
    string canceled_date?;
    # The ID of the [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) [card](https://developer.squareup.com/reference/square_2021-08-18/objects/Card)
    # that is charged for the subscription.
    string card_id?;
    # The date up to which the customer is invoiced for the
    # subscription, in YYYY-MM-DD format (for example, 2013-01-15).
    # 
    # After the invoice is sent for a given billing period,
    # this date will be the last day of the billing period.
    # For example,
    # suppose for the month of May a customer gets an invoice
    # (or charged the card) on May 1. For the monthly billing scenario,
    # this date is then set to May 31.
    string charged_through_date?;
    # The timestamp when the subscription was created, in RFC 3339 format.
    string created_at?;
    # The ID of the associated [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) profile.
    string customer_id?;
    # The Square-assigned ID of the subscription.
    @constraint:String {maxLength: 255}
    string id?;
    # The IDs of the [invoices](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) created for the
    # subscription, listed in order when the invoices were created
    # (oldest invoices appear first).
    string[] invoice_ids?;
    # The ID of the location associated with the subscription.
    string location_id?;
    # The ID of the associated [subscription plan](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogSubscriptionPlan).
    string plan_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money price_override_money?;
    # The start date of the subscription, in YYYY-MM-DD format (for example,
    # 2013-01-15).
    string start_date?;
    # The current status of the subscription.
    string status?;
    # The tax amount applied when billing the subscription. The
    # percentage is expressed in decimal form, using a `'.'` as the decimal
    # separator and without a `'%'` sign. For example, a value of `7.5`
    # corresponds to 7.5%.
    string tax_percentage?;
    # Timezone that will be used in date calculations for the subscription.
    # Defaults to the timezone of the location based on `location_id`.
    # Format: the IANA Timezone Database identifier for the location timezone (for example, `America/Los_Angeles`).
    string timezone?;
    # The version of the object. When updating an object, the version
    # supplied must match the version in the database, otherwise the write will
    # be rejected as conflicting.
    int 'version?;
};

# Represents a `DeleteSnippet` request.
public type DeleteSnippetRequest record {
};

# Describes a gift card activity of the ADJUST_DECREMENT type.
public type GiftCardActivityAdjustDecrement record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    Reason reason;
};

# Represents a set of points for a loyalty account that are scheduled to expire on a specific date.
public type LoyaltyAccountExpiringPointDeadline record {
    # The timestamp of when the points are scheduled to expire, in RFC 3339 format.
    @constraint:String {minLength: 1}
    string expires_at;
    # The number of points scheduled to expire at the `expires_at` timestamp.
    int points;
};

# A response that contains all loyalty programs.
public type ListLoyaltyProgramsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # A list of `LoyaltyProgram` for the merchant.
    LoyaltyProgram[] programs?;
};

# A request to delete a `BreakType`.
public type DeleteBreakTypeRequest record {
};

# 
public type SearchTerminalCheckoutsResponse record {
    # The requested search result of `TerminalCheckout` objects.
    TerminalCheckout[] checkouts?;
    # The pagination cursor to be used in a subsequent request. If empty,
    # this is the final response.
    # 
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# Indicates a refund's current status.
public type RefundStatus string;

# Defines parameters in a
# [UpdateSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/update-subscription) endpoint
# request.
public type UpdateSubscriptionRequest record {
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# An instance of a custom attribute. Custom attributes can be defined and
# added to `ITEM` and `ITEM_VARIATION` type catalog objects.
# [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes).
public type CatalogCustomAttributeValue record {
    # A `true` or `false` value. Populated if `type` = `BOOLEAN`.
    boolean boolean_value?;
    # __Read-only.__ The id of the [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogCustomAttributeDefinition) this value belongs to.
    string custom_attribute_definition_id?;
    # __Read-only.__ A copy of key from the associated `CatalogCustomAttributeDefinition`.
    string 'key?;
    # The name of the custom attribute.
    string name?;
    # Populated if `type` = `NUMBER`. Contains a string
    # representation of a decimal number, using a `.` as the decimal separator.
    string number_value?;
    # One or more choices from `allowed_selections`. Populated if `type` = `SELECTION`.
    string[] selection_uid_values?;
    # The string value of the custom attribute.  Populated if `type` = `STRING`.
    string string_value?;
    # __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`.
    string 'type?;
};

# The search criteria for the loyalty accounts.
public type SearchLoyaltyAccountsRequestLoyaltyAccountQuery record {
    # The set of customer IDs to use in the loyalty account search.  
    # 
    # This cannot be combined with `mappings`.  
    # 
    # Max: 30 customer IDs
    string[] customer_ids?;
    # The set of mappings to use in the loyalty account search.  
    # 
    # This cannot be combined with `customer_ids`.  
    # 
    # Max: 30 mappings
    LoyaltyAccountMapping[] mappings?;
};

# Latitude and longitude coordinates.
public type Coordinates record {
    # The latitude of the coordinate expressed in degrees.
    decimal latitude?;
    # The longitude of the coordinate expressed in degrees.
    decimal longitude?;
};

# Indicates how the tax is applied to the associated line item or order.
public type OrderLineItemTaxType string;

# Defines the fields that are included in the response body of
# a request to the `SearchCustomers` endpoint.
# 
# Either `errors` or `customers` is present in a given response (never both).
public type SearchCustomersResponse record {
    # A pagination cursor that can be used during subsequent calls
    # to `SearchCustomers` to retrieve the next set of results associated
    # with the original query. Pagination cursors are only present when
    # a request succeeds and additional results are available.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # An array of `Customer` objects that match a query.
    Customer[] customers?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type V1ListOrdersResponse record {
    # 
    V1Order[] items?;
};

# V1OrderHistoryEntry
public type V1OrderHistoryEntry record {
    # The type of action performed on the order.
    string action?;
    # The time when the action was performed, in ISO 8601 format.
    string created_at?;
};

# Filter by the current order `state`.
public type SearchOrdersStateFilter record {
    # States to filter for.
    string[] states;
};

# Defines whether the event was generated by the Square Point of Sale.
public type LoyaltyEventSource string;

# Defines the fields that are included in the response body of
# a request to the `RetrieveCustomer` endpoint.
# 
# Either `errors` or `customer` is present in a given response (never both).
public type RetrieveCustomerResponse record {
    # Represents a Square customer profile in the Customer Directory of a Square seller.
    Customer customer?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Indicates the country associated with another entity, such as a business.
# Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm).
public type Country string;

# Represents a Square Online site, which is an online store for a Square seller.
public type Site record {
    # The timestamp of when the site was created, in RFC 3339 format.
    string created_at?;
    # The domain of the site (without the protocol). For example, `mysite1.square.site`.
    string domain?;
    # The Square-assigned ID of the site.
    @constraint:String {maxLength: 32}
    string id?;
    # Indicates whether the site is published.
    boolean is_published?;
    # The title of the site.
    string site_title?;
    # The timestamp of when the site was last updated, in RFC 3339 format.
    string updated_at?;
};

# Defines the response returned by 
# [UpdatePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/update-payment).
public type UpdatePaymentResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# Defines the fields that are included in the response body of
# a request to the [RetrieveTransaction](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/retrieve-transaction) endpoint.
# 
# One of `errors` or `transaction` is present in a given response (never both).
public type RetrieveTransactionResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a transaction processed with Square, either with the
    # Connect API or with Square Point of Sale.
    # 
    # The `tenders` field of this object lists all methods of payment used to pay in
    # the transaction.
    Transaction 'transaction?;
};

# 
public type RetrieveInventoryTransferRequest record {
};

# 
public type TerminalRefundQuery record {
    # 
    TerminalRefundQueryFilter filter?;
    # 
    TerminalRefundQuerySort sort?;
};

# Represents a response from a bulk update request containing the updated `TeamMember` objects or error messages.
public type BulkUpdateTeamMembersResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # The successfully updated `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
    record {} team_members?;
};

# Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
public type TenderCardDetails record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # The method used to enter the card's details for the transaction.
    string entry_method?;
    # The credit card payment's current state (such as `AUTHORIZED` or
    # `CAPTURED`). See [TenderCardDetailsStatus](https://developer.squareup.com/reference/square_2021-08-18/objects/TenderCardDetailsStatus)
    # for possible values.
    string status?;
};

# Defines the fields that are included in the response body of
# a request to the `UpdateCustomer` endpoint.
# 
# Either `errors` or `customer` is present in a given response (never both).
public type UpdateCustomerResponse record {
    # Represents a Square customer profile in the Customer Directory of a Square seller.
    Customer customer?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The days of the week.
public type Weekday string;

# 
public type BusinessBookingProfile record {
    # Indicates whether customers can cancel or reschedule their own bookings (`true`) or not (`false`).
    boolean allow_user_cancel?;
    # Indicates whether the seller is open for booking.
    boolean booking_enabled?;
    # The policy for the seller to automatically accept booking requests (`ACCEPT_ALL`) or not (`REQUIRES_ACCEPTANCE`).
    string booking_policy?;
    # The service appointment settings, including where and how the service is provided.
    BusinessAppointmentSettings business_appointment_settings?;
    # The RFC 3339 timestamp specifying the booking's creation time.
    string created_at?;
    # The choice of customer's time zone information of a booking.
    # The Square online booking site and all notifications to customers uses either the seller location’s time zone
    # or the time zone the customer chooses at booking.
    string customer_timezone_choice?;
    # The ID of the seller, obtainable using the Merchants API.
    string seller_id?;
};

# 
public type RetrieveObsMigrationProfileRequest record {
};

# Defines the fields that are included in a request to the `DeleteCustomer`
# endpoint.
public type DeleteCustomerRequest record {
    # The current version of the customer profile.
    # 
    # As a best practice, you should include this parameter to enable [optimistic concurrency](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency) control.  For more information, see [Delete a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile).
    int 'version?;
};

# The list of possible reasons why a cardholder might initiate a
# dispute with their bank.
public type DisputeReason string;

# Represents a unit of measurement to use with a quantity, such as ounces
# or inches. Exactly one of the following fields are required: `custom_unit`,
# `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
public type MeasurementUnit record {
    # Represents a standard area unit.
    string area_unit?;
    # The information needed to define a custom unit, provided by the seller.
    MeasurementUnitCustom custom_unit?;
    # Reserved for API integrations that lack the ability to specify a real measurement unit
    string generic_unit?;
    # Represents a standard length unit.
    string length_unit?;
    # Represents a standard unit of time.
    string time_unit?;
    # Represents the type of the measurement unit.
    string 'type?;
    # Represents a standard volume unit.
    string volume_unit?;
    # Represents a standard unit of weight or mass.
    string weight_unit?;
};

# Describes a `PublishInvoice` response.
public type PublishInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice?;
};

# V1SettlementEntry
public type V1SettlementEntry record {
    # 
    V1Money amount_money?;
    # 
    V1Money fee_money?;
    # The settlement's unique identifier.
    string payment_id?;
    # The settlement's current status.
    string 'type?;
};

# Defines the parameters for a `ListDisputeEvidence` request.
public type ListDisputeEvidenceRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
};

# Defines the fields that are included in requests to the `RetrieveCustomer`
# endpoint.
public type RetrieveCustomerRequest record {
};

# Describes a request to cancel a payment using 
# [CancelPaymentByIdempotencyKey](https://developer.squareup.com/reference/square_2021-08-18/payments-api/cancel-payment-by-idempotency-key).
public type CancelPaymentByIdempotencyKeyRequest record {
    # The `idempotency_key` identifying the payment to be canceled.
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
};

# A response to a request to get an `EmployeeWage`. The response contains
# the requested `EmployeeWage` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type GetEmployeeWageResponse record {
    # The hourly wage rate that an employee earns on a `Shift` for doing the job
    # specified by the `title` property of this object. Deprecated at version 2020-08-26. Use `TeamMemberWage` instead.
    EmployeeWage employee_wage?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# A request for a set of `WorkweekConfig` objects.
public type ListWorkweekConfigsRequest record {
    # A pointer to the next page of `WorkweekConfig` results to fetch.
    string cursor?;
    # The maximum number of `WorkweekConfigs` results to return per page.
    int 'limit?;
};

# Types of daily appointment limits.
public type BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType string;

public type Type anydata;

# 
public type RetrieveOrderResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# Defines the fields that are included in requests to the
# `BatchRetrieveOrders` endpoint.
public type BatchRetrieveOrdersRequest record {
    # The ID of the location for these orders. This field is optional: omit it to retrieve
    # orders within the scope of the current authorization's merchant ID.
    string location_id?;
    # The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request.
    BatchretrieveordersrequestOrderidsItemsString[] order_ids;
};

# A request to list `LoyaltyProgram`.
public type ListLoyaltyProgramsRequest record {
};

# Represents an additional recipient (other than the merchant) receiving a portion of this tender.
public type AdditionalRecipient record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # The description of the additional recipient.
    @constraint:String {maxLength: 100}
    string description?;
    # The location ID for a recipient (other than the merchant) receiving a portion of this tender.
    @constraint:String {maxLength: 50, minLength: 1}
    string location_id;
    # The unique ID for this [AdditionalRecipientReceivable](https://developer.squareup.com/reference/square_2021-08-18/objects/AdditionalRecipientReceivable), assigned by the server.
    @constraint:String {maxLength: 192}
    string receivable_id?;
};

# Defines the response returned by [CancelPayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/cancel-payment).
public type CancelPaymentResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# Represents the mapping that associates a loyalty account with a buyer. 
# 
# Currently, a loyalty account can only be mapped to a buyer by phone number. For more information, see 
# [Loyalty Overview](https://developer.squareup.com/docs/loyalty/overview).
public type LoyaltyAccountMapping record {
    # The timestamp when the mapping was created, in RFC 3339 format.
    string created_at?;
    # The Square-assigned ID of the mapping.
    @constraint:String {maxLength: 36}
    string id?;
    # The phone number of the buyer, in E.164 format. For example, "+14155551111".
    string phone_number?;
};

# The type of mapping.
public type LoyaltyAccountMappingType string;

# Additional details about `WALLET` type payments. Contains only non-confidential information.
public type DigitalWalletDetails record {
    # The status of the `WALLET` payment. The status can be `AUTHORIZED`, `CAPTURED`, `VOIDED`, or
    # `FAILED`.
    @constraint:String {maxLength: 50}
    string status?;
};

# Defines the query parameters that can be included in
# a request to the [ListRefunds](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/list-refunds) endpoint.
# 
# Deprecated - recommend using [SearchOrders](https://developer.squareup.com/reference/square_2021-08-18/orders-api/search-orders)
public type ListRefundsRequest record {
    # The beginning of the requested reporting period, in RFC 3339 format.
    # 
    # See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.
    # 
    # Default value: The current time minus one year.
    string begin_time?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for your original query.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # The end of the requested reporting period, in RFC 3339 format.
    # 
    # See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.
    # 
    # Default value: The current time.
    string end_time?;
    # The order in which results are listed in the response (`ASC` for
    # oldest first, `DESC` for newest first).
    # 
    # Default value: `DESC`
    string sort_order?;
};

# 
public type V1Money record {
    # Amount in the lowest denominated value of this Currency. E.g. in USD
    # these are cents, in JPY they are Yen (which do not have a 'cent' concept).
    int amount?;
    # 
    string currency_code?;
};

# Enumerates the possible pay types that a job can be assigned.
public type JobAssignmentPayType string;

# Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
public type LoyaltyEventAccumulatePoints record {
    # The ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36}
    string loyalty_program_id?;
    # The ID of the [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) for which the buyer accumulated the points.
    # This field is returned only if the Orders API is used to process orders.
    string order_id?;
    # The number of points accumulated by the event.
    @constraint:Int {minValue: 1}
    int points?;
};

# 
public type CalculateOrderRequest record {
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order;
    # Identifies one or more loyalty reward tiers to apply during the order calculation.
    # The discounts defined by the reward tiers are added to the order only to preview the
    # effect of applying the specified rewards. The rewards do not correspond to actual
    # redemptions; that is, no `reward`s are created. Therefore, the reward `id`s are
    # random strings used only to reference the reward tier.
    OrderReward[] proposed_rewards?;
};

# Indicates whether the price of a CatalogItemVariation should be entered manually at the time of sale.
public type CatalogPricingType string;

# Defines the fields that are included in the response body of
# a request to the [CaptureTransaction](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/capture-transaction) endpoint.
public type CaptureTransactionResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The brand of a credit card.
public type V1TenderCardBrand string;

# Defines parameters in a
# [ResumeSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/resume-subscription) endpoint
# request.
public type ResumeSubscriptionRequest record {
};

# 
public type RetrieveInventoryChangesResponse record {
    # The set of inventory changes for the requested object and locations.
    InventoryChange[] changes?;
    # The pagination cursor to be used in a subsequent request. If unset,
    # this is the final response.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents an additional recipient (other than the merchant) entitled to a portion of the tender.
# Support is currently limited to USD, CAD and GBP currencies
public type ChargeRequestAdditionalRecipient record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # The description of the additional recipient.
    @constraint:String {maxLength: 100, minLength: 1}
    string description;
    # The location ID for a recipient (other than the merchant) receiving a portion of the tender.
    @constraint:String {maxLength: 50, minLength: 1}
    string location_id;
};

# 
public type CashDrawerDevice record {
    # The device Square-issued ID
    string id?;
    # The device merchant-specified name.
    string name?;
};

# 
public type V1SettlementEntryType string;

# A tender represents a discrete monetary exchange. Square represents this
# exchange as a money object with a specific currency and amount, where the
# amount is given in the smallest denomination of the given currency.
# 
# Square POS can accept more than one form of tender for a single payment (such
# as by splitting a bill between a credit card and a gift card). The `tender`
# field of the Payment object lists all forms of tender used for the payment.
# 
# Split tender payments behave slightly differently from single tender payments:
# 
# The receipt_url for a split tender corresponds only to the first tender listed
# in the tender field. To get the receipt URLs for the remaining tenders, use
# the receipt_url fields of the corresponding Tender objects.
# 
# *A note on gift cards**: when a customer purchases a Square gift card from a
# merchant, the merchant receives the full amount of the gift card in the
# associated payment.
# 
# When that gift card is used as a tender, the balance of the gift card is
# reduced and the merchant receives no funds. A `Tender` object with a type of
# `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the
# associated payment.
public type V1Tender record {
    # The brand of credit card provided.
    string card_brand?;
    # 
    V1Money change_back_money?;
    # The ID of the employee that processed the tender.
    string employee_id?;
    # The tender's unique ID.
    string entry_method?;
    # The tender's unique ID.
    string id?;
    # Indicates whether or not the tender is associated with an exchange. If is_exchange is true, the tender represents the value of goods returned in an exchange not the actual money paid. The exchange value reduces the tender amounts needed to pay for items purchased in the exchange.
    boolean is_exchange?;
    # A human-readable description of the tender.
    string name?;
    # The last four digits of the provided credit card's account number.
    string pan_suffix?;
    # Notes entered by the merchant about the tender at the time of payment, if any. Typically only present for tender with the type: OTHER.
    string payment_note?;
    # The URL of the receipt for the tender.
    string receipt_url?;
    # 
    V1Money refunded_money?;
    # The time when the tender was settled, in ISO 8601 format.
    string settled_at?;
    # The time when the tender was created, in ISO 8601 format.
    string tendered_at?;
    # 
    V1Money tendered_money?;
    # 
    V1Money total_money?;
    # The type of tender.
    string 'type?;
};

# Contains all information related to a single order to process with Square,
# including line items that specify the products to purchase. `Order` objects also
# include information about any associated tenders, refunds, and returns.
# 
# All Connect V2 Transactions have all been converted to Orders including all associated
# itemization data.
public type Order record {
    # The timestamp for when the order reached a terminal [state](https://developer.squareup.com/reference/square_2021-08-18/enums/OrderState), in RFC 3339 format (for example "2016-09-04T23:59:33.123Z").
    string closed_at?;
    # The timestamp for when the order was created, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string created_at?;
    # The ID of the [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) associated with the order.
    # 
    # __IMPORTANT:__ You should specify a `customer_id` if you want the corresponding payment transactions
    # to be explicitly linked to the customer in the Seller Dashboard. If this field is omitted, the 
    # `customer_id` assigned to any underlying `Payment` objects is ignored and might result in the 
    # creation of new [instant profiles](https://developer.squareup.com/docs/customers-api/what-it-does#instant-profiles).
    @constraint:String {maxLength: 191}
    string customer_id?;
    # The list of all discounts associated with the order.
    # 
    # Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`,
    # an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to.
    # For discounts with `ORDER` scope, the server generates an `OrderLineItemAppliedDiscount`
    # for every line item.
    # 
    # __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, using the deprecated
    # `line_items.discounts` field results in an error. Use `line_items.applied_discounts`
    # instead.
    OrderLineItemDiscount[] discounts?;
    # Details about order fulfillment.
    # 
    # Orders can only be created with at most one fulfillment. However, orders returned
    # by the API might contain multiple fulfillments.
    OrderFulfillment[] fulfillments?;
    # The order's unique ID.
    string id?;
    # The line items included in the order.
    OrderLineItem[] line_items?;
    # The ID of the seller location that this order is associated with.
    @constraint:String {minLength: 1}
    string location_id;
    # Application-defined data attached to this order. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see  [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # A collection of various money amounts.
    OrderMoneyAmounts net_amounts?;
    # Pricing options for an order. The options affect how the order's price is calculated.
    # They can be used, for example, to apply automatic price adjustments that are based on preconfigured
    # [pricing rules](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogPricingRule).
    OrderPricingOptions pricing_options?;
    # A client-specified ID to associate an entity in another system
    # with this order.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # The refunds that are part of this order.
    Refund[] refunds?;
    # A collection of various money amounts.
    OrderMoneyAmounts return_amounts?;
    # A collection of items from sale orders being returned in this one. Normally part of an
    # itemized return or exchange. There is exactly one `Return` object per sale `Order` being
    # referenced.
    OrderReturn[] 'returns?;
    # A set-like list of Rewards that have been added to the Order.
    OrderReward[] rewards?;
    # A rounding adjustment of the money being returned. Commonly used to apply cash rounding
    # when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
    OrderRoundingAdjustment rounding_adjustment?;
    # A list of service charges applied to the order.
    OrderServiceCharge[] service_charges?;
    # Represents the origination details of an order.
    OrderSource 'source?;
    # The current state of the order: `OPEN`, `COMPLETED`, or `CANCELED`.
    string state?;
    # The list of all taxes associated with the order.
    # 
    # Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an
    # `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes
    # with `ORDER` scope, the server generates an `OrderLineItemAppliedTax` for every line item.
    # 
    # On reads, each tax in the list includes the total amount of that tax applied to the order.
    # 
    # __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, using the deprecated
    # `line_items.taxes` field results in an error. Use `line_items.applied_taxes`
    # instead.
    OrderLineItemTax[] taxes?;
    # The tenders that were used to pay for the order.
    Tender[] tenders?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_discount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_service_charge_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tax_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tip_money?;
    # The timestamp for when the order was last updated, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string updated_at?;
    # The version number, which is incremented each time an update is committed to the order.
    # Orders not created through the API do not include a version number and
    # therefore cannot be updated.
    # 
    # [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
    int 'version?;
};

# Describes changes to subscription and billing states.
public type SubscriptionEvent record {
    # The date, in YYYY-MM-DD format (for
    # example, 2013-01-15), when the subscription event went into effect.
    string effective_date;
    # The ID of the subscription event.
    string id;
    Info info?;
    # The ID of the subscription plan associated with the subscription.
    string plan_id;
    # Type of the subscription event.
    string subscription_event_type;
};

# Defines the fields that are included in the response from the
# [UpdateSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/update-subscription) endpoint.
public type UpdateSubscriptionResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# 
public type CardSquareProduct string;

# 
public type Device record {
    # The device's Square-issued ID.
    string id?;
    # The device's merchant-specified name.
    string name?;
};

# 
public type V1ListRefundsRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
    string begin_time?;
    # The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
    string end_time?;
    # The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods.
    int 'limit?;
    # The order in which payments are listed in the response.
    string 'order?;
};

# Represents a response from an update request containing the updated `TeamMember` object or error messages.
public type UpdateTeamMemberResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # A record representing an individual team member for a business.
    TeamMember team_member?;
};

# How to apply a CatalogDiscount to a CatalogItem.
public type CatalogDiscountType string;

# 
public type PaymentOptions record {
    # Indicates whether the `Payment` objects created from this `TerminalCheckout` are automatically
    # `COMPLETED` or left in an `APPROVED` state for later modification.
    boolean autocomplete?;
};

# Describes a phase in a subscription plan. For more information, see
# [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
public type SubscriptionPhase record {
    # The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created.
    string cadence;
    # The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
    int ordinal?;
    # The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
    int periods?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money recurring_price_money;
    # The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
    string uid?;
};

# Describes query filters to apply.
public type InvoiceFilter record {
    # Limits the search to the specified customers, within the specified locations. 
    # Specifying a customer is optional. In the current implementation, 
    # a maximum of one customer can be specified.
    string[] customer_ids?;
    # Limits the search to the specified locations. A location is required. 
    # In the current implementation, only one location can be specified.
    string[] location_ids;
};

# The status of the loyalty reward.
public type LoyaltyRewardStatus string;

# Represents an update request for the `WageSetting` object describing a `TeamMember`.
public type UpdateWageSettingRequest record {
    # An object representing a team member's wage information.
    WageSetting wage_setting;
};

# Either the `order_entries` or `orders` field is set, depending on whether
# `return_entries` is set on the [SearchOrdersRequest](https://developer.squareup.com/reference/square_2021-08-18/orders-api/search-orders).
public type SearchOrdersResponse record {
    # The pagination cursor to be used in a subsequent request. If unset,
    # this is the final response.
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # [Errors](https://developer.squareup.com/reference/square_2021-08-18/objects/Error) encountered during the search.
    Error[] errors?;
    # A list of [OrderEntries](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderEntry) that fit the query
    # conditions. The list is populated only if `return_entries` is set to `true` in the request.
    OrderEntry[] order_entries?;
    # A list of
    # [Order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) objects that match the query conditions. The list is populated only if
    # `return_entries` is set to `false` in the request.
    Order[] orders?;
};

# Defines how discounts are automatically applied to a set of items that match the pricing rule
# during the active time period.
public type CatalogPricingRule record {
    # __Deprecated__: Please use the `exclude_products_id` field to apply
    # an exclude set instead. Exclude sets allow better control over quantity
    # ranges and offer more flexibility for which matched items receive a discount.
    # 
    # `CatalogProductSet` to apply the pricing to.
    # An apply rule matches within the subset of the cart that fits the match rules (the match set).
    # An apply rule can only match once in the match set.
    # If not supplied, the pricing will be applied to all products in the match set.
    # Other products retain their base price, or a price generated by other rules.
    string apply_products_id?;
    # A list of IDs of customer groups, the members of which are eligible for discounts specified in this pricing rule.
    # Notice that a group ID is generated by the Customers API.
    # If this field is not set, the specified discount applies to matched products sold to anyone whether the buyer
    # has a customer profile created or not. If this `customer_group_ids_any` field is set, the specified discount
    # applies only to matched products sold to customers belonging to the specified customer groups.
    string[] customer_group_ids_any?;
    # Unique ID for the `CatalogDiscount` to take off
    # the price of all matched items.
    string discount_id?;
    # `CatalogProductSet` to exclude from the pricing rule.
    # An exclude rule matches within the subset of the cart that fits the match rules (the match set).
    # An exclude rule can only match once in the match set.
    # If not supplied, the pricing will be applied to all products in the match set.
    # Other products retain their base price, or a price generated by other rules.
    string exclude_products_id?;
    # If an `exclude_products_id` was given, controls which subset of matched
    # products is excluded from any discounts.
    # 
    # Default value: `LEAST_EXPENSIVE`
    string exclude_strategy?;
    # Unique ID for the `CatalogProductSet` that will be matched by this rule. A match rule
    # matches within the entire cart, and can match multiple times. This field will always be set.
    string match_products_id?;
    # User-defined name for the pricing rule. For example, "Buy one get one
    # free" or "10% off".
    string name?;
    # A list of unique IDs for the catalog time periods when
    # this pricing rule is in effect. If left unset, the pricing rule is always
    # in effect.
    string[] time_period_ids?;
    # Represents the date the Pricing Rule is valid from. Represented in RFC 3339 full-date format (YYYY-MM-DD).
    string valid_from_date?;
    # Represents the local time the pricing rule should be valid from. Represented in RFC 3339 partial-time format
    # (HH:MM:SS). Partial seconds will be truncated.
    string valid_from_local_time?;
    # Represents the date the Pricing Rule is valid until. Represented in RFC 3339 full-date format (YYYY-MM-DD).
    string valid_until_date?;
    # Represents the local time the pricing rule should be valid until. Represented in RFC 3339 partial-time format
    # (HH:MM:SS). Partial seconds will be truncated.
    string valid_until_local_time?;
};

# The unit of volume used to measure a quantity.
public type MeasurementUnitVolume string;

# Represents an `UpsertSnippet` response. The response can include either `snippet` or `errors`.
public type UpsertSnippetResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
    Snippet snippet?;
};

# A group of variations for a `CatalogItem`.
public type CatalogItemOption record {
    # The item option's human-readable description. Displayed in the Square
    # Point of Sale app for the seller and in the Online Store or on receipts for
    # the buyer. This is a searchable attribute for use in applicable query filters.
    string description?;
    # The item option's display name for the customer. This is a searchable attribute for use in applicable query filters.
    string display_name?;
    # The item option's display name for the seller. Must be unique across
    # all item options. This is a searchable attribute for use in applicable query filters.
    string name?;
    # If true, display colors for entries in `values` when present.
    boolean show_colors?;
    # A list of CatalogObjects containing the
    # `CatalogItemOptionValue`s for this item.
    CatalogObject[] values?;
};

#  An option that can be assigned to an item.
# For example, a t-shirt item may offer a color option or a size option.
public type CatalogItemOptionForItem record {
    # The unique id of the item option, used to form the dimensions of the item option matrix in a specified order.
    string item_option_id?;
};

# The types of events on a CashDrawerShift.
# Each event type represents an employee action on the actual cash drawer
# represented by a CashDrawerShift.
public type CashDrawerEventType string;

# The payment methods that customers can use to pay an invoice on the Square-hosted invoice page.
public type InvoiceAcceptedPaymentMethods record {
    # Indicates whether bank transfer payments are accepted. The default value is `false`.
    # 
    # This option is allowed only for invoices that have a single payment request of type `BALANCE`.
    boolean bank_account?;
    # Indicates whether credit card or debit card payments are accepted. The default value is `false`.
    boolean card?;
    # Indicates whether Square gift card payments are accepted. The default value is `false`.
    boolean square_gift_card?;
};

# A tax to block from applying to a line item. The tax must be 
# identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
public type OrderLineItemPricingBlocklistsBlockedTax record {
    # The `catalog_object_id` of the tax that should be blocked. 
    # Use this field to block catalog taxes. For ad hoc taxes, use the 
    # `tax_uid` field.
    @constraint:String {maxLength: 192}
    string tax_catalog_object_id?;
    # The `uid` of the tax that should be blocked. Use this field to block 
    # ad hoc taxes. For catalog, taxes use the `tax_catalog_object_id` field.
    @constraint:String {maxLength: 60}
    string tax_uid?;
    # A unique ID of the `BlockedTax` within the order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# The tax IDs that a Location is operating under.
public type TaxIds record {
    # The EU VAT number for this location. For example, "IE3426675K".
    # If the EU VAT number is present, it is well-formed and has been
    # validated with VIES, the VAT Information Exchange System.
    string eu_vat?;
    # The French government uses the NAF (Nomenclature des Activités Françaises) to display and
    # track economic statistical data. This is also called the APE (Activite Principale de l’Entreprise) code.
    # For example, 6910Z.
    string fr_naf?;
    # The SIRET (Système d'Identification du Répertoire des Entreprises et de leurs Etablissements)
    # number is a 14 digits code issued by the French INSEE. For example, "39922799000021".
    string fr_siret?;
};

# 
public type BatchChangeInventoryResponse record {
    # Changes created for the request.
    InventoryChange[] changes?;
    # The current counts for all objects referenced in the request.
    InventoryCount[] counts?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Unit of area used to measure a quantity.
public type MeasurementUnitArea string;

# Describes a `ListInvoice` request.
public type ListInvoicesRequest record {
    # A pagination cursor returned by a previous call to this endpoint. 
    # Provide this cursor to retrieve the next set of results for your original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of invoices to return (200 is the maximum `limit`). 
    # If not provided, the server uses a default limit of 100 invoices.
    int 'limit?;
    # The ID of the location for which to list invoices.
    @constraint:String {maxLength: 255, minLength: 1}
    string location_id;
};

# Filter for `Order` objects based on whether their `CREATED_AT`,
# `CLOSED_AT`, or `UPDATED_AT` timestamps fall within a specified time range.
# You can specify the time range and which timestamp to filter for. You can filter
# for only one time range at a time.
# 
# For each time range, the start time and end time are inclusive. If the end time
# is absent, it defaults to the time of the first request for the cursor.
# 
# __Important:__ If you use the `DateTimeFilter` in a `SearchOrders` query,
# you must set the `sort_field` in [OrdersSort](https://developer.squareup.com/reference/square_2021-08-18/objects/SearchOrdersSort)
# to the same field you filter for. For example, if you set the `CLOSED_AT` field
# in `DateTimeFilter`, you must set the `sort_field` in `SearchOrdersSort` to
# `CLOSED_AT`. Otherwise, `SearchOrders` throws an error.
# [Learn more about filtering orders by time range.](https://developer.squareup.com/docs/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range)
public type SearchOrdersDateTimeFilter record {
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange closed_at?;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange created_at?;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange updated_at?;
};

# The response object returned by the [RetrieveMerchant](https://developer.squareup.com/reference/square_2021-08-18/merchants-api/retrieve-merchant) endpoint.
public type RetrieveMerchantResponse record {
    # Information on errors encountered during the request.
    Error[] errors?;
    # Represents a Square seller.
    Merchant merchant?;
};

# The type of a CatalogItem. Connect V2 only allows the creation of `REGULAR` or `APPOINTMENTS_SERVICE` items.
public type CatalogItemProductType string;

# The hourly wage rate that an employee earns on a `Shift` for doing the job
# specified by the `title` property of this object. Deprecated at version 2020-08-26. Use `TeamMemberWage` instead.
public type EmployeeWage record {
    # The `Employee` that this wage is assigned to.
    string employee_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money hourly_rate?;
    # The UUID for this object.
    string id?;
    # The job title that this wage relates to.
    string title?;
};

# Defines the request parameters for the `ListDisputes` endpoint.
public type ListDisputesRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The ID of the location for which to return a list of disputes. If not specified, the endpoint returns
    # all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations.
    @constraint:String {maxLength: 40, minLength: 1}
    string location_id?;
    # The dispute states to filter the result.
    # If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`,
    # or `LOST`).
    string[] states?;
};

# 
public type TerminalCheckoutQuerySort record {
    # The order in which results are listed.
    # - `ASC` - Oldest to newest.
    # - `DESC` - Newest to oldest (default).
    string sort_order?;
};

# Represents a tender (i.e., a method of payment) used in a Square transaction.
public type Tender record {
    # Additional recipients (other than the merchant) receiving a portion of this tender.
    # For example, fees assessed on the purchase by a third party integration.
    AdditionalRecipient[] additional_recipients?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
    TenderCardDetails card_details?;
    # Represents the details of a tender with `type` `CASH`.
    TenderCashDetails cash_details?;
    # The timestamp for when the tender was created, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string created_at?;
    # If the tender is associated with a customer or represents a customer's card on file,
    # this is the ID of the associated customer.
    @constraint:String {maxLength: 191}
    string customer_id?;
    # The tender's unique ID.
    @constraint:String {maxLength: 192}
    string id?;
    # The ID of the transaction's associated location.
    @constraint:String {maxLength: 50}
    string location_id?;
    # An optional note associated with the tender at the time of payment.
    @constraint:String {maxLength: 500}
    string note?;
    # The ID of the [Payment](https://developer.squareup.com/reference/square_2021-08-18/objects/Payment) that corresponds to this tender.
    # This value is only present for payments created with the v2 Payments API.
    @constraint:String {maxLength: 192}
    string payment_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money processing_fee_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money tip_money?;
    # The ID of the tender's associated transaction.
    @constraint:String {maxLength: 192}
    string transaction_id?;
    # The type of tender, such as `CARD` or `CASH`.
    string 'type;
};

# A Square API V1 identifier of an item, including the object ID and its associated location ID.
public type CatalogV1Id record {
    # The ID for an object used in the Square API V1, if the object ID differs from the Square API V2 object ID.
    string catalog_v1_id?;
    # The ID of the `Location` this Connect V1 ID is associated with.
    string location_id?;
};

# An item variation (i.e., product) in the Catalog object model. Each item
# may have a maximum of 250 item variations.
public type CatalogItemVariation record {
    # If the `CatalogItem` that owns this item variation is of type
    # `APPOINTMENTS_SERVICE`, a bool representing whether this service is available for booking.
    boolean available_for_booking?;
    # If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type`
    # is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
    # 
    # This value is always an integer.
    int inventory_alert_threshold?;
    # Indicates whether the item variation displays an alert when its inventory quantity is less than or equal
    # to its `inventory_alert_threshold`.
    string inventory_alert_type?;
    # The ID of the `CatalogItem` associated with this item variation.
    string item_id?;
    # List of item option values associated with this item variation. Listed
    # in the same order as the item options of the parent item.
    CatalogItemOptionValueForItemVariation[] item_option_values?;
    # Per-location price and inventory overrides.
    ItemVariationLocationOverrides[] location_overrides?;
    # ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity
    # sold of this item variation. If left unset, the item will be sold in
    # whole quantities.
    string measurement_unit_id?;
    # The item variation's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
    # The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal
    # for each item variation within a parent `CatalogItem` is set according to the item variations's
    # position. On reads, the value is not guaranteed to be sequential or unique.
    int ordinal?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money price_money?;
    # Indicates whether the item variation's price is fixed or determined at the time
    # of sale.
    string pricing_type?;
    # If the `CatalogItem` that owns this item variation is of type
    # `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For
    # example, a 30 minute appointment would have the value `1800000`, which is equal to
    # 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
    int service_duration?;
    # The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
    string sku?;
    # Whether stock is counted directly on this variation (TRUE) or only on its components (FALSE).
    # For backward compatibility missing values will be interpreted as TRUE.
    boolean stockable?;
    # Represents the rule of conversion between a stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation)
    # and a non-stockable sell-by or receive-by `CatalogItemVariation` that
    # share the same underlying stock.
    CatalogStockConversion stockable_conversion?;
    # Tokens of employees that can perform the service represented by this variation. Only valid for
    # variations of type `APPOINTMENTS_SERVICE`.
    string[] team_member_ids?;
    # If `true`, inventory tracking is active for the variation.
    boolean track_inventory?;
    # The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.
    # 
    # The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard,
    # Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned
    # to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps
    # unless it is updated to fit the expected format.
    string upc?;
    # Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string user_data?;
};

# A response that contains loyalty events that satisfy the search 
# criteria, in order by the `created_at` date.
public type SearchLoyaltyEventsResponse record {
    # The pagination cursor to be used in a subsequent 
    # request. If empty, this is the final response. 
    # For more information, 
    # see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The loyalty events that satisfy the search criteria.
    LoyaltyEvent[] events?;
};

# Defines the body parameters that can be included in a request to the
# `UpdateCustomer` endpoint.
public type UpdateCustomerRequest record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The birthday associated with the customer profile, in RFC 3339 format. The year is optional. The timezone and time are not allowed.
    # For example, `0000-09-21T00:00:00-00:00` represents a birthday on September 21 and `1998-09-21T00:00:00-00:00` represents a birthday on September 21, 1998.
    # You can also specify this value in `YYYY-MM-DD` format.
    string birthday?;
    # A business name associated with the customer profile.
    string company_name?;
    # The email address associated with the customer profile.
    string email_address?;
    # The family name (that is, the last name) associated with the customer profile.
    string family_name?;
    # The given name (that is, the first name) associated with the customer profile.
    string given_name?;
    # A nickname for the customer profile.
    string nickname?;
    # A custom note associated with the customer profile.
    string note?;
    # The 11-digit phone number associated with the customer profile.
    string phone_number?;
    # An optional second ID used to associate the customer profile with an
    # entity in another system.
    string reference_id?;
    # The current version of the customer profile.
    # 
    # As a best practice, you should include this field to enable [optimistic concurrency](https://developer.squareup.com/docs/working-with-apis/optimistic-concurrency) control. For more information, see [Update a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#update-a-customer-profile).
    int 'version?;
};

# 
public type OrderCreated record {
    # The timestamp for when the order was created, in RFC 3339 format.
    string created_at?;
    # The ID of the seller location that this order is associated with.
    string location_id?;
    # The order's unique ID.
    string order_id?;
    # The state of the order.
    string state?;
    # The version number, which is incremented each time an update is committed to the order.
    # Orders that were not created through the API do not include a version number and
    # therefore cannot be updated.
    # 
    # [Read more about working with versions.](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders)
    int 'version?;
};

# Represents a bulk update request for `TeamMember` objects.
public type BulkUpdateTeamMembersRequest record {
    # The data used to update the `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
    record {} team_members;
};

# Represents a Square customer profile in the Customer Directory of a Square seller.
public type Customer record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The birthday associated with the customer profile, in RFC 3339 format. The year is optional. The timezone and time are not allowed.
    # For example, `0000-09-21T00:00:00-00:00` represents a birthday on September 21 and `1998-09-21T00:00:00-00:00` represents a birthday on September 21, 1998.
    string birthday?;
    # Payment details of the credit, debit, and gift cards stored on file for the customer profile. 
    # 
    # DEPRECATED at version 2021-06-16. Replaced by calling [ListCards](https://developer.squareup.com/reference/square_2021-08-18/cards-api/list-cards) (for credit and debit cards on file) 
    # or [ListGiftCards](https://developer.squareup.com/reference/square_2021-08-18/gift-cards-api/list-gift-cards) (for gift cards on file) and including the `customer_id` query parameter. 
    # For more information, see [Migrate to the Cards API and Gift Cards API](https://developer.squareup.com/docs/customers-api/use-the-api/integrate-with-other-services#migrate-customer-cards).
    Card[] cards?;
    # A business name associated with the customer profile.
    string company_name?;
    # The timestamp when the customer profile was created, in RFC 3339 format.
    string created_at?;
    # A creation source represents the method used to create the
    # customer profile.
    string creation_source?;
    # The email address associated with the customer profile.
    string email_address?;
    # The family (i.e., last) name associated with the customer profile.
    string family_name?;
    # The given (i.e., first) name associated with the customer profile.
    string given_name?;
    # The IDs of customer groups the customer belongs to.
    string[] group_ids?;
    # A unique Square-assigned ID for the customer profile.
    string id?;
    # A nickname for the customer profile.
    string nickname?;
    # A custom note associated with the customer profile.
    string note?;
    # The 11-digit phone number associated with the customer profile.
    string phone_number?;
    # Represents communication preferences for the customer profile.
    CustomerPreferences preferences?;
    # An optional second ID used to associate the customer profile with an
    # entity in another system.
    string reference_id?;
    # The IDs of segments the customer belongs to.
    string[] segment_ids?;
    # The timestamp when the customer profile was last updated, in RFC 3339 format.
    string updated_at?;
    # The Square-assigned version number of the customer profile. The version number is incremented each time an update is committed to the customer profile, except for changes to customer segment membership and cards on file.
    int 'version?;
};

# Indicates the Square product used to generate an inventory change.
public type Product string;

# Present only when GiftCardActivityType is IMPORT_REVERSAL and GiftCardGANSource is OTHER
public type GiftCardActivityImportReversal record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
};

# Defines the fields that are included in the response body of
# a request to the [VoidTransaction](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/void-transaction) endpoint.
public type VoidTransactionResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines the fields that the
# [RetrieveLocation](https://developer.squareup.com/reference/square_2021-08-18/locations-api/retrieve-location) endpoint returns
# in a response.
public type RetrieveLocationResponse record {
    # Information on errors encountered during the request.
    Error[] errors?;
    # 
    Location location?;
};

# 
public type UpdateItemModifierListsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-date) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
    string updated_at?;
};

# Provides metadata when the event `type` is `EXPIRE_POINTS`.
public type LoyaltyEventExpirePoints record {
    # The Square-assigned ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_program_id;
    # The number of points expired.
    int points;
};

# Defines the parameters for a `CreateDisputeEvidenceText` request.
public type CreateDisputeEvidenceTextRequest record {
    # The evidence string.
    @constraint:String {maxLength: 500, minLength: 1}
    string evidence_text;
    # The type of evidence you are uploading.
    string evidence_type?;
    # The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
};

# Represents a query used to search for loyalty events.
public type LoyaltyEventQuery record {
    # The filtering criteria. If the request specifies multiple filters, 
    # the endpoint uses a logical AND to evaluate them.
    LoyaltyEventFilter filter?;
};

# Describes a `PublishInvoice` request.
public type PublishInvoiceRequest record {
    # A unique string that identifies the `PublishInvoice` request. If you do not 
    # provide `idempotency_key` (or provide an empty string as the value), the endpoint 
    # treats each request as independent.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 128}
    string idempotency_key?;
    # The version of the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to publish.
    # This must match the current version of the invoice; otherwise, the request is rejected.
    int 'version;
};

# The hourly wage rate used to compensate an employee for this shift.
public type ShiftWage record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money hourly_rate?;
    # The name of the job performed during this shift. Square
    # labor-reporting UIs might group shifts together by title.
    string title?;
};

# A response that contains one `GiftCard` that was linked. The response might contain a set of `Error`
# objects if the request resulted in errors.
public type LinkCustomerToGiftCardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# The response object returned by the [ListMerchant](https://developer.squareup.com/reference/square_2021-08-18/merchants-api/list-merchants) endpoint.
public type ListMerchantsResponse record {
    # If the  response is truncated, the cursor to use in next  request to fetch next set of objects.
    int cursor?;
    # Information on errors encountered during the request.
    Error[] errors?;
    # The requested `Merchant` entities.
    Merchant[] merchant?;
};

# Defines the fields in a `CreateDisputeEvidenceText` response.
public type CreateDisputeEvidenceTextResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # 
    DisputeEvidence evidence?;
};

# Describes a request to list refunds using 
# [ListPaymentRefunds](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/list-payment-refunds).
# 
# The maximum results per page is 100.
public type ListPaymentRefundsRequest record {
    # The timestamp for the beginning of the requested reporting period, in RFC 3339 format.
    # 
    # Default: The current time minus one year.
    string begin_time?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The timestamp for the end of the requested reporting period, in RFC 3339 format.
    # 
    # Default: The current time.
    string end_time?;
    # The maximum number of results to be returned in a single page.
    # 
    # It is possible to receive fewer results than the specified limit on a given page.
    # 
    # If the supplied value is greater than 100, no more than 100 results are returned.
    # 
    # Default: 100
    int 'limit?;
    # Limit results to the location supplied. By default, results are returned
    # for all locations associated with the seller.
    string location_id?;
    # The order in which results are listed:
    # - `ASC` - Oldest to newest.
    # - `DESC` - Newest to oldest (default).
    string sort_order?;
    # If provided, only refunds with the given source type are returned.
    # - `CARD` - List refunds only for payments where `CARD` was specified as the payment
    # source.
    # 
    # Default: If omitted, refunds are returned regardless of the source type.
    string source_type?;
    # If provided, only refunds with the given status are returned.
    # For a list of refund status values, see [PaymentRefund](https://developer.squareup.com/reference/square_2021-08-18/objects/PaymentRefund).
    # 
    # Default: If omitted, refunds are returned regardless of their status.
    string status?;
};

# Request object for the [RetrieveMerchant](https://developer.squareup.com/reference/square_2021-08-18/merchants-api/retrieve-merchant) endpoint.
public type RetrieveMerchantRequest record {
};

# 
public type RevokeTokenResponse record {
    # If the request is successful, this is true.
    boolean success?;
};

# Defines supported stock levels of the item inventory.
public type SearchCatalogItemsRequestStockLevel string;

# 
public type BatchRetrieveInventoryChangesRequest record {
    # The filter to return results by `CatalogObject` ID.
    # The filter is only applicable when set. The default value is null.
    string[] catalog_object_ids?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # The filter to return results by `Location` ID. 
    # The filter is only applicable when set. The default value is null.
    string[] location_ids?;
    # The filter to return `ADJUSTMENT` query results by
    # `InventoryState`. This filter is only applied when set.
    # The default value is null.
    string[] states?;
    # The filter to return results by `InventoryChangeType` values other than `TRANSFER`.
    # The default value is `[PHYSICAL_COUNT, ADJUSTMENT]`.
    string[] types?;
    # The filter to return results with their `calculated_at` value  
    # after the given time as specified in an RFC 3339 timestamp. 
    # The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
    string updated_after?;
    # The filter to return results with their `created_at` or `calculated_at` value  
    # strictly before the given time as specified in an RFC 3339 timestamp. 
    # The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
    string updated_before?;
};

# Represents a search request for a filtered list of `TeamMember` objects.
public type SearchTeamMembersRequest record {
    # The opaque cursor for fetching the next page. For more information, see
    # [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of `TeamMember` objects in a page (100 by default).
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # Represents the parameters in a search for `TeamMember` objects.
    SearchTeamMembersQuery query?;
};

# 
public type RetrieveInventoryAdjustmentResponse record {
    # Represents a change in state or quantity of product inventory at a
    # particular time and location.
    InventoryAdjustment adjustment?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type RetrieveBookingResponse record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Filter events by date time range.
public type LoyaltyEventDateTimeFilter record {
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange created_at;
};

# A request to link a customer to a gift card
public type LinkCustomerToGiftCardRequest record {
    # The ID of the customer to be linked.
    @constraint:String {maxLength: 191, minLength: 1}
    string customer_id;
};

# A query filter to search for appointment segments by.
public type SegmentFilter record {
    # The ID of the [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) representing the service booked in this segment.
    @constraint:String {minLength: 1}
    string service_variation_id;
    # A filter to select resources based on an exact field value. For any given
    # value, the value can only be in one property. Depending on the field, either
    # all properties can be set or only a subset will be available.
    # 
    # Refer to the documentation of the field.
    FilterValue team_member_id_filter?;
};

# Describes a subscription plan. For more information, see
# [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
public type CatalogSubscriptionPlan record {
    # The name of the plan.
    string name;
    # A list of SubscriptionPhase containing the [SubscriptionPhase](https://developer.squareup.com/reference/square_2021-08-18/objects/SubscriptionPhase) for this plan.
    SubscriptionPhase[] phases;
};

# 
public type V1RetrieveSettlementRequest record {
};

# 
public type CancelTerminalCheckoutRequest record {
};

# The status of the location, whether a location is active or inactive.
public type LocationStatus string;

# 
public type RetrieveTeamMemberBookingProfileRequest record {
};

# Configuration associated with `SELECTION`-type custom attribute definitions.
public type CatalogCustomAttributeDefinitionSelectionConfig record {
    # The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100
    # selections can be defined. Can be modified.
    CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection[] allowed_selections?;
    # The maximum number of selections that can be set. The maximum value for this
    # attribute is 100. The default value is 1. The value can be modified, but changing the value will not
    # affect existing custom attribute values on objects. Clients need to
    # handle custom attributes with more selected values than allowed by this limit.
    @constraint:Int {maxValue: 100}
    int max_allowed_selections?;
};

# 
public type GetDeviceCodeResponse record {
    # 
    DeviceCode device_code?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# A response that contains a `GiftCard`. This response might contain a set of `Error` objects
# if the request resulted in errors.
public type RetrieveGiftCardFromGANResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# 
public type CreateOrderRequest record {
    # A value you specify that uniquely identifies this
    # order among orders you have created.
    # 
    # If you are unsure whether a particular order was created successfully,
    # you can try it again with the same idempotency key without
    # worrying about creating duplicate orders.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency).
    @constraint:String {maxLength: 192}
    string idempotency_key?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# 
public type TerminalCheckout record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # The ID of the application that created the checkout.
    string app_id?;
    # Present if the status is `CANCELED`.
    string cancel_reason?;
    # The time when the `TerminalCheckout` was created, as an RFC 3339 timestamp.
    string created_at?;
    # An RFC 3339 duration, after which the checkout is automatically canceled.
    # A `TerminalCheckout` that is `PENDING` is automatically `CANCELED` and has a cancellation reason
    # of `TIMED_OUT`.
    # 
    # Default: 5 minutes from creation
    # 
    # Maximum: 5 minutes
    string deadline_duration?;
    # 
    DeviceCheckoutOptions device_options;
    # A unique ID for this `TerminalCheckout`.
    @constraint:String {maxLength: 255, minLength: 10}
    string id?;
    # The location of the device where the `TerminalCheckout` was directed.
    string location_id?;
    # An optional note to associate with the checkout, as well as with any payments used to complete the checkout.
    @constraint:String {maxLength: 250}
    string note?;
    # A list of IDs for payments created by this `TerminalCheckout`.
    string[] payment_ids?;
    # The type of payment the terminal should attempt to capture from. Defaults to `CARD_PRESENT`.
    string payment_type?;
    # An optional user-defined reference ID that can be used to associate
    # this `TerminalCheckout` to another entity in an external system. For example, an order
    # ID generated by a third-party shopping cart. The ID is also associated with any payments
    # used to complete the checkout.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # The status of the `TerminalCheckout`.
    # Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
    string status?;
    # The time when the `TerminalCheckout` was last updated, as an RFC 3339 timestamp.
    string updated_at?;
};

# Defines the response returned by [GetPayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/get-payment).
public type GetPaymentResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# Defines the fields that are included in the response body of
# a request to the `CreateCheckout` endpoint.
public type CreateCheckoutResponse record {
    # Square Checkout lets merchants accept online payments for supported
    # payment types using a checkout workflow hosted on squareup.com.
    Checkout checkout?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Provides information about a loyalty event. 
# For more information, see [Loyalty events](https://developer.squareup.com/docs/loyalty-api/overview/#loyalty-events).
public type LoyaltyEvent record {
    # Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
    LoyaltyEventAccumulatePoints accumulate_points?;
    # Provides metadata when the event `type` is `ADJUST_POINTS`.
    LoyaltyEventAdjustPoints adjust_points?;
    # Provides metadata when the event `type` is `CREATE_REWARD`.
    LoyaltyEventCreateReward create_reward?;
    # The timestamp when the event was created, in RFC 3339 format.
    @constraint:String {minLength: 1}
    string created_at;
    # Provides metadata when the event `type` is `DELETE_REWARD`.
    LoyaltyEventDeleteReward delete_reward?;
    # Provides metadata when the event `type` is `EXPIRE_POINTS`.
    LoyaltyEventExpirePoints expire_points?;
    # The Square-assigned ID of the loyalty event.
    @constraint:String {minLength: 1}
    string id;
    # The ID of the [location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the event occurred.
    string location_id?;
    # The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) in which the event occurred.
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_account_id;
    # Provides metadata when the event `type` is `OTHER`.
    LoyaltyEventOther other_event?;
    # Provides metadata when the event `type` is `REDEEM_REWARD`.
    LoyaltyEventRedeemReward redeem_reward?;
    # Defines whether the event was generated by the Square Point of Sale.
    string 'source;
    # The type of the loyalty event.
    string 'type;
};

# Defines fields in a `ListDisputes` response.
public type ListDisputesResponse record {
    # The pagination cursor to be used in a subsequent request.
    # If unset, this is the final response. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The list of disputes.
    Dispute[] disputes?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# 
public type V1UpdateEmployeeRequest record {
    # Represents one of a business's employees.
    V1Employee body;
};

# The query filter to return the item variations containing the specified item option value IDs.
public type CatalogQueryItemVariationsForItemOptionValues record {
    # A set of `CatalogItemOptionValue` IDs to be used to find associated
    # `CatalogItemVariation`s. All ItemVariations that contain all of the given
    # Item Option Values (in any order) will be returned.
    string[] item_option_value_ids?;
};

# Object types to inline under their respective parent object in certain connect v2 responses
public type InlineTypes string;

# 
public type RetrieveEmployeeRequest record {
};

# 
public type V1ListEmployeesResponse record {
    # 
    V1Employee[] items?;
};

# Defines the fields that are included in the response body of
# a request to the [ListCards](#endpoint-cards-listcards) endpoint.
# 
# Note: if there are errors processing the request, the card field will not be
# present.
public type ListCardsResponse record {
    # The requested list of `Card`s.
    Card[] cards?;
    # The pagination cursor to be used in a subsequent request. If empty,
    # this is the final response.
    # 
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# 
public type BatchUpsertCatalogObjectsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The mapping between client and server IDs for this upsert.
    CatalogIdMapping[] id_mappings?;
    # The created successfully created CatalogObjects.
    CatalogObject[] objects?;
    # The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
    string updated_at?;
};

# A request to retrieve digital gift cards.
public type RetrieveGiftCardRequest record {
};

# Indicates how Square delivers the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to the customer.
public type InvoiceDeliveryMethod string;

# 
public type GiftCardType string;

# Defines the response body returned from the [SearchCatalogItems](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-items) endpoint.
public type SearchCatalogItemsResponse record {
    # Pagination token used in the next request to return more of the search result.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # Returned items matching the specified query expressions.
    CatalogObject[] items?;
    # Ids of returned item variations matching the specified query expression.
    string[] matched_variation_ids?;
};

# A request to redeem a loyalty reward.
public type RedeemLoyaltyRewardRequest record {
    # A unique string that identifies this `RedeemLoyaltyReward` request. 
    # Keys can be any valid string, but must be unique for every request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # The ID of the [location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the reward is redeemed.
    @constraint:String {minLength: 1}
    string location_id;
};

# Defines the fields that are included in the response body of
# a request to the [DeleteCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/delete-customer-group) endpoint.
public type DeleteCustomerGroupResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a query (including filtering criteria, sorting criteria, or both) used to search
# for customer profiles.
public type CustomerQuery record {
    # Represents a set of `CustomerQuery` filters used to limit the set of
    # customers returned by the [SearchCustomers](https://developer.squareup.com/reference/square_2021-08-18/customers-api/search-customers) endpoint.
    CustomerFilter filter?;
    # Specifies how searched customers profiles are sorted, including the sort key and sort order.
    CustomerSort sort?;
};

# When to calculate the taxes due on a cart.
public type TaxCalculationPhase string;

# 
public type ListDeviceCodesRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for your original query.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # If specified, only returns DeviceCodes of the specified location.
    # Returns DeviceCodes of all locations if empty.
    string location_id?;
    # If specified, only returns DeviceCodes targeting the specified product type.
    # Returns DeviceCodes of all product types if empty.
    string product_type?;
    # If specified, returns DeviceCodes with the specified statuses.
    # Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty.
    string[] status?;
};

# Contains the details necessary to fulfill a shipment order.
public type OrderFulfillmentShipmentDetails record {
    # A description of why the shipment was canceled.
    @constraint:String {maxLength: 100}
    string cancel_reason?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating the shipment was canceled.
    # The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string canceled_at?;
    # The shipping carrier being used to ship this fulfillment (such as UPS, FedEx, or USPS).
    @constraint:String {maxLength: 50}
    string carrier?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when the shipment is expected to be delivered to the shipping carrier.
    # The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string expected_shipped_at?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when the shipment failed to be completed. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string failed_at?;
    # A description of why the shipment failed to be completed.
    @constraint:String {maxLength: 100}
    string failure_reason?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when this fulfillment was moved to the `RESERVED` state, which  indicates that preparation
    # of this shipment has begun. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string in_progress_at?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when this fulfillment was moved to the `PREPARED` state, which indicates that the
    # fulfillment is packaged. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
    string packaged_at?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when the shipment was requested. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string placed_at?;
    # Contains information about the recipient of a fulfillment.
    OrderFulfillmentRecipient recipient?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when this fulfillment was moved to the `COMPLETED` state, which indicates that
    # the fulfillment has been given to the shipping carrier. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string shipped_at?;
    # A note with additional information for the shipping carrier.
    @constraint:String {maxLength: 500}
    string shipping_note?;
    # A description of the type of shipping product purchased from the carrier
    # (such as First Class, Priority, or Express).
    @constraint:String {maxLength: 50}
    string shipping_type?;
    # The reference number provided by the carrier to track the shipment's progress.
    @constraint:String {maxLength: 100}
    string tracking_number?;
    # A link to the tracking webpage on the carrier's website.
    @constraint:String {maxLength: 2000}
    string tracking_url?;
};

# Indicates a card's prepaid type, such as `NOT_PREPAID` or `PREPAID`.
public type CardPrepaidType string;

# Enumerates the possible invitation statuses the team member can have within a business.
public type TeamMemberInvitationStatus string;

# 
public type V1PaymentItemizationItemizationType string;

# Describes a payment request reminder (automatic notification) that Square sends
# to the customer. You configure a reminder relative to the payment request
# `due_date`.
public type InvoicePaymentReminder record {
    # The reminder message.
    @constraint:String {maxLength: 1000, minLength: 1}
    string message?;
    # The number of days before (a negative number) or after (a positive number)
    # the payment request `due_date` when the reminder is sent. For example, -3 indicates that
    # the reminder should be sent 3 days before the payment request `due_date`.
    @constraint:Int {minValue: -32767, maxValue: 32767}
    int relative_scheduled_days?;
    # If sent, the timestamp when the reminder was sent, in RFC 3339 format.
    string sent_at?;
    # The status of the reminder.
    string status?;
    # A Square-assigned ID that uniquely identifies the reminder within the
    # `InvoicePaymentRequest`.
    string uid?;
};

# 
public type GiftCardActivityAdjustDecrementReason string;

# A response that includes the `LoyaltyEvent` published for redeeming the reward.
public type RedeemLoyaltyRewardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Provides information about a loyalty event. 
    # For more information, see [Loyalty events](https://developer.squareup.com/docs/loyalty-api/overview/#loyalty-events).
    LoyaltyEvent event?;
};

# The query filter to return the items containing the specified modifier list IDs.
public type CatalogQueryItemsForModifierList record {
    # A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
    string[] modifier_list_ids;
};

# 
public type GiftCardActivityUnblockReason string;

# Response object returned by GetBankAccountByV1Id.
public type GetBankAccountByV1IdResponse record {
    # Represents a bank account. For more information about 
    # linking a bank account to a Square account, see 
    # [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    BankAccount bank_account?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# Defines the parameters for a `RetrieveDisputeEvidence` request.
public type RetrieveDisputeEvidenceRequest record {
};

# Represents fraud risk information for the associated payment.
# 
# When you take a payment through Square's Payments API (using the `CreatePayment`
# endpoint), Square evaluates it and assigns a risk level to the payment. Sellers
# can use this information to determine the course of action (for example,
# provide the goods/services or refund the payment).
public type RiskEvaluation record {
    # The timestamp when payment risk was evaluated, in RFC 3339 format.
    string created_at?;
    # The risk level associated with the payment
    string risk_level?;
};

# 
public type UpdateBookingResponse record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The query filter to return the search result whose named attribute values fall between the specified range.
public type CatalogQueryRange record {
    # The desired maximum value for the search attribute (inclusive).
    int attribute_max_value?;
    # The desired minimum value for the search attribute (inclusive).
    int attribute_min_value?;
    # The name of the attribute to be searched.
    @constraint:String {minLength: 1}
    string attribute_name;
};

# The response to a request for `Shift` objects. The response contains
# the requested `Shift` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type SearchShiftsResponse record {
    # An opaque cursor for fetching the next page.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # Shifts.
    Shift[] shifts?;
};

# Enumerates the possible assignment types that the team member can have.
public type TeamMemberAssignedLocationsAssignmentType string;

# Defines the fields in an `AcceptDispute` response.
public type AcceptDisputeResponse record {
    # Represents a dispute a cardholder initiated with their bank.
    Dispute dispute?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# V1PaymentTax
public type V1PaymentTax record {
    # 
    V1Money applied_money?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The ID of the tax, if available. Taxes applied in older versions of Square Register might not have an ID.
    string fee_id?;
    # Whether the tax is an ADDITIVE tax or an INCLUSIVE tax.
    string inclusion_type?;
    # The merchant-defined name of the tax.
    string name?;
    # The rate of the tax, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%.
    string rate?;
};

# A request for a set of `TeamMemberWage` objects.
public type ListTeamMemberWagesRequest record {
    # A pointer to the next page of `EmployeeWage` results to fetch.
    string cursor?;
    # The maximum number of `TeamMemberWage` results to return per page. The number can range between
    # 1 and 200. The default is 200.
    @constraint:Int {minValue: 1, maxValue: 200}
    int 'limit?;
    # Filter the returned wages to only those that are associated with the
    # specified team member.
    string team_member_id?;
};

# 
public type GiftCardActivityAdjustIncrementReason string;

# Represents a contract to redeem loyalty points for a [reward tier](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an ISSUED, REDEEMED, or DELETED state. For more information, see [Redeem loyalty rewards](https://developer.squareup.com/docs/loyalty-api/overview#redeem-loyalty-rewards).
public type LoyaltyReward record {
    # The timestamp when the reward was created, in RFC 3339 format.
    string created_at?;
    # The Square-assigned ID of the loyalty reward.
    @constraint:String {maxLength: 36}
    string id?;
    # The Square-assigned ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) to which the reward belongs.
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_account_id;
    # The Square-assigned ID of the [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) to which the reward is attached.
    string order_id?;
    # The number of loyalty points used for the reward.
    @constraint:Int {minValue: 1}
    int points?;
    # The timestamp when the reward was redeemed, in RFC 3339 format.
    string redeemed_at?;
    # The Square-assigned ID of the [reward tier](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgramRewardTier) used to create the reward.
    @constraint:String {maxLength: 36, minLength: 1}
    string reward_tier_id;
    # The status of a loyalty reward.
    string status?;
    # The timestamp when the reward was last updated, in RFC 3339 format.
    string updated_at?;
};

# 
public type UpdateBookingRequest record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking;
    # A unique key to make this request an idempotent operation.
    @constraint:String {maxLength: 255}
    string idempotency_key?;
};

# 
public type RetrieveInventoryPhysicalCountRequest record {
};

# Describes a `DeleteInvoice` request.
public type DeleteInvoiceRequest record {
    # The version of the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to delete.
    # If you do not know the version, you can call [GetInvoice](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/get-invoice) or 
    # [ListInvoices](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/list-invoices).
    int 'version?;
};

# Describes a gift card activity of the IMPORT type and the `GiftCardGANSource` is OTHER 
# (a third-party gift card).
public type GiftCardActivityImport record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
};

# Indicates where to render a custom field on the Square-hosted invoice page and in emailed or PDF 
# copies of the invoice.
public type InvoiceCustomFieldPlacement string;

# Represents the origination details of an order.
public type OrderSource record {
    # The name used to identify the place (physical or digital) that an order originates.
    # If unset, the name defaults to the name of the application that created the order.
    string name?;
};

# 
public type RiskEvaluationRiskLevel string;

# Time units of a service duration for bookings.
public type BusinessAppointmentSettingsAlignmentTime string;

# Represents a request to create a `Shift`.
public type CreateShiftRequest record {
    # A unique string value to ensure the idempotency of the operation.
    @constraint:String {maxLength: 128}
    string idempotency_key?;
    # A record of the hourly rate, start, and end times for a single work shift
    # for an employee. This might include a record of the start and end times for breaks
    # taken during the shift.
    Shift shift;
};

# A response containing the resulting loyalty event.
public type AccumulateLoyaltyPointsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Provides information about a loyalty event. 
    # For more information, see [Loyalty events](https://developer.squareup.com/docs/loyalty-api/overview/#loyalty-events).
    LoyaltyEvent event?;
};

# 
public type ActionCancelReason string;

# A response to a request to get a `TeamMemberWage`. The response contains
# the requested `TeamMemberWage` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type GetTeamMemberWageResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The hourly wage rate that a team member earns on a `Shift` for doing the job
    # specified by the `title` property of this object.
    TeamMemberWage team_member_wage?;
};

# Indicates how the inventory change was applied to a tracked product quantity.
public type InventoryChangeType string;

# 
public type V1PaymentTaxInclusionType string;

# Represents the Square processing fee.
public type ProcessingFee record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # The timestamp of when the fee takes effect, in RFC 3339 format.
    string effective_at?;
    # The type of fee assessed or adjusted. The fee type can be `INITIAL` or `ADJUSTMENT`.
    string 'type?;
};

# Represents an amount of money. `Money` fields can be signed or unsigned.
# Fields that do not explicitly define whether they are signed or unsigned are
# considered unsigned and can only hold positive amounts. For signed fields, the
# sign of the value indicates the purpose of the money transfer. See
# [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
# for more information.
public type Money record {
    # The amount of money, in the smallest denomination of the currency
    # indicated by `currency`. For example, when `currency` is `USD`, `amount` is
    # in cents. Monetary amounts can be positive or negative. See the specific
    # field description to determine the meaning of the sign in a particular case.
    int amount?;
    # The type of currency, in __ISO 4217 format__. For example, the currency
    # code for US dollars is `USD`.
    # 
    # See [Currency](https://developer.squareup.com/reference/square_2021-08-18/enums/Currency) for possible values.
    string currency?;
};

# Defines the fields in a `DeprecatedCreateDisputeEvidenceText` response.
public type DeprecatedCreateDisputeEvidenceTextResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # 
    DisputeEvidence evidence?;
};

# Defines the query parameters that can be included in
# a request to the [ListTransactions](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/list-transactions) endpoint.
# 
# Deprecated - recommend using [SearchOrders](https://developer.squareup.com/reference/square_2021-08-18/orders-api/search-orders)
public type ListTransactionsRequest record {
    # The beginning of the requested reporting period, in RFC 3339 format.
    # 
    # See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.
    # 
    # Default value: The current time minus one year.
    string begin_time?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for your original query.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # The end of the requested reporting period, in RFC 3339 format.
    # 
    # See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.
    # 
    # Default value: The current time.
    string end_time?;
    # The order in which results are listed in the response (`ASC` for
    # oldest first, `DESC` for newest first).
    # 
    # Default value: `DESC`
    string sort_order?;
};

# Describes a `ListInvoice` response.
public type ListInvoicesResponse record {
    # When a response is truncated, it includes a cursor that you can use in a 
    # subsequent request to retrieve the next set of invoices. If empty, this is the final 
    # response. 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The invoices retrieved.
    Invoice[] invoices?;
};

# 
public type DeviceCode record {
    # The unique code that can be used to login.
    string code?;
    # When this DeviceCode was created. Timestamp in RFC 3339 format.
    string created_at?;
    # The unique id of the device that used this code. Populated when the device is paired up.
    string device_id?;
    # The unique id for this device code.
    string id?;
    # The location assigned to this code.
    @constraint:String {maxLength: 50}
    string location_id?;
    # An optional user-defined name for the device code.
    @constraint:String {maxLength: 128}
    string name?;
    # When this DeviceCode will expire and no longer login. Timestamp in RFC 3339 format.
    string pair_by?;
    # When this DeviceCode was paired. Timestamp in RFC 3339 format.
    string paired_at?;
    # The targeting product type of the device code.
    string product_type;
    # The pairing status of the device code.
    string status?;
    # When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
    string status_changed_at?;
};

# 
public type BatchUpsertCatalogObjectsRequest record {
    # A batch of CatalogObjects to be inserted/updated atomically.
    # The objects within a batch will be inserted in an all-or-nothing fashion, i.e., if an error occurs
    # attempting to insert or update an object within a batch, the entire batch will be rejected. However, an error
    # in one batch will not affect other batches within the same request.
    # 
    # For each object, its `updated_at` field is ignored and replaced with a current [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), and its
    # `is_deleted` field must not be set to `true`.
    # 
    # To modify an existing object, supply its ID. To create a new object, use an ID starting
    # with `#`. These IDs may be used to create relationships between an object and attributes of
    # other objects that reference it. For example, you can create a CatalogItem with
    # ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to
    # `#ABC` in order to associate the CatalogItemVariation with its parent
    # CatalogItem.
    # 
    # Any `#`-prefixed IDs are valid only within a single atomic batch, and will be replaced by server-generated IDs.
    # 
    # Each batch may contain up to 1,000 objects. The total number of objects across all batches for a single request
    # may not exceed 10,000. If either of these limits is violated, an error will be returned and no objects will
    # be inserted or updated.
    CatalogObjectBatch[] batches;
    # A value you specify that uniquely identifies this
    # request among all your requests. A common way to create
    # a valid idempotency key is to use a Universally unique
    # identifier (UUID).
    # 
    # If you're unsure whether a particular request was successful,
    # you can reattempt it with the same idempotency key without
    # worrying about creating duplicate objects.
    # 
    # See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {minLength: 1}
    string idempotency_key;
};

# Contains the measurement unit for a quantity and a precision that
# specifies the number of digits after the decimal point for decimal quantities.
public type OrderQuantityUnit record {
    # The version of the catalog object that this measurement unit references.
    # 
    # This field is set when this is a catalog-backed measurement unit.
    int catalog_version?;
    # Represents a unit of measurement to use with a quantity, such as ounces
    # or inches. Exactly one of the following fields are required: `custom_unit`,
    # `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
    MeasurementUnit measurement_unit?;
    # For non-integer quantities, represents the number of digits after the decimal point that are
    # recorded for this quantity.
    # 
    # For example, a precision of 1 allows quantities such as `"1.0"` and `"1.1"`, but not `"1.01"`.
    # 
    # Min: 0. Max: 5.
    int precision?;
};

# Defines the query parameters that can be included in a request to the
# [ListCustomerGroups](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/list-customer-groups) endpoint.
public type ListCustomerGroupsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for your original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results. 
    # The limit is ignored if it is less than 1 or greater than 50. The default value is 50.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    @constraint:Int {minValue: 1, maxValue: 50}
    int 'limit?;
};

# Provides metadata when the event `type` is `CREATE_REWARD`.
public type LoyaltyEventCreateReward record {
    # The ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_program_id;
    # The loyalty points used to create the reward.
    int points;
    # The Square-assigned ID of the created [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward).
    # This field is returned only if the event source is `LOYALTY_API`.
    @constraint:String {maxLength: 36}
    string reward_id?;
};

# Represents the hours of operation for a business location.
public type BusinessHours record {
    # The list of time periods during which the business is open. There may be at most 10
    # periods per day.
    BusinessHoursPeriod[] periods?;
};

# The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. Discount details
# are now defined using a catalog pricing rule and other catalog objects. For more information, see
# [Get discount details for the reward](https://developer.squareup.com/docs/loyalty-api/overview#get-discount-details).
public type LoyaltyProgramRewardDefinitionType string;

# 
public type RevokeTokenRequest record {
    # The access token of the merchant whose token you want to revoke.
    # Do not provide a value for merchant_id if you provide this parameter.
    @constraint:String {maxLength: 1024, minLength: 2}
    string access_token?;
    # The Square issued ID for your application, available from the
    # [developer dashboard](https://developer.squareup.com/apps).
    @constraint:String {maxLength: 191}
    string client_id?;
    # The ID of the merchant whose token you want to revoke.
    # Do not provide a value for access_token if you provide this parameter.
    string merchant_id?;
    # If `true`, terminate the given single access token, but do not
    # terminate the entire authorization.
    # Default: `false`
    boolean revoke_only_access_token?;
};

# Represents a `RetrieveSnippet` request.
public type RetrieveSnippetRequest record {
};

# Specifies the `status` of `Shift` records to be returned.
public type ShiftFilterStatus string;

# V1UpdateOrderRequest
public type V1UpdateOrderRequest record {
    # The action to perform on the order (COMPLETE, CANCEL, or REFUND).
    string action;
    # A merchant-specified note about the canceling of the order. Only valid if action is CANCEL.
    string canceled_note?;
    # A merchant-specified note about the completion of the order. Only valid if action is COMPLETE.
    string completed_note?;
    # A merchant-specified note about the refunding of the order. Only valid if action is REFUND.
    string refunded_note?;
    # The tracking number of the shipment associated with the order. Only valid if action is COMPLETE.
    string shipped_tracking_number?;
};

# 
public type GetTerminalCheckoutRequest record {
};

# Represents the unit used to measure a `CatalogItemVariation` and
# specifies the precision for decimal quantities.
public type CatalogMeasurementUnit record {
    # Represents a unit of measurement to use with a quantity, such as ounces
    # or inches. Exactly one of the following fields are required: `custom_unit`,
    # `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
    MeasurementUnit measurement_unit?;
    # An integer between 0 and 5 that represents the maximum number of
    # positions allowed after the decimal in quantities measured with this unit.
    # For example:
    # 
    # - if the precision is 0, the quantity can be 1, 2, 3, etc.
    # - if the precision is 1, the quantity can be 0.1, 0.2, etc.
    # - if the precision is 2, the quantity can be 0.01, 0.12, etc.
    # 
    # Default: 3
    int precision?;
};

# Indicates the specific error that occurred during a request to a
# Square API.
public type ErrorCode string;

# The response returned by the `CreateInvoice` request.
public type CreateInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice?;
};

# Represents a postal address in a country. The address format is based 
# on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
# see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
# This format has dedicated fields for four address components: postal code, 
# locality (city), administrative district (state, prefecture, or province), and 
# sublocality (town or village). These components have dedicated fields in the 
# `Address` object because software sometimes behaves differently based on them. 
# For example, sales tax software may charge different amounts of sales tax 
# based on the postal code, and some software is only available in 
# certain states due to compliance reasons.
# 
# For the remaining address components, the `Address` type provides the 
# `address_line_1` and `address_line_2` fields for free-form data entry. 
# These fields are free-form because the remaining address components have 
# too many variations around the world and typical software does not parse 
# these components. These fields enable users to enter anything they want. 
# 
# Note that, in the current implementation, all other `Address` type fields are blank. 
# These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
# `administrative_district_level_2`, `administrative_district_level_3`, 
# `first_name`, `last_name`, and `organization`. 
# 
# When it comes to localization, the seller's language preferences 
# (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
# are ignored for addresses. Even though Square products (such as Square Point of Sale 
# and the Seller Dashboard) mostly use a seller's language preference in 
# communication, when it comes to addresses, they will use English for a US address, 
# Japanese for an address in Japan, and so on.
public type Address record {
    # The first line of the address.
    # 
    # Fields that start with `address_line` provide the address's most specific
    # details, like street number, street name, and building name. They do *not*
    # provide less specific details like city, state/province, or country (these
    # details are provided in other fields).
    string address_line_1?;
    # The second line of the address, if any.
    string address_line_2?;
    # The third line of the address, if any.
    string address_line_3?;
    # A civil entity within the address's country. In the US, this
    # is the state.
    string administrative_district_level_1?;
    # A civil entity within the address's `administrative_district_level_1`.
    # In the US, this is the county.
    string administrative_district_level_2?;
    # A civil entity within the address's `administrative_district_level_2`,
    # if any.
    string administrative_district_level_3?;
    # The address's country, in ISO 3166-1-alpha-2 format.
    string country?;
    # Optional first name when it's representing recipient.
    string first_name?;
    # Optional last name when it's representing recipient.
    string last_name?;
    # The city or town of the address.
    string locality?;
    # Optional organization name when it's representing recipient.
    string organization?;
    # The address's postal code.
    string postal_code?;
    # A civil region within the address's `locality`, if any.
    string sublocality?;
    # A civil region within the address's `sublocality`, if any.
    string sublocality_2?;
    # A civil region within the address's `sublocality_2`, if any.
    string sublocality_3?;
};

# The list of possible dispute states.
public type DisputeState string;

# Represents a Square loyalty program. Loyalty programs define how buyers can earn points and redeem points for rewards. 
# Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. 
# For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
public type LoyaltyProgram record {
    # Defines how buyers can earn loyalty points.
    LoyaltyProgramAccrualRule[] accrual_rules;
    # The timestamp when the program was created, in RFC 3339 format.
    @constraint:String {minLength: 1}
    string created_at;
    # Describes when the loyalty program expires.
    LoyaltyProgramExpirationPolicy expiration_policy?;
    # The Square-assigned ID of the loyalty program. Updates to 
    # the loyalty program do not modify the identifier.
    @constraint:String {maxLength: 36, minLength: 1}
    string id;
    # The [locations](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) at which the program is active.
    LoyaltyprogramLocationidsItemsString[] location_ids;
    # The list of rewards for buyers, sorted by ascending points.
    LoyaltyProgramRewardTier[] reward_tiers;
    # Whether the program is currently active.
    string status;
    # Represents the naming used for loyalty points.
    LoyaltyProgramTerminology terminology;
    # The timestamp when the reward was last updated, in RFC 3339 format.
    @constraint:String {minLength: 1}
    string updated_at;
};

# The response to a request for a set of `TeamMemberWage` objects. The response contains
# a set of `TeamMemberWage` objects.
public type ListTeamMemberWagesResponse record {
    # The value supplied in the subsequent request to fetch the next page
    # of `TeamMemberWage` results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # A page of `TeamMemberWage` results.
    TeamMemberWage[] team_member_wages?;
};

# An object that represents a team member's assignment to locations.
public type TeamMemberAssignedLocations record {
    # The current assignment type of the team member.
    string assignment_type?;
    # The locations that the team member is assigned to.
    string[] location_ids?;
};

# ACH-specific details about `BANK_ACCOUNT` type payments with the `transfer_type` of `ACH`.
public type ACHDetails record {
    # The last few digits of the bank account number.
    @constraint:String {maxLength: 4, minLength: 1}
    string account_number_suffix?;
    # The type of the bank account performing the transfer. The account type can be `CHECKING`,
    # `SAVINGS`, or `UNKNOWN`.
    @constraint:String {maxLength: 50}
    string account_type?;
    # The routing number for the bank account.
    @constraint:String {maxLength: 50}
    string routing_number?;
};

# 
public type GiftCardActivityClearBalanceReason string;

# Indicates a card's brand, such as `VISA` or `MASTERCARD`.
public type CardBrand string;

# A response that includes the loyalty reward created.
public type CreateLoyaltyRewardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a contract to redeem loyalty points for a [reward tier](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgramRewardTier) discount. Loyalty rewards can be in an ISSUED, REDEEMED, or DELETED state. For more information, see [Redeem loyalty rewards](https://developer.squareup.com/docs/loyalty-api/overview#redeem-loyalty-rewards).
    LoyaltyReward reward?;
};

# Describes a request to refund a payment using [RefundPayment](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/refund-payment).
public type RefundPaymentRequest record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money app_fee_money?;
    #  A unique string that identifies this `RefundPayment` request. The key can be any valid string
    # but must be unique for every `RefundPayment` request.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {minLength: 1}
    string idempotency_key;
    # The unique ID of the payment being refunded.
    @constraint:String {minLength: 1}
    string payment_id;
    # A description of the reason for the refund.
    @constraint:String {maxLength: 192}
    string reason?;
};

# Represents the service charge applied to the original order.
public type OrderReturnServiceCharge record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The list of references to `OrderReturnTax` entities applied to the
    # `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid`
    # that references the `uid` of a top-level `OrderReturnTax` that is being
    # applied to the `OrderReturnServiceCharge`. On reads, the applied amount is
    # populated.
    OrderLineItemAppliedTax[] applied_taxes?;
    # The calculation phase after which to apply the service charge.
    string calculation_phase?;
    # The catalog object ID of the associated [OrderServiceCharge](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderServiceCharge).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this service charge references.
    int catalog_version?;
    # The name of the service charge.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the service charge, as a string representation of
    # a decimal number. For example, a value of `"7.25"` corresponds to a
    # percentage of 7.25%.
    # 
    # Either `percentage` or `amount_money` should be set, but not both.
    @constraint:String {maxLength: 10}
    string percentage?;
    # The service charge `uid` from the order containing the original
    # service charge. `source_service_charge_uid` is `null` for
    # unlinked returns.
    @constraint:String {maxLength: 60}
    string source_service_charge_uid?;
    # Indicates whether the surcharge can be taxed. Service charges
    # calculated in the `TOTAL_PHASE` cannot be marked as taxable.
    boolean taxable?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tax_money?;
    # A unique ID that identifies the return service charge only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# A request to create a gift card.
public type CreateGiftCardRequest record {
    # Represents a Square gift card.
    GiftCard gift_card;
    # A unique string that identifies the `CreateGiftCard` request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # The location ID where the gift card that will be created should be registered.
    @constraint:String {minLength: 1}
    string location_id;
};

# Retrieves details for a specific Card. Accessible via
# HTTP requests at GET https://connect.squareup.com/v2/cards
public type ListCardsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for your original query.
    # 
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    @constraint:String {maxLength: 256}
    string cursor?;
    # Limit results to cards associated with the customer supplied.
    # By default, all cards owned by the merchant are returned.
    string customer_id?;
    # Includes disabled cards.
    # By default, all enabled cards owned by the merchant are returned.
    boolean include_disabled?;
    # Limit results to cards associated with the reference_id supplied.
    string reference_id?;
    # Sorts the returned list by when the card was created with the specified order.
    # This field defaults to ASC.
    string sort_order?;
};

# A request to adjust (add or subtract) points manually.
public type AdjustLoyaltyPointsRequest record {
    # Provides metadata when the event `type` is `ADJUST_POINTS`.
    LoyaltyEventAdjustPoints adjust_points;
    # A unique string that identifies this `AdjustLoyaltyPoints` request. 
    # Keys can be any valid string, but must be unique for every request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
};

# A discount to block from applying to a line item. The discount must be 
# identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
public type OrderLineItemPricingBlocklistsBlockedDiscount record {
    # The `catalog_object_id` of the discount that should be blocked. 
    # Use this field to block catalog discounts. For ad hoc discounts, use the 
    # `discount_uid` field.
    @constraint:String {maxLength: 192}
    string discount_catalog_object_id?;
    # The `uid` of the discount that should be blocked. Use this field to block 
    # ad hoc discounts. For catalog discounts, use the `discount_catalog_object_id` field.
    @constraint:String {maxLength: 60}
    string discount_uid?;
    # A unique ID of the `BlockedDiscount` within the order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# The response to a request to create a `Shift`. The response contains
# the created `Shift` object and might contain a set of `Error` objects if
# the request resulted in errors.
public type CreateShiftResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # A record of the hourly rate, start, and end times for a single work shift
    # for an employee. This might include a record of the start and end times for breaks
    # taken during the shift.
    Shift shift?;
};

# Provides metadata when the event `type` is `REDEEM_REWARD`.
public type LoyaltyEventRedeemReward record {
    # The ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_program_id;
    # The ID of the [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) that redeemed the reward.
    # This field is returned only if the Orders API is used to process orders.
    string order_id?;
    # The ID of the redeemed [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward).
    # This field is returned only if the event source is `LOYALTY_API`.
    @constraint:String {maxLength: 36}
    string reward_id?;
};

# Describes a request to retrieve a payment using 
# [GetPayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/get-payment).
public type GetPaymentRequest record {
};

# Published when evidence is added to a [Dispute](https://developer.squareup.com/reference/square_2021-08-18/objects/Dispute)
# from the Disputes Dashboard in the Seller Dashboard, the Square Point of Sale app,
# or by calling either [CreateDisputeEvidenceFile](https://developer.squareup.com/reference/square_2021-08-18/disputes-api/create-dispute-evidence-file) or [CreateDisputeEvidenceText](https://developer.squareup.com/reference/square_2021-08-18/disputes-api/create-dispute-evidence-text).
public type DisputeEvidenceCreatedWebhook record {
    # Timestamp of when the webhook event was created, in RFC 3339 format.
    string created_at?;
    # 
    DisputeEvidenceCreatedWebhookData data?;
    # A unique ID for the webhook event.
    string event_id?;
    # The ID of the target location associated with the event.
    string location_id?;
    # The ID of the target merchant associated with the event.
    string merchant_id?;
    # The type of event this represents.
    string 'type?;
};

# Represents a tax that applies to one or more line item in the order.
# 
# Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals.
# The amount distributed to each line item is relative to the amount the item
# contributes to the order subtotal.
public type OrderLineItemTax record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # Determines whether the tax was automatically applied to the order based on
    # the catalog configuration. For an example, see 
    # [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
    boolean auto_applied?;
    # The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogTax).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this tax references.
    int catalog_version?;
    # Application-defined data attached to this tax. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # The tax's name.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the tax, as a string representation of a decimal
    # number. For example, a value of `"7.25"` corresponds to a percentage of
    # 7.25%.
    @constraint:String {maxLength: 10}
    string percentage?;
    # Indicates the level at which the tax applies. For `ORDER` scoped taxes,
    # Square generates references in `applied_taxes` on all order line items that do
    # not have them. For `LINE_ITEM` scoped taxes, the tax only applies to line items
    # with references in their `applied_taxes` field.
    # 
    # This field is immutable. To change the scope, you must delete the tax and
    # re-add it as a new tax.
    string scope?;
    # Indicates the calculation method used to apply the tax.
    string 'type?;
    # A unique ID that identifies the tax only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Defines the fields that are included in the request body of a request to the
# `SearchCustomers` endpoint.
public type SearchCustomersRequest record {
    # Include the pagination cursor in subsequent calls to this endpoint to retrieve
    # the next set of results associated with the original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results. 
    # The limit is ignored if it is less than the minimum or greater than the maximum value. The default value is 100.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # Represents a query (including filtering criteria, sorting criteria, or both) used to search
    # for customer profiles.
    CustomerQuery query?;
};

# Represents a set of `CustomerQuery` filters used to limit the set of
# customers returned by the [SearchCustomers](https://developer.squareup.com/reference/square_2021-08-18/customers-api/search-customers) endpoint.
public type CustomerFilter record {
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange created_at?;
    # The creation source filter.
    # 
    # If one or more creation sources are set, customer profiles are included in,
    # or excluded from, the result if they match at least one of the filter criteria.
    CustomerCreationSourceFilter creation_source?;
    # A filter to select customers based on exact or fuzzy matching of
    # customer attributes against a specified query. Depending on the customer attributes, 
    # the filter can be case-sensitive. This filter can be exact or fuzzy, but it cannot be both.
    CustomerTextFilter email_address?;
    # A filter to select resources based on an exact field value. For any given
    # value, the value can only be in one property. Depending on the field, either
    # all properties can be set or only a subset will be available.
    # 
    # Refer to the documentation of the field.
    FilterValue group_ids?;
    # A filter to select customers based on exact or fuzzy matching of
    # customer attributes against a specified query. Depending on the customer attributes, 
    # the filter can be case-sensitive. This filter can be exact or fuzzy, but it cannot be both.
    CustomerTextFilter phone_number?;
    # A filter to select customers based on exact or fuzzy matching of
    # customer attributes against a specified query. Depending on the customer attributes, 
    # the filter can be case-sensitive. This filter can be exact or fuzzy, but it cannot be both.
    CustomerTextFilter reference_id?;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange updated_at?;
};

# Defines the logic used to apply a workday filter.
public type ShiftWorkdayMatcher string;

# An object describing a job that a team member is assigned to.
public type JobAssignment record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money annual_rate?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money hourly_rate?;
    # The title of the job.
    @constraint:String {minLength: 1}
    string job_title;
    # The current pay type for the job assignment used to
    # calculate the pay amount in a pay period.
    string pay_type;
    # The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
    int weekly_hours?;
};

# 
public type V1CreateEmployeeRoleRequest record {
    # V1EmployeeRole
    V1EmployeeRole employee_role?;
};

# Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
public type ItemVariationLocationOverrides record {
    # If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type`
    # is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
    # 
    # This value is always an integer.
    int inventory_alert_threshold?;
    # Indicates whether the `CatalogItemVariation` displays an alert when its inventory
    # quantity is less than or equal to its `inventory_alert_threshold`.
    string inventory_alert_type?;
    # The ID of the `Location`. This can include locations that are deactivated.
    string location_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money price_money?;
    # The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`.
    string pricing_type?;
    # If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
    boolean track_inventory?;
};

# 
public type ObtainTokenRequest record {
    # The Square-issued ID of your application, available from the
    # [developer dashboard](https://developer.squareup.com/apps).
    @constraint:String {maxLength: 191}
    string client_id;
    # The Square-issued application secret for your application, available
    # from the [developer dashboard](https://developer.squareup.com/apps).
    @constraint:String {maxLength: 1024, minLength: 2}
    string client_secret;
    # The authorization code to exchange.
    # This is required if `grant_type` is set to `authorization_code`, to indicate that
    # the application wants to exchange an authorization code for an OAuth access token.
    @constraint:String {maxLength: 191}
    string code?;
    # Specifies the method to request an OAuth access token.
    # Valid values are: `authorization_code`, `refresh_token`, and `migration_token`
    @constraint:String {maxLength: 20, minLength: 10}
    string grant_type;
    # Legacy OAuth access token obtained using a Connect API version prior
    # to 2019-03-13. This parameter is required if `grant_type` is set to
    # `migration_token` to indicate that the application wants to get a replacement
    # OAuth access token. The response also returns a refresh token.
    # For more information, see [Migrate to Using Refresh Tokens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).
    @constraint:String {maxLength: 1024, minLength: 2}
    string migration_token?;
    # The redirect URL assigned in the [developer dashboard](https://developer.squareup.com/apps).
    @constraint:String {maxLength: 2048}
    string redirect_uri?;
    # A valid refresh token for generating a new OAuth access token.
    # A valid refresh token is required if `grant_type` is set to `refresh_token` , to indicate the application wants a replacement for an expired OAuth access token.
    @constraint:String {maxLength: 1024, minLength: 2}
    string refresh_token?;
    # A JSON list of strings representing the permissions the application is requesting.
    # For example: "`["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"]`"
    # The access token returned in the response is granted the permissions
    # that comprise the intersection between the requested list of permissions, and those
    # that belong to the provided refresh token.
    string[] scopes?;
    # A boolean indicating a request for a short-lived access token.
    # The short-lived access token returned in the response will expire in 24 hours.
    boolean short_lived?;
};

# 
public type DeleteCatalogObjectRequest record {
};

# A request to get a `BreakType` by ID.
public type GetBreakTypeRequest record {
};

# Represents an action performed on a gift card that affects its state or balance.
public type GiftCardActivity record {
    # Describes a gift card activity of the ACTIVATE type.
    GiftCardActivityActivate activate_activity_details?;
    # Describes a gift card activity of the ADJUST_DECREMENT type.
    GiftCardActivityAdjustDecrement adjust_decrement_activity_details?;
    # Describes a gift card activity of the ADJUST_INCREMENT type.
    GiftCardActivityAdjustIncrement adjust_increment_activity_details?;
    # Describes a gift card activity of the BLOCK type.
    GiftCardActivityBlock block_activity_details?;
    # Describes a gift card activity of the CLEAR_BALANCE type.
    GiftCardActivityClearBalance clear_balance_activity_details?;
    # The timestamp when the gift card activity was created, in RFC 3339 format.
    string created_at?;
    # Describes a gift card activity of the DEACTIVATE type.
    GiftCardActivityDeactivate deactivate_activity_details?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money gift_card_balance_money?;
    # The gift card GAN. The GAN is not required if `gift_card_id` is present.
    string gift_card_gan?;
    # The gift card ID. The ID is not required if a GAN is present.
    string gift_card_id?;
    # The unique ID of the gift card activity.
    string id?;
    # Describes a gift card activity of the IMPORT type and the `GiftCardGANSource` is OTHER 
    # (a third-party gift card).
    GiftCardActivityImport import_activity_details?;
    # Present only when GiftCardActivityType is IMPORT_REVERSAL and GiftCardGANSource is OTHER
    GiftCardActivityImportReversal import_reversal_activity_details?;
    # Present only when `GiftCardActivityType` is LOAD.
    GiftCardActivityLoad load_activity_details?;
    # The ID of the location at which the activity occurred.
    string location_id;
    # Present only when `GiftCardActivityType` is REDEEM.
    GiftCardActivityRedeem redeem_activity_details?;
    # Present only when `GiftCardActivityType` is REFUND.
    GiftCardActivityRefund refund_activity_details?;
    Type 'type;
    # Present only when `GiftCardActivityType` is UNBLOCK.
    GiftCardActivityUnblock unblock_activity_details?;
    # Present only when `GiftCardActivityType` is UNLINKED_ACTIVITY_REFUND.
    GiftCardActivityUnlinkedActivityRefund unlinked_activity_refund_activity_details?;
};

# Defines the valid parameters for requests to the `ListCustomerSegments` endpoint.
public type ListCustomerSegmentsRequest record {
    # A pagination cursor returned by previous calls to `ListCustomerSegments`.
    # This cursor is used to retrieve the next set of query results.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results. 
    # The limit is ignored if it is less than 1 or greater than 50. The default value is 50.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    @constraint:Int {minValue: 1, maxValue: 50}
    int 'limit?;
};

# 
public type RenewTokenResponse record {
    # The renewed access token.
    # This value might be different from the `access_token` you provided in your request.
    # You provide this token in a header with every request to Connect API endpoints.
    # See [Request and response headers](https://developer.squareup.com/docs/api/connect/v2/#requestandresponseheaders) for the format of this header.
    @constraint:String {maxLength: 1024, minLength: 2}
    string access_token?;
    # The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
    @constraint:String {maxLength: 48, minLength: 20}
    string expires_at?;
    # The ID of the authorizing merchant's business.
    @constraint:String {maxLength: 191, minLength: 8}
    string merchant_id?;
    # __LEGACY FIELD__. The ID of the subscription plan the merchant signed
    # up for. Only present if the merchant signed up for a subscription during
    # authorization.
    string plan_id?;
    # __LEGACY FIELD__. The ID of the merchant subscription associated with
    # the authorization. Only present if the merchant signed up for a subscription
    # during authorization..
    string subscription_id?;
    # This value is always _bearer_.
    @constraint:String {maxLength: 10, minLength: 2}
    string token_type?;
};

# Represents a filter used in a search for `TeamMember` objects. `AND` logic is applied
# between the individual fields, and `OR` logic is applied within list-based fields.
# For example, setting this filter value:
# ```
# filter = (locations_ids = ["A", "B"], status = ACTIVE)
# ```
# returns only active team members assigned to either location "A" or "B".
public type SearchTeamMembersFilter record {
    # When present, filters by team members assigned to the specified locations.
    # When empty, includes team members assigned to any location.
    string[] location_ids?;
    # When present, filters by team members who match the given status.
    # When empty, includes team members of all statuses.
    string status?;
};

# Indicates the card transaction's current status.
public type TenderCardDetailsStatus string;

# Describes a request to complete (capture) a payment using 
# [CompletePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/complete-payment).
# 
# By default, payments are set to `autocomplete` immediately after they are created.
# To complete payments manually, set `autocomplete` to `false`.
public type CompletePaymentRequest record {
};

# Present only when `GiftCardActivityType` is REDEEM.
public type GiftCardActivityRedeem record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # When the Square Payments API is used, Redeem is not called on the Gift Cards API.
    # However, when Square reads a Redeem activity from the Gift Cards API, developers need to know the
    # associated `payment_id`.
    string payment_id?;
    # A client-specified ID to associate an entity, in another system, with this gift card
    # activity. This can be used to track the order or payment related information when the Square Orders
    # API is not being used.
    string reference_id?;
};

# Represents a change in state or quantity of product inventory at a
# particular time and location.
public type InventoryAdjustment record {
    # 
    InventoryAdjustmentGroup adjustment_group?;
    # The Square-generated ID of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked.
    @constraint:String {maxLength: 100}
    string catalog_object_id?;
    # The [type](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked. Tracking is only
    # supported for the `ITEM_VARIATION` type.
    @constraint:String {maxLength: 14}
    string catalog_object_type?;
    # An RFC 3339-formatted timestamp that indicates when the inventory adjustment is received.
    @constraint:String {maxLength: 34}
    string created_at?;
    # The Square-generated ID of the [Employee](https://developer.squareup.com/reference/square_2021-08-18/objects/Employee) responsible for the
    # inventory adjustment.
    @constraint:String {maxLength: 100}
    string employee_id?;
    # The [inventory state](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryState) of the related quantity
    # of items before the adjustment.
    string from_state?;
    # The Square-generated ID of the goods receipt that caused the
    # adjustment. Only relevant for state transitions from the Square for Retail
    # app.
    @constraint:String {maxLength: 100}
    string goods_receipt_id?;
    # A unique ID generated by Square for the
    # `InventoryAdjustment`.
    @constraint:String {maxLength: 100}
    string id?;
    # The Square-generated ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the related
    # quantity of items is being tracked.
    @constraint:String {maxLength: 100}
    string location_id?;
    # A client-generated RFC 3339-formatted timestamp that indicates when
    # the inventory adjustment took place. For inventory adjustment updates, the `occurred_at`
    # timestamp cannot be older than 24 hours or in the future relative to the
    # time of the request.
    @constraint:String {maxLength: 34}
    string occurred_at?;
    # The Square-generated ID of the purchase order that caused the
    # adjustment. Only relevant for state transitions from the Square for Retail
    # app.
    @constraint:String {maxLength: 100}
    string purchase_order_id?;
    # The number of items affected by the adjustment as a decimal string.
    # Can support up to 5 digits after the decimal point.
    @constraint:String {maxLength: 26}
    string quantity?;
    # An optional ID provided by the application to tie the
    # `InventoryAdjustment` to an external
    # system.
    @constraint:String {maxLength: 255}
    string reference_id?;
    # The Square-generated ID of the [Refund][#type-refund] that
    # caused the adjustment. Only relevant for refund-related state
    # transitions.
    @constraint:String {maxLength: 255}
    string refund_id?;
    # Provides information about the application used to generate a change.
    SourceApplication 'source?;
    # The [inventory state](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryState) of the related quantity
    # of items after the adjustment.
    string to_state?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_price_money?;
    # The Square-generated ID of the [Transaction][#type-transaction] that
    # caused the adjustment. Only relevant for payment-related state
    # transitions.
    @constraint:String {maxLength: 255}
    string transaction_id?;
};

# 
public type BatchDeleteCatalogObjectsRequest record {
    # The IDs of the CatalogObjects to be deleted. When an object is deleted, other objects
    # in the graph that depend on that object will be deleted as well (for example, deleting a
    # CatalogItem will delete its CatalogItemVariation.
    string[] object_ids?;
};

# Defines the body parameters that can be included in
# a request to the [CreateRefund](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/create-refund) endpoint.
# 
# Deprecated - recommend using [RefundPayment](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/refund-payment)
public type CreateRefundRequest record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # A value you specify that uniquely identifies this
    # refund among refunds you've created for the tender.
    # 
    # If you're unsure whether a particular refund succeeded,
    # you can reattempt it with the same idempotency key without
    # worrying about duplicating the refund.
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/working-with-apis/idempotency) for more information.
    @constraint:String {maxLength: 192, minLength: 1}
    string idempotency_key;
    # A description of the reason for the refund.
    # 
    # Default value: `Refund via API`
    @constraint:String {maxLength: 192}
    string reason?;
    # The ID of the tender to refund.
    # 
    # A [`Transaction`](https://developer.squareup.com/reference/square_2021-08-18/objects/Transaction) has one or more `tenders` (i.e., methods
    # of payment) associated with it, and you refund each tender separately with
    # the Connect API.
    @constraint:String {maxLength: 192, minLength: 1}
    string tender_id;
};

# Response object returned by `GetBankAccount`.
public type GetBankAccountResponse record {
    # Represents a bank account. For more information about 
    # linking a bank account to a Square account, see 
    # [Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api).
    BankAccount bank_account?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# A request to retrieve the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram) that belongs to a seller. A seller can have only one loyalty program.
public type RetrieveLoyaltyProgramRequest record {
};

# Describes a `UpdateInvoice` response.
public type UpdateInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice?;
};

# Describes query criteria for searching invoices.
public type InvoiceQuery record {
    # Describes query filters to apply.
    InvoiceFilter filter;
    # Identifies the sort field and sort order.
    InvoiceSort sort?;
};

# Represents a `ListSites` request.
public type ListSitesRequest record {
};

# 
public type ListEmployeesRequest record {
    # The token required to retrieve the specified page of results.
    string cursor?;
    # The number of employees to be returned on each page.
    int 'limit?;
    # 
    string location_id?;
    # Specifies the EmployeeStatus to filter the employee by.
    string status?;
};

# The status of the domain registration.
public type RegisterDomainResponseStatus string;

# 
public type V1ListPaymentsResponse record {
    # 
    V1Payment[] items?;
};

# Defines fields that are included in a
# [CancelSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/cancel-subscription) response.
public type CancelSubscriptionResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# A filter to select resources based on an exact field value. For any given
# value, the value can only be in one property. Depending on the field, either
# all properties can be set or only a subset will be available.
# 
# Refer to the documentation of the field.
public type FilterValue record {
    # A list of terms that must be present on the field of the resource.
    string[] all?;
    # A list of terms where at least one of them must be present on the
    # field of the resource.
    string[] 'any?;
    # A list of terms that must not be present on the field the resource
    string[] none?;
};

# Defines the fields that are included in the response body of a request to the
# [PayOrder](https://developer.squareup.com/reference/square_2021-08-18/orders-api/pay-order) endpoint.
public type PayOrderResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# Filter events by loyalty account.
public type LoyaltyEventLoyaltyAccountFilter record {
    # The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyAccount) associated with loyalty events.
    @constraint:String {minLength: 1}
    string loyalty_account_id;
};

# A list of modifiers applicable to items at the time of sale.
# 
# For example, a "Condiments" modifier list applicable to a "Hot Dog" item
# may contain "Ketchup", "Mustard", and "Relish" modifiers.
# Use the `selection_type` field to specify whether or not multiple selections from
# the modifier list are allowed.
public type CatalogModifierList record {
    # The options included in the `CatalogModifierList`.
    # You must include at least one `CatalogModifier`.
    # Each CatalogObject must have type `MODIFIER` and contain
    # `CatalogModifier` data.
    CatalogObject[] modifiers?;
    # The name for the `CatalogModifierList` instance. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
    # Determines where this modifier list appears in a list of `CatalogModifierList` values.
    int ordinal?;
    # Indicates whether multiple options from the modifier list
    # can be applied to a single `CatalogItem`.
    string selection_type?;
};

# 
public type DisputeEvidenceCreatedWebhookData record {
    # ID of the affected dispute.
    string id?;
    # 
    DisputeEvidenceCreatedWebhookObject 'object?;
    # Name of the affected dispute's type.
    string 'type?;
};

# 
public type V1UpdateEmployeeRoleRequest record {
    # V1EmployeeRole
    V1EmployeeRole body;
};

# 
public type CreateTerminalRefundRequest record {
    # A unique string that identifies this `CreateRefund` request. Keys can be any valid string but
    # must be unique for every `CreateRefund` request.
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {minLength: 1}
    string idempotency_key;
    # 
    TerminalRefund refund?;
};

# Defines the fields that are included in the request body of
# a request to the [RemoveGroupFromCustomer](https://developer.squareup.com/reference/square_2021-08-18/customers-api/remove-group-from-customer) endpoint.
public type RemoveGroupFromCustomerRequest record {
};

# A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
public type CatalogQuickAmountsSettings record {
    # Represents a set of Quick Amounts at this location.
    CatalogQuickAmount[] amounts?;
    # Represents location's eligibility for auto amounts
    # The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
    boolean eligible_for_auto_amounts?;
    # Represents the option seller currently uses on Quick Amounts.
    string option;
};

# Filter events by the order associated with the event.
public type LoyaltyEventOrderFilter record {
    # The ID of the [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) associated with the event.
    @constraint:String {minLength: 1}
    string order_id;
};

# Defines the fields that are included in the response body for requests to the `RetrieveCustomerSegment` endpoint.
# 
# Either `errors` or `segment` is present in a given response (never both).
public type RetrieveCustomerSegmentResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a group of customer profiles that match one or more predefined filter criteria. 
    # 
    # Segments (also known as Smart Groups) are defined and created within the Customer Directory in the
    # Square Seller Dashboard or Point of Sale.
    CustomerSegment segment?;
};

# Contains the name and abbreviation for standard measurement unit.
public type StandardUnitDescription record {
    # UI display abbreviation for the measurement unit. For example, 'lb'.
    string abbreviation?;
    # UI display name of the measurement unit. For example, 'Pound'.
    string name?;
    # Represents a unit of measurement to use with a quantity, such as ounces
    # or inches. Exactly one of the following fields are required: `custom_unit`,
    # `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
    MeasurementUnit unit?;
};

# Describes a loyalty account. For more information, see
# [Manage Loyalty Accounts Using the Loyalty API](https://developer.squareup.com/docs/loyalty-api/overview).
public type LoyaltyAccount record {
    # The available point balance in the loyalty account. If points are scheduled to expire, they are listed in the `expiring_point_deadlines` field.
    # 
    # Your application should be able to handle loyalty accounts that have a negative point balance (`balance` is less than 0). This might occur if a seller makes a manual adjustment or as a result of a refund or exchange.
    int balance?;
    # The timestamp when the loyalty account was created, in RFC 3339 format.
    string created_at?;
    # The Square-assigned ID of the [customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) that is associated with the account.
    string customer_id?;
    # The timestamp when enrollment occurred, in RFC 3339 format.
    string enrolled_at?;
    # The schedule for when points expire in the loyalty account balance. This field is present only if the account has points that are scheduled to expire. 
    # 
    # The total number of points in this field equals the number of points in the `balance` field.
    LoyaltyAccountExpiringPointDeadline[] expiring_point_deadlines?;
    # The Square-assigned ID of the loyalty account.
    @constraint:String {maxLength: 36}
    string id?;
    # The total points accrued during the lifetime of the account.
    int lifetime_points?;
    # Represents the mapping that associates a loyalty account with a buyer. 
    # 
    # Currently, a loyalty account can only be mapped to a buyer by phone number. For more information, see 
    # [Loyalty Overview](https://developer.squareup.com/docs/loyalty/overview).
    LoyaltyAccountMapping mapping?;
    # The Square-assigned ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram) to which the account belongs.
    @constraint:String {maxLength: 36, minLength: 1}
    string program_id;
    # The timestamp when the loyalty account was last updated, in RFC 3339 format.
    string updated_at?;
};

# A request to delete a `Shift`.
public type DeleteShiftRequest record {
};

# Defines the fields that are included in requests to the
# [PayOrder](https://developer.squareup.com/reference/square_2021-08-18/orders-api/pay-order) endpoint.
public type PayOrderRequest record {
    # A value you specify that uniquely identifies this request among requests you have sent. If
    # you are unsure whether a particular payment request was completed successfully, you can reattempt
    # it with the same idempotency key without worrying about duplicate payments.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 192, minLength: 1}
    string idempotency_key;
    # The version of the order being paid. If not supplied, the latest version will be paid.
    int order_version?;
    # The IDs of the [payments](https://developer.squareup.com/reference/square_2021-08-18/objects/Payment) to collect.
    # The payment total must match the order total.
    string[] payment_ids?;
};

# A filter based on the order `customer_id` and any tender `customer_id`
# associated with the order. It does not filter based on the
# [FulfillmentRecipient](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderFulfillmentRecipient) `customer_id`.
public type SearchOrdersCustomerFilter record {
    # A list of customer IDs to filter by.
    # 
    # Max: 10 customer IDs.
    string[] customer_ids?;
};

# The range of a number value between the specified lower and upper bounds.
public type Range record {
    # The upper bound of the number range.
    string max?;
    # The lower bound of the number range.
    string min?;
};

# Defines the fields that are included in the response body of
# a request to the [CreateCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/create-customer-group) endpoint.
# 
# Either `errors` or `group` is present in a given response (never both).
public type CreateCustomerGroupResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a group of customer profiles. 
    # 
    # Customer groups can be created, be modified, and have their membership defined using 
    # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
    CustomerGroup group?;
};

# 
public type CreateTerminalCheckoutResponse record {
    # 
    TerminalCheckout checkout?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# Represents a payment processed by the Square API.
public type Payment record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money app_fee_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money approved_money?;
    # Additional details about BANK_ACCOUNT type payments.
    BankAccountPaymentDetails bank_account_details?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address billing_address?;
    # The buyer's email address.
    @constraint:String {maxLength: 255}
    string buyer_email_address?;
    # Actions that can be performed on this payment:
    # - `EDIT_AMOUNT_UP` - The payment amount can be edited up.
    # - `EDIT_AMOUNT_DOWN` - The payment amount can be edited down.
    # - `EDIT_TIP_AMOUNT_UP` - The tip amount can be edited up.
    # - `EDIT_TIP_AMOUNT_DOWN` - The tip amount can be edited down.
    string[] capabilities?;
    # Reflects the current status of a card payment. Contains only non-confidential information.
    CardPaymentDetails card_details?;
    # Stores details about a cash payment. Contains only non-confidential information. For more information, see 
    # [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
    CashPaymentDetails cash_details?;
    # The timestamp of when the payment was created, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string created_at?;
    # The [Customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) ID of the customer associated with the payment.
    @constraint:String {maxLength: 191}
    string customer_id?;
    # The action to be applied to the payment when the `delay_duration` has elapsed. This field
    # is read-only.
    # 
    # Current values include `CANCEL`.
    string delay_action?;
    # The duration of time after the payment's creation when Square automatically applies the
    # `delay_action` to the payment. This automatic `delay_action` applies only to payments that
    # do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration`
    # time period.
    # 
    # This field is specified as a time duration, in RFC 3339 format.
    # 
    # Notes:
    # This feature is only supported for card payments.
    # 
    # Default:
    # 
    # - Card-present payments: "PT36H" (36 hours) from the creation time.
    # - Card-not-present payments: "P7D" (7 days) from the creation time.
    string delay_duration?;
    # The read-only timestamp of when the `delay_action` is automatically applied,
    # in RFC 3339 format.
    # 
    # Note that this field is calculated by summing the payment's `delay_duration` and `created_at`
    # fields. The `created_at` field is generated by Square and might not exactly match the
    # time on your local machine.
    string delayed_until?;
    # An optional ID of the employee associated with taking the payment.
    @constraint:String {maxLength: 192}
    string employee_id?;
    # Stores details about an external payment. Contains only non-confidential information.
    # For more information, see 
    # [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
    ExternalPaymentDetails external_details?;
    # A unique ID for the payment.
    @constraint:String {maxLength: 192}
    string id?;
    # The ID of the location associated with the payment.
    @constraint:String {maxLength: 50}
    string location_id?;
    # An optional note to include when creating a payment.
    @constraint:String {maxLength: 500}
    string note?;
    # The ID of the order associated with the payment.
    @constraint:String {maxLength: 192}
    string order_id?;
    # The processing fees and fee adjustments assessed by Square for this payment.
    ProcessingFee[] processing_fee?;
    # The payment's receipt number.
    # The field is missing if a payment is canceled.
    @constraint:String {maxLength: 4}
    string receipt_number?;
    # The URL for the payment's receipt.
    # The field is only populated for COMPLETED payments.
    @constraint:String {maxLength: 255}
    string receipt_url?;
    # An optional ID that associates the payment with an entity in
    # another system.
    @constraint:String {maxLength: 40}
    string reference_id?;
    # A list of `refund_id`s identifying refunds for the payment.
    string[] refund_ids?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money refunded_money?;
    # Represents fraud risk information for the associated payment.
    # 
    # When you take a payment through Square's Payments API (using the `CreatePayment`
    # endpoint), Square evaluates it and assigns a risk level to the payment. Sellers
    # can use this information to determine the course of action (for example,
    # provide the goods/services or refund the payment).
    RiskEvaluation risk_evaluation?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address shipping_address?;
    # The source type for this payment.
    # 
    # Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, or `EXTERNAL`.
    @constraint:String {maxLength: 50}
    string source_type?;
    # Additional payment information that gets added to the customer's card statement
    # as part of the statement description.
    # 
    # Note that the `statement_description_identifier` might get truncated on the statement description
    # to fit the required information including the Square identifier (SQ *) and the name of the
    # seller taking the payment.
    string statement_description_identifier?;
    # Indicates whether the payment is APPROVED, PENDING, COMPLETED, CANCELED, or FAILED.
    @constraint:String {maxLength: 50}
    string status?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money tip_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # The timestamp of when the payment was last updated, in RFC 3339 format.
    @constraint:String {maxLength: 32}
    string updated_at?;
    # Used for optimistic concurrency. This opaque token identifies a specific version of the
    # `Payment` object.
    string version_token?;
    # Additional details about `WALLET` type payments. Contains only non-confidential information.
    DigitalWalletDetails wallet_details?;
};

public type InfoCode anydata;

# 
public type ListCatalogResponse record {
    # The pagination cursor to be used in a subsequent request. If unset, this is the final response.
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The CatalogObjects returned.
    CatalogObject[] objects?;
};

# 
public type RetrieveCatalogObjectRequest record {
    # Requests objects as of a specific version of the catalog. This allows you to retrieve historical
    # versions of objects. The value to retrieve a specific version of an object can be found
    # in the version field of [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject)s.
    int catalog_version?;
    # If `true`, the response will include additional objects that are related to the
    # requested object, as follows:
    # 
    # If the `object` field of the response contains a `CatalogItem`, its associated
    # `CatalogCategory`, `CatalogTax`, `CatalogImage` and `CatalogModifierList` objects will
    # be returned in the `related_objects` field of the response. If the `object` field of
    # the response contains a `CatalogItemVariation`, its parent `CatalogItem` will be returned
    # in the `related_objects` field of the response.
    # 
    # Default value: `false`
    boolean include_related_objects?;
};

# Describes a gift card activity of the ADJUST_INCREMENT type.
public type GiftCardActivityAdjustIncrement record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    Reason reason;
};

# 
public type ListTeamMemberBookingProfilesRequest record {
    # Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
    boolean bookable_only?;
    # The cursor for paginating through the results.
    string cursor?;
    # The maximum number of results to return.
    int 'limit?;
    # Indicates whether to include only team members enabled at the given location in the returned result.
    string location_id?;
};

# Creates a card from the source (nonce, payment id, etc). Accessible via
# HTTP requests at POST https://connect.squareup.com/v2/cards
public type CreateCardRequest record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card;
    # A unique string that identifies this CreateCard request. Keys can be
    # any valid string and must be unique for every request.
    # 
    # Max: 45 characters
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {minLength: 1}
    string idempotency_key;
    # The ID of the source which represents the card information to be stored. This can be a card nonce or a payment id.
    @constraint:String {maxLength: 16384, minLength: 1}
    string source_id;
    # An identifying token generated by [Payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
    # Verification tokens encapsulate customer device information and 3-D Secure
    # challenge results to indicate that Square has verified the buyer identity.
    # 
    # See the [SCA Overview](https://developer.squareup.com/docs/sca-overview).
    string verification_token?;
};

# 
public type CancelTerminalRefundResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # 
    TerminalRefund refund?;
};

# The service appointment settings, including where and how the service is provided.
public type BusinessAppointmentSettings record {
    # The time unit of the service duration for bookings.
    string alignment_time?;
    # Indicates whether a customer can choose from all available time slots and have a staff member assigned
    # automatically (`true`) or not (`false`).
    boolean any_team_member_booking_enabled?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money cancellation_fee_money?;
    # The cancellation policy adopted by the seller.
    string cancellation_policy?;
    # The free-form text of the seller's cancellation policy.
    string cancellation_policy_text?;
    # The cut-off time in seconds for allowing clients to cancel or reschedule an appointment.
    int cancellation_window_seconds?;
    # Types of the location allowed for bookings.
    string[] location_types?;
    # The maximum number of daily appointments per team member or per location.
    int max_appointments_per_day_limit?;
    # Indicates whether the daily appointment limit applies to team members or to
    # business locations.
    string max_appointments_per_day_limit_type?;
    # The maximum lead time in seconds before a service can be booked. Bookings must be created at most this far ahead of the booking's starting time.
    int max_booking_lead_time_seconds?;
    # The minimum lead time in seconds before a service can be booked. Bookings must be created at least this far ahead of the booking's starting time.
    int min_booking_lead_time_seconds?;
    # Indicates whether a customer can book multiple services in a single online booking.
    boolean multiple_service_booking_enabled?;
    # Indicates whether customers has an assigned staff member (`true`) or can select s staff member of their choice (`false`).
    boolean skip_booking_flow_staff_selection?;
};

# Defines the fields that are included in the response body of
# a request to the [RegisterDomain](https://developer.squareup.com/reference/square_2021-08-18/apple-pay-api/register-domain) endpoint.
# 
# Either `errors` or `status` are present in a given response (never both).
public type RegisterDomainResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The status of the domain registration.
    # 
    # See [RegisterDomainResponseStatus](https://developer.squareup.com/reference/square_2021-08-18/enums/RegisterDomainResponseStatus) for possible values.
    string status?;
};

# 
public type ListCashDrawerShiftsResponse record {
    # Opaque cursor for fetching the next page of results. Cursor is not
    # present in the last page of results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # A collection of CashDrawerShiftSummary objects for shifts that match
    # the query.
    CashDrawerShiftSummary[] items?;
};

# A request to create a new `BreakType`.
public type CreateBreakTypeRequest record {
    # A defined break template that sets an expectation for possible `Break`
    # instances on a `Shift`.
    BreakType break_type;
    # A unique string value to ensure the idempotency of the operation.
    @constraint:String {maxLength: 128}
    string idempotency_key?;
};

# Describes a `GetInvoice` response.
public type GetInvoiceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice?;
};

# 
public type TerminalRefundQuerySort record {
    # The order in which results are listed.
    # - `ASC` - Oldest to newest.
    # - `DESC` - Newest to oldest (default).
    string sort_order?;
};

# Represents a group of customer profiles that match one or more predefined filter criteria. 
# 
# Segments (also known as Smart Groups) are defined and created within the Customer Directory in the
# Square Seller Dashboard or Point of Sale.
public type CustomerSegment record {
    # The timestamp when the segment was created, in RFC 3339 format.
    string created_at?;
    # A unique Square-generated ID for the segment.
    @constraint:String {maxLength: 255}
    string id?;
    # The name of the segment.
    string name;
    # The timestamp when the segment was last updated, in RFC 3339 format.
    string updated_at?;
};

# Represents an error encountered during a request to the Connect API.
# 
# See [Handling errors](https://developer.squareup.com/docs/build-basics/handling-errors) for more information.
public type Error record {
    # The high-level category for the error.
    string category;
    # The specific code of the error.
    string code;
    # A human-readable description of the error for debugging purposes.
    string detail?;
    # The name of the field provided in the original request (if any) that
    # the error pertains to.
    string 'field?;
};

# A request for a filtered set of `BreakType` objects.
public type ListBreakTypesRequest record {
    # A pointer to the next page of `BreakType` results to fetch.
    string cursor?;
    # The maximum number of `BreakType` results to return per page. The number can range between 1
    # and 200. The default is 200.
    @constraint:Int {minValue: 1, maxValue: 200}
    int 'limit?;
    # Filter the returned `BreakType` results to only those that are associated with the
    # specified location.
    string location_id?;
};

# Represents a reward that can be applied to an order if the necessary
# reward tier criteria are met. Rewards are created through the Loyalty API.
public type OrderReward record {
    # The identifier of the reward.
    @constraint:String {minLength: 1}
    string id;
    # The identifier of the reward tier corresponding to this reward.
    @constraint:String {minLength: 1}
    string reward_tier_id;
};

# 
public type ListCashDrawerShiftEventsResponse record {
    # Opaque cursor for fetching the next page. Cursor is not present in
    # the last page of results.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # All of the events (payments, refunds, etc.) for a cash drawer during
    # the shift.
    CashDrawerShiftEvent[] events?;
};

# Describes a gift card activity of the ACTIVATE type.
public type GiftCardActivityActivate record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Required if your application does not use the Square Orders API. 
    # This is a list of client-provided payment instrument IDs. 
    # Square uses this information to perform compliance checks.
    # If you use the Square Orders API, Square has the necessary instrument IDs to perform necessary 
    # compliance checks.
    string[] buyer_payment_instrument_ids?;
    # The `line_item_uid` of the gift card line item in an order. 
    # This is required if your application uses the Square Orders API.
    string line_item_uid?;
    # The ID of the order associated with the activity. 
    # This is required if your application uses the Square Orders API.
    string order_id?;
    # If your application does not use the Square Orders API, you can optionally use this field 
    # to associate the gift card activity with a client-side entity.
    string reference_id?;
};

# Policies for accepting bookings.
public type BusinessBookingProfileBookingPolicy string;

# Represents a phone number.
public type V1PhoneNumber record {
    # The phone number's international calling code. For US phone numbers, this value is +1.
    string calling_code;
    # The phone number.
    string number;
};

# A [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
public type CatalogItem record {
    # The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used.
    # This attribute is searchable, and its value length is of Unicode code points.
    @constraint:String {maxLength: 24}
    string abbreviation?;
    # If `true`, the item can be added to electronically fulfilled orders from the merchant's online store.
    boolean available_electronically?;
    # If `true`, the item can be added to pickup orders from the merchant's online store.
    boolean available_for_pickup?;
    # If `true`, the item can be added to shipping orders from the merchant's online store.
    boolean available_online?;
    # The ID of the item's category, if any.
    string category_id?;
    # The item's description. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 4096}
    string description?;
    # List of item options IDs for this item. Used to manage and group item
    # variations in a specified order.
    # 
    # Maximum: 6 item options.
    CatalogItemOptionForItem[] item_options?;
    # The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code.
    string label_color?;
    # A set of `CatalogItemModifierListInfo` objects
    # representing the modifier lists that apply to this item, along with the overrides and min
    # and max limits that are specific to this item. Modifier lists
    # may also be added to or deleted from an item using `UpdateItemModifierLists`.
    CatalogItemModifierListInfo[] modifier_list_info?;
    # The item's name. This is a searchable attribute for use in applicable query filters, its value must not be empty, and the length is of Unicode code points.
    @constraint:String {maxLength: 512}
    string name?;
    # The product type of the item. May not be changed once an item has been created.
    # 
    # Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product
    # types are read-only.
    string product_type?;
    # If `false`, the Square Point of Sale app will present the `CatalogItem`'s
    # details screen immediately, allowing the merchant to choose `CatalogModifier`s
    # before adding the item to the cart.  This is the default behavior.
    # 
    # If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected
    # modifiers, and merchants can edit modifiers by drilling down onto the item's details.
    # 
    # Third-party clients are encouraged to implement similar behaviors.
    boolean skip_modifier_screen?;
    # A name to sort the item by. If this name is unspecified, namely, the `sort_name` field is absent, the regular `name` field is used for sorting.
    # 
    # It is currently supported for sellers of the Japanese locale only.
    string sort_name?;
    # A set of IDs indicating the taxes enabled for
    # this item. When updating an item, any taxes listed here will be added to the item.
    # Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
    string[] tax_ids?;
    # A list of [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogItemVariation) objects for this item. An item must have
    # at least one variation.
    CatalogObject[] variations?;
};

# Supported custom attribute query expressions for calling the
# [SearchCatalogItems](https://developer.squareup.com/reference/square_2021-08-18/catalog-api/search-catalog-items)
# endpoint to search for items or item variations.
public type CustomAttributeFilter record {
    # A query expression to filter items or item variations by matching their custom attributes'
    # `boolean_value` property values
    # against the specified Boolean expression.
    boolean bool_filter?;
    # A query expression to filter items or item variations by matching their custom attributes'
    # `custom_attribute_definition_id`
    # property value against the the specified id.
    string custom_attribute_definition_id?;
    # A query expression to filter items or item variations by matching their custom attributes'
    # `key` property value against
    # the specified key.
    string 'key?;
    # The range of a number value between the specified lower and upper bounds.
    Range number_filter?;
    # A query expression to filter items or item variations by matching  their custom attributes'
    # `selection_uid_values`
    # values against the specified selection uids.
    string[] selection_uids_filter?;
    # A query expression to filter items or item variations by matching their custom attributes'
    # `string_value`  property value
    # against the specified text.
    string string_filter?;
};

# Represents Square-estimated quantity of items in a particular state at a
# particular seller location based on the known history of physical counts and
# inventory adjustments.
public type InventoryCount record {
    # An RFC 3339-formatted timestamp that indicates when the most recent physical count or adjustment affecting
    # the estimated count is received.
    @constraint:String {maxLength: 34}
    string calculated_at?;
    # The Square-generated ID of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked.
    @constraint:String {maxLength: 100}
    string catalog_object_id?;
    # The [type](https://developer.squareup.com/reference/square_2021-08-18/enums/CatalogObjectType) of the
    # [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) being tracked. Tracking is only
    # supported for the `ITEM_VARIATION` type.
    @constraint:String {maxLength: 14}
    string catalog_object_type?;
    # Whether the inventory count is for composed variation (TRUE) or not (FALSE). If true, the inventory count will not be present in the response of
    # any of these endpoints: [BatchChangeInventory](https://developer.squareup.com/reference/square_2021-08-18/inventory-api/batch-change-inventory), 
    # [BatchRetrieveInventoryChanges](https://developer.squareup.com/reference/square_2021-08-18/inventory-api/batch-retrieve-inventory-changes), 
    # [BatchRetrieveInventoryCounts](https://developer.squareup.com/reference/square_2021-08-18/inventory-api/batch-retrieve-inventory-counts), and 
    # [RetrieveInventoryChanges](https://developer.squareup.com/reference/square_2021-08-18/inventory-api/retrieve-inventory-changes).
    boolean is_estimated?;
    # The Square-generated ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the related
    # quantity of items is being tracked.
    @constraint:String {maxLength: 100}
    string location_id?;
    # The number of items affected by the estimated count as a decimal string.
    # Can support up to 5 digits after the decimal point.
    @constraint:String {maxLength: 26}
    string quantity?;
    # The current [inventory state](https://developer.squareup.com/reference/square_2021-08-18/enums/InventoryState) for the related
    # quantity of items.
    string state?;
};

# 
public type GetTerminalCheckoutResponse record {
    # 
    TerminalCheckout checkout?;
    # Information about errors encountered during the request.
    Error[] errors?;
};

# 
public type RetrieveInventoryCountRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # The [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) IDs to look up as a comma-separated
    # list. An empty list queries all locations.
    string location_ids?;
};

# 
public type V1CreateRefundRequestType string;

# Describes a `SearchInvoices` response.
public type SearchInvoicesResponse record {
    # When a response is truncated, it includes a cursor that you can use in a 
    # subsequent request to fetch the next set of invoices. If empty, this is the final 
    # response. 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The list of invoices returned by the search.
    Invoice[] invoices?;
};

# Defines the valid parameters for requests to the `RetrieveCustomerSegmentRequest` endpoint.
public type RetrieveCustomerSegmentRequest record {
};

# Indicates the automatic payment method for an [invoice payment request](https://developer.squareup.com/reference/square_2021-08-18/objects/InvoicePaymentRequest).
public type InvoiceAutomaticPaymentSource string;

# Represents the details of a tender with `type` `CASH`.
public type TenderCashDetails record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money buyer_tendered_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money change_back_money?;
};

# 
public type MerchantStatus string;

# A query filter to search for availabilities by.
public type SearchAvailabilityFilter record {
    # The query expression to search for availabilities for an existing booking by matching the specified `booking_id` value.
    # This is commonly used to reschedule an appointment.
    # If this expression is specified, the `location_id` and `segment_filters` expressions are not allowed.
    string booking_id?;
    # The query expression to search for availabilities matching the specified seller location IDs.
    # This query expression is not applicable when `booking_id` is present.
    string location_id?;
    # The list of segment filters to apply. A query with `n` segment filters returns availabilities with `n` segments per
    # availability. It is not applicable when `booking_id` is present.
    SegmentFilter[] segment_filters?;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange start_at_range;
};

# Enumerates the `Shift` fields to sort on.
public type ShiftSortField string;

# Represents a response from a create request containing the created `TeamMember` object or error messages.
public type CreateTeamMemberResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # A record representing an individual team member for a business.
    TeamMember team_member?;
};

# Provides customer data that Square uses to deliver an invoice.
public type InvoiceRecipient record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The name of the recipient's company.
    string company_name?;
    # The ID of the customer. This is the customer profile ID that 
    # you provide when creating a draft invoice.
    @constraint:String {maxLength: 255, minLength: 1}
    string customer_id?;
    # The recipient's email address.
    string email_address?;
    # The recipient's family (that is, last) name.
    string family_name?;
    # The recipient's given (that is, first) name.
    string given_name?;
    # The recipient's phone number.
    string phone_number?;
};

# Defines the response returned by [CreatePayment](https://developer.squareup.com/reference/square_2021-08-18/payments-api/create-payment).
# 
# If there are errors processing the request, the `payment` field might not be
# present, or it might be present with a status of `FAILED`.
public type CreatePaymentResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a payment processed by the Square API.
    Payment payment?;
};

# The query filter to return the search result by exact match of the specified attribute name and value.
public type CatalogQueryExact record {
    # The name of the attribute to be searched. Matching of the attribute name is exact.
    @constraint:String {minLength: 1}
    string attribute_name;
    # The desired value of the search attribute. Matching of the attribute value is case insensitive and can be partial.
    # For example, if a specified value of "sma", objects with the named attribute value of "Small", "small" are both matched.
    string attribute_value;
};

# 
public type GiftCardActivityBlockReason string;

# Square Checkout lets merchants accept online payments for supported
# payment types using a checkout workflow hosted on squareup.com.
public type Checkout record {
    # Additional recipients (other than the merchant) receiving a portion of this checkout.
    # For example, fees assessed on the purchase by a third party integration.
    AdditionalRecipient[] additional_recipients?;
    # If `true`, Square Checkout will collect shipping information on your
    # behalf and store that information with the transaction information in your
    # Square Dashboard.
    # 
    # Default: `false`.
    boolean ask_for_shipping_address?;
    # The URL that the buyer's browser should be redirected to after the
    # checkout is completed.
    string checkout_page_url?;
    # The time when the checkout was created, in RFC 3339 format.
    string created_at?;
    # ID generated by Square Checkout when a new checkout is requested.
    string id?;
    # The email address to display on the Square Checkout confirmation page
    # and confirmation email that the buyer can use to contact the merchant.
    # 
    # If this value is not set, the confirmation page and email will display the
    # primary email address associated with the merchant's Square account.
    # 
    # Default: none; only exists if explicitly set.
    string merchant_support_email?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
    # If provided, the buyer's email is pre-populated on the checkout page
    # as an editable text field.
    # 
    # Default: none; only exists if explicitly set.
    string pre_populate_buyer_email?;
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address pre_populate_shipping_address?;
    # The URL to redirect to after checkout is completed with `checkoutId`,
    # Square's `orderId`, `transactionId`, and `referenceId` appended as URL
    # parameters. For example, if the provided redirect_url is
    # `http://www.example.com/order-complete`, a successful transaction redirects
    # the customer to:
    # 
    # <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>
    # 
    # If you do not provide a redirect URL, Square Checkout will display an order
    # confirmation page on your behalf; however Square strongly recommends that
    # you provide a redirect URL so you can verify the transaction results and
    # finalize the order through your existing/normal confirmation workflow.
    string redirect_url?;
};

# 
public type CreateTerminalCheckoutRequest record {
    # 
    TerminalCheckout checkout;
    # A unique string that identifies this `CreateCheckout` request. Keys can be any valid string but
    # must be unique for every `CreateCheckout` request.
    # 
    # See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {maxLength: 64, minLength: 1}
    string idempotency_key;
};

# Defines the response returned by 
# [CancelPaymentByIdempotencyKey](https://developer.squareup.com/reference/square_2021-08-18/payments-api/cancel-payment-by-idempotency-key).
# On success, `errors` is empty.
public type CancelPaymentByIdempotencyKeyResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines the fields that are included in the response body of
# a request to the [UpdateCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/update-customer-group) endpoint.
# 
# Either `errors` or `group` is present in a given response (never both).
public type UpdateCustomerGroupResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a group of customer profiles. 
    # 
    # Customer groups can be created, be modified, and have their membership defined using 
    # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
    CustomerGroup group?;
};

# Request object for the [ListMerchant](https://developer.squareup.com/reference/square_2021-08-18/merchants-api/list-merchants) endpoint.
public type ListMerchantsRequest record {
    # The cursor generated by the previous response.
    int cursor?;
};

# Provides metadata when the event `type` is `DELETE_REWARD`.
public type LoyaltyEventDeleteReward record {
    # The ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_program_id;
    # The number of points returned to the loyalty account.
    int points;
    # The ID of the deleted [loyalty reward](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyReward).
    # This field is returned only if the event source is `LOYALTY_API`.
    @constraint:String {maxLength: 36}
    string reward_id?;
};

# Response object returned by ListBankAccounts.
public type ListBankAccountsResponse record {
    # List of BankAccounts associated with this account.
    BankAccount[] bank_accounts?;
    # When a response is truncated, it includes a cursor that you can 
    # use in a subsequent request to fetch next set of bank accounts.
    # If empty, this is the final response.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# 
public type RetrieveBusinessBookingProfileRequest record {
};

# 
public type OnboardAppointmentsRequest record {
};

# Defines the fields that are included in requests to the
# `DeleteCustomerCard` endpoint.
public type DeleteCustomerCardRequest record {
};

# A request to calculate the points that a buyer can earn from 
# a specified purchase.
public type CalculateLoyaltyPointsRequest record {
    # The [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) ID for which to calculate the points.
    # Specify this field if your application uses the Orders API to process orders.
    # Otherwise, specify the `transaction_amount_money`.
    string order_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money transaction_amount_money?;
};

# Defines the query parameters that can be included in a request to the
# `ListCustomers` endpoint.
public type ListCustomersRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for your original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results. 
    # The limit is ignored if it is less than 1 or greater than 100. The default value is 100.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # Indicates how customers should be sorted.
    # 
    # The default value is `DEFAULT`.
    string sort_field?;
    # Indicates whether customers should be sorted in ascending (`ASC`) or
    # descending (`DESC`) order.
    # 
    # The default value is `ASC`.
    string sort_order?;
};

# Indicates whether Square should alert the merchant when the inventory quantity of a CatalogItemVariation is low.
public type InventoryAlertType string;

# Determines the type of a specific Quick Amount.
public type CatalogQuickAmountType string;

# 
public type BatchDeleteCatalogObjectsResponse record {
    # The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this deletion in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
    string deleted_at?;
    # The IDs of all CatalogObjects deleted by this request.
    string[] deleted_object_ids?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Pricing options for an order. The options affect how the order's price is calculated.
# They can be used, for example, to apply automatic price adjustments that are based on preconfigured
# [pricing rules](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogPricingRule).
public type OrderPricingOptions record {
    # The option to determine whether pricing rule-based
    # discounts are automatically applied to an order.
    boolean auto_apply_discounts?;
    # The option to determine whether rule-based taxes are automatically
    # applied to an order when the criteria of the corresponding rules are met.
    boolean auto_apply_taxes?;
};

# 
public type V1OrderHistoryEntryAction string;

# Specific details for curbside pickup.
public type OrderFulfillmentPickupDetailsCurbsidePickupDetails record {
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the buyer arrived and is waiting for pickup. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string buyer_arrived_at?;
    # Specific details for curbside pickup, such as parking number and vehicle model.
    @constraint:String {maxLength: 250}
    string curbside_details?;
};

# Represents a set of SearchSubscriptionsQuery filters used to limit the set of Subscriptions returned by SearchSubscriptions.
public type SearchSubscriptionsFilter record {
    # A filter to select subscriptions based on the customer.
    string[] customer_ids?;
    # A filter to select subscriptions based the location.
    string[] location_ids?;
};

# Options to control how to override the default behavior of the specified modifier.
public type CatalogModifierOverride record {
    # The ID of the `CatalogModifier` whose default behavior is being overridden.
    @constraint:String {minLength: 1}
    string modifier_id;
    # If `true`, this `CatalogModifier` should be selected by default for this `CatalogItem`.
    boolean on_by_default?;
};

# Defines parameters in a
# [RetrieveSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/retrieve-subscription) endpoint request.
public type RetrieveSubscriptionRequest record {
};

# Identifies the sort field and sort order.
public type InvoiceSort record {
    # The field to use for sorting.
    string 'field;
    # The order to use for sorting the results.
    string 'order?;
};

# Defines the fields that are included in the response body of
# a request to the [DisableCard](#endpoint-cards-disablecard) endpoint.
# 
# Note: if there are errors processing the request, the card field will not be
# present.
public type DisableCardResponse record {
    # Represents the payment details of a card to be used for payments. These
    # details are determined by the payment token generated by Web Payments SDK.
    Card card?;
    # Information on errors encountered during the request.
    Error[] errors?;
};

# Defines the fields that are included in the request body of
# a request to the [AddGroupToCustomer](https://developer.squareup.com/reference/square_2021-08-18/customers-api/add-group-to-customer) endpoint.
public type AddGroupToCustomerRequest record {
};

# The unit of length used to measure a quantity.
public type MeasurementUnitLength string;

# 
public type DeviceCheckoutOptions record {
    # The unique ID of the device intended for this `TerminalCheckout`.
    # A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes endpoint.
    # Match a `DeviceCode.device_id` value with `device_id` to get the associated device code.
    string device_id;
    # Instructs the device to skip the receipt screen. Defaults to false.
    boolean skip_receipt_screen?;
    # 
    TipSettings tip_settings?;
};

# 
public type V1ListPaymentsRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
    string begin_time?;
    # The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
    string end_time?;
    # Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
    boolean include_partial?;
    # The maximum number of payments to return in a single response. This value cannot exceed 200.
    int 'limit?;
    # The order in which payments are listed in the response.
    string 'order?;
};

# Unit of time used to measure a quantity (a duration).
public type MeasurementUnitTime string;

# 
public type V1OrderState string;

# Represents a reward tier in a loyalty program. A reward tier defines how buyers can redeem points for a reward, such as the number of points required and the value and scope of the discount. A loyalty program can offer multiple reward tiers.
public type LoyaltyProgramRewardTier record {
    # The timestamp when the reward tier was created, in RFC 3339 format.
    string created_at;
    # Provides details about the reward tier discount. DEPRECATED at version 2020-12-16. Discount details
    # are now defined using a catalog pricing rule and other catalog objects. For more information, see
    # [Get discount details for the reward](https://developer.squareup.com/docs/loyalty-api/overview#get-discount-details).
    LoyaltyProgramRewardDefinition definition;
    # The Square-assigned ID of the reward tier.
    @constraint:String {maxLength: 36, minLength: 1}
    string id;
    # The name of the reward tier.
    @constraint:String {minLength: 1}
    string name;
    # The points exchanged for the reward tier.
    @constraint:Int {minValue: 1}
    int points;
    # A reference to a Catalog object at a specific version. In general this is
    # used as an entry point into a graph of catalog objects, where the objects exist
    # at a specific version.
    CatalogObjectReference pricing_rule_reference?;
};

# 
public type V1EmployeeStatus string;

# Stores details about a cash payment. Contains only non-confidential information. For more information, see 
# [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
public type CashPaymentDetails record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money buyer_supplied_money;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money change_back_money?;
};

# Indicates which high-level category of error has occurred during a
# request to the Connect API.
public type ErrorCategory string;

# Defines the fields that are included in the response body of
# a request to the `DeleteCustomer` endpoint.
public type DeleteCustomerResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# A response that includes the loyalty event that 
# resulted from the successful API call.
public type AdjustLoyaltyPointsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Provides information about a loyalty event. 
    # For more information, see [Loyalty events](https://developer.squareup.com/docs/loyalty-api/overview/#loyalty-events).
    LoyaltyEvent event?;
};

# Specifies which timestamp to use to sort `SearchOrder` results.
public type SearchOrdersSortField string;

# Describes a request to list payments using 
# [ListPayments](https://developer.squareup.com/reference/square_2021-08-18/payments-api/list-payments).
# 
# The maximum results per page is 100.
public type ListPaymentsRequest record {
    # The timestamp for the beginning of the reporting period, in RFC 3339 format.
    # Inclusive. Default: The current time minus one year.
    string begin_time?;
    # The brand of the payment card (for example, VISA).
    string card_brand?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The timestamp for the end of the reporting period, in RFC 3339 format.
    # 
    # Default: The current time.
    string end_time?;
    # The last four digits of a payment card.
    string last_4?;
    # The maximum number of results to be returned in a single page.
    # It is possible to receive fewer results than the specified limit on a given page.
    # 
    # The default value of 100 is also the maximum allowed value. If the provided value is 
    # greater than 100, it is ignored and the default value is used instead.
    # 
    # Default: `100`
    int 'limit?;
    # Limit results to the location supplied. By default, results are returned
    # for the default (main) location associated with the seller.
    string location_id?;
    # The order in which results are listed:
    # - `ASC` - Oldest to newest.
    # - `DESC` - Newest to oldest (default).
    string sort_order?;
    # The exact amount in the `total_money` for a payment.
    int total?;
};

# 
public type SearchTerminalRefundsResponse record {
    # The pagination cursor to be used in a subsequent request. If empty,
    # this is the final response.
    # 
    # See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The requested search result of `TerminalRefund` objects.
    TerminalRefund[] refunds?;
};

# 
public type CalculateOrderResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Contains all information related to a single order to process with Square,
    # including line items that specify the products to purchase. `Order` objects also
    # include information about any associated tenders, refunds, and returns.
    # 
    # All Connect V2 Transactions have all been converted to Orders including all associated
    # itemization data.
    Order 'order?;
};

# A response to a request to get a `Shift`. The response contains
# the requested `Shift` object and might contain a set of `Error` objects if
# the request resulted in errors.
public type GetShiftResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # A record of the hourly rate, start, and end times for a single work shift
    # for an employee. This might include a record of the start and end times for breaks
    # taken during the shift.
    Shift shift?;
};

# A named selection for this `SELECTION`-type custom attribute definition.
public type CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection record {
    # Selection name, unique within `allowed_selections`.
    @constraint:String {maxLength: 255, minLength: 1}
    string name;
    # Unique ID set by Square.
    string uid?;
};

# The status of a payment request reminder.
public type InvoicePaymentReminderStatus string;

# 
public type CancelBookingRequest record {
    # The revision number for the booking used for optimistic concurrency.
    int booking_version?;
    # A unique key to make this request an idempotent operation.
    @constraint:String {maxLength: 255}
    string idempotency_key?;
};

# Defines the fields that are included in the response body of
# a request to the [CreateRefund](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/create-refund) endpoint.
# 
# One of `errors` or `refund` is present in a given response (never both).
public type CreateRefundResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a refund processed for a Square transaction.
    Refund refund?;
};

# 
public type V1RetrieveEmployeeRoleRequest record {
};

# 
public type TerminalCheckoutQuery record {
    # 
    TerminalCheckoutQueryFilter filter?;
    # 
    TerminalCheckoutQuerySort sort?;
};

# Defines the fields that are included in the response from the
# [SearchSubscriptions](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/search-subscriptions) endpoint.
public type SearchSubscriptionsResponse record {
    # When a response is truncated, it includes a cursor that you can
    # use in a subsequent request to fetch the next set of subscriptions.
    # If empty, this is the final response.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The search result.
    Subscription[] subscriptions?;
};

# Indicates the gift card state.
public type GiftCardStatus string;

# Represents one of a business's employees.
public type V1Employee record {
    # The IDs of the locations the employee is allowed to clock in at.
    string[] authorized_location_ids?;
    # The time when the employee entity was created, in ISO 8601 format.
    string created_at?;
    # The employee's email address.
    string email?;
    # An ID the merchant can set to associate the employee with an entity in another system.
    string external_id?;
    # The employee's first name.
    string first_name;
    # The employee's unique ID.
    string id?;
    # The employee's last name.
    string last_name;
    # The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee.
    string[] role_ids?;
    # Whether the employee is ACTIVE or INACTIVE. Inactive employees cannot sign in to Square Register.Merchants update this field from the Square Dashboard.
    string status?;
    # The time when the employee entity was most recently updated, in ISO 8601 format.
    string updated_at?;
};

# Indicates the Square product used to process a transaction.
public type TransactionProduct string;

public type GANSource anydata;

# A request to search for loyalty rewards.
public type SearchLoyaltyRewardsRequest record {
    # A pagination cursor returned by a previous call to 
    # this endpoint. Provide this to retrieve the next set of 
    # results for the original query.
    # For more information, 
    # see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The maximum number of results to return in the response.
    @constraint:Int {minValue: 1, maxValue: 30}
    int 'limit?;
    # The set of search requirements.
    SearchLoyaltyRewardsRequestLoyaltyRewardQuery query?;
};

# Represents a generic time range. The start and end values are
# represented in RFC 3339 format. Time ranges are customized to be
# inclusive or exclusive based on the needs of a particular endpoint.
# Refer to the relevant endpoint-specific documentation to determine
# how time ranges are handled.
public type TimeRange record {
    # A datetime value in RFC 3339 format indicating when the time range
    # ends.
    string end_at?;
    # A datetime value in RFC 3339 format indicating when the time range
    # starts.
    string start_at?;
};

# A line item modifier being returned.
public type OrderReturnLineItemModifier record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money base_price_money?;
    # The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogModifier).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this line item modifier references.
    int catalog_version?;
    # The name of the item modifier.
    @constraint:String {maxLength: 255}
    string name?;
    # The modifier `uid` from the order's line item that contains the
    # original sale of this line item modifier.
    @constraint:String {maxLength: 60}
    string source_modifier_uid?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_price_money?;
    # A unique ID that identifies the return modifier only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# 
public type RetrieveCashDrawerShiftResponse record {
    # This model gives the details of a cash drawer shift.
    # The cash_payment_money, cash_refund_money, cash_paid_in_money,
    # and cash_paid_out_money fields are all computed by summing their respective
    # event types.
    CashDrawerShift cash_drawer_shift?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Enumerates the possible statuses the team member can have within a business.
public type TeamMemberStatus string;

# Indicates the type of the payment request. For more information, see 
# [Payment requests](https://developer.squareup.com/docs/invoices-api/overview#payment-requests).
public type InvoiceRequestType string;

# The query filter to return the search result whose searchable attribute values contain all of the specified keywords or tokens, independent of the token order or case.
public type CatalogQueryText record {
    # A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 characters are ignored.
    string[] keywords;
};

# A response that contains a `GiftCard`. The response might contain a set of `Error` objects
# if the request resulted in errors.
public type RetrieveGiftCardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# The response to a request to get a `BreakType`. The response contains
# the requested `BreakType` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type GetBreakTypeResponse record {
    # A defined break template that sets an expectation for possible `Break`
    # instances on a `Shift`.
    BreakType break_type?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Determines a seller's option on Quick Amounts feature.
public type CatalogQuickAmountsSettingsOption string;

# 
public type RetrieveEmployeeResponse record {
    # An employee object that is used by the external API.
    Employee employee?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# A response that contains a `GiftCard`. The response might contain a set of `Error` objects
# if the request resulted in errors.
public type RetrieveGiftCardFromNonceResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# The creation source filter.
# 
# If one or more creation sources are set, customer profiles are included in,
# or excluded from, the result if they match at least one of the filter criteria.
public type CustomerCreationSourceFilter record {
    # Indicates whether a customer profile matching the filter criteria
    # should be included in the result or excluded from the result.
    # 
    # Default: `INCLUDE`.
    string rule?;
    # The list of creation sources used as filtering criteria.
    string[] values?;
};

# Defines the fields that are included in the response from the
# [RetrieveSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/retrieve-subscription) endpoint.
public type RetrieveSubscriptionResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# Defines the fields that are included in the response body for requests to the `ListCustomerSegments` endpoint.
# 
# Either `errors` or `segments` is present in a given response (never both).
public type ListCustomerSegmentsResponse record {
    # A pagination cursor to be used in subsequent calls to `ListCustomerSegments`
    # to retrieve the next set of query results. The cursor is only present if the request succeeded and
    # additional results are available.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The list of customer segments belonging to the associated Square account.
    CustomerSegment[] segments?;
};

# Defines the response returned by [ListPayments](https://developer.squareup.com/reference/square_2021-08-18/payments-api/list-payments).
public type ListPaymentsResponse record {
    # The pagination cursor to be used in a subsequent request. If empty,
    # this is the final response.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The requested list of payments.
    Payment[] payments?;
};

# Indicates the method used to create the customer profile.
public type CustomerCreationSource string;

# Indicates a tender's type.
public type TenderType string;

# Present only when `GiftCardActivityType` is UNLINKED_ACTIVITY_REFUND.
public type GiftCardActivityUnlinkedActivityRefund record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money;
    # When using the Square Payments API, the ID of the payment that was refunded to this gift
    # card.
    string payment_id?;
    # A client-specified ID to associate an entity, in another system, with this gift card
    # activity. This can be used to track the order or payment related information when the Square Payments
    # API is not being used.
    string reference_id?;
};

# Defines the fields that are included in the response body of
# a request to the __ListLocations__ endpoint.
# 
# One of `errors` or `locations` is present in a given response (never both).
public type ListLocationsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The business locations.
    Location[] locations?;
};

# Represents an `UpsertSnippet` request.
public type UpsertSnippetRequest record {
    # Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
    Snippet snippet;
};

# The response to a request to delete a `BreakType`. The response might contain a set 
# of `Error` objects if the request resulted in errors.
public type DeleteBreakTypeResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines the fields in a `RetrieveDisputeEvidence` response.
public type RetrieveDisputeEvidenceResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # 
    DisputeEvidence evidence?;
};

# Defines the fields that are included in the response body of
# a request to the [ListCustomerGroups](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/list-customer-groups) endpoint.
# 
# Either `errors` or `groups` is present in a given response (never both).
public type ListCustomerGroupsResponse record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint. This value is present only if the request
    # succeeded and additional results are available.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # A list of customer groups belonging to the current seller.
    CustomerGroup[] groups?;
};

# A response that contains one `GiftCard` that was unlinked. The response might contain a set of `Error`
# objects if the request resulted in errors.
public type UnlinkCustomerFromGiftCardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square gift card.
    GiftCard gift_card?;
};

# A response that includes the loyalty rewards satisfying the search criteria.
public type SearchLoyaltyRewardsResponse record {
    # The pagination cursor to be used in a subsequent 
    # request. If empty, this is the final response.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The loyalty rewards that satisfy the search criteria.
    # These are returned in descending order by `updated_at`.
    LoyaltyReward[] rewards?;
};

# 
public type V1ListSettlementsResponse record {
    # 
    V1Settlement[] items?;
};

# Defines the fields that are included in the response body of
# a request to the `CreateCustomer` endpoint.
# 
# Either `errors` or `customer` is present in a given response (never both).
public type CreateCustomerResponse record {
    # Represents a Square customer profile in the Customer Directory of a Square seller.
    Customer customer?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type Location record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The email of the location.
    # This email is visible to the customers of the location.
    # For example, the email appears on customer receipts. 
    # For example, `help&#64;squareup.com`.
    string business_email?;
    # Represents the hours of operation for a business location.
    BusinessHours business_hours?;
    # The business name of the location
    # This is the name visible to the customers of the location.
    # For example, this name appears on customer receipts.
    string business_name?;
    # The Square features that are enabled for the location.
    # See [LocationCapability](https://developer.squareup.com/reference/square_2021-08-18/enums/LocationCapability) for possible values.
    string[] capabilities?;
    # Latitude and longitude coordinates.
    Coordinates coordinates?;
    # The country of the location, in ISO 3166-1-alpha-2 format.
    # 
    # See [Country](https://developer.squareup.com/reference/square_2021-08-18/enums/Country) for possible values.
    string country?;
    # The time when the location was created, in RFC 3339 format.
    # For more information, see [Working with Dates](https://developer.squareup.com/docs/build-basics/working-with-dates).
    string created_at?;
    # The currency used for all transactions at this location,
    # in ISO 4217 format.
    # See [Currency](https://developer.squareup.com/reference/square_2021-08-18/enums/Currency) for possible values.
    string currency?;
    # The description of the location.
    string description?;
    # The Facebook profile URL of the location. The URL should begin with 'facebook.com/'. For example, `https://www.facebook.com/square`.
    string facebook_url?;
    # The URL of a full-format logo image for the location. The Seller must choose this logo in the
    # Seller dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices)
    # that Square generates on behalf of the Seller. This image can have an aspect ratio of 2:1 or greater
    # and is recommended to be at least 1280x648 pixels.
    string full_format_logo_url?;
    # The Square-issued ID of the location.
    string id?;
    # The Instagram username of the location without the '&#64;' symbol. For example, `square`.
    string instagram_username?;
    # The language associated with the location, in
    # [BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A). 
    # For more information, see [Location language code](https://developer.squareup.com/docs/locations-api#location-language-code).
    string language_code?;
    # The URL of the logo image for the location. The Seller must choose this logo in the Seller
    # dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices)
    # that Square generates on behalf of the Seller. This image should have an aspect ratio
    # close to 1:1 and is recommended to be at least 200x200 pixels.
    string logo_url?;
    # The merchant category code (MCC) of the location, as standardized by ISO 18245.
    # The MCC describes the kind of goods or services sold at the location.
    string mcc?;
    # The ID of the merchant that owns the location.
    string merchant_id?;
    # The name of the location.
    # This information appears in the dashboard as the nickname.
    # A location name must be unique within a seller account.
    string name?;
    # The phone number of the location in human readable format. For example, `+353 80 0 098 8099`.
    string phone_number?;
    # The URL of the Point of Sale background image for the location.
    string pos_background_url?;
    # The status of the location, either active or inactive.
    string status?;
    # The tax IDs that a Location is operating under.
    TaxIds tax_ids?;
    # The [IANA Timezone](https://www.iana.org/time-zones) identifier for
    # the timezone of the location.
    string timezone?;
    # The Twitter username of the location without the '&#64;' symbol. For example, `Square`.
    string twitter_username?;
    # The type of the location, either physical or mobile.
    string 'type?;
    # The website URL of the location.  For example, `https://squareup.com`.
    string website_url?;
};

# V1CreateRefundRequest
public type V1CreateRefundRequest record {
    # The ID of the payment to refund. If you are creating a `PARTIAL`
    # refund for a split tender payment, instead provide the id of the
    # particular tender you want to refund.
    string payment_id;
    # The reason for the refund.
    string reason;
    # 
    V1Money refunded_money?;
    # An optional key to ensure idempotence if you issue the same PARTIAL refund request more than once.
    string request_idempotence_key?;
    # The type of refund (FULL or PARTIAL).
    string 'type;
};

# 
public type ListCashDrawerShiftsRequest record {
    # The inclusive start time of the query on opened_at, in ISO 8601 format.
    string begin_time?;
    # Opaque cursor for fetching the next page of results.
    string cursor?;
    # The exclusive end date of the query on opened_at, in ISO 8601 format.
    string end_time?;
    # Number of cash drawer shift events in a page of results (200 by
    # default, 1000 max).
    @constraint:Int {maxValue: 1000}
    int 'limit?;
    # The ID of the location to query for a list of cash drawer shifts.
    @constraint:String {minLength: 1}
    string location_id;
    # The order in which cash drawer shifts are listed in the response,
    # based on their opened_at field. Default value: ASC
    string sort_order?;
};

# Represents a discount that applies to one or more line items in an
# order.
# 
# Fixed-amount, order-scoped discounts are distributed across all non-zero line item totals.
# The amount distributed to each line item is relative to the
# amount contributed by the item to the order subtotal.
public type OrderLineItemDiscount record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogDiscount).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this discount references.
    int catalog_version?;
    # Application-defined data attached to this discount. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # The discount's name.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the discount, as a string representation of a decimal number.
    # A value of `7.25` corresponds to a percentage of 7.25%.
    # 
    # `percentage` is not set for amount-based discounts.
    @constraint:String {maxLength: 10}
    string percentage?;
    # The object ID of a [pricing rule](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogPricingRule) to be applied 
    # automatically to this discount. The specification and application of the discounts, to 
    # which a `pricing_rule_id` is assigned, are completely controlled by the corresponding 
    # pricing rule.
    string pricing_rule_id?;
    # The reward IDs corresponding to this discount. The application and
    # specification of discounts that have `reward_ids` are completely controlled by the backing
    # criteria corresponding to the reward tiers of the rewards that are added to the order
    # through the Loyalty API. To manually unapply discounts that are the result of added rewards,
    # the rewards must be removed from the order through the Loyalty API.
    string[] reward_ids?;
    # Indicates the level at which the discount applies. For `ORDER` scoped discounts,
    # Square generates references in `applied_discounts` on all order line items that do
    # not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items
    # with a discount reference in their `applied_discounts` field.
    # 
    # This field is immutable. To change the scope of a discount, you must delete
    # the discount and re-add it as a new discount.
    string scope?;
    # The type of the discount.
    # 
    # Discounts that do not reference a catalog object ID must have a type of
    # `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
    string 'type?;
    # A unique ID that identifies the discount only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Choices of customer-facing time zone used for bookings.
public type BusinessBookingProfileCustomerTimezoneChoice string;

# 
public type UpdateItemModifierListsRequest record {
    # The IDs of the catalog items associated with the CatalogModifierList objects being updated.
    string[] item_ids;
    # The IDs of the CatalogModifierList objects to disable for the CatalogItem.
    string[] modifier_lists_to_disable?;
    # The IDs of the CatalogModifierList objects to enable for the CatalogItem.
    string[] modifier_lists_to_enable?;
};

# Represents communication preferences for the customer profile.
public type CustomerPreferences record {
    # Indicates whether the customer has unsubscribed from marketing campaign emails. A value of `true` means that the customer chose to opt out of email marketing from the current Square seller or from all Square sellers. This value is read-only from the Customers API.
    boolean email_unsubscribed?;
};

# An enumerated value that can link a
# `CatalogItemVariation` to an item option as one of
# its item option values.
public type CatalogItemOptionValue record {
    # The HTML-supported hex color for the item option (e.g., "#ff8d4e85").
    # Only displayed if `show_colors` is enabled on the parent `ItemOption`. When
    # left unset, `color` defaults to white ("#ffffff") when `show_colors` is
    # enabled on the parent `ItemOption`.
    string color?;
    # A human-readable description for the option value. This is a searchable attribute for use in applicable query filters.
    string description?;
    # Unique ID of the associated item option.
    string item_option_id?;
    # Name of this item option value. This is a searchable attribute for use in applicable query filters.
    string name?;
    # Determines where this option value appears in a list of option values.
    int ordinal?;
};

# The request does not have any required fields. When given no query criteria,
# `SearchOrders` returns all results for all of the seller's locations. When retrieving additional
# pages using a `cursor`, the `query` must be equal to the `query` used to retrieve the first page of
# results.
public type SearchOrdersRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for your original query.
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # The maximum number of results to be returned in a single page. It is
    # possible to receive fewer results than the specified limit on a given page.
    # 
    # Default: `500`
    @constraint:Int {minValue: 1}
    int 'limit?;
    # The location IDs for the orders to query. All locations must belong to
    # the same merchant.
    # 
    # Min: 1 location ID.
    # 
    # Max: 10 location IDs.
    string[] location_ids?;
    # Contains query criteria for the search.
    SearchOrdersQuery query?;
    # A Boolean that controls the format of the search results. If `true`,
    # `SearchOrders` returns [OrderEntry](https://developer.squareup.com/reference/square_2021-08-18/objects/OrderEntry) objects. If `false`, `SearchOrders`
    # returns complete order objects.
    # 
    # Default: `false`.
    boolean return_entries?;
};

# The schedule type of the pickup fulfillment.
public type OrderFulfillmentPickupDetailsScheduleType string;

# Details about the device that took the payment.
public type DeviceDetails record {
    # The Square-issued ID of the device.
    @constraint:String {maxLength: 255}
    string device_id?;
    # The Square-issued installation ID for the device.
    @constraint:String {maxLength: 255}
    string device_installation_id?;
    # The name of the device set by the seller.
    @constraint:String {maxLength: 255}
    string device_name?;
};

# 
public type RetrieveTeamMemberBookingProfileResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The booking profile of a seller's team member, including the team member's ID, display name, description and whether the team member can be booked as a service provider.
    TeamMemberBookingProfile team_member_booking_profile?;
};

# Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
# at a given location to a requesting customer in one or more appointment segments.
public type Booking record {
    # A list of appointment segments for this booking.
    AppointmentSegment[] appointment_segments?;
    # The timestamp specifying the creation time of this booking, in RFC 3339 format.
    string created_at?;
    # The ID of the [Customer](https://developer.squareup.com/reference/square_2021-08-18/objects/Customer) object representing the customer attending this booking
    string customer_id?;
    # The free-text field for the customer to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a relevant [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance.
    @constraint:String {maxLength: 4096}
    string customer_note?;
    # A unique ID of this object representing a booking.
    string id?;
    # The ID of the [Location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) object representing the location where the booked service is provided.
    string location_id?;
    # The free-text field for the seller to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a specific [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject) instance.
    # This field should not be visible to customers.
    @constraint:String {maxLength: 4096}
    string seller_note?;
    # The timestamp specifying the starting time of this booking, in RFC 3339 format.
    string start_at?;
    # The status of the booking, describing where the booking stands with respect to the booking state machine.
    string status?;
    # The timestamp specifying the most recent update time of this booking, in RFC 3339 format.
    string updated_at?;
    # The revision number for the booking used for optimistic concurrency.
    int 'version?;
};

# Describes a `CancelInvoice` request.
public type CancelInvoiceRequest record {
    # The version of the [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice) to cancel.
    # If you do not know the version, you can call 
    # [GetInvoice](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/get-invoice) or [ListInvoices](https://developer.squareup.com/reference/square_2021-08-18/invoices-api/list-invoices).
    int 'version;
};

# Represents the payment details of a card to be used for payments. These
# details are determined by the payment token generated by Web Payments SDK.
public type Card record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address billing_address?;
    # The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API
    # returns this field.
    @constraint:String {maxLength: 6}
    string bin?;
    # The card's brand.
    string card_brand?;
    # The type of the card.
    # The Card object includes this field only in response to Payments API calls.
    string card_type?;
    # The name of the cardholder.
    @constraint:String {maxLength: 96}
    string cardholder_name?;
    # The ID of a customer created using the Customers API to be associated with the card.
    string customer_id?;
    # Indicates whether or not a card can be used for payments.
    boolean enabled?;
    # The expiration month of the associated card as an integer between 1 and 12.
    int exp_month?;
    # The four-digit year of the card's expiration date.
    int exp_year?;
    # __Not currently set.__ Intended as a Square-assigned identifier, based
    # on the card number, to identify the card across multiple locations within a
    # single application.
    @constraint:String {maxLength: 255}
    string fingerprint?;
    # Unique ID for this card. Generated by Square.
    @constraint:String {maxLength: 64}
    string id?;
    # The last 4 digits of the card number.
    @constraint:String {maxLength: 4}
    string last_4?;
    # Indicates whether the Card is prepaid or not.
    # The Card object includes this field only in response to Payments API calls.
    string prepaid_type?;
    # An optional user-defined reference ID that associates this card with
    # another entity in an external system. For example, a customer ID from an
    # external customer management system.
    @constraint:String {maxLength: 128}
    string reference_id?;
    # Current version number of the card. Increments with each card update. Requests to update an
    # existing Card object will be rejected unless the version in the request matches the current
    # version for the Card.
    int 'version?;
};

# Indicates the source that generated the gift card 
# account number (GAN).
public type GiftCardGANSource string;

# Query conditions to search for availabilities of bookings.
public type SearchAvailabilityQuery record {
    # A query filter to search for availabilities by.
    SearchAvailabilityFilter filter;
};

# Unit of weight used to measure a quantity.
public type MeasurementUnitWeight string;

# Provides information about the application used to generate a change.
public type SourceApplication record {
    # Read-only Square ID assigned to the application. Only used for
    # [Product](https://developer.squareup.com/reference/square_2021-08-18/enums/Product) type `EXTERNAL_API`.
    string application_id?;
    # Read-only display name assigned to the application
    # (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
    string name?;
    # Read-only [Product](https://developer.squareup.com/reference/square_2021-08-18/enums/Product) type for the application.
    string product?;
};

# A response that contains a `GiftCardActivity` that was created.
# The response might contain a set of `Error` objects if the request resulted in errors.
public type CreateGiftCardActivityResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents an action performed on a gift card that affects its state or balance.
    GiftCardActivity gift_card_activity?;
};

# Defines parameters in a
# [ResumeSubscription](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/resume-subscription) endpoint
# response.
public type ResumeSubscriptionResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a customer subscription to a subscription plan.
    # For an overview of the `Subscription` type, see
    # [Subscription object](https://developer.squareup.com/docs/subscriptions-api/overview#subscription-object-overview).
    Subscription subscription?;
};

# A response returned by the API call.
public type DeleteLoyaltyRewardResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Request object for the [CreateLocation](https://developer.squareup.com/reference/square_2021-08-18/locations-api/create-location) endpoint.
public type CreateLocationRequest record {
    # 
    Location location?;
};

# 
public type SearchTerminalRefundsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this cursor to retrieve the next set of results for the original query.
    string cursor?;
    # Limits the number of results returned for a single request.
    @constraint:Int {minValue: 1, maxValue: 100}
    int 'limit?;
    # 
    TerminalRefundQuery query?;
};

# Defines the response returned by 
# [RefundPayment](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/refund-payment).
# 
# If there are errors processing the request, the `refund` field might not be
# present, or it might be present with a status of `FAILED`.
public type RefundPaymentResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # Represents a refund of a payment made using Square. Contains information about
    # the original payment and the amount of money refunded.
    PaymentRefund refund?;
};

# Represents a service charge applied to an order.
public type OrderServiceCharge record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The list of references to the taxes applied to this service charge. Each
    # `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level
    # `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied
    # is populated.
    # 
    # An `OrderLineItemAppliedTax` is automatically created on every taxable service charge
    # for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records
    # for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable
    # service charge. Taxable service charges have the `taxable` field set to `true` and calculated
    # in the `SUBTOTAL_PHASE`.
    # 
    # To change the amount of a tax, modify the referenced top-level tax.
    OrderLineItemAppliedTax[] applied_taxes?;
    # The calculation phase at which to apply the service charge.
    string calculation_phase?;
    # The catalog object ID referencing the service charge [CatalogObject](https://developer.squareup.com/reference/square_2021-08-18/objects/CatalogObject).
    @constraint:String {maxLength: 192}
    string catalog_object_id?;
    # The version of the catalog object that this service charge references.
    int catalog_version?;
    # Application-defined data attached to this service charge. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # The name of the service charge.
    @constraint:String {maxLength: 255}
    string name?;
    # The service charge percentage as a string representation of a
    # decimal number. For example, `"7.25"` indicates a service charge of 7.25%.
    # 
    # Exactly 1 of `percentage` or `amount_money` should be set.
    @constraint:String {maxLength: 10}
    string percentage?;
    # Indicates whether the service charge can be taxed. If set to `true`,
    # order-level taxes automatically apply to the service charge. Note that
    # service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
    boolean taxable?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_money?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_tax_money?;
    # The type of the service charge.
    string 'type?;
    # A unique ID that identifies the service charge only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# 
public type VoidTransactionRequest record {
};

# 
public type OrderServiceChargeType string;

# The current state of this fulfillment.
public type OrderFulfillmentState string;

# A response to a request to update a `BreakType`. The response contains
# the requested `BreakType` objects and might contain a set of `Error` objects if
# the request resulted in errors.
public type UpdateBreakTypeResponse record {
    # A defined break template that sets an expectation for possible `Break`
    # instances on a `Shift`.
    BreakType break_type?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a `RetrieveSnippet` response. The response can include either `snippet` or `errors`.
public type RetrieveSnippetResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
    Snippet snippet?;
};

# Represents a retrieve request for a `TeamMember` object.
public type RetrieveTeamMemberRequest record {
};

# 
public type DisputeEvidence record {
    # The ID of the dispute the evidence is associated with.
    @constraint:String {maxLength: 40, minLength: 1}
    string dispute_id?;
    # A file to be uploaded as dispute evidence.
    DisputeEvidenceFile evidence_file?;
    # The Square-generated ID of the evidence.
    @constraint:String {maxLength: 40, minLength: 1}
    string evidence_id?;
    # Raw text
    @constraint:String {maxLength: 500, minLength: 1}
    string evidence_text?;
    # The type of the evidence.
    string evidence_type?;
    # The Square-generated ID of the evidence.
    @constraint:String {maxLength: 40, minLength: 1}
    string id?;
    # The time when the next action is due, in RFC 3339 format.
    @constraint:String {maxLength: 40, minLength: 1}
    string uploaded_at?;
};

# Information about fulfillment updates.
public type OrderFulfillmentUpdatedUpdate record {
    # A unique ID that identifies the fulfillment only within this order.
    string fulfillment_uid?;
    # The state of the fulfillment after the change. The state might be equal to `old_state` if a non-state
    # field was changed on the fulfillment (such as the tracking number).
    string new_state?;
    # The state of the fulfillment before the change.
    # The state is not populated if the fulfillment is created with this new `Order` version.
    string old_state?;
};

# 
public type CheckAppointmentsOnboardedRequest record {
};

# The filtering criteria. If the request specifies multiple filters, 
# the endpoint uses a logical AND to evaluate them.
public type LoyaltyEventFilter record {
    # Filter events by date time range.
    LoyaltyEventDateTimeFilter date_time_filter?;
    # Filter events by location.
    LoyaltyEventLocationFilter location_filter?;
    # Filter events by loyalty account.
    LoyaltyEventLoyaltyAccountFilter loyalty_account_filter?;
    # Filter events by the order associated with the event.
    LoyaltyEventOrderFilter order_filter?;
    # Filter events by event type.
    LoyaltyEventTypeFilter type_filter?;
};

# The query filter to return the search result whose named attribute values are prefixed by the specified attribute value.
public type CatalogQueryPrefix record {
    # The name of the attribute to be searched.
    @constraint:String {minLength: 1}
    string attribute_name;
    # The desired prefix of the search attribute value.
    @constraint:String {minLength: 1}
    string attribute_prefix;
};

# The response to a request for a set of `EmployeeWage` objects. The response contains
# a set of `EmployeeWage` objects.
public type ListEmployeeWagesResponse record {
    # The value supplied in the subsequent request to fetch the next page
    # of `EmployeeWage` results.
    string cursor?;
    # A page of `EmployeeWage` results.
    EmployeeWage[] employee_wages?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Defines parameters in a
# [ListSubscriptionEvents](https://developer.squareup.com/reference/square_2021-08-18/subscriptions-api/list-subscription-events)
# endpoint request.
public type ListSubscriptionEventsRequest record {
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The upper limit on the number of subscription events to return
    # in the response.
    # 
    # Default: `200`
    @constraint:Int {minValue: 1}
    int 'limit?;
};

# Contains details about how to fulfill this order.
public type OrderFulfillment record {
    # Application-defined data attached to this fulfillment. Metadata fields are intended
    # to store descriptive references or associations with an entity in another system or store brief
    # information about the object. Square does not process this field; it only stores and returns it
    # in relevant API calls. Do not use metadata to store any sensitive information (such as personally
    # identifiable information or card details).
    # 
    # Keys written by applications must be 60 characters or less and must be in the character set
    # `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed
    # with a namespace, separated from the key with a ':' character.
    # 
    # Values have a maximum length of 255 characters.
    # 
    # An application can have up to 10 entries per metadata field.
    # 
    # Entries written by applications are private and can only be read or modified by the same
    # application.
    # 
    # For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    record {} metadata?;
    # Contains details necessary to fulfill a pickup order.
    OrderFulfillmentPickupDetails pickup_details?;
    # Contains the details necessary to fulfill a shipment order.
    OrderFulfillmentShipmentDetails shipment_details?;
    # The state of the fulfillment.
    string state?;
    # The type of the fulfillment.
    string 'type?;
    # A unique ID that identifies the fulfillment only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Contains details necessary to fulfill a pickup order.
public type OrderFulfillmentPickupDetails record {
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the fulfillment was accepted. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string accepted_at?;
    # The duration of time after which an open and accepted pickup fulfillment
    # is automatically moved to the `COMPLETED` state. The duration must be in RFC 3339
    # format (for example, "P1W3D").
    # 
    # If not set, this pickup fulfillment remains accepted until it is canceled or completed.
    string auto_complete_duration?;
    # A description of why the pickup was canceled. The maximum length: 100 characters.
    @constraint:String {maxLength: 100}
    string cancel_reason?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the fulfillment was canceled. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string canceled_at?;
    # Specific details for curbside pickup.
    OrderFulfillmentPickupDetailsCurbsidePickupDetails curbside_pickup_details?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when the fulfillment expired. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string expired_at?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when this fulfillment expires if it is not accepted. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z"). The expiration time can only be set up to 7 days in the future.
    # If `expires_at` is not set, this pickup fulfillment is automatically accepted when 
    # placed.
    string expires_at?;
    # If set to `true`, indicates that this pickup order is for curbside pickup, not in-store pickup.
    boolean is_curbside_pickup?;
    # A note meant to provide additional instructions about the pickup
    # fulfillment displayed in the Square Point of Sale application and set by the API.
    @constraint:String {maxLength: 500}
    string note?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
    # indicating when the fulfillment was picked up by the recipient. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string picked_up_at?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # that represents the start of the pickup window. Must be in RFC 3339 timestamp format, e.g., 
    # "2016-09-04T23:59:33.123Z".
    # 
    # For fulfillments with the schedule type `ASAP`, this is automatically set
    # to the current time plus the expected duration to prepare the fulfillment.
    string pickup_at?;
    # The window of time in which the order should be picked up after the `pickup_at` timestamp.
    # Must be in RFC 3339 duration format, e.g., "P1W3D". Can be used as an
    # informational guideline for merchants.
    string pickup_window_duration?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the fulfillment was placed. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string placed_at?;
    # The duration of time it takes to prepare this fulfillment.
    # The duration must be in RFC 3339 format (for example, "P1W3D").
    string prep_time_duration?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the fulfillment is marked as ready for pickup. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string ready_at?;
    # Contains information about the recipient of a fulfillment.
    OrderFulfillmentRecipient recipient?;
    # The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) 
    # indicating when the fulfillment was rejected. The timestamp must be in RFC 3339 format
    # (for example, "2016-09-04T23:59:33.123Z").
    string rejected_at?;
    # The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`.
    string schedule_type?;
};

# 
public type UpsertCatalogObjectResponse record {
    # The wrapper object for the Catalog entries of a given object type.
    # 
    # The type of a particular `CatalogObject` is determined by the value of the
    # `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance.
    # For example, the following list shows some instances of `CatalogObject` of a given `type` and
    # their corresponding data attribute that can be set:
    # - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object.
    # - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object.
    # - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object.
    # - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object.
    # - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object.
    # - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object.
    # - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object.
    # - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object.
    # - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object.
    # - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object.
    # - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object.
    # - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object.
    # - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.
    # 
    # 
    # For a more detailed discussion of the Catalog data model, please see the
    # [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
    CatalogObject catalog_object?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # The mapping between client and server IDs for this upsert.
    CatalogIdMapping[] id_mappings?;
};

# Describes the type of this unit and indicates which field contains the unit information. This is an ‘open’ enum.
public type MeasurementUnitUnitType string;

# Present only when `GiftCardActivityType` is REFUND.
public type GiftCardActivityRefund record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # When the Square Payments API is used, Refund is not called on the Gift Cards API.
    # However, when Square reads a Refund activity from the Gift Cards API, the developer needs to know the
    # ID of the payment (made using this gift card) that is being refunded.
    string payment_id?;
    # The ID for the Redeem activity that needs to be refunded. Hence, the activity it
    # refers to has to be of the REDEEM type.
    string redeem_activity_id;
    # A client-specified ID to associate an entity, in another system, with this gift card
    # activity. This can be used to track the order or payment related information when the Square Orders
    # API is not being used.
    string reference_id?;
};

# The information needed to define a custom unit, provided by the seller.
public type MeasurementUnitCustom record {
    # The abbreviation of the custom unit, such as "bsh" (bushel). This appears
    # in the cart for the Point of Sale app, and in reports.
    string abbreviation;
    # The name of the custom unit, for example "bushel".
    string name;
};

# A discount applicable to items.
public type CatalogDiscount record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount_money?;
    # Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale.
    string discount_type?;
    # The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
    string label_color?;
    # Indicates whether this discount should reduce the price used to calculate tax.
    # 
    # Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must
    # be calculated based on an item's price, ignoring a particular discount. For example,
    # in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a
    # customer pays but does not reduce the sale price used to calculate how much sales tax is
    # due. In this case, the discount representing that manufacturer coupon should have
    # `DO_NOT_MODIFY_TAX_BASIS` for this field.
    # 
    # If you are unsure whether you need to use this field, consult your tax professional.
    string modify_tax_basis?;
    # The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal
    # separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type`
    # is `VARIABLE_PERCENTAGE`.
    # 
    # Do not use this field for amount-based or variable discounts.
    string percentage?;
    # Indicates whether a mobile staff member needs to enter their PIN to apply the
    # discount to a payment in the Square Point of Sale app.
    boolean pin_required?;
};

# Indicates the status of an invoice.
public type InvoiceStatus string;

# 
public type UpsertCatalogObjectRequest record {
    # A value you specify that uniquely identifies this
    # request among all your requests. A common way to create
    # a valid idempotency key is to use a Universally unique
    # identifier (UUID).
    # 
    # If you're unsure whether a particular request was successful,
    # you can reattempt it with the same idempotency key without
    # worrying about creating duplicate objects.
    # 
    # See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
    @constraint:String {minLength: 1}
    string idempotency_key;
    # The wrapper object for the Catalog entries of a given object type.
    # 
    # The type of a particular `CatalogObject` is determined by the value of the
    # `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance.
    # For example, the following list shows some instances of `CatalogObject` of a given `type` and
    # their corresponding data attribute that can be set:
    # - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object.
    # - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object.
    # - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object.
    # - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object.
    # - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object.
    # - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object.
    # - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object.
    # - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object.
    # - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object.
    # - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object.
    # - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object.
    # - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object.
    # - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.
    # 
    # 
    # For a more detailed discussion of the Catalog data model, please see the
    # [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
    CatalogObject 'object;
};

# A payment represents a paid transaction between a Square merchant and a
# customer. Payment details are usually available from Connect API endpoints
# within a few minutes after the transaction completes.
# 
# Each Payment object includes several fields that end in `_money`. These fields
# describe the various amounts of money that contribute to the payment total:
# 
# <ul>
# <li>
# Monetary values are <b>positive</b> if they represent an
# <em>increase</em> in the amount of money the merchant receives (e.g.,
# <code>tax_money</code>, <code>tip_money</code>).
# </li>
# <li>
# Monetary values are <b>negative</b> if they represent an
# <em>decrease</em> in the amount of money the merchant receives (e.g.,
# <code>discount_money</code>, <code>refunded_money</code>).
# </li>
# </ul>
public type V1Payment record {
    # All of the additive taxes associated with the payment.
    V1PaymentTax[] additive_tax?;
    # 
    V1Money additive_tax_money?;
    # The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise.
    string created_at?;
    # The unique identifier of the Square account that took the payment.
    string creator_id?;
    # 
    Device device?;
    # 
    V1Money discount_money?;
    # 
    V1Money gross_sales_money?;
    # The payment's unique identifier.
    string id?;
    # All of the inclusive taxes associated with the payment.
    V1PaymentTax[] inclusive_tax?;
    # 
    V1Money inclusive_tax_money?;
    # Indicates whether or not the payment is only partially paid for.
    # If true, this payment will have the tenders collected so far, but the
    # itemizations will be empty until the payment is completed.
    boolean is_partial?;
    # The items purchased in the payment.
    V1PaymentItemization[] itemizations?;
    # The unique identifier of the merchant that took the payment.
    string merchant_id?;
    # 
    V1Money net_sales_money?;
    # 
    V1Money net_total_money?;
    # The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page.
    string payment_url?;
    # 
    V1Money processing_fee_money?;
    # The URL of the receipt for the payment. Note that for split tender
    # payments, this URL corresponds to the receipt for the first tender
    # listed in the payment's tender field. Each Tender object has its own
    # receipt_url field you can use to get the other receipts associated with
    # a split tender payment.
    string receipt_url?;
    # 
    V1Money refunded_money?;
    # All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange.
    V1Refund[] refunds?;
    # 
    V1Money surcharge_money?;
    # A list of all surcharges associated with the payment.
    V1PaymentSurcharge[] surcharges?;
    # 
    V1Money swedish_rounding_money?;
    # 
    V1Money tax_money?;
    # All of the tenders associated with the payment.
    V1Tender[] tender?;
    # 
    V1Money tip_money?;
    # 
    V1Money total_collected_money?;
};

# Represents a bulk create request for `TeamMember` objects.
public type BulkCreateTeamMembersRequest record {
    # The data used to create the `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
    record {} team_members;
};

# A request to update a `BreakType`.
public type UpdateBreakTypeRequest record {
    # A defined break template that sets an expectation for possible `Break`
    # instances on a `Shift`.
    BreakType break_type;
};

# A request to accumulate points for a purchase.
public type AccumulateLoyaltyPointsRequest record {
    # Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
    LoyaltyEventAccumulatePoints accumulate_points;
    # A unique string that identifies the `AccumulateLoyaltyPoints` request. 
    # Keys can be any valid string but must be unique for every request.
    @constraint:String {maxLength: 128, minLength: 1}
    string idempotency_key;
    # The [location](https://developer.squareup.com/reference/square_2021-08-18/objects/Location) where the purchase was made.
    string location_id;
};

# Represents an applied portion of a tax to a line item in an order.
# 
# Order-scoped taxes automatically include the applied taxes in each line item.
# Line item taxes must be referenced from any applicable line items.
# The corresponding applied money is automatically computed, based on the
# set of participating line items.
public type OrderLineItemAppliedTax record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money applied_money?;
    # The `uid` of the tax for which this applied tax represents. It must reference
    # a tax present in the `order.taxes` field.
    # 
    # This field is immutable. To change which taxes apply to a line item, delete and add a new
    # `OrderLineItemAppliedTax`.
    @constraint:String {maxLength: 60, minLength: 1}
    string tax_uid;
    # A unique ID that identifies the applied tax only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# Describes a `CreateInvoice` request.
public type CreateInvoiceRequest record {
    # A unique string that identifies the `CreateInvoice` request. If you do not 
    # provide `idempotency_key` (or provide an empty string as the value), the endpoint 
    # treats each request as independent.
    # 
    # For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 128}
    string idempotency_key?;
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Manage Invoices Using the Invoices API](https://developer.squareup.com/docs/invoices-api/overview).
    Invoice invoice;
};

# Disables the card, preventing any further updates or charges. Disabling
# an already disabled card is allowed but has no effect. Accessible via
# HTTP requests at POST https://connect.squareup.com/v2/cards/{card_id}/disable
public type DisableCardRequest record {
};

# 
public type GiftCardActivityType string;

# Represents a response from a search request containing a filtered list of `TeamMember` objects.
public type SearchTeamMembersResponse record {
    # The opaque cursor for fetching the next page. For more information, see
    # [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # The errors that occurred during the request.
    Error[] errors?;
    # The filtered list of `TeamMember` objects.
    TeamMember[] team_members?;
};

# A lightweight description of an [order](https://developer.squareup.com/reference/square_2021-08-18/objects/Order) that is returned when 
# `returned_entries` is `true` on a [SearchOrdersRequest](https://developer.squareup.com/reference/square_2021-08-18/orders-api/search-orders).
public type OrderEntry record {
    # The location ID the order belongs to.
    string location_id?;
    # The ID of the order.
    string order_id?;
    # The version number, which is incremented each time an update is committed to the order.
    # Orders that were not created through the API do not include a version number and
    # therefore cannot be updated.
    # 
    # [Read more about working with versions.](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders)
    int 'version?;
};

# 
public type RetrieveOrderRequest record {
};

# A response that contains the loyalty program.
public type RetrieveLoyaltyProgramResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # Represents a Square loyalty program. Loyalty programs define how buyers can earn points and redeem points for rewards. 
    # Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. 
    # For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
    LoyaltyProgram program?;
};

# The timeline for card payments.
public type CardPaymentTimeline record {
    # The timestamp when the payment was authorized, in RFC 3339 format.
    string authorized_at?;
    # The timestamp when the payment was captured, in RFC 3339 format.
    string captured_at?;
    # The timestamp when the payment was voided, in RFC 3339 format.
    string voided_at?;
};

# 
public type UpdateItemTaxesResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
    string updated_at?;
};

# 
public type V1ListEmployeeRolesRequest record {
    # A pagination cursor to retrieve the next set of results for your
    # original query to the endpoint.
    string batch_token?;
    # The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
    int 'limit?;
    # The order in which employees are listed in the response, based on their created_at field.Default value: ASC
    string 'order?;
};

# 
public type CreateBookingResponse record {
    # Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service
    # at a given location to a requesting customer in one or more appointment segments.
    Booking booking?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a response from a retrieve request containing the specified `WageSetting` object or error messages.
public type RetrieveWageSettingResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # An object representing a team member's wage information.
    WageSetting wage_setting?;
};

# Represents a group of customer profiles. 
# 
# Customer groups can be created, be modified, and have their membership defined using 
# the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
public type CustomerGroup record {
    # The timestamp when the customer group was created, in RFC 3339 format.
    string created_at?;
    # A unique Square-generated ID for the customer group.
    @constraint:String {maxLength: 255}
    string id?;
    # The name of the customer group.
    string name;
    # The timestamp when the customer group was last updated, in RFC 3339 format.
    string updated_at?;
};

# 
public type GetTerminalRefundResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
    # 
    TerminalRefund refund?;
};

# Defines the fields that are included in requests to
# the __ListLocations__ endpoint.
public type ListLocationsRequest record {
};

# A filter to select customers based on exact or fuzzy matching of
# customer attributes against a specified query. Depending on the customer attributes, 
# the filter can be case-sensitive. This filter can be exact or fuzzy, but it cannot be both.
public type CustomerTextFilter record {
    # Use the exact filter to select customers whose attributes match exactly the specified query.
    string exact?;
    # Use the fuzzy filter to select customers whose attributes match the specified query 
    # in a fuzzy manner. When the fuzzy option is used, search queries are tokenized, and then 
    # each query token must be matched somewhere in the searched attribute. For single token queries, 
    # this is effectively the same behavior as a partial match operation.
    string fuzzy?;
};

# Defines the parameters for a `DeprecatedCreateDisputeEvidenceText` request.
public type DeprecatedCreateDisputeEvidenceTextRequest record {
    # The evidence string.
    @constraint:String {maxLength: 500, minLength: 1}
    string evidence_text;
    # The type of evidence you are uploading.
    string evidence_type?;
    # The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    @constraint:String {maxLength: 45, minLength: 1}
    string idempotency_key;
};

# A response that includes the points that the buyer can earn from 
# a specified purchase.
public type CalculateLoyaltyPointsResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
    # The points that the buyer can earn from a specified purchase.
    int points?;
};

# The type of the dispute evidence.
public type DisputeEvidenceType string;

# The status of the Employee being retrieved.
public type EmployeeStatus string;

# Request object for fetching a specific `BankAccount`
# by the object ID.
public type GetBankAccountByV1IdRequest record {
};

# Defines the response returned by [ListPaymentRefunds](https://developer.squareup.com/reference/square_2021-08-18/refunds-api/list-payment-refunds).
# 
# Either `errors` or `refunds` is present in a given response (never both).
public type ListPaymentRefundsResponse record {
    # The pagination cursor to be used in a subsequent request. If empty,
    # this is the final response.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
    string cursor?;
    # Information about errors encountered during the request.
    Error[] errors?;
    # The list of requested refunds.
    PaymentRefund[] refunds?;
};

# Provides metadata when the event `type` is `OTHER`.
public type LoyaltyEventOther record {
    # The Square-assigned ID of the [loyalty program](https://developer.squareup.com/reference/square_2021-08-18/objects/LoyaltyProgram).
    @constraint:String {maxLength: 36, minLength: 1}
    string loyalty_program_id;
    # The number of points added or removed.
    int points;
};

# Defines the possible types for a custom attribute.
public type CatalogCustomAttributeDefinitionType string;

# Defines the body parameters that can be included in a request to the
# [UpdateCustomerGroup](https://developer.squareup.com/reference/square_2021-08-18/customer-groups-api/update-customer-group) endpoint.
public type UpdateCustomerGroupRequest record {
    # Represents a group of customer profiles. 
    # 
    # Customer groups can be created, be modified, and have their membership defined using 
    # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
    CustomerGroup group;
};

# 
public type OrderFulfillmentUpdated record {
    # The timestamp for when the order was created, in RFC 3339 format.
    string created_at?;
    # The fulfillments that were updated with this version change.
    OrderFulfillmentUpdatedUpdate[] fulfillment_update?;
    # The ID of the seller location that this order is associated with.
    string location_id?;
    # The order's unique ID.
    string order_id?;
    # The state of the order.
    string state?;
    # The timestamp for when the order was last updated, in RFC 3339 format.
    string updated_at?;
    # The version number, which is incremented each time an update is committed to the order.
    # Orders that were not created through the API do not include a version number and
    # therefore cannot be updated.
    # 
    # [Read more about working with versions.](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders)
    int 'version?;
};

# Represents a `DeleteSnippet` response.
public type DeleteSnippetResponse record {
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Represents a payment request for an [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice). Invoices can specify a maximum
# of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information, 
# see [Payment requests](https://developer.squareup.com/docs/invoices-api/overview#payment-requests).
# 
# Adding `INSTALLMENT` payment requests to an invoice requires an 
# [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
public type InvoicePaymentRequest record {
    # The payment method for an automatic payment.
    # 
    # The default value is `NONE`.
    string automatic_payment_source?;
    # The ID of the credit or debit card on file to charge for the payment request. To get the cards on file for a customer,
    # call [ListCards](https://developer.squareup.com/reference/square_2021-08-18/cards-api/list-cards) and include the `customer_id` of the invoice recipient.
    @constraint:String {maxLength: 255, minLength: 1}
    string card_id?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money computed_amount_money?;
    # The due date (in the invoice's time zone) for the payment request, in `YYYY-MM-DD` format. This field
    # is required to create a payment request.
    # 
    # After this date, the invoice becomes overdue. For example, a payment `due_date` of 2021-03-09 with a `timezone`
    # of America/Los\_Angeles becomes overdue at midnight on March 9 in America/Los\_Angeles (which equals a UTC
    # timestamp of 2021-03-10T08:00:00Z).
    string due_date?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money fixed_amount_requested_money?;
    # Specifies the amount for the payment request in percentage:
    # 
    # - When the payment `request_type` is `DEPOSIT`, it is the percentage of the order's total amount.
    # - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the order's total less 
    # the deposit, if requested. The sum of the `percentage_requested` in all installment 
    # payment requests must be equal to 100.
    # 
    # You cannot specify this when the payment `request_type` is `BALANCE` or when the 
    # payment request specifies the `fixed_amount_requested_money` field.
    string percentage_requested?;
    # A list of one or more reminders to send for the payment request.
    InvoicePaymentReminder[] reminders?;
    # Indicates how Square processes the payment request. DEPRECATED at version 2021-01-21. Replaced by the
    # `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source` fields.
    # 
    # One of the following is required when creating an invoice:
    # - (Recommended) The `delivery_method` field of the invoice. To configure an automatic payment, the
    # `automatic_payment_source` field of the payment request is also required.
    # - This `request_method` field. Note that `invoice` objects returned in responses do not include `request_method`.
    string request_method?;
    # Identifies the payment request type. This type defines how the payment request amount is determined. 
    # This field is required to create a payment request.
    string request_type?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money rounding_adjustment_included_money?;
    # If set to true, the Square-hosted invoice page (the `public_url` field of the invoice) 
    # provides a place for the customer to pay a tip. 
    # 
    # This field is allowed only on the final payment request  
    # and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
    boolean tipping_enabled?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money total_completed_amount_money?;
    # The Square-generated ID of the payment request in an [invoice](https://developer.squareup.com/reference/square_2021-08-18/objects/Invoice).
    @constraint:String {maxLength: 255, minLength: 1}
    string uid?;
};

# Defines the fields in a `DeleteDisputeEvidence` response.
public type DeleteDisputeEvidenceResponse record {
    # Information about errors encountered during the request.
    Error[] errors?;
};

# 
public type RetrieveInventoryPhysicalCountResponse record {
    # Represents the quantity of an item variation that is physically present
    # at a specific location, verified by a seller or a seller's employee. For example,
    # a physical count might come from an employee counting the item variations on
    # hand or from syncing with an external system.
    InventoryPhysicalCount count?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# Contains information about the recipient of a fulfillment.
public type OrderFulfillmentRecipient record {
    # Represents a postal address in a country. The address format is based 
    # on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, 
    # see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). 
    # This format has dedicated fields for four address components: postal code, 
    # locality (city), administrative district (state, prefecture, or province), and 
    # sublocality (town or village). These components have dedicated fields in the 
    # `Address` object because software sometimes behaves differently based on them. 
    # For example, sales tax software may charge different amounts of sales tax 
    # based on the postal code, and some software is only available in 
    # certain states due to compliance reasons.
    # 
    # For the remaining address components, the `Address` type provides the 
    # `address_line_1` and `address_line_2` fields for free-form data entry. 
    # These fields are free-form because the remaining address components have 
    # too many variations around the world and typical software does not parse 
    # these components. These fields enable users to enter anything they want. 
    # 
    # Note that, in the current implementation, all other `Address` type fields are blank. 
    # These include `address_line_3`, `sublocality_2`, `sublocality_3`, 
    # `administrative_district_level_2`, `administrative_district_level_3`, 
    # `first_name`, `last_name`, and `organization`. 
    # 
    # When it comes to localization, the seller's language preferences 
    # (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) 
    # are ignored for addresses. Even though Square products (such as Square Point of Sale 
    # and the Seller Dashboard) mostly use a seller's language preference in 
    # communication, when it comes to addresses, they will use English for a US address, 
    # Japanese for an address in Japan, and so on.
    Address address?;
    # The customer ID of the customer associated with the fulfillment.
    # 
    # If `customer_id` is provided, the fulfillment recipient's `display_name`,
    # `email_address`, and `phone_number` are automatically populated from the
    # targeted customer profile. If these fields are set in the request, the request
    # values overrides the information from the customer profile. If the
    # targeted customer profile does not contain the necessary information and
    # these fields are left unset, the request results in an error.
    @constraint:String {maxLength: 191}
    string customer_id?;
    # The display name of the fulfillment recipient.
    # 
    # If provided, the display name overrides the value pulled from the customer profile indicated by `customer_id`.
    @constraint:String {maxLength: 255}
    string display_name?;
    # The email address of the fulfillment recipient.
    # 
    # If provided, the email address overrides the value pulled from the customer profile indicated by `customer_id`.
    @constraint:String {maxLength: 255}
    string email_address?;
    # The phone number of the fulfillment recipient.
    # 
    # If provided, the phone number overrides the value pulled from the customer profile indicated by `customer_id`.
    @constraint:String {maxLength: 17}
    string phone_number?;
};

public type Reason anydata;

# Response object returned by the [CreateLocation](https://developer.squareup.com/reference/square_2021-08-18/locations-api/create-location) endpoint.
public type CreateLocationResponse record {
    # Information on errors encountered during the request.
    Error[] errors?;
    # 
    Location location?;
};

# Defines the fields that are included in the response body of
# a request to the `ListCustomers` endpoint.
# 
# Either `errors` or `customers` is present in a given response (never both).
public type ListCustomersResponse record {
    # A pagination cursor to retrieve the next set of results for the
    # original query. A cursor is only present if the request succeeded and additional results
    # are available.
    # 
    # For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    string cursor?;
    # An array of `Customer` objects that match the provided query.
    Customer[] customers?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The possible subscription event types.
public type SubscriptionEventSubscriptionEventType string;

# A modifier applicable to items at the time of sale.
public type CatalogModifier record {
    # The ID of the `CatalogModifierList` associated with this modifier.
    string modifier_list_id?;
    # The modifier name.  This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
    @constraint:String {maxLength: 255}
    string name?;
    # Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
    int ordinal?;
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money price_money?;
};

# Types of location where service is provided.
public type BusinessAppointmentSettingsBookingLocationType string;

# 
public type V1RetrieveEmployeeRequest record {
};

# Represents a Quick Amount in the Catalog.
public type CatalogQuickAmount record {
    # Represents an amount of money. `Money` fields can be signed or unsigned.
    # Fields that do not explicitly define whether they are signed or unsigned are
    # considered unsigned and can only hold positive amounts. For signed fields, the
    # sign of the value indicates the purpose of the money transfer. See
    # [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)
    # for more information.
    Money amount;
    # The order in which this Quick Amount should be displayed.
    int ordinal?;
    # Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100].
    # MANUAL type amount will always have score = 100.
    int score?;
    # Represents the type of the Quick Amount.
    string 'type;
};

# 
public type BatchRetrieveInventoryCountsResponse record {
    # The current calculated inventory counts for the requested objects
    # and locations.
    InventoryCount[] counts?;
    # The pagination cursor to be used in a subsequent request. If unset,
    # this is the final response.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# 
public type ListEmployeesResponse record {
    # The token to be used to retrieve the next page of results.
    string cursor?;
    # 
    Employee[] employees?;
    # Any errors that occurred during the request.
    Error[] errors?;
};

# The capabilities a location may have.
public type LocationCapability string;

# The set of line items, service charges, taxes, discounts, tips, and other items being returned in an order.
public type OrderReturn record {
    # A collection of various money amounts.
    OrderMoneyAmounts return_amounts?;
    # A collection of references to discounts being returned for an order, including the total
    # applied discount amount to be returned. The discounts must reference a top-level discount ID
    # from the source order.
    OrderReturnDiscount[] return_discounts?;
    # A collection of line items that are being returned.
    OrderReturnLineItem[] return_line_items?;
    # A collection of service charges that are being returned.
    OrderReturnServiceCharge[] return_service_charges?;
    # A collection of references to taxes being returned for an order, including the total
    # applied tax amount to be returned. The taxes must reference a top-level tax ID from the source
    # order.
    OrderReturnTax[] return_taxes?;
    # A rounding adjustment of the money being returned. Commonly used to apply cash rounding
    # when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
    OrderRoundingAdjustment rounding_adjustment?;
    # An order that contains the original sale of these return line items. This is unset
    # for unlinked returns.
    string source_order_id?;
    # A unique ID that identifies the return only within this order.
    @constraint:String {maxLength: 60}
    string uid?;
};

# The query expression to specify the key to sort search results.
public type CatalogQuerySortedAttribute record {
    # The attribute whose value is used as the sort key.
    @constraint:String {minLength: 1}
    string attribute_name;
    # The first attribute value to be returned by the query. Ascending sorts will return only
    # objects with this value or greater, while descending sorts will return only objects with this value
    # or less. If unset, start at the beginning (for ascending sorts) or end (for descending sorts).
    string initial_attribute_value?;
    # The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending).
    string sort_order?;
};

# Represents a response from a bulk create request containing the created `TeamMember` objects or error messages.
public type BulkCreateTeamMembersResponse record {
    # The errors that occurred during the request.
    Error[] errors?;
    # The successfully created `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
    record {} team_members?;
};

# Defines the fields that are included in the response body of
# a request to the [ListRefunds](https://developer.squareup.com/reference/square_2021-08-18/transactions-api/list-refunds) endpoint.
# 
# One of `errors` or `refunds` is present in a given response (never both).
public type ListRefundsResponse record {
    # A pagination cursor for retrieving the next set of results,
    # if any remain. Provide this value as the `cursor` parameter in a subsequent
    # request to this endpoint.
    # 
    # See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    string cursor?;
    # Any errors that occurred during the request.
    Error[] errors?;
    # An array of refunds that match your query.
    Refund[] refunds?;
};

# Configuration associated with Custom Attribute Definitions of type `STRING`.
public type CatalogCustomAttributeDefinitionStringConfig record {
    # If true, each Custom Attribute instance associated with this Custom Attribute
    # Definition must have a unique value within the seller's catalog. For
    # example, this may be used for a value like a SKU that should not be
    # duplicated within a seller's catalog. May not be modified after the
    # definition has been created.
    boolean enforce_uniqueness?;
};

# Indicates whether customers should be included in, or excluded from,
# the result set when they match the filtering criteria.
public type CustomerInclusionExclusion string;

# 
public type BatchRetrieveInventoryCountsRequest record {
    # The filter to return results by `CatalogObject` ID.
    # The filter is applicable only when set.  The default is null.
    string[] catalog_object_ids?;
    # A pagination cursor returned by a previous call to this endpoint.
    # Provide this to retrieve the next set of results for the original query.
    # 
    # See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    string cursor?;
    # The filter to return results by `Location` ID. 
    # This filter is applicable only when set. The default is null.
    string[] location_ids?;
    # The filter to return results by `InventoryState`. The filter is only applicable when set.
    # Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`.
    # The default is null.
    string[] states?;
    # The filter to return results with their `calculated_at` value 
    # after the given time as specified in an RFC 3339 timestamp. 
    # The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
    string updated_after?;
};

# Defines a filter used in a search for `Shift` records. `AND` logic is
# used by Square's servers to apply each filter property specified.
public type ShiftFilter record {
    # Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use `team_member_ids` instead.
    string[] employee_ids?;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange end?;
    # Fetch shifts for the specified location.
    ShiftfilterLocationidsItemsString[] location_ids;
    # Represents a generic time range. The start and end values are
    # represented in RFC 3339 format. Time ranges are customized to be
    # inclusive or exclusive based on the needs of a particular endpoint.
    # Refer to the relevant endpoint-specific documentation to determine
    # how time ranges are handled.
    TimeRange 'start?;
    # Fetch a `Shift` instance by `Shift.status`.
    string status?;
    # Fetch shifts for the specified team members. Replaced `employee_ids` at version "2020-08-26".
    ShiftfilterTeammemberidsItemsString[] team_member_ids;
    # A `Shift` search query filter parameter that sets a range of days that
    # a `Shift` must start or end in before passing the filter condition.
    ShiftWorkday workday?;
};
