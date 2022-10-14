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

import ballerina/constraint;

@constraint:String {maxLength: 13}
public type InvoiceSubscriptionidsItemsString string;

@constraint:String {maxLength: 13}
public type TransactionSubscriptionidsItemsString string;

public type Account record {
    *AccountReadOnly;
    *AccountResponse;
};

public type InvoiceMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    string number?;
    string 'type?;
    string state?;
};

public type AccountMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The unique identifier of the account.
    @constraint:String {maxLength: 50}
    string code?;
    # The email address used for communicating with this customer.
    string email?;
    @constraint:String {maxLength: 255}
    string first_name?;
    @constraint:String {maxLength: 255}
    string last_name?;
    @constraint:String {maxLength: 255}
    string company?;
    @constraint:String {maxLength: 13}
    string parent_account_id?;
    @constraint:String {maxLength: 6}
    string bill_to?;
};

public type SubscriptionShippingCreate record {
    ShippingAddressCreate address?;
    # Assign a shipping address from the account's existing shipping addresses. If `address_id` and `address` are both present, `address` will be used.
    @constraint:String {maxLength: 13}
    string address_id?;
    # The id of the shipping method used to deliver the subscription. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 13}
    string method_id?;
    # The code of the shipping method used to deliver the subscription. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 50}
    string method_code?;
    float amount?;
};

public type Invoice record {
    string id?;
    string 'object?;
    # Invoices are either charge, credit, or legacy invoices.
    string 'type?;
    # The event that created the invoice.
    string origin?;
    string state?;
    AccountMini account?;
    # The `billing_info_id` is the value that represents a specific billing info for an end customer. When `billing_info_id` is used to assign billing info to the subscription, all future billing events for the subscription will bill to the specified billing info.
    string billing_info_id?;
    # If the invoice is charging or refunding for one or more subscriptions, these are their IDs.
    InvoiceSubscriptionidsItemsString[] subscription_ids?;
    # On refund invoices, this value will exist and show the invoice ID of the purchase invoice the refund was created from.
    @constraint:String {maxLength: 13}
    string previous_invoice_id?;
    # If VAT taxation and the Country Invoice Sequencing feature are enabled, invoices will have country-specific invoice numbers for invoices billed to EU countries (ex: FR1001). Non-EU invoices will continue to use the site-level invoice number sequence.
    string number?;
    # An automatic invoice means a corresponding transaction is run using the account's billing information at the same time the invoice is created. Manual invoices are created without a corresponding transaction. The merchant must enter a manual payment transaction or have the customer pay the invoice with an automatic method, like credit card, PayPal, Amazon, or ACH bank payment.
    string collection_method?;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms?;
    InvoiceAddress address?;
    ShippingAddress shipping_address?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Total discounts applied to this invoice.
    float discount?;
    # The summation of charges and credits, before discounts and taxes.
    float subtotal?;
    # The total tax on this invoice.
    float tax?;
    # The final total on this invoice. The summation of invoice charges, discounts, credits, and tax.
    float total?;
    # The refundable amount on a charge invoice. It will be null for all other invoices.
    float refundable_amount?;
    # The total amount of successful payments transaction on this invoice.
    float paid?;
    # The outstanding balance remaining on this invoice.
    float balance?;
    TaxInfo tax_info?;
    # VAT registration number for the customer on this invoice. This will come from the VAT Number field in the Billing Info or the Account Info depending on your tax settings and the invoice collection method.
    @constraint:String {maxLength: 20}
    string vat_number?;
    # VAT Reverse Charge Notes only appear if you have EU VAT enabled or are using your own Avalara AvaTax account and the customer is in the EU, has a VAT number, and is in a different country than your own. This will default to the VAT Reverse Charge Notes text specified on the Tax Settings page in your Recurly admin, unless custom notes were created with the original subscription.
    string vat_reverse_charge_notes?;
    # This will default to the Terms and Conditions text specified on the Invoice Settings page in your Recurly admin. Specify custom notes to add or override Terms and Conditions.
    string terms_and_conditions?;
    # This will default to the Customer Notes text specified on the Invoice Settings. Specify custom notes to add or override Customer Notes.
    string customer_notes?;
    LineItem[] line_items?;
    # Identifies if the invoice has more line items than are returned in `line_items`. If `has_more_line_items` is `true`, then a request needs to be made to the `list_invoice_line_items` endpoint.
    boolean has_more_line_items?;
    Transaction[] transactions?;
    CreditPayment[] credit_payments?;
    string created_at?;
    string updated_at?;
    # Date invoice is due. This is the date the net terms are reached.
    string due_at?;
    # Date invoice was marked paid or failed.
    string closed_at?;
};

public type Address record {
    string phone?;
    string street1?;
    string street2?;
    string city?;
    # State or province.
    string region?;
    # Zip or postal code.
    string postal_code?;
    # Country, 2-letter ISO 3166-1 alpha-2 code.
    string country?;
};

public type PlanUpdate record {
    @constraint:String {maxLength: 13}
    string id?;
    # Unique code to identify the plan. This is used in Hosted Payment Page URLs and in the invoice exports.
    @constraint:String {maxLength: 50}
    string code?;
    # This name describes your plan and will appear on the Hosted Payment Page and the subscriber's invoice.
    @constraint:String {maxLength: 255}
    string name?;
    # Optional description, not displayed.
    string description?;
    # Accounting code for invoice line items for the plan. If no value is provided, it defaults to plan's code.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Units for the plan's trial period.
    string trial_unit?;
    # Length of plan's trial period in `trial_units`. `0` means `no trial`.
    int trial_length?;
    # Allow free trial subscriptions to be created without billing info. Should not be used if billing info is needed for initial invoice due to existing uninvoiced charges or setup fee.
    boolean trial_requires_billing_info?;
    # Automatically terminate plans after a defined number of billing cycles.
    int total_billing_cycles?;
    # Subscriptions will automatically inherit this value once they are active. If `auto_renew` is `true`, then a subscription will automatically renew its term at renewal. If `auto_renew` is `false`, then a subscription will expire at the end of its term. `auto_renew` can be overridden on the subscription record itself.
    boolean auto_renew?;
    string revenue_schedule_type?;
    string setup_fee_revenue_schedule_type?;
    # Accounting code for invoice line items for the plan's setup fee. If no value is provided, it defaults to plan's accounting code.
    @constraint:String {maxLength: 20}
    string setup_fee_accounting_code?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Optional field used by Avalara, Vertex, and Recurly's EU VAT tax feature to determine taxation rules. If you have your own AvaTax or Vertex account configured, use their tax codes to assign specific tax rules. If you are using Recurly's EU VAT feature, you can use values of `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the plan, `false` applies tax on the plan.
    boolean tax_exempt?;
    @constraint:Array {minLength: 1}
    PlanPricing[] currencies?;
    PlanHostedPages hosted_pages?;
    # Used to determine whether items can be assigned as add-ons to individual subscriptions.
    # If `true`, items can be assigned as add-ons to individual subscription add-ons.
    # If `false`, only plan add-ons can be used.
    boolean allow_any_item_on_subscriptions?;
};

public type MeasuredUnitCreate record {
    # Unique internal name of the measured unit on your site.
    @constraint:String {maxLength: 255}
    string name;
    # Display name for the measured unit.
    @constraint:String {maxLength: 50}
    string display_name;
    # Optional internal description.
    string description?;
};

# A unique coupon code for a bulk coupon.
public type UniqueCouponCode record {
    string id?;
    string 'object?;
    # The code the customer enters to redeem the coupon.
    string code?;
    # Indicates if the unique coupon code is redeemable or why not.
    string state?;
    # The Coupon ID of the parent Bulk Coupon
    string bulk_coupon_id?;
    # The Coupon code of the parent Bulk Coupon
    string bulk_coupon_code?;
    string created_at?;
    string updated_at?;
    # The date and time the unique coupon code was redeemed.
    string redeemed_at?;
    # The date and time the coupon was expired early or reached its `max_redemptions`.
    string expired_at?;
};

public type ShippingAddressList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    ShippingAddress[] data?;
};

public type AccountCreate record {
    # The unique identifier of the account. This cannot be changed once the account is created.
    @constraint:String {maxLength: 50}
    string code;
    AccountAcquisitionUpdate acquisition?;
    ShippingAddressCreate[] shipping_addresses?;
    *AccountUpdate;
};

public type CouponBulkCreate record {
    # The quantity of unique coupon codes to generate
    @constraint:Int {minValue: 1, maxValue: 200}
    int number_of_unique_codes?;
};

# Full item details.
public type Item record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Unique code to identify the item.
    @constraint:String {maxLength: 50}
    string code?;
    # The current state of the item.
    string state?;
    # This name describes your item and will appear on the invoice when it's purchased on a one time basis.
    @constraint:String {maxLength: 255}
    string name?;
    # Optional, description.
    string description?;
    # Optional, stock keeping unit to link the item to other inventory systems.
    @constraint:String {maxLength: 50}
    string external_sku?;
    # Accounting code for invoice line items.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    string revenue_schedule_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the item, `false` applies tax on the item.
    boolean tax_exempt?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    Pricing[] currencies?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

public type AccountBalanceAmount record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Total amount the account is past due.
    float amount?;
};

public type CreditPayment record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The UUID is useful for matching data with the CSV exports and building URLs into Recurly's UI.
    @constraint:String {maxLength: 32}
    string uuid?;
    # The action for which the credit was created.
    string action?;
    AccountMini account?;
    InvoiceMini applied_to_invoice?;
    InvoiceMini original_invoice?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Total credit payment amount applied to the charge invoice.
    float amount?;
    # For credit payments with action `refund`, this is the credit payment that was refunded.
    @constraint:String {maxLength: 13}
    string original_credit_payment_id?;
    Transaction refund_transaction?;
    string created_at?;
    string updated_at?;
    string voided_at?;
};

public type TransactionPaymentGateway record {
    string id?;
    string 'object?;
    string 'type?;
    string name?;
};

public type TaxInfo record {
    # Provides the tax type as "vat" for EU VAT, "usst" for U.S. Sales Tax, or the 2 letter country code for country level tax types like Canada, Australia, New Zealand, Israel, and all non-EU European countries.
    string 'type?;
    # Provides the tax region applied on an invoice. For U.S. Sales Tax, this will be the 2 letter state code. For EU VAT this will be the 2 letter country code. For all country level tax types, this will display the regional tax, like VAT, GST, or PST.
    string region?;
    float rate?;
    # Provides additional tax details for Canadian Sales Tax when there is tax applied at both the country and province levels. This will only be populated for the Invoice response when fetching a single invoice and not for the InvoiceList or LineItem.
    TaxDetail[] tax_details?;
};

public type AddOnPricing record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    # Allows up to 2 decimal places. Required unless `unit_amount_decimal` is provided.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Allows up to 9 decimal places. Only supported when `add_on_type` = `usage`.
    # If `unit_amount_decimal` is provided, `unit_amount` cannot be provided.
    string unit_amount_decimal?;
};

public type ExportDates record {
    string 'object?;
    string[] dates?;
};

public type Subscription record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The UUID is useful for matching data with the CSV exports and building URLs into Recurly's UI.
    @constraint:String {maxLength: 32}
    string uuid?;
    AccountMini account?;
    # Just the important parts.
    PlanMini plan?;
    string state?;
    SubscriptionShipping shipping?;
    # Returns subscription level coupon redemptions that are tied to this subscription.
    CouponRedemptionMini[] coupon_redemptions?;
    SubscriptionChange pending_change?;
    string current_period_started_at?;
    string current_period_ends_at?;
    # The start date of the term when the first billing period starts. The subscription term is the length of time that a customer will be committed to a subscription. A term can span multiple billing periods.
    string current_term_started_at?;
    # When the term ends. This is calculated by a plan's interval and `total_billing_cycles` in a term. Subscription changes with a `timeframe=renewal` will be applied on this date.
    string current_term_ends_at?;
    string trial_started_at?;
    string trial_ends_at?;
    # The remaining billing cycles in the current term.
    int remaining_billing_cycles?;
    # The number of cycles/billing periods in a term. When `remaining_billing_cycles=0`, if `auto_renew=true` the subscription will renew and a new term will begin, otherwise the subscription will expire.
    int total_billing_cycles?;
    # If `auto_renew=true`, when a term completes, `total_billing_cycles` takes this value as the length of subsequent terms. Defaults to the plan's `total_billing_cycles`.
    int renewal_billing_cycles?;
    # Whether the subscription renews at the end of its term.
    boolean auto_renew?;
    # Null unless subscription is paused or will pause at the end of the current billing period.
    string paused_at?;
    # Null unless subscription is paused or will pause at the end of the current billing period.
    int remaining_pause_cycles?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    string revenue_schedule_type?;
    float unit_amount?;
    int quantity?;
    SubscriptionAddOn[] add_ons?;
    float add_ons_total?;
    float subtotal?;
    string collection_method?;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms?;
    string terms_and_conditions?;
    string customer_notes?;
    string expiration_reason?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    string created_at?;
    string updated_at?;
    string activated_at?;
    string canceled_at?;
    string expires_at?;
    # Recurring subscriptions paid with ACH will have this attribute set. This timestamp is used for alerting customers to reauthorize in 3 years in accordance with NACHA rules. If a subscription becomes inactive or the billing info is no longer a bank account, this timestamp is cleared.
    string bank_account_authorized_at?;
    # Billing Info ID.
    string billing_info_id?;
};

public type Settings record {
    # - full:      Full Address (Street, City, State, Postal Code and Country)
    # - streetzip: Street and Postal Code only
    # - zip:       Postal Code only
    # - none:      No Address
    string billing_address_requirement?;
    string[] accepted_currencies?;
    # The default 3-letter ISO 4217 currency code.
    string default_currency?;
};

public type CouponList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Coupon[] data?;
};

public type ShippingAddressCreate record {
    @constraint:String {maxLength: 255}
    string nickname?;
    @constraint:String {maxLength: 255}
    string first_name;
    @constraint:String {maxLength: 255}
    string last_name;
    @constraint:String {maxLength: 255}
    string company?;
    @constraint:String {maxLength: 255}
    string email?;
    @constraint:String {maxLength: 20}
    string vat_number?;
    @constraint:String {maxLength: 30}
    string phone?;
    @constraint:String {maxLength: 255}
    string street1;
    @constraint:String {maxLength: 255}
    string street2?;
    @constraint:String {maxLength: 255}
    string city;
    # State or province.
    @constraint:String {maxLength: 255}
    string region?;
    # Zip or postal code.
    @constraint:String {maxLength: 20}
    string postal_code;
    # Country, 2-letter ISO 3166-1 alpha-2 code.
    @constraint:String {maxLength: 50}
    string country;
};

public type Tier record {
    # Ending quantity for the tier.  This represents a unit amount for unit-priced add ons, but for percentage type usage add ons, represents the site default currency in its minimum divisible unit.
    @constraint:Int {minValue: 1, maxValue: 999999999}
    int ending_quantity?;
    # Decimal usage percentage.
    string usage_percentage?;
    @constraint:Array {minLength: 1}
    TierPricing[] currencies?;
};

# Indicates that the refund was settled outside of Recurly, and a manual transaction should be created to track it in Recurly.
# 
# Required when:
# - refunding a manually collected charge invoice, and `refund_method` is not `all_credit`
# - refunding a credit invoice that refunded manually collecting invoices
# - refunding a credit invoice for a partial amount
# 
# This field can only be included when the Credit Invoices feature is enabled.
public type InvoicerefundExternalRefund record {
    # Payment method used for external refund transaction.
    string payment_method;
    # Used as the refund transactions' description.
    @constraint:String {maxLength: 50}
    string description?;
    # Date the external refund payment was made. Defaults to the current date-time.
    string refunded_at?;
};

public type MeasuredUnit record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Unique internal name of the measured unit on your site.
    string name?;
    # Display name for the measured unit. Can only contain spaces, underscores and must be alphanumeric.
    @constraint:String {maxLength: 50}
    string display_name?;
    # The current state of the measured unit.
    string state?;
    # Optional internal description.
    string description?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

public type AccountPurchase record {
    # Optional, but if present allows an existing account to be used and updated as part of the purchase.
    @constraint:String {maxLength: 13}
    string id?;
    # The unique identifier of the account. This cannot be changed once the account is created.
    @constraint:String {maxLength: 50}
    string code;
    AccountAcquisitionUpdate acquisition?;
    *AccountUpdate;
};

public type ExportFiles record {
    string 'object?;
    ExportFile[] files?;
};

# This is only included on errors with `type=transaction`.
public type TransactionErrorDetails record {
    string 'object?;
    @constraint:String {maxLength: 13}
    string transaction_id?;
    string category?;
    string code?;
    string message?;
    string merchant_advice?;
    # Returned when 3-D Secure authentication is required for a transaction. Pass this value to Recurly.js so it can continue the challenge flow.
    @constraint:String {maxLength: 22}
    string three_d_secure_action_token_id?;
};

public type CouponRedemptionList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    CouponRedemption[] data?;
};

# Just the important parts.
public type ItemMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Unique code to identify the item.
    @constraint:String {maxLength: 50}
    string code?;
    # The current state of the item.
    string state?;
    # This name describes your item and will appear on the invoice when it's purchased on a one time basis.
    @constraint:String {maxLength: 255}
    string name?;
    # Optional, description.
    string description?;
};

public type UsageList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Usage[] data?;
};

public type MeasuredUnitList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    MeasuredUnit[] data?;
};

public type SubscriptionCancel record {
    # The timeframe parameter controls when the expiration takes place. The `bill_date` timeframe causes the subscription to expire when the subscription is scheduled to bill next. The `term_end` timeframe causes the subscription to continue to bill until the end of the subscription term, then expire.
    string timeframe?;
};

public type ExportFile record {
    # Name of the export file.
    string name?;
    # MD5 hash of the export file.
    string md5sum?;
    # A presigned link to download the export file.
    string href?;
};

public type SubscriptionShippingUpdate record {
    string 'object?;
    ShippingAddressCreate address?;
    # Assign a shipping address from the account's existing shipping addresses.
    @constraint:String {maxLength: 13}
    string address_id?;
};

# A purchase is only a request data type and is not persistent in Recurly, an InvoiceCollection will be the returned type.
public type PurchaseCreate record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    AccountPurchase account;
    # The `billing_info_id` is the value that represents a specific billing info for an end customer. When `billing_info_id` is used to assign billing info to the subscription, all future billing events for the subscription will bill to the specified billing info.
    string billing_info_id?;
    # Must be set to manual in order to preview a purchase for an Account that does not have payment information associated with the Billing Info.
    string collection_method = "automatic";
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms = 0;
    # Terms and conditions to be put on the purchase invoice.
    string terms_and_conditions?;
    string customer_notes?;
    # VAT reverse charge notes for cross border European tax settlement.
    string vat_reverse_charge_notes?;
    # Notes to be put on the credit invoice resulting from credits in the purchase, if any.
    string credit_customer_notes?;
    # The default payment gateway identifier to be used for the purchase transaction.  This will also be applied as the default for any subscriptions included in the purchase request.
    @constraint:String {maxLength: 13}
    string gateway_code?;
    PurchasecreateShipping shipping?;
    # A list of one time charges or credits to be created with the purchase.
    LineItemCreate[] line_items?;
    # A list of subscriptions to be created with the purchase.
    SubscriptionPurchase[] subscriptions?;
    # A list of coupon_codes to be redeemed on the subscription or account during the purchase.
    string[] coupon_codes?;
    # A gift card redemption code to be redeemed on the purchase invoice.
    string gift_card_redemption_code?;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
};

public type AccountUpdate record {
    # A secondary value for the account.
    @constraint:String {maxLength: 255}
    string username?;
    # The email address used for communicating with this customer. The customer will also use this email address to log into your hosted account management pages. This value does not need to be unique.
    string email?;
    # Used to determine the language and locale of emails sent on behalf of the merchant to the customer. The list of locales is restricted to those the merchant has enabled on the site.
    string preferred_locale?;
    # Additional email address that should receive account correspondence. These should be separated only by commas. These CC emails will receive all emails that the `email` field also receives.
    @constraint:String {maxLength: 255}
    string cc_emails?;
    @constraint:String {maxLength: 255}
    string first_name?;
    @constraint:String {maxLength: 255}
    string last_name?;
    @constraint:String {maxLength: 100}
    string company?;
    # The VAT number of the account (to avoid having the VAT applied). This is only used for manually collected invoices.
    @constraint:String {maxLength: 20}
    string vat_number?;
    # The tax status of the account. `true` exempts tax on the account, `false` applies tax on the account.
    boolean tax_exempt?;
    # The tax exemption certificate number for the account. If the merchant has an integration for the Vertex tax provider, this optional value will be sent in any tax calculation requests for the account.
    @constraint:String {maxLength: 30}
    string exemption_certificate?;
    # The account code of the parent account to be associated with this account. Passing an empty value removes any existing parent association from this account. If both `parent_account_code` and `parent_account_id` are passed, the non-blank value in `parent_account_id` will be used. Only one level of parent child relationship is allowed. You cannot assign a parent account that itself has a parent account.
    @constraint:String {maxLength: 50}
    string parent_account_code?;
    # The UUID of the parent account to be associated with this account. Passing an empty value removes any existing parent association from this account. If both `parent_account_code` and `parent_account_id` are passed, the non-blank value in `parent_account_id` will be used. Only one level of parent child relationship is allowed. You cannot assign a parent account that itself has a parent account.
    @constraint:String {maxLength: 13}
    string parent_account_id?;
    # An enumerable describing the billing behavior of the account, specifically whether the account is self-paying or will rely on the parent account to pay.
    @constraint:String {maxLength: 6}
    string bill_to?;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
    Address address?;
    BillingInfoCreate billing_info?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
};

public type SubscriptionPause record {
    # Number of billing cycles to pause the subscriptions. A value of 0 will cancel any pending pauses on the subscription.
    int remaining_pause_cycles;
};

public type AccountAcquisitionList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    AccountAcquisition[] data?;
};

public type AddressWithName Address;

public type LineItemRefund record {
    @constraint:String {maxLength: 13}
    string id?;
    # Line item quantity to be refunded.
    int quantity?;
    # Set to `true` if the line item should be prorated; set to `false` if not.
    # This can only be used on line items that have a start and end date.
    boolean prorate?;
};

public type TaxDetail record {
    # Provides the tax type for the region. For Canadian Sales Tax, this will be GST, HST, QST or PST.
    string 'type?;
    # Provides the tax region applied on an invoice. For Canadian Sales Tax, this will be either the 2 letter province code or country code.
    string region?;
    # Provides the tax rate for the region.
    float rate?;
    # The total tax applied for this tax type.
    float tax?;
};

public type Site record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    @constraint:String {maxLength: 100}
    string subdomain?;
    # This value is used to configure RecurlyJS to submit tokenized billing information.
    @constraint:String {maxLength: 50}
    string public_api_key?;
    @constraint:String {maxLength: 15}
    string mode?;
    Address address?;
    Settings settings?;
    # A list of features enabled for the site.
    string[] features?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

public type AccountAcquisitionReadOnly record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    AccountMini account?;
    # When the account acquisition data was created.
    string created_at?;
    # When the account acquisition data was last changed.
    string updated_at?;
};

public type SubscriptionChangeBillingInfoCreate SubscriptionChangeBillingInfo;

public type MeasuredUnitUpdate record {
    # Unique internal name of the measured unit on your site.
    @constraint:String {maxLength: 255}
    string name?;
    # Display name for the measured unit.
    @constraint:String {maxLength: 50}
    string display_name?;
    # Optional internal description.
    string description?;
};

public type AccountList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Account[] data?;
};

public type BillingInfo record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    @constraint:String {maxLength: 13}
    string account_id?;
    @constraint:String {maxLength: 50}
    string first_name?;
    @constraint:String {maxLength: 50}
    string last_name?;
    @constraint:String {maxLength: 100}
    string company?;
    Address address?;
    # Customer's VAT number (to avoid having the VAT applied). This is only used for automatically collected invoices.
    string vat_number?;
    boolean valid?;
    PaymentMethod payment_method?;
    # Most recent fraud result.
    FraudInformation fraud?;
    # The `primary_payment_method` field is used to indicate the primary billing info on the account. The first billing info created on an account will always become primary. This payment method will be used
    boolean primary_payment_method?;
    # The `backup_payment_method` field is used to indicate a billing info as a backup on the account that will be tried if the initial billing info used for an invoice is declined.
    boolean backup_payment_method?;
    # When the billing information was created.
    string created_at?;
    # When the billing information was last changed.
    string updated_at?;
    BillinginfoUpdatedBy updated_by?;
};

public type InvoiceList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Invoice[] data?;
};

# Accept nested attributes for three_d_secure_action_result_token_id
public type SubscriptionChangeBillingInfo record {
    # A token generated by Recurly.js after completing a 3-D Secure device fingerprinting or authentication challenge.
    @constraint:String {maxLength: 22}
    string three_d_secure_action_result_token_id?;
};

public type CouponCreate record {
    *CouponUpdate;
    # The code the customer enters to redeem the coupon.
    string code;
    # The type of discount provided by the coupon (how the amount discounted is calculated)
    string discount_type;
    # The percent of the price discounted by the coupon.  Required if `discount_type` is `percent`.
    int discount_percent?;
    # Description of the unit of time the coupon is for. Used with `free_trial_amount` to determine the duration of time the coupon is for.  Required if `discount_type` is `free_trial`.
    string free_trial_unit?;
    # Sets the duration of time the `free_trial_unit` is for. Required if `discount_type` is `free_trial`.
    @constraint:Int {minValue: 1, maxValue: 9999}
    int free_trial_amount?;
    # Fixed discount currencies by currency. Required if the coupon type is `fixed`. This parameter should contain the coupon discount values
    CouponPricing[] currencies?;
    # The coupon is valid for one-time, non-plan charges if true.
    boolean applies_to_non_plan_charges = false;
    # The coupon is valid for all plans if true. If false then `plans` will list the applicable plans.
    boolean applies_to_all_plans = true;
    # To apply coupon to Items in your Catalog, include a list
    # of `item_codes` in the request that the coupon will apply to. Or set value
    # to true to apply to all Items in your Catalog. The following values
    # are not permitted when `applies_to_all_items` is included: `free_trial_amount`
    # and `free_trial_unit`.
    boolean applies_to_all_items = false;
    # List of plan codes to which this coupon applies. Required
    # if `applies_to_all_plans` is false. Overrides `applies_to_all_plans`
    # when `applies_to_all_plans` is true.
    string[] plan_codes?;
    # List of item codes to which this coupon applies. Sending
    # `item_codes` is only permitted when `applies_to_all_items` is set to false.
    # The following values are not permitted when `item_codes` is included:
    # `free_trial_amount` and `free_trial_unit`.
    string[] item_codes?;
    # This field does not apply when the discount_type is `free_trial`.
    # - "single_use" coupons applies to the first invoice only.
    # - "temporal" coupons will apply to invoices for the duration determined by the `temporal_unit` and `temporal_amount` attributes.
    # - "forever" coupons will apply to invoices forever.
    string duration = "forever";
    # If `duration` is "temporal" than `temporal_amount` is an integer which is multiplied by `temporal_unit` to define the duration that the coupon will be applied to invoices for.
    int temporal_amount?;
    # If `duration` is "temporal" than `temporal_unit` is multiplied by `temporal_amount` to define the duration that the coupon will be applied to invoices for.
    string temporal_unit?;
    # Whether the coupon is "single_code" or "bulk". Bulk coupons will require a `unique_code_template` and will generate unique codes through the `/generate` endpoint.
    string coupon_type?;
    # On a bulk coupon, the template from which unique coupon codes are generated.
    # - You must start the template with your coupon_code wrapped in single quotes.
    # - Outside of single quotes, use a 9 for a character that you want to be a random number.
    # - Outside of single quotes, use an "x" for a character that you want to be a random letter.
    # - Outside of single quotes, use an * for a character that you want to be a random number or letter.
    # - Use single quotes ' ' for characters that you want to remain static. These strings can be alphanumeric and may contain a - _ or +.
    # For example: "'abc-'****'-def'"
    string unique_code_template?;
    # Whether the discount is for all eligible charges on the account, or only a specific subscription.
    string redemption_resource = "account";
};

public type AccountAcquisitionUpdate record {
    record {
        # 3-letter ISO 4217 currency code.
        @constraint:String {maxLength: 3}
        string currency?;
        # The amount of the corresponding currency used to acquire the account.
        float amount?;
    } cost?;
    # The channel through which the account was acquired.
    string channel?;
    # An arbitrary subchannel string representing a distinction/subcategory within a broader channel.
    string subchannel?;
    # An arbitrary identifier for the marketing campaign that led to the acquisition of this account.
    string campaign?;
};

public type InvoiceUpdate record {
    # This identifies the PO number associated with the invoice. Not editable for credit invoices.
    @constraint:String {maxLength: 50}
    string po_number?;
    # VAT Reverse Charge Notes are editable only if there was a VAT reverse charge applied to the invoice.
    string vat_reverse_charge_notes?;
    # Terms and conditions are an optional note field. Not editable for credit invoices.
    string terms_and_conditions?;
    # Customer notes are an optional note field.
    string customer_notes?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. Changing Net terms changes due_on, and the invoice could move between past due and pending.
    @constraint:Int {maxValue: 999}
    int net_terms?;
    InvoiceAddress address?;
};

public type Usage record {
    string id?;
    string 'object?;
    # Custom field for recording the id in your own system associated with the usage, so you can provide auditable usage displays to your customers using a GET on this endpoint.
    string merchant_tag?;
    # The amount of usage. Can be positive, negative, or 0. No decimals allowed, we will strip them. If the usage-based add-on is billed with a percentage, your usage will be a monetary amount you will want to format in cents. (e.g., $5.00 is "500").
    float amount?;
    # Type of usage, returns usage type if `add_on_type` is `usage`.
    string usage_type?;
    # The pricing model for the add-on.  For more information,
    # [click here](https://docs.recurly.com/docs/billing-models#section-quantity-based). See our
    # [Guide](https://developers.recurly.com/guides/item-addon-guide.html) for an overview of how
    # to configure quantity-based pricing models.
    string tier_type?;
    # The tiers and prices of the subscription based on the usage_timestamp. If tier_type = flat, tiers = null
    SubscriptionAddOnTier[] tiers?;
    # The ID of the measured unit associated with the add-on the usage record is for.
    string measured_unit_id?;
    # When the usage was recorded in your system.
    string recording_timestamp?;
    # When the usage actually happened. This will define the line item dates this usage is billed under and is important for revenue recognition.
    string usage_timestamp?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0.
    float usage_percentage?;
    float unit_amount?;
    # Unit price that can optionally support a sub-cent value.
    string unit_amount_decimal?;
    # When the usage record was billed on an invoice.
    string billed_at?;
    # When the usage record was created in Recurly.
    string created_at?;
    # When the usage record was billed on an invoice.
    string updated_at?;
};

# Full add-on details.
public type AddOnUpdate record {
    @constraint:String {maxLength: 13}
    string id?;
    # The unique identifier for the add-on within its plan. If an `Item` is associated to the `AddOn` then `code` must be absent.
    @constraint:String {maxLength: 50}
    string code?;
    # Describes your add-on and will appear in subscribers' invoices. If an `Item` is associated to the `AddOn` then `name` must be absent.
    @constraint:String {maxLength: 255}
    string name?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0. Required if `add_on_type` is usage, `tier_type` is `flat` and `usage_type` is percentage. Must be omitted otherwise.
    float usage_percentage?;
    # System-generated unique identifier for a measured unit to be associated with the add-on. Either `measured_unit_id` or `measured_unit_name` are required when `add_on_type` is `usage`. If `measured_unit_id` and `measured_unit_name` are both present, `measured_unit_id` will be used.
    @constraint:String {maxLength: 13}
    string measured_unit_id?;
    # Name of a measured unit to be associated with the add-on. Either `measured_unit_id` or `measured_unit_name` are required when `add_on_type` is `usage`. If `measured_unit_id` and `measured_unit_name` are both present, `measured_unit_id` will be used.
    string measured_unit_name?;
    # Accounting code for invoice line items for this add-on. If no value is provided, it defaults to add-on's code. If an `Item` is associated to the `AddOn` then `accounting code` must be absent.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # When this add-on is invoiced, the line item will use this revenue schedule. If `item_code`/`item_id` is part of the request then `revenue_schedule_type` must be absent in the request as the value will be set from the item.
    string revenue_schedule_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `AddOn`, then the `avalara_transaction_type` must be absent.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `AddOn`, then the `avalara_service_type` must be absent.
    int avalara_service_type?;
    # Optional field used by Avalara, Vertex, and Recurly's EU VAT tax feature to determine taxation rules. If you have your own AvaTax or Vertex account configured, use their tax codes to assign specific tax rules. If you are using Recurly's EU VAT feature, you can use values of `unknown`, `physical`, or `digital`. If an `Item` is associated to the `AddOn` then `tax code` must be absent.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # Determines if the quantity field is displayed on the hosted pages for the add-on.
    boolean display_quantity?;
    # Default quantity for the hosted pages.
    int default_quantity?;
    # Whether the add-on is optional for the customer to include in their purchase on the hosted payment page. If false, the add-on will be included when a subscription is created through the Recurly UI. However, the add-on will not be included when a subscription is created through the API.
    boolean optional?;
    # If the add-on's `tier_type` is `tiered`, `volume`, or `stairstep`,
    # then currencies must be absent. Must also be absent if `add_on_type` is
    # `usage` and `usage_type` is `percentage`.
    @constraint:Array {minLength: 1}
    AddOnPricing[] currencies?;
    # If the tier_type is `flat`, then `tiers` must be absent. The `tiers` object
    # must include one to many tiers with `ending_quantity` and `unit_amount` for
    # the desired `currencies`, or alternatively, `usage_percentage` for usage percentage type usage add ons. There must be one tier with an `ending_quantity`
    # of 999999999 which is the default if not provided.
    Tier[] tiers?;
};

public type SubscriptionPurchase record {
    string plan_code;
    @constraint:String {maxLength: 13}
    string plan_id?;
    # Override the unit amount of the subscription plan by setting this value. If not provided, the subscription will inherit the price from the subscription plan for the provided currency.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Optionally override the default quantity of 1.
    int quantity = 1;
    SubscriptionAddOnCreate[] add_ons?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    SubscriptionShippingPurchase shipping?;
    # If set, overrides the default trial behavior for the subscription. When the current date time or a past date time is provided the subscription will begin with no trial phase (overriding any plan default trial). When a future date time is provided the subscription will begin with a trial phase ending at the specified date time.
    string trial_ends_at?;
    # If set, the subscription will begin in the future on this date. The subscription will apply the setup fee and trial period, unless the plan has no trial.
    string starts_at?;
    # If present, this sets the date the subscription's next billing period will start (`current_period_ends_at`). This can be used to align the subscription’s billing to a specific day of the month. The initial invoice will be prorated for the period between the subscription's activation date and the billing period end date. Subsequent periods will be based off the plan interval. For a subscription with a trial period, this will change when the trial expires.
    string next_bill_date?;
    # The number of cycles/billing periods in a term. When `remaining_billing_cycles=0`, if `auto_renew=true` the subscription will renew and a new term will begin, otherwise the subscription will expire.
    @constraint:Int {minValue: 1}
    int total_billing_cycles?;
    # If `auto_renew=true`, when a term completes, `total_billing_cycles` takes this value as the length of subsequent terms. Defaults to the plan's `total_billing_cycles`.
    int renewal_billing_cycles?;
    # Whether the subscription renews at the end of its term.
    boolean auto_renew = true;
    string revenue_schedule_type?;
};

public type BinaryFile string;

public type CouponRedemptionMini record {
    string id?;
    # Will always be `coupon`.
    string 'object?;
    CouponMini coupon?;
    string state?;
    # The amount that was discounted upon the application of the coupon, formatted with the currency.
    float discounted?;
    string created_at?;
};

# Full plan details.
public type Plan record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Unique code to identify the plan. This is used in Hosted Payment Page URLs and in the invoice exports.
    @constraint:String {maxLength: 50}
    string code;
    # The current state of the plan.
    string state?;
    # This name describes your plan and will appear on the Hosted Payment Page and the subscriber's invoice.
    @constraint:String {maxLength: 255}
    string name;
    # Optional description, not displayed.
    string description?;
    # Unit for the plan's billing interval.
    string interval_unit = "months";
    # Length of the plan's billing interval in `interval_unit`.
    @constraint:Int {minValue: 1}
    int interval_length = 1;
    # Units for the plan's trial period.
    string trial_unit = "months";
    # Length of plan's trial period in `trial_units`. `0` means `no trial`.
    int trial_length = 0;
    # Allow free trial subscriptions to be created without billing info. Should not be used if billing info is needed for initial invoice due to existing uninvoiced charges or setup fee.
    boolean trial_requires_billing_info = true;
    # Automatically terminate subscriptions after a defined number of billing cycles. Number of billing cycles before the plan automatically stops renewing, defaults to `null` for continuous, automatic renewal.
    int total_billing_cycles?;
    # Subscriptions will automatically inherit this value once they are active. If `auto_renew` is `true`, then a subscription will automatically renew its term at renewal. If `auto_renew` is `false`, then a subscription will expire at the end of its term. `auto_renew` can be overridden on the subscription record itself.
    boolean auto_renew = true;
    string revenue_schedule_type?;
    string setup_fee_revenue_schedule_type?;
    # Accounting code for invoice line items for the plan. If no value is provided, it defaults to plan's code.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Accounting code for invoice line items for the plan's setup fee. If no value is provided, it defaults to plan's accounting code.
    @constraint:String {maxLength: 20}
    string setup_fee_accounting_code?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the plan, `false` applies tax on the plan.
    boolean tax_exempt?;
    @constraint:Array {minLength: 1}
    PlanPricing[] currencies?;
    PlanHostedPages hosted_pages?;
    # Used to determine whether items can be assigned as add-ons to individual subscriptions.
    # If `true`, items can be assigned as add-ons to individual subscription add-ons.
    # If `false`, only plan add-ons can be used.
    boolean allow_any_item_on_subscriptions?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

public type SubscriptionAddOnUpdate record {
    # When an id is provided, the existing subscription add-on attributes will
    # persist unless overridden in the request.
    @constraint:String {maxLength: 13}
    string id?;
    # If a code is provided without an id, the subscription add-on attributes
    # will be set to the current value for those attributes on the plan add-on
    # unless provided in the request. If `add_on_source` is set to `plan_add_on`
    # or left blank, then plan's add-on `code` should be used. If `add_on_source`
    # is set to `item`, then the `code` from the associated item should be used.
    @constraint:String {maxLength: 50}
    string code?;
    # Used to determine where the associated add-on data is pulled from. If this value is set to
    # `plan_add_on` or left blank, then add-on data will be pulled from the plan's add-ons. If the associated
    # `plan` has `allow_any_item_on_subscriptions` set to `true` and this field is set to `item`, then
    # the associated add-on data will be pulled from the site's item catalog.
    string add_on_source?;
    int quantity?;
    # Allows up to 2 decimal places. Optionally, override the add-on's default unit amount.
    # If the plan add-on's `tier_type` is `tiered`, `volume`, or `stairstep`, then `unit_amount` cannot be provided.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Allows up to 9 decimal places. Optionally, override the add-on's default unit amount.
    # If the plan add-on's `tier_type` is `tiered`, `volume`, or `stairstep`, then `unit_amount_decimal` cannot be provided.
    # Only supported when the plan add-on's `add_on_type` = `usage`.
    # If `unit_amount_decimal` is provided, `unit_amount` cannot be provided.
    string unit_amount_decimal?;
    # If the plan add-on's `tier_type` is `flat`, then `tiers` must be absent. The `tiers` object
    # must include one to many tiers with `ending_quantity` and `unit_amount`.
    # There must be one tier with an `ending_quantity` of 999999999 which is the
    # default if not provided.
    @constraint:Array {minLength: 1}
    SubscriptionAddOnTier[] tiers?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0. Required if add_on_type is usage and usage_type is percentage.
    float usage_percentage?;
    string revenue_schedule_type?;
};

# The shipping address can currently only be changed immediately, using SubscriptionUpdate.
public type SubscriptionChangeShippingCreate record {
    # The id of the shipping method used to deliver the subscription. To remove shipping set this to `null` and the `amount=0`. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 13}
    string method_id?;
    # The code of the shipping method used to deliver the subscription. To remove shipping set this to `null` and the `amount=0`. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 50}
    string method_code?;
    float amount?;
};

public type ItemList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Item[] data?;
};

public type CouponPricing record {
    # 3-letter ISO 4217 currency code.
    string currency?;
    # The fixed discount (in dollars) for the corresponding currency.
    float discount?;
};

# Just the important parts.
public type PlanMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Unique code to identify the plan. This is used in Hosted Payment Page URLs and in the invoice exports.
    @constraint:String {maxLength: 50}
    string code?;
    # This name describes your plan and will appear on the Hosted Payment Page and the subscriber's invoice.
    @constraint:String {maxLength: 255}
    string name?;
};

public type CouponRedemptionCreate record {
    string coupon_id;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    string subscription_id?;
};

public type SubscriptionList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Subscription[] data?;
};

public type InvoiceRefund record {
    # The type of refund. Amount and line items cannot both be specified in the request.
    string 'type;
    # The amount to be refunded. The amount will be split between the line items.
    # If no amount is specified, it will default to refunding the total refundable amount on the invoice.
    float amount?;
    # The line items to be refunded. This is required when `type=line_items`.
    LineItemRefund[] line_items?;
    # Indicates how the invoice should be refunded when both a credit and transaction are present on the invoice:
    # - `transaction_first` – Refunds the transaction first, then any amount is issued as credit back to the account. Default value when Credit Invoices feature is enabled.
    # - `credit_first` – Issues credit back to the account first, then refunds any remaining amount back to the transaction. Default value when Credit Invoices feature is not enabled.
    # - `all_credit` – Issues credit to the account for the entire amount of the refund. Only available when the Credit Invoices feature is enabled.
    # - `all_transaction` – Refunds the entire amount back to transactions, using transactions from previous invoices if necessary. Only available when the Credit Invoices feature is enabled.
    string refund_method = "credit_first";
    # Used as the Customer Notes on the credit invoice.
    # 
    # This field can only be include when the Credit Invoices feature is enabled.
    string credit_customer_notes?;
    # Indicates that the refund was settled outside of Recurly, and a manual transaction should be created to track it in Recurly.
    # 
    # Required when:
    # - refunding a manually collected charge invoice, and `refund_method` is not `all_credit`
    # - refunding a credit invoice that refunded manually collecting invoices
    # - refunding a credit invoice for a partial amount
    # 
    # This field can only be included when the Credit Invoices feature is enabled.
    InvoicerefundExternalRefund external_refund?;
};

public type PlanCreate record {
    # Unique code to identify the plan. This is used in Hosted Payment Page URLs and in the invoice exports.
    @constraint:String {maxLength: 50}
    string code;
    # This name describes your plan and will appear on the Hosted Payment Page and the subscriber's invoice.
    @constraint:String {maxLength: 255}
    string name;
    # Optional description, not displayed.
    string description?;
    # Accounting code for invoice line items for the plan. If no value is provided, it defaults to plan's code.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Unit for the plan's billing interval.
    string interval_unit = "months";
    # Length of the plan's billing interval in `interval_unit`.
    @constraint:Int {minValue: 1}
    int interval_length = 1;
    # Units for the plan's trial period.
    string trial_unit = "months";
    # Length of plan's trial period in `trial_units`. `0` means `no trial`.
    int trial_length = 0;
    # Allow free trial subscriptions to be created without billing info. Should not be used if billing info is needed for initial invoice due to existing uninvoiced charges or setup fee.
    boolean trial_requires_billing_info = true;
    # Automatically terminate plans after a defined number of billing cycles.
    int total_billing_cycles?;
    # Subscriptions will automatically inherit this value once they are active. If `auto_renew` is `true`, then a subscription will automatically renew its term at renewal. If `auto_renew` is `false`, then a subscription will expire at the end of its term. `auto_renew` can be overridden on the subscription record itself.
    boolean auto_renew = true;
    string revenue_schedule_type?;
    string setup_fee_revenue_schedule_type?;
    # Accounting code for invoice line items for the plan's setup fee. If no value is provided, it defaults to plan's accounting code.
    @constraint:String {maxLength: 20}
    string setup_fee_accounting_code?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the plan is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Optional field used by Avalara, Vertex, and Recurly's EU VAT tax feature to determine taxation rules. If you have your own AvaTax or Vertex account configured, use their tax codes to assign specific tax rules. If you are using Recurly's EU VAT feature, you can use values of `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the plan, `false` applies tax on the plan.
    boolean tax_exempt?;
    @constraint:Array {minLength: 1}
    PlanPricing[] currencies;
    PlanHostedPages hosted_pages?;
    AddOnCreate[] add_ons?;
    # Used to determine whether items can be assigned as add-ons to individual subscriptions.
    # If `true`, items can be assigned as add-ons to individual subscription add-ons.
    # If `false`, only plan add-ons can be used.
    boolean allow_any_item_on_subscriptions = false;
};

public type ShippingMethodList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    ShippingMethod[] data?;
};

public type ShippingFeeCreate record {
    # The id of the shipping method used to deliver the purchase. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 13}
    string method_id?;
    # The code of the shipping method used to deliver the purchase. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 50}
    string method_code?;
    # This is priced in the purchase's currency.
    float amount?;
};

public type ShippingMethod record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The internal name used identify the shipping method.
    @constraint:String {maxLength: 50}
    string code?;
    # The name of the shipping method displayed to customers.
    @constraint:String {maxLength: 100}
    string name?;
    # Accounting code for shipping method.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Used by Avalara, Vertex, and Recurly’s built-in tax feature. The tax
    # code values are specific to each tax system. If you are using Recurly’s
    # built-in taxes the values are:
    # 
    # - `FR` – Common Carrier FOB Destination
    # - `FR022000` – Common Carrier FOB Origin
    # - `FR020400` – Non Common Carrier FOB Destination
    # - `FR020500` – Non Common Carrier FOB Origin
    # - `FR010100` – Delivery by Company Vehicle Before Passage of Title
    # - `FR010200` – Delivery by Company Vehicle After Passage of Title
    # - `NT` – Non-Taxable
    @constraint:String {maxLength: 50}
    string tax_code?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

# Full add-on details.
public type AddOn record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    @constraint:String {maxLength: 13}
    string plan_id?;
    # The unique identifier for the add-on within its plan.
    @constraint:String {maxLength: 50}
    string code;
    # Add-ons can be either active or inactive.
    string state?;
    # Describes your add-on and will appear in subscribers' invoices.
    @constraint:String {maxLength: 255}
    string name;
    # Whether the add-on type is fixed, or usage-based.
    string add_on_type?;
    # Type of usage, returns usage type if `add_on_type` is `usage`.
    string usage_type?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0.
    float usage_percentage?;
    # System-generated unique identifier for an measured unit associated with the add-on.
    @constraint:String {maxLength: 13}
    string measured_unit_id?;
    # Accounting code for invoice line items for this add-on. If no value is provided, it defaults to add-on's code.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # When this add-on is invoiced, the line item will use this revenue schedule. If `item_code`/`item_id` is part of the request then `revenue_schedule_type` must be absent in the request as the value will be set from the item.
    string revenue_schedule_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # Determines if the quantity field is displayed on the hosted pages for the add-on.
    boolean display_quantity = false;
    # Default quantity for the hosted pages.
    int default_quantity = 1;
    # Whether the add-on is optional for the customer to include in their purchase on the hosted payment page. If false, the add-on will be included when a subscription is created through the Recurly UI. However, the add-on will not be included when a subscription is created through the API.
    boolean optional?;
    @constraint:Array {minLength: 1}
    AddOnPricing[] currencies?;
    # Just the important parts.
    ItemMini item?;
    # The pricing model for the add-on.  For more information,
    # [click here](https://docs.recurly.com/docs/billing-models#section-quantity-based). See our
    # [Guide](https://developers.recurly.com/guides/item-addon-guide.html) for an overview of how
    # to configure quantity-based pricing models.
    string tier_type = "flat";
    Tier[] tiers?;
    # Optional, stock keeping unit to link the item to other inventory systems.
    @constraint:String {maxLength: 50}
    string external_sku?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
};

public type BillingInfoCreate record {
    # A token [generated by Recurly.js](https://developers.recurly.com/reference/recurly-js/#getting-a-token).
    @constraint:String {maxLength: 22}
    string token_id?;
    @constraint:String {maxLength: 50}
    string first_name?;
    @constraint:String {maxLength: 50}
    string last_name?;
    @constraint:String {maxLength: 100}
    string company?;
    Address address?;
    # Credit card number, spaces and dashes are accepted.
    string number?;
    @constraint:String {maxLength: 2}
    string month?;
    @constraint:String {maxLength: 4}
    string year?;
    # *STRONGLY RECOMMENDED*
    @constraint:String {maxLength: 4}
    string cvv?;
    string vat_number?;
    # *STRONGLY RECOMMENDED* Customer's IP address when updating their billing information.
    @constraint:String {maxLength: 20}
    string ip_address?;
    @constraint:String {maxLength: 50}
    string gateway_token?;
    @constraint:String {maxLength: 12}
    string gateway_code?;
    string amazon_billing_agreement_id?;
    string paypal_billing_agreement_id?;
    string fraud_session_id?;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
    # A token generated by Recurly.js after completing a 3-D Secure device fingerprinting or authentication challenge.
    @constraint:String {maxLength: 22}
    string three_d_secure_action_result_token_id?;
    # The International Bank Account Number, up to 34 alphanumeric characters comprising a country code; two check digits; and a number that includes the domestic bank account number, branch identifier, and potential routing information
    @constraint:String {maxLength: 34}
    string iban?;
    # Tax identifier is required if adding a billing info that is a consumer card in Brazil or in Argentina. This would be the customer's CPF (Brazil) and CUIT (Argentina). CPF and CUIT are tax identifiers for all residents who pay taxes in Brazil and Argentina respectively.
    string tax_identifier?;
    # This field and a value of `cpf` or `cuit` are required if adding a billing info that is an elo or hipercard type in Brazil or in Argentina.
    string tax_identifier_type?;
    # The `primary_payment_method` field is used to designate the primary billing info on the account. The first billing info created on an account will always become primary. Adding additional billing infos provides the flexibility to mark another billing info as primary, or adding additional non-primary billing infos. This can be accomplished by passing the `primary_payment_method` with a value of `true`. When adding billing infos via the billing_info and /accounts endpoints, this value is not permitted, and will return an error if provided.
    boolean primary_payment_method?;
    # The `backup_payment_method` field is used to designate a billing info as a backup on the account that will be tried if the initial billing info used for an invoice is declined. All payment methods, including the billing info marked `primary_payment_method` can be set as a backup. An account can have a maximum of 1 backup, if a user sets a different payment method as a backup, the existing backup will no longer be marked as such.
    boolean backup_payment_method?;
};

public type SubscriptionShipping record {
    string 'object?;
    ShippingAddress address?;
    ShippingMethodMini method?;
    float amount?;
};

public type CreditPaymentList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    CreditPayment[] data?;
};

public type ExternalTransaction record {
    # Payment method used for external transaction.
    string payment_method?;
    # Used as the transaction's description.
    @constraint:String {maxLength: 50}
    string description?;
    # The total amount of the transcaction. Cannot excceed the invoice total.
    float amount?;
    # Datetime that the external payment was collected. Defaults to current datetime.
    string collected_at?;
};

public type ErrorParams record {
    string param?;
};

public type AccountNoteList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    AccountNote[] data?;
};

public type TierPricing record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    # Allows up to 2 decimal places. Required unless `unit_amount_decimal` is provided.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Allows up to 9 decimal places. Only supported when `add_on_type` = `usage`.
    # If `unit_amount_decimal` is provided, `unit_amount` cannot be provided.
    string unit_amount_decimal?;
};

public type InvoiceCollect record {
    # A token generated by Recurly.js after completing a 3-D Secure device fingerprinting or authentication challenge.
    @constraint:String {maxLength: 22}
    string three_d_secure_action_result_token_id?;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
    # The `billing_info_id` is the value that represents a specific billing info for an end customer. When `billing_info_id` is used to assign billing info to the subscription, all future billing events for the subscription will bill to the specified billing info.
    string billing_info_id?;
};

public type SubscriptionCreate record {
    # You must provide either a `plan_code` or `plan_id`. If both are provided the `plan_id` will be used.
    @constraint:String {maxLength: 50}
    string plan_code;
    # You must provide either a `plan_code` or `plan_id`. If both are provided the `plan_id` will be used.
    @constraint:String {maxLength: 13}
    string plan_id?;
    AccountCreate account;
    # The `billing_info_id` is the value that represents a specific billing info for an end customer. When `billing_info_id` is used to assign billing info to the subscription, all future billing events for the subscription will bill to the specified billing info.
    string billing_info_id?;
    SubscriptionShippingCreate shipping?;
    string collection_method = "automatic";
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    # Override the unit amount of the subscription plan by setting this value. If not provided, the subscription will inherit the price from the subscription plan for the provided currency.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Optionally override the default quantity of 1.
    int quantity = 1;
    SubscriptionAddOnCreate[] add_ons?;
    # A list of coupon_codes to be redeemed on the subscription or account during the purchase.
    string[] coupon_codes?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    # If set, overrides the default trial behavior for the subscription. When the current date time or a past date time is provided the subscription will begin with no trial phase (overriding any plan default trial). When a future date time is provided the subscription will begin with a trial phase ending at the specified date time.
    string trial_ends_at?;
    # If set, the subscription will begin in the future on this date. The subscription will apply the setup fee and trial period, unless the plan has no trial.
    string starts_at?;
    # If present, this sets the date the subscription's next billing period will start (`current_period_ends_at`). This can be used to align the subscription’s billing to a specific day of the month. The initial invoice will be prorated for the period between the subscription's activation date and the billing period end date. Subsequent periods will be based off the plan interval. For a subscription with a trial period, this will change when the trial expires.
    string next_bill_date?;
    # The number of cycles/billing periods in a term. When `remaining_billing_cycles=0`, if `auto_renew=true` the subscription will renew and a new term will begin, otherwise the subscription will expire.
    @constraint:Int {minValue: 1}
    int total_billing_cycles?;
    # If `auto_renew=true`, when a term completes, `total_billing_cycles` takes this value as the length of subsequent terms. Defaults to the plan's `total_billing_cycles`.
    int renewal_billing_cycles?;
    # Whether the subscription renews at the end of its term.
    boolean auto_renew = true;
    string revenue_schedule_type?;
    # This will default to the Terms and Conditions text specified on the Invoice Settings page in your Recurly admin. Specify custom notes to add or override Terms and Conditions. Custom notes will stay with a subscription on all renewals.
    string terms_and_conditions?;
    # This will default to the Customer Notes text specified on the Invoice Settings. Specify custom notes to add or override Customer Notes. Custom notes will stay with a subscription on all renewals.
    string customer_notes?;
    # If there are pending credits on the account that will be invoiced during the subscription creation, these will be used as the Customer Notes on the credit invoice.
    string credit_customer_notes?;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms = 0;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
};

public type ItemCreate record {
    # Unique code to identify the item.
    @constraint:String {maxLength: 50}
    string code;
    # This name describes your item and will appear on the invoice when it's purchased on a one time basis.
    @constraint:String {maxLength: 255}
    string name;
    # Optional, description.
    string description?;
    # Optional, stock keeping unit to link the item to other inventory systems.
    @constraint:String {maxLength: 50}
    string external_sku?;
    # Accounting code for invoice line items.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    string revenue_schedule_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the item, `false` applies tax on the item.
    boolean tax_exempt?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    Pricing[] currencies?;
};

public type InvoiceCollection record {
    string 'object?;
    Invoice charge_invoice?;
    Invoice[] credit_invoices?;
};

public type SubscriptionShippingPurchase record {
    # The id of the shipping method used to deliver the subscription. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 13}
    string method_id?;
    # The code of the shipping method used to deliver the subscription. If `method_id` and `method_code` are both present, `method_id` will be used.
    @constraint:String {maxLength: 50}
    string method_code?;
    float amount?;
};

public type AccountNote record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    string account_id?;
    User user?;
    string message;
    string created_at?;
};

public type CouponMini record {
    string id?;
    string 'object?;
    # The code the customer enters to redeem the coupon.
    string code?;
    # The internal name for the coupon.
    string name?;
    # Indicates if the coupon is redeemable, and if it is not, why.
    string state?;
    # Details of the discount a coupon applies. Will contain a `type`
    # property and one of the following properties: `percent`, `fixed`, `trial`.
    CouponDiscount discount?;
    # Whether the coupon is "single_code" or "bulk". Bulk coupons will require a `unique_code_template` and will generate unique codes through the `/generate` endpoint.
    string coupon_type?;
    # The date and time the coupon was expired early or reached its `max_redemptions`.
    string expired_at?;
};

public type LineItemList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    LineItem[] data?;
};

public type BillinginfoUpdatedBy record {
    # Customer's IP address when updating their billing information.
    @constraint:String {maxLength: 20}
    string ip?;
    # Country, 2-letter ISO 3166-1 alpha-2 code matching the origin IP address, if known by Recurly.
    @constraint:String {maxLength: 2}
    string country?;
};

# This links an Add-on to a specific Subscription.
public type SubscriptionAddOn record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    @constraint:String {maxLength: 13}
    string subscription_id?;
    # Just the important parts.
    AddOnMini add_on?;
    # Used to determine where the associated add-on data is pulled from. If this value is set to
    # `plan_add_on` or left blank, then add-on data will be pulled from the plan's add-ons. If the associated
    # `plan` has `allow_any_item_on_subscriptions` set to `true` and this field is set to `item`, then
    # the associated add-on data will be pulled from the site's item catalog.
    string add_on_source?;
    int quantity?;
    # Supports up to 2 decimal places.
    float unit_amount?;
    # Supports up to 9 decimal places.
    string unit_amount_decimal?;
    string revenue_schedule_type?;
    # The pricing model for the add-on.  For more information,
    # [click here](https://docs.recurly.com/docs/billing-models#section-quantity-based). See our
    # [Guide](https://developers.recurly.com/guides/item-addon-guide.html) for an overview of how
    # to configure quantity-based pricing models.
    string tier_type?;
    # If tiers are provided in the request, all existing tiers on the Subscription Add-on will be
    # removed and replaced by the tiers in the request.
    @constraint:Array {minLength: 1}
    SubscriptionAddOnTier[] tiers?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0. Required if add_on_type is usage and usage_type is percentage.
    float usage_percentage?;
    string created_at?;
    string updated_at?;
    string expired_at?;
};

public type SubscriptionAddOnTier record {
    @constraint:Int {minValue: 1, maxValue: 999999999}
    int ending_quantity?;
    # Allows up to 2 decimal places. Optionally, override the tiers' default unit amount. If add-on's `add_on_type` is `usage` and `usage_type` is `percentage`, cannot be provided.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Allows up to 9 decimal places.  Optionally, override tiers' default unit amount.
    # If `unit_amount_decimal` is provided, `unit_amount` cannot be provided.
    # If add-on's `add_on_type` is `usage` and `usage_type` is `percentage`, cannot be provided.
    string unit_amount_decimal?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places represented as a string. A value between 0.0 and 100.0. Optionally, override tiers' default usage percentage. Required if add-on's `add_on_type` is `usage` and `usage_type` is `percentage`. Must be omitted otherwise.
    string usage_percentage?;
};

public type ShippingMethodUpdate record {
    # The internal name used identify the shipping method.
    @constraint:String {maxLength: 50}
    string code?;
    # The name of the shipping method displayed to customers.
    @constraint:String {maxLength: 100}
    string name?;
    # Accounting code for shipping method.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Used by Avalara, Vertex, and Recurly’s built-in tax feature. The tax
    # code values are specific to each tax system. If you are using Recurly’s
    # built-in taxes the values are:
    # 
    # - `FR` – Common Carrier FOB Destination
    # - `FR022000` – Common Carrier FOB Origin
    # - `FR020400` – Non Common Carrier FOB Destination
    # - `FR020500` – Non Common Carrier FOB Origin
    # - `FR010100` – Delivery by Company Vehicle Before Passage of Title
    # - `FR010200` – Delivery by Company Vehicle After Passage of Title
    # - `NT` – Non-Taxable
    @constraint:String {maxLength: 50}
    string tax_code?;
};

public type PlanHostedPages record {
    # URL to redirect to after signup on the hosted payment pages.
    string success_url?;
    # URL to redirect to on canceled signup on the hosted payment pages.
    string cancel_url?;
    # If `true`, the customer will be sent directly to your `success_url` after a successful signup, bypassing Recurly's hosted confirmation page.
    boolean bypass_confirmation?;
    # Determines if the quantity field is displayed on the hosted pages for the plan.
    boolean display_quantity?;
};

public type PlanPricing record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Amount of one-time setup fee automatically charged at the beginning of a subscription billing cycle. For subscription plans with a trial, the setup fee will be charged at the time of signup. Setup fees do not increase with the quantity of a subscription plan.
    @constraint:Float {maxValue: 1000000}
    float setup_fee?;
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
};

public type TransactionList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Transaction[] data?;
};

public type CustomFieldDefinition record {
    string id?;
    string 'object?;
    string related_type?;
    # Used by the API to identify the field or reading and writing. The name can only be used once per Recurly object type.
    @constraint:String {maxLength: 50}
    string name?;
    # The access control applied inside Recurly's admin UI:
    # - `api_only` - No one will be able to view or edit this field's data via the admin UI.
    # - `read_only` - Users with the Customers role will be able to view this field's data via the admin UI, but
    #   editing will only be available via the API.
    # - `write` - Users with the Customers role will be able to view and edit this field's data via the admin UI.
    string user_access?;
    # Used to label the field when viewing and editing the field in Recurly's admin UI.
    @constraint:String {maxLength: 50}
    string display_name?;
    # Displayed as a tooltip when editing the field in the Recurly admin UI.
    @constraint:String {maxLength: 255}
    string tooltip?;
    string created_at?;
    string updated_at?;
    # Definitions are initially soft deleted, and once all the values are removed from the accouts or subscriptions, will be hard deleted an no longer visible.
    string deleted_at?;
};

public type PlanList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Plan[] data?;
};

public type SiteList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    Site[] data?;
};

public type ShippingMethodMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The internal name used identify the shipping method.
    @constraint:String {maxLength: 50}
    string code?;
    # The name of the shipping method displayed to customers.
    @constraint:String {maxLength: 100}
    string name?;
};

public type UniqueCouponCodeList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    UniqueCouponCode[] data?;
};

public type ErrorMayHaveTransaction record {
    *Error;
    # This is only included on errors with `type=transaction`.
    TransactionErrorDetails transaction_error?;
};

public type CouponUpdate record {
    # The internal name for the coupon.
    string name?;
    # A maximum number of redemptions for the coupon. The coupon will expire when it hits its maximum redemptions.
    int max_redemptions?;
    # Redemptions per account is the number of times a specific account can redeem the coupon. Set redemptions per account to `1` if you want to keep customers from gaming the system and getting more than one discount from the coupon campaign.
    int max_redemptions_per_account?;
    # This description will show up when a customer redeems a coupon on your Hosted Payment Pages, or if you choose to show the description on your own checkout page.
    string hosted_description?;
    # Description of the coupon on the invoice.
    @constraint:String {maxLength: 255}
    string invoice_description?;
    # The date and time the coupon will expire and can no longer be redeemed. Time is always 11:59:59, the end-of-day Pacific time.
    string redeem_by_date?;
};

# The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
public type CustomFields CustomField[];

public type SubscriptionChangeCreate record {
    # The timeframe parameter controls when the upgrade or downgrade takes place. The subscription change can occur now, when the subscription is next billed, or when the subscription term ends. Generally, if you're performing an upgrade, you will want the change to occur immediately (now). If you're performing a downgrade, you should set the timeframe to `term_end` or `bill_date` so the change takes effect at a scheduled billing date. The `renewal` timeframe option is accepted as an alias for `term_end`.
    string timeframe?;
    # If you want to change to a new plan, you can provide the plan's code or id. If both are provided the `plan_id` will be used.
    @constraint:String {maxLength: 13}
    string plan_id?;
    # If you want to change to a new plan, you can provide the plan's code or id. If both are provided the `plan_id` will be used.
    @constraint:String {maxLength: 50}
    string plan_code?;
    # Optionally, sets custom pricing for the subscription, overriding the plan's default unit amount. The subscription's current currency will be used.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Optionally override the default quantity of 1.
    int quantity?;
    # The shipping address can currently only be changed immediately, using SubscriptionUpdate.
    SubscriptionChangeShippingCreate shipping?;
    # A list of coupon_codes to be redeemed on the subscription during the change. Only allowed if timeframe is now and you change something about the subscription that creates an invoice.
    string[] coupon_codes?;
    # If you provide a value for this field it will replace any
    # existing add-ons. So, when adding or modifying an add-on, you need to
    # include the existing subscription add-ons. Unchanged add-ons can be included
    # just using the subscription add-on''s ID: `{"id": "abc123"}`. If this
    # value is omitted your existing add-ons will be unaffected. To remove all
    # existing add-ons, this value should be an empty array.'
    # 
    # If a subscription add-on's `code` is supplied without the `id`,
    # `{"code": "def456"}`, the subscription add-on attributes will be set to the
    # current values of the plan add-on unless provided in the request.
    # 
    # - If an `id` is passed, any attributes not passed in will pull from the
    #   existing subscription add-on
    # - If a `code` is passed, any attributes not passed in will pull from the
    #   current values of the plan add-on
    # - Attributes passed in as part of the request will override either of the
    #   above scenarios
    SubscriptionAddOnUpdate[] add_ons?;
    string collection_method?;
    string revenue_schedule_type?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms?;
    # An optional type designation for the payment gateway transaction created by this request. Supports 'moto' value, which is the acronym for mail order and telephone transactions.
    string transaction_type?;
    SubscriptionChangeBillingInfoCreate billing_info?;
};

public type PurchasecreateShipping record {
    # Assign a shipping address from the account's existing shipping addresses. If this and `address` are both present, `address` will take precedence.
    @constraint:String {maxLength: 13}
    string address_id?;
    ShippingAddressCreate address?;
    # A list of shipping fees to be created as charges with the purchase.
    ShippingFeeCreate[] fees?;
};

public type Transaction record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The UUID is useful for matching data with the CSV exports and building URLs into Recurly's UI.
    @constraint:String {maxLength: 32}
    string uuid?;
    # If this transaction is a refund (`type=refund`), this will be the ID of the original transaction on the invoice being refunded.
    @constraint:String {maxLength: 13}
    string original_transaction_id?;
    AccountMini account?;
    InvoiceMini invoice?;
    InvoiceMini voided_by_invoice?;
    # If the transaction is charging or refunding for one or more subscriptions, these are their IDs.
    TransactionSubscriptionidsItemsString[] subscription_ids?;
    # - `authorization` – verifies billing information and places a hold on money in the customer's account.
    # - `capture` – captures funds held by an authorization and completes a purchase.
    # - `purchase` – combines the authorization and capture in one transaction.
    # - `refund` – returns all or a portion of the money collected in a previous transaction to the customer.
    # - `verify` – a $0 or $1 transaction used to verify billing information which is immediately voided.
    string 'type?;
    # Describes how the transaction was triggered.
    string origin?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Total transaction amount sent to the payment gateway.
    float amount?;
    # The current transaction status. Note that the status may change, e.g. a `pending` transaction may become `declined` or `success` may later become `void`.
    string status?;
    # Did this transaction complete successfully?
    boolean success?;
    # Indicates if the transaction was completed using a backup payment
    boolean backup_payment_method_used?;
    # Indicates if part or all of this transaction was refunded.
    boolean refunded?;
    AddressWithName billing_address?;
    # The method by which the payment was collected.
    string collection_method?;
    PaymentMethod payment_method?;
    # IP address provided when the billing information was collected:
    # 
    # - When the customer enters billing information into the Recurly.js or Hosted Payment Pages, Recurly records the IP address.
    # - When the merchant enters billing information using the API, the merchant may provide an IP address.
    # - When the merchant enters billing information using the UI, no IP address is recorded.
    string ip_address_v4?;
    string ip_address_country?;
    string status_code?;
    # For declined (`success=false`) transactions, the message displayed to the merchant.
    string status_message?;
    # For declined (`success=false`) transactions, the message displayed to the customer.
    string customer_message?;
    string customer_message_locale?;
    TransactionPaymentGateway payment_gateway?;
    # Transaction message from the payment gateway.
    string gateway_message?;
    # Transaction reference number from the payment gateway.
    string gateway_reference?;
    string gateway_approval_code?;
    string gateway_response_code?;
    # Time, in seconds, for gateway to process the transaction.
    float gateway_response_time?;
    # The values in this field will vary from gateway to gateway.
    record {} gateway_response_values?;
    # When processed, result from checking the CVV/CVC value on the transaction.
    string cvv_check?;
    # When processed, result from checking the overall AVS on the transaction.
    string avs_check?;
    string created_at?;
    string updated_at?;
    string voided_at?;
    string collected_at?;
};

public type PaymentMethod record {
    string 'object?;
    # Visa, MasterCard, American Express, Discover, JCB, etc.
    string card_type?;
    # Credit card number's first six digits.
    @constraint:String {maxLength: 6}
    string first_six?;
    # Credit card number's last four digits. Will refer to bank account if payment method is ACH.
    @constraint:String {maxLength: 4}
    string last_four?;
    # The IBAN bank account's last two digits.
    @constraint:String {maxLength: 2}
    string last_two?;
    # Expiration month.
    int exp_month?;
    # Expiration year.
    int exp_year?;
    # A token used in place of a credit card in order to perform transactions.
    @constraint:String {maxLength: 50}
    string gateway_token?;
    # The 2-letter ISO 3166-1 alpha-2 country code associated with the credit card BIN, if known by Recurly. Available on the BillingInfo object only. Available when the BIN country lookup feature is enabled.
    string cc_bin_country?;
    # An identifier for a specific payment gateway.
    @constraint:String {maxLength: 13}
    string gateway_code?;
    # Billing Agreement identifier. Only present for Amazon or Paypal payment methods.
    string billing_agreement_id?;
    # The name associated with the bank account.
    string name_on_account?;
    # The bank account type. Only present for ACH payment methods.
    string account_type?;
    # The bank account's routing number. Only present for ACH payment methods.
    string routing_number?;
    # The bank name of this routing number.
    string routing_number_bank?;
};

public type AddOnList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    AddOn[] data?;
};

public type AccountResponse record {
    # The unique identifier of the account. This cannot be changed once the account is created.
    @constraint:String {maxLength: 50}
    string code?;
    # A secondary value for the account.
    @constraint:String {maxLength: 255}
    string username?;
    # The email address used for communicating with this customer. The customer will also use this email address to log into your hosted account management pages. This value does not need to be unique.
    string email?;
    # Used to determine the language and locale of emails sent on behalf of the merchant to the customer.
    string preferred_locale?;
    # Additional email address that should receive account correspondence. These should be separated only by commas. These CC emails will receive all emails that the `email` field also receives.
    @constraint:String {maxLength: 255}
    string cc_emails?;
    @constraint:String {maxLength: 255}
    string first_name?;
    @constraint:String {maxLength: 255}
    string last_name?;
    @constraint:String {maxLength: 50}
    string company?;
    # The VAT number of the account (to avoid having the VAT applied). This is only used for manually collected invoices.
    @constraint:String {maxLength: 20}
    string vat_number?;
    # The tax status of the account. `true` exempts tax on the account, `false` applies tax on the account.
    boolean tax_exempt?;
    # The tax exemption certificate number for the account. If the merchant has an integration for the Vertex tax provider, this optional value will be sent in any tax calculation requests for the account.
    @constraint:String {maxLength: 30}
    string exemption_certificate?;
    # The UUID of the parent account associated with this account.
    @constraint:String {maxLength: 13}
    string parent_account_id?;
    # An enumerable describing the billing behavior of the account, specifically whether the account is self-paying or will rely on the parent account to pay.
    @constraint:String {maxLength: 6}
    string bill_to?;
    Address address?;
    BillingInfo billing_info?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
};

public type CouponDiscountPricing record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # Value of the fixed discount that this coupon applies.
    float amount?;
};

public type BillingInfoVerify record {
    # An identifier for a specific payment gateway.
    @constraint:String {maxLength: 13}
    string gateway_code?;
};

public type User record {
    string id?;
    string 'object?;
    string email?;
    string first_name?;
    string last_name?;
    string time_zone?;
    string created_at?;
    string deleted_at?;
};

public type SubscriptionChange record {
    # The ID of the Subscription Change.
    string id?;
    string 'object?;
    # The ID of the subscription that is going to be changed.
    @constraint:String {maxLength: 13}
    string subscription_id?;
    # Just the important parts.
    PlanMini plan?;
    # These add-ons will be used when the subscription renews.
    SubscriptionAddOn[] add_ons?;
    float unit_amount?;
    int quantity?;
    SubscriptionShipping shipping?;
    string activate_at?;
    # Returns `true` if the subscription change is activated.
    boolean activated?;
    string revenue_schedule_type?;
    InvoiceCollection invoice_collection?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    string created_at?;
    string updated_at?;
    string deleted_at?;
    # Accept nested attributes for three_d_secure_action_result_token_id
    SubscriptionChangeBillingInfo billing_info?;
};

public type UsageCreate record {
    # Custom field for recording the id in your own system associated with the usage, so you can provide auditable usage displays to your customers using a GET on this endpoint.
    string merchant_tag?;
    # The amount of usage. Can be positive, negative, or 0. No decimals allowed, we will strip them. If the usage-based add-on is billed with a percentage, your usage will be a monetary amount you will want to format in cents. (e.g., $5.00 is "500").
    float amount?;
    # When the usage was recorded in your system.
    string recording_timestamp?;
    # When the usage actually happened. This will define the line item dates this usage is billed under and is important for revenue recognition.
    string usage_timestamp?;
};

public type SubscriptionUpdate record {
    string collection_method?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    # The remaining billing cycles in the current term.
    int remaining_billing_cycles?;
    # If `auto_renew=true`, when a term completes, `total_billing_cycles` takes this value as the length of subsequent terms. Defaults to the plan's `total_billing_cycles`.
    int renewal_billing_cycles?;
    # Whether the subscription renews at the end of its term.
    boolean auto_renew?;
    # If present, this sets the date the subscription's next billing period will start (`current_period_ends_at`). This can be used to align the subscription’s billing to a specific day of the month. For a subscription in a trial period, this will change when the trial expires. This parameter is useful for postponement of a subscription to change its billing date without proration.
    string next_bill_date?;
    string revenue_schedule_type?;
    # Specify custom notes to add or override Terms and Conditions. Custom notes will stay with a subscription on all renewals.
    string terms_and_conditions?;
    # Specify custom notes to add or override Customer Notes. Custom notes will stay with a subscription on all renewals.
    string customer_notes?;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms?;
    SubscriptionShippingUpdate shipping?;
    # The `billing_info_id` is the value that represents a specific billing info for an end customer. When `billing_info_id` is used to assign billing info to the subscription, all future billing events for the subscription will bill to the specified billing info.
    string billing_info_id?;
};

public type ShippingAddressUpdate record {
    @constraint:String {maxLength: 13}
    string id?;
    @constraint:String {maxLength: 255}
    string nickname?;
    @constraint:String {maxLength: 255}
    string first_name?;
    @constraint:String {maxLength: 255}
    string last_name?;
    @constraint:String {maxLength: 255}
    string company?;
    @constraint:String {maxLength: 255}
    string email?;
    @constraint:String {maxLength: 20}
    string vat_number?;
    @constraint:String {maxLength: 30}
    string phone?;
    @constraint:String {maxLength: 255}
    string street1?;
    @constraint:String {maxLength: 255}
    string street2?;
    @constraint:String {maxLength: 255}
    string city?;
    # State or province.
    @constraint:String {maxLength: 255}
    string region?;
    # Zip or postal code.
    @constraint:String {maxLength: 20}
    string postal_code?;
    # Country, 2-letter ISO 3166-1 alpha-2 code.
    @constraint:String {maxLength: 50}
    string country?;
};

public type Empty record {
};

public type CustomFieldDefinitionList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    CustomFieldDefinition[] data?;
};

public type InvoiceCreate record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    # An automatic invoice means a corresponding transaction is run using the account's billing information at the same time the invoice is created. Manual invoices are created without a corresponding transaction. The merchant must enter a manual payment transaction or have the customer pay the invoice with an automatic method, like credit card, PayPal, Amazon, or ACH bank payment.
    string collection_method = "automatic";
    # This will default to the Customer Notes text specified on the Invoice Settings for charge invoices. Specify custom notes to add or override Customer Notes on charge invoices.
    string charge_customer_notes?;
    # This will default to the Customer Notes text specified on the Invoice Settings for credit invoices. Specify customer notes to add or override Customer Notes on credit invoices.
    string credit_customer_notes?;
    # Integer representing the number of days after an invoice's creation that the invoice will become past due. If an invoice's net terms are set to '0', it is due 'On Receipt' and will become past due 24 hours after it’s created. If an invoice is due net 30, it will become past due at 31 days exactly.
    int net_terms = 0;
    # For manual invoicing, this identifies the PO number associated with the subscription.
    @constraint:String {maxLength: 50}
    string po_number?;
    # This will default to the Terms and Conditions text specified on the Invoice Settings page in your Recurly admin. Specify custom notes to add or override Terms and Conditions.
    string terms_and_conditions?;
    # VAT Reverse Charge Notes only appear if you have EU VAT enabled or are using your own Avalara AvaTax account and the customer is in the EU, has a VAT number, and is in a different country than your own. This will default to the VAT Reverse Charge Notes text specified on the Tax Settings page in your Recurly admin, unless custom notes were created with the original subscription.
    string vat_reverse_charge_notes?;
};

public type AccountBalance record {
    string 'object?;
    AccountMini account?;
    boolean past_due?;
    AccountBalanceAmount[] balances?;
};

public type Pricing record {
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency;
    @constraint:Float {maxValue: 1000000}
    float unit_amount;
};

# Parameters to be passed to the `list_unique_coupon_codes` endpoint to obtain the newly generated codes.
public type UniqueCouponCodeParams record {
    int 'limit?;
    string 'order?;
    string sort?;
    # The date-time to be included when listing UniqueCouponCodes
    string begin_time?;
};

# Details of the discount a coupon applies. Will contain a `type`
# property and one of the following properties: `percent`, `fixed`, `trial`.
public type CouponDiscount record {
    string 'type?;
    # This is only present when `type=percent`.
    int percent?;
    # This is only present when `type=fixed`.
    CouponDiscountPricing[] currencies?;
    # This is only present when `type=free_trial`.
    CoupondiscountTrial trial?;
};

# Most recent fraud result.
public type FraudInformation record {
    @constraint:Int {minValue: 1, maxValue: 99}
    int score?;
    @constraint:String {maxLength: 10}
    string decision?;
    record {} risk_rules_triggered?;
};

public type Coupon record {
    string id?;
    string 'object?;
    # The code the customer enters to redeem the coupon.
    string code?;
    # The internal name for the coupon.
    string name?;
    # Indicates if the coupon is redeemable, and if it is not, why.
    string state?;
    # A maximum number of redemptions for the coupon. The coupon will expire when it hits its maximum redemptions.
    int max_redemptions?;
    # Redemptions per account is the number of times a specific account can redeem the coupon. Set redemptions per account to `1` if you want to keep customers from gaming the system and getting more than one discount from the coupon campaign.
    int max_redemptions_per_account?;
    # When this number reaches `max_redemptions` the coupon will no longer be redeemable.
    int unique_coupon_codes_count?;
    # On a bulk coupon, the template from which unique coupon codes are generated.
    string unique_code_template?;
    # Will be populated when the Coupon being returned is a `UniqueCouponCode`.
    UniqueCouponCode unique_coupon_code?;
    # - "single_use" coupons applies to the first invoice only.
    # - "temporal" coupons will apply to invoices for the duration determined by the `temporal_unit` and `temporal_amount` attributes.
    string duration?;
    # If `duration` is "temporal" than `temporal_amount` is an integer which is multiplied by `temporal_unit` to define the duration that the coupon will be applied to invoices for.
    int temporal_amount?;
    # If `duration` is "temporal" than `temporal_unit` is multiplied by `temporal_amount` to define the duration that the coupon will be applied to invoices for.
    string temporal_unit?;
    # Description of the unit of time the coupon is for. Used with `free_trial_amount` to determine the duration of time the coupon is for.
    string free_trial_unit?;
    # Sets the duration of time the `free_trial_unit` is for.
    @constraint:Int {minValue: 1, maxValue: 9999}
    int free_trial_amount?;
    # The coupon is valid for all plans if true. If false then `plans` will list the applicable plans.
    boolean applies_to_all_plans?;
    # The coupon is valid for all items if true. If false then `items`
    # will list the applicable items.
    boolean applies_to_all_items?;
    # The coupon is valid for one-time, non-plan charges if true.
    boolean applies_to_non_plan_charges?;
    # A list of plans for which this coupon applies. This will be `null` if `applies_to_all_plans=true`.
    PlanMini[] plans?;
    # A list of items for which this coupon applies. This will be
    # `null` if `applies_to_all_items=true`.
    ItemMini[] items?;
    # Whether the discount is for all eligible charges on the account, or only a specific subscription.
    string redemption_resource?;
    # Details of the discount a coupon applies. Will contain a `type`
    # property and one of the following properties: `percent`, `fixed`, `trial`.
    CouponDiscount discount?;
    # Whether the coupon is "single_code" or "bulk". Bulk coupons will require a `unique_code_template` and will generate unique codes through the `/generate` endpoint.
    string coupon_type?;
    # This description will show up when a customer redeems a coupon on your Hosted Payment Pages, or if you choose to show the description on your own checkout page.
    string hosted_page_description?;
    # Description of the coupon on the invoice.
    @constraint:String {maxLength: 255}
    string invoice_description?;
    # The date and time the coupon will expire and can no longer be redeemed. Time is always 11:59:59, the end-of-day Pacific time.
    string redeem_by?;
    string created_at?;
    string updated_at?;
    # The date and time the coupon was expired early or reached its `max_redemptions`.
    string expired_at?;
};

public type LineItemCreate record {
    # 3-letter ISO 4217 currency code. If `item_code`/`item_id` is part of the request then `currency` is optional, if the site has a single default currency. `currency` is required if `item_code`/`item_id` is present, and there are multiple currencies defined on the site. If `item_code`/`item_id` is not present `currency` is required.
    @constraint:String {maxLength: 3}
    string currency;
    # A positive or negative amount with `type=charge` will result in a positive `unit_amount`.
    # A positive or negative amount with `type=credit` will result in a negative `unit_amount`.
    # If `item_code`/`item_id` is present, `unit_amount` can be passed in, to override the
    # `Item`'s `unit_amount`. If `item_code`/`item_id` is not present then `unit_amount` is required.
    float unit_amount;
    # This number will be multiplied by the unit amount to compute the subtotal before any discounts or taxes.
    int quantity = 1;
    # Description that appears on the invoice. If `item_code`/`item_id` is part of the request then `description` must be absent.
    @constraint:String {maxLength: 255}
    string description?;
    # Unique code to identify an item. Available when the Credit Invoices and Subscription Billing Terms features are enabled.
    @constraint:String {maxLength: 50}
    string item_code?;
    # System-generated unique identifier for an item. Available when the Credit Invoices and Subscription Billing Terms features are enabled.
    @constraint:String {maxLength: 13}
    string item_id?;
    string revenue_schedule_type?;
    # Line item type. If `item_code`/`item_id` is present then `type` should not be present. If `item_code`/`item_id` is not present then `type` is required.
    string 'type;
    # The reason the credit was given when line item is `type=credit`. When the Credit Invoices feature is enabled, the value can be set and will default to `general`. When the Credit Invoices feature is not enabled, the value will always be `null`.
    string credit_reason_code = "general";
    # Accounting Code for the `LineItem`. If `item_code`/`item_id` is part of the request then `accounting_code` must be absent.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # `true` exempts tax on charges, `false` applies tax on charges. If not defined, then defaults to the Plan and Site settings. This attribute does not work for credits (negative line items). Credits are always applied post-tax. Pre-tax discounts should use the Coupons feature.
    boolean tax_exempt?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the line item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `LineItem`, then the `avalara_transaction_type` must be absent.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the line item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `LineItem`, then the `avalara_service_type` must be absent.
    int avalara_service_type?;
    # Optional field used by Avalara, Vertex, and Recurly's EU VAT tax feature to determine taxation rules. If you have your own AvaTax or Vertex account configured, use their tax codes to assign specific tax rules. If you are using Recurly's EU VAT feature, you can use values of `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # Optional field to track a product code or SKU for the line item. This can be used to later reporting on product purchases. For Vertex tax calculations, this field will be used as the Vertex `product` field. If `item_code`/`item_id` is part of the request then `product_code` must be absent.
    @constraint:String {maxLength: 50}
    string product_code?;
    # Origin `external_gift_card` is allowed if the Gift Cards feature is enabled on your site and `type` is `credit`. Set this value in order to track gift card credits from external gift cards (like InComm). It also skips billing information requirements.  Origin `prepayment` is only allowed if `type` is `charge` and `tax_exempt` is left blank or set to true.  This origin creates a charge and opposite credit on the account to be used for future invoices.
    string origin?;
    # If an end date is present, this is value indicates the beginning of a billing time range. If no end date is present it indicates billing for a specific date. Defaults to the current date-time.
    string start_date?;
    # If this date is provided, it indicates the end of a time range.
    string end_date?;
};

public type AccountReadOnly record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # Accounts can be either active or inactive.
    string state?;
    # The unique token for automatically logging the account in to the hosted management pages. You may automatically log the user into their hosted management pages by directing the user to: `https://{subdomain}.recurly.com/account/{hosted_login_token}`.
    @constraint:String {maxLength: 32}
    string hosted_login_token?;
    # The shipping addresses on the account.
    ShippingAddress[] shipping_addresses?;
    # Indicates if the account has a subscription that is either active, canceled, future, or paused.
    boolean has_live_subscription?;
    # Indicates if the account has an active subscription.
    boolean has_active_subscription?;
    # Indicates if the account has a future subscription.
    boolean has_future_subscription?;
    # Indicates if the account has a canceled subscription.
    boolean has_canceled_subscription?;
    # Indicates if the account has a paused subscription.
    boolean has_paused_subscription?;
    # Indicates if the account has a past due invoice.
    boolean has_past_due_invoice?;
    # When the account was created.
    string created_at?;
    # When the account was last changed.
    string updated_at?;
    # If present, when the account was last marked inactive.
    string deleted_at?;
};

public type LineItem record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The UUID is useful for matching data with the CSV exports and building URLs into Recurly's UI.
    @constraint:String {maxLength: 32}
    string uuid?;
    # Charges are positive line items that debit the account. Credits are negative line items that credit the account.
    string 'type?;
    # Unique code to identify an item. Available when the Credit Invoices and Subscription Billing Terms features are enabled.
    @constraint:String {maxLength: 50}
    string item_code?;
    # System-generated unique identifier for an item. Available when the Credit Invoices and Subscription Billing Terms features are enabled.
    @constraint:String {maxLength: 13}
    string item_id?;
    # Optional Stock Keeping Unit assigned to an item. Available when the Credit Invoices and Subscription Billing Terms features are enabled.
    @constraint:String {maxLength: 50}
    string external_sku?;
    string revenue_schedule_type?;
    # Pending line items are charges or credits on an account that have not been applied to an invoice yet. Invoiced line items will always have an `invoice_id` value.
    string state?;
    # Category to describe the role of a line item on a legacy invoice:
    # - "charges" refers to charges being billed for on this invoice.
    # - "credits" refers to refund or proration credits. This portion of the invoice can be considered a credit memo.
    # - "applied_credits" refers to previous credits applied to this invoice. See their original_line_item_id to determine where the credit first originated.
    # - "carryforwards" can be ignored. They exist to consume any remaining credit balance. A new credit with the same amount will be created and placed back on the account.
    string legacy_category?;
    AccountMini account?;
    # If the line item is a charge or credit for a subscription, this is its ID.
    @constraint:String {maxLength: 13}
    string subscription_id?;
    # If the line item is a charge or credit for a plan or add-on, this is the plan's ID.
    @constraint:String {maxLength: 13}
    string plan_id?;
    # If the line item is a charge or credit for a plan or add-on, this is the plan's code.
    @constraint:String {maxLength: 50}
    string plan_code?;
    # If the line item is a charge or credit for an add-on this is its ID.
    @constraint:String {maxLength: 13}
    string add_on_id?;
    # If the line item is a charge or credit for an add-on, this is its code.
    @constraint:String {maxLength: 50}
    string add_on_code?;
    # Once the line item has been invoiced this will be the invoice's ID.
    @constraint:String {maxLength: 13}
    string invoice_id?;
    # Once the line item has been invoiced this will be the invoice's number. If VAT taxation and the Country Invoice Sequencing feature are enabled, invoices will have country-specific invoice numbers for invoices billed to EU countries (ex: FR1001). Non-EU invoices will continue to use the site-level invoice number sequence.
    string invoice_number?;
    # Will only have a value if the line item is a credit created from a previous credit, or if the credit was created from a charge refund.
    @constraint:String {maxLength: 13}
    string previous_line_item_id?;
    # The invoice where the credit originated. Will only have a value if the line item is a credit created from a previous credit, or if the credit was created from a charge refund.
    @constraint:String {maxLength: 13}
    string original_line_item_invoice_id?;
    # A credit created from an original charge will have the value of the charge's origin.
    string origin?;
    # Internal accounting code to help you reconcile your revenue to the correct ledger. Line items created as part of a subscription invoice will use the plan or add-on's accounting code, otherwise the value will only be present if you define an accounting code when creating the line item.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # For plan-related line items this will be the plan's code, for add-on related line items it will be the add-on's code. For item-related line items it will be the item's `external_sku`.
    @constraint:String {maxLength: 50}
    string product_code?;
    # The reason the credit was given when line item is `type=credit`.
    string credit_reason_code?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # `(quantity * unit_amount) - (discount + tax)`
    float amount?;
    # Description that appears on the invoice. For subscription related items this will be filled in automatically.
    @constraint:String {maxLength: 255}
    string description?;
    # This number will be multiplied by the unit amount to compute the subtotal before any discounts or taxes.
    int quantity?;
    # Positive amount for a charge, negative amount for a credit.
    float unit_amount?;
    # Positive amount for a charge, negative amount for a credit.
    string unit_amount_decimal?;
    # `quantity * unit_amount`
    float subtotal?;
    # The discount applied to the line item.
    float discount?;
    # The tax amount for the line item.
    float tax?;
    # `true` if the line item is taxable, `false` if it is not.
    boolean taxable?;
    # `true` exempts tax on charges, `false` applies tax on charges. If not defined, then defaults to the Plan and Site settings. This attribute does not work for credits (negative line items). Credits are always applied post-tax. Pre-tax discounts should use the Coupons feature.
    boolean tax_exempt?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the line item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the line item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    TaxInfo tax_info?;
    # When a line item has been prorated, this is the rate of the proration. Proration rates were made available for line items created after March 30, 2017. For line items created prior to that date, the proration rate will be `null`, even if the line item was prorated.
    @constraint:Float {maxValue: 1}
    float proration_rate?;
    boolean refund?;
    # For refund charges, the quantity being refunded. For non-refund charges, the total quantity refunded (possibly over multiple refunds).
    int refunded_quantity?;
    # The amount of credit from this line item that was applied to the invoice.
    float credit_applied?;
    ShippingAddress shipping_address?;
    # If an end date is present, this is value indicates the beginning of a billing time range. If no end date is present it indicates billing for a specific date.
    string start_date?;
    # If this date is provided, it indicates the end of a time range.
    string end_date?;
    # When the line item was created.
    string created_at?;
    # When the line item was last changed.
    string updated_at?;
};

public type Error record {
    string 'type?;
    string message?;
    ErrorParams[] params?;
};

public type ItemUpdate record {
    # Unique code to identify the item.
    @constraint:String {maxLength: 50}
    string code?;
    # This name describes your item and will appear on the invoice when it's purchased on a one time basis.
    @constraint:String {maxLength: 255}
    string name?;
    # Optional, description.
    string description?;
    # Optional, stock keeping unit to link the item to other inventory systems.
    @constraint:String {maxLength: 50}
    string external_sku?;
    # Accounting code for invoice line items.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    string revenue_schedule_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the item is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types.
    int avalara_service_type?;
    # Used by Avalara, Vertex, and Recurly’s EU VAT tax feature. The tax code values are specific to each tax system. If you are using Recurly’s EU VAT feature you can use `unknown`, `physical`, or `digital`.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # `true` exempts tax on the item, `false` applies tax on the item.
    boolean tax_exempt?;
    # The custom fields will only be altered when they are included in a request. Sending an empty array will not remove any existing values. To remove a field send the name with a null or empty value.
    CustomFields custom_fields?;
    Pricing[] currencies?;
};

public type CouponRedemption record {
    string id?;
    # Will always be `coupon`.
    string 'object?;
    AccountMini account?;
    string subscription_id?;
    Coupon coupon?;
    string state?;
    # 3-letter ISO 4217 currency code.
    @constraint:String {maxLength: 3}
    string currency?;
    # The amount that was discounted upon the application of the coupon, formatted with the currency.
    float discounted?;
    string created_at?;
    string updated_at?;
    # The date and time the redemption was removed from the account (un-redeemed).
    string removed_at?;
};

# Full add-on details.
public type AddOnCreate record {
    # Unique code to identify an item. Available when the `Credit Invoices` and `Subscription Billing Terms` features are enabled. If `item_id` and `item_code` are both present, `item_id` will be used.
    @constraint:String {maxLength: 50}
    string item_code?;
    # System-generated unique identifier for an item. Available when the `Credit Invoices` and `Subscription Billing Terms` features are enabled. If `item_id` and `item_code` are both present, `item_id` will be used.
    @constraint:String {maxLength: 13}
    string item_id?;
    # The unique identifier for the add-on within its plan. If `item_code`/`item_id` is part of the request then `code` must be absent. If `item_code`/`item_id` is not present `code` is required.
    @constraint:String {maxLength: 50}
    string code;
    # Describes your add-on and will appear in subscribers' invoices. If `item_code`/`item_id` is part of the request then `name` must be absent. If `item_code`/`item_id` is not present `name` is required.
    @constraint:String {maxLength: 255}
    string name;
    # Whether the add-on type is fixed, or usage-based.
    string add_on_type = "fixed";
    # Type of usage, required if `add_on_type` is `usage`. See our
    # [Guide](https://developers.recurly.com/guides/usage-based-billing-guide.html) for an
    # overview of how to configure usage add-ons.
    string usage_type?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0. Required if `add_on_type` is usage, `tier_type` is `flat` and `usage_type` is percentage. Must be omitted otherwise.
    float usage_percentage?;
    # System-generated unique identifier for a measured unit to be associated with the add-on. Either `measured_unit_id` or `measured_unit_name` are required when `add_on_type` is `usage`. If `measured_unit_id` and `measured_unit_name` are both present, `measured_unit_id` will be used.
    @constraint:String {maxLength: 13}
    string measured_unit_id?;
    # Name of a measured unit to be associated with the add-on. Either `measured_unit_id` or `measured_unit_name` are required when `add_on_type` is `usage`. If `measured_unit_id` and `measured_unit_name` are both present, `measured_unit_id` will be used.
    string measured_unit_name?;
    @constraint:String {maxLength: 13}
    string plan_id?;
    # Accounting code for invoice line items for this add-on. If no value is provided, it defaults to add-on's code. If `item_code`/`item_id` is part of the request then `accounting_code` must be absent.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # When this add-on is invoiced, the line item will use this revenue schedule. If `item_code`/`item_id` is part of the request then `revenue_schedule_type` must be absent in the request as the value will be set from the item.
    string revenue_schedule_type?;
    # Determines if the quantity field is displayed on the hosted pages for the add-on.
    boolean display_quantity = false;
    # Default quantity for the hosted pages.
    int default_quantity = 1;
    # Whether the add-on is optional for the customer to include in their purchase on the hosted payment page. If false, the add-on will be included when a subscription is created through the Recurly UI. However, the add-on will not be included when a subscription is created through the API.
    boolean optional?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `AddOn`, then the `avalara_transaction_type` must be absent.
    int avalara_transaction_type?;
    # Used by Avalara for Communications taxes. The transaction type in combination with the service type describe how the add-on is taxed. Refer to [the documentation](https://help.avalara.com/AvaTax_for_Communications/Tax_Calculation/AvaTax_for_Communications_Tax_Engine/Mapping_Resources/TM_00115_AFC_Modules_Corresponding_Transaction_Types) for more available t/s types. If an `Item` is associated to the `AddOn`, then the `avalara_service_type` must be absent.
    int avalara_service_type?;
    # Optional field used by Avalara, Vertex, and Recurly's EU VAT tax feature to determine taxation rules. If you have your own AvaTax or Vertex account configured, use their tax codes to assign specific tax rules. If you are using Recurly's EU VAT feature, you can use values of `unknown`, `physical`, or `digital`. If `item_code`/`item_id` is part of the request then `tax_code` must be absent.
    @constraint:String {maxLength: 50}
    string tax_code?;
    # * If `item_code`/`item_id` is part of the request and the item
    # has a default currency then `currencies` is optional. If the item does
    # not have a default currency, then `currencies` is required. If `item_code`/`item_id`
    # is not present `currencies` is required.
    # * If the add-on's `tier_type` is `tiered`, `volume`, or `stairstep`,
    # then `currencies` must be absent.
    # * Must be absent if `add_on_type` is `usage` and `usage_type` is `percentage`.
    @constraint:Array {minLength: 1}
    AddOnPricing[] currencies?;
    # The pricing model for the add-on.  For more information,
    # [click here](https://docs.recurly.com/docs/billing-models#section-quantity-based). See our
    # [Guide](https://developers.recurly.com/guides/item-addon-guide.html) for an overview of how
    # to configure quantity-based pricing models.
    string tier_type = "flat";
    # If the tier_type is `flat`, then `tiers` must be absent. The `tiers` object
    # must include one to many tiers with `ending_quantity` and `unit_amount` for
    # the desired `currencies`, or alternatively, `usage_percentage` for usage percentage type usage add ons. There must be one tier with an `ending_quantity`
    # of 999999999 which is the default if not provided.
    Tier[] tiers?;
};

public type ShippingMethodCreate record {
    # The internal name used identify the shipping method.
    @constraint:String {maxLength: 50}
    string code;
    # The name of the shipping method displayed to customers.
    @constraint:String {maxLength: 100}
    string name;
    # Accounting code for shipping method.
    @constraint:String {maxLength: 20}
    string accounting_code?;
    # Used by Avalara, Vertex, and Recurly’s built-in tax feature. The tax
    # code values are specific to each tax system. If you are using Recurly’s
    # built-in taxes the values are:
    # 
    # - `FR` – Common Carrier FOB Destination
    # - `FR022000` – Common Carrier FOB Origin
    # - `FR020400` – Non Common Carrier FOB Destination
    # - `FR020500` – Non Common Carrier FOB Origin
    # - `FR010100` – Delivery by Company Vehicle Before Passage of Title
    # - `FR010200` – Delivery by Company Vehicle After Passage of Title
    # - `NT` – Non-Taxable
    @constraint:String {maxLength: 50}
    string tax_code?;
};

public type AccountAcquisition record {
    *AccountAcquisitionUpdate;
    *AccountAcquisitionReadOnly;
};

# Just the important parts.
public type AddOnMini record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    # The unique identifier for the add-on within its plan.
    @constraint:String {maxLength: 50}
    string code?;
    # Describes your add-on and will appear in subscribers' invoices.
    @constraint:String {maxLength: 255}
    string name?;
    # Whether the add-on type is fixed, or usage-based.
    string add_on_type?;
    # Type of usage, returns usage type if `add_on_type` is `usage`.
    string usage_type?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0.
    float usage_percentage?;
    # System-generated unique identifier for an measured unit associated with the add-on.
    @constraint:String {maxLength: 13}
    string measured_unit_id?;
    @constraint:String {maxLength: 13}
    string item_id?;
    # Optional, stock keeping unit to link the item to other inventory systems.
    @constraint:String {maxLength: 50}
    string external_sku?;
    # Accounting code for invoice line items for this add-on. If no value is provided, it defaults to add-on's code.
    @constraint:String {maxLength: 20}
    string accounting_code?;
};

public type InvoiceAddress AddressWithName;

public type ShippingAddress record {
    @constraint:String {maxLength: 13}
    string id?;
    string 'object?;
    @constraint:String {maxLength: 13}
    string account_id?;
    @constraint:String {maxLength: 255}
    string nickname?;
    @constraint:String {maxLength: 255}
    string first_name?;
    @constraint:String {maxLength: 255}
    string last_name?;
    @constraint:String {maxLength: 255}
    string company?;
    @constraint:String {maxLength: 255}
    string email?;
    @constraint:String {maxLength: 20}
    string vat_number?;
    @constraint:String {maxLength: 30}
    string phone?;
    @constraint:String {maxLength: 255}
    string street1?;
    @constraint:String {maxLength: 255}
    string street2?;
    @constraint:String {maxLength: 255}
    string city?;
    # State or province.
    @constraint:String {maxLength: 255}
    string region?;
    # Zip or postal code.
    @constraint:String {maxLength: 20}
    string postal_code?;
    # Country, 2-letter ISO 3166-1 alpha-2 code.
    @constraint:String {maxLength: 50}
    string country?;
    string created_at?;
    string updated_at?;
};

public type CustomField record {
    # Fields must be created in the UI before values can be assigned to them.
    @constraint:String {maxLength: 50}
    string name;
    # Any values that resemble a credit card number or security code (CVV/CVC) will be rejected.
    @constraint:String {maxLength: 100}
    string value;
};

public type SubscriptionAddOnCreate record {
    # If `add_on_source` is set to `plan_add_on` or left blank, then plan's add-on `code` should be used.
    # If `add_on_source` is set to `item`, then the `code` from the associated item should be used.
    @constraint:String {maxLength: 50}
    string code;
    # Used to determine where the associated add-on data is pulled from. If this value is set to
    # `plan_add_on` or left blank, then add-on data will be pulled from the plan's add-ons. If the associated
    # `plan` has `allow_any_item_on_subscriptions` set to `true` and this field is set to `item`, then
    # the associated add-on data will be pulled from the site's item catalog.
    string add_on_source = "plan_add_on";
    int quantity = 1;
    # Allows up to 2 decimal places. Optionally, override the add-on's default unit amount.
    # If the plan add-on's `tier_type` is `tiered`, `volume`, or `stairstep`, then `unit_amount` cannot be provided.
    @constraint:Float {maxValue: 1000000}
    float unit_amount?;
    # Allows up to 9 decimal places.  Optionally, override the add-on's default unit amount.
    # If the plan add-on's `tier_type` is `tiered`, `volume`, or `stairstep`, then `unit_amount_decimal` cannot be provided.
    # Only supported when the plan add-on's `add_on_type` = `usage`.
    # If `unit_amount_decimal` is provided, `unit_amount` cannot be provided.
    string unit_amount_decimal?;
    # If the plan add-on's `tier_type` is `flat`, then `tiers` must be absent. The `tiers` object
    # must include one to many tiers with `ending_quantity` and `unit_amount`.
    # There must be one tier with an `ending_quantity` of 999999999 which is the
    # default if not provided. See our [Guide](https://developers.recurly.com/guides/item-addon-guide.html)
    # for an overview of how to configure quantity-based pricing models.
    @constraint:Array {minLength: 1}
    SubscriptionAddOnTier[] tiers?;
    # The percentage taken of the monetary amount of usage tracked. This can be up to 4 decimal places. A value between 0.0 and 100.0. Required if `add_on_type` is usage and `usage_type` is percentage. Must be omitted otherwise. `usage_percentage` does not support tiers. See our [Guide](https://developers.recurly.com/guides/usage-based-billing-guide.html) for an overview of how to configure usage add-ons.
    float usage_percentage?;
    string revenue_schedule_type?;
};

# This is only present when `type=free_trial`.
public type CoupondiscountTrial record {
    # Temporal unit of the free trial
    string unit?;
    # Trial length measured in the units specified by the sibling `unit` property
    int length?;
};

public type BillingInfoList record {
    # Will always be List.
    string 'object?;
    # Indicates there are more results on subsequent pages.
    boolean has_more?;
    # Path to subsequent page of results.
    string next?;
    BillingInfo[] data?;
};
