// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type SubscriptionItem record {
    # Date when the subscription to this product will end
    string endDate?;
    # The unique identifier of the subscription item.
    string id;
    Price price;
    Product product;
    # Date the subscription started, or will start. Note: this could be in
    # the future for downgrades or reduced number of seats that haven't taken effect yet.
    string startDate;
    # Status of the subscription item. Available statuses are ACTIVE, CANCELED, and
    # PENDING_ACTIVATION.
    string status;
    # If the subscription is a test subscription
    boolean testMode?;
};

public type Price record {
    # The net (before tax) amount.
    float amount;
    # The currency of the price.
    string currency;
    # The unique identifier of the price.
    string id;
};

public type Product record {
    # The unique identifier for the product
    string id?;
    # The name of the product
    string name?;
    # The pricing model of the product:
    # * FIXED: Customers are charged a fixed amount for each billing period
    # * PER_SEAT: Customers are charged based on the number of units they purchase
    string 'type?;
    # The unit of the per seat product. e.g. "user", "organisation", "SMS", etc
    string seatUnit?;
};

public type ProblemDetails record {
    string detail?;
    record {} extensions?;
    string instance?;
    int status?;
    string title?;
    string 'type?;
};

public type Subscription record {
    # End of the current period that the subscription has been invoiced for.
    string currentPeriodEnd;
    # If the subscription has been canceled, this is the date when the subscription ends. If null, the subscription is active and has not been cancelled
    string endDate?;
    # The unique identifier of the subscription
    string id;
    # The Xero generated unique identifier for the organisation
    string organisationId;
    # List of plans for the subscription.
    Plan[] plans;
    # Date when the subscription was first created.
    string startDate;
    # Status of the subscription. Available statuses are ACTIVE, CANCELED, and PAST_DUE.
    string status;
    # Boolean used to indicate if the subscription is in test mode
    boolean testMode?;
};

public type Plan record {
    # The unique identifier of the plan
    string id;
    # The name of the plan. It is used in the invoice line item
    # description.
    string name;
    # Status of the plan. Available statuses are ACTIVE, CANCELED, and
    # PENDING_ACTIVATION.
    string status;
    # List of the subscription items belonging to the plan. It does not
    # include cancelled subscription items.
    SubscriptionItem[] subscriptionItems;
};
