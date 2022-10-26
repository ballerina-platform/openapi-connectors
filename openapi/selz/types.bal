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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
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

# Object representing Payout
public type SelzApiPublicModelsPayoutsPayoutresponse record {
    # The unique identifier for payout.
    string id?;
    # Status of the payout
    string status?;
    # Total amount associated with the payout
    string total_amount?;
    # Three-letter ISO currency code representing the currency of the payout
    string currency?;
    # Bank detail of the payout
    SelzApiPublicModelsPayoutsPayoutdestinationresponsemodel destination?;
    # The date and time when the Payout was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the Payout was last updated. The API returns this value in ISO 8601 format.
    string updated_time?;
    # The date and time when the Payout is scheduled. The API returns this value in ISO 8601 format.
    string scheduled_time?;
};

# Represent an image
public type SelzApiPublicModelsBlogpostsShopimageresponse record {
    # Original size
    string original?;
    # Is featured image
    boolean is_featured?;
    # Is default image
    boolean is_default?;
    # Resized 24 * 24 size image
    string pico?;
    # Resized 48 * 48 size image
    string icon?;
    # Resized 64 * 64 size image
    string thumb?;
    # Resized 96 * 96 size image
    string small?;
    # Resized 192 * 192 size image
    string compact?;
    # Resized 256 * 256 size image
    string medium?;
    # Resized 640 * 640 size image
    string large?;
    # Resized 1280 * 1280 size image
    string grande?;
    # Resized 1600 * 1600 size image
    string mucho_grande?;
    # Resized 2048 * 2048 size image
    string huge?;
};

# BuyerResponse
public type SelzApiPublicModelsOrdersBuyerresponse record {
    # Customer first name
    string first_name?;
    # Customer last name
    string last_name?;
    # Customer email address
    string email?;
    # Customer accepts marketing
    boolean accepts_marketing?;
    # Company
    string company?;
    # Address
    SelzApiPublicModelsOrdersAddressresponse delivery_address?;
    # Address
    SelzApiPublicModelsOrdersAddressresponse billing_address?;
};

# PaymentDetailsResponse
public type SelzApiPublicModelsOrdersPaymentdetailsresponse record {
    # Type of the payment, e.g. "card" or "paypal"
    string 'type?;
    # CardPaymentDetailsResponse
    SelzApiPublicModelsOrdersCardpaymentdetailsresponse card?;
    # PaypalPaymentDetailsResponse
    SelzApiPublicModelsOrdersPaypalpaymentdetailsresponse paypal?;
};

# A Blog post
public type SelzApiPublicModelsBlogpostsBlogpostresponse record {
    # Unique identifier of the customer
    string id?;
    # The title of the blogPost.
    string title?;
    # The HTML meta title that specifies the title of the categoty web page
    string meta_title?;
    # The description of the blogPost, complete with HTML markup
    string excerpt?;
    # The HTML meta description that specifies the description of the categoty web page
    string meta_description?;
    # The content of the blog post
    string content?;
    # Represent an image
    SelzApiPublicModelsBlogpostsShopimageresponse image?;
    # A human-friendly unique string for the blogPost automatically generated from its title
    string slug?;
    # States whether the blogPost is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # The date and time when the blogPost was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the blogPost was last updated. The API returns this value in ISO 8601 format.
    string updated_time?;
    # Tags associated with this blog post
    string tags?;
};

# Represents fields of Category object to be updated
public type SelzApiPublicModelsCategoriesCategoryputrequest record {
    # An optional unique identifier of the parent category
    string parent_id?;
    # The title of the category.
    string title?;
    # The HTML meta title that specifies the title of the category web page
    string meta_title?;
    # A human-friendly unique string for the category automatically generated from its title
    string slug?;
    # The description of the category, complete with HTML markup
    string description?;
    # The HTML meta description that specifies the description of the categoty web page
    string meta_description?;
    # States whether the category is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # list of product id's that belong to the category
    string[] products?;
    # The order in which products in the category appear
    string sort_type?;
};

# ProductVariantRequest
public type SelzApiPublicModelsProductsProductvariantrequest record {
    # Id of the product variant
    string id?;
    # Stock keeping unit of the product variant
    string sku?;
    # The title of the product variant.
    string title?;
    # The price of the product variant
    string price?;
    # The number of items in stock for this product variant
    int quantity?;
    # Flag indicating that number of items in stock for this product variant is unlimited
    boolean is_unlimited_quantity?;
    # A key value pair representing variant options eg:{"Color","Blue"}
    record {} options?;
};

# ProductResponse
public type SelzApiPublicModelsProductsProductresponse record {
    # Unique identifier of the product
    string id?;
    # Stock keeping unit of the product
    string sku?;
    # The name of the product
    string title?;
    # The slug of the product
    string slug?;
    # The description of the product, complete with HTML formatting
    string description?;
    # The Product short URL
    string short_url?;
    # The type of Product, can be physical, digital or service
    string product_type?;
    # Three-letter ISO currency code representing the currency of the product price
    string currency_code?;
    # The price of the product
    decimal price?;
    # The original price of the product
    decimal regular_price?;
    # TBC
    boolean is_price_flexible?;
    # The number of items in stock for this product
    int quantity?;
    # The number of items in stock which is available for this product
    int quantity_available?;
    # A list of variant objects, each one representing a slightly different version of the product
    SelzApiPublicModelsProductsProductvariantresponse[] variants?;
    # A list of variants attributes
    SelzApiPublicModelsProductsVariantattributeresponse[] variant_attributes?;
    # A list of image objects, each one representing an image associated with the product
    SelzApiPublicModelsProductsImageresponse[] images?;
    # ImageResponse
    SelzApiPublicModelsProductsImageresponse featured_image?;
    # The type of media (e.g. Video, Audio, YouTube or Vimeo)
    string media_type?;
    # The URL for the media. In the case of YouTube and Vimeo, the video ID
    string media_url?;
    # ImageResponse
    SelzApiPublicModelsProductsImageresponse media_cover?;
    # The published state of the product
    boolean is_published?;
    # If the product includes free shipping
    boolean is_free_shipping?;
    # The date and time when the product was created. The API returns this value in ISO 8601 format
    string created_time?;
    # The date and time when the product was last updated.
    string updated_time?;
};

# Represents an object that is required to update existing discount.
public type SelzApiPublicModelsDiscountsDiscountputrequest record {
    # A friendly name to remember the discount
    string name?;
    # The minimum order value for the discount to be valid. This value excludes tax and shipping and applies to the order
    # discounts only.
    string minimum_value?;
    # Discount includes free shipping.
    boolean free_shipping?;
    # Value that will be taken off.
    string value_off?;
    # Percent that will be taken off.
    int percent_off?;
    # Three-letter ISO currency code representing the currency of the category or order type discount value. Product
    # discounts are in the product currency.
    string currency_code?;
    # Maximum number of times the discount can be applied.
    int quantity?;
    # The date the discount becomes valid for use during checkout in ISO 8601 format.
    string valid_from?;
    # The date when the discount code becomes disabled in ISO 8601 format.
    string valid_to?;
    # States whether the discount is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
};

# Address
public type SelzApiPublicModelsOrdersAddressresponse record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

# Order item line
public type SelzApiPublicModelsOrdersOrderitemresponse record {
    # Unique identifier of the product.
    string product_id?;
    # The name of the product.
    string product_title?;
    # Stock keeping unit of the product.
    string product_sku?;
    # Unique identifier of the product variant.
    string product_variant_id?;
    # The name of the product variant.
    string product_variant_title?;
    # Stock keeping unit of the product variant.
    string product_variant_sku?;
    # Discount code applied to the line item
    string discount_code?;
    # The number of products ordered
    int quantity?;
    # Unit price of the line item
    string unit_price?;
    # Currency of the product ordered
    string currency?;
    # Tax rate of the line item
    decimal tax_rate?;
    # Tax name of the line item
    string tax_name?;
    # Tax amount of the line item
    decimal total_tax?;
    # Discount amount of the line item
    decimal total_discount?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsBlogpostsBlogpostresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsBlogpostsBlogpostresponse[] data?;
};

# Added image for the blog post
public type SelzApiPublicModelsBlogpostsAddimageresponse record {
    # Url of the added image
    string url?;
};

# CatalogBuyerResponse
public type SelzApiPublicModelsProductsCatalogbuyerresponse record {
    # Customer first name
    string first_name?;
    # Customer last name
    string last_name?;
    # Customer email address
    string email?;
    # Customer accepts marketing
    boolean accepts_marketing?;
    # Company
    string company?;
    # CatalogAddressResponse
    SelzApiPublicModelsProductsCatalogaddressresponse delivery_address?;
    # CatalogAddressResponse
    SelzApiPublicModelsProductsCatalogaddressresponse billing_address?;
};

# Store
public type SelzApiPublicModelsStoreStoreresponse record {
    # Unique identifier of the store
    string id?;
    # Name of the store
    string name?;
    # Logo url of the store
    string logo?;
    # Owner
    SelzApiPublicModelsStoreOwnerresponse owner?;
    # Icon url of the store
    string icon?;
    # User friendly display for the store
    string display_name?;
    # Domain of the store
    string domain?;
    # Culture of the shop, ISO two-letter (639-1) language code (e.g. en)
    string culture_name?;
    # ISO 8601 time zone name e.g. Pacific Standard Time,
    # https://en.wikipedia.org/wiki/List_of_time_zone_abbreviations for the full list of time zone names.
    string time_zone?;
    # ISO 4217 Currency code (e.g USD of U.S dollars)
    string currency?;
    # Subscription
    SelzApiPublicModelsStoreShopsubscriptionresponse subscription?;
    # Store creation time
    string created_time?;
};

# Owner
public type SelzApiPublicModelsStoreOwnerresponse record {
    # Name of the shop
    string full_name?;
    # Email of the shop
    string email?;
    # Biography of the shop
    string biography?;
    # Avatar image url of the shop
    string avatar?;
    # Address
    SelzApiPublicModelsStoreAddressresponse address?;
};

# Patch a blog post
public type SelzApiPublicModelsBlogpostsBlogpostputrequest record {
    # The title of the blog.
    string title?;
    # A human-friendly unique string for the blogPost automatically generated from its title
    string slug?;
    # An excerpt of the blog post, complete with HTML markup
    string excerpt?;
    # The content of the blog post
    string content?;
    # The HTML meta title that specifies the title of the blog web page
    string meta_title?;
    # The HTML meta description that specifies the description of the blog web page
    string meta_description?;
    # States whether the blog post is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # States whether comments are allowed on the blog post
    boolean disable_comments?;
    # Image
    SelzApiPublicModelsBlogpostsShopimagerequest image?;
    # Comma separated tags Id associated with this blog post
    string tags?;
};

# Object representing Dispute
public type SelzApiPublicModelsDisputesDisputeresponse record {
    # The unique identifier for dispute.
    string id?;
    # Order Id associated with this dispute.
    string order_id?;
    # Status of the dispute.
    string status?;
    # Total amount
    string total_amount?;
    # Three-letter ISO currency code representing the currency of the dispute
    string currency?;
    # Reason of the Dispute
    string reason?;
    # The date and time when the dispute was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the dispute was created. The API returns this value in ISO 8601 format.
    string updated_time?;
};

# Represents fields of customer object to be updated
public type SelzApiPublicModelsCustomersCustomerputrequest record {
    # Customer first name
    string first_name?;
    # Customer last name
    string last_name?;
    # Customer email address
    string email?;
    # Customer accepts marketing
    boolean accepts_marketing?;
    # Company
    string company?;
    # Represents fields of customer's Address object to be updated
    SelzApiPublicModelsCustomersAddressputrequest delivery_address?;
    # Represents fields of customer's Address object to be updated
    SelzApiPublicModelsCustomersAddressputrequest billing_address?;
};

public type SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsProductsProductresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    SelzCoreApiModelsSlicedlistmetadata pagination?;
    SelzApiPublicModelsProductsProductresponse[] data?;
    SelzCoreApiModelsErrorresponse[] errors?;
};

# CardPaymentDetailsResponse
public type SelzApiPublicModelsOrdersCardpaymentdetailsresponse record {
    # Reference id from the payment gateway response
    string reference?;
    # Brand of the credit card
    string brand?;
    # Name on the credit card
    string name?;
    # Country the credit card was issued in
    string country?;
    # Last four digits of the credit card
    string last_four?;
};

# RefundResponse
public type SelzApiPublicModelsRefundsRefundresponse record {
    # The refund's identifier.
    string id?;
    # The identifier of the order the refund is associated with.
    string order_id?;
    # The current status of refund.
    string status?;
    # The total amount refunded
    string total_amount?;
    # Three-letter ISO currency code representing the currency of the refund
    string currency?;
    # The date and time when the refund was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the refund was updated. The API returns this value in ISO 8601 format.
    string updated_time?;
};

# Address
public type SelzApiPublicModelsStoreAddressresponse record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

public type SelzCoreApiModelsErrorresponse record {
    string code?;
    string message?;
};

public type SelzCoreApiModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    SelzCoreApiModelsSlicedlistmetadata pagination?;
    SelzApiPublicModelsCategoriesCategoryresponse[] data?;
    SelzCoreApiModelsErrorresponse[] errors?;
};

# PaypalPaymentDetailsResponse
public type SelzApiPublicModelsOrdersPaypalpaymentdetailsresponse record {
    # Reference id returned from Paypal for the transaction
    string reference?;
    # Email address of the Paypal account used for the transaction
    string email?;
};

# VariantAttributeResponse
public type SelzApiPublicModelsProductsVariantattributeresponse record {
    # Unique identifier of the variant option
    string id?;
    # Attribute name (e.g: "Size", "Color", etc)
    string name?;
    # Attribute option (e.g: "Red", "Green", "Yellow", etc)
    SelzApiPublicModelsProductsVariantoptionresponse[] options?;
};

# Webhook
public type SelzApiPublicModelsWebhooksWebhookrequest record {
    # The URL where the webhook should send the POST request when the event occurs.
    string url?;
    # Event type: e.g order_payment_succeeded, product_soldout
    string event_type?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDiscountsDiscountresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsDiscountsDiscountresponse[] data?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsCategoriesCategoryresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsCategoriesCategoryresponse[] data?;
};

# Add image to blog post by base64 encoded string or url to download
public type SelzApiPublicModelsBlogpostsAddimagerequest record {
    # A base64 encoded string representing the file
    string attachment?;
    # The name of the file, required if using base64 encoded string
    string filename?;
    # The source URL of the file that will be downloaded by Selz
    string url?;
};

# Object representing discount
public type SelzApiPublicModelsDiscountsDiscountresponse record {
    # The unique identifier for the discount.
    string id?;
    # A friendly name to remember the discount
    string name?;
    # The case-insensitive discount code that customers use at checkout.
    string code?;
    # The shorten url associated with the discount
    string short_url?;
    # Specify to what the discount's value is applied to a product, category or an order.
    string 'type?;
    # The unique identifier of the product or the category to which discount applies to.
    string target_id?;
    # The minimum order value for the discount to be valid. This value excludes tax and shipping and applies to the order
    # discounts only.
    string minimum_value?;
    # Discount includes free shipping.
    boolean free_shipping?;
    # Value that will be taken off.
    string value_off?;
    # Percent that will be taken off.
    int percent_off?;
    # Three-letter ISO currency code representing the currency of the category or order type discount value. Product
    # discounts are in the product currency.
    string currency_code?;
    # Maximum number of times the discount can be applied.
    int quantity?;
    # Number of times the discount was applied.
    int quantity_sold?;
    # The date the discount becomes valid for use during checkout in ISO 8601 format.
    string valid_from?;
    # The date when the discount code becomes disabled in ISO 8601 format.
    string valid_to?;
    # States whether the discount is visible. Valid values are "true" for visible and "false" for hidden. By default
    # false
    boolean is_published?;
    # The date and time when the discount was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the discount was last updated. The API returns this value in ISO 8601 format.
    string updated_time?;
};

# CatalogOrderResponse
public type SelzApiPublicModelsProductsCatalogorderresponse record {
    # Unique identifier of the order
    string id?;
    # Order reference id used by the seller and customer
    string reference_id?;
    # CatalogBuyerResponse
    SelzApiPublicModelsProductsCatalogbuyerresponse customer?;
    # Line items of the order
    SelzApiPublicModelsProductsCatalogorderitemresponse[] items?;
    # Three-letter ISO currency code representing the currency of the product price
    string currency?;
    # Total price of the order
    string total_price?;
    # Total price of the shipping method
    string total_shipping?;
    # Total amount of tax charged
    string total_tax?;
    # Tax is including in the price (true/false)
    boolean price_includes_tax?;
    # Status of the order (processed, failed, completed, refunded, disputed, etc)
    string status?;
    # The date and time when the order was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # Custom tracking id
    string tracking_id?;
    # List of custom fields
    record {} custom_fields?;
};

# LicenseVerifyResponse
public type SelzApiPublicModelsProductsLicenseverifyresponse record {
    # True if the license is active, false otherwise
    boolean is_active?;
    # Number of time the licenses has been used
    int usage_count?;
    # CatalogOrderResponse
    SelzApiPublicModelsProductsCatalogorderresponse 'order?;
};

# WebHookPutRequest
public type SelzApiPublicModelsWebhooksWebhookputrequest record {
    # The URL where the webHook should send the POST request when the event occurs.
    string url?;
    # Event type: e.g order_payment_succeeded, product_soldout
    string event_type?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsWebhooksWebhookresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsWebhooksWebhookresponse[] data?;
};

# Image
public type SelzApiPublicModelsBlogpostsShopimagerequest record {
    # Url of the blog post image
    string url?;
};

# Order
public type SelzApiPublicModelsOrdersOrderresponse record {
    # Unique identifier of the order
    string id?;
    # Order reference id used by the seller and customer
    string reference_id?;
    # BuyerResponse
    SelzApiPublicModelsOrdersBuyerresponse customer?;
    # Line items of the order
    SelzApiPublicModelsOrdersOrderitemresponse[] items?;
    # Three-letter ISO currency code representing the currency of the product price
    string currency?;
    # Total price of the order
    string total_price?;
    # Total price of the shipping method
    string total_shipping?;
    # Total tax charged on shipping
    string shipping_tax?;
    # Shipping tax rate
    decimal shipping_tax_rate?;
    # Shipping tax name
    string shipping_tax_name?;
    # Total amount of tax charged for the whole order (including shipping)
    string total_tax?;
    # Tax is including in the price (true/false)
    boolean price_includes_tax?;
    # Total amount of fees charged
    string total_fees?;
    # Status of the order (processed, failed, completed, refunded, disputed, etc)
    string status?;
    # The date and time when the order was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the order was updated. The API returns this value in ISO 8601 format.
    string updated_time?;
    # Custom tracking id
    string tracking_id?;
    # Custom fields
    record {} custom_fields?;
    # PaymentDetailsResponse
    SelzApiPublicModelsOrdersPaymentdetailsresponse payment_details?;
    # Type of payment processor
    string payment_processor_type?;
};

# CatalogAddressResponse
public type SelzApiPublicModelsProductsCatalogaddressresponse record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

# Add image to product by base64 encoded string or url to download
public type SelzApiPublicModelsProductsAddimagerequest record {
    # A base64 encoded string representing the file
    string attachment?;
    # The name of the file, required if using base64 encoded string
    string filename?;
    # The source URL of the file that will be downloaded by Selz
    string url?;
};

# ProductVariantRequest
public type SelzApiPublicModelsProductsProductvariantputrequest record {
    # Stock keeping unit of the product variant
    string sku?;
    # The title of the product variant.
    string title?;
    # The price of the product variant
    string price?;
    # The number of items in stock for this product variant
    int quantity?;
    # The number of items in stock which is available for this product
    int quantity_available?;
    # Flag indicating that number of items in stock for this product variant is unlimited
    boolean is_unlimited_quantity?;
    # A list of object Id's as strings representing variant options
    record {} options?;
};

# Bank detail of a transfer
public type SelzApiPublicModelsPayoutsPayoutdestinationbankresponsemodel record {
    # Name
    string name?;
    # Country
    string country?;
    # Routing
    string routing?;
    # Last four digit of the card
    string last_four?;
};

# ProductPutRequest
public type SelzApiPublicModelsProductsProductputrequest record {
    # The type of Product, can be physical, digital or service
    string product_type?;
    # Stock keeping unit of the product
    string sku?;
    # The name of the product
    string title?;
    # The description of the product, complete with HTML formatting
    string description?;
    # Page title used for SEO
    string page_title?;
    # Meta description used for SEO
    string meta_description?;
    # The slug of the product
    string slug?;
    # The number of items in stock for this product
    int quantity?;
    # The number of items in stock which is available for this product
    int quantity_available?;
    # Flag indicating that number of items in stock is unlimited
    boolean is_unlimited_quantity?;
    # Three-letter ISO currency code representing the currency of the product price
    string currency_code?;
    # The price of the product
    string price?;
    # The original price of the product
    string regular_price?;
    # Is the price flexible
    boolean is_price_flexible?;
    # The published state of the product
    boolean is_published?;
    # Flag indicating if product has free shipping
    boolean is_free_shipping?;
    # The weight of the product in the unit system specified with weight_unit.
    string weight?;
    # The unit system that the product's weight is measure in. The weight_unit can be either "g", "kg, "oz", or "lb".
    string weight_unit?;
    # A list of variant objects, each one representing a slightly different version of the product
    SelzApiPublicModelsProductsProductvariantrequest[] variants?;
    # ImageRequest
    SelzApiPublicModelsProductsImagerequest image?;
};

# AddImageResponse
public type SelzApiPublicModelsProductsAddimageresponse record {
    # The Url of the image
    string url?;
};

# Create a blog post
public type SelzApiPublicModelsBlogpostsBlogpostrequest record {
    # The title of the blog.
    string title?;
    # A human-friendly unique string for the blogPost automatically generated from its title
    string slug?;
    # An excerpt of the blog post, complete with HTML markup
    string excerpt?;
    # The content of the blog post
    string content?;
    # The HTML meta title that specifies the title of the blog web page
    string meta_title?;
    # The HTML meta description that specifies the description of the blog web page
    string meta_description?;
    # States whether the blog post is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # States whether comments are allowed on the blog post
    boolean disable_comments?;
    # Image
    SelzApiPublicModelsBlogpostsShopimagerequest image?;
    # Comma separated tags Id associated with this blog post
    string tags?;
};

# A customer
public type SelzApiPublicModelsCustomersCustomerresponse record {
    # Unique identifier of the customer
    string id?;
    # Customer first name
    string first_name?;
    # Customer last name
    string last_name?;
    # Customer email address
    string email?;
    # Customer accepts marketing
    boolean accepts_marketing?;
    # Company
    string company?;
    # Address Response
    SelzApiPublicModelsCustomersAddressresponse delivery_address?;
    # Address Response
    SelzApiPublicModelsCustomersAddressresponse billing_address?;
    # The date and time when the customer was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the customer was last updated. The API returns this value in ISO 8601 format.
    string updated_time?;
};

# CatalogOrderItemResponse
public type SelzApiPublicModelsProductsCatalogorderitemresponse record {
    # Unique identifier of the product.
    string product_id?;
    # The name of the product.
    string product_title?;
    # Stock keeping unit of the product.
    string product_sku?;
    # Unique identifier of the product variant.
    string product_variant_id?;
    # The name of the product variant.
    string product_variant_title?;
    # Stock keeping unit of the product variant.
    string product_variant_sku?;
    # Discount code applied to the line item
    string discount_code?;
    # The number of products ordered
    int quantity?;
    # Unit price of the line item
    string unit_price?;
    # Currency of the product ordered
    string currency?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzOrdersApiModelsRefundresponseSelzOrdersApiModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzOrdersApiModelsRefundresponse[] data?;
};

# Represent an Category object to be created
public type SelzApiPublicModelsCategoriesCategoryrequest record {
    # An optional unique identifier of the parent category
    string parent_id?;
    # The title of the category.
    string title?;
    # The HTML meta title that specifies the title of the category web page
    string meta_title?;
    # A human-friendly unique string for the category automatically generated from its title
    string slug?;
    # The description of the category, complete with HTML markup
    string description?;
    # The HTML meta description that specifies the description of the categoty web page
    string meta_description?;
    # States whether the category is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # List of product Ids which belong to the category
    string[] products?;
    # Sort type of category: "manual", "alpha_asc", "alpha_desc", "created_asc", "created_desc", "price_asc", "price_desc"
    string sort_type?;
    # ImageRequest
    SelzApiPublicModelsProductsImagerequest image?;
};

# Address Request
public type SelzApiPublicModelsCustomersAddressrequest record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

public type SelzCoreApiModelsSlicedlistmetadata record {
    int 'limit?;
    string previous_cursor?;
    string next_cursor?;
    boolean has_previous?;
    boolean has_next?;
};

# LicenseVerifyRequest
public type SelzApiPublicModelsProductsLicenseverifyrequest record {
    # The license key itself
    string 'key?;
    # Should the license usage count be incremented
    boolean increment_usage_count?;
};

# Address Response
public type SelzApiPublicModelsCustomersAddressresponse record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsDisputesDisputeresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsDisputesDisputeresponse[] data?;
};

# Represents a customer object to be create
public type SelzApiPublicModelsCustomersCustomerrequest record {
    # Customer first name
    string first_name?;
    # Customer last name
    string last_name?;
    # Customer email address
    string email?;
    # Accepts marketing
    boolean accepts_marketing?;
    # Company
    string company?;
    # Business number
    string business_number?;
    # Address Request
    SelzApiPublicModelsCustomersAddressrequest delivery_address?;
    # Address Request
    SelzApiPublicModelsCustomersAddressrequest billing_address?;
};

# WebHookResponse
public type SelzApiPublicModelsWebhooksWebhookresponse record {
    # Unique identifier of the webHook
    string id?;
    # A secret that you can use to validate the integrity of these webHooks
    string 'key?;
    # The URL where the webHook should send the POST request when the event occurs.
    string url?;
    # Description of the event: e.g order_payment_succeeded, product_soldout
    string event_type?;
    # The date and time when the webHook was created. The API returns this value in ISO 8601 format
    string created_time?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsPayoutsPayoutresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsPayoutsPayoutresponse[] data?;
};

public type SelzOrdersApiModelsRefundresponse record {
    string id?;
    int shop_id?;
    string order_id?;
    string order_created_date?;
    string order_reference_id?;
    decimal total_amount?;
    decimal total_amount_in_base_currency?;
    decimal disbursed?;
    decimal balance?;
    decimal balance_in_base_currency?;
    string currency_code?;
    decimal currency_rate?;
    boolean exclude_from_seller_balance?;
    string payment_gateway?;
    string payment_processor_type?;
    string status?;
    string created_by?;
    string created_time?;
    string updated_by?;
    string updated_time?;
    record {} extra_data?;
};

# AddProductToCategoryResponse
public type SelzApiPublicModelsProductsAddproducttocategoryresponse record {
    # The category Id
    string category_id?;
};

# Bank detail of the payout
public type SelzApiPublicModelsPayoutsPayoutdestinationresponsemodel record {
    # Type
    string 'type?;
    # Bank detail of a transfer
    SelzApiPublicModelsPayoutsPayoutdestinationbankresponsemodel bank?;
};

# ImageRequest
public type SelzApiPublicModelsProductsImagerequest record {
    # The image url
    string url?;
};

# AddProductToCategoryRequest
public type SelzApiPublicModelsProductsAddproducttocategoryrequest record {
    # The category Id
    string category_id?;
};

# ImageResponse
public type SelzApiPublicModelsProductsImageresponse record {
    # The url if the original image
    string original?;
    # Is featured
    boolean is_featured?;
    # Is default
    boolean is_default?;
    # 24 x 24 pixels image
    string pico?;
    # 48 x 48 pixels image
    string icon?;
    # 64 x 64 pixels image
    string thumb?;
    # 96 x 96 pixels image
    string small?;
    # 192 x 192 pixels image
    string compact?;
    # 256 x 256 pixels image
    string medium?;
    # 640 x 640 pixels image
    string large?;
    # 1280 x 1280 pixels
    string grande?;
    # 1600 x 1600 pixels
    string mucho_grande?;
    # 2048 x 2048 pixels
    string huge?;
};

# ProductVariantResponse
public type SelzApiPublicModelsProductsProductvariantresponse record {
    # Unique identifier of the product variant
    string id?;
    # Stock keeping unit of the product variant
    string sku?;
    # The title of the product variant.
    string title?;
    # The original price of the product variant
    decimal price_regular?;
    # The price of the product variant
    decimal price?;
    # The number of items in stock for this product variant
    int quantity?;
    # The number of items in stock which is available for this product variant
    int quantity_available?;
    # A list of options, each one representing a slightly different version of the product variant
    string[] options?;
};

# Represents fields of customer's Address object to be updated
public type SelzApiPublicModelsCustomersAddressputrequest record {
    # Street address
    string line1?;
    # An optional additional field for the street address
    string line2?;
    # City/Suburb/Town/Village
    string city?;
    # Zip/Postal Code
    string post_code?;
    # Code for the state or region
    string state_code?;
    # Two-letter ISO code for the country
    string country_code?;
};

# Subscription
public type SelzApiPublicModelsStoreShopsubscriptionresponse record {
    # Plan Id of the subscription (e.g. Free, Basic, Standard, Advanced)
    string plan_id?;
    # Plan name of the subscription (e.g. Free, Basic - 2019 Standard - 2019, Advanced - 2019)
    string plan_name?;
};

# Represent Category detail
public type SelzApiPublicModelsCategoriesCategoryresponse record {
    # Unique identifier of the category
    string id?;
    # Unique identifier of the parent category
    string parent_id?;
    # The title of the category.
    string title?;
    # The HTML meta title that specifies the title of the categoty web page
    string meta_title?;
    # The description of the category, complete with HTML markup
    string description?;
    # The HTML meta description that specifies the description of the category web page
    string meta_description?;
    # ImageResponse
    SelzApiPublicModelsProductsImageresponse image?;
    # A human-friendly unique string for the category automatically generated from its title
    string slug?;
    # The order in which products in the category appear
    string sort_type?;
    # States whether the category is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
    # The date and time when the category was created. The API returns this value in ISO 8601 format.
    string created_time?;
    # The date and time when the category was last updated. The API returns this value in ISO 8601 format.
    string updated_time?;
};

# SlicedListResponse
public type SelzApiPublicModelsSlicedlistresponse1SelzApiPublicModelsOrdersOrderresponseSelzApiPublicModelsVersion1000CultureNeutralPublickeytokenNull record {
    # Limit on the number of objects to be returned
    int 'limit?;
    # Flag indicating if list has more objects
    boolean has_more?;
    # List of objects
    SelzApiPublicModelsOrdersOrderresponse[] data?;
};

# ProductRequest
public type SelzApiPublicModelsProductsProductrequest record {
    # Type of product (e.g. physical, digital, etc)
    string product_type?;
    # Stock keeping unit of the product
    string sku?;
    # The name of the product
    string title?;
    # The description of the product, complete with HTML formatting
    string description?;
    # Page title used for SEO
    string page_title?;
    # Meta description used for SEO
    string meta_description?;
    # The slug of the product
    string slug?;
    # The number of items in stock for this product
    int quantity?;
    # Three-letter ISO currency code representing the currency of the product price
    string currency_code?;
    # The price of the product
    string price?;
    # The original price of the product
    string regular_price?;
    # Is the price flexible
    boolean is_price_flexible?;
    # The published state of the product
    boolean is_published?;
    # Flag indicating if product has free shipping
    boolean is_free_shipping?;
    # The weight of the product in the unit system specified with weight_unit.
    string weight?;
    # The unit system that the product's weight is measure in. The weight_unit can be either "g", "kg, "oz", or "lb". Default is "g".
    string weight_unit?;
    # A list of variant objects, each one representing a slightly different version of the product
    SelzApiPublicModelsProductsProductvariantrequest[] variants?;
    # Product image
    SelzApiPublicModelsProductsImagerequest[] images?;
};

# Error response model
public type SelzApiPublicModelsErrorresponse record {
    # The type of error returned. Can be: api_connection_error, api_error, authentication_error, invalid_request_error, or rate_limit_error.
    string 'type?;
    # A human-readable message providing more details about the error.
    string message?;
    # The parameter the error relates to if the error is parameter-specific.
    record {} errors?;
};

# Represents an object that is required to create a discount.
public type SelzApiPublicModelsDiscountsDiscountrequest record {
    # A friendly name to remember the discount
    string name?;
    # The case-insensitive discount code that customers use at checkout.
    string code?;
    # Specify to what the discount's value is applied to a product, category or an order.
    string 'type?;
    # The unique identifier of the product or the category to which discount applies to.
    string target_id?;
    # The minimum order value for the discount to be valid. This value excludes tax and shipping and applies to the order discounts only.
    string minimum_value?;
    # Value that will be taken off.
    string value_off?;
    # Discount includes free shipping.
    boolean free_shipping?;
    # Percent that will be taken off.
    int percent_off?;
    # Three-letter ISO currency code representing the currency of the category or order type discount value. Product discounts are in the product currency.
    string currency_code?;
    # Maximum number of times the discount can be applied.
    int quantity?;
    # The date the discount becomes valid for use during checkout in ISO 8601 format.
    string valid_from?;
    # The date when the discount code becomes disabled in ISO 8601 format.
    string valid_to?;
    # States whether the discount is visible. Valid values are "true" for visible and "false" for hidden. By default false
    boolean is_published?;
};

# VariantOptionResponse
public type SelzApiPublicModelsProductsVariantoptionresponse record {
    # Unique identifier of the variant option
    string id?;
    # Variant option value (e.g: "Red", "Green", "Yellow", etc)
    string value?;
};
