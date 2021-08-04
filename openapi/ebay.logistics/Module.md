## Overview
This is a generated connector for [eBay logistics API v1_beta.0.0](https://developer.ebay.com/api-docs/sell/logistics/static/overview.html) OpenAPI Specification.

This is an API available only to select developers
approved by business units.The Logistics API
resources offer the following capabilities: shipping_quote
Consolidates into a list a set of live shipping rates, or quotes,
from which you can select a rate to ship a package. shipment
creates a "shipment" for the selected shipping rate. Call
createShippingQuote to get a list of live shipping rates. The rates
returned are all valid for a specific time window and all quoted prices are
at eBay-negotiated rates. Select one of the live rates and using its
associated rateId, create a "shipment" for the package by calling
createFromShippingQuote. Creating a shipment completes an agreement,
and the cost of the base service and any added shipping options are summed
into the returned totalShippingCost value. This action also generates
a shipping label that you can use to ship the package.  The total cost of
the shipment is incurred when the package is shipped using the supplied
shipping label. Sellers must set up a payment method via their eBay account before they can use the methods in
this API to create a shipment and the associated shipping label.
 
## Prerequisites
Before using this connector in your Ballerina application, complete the following:

* Create an eBay developer account
* Obtain tokens
    1. Follow [this link](https://developer.ebay.com/api-docs/static/oauth-tokens.html) to obtain tokens

