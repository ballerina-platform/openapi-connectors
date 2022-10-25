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

# The current total discounts on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
public type CurrentTotalDiscountsSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# Address
public type Address record {
    # The customer's mailing address.
    string? address1?;
    # An additional field for the customer's mailing address.
    string? address2?;
    # The customer's city, town, or village.
    string? city?;
    # The customer's company.
    string? company?;
    # The customer's country.
    string? country?;
    # The two-letter country code corresponding to the customer's country.
    string? country_code?;
    # The customer's normalized country name.
    string? country_name?;
    # A unique identifier for the customer.
    int? customer_id?;
    # Returns true for each default address.
    boolean? default?;
    # The customer's first name.
    string? first_name?;
    # A unique identifier for the address.
    int? id?;
    # The customer's last name.
    string? last_name?;
    # The customer's first and last names.
    string? name?;
    # The customer's phone number at this address.
    string? phone?;
    # The customer's region name. Typically a province, a state, or a prefecture.
    string? province?;
    # The two-letter code for the customer's region.
    string? province_code?;
    # The customer's postal code, also known as zip, postcode, Eircode, etc.
    string? zip?;
};

# Order adjustment attached to the refund.
public type OrderAdjustment record {
    # The unique identifier for the order adjustment.
    int? id?;
    # The unique identifier for the order that the order adjustment is associated with.
    int? order_id?;
    # The unique identifier for the refund that the order adjustment is associated with.
    int? refund_id?;
    # The value of the discrepancy between the calculated refund and the actual refund. If the kind property's value is shipping_refund, then amount returns the value of shipping charges refunded to the customer.
    int? amount?;
    # The taxes that are added to amount, such as applicable shipping taxes added to a shipping refund.
    string? tax_amount?;
    # The order adjustment type. Valid values are shipping_refund and refund_discrepancy.
    string? kind?;
    # The reason for the order adjustment. To set this value, include discrepancy_reason when you create a refund.
    string? reason?;
};

# The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
public type Customer record {
    # Whether the customer has consented to receive marketing material via email.
    boolean? accepts_marketing?;
    # The date and time (ISO 8601 format) when the customer consented or objected to receiving marketing material by email. Set this value whenever the customer consents or objects to marketing materials.
    string? accepts_marketing_updated_at?;
    # A list of the ten most recently updated addresses for the customer.
    Address[]? addresses?;
    # The three-letter code (ISO 4217 format) for the currency that the customer used when they paid for their last order. Defaults to the shop currency. Returns the shop currency for test orders.
    string? currency?;
    # The date and time (ISO 8601 format) when the customer was created.
    string? created_at?;
    # The customer's first name.
    string? first_name?;
    # The unique email address of the customer. Attempting to assign the same email address to multiple customers returns an error.
    string? email?;
    # Address
    Address? default_address?;
    # A unique identifier for the customer.
    int? id?;
    # The customer's last name.
    string? last_name?;
    # The ID of the customer's last order.
    int? last_order_id?;
    # The name of the customer's last order. This is directly related to the name field on the Order resource.
    string? last_order_name?;
    # Attaches additional metadata to a shop's resources
    Metafield? metafield?;
    # The marketing subscription opt-in level (as described by the M3AAWG best practices guideline) that the customer gave when they consented to receive marketing material by email. If the customer does not accept email marketing, then this property will be set to null.
    string? marketing_opt_in_level?;
    # A unique identifier for the customer that's used with Multipass login.
    string? multipass_identifier?;
    # A note about the customer.
    string? note?;
    # The number of orders associated with this customer.
    int? orders_count?;
    # The unique phone number (E.164 format) for this customer. Attempting to assign the same phone number to multiple customers returns an error. The property can be set using different formats, but each format must represent a number that can be dialed from anywhere in the world.
    string? phone?;
    # The marketing consent information when the customer consented to receiving marketing material by SMS. The phone property is required to create a customer with SMS consent information and to perform an SMS update on a customer that doesn't have a phone number recorded. The customer must have a unique phone number associated to the record.
    SmsMarketingConsent? sms_marketing_consent?;
    # The state of the customer's account with a shop. Default value is disabled.
    string? state?;
    # Tags that the shop owner has attached to the customer, formatted as a string of comma-separated values. A customer can have up to 250 tags. Each tag can have up to 255 characters.
    string? tags?;
    # Whether the customer is exempt from paying taxes on their order. If true, then taxes won't be applied to an order at checkout. If false, then taxes will be applied at checkout.
    boolean? tax_exempt?;
    # Whether the customer is exempt from paying specific taxes on their order. Canadian taxes only.
    string[]? tax_exemptions?;
    # The total amount of money that the customer has spent across their order history.
    string? total_spent?;
    # The date and time (ISO 8601 format) when the customer information was last updated.
    string? updated_at?;
    # Whether the customer has verified their email address.
    boolean? verified_email?;
};

# The current total taxes charged on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
public type CurrentTotalTaxSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# Stacked discount application
public type DiscountApplication record {
    # The method by which the discount application value has been allocated to entitled lines. = ['across', 'each', 'one']
    string? allocation_method?;
    # The discount code that was used to apply the discount.Available only for discount code applications
    string? code?;
    # The description of the discount application, as defined by the merchant or the Shopify Script. Available only for manual and script discount applications
    string? description?;
    # The lines on the order, of the type defined by target_type, that the discount is allocated over = ['all', 'entitled', 'explicit']
    string? target_selection?;
    # The type of line on the order that the discount is applicable on = ['line_item', 'shipping_line']
    string? target_type?;
    # The title of the discount application, as defined by the merchant. Available only for manual discount applications
    string? title?;
    # The discount application type.Valid values:manual The discount was manually applied by the merchant (for example, by using an app or creating a draft order).script: The discount was applied by a Shopify Script.discount_code: The discount was applied by a discount code. = ['discount_code', 'manual', 'script']
    string? 'type?;
    # The value of the discount application as a decimal. This represents the intention of the discount application
    string? value?;
    # The type of the value = ['percentage', 'fixed_amount']
    string? value_type?;
};

# The order risk for an order.
public type OrderRisk record {
    # Whether this order risk is severe enough to force the cancellation of the order. If true, then this order risk is included in the Order canceled message that's shown on the details page of the canceled order.
    boolean? cause_cancel?;
    # The ID of the checkout that the order risk belongs to.
    int? checkout_id?;
    # Whether the order risk is displayed on the order details page in the Shopify admin. If false, then this order risk is ignored when Shopify determines your app's overall risk level for the order.
    boolean? display?;
    # A unique numeric identifier for the order risk.
    int? id?;
    # The message that's displayed to the merchant to indicate the results of the fraud check. The message is displayed only if display is set to true.
    string? merchant_message?;
    # The message that's displayed to the merchant to indicate the results of the fraud check. The message is displayed only if display is set to true.
    string? message?;
    # The ID of the order that the order risk belongs to.
    int? order_id?;
    # The recommended action given to the merchant. Valid values are, `cancel` - There is a high level of risk that this order is fraudulent. The merchant should cancel the order. `investigate` - There is a medium level of risk that this order is fraudulent. The merchant should investigate the order. `accept` - There is a low level of risk that this order is fraudulent. The order risk found no indication of fraud.
    string? recommendation?;
    # A number between 0 and 1 that's assigned to the order. The closer the score is to 1, the more likely it is that the order is fraudulent.
    string? score?;
    # The source of the order risk.
    string? 'source?;
};

# The ID of the physical location where the transaction was processed.
public type LocationID record {
    # The ID of the physical location where the transaction was processed.
    int? id?;
};

# The Product resource lets you update and create products in a merchant's store.
public type Product record {
    # An unsigned 64-bit integer that's used as a unique identifier for the product. Each id is unique across the Shopify system. No two products will have the same id, even if they're from different shops.
    int? id?;
    # The date and time (ISO 8601 format) when the product was created.
    string? created_at?;
    # A unique human-friendly string for the product. Automatically generated from the product's title. Used by the Liquid templating language to refer to objects.
    string? 'handle?;
    # A description of the product. Supports HTML formatting.
    string? body_html?;
    # A list of product image objects, each one representing an image associated with the product.
    ProductImage[]? images?;
    # The custom product properties. For example, Size, Color, and Material. Each product can have up to 3 options and each option value can be up to 255 characters. Product variants are made of up combinations of option values. Options cannot be created without values. To create new options, a variant with an associated option value also needs to be created.
    ProductOption[]? options?;
    # A categorization for the product used for filtering and searching products.
    string? product_type?;
    # The date and time (ISO 8601 format) when the product was published. Can be set to null to unpublish the product from the Online Store channel.
    string? published_at?;
    # Whether the product is published to the Point of Sale channel.
    string? published_scope?;
    # The status of the product.
    string? status?;
    # A string of comma-separated tags that are used for filtering and search. A product can have up to 250 tags. Each tag can have up to 255 characters.
    string? tags?;
    # The suffix of the Liquid template used for the product page. If this property is specified, then the product page uses a template called "product.suffix.liquid", where "suffix" is the value of this property. If this property is "" or null, then the product page uses the default template "product.liquid". (default is null)
    string? template_suffix?;
    # The name of the product.
    string? title?;
    # The date and time (ISO 8601 format) when the product was last modified. A product's updated_at value can change for different reasons. For example, if an order is placed for a product that has inventory tracking set up, then the inventory adjustment is counted as an update.
    string? updated_at?;
    # An array of product variants, each representing a different version of the product. The position property is read-only. The position of variants is indicated by the order in which they are listed.
    ProductVariant[]? variants?;
    # The name of the product's vendor.
    string? vendor?;
};

# The Order object to be created.
public type CreateOrder record {
    # An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
    Order? 'order?;
};

# An adjustment on the transaction showing the amount lost or gained due to fluctuations in the currency exchange rate. Requires the header X-Shopify-Api-Features = include-currency-exchange-adjustments.
public type CurrencyExchangeAdjustment record {
    # The ID of the adjustment.
    string? ID?;
    # The difference between the amounts on the associated transaction and the parent transaction.
    string? adjustment?;
    # The amount of the parent transaction in the shop currency.
    string? original_amount?;
    # The amount of the associated transaction in the shop currency.
    string? final_amount?;
    # The shop currency.
    string? currency?;
};

# The price of the shipping method in both shop and presentment currencies after line-level discounts have been applied.
public type DiscountedPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The Order fulfillment object.
public type OrderFulfillmentObject record {
    # You can use the Fulfillment resource to view, create, modify, or delete an order's or fulfillment order's fulfillments. A fulfillment order represents a group of one or more items in an order that are to be fulfilled from the same location. A fulfillment represents work that is completed as part of a fulfillment order and can include one or more items. You can use the Fulfillment resource to manage fulfillments for both orders and fulfillment orders.
    Fulfillment? fulfillment?;
};

# The total price of the order in shop and presentment currencies.
public type TotalPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The Transaction object.
public type TransactionObject record {
    # Transactions are created for every order that results in an exchange of money. There are five types of transactions. (Authorization: An amount reserved against the cardholder's funding source. Money does not change hands until the authorization is captured, Sale: An authorization and capture performed together in a single step, Capture: A transfer of the money that was reserved during the authorization stage, Void: A cancellation of a pending authorization or capture, Refund: A partial or full return of captured funds to the cardholder. A refund can happen only after a capture is processed.)
    Transaction? 'transaction?;
};

public type ProductObject record {
    # The Product resource lets you update and create products in a merchant's store.
    Product? product?;
};

# The attributes associated with a Shopify Payments refund.
public type PaymentsRefundAttributes record {
    # The current status of the refund. Valid values are pending, failure, success, and error.
    string? status?;
    # A unique number associated with the transaction that can be used to track the refund. This property has a value only for transactions completed with Visa or Mastercard.
    string? acquirer_reference_number?;
};

# The marketing consent information when the customer consented to receiving marketing material by SMS. The phone property is required to create a customer with SMS consent information and to perform an SMS update on a customer that doesn't have a phone number recorded. The customer must have a unique phone number associated to the record.
public type SmsMarketingConsent record {
    # The current SMS marketing state for the customer.
    string? state?;
    # The marketing subscription opt-in level, as described by the M3AAWG best practices guidelines, that the customer gave when they consented to receive marketing material by SMS.
    string? opt_in_level?;
    # The date and time at which the customer consented to receive marketing material by SMS. The customer's consent state reflects the consent record with the most recent last_consent_updated_at date. If no date is provided, then the date and time at which the consent information was sent is used.
    string? consent_updated_at?;
    # The source for whether the customer has consented to receive marketing material by SMS.
    string? consent_collected_from?;
};

# The webhook subscription count object.
public type WebhookCountObject record {
    # Webhook subscription count.
    int? count?;
};

# The webhook object.
public type WebhookObject record {
    # The webhook resource.
    Webhook? webhook?;
};

# The discount applied to the line item or the draft order object. Each draft order object can have one applied_discount object and each draft order line item can have its own applied_discount.
public type AppliedDiscount record {
    # Title of the discount.
    string? title?;
    # Reason for the discount.
    string? description?;
    # The value of the discount. If the type of discount is fixed_amount, then it corresponds to a fixed dollar amount. If the type is percentage, then it corresponds to percentage.
    string? value?;
    # The type of discount. Valid values are percentage, fixed_amount.
    string? value_type?;
    # The applied amount of the discount, based on the setting of value_type. For more information, see Applying discounts.
    string? amount?;
};

# The Draft order object.
public type DraftOrderObject record {
    # An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
    DraftOrder? draft_order?;
};

# The variant's presentment prices and compare-at prices in each of the shop's enabled presentment currencies.
public type PresentmentPrices record {
    # A list of the variant's presentment prices and compare-at prices in each of the shop's enabled presentment currencies.
    PresentmentPrice[]? presentment_prices?;
};

# The total amount allocated to the line item in the presentment currency. Instead of using this field, Shopify recommends using discount_allocations, which provides the same information.
public type TotalDiscountSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The total of all line item prices in shop and presentment currencies.
public type TotalLineItemsPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
public type Order record {
    # The ID of the app that created the order.
    int? app_id?;
    # The mailing address associated with the payment method. This address is an optional field that won't be available on orders that do not require a payment method.
    CustomerAddress? billing_address?;
    # The IP address of the browser used by the customer when they placed the order. Both IPv4 and IPv6 are supported.
    string? browser_ip?;
    # Whether the customer consented to receive email updates from the shop.
    boolean? buyer_accepts_marketing?;
    # The reason why the order was canceled.
    string? cancel_reason?;
    # The date and time when the order was canceled. Returns null if the order isn't canceled.
    string? cancelled_at?;
    # A unique value when referencing the cart that's associated with the order.
    string? cart_token?;
    # A unique value when referencing the checkout that's associated with the order.
    string? checkout_token?;
    # Information about the browser that the customer used when they placed their order
    ClientDetails? client_details?;
    # The date and time (ISO 8601 format) when the order was closed. Returns null if the order isn't closed.
    string? closed_at?;
    # The autogenerated date and time (ISO 8601 format) when the order was created in Shopify. The value for this property cannot be changed.
    string? created_at?;
    # The three-letter code (ISO 4217 format) for the shop currency.
    string? currency?;
    # The current total discounts on the order in the shop currency. The value of this field reflects order edits, returns, and refunds.
    string? current_total_discounts?;
    # The current total discounts on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
    CurrentTotalDiscountsSet? current_total_discounts_set?;
    # The current total duties charged on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
    CurrentTotalDutiesSet? current_total_duties_set?;
    # The current total price of the order in the shop currency. The value of this field reflects order edits, returns, and refunds.
    string? current_total_price?;
    # The current total price of the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
    CurrentTotalPriceSet? current_total_price_set?;
    # The current subtotal price of the order in the shop currency. The value of this field reflects order edits, returns, and refunds.
    string? current_subtotal_price?;
    # The current subtotal price of the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
    CurrentSubtotalPriceSet? current_subtotal_price_set?;
    # The current total taxes charged on the order in the shop currency. The value of this field reflects order edits, returns, or refunds.
    string? current_total_tax?;
    # The current total taxes charged on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
    CurrentTotalTaxSet? current_total_tax_set?;
    # The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
    Customer? customer?;
    # The two or three-letter language code, optionally followed by a region modifier.
    string? customer_locale?;
    # An ordered list of stacked discount applications.
    DiscountApplication[]? discount_applications?;
    # A list of discounts applied to the order.
    DiscountCode[]? discount_codes?;
    # The customer's email address.
    string? email?;
    # Whether taxes on the order are estimated. Many factors can change between the time a customer places an order and the time the order is shipped, which could affect the calculation of taxes. This property returns false when taxes on the order are finalized and aren't subject to any changes.
    boolean? estimated_taxes?;
    # The status of payments associated with the order. Can only be set when the order is created.
    string? financial_status?;
    # An array of fulfillments associated with the order. For more information, see the Fulfillment API.
    Fulfillment[]? fulfillments?;
    # The order's status in terms of fulfilled line items.
    string? fulfillment_status?;
    # The payment gateway used.
    string? gateway?;
    # The ID of the order, used for API purposes. This is different from the order_number property, which is the ID used by the shop owner and customer.'
    int? id?;
    # The URL for the page where the buyer landed when they entered the shop.
    string? landing_site?;
    # A list of line item objects, each containing information about an item in the order.
    LineItem[]? line_items?;
    # The ID of the physical location where the order was processed. If you need to reference the location against an order, then use the FulfillmentOrder resource.
    int? location_id?;
    # The order name, generated by combining the order_number property with the order prefix and suffix that are set in the merchant's general settings. This is different from the id property, which is the ID of the order used by the API. This field can also be set by the API to be any string value.
    string? name?;
    # An optional note that a shop owner can attach to the order.
    string? note?;
    # Extra information that is added to the order. Appears in the Additional details section of an order details page. Each array entry must contain a hash with name and value keys.
    NoteAttribute[]? note_attributes?;
    # The order's position in the shop's count of orders. Numbers are sequential and start at 1.
    int? number?;
    # The order 's position in the shop's count of orders starting at 1001. Order numbers are sequential and start at 1001.
    int? order_number?;
    # The original total duties charged on the order in shop and presentment currencies.
    OriginalTotalDutiesSet? original_total_duties_set?;
    # An object containing information about the payment.
    string? payment_details?;
    # The terms and conditions under which a payment should be processed.
    PaymentTerms? payment_terms?;
    # The list of payment gateways used for the order.
    string[]? payment_gateway_names?;
    # The customer's phone number for receiving SMS notifications.
    string? phone?;
    # The presentment currency that was used to display prices to the customer.
    string? presentment_currency?;
    # The date and time (ISO 8601 format) when an order was processed. This value is the date that appears on your orders and that's used in the analytic reports. If you're importing orders from an app or another platform, then you can set processed_at to a date and time in the past to match when the original order was created.
    string? processed_at?;
    # How the payment was processed. It has the following valid values
    string? processing_method?;
    # The website where the customer clicked a link to the shop.
    string? referring_site?;
    # A list of refunds applied to the order. For more information, see the Refund API.
    Refund[]? refunds?;
    # The mailing address associated with the payment method. This address is an optional field that won't be available on orders that do not require a payment method.
    CustomerAddress? shipping_address?;
    # An array of objects, each of which details a shipping method used.
    ShippingLine[]? shipping_lines?;
    # Where the order originated. Can be set only during order creation, and is not writeable afterwards. Values for Shopify channels are protected and cannot be assigned by other API clients: web, pos, shopify_draft_order, iphone, and android. Orders created via the API can be assigned any other string of your choice. If unspecified, then new orders are assigned the value of your app's ID.
    string? source_name?;
    # The price of the order in the shop currency after discounts but before shipping, duties, taxes, and tips.
    string? subtotal_price?;
    # The subtotal of the order in shop and presentment currencies after discounts but before shipping, duties, taxes, and tips.
    SubtotalPriceSet? subtotal_price_set?;
    # Tags attached to the order, formatted as a string of comma-separated values. Tags are additional short descriptors, commonly used for filtering and searching. Each individual tag is limited to 40 characters in length.
    string? tags?;
    # An array of tax line objects, each of which details a tax applicable to the order. When creating an order through the API, tax lines can be specified on the order or the line items but not both. Tax lines specified on the order are split across the taxable line items in the created order.
    TaxLine[]? tax_lines?;
    # Whether taxes are included in the order subtotal.
    boolean? taxes_included?;
    # Whether this is a test order.
    boolean? test?;
    # A unique value when referencing the order.
    string? token?;
    # The total discounts applied to the price of the order in the shop currency.
    string? total_discounts?;
    # The total discounts applied to the price of the order in shop and presentment currencies.
    TotalDiscountsSet? total_discounts_set?;
    # The sum of all line item prices in the shop currency.
    string? total_line_items_price?;
    # The total of all line item prices in shop and presentment currencies.
    TotalLineItemsPriceSet? total_line_items_price_set?;
    # The total outstanding amount of the order in the shop currency.
    string? total_outstanding?;
    # The sum of all line item prices, discounts, shipping, taxes, and tips in the shop currency. Must be positive.
    string? total_price?;
    # The total price of the order in shop and presentment currencies.
    TotalPriceSet? total_price_set?;
    # The total shipping price of the order, excluding discounts and returns, in shop and presentment currencies. If taxes_included is set to true, then total_shipping_price_set includes taxes.
    TotalShippingPriceSet? total_shipping_price_set?;
    # The sum of all the taxes applied to the order in the shop currency. Must be positive.
    string? total_tax?;
    # The total tax applied to the order in shop and presentment currencies.
    TotalTaxSet? total_tax_set?;
    # The sum of all the tips in the order in the shop currency.
    string? total_tip_received?;
    # The sum of all line item weights in grams. The sum is not adjusted as items are removed from the order.
    decimal? total_weight?;
    # The date and time (ISO 8601 format) when the order was last modified. Filtering orders by updated_at is not an effective method for fetching orders because its value can change when no visible fields of an order have been updated. Use the Webhook and Event APIs to subscribe to order events instead.
    string? updated_at?;
    # The ID of the user logged into Shopify POS who processed the order, if applicable.
    int? user_id?;
    # The URL pointing to the order status web page, if applicable.
    string? order_status_url?;
};

# The Customer object to be updated.
public type UpdateCustomer record {
    # The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
    Customer? customer?;
};

# The Transaction object to be created.
public type CreateTransaction record {
    # Transactions are created for every order that results in an exchange of money. There are five types of transactions. (Authorization: An amount reserved against the cardholder's funding source. Money does not change hands until the authorization is captured, Sale: An authorization and capture performed together in a single step, Capture: A transfer of the money that was reserved during the authorization stage, Void: A cancellation of a pending authorization or capture, Refund: A partial or full return of captured funds to the cardholder. A refund can happen only after a capture is processed.)
    Transaction? 'transaction?;
};

# The Draft order object to be created.
public type CreateDraftOrder record {
    # An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
    DraftOrder? draft_order?;
};

# A text field that provides information about the receipt
public type Receipt record {
    # Whether the fulfillment was a testcase.
    boolean? testcase?;
    # The authorization code.
    string? authorization?;
};

# The attributes associated with a Shopify Payments extended authorization period.
public type ExtendedAuthorizationAttributes record {
    # The date and time (ISO 8601 format) when the standard authorization period expires. After expiry, an extended authorization fee is applied upon capturing the payment.
    string? standard_authorization_expires_at?;
    # The date and time (ISO 8601 format) when the extended authorization period expires. After expiry, the merchant can't capture the payment.
    string? extended_authorization_expires_at?;
};

# The current total duties charged on the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
public type CurrentTotalDutiesSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# Schedule associated to the payment terms
public type PaymentSchedule record {
    # The amount that is owed according to the payment terms.
    int? amount?;
    # The presentment currency for the payment.
    string? currency?;
    # The date and time when the payment terms were initiated.
    string? issued_at?;
    # The date and time when the payment is due. Calculated based on issued_at and due_in_days or a customized fixed date if the type is fixed.
    string? due_at?;
    # The date and time when the purchase is completed. Returns null initially and updates when the payment is captured.
    string? completed_at?;
    # The name of the payment method gateway.
    string? expected_payment_method?;
};

public type CreateProduct record {
    # The Product resource lets you update and create products in a merchant's store.
    Product? product?;
};

# The total discounts applied to the price of the order in shop and presentment currencies.
public type TotalDiscountsSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The webhook object to be updated.
public type UpdateWebhook record {
    # The webhook resource.
    Webhook? webhook?;
};

# The Order fulfillment object to be created.
public type CreateOrderFulfillment record {
    # You can use the Fulfillment resource to view, create, modify, or delete an order's or fulfillment order's fulfillments. A fulfillment order represents a group of one or more items in an order that are to be fulfilled from the same location. A fulfillment represents work that is completed as part of a fulfillment order and can include one or more items. You can use the Fulfillment resource to manage fulfillments for both orders and fulfillment orders.
    Fulfillment? fulfillment?;
};

# You can use the Fulfillment resource to view, create, modify, or delete an order's or fulfillment order's fulfillments. A fulfillment order represents a group of one or more items in an order that are to be fulfilled from the same location. A fulfillment represents work that is completed as part of a fulfillment order and can include one or more items. You can use the Fulfillment resource to manage fulfillments for both orders and fulfillment orders.
public type Fulfillment record {
    # The date and time when the fulfillment was created. The API returns this value in ISO 8601 format
    string? created_at?;
    # The ID for the fulfillment.
    int? id?;
    # A historical record of each item in the fulfillment.
    LineItem[]? line_items?;
    # The unique identifier of the location that the fulfillment should be processed for. To find the ID of the location, use the Location resource.
    int? location_id?;
    # The uniquely identifying fulfillment name, consisting of two parts separated by a .. The first part represents the order name and the second part represents the fulfillment number. The fulfillment number automatically increments depending on how many fulfillments are in an order (e.g. #1001.1, #1001.2).
    string? name?;
    # Whether the customer should be notified. If set to true, then an email will be sent when the fulfillment is created or updated. For orders that were initially created using the API, the default value is false. For all other orders, the default value is true.
    string? notify_customer?;
    # The unique numeric identifier for the order.
    int? order_id?;
    # Address
    Address? origin_address?;
    # A text field that provides information about the receipt
    Receipt? receipt?;
    # The type of service used.
    string? 'service?;
    # The current shipment status of the fulfillment.
    string? shipment_status?;
    # The status of the fulfillment.
    string? status?;
    # The name of the tracking company.
    string? tracking_company?;
    # A list of tracking numbers, provided by the shipping company.
    string[]? tracking_numbers?;
    # The URLs of tracking pages for the fulfillment.
    string[]? tracking_urls?;
    # The date and time (ISO 8601 format) when the fulfillment was last modified.
    string? updated_at?;
    # The name of the inventory management service.
    string? variant_inventory_management?;
};

# The object representation of a list of webhook subscriptions.
public type WebhookList record {
    # A list of webhook subscriptions
    Webhook[]? webhooks?;
};

# Schedule associated to the payment terms
public type Refund record {
    # The date and time (ISO 8601 format) when the refund was created.
    string? created_at?;
    # The unique identifier for the refund.
    int? id?;
    # An optional note attached to a refund.
    string? note?;
    # A list of order adjustments attached to the refund. Order adjustments are generated to account for refunded shipping costs and differences between calculated and actual refund amounts.
    OrderAdjustment[]? order_adjustments?;
    # The date and time (ISO 8601 format) when the refund was imported. This value can be set to a date in the past when importing from other systems. If no value is provided, then it will be auto-generated as the current time in Shopify. Public apps need to be granted permission by Shopify to import orders with the processed_at timestamp set to a value earlier the created_at timestamp. Private apps can't be granted permission by Shopify.
    string? processed_at?;
    # A list of refunded line items.
    RefundLineItem[]? refund_line_items?;
    # The unique identifier of the user who performed the refund.
    int? user_id?;
};

# Transactions are created for every order that results in an exchange of money. There are five types of transactions. (Authorization: An amount reserved against the cardholder's funding source. Money does not change hands until the authorization is captured, Sale: An authorization and capture performed together in a single step, Capture: A transfer of the money that was reserved during the authorization stage, Void: A cancellation of a pending authorization or capture, Refund: A partial or full return of captured funds to the cardholder. A refund can happen only after a capture is processed.)
public type Transaction record {
    # The amount of money included in the transaction. If you don't provide a value for `amount`, then it defaults to the total cost of the order (even if a previous transaction has been made towards it).
    string? amount?;
    # The authorization code associated with the transaction.
    string? authorization?;
    # The date and time (ISO 8601 format) when the Shopify Payments authorization expires.
    string? authorization_expires_at?;
    # The date and time (ISO 8601 format) when the transaction was created.
    string? created_at?;
    # The three-letter code (ISO 4217 format) for the currency used for the payment.
    string? currency?;
    # The ID for the device.
    int? device_id?;
    # A standardized error code, independent of the payment provider.
    string? error_code?;
    # The attributes associated with a Shopify Payments extended authorization period.
    ExtendedAuthorizationAttributes? extended_authorization_attributes?;
    # The name of the gateway the transaction was issued through. A list of gateways can be found on Shopify's payment gateways page.
    string? gateway?;
    # The ID for the transaction.
    int? id?;
    # The transaction's type.
    string? kind?;
    # The ID of the physical location where the transaction was processed.
    LocationID? location_id?;
    # A string generated by the payment provider with additional information about why the transaction succeeded or failed.
    string? message?;
    # The ID for the order that the transaction is associated with.
    int? order_id?;
    # Information about the credit card used for this transaction.
    PaymentDetails? payment_details?;
    # The ID of an associated transaction.
    int? parent_id?;
    # The attributes associated with a Shopify Payments refund.
    PaymentsRefundAttributes? payments_refund_attributes?;
    # The date and time (ISO 8601 format) when a transaction was processed. This value is the date that's used in the analytic reports. By default, it matches the created_at value. If you're importing transactions from an app or another platform, then you can set processed_at to a date and time in the past to match when the original transaction was processed.
    string? processed_at?;
    # The origin of the transaction. This is set by Shopify and can't be overridden. Example values are web, pos, iphone, and android.
    string? source_name?;
    # The status of the transaction. Valid values are pending, failure, success, and error.
    string? status?;
    # Whether the transaction is a test transaction.
    boolean? test?;
    # The ID for the user who was logged into the Shopify POS device when the order was processed, if applicable.
    int? user_id?;
    # An adjustment on the transaction showing the amount lost or gained due to fluctuations in the currency exchange rate. Requires the header X-Shopify-Api-Features = include-currency-exchange-adjustments.
    CurrencyExchangeAdjustment? currency_exchange_adjustment?;
};

# The price object
public type Price record {
    # The variant's price or compare-at price in the presentment currency.
    string? amount?;
    # The three-letter code (ISO 4217 format) for one of the shop's enabled presentment currencies.
    string? currency_code?;
};

# The discount amount allocated to the line item in shop and presentment currencies.
public type AmountSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The original total duties charged on the order in shop and presentment currencies.
public type OriginalTotalDutiesSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The Refund object.
public type RefundObject record {
    # Schedule associated to the payment terms
    Refund? refund?;
};

# The custom properties that a shop owner uses to define product variants. You can define three options for a product variant are option1, option2, option3. Default value is Default Title. The title field is a concatenation of the option1, option2, and option3 fields. Updating the option fields updates the title field.
public type Option record {
    # Option 1
    string? option1?;
    # Option 2
    string? option2?;
    # Option 3
    string? option3?;
};

# Information about the credit card used for this transaction.
public type PaymentDetails record {
    # The issuer identification number (IIN), formerly known as bank identification number (BIN) of the customer's credit card. This is made up of the first few digits of the credit card number.
    string? credit_card_bin?;
    # The response code from the address verification system. The code is always a single letter.
    string? avs_result_code?;
    # The response code from the credit card company indicating whether the customer entered the card security code, or card verification value, correctly. The code is a single letter or empty string.
    string? cvv_result_code?;
    # The customer's credit card number, with most of the leading digits redacted.
    string? credit_card_number?;
    # The name of the company that issued the customer's credit card.
    string? credit_card_company?;
};

# The Order object to be updated.
public type UpdateOrder record {
    # An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
    Order? 'order?;
};

# An ordered list of amounts allocated by discount applications. Each discount allocation is associated with a particular discount application.
public type DiscountAllocations record {
    # The discount amount allocated to the line in the shop currency.
    string? amount?;
    # The index of the associated discount application in the order's
    int? discount_application_index?;
    # The discount amount allocated to the line item in shop and presentment currencies.
    AmountSet? amount_set?;
};

# The mailing address associated with the payment method. This address is an optional field that won't be available on orders that do not require a payment method.
public type CustomerAddress record {
    # The street address of the billing address.
    string? address1?;
    # An optional additional field for the street address of the billing address.
    string? address2?;
    # The city, town, or village of the billing address.
    string? city?;
    # The company of the person associated with the billing address.
    string? company?;
    # The name of the country of the billing address.
    string? country?;
    # The two-letter code (ISO 3166-1 format) for the country of the billing address.
    string? country_code?;
    # The first name of the person associated with the payment method.
    string? first_name?;
    # The last name of the person associated with the payment method.
    string? last_name?;
    # The latitude of the billing address.
    string? latitude?;
    # The longitude of the billing address.
    string? longitude?;
    # The full name of the person associated with the payment method.
    string? name?;
    # The phone number at the billing address.
    string? phone?;
    # The name of the region (for example, province, state, or prefecture) of the billing address.
    string? province?;
    # The two-letter abbreviation of the region of the billing address.
    string? province_code?;
    # The postal code (for example, zip, postcode, or Eircode) of the billing address.
    string? zip?;
};

# The webhook object to be created.
public type CreateWebhook record {
    # The webhook resource.
    Webhook? webhook?;
};

# The order risk object to be updated.
public type UpdateOrderRisk record {
    # The order risk for an order.
    OrderRisk? risk?;
};

# The Customer object.
public type CustomerObject record {
    # The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
    Customer? customer?;
};

public type UpdateProduct record {
    # The Product resource lets you update and create products in a merchant's store.
    Product? product?;
};

# An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
public type DraftOrder record {
    # The ID of the draft order.
    int? id?;
    # The ID of the order that 's created and associated with the draft order after the draft order is completed.
    DraftOrderID? order_id?;
    # Name of the draft order.
    string? name?;
    # The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
    Customer? customer?;
    # The mailing address associated with the payment method. This address is an optional field that won't be available on orders that do not require a payment method.
    CustomerAddress? shipping_address?;
    # The mailing address associated with the payment method. This address is an optional field that won't be available on orders that do not require a payment method.
    CustomerAddress? billing_address?;
    # The text of an optional note that a shop owner can attach to the draft order.
    string? note?;
    # Extra information that is added to the order. Appears in the Additional details section of an order details page. Each array entry must contain a hash with name and value keys.
    NoteAttribute[]? note_attributes?;
    # The customer's email address.
    string? email?;
    # The three letter code (ISO 4217 format) for the currency used for the payment.
    string? currency?;
    # The date and time (ISO 8601 format) when the invoice was emailed to the customer.
    string? invoice_sent_at?;
    # The URL for the invoice.
    string? invoice_url?;
    # Product variant line item or custom line item associated to the draft order. Each draft order must include at least one line_item.
    LineItem[]? line_items?;
    # The terms and conditions under which a payment should be processed.
    PaymentTerms? payment_terms?;
    # A shipping_line object, which details the shipping method used.
    DraftOrderShippingLine? shipping_line?;
    # A comma-seperated list of additional short descriptors, commonly used for filtering and searching. Each individual tag is limited to 40 characters in length. For example, tags are "tag1","tag2","tag3".
    string? tags?;
    # Whether taxes are exempt for the draft order. If set to false, then Shopify refers to the taxable field for each line_item. If a customer is applied to the draft order, then Shopify uses the customer's tax_exempt field instead.
    boolean? tax_exempt?;
    # Whether the customer is exempt from paying specific taxes on their order. Canadian taxes only.
    string[]? tax_exemptions?;
    # An array of tax line objects, each of which details a tax applicable to the order. When creating an order through the API, tax lines can be specified on the order or the line items but not both. Tax lines specified on the order are split across the taxable line items in the created order.
    TaxLine[]? tax_lines?;
    # The discount applied to the line item or the draft order object. Each draft order object can have one applied_discount object and each draft order line item can have its own applied_discount.
    AppliedDiscount? applied_discount?;
    # Whether taxes are included in the order subtotal. Valid values are true or false.
    boolean? taxes_included?;
    # The sum of all the taxes applied to the order.
    string? total_tax?;
    # The price of the order before shipping and taxes.
    string? subtotal_price?;
    # The sum of all the prices of all the items in the order, taxes and discounts included.
    string? total_price?;
    # The date and time (ISO 8601 format) when the order is created and the draft order is completed.
    string? completed_at?;
    # The date and time (ISO 8601 format) when the order was created in Shopify.
    string? created_at?;
    # The date and time (ISO 8601 format) when the order was last modified.
    string? updated_at?;
    # The status of a draft order as it transitions into an order. When a draft order is created it is set to open status. The invoice can then be sent to the customer, and status changes to invoice_sent. The draft order can then be paid, set to pending, or paid by credit card. In each case, the draft order is set to completed and an order is created. After a draft order is set to completed the only further modifications that can be made are adding tags or metafields.
    string? status?;
};

# The ID of the order that 's created and associated with the draft order after the draft order is completed.
public type DraftOrderID record {
    # The ID of the order that 's created and associated with the draft order after the draft order is completed.
    int? id?;
};

# Products are easier to sell if customers can see pictures of them, which is why there are product images.
public type ProductImage record {
    # The date and time when the product image was created. The API returns this value in ISO 8601 formatting.
    string? created_at?;
    # A unique numeric identifier for the product image.
    int? id?;
    # The order of the product image in the list. The first product image is at position 1 and is the "main" image for the product.
    int? position?;
    # The id of the product associated with the image.
    int? product_id?;
    # An array of variant ids associated with the image.
    int[]? variant_ids?;
    # Specifies the location of the product image. This parameter supports URL filters that you can use to retrieve modified copies of the image. For example, add _small, to the filename to retrieve a scaled copy of the image at 100 x 100 px (for example, ipod-nano_small.png), or add _2048x2048 to retrieve a copy of the image constrained at 2048 x 2048 px resolution (for example, ipod-nano_2048x2048.png).
    string? src?;
    # Width dimension of the image which is determined on upload.
    int? width?;
    # Height dimension of the image which is determined on upload.
    int? height?;
    # The date and time when the product image was last modified. The API returns this value in ISO 8601 format.
    string? updated_at?;
};

# The total tax applied to the order in shop and presentment currencies.
public type TotalTaxSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# A shipping_line object, which details the shipping method used.
public type DraftOrderShippingLine record {
    # The handle of the shipping rate which was selected and applied. Required for regular shipping lines.
    string? 'handle?;
    # The title of the shipping method. Required for custom shipping lines. (maximum 255 characters)
    string? title?;
    # The price of the shipping method. Required for custom shipping lines.
    decimal? price?;
};

public type OrderObject record {
    # An order is a customer's request to purchase one or more products from a shop. You can create, retrieve, update, and delete orders using the Order resource.
    Order? 'order?;
};

# The order risk object for an order.
public type OrderRiskObject record {
    # The order risk for an order.
    OrderRisk? risk?;
};

# The price of the line item in shop and presentment currencies.
public type PriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The terms and conditions under which a payment should be processed.
public type PaymentTerms record {
    # The amount that is owed according to the payment terms.
    int? amount?;
    # The presentment currency for the payment.
    string? currency?;
    # The name of the selected payment terms template for the order.
    string? payment_terms_name?;
    # The type of selected payment terms template for the order.
    string? payment_terms_type?;
    # The number of days between the invoice date and due date that is defined in the selected payment terms template.
    int? due_in_days?;
    # An array of schedules associated to the payment terms.
    PaymentSchedule[]? payment_schedules?;
};

# A list of customers
public type CustomerList record {
    # A list of customers
    Customer[]? customers?;
};

# Tax line object, which details a tax applicable to the order.
public type TaxLine record {
    # The amount of tax to be charged in the shop currency.
    string? price?;
    # The rate of tax to be applied.
    decimal? rate?;
    # The name of the tax.
    string? title?;
    # Whether the channel that submitted the tax line is liable for remitting. A value of null indicates unknown liability for the tax line.
    boolean? channel_liable?;
};

# The current total price of the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
public type CurrentTotalPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

public type ProductVariantObject record {
    # A variant can be added to a Product resource to represent one version of a product with several options. The Product resource will have a variant for every possible combination of its options. Each product can have a maximum of three options and a maximum of 100 variants.
    ProductVariant? variant?;
};

# Information about the browser that the customer used when they placed their order
public type ClientDetails record {
    # The languages and locales that the browser understands.
    string? accept_language?;
    # The browser screen height in pixels, if available.
    int? browser_height?;
    # The browser IP address.
    string? browser_ip?;
    # The browser screen width in pixels, if available.
    int? browser_width?;
    # A hash of the session.
    string? session_hash?;
    # Details of the browsing client, including software and operating versions.
    string? user_agent?;
};

# A list of products
public type ProductVariantList record {
    # A list of product variants
    ProductVariant[]? variants?;
};

# Specify how much shipping to refund.
public type Shipping record {
    # Set a specific amount to refund for shipping. Takes precedence over full_refund.
    decimal? amount?;
    # Whether to refund all remaining shipping.
    boolean? full_refund?;
};

# A variant can be added to a Product resource to represent one version of a product with several options. The Product resource will have a variant for every possible combination of its options. Each product can have a maximum of three options and a maximum of 100 variants.
public type ProductVariant record {
    # The barcode, UPC, or ISBN number for the product.
    string? barcode?;
    # The original price of the item before an adjustment or a sale.
    string? compare_at_price?;
    # The date and time (ISO 8601 format) when the product variant was created.
    string? created_at?;
    # The fulfillment service associated with the product variant. Valid values are manual or the handle of a fulfillment service.
    string? fulfillment_service?;
    # The weight of the product variant in grams.
    int? grams?;
    # The unique numeric identifier for the product variant.
    int? id?;
    # The unique numeric identifier for a product's image. The image must be associated to the same product as the variant.
    int? image_id?;
    # The unique identifier for the inventory item, which is used in the Inventory API to query for inventory information.
    int? inventory_item_id?;
    # The fulfillment service that tracks the number of items in stock for the product variant.
    string? inventory_management?;
    # Whether customers are allowed to place an order for the product variant when it's out of stock.
    string? inventory_policy?;
    # An aggregate of inventory across all locations. To adjust inventory at a specific location, use the InventoryLevel resource.
    int? inventory_quantity?;
    # This property is deprecated. Use the InventoryLevel resource instead.
    int? old_inventory_quantity?;
    # This property is deprecated. Use the InventoryLevel resource instead.
    int? inventory_quantity_adjustment?;
    # The custom properties that a shop owner uses to define product variants. You can define three options for a product variant are option1, option2, option3. Default value is Default Title. The title field is a concatenation of the option1, option2, and option3 fields. Updating the option fields updates the title field.
    Option? option?;
    # The variant's presentment prices and compare-at prices in each of the shop's enabled presentment currencies.
    PresentmentPrices? presentment_prices?;
    # The order of the product variant in the list of product variants. The first position in the list is 1. The position of variants is indicated by the order in which they are listed.
    int? position?;
    # The price of the product variant.
    string? price?;
    # The unique numeric identifier for the product.
    int? product_id?;
    # This property is deprecated. Use the `requires_shipping` property on the InventoryItem resource instead.
    boolean? requires_shipping?;
    # A unique identifier for the product variant in the shop. Required in order to connect to a FulfillmentService.
    string? sku?;
    # Whether a tax is charged when the product variant is sold.
    boolean? taxable?;
    # This parameter applies only to the stores that have the Avalara AvaTax app installed. Specifies the Avalara tax code for the product variant.
    string? tax_code?;
    # The title of the product variant. The title field is a concatenation of the option1, option2, and option3 fields. You can only update title indirectly using the option fields.
    string? title?;
    # The date and time when the product variant was last modified. Gets returned in ISO 8601 formatting.
    string? updated_at?;
    # The weight of the product variant in the unit system specified with weight_unit.
    int? weight?;
    # The unit of measurement that applies to the product variant's weight. If you don't specify a value for weight_unit, then the shop's default unit of measurement is applied. Valid values are g, kg, oz, and lb.
    string? weight_unit?;
};

# Properties
public type Property record {
    # Property name
    string? name?;
    # Property value
    string? value?;
};

# Refunded line item
public type RefundLineItem record {
    # The unique identifier of the line item in the refund.
    int? id?;
    # The ID of the related line item in the order.
    int? line_item_id?;
    # The quantity of the associated line item that was returned.
    int? quantity?;
    # How this refund line item affects inventory levels.
    string? restock_type?;
    # The unique identifier of the location where the items will be restocked. Required when restock_type has the value return or cancel.
    int? location_id?;
    # The subtotal of the refund line item.
    decimal? subtotal?;
    # The total tax on the refund line item.
    decimal? total_tax?;
};

# The custom product properties. For example, Size, Color, and Material. Each product can have up to 3 options and each option value can be up to 255 characters.
public type ProductOption record {
    # Product option ID
    int? id?;
    # Product option name
    string? name?;
    # Product option position
    int? position?;
    # Product option product ID
    int? product_id?;
    # Product option values
    string[]? values?;
};

# The total shipping price of the order, excluding discounts and returns, in shop and presentment currencies. If taxes_included is set to true, then total_shipping_price_set includes taxes.
public type TotalShippingPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# An object, which details a shipping method used.
public type ShippingLine record {
    # A reference to the shipping method.
    string? code?;
    # The price of the shipping method after line-level discounts have been applied. Doesn't reflect cart-level or order-level discounts.
    string? discounted_price?;
    # The price of the shipping method in both shop and presentment currencies after line-level discounts have been applied.
    DiscountedPriceSet? discounted_price_set?;
    # The price of this shipping method in the shop currency. Can't be negative.
    string? price?;
    # The price of the line item in shop and presentment currencies.
    PriceSet? price_set?;
    # The source of the shipping method.
    string? 'source?;
    # The title of the shipping method.
    string? title?;
    # A reference to the carrier service that provided the rate. Present when the rate was computed by a third-party carrier service.
    string? carrier_identifier?;
    # A reference to the fulfillment service that is being requested for the shipping method. Present if the shipping method requires processing by a third party fulfillment service; null otherwise.
    string? requested_fulfillment_service_id?;
};

# Attaches additional metadata to a shop's resources
public type Metafield record {
    # An identifier for the metafield (maximum of 30 characters).
    string? 'key;
    # A container for a set of metadata (maximum of 20 characters). Namespaces help distinguish between metadata that you created and metadata created by another individual with a similar namespace.
    string? namespace;
    # Information to be stored as metadata.
    string? value;
    # The value type. Valid values are string and integer.
    string? value_type;
    # Additional information about the metafield.
    string? description?;
};

# The order risk object to be created.
public type CreateOrderRisk record {
    # The order risk for an order.
    OrderRisk? risk?;
};

# A historical record of each item in the fulfillment.
public type LineItem record {
    # The ID of the line item within the fulfillment.
    int? id?;
    # The ID of the product variant being fulfilled.
    int? variant_id?;
    # The title of the product.
    string? title?;
    # The number of items in the fulfillment.
    int? quantity?;
    # The price of the item.
    string? price?;
    # The price of the line item in shop and presentment currencies.
    PriceSet? price_set?;
    # The weight of the item in grams.
    int? grams?;
    # The unique identifier of the item in the fulfillment.
    string? sku?;
    # The title of the product variant being fulfilled.
    string? variant_title?;
    # The name of the supplier of the item.
    string? vendor?;
    # The service provider who is doing the fulfillment.
    string? fulfillment_service?;
    # The unique numeric identifier for the product in the fulfillment.
    int? product_id?;
    # Whether a customer needs to provide a shipping address when placing an order for this product variant.
    boolean? requires_shipping?;
    # Whether the line item is taxable.
    boolean? taxable?;
    # Whether the line item is a gift card
    boolean? gift_card?;
    # The name of the product variant.
    string? name?;
    # The name of the inventory management system.
    string? variant_inventory_management?;
    # Any additional properties associated with the line item.
    Property[]? properties?;
    # Whether the product exists.
    boolean? product_exists?;
    # The amount available to fulfill. This is the quantity - max (refunded_quantity, fulfilled_quantity) - pending_fulfilled_quantity - open_fulfilled_quantity.
    int? fulfillable_quantity?;
    # The total of any discounts applied to the line item.
    string? total_discount?;
    # The status of an order in terms of the line items being fulfilled. Valid values are fulfilled, null, or partial
    string? fulfillment_status?;
    # A unique identifier for a quantity of items within a single fulfillment. An order can have multiple fulfillment line items.
    int? fulfillment_line_item_id?;
    # A list of tax line objects, each of which details a tax applied to the item.
    TaxLine[]? tax_lines?;
    # The payment gateway used to tender the tip, such as shopify_payments. Present only on tips
    string? tip_payment_gateway?;
    # The payment method used to tender the tip, such as Visa. Present only on tips.
    string? tip_payment_method?;
    # The total amount allocated to the line item in the presentment currency. Instead of using this field, Shopify recommends using discount_allocations, which provides the same information.
    TotalDiscountSet? total_discount_set?;
    # An ordered list of amounts allocated by discount applications. Each discount allocation is associated with a particular discount application.
    DiscountAllocations[]? discount_allocations?;
    # Address
    Address? origin_location?;
};

public type CreateProductVariant record {
    # A variant can be added to a Product resource to represent one version of a product with several options. The Product resource will have a variant for every possible combination of its options. Each product can have a maximum of three options and a maximum of 100 variants.
    ProductVariant? variant?;
};

# Discounts applied to the order
public type DiscountCode record {
    # The value of the discount deducted from the order total. The type field determines how this value is calculated
    string? amount?;
    # The discount code
    string? code?;
    # The type of discount. Can be one of: percentage, shipping, fixed_amount (default) = ['fixed_amount', 'percentage', 'shipping']
    string? 'type?;
};

public type UpdateProductVariant record {
    # A variant can be added to a Product resource to represent one version of a product with several options. The Product resource will have a variant for every possible combination of its options. Each product can have a maximum of three options and a maximum of 100 variants.
    ProductVariant? variant?;
};

# Extra information that is added to the order. Appears in the Additional details section of an order details page. Each array entry must contain a hash with name and value keys.
public type NoteAttribute record {
    # Name
    string? name?;
    # Value
    string? value?;
};

# Line item IDs, quantities to refund, and restock instructions.
public type RefundLineItemObject record {
    # The quantity to refund.
    int? quantity?;
    # The ID of the location where the items should be restocked. This is required when the value of restock_type is return or cancel. If the item is not already stocked at the location, then the item is connected to the location. An error is returned when the item is connected to a fulfillment service location and a different location is provided.
    int? location_id?;
    # The ID of a line item to refund.
    int? line_item_id?;
    # How this refund line item affects inventory levels. Valid values are no_restock, cancel, and return.
    string? restock_type?;
};

# The variant's presentment prices and compare-at prices in each of the shop's enabled presentment currencies.
public type PresentmentPrice record {
    # The price object
    Price? price?;
    # The price object
    Price? compare_at_price?;
};

# A list of products
public type ProductList record {
    # A list of products
    Product[]? customers?;
};

# Schedule associated to the payment terms
public type RefundRequest record {
    # The three-letter code (ISO 4217 format) for the currency used for the refund.
    string? currency?;
    # An optional comment that explains a discrepancy between calculated and actual refund amounts. Used to populate the reason property of the resulting order adjustment object attached to the refund. Valid values are restock, damage, customer, and other.
    string? discrepancy_reason?;
    # An optional note attached to a refund.
    string? note?;
    # Whether to send a refund notification to the customer.
    boolean? notify?;
    # A list of line item IDs, quantities to refund, and restock instructions.
    RefundLineItemObject[]? refund_line_items?;
    # Specify how much shipping to refund.
    Shipping? shipping?;
    # A list of transactions to process as refunds.
    Transaction[]? transactions?;
};

# The current subtotal price of the order in shop and presentment currencies. The amount values associated with this field reflect order edits, returns, and refunds.
public type CurrentSubtotalPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The webhook resource.
public type Webhook record {
    # Destination URI to which the webhook subscription should send the POST request when an event occurs.
    string? address?;
    # The Admin API version that Shopify uses to serialize webhook events. This value is inherited from the app that created the webhook subscription.
    string? api_version?;
    # Date and time when the webhook subscription was created. The API returns this value in ISO 8601 format.
    string? created_at?;
    # An optional array of top-level resource fields that should be serialized and sent in the POST request. If absent, all fields will be sent.
    string[]? fields?;
    # Format in which the webhook subscription should send the data. Valid values are JSON and XML. Defaults to JSON.
    string? format?;
    # Unique numeric identifier for the webhook subscription.
    int? id?;
    # Optional array of namespaces for any metafields that should be included with each webhook.
    string[]? metafield_namespaces?;
    # Optional array of namespaces for any private metafields that should be included with each webhook.
    string[]? private_metafield_namespaces?;
    # Event that triggers the webhook. Valid values are app/uninstalled, bulk_operations/finish, carts/create, carts/update, checkouts/create, checkouts/delete, checkouts/update, collection_listings/add, collection_listings/remove, collection_listings/update, collections/create, collections/delete, collections/update, customer_groups/create, customer_groups/delete, customer_groups/update, customer_payment_methods/create, customer_payment_methods/revoke, customer_payment_methods/update, customers/create, customers/delete, customers/disable, customers/enable, customers/update, customers_marketing_consent/update, disputes/create, disputes/update, domains/create, domains/destroy, domains/update, draft_orders/create, draft_orders/delete, draft_orders/update, fulfillment_events/create, fulfillment_events/delete, fulfillments/create, fulfillments/update, inventory_items/create, inventory_items/delete, inventory_items/update, inventory_levels/connect, inventory_levels/disconnect, inventory_levels/update, locales/create, locales/update, locations/create, locations/delete, locations/update, order_transactions/create, orders/cancelled, orders/create, orders/delete, orders/edited, orders/fulfilled, orders/paid, orders/partially_fulfilled, orders/updated, product_listings/add, product_listings/remove, product_listings/update, products/create, products/delete, products/update, profiles/create, profiles/delete, profiles/update, refunds/create, selling_plan_groups/create, selling_plan_groups/delete, selling_plan_groups/update, shop/update, subscription_billing_attempts/challenged, subscription_billing_attempts/failure, subscription_billing_attempts/success, subscription_contracts/create, subscription_contracts/update, tender_transactions/create, themes/create, themes/delete, themes/publish, themes/update
    string? topic?;
    # Date and time when the webhook subscription was updated. The API returns this value in ISO 8601 format.
    string? updated_at?;
};

# A list of orders
public type OrderList record {
    # A list of orders
    Order[]? orders?;
};

# The subtotal of the order in shop and presentment currencies after discounts but before shipping, duties, taxes, and tips.
public type SubtotalPriceSet record {
    # The price object
    Price? shop_money?;
    # The price object
    Price? presentment_money?;
};

# The Refund object to be created.
public type CreateRefund record {
    # Schedule associated to the payment terms
    RefundRequest? refund?;
};

# The object representation of a list of order risks
public type OrderRiskList record {
    # A list of order risks
    OrderRisk[]? risks?;
};

# A list of order fulfillments
public type OrderFulfillmentsList record {
    # A list of order fulfillments
    Fulfillment[]? fulfillments?;
};

# The Customer object to be created.
public type CreateCustomer record {
    # The Customer resource stores information about a shop's customers, such as their contact details, their order history, and whether they've agreed to receive email marketing.
    Customer? customer?;
};
