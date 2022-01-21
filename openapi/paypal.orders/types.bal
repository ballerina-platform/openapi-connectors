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

# Reference values used by the card network to identify a transaction. The possible values are VISA, MASTERCARD, DISCOVER, AMEX, SOLO, JCB, STAR, DELTA, SWITCH, MAESTRO, CB_NATIONALE, CONFIGOGA, CONFIDIS, ELECTRON, CETELEM, CHINA_UNION_PAY.
public type NetworkTransactionReference record {
    # Transaction reference id returned by the scheme. For Visa and Amex, this is the "Tran id" field in response. For MasterCard, this is the "BankNet reference id" field in response. For Discover, this is the "NRID" field in response.
    string? id;
    # The date that the transaction was authorized by the scheme. For MasterCard, this is the "BankNet reference date" field in response.
    string? date?;
    # Name of the card network through which the transaction was routed.
    string? network;
};

# The processor response for card transactions.
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

# Related HATEOAS links.
public type LinkDescription record {
    # The complete target URL. To make the related call, combine the method with this URI Template-formatted link. For pre-processing, include the $, (, and ) characters. The href is the key HATEOAS component that links a completed call with a subsequent call.
    string? href;
    # The link relation type, which serves as an ID for a link that unambiguously describes the semantics of the link. See Link Relations.
    string? rel;
    # The HTTP method required to make the related call. Possible values are GET,POST,PUT,DELETE,HEAD,CONNECT,OPTIONS,PATCH.
    string? method?;
};

# Order details.
public type OrderDetails record {
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
    # The ID of the order.
    string? id?;
    # The payment source used to fund the payment.
    PaymentSourceResponse? payment_source?;
    # The intent to either capture payment immediately or authorize a payment for an order after order creation. The possible values are CAPTURE, AUTHORIZE.
    string? intent?;
    # The customer who approves and pays for the order. The customer is also known as the payer.
    Payer? payer?;
    # An array of purchase units. Each purchase unit establishes a contract between a customer and merchant. Each purchase unit represents either a full or partial order that the customer intends to purchase from the merchant.
    PurchaseUnit[]? purchase_units?;
    # The order status. The possible values are CREATED, SAVED, APPROVED, VOIDED, COMPLETED, PAYER_ACTION_REQUIRED.
    string? status?;
    # An array of request-related HATEOAS links. To complete payer approval, use the approve link to redirect the payer. The API caller has 3 hours (default setting, this which can be changed by your account manager to 24/48/72 hours to accommodate your use case) from the time the order is created, to redirect your payer. Once redirected, the API caller has 3 hours for the payer to approve the order and either authorize or capture the order. If you are not using the PayPal JavaScript SDK to initiate PayPal Checkout (in context) ensure that you include application_context.return_url is specified or you will get "We're sorry, Things don't appear to be working at the moment" after the payer approves the payment.
    LinkDescription[]? links?;
};

# The create order request
public type CreateOrderRequest record {
    # The intent to either capture payment immediately or authorize a payment for an order after order creation. The possible values are CAPTURE, AUTHORIZE.
    string? intent;
    # The customer who approves and pays for the order. The customer is also known as the payer.
    Payer? payer?;
    # An array of purchase units. Each purchase unit establishes a contract between a payer and the payee. Each purchase unit represents either a full or partial order that the payer intends to purchase from the payee.
    PurchaseUnitRequest[]? purchase_units;
    # Customize the payer experience during the approval process for the payment with PayPal.
    OrderApplicationContext? application_context?;
};

# Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
public type PaymentInstruction record {
    # An array of various fees, commissions, tips, or donations. This field is only applicable to merchants that been enabled for PayPal Commerce Platform for Marketplaces and Platforms capability.
    PlatformFee[]? platform_fees?;
    # The funds that are held on behalf of the merchant. The possible values are INSTANT, DELAYED.
    string? disbursement_mode?;
    # This field is only enabled for selected merchants/partners to use and provides the ability to trigger a specific pricing rate/plan for a payment transaction. The list of eligible 'payee_pricing_tier_id' would be provided to you by your Account Manager. Specifying values other than the one provided to you by your account manager would result in an error.
    string? payee_pricing_tier_id?;
};

# The comprehensive history of payments for the purchase unit.
public type PaymentCollection record {
    # An array of authorized payments for a purchase unit. A purchase unit can have zero or more authorized payments.
    AuthorizationWithAdditionalData[]? authorizations?;
    # An array of captured payments for a purchase unit. A purchase unit can have zero or more captured payments.
    Capture[]? captures?;
    # An array of refunds for a purchase unit. A purchase unit can have zero or more refunds.
    Refund[]? refunds?;
};

# The item tax for each unit. If tax is specified, purchase_units[].amount.breakdown.tax_total is required. Must equal tax * quantity for all items. tax.value can not be a negative number.
public type Tax record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The tokenized payment source to fund a payment.
public type Token record {
    # The PayPal-generated ID for the token.
    string? id;
    # The tokenization method that generated the ID. The possible values are BILLING_AGREEMENT.
    string? 'type;
};

# The item price or rate per unit. If you specify unit_amount, purchase_units[].amount.breakdown.item_total is required. Must equal unit_amount * quantity for all items. unit_amount.value can not be a negative number.
public type UnitAmount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The payment source definition.
public type CaptureOrderRequest record {
    # The tokenized payment source to fund a payment.
    Token? token?;
};

# The name and address of the person to whom to ship the items.
public type ShippingDetail record {
    # The name of the person to whom to ship the items. Supports only the full_name property.
    ShippingDetailName? name?;
    # The method by which the payer wants to get their items from the payee e.g shipping, in-person pickup. Either type or options but not both may be present. The possible values are SHIPPING, PICKUP_IN_PERSON.
    string? 'type?;
    # The address of the person to whom to ship the items. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
    ShippingDetailAddressPortable? address?;
};

# A captured payment for a purchase unit. A purchase unit can have zero or more captured payments.
public type Capture record {
    # The status of the captured payment.
    string? status?;
    # The details of the captured payment status.
    CaptureStatusDetails? status_details?;
};

# Item that the customer purchases from the merchant.
public type Item record {
    # The item name or title.
    string? name;
    # The item price or rate per unit. If you specify unit_amount, purchase_units[].amount.breakdown.item_total is required. Must equal unit_amount * quantity for all items. unit_amount.value can not be a negative number.
    UnitAmount? unit_amount;
    # The item tax for each unit. If tax is specified, purchase_units[].amount.breakdown.tax_total is required. Must equal tax * quantity for all items. tax.value can not be a negative number.
    Tax? tax?;
    # The item quantity. Must be a whole number.
    string? quantity;
    # The detailed item description.
    string? description?;
    # The stock keeping unit (SKU) for the item.
    string? sku?;
    # The item category type. The possible values are DIGITAL_GOODS, PHYSICAL_GOODS, DONATION.
    string? category?;
};

# The details of the captured payment status.
public type CaptureStatusDetails record {
    # The reason why the captured payment status is PENDING or DENIED. The possible values are BUYER_COMPLAINT, CHARGEBACK, ECHECK, INTERNATIONAL_WITHDRAWAL, OTHER, PENDING_REVIEW, RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION, REFUNDED, TRANSACTION_APPROVED_AWAITING_FUNDING, UNILATERAL, VERIFICATION_REQUIRED.
    string? reason?;
};

# The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
public type PayeeBase record {
    # The email address of merchant.
    string? email_address?;
    # The encrypted PayPal account ID of the merchant.
    string? merchant_id?;
};

# Created order details.
public type CreatedOrderDetails record {
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
    # The ID of the order.
    string? id?;
    # The payment source used to fund the payment.
    PaymentSourceResponse? payment_source?;
    # The intent to either capture payment immediately or authorize a payment for an order after order creation. The possible values are CAPTURE, AUTHORIZE.
    string? intent?;
    # The customer who approves and pays for the order. The customer is also known as the payer.
    Payer? payer?;
    # An array of purchase units. Each purchase unit establishes a contract between a customer and merchant. Each purchase unit represents either a full or partial order that the customer intends to purchase from the merchant.
    PurchaseUnit[]? purchase_units?;
    # The order status. The possible values are CREATED, SAVED, APPROVED, VOIDED, COMPLETED, PAYER_ACTION_REQUIRED.
    string? status?;
    # An array of request-related HATEOAS links. To complete payer approval, use the approve link to redirect the payer. The API caller has 3 hours (default setting, this which can be changed by your account manager to 24/48/72 hours to accommodate your use case) from the time the order is created, to redirect your payer. Once redirected, the API caller has 3 hours for the payer to approve the order and either authorize or capture the order. If you are not using the PayPal JavaScript SDK to initiate PayPal Checkout (in context) ensure that you include application_context.return_url is specified or you will get "We're sorry, Things don't appear to be working at the moment" after the payer approves the payment.
    LinkDescription[]? links?;
};

# The payment source used to fund the payment.
public type PaymentSourceResponse record {
    # The payment card to use to fund a payment. Card can be a credit or debit card.
    CardResponse? card?;
};

# An array of JSON patch objects to apply partial updates to resources.
public type UpdateOrderRequest Patch[]?;

# An authorized payment for a purchase unit. A purchase unit can have zero or more authorized payments.
public type AuthorizationWithAdditionalData record {
    # The processor response for card transactions.
    ProcessorResponse? processor_response?;
};

# The customer who approves and pays for the order. The customer is also known as the payer.
public type Payer record {
    # The email address of the payer.
    string? email_address?;
    # The PayPal-assigned ID for the payer.
    string? payer_id?;
};

# The source of payment for the order, which can be a token or a card. Use this object only if you have not redirected the user after order creation to approve the payment. In such cases, the user-selected payment method in the PayPal flow is implicitly used.
public type AuthorizeOrderRequest record {
    # The tokenized payment source to fund a payment.
    Token? token?;
};

# The name of the person to whom to ship the items. Supports only the full_name property.
public type ShippingDetailName record {
    # When the party is a person, the party's full name.
    string? full_name?;
};

# Results of 3D Secure Authentication.
public type ThreeDSecureAuthenticationResponse record {
    # The outcome of the issuer's authentication. The possible values are Y, N, U, A, C, R, D, I.
    string? authentication_status?;
    # Status of authentication eligibility. The possible values are Y, N, U, B.
    string? enrollment_status?;
};

# A purchase unit. Each purchase unit establishes a contract between a customer and merchant. Each purchase unit represents either a full or partial order that the customer intends to purchase from the merchant.
public type PurchaseUnit record {
    # The API caller-provided external ID for the purchase unit. Required for multiple purchase units when you must update the order through PATCH. If you omit this value and the order contains only one purchase unit, PayPal sets this value to default.
    string? reference_id?;
    # The total order amount with an optional breakdown that provides details, such as the total item amount, total tax amount, shipping, handling, insurance, and discounts, if any. If you specify amount.breakdown, the amount equals item_total plus tax_total plus shipping plus handling plus insurance minus shipping_discount minus discount. The amount must be a positive number. For listed of supported currencies and decimal precision, see the PayPal REST APIs Currency Codes.
    Amount? amount?;
    # The merchant who receives payment for this transaction.
    Payee? payee?;
    # Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
    PaymentInstruction? payment_instruction?;
    # The purchase description.
    string? description?;
    # The API caller-provided external ID. Used to reconcile API caller-initiated transactions with PayPal transactions. Appears in transaction and settlement reports.
    string? custom_id?;
    # The API caller-provided external invoice ID for this order.
    string? invoice_id?;
    # The PayPal-generated ID for the purchase unit. This ID appears in both the payer's transaction history and the emails that the payer receives. In addition, this ID is available in transaction and settlement reports that merchants and API callers can use to reconcile transactions. This ID is only available when an order is saved by calling v2/checkout/orders/id/save.
    string? id?;
    # The payment descriptor on account transactions on the customer's credit card statement, that PayPal sends to processors. The maximum length of the soft descriptor information that you can pass in the API field is 22 characters, in the following format:22 - len(PAYPAL * (8)) - len(Descriptor in Payment Receiving Preferences of Merchant account + 1)The PAYPAL prefix uses 8 characters.
    string? soft_descriptor?;
    # An array of items that the customer purchases from the merchant.
    Item[]? items?;
    # The name and address of the person to whom to ship the items.
    ShippingDetail? shipping?;
    # The comprehensive history of payments for the purchase unit.
    PaymentCollection? payments?;
};

# The total order amount with an optional breakdown that provides details, such as the total item amount, total tax amount, shipping, handling, insurance, and discounts, if any. If you specify amount.breakdown, the amount equals item_total plus tax_total plus shipping plus handling plus insurance minus shipping_discount minus discount. The amount must be a positive number. For listed of supported currencies and decimal precision, see the PayPal REST APIs Currency Codes.
public type Amount record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};

# The address of the person to whom to ship the items. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
public type ShippingDetailAddressPortable record {
    # The first line of the address. For example, number or street. For example, 173 Drury Lane. Required for data entry and compliance and risk checks. Must contain the full address.
    string? address_line_1?;
    # The second line of the address. For example, suite or apartment number.
    string? address_line_2?;
    # A city, town, or village. Smaller than admin_area_level_1.
    string? admin_area_2?;
    # The highest level sub-division in a country, which is usually a province, state, or ISO-3166-2 subdivision. Format for postal delivery. For example, CA and not California.
    string? admin_area_1?;
    # The postal code, which is the zip code or equivalent. Typically required for countries with a postal code or an equivalent.
    string? postal_code?;
    # The two-character ISO 3166-1 code that identifies the country or region.
    string? country_code;
};

# Captured payment details.
public type CapturedPaymentDetails record {
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
    # The ID of the order.
    string? id?;
    # The payment source used to fund the payment.
    PaymentSourceResponse? payment_source?;
    # The intent to either capture payment immediately or authorize a payment for an order after order creation. The possible values are CAPTURE, AUTHORIZE.
    string? intent?;
    # The customer who approves and pays for the order. The customer is also known as the payer.
    Payer? payer?;
    # An array of purchase units. Each purchase unit establishes a contract between a customer and merchant. Each purchase unit represents either a full or partial order that the customer intends to purchase from the merchant.
    PurchaseUnit[]? purchase_units?;
    # The order status. The possible values are CREATED, SAVED, APPROVED, VOIDED, COMPLETED, PAYER_ACTION_REQUIRED.
    string? status?;
    # An array of request-related HATEOAS links. To complete payer approval, use the approve link to redirect the payer. The API caller has 3 hours (default setting, this which can be changed by your account manager to 24/48/72 hours to accommodate your use case) from the time the order is created, to redirect your payer. Once redirected, the API caller has 3 hours for the payer to approve the order and either authorize or capture the order. If you are not using the PayPal JavaScript SDK to initiate PayPal Checkout (in context) ensure that you include application_context.return_url is specified or you will get "We're sorry, Things don't appear to be working at the moment" after the payer approves the payment.
    LinkDescription[]? links?;
};

# Results of Authentication such as 3D Secure.
public type AuthenticationResponse record {
    # Liability shift indicator. The outcome of the issuer's authentication. The possible values are YES, NO, POSSIBLE, UNKNOWN.
    string? liability_shift?;
    # Results of 3D Secure Authentication.
    ThreeDSecureAuthenticationResponse? three_d_secure?;
};

# Provides additional details to process a payment using a payment_source that has been stored or is intended to be stored (also referred to as stored_credential or card-on-file).
public type StoredPaymentSource record {
    # The person or party who initiated or triggered the payment. The possible values are CUSTOMER, MERCHANT.
    string? payment_initiator;
    # Indicates the type of the stored payment_source payment. The possible values are ONE_TIME, RECURRING, UNSCHEDULED.
    string? payment_type;
    # Indicates if this is a first or subsequent payment using a stored payment source (also referred to as stored credential or card on file). The possible values are FIRST, SUBSEQUENT, DERIVED.
    string? usage?;
    # Reference values used by the card network to identify a transaction. The possible values are VISA, MASTERCARD, DISCOVER, AMEX, SOLO, JCB, STAR, DELTA, SWITCH, MAESTRO, CB_NATIONALE, CONFIGOGA, CONFIDIS, ELECTRON, CETELEM, CHINA_UNION_PAY.
    NetworkTransactionReference? previous_network_transaction_reference?;
};

# Customize the payer experience during the approval process for the payment with PayPal.
public type OrderApplicationContext record {
    # The label that overrides the business name in the PayPal account on the PayPal site.
    string? brand_name?;
    # The BCP 47-formatted locale of pages that the PayPal payment experience shows. PayPal supports a five-character code. For example, da-DK, he-IL, id-ID, ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW.
    string? locale?;
    # The type of landing page to show on the PayPal site for customer checkout. The possible values are LOGIN, BILLING, NO_PREFERENCE.
    string? landing_page?;
    # The shipping preference. Displays the shipping address to the customer. Enables the customer to choose an address on the PayPal site. Restricts the customer from changing the address during the payment-approval process. The possible values are GET_FROM_FILE, NO_SHIPPING, SET_PROVIDED_ADDRESS.
    string? shipping_preference?;
    # Configures a Continue or Pay Now checkout flow. The possible values are CONTINUE, PAY_NOW.
    string? user_action?;
    # The customer and merchant payment preferences.
    PaymentMethod? payment_method?;
    # The URL where the customer is redirected after the customer approves the payment.
    string? return_url?;
    # The URL where the customer is redirected after the customer cancels the payment.
    string? cancel_url?;
    # Provides additional details to process a payment using a payment_source that has been stored or is intended to be stored (also referred to as stored_credential or card-on-file).
    StoredPaymentSource? stored_payment_source?;
};

# A refund for a purchase unit. A purchase unit can have zero or more refunds.
public type Refund record {
    # The status of the refund.
    string? status?;
    # The details of the refund status.
    RefundStatusDetails? status_details?;
};

# The details of the refund status.
public type RefundStatusDetails record {
    # The reason why the refund has the PENDING or FAILED status. The possible values are ECHECK.
    string? reason?;
};

# The payment card to use to fund a payment. Card can be a credit or debit card.
public type CardResponse record {
    # The card holder's name as it appears on the card.
    string? name?;
    # The billing address for this card. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
    CardResponseAddressPortable? billing_address?;
    # The last digits of the payment card.
    string? last_digits?;
    # The card brand or network. Typically used in the response. The possible values are VISA, MASTERCARD, DISCOVER, AMEX, SOLO, JCB, STAR, DELTA, SWITCH, MAESTRO, CB_NATIONALE, CONFIGOGA, CONFIDIS, ELECTRON, CETELEM, CHINA_UNION_PAY.
    string? brand?;
    # The payment card type. The possible values are CREDIT, DEBIT, PREPAID, UNKNOWN.
    string? 'type?;
    # Results of Authentication such as 3D Secure.
    AuthenticationResponse? authentication_result?;
};

# The billing address for this card. Supports only the address_line_1, address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
public type CardResponseAddressPortable record {
    # The first line of the address. For example, number or street. For example, 173 Drury Lane. Required for data entry and compliance and risk checks. Must contain the full address.
    string? address_line_1?;
    # The second line of the address. For example, suite or apartment number.
    string? address_line_2?;
    # A city, town, or village. Smaller than admin_area_level_1.
    string? admin_area_2?;
    # The highest level sub-division in a country, which is usually a province, state, or ISO-3166-2 subdivision. Format for postal delivery. For example, CA and not California.
    string? admin_area_1?;
    # The postal code, which is the zip code or equivalent. Typically required for countries with a postal code or an equivalent.
    string? postal_code?;
    # The two-character ISO 3166-1 code that identifies the country or region.
    string? country_code;
};

# The customer and merchant payment preferences.
public type PaymentMethod record {
    # The customer-selected payment method on the merchant site.
    string? payer_selected?;
    # The merchant-preferred payment methods. The possible values are UNRESTRICTED, IMMEDIATE_PAYMENT_REQUIRED.
    string? payee_preferred?;
    # NACHA (the regulatory body governing the ACH network) requires that API callers (merchants, partners) obtain the consumer’s explicit authorization before initiating a transaction. To stay compliant, you’ll need to make sure that you retain a compliant authorization for each transaction that you originate to the ACH Network using this API. ACH transactions are categorized (using SEC codes) by how you capture authorization from the Receiver (the person whose bank account is being debited or credited). PayPal supports the following SEC codes. The possible values are TEL, WEB, CCD, PPD.
    string? standard_entry_class_code?;
};

# Various fees, commissions, tips, or donations. This field is only applicable to merchants that been enabled for PayPal Commerce Platform for Marketplaces and Platforms capability.
public type PlatformFee record {
    # The fee for this transaction.
    MoneyForAmountForPlatformFee? amount;
    # The recipient of the fee for this transaction. If you omit this value, the default is the API caller.
    PayeeBase? payee?;
};

# Authorized order details.
public type AuthorizedOrderDetails record {
    # The date and time when the transaction occurred, in Internet date and time format.
    string? create_time?;
    # The date and time when the transaction was last updated, in Internet date and time format.
    string? update_time?;
    # The ID of the order.
    string? id?;
    # The payment source used to fund the payment.
    PaymentSourceResponse? payment_source?;
    # The intent to either capture payment immediately or authorize a payment for an order after order creation. The possible values are CAPTURE, AUTHORIZE.
    string? intent?;
    # The customer who approves and pays for the order. The customer is also known as the payer.
    Payer? payer?;
    # An array of purchase units. Each purchase unit establishes a contract between a customer and merchant. Each purchase unit represents either a full or partial order that the customer intends to purchase from the merchant.
    PurchaseUnit[]? purchase_units?;
    # The order status. The possible values are CREATED, SAVED, APPROVED, VOIDED, COMPLETED, PAYER_ACTION_REQUIRED.
    string? status?;
    # An array of request-related HATEOAS links. To complete payer approval, use the approve link to redirect the payer. The API caller has 3 hours (default setting, this which can be changed by your account manager to 24/48/72 hours to accommodate your use case) from the time the order is created, to redirect your payer. Once redirected, the API caller has 3 hours for the payer to approve the order and either authorize or capture the order. If you are not using the PayPal JavaScript SDK to initiate PayPal Checkout (in context) ensure that you include application_context.return_url is specified or you will get "We're sorry, Things don't appear to be working at the moment" after the payer approves the payment.
    LinkDescription[]? links?;
};

# A purchase unit. Each purchase unit establishes a contract between a payer and the payee. Each purchase unit represents either a full or partial order that the payer intends to purchase from the payee.
public type PurchaseUnitRequest record {
    # The API caller-provided external ID for the purchase unit. Required for multiple purchase units when you must update the order through PATCH. If you omit this value and the order contains only one purchase unit, PayPal sets this value to default.
    string? reference_id?;
    # The total order amount with an optional breakdown that provides details, such as the total item amount, total tax amount, shipping, handling, insurance, and discounts, if any. If you specify amount.breakdown, the amount equals item_total plus tax_total plus shipping plus handling plus insurance minus shipping_discount minus discount. The amount must be a positive number. For listed of supported currencies and decimal precision, see the PayPal REST APIs Currency Codes.
    Amount? amount;
    # The merchant who receives payment for this transaction.
    Payee? payee?;
    # Any additional payment instructions to be consider during payment processing. This processing instruction is applicable for Capturing an order or Authorizing an Order.
    PaymentInstruction? payment_instruction?;
    # The purchase description.
    string? description?;
    # The API caller-provided external ID. Used to reconcile client transactions with PayPal transactions. Appears in transaction and settlement reports but is not visible to the payer.
    string? custom_id?;
    # The API caller-provided external invoice number for this order. Appears in both the payer's transaction history and the emails that the payer receives.
    string? invoice_id?;
    # The soft descriptor is the dynamic text used to construct the statement descriptor that appears on a payer's card statement. If an Order is paid using the "PayPal Wallet", the statement descriptor will appear in following format on the payer's card statement, PAYPAL_prefix+(space)+merchant_descriptor+(space)+ soft_descriptor
    string? soft_descriptor?;
    # An array of items that the customer purchases from the merchant.
    Item[]? items?;
    # The name and address of the person to whom to ship the items.
    ShippingDetail? shipping?;
};

# The merchant who receives payment for this transaction.
public type Payee record {
    # The email address of merchant.
    string? email_address?;
    # The encrypted PayPal account ID of the merchant.
    string? merchant_id?;
};

# A JSON patch object to apply partial updates to resources.
public type Patch record {
    # The operation. The possible values are add, remove, replace, move, copy, test.
    string? op;
    # The JSON Pointer to the target document location at which to complete the operation.
    string? path?;
    # The value to apply. The remove operation does not require a value.
    decimal|int|string|boolean|record {}|record {}[]? value?;
    # The JSON Pointer to the target document location from which to move the value. Required for the move operation.
    string? 'from?;
};

# The fee for this transaction.
public type MoneyForAmountForPlatformFee record {
    # The three-character ISO-4217 currency code that identifies the currency.
    string? currency_code;
    # The value, which might be an integer for currencies like JPY that are not typically fractional. A decimal fraction for currencies like TND that are subdivided into thousandths. For the required number of decimal places for a currency code, see Currency Codes.
    string? value;
};
