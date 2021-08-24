## Overview
This is a generated connector for [Ebay Recommendation API v1.1.0](https://developer.ebay.com) OpenAPI specification.
The Ebay Recommendation API returns information that sellers can use to configure Promoted Listings ad campaigns.
The Recommendation API currently has a single recommendation type, AD, that returns information pertaining to Promoted Listings ad campaigns. 
Seller can use the recommendations returned as guidelines for setting up campaigns.
In the eBay marketplace, where an increased visibility directly correlates to the buyer conversion rate, 
information returned with the AD recommendation type can help you know which listings to promote and how to configure ad campaigns.
[API documentation](https://developer.ebay.com/api-docs/sell/recommendation/overview.html)

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create [eBay developer account](https://developer.ebay.com/join/)
* Obtain tokens - Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html)

## Quickstart

To use the `ballerinax/ebay.recommendation` connector in your Ballerina application, update the .bal file as follows:
1. Import the module
```ballerina
   import ballerinax/ebay.recommendation;
```
### Step 2: Create a new connector instance
Create a `recommendation:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it.
```ballerina
   configurable http:BearerTokenConfig & readonly auth = ?;
   recommendation:ClientConfig clientConfig = {auth: auth};
   recommendation:Client baseClient = check new Client(clientConfig);
```

### Step 3 : Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

Following is an example on how to get information that can help sellers optimize listing configurations.

```ballerina
public function main() {
    recommendation:PagedListingRecommendationCollection response = check baseClient->findListingRecommendations(xEbayCMarketplaceId, listingIds);
}
```
2. Use `bal run` command to compile and run the Ballerina program.