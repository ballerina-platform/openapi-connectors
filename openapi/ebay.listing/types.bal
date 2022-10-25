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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# The type that defines the fields for the price details for an item.
public type PricingSummary record {
    # The type that defines the fields for the currency and a monetary amount.
    Amount auctionReservePrice?;
    # The type that defines the fields for the currency and a monetary amount.
    Amount auctionStartPrice?;
    # The type that defines the fields for the currency and a monetary amount.
    Amount price?;
};

# The type that defines the fields for the currency and a monetary amount.
public type Amount record {
    # The three-letter ISO 4217 code representing the currency of the amount in the value field. Restriction: Only the currency of the marketplace is supported. For example, on the US marketplace the only currency supported is USD. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/listing/types/bas:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The monetary amount, in the currency specified by the currency field.
    string value?;
};

# This type defines the fields that can be returned in an error.
public type Error record {
    # Identifies the type of erro.
    string category?;
    # Name for the primary system where the error occurred. This is relevant for application errors.
    string domain?;
    # A unique number to identify the error.
    int errorId?;
    # An array of request elements most closely associated to the error.
    string[] inputRefIds?;
    # A more detailed explanation of the error.
    string longMessage?;
    # Information on how to correct the problem, in the end user's terms and language where applicable.
    string message?;
    # An array of request elements most closely associated to the error.
    string[] outputRefIds?;
    # An array of name/value pairs that describe details the error condition. These are useful when multiple errors are returned.
    ErrorParameter[] parameters?;
    # Further helps indicate which subsystem the error is coming from. System subcategories include: Initialization, Serialization, Security, Monitoring, Rate Limiting, etc.
    string subdomain?;
};

# The type that defines the fields for the aspects of a product.
public type Product record {
    # The list of item aspects that describe the item (such as size, color, capacity, model, brand, etc.)
    Aspect[] aspects?;
    # The name brand of the item, such as Nike, Apple, etc.
    string brand?;
    # The description of the item that was created by the seller. This field supports plain text or rich content within HTML tags. Note: Active content is not supported. Active content includes animation or video via JavaScript, Flash, plug-ins, or form actions. Max Length: 500,000
    string description?;
    # An EPID is the eBay product identifier of a product from the eBay product catalog. Note: If you submit both a category ID and an EPID, eBay determines the best category based on the EPID and uses that. The category ID will be ignored.
    string epid?;
    # The image URLs of the item. The first URL will be the primary image, which appears on the View Item page in the eBay listing. The URL can be from the following: The eBay Picture Services (images previously uploaded). A server outside of eBay (self-hosted). For more details, see PictureURL and Introduction to Pictures in Listings. Maximum: 12 URLs (for most categories and marketplaces) Restrictions: You cannot mix self-hosted and EPS-hosted URLs in the same listing. All image URLs must be 'https'.
    string[] imageUrls?;
    # The seller-created title of the item. This should include unique characteristics of the item, such as brand, model, color, size, capacity, etc. For example: Levi's 501 size 10 black jeans
    string title?;
};

public type ErrorParameter record {
    # The object of the error.
    string name?;
    # The value of the object.
    string value?;
};

# The type that defines the fields for the listing details.
public type ItemDraft record {
    # The ID of the leaf category associated with this item. A leaf category is the lowest level in that category and has no children. Note: If you submit both a category ID and an EPID, eBay determines the best category based on the EPID and uses that. The category ID will be ignored.
    string categoryId?;
    # The enumeration value passed in here sets the condition of the item, such as NEW or USED_EXCELLENT. See ConditionEnum for the full list of supported values. Supported item conditions can vary by eBay category. To see which item conditions are supported for a category, you can use the getItemConditionPolicies method of the Metadata API. Note: The 'Manufacturer Refurbished' item condition is no longer a valid item condition in any eBay marketplace, and to reflect this change, the pre-existing MANUFACTURER_REFURBISHED enumeration value has been replaced by the CERTIFIED_REFURBISHED enumeration value. CR-eligible sellers should make a note to start using CERTIFIED_REFURBISHED from this point forward. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/listing/types/api:ConditionEnum'>eBay API documentation</a>
    string condition?;
    # The format of the listing. Valid Values: FIXED_PRICE and AUCTION For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/listing/types/api:ListingFormatEnum'>eBay API documentation</a>
    string format?;
    # The type that defines the fields for the price details for an item.
    PricingSummary pricingSummary?;
    # The type that defines the fields for the aspects of a product.
    Product product?;
    # This type is used to identify the charitable organization that will receive a percentage of sale proceeds for each sale generated by the listing. This container also includes the donation percentage, which is the percentage of the sale proceeds that the charitable organization will get. In order to receive a percentage of the sales proceeds, the non-profit organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
    Charity charity?;
};

# The type that defines the fields for the item aspects.
public type Aspect record {
    # The name of an aspect, such and Brand.
    string name?;
    # A list of potential values for this aspect.
    string[] values?;
};

# This type is used to identify the charitable organization that will receive a percentage of sale proceeds for each sale generated by the listing. This container also includes the donation percentage, which is the percentage of the sale proceeds that the charitable organization will get. In order to receive a percentage of the sales proceeds, the non-profit organization must be registered with the PayPal Giving Fund, which is a partner of eBay for Charity.
public type Charity record {
    # This field sets the percentage of the purchase price that the charitable organization (identified in the charityId field) will receive for each sale that the listing generates. This field is conditionally required if a seller is planning on donating a percentage of the sale proceeds to a charitable organization. This numeric value can range from 10 to 100, and in any 5 (percent) increments in between this range (e.g. 10, 15, 20...95,... 100). The seller would pass in 10 for 10 percent, 15 for 15 percent, 20 for 20 percent, and so on, all the way to 100 for 100 percent. Note: For this field, createItemDraft will only validate that a positive integer value is supplied, so the listing draft will still be successfully created (with no error or warning message) if a non-supported value is specified. However, if the seller attempted to publish this listing draft with an unsupported value, the charity information would just be dropped from the listing.
    string donationPercentage?;
    # The eBay-assigned unique identifier of the charitable organization that will receive a percentage of the sales proceeds. The charitable organization must be reqistered with the PayPal Giving Fund in order to receive sales proceeds through eBay listings. This field is conditionally required if a seller is planning on donating a percentage of the sale proceeds to a charitable organization. The eBay-assigned unique identifier of a charitable organization can be found using the GetCharities call of the Trading API. In the GetCharities call response, this unique identifier is shown in the id attribute of the Charity container.
    string charityId?;
};

# The type that defines the field for the createItemDraft response.
public type ItemDraftResponse record {
    # The eBay generated ID of the listing draft.
    string itemDraftId?;
    # The URI the Partner uses to send the seller to their listing draft that was created on the eBay site. From there the seller can change, update, and publish the item on eBay. This is returned when the seller is using a mobile app.
    string sellFlowNativeUri?;
    # The web URL the Partner uses to send the seller to the listing draft that was created on the eBay site. From there the seller can change, update, and publish the item on eBay. This is returned when the seller is using mobile web (mweb) or the desktop web. Note: You must construct the URL using the URL returned in this field and a session token. For example: sellFlowUrl?id_token=session_token
    string sellFlowUrl?;
};
