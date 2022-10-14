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

# This complex type contains the fields needed to create an offer to a buyer that is initiated by the seller.
public type CreateOffersRequest record {
    # If set to true, the buyer is allowed to make a counter-offer to the seller's offer. Note: Currently, you must set this field to false; counter-offers are not supported in this release. Default: false
    boolean allowCounterOffer?;
    # A seller-defined message related to the offer being made. This message is sent to the list of &quot;interested&quot; buyers. To increase the conversion rate of the offers a seller makes to buyers, eBay recommends you always add a customized message to your offers. Maximum length: 2,000 characters
    string message?;
    # A complex type that specifies a period of time using a specified time-measurement unit.
    TimeDuration offerDuration?;
    # An array of objects where each object contains the details of an offer and the ID of the listing on which the offer is being made. Note that the service does not currently support the creation of multiple offers with a single call to sendOfferToInterestedBuyer. With this, each request can target only one listing at a time and you must populate this array with a single element that contains the details of one offer.
    OfferedItem[] offeredItems?;
};

# This complex type defines a collection of listings that are eligible for an offer to a buyer.
public type PagedEligibleItemCollection record {
    # A list of items that are eligible for a seller-initiated offer to a buyer. Each element in the list contains the listing ID of a listed item. These IDs represent the listings for which buyers have shown an interest.
    EligibleItem[] eligibleItems?;
    # The URI of the current page of results from the result set.
    string href?;
    # The number of items returned on a single page from the result set. This value can be set in the request with the limit query parameter.
    int 'limit?;
    # The URI for the following page of results. This value is returned only if there is an additional page of results to display from the result set. Max length: 2048
    string next?;
    # The number of results skipped in the result set before listing the first returned result. This value can be set in the request with the offset query parameter. Note: The items in a paginated result set use a zero-based list where the first item in the list has an offset of 0.
    int offset?;
    # The URI for the preceding page of results. This value is returned only if there is a previous page of results to display from the result set. Max length: 2048
    string prev?;
    # The total number of items retrieved in the result set. If no items match the search criteria, the server returns the HTTP status code 204 No Content.
    int total?;
};

# This complex type identifies an eBay user.
public type User record {
    # The masked user name is a user name that has certain characters hidden for privacy of the user.
    string maskedUsername?;
};

# A complex type that defines an offer that a seller makes to eligible buyers.
public type Offer record {
    # If set to true, the buyer is allowed to make a counter-offer to the seller's offer.
    boolean allowCounterOffer?;
    # This complex type identifies an eBay user.
    User buyer?;
    # The date and time when the seller's offer was created. The returned timestamp is formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[hh]:[mm]:[ss].[sss]Z Example: 2018-08-20T07:09:00.000Z
    string creationDate?;
    # The eBay UserName of the user (seller) who initiated the offer.
    string initiatedBy?;
    # The date and time when the offer was last modified. The returned timestamp is formatted as an ISO 8601 string.
    string lastModifiedDate?;
    # A seller-defined message related to the offer being made. This message is sent to the list of &quot;interested&quot; buyers along with the offer message from eBay.
    string message?;
    # A complex type that specifies a period of time using a specified time-measurement unit.
    TimeDuration offerDuration?;
    # The list of items associated with the offer. Currently, the offer list is restricted to a single offer.
    OfferedItem[] offeredItems?;
    # A unique eBay-assigned identifier for the offer.
    string offerId?;
    # The current state, or status, of an offer. Status states include PENDING, COUNTERED, ACCEPTED, and DECLINED. For implementation help, refer to'https://developer.ebay.com/api-docs/sell/negotiation/types/api:OfferStatusEnum'>eBay API documentation
    string offerStatus?;
    # The type of offer being made. For implementation help, refer to'https://developer.ebay.com/api-docs/sell/negotiation/types/api:OfferTypeEnum'>eBay API documentation
    string offerType?;
    # A unique, eBay-assigned ID for the revision of the offer.
    string revision?;
};

# A complex type that describes the value of a monetary amount as represented by a global currency.
public type Amount record {
    # The base currency applied to the value field to establish a monetary amount. The currency is represented as a 3-letter ISO4217 currency code. For example, the code for the Canadian Dollar is CAD. Default: The default currency of the eBay marketplace that hosts the listing. For implementation help, refer to'https://developer.ebay.com/api-docs/sell/negotiation/types/bas:CurrencyCodeEnum'>eBay API documentation
    string currency?;
    # The monetary amount in the specified currency.
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

# A listing that is eligible for a seller-initiated offer to a buyer. Listings are identified by a listingId value that is generated and assigned by eBay when a seller lists an item using the Trading API. Note: The Negotiation API does not currently support listings that are managed with the Inventory API.
public type EligibleItem record {
    # The unique eBay-assigned ID for an eBay listing. A listingId is assigned by eBay when a seller creates a listing with the Trading API.
    string listingId?;
};

# A complex type that specifies a period of time using a specified time-measurement unit.
public type TimeDuration record {
    # A time-measurement unit that specifies a singular period of time. A span of time is defined when you apply the value specified in the value field to the value specified for unit. Time-measurement units can be YEAR, MONTH, DAY, and so on. See TimeDurationUnitEnum for a complete list of possible time-measurement units. For implementation help, refer to'https://developer.ebay.com/api-docs/sell/negotiation/types/bas:TimeDurationUnitEnum'>eBay API documentation
    string unit?;
    # An integer that represents an amount of time, as measured by the time-measurement unit specified in the unit field.
    int value?;
};

public type ErrorParameter record {
    # The object of the error.
    string name?;
    # The value of the object.
    string value?;
};

# A complex type that defines the offer being made to an &quot;interested&quot; buyer.
public type OfferedItem record {
    # This value denotes the percentage that the listing in the offer will be discounted from its original listed price. The seller can specify either the exact price of the discounted items with the price field or they can use this field to specify the percentage that the listing will be discounted, but not both. Minimum: 5 Required if you do not specify a price value.
    string discountPercentage?;
    # This value is a unique eBay-assigned ID that identifies the listing to which the offer pertains. A listingId value is generated by eBay when you list an item with the Trading API.
    string listingId?;
    # A complex type that describes the value of a monetary amount as represented by a global currency.
    Amount price?;
    # This integer value indicates the number of items in the eBay listing for which the offer is being made. The offer being made by the seller is an &quot;all or nothing&quot; offer, meaning the buyer must purchase the indicated quantity of items in order to receive the discount on the transaction. Default: 1
    int quantity?;
};

# The response object returned from a SendOfferToInterestedBuyers request.
public type SendOfferToInterestedBuyersCollectionResponse record {
    # The offers container returns a list of the offers sent to buyers who have shown an interest in listings included in the offer.
    Offer[] offers?;
};
