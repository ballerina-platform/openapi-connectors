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

# The exchange rate that determines the amount that is credited to the payee's PayPal account. Returned when the currency of the captured payment is different from the currency of the PayPal account where the payee wants to credit the funds.
public type ExchangeRate record {
    # The source currency from which to convert an amount.
    string? source_currency?;
    # The target currency to which to convert an amount.
    string? target_currency?;
    # The target currency amount. Equivalent to one unit of the source currency. Formatted as integer or decimal value with one to 15 digits to the right of the decimal point.
    string? value?;
};

# An object that provides additional processor information for a direct credit card transaction.
public type ProcessorResponse record {
    # The address verification code for Visa, Discover, Mastercard, or American Express transactions.
    string? avs_code?;
    # The card verification value code for for Visa, Discover, Mastercard, or American Express.
    string? cvv_code?;
    # Processor response code for the non-PayPal payment processor errors.
    string? response_code?;
    # The declined payment transactions might have payment advice codes. The card networks, like Visa and Mastercard, return payment advice codes.
    string? payment_advice_code?;
};

# The PayPal fee that was refunded to the payer in the currency of the transaction. This fee might not match the PayPal fee that the payee paid when the payment was captured.
public type MoneyForPaypalFeeForSellerPayableBreakdown record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# Related HATEOAS links.
public type LinkDescription record {
    # The complete target URL. To make the related call, combine the method with this URI Template-formatted link. For pre-processing, include the $, (, and ) characters. The href is the key HATEOAS component that links a completed call with a subsequent call.
    string? href;
    # The link relation type, which serves as an ID for a link that unambiguously describes the semantics of the link. See Link Relations.
    string? rel;
    # The HTTP method required to make the related call. Possible values are GET,POST,PUT,DELETE,HEAD,CONNECT,OPTIONS,PATCH.
    string? method?;
};

# Refund capture request
public type RefundCaptureRequest record {
    # The amount to refund. To refund a portion of the captured amount, specify an amount. If amount is not specified, an amount equal to captured amount - previous refunds is refunded. The amount must be a positive number and in the same currency as the one in which the payment was captured.
    MoneyForRefundCaptureRequest? amount?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The reason for the refund. Appears in both the payer's transaction history and the emails that the payer receives.
    string? note_to_payer?;
};

# Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
public type PaymentInstruction record {
    # An array of various fees, commissions, tips, or donations. This field is only applicable to merchants that been enabled for PayPal Commerce Platform for Marketplaces and Platforms capability.
    PlatformFee[]? platform_fees?;
    # The funds that are held on behalf of the merchant.
    string? disbursement_mode?;
    # This field is only enabled for selected merchants/partners to use and provides the ability to trigger a specific pricing rate/plan for a payment transaction. The list of eligible 'payee_pricing_tier_id' would be provided to you by your Account Manager. Specifying values other than the one provided to you by your account manager would result in an error.
    string? payee_pricing_tier_id?;
};

# The amount for this captured payment.
public type MoneyForAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The amount to reauthorize for an authorized payment.
public type MoneytForReauthorizeAuthorizationRequest record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The applicable fee for this captured payment in the receivable currency. Returned only in cases the fee is charged in the receivable currency. Example 'CNY'.
public type MoneyForPaypalFeeInReceivableCurrency record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The amount for this authorized payment.
public type Money record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The fee for this transaction.
public type MoneyForPlatformFee record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The detailed breakdown of the capture activity. This is not available for transactions that are in pending state.
public type SellerReceivableBreakdown record {
    # The amount for this captured payment in the currency of the transaction.
    MoneyForGrossAmount? gross_amount;
    # The applicable fee for this captured payment in the currency of the transaction.
    MoneyForPaypalFee? paypal_fee?;
    # The applicable fee for this captured payment in the receivable currency. Returned only in cases the fee is charged in the receivable currency. Example 'CNY'.
    MoneyForPaypalFeeInReceivableCurrency? paypal_fee_in_receivable_currency?;
    # The net amount that is credited to the payee's PayPal account. Returned only when the currency of the captured payment is different from the currency of the PayPal account where the payee wants to credit the funds. The amount is computed as net_amount times exchange_rate.
    MoneyForNetAmount? net_amount?;
    # The net amount that the payee receives for this captured payment in their PayPal account. The net amount is computed as gross_amount minus the paypal_fee minus the platform_fees.
    MoneyForReceivableAmount? receivable_amount?;
    # The exchange rate that determines the amount that is credited to the payee's PayPal account. Returned when the currency of the captured payment is different from the currency of the PayPal account where the payee wants to credit the funds.
    ExchangeRate? exchange_rate?;
    # An array of platform or partner fees, commissions, or brokerage fees that associated with the captured payment.
    PlatformFeeForGrossAmount[]? platform_fees?;
};

# The amount that the payee refunded to the payer.
public type MoneyForRefundDetails record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The details of the captured payment status.
public type CaptureStatusDetails record {
    # The reason why the captured payment status is PENDING or DENIED. The possible values are BUYER_COMPLAINT, CHARGEBACK, ECHECK, INTERNATIONAL_WITHDRAWAL, OTHER, PENDING_REVIEW, RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION, REFUNDED, TRANSACTION_APPROVED_AWAITING_FUNDING, UNILATERAL, VERIFICATION_REQUIRED.
    string? reason?;
};

# Authorization details.
public type AuthorizationDetails record {
    # The status for the authorized payment. The possible values are CREATED, CAPTURED, DENIED, EXPIRED, PARTIALLY_CAPTURED, PARTIALLY_CREATED, VOIDED, PENDING.
    string? status?;
    # The details of the authorized order pending status.
    AuthorizationStatusDetails? status_details?;
    # The PayPal-generated ID for the authorized payment.
    string? id?;
    # The amount for this authorized payment.
    Money? amount?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The API caller-provided external ID. Used to reconcile API caller-initiated transactions with PayPal transactions. Appears in transaction and settlement reports.
    string? custom_id?;
    # The level of protection offered as defined by PayPal Seller Protection for Merchants.
    SellerProtection? seller_protection?;
    # The date and time when the authorized payment expires, in Internet date and time format.
    string? expiration_time?;
    # An array of related HATEOAS links.
    LinkDescription[]? links?;
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
};

# The net amount that the payee's account is debited in the transaction currency. The net amount is calculated as gross_amount minus paypal_fee minus platform_fees.
public type MoneyForNetAmountForSellerPayableBreakdown record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
public type PayeeBase record {
    # The email address of merchant.
    string? email_address?;
    # The encrypted PayPal account ID of the merchant.
    string? merchant_id?;
};

# The exchange rate that determines the amount that was debited from the merchant's PayPal account.
public type ExchangeRateForNetAmountBreakdown record {
    # The source currency from which to convert an amount.
    string? source_currency?;
    # The target currency to which to convert an amount.
    string? target_currency?;
    # The target currency amount. Equivalent to one unit of the source currency. Formatted as integer or decimal value with one to 15 digits to the right of the decimal point.
    string? value?;
};

# Platform or partner fees, commissions, or brokerage fees for the refund.
public type PlatformFeeForGrossAmountForSellerPayableBreakdown record {
    # The fee for this transaction.
    MoneyForPlatformFee? amount;
    # The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    PayeeBase? payee?;
};

# The total amount refunded from the original capture to date. For example, if a payer makes a $100 purchase and was refunded $20 a week ago and was refunded $30 in this refund, the gross_amount is $30 for this refund and the total_refunded_amount is $50.
public type TotalRefundedAmountForSellerPayableBreakdown record {
    # The fee for this transaction.
    MoneyForPlatformFee? amount;
    # The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    PayeeBase? payee?;
};

# The level of protection offered as defined by PayPal Seller Protection for Merchants.
public type SellerProtection record {
    # Indicates whether the transaction is eligible for seller protection. For information, see PayPal Seller Protection for Merchants. The possible values are ELIGIBLE, PARTIALLY_ELIGIBLE, NOT_ELIGIBLE.
    string? status?;
    # An array of conditions that are covered for the transaction.
    DisputeCategory[]? dispute_categories?;
};

# The converted payable amount.
public type MoneyForConvertedAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The amount for this captured payment in the currency of the transaction.
public type MoneyForGrossAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The details of the authorized order pending status.
public type AuthorizationStatusDetails record {
    # The reason why the authorized status is PENDING. The possible values are PENDING_REVIEW.
    string? reason?;
};

# The amount to capture. To capture a portion of the full authorized amount, specify an amount. If amount is not specified, the full authorized amount is captured. The amount must be a positive number and in the same currency as the authorization against which the payment is being captured.
public type MoneyForCaptureAuthorizationRequest record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The level of protection offered as defined by PayPal Seller Protection for Merchants
public type SellerProtectionForCaptureAuthorizationResponse record {
    # Indicates whether the transaction is eligible for seller protection. For information, see PayPal Seller Protection for Merchants. The possible values are ELIGIBLE, PARTIALLY_ELIGIBLE, NOT_ELIGIBLE.
    string? status?;
    # An array of conditions that are covered for the transaction.
    DisputeCategory[]? dispute_categories?;
};

# The applicable fee for this captured payment in the currency of the transaction.
public type MoneyForPaypalFee record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# Platform or partner fees, commissions, or brokerage fees that associated with the captured payment.
public type PlatformFeeForGrossAmount record {
    # The fee for this transaction.
    MoneyForPlatformFee? amount;
    # The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    PayeeBase? payee?;
};

# The amount for this captured payment.
public type Amount record {
    # The reason why the captured payment status is PENDING or DENIED. The possible values are BUYER_COMPLAINT, CHARGEBACK, ECHECK, INTERNATIONAL_WITHDRAWAL, OTHER, PENDING_REVIEW, RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION, REFUNDED, TRANSACTION_APPROVED_AWAITING_FUNDING, UNILATERAL, VERIFICATION_REQUIRED.
    string? reason?;
};

# Refund details.
public type RefundDetails record {
    # The status of the refund. The possible values are CANCELLED, PENDING, COMPLETED.
    string? status?;
    # The details of the refund status.
    RefundStatusDetails? status_details?;
    # The PayPal-generated ID for the refund.
    string? id?;
    # The amount that the payee refunded to the payer.
    MoneyForRefundDetails? amount?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The reason for the refund. Appears in both the payer's transaction history and the emails that the payer receives.
    string? note_to_payer?;
    # The breakdown of the refund.
    SellerPayableBreakdown? seller_payable_breakdown?;
    # An array of related HATEOAS links.
    LinkDescription[]? links?;
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
};

# The amount to refund. To refund a portion of the captured amount, specify an amount. If amount is not specified, an amount equal to captured amount - previous refunds is refunded. The amount must be a positive number and in the same currency as the one in which the payment was captured.
public type MoneyForRefundCaptureRequest record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The net amount debited from the merchant's PayPal account.
public type MoneyForPayableAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# Reauthorize authorization request
public type ReauthorizeAuthorizationRequest record {
    # The amount to reauthorize for an authorized payment.
    MoneytForReauthorizeAuthorizationRequest? amount?;
};

# Captured payment details.
public type CapturedPaymentDetails record {
    # The status of the captured payment. The possible values are COMPLETED, DECLINED, PARTIALLY_REFUNDED, PENDING, REFUNDED, FAILED.
    string? status?;
    # The details of the captured payment status.
    CaptureStatusDetails? status_details?;
    # The PayPal-generated ID for the captured payment.
    string? id?;
    # The amount for this captured payment.
    MoneyForAmount? amount?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The API caller-provided external ID. Used to reconcile API caller-initiated transactions with PayPal transactions. Appears in transaction and settlement reports.
    string? custom_id?;
    # The level of protection offered as defined by PayPal Seller Protection for Merchants
    SellerProtectionForCaptureAuthorizationResponse? seller_protection?;
    # Indicates whether you can make additional captures against the authorized payment. Set to true if you do not intend to capture additional payments against the authorization. Set to false if you intend to capture additional payments against the authorization.
    boolean? final_capture?;
    # The detailed breakdown of the capture activity. This is not available for transactions that are in pending state.
    SellerReceivableBreakdown? seller_receivable_breakdown?;
    # The funds that are held on behalf of the merchant. The possible values are INSTANT, DELAYED.
    string? disbursement_mode?;
    # An array of related HATEOAS links.
    LinkDescription[]? links?;
    # An object that provides additional processor information for a direct credit card transaction.
    ProcessorResponse? processor_response?;
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
};

# The net amount that is credited to the payee's PayPal account. Returned only when the currency of the captured payment is different from the currency of the PayPal account where the payee wants to credit the funds. The amount is computed as net_amount times exchange_rate.
public type MoneyForNetAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The net amount that the payee's account is debited in the receivable currency. Returned only in cases when the receivable currency is different from transaction currency. Example 'CNY'.
public type MoneyForNetAmountInReceivableCurrencyForSellerPayableBreakdown record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# Reauthorized payment details.
public type ReauthorizedPaymentDetails record {
    # The status for the authorized payment. The possible values are CREATED, CAPTURED, DENIED, EXPIRED, PARTIALLY_CAPTURED, PARTIALLY_CREATED, VOIDED, PENDING.
    string? status?;
    # The details of the authorized order pending status.
    AuthorizationStatusDetails? status_details?;
    # The PayPal-generated ID for the authorized payment.
    string? id?;
    # The amount for this authorized payment.
    Money? amount?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The API caller-provided external ID. Used to reconcile API caller-initiated transactions with PayPal transactions. Appears in transaction and settlement reports.
    string? custom_id?;
    # The level of protection offered as defined by PayPal Seller Protection for Merchants.
    SellerProtection? seller_protection?;
    # The date and time when the authorized payment expires, in Internet date and time format.
    string? expiration_time?;
    # An array of related HATEOAS links.
    LinkDescription[]? links?;
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
};

# The PayPal fee that was refunded to the payer in the receivable currency. Returned only in cases when the receivable currency is different from transaction currency. Example 'CNY'.
public type MoneyForPaypalFeeInReceivableCurrencyForSellerPayableBreakdown record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The breakdown of the refund.
public type SellerPayableBreakdown record {
    # The amount that the payee refunded to the payer.
    MoneyForGrossAmountForSellerPayableBreakdown? gross_amount;
    # The PayPal fee that was refunded to the payer in the currency of the transaction. This fee might not match the PayPal fee that the payee paid when the payment was captured.
    MoneyForPaypalFeeForSellerPayableBreakdown? paypal_fee?;
    # The PayPal fee that was refunded to the payer in the receivable currency. Returned only in cases when the receivable currency is different from transaction currency. Example 'CNY'.
    MoneyForPaypalFeeInReceivableCurrencyForSellerPayableBreakdown? paypal_fee_in_receivable_currency?;
    # The net amount that the payee's account is debited in the transaction currency. The net amount is calculated as gross_amount minus paypal_fee minus platform_fees.
    MoneyForNetAmountForSellerPayableBreakdown? net_amount?;
    # The net amount that the payee's account is debited in the receivable currency. Returned only in cases when the receivable currency is different from transaction currency. Example 'CNY'.
    MoneyForNetAmountInReceivableCurrencyForSellerPayableBreakdown? net_amount_in_receivable_currency?;
    # An array of platform or partner fees, commissions, or brokerage fees for the refund.
    PlatformFeeForGrossAmountForSellerPayableBreakdown[]? platform_fees?;
    # An array of breakdown values for the net amount. Returned when the currency of the refund is different from the currency of the PayPal account where the payee holds their funds.
    NetAmountBreakdown[]? net_amount_breakdown?;
    # The total amount refunded from the original capture to date. For example, if a payer makes a $100 purchase and was refunded $20 a week ago and was refunded $30 in this refund, the gross_amount is $30 for this refund and the total_refunded_amount is $50.
    TotalRefundedAmountForSellerPayableBreakdown? total_refunded_amount?;
};

# Capture authorization request
public type CaptureAuthorizationRequest record {
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # An informational note about this settlement. Appears in both the payer's transaction history and the emails that the payer receives.
    string? note_to_payer?;
    # The amount to capture. To capture a portion of the full authorized amount, specify an amount. If amount is not specified, the full authorized amount is captured. The amount must be a positive number and in the same currency as the authorization against which the payment is being captured.
    MoneyForCaptureAuthorizationRequest? amount?;
    # Indicates whether you can make additional captures against the authorized payment. Set to true if you do not intend to capture additional payments against the authorization. Set to false if you intend to capture additional payments against the authorization.
    boolean? final_capture?;
    # Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
    PaymentInstruction? payment_instruction?;
    # The payment descriptor on the payer's account statement.
    string? soft_descriptor?;
};

# The details of the refund status.
public type RefundStatusDetails record {
    # The reason why the refund has the PENDING or FAILED status. The possible values are ECHECK.
    string? reason?;
};

# Breakdown value for the net amount. Returned when the currency of the refund is different from the currency of the PayPal account where the payee holds their funds.
public type NetAmountBreakdown record {
    # The net amount debited from the merchant's PayPal account.
    MoneyForPayableAmount? payable_amount?;
    # The converted payable amount.
    MoneyForConvertedAmount? converted_amount?;
    # The exchange rate that determines the amount that was debited from the merchant's PayPal account.
    ExchangeRateForNetAmountBreakdown? exchange_rate?;
};

# The net amount that the payee receives for this captured payment in their PayPal account. The net amount is computed as gross_amount minus the paypal_fee minus the platform_fees.
public type MoneyForReceivableAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# Various fees, commissions, tips, or donations.
public type PlatformFee record {
    # The fee for this transaction.
    MoneyForPlatformFee? amount;
    # The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    PayeeBase? payee?;
};

# The amount that the payee refunded to the payer.
public type MoneyForGrossAmountForSellerPayableBreakdown record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The condition that is covered for the transaction.
public type DisputeCategory record {
    # The condition that is covered for the transaction. The possible values are ITEM_NOT_RECEIVED, UNAUTHORIZED_TRANSACTION.
    string? dispute_category?;
};
