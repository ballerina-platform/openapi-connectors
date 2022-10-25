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

public type RefundServiceArr RefundService[];

public type AddressServiceArr AddressService[];

public type ChargeServiceArr ChargeService[];

public type OrderServiceArr OrderService[];

public type SubscriptionServiceArr SubscriptionService[];

public type SubscriptionHistoryServiceArr SubscriptionHistoryService[];

# An optional coupon that is applied to the subscription rebill
public type SubscriptionserviceCoupon record {
    # The ID of the coupon that was used on the subscription
    int? id?;
    # Whether the coupon applies only once or for recurring charges also
    string? charge_instance?;
    # The code of the coupon used
    string? code?;
    # The type of discount applied
    string? 'type?;
    # The flat_rate discount amount (in cents) on the subscription
    int? discount_amount?;
    # The percentage discount on the subscription
    int? discount_percentage?;
};

# Customer
public type CustomerService record {
    # The SamCart ID of the customer
    int? id?;
    # The first name of the customer
    string? first_name?;
    # The last name of the customer
    string? last_name?;
    # The email address of the customer
    string? email?;
    # The phone number of the customer
    string? phone?;
    # The tags applied to the customer
    CustomerserviceCustomerTags[]? customer_tags?;
    # The lifetime value (in cents) of the customer. Value is for live data only
    int? lifetime_value?;
    # The UTC date and time when the customer information was updated
    string? updated_at?;
    # The UTC date and time when the customer was created
    string? created_at?;
    # Addresses associated with the customer
    AddressService[]? addresses?;
};

public type OrderserviceCartItems record {
    # The ID for the specific cart item
    int? id?;
    # The SamCart ID for the product
    int? product_id?;
    # The subscription ID for the product. If the cart item is for a non-subscription product the value will be null
    int? subscription_id?;
    # The optional product SKU of the cart item purchased
    string? sku?;
    # An optional product name displayed on the marketplace dashboard
    string? internal_product_name?;
    # The product name displayed to customers
    string? product_name?;
    # The SamCart ID for the charge
    int? charge_id?;
    # Indicates how the product is priced
    string? pricing_type?;
    # The processor ID generated for the charge
    string? processor_transaction_id?;
    # The 3 letter identifier for the currency for the charge on the cart item
    string? currency?;
    # The quantity of the cart item purchased
    int? quantity?;
    # The current status of the charge on the cart item
    string? status?;
    # The pricing structure for one-time purchases and for the first charge on subscription products
    OrderserviceInitialPrice? initial_price?;
    # The pricing structure for limited and recurring subscription products. This structure could differ from the initial price.
    OrderserviceRecurringPrice? recurring_price?;
    # An optional coupon that was applied to the cart item
    OrderserviceCoupon? coupon?;
};

public type InlineResponse200 record {
    ChargeService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

# Subscription
public type SubscriptionService record {
    # The SamCart ID for the subscription
    int? id?;
    # The SamCart ID for the customer that created the charge
    int? customer_id?;
    # The SamCart ID of the affiliate credited for the order.
    int? affiliate_id?;
    # The SamCart ID for the order. For subscriptions, this will be the order ID of the original purchase.
    int? order_id?;
    # The SamCart ID for a product in the cart
    int? product_id?;
    # The optional product SKU for the subscription
    string? sku?;
    # The status of the subscription
    string? status?;
    # Indicates the format of the subscription
    string? 'type?;
    # The name of the product for the subscription
    string? product_name?;
    # An optional product name displayed on the marketplace dashboard for the subscription
    string? internal_product_name?;
    # The pricing structure for the first charge of the subscription
    SubscriptionserviceInitialPrice? initial_price?;
    # The pricing structure for all the recurring charges of the subscription
    SubscriptionserviceRecurringPrice? recurring_price?;
    # An optional coupon that is applied to the subscription rebill
    SubscriptionserviceCoupon? coupon?;
    # The name of the processor for the order
    string? processor_name?;
    # Indicates whether the transaction was done while the product was in test mode.
    boolean? test_mode?;
    # The last 4 digits of the card that was used. PayPal charges will have a null value.
    decimal? card_used?;
    # The UTC date and time the subscription was created. This is also when the original order was created.
    string? created_at?;
    # The UTC date and time the first rebill occurred. For subscriptions with trials, this will be the first rebill after the trial.
    string? start_date?;
    # The UTC date and time that a limited subscription will end. Recurring subscriptions will not have a value.
    string? end_date?;
    # The UTC date and time of the next rebill for the subscription
    string? next_rebilling_date?;
    # The number of unsuccessful charges for this subscription
    int? total_failed_charges?;
};

# Optional information for paginating large data sets.
public type Pagination record {
    # A URL to the next page of data to be retrieve. If current page is the last page this value will be null.
    string? next?;
    # A URL to the previous page of data to be retrieve. If current page is the first page this value will be null.
    string? prev?;
};

# Address
public type AddressService record {
    # The type of address for the customer
    string? 'type?;
    # The street for the customer
    string? street?;
    # The postal code for the customer
    string? postal_code?;
    # The city name for the customer
    string? city?;
    # The 2-letter state code for US customers. For non-US addresses this value will be null.
    string? state?;
    # The optional sub-divided area of a country for international customers. For US addresses this value will be null.
    string? region?;
    # The country for the customer
    string? country?;
};

public type ProductserviceProductTags record {
    # The name of the product tag
    string? name?;
};

public type CustomerserviceCustomerTags record {
    # The name of the customer tag
    string? name?;
};

# Subscription History
public type SubscriptionHistoryService record {
    # The SamCart ID for the subscription history record
    int? id?;
    # The SamCart ID for the subscription
    int? subscription_id?;
    # The status of the subscription
    string? new_status?;
    # The source of the change
    string? 'source?;
    # The type of change
    string? 'type?;
    # The UTC date and time that the change was made
    string? change_date?;
};

# Refund
public type RefundService record {
    # The SamCart ID for the refund
    int? id?;
    # The SamCart ID for the charge
    int? charge_id?;
    # The ID for the refunded cart item
    int? cart_item_id?;
    # The UTC date and time the refund was issued
    string? created_at?;
    # Indicates whether the transaction was done while the transaction was in test mode.
    boolean? test_mode?;
    # Indicates whether a refund and the type of refund. If no refund was created the value will be null.
    string? charge_refund_status?;
    # This will match the currency that the original charge was created in and will be the currency of the created refund
    string? currency?;
    # The total refund amount (in cents)
    int? refund_amount?;
};

# Charge
public type ChargeService record {
    # The SamCart ID for the charge
    int? id?;
    # The SamCart ID for the customer that created the charge
    int? customer_id?;
    # The SamCart ID of the affiliate credited for the order
    int? affiliate_id?;
    # The SamCart ID for the order. For subscriptions, this will be the order ID of the original purchase
    int? order_id?;
    # The SamCart ID for the subscription rebill. If the charge is for a non-subscription product, this will be null.
    int? subscription_rebill_id?;
    # Indicates whether the transaction was done while the product was in test mode
    boolean? test_mode?;
    # The name of the processor for the order
    string? processor_name?;
    # The processor ID generated for the charge
    string? processor_transaction_id?;
    # The 3 letter identifier for the currency for the charge
    string? currency?;
    # The last 4 digits of the card that was used. PayPal charges will have a null value.
    decimal? card_used?;
    # Indicates whether a refund and the type of refund. If no refund was created the value will be null.
    string? charge_refund_status?;
    # The UTC date and time for when the order was created
    string? order_date?;
    # The UTC date and time that the charge was created
    string? created_at?;
    # The total (in cents) for the charge including taxes and shipping fees
    int? total?;
};

public type ProductserviceBundledProducts record {
    # The SamCart ID of the bundled product
    int? product_id?;
    # The bundled product name displayed to customers
    string? product_name?;
};

# Failed Charge
public type FailedChargeService record {
    # The SamCart ID for the charge
    int? id?;
    # The SamCart ID for the customer that created the charge
    int? customer_id?;
    # The SamCart ID of the affiliate credited for the order
    int? affiliate_id?;
    # The SamCart ID for the order. For subscriptions, this will be the order ID of the original purchase
    int? order_id?;
    # The SamCart ID for the subscription rebill. If the charge is for a non-subscription product, this will be null.
    int? subscription_rebill_id?;
    # Indicates whether the transaction was done while the product was in test mode
    boolean? test_mode?;
    # The name of the processor for the order
    string? processor_name?;
    # The processor ID generated for the charge
    string? processor_transaction_id?;
    # The error message provided by the payment processor
    string? 'error?;
    # The 3 letter identifier for the currency for the charge
    string? currency?;
    # The last 4 digits of the card that was used. PayPal charges will have a null value.
    decimal? card_used?;
    # The UTC date and time that the charge was created
    string? created_at?;
    # The total (in cents) for the charge including taxes and shipping fees
    int? total?;
};

# An optional coupon that was applied to the cart item
public type OrderserviceCoupon record {
    # The ID of the coupon that was used on the cart item
    int? id?;
    # Whether the coupon applies only once or for recurring charges also
    string? charge_instance?;
    # The code of the coupon used
    string? code?;
    # The type of discount applied
    string? 'type?;
    # The flat_rate discount amount (in cents) on the cart item
    int? discount_amount?;
    # The percentage discount on the cart item
    int? discount_percentage?;
};

# Product
public type ProductService record {
    # The SamCart ID of the product
    int? id?;
    # An optional product SKU displayed on the marketplace dashboard
    string? sku?;
    # An optional product name displayed on the marketplace dashboard
    string? internal_product_name?;
    # The product name displayed to customers
    string? product_name?;
    # The optional description of the product
    string? description?;
    # The 3 letter identifier for the currency currently configured on the product. This can be changed.
    string? currency?;
    # The price of the product. For subscription products, it is the initial price (in cents)
    float? price?;
    # Indicates the type of product being sold
    string? product_category?;
    # Indicates how the product will be priced
    string? pricing_type?;
    # Indicates the current status of the product
    string? status?;
    # Indicates if the product is currently configured to have taxes. This can be changed.
    boolean? taxes?;
    # The name of the upsell funnel attached to the product
    string? upsell_funnel?;
    # An optional list of additional products added with the product before checkout
    ProductserviceOrderBumps[]? order_bumps?;
    # An optional list of products bundled to the product
    ProductserviceBundledProducts[]? bundled_products?;
    # The URL slug for the product
    string? slug?;
    # An optional custom domain used for the product
    string? custom_domain?;
    # An optional list of product tags
    ProductserviceProductTags[]? product_tags?;
    # The UTC date and time the product was created
    string? created_at?;
    # The UTC date and time the product was updated
    string? updated_at?;
    # The UTC date and time the product was archived. If the product has not been archive the value will be null.
    string? archived_date?;
};

# The pricing structure for the first charge of the subscription
public type SubscriptionserviceInitialPrice record {
    # The initial price (in cents) excluding discount, taxes and shipping fees
    int? subtotal?;
    # The initial tax fees (in cents)
    int? taxes?;
    # The initial shipping fees (in cents)
    int? shipping?;
    # The initial price (in cents) including discount, taxes and shipping fees
    int? total?;
};

public type InlineResponse2001 record {
    CustomerService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

# The pricing structure for one-time purchases and for the first charge on subscription products
public type OrderserviceInitialPrice record {
    # The price for the cart item (in cents) excluding discount, taxes and shipping fees
    int? subtotal?;
    # The tax fees (in cents) for the cart item
    int? taxes?;
    # The shipping fees (in cents) for the cart item
    int? shipping?;
    # The price for the cart item (in cents) including discount, taxes and shipping fees
    int? total?;
};

public type InlineResponse2003 record {
    OrderService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

public type InlineResponse2002 record {
    FailedChargeService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

# Order
public type OrderService record {
    # The SamCart ID of the order
    int? id?;
    # The SamCart ID of the customer
    int? customer_id?;
    # The SamCart ID of the affiliate credited for the order
    int? affiliate_id?;
    # Indicates whether the transaction was done while the product was in test mode
    boolean? test_mode?;
    # The UTC date and time for when the order was created
    string? order_date?;
    # A list of cart items on the order
    OrderserviceCartItems[]? cart_items?;
    # The total price of the order (in cents) excluding discount, shipping and tax fees
    int? subtotal?;
    # The total discount (in cents) on the order
    int? discount?;
    # The total of tax fees (in cents) of the order
    int? taxes?;
    # The total of shipping fees (in cents) of the order
    int? shipping?;
    # The total price of the order (in cents) including discount, shipping and tax fees
    int? total?;
    # The last 4 digits of the card that was used. PayPal charges will have a null value.
    string? card_used?;
    # The name of the processor for the order
    string? processor_name?;
    # Optional custom fields applied to the order
    record {} custom_fields?;
};

# Subscription Plan
public type SubscriptionPlanService record {
    # The SamCart ID for the subscription plan
    int? id?;
    # The SamCart ID for the product
    int? product_id?;
    # The current status of the subscription plan
    string? plan_status?;
    # The UTC date and time for when the subscription plan was archived
    string? plan_archived_date?;
    # For a limited subscription, this indicates the number of rebills
    int? plan_duration?;
    # Indicates how frequently the subscription will rebill
    string? plan_frequency?;
    # The recurring price of subscription exclusing tax and shipping fees
    int? plan_price?;
    # The number of days that the subscription has for a trial
    int? trial_period?;
    # The number of days between each subscription rebill, used for 'days' frequency only
    int? rebill_days?;
    # Indicates whether the subscription will be Stripe-managed
    boolean? stripe_compatible?;
    # For Stripe-managed subscriptions, this is the plan ID from within Stripe
    string? stripe_plan_id?;
    # Indicates whether the subscription is associated with a Stripe testing environment
    boolean? on_stripe_sandbox?;
    # Indicates whether the shipping prices for the subscription will be charged at every subscription rebill
    boolean? recurring_shipping?;
};

public type InlineResponse2005 record {
    SubscriptionService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

# The pricing structure for all the recurring charges of the subscription
public type SubscriptionserviceRecurringPrice record {
    # The recurring price (in cents) excluding discount, taxes and shipping fees
    int? subtotal?;
    # The recurring tax fees (in cents)
    int? taxes?;
    # The recurring shipping fees (in cents)
    int? shipping?;
    # The recurring price (in cents) including discount, taxes and shipping fees
    int? total?;
};

public type InlineResponse2004 record {
    ProductService[]? data?;
    # Optional information for paginating large data sets.
    Pagination? pagination?;
};

# The pricing structure for limited and recurring subscription products. This structure could differ from the initial price.
public type OrderserviceRecurringPrice record {
    # The recurring price for the cart item (in cents) excluding discount, taxes and shipping fees
    int? subtotal?;
    # The recurring tax fees (in cents) for the cart item
    int? taxes?;
    # The recurring shipping fees (in cents) for the cart item
    int? shipping?;
    # The recurring price for the cart item (in cents) including discount, taxes and shipping fees
    int? total?;
};

public type ProductserviceOrderBumps record {
    # The SamCart ID for the additional product
    int? product_id?;
    # The name of the additional product
    string? product_name?;
};
