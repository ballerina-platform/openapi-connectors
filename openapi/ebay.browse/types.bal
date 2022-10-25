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
    OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

# The type that defines the fields for the addItems request.
public type AddCartItemInput record {
    # The eBay RESTful identifier of the item you want added to the cart. RESTful Item ID Format: v1|#|# For example: v1|2**********2|0 v1|1**********2|4**********2 For more information about item ID for RESTful APIs, see the Legacy API compatibility section of the Buy APIs Overview. Maximum number of items in a cart: 100
    string itemId?;
    # The number of this item the buyer wants to purchase. If this value is greater than the number available, the service will change this value to the number available. If this happens, a warning is returned. Maximum: number available
    int quantity?;
};

# The type that defines the fields for product ratings. Only products that are in the eBay product catalog can be reviewed and rated.
public type RatingHistogram record {
    # The total number of user ratings that the product has received.
    int count?;
    # This is the average rating for the product. As part of a product review, users rate the product. Products are rated from one star (terrible) to five stars (excellent), with each star having a corresponding point value - one star gets 1 point, two stars get 2 points, and so on. If a product had one four-star rating and one five-star rating, its average rating would be 4.5, and this is the value that would appear in this field.
    string rating?;
};

# The type that defines the fields for an address.
public type Address record {
    # The first line of the street address. Note: This is conditionally returned in the itemLocation field.
    string addressLine1?;
    # The second line of the street address. This field is not always used, but can be used for 'Suite Number' or 'Apt Number'.
    string addressLine2?;
    # The city of the address.
    string city?;
    # The two-letter ISO 3166 standard of the country of the address. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CountryCodeEnum'>eBay API documentation</a>
    string country?;
    # The county of the address.
    string county?;
    # The postal code (or zip code in US) code of the address. Sellers set a postal code (or zip code in US) for items when they are listed. The postal code is used for calculating proximity searches. It is anonymized when returned in itemLocation.postalCode via the API.
    string postalCode?;
    # The state or province of the address. Note: This is conditionally returned in the itemLocation field.
    string stateOrProvince?;
};

# The type that defines the fields for the contact information for a seller.
public type SellerLegalInfo record {
    # The seller's business email address.
    string email?;
    # The seller' business fax number.
    string fax?;
    # This is a free-form string created by the seller. This is information often found on business cards, such as address. This is information used by some countries.
    string imprint?;
    # The seller's first name.
    string legalContactFirstName?;
    # The seller's last name.
    string legalContactLastName?;
    # The name of the seller's business.
    string name?;
    # The seller's business phone number.
    string phone?;
    # The seller's registration number. This is information used by some countries.
    string registrationNumber?;
    # Type that defines the fields for the seller's address.
    LegalAddress sellerProvidedLegalAddress?;
    # This is a free-form string created by the seller. This is the seller's terms or condition, which is in addition to the seller's return policies.
    string termsOfService?;
    # An array of the seller's VAT (value added tax) IDs and the issuing country. VAT is a tax added by some European countries.
    VatDetail[] vatDetails?;
};

public type AspectGroup record {
    # An array of the name/value pairs for the aspects of the product. For example: BRAND/Apple
    Aspect[] aspects?;
    # The name of a group of aspects. In the following example, Product Identifiers and Process are product aspect group names. Under the group name are the product aspect name/value pairs. Product Identifiers &nbsp;&nbsp;&nbsp;Brand/Apple &nbsp;&nbsp;&nbsp;Product Family/iMac Processor &nbsp;&nbsp;&nbsp;Processor Type/Intel &nbsp;&nbsp;&nbsp;Processor Speed/3.10
    string localizedGroupName?;
};

# The type that defines the fields for the product information of the item.
public type Product record {
    # An array of containers with the URLs for the product images that are in addition to the primary image.
    Image[] additionalImages?;
    # An array of product identifiers associated with the item. This container is returned if the seller has associated the eBay Product Identifier (ePID) with the item and in the request fieldgroups is set to PRODUCT.
    AdditionalProductIdentity[] additionalProductIdentities?;
    # An array of containers for the product aspects. Each group contains the aspect group name and the aspect name/value pairs.
    AspectGroup[] aspectGroups?;
    # The brand associated with product. To identify the product, this is always used along with MPN (manufacturer part number).
    string brand?;
    # The rich description of an eBay product, which might contain HTML.
    string description?;
    # An array of all the possible GTINs values associated with the product. A GTIN is a unique Global Trade Item number of the item as defined by https://www.gtin.info. This can be a UPC (Universal Product Code), EAN (European Article Number), or an ISBN (International Standard Book Number) value.
    string[] gtins?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image image?;
    # An array of all possible MPN values associated with the product. A MPNs is manufacturer part number of the product. To identify the product, this is always used along with brand.
    string[] mpns?;
    # The title of the product.
    string title?;
};

# The type that defines the fields for basic and detailed information about the seller of the item returned by the item resource.
public type SellerDetail record {
    # The percentage of the total positive feedback.
    string feedbackPercentage?;
    # The feedback score of the seller. This value is based on the ratings from eBay members that bought items from this seller.
    int feedbackScore?;
    # This indicates if the seller is a business or an individual. This is determined when the seller registers with eBay. If they register for a business account, this value will be BUSINESS. If they register for a private account, this value will be INDIVIDUAL. This designation is required by the tax laws in the following countries: This field is returned only on the following sites. EBAY_AT, EBAY_BE, EBAY_CH, EBAY_DE, EBAY_ES, EBAY_FR, EBAY_GB, EBAY_IE, EBAY_IT, EBAY_PL Valid Values: BUSINESS or INDIVIDUAL Code so that your app gracefully handles any future changes to this list.
    string sellerAccountType?;
    # The type that defines the fields for the contact information for a seller.
    SellerLegalInfo sellerLegalInfo?;
    # The user name created by the seller for use on eBay.
    string username?;
};

# The container that defines the fields for the conditions refinements. This container is returned when fieldgroups is set to ASPECT_REFINEMENTS or FULL in the request.
public type AspectValueDistribution record {
    # The value of an aspect. For example, Red is a value for the aspect Color.
    string localizedAspectValue?;
    # The number of items with this aspect.
    int matchCount?;
    # A HATEOAS reference for this aspect.
    string refinementHref?;
};

# The type that defines the fields that include and exclude geographic regions affecting where the item can be shipped. The seller defines these regions when listing the item.
public type ShipToLocations record {
    # An array of containers that express the large geographical regions, countries, state/provinces, or special locations within a country where the seller is not willing to ship to.
    ShipToRegion[] regionExcluded?;
    # An array of containers that express the large geographical regions, countries, or state/provinces within a country where the seller is willing to ship to. Prospective buyers must look at the shipping regions under this container, as well as the shipping regions that are under the regionExcluded to see where the seller is willing to ship items. Sellers can specify that they ship 'Worldwide', but then add several large geographical regions (e.g. Asia, Oceania, Middle East) to the exclusion list, or sellers can specify that they ship to Europe and Africa, but then add several individual countries to the exclusion list.
    ShipToRegion[] regionIncluded?;
};

# The type that defines the fields for the updateQuantity request.
public type UpdateCartItemInput record {
    # The identifier of the item in the cart to be updated. This ID is generated when the item was added to the cart.
    string cartItemId?;
    # The new quantity for the item that is being updated.
    int quantity?;
};

# The type that defines the fields for the name/value pairs for the aspects of the product. For example: BRAND/Apple
public type Aspect record {
    # The text representing the name of the aspect for the name/value pair, such as Brand.
    string localizedName?;
    # The text representing the value of the aspect for the name/value pair, such as Apple.
    string[] localizedValues?;
};

# Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
public type Image record {
    # Reserved for future use.
    int height?;
    # The URL of the image.
    string imageUrl?;
    # Reserved for future use.
    int width?;
};

# An array of containers with the details for all of the items returned.
public type CoreItem record {
    # An array of containers with the URLs for the images that are in addition to the primary image. The primary image is returned in the image.imageUrl field.
    Image[] additionalImages?;
    # This indicates if the item is for adults only. For more information about adult-only items on eBay, see Adult items policy for sellers and Adult-Only items on eBay for buyers.
    boolean adultOnly?;
    # (Primary Item Aspect) The age group for which the product is recommended. For example, newborn, infant, toddler, kids, adult, etc. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string ageGroup?;
    # A type that identifies whether the item is qualified for the Authenticity Verification program.
    AuthenticityVerificationProgram authenticityVerification?;
    # A list of available coupons for the item.
    AvailableCoupon[] availableCoupons?;
    # This integer value indicates the total number of bids that have been placed against an auction item. This field is returned only for auction items.
    int bidCount?;
    # (Primary Item Aspect) The name brand of the item, such as Nike, Apple, etc. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string brand?;
    # A comma separated list of all the purchase options available for the item. The values returned are: FIXED_PRICE - Indicates the buyer can purchase the item for a set price using the Buy It Now button. AUCTION - Indicates the buyer can place a bid for the item. After the first bid is placed, this becomes a live auction item and is the only buying option for this item. BEST_OFFER - Indicates the buyer can send the seller a price they're willing to pay for the item. The seller can accept, reject, or send a counter offer. For more information on how this works, see Making a Best Offer. Code so that your app gracefully handles any future changes to this list.
    string[] buyingOptions?;
    # The ID of the leaf category for this item. A leaf category is the lowest level in that category and has no children.
    string categoryId?;
    # Text that shows the category hierarchy of the item. For example: Computers/Tablets &amp; Networking, Laptops &amp; Netbooks, PC Laptops &amp; Netbooks
    string categoryPath?;
    # (Primary Item Aspect) Text describing the color of the item. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string color?;
    # A short text description for the condition of the item, such as New or Used. For a list of condition names, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string condition?;
    # A full text description for the condition of the item. This field elaborates on the value specified in the condition field and provides full details for the condition of the item. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionDescription?;
    # The identifier of the condition of the item. For example, 1000 is the identifier for NEW. For a list of condition names and IDs, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionId?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount currentBidPrice?;
    # The full description of the item that was created by the seller. This can be plain text or rich content and can be very large.
    string description?;
    # This field indicates if the item can be purchased using the Buy Order API. If the value of this field is true, this indicates that the item can be purchased using the Order API. If the value of this field is false, this indicates that the item cannot be purchased using the Order API and must be purchased on the eBay site.
    boolean eligibleForInlineCheckout?;
    # This indicates if the item can be purchased using Guest Checkout in the Order API. You can use this flag to exclude items from your inventory that are not eligible for Guest Checkout, such as gift cards.
    boolean enabledForGuestCheckout?;
    # This indicates the European energy efficiency rating (EEK) of the item. This field is returned only if the seller specified the energy efficiency rating. The rating is a set of energy efficiency classes from A to G, where 'A' is the most energy efficient and 'G' is the least efficient. This rating helps buyers choose between various models. When the manufacturer's specifications for this item are available, the link to this information is returned in the productFicheWebUrl field.
    string energyEfficiencyClass?;
    # An EPID is the eBay product identifier of a product from the eBay product catalog. This indicates the product in which the item belongs.
    string epid?;
    # The estimated number of this item that are available for purchase. Because the quantity of an item can change several times within a second, it is impossible to return the exact quantity. So instead of returning quantity, the estimated availability of the item is returned.
    EstimatedAvailability[] estimatedAvailabilities?;
    # (Primary Item Aspect) The gender for the item. This is used for items that could vary by gender, such as clothing. For example: male, female, or unisex. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string gender?;
    # The unique Global Trade Item number of the item as defined by https://www.gtin.info. This can be a UPC (Universal Product Code), EAN (European Article Number), or an ISBN (International Standard Book Number) value.
    string gtin?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image image?;
    # The ePID (eBay Product ID of a product from the eBay product catalog) for the item, which has been programmatically determined by eBay using the item's title, aspects, and other data. If the seller provided an ePID for the item, the seller's value is returned in the epid field. Note: This field is returned only for authorized Partners.
    string inferredEpid?;
    # The URL of the View Item page of the item, which includes the affiliate tracking ID. This field is only returned if the eBay partner enables affiliate tracking for the item by including the X-EBAY-C-ENDUSERCTX request header in the method. Note: eBay Partner Network, in order to be commissioned for your sales, you must use this URL to forward your buyer to the ebay.com site.
    string itemAffiliateWebUrl?;
    # The date and time up to which the items can be purchased. This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: This field is not returned for Good 'Til Cancelled (GTC) listings.
    string itemEndDate?;
    # The unique RESTful identifier of the item.
    string itemId?;
    # The type that defines the fields for an address.
    Address itemLocation?;
    # The URL of the View Item page of the item. This enables you to include a &quot;Report Item on eBay&quot; link that takes the buyer to the View Item page on eBay. From there they can report any issues regarding this item to eBay.
    string itemWebUrl?;
    # The unique identifier of the eBay listing that contains the item. This is the traditional/legacy ID that is often seen in the URL of the listing View Item page.
    string legacyItemId?;
    # An array of containers that show the complete list of the aspect name/value pairs that describe the variation of the item.
    TypedNameValue[] localizedAspects?;
    # The number of items in a lot. In other words, a lot size is the number of items that are being sold together. A lot is a set of two or more items included in a single listing that must be purchased together in a single order line item. All the items in the lot are the same but there can be multiple items in a single lot, such as the package of batteries shown in the example below. Item Lot Definition Lot Size A package of 24 AA batteries A box of 10 packages 10 A P235/75-15 Goodyear tire 4 tires 4 Fashion Jewelry Rings Package of 100 assorted rings 100 Note: Lots are not supported in all categories.
    int lotSize?;
    # The type that defines the fields that describe a seller discount.
    MarketingPrice marketingPrice?;
    # (Primary Item Aspect) Text describing what the item is made of. For example, silk. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string material?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount minimumPriceToBid?;
    # The manufacturer's part number, which is a unique number that identifies a specific product. To identify the product, this is always used along with brand.
    string mpn?;
    # (Primary Item Aspect) Text describing the pattern used on the item. For example, paisley. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string pattern?;
    # The payment methods for the item, including the payment method types, brands, and instructions for the buyer.
    PaymentMethod[] paymentMethods?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount price?;
    # Indicates when in the buying flow the item's price can appear for minimum advertised price (MAP) items, which is the lowest price a retailer can advertise/show for this item. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PriceDisplayConditionEnum'>eBay API documentation</a>
    string priceDisplayCondition?;
    # The type that defines the fields for the details of each item in an item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. When an item group is created, one of the item variations, such as the red shirt size L, is chosen as the &quot;parent&quot;. All the other items in the group are the children, such as the blue shirt size L, red shirt size M, etc. Note: This container is returned only if the item_id in the request is an item group (parent ID of an item with variations).
    ItemGroupSummary primaryItemGroup?;
    # The type that defines the fields for the rating of a product review.
    ReviewRating primaryProductReviewRating?;
    # The type that defines the fields for the product information of the item.
    Product product?;
    # The URL of a page containing the manufacturer's specification of this item, which helps buyers make a purchasing decision. This information is available only for items that include the European energy efficiency rating (EEK) but is not available for all items with an EEK rating and is returned only if this information is available. The EEK rating of the item is returned in the energyEfficiencyClass field.
    string productFicheWebUrl?;
    # An array of the qualified programs available for the item, such as EBAY_PLUS and AUTHENTICITY_VERIFICATION. eBay Plus is a premium account option for buyers, which provides benefits such as fast free domestic shipping and free returns on selected items. Top-Rated eBay sellers must opt in to eBay Plus to be able to offer the program on qualifying listings. Sellers must commit to next-day delivery of those items. Note: eBay Plus is available only to buyers in Germany, Austria, and Australia marketplaces. The eBay Authenticity Verification program enables third-party authenticators to perform authentication verification inspections on items such as watches and sneakers.
    string[] qualifiedPrograms?;
    # The maximum number for a specific item that one buyer can purchase.
    int quantityLimitPerBuyer?;
    # This indicates if the reserve price of the item has been met. A reserve price is set by the seller and is the minimum amount the seller is willing to sell the item for. If the highest bid is not equal to or higher than the reserve price when the auction ends, the listing ends and the item is not sold. Note: This is returned only for auctions that have a reserve price.
    boolean reservePriceMet?;
    # The type that defines the fields for the seller's return policy.
    ItemReturnTerms returnTerms?;
    # The type that defines the fields for basic and detailed information about the seller of the item returned by the item resource.
    SellerDetail seller?;
    # An identifier generated/incremented when a seller revises the item. There are two types of item revisions: Seller changes, such as changing the title eBay system changes, such as changing the quantity when an item is purchased This ID is changed only when the seller makes a change to the item. This means you cannot use this value to determine if the quantity has changed.
    string sellerItemRevision?;
    # An array of shipping options containers that have the details about cost, carrier, etc. of one shipping option.
    ShippingOption[] shippingOptions?;
    # The type that defines the fields that include and exclude geographic regions affecting where the item can be shipped. The seller defines these regions when listing the item.
    ShipToLocations shipToLocations?;
    # This text string is derived from the item condition and the item aspects (such as size, color, capacity, model, brand, etc.).
    string shortDescription?;
    # (Primary Item Aspect) The size of the item. For example, '7' for a size 7 shoe. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string size?;
    # (Primary Item Aspect) The sizing system of the country. All the item aspects, including this aspect, are returned in the localizedAspects container. Valid Values: AU (Australia), BR (Brazil), CN (China), DE (Germany), EU (European Union), FR (France), IT (Italy), JP (Japan), MX (Mexico), US (USA), UK (United Kingdom) Code so that your app gracefully handles any future changes to this list.
    string sizeSystem?;
    # (Primary Item Aspect) Text describing a size group in which the item would be included, such as regular, petite, plus, big-and-tall or maternity. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string sizeType?;
    # A subtitle is optional and allows the seller to provide more information about the product, possibly including keywords that may assist with search results.
    string subtitle?;
    # The container for the tax information for the item.
    Taxes[] taxes?;
    # The seller-created title of the item. Maximum Length: 80 characters
    string title?;
    # This indicates if the item a top-rated plus item. There are three benefits of a top-rated plus item; a minimum 30-day money-back return policy, shipping the items in 1 business day with tracking provided, and the added comfort of knowing this item is from experienced sellers with the highest buyer ratings. See the Top Rated Plus Items and Becoming a Top Rated Seller and qualifying for Top Rated Plus help topics for more information.
    boolean topRatedBuyingExperience?;
    # The URL to the image that shows the information on the tyre label.
    string tyreLabelImageUrl?;
    # This integer value indicates the number of different eBay users who have placed one or more bids on an auction item. This field is only applicable to auction items.
    int uniqueBidderCount?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount unitPrice?;
    # The designation, such as size, weight, volume, count, etc., that was used to specify the quantity of the item. This helps buyers compare prices. For example, the following tells the buyer that the item is 7.99 per 100 grams. &quot;unitPricingMeasure&quot;: &quot;100g&quot;, &quot;unitPrice&quot;: { &nbsp;&nbsp;&quot;value&quot;: &quot;7.99&quot;, &nbsp;&nbsp;&quot;currency&quot;: &quot;GBP&quot;
    string unitPricingMeasure?;
};

# The type that defines the fields for the estimated item availability information.
public type EstimatedAvailability record {
    # This field is return only when the seller sets their 'display item quantity' preference to Display &quot;More than 10 available&quot; in your listing (if applicable). The value of this field will be &quot;10&quot;, which is the threshold value. Code so that your app gracefully handles any future changes to this value.
    int availabilityThreshold?;
    # This field is return only when the seller sets their Display Item Quantity preference to Display &quot;More than 10 available&quot; in your listing (if applicable). The value of this field will be MORE_THAN. This indicates that the seller has more than the 'quantity display preference', which is 10, in stock for this item. The following are the display item quantity preferences the seller can set. Display &quot;More than 10 available&quot; in your listing (if applicable) If the seller enables this preference, this field is returned as long as there are more than 10 of this item in inventory. If the quantity is equal to 10 or drops below 10, this field is not returned and the estimated quantity of the item is returned in the estimatedAvailableQuantity field. Display the exact quantity in your items If the seller enables this preference, the availabilityThresholdType and availabilityThreshold fields are not returned and the estimated quantity of the item is returned in the estimatedAvailableQuantity field. Note: Because the quantity of an item can change several times within a second, it is impossible to return the exact quantity. Code so that your app gracefully handles any future changes to these preferences. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:AvailabilityThresholdEnum'>eBay API documentation</a>
    string availabilityThresholdType?;
    # An array of available delivery options. Valid Values: SHIP_TO_HOME, SELLER_ARRANGED_LOCAL_PICKUP, IN_STORE_PICKUP, PICKUP_DROP_OFF, or DIGITAL_DELIVERY Code so that your app gracefully handles any future changes to this list.
    string[] deliveryOptions?;
    # An enumeration value representing the inventory status of this item. Note: Be sure to review the itemEndDate field to determine whether the item is available for purchase. Valid Values: IN_STOCK, LIMITED_STOCK, or OUT_OF_STOCK Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:AvailabilityStatusEnum'>eBay API documentation</a>
    string estimatedAvailabilityStatus?;
    # The estimated number of this item that are available for purchase. Because the quantity of an item can change several times within a second, it is impossible to return the exact quantity. So instead of returning quantity, the estimated availability of the item is returned.
    int estimatedAvailableQuantity?;
    # The estimated number of this item that have been sold.
    int estimatedSoldQuantity?;
};

# The details of an item that can be purchased.
public type Item record {
    # An array of containers with the URLs for the images that are in addition to the primary image. The primary image is returned in the image.imageUrl field.
    Image[] additionalImages?;
    # This indicates if the item is for adults only. For more information about adult-only items on eBay, see Adult items policy for sellers and Adult-Only items on eBay for buyers.
    boolean adultOnly?;
    # (Primary Item Aspect) The age group for which the product is recommended. For example, newborn, infant, toddler, kids, adult, etc. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string ageGroup?;
    # A type that identifies whether the item is qualified for the Authenticity Verification program.
    AuthenticityVerificationProgram authenticityVerification?;
    # A list of available coupons for the item.
    AvailableCoupon[] availableCoupons?;
    # This integer value indicates the total number of bids that have been placed against an auction item. This field is returned only for auction items.
    int bidCount?;
    # (Primary Item Aspect) The name brand of the item, such as Nike, Apple, etc. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string brand?;
    # A comma separated list of all the purchase options available for the item. The values returned are: FIXED_PRICE - Indicates the buyer can purchase the item for a set price using the Buy It Now button. AUCTION - Indicates the buyer can place a bid for the item. After the first bid is placed, this becomes a live auction item and is the only buying option for this item. BEST_OFFER - Indicates the buyer can send the seller a price they're willing to pay for the item. The seller can accept, reject, or send a counter offer. For more information on how this works, see Making a Best Offer. Code so that your app gracefully handles any future changes to this list.
    string[] buyingOptions?;
    # The ID of the leaf category for this item. A leaf category is the lowest level in that category and has no children.
    string categoryId?;
    # Text that shows the category hierarchy of the item. For example: Computers/Tablets &amp; Networking, Laptops &amp; Netbooks, PC Laptops &amp; Netbooks
    string categoryPath?;
    # (Primary Item Aspect) Text describing the color of the item. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string color?;
    # A short text description for the condition of the item, such as New or Used. For a list of condition names, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string condition?;
    # A full text description for the condition of the item. This field elaborates on the value specified in the condition field and provides full details for the condition of the item. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionDescription?;
    # The identifier of the condition of the item. For example, 1000 is the identifier for NEW. For a list of condition names and IDs, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionId?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount currentBidPrice?;
    # The full description of the item that was created by the seller. This can be plain text or rich content and can be very large.
    string description?;
    # This field indicates if the item can be purchased using the Buy Order API. If the value of this field is true, this indicates that the item can be purchased using the Order API. If the value of this field is false, this indicates that the item cannot be purchased using the Order API and must be purchased on the eBay site.
    boolean eligibleForInlineCheckout?;
    # This indicates if the item can be purchased using Guest Checkout in the Order API. You can use this flag to exclude items from your inventory that are not eligible for Guest Checkout, such as gift cards.
    boolean enabledForGuestCheckout?;
    # This indicates the European energy efficiency rating (EEK) of the item. This field is returned only if the seller specified the energy efficiency rating. The rating is a set of energy efficiency classes from A to G, where 'A' is the most energy efficient and 'G' is the least efficient. This rating helps buyers choose between various models. When the manufacturer's specifications for this item are available, the link to this information is returned in the productFicheWebUrl field.
    string energyEfficiencyClass?;
    # An EPID is the eBay product identifier of a product from the eBay product catalog. This indicates the product in which the item belongs.
    string epid?;
    # The estimated number of this item that are available for purchase. Because the quantity of an item can change several times within a second, it is impossible to return the exact quantity. So instead of returning quantity, the estimated availability of the item is returned.
    EstimatedAvailability[] estimatedAvailabilities?;
    # (Primary Item Aspect) The gender for the item. This is used for items that could vary by gender, such as clothing. For example: male, female, or unisex. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string gender?;
    # The unique Global Trade Item number of the item as defined by https://www.gtin.info. This can be a UPC (Universal Product Code), EAN (European Article Number), or an ISBN (International Standard Book Number) value.
    string gtin?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image image?;
    # The ePID (eBay Product ID of a product from the eBay product catalog) for the item, which has been programmatically determined by eBay using the item's title, aspects, and other data. If the seller provided an ePID for the item, the seller's value is returned in the epid field. Note: This field is returned only for authorized Partners.
    string inferredEpid?;
    # The URL of the View Item page of the item, which includes the affiliate tracking ID. This field is only returned if the eBay partner enables affiliate tracking for the item by including the X-EBAY-C-ENDUSERCTX request header in the method. Note: eBay Partner Network, in order to be commissioned for your sales, you must use this URL to forward your buyer to the ebay.com site.
    string itemAffiliateWebUrl?;
    # The date and time up to which the items can be purchased. This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: This field is not returned for Good 'Til Cancelled (GTC) listings.
    string itemEndDate?;
    # The unique RESTful identifier of the item.
    string itemId?;
    # The type that defines the fields for an address.
    Address itemLocation?;
    # The URL of the View Item page of the item. This enables you to include a &quot;Report Item on eBay&quot; link that takes the buyer to the View Item page on eBay. From there they can report any issues regarding this item to eBay.
    string itemWebUrl?;
    # The unique identifier of the eBay listing that contains the item. This is the traditional/legacy ID that is often seen in the URL of the listing View Item page.
    string legacyItemId?;
    # An array of containers that show the complete list of the aspect name/value pairs that describe the variation of the item.
    TypedNameValue[] localizedAspects?;
    # The number of items in a lot. In other words, a lot size is the number of items that are being sold together. A lot is a set of two or more items included in a single listing that must be purchased together in a single order line item. All the items in the lot are the same but there can be multiple items in a single lot, such as the package of batteries shown in the example below. Item Lot Definition Lot Size A package of 24 AA batteries A box of 10 packages 10 A P235/75-15 Goodyear tire 4 tires 4 Fashion Jewelry Rings Package of 100 assorted rings 100 Note: Lots are not supported in all categories.
    int lotSize?;
    # The type that defines the fields that describe a seller discount.
    MarketingPrice marketingPrice?;
    # (Primary Item Aspect) Text describing what the item is made of. For example, silk. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string material?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount minimumPriceToBid?;
    # The manufacturer's part number, which is a unique number that identifies a specific product. To identify the product, this is always used along with brand.
    string mpn?;
    # (Primary Item Aspect) Text describing the pattern used on the item. For example, paisley. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string pattern?;
    # The payment methods for the item, including the payment method types, brands, and instructions for the buyer.
    PaymentMethod[] paymentMethods?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount price?;
    # Indicates when in the buying flow the item's price can appear for minimum advertised price (MAP) items, which is the lowest price a retailer can advertise/show for this item. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PriceDisplayConditionEnum'>eBay API documentation</a>
    string priceDisplayCondition?;
    # The type that defines the fields for the details of each item in an item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. When an item group is created, one of the item variations, such as the red shirt size L, is chosen as the &quot;parent&quot;. All the other items in the group are the children, such as the blue shirt size L, red shirt size M, etc. Note: This container is returned only if the item_id in the request is an item group (parent ID of an item with variations).
    ItemGroupSummary primaryItemGroup?;
    # The type that defines the fields for the rating of a product review.
    ReviewRating primaryProductReviewRating?;
    # The type that defines the fields for the product information of the item.
    Product product?;
    # The URL of a page containing the manufacturer's specification of this item, which helps buyers make a purchasing decision. This information is available only for items that include the European energy efficiency rating (EEK) but is not available for all items with an EEK rating and is returned only if this information is available. The EEK rating of the item is returned in the energyEfficiencyClass field.
    string productFicheWebUrl?;
    # An array of the qualified programs available for the item, such as EBAY_PLUS and AUTHENTICITY_VERIFICATION. eBay Plus is a premium account option for buyers, which provides benefits such as fast free domestic shipping and free returns on selected items. Top-Rated eBay sellers must opt in to eBay Plus to be able to offer the program on qualifying listings. Sellers must commit to next-day delivery of those items. Note: eBay Plus is available only to buyers in Germany, Austria, and Australia marketplaces. The eBay Authenticity Verification program enables third-party authenticators to perform authentication verification inspections on items such as watches and sneakers.
    string[] qualifiedPrograms?;
    # The maximum number for a specific item that one buyer can purchase.
    int quantityLimitPerBuyer?;
    # This indicates if the reserve price of the item has been met. A reserve price is set by the seller and is the minimum amount the seller is willing to sell the item for. If the highest bid is not equal to or higher than the reserve price when the auction ends, the listing ends and the item is not sold. Note: This is returned only for auctions that have a reserve price.
    boolean reservePriceMet?;
    # The type that defines the fields for the seller's return policy.
    ItemReturnTerms returnTerms?;
    # The type that defines the fields for basic and detailed information about the seller of the item returned by the item resource.
    SellerDetail seller?;
    # An identifier generated/incremented when a seller revises the item. There are two types of item revisions: Seller changes, such as changing the title eBay system changes, such as changing the quantity when an item is purchased This ID is changed only when the seller makes a change to the item. This means you cannot use this value to determine if the quantity has changed.
    string sellerItemRevision?;
    # An array of shipping options containers that have the details about cost, carrier, etc. of one shipping option.
    ShippingOption[] shippingOptions?;
    # The type that defines the fields that include and exclude geographic regions affecting where the item can be shipped. The seller defines these regions when listing the item.
    ShipToLocations shipToLocations?;
    # This text string is derived from the item condition and the item aspects (such as size, color, capacity, model, brand, etc.).
    string shortDescription?;
    # (Primary Item Aspect) The size of the item. For example, '7' for a size 7 shoe. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string size?;
    # (Primary Item Aspect) The sizing system of the country. All the item aspects, including this aspect, are returned in the localizedAspects container. Valid Values: AU (Australia), BR (Brazil), CN (China), DE (Germany), EU (European Union), FR (France), IT (Italy), JP (Japan), MX (Mexico), US (USA), UK (United Kingdom) Code so that your app gracefully handles any future changes to this list.
    string sizeSystem?;
    # (Primary Item Aspect) Text describing a size group in which the item would be included, such as regular, petite, plus, big-and-tall or maternity. All the item aspects, including this aspect, are returned in the localizedAspects container.
    string sizeType?;
    # A subtitle is optional and allows the seller to provide more information about the product, possibly including keywords that may assist with search results.
    string subtitle?;
    # The container for the tax information for the item.
    Taxes[] taxes?;
    # The seller-created title of the item. Maximum Length: 80 characters
    string title?;
    # This indicates if the item a top-rated plus item. There are three benefits of a top-rated plus item; a minimum 30-day money-back return policy, shipping the items in 1 business day with tracking provided, and the added comfort of knowing this item is from experienced sellers with the highest buyer ratings. See the Top Rated Plus Items and Becoming a Top Rated Seller and qualifying for Top Rated Plus help topics for more information.
    boolean topRatedBuyingExperience?;
    # The URL to the image that shows the information on the tyre label.
    string tyreLabelImageUrl?;
    # This integer value indicates the number of different eBay users who have placed one or more bids on an auction item. This field is only applicable to auction items.
    int uniqueBidderCount?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount unitPrice?;
    # The designation, such as size, weight, volume, count, etc., that was used to specify the quantity of the item. This helps buyers compare prices. For example, the following tells the buyer that the item is 7.99 per 100 grams. &quot;unitPricingMeasure&quot;: &quot;100g&quot;, &quot;unitPrice&quot;: { &nbsp;&nbsp;&quot;value&quot;: &quot;7.99&quot;, &nbsp;&nbsp;&quot;currency&quot;: &quot;GBP&quot;
    string unitPricingMeasure?;
    # An array of warning messages. These types of errors do not prevent the method from executing but should be checked.
    Error[] warnings?;
};

# The type that defines the fields for the seller's return policy.
public type ItemReturnTerms record {
    # This indicates if the seller has enabled the Extended Holiday Returns feature on the item. Extended Holiday Returns are only applicable during the US holiday season, and gives buyers extra time to return an item. This 'extra time' will typically extend beyond what is set through the returnPeriod value.
    boolean extendedHolidayReturnsOffered?;
    # An enumeration value that indicates how a buyer is refunded when an item is returned. Valid Values: MONEY_BACK or MERCHANDISE_CREDIT Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:RefundMethodEnum'>eBay API documentation</a>
    string refundMethod?;
    # This string field indicates the restocking fee percentage that the seller has set on the item. Sellers have the option of setting no restocking fee for an item, or they can set the percentage to 10, 15, or 20 percent. So, if the cost of the item was $100, and the restocking percentage was 20 percent, the buyer would be charged $20 to return that item, so instead of receiving a $100 refund, they would receive $80 due to the restocking fee.
    string restockingFeePercentage?;
    # Text written by the seller describing what the buyer needs to do in order to return the item.
    string returnInstructions?;
    # An enumeration value that indicates the alternative methods for a full refund when an item is returned. This field is returned if the seller offers the buyer an item replacement or exchange instead of a monetary refund. Valid Values: REPLACEMENT - Indicates that the buyer has the option of receiving money back for the returned item, or they can choose to have the seller replace the item with an identical item. EXCHANGE - Indicates that the buyer has the option of receiving money back for the returned item, or they can exchange the item for another similar item. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:ReturnMethodEnum'>eBay API documentation</a>
    string returnMethod?;
    # The type that defines the fields for a period of time in the time-measurement units supplied.
    TimeDuration returnPeriod?;
    # Indicates whether the seller accepts returns for the item.
    boolean returnsAccepted?;
    # This enumeration value indicates whether the buyer or seller is responsible for return shipping costs when an item is returned. Valid Values: SELLER - Indicates the seller will pay for the shipping costs to return the item. BUYER - Indicates the buyer will pay for the shipping costs to return the item. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:ReturnShippingCostPayerEnum'>eBay API documentation</a>
    string returnShippingCostPayer?;
};

# The type that defines the fields for the image information.
public type SearchByImageRequest record {
    # The Base64 string of the image.
    string image?;
};

# The type that defines the fields for the product identifier type/value pairs of product associated with an item.
public type ProductIdentity record {
    # The type of product identifier, such as UPC and EAN.
    string identifierType?;
    # The product identifier value.
    string identifierValue?;
};

# Container for a list of items.
public type Items record {
    # An arraylist of all the items.
    CoreItem[] items?;
    # The total number of items retrieved.
    int total?;
    # An array of warning messages. These types of errors do not prevent the method from executing but should be checked.
    Error[] warnings?;
};

# An array of attribute name/value pairs used to define a specific product. For example: If you wanted to specify a specific car, one of the name/value pairs would be &quot;name&quot; : &quot;Year&quot;, &quot;value&quot; : &quot;2019&quot; For a list of the attributes required for cars and trucks and motorcycles see Check compatibility in the Buy Integration Guide.
public type CompatibilityPayload record {
    # An array of attribute name/value pairs used to define a specific product. For example: If you wanted to specify a specific car, one of the name/value pairs would be &quot;name&quot; : &quot;Year&quot;, &quot;value&quot; : &quot;2019&quot; For a list of the attributes required for cars and trucks and motorcycles see Check compatibility in the Buy Integration Guide.
    AttributeNameValue[] compatibilityProperties?;
};

# The type that defines the fields for the tax jurisdiction details.
public type TaxJurisdiction record {
    # This type is used to provide region details for a tax jurisdiction.
    Region region?;
    # The identifier of the tax jurisdiction.
    string taxJurisdictionId?;
};

# The container that defines the fields for the conditions refinements. This container is returned when fieldgroups is set to CONDITION_REFINEMENTS or FULL in the request.
public type ConditionDistribution record {
    # The text describing the condition of the item, such as New or Used. For a list of condition names, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string condition?;
    # The identifier of the condition. For example, 1000 is the identifier for NEW. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionId?;
    # The number of items having the condition.
    int matchCount?;
    # The HATEOAS reference of this condition.
    string refinementHref?;
};

# An array of name/value pairs that provide details regarding the error.
public type ErrorParameter record {
    # This is the name of input field that caused an issue with the call request.
    string name?;
    # This is the actual value that was passed in for the element specified in the name field.
    string value?;
};

# The type that defines the response fields for checkCompatibility.
public type CompatibilityResponse record {
    # An enumeration value that tells you if the item is compatible with the product. The values are: COMPATIBLE - Indicates the item is compatible with the product specified in the request. NOT_COMPATIBLE - Indicates the item is not compatible with the product specified in the request. Be sure to check all the value fields to ensure they are correct as errors in the value can also cause this response. UNDETERMINED - Indicates one or more attributes for the specified product are missing so compatibility cannot be determined. The response returns the attributes that are missing. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:CompatibilityStatus'>eBay API documentation</a>
    string compatibilityStatus?;
    # An array of warning messages. These types of errors do not prevent the method from executing but should be checked.
    Error[] warnings?;
};

# The type that defines the fields for the details of a specific item.
public type ItemSummary record {
    # An array of containers with the URLs for the images that are in addition to the primary image. The primary image is returned in the image.imageUrl field.
    Image[] additionalImages?;
    # This indicates if the item is for adults only. For more information about adult-only items on eBay, see Adult items policy for sellers and Adult-Only items on eBay for buyers.
    boolean adultOnly?;
    # This boolean attribute indicates if coupons are available for the item.
    boolean availableCoupons?;
    # This integer value indicates the total number of bids that have been placed for an auction item. This field is only returned for auction items.
    int bidCount?;
    # A comma separated list of all the purchase options available for the item. Values Returned: FIXED_PRICE - Indicates the buyer can purchase the item for a set price using the Buy It Now button. AUCTION - Indicates the buyer can place a bid for the item. After the first bid is placed, this becomes a live auction item and is the only buying option for this item. BEST_OFFER - Items where the buyer can send the seller a price they're willing to pay for the item. The seller can accept, reject, or send a counter offer. For details about Best Offer, see Best Offer. Code so that your app gracefully handles any future changes to this list.
    string[] buyingOptions?;
    # This container returns the primary category ID of the item (as well as the secondary category if the item was listed in two categories).
    Category[] categories?;
    # This indicates how well the item matches the compatibility_filter product attributes. Valid Values: EXACT or POSSIBLE Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:CompatibilityMatchEnum'>eBay API documentation</a>
    string compatibilityMatch?;
    # This container returns only the product attributes that are compatible with the item. These attributes were specified in the compatibility_filter in the request. This means that if you passed in 5 attributes and only 4 are compatible, only those 4 are returned. If none of the attributes are compatible, this container is not returned.
    CompatibilityProperty[] compatibilityProperties?;
    # The text describing the condition of the item, such as New or Used. For a list of condition names, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string condition?;
    # The identifier of the condition of the item. For example, 1000 is the identifier for NEW. For a list of condition names and IDs, see Item Condition IDs and Names. Code so that your app gracefully handles any future changes to this list. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature.
    string conditionId?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount currentBidPrice?;
    # The type that defines the fields for the distance between the item location and the buyer's location.
    TargetLocation distanceFromPickupLocation?;
    # This indicates the European energy efficiency rating (EEK) of the item. Energy efficiency ratings apply to products listed by commercial vendors in electronics categories only. Currently, this field is only applicable for the Germany site, and is only returned if the seller specified the energy efficiency rating through item specifics at listing time. Rating values include A+++, A++, A+, A, B, C, D, E, F, and G.
    string energyEfficiencyClass?;
    # An ePID is the eBay product identifier of a product from the eBay product catalog. This indicates the product in which the item belongs.
    string epid?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image image?;
    # The URL to the View Item page of the item, which includes the affiliate tracking ID. This field is only returned if the seller enables affiliate tracking for the item by including the X-EBAY-C-ENDUSERCTX request header in the method. Note: eBay Partner Network, in order to receive a commission for your sales, you must use this URL to forward your buyer to the ebay.com site.
    string itemAffiliateWebUrl?;
    # The date and time up to which the item can be purchased. This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: This field is not returned for Good 'Til Cancelled (GTC) listings.
    string itemEndDate?;
    # The HATEOAS reference of the parent page of the item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. Note: This field is returned only for item groups.
    string itemGroupHref?;
    # The indicates the item group type. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. Currently only the SELLER_DEFINED_VARIATIONS is supported and indicates this is an item group created by the seller. Note: This field is returned only for item groups. Code so that your app gracefully handles any future changes to this list.
    string itemGroupType?;
    # The URI for the Browse API getItem method, which can be used to retrieve more details about items in the search results.
    string itemHref?;
    # The unique RESTful identifier of the item.
    string itemId?;
    # The type that defines the fields for the location of an item, such as information typically used for an address, including postal code, county, state/province, street address, city, and country (2-digit ISO code).
    ItemLocationImpl itemLocation?;
    # The URL to the View Item page of the item. This enables you to include a &quot;Report Item on eBay&quot; hyperlink that takes the buyer to the View Item page on eBay. From there they can report any issues regarding this item to eBay.
    string itemWebUrl?;
    # The unique identifier of the eBay listing that contains the item. This is the traditional/legacy ID that is often seen in the URL of the listing View Item page.
    string legacyItemId?;
    # The type that defines the fields that describe a seller discount.
    MarketingPrice marketingPrice?;
    # This container returns the local pickup options available to the buyer. This container is only returned if the user is searching for local pickup items and set the local pickup filters in the method request.
    PickupOptionSummary[] pickupOptions?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount price?;
    # Indicates when in the buying flow the item's price can appear for minimum advertised price (MAP) items, which is the lowest price a retailer can advertise/show for this item. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PriceDisplayConditionEnum'>eBay API documentation</a>
    string priceDisplayCondition?;
    # An array of the qualified programs available for the item, such as EBAY_PLUS and AUTHENTICITY_VERIFICATION. eBay Plus is a premium account option for buyers, which provides benefits such as fast free domestic shipping and free returns on selected items. Top-Rated eBay sellers must opt in to eBay Plus to be able to offer the program on qualifying listings. Sellers must commit to next-day delivery of those items. Note: eBay Plus is available only to buyers in Germany, Austria, and Australia marketplaces. The eBay Authenticity Verification program enables third-party authenticators to perform authentication verification inspections on items such as watches and sneakers.
    string[] qualifiedPrograms?;
    # The type that defines the fields for basic information about the seller of the item returned by the item_summary resource.
    Seller seller?;
    # This container returns the shipping options available to ship the item.
    ShippingOptionSummary[] shippingOptions?;
    # This text string is derived from the item condition and the item aspects (such as size, color, capacity, model, brand, etc.). Sometimes the title doesn't give enough information but the description is too big. Surfacing the shortDescription can often provide buyers with the additional information that could help them make a buying decision. For example: &quot; title&quot;: &quot;Petrel U42W FPV Drone RC Quadcopter w/HD Camera Live Video One Key Off / Landing&quot;, &quot;shortDescription&quot;: &quot;1 U42W Quadcopter. Syma X5SW-V3 Wifi FPV RC Drone Quadcopter 2.4Ghz 6-Axis Gyro with Headless Mode. Syma X20 Pocket Drone 2.4Ghz Mini RC Quadcopter Headless Mode Altitude Hold. One Key Take Off / Landing function: allow beginner to easy to fly the drone without any skill.&quot;, Restriction: This field is returned by the search method only when fieldgroups = EXTENDED.
    string shortDescription?;
    # An array of thumbnail images for the item.
    Image[] thumbnailImages?;
    # The seller-created title of the item. Maximum Length: 80 characters
    string title?;
    # This indicates if the item is a top-rated plus item. There are three benefits of a top-rated plus item: a minimum 30-day money-back return policy, shipping the item in 1 business day with tracking provided, and the added comfort of knowing that this item is from an experienced seller with the highest buyer ratings. See the Top Rated Plus Items and Becoming a Top Rated Seller and qualifying for Top Rated Plus help topics for more information.
    boolean topRatedBuyingExperience?;
    # The URL to the image that shows the information on the tyre label.
    string tyreLabelImageUrl?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount unitPrice?;
    # The designation, such as size, weight, volume, count, etc., that was used to specify the quantity of the item. This helps buyers compare prices. For example, the following tells the buyer that the item is 7.99 per 100 grams. &quot;unitPricingMeasure&quot;: &quot;100g&quot;, &quot;unitPrice&quot;: { &nbsp;&nbsp;&quot;value&quot;: &quot;7.99&quot;, &nbsp;&nbsp;&quot;currency&quot;: &quot;GBP&quot;
    string unitPricingMeasure?;
};

# The type that defines the fields for the details of a shipping provider.
public type ShippingOption record {
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount additionalShippingCostPerUnit?;
    # The deadline date that the item must be purchased by in order to be received by the buyer within the delivery window ( maxEstimatedDeliveryDate and minEstimatedDeliveryDate fields). This field is returned only for items that are eligible for 'Same Day Handling'. For these items, the value of this field is what is displayed in the Delivery line on the View Item page. This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer.
    string cutOffDateUsedForEstimate?;
    # If the item is being shipped by eBay's Global Shipping Program, this field returns GLOBAL_SHIPPING. Otherwise this field is null. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:FulfilledThroughEnum'>eBay API documentation</a>
    string fulfilledThrough?;
    # Indicates if the seller has committed to shipping the item with eBay Guaranteed Delivery. With eBay Guaranteed Delivery, the seller is committed to getting the line item to the buyer within 4 business days or less. See the Buying items with eBay Guaranteed Delivery help topic for more details about eBay Guaranteed Delivery.
    boolean guaranteedDelivery?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount importCharges?;
    # The end date of the delivery window (latest projected delivery date). This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: For the best accuracy, always include the location of where the item is be shipped in the contextualLocation values of the X-EBAY-C-ENDUSERCTX request header.
    string maxEstimatedDeliveryDate?;
    # The start date of the delivery window (earliest projected delivery date). This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: For the best accuracy, always include the location of where the item is be shipped in the contextualLocation values of the X-EBAY-C-ENDUSERCTX request header.
    string minEstimatedDeliveryDate?;
    # The number of items used when calculating the estimation information.
    int quantityUsedForEstimate?;
    # The name of the shipping provider, such as FedEx, or USPS.
    string shippingCarrierCode?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount shippingCost?;
    # Indicates the class of the shipping cost. Valid Values: FIXED or CALCULATED Code so that your app gracefully handles any future changes to this list.
    string shippingCostType?;
    # The type of shipping service. For example, USPS First Class.
    string shippingServiceCode?;
    # The type that defines the fields for the country and postal code of where an item is to be shipped.
    ShipToLocation shipToLocationUsedForEstimate?;
    # Any trademark symbol, such as &trade; or &reg;, that needs to be shown in superscript next to the shipping service name.
    string trademarkSymbol?;
    # The type of a shipping option, such as EXPEDITED, ONE_DAY, STANDARD, ECONOMY, PICKUP, etc.
    string 'type?;
};

# The type that defines the fields for the country and postal code of where an item is to be shipped.
public type ShipToLocation record {
    # The two-letter ISO 3166 standard of the country for where the item is to be shipped. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CountryCodeEnum'>eBay API documentation</a>
    string country?;
    # The zip code (postal code) for where the item is to be shipped.
    string postalCode?;
};

# The type that defines the fields for the name/value pairs for item aspects.
public type TypedNameValue record {
    # The text representing the name of the aspect for the name/value pair, such as Color.
    string name?;
    # This indicates if the value being returned is a string or an array of values. Valid Values: STRING - Indicates the value returned is a string. STRING_ARRAY - Indicates the value returned is an array of strings. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:ValueTypeEnum'>eBay API documentation</a>
    string 'type?;
    # The value of the aspect for the name/value pair, such as Red.
    string value?;
};

# The type that defines the tax fields.
public type Taxes record {
    # This field is only returned if true, and indicates that eBay will collect tax (sales tax, Goods and Services tax, or VAT) for at least one line item in the order, and remit the tax to the taxing authority of the buyer's residence.
    boolean ebayCollectAndRemitTax?;
    # This indicates if tax was applied for the cost of the item.
    boolean includedInPrice?;
    # This indicates if tax is applied for the shipping cost.
    boolean shippingAndHandlingTaxed?;
    # The type that defines the fields for the tax jurisdiction details.
    TaxJurisdiction taxJurisdiction?;
    # The percentage of tax.
    string taxPercentage?;
    # This field indicates the type of tax that may be collected for the item. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:TaxType'>eBay API documentation</a>
    string taxType?;
};

# The type that defines the fields for the monetary value and currency of the price of the item.
public type Price record {
    # The three-letter ISO 4217 code representing the currency of the amount in the convertedFromValue field. This value is the pre-conversion currency. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string convertedFromCurrency?;
    # The monetary amount before any conversion is performed, in the currency specified by the convertedFromCurrency field. This value is the pre-conversion amount. The value field contains the converted amount of this value, in the currency specified by the currency field.
    string convertedFromValue?;
    # The three-letter ISO 4217 code representing the currency of the amount in the value field. If currency conversion/localization was performed, this is the post-conversion currency of the amount in the value field. Default: The currency of the user's country. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The amount of the currency specified in the currency field. The value of currency defaults to the standard currency used by the country of the eBay site offering the item. If currency conversion/localization was performed, this is the post-conversion amount. Default: The currency of the user's country.
    string value?;
};

# The type that defines the fields for the distance between the item location and the buyer's location.
public type TargetLocation record {
    # This value shows the unit of measurement used to measure the distance between the location of the item and the buyer's location. This value is typically mi or km.
    string unitOfMeasure?;
    # This value indicates the distance (measured in the measurement unit in the unitOfMeasure field) between the item location and the buyer's location.
    string value?;
};

# The type the defines attribute name/value pair fields that specify a product. The type of data depends on the context. For example, if you were using this to specify a specific vehicle, the attribute names would be Make, Model, Year, etc.
public type AttributeNameValue record {
    # The name of the product attribute, such as Make, Model, Year, etc.
    string name?;
    # The value for the name attribute, such as BMW, R1200GS, 2011, etc.
    string value?;
};

# The type that defines the fields for the item ids that all use a common description. Often the item variations within an item group all have the same description. Instead of repeating this description in the item details of each item, a description that is shared by at least one other item is returned in this container. If the description is unique, it is returned in the items.description field.
public type CommonDescriptions record {
    # The item description that is used by more than one of the item variations.
    string description?;
    # A list of item ids that have this description.
    string[] itemIds?;
};

public type PaymentMethod record {
    # The payment method type, such as credit card or cash. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PaymentMethodTypeEnum'>eBay API documentation</a>
    string paymentMethodType?;
    # The payment method brands, including the payment method brand type and logo image.
    PaymentMethodBrand[] paymentMethodBrands?;
    # The payment instructions for the buyer, such as cash in person or contact seller.
    string[] paymentInstructions?;
    # The seller instructions to the buyer, such as accepts credit cards or see description.
    string[] sellerInstructions?;
};

# This type is used to provide region details for a tax jurisdiction.
public type Region record {
    # A localized text string that indicates the name of the region. Taxes are generally charged at the state/province level or at the country level in the case of VAT tax.
    string regionName?;
    # An enumeration value that indicates the type of region for the tax jurisdiction. Valid Values: STATE_OR_PROVINCE - Indicates the region is a state or province within a country, such as California or New York in the US, or Ontario or Alberta in Canada. COUNTRY - Indicates the region is a single country. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:RegionTypeEnum'>eBay API documentation</a>
    string regionType?;
};

# This type is used provide details about included and excluded shipping regions.
public type ShipToRegion record {
    # The unique identifier of the shipping region. The value returned here is dependent on the corresponding regionType value. The regionId value for a region does not vary based on the eBay marketplace. However, the corresponding regionName value for a region is a localized, text-based description of the shipping region. If the regionType value is WORLDWIDE, the regionId value will also be WORLDWIDE. If the regionType value is WORLD_REGION, the regionId value will be one of the following: AFRICA, AMERICAS, ASIA, AUSTRALIA, CENTRAL_AMERICA_AND_CARIBBEAN, EUROPE, EUROPEAN_UNION, GREATER_CHINA, MIDDLE_EAST, NORTH_AMERICA, OCEANIA, SOUTH_AMERICA, SOUTHEAST_ASIA or CHANNEL_ISLANDS. If the regionType value is COUNTRY, the regionId value will be the two-letter code for the country, as defined in the ISO 3166 standard. If the regionType value is STATE_OR_PROVINCE, the regionId value will either be the two-letter code for US states and DC (as defined on this Social Security Administration page), or the two-letter code for Canadian provinces (as defined by this Canada Post page). If the regionType value is COUNTRY_REGION, the regionId value may be one of following: _AH (if a seller is not willing to ship to Alaska/Hawaii), _PR (if the seller is not willing to ship to US Protectorates), _AP (if seller is not willing to ship to a US Army or Fleet Post Office), and PO_BOX (if the seller is not willing to ship to a Post Office Box).
    string regionId?;
    # A localized text string that indicates the name of the shipping region. The value returned here is dependent on the corresponding regionType value. If the regionType value is WORLDWIDE, the regionName value will show Worldwide. If the regionType value is WORLD_REGION, the regionName value will be a localized text string for one of the following large geographical regions: Africa, Americas, Asia, Australia, Central America and Caribbean, Europe, European Union, Greater China, Middle East, North America, Oceania, South America, Southeast Asia, or Channel Islands. If the regionType value is COUNTRY, the regionName value will be a localized text string for any country in the world. If the regionType value is STATE_OR_PROVINCE, the regionName value will be a localized text string for any US state or Canadian province. If the regionType value is COUNTRY_REGION, the regionName value may be a localized version of one of the following: Alaska/Hawaii, US Protectorates, APO/FPO (Army or Fleet Post Office), or PO BOX.
    string regionName?;
    # An enumeration value that indicates the level or type of shipping region. Valid Values: COUNTRY_REGION - Indicates the region is a domestic region or special location within a country. STATE_OR_PROVINCE - Indicates the region is a state or province within a country, such as California or New York in the US, or Ontario or Alberta in Canada. COUNTRY - Indicates the region is a single country. WORLD_REGION - Indicates the region is a world region, such as Africa, the Middle East, or Southeast Asia. WORLDWIDE - Indicates the region is the entire world. This value is only applicable for included shiping regions, and not excluded shipping regions. For more detail on the actual regionName/regionId values that will be returned based on the regionType value, see the regionId and/or regionName field descriptions. Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:RegionTypeEnum'>eBay API documentation</a>
    string regionType?;
};

public type AutoCorrections record {
    # The automatically spell-corrected keyword from the request.
    string q?;
};

# This type is used by the categories container in the response of the search method, and contains the primary item category ID of the item, as well as the secondary item category if the item was listed in two categories.
public type Category record {
    # The unique identifier of the primary item category of the item, as well as the secondary item category if item was listed in two categories.
    string categoryId?;
};

# This type defines the fields for the various refinements of an item. You can use the information in this container to create histograms, which help shoppers choose exactly what they want.
public type Refinement record {
    # An array of containers for the all the aspect refinements.
    AspectDistribution[] aspectDistributions?;
    # An array of containers for the all the buying option refinements.
    BuyingOptionDistribution[] buyingOptionDistributions?;
    # An array of containers for the all the category refinements.
    CategoryDistribution[] categoryDistributions?;
    # An array of containers for the all the condition refinements.
    ConditionDistribution[] conditionDistributions?;
    # The identifier of the category that most of the items are part of.
    string dominantCategoryId?;
};

# The type that defines the fields for the individual items in a cart.
public type CartItem record {
    # The identifier for the item being added to the cart. This is generated when the item is added to the cart.
    string cartItemId?;
    Amount cartItemSubtotal?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image image?;
    # The RESTful identifier of the item. This identifier is generated when the item was listed. RESTful Item ID Format: v1|#|# For example: v1|2**********2|0 v1|1**********2|4**********2
    string itemId?;
    # The URL of the eBay view item page for the item.
    string itemWebUrl?;
    # The type that defines the fields for the monetary value and currency of the price of the item.
    Price price?;
    # The number of this item the buyer wants to purchase.
    int quantity?;
    # The title of the item. This can be written by the seller or come from the eBay product catalog.
    string title?;
};

# The type that defines the fields for the shipping information.
public type ShippingOptionSummary record {
    # Indicates if the seller has committed to shipping the item with eBay Guaranteed Delivery. With eBay Guaranteed Delivery, the seller is committed to getting the line item to the buyer within 4 business days or less. See the Buying items with eBay Guaranteed Delivery help topic for more details about eBay Guaranteed Delivery.
    boolean guaranteedDelivery?;
    # The end date of the delivery window (latest projected delivery date). This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: For the best accuracy, always include the contextualLocation values in the X-EBAY-C-ENDUSERCTX request header.
    string maxEstimatedDeliveryDate?;
    # The start date of the delivery window (earliest projected delivery date). This value is returned in UTC format (yyyy-MM-ddThh:mm:ss.sssZ), which you can convert into the local time of the buyer. Note: For the best accuracy, always include the contextualLocation values in the X-EBAY-C-ENDUSERCTX request header.
    string minEstimatedDeliveryDate?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount shippingCost?;
    # Indicates the type of shipping used to ship the item. Possible values are FIXED (flat-rate shipping) and CALCULATED (shipping cost calculated based on item and buyer location).
    string shippingCostType?;
};

# The type the defines the fields for the VAT (value add tax) information.
public type VatDetail record {
    # The two-letter ISO 3166 standard of the country issuing the seller's VAT (value added tax) ID. VAT is a tax added by some European countries. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CountryCodeEnum'>eBay API documentation</a>
    string issuingCountry?;
    # The seller's VAT (value added tax) ID. VAT is a tax added by some European countries.
    string vatId?;
};

public type PaymentMethodBrand record {
    # The payment method brand, such as Visa or PayPal. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PaymentMethodBrandEnum'>eBay API documentation</a>
    string paymentMethodBrandType?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image logoImage?;
};

# The type that defines the fields that describe a seller discount.
public type MarketingPrice record {
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount discountAmount?;
    # This field expresses the percentage of the seller discount based on the value in the originalPrice container.
    string discountPercentage?;
    # This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
    ConvertedAmount originalPrice?;
    # Indicates the pricing treatment (discount) that was applied to the price of the item. Note: The pricing treatment affects the way and where the discounted price can be displayed. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:PriceTreatmentEnum'>eBay API documentation</a>
    string priceTreatment?;
};

# The type that defines the fields for the rating of a product review.
public type ReviewRating record {
    # The average rating given to a product based on customer reviews.
    string averageRating?;
    # An array of containers for the product rating histograms that shows the review counts and the product rating.
    RatingHistogram[] ratingHistograms?;
    # The total number of reviews for the item.
    int reviewCount?;
};

# The type that defines the fields for the location of an item, such as information typically used for an address, including postal code, county, state/province, street address, city, and country (2-digit ISO code).
public type ItemLocationImpl record {
    # The first line of the street address.
    string addressLine1?;
    # The second line of the street address. This field may contain such values as an apartment or suite number.
    string addressLine2?;
    # The city in which the item is located. Restriction: This field is populated in the search method response only when fieldgroups = EXTENDED.
    string city?;
    # The two-letter ISO 3166 standard code that indicates the country in which the item is located. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CountryCodeEnum'>eBay API documentation</a>
    string country?;
    # The county in which the item is located.
    string county?;
    # The postal code (or zip code in US) where the item is located. Sellers set a postal code (or zip code in US) for items when they are listed. The postal code is used for calculating proximity searches. It is anonymized when returned in itemLocation.postalCode via the API.
    string postalCode?;
    # The state or province in which the item is located.
    string stateOrProvince?;
};

# The type that defines the fields for the local pickup options that are available for the item. It is used by the pickupOptions container.
public type PickupOptionSummary record {
    # This container returns the local pickup options available to the buyer. Possible values are ARRANGED_LOCATION and STORE.
    string pickupLocationType?;
};

# The type that defines the fields and containers for the member's eBay cart information.
public type RemoteShopcartResponse record {
    # An array of the items in the member's eBay cart.
    CartItem[] cartItems?;
    Amount cartSubtotal?;
    # The URL of the member's eBay cart.
    string cartWebUrl?;
    # An array of items in the cart that are unavailable. This can be for a variety of reasons such as, when the listing has ended or the item is out of stock. Because a cart never expires, these items will remain in the cart until they are removed.
    CartItem[] unavailableCartItems?;
    # An array of warning messages. These type of errors do not prevent the call from executing but should be checked.
    Error[] warnings?;
};

# The type that defines the fields for the removeItem request.
public type RemoveCartItemInput record {
    # The identifier of the item in the cart to be removed. This ID is generated when the item was added to the cart.
    string cartItemId?;
};

# Type that defines the fields for the seller's address.
public type LegalAddress record {
    # The first line of the street address.
    string addressLine1?;
    # The second line of the street address. This field is not always used, but can be used for 'Suite Number' or 'Apt Number'.
    string addressLine2?;
    # The city of the address.
    string city?;
    # The two-letter ISO 3166 standard of the country of the address. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CountryCodeEnum'>eBay API documentation</a>
    string country?;
    # The name of the country of the address.
    string countryName?;
    # The name of the county of the address.
    string county?;
    # The postal code of the address.
    string postalCode?;
    # The state or province of the address.
    string stateOrProvince?;
};

# The type that defines the fields for a period of time in the time-measurement units supplied.
public type TimeDuration record {
    # An enumeration value that indicates the units (such as hours) of the time span. The enumeration value in this field defines the period of time being used to measure the duration. Valid Values: YEAR, MONTH, DAY, HOUR, CALENDAR_DAY, BUSINESS_DAY, MINUTE, SECOND, or MILLISECOND Code so that your app gracefully handles any future changes to this list. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:TimeDurationUnitEnum'>eBay API documentation</a>
    string unit?;
    # Retrieves the duration of the time span (no units).The value in this field indicates the number of years, months, days, hours, or minutes in the defined period.
    int value?;
};

public type AvailableCoupon record {
    # The limitations or restrictions of the coupon. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:CouponConstraint'>eBay API documentation</a>
    string constraint?;
    Amount discountAmount?;
    # The type of discount that the coupon applies. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:CouponDiscountType'>eBay API documentation</a>
    string discountType?;
    # A description of the coupon. Note: The value returned in the termsWebUrl field should appear for all experiences when displaying coupons. The value in the availableCoupons.message field must also be included, if returned in the API response.
    string message?;
    # The coupon code.
    string redemptionCode?;
    # The URL to the coupon terms of use. Note: The value returned in the termsWebUrl field should appear for all experiences when displaying coupons. The value in the availableCoupons.message field must also be included, if returned in the API response.
    string termsWebUrl?;
};

# The container that defines the fields for the category refinements. This container is returned when fieldgroups is set to CATEGORY_REFINEMENTS or FULL in the request.
public type CategoryDistribution record {
    # The identifier of the category.
    string categoryId?;
    # The name of the category, such as Baby &amp; Toddler Clothing.
    string categoryName?;
    # The number of items in this category.
    int matchCount?;
    # The HATEOAS reference of this category.
    string refinementHref?;
};

# The type that defines the fields for a paginated result set. The response consists of 0 or more sequenced pages where each page has 0 or more items.
public type SearchPagedCollection record {
    AutoCorrections autoCorrections?;
    # The URI of the current page of results. The following example of the search method returns items 1 thru 5 from the list of items found. https://api.ebay.com/buy/v1/item_summary/search?q=shirt&amp;limit=5&amp;offset=0.
    string href?;
    # An array of the items on this page. The items are sorted according to the sorting method specified in the request.
    ItemSummary[] itemSummaries?;
    # The value of the limit parameter submitted in the request, which is the maximum number of items to return on a page, from the result set. A result set is the complete set of items returned by the method.
    int 'limit?;
    # The URI for the next page of results. This value is returned if there is an additional page of results to return from the result set. The following example of the search method returns items 5 thru 10 from the list of items found. https://api.ebay.com/buy/v1/item_summary/search?query=t-shirts&amp;limit=5&amp;offset=10
    string next?;
    # This value indicates the offset used for current page of items being returned. Assume the initial request used an offset of 0 and a limit of 3. Then in the first page of results, this value would be 0, and items 1-3 are returned. For the second page, this value is 3 and so on.
    int offset?;
    # The URI for the previous page of results. This is returned if there is a previous page of results from the result set. The following example of the search method returns items 1 thru 5 from the list of items found, which would be the first set of items returned. https://api.ebay.com/buy/v1/item_summary/search?query=t-shirts&amp;limit=5&amp;offset=0
    string prev?;
    # This type defines the fields for the various refinements of an item. You can use the information in this container to create histograms, which help shoppers choose exactly what they want.
    Refinement refinement?;
    # The total number of items that match the input criteria.
    int total?;
    # The container with all the warnings for the request.
    Error[] warnings?;
};

# The container that defines the fields for the buying options refinements. This container is returned when fieldgroups is set to BUYING_OPTION_REFINEMENTS or FULL in the request.
public type BuyingOptionDistribution record {
    # The container that returns the buying option type. This will be AUCTION or FIXED_PRICE or both. For details, see buyingOptions.
    string buyingOption?;
    # The number of items having this buying option.
    int matchCount?;
    # The HATEOAS reference for this buying option.
    string refinementHref?;
};

public type Amount record {
    # The list of valid currencies. Each ISO 4217 currency code includes the currency name followed by the numeric value. For example, the Canadian Dollar code (CAD) would take the following form: Canadian Dollar, 124. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The value of the discounted amount.
    string value?;
};

# The type that defines the fields that can be returned in an error.
public type Error record {
    # This string value indicates the error category. There are three categories of errors: request errors, application errors, and system errors.
    string category?;
    # The name of the primary system where the error occurred. This is relevant for application errors.
    string domain?;
    # A unique code that identifies the particular error or warning that occurred. Your application can use error codes as identifiers in your customized error-handling algorithms.
    int errorId?;
    # An array of reference IDs that identify the specific request elements most closely associated to the error or warning, if any.
    string[] inputRefIds?;
    # A detailed description of the condition that caused the error or warning, and information on what to do to correct the problem.
    string longMessage?;
    # A description of the condition that caused the error or warning.
    string message?;
    # An array of reference IDs that identify the specific response elements most closely associated to the error or warning, if any.
    string[] outputRefIds?;
    # An array of warning and error messages that return one or more variables contextual information about the error or warning. This is often the field or value that triggered the error or warning.
    ErrorParameter[] parameters?;
    # The name of the subdomain in which the error or warning occurred.
    string subdomain?;
};

# A type that identifies whether the item is qualified for the Authenticity Verification program.
public type AuthenticityVerificationProgram record {
    # An indication that the item is qualified for the Authenticity Verification program.
    string description?;
    # The URL to the Authenticity Verification program terms of use.
    string termsWebUrl?;
};

# The type that define the fields for the aspect information. Aspects are the variations of an item, such as color, size, etc.
public type AspectDistribution record {
    # An array of containers for the various values of the aspect and the match count and a HATEOAS reference ( refinementHref) for this aspect.
    AspectValueDistribution[] aspectValueDistributions?;
    # The name of an aspect, such as Brand, Color, etc.
    string localizedAspectName?;
};

# The type that defines the fields for the item details.
public type ItemGroup record {
    # An array of containers for a description and the item IDs of all the items that have this exact description. Often the item variations within an item group all have the same description. Instead of repeating this description in the item details of each item, a description that is shared by at least one other item is returned in this container. If the description is unique, it is returned in the items.description field.
    CommonDescriptions[] commonDescriptions?;
    # An array of containers for all the item variation details, excluding the description.
    Item[] items?;
    # An array of warning messages. These types of errors do not prevent the method from executing but should be checked.
    Error[] warnings?;
};

# This type defines the monetary value of an amount. It can provide the amount in both the currency used on the eBay site where an item is being offered and the conversion of that value into another currency, if applicable.
public type ConvertedAmount record {
    # The three-letter ISO 4217 code representing the currency of the amount in the convertedFromValue field. This value is required or returned only if currency conversion/localization is required, and represents the pre-conversion currency. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string convertedFromCurrency?;
    # The monetary amount before any conversion is performed, in the currency specified by the convertedFromCurrency field. This value is required or returned only if currency conversion/localization is required. The value field contains the converted amount of this value, in the currency specified by the currency field.
    string convertedFromValue?;
    # The three-letter ISO 4217 code representing the currency of the amount in the value field. If currency conversion/localization is required, this is the post-conversion currency of the amount in the value field. Default: The currency of the authenticated user's country. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/ba:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The monetary amount, in the currency specified by the currency field. If currency conversion/localization is required, this value is the converted amount, and the convertedFromValue field contains the amount in the original currency.
    string value?;
};

# The type that defines the fields for the details of each item in an item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. When an item group is created, one of the item variations, such as the red shirt size L, is chosen as the &quot;parent&quot;. All the other items in the group are the children, such as the blue shirt size L, red shirt size M, etc. Note: This container is returned only if the item_id in the request is an item group (parent ID of an item with variations).
public type ItemGroupSummary record {
    # An array of containers with the URLs for images that are in addition to the primary image of the item group. The primary image is returned in the itemGroupImage field.
    Image[] itemGroupAdditionalImages?;
    # The HATEOAS reference of the parent page of the item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc.
    string itemGroupHref?;
    # The unique identifier for the item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc.
    string itemGroupId?;
    # Type the defines the details of an image, such as size and image URL. Currently, only imageUrl is populated. The height and width were added for future use.
    Image itemGroupImage?;
    # The title of the item that appears on the item group page. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc.
    string itemGroupTitle?;
    # An enumeration value that indicates the type of the item group. An item group is an item that has various aspect differences, such as color, size, storage capacity, etc. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/buy/browse/types/gct:ItemGroupTypeEnum'>eBay API documentation</a>
    string itemGroupType?;
};

# This container returns the product attribute name/value pairs that are compatible with the keyword. These attributes are submitted in the compatibility_filter request field.
public type CompatibilityProperty record {
    # The name of the product attribute that as been translated to the language of the site.
    string localizedName?;
    # The name of the product attribute, such as Make, Model, Year, etc.
    string name?;
    # The value for the name attribute, such as BMW, R1200GS, 2011, etc.
    string value?;
};

# The type that defines the fields for basic information about the seller of the item returned by the item_summary resource.
public type Seller record {
    # The percentage of the total positive feedback.
    string feedbackPercentage?;
    # The feedback score of the seller. This value is based on the ratings from eBay members that bought items from this seller.
    int feedbackScore?;
    # Indicates if the seller is a business or an individual. This is determined when the seller registers with eBay. If they register for a business account, this value will be BUSINESS. If they register for a private account, this value will be INDIVIDUAL. This designation is required by the tax laws in some countries. This field is returned only on the following sites. EBAY_AT, EBAY_BE, EBAY_CH, EBAY_DE, EBAY_ES, EBAY_FR, EBAY_GB, EBAY_IE, EBAY_IT, EBAY_PL Valid Values: BUSINESS or INDIVIDUAL Code so that your app gracefully handles any future changes to this list.
    string sellerAccountType?;
    # The user name created by the seller for use on eBay.
    string username?;
};

# The type that defines the array of product identifiers associated with the item. This container is returned if the seller has associated the eBay Product Identifier (ePID) with the item and in the request fieldgroups is set to PRODUCT.
public type AdditionalProductIdentity record {
    # An array of the product identifier/value pairs for the product associated with the item. This is returned if the seller has associated the eBay Product Identifier (ePID) with the item and the request has fieldgroups set to PRODUCT. The following table shows what is returned, based on the item information provided by the seller, when the fieldgroups set to PRODUCT. ePID Provided Product&nbsp;ID(s) Provided Response No No The AdditionalProductIdentity container is not returned. No Yes The AdditionalProductIdentity container is not returned but the product identifiers specified by the seller are returned in the localizedAspects container. Yes No The AdditionalProductIdentity container is returned listing the product identifiers of the product. Yes Yes The AdditionalProductIdentity container is returned listing all the product identifiers of the product and the product identifiers specified by the seller are returned in the localizedAspects container.
    ProductIdentity[] productIdentity?;
};
