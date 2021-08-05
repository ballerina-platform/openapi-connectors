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

public type Payment record {
    decimal actually_paid?;
    string order_description?;
    string order_id?;
    decimal outcome_amount?;
    string outcome_currency?;
    string pay_address?;
    decimal pay_amount?;
    string pay_currency?;
    decimal payment_id?;
    string payment_status?;
    decimal price_amount?;
    string price_currency?;
    string purchase_id?;
};

public type ApproximatePrice record {
    decimal amount_from?;
    string currency_from?;
    string currency_to?;
    decimal estimated_amount?;
};

public type PaymentListResponse record {
    Payment[] data?;
    decimal 'limit?;
    decimal page?;
    decimal pagesCount?;
    decimal total?;
};

public type MinimumPayment record {
    string currency_from?;
    string currency_to?;
    decimal min_amount?;
};
