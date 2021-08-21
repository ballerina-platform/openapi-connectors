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

public type ProductGroupArr ProductGroup[];

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

public type ProductGroup record {
    # Primary key of a grouping of related Subscriptions
    string productGroupKey;
    # The number of Subscriptions that the shopper owns in this group
    int subscriptionCount;
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

public type SubscriptionRelations record {
    # A set of related Subscriptions that will be canceled automatically if this Subscription is canceled
    string[] children?;
    # Unique identifier of this Subscription's parent
    string parent?;
};

public type SubscriptionBilling record {
    # The financial commitment the customer has in the product
    string commitment;
    # The types of charges that are past due when `status` is PAST_DUE
    string[] pastDueTypes?;
    # The point in time after which the Subscription will bill for automatic renewal
    string renewAt;
    # Whether payments are past due
    string status;
};

public type Error record {
    # Short identifier for the error, suitable for indicating the specific error within client code
    string code;
    # List of the specific fields, and the errors found with their contents
    ErrorField[] fields?;
    # Human-readable, English description of the error
    string message?;
};

public type SubscriptionList record {
    Pagination pagination;
    # A collection of subscriptions
    Subscription[] subscriptions;
};

public type SubscriptionUpdate record {
    # Unique identifier of the payment profile you want to be used for automatic renewal
    int paymentProfileId?;
    # Whether or not you want the Subscription renew automatically
    boolean renewAuto?;
};

public type Subscription record {
    # An array of additional products that have been purchased to augment this Subscription
    SubscriptionAddon[] addons?;
    SubscriptionBilling billing;
    # Whether or not the Subscription is allowed to be canceled
    boolean cancelable?;
    # When the Subscription was created
    string createdAt;
    # When the Subscription will expire
    string expiresAt?;
    # A human readable description of this Subscription
    string label?;
    # The url to use or manage this Subscription's active product
    string launchUrl?;
    # Unique identifier of the payment profile that will be used to automatically renew this Subscription
    int paymentProfileId?;
    # Whether the renewal price will be based from the list price or a locked-in price for this shopper
    boolean priceLocked;
    SubscriptionProduct product;
    SubscriptionRelations relations?;
    # Whether or not the Subscription is set to be automatically renewed via the billing agent
    boolean renewAuto;
    # Whether or not the Subscription is allowed to be renewed
    boolean renewable;
    # Whether the Subscription is active or the specific non-active state
    string status;
    # Unique identifier of the Subscription
    string subscriptionId;
    # Whether or not the Subscription is allowed to be upgraded
    boolean upgradeable;
};

public type SubscriptionProduct record {
    # A human readable description of the Product that is subscribed
    string label;
    # Grouping of related Subscriptions
    string namespace;
    # Unique identifier of the Product that is subscribed
    int pfid;
    # Primary key of a grouping of related Subscriptions
    string productGroupKey;
    # The number of `renewalPeriodUnits` that will be added by the `renewalPfid`
    int renewalPeriod;
    # The unit of time that `renewalPeriod` is measured in
    string renewalPeriodUnit;
    # Unique identifier of the renewal Product
    int renewalPfid;
    # Whether the product supports the `billOn` option on the renewal endpoint
    boolean supportBillOn;
};

public type SubscriptionAddon record {
    # The financial commitment the customer has in the product
    string commitment;
    # Unique identifier of the add-in product
    int pfid;
    int quantity;
};
