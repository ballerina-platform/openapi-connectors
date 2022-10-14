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

public type Errors record {
    int code?;
    string message?;
};

public type Invoice record {
    int code?;
    string message?;
    InvoiceInfo[] contact?;
};

public type InvoicelistPageContext record {
    int page?;
    int per_page?;
    boolean has_more_page?;
    string report_name?;
    string applied_filter?;
    string sort_column?;
    string sort_order?;
};

public type SuccessOperation record {
    # Operation status
    int code?;
    # Message
    string message?;
};

public type InvoiceInfo record {
    int invoice_id?;
    boolean ach_payment_initiated?;
    string customer_name?;
    int customer_id?;
    string status?;
    string invoice_number?;
};

public type ContactInfo record {
    int contact_id?;
    string contact_name?;
    string company_name?;
    string contact_type?;
    string status?;
    int payment_terms?;
    string payment_terms_label?;
    int currency_id?;
    string currency_code?;
    int outstanding_receivable_amount?;
    decimal unused_credits_receivable_amount?;
    string first_name?;
    string last_name?;
    string email?;
    string phone?;
    string mobile?;
    string created_time?;
    string last_modified_time?;
};

public type ContactList record {
    int code?;
    string message?;
    ContactInfo[] contacts?;
    ContactlistPageContext page_context?;
};

public type ContactlistPageContext record {
    int page?;
    int per_page?;
    boolean has_more_page?;
    string applied_filter?;
    string sort_column?;
    string sort_order?;
};

public type Contact record {
    int code?;
    string message?;
    ContactInfo[] contact?;
};

public type InvoiceList record {
    int code?;
    string message?;
    InvoiceInfo[] invoices?;
    InvoicelistPageContext page_context?;
};
