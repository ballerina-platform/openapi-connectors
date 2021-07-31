## Overview
The Ebay Recommendation API returns information that sellers can use to configure Promoted Listings ad campaigns.
The Recommendation API currently has a single recommendation type, AD, that returns information pertaining to Promoted Listings ad campaigns. 
Seller can use the recommendations returned as guidelines for setting up campaigns.
In the eBay marketplace, where an increased visibility directly correlates to the buyer conversion rate, 
information returned with the AD recommendation type can help you know which listings to promote and how to configure ad campaigns.

This module provides information that sellers can use to configure Promoted Listings ad campaigns.
This module supports 1.1.0 version.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an ebay developer account
* Obtain tokens
    1. Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html) to obtain tokens
* Add configurations to Config.toml 

## Quickstart

To use the `ballerinax/ebay.recommendation` connector in your Ballerina application, update the .bal file as follows:
1. Import the module
```ballerina
   import ballerinax/ebay.recommendation;
```
2. Initialize a client with the configuration tokens
```ballerina
   configurable http:BearerTokenConfig & readonly authConfig = ?;
   recommendation:ClientConfig clientConfig = {authConfig: authConfig};
   recommendation:Client baseClient = check new Client(clientConfig);
```

3. Get information that can help sellers optimize listing configurations.
```ballerina
public function main() {
    string xEbayCMarketplaceId = "";
    FindListingRecommendationRequest listingIds;
    recommendation:PagedListingRecommendationCollection response = check baseClient->findListingRecommendations(xEbayCMarketplaceId, listingIds);
}
```

## Quick reference 

1. Get information that can help sellers optimize listing configurations.
```ballerina
    recommendation:PagedListingRecommendationCollection response = check baseClient->findListingRecommendations(xEbayCMarketplaceId, listingIds);
```