
## Overview
The Finances API is used by sellers in eBay's managed payments program to retrieve seller payout information. 
The data provided through this public API is similar to the data that the seller will see under the Payments tab of 
Seller Hub in My eBay. With eBay's managed payments program, eBay manages the entire payments process, including the 
available payment methods, and shortly after a buyer's payment clears, eBay distributes payouts directly to the 
seller's preferred bank account.
This module provides operations to retrieve details on seller payout, transactions and transfers

This module supports 1.9.0 version.
 
## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create ebay developer account
* Obtain tokens
    1. Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html) to obtain tokens
* Add configurations to Config.toml 
 
## Quickstart
 
To use the `ballerinax/ebay.finances` connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import the module
```ballerina
   import ballerinax/ebay.finances;
```
### Step 2: Initialize a client with the configuration tokens
```ballerina
   configurable http:BearerTokenConfig & readonly authConfig = ?;
   finances:ClientConfig clientConfig = {authConfig: authConfig};
   finances:Client baseClient = check new Client(clientConfig);
```

### Step 3: Get payout summary details using `getPayoutSummary` remote operation
```ballerina
public function main() {
    finances:PayoutSummaryResponse response = check baseClient->getPayoutSummary();
}
```

## Quick reference 

1. Get seller funds summary
```ballerina
   finances:SellerFundsSummaryResponse response = check baseClient->getSellerFundsSummary();
```
