// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

public type ProductArr Product[];

public type PriceEstimateArr PriceEstimate[];

public type ProductList record {
    # Contains the list of products
    Product[] products?;
};

public type Activities record {
    # Position in pagination.
    int offset?;
    # Number of items to retrieve (100 max).
    int 'limit?;
    # Total number of items available.
    int count?;
    Activity[] history?;
};

public type Product record {
    # Unique identifier representing a specific product for a given latitude & longitude. For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
    string product_id?;
    # Description of product.
    string description?;
    # Display name of product.
    string display_name?;
    # Capacity of product. For example, 4 people.
    int capacity?;
    # Image URL representing the product.
    string image?;
};

public type Activity record {
    # Unique identifier for the activity
    string uuid?;
};

public type Error record {
    int code?;
    string message?;
    string fields?;
};

public type PriceEstimate record {
    # Unique identifier representing a specific product for a given latitude & longitude. For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles
    string product_id?;
    # [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217) currency code.
    string currency_code?;
    # Display name of product.
    string display_name?;
    # Formatted string of estimate in local currency of the start location. Estimate could be a range, a single number (flat rate) or "Metered" for TAXI.
    string estimate?;
    # Lower bound of the estimated price.
    decimal low_estimate?;
    # Upper bound of the estimated price.
    decimal high_estimate?;
    # Expected surge multiplier. Surge is active if surge_multiplier is greater than 1. Price estimate already factors in the surge multiplier.
    decimal surge_multiplier?;
};

public type Profile record {
    # First name of the Uber user.
    string first_name?;
    # Last name of the Uber user.
    string last_name?;
    # Email address of the Uber user
    string email?;
    # Image URL of the Uber user.
    string picture?;
    # Promo code of the Uber user.
    string promo_code?;
};
