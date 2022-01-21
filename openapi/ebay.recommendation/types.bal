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

# A complex type that contains recommendations and information on how to configure Promoted Listings ad campaigns.
public type Ad record {
    # This field returns information that you can use to configure the bidPercentage field in a Promoted Listings campaign. Note: Currently, ITEM and TRENDING are the only supported bid percentage types. The ITEM suggested bid percentages are tailored to each of your items and are designed to help you stay competitive while finding an optimal balance between performance and cost. The recommendations are calculated based on a variety of factors that may include item attributes, seasonality, past performance, and current competition for each of your listings. The TRENDING suggested bid percentages are calculated by reviewing the category level average ad rates in the marketplace. Setting the bidPercentage of your ad campaign based on these rate recommendations will help the items in the campaign be competitive with other items in the marketplace by improving their chances of being displayed more often in the marketplace.
    BidPercentages[] bidPercentages?;
    # An enum whose values describe whether or not eBay recommends you place the associated listing in a Promoted Listings ad campaign. IDs deemed RECOMMENDED by eBay are the listings with the highest potential of benefiting from being promoted. The recommendation calculation is based on marketplace trends, like buyer demand and the competition in the item&rsquo;s category. Note: A promoteWithAd value cannot be calculated for listings that are part of Promoted Listings campaigns. Because of this, if you call findListingRecommendations with a specific set of listing IDs, the promoteWithAd field is not returned for any of the listings that are involved in a promotion. However, as long as they are eligible, the trending bidPercentage is returned for all specified listings, even if they are part of an ad campaign. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/recommendation/types/api:PromoteWithAd'>eBay API documentation</a>
    string promoteWithAd?;
};

# The high-level object used to return a set of Promoted Listings ad recommendations.
public type PagedListingRecommendationCollection record {
    # The URI of the current page of results from the result set.
    string href?;
    # The number of items returned on a single page from the result set. This value can be set in the request with the limit query parameter.
    int 'limit?;
    # Returns a list of listingRecommendations, where each element in the list offers recommendations for the associated listingId. Which elements are returned depend on how you structure the request. For example, if you request recommendations for all of a sellers listings (by leaving the request payload empty), ad recommendations are returned only for those listings where promoteWithAd is set to RECOMMENDED.
    ListingRecommendation[] listingRecommendations?;
    # The URI for the following page of results. This value is returned only if there is an additional page of results to display from the result set. Max length: 2048
    string next?;
    # The number of results skipped in the result set before listing the first returned result. This value can be set in the request with the offset query parameter. Note: The items in a paginated result set use a zero-based list where the first item in the list has an offset of 0.
    int offset?;
    # The URI for the preceding page of results. This value is returned only if there is a previous page of results to display from the result set. Max length: 2048
    string prev?;
    # The total number of items retrieved in the result set. If no items are found, this field is returned with a value of 0.
    int total?;
};

# A complex type that returns data related to Promoted Listings bid percentages.
public type BidPercentages record {
    # The basis by which the ad rate is calculated. Valid Values: ITEM and TRENDING For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/recommendation/types/api:Basis'>eBay API documentation</a>
    string basis?;
    # The bid percentage data is a single precision value, as calculated by the associated basis. In Promoted listings ad campaigns, the bid percentage (also known as the ad rate) is a user-defined value that sets the level that eBay raises the visibility of the listing in the marketplace. It is also the rate that is used to calculate the Promoted Listings fee. Minimum value: 1.0 &nbsp; Maximum value: 100.0
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

# An list of listing ID values for which you want Promoted Listings ad configuration information.
public type FindListingRecommendationRequest record {
    # A comma-separated list of listing IDs for which you want Promoted Listings ad configuration information. Currently, this method accepts only listingId values from the Trading API. Max: 500 listing IDs
    string[] listingIds?;
};

public type ErrorParameter record {
    # The object of the error.
    string name?;
    # The value of the object.
    string value?;
};

# A complex type that contains the ID of an actively listed item and a set of related listing recommendations. The recommendations contain information the seller can use to optimize their listing configurations.
public type ListingRecommendation record {
    # An ID that identifies the active listing associated with the eBay recommendations.
    string listingId?;
    # A complex type that contains information about how a seller can improve their listing configurations. The AD object contains Promoted Listings recommendations and information, which the seller can use to improve buyer conversions. The response can also contain an optional message about the returned data.
    MarketingRecommendation marketing?;
};

# A complex type that contains information about how a seller can improve their listing configurations. The AD object contains Promoted Listings recommendations and information, which the seller can use to improve buyer conversions. The response can also contain an optional message about the returned data.
public type MarketingRecommendation record {
    # A complex type that contains recommendations and information on how to configure Promoted Listings ad campaigns.
    Ad ad?;
    # A message that can conditionally accompany the listing information.
    string message?;
};
