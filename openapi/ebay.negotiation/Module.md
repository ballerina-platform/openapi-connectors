## Overview
This is a generated connector for [eBay Negotiation API v1.1.0](https://developer.ebay.com/api-docs/sell/negotiation/overview.html)  OpenAPI Specification.

The Negotiations API provides capability to access sellers to proactively send discount offers to buyers who have shown an 
"interest" in their listings. 
By sending buyers discount offers on listings where they have shown an interest, sellers can increase the velocity of their sales. 
There are various ways for a buyer to show interest in a listing. For example, if a buyer adds the listing to their Watch list, 
or if they add the listing to their shopping cart and later abandon the cart, they are deemed to have shown an interest in the listing.  
In the offers that sellers send, they can discount their listings by either a percentage off the listing price, or they can set a 
new discounted price that is lower than the original listing price.  For details about how seller offers work, 
see "/api-docs/sell/static/marketing/offers-to-buyers.html" title="Selling Integration Guide">Sending offers to buyers.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create an eBay developer account
* Obtain tokens
    1. Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html) to obtain tokens
* Add configurations to Config.toml
