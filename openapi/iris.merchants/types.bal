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

public type Meta record {
    # The current page number of a data set
    int? current_page?;
    # The current position of a data set 
    int? 'from?;
    # The last page of a data set
    string? last_page?;
    # API path
    string? path?;
    # A number of records per page
    int? per_page?;
    # The last position in a data set
    int? to?;
    # Total number of records in a data set
    int? total?;
};

public type Adjustments AdjustmentsInner[]?;

public type ChargebackReplyResponse record {
    ChargebackreplyresponseChargeback? chargeback?;
    ChargebackreplyresponseItems? items?;
    *DisputeDetailsResponse;
};

public type InlineResponse2008Data record {
    # Statement Id
    int? id?;
    # Statement date
    string? date?;
};

public type DisputedetailsresponseNotes record {
    string? message?;
    string? added_at?;
};

public type InlineResponse2009 record {
    string? status?;
    string? file_id?;
};

public type InlineResponse2008 record {
    InlineResponse2008Data[]? data?;
};

public type ChargebackreplyresponseChargeback record {
    string? id?;
    string? merchant_id?;
    string? dba?;
    string? cycle_indicator?;
    string? date?;
    string? transaction_date?;
    string? amount?;
    string? reason_code?;
    string? reason?;
    string? card_number?;
    string? case_number?;
    string? case_action?;
    string? action?;
    string? reply_form?;
    string? case_status?;
    string? case_status_description?;
    string? last_status_date?;
    string? respond_due?;
    string? original_amount?;
    string? updated_at?;
    string? mcc?;
    string? dispute_jurisdiction?;
    string? card_product_type?;
    string? process_date?;
    string? transaction_method?;
    string? invoice_number?;
    string? microfilm_number?;
    string? airline_ticket_number?;
    string? order_number?;
    string? tracking_number?;
};

public type InlineResponse2001 record {
    BriefMerchantInfo? general?;
    string[]? account_information?;
    # A list of linked lead Id's. First from this list is always used as a primary lead.
    int[]? leads?;
};

public type InlineResponse2003 record {
    Deposits? deposits?;
    Adjustments? adjustments?;
    InlineResponse2003Totals? totals?;
};

public type InlineResponse2002 record {
    string? message?;
};

public type DisputedetailsresponseFiles record {
    string? time?;
    string? title?;
    # site url
    string? url?;
    # api url
    string? api_url?;
};

public type InlineResponse2005 record {
    Chargeback[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse2004 record {
    MonetaryBatch[]? data?;
    Links? links?;
    Meta? meta?;
    Adjustments? adjustments?;
};

public type InlineResponse2007 record {
    Retrieval[]? data?;
    Links? links?;
    Meta? meta?;
};

public type MerchantsMerchantnumberBody record {
    # Merchant name
    string? name?;
    # Merchant open date (YYYY-MM-DD)
    string? opened?;
    # Merchant closed date (YYYY-MM-DD)
    string? closed?;
    # Processor name
    string? processor?;
    # Data source name
    string? datasource?;
    # Group name
    string? 'group?;
    # Is VIM?
    string? vim?;
    # Merchant status
    string? status?;
    # Merchant active flag
    string? active?;
};

public type DisputedetailsresponseMessages record {
    string? message?;
    string? description?;
    string? added_at?;
    string? viewed_on?;
};

public type DisputedetailsresponseDirectories record {
    string? time?;
    string? title?;
    DisputedetailsresponseFiles[]? files?;
};

public type DisputedetailsresponseFields record {
    string? 'key?;
    string? value?;
};

public type DisputeFile record {
    # File name
    string? name?;
    # Folder name
    string? directory?;
    # base64 encoded content
    string? content?;
};

public type ChargebackreplyresponseItems record {
    string? reason?;
    string? message_from_bank?;
    string? merchant_due_date?;
    string? financial_disposition_date?;
    string? 'type?;
};

public type AdjustmentsInner record {
    # Adjustment date
    string? date?;
    # Adjustment type
    string? 'type?;
    # Adjustment amount
    string? amount?;
};

public type Chargeback record {
    # Chargeback internal ID
    int? id?;
    # Merchant ID
    string? merchant_id?;
    # Merchant DBA
    string? dba?;
    # Case number
    string? case_number?;
    # Chargeback date
    string? chargeback_date?;
    # Transaction date
    string? transaction_date?;
    # Respond due date
    string? respond_due?;
    # Amount
    string? amount?;
    # Original amount of transaction
    string? original_amount?;
    # Transaction currency
    string? currency?;
    # Chargeback reason
    string? reason?;
    # Chargeback reason code
    string? reason_code?;
    # Cardholder number
    string? card_number?;
    # Reply form type. Affects reply options.
    string? reply_form?;
    # Chargeback cycle indicator
    string? cycle_indicator?;
    # Transaction ID
    string? transaction_id?;
    # Transaction ID
    string? reference_number?;
    # Case status
    string? case_status?;
    # Status description
    string? case_status_description?;
    # MCC code
    string? mcc?;
    # Dispute jurisdiction
    string? dispute_jurisdiction?;
    # Card product
    string? card_product_type?;
    # Process date
    string? process_date?;
    # Transaction method
    string? transaction_method?;
    # Invoice number
    string? invoice_number?;
    # Microfilm number
    string? microfilm_number?;
    # Airline ticket number
    string? airline_ticket_number?;
    # Order number
    string? order_number?;
    # Tracking number
    string? tracking_number?;
    # Date of the last status update
    string? last_status_date?;
    # Date of the most recent update
    string? updated_at?;
    # Case action
    string? case_action?;
    # Can the case be viewed of replied
    string? action?;
    # Foreign amount of transaction
    string? foreign_amount?;
    # Transaction locator
    string? transaction_locator?;
    # Authorization code
    string? authorization_code?;
    # Chargeback type
    string? 'type?;
};

public type DisputedetailsresponseTransactions record {
    string? reference?;
    DisputedetailsresponseFields[]? fields?;
};

public type DepositsInner record {
    # Deposit date
    string? date?;
    # Deposit amount
    string? amount?;
    # Transactions count
    int? transactions?;
    # Deposit batch number
    string? batch?;
};

public type DisputeDetailsResponse record {
    DisputedetailsresponseTransactions[]? transactions?;
    DisputedetailsresponseTransactions[]? auth_records?;
    DisputedetailsresponseNotes[]? notes?;
    DisputedetailsresponseMessages[]? messages?;
    DisputedetailsresponseDirectories[]? directories?;
};

public type BriefMerchantInfo record {
    # Merchant number
    string? mid?;
    # Merchant name
    string? name?;
    # Merchant open date
    string? opened?;
    # Merchant closed date
    string? closed?;
    # Merchant created date
    string? created?;
    # Merchant modified date
    string? modified?;
    # Merchant first batch date
    string? first_batch?;
    # Merchant last batch date
    string? last_batch?;
    # Group name
    string? 'group?;
    # Processor name
    string? processor?;
    # Data source name
    string? datasource?;
    # SIC Code
    string? sic_code?;
    # Is VIM?
    string? vim?;
    # Merchant deactivation date
    string? deactivated?;
    # Merchant status
    string? status?;
    # Merchant active flag
    string? active?;
};

public type InlineResponse2003TotalsAdjustments record {
    string? 'type?;
    string? amount?;
};

public type InlineResponse2003Totals record {
    string? total_paid_by_us?;
    string? monthly_total?;
    InlineResponse2003TotalsAdjustments[]? adjustments?;
    InlineResponse2003TotalsDeposits[]? deposits?;
    InlineResponse2003TotalsPerCardType[]? per_card_type?;
    int? transactions_count?;
};

public type InlineResponse2003TotalsPerCardType record {
    string? 'type?;
    string? amount?;
    int? count?;
};

public type Retrieval record {
    # Chargeback internal ID
    int? id?;
    # Merchant ID
    string? merchant_id?;
    # Merchant DBA
    string? dba?;
    # Case number
    string? case_number?;
    # Request date
    string? retrieval_date?;
    # Transaction date
    string? transaction_date?;
    # Amount
    string? amount?;
    # Respond due date
    string? respond_due?;
    # Original amount of transaction
    string? original_amount?;
    # Transaction currency
    string? currency?;
    # Retrieval case reason
    string? reason?;
    # Retrieval case reason code
    string? reason_code?;
    # Cardholder number
    string? card_number?;
    # Transaction ID
    string? transaction_id?;
    # Transaction ID
    string? reference_number?;
    # Case status
    string? case_status?;
    # Status description
    string? case_status_description?;
    # MCC code
    string? mcc?;
    # Dispute jurisdiction
    string? dispute_jurisdiction?;
    # Card product
    string? card_product_type?;
    # Transaction method
    string? transaction_method?;
    # Invoice number
    string? invoice_number?;
    # Microfilm number
    string? microfilm_number?;
    # Airline ticket number
    string? airline_ticket_number?;
    # Order number
    string? order_number?;
    # Tracking number
    string? tracking_number?;
    # Date of the last status update
    string? last_status_date?;
    # Date of the most recent update
    string? updated_at?;
    # Case action
    string? case_action?;
    # Can the case be viewed of replied
    string? action?;
    # Foreign amount of transaction
    string? foreign_amount?;
    # Transaction locator
    string? transaction_locator?;
};

public type RetrievalsReplyResponse record {
    RetrievalsreplyresponseRetrieval? retrieval?;
    *DisputeDetailsResponse;
};

public type MonetaryBatch record {
    # Batch date
    string? date?;
    # Batch description
    string? reference_number?;
    # Batch amount
    string? amount?;
    # A number of transactions
    string? count?;
    # Batch terminal number
    string? terminal_number?;
    MonetarybatchTransactions[]? transactions?;
};

public type Deposits DepositsInner[]?;

public type InlineResponse2003TotalsDeposits record {
    string? date?;
    string? amount?;
};

public type InlineResponse200 record {
    record {
        *BriefMerchantInfo;
        # List of Lead IDs
        int[]? leads?;
    }[]? data?;
    Links? links?;
    Meta? meta?;
};

public type MonetarybatchTransactions record {
    # Transaction ID
    int? id?;
    # Transaction date
    string? date?;
    # Transaction type
    string? 'type?;
    # Transaction amount
    string? amount?;
    # Cardholder number
    string? cardholder?;
    # Transaction auth code
    string? auth_code?;
    # POS entry mode
    string? pos_entry_mode?;
    # Invoice number
    string? invoice_number?;
    # Is a transaction rejected?
    boolean? void_reject_chargeback?;
};

public type RetrievalsreplyresponseRetrieval record {
    string? id?;
    string? merchant_id?;
    string? dba?;
    string? date?;
    string? transaction_date?;
    string? amount?;
    string? reason_code?;
    string? reason?;
    string? card_number?;
    string? case_number?;
    string? case_action?;
    string? action?;
    string? case_status?;
    string? case_status_description?;
    string? last_status_date?;
    string? respond_due?;
    string? original_amount?;
    string? updated_at?;
    string? mcc?;
    string? dispute_jurisdiction?;
    string? card_product_type?;
    string? foreign_amount?;
    string? transaction_method?;
    string? transaction_locator?;
    string? invoice_number?;
    string? microfilm_number?;
    string? airline_ticket_number?;
    string? order_number?;
    string? tracking_number?;
};

public type Links record {
    # An URL to the first page of the data set
    string? first?;
    # An URL to the last page of the data set
    string? last?;
    # An URL to the previous page of the data set
    string? prev?;
    # An URL to the next page of the data set
    string? next?;
};
