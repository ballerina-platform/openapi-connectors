
## Overview
This is a generated connector for [eBay finances API v1.9.0](https://developer.ebay.com/api-docs/sell/finances/overview.html) OpenAPI Specification. 

The eBay Developers Program is hosted on the eBay Developer Site. The program provides information and services for 
the eBay developer community. This API is used to retrieve seller payouts and monetary transaction details
related to those payouts. The finances API is used by sellers in eBay's managed payments program to retrieve seller payout information. 
The data provided through this public API is similar to the data that the seller will see under the Payments tab of 
Seller Hub in My eBay. With eBay's managed payments program, eBay manages the entire payments process, including the 
available payment methods, and shortly after a buyer's payment clears, eBay distributes payouts directly to the 
seller's preferred bank account.
 
## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create ebay developer account
* Obtain tokens
    1. Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html) to obtain tokens
 
## Quickstart
 
To use the `ballerinax/ebay.finances` connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
```ballerina
   import ballerinax/ebay.finances;
```
### Step 2 -  Create a new connector instance
```ballerina
   configurable http:BearerTokenConfig & readonly auth = ?;
   finances:ClientConfig clientConfig = {auth: auth};
   finances:Client baseClient = check new Client(clientConfig);
```

### Step 3 - Invoke  connector operation 
1. Invoke connector operations using the client
```ballerina
public function main() {
    finances:PayoutSummaryResponse response = check baseClient->getPayoutSummary();
}
```
2. Use `bal run` command to compile and run the Ballerina program.

## Quick reference 

1. Get seller funds summary
```ballerina
   finances:SellerFundsSummaryResponse response = check baseClient->getSellerFundsSummary();
```


