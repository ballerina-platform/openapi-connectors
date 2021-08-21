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

public type ErrorField record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # Human-readable, English description of the problem with the contents of the field
    string message?;
    # <ul>
    # <li style='margin-left: 12px;'>JSONPath referring to a field containing an error</li>
    # <strong style='margin-left: 12px;'>OR</strong>
    # <li style='margin-left: 12px;'>JSONPath referring to a field that refers to an object containing an error, with more detail in `pathRelated`</li>
    # </ul>
    string path;
    # JSONPath referring to a field containing an error, which is referenced by `path`
    string pathRelated?;
};

public type Order record {
    BillTo billTo;
    # Date and time when the current order is created on
    string createdAt;
    # Currency in which the order has been placed
    string currency;
    LineItem[] items;
    # Unique identifier of current order
    string orderId;
    # Unique identifier of the parent order. All refund/chargeback orders are tied to the original order.
    # The orginal order's `orderId` is the `parentOrderId` of refund/chargeback orders
    string parentOrderId?;
    Payment[] payments;
    OrderPricing pricing;
};

public type Address record {
    string address1;
    string address2?;
    string city;
    # Two-letter ISO country code to be used as a hint for target region<br/><br/>
    # NOTE: These are sample values, there are many
    # <a href='http://www.iso.org/iso/country_codes.htm'>more</a>
    string country;
    # Postal or zip code
    string postalCode;
    # State or province or territory
    string state;
};

public type LineItemSummary record {
    # Product label of the current line item
    string label;
};

public type OrderSummary record {
    # Date and time when the current order was created
    string createdAt;
    # Currency in which the order was placed
    string currency;
    # Sets of two or more line items in current order
    LineItemSummary[] items;
    # Unique identifier of the current order
    int orderId;
    # Unique identifier of the parent order. All refund/chargeback orders are tied to the original order.
    # The orginal order's `orderId` is the `parentOrderId` of refund/chargeback orders
    string parentOrderId?;
    OrderSummaryPricing pricing;
};

public type OrderPricing record {
    # Discount from promotional pricing
    int discount;
    OrderFee fees;
    float id?;
    # Sum of list prices for the entire cart
    int list;
    # Savings off of list price <pre>`savings` = `list` - `subtotal`</pre>
    int savings;
    # Price with `discount` and without taxes or fees
    int subtotal;
    # Taxes for the entire cart
    int taxes;
    # A collection of line item tax details
    LineItemPricingTaxDetail[] taxDetails?;
    # Price the customer pays <pre>`total` = `subtotal` + `taxes` + `fees.total`</pre>
    int total;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
};

public type LineItem record {
    # A collection of domain names purchased if the current product is domain
    string[] domains?;
    # Human readable description of the current product
    string label;
    float period?;
    # The unit of time that periodCount is measured in
    string periodUnit?;
    # Unique identifier of the current product
    int pfid?;
    LineItemPricing pricing;
    # Number of the current product included in the specified order
    int quantity;
    LineItemTaxCollector taxCollector?;
};

public type LineItemPricingTaxDetail record {
    # Tax amount
    int amount?;
    float rate?;
};

public type LineItemTaxCollector record {
    # Unique identifier for the company
    int taxCollectorId;
};

public type OrderSummaryPricing record {
    # Total amount charged for the current order. Negative for Refund and Chargeback
    string total;
};

public type Contact record {
    Address addressMailing;
    string email;
    string fax?;
    string jobTitle?;
    string nameFirst;
    string nameLast;
    string nameMiddle?;
    string organization?;
    string phone;
};

public type Pagination record {
    # URI to access the first page
    string first?;
    # URI to access the last page
    string last?;
    # URI to access the next page
    string next?;
    # URI to access the previous page
    string previous?;
    # Number of records available
    int total?;
};

public type LineItemPricing record {
    # Discount off of sale price for given `quantity` and `period` <pre>`discount` = `sale` - `subtotal`</pre>
    int discount;
    OrderFee fees;
    # List price for given `quantity` and `period`
    int list;
    # Actual price for the current product
    int sale;
    # Savings off of list price for given `quantity` and `period` <pre>`savings` = `list` - `subtotal`</pre>
    int savings;
    # Price with any discounts and without taxes or fees for given `quantity` and `period`
    int subtotal;
    # Taxes for given `quantity` and `period`
    int taxes;
    # Pricing for a single unit of the given item
    record  { }  unit;
};

public type Payment record {
    # Amount paid by the current payment
    int amount;
    # The category of payment method used at the time of purchase.
    # Most common values are listed in the enum.
    string category;
    # Unique identifier of the payment profile used by current payment
    string paymentProfileId;
    # The subcategory of payment method used at the time of purchase.
    #  This field is only set for certain payment categories, such as ACH and CREDIT_CARD.
    # Most common values are listed in the enum.
    string subcategory?;
};

public type ErrorLimit record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
    # Number of seconds to wait before attempting a similar request
    int retryAfterSec;
};

public type OrderFee record {
    # Domain registration transaction fee charged by ICANN
    int icann?;
    # Sum of all fees
    int total;
};

public type BillTo record {
    Contact contact;
    # Tax id used for calculating the tax the customer is required to pay
    string taxId?;
};

public type LineItemUnitPricing record {
    # Discount without consideration of `quantity` and `period`
    int discount;
    OrderFee fees;
    # List price without consideration of `quantity` and `period`
    int list;
    # Sale price without consideration of `quantity` and `period`
    int sale;
    # Savings without consideration of `quantity` and `period`
    int savings;
    # Taxes without consideration of `quantity` and `period`
    int taxes;
};

public type OrderList record {
    # A collection of orders
    OrderSummary[] orders;
    Pagination pagination;
};
