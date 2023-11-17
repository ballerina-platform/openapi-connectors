# 
public type NotificationEventRequest record {
    # ID of the API request that caused the event. If null, the event was automatic (e.g., Stripe's automatic subscription handling). Request logs are available in the [dashboard](https://dashboard.stripe.com/logs), but currently not in the API.
    string? id?;
    # The idempotency key transmitted during the request, if any. *Note: This property is populated only for events on or after May 23, 2017*.
    string? idempotency_key?;
};

# 
public type IssuingTransactionFlightDataLeg record {
    # The three-letter IATA airport code of the flight's destination.
    string? arrival_airport_code?;
    # The airline carrier code.
    string? carrier?;
    # The three-letter IATA airport code that the flight departed from.
    string? departure_airport_code?;
    # The flight number.
    string? flight_number?;
    # The flight's service class.
    string? service_class?;
    # Whether a stopover is allowed on this flight.
    boolean? stopover_allowed?;
};

# `Customer` objects allow you to perform recurring charges, and to track
# multiple charges, that are associated with the same customer. The API allows
# you to create, delete, and update your customers. You can retrieve individual
# customers as well as a list of all your customers.
# 
# Related guide: [Save a card during payment](https://stripe.com/docs/payments/save-during-payment).
public type Customer record {
    # The customer's address.
    Address? address?;
    # Current balance, if any, being stored on the customer. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that will be added to their next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account as invoices are finalized.
    int balance?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes.
    string? currency?;
    # ID of the default payment source for the customer.
    # 
    # If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead.
    string|AlipayAccount|BankAccount|BitcoinReceiver|Card|Source? default_source?;
    # When the customer's latest invoice is billed by charging automatically, `delinquent` is `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.
    # 
    # If an invoice is marked uncollectible by [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get reset to `false`.
    boolean? delinquent?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Describes the current discount active on the customer, if there is one.
    Discount? discount?;
    # The customer's email address.
    string? email?;
    # Unique identifier for the object.
    string id;
    # The prefix for the customer used to generate unique invoice numbers.
    string? invoice_prefix?;
    # 
    InvoiceSettingCustomerSetting invoice_settings?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # The customer's full name or business name.
    string? name?;
    # The suffix of the customer's next invoice number, e.g., 0001.
    int next_invoice_sequence?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The customer's phone number.
    string? phone?;
    # The customer's preferred locales (languages), ordered by preference.
    string[]? preferred_locales?;
    # Mailing and shipping address for the customer. Appears on invoices emailed to this customer.
    Shipping? shipping?;
    # The customer's payment sources, if any.
    ApmsSourcesSourceList sources?;
    # The customer's current subscriptions, if any.
    SubscriptionList subscriptions?;
    # 
    CustomerTax tax?;
    # Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.
    string? tax_exempt?;
    # The customer's tax IDs.
    TaxIDsList tax_ids?;
};

# 
public type IssuingCardholderVerification record {
    # An identifying document, either a passport or local ID card.
    IssuingCardholderIdDocument? document?;
};

# 
public type PaymentMethodDetailsMultibanco record {
    # Entity number associated with this Multibanco payment.
    string? entity?;
    # Reference number associated with this Multibanco payment.
    string? reference?;
};

# Products describe the specific goods or services you offer to your customers.
# For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
# They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure pricing in Checkout and Subscriptions.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) or accept [one-time payments with Checkout](https://stripe.com/docs/payments/checkout/client#create-products) and more about [Products and Prices](https://stripe.com/docs/billing/prices-guide)
public type Product record {
    # Whether the product is currently available for purchase.
    boolean active;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    string? description?;
    # Unique identifier for the object.
    string id;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    string[] images;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The dimensions of this product for shipping purposes.
    PackageDimensions? package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean? shippable?;
    # Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used.
    string? statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string|TaxCode? tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
    string? unit_label?;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
    # A URL of a publicly-accessible webpage for this product.
    string? url?;
};

# 
public type SubscriptionSchedulesResourceDefaultSettingsAutomaticTax record {
    # Whether Stripe automatically computes tax on invoices created during this phase.
    boolean enabled;
};

# A VerificationSession guides you through the process of collecting and verifying the identities
# of your users. It contains details about the type of verification, such as what [verification
# check](/docs/identity/verification-checks) to perform. Only create one VerificationSession for
# each verification in your system.
# 
# A VerificationSession transitions through [multiple
# statuses](/docs/identity/how-sessions-work) throughout its lifetime as it progresses through
# the verification flow. The VerificationSession contains the user’s verified data after
# verification checks are complete.
# 
# Related guide: [The Verification Sessions API](https://stripe.com/docs/identity/verification-sessions)
public type IdentityVerificationSession record {
    # The short-lived client secret used by Stripe.js to [show a verification modal](https://stripe.com/docs/js/identity/modal) inside your app. This client secret expires after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or expose it to anyone other than the user. Make sure that you have TLS enabled on any page that includes the client secret. Refer to our docs on [passing the client secret to the frontend](https://stripe.com/docs/identity/verification-sessions#client-secret) to learn more.
    string? client_secret?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    string id;
    # If present, this property tells you the last error encountered when processing the verification.
    GelatoSessionLastError? last_error?;
    # ID of the most recent VerificationReport. [Learn more about accessing detailed verification results.](https://stripe.com/docs/identity/verification-sessions#results)
    string|IdentityVerificationReport? last_verification_report?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    GelatoVerificationSessionOptions options;
    # Redaction status of this VerificationSession. If the VerificationSession is not redacted, this field will be null.
    VerificationSessionRedaction? redaction?;
    # Status of this VerificationSession. [Learn more about the lifecycle of sessions](https://stripe.com/docs/identity/how-sessions-work).
    string status;
    # The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.
    string 'type;
    # The short-lived URL that you use to redirect a user to Stripe to submit their identity information. This URL expires after 48 hours and can only be used once. Don’t store it, log it, send it in emails or expose it to anyone other than the user. Refer to our docs on [verifying identity documents](https://stripe.com/docs/identity/verify-identity-documents?platform=web&type=redirect) to learn how to redirect users to Stripe.
    string? url?;
    # The user’s verified data.
    GelatoVerifiedOutputs? verified_outputs?;
};

public type SourceTypeKlarna record {
    string background_image_url?;
    string? client_token?;
    string first_name?;
    string last_name?;
    string locale?;
    string logo_url?;
    string page_title?;
    string pay_later_asset_urls_descriptive?;
    string pay_later_asset_urls_standard?;
    string pay_later_name?;
    string pay_later_redirect_url?;
    string pay_now_asset_urls_descriptive?;
    string pay_now_asset_urls_standard?;
    string pay_now_name?;
    string pay_now_redirect_url?;
    string pay_over_time_asset_urls_descriptive?;
    string pay_over_time_asset_urls_standard?;
    string pay_over_time_name?;
    string pay_over_time_redirect_url?;
    string payment_method_categories?;
    string purchase_country?;
    string purchase_type?;
    string redirect_url?;
    int shipping_delay?;
    string shipping_first_name?;
    string shipping_last_name?;
};

# 
public type PaymentMethodDetailsIdeal record {
    # The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    string? bank?;
    # The Bank Identifier Code of the customer's bank.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Owner's verified full name. Values are verified or provided by iDEAL directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# 
public type SourceReceiverFlow record {
    # The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
    string? address?;
    # The total amount that was moved to your balance. This is almost always equal to the amount charged. In rare cases when customers deposit excess funds and we are unable to refund those, those funds get moved to your balance and show up in amount_charged as well. The amount charged is expressed in the source's currency.
    int amount_charged;
    # The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` should be true for consumed sources unless customers deposit excess funds. The amount received is expressed in the source's currency.
    int amount_received;
    # The total amount that was returned to the customer. The amount returned is expressed in the source's currency.
    int amount_returned;
    # Type of refund attribute method, one of `email`, `manual`, or `none`.
    string refund_attributes_method;
    # Type of refund attribute status, one of `missing`, `requested`, or `available`.
    string refund_attributes_status;
};

public type V1PricesBody record {
    # Whether the price can be used for new purchases. Defaults to `true`.
    boolean active?;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    string billing_scheme?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # A lookup key used to retrieve prices dynamically from a static string.
    string lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {} metadata?;
    # A brief description of the price, hidden from customers.
    string nickname?;
    # The ID of the product that this price will belong to.
    string product?;
    # These fields can be used to create a new product that this price will belong to.
    InlineProductParams product_data?;
    # The recurring components of a price such as `interval` and `usage_type`.
    Recurring1 recurring?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    string tax_behavior?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    Tier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price, in `graduated` tiering pricing can successively change as the quantity grows.
    string tiers_mode?;
    # If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
    boolean transfer_lookup_key?;
    # Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
    TransformUsageParam transform_quantity?;
    # A positive integer in %s (or 0 for a free price) representing how much to charge.
    int unit_amount?;
    # Same as `unit_amount`, but accepts a decimal value in %s with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
    string unit_amount_decimal?;
};

# 
public type PaymentIntentNextActionWechatPayRedirectToAndroidApp record {
    # app_id is the APP ID registered on WeChat open platform
    string app_id;
    # nonce_str is a random string
    string nonce_str;
    # package is static value
    string package;
    # an unique merchant ID assigned by Wechat Pay
    string partner_id;
    # an unique trading ID assigned by Wechat Pay
    string prepay_id;
    # A signature
    string sign;
    # Specifies the current time in epoch format
    string timestamp;
};

# The Pause Collection settings determine how we will pause collection for this subscription and for how long the subscription
# should be paused.
public type SubscriptionsResourcePauseCollection record {
    # The payment collection behavior for this subscription while paused. One of `keep_as_draft`, `mark_uncollectible`, or `void`.
    string behavior;
    # The time after which the subscription will resume collecting payments.
    int? resumes_at?;
};

# 
public type InvoicesPaymentSettings record {
    # Payment-method-specific configuration to provide to the invoice’s PaymentIntent.
    InvoicesPaymentMethodOptions? payment_method_options?;
    # The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice).
    string[]? payment_method_types?;
};

# 
public type AccountBusinessProfile record {
    # [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide.
    string? mcc?;
    # The customer-facing business name.
    string? name?;
    # Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.
    string? product_description?;
    # A publicly available mailing address for sending support issues to.
    Address? support_address?;
    # A publicly available email address for sending support issues to.
    string? support_email?;
    # A publicly available phone number to call with support issues.
    string? support_phone?;
    # A publicly available website for handling support issues.
    string? support_url?;
    # The business's publicly available website.
    string? url?;
};

public type TaxRateArray string[];

public type InvoiceSettingsCustomFields CustomFieldParams[];

public type GetInvoicesUpcomingRequestBody record {
    ItemBillingThresholdsParam|string billing_thresholds?;
    boolean clear_usage?;
    boolean deleted?;
    string id?;
    record {}|string metadata?;
    string price?;
    RecurringPriceData1 price_data?;
    int quantity?;
    string[]|string tax_rates?;
};

# 
public type InvoiceSettingSubscriptionScheduleSetting record {
    # Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`.
    int? days_until_due?;
};

# 
public type GelatoVerificationReportOptions record {
    # 
    GelatoReportDocumentOptions document?;
    # 
    GelatoReportIdNumberOptions id_number?;
};

# 
public type ThreeDSecureDetails record {
    # For authenticated transactions: how the customer was authenticated by
    # the issuing bank.
    string? authentication_flow?;
    # Indicates the outcome of 3D Secure authentication.
    string? result?;
    # Additional information about why 3D Secure succeeded or failed based
    # on the `result`.
    string? result_reason?;
    # The version of 3D Secure that was used.
    string? 'version?;
};

public type ExternalAccount BankAccount|Card;

# These fields can be used to create a new product that this price will belong to.
public type InlineProductParams record {
    # Whether the product is currently available for purchase. Defaults to true.
    boolean active?;
    # The ID of the product that this price will belong to.
    string id?;
    # Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to metadata
    record {} metadata?;
    # The product’s name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions
    string name;
    # An arbitrary string to be displayed on your customer’s credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all
    string statement_descriptor?;
    # A tax code ID
    string tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions
    string unit_label?;
};

# 
public type AccountSepaDebitPaymentsSettings record {
    # SEPA creditor identifier that identifies the company making the payment.
    string creditor_id?;
};

# 
public type ChargeTransferData record {
    # The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account.
    int? amount?;
    # ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.
    string|Account destination;
};

# 
public type PaymentIntentNextActionVerifyWithMicrodeposits record {
    # The timestamp when the microdeposits are expected to land.
    int arrival_date;
    # The URL for the hosted verification page, which allows customers to verify their bank account.
    string hosted_verification_url;
};

# 
public type BalanceAmountBySourceType record {
    # Amount for bank account.
    int bank_account?;
    # Amount for card.
    int card?;
    # Amount for FPX.
    int fpx?;
};

# 
public type SubscriptionScheduleCurrentPhase record {
    # The end of this phase of the subscription schedule.
    int end_date;
    # The start of this phase of the subscription schedule.
    int start_date;
};

public type PaymentMethodAttachBody record {
    # The ID of the customer to which to attach the PaymentMethod.
    string customer;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
};

# 
public type PaymentMethodDetailsP24 record {
    # The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`.
    string? bank?;
    # Unique reference for this Przelewy24 payment.
    string? reference?;
    # Owner's verified full name. Values are verified or provided by Przelewy24 directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # Przelewy24 rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

# 
public type AccountTosAcceptance record {
    # The Unix timestamp marking when the account representative accepted their service agreement
    int? date?;
    # The IP address from which the account representative accepted their service agreement
    string? ip?;
    # The user's service agreement type
    string service_agreement?;
    # The user agent of the browser from which the account representative accepted their service agreement
    string? user_agent?;
};

# 
public type AutomaticTax record {
    # Whether Stripe automatically computes tax on this invoice.
    boolean enabled;
    # The status of the most recent automated tax calculation for this invoice.
    string? status?;
};

# A `Transfer` object is created when you move funds between Stripe accounts as
# part of Connect.
# 
# Before April 6, 2017, transfers also represented movement of funds from a
# Stripe account to a card or bank account. This behavior has since been split
# out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding payout endpoints. For more
# information, read about the
# [transfer/payout split](https://stripe.com/docs/transfer-payout-split).
# 
# Related guide: [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers).
public type Transfer record {
    # Amount in %s to be transferred.
    int amount;
    # Amount in %s reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).
    int amount_reversed;
    # Balance transaction that describes the impact of this transfer on your account balance.
    string|BalanceTransaction? balance_transaction?;
    # Time that this record of the transfer was first created.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # ID of the Stripe account the transfer was sent to.
    string|Account? destination?;
    # If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer.
    string|Charge destination_payment?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # A list of reversals that have been applied to the transfer.
    TransferReversalList reversals;
    # Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.
    boolean reversed;
    # ID of the charge or payment that was used to fund the transfer. If null, the transfer was funded from the available balance.
    string|Charge? source_transaction?;
    # The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.
    string? source_type?;
    # A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
    string? transfer_group?;
};

# 
public type PaymentMethodAcssDebit record {
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Institution number of the bank account.
    string? institution_number?;
    # Last four digits of the bank account number.
    string? last4?;
    # Transit number of the bank account.
    string? transit_number?;
};

# A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.
# 
# Related guide: [Subscription Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
public type SubscriptionSchedule record {
    # Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch.
    int? canceled_at?;
    # Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch.
    int? completed_at?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`.
    SubscriptionScheduleCurrentPhase? current_phase?;
    # ID of the customer who owns the subscription schedule.
    string|Customer|DeletedCustomer customer;
    # Object representing the subscription schedule’s default settings
    SubscriptionSchedulesResourceDefaultSettings default_settings;
    # Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` and `cancel`.
    string end_behavior;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Configuration for the subscription schedule's phases.
    SubscriptionSchedulePhaseConfiguration[] phases;
    # Time at which the subscription schedule was released. Measured in seconds since the Unix epoch.
    int? released_at?;
    # ID of the subscription once managed by the subscription schedule (if it is released).
    string? released_subscription?;
    # The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
    string status;
    # ID of the subscription managed by the subscription schedule.
    string|Subscription? subscription?;
};

# 
public type IssuingCardAuthorizationControls record {
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    string[]? allowed_categories?;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    string[]? blocked_categories?;
    # Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
    IssuingCardSpendingLimit[]? spending_limits?;
    # Currency of the amounts within `spending_limits`. Always the same as the currency of the card.
    string? spending_limits_currency?;
};

# 
public type DeletedBankAccount record {
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string? currency?;
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# To share the contents of a `File` object with non-Stripe users, you can
# create a `FileLink`. `FileLink`s contain a URL that can be used to
# retrieve the contents of the file without authentication.
public type FileLink record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Whether this link is already expired.
    boolean expired;
    # Time at which the link expires.
    int? expires_at?;
    # The file object this link points to.
    string|File file;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The publicly accessible URL to download the file.
    string? url?;
};

# 
public type PaymentMethodGrabpay record {
};

# 
public type SourceOrderItem record {
    # The amount (price) for this order item.
    int? amount?;
    # This currency of this order item. Required when `amount` is present.
    string? currency?;
    # Human-readable description for this order item.
    string? description?;
    # The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
    string? parent?;
    # The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
    int quantity?;
    # The type of this order item. Must be `sku`, `tax`, or `shipping`.
    string? 'type?;
};

public type SubscriptionItemsItemBody record {
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. When updating, pass an empty string to remove previously-defined thresholds.
    BillingThresholds|string billing_thresholds?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    AdditionalProperties|string metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.
    # 
    # Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    string payment_behavior?;
    # The ID of the price object. When changing a subscription item's price, `quantity` is set to 1 unless a `quantity` parameter is provided.
    string price?;
    # Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
    RecurringPriceData price_data?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.
    # 
    # Prorations can be disabled by passing `none`.
    string proration_behavior?;
    # If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
    int proration_date?;
    # The quantity you'd like to apply to the subscription item you're creating.
    int quantity?;
    # A list of [Tax Rate](https://stripe.com/docs/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://stripe.com/docs/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
    TaxRateArray|string tax_rates?;
};

# 
public type LegalEntityPersonVerification record {
    # A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
    LegalEntityPersonVerificationDocument? additional_document?;
    # A user-displayable string describing the verification state for the person. For example, this may say "Provided identity information could not be verified".
    string? details?;
    # One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`, `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`, `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the verification state for the person.
    string? details_code?;
    # 
    LegalEntityPersonVerificationDocument document?;
    # The state of verification for the person. Possible values are `unverified`, `pending`, or `verified`.
    string status;
};

# 
public type LegalEntityCompanyVerificationDocument record {
    # The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
    string|File? back?;
    # A user-displayable string describing the verification state of this document.
    string? details?;
    # One of `document_corrupt`, `document_expired`, `document_failed_copy`, `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or `document_too_large`. A machine-readable code specifying the verification state for this document.
    string? details_code?;
    # The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
    string|File? front?;
};

# 
public type InvoiceItemThresholdReason record {
    # The IDs of the line items that triggered the threshold invoice.
    string[] line_item_ids;
    # The quantity threshold boundary that applied to the given line item.
    int usage_gte;
};

# 
public type InvoiceTaxAmount record {
    # The amount, in %s, of the tax.
    int amount;
    # Whether this tax amount is inclusive or exclusive.
    boolean inclusive;
    # The tax rate that was applied to get this tax amount.
    string|TaxRate tax_rate;
};

# 
public type StatusTransitions record {
    # The time that the order was canceled.
    int? canceled?;
    # The time that the order was fulfilled.
    int? fulfiled?;
    # The time that the order was paid.
    int? paid?;
    # The time that the order was returned.
    int? returned?;
};

# 
public type TransferData record {
    # Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount?;
    # The account (if any) the payment will be attributed to for tax
    # reporting, and where funds from the payment will be transferred to upon
    # payment success.
    string|Account destination;
};

# 
public type PaymentMethodCardWalletVisaCheckout record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# The Billing customer portal is a Stripe-hosted UI for subscription and
# billing management.
# 
# A portal configuration describes the functionality and features that you
# want to provide to your customers through the portal.
# 
# A portal session describes the instantiation of the customer portal for
# a particular customer. By visiting the session's URL, the customer
# can manage their subscriptions and billing details. For security reasons,
# sessions are short-lived and will expire if the customer does not visit the URL.
# Create sessions on-demand when customers intend to manage their subscriptions
# and billing details.
# 
# Learn more in the [product overview](https://stripe.com/docs/billing/subscriptions/customer-portal)
# and [integration guide](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).
public type BillingPortalSession record {
    # The configuration used by this session, describing the features available.
    string|BillingPortalConfiguration configuration;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the customer for this session.
    string customer;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used.
    string? locale?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of). Use the [Accounts API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays.
    string? on_behalf_of?;
    # The URL to redirect customers to when they click on the portal's link to return to your website.
    string return_url;
    # The short-lived URL of the session that gives customers access to the customer portal.
    string url;
};

# 
public type PaymentFlowsPrivatePaymentMethodsAlipay record {
};

public type SubscriptionCancelAt int|string;

# 
public type PaymentMethodDetailsCardWalletMasterpass record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type PortalSubscriptionCancellationReason record {
    # Whether the feature is enabled.
    boolean enabled;
    # Which cancellation reasons will be given as options to the customer.
    string[] options;
};

# 
public type IssuingDisputeMerchandiseNotAsDescribedEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Date when the product was received.
    int? received_at?;
    # Description of the cardholder's attempt to return the product.
    string? return_description?;
    # Result of cardholder's attempt to return the product.
    string? return_status?;
    # Date when the product was returned or attempted to be returned.
    int? returned_at?;
};

# 
public type QuotesResourceFromQuote record {
    # Whether this quote is a revision of a different quote.
    boolean is_revision;
    # The quote that was cloned.
    string|Quote quote;
};

# These bank accounts are payment methods on `Customer` objects.
# 
# On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer
# destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts).
# They can be bank accounts or debit cards as well, and are documented in the links above.
# 
# Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
public type BankAccount record {
    # The ID of the account that the bank account is associated with.
    string|Account? account?;
    # The name of the person or business that owns the bank account.
    string? account_holder_name?;
    # The type of entity that holds the account. This can be either `individual` or `company`.
    string? account_holder_type?;
    # The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`.
    string? account_type?;
    # A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout.
    string[]? available_payout_methods?;
    # Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
    string? bank_name?;
    # Two-letter ISO code representing the country the bank account is located in.
    string country;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string currency;
    # The ID of the customer that the bank account is associated with.
    string|Customer|DeletedCustomer? customer?;
    # Whether this bank account is the default external account for its currency.
    boolean? default_for_currency?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Unique identifier for the object.
    string id;
    # The last four digits of the bank account number.
    string last4;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The routing transit number for the bank account.
    string? routing_number?;
    # For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.
    # 
    # For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.
    string status;
};

# 
public type IssuingAuthorizationPendingRequest record {
    # The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://stripe.com/docs/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    IssuingAuthorizationAmountDetails? amount_details?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # If set `true`, you may provide [amount](https://stripe.com/docs/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
    boolean is_amount_controllable;
    # The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The local currency the merchant is requesting to authorize.
    string merchant_currency;
};

# 
public type PaymentMethodCardWalletAmexExpressCheckout record {
};

public type SourceTypeCard record {
    string? address_line1_check?;
    string? address_zip_check?;
    string? brand?;
    string? country?;
    string? cvc_check?;
    string? dynamic_last4?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? name?;
    string three_d_secure?;
    string? tokenization_method?;
};

public type TaxParam1 record {
    string|string ip_address?;
};

# 
public type MandateAcssDebit record {
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    string payment_schedule;
    # Transaction type of the mandate.
    string transaction_type;
};

# 
public type PaymentIntentPaymentMethodOptionsCard record {
    # Installment details for this payment (Mexico only).
    # 
    # For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
    PaymentMethodOptionsCardInstallments? installments?;
    # Selected network to process this payment intent on. Depends on the available networks of the card attached to the payment intent. Can be only set confirm-time.
    string? network?;
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    string? request_three_d_secure?;
};

public type InlineResponse2001 Customer|DeletedCustomer;

# 
public type SourceMandateNotificationBacsDebitData record {
    # Last 4 digits of the account number associated with the debit.
    string last4?;
};

# The customer's current subscriptions, if any.
public type SubscriptionList record {
    # Details about each object.
    Subscription[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type PaymentFlowsPrivatePaymentMethodsAlipayDetails record {
    # Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.
    string? fingerprint?;
    # Transaction ID of this particular Alipay transaction.
    string? transaction_id?;
};

# 
public type InlineResponse2003 record {
    SubscriptionSchedule[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type InlineResponse2002 record {
    Subscription[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# List of items contained within this value list.
public type RadarListListItemList record {
    # Details about each object.
    RadarValueListItem[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type DeletedProduct record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.
# 
# Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).
public type RadarValueListItem record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The name or email address of the user who added this item to the value list.
    string created_by;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The value of the item.
    string value;
    # The identifier of the value list this item belongs to.
    string value_list;
};

# 
public type DeletedCustomer record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type DeletedInvoiceitem record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type ShippingMethod record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The estimated delivery date for the given shipping method. Can be either a specific date or a range.
    DeliveryEstimate? delivery_estimate?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string description;
    # Unique identifier for the object.
    string id;
};

# 
public type PaymentMethodOptionsIdeal record {
};

# 
public type CustomerTaxLocation record {
    # The customer's country as identified by Stripe Tax.
    string country;
    # The data source used to infer the customer's location.
    string 'source;
    # The customer's state, county, province, or region as identified by Stripe Tax.
    string? state?;
};

# 
public type IssuingTransactionLodgingData record {
    # The time of checking into the lodging.
    int? check_in_at?;
    # The number of nights stayed at the lodging.
    int? nights?;
};

# 
public type PaymentMethodDetailsInteracPresent record {
    # Card brand. Can be `interac`, `mastercard` or `visa`.
    string? brand?;
    # The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
    string? cardholder_name?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Authorization response cryptogram.
    string? emv_auth_data?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
    string? generated_card?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # EMV tag 5F2D. Preferred languages specified by the integrated circuit chip.
    string[]? preferred_locales?;
    # How card details were read in this transaction.
    string? read_method?;
    # A collection of fields required to be displayed on receipts. Only required for EMV transactions.
    PaymentMethodDetailsInteracPresentReceipt? receipt?;
};

# 
public type UsageEventsResourceUsageRecordSummaryList record {
    UsageRecordSummary[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type DeletedSubscriptionItem record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type QuotesResourceTotalDetails record {
    # This is the sum of all the line item discounts.
    int amount_discount;
    # This is the sum of all the line item shipping amounts.
    int? amount_shipping?;
    # This is the sum of all the line item tax amounts.
    int amount_tax;
    # 
    QuotesResourceTotalDetailsResourceBreakdown breakdown?;
};

public type CustomFieldParams record {
    string name;
    string value;
};

# A list of refunds that have been applied to the charge.
public type RefundList record {
    # Details about each object.
    Refund[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type ApiErrors record {
    # For card errors, the ID of the failed charge.
    string charge?;
    # For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.
    string code?;
    # For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.
    string decline_code?;
    # A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.
    string doc_url?;
    # A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.
    string message?;
    # If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field.
    string param?;
    # A PaymentIntent guides you through the process of collecting a payment from your customer.
    # We recommend that you create exactly one PaymentIntent for each order or
    # customer session in your system. You can reference the PaymentIntent later to
    # see the history of payment attempts for a particular session.
    # 
    # A PaymentIntent transitions through
    # [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses)
    # throughout its lifetime as it interfaces with Stripe.js to perform
    # authentication flows and ultimately creates at most one successful charge.
    # 
    # Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
    PaymentIntent payment_intent?;
    # PaymentMethod objects represent your customer's payment instruments.
    # They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to
    # Customer objects to store instrument details for future payments.
    # 
    # Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
    PaymentMethod payment_method?;
    # If the error is specific to the type of payment method, the payment method type that had a problem. This field is only populated for invoice-related errors.
    string payment_method_type?;
    # A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments.
    # For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment.
    # Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.
    # 
    # Create a SetupIntent as soon as you're ready to collect your customer's payment credentials.
    # Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid.
    # The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides
    # you through the setup process.
    # 
    # Successful SetupIntents result in payment credentials that are optimized for future payments.
    # For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through
    # [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection
    # in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents).
    # If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success,
    # it will automatically attach the resulting payment method to that Customer.
    # We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on
    # PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.
    # 
    # By using SetupIntents, you ensure that your customers experience the minimum set of required friction,
    # even as regulations change over time.
    # 
    # Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
    SetupIntent setup_intent?;
    # The source object for errors returned on a request involving a source.
    BankAccount|Card|Source 'source?;
    # The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or `invalid_request_error`
    string 'type;
};

# 
public type PaymentMethodAuBecsDebit record {
    # Six-digit number identifying bank and branch associated with this bank account.
    string? bsb_number?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
};

# 
public type PersonRelationship record {
    # Whether the person is a director of the account's legal entity. Currently only required for accounts in the EU. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
    boolean? director?;
    # Whether the person has significant responsibility to control, manage, or direct the organization.
    boolean? executive?;
    # Whether the person is an owner of the account’s legal entity.
    boolean? owner?;
    # The percent owned by the person of the account's legal entity.
    decimal? percent_ownership?;
    # Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
    boolean? representative?;
    # The person's title (e.g., CEO, Support Engineer).
    string? title?;
};

# An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.
# 
# Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
public type IssuingCardholder record {
    # The cardholder’s billing information
    IssuingCardholderAddress billing;
    # Additional information about a `company` cardholder.
    IssuingCardholderCompany? company?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The cardholder's email address.
    string? email?;
    # Unique identifier for the object.
    string id;
    # Additional information about an `individual` cardholder.
    IssuingCardholderIndividual? individual?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The cardholder's name. This will be printed on cards issued to them.
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://stripe.com/docs/issuing/3d-secure#when-is-3d-secure-applied) for more details.
    string? phone_number?;
    # 
    IssuingCardholderRequirements requirements;
    # Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
    IssuingCardholderAuthorizationControls? spending_controls?;
    # Specifies whether to permit authorizations on this cardholder's cards.
    string status;
    # One of `individual` or `company`.
    string 'type;
};

# If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
public type PaymentMethodParam record {
    # Customer’s bank account number
    string account_number;
    # Institution number of the customer’s bank
    string institution_number;
    # Transit number of the customer’s bank
    string transit_number;
};

# 
public type DeliveryEstimate record {
    # If `type` is `"exact"`, `date` will be the expected delivery date in the format YYYY-MM-DD.
    string date?;
    # If `type` is `"range"`, `earliest` will be be the earliest delivery date in the format YYYY-MM-DD.
    string earliest?;
    # If `type` is `"range"`, `latest` will be the latest delivery date in the format YYYY-MM-DD.
    string latest?;
    # The type of estimate. Must be either `"range"` or `"exact"`.
    string 'type;
};

# 
public type SetupAttemptPaymentMethodDetailsAuBecsDebit record {
};

# 
public type PaymentMethodOptionsAfterpayClearpay record {
    # Order identifier shown to the merchant in Afterpay’s online portal. We recommend using a value that helps you answer any questions a customer might have about
    # the payment. The identifier is limited to 128 characters and may contain only letters, digits, underscores, backslashes and dashes.
    string? reference?;
};

# The cardholder’s billing information
public type IssuingCardholderAddress record {
    # 
    Address address;
};

# 
public type PaymentMethodDetailsCardWalletApplePay record {
};

public type SourceTypeWechat record {
    string prepay_id?;
    string? qr_code_url?;
    string statement_descriptor?;
};

# A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
public type FileFileLinkList record {
    # Details about each object.
    FileLink[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type ChargeFraudDetails record {
    # Assessments from Stripe. If set, the value is `fraudulent`.
    string stripe_report?;
    # Assessments reported by you. If set, possible values of are `safe` and `fraudulent`.
    string user_report?;
};

# 
public type PortalSubscriptionCancel record {
    # 
    PortalSubscriptionCancellationReason cancellation_reason?;
    # Whether the feature is enabled.
    boolean enabled;
    # Whether to cancel subscriptions immediately or at the end of the billing period.
    string mode;
    # Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`.
    string proration_behavior;
};

# 
public type PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown record {
    # The aggregated line item discounts.
    LineItemsDiscountAmount[] discounts;
    # The aggregated line item tax amounts by rate.
    LineItemsTaxAmount[] taxes;
};

# Object representing the subscription schedule's default settings.
public type DefaultSettingsParams record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner’s Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage.
    decimal application_fee_percent?;
    # Default settings for automatic tax computation
    AutomaticTaxConfig2 automatic_tax?;
    # Can be set to phase_start to set the anchor to the start of the phase or automatic to automatically change it if needed. Cannot be set to phase_start if this phase specifies a trial
    string billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds
    BillingThresholdParams|string billing_thresholds?;
    # Either charge_automatically, or send_invoice. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to charge_automatically on creation
    string collection_method?;
    # ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer’s invoice settings
    string default_payment_method?;
    # All invoices will be billed using the specified settings
    SubscriptionSchedulesParam invoice_settings?;
    # The data with which to automatically create a Transfer for each of the associated subscription’s invoices
    TransferDataSpecs|string transfer_data?;
};

public type InvoicesInvoiceBody record {
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    string[]|string account_tax_ids?;
    # A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
    int application_fee_amount?;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
    boolean auto_advance?;
    # Settings for automatic tax lookup for this invoice.
    AutomaticTaxParam automatic_tax?;
    # Either `charge_automatically` or `send_invoice`. This field can be updated only on `draft` invoices.
    string collection_method?;
    # A list of up to 4 custom fields to be displayed on the invoice. If a value for `custom_fields` is specified, the list specified will replace the existing custom field list on this invoice. Pass an empty string to remove previously-defined fields.
    InvoiceSettingsCustomFields|string custom_fields?;
    # The number of days from which the invoice is created until it is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
    int days_until_due?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    string default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    string default_source?;
    # The tax rates that will apply to any line item that does not have `tax_rates` set. Pass an empty string to remove previously-defined tax rates.
    string[]|string default_tax_rates?;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    string description?;
    # The discounts that will apply to the invoice. Pass an empty string to remove previously-defined discounts.
    DiscountsDataParam|string discounts?;
    # The date on which payment for this invoice is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
    int due_date?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Footer to be displayed on the invoice.
    string footer?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string|string on_behalf_of?;
    # Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
    PaymentSettings payment_settings?;
    # Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
    string statement_descriptor?;
    # If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge. This will be unset if you POST an empty value.
    DiscountsDataParam|string transfer_data?;
};

# 
public type SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit record {
};

# The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
public type Invoicelineslist1 record {
    # Details about each object.
    LineItem[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

public type AdditionalProperties record {
};

# 
public type SetupAttemptPaymentMethodDetailsIdeal record {
    # The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    string? bank?;
    # The Bank Identifier Code of the customer's bank.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Owner's verified full name. Values are verified or provided by iDEAL directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# Account Links are the means by which a Connect platform grants a connected account permission to access
# Stripe-hosted applications, such as Connect Onboarding.
# 
# Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).
public type AccountLink record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The timestamp at which this account link will expire.
    int expires_at;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The URL for the account link.
    string url;
};

# 
public type DiscountsResourceDiscountAmount record {
    # The amount, in %s, of the discount.
    int amount;
    # The discount that was applied to get this discount amount.
    string|Discount|DeletedDiscount discount;
};

# 
public type PaymentMethodCardWalletMasterpass record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type PaymentMethodIdeal record {
    # The customer's bank, if provided. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    string? bank?;
    # The Bank Identifier Code of the customer's bank, if the bank was provided.
    string? bic?;
};

# 
public type QuotesResourceRecurring record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    string interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # 
    QuotesResourceTotalDetails total_details;
};

public type CustomerDetailsParam record {
    CustomerAdresss|string address?;
    CustomerAddressWithName|string shipping?;
    TaxParam1 tax?;
    string tax_exempt?;
    DataParams[] tax_ids?;
};

# 
public type PaymentMethodDetailsCardChecks record {
    # If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_postal_code_check?;
    # If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? cvc_check?;
};

public type SubscriptionItemCreateParams record {
    ItemBillingThresholdsParam|string billing_thresholds?;
    record {} metadata?;
    string price?;
    RecurringPriceData1 price_data?;
    int quantity?;
    TaxRateArray|string tax_rates?;
};

# 
public type BalanceDetail record {
    # Funds that are available for use.
    BalanceAmount[] available;
};

# 
public type PaymentMethodP24 record {
    # The customer's bank, if provided.
    string? bank?;
};

public type Period1 record {
    int end;
    int 'start;
};

public type TokenParamas record {
    string token;
};

# 
public type SourceTransactionChfCreditTransferData record {
    # Reference associated with the transfer.
    string reference?;
    # Sender's country address.
    string sender_address_country?;
    # Sender's line 1 address.
    string sender_address_line1?;
    # Sender's bank account IBAN.
    string sender_iban?;
    # Sender's name.
    string sender_name?;
};

# Object representing the subscription schedule's default settings.
public type DefaultSettingsParams1 record {
    decimal application_fee_percent?;
    AutomaticTaxConfig3 automatic_tax?;
    string billing_cycle_anchor?;
    BillingThresholdParams|string billing_thresholds?;
    string collection_method?;
    string default_payment_method?;
    SubscriptionSchedulesParam1 invoice_settings?;
    TransferDataSpecs|string transfer_data?;
};

# 
public type CardList record {
    Card[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type IssuingDisputeServiceNotAsDescribedEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when order was canceled.
    int? canceled_at?;
    # Reason for canceling the order.
    string? cancellation_reason?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Date when the product was received.
    int? received_at?;
};

public type SourceTypeThreeDSecure record {
    string? address_line1_check?;
    string? address_zip_check?;
    boolean? authenticated?;
    string? brand?;
    string? card?;
    string? country?;
    string? customer?;
    string? cvc_check?;
    string? dynamic_last4?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? name?;
    string three_d_secure?;
    string? tokenization_method?;
};

public type RecurringPriceData1 record {
    string currency;
    string product;
    RecurringAdhoc recurring;
    string tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

public type V1CustomersBody record {
    # The customer's address.
    CustomerAdresss|string address?;
    # An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
    int balance?;
    string coupon?;
    # An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
    string description?;
    # Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
    string email?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
    string invoice_prefix?;
    # Default invoice settings for this customer.
    CustomerParam invoice_settings?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    AdditionalProperties|string metadata?;
    # The customer's full name or business name.
    string name?;
    # The sequence to be used on the customer's next invoice. Defaults to 1.
    int next_invoice_sequence?;
    string payment_method?;
    # The customer's phone number.
    string phone?;
    # Customer's preferred languages, ordered by preference.
    string[] preferred_locales?;
    # The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
    string promotion_code?;
    # The customer's shipping information. Appears on invoices emailed to this customer.
    CustomerAddressWithName|string shipping?;
    string 'source?;
    # Tax details about the customer.
    TaxParam tax?;
    # The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
    string tax_exempt?;
    # The customer's tax IDs.
    DataParams[] tax_id_data?;
};

public type SourceTypeEps record {
    string? reference?;
    string? statement_descriptor?;
};

# 
public type IssuingDisputeOtherEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    string? product_type?;
};

public type PaymentMethodTypesArray string[];

# 
public type DeletedRadarValueList record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments.
# For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment.
# Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.
# 
# Create a SetupIntent as soon as you're ready to collect your customer's payment credentials.
# Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid.
# The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides
# you through the setup process.
# 
# Successful SetupIntents result in payment credentials that are optimized for future payments.
# For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through
# [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection
# in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents).
# If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success,
# it will automatically attach the resulting payment method to that Customer.
# We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on
# PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.
# 
# By using SetupIntents, you ensure that your customers experience the minimum set of required friction,
# even as regulations change over time.
# 
# Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
public type SetupIntent record {
    # ID of the Connect application that created the SetupIntent.
    string|Application? application?;
    # Reason for cancellation of this SetupIntent, one of `abandoned`, `requested_by_customer`, or `duplicate`.
    string? cancellation_reason?;
    # The client secret of this SetupIntent. Used for client-side retrieval using a publishable key.
    # 
    # The client secret can be used to complete payment setup from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    string? client_secret?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # ID of the Customer this SetupIntent belongs to, if one exists.
    # 
    # If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
    string|Customer|DeletedCustomer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    string id;
    # The error encountered in the previous SetupIntent confirmation.
    ApiErrors? last_setup_error?;
    # The most recent SetupAttempt for this SetupIntent.
    string|SetupAttempt? latest_attempt?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # ID of the multi use Mandate generated by the SetupIntent.
    string|Mandate? mandate?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # If present, this property tells you what actions you need to take in order for your customer to continue payment setup.
    SetupIntentNextAction? next_action?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account (if any) for which the setup is intended.
    string|Account? on_behalf_of?;
    # ID of the payment method used with this SetupIntent.
    string|PaymentMethod? payment_method?;
    # Payment-method-specific configuration for this SetupIntent.
    SetupIntentPaymentMethodOptions? payment_method_options?;
    # The list of payment method types (e.g. card) that this SetupIntent is allowed to set up.
    string[] payment_method_types;
    # ID of the single_use Mandate generated by the SetupIntent.
    string|Mandate? single_use_mandate?;
    # [Status](https://stripe.com/docs/payments/intents#intent-statuses) of this SetupIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `canceled`, or `succeeded`.
    string status;
    # Indicates how the payment method is intended to be used in the future.
    # 
    # Use `on_session` if you intend to only reuse the payment method when the customer is in your checkout flow. Use `off_session` if your customer may or may not be in your checkout flow. If not provided, this value defaults to `off_session`.
    string usage;
};

# As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.
# 
# Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)
public type IssuingDispute record {
    # Disputed amount. Usually the amount of the `transaction`, but can differ (usually because of currency fluctuation).
    int amount;
    # List of balance transactions associated with the dispute.
    BalanceTransaction[]? balance_transactions?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The currency the `transaction` was made in.
    string currency;
    # Evidence for the dispute. Evidence contains exactly two non-null fields: the reason for the dispute and the associated evidence field for the selected reason
    IssuingDisputeEvidence evidence;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Current status of the dispute.
    string status;
    # The transaction being disputed.
    string|IssuingTransaction 'transaction;
};

# 
public type CardIssuingAccountTermsOfService record {
    # The Unix timestamp marking when the account representative accepted the service agreement.
    int? date?;
    # The IP address from which the account representative accepted the service agreement.
    string? ip?;
    # The user agent of the browser from which the account representative accepted the service agreement.
    string user_agent?;
};

# 
public type DeletedPerson record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PaymentMethodSepaDebit record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Branch code of bank associated with the bank account.
    string? branch_code?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Information about the object that generated this PaymentMethod.
    SepaDebitGeneratedFrom? generated_from?;
    # Last four characters of the IBAN.
    string? last4?;
};

# 
public type PaymentMethodDetailsGrabpay record {
    # Unique transaction id generated by GrabPay
    string? transaction_id?;
};

# 
public type SetupAttemptPaymentMethodDetailsBancontact record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    string? preferred_language?;
    # Owner's verified full name. Values are verified or provided by Bancontact directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

public type DeletedExternalAccount DeletedBankAccount|DeletedCard;

# 
public type PaymentMethodDetailsStripeAccount record {
};

# List of subscription items, each with an attached price.
public type SubscriptionItemList record {
    # Details about each object.
    SubscriptionItem[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type TaxIdVerification record {
    # Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`.
    string status;
    # Verified address.
    string? verified_address?;
    # Verified name.
    string? verified_name?;
};

# Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
# 
# Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
public type TaxRate record {
    # Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
    boolean active;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
    string? description?;
    # The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
    string display_name;
    # Unique identifier for the object.
    string id;
    # This specifies if the tax rate is inclusive or exclusive.
    boolean inclusive;
    # The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
    string? jurisdiction?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # This represents the tax rate percent out of 100.
    decimal percentage;
    # [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
    string? state?;
    # The high-level tax type, such as `vat` or `sales_tax`.
    string? tax_type?;
};

# 
public type Shipping record {
    # 
    Address address?;
    # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
    string? carrier?;
    # Recipient name.
    string? name?;
    # Recipient phone (including extension).
    string? phone?;
    # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
    string? tracking_number?;
};

# 
public type AccountDashboardSettings record {
    # The display name for this account. This is used on the Stripe Dashboard to differentiate between accounts.
    string? display_name?;
    # The timezone used in the Stripe Dashboard for this account. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones).
    string? timezone?;
};

# 
public type SourceMandateNotificationSepaDebitData record {
    # SEPA creditor ID.
    string creditor_identifier?;
    # Last 4 digits of the account number associated with the debit.
    string last4?;
    # Mandate reference associated with the debit.
    string mandate_reference?;
};

# A coupon contains information about a percent-off or amount-off discount you
# might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
# [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
public type Coupon record {
    # Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.
    int? amount_off?;
    # Contains information about what this coupon applies to
    CouponAppliesTo applies_to?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off.
    string? currency?;
    # One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this coupon will get the discount.
    string duration;
    # If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`.
    int? duration_in_months?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid.
    int? max_redemptions?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # Name of the coupon displayed to customers on for instance invoices or receipts.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100 invoice %s50 instead.
    decimal? percent_off?;
    # Date after which the coupon can no longer be redeemed.
    int? redeem_by?;
    # Number of times this coupon has been applied to a customer.
    int times_redeemed;
    # Taking account of the above properties, whether this coupon can still be applied to a customer.
    boolean valid;
};

# 
public type PaymentMethodDetailsCardWalletSamsungPay record {
};

# 
public type QuotesResourceSubscriptionData record {
    # When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. This date is ignored if it is in the past when the quote is accepted. Measured in seconds since the Unix epoch.
    int? effective_date?;
    # Integer representing the number of trial period days before the customer is charged for the first time.
    int? trial_period_days?;
};

# 
public type DeletedAccount record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PaymentMethodDetailsWechatPay record {
    # Uniquely identifies this particular WeChat Pay account. You can use this attribute to check whether two WeChat accounts are the same.
    string? fingerprint?;
    # Transaction ID of this particular WeChat Pay transaction.
    string? transaction_id?;
};

# 
public type PaymentMethodBancontact record {
};

# 
public type PlatformTaxFee record {
    # The Connected account that incurred this charge.
    string account;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The payment object that caused this tax to be inflicted.
    string source_transaction;
    # The type of tax (VAT).
    string 'type;
};

# 
public type IssuingAuthorizationVerificationData record {
    # Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`.
    string address_line1_check;
    # Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`.
    string address_postal_code_check;
    # Whether the cardholder provided a CVC and if it matched Stripe’s record.
    string cvc_check;
    # Whether the cardholder provided an expiry date and if it matched Stripe’s record.
    string expiry_check;
};

# 
public type AlipayAccount record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the customer associated with this Alipay Account.
    string|Customer|DeletedCustomer? customer?;
    # Uniquely identifies the account and will be the same across all Alipay account objects that are linked to the same Alipay account.
    string fingerprint;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # If the Alipay account object is not reusable, the exact amount that you can create a charge for.
    int? payment_amount?;
    # If the Alipay account object is not reusable, the exact currency that you can create a charge for.
    string? payment_currency?;
    # True if you can create multiple payments using this account. If the account is reusable, then you can freely choose the amount of each payment.
    boolean reusable;
    # Whether this Alipay account object has ever been used for a payment.
    boolean used;
    # The username for the Alipay account.
    string username;
};

# 
public type IssuingDisputeFraudulentEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
};

# 
public type AccountRequirements record {
    # Date by which the fields in `currently_due` must be collected to keep the account enabled. These fields may disable the account sooner if the next threshold is reached before they are collected.
    int? current_deadline?;
    # Fields that need to be collected to keep the account enabled. If not collected by `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
    string[]? currently_due?;
    # If the account is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.
    string? disabled_reason?;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    AccountRequirementsError[]? errors?;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and `current_deadline` becomes set.
    string[]? eventually_due?;
    # Fields that weren't collected by `current_deadline`. These fields need to be collected to enable the account.
    string[]? past_due?;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    string[]? pending_verification?;
};

public type CreatedFilterOptions record {
    int gt?;
    int gte?;
    int lt?;
    int lte?;
};

# 
public type PaymentIntentPaymentMethodOptionsAcssDebit record {
    # 
    PaymentIntentPaymentMethodOptionsMandateOptionsAcssDebit mandate_options?;
    # Bank account verification method.
    string verification_method?;
};

# 
public type PaymentMethodDetailsCardInstallmentsPlan record {
    # For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card.
    int? count?;
    # For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
    # One of `month`.
    string? interval?;
    # Type of installment plan, one of `fixed_count`.
    string 'type;
};

public type OptionalFieldsAddress record {
    string city?;
    string country?;
    string line1?;
    string line2?;
    string postal_code?;
    string state?;
};

# 
public type PortalBusinessProfile record {
    # The messaging shown to customers in the portal.
    string? headline?;
    # A link to the business’s publicly available privacy policy.
    string privacy_policy_url;
    # A link to the business’s publicly available terms of service.
    string terms_of_service_url;
};

# If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
public type Param record {
    # The account number for the bank account
    string account_number;
    # Bank-State-Branch number of the bank account
    string bsb_number;
};

# 
public type BitcoinReceiver record {
    # True when this bitcoin receiver has received a non-zero amount of bitcoin.
    boolean active;
    # The amount of `currency` that you are collecting as payment.
    int amount;
    # The amount of `currency` to which `bitcoin_amount_received` has been converted.
    int amount_received;
    # The amount of bitcoin that the customer should send to fill the receiver. The `bitcoin_amount` is denominated in Satoshi: there are 10^8 Satoshi in one bitcoin.
    int bitcoin_amount;
    # The amount of bitcoin that has been sent by the customer to this receiver.
    int bitcoin_amount_received;
    # This URI can be displayed to the customer as a clickable link (to activate their bitcoin client) or as a QR code (for mobile wallets).
    string bitcoin_uri;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which the bitcoin will be converted.
    string currency;
    # The customer ID of the bitcoin receiver.
    string? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The customer's email address, set by the API call that creates the receiver.
    string? email?;
    # This flag is initially false and updates to true when the customer sends the `bitcoin_amount` to this receiver.
    boolean filled;
    # Unique identifier for the object.
    string id;
    # A bitcoin address that is specific to this receiver. The customer can send bitcoin to this address to fill the receiver.
    string inbound_address;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The ID of the payment created from the receiver, if any. Hidden when viewing the receiver with a publishable key.
    string? payment?;
    # The refund address of this bitcoin receiver.
    string? refund_address?;
    # A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
    BitcoinTransactionList transactions?;
    # This receiver contains uncaptured funds that can be used for a payment or refunded.
    boolean uncaptured_funds;
    # Indicate if this source is used for payment.
    boolean? used_for_payment?;
};

# 
public type PortalFeatures record {
    # 
    PortalCustomerUpdate customer_update;
    # 
    PortalInvoiceList invoice_history;
    # 
    PortalPaymentMethodUpdate payment_method_update;
    # 
    PortalSubscriptionCancel subscription_cancel;
    # 
    PortalSubscriptionPause subscription_pause;
    # 
    PortalSubscriptionUpdate subscription_update;
};

# Stores representations of [stock keeping units](http://en.wikipedia.org/wiki/Stock_keeping_unit).
# SKUs describe specific product variations, taking into account any combination of: attributes,
# currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents
# the `size: large`, `color: red` version of that shirt.
# 
# Can also be used to manage inventory.
# 
# Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public type Sku record {
    # Whether the SKU is available for purchase.
    boolean active;
    # A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.
    record {} attributes;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # The URL of an image for this SKU, meant to be displayable to the customer.
    string? image?;
    # Description of the SKU’s inventory
    SkuInventory inventory;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The dimensions of this SKU for shipping purposes.
    PackageDimensions? package_dimensions?;
    # The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
    int price;
    # The ID of the product this SKU is associated with. The product must be currently active.
    string|Product product;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
};

# 
public type DisputeEvidenceDetails record {
    # Date by which evidence must be submitted in order to successfully challenge dispute. Will be null if the customer's bank or credit card company doesn't allow a response for this particular dispute.
    int? due_by?;
    # Whether evidence has been staged for this dispute.
    boolean has_evidence;
    # Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.
    boolean past_due;
    # The number of times evidence has been submitted. Typically, you may only submit evidence once.
    int submission_count;
};

# 
public type PaymentIntentPaymentMethodOptionsSepaDebit record {
    # 
    PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit mandate_options?;
};

# 
public type PaymentMethodDetailsAfterpayClearpay record {
    # Order identifier shown to the merchant in Afterpay’s online portal.
    string? reference?;
};

# 
public type SourceMandateNotificationAcssDebitData record {
    # The statement descriptor associate with the debit.
    string statement_descriptor?;
};

# 
public type SigmaScheduledQueryRunError record {
    # Information about the run failure.
    string message;
};

# 
public type GelatoReportIdNumberOptions record {
};

# 
public type Address record {
    # City, district, suburb, town, or village.
    string? city?;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Address line 1 (e.g., street, PO Box, or company name).
    string? line1?;
    # Address line 2 (e.g., apartment, suite, unit, or building).
    string? line2?;
    # ZIP or postal code.
    string? postal_code?;
    # State, county, province, or region.
    string? state?;
};

# Automatic tax settings for this subscription.
public type AutomaticTaxConfig record {
    # Enabled
    boolean enabled;
};

# 
public type UsageRecordSummary record {
    # Unique identifier for the object.
    string id;
    # The invoice in which this usage period has been billed for.
    string? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    Period period;
    # The ID of the subscription item this summary is describing.
    string subscription_item;
    # The total usage within this usage period.
    int total_usage;
};

public type PaymentSource Account|AlipayAccount|BankAccount|BitcoinReceiver|Card|Source;

# Tokenization is the process Stripe uses to collect sensitive card or bank
# account details, or personally identifiable information (PII), directly from
# your customers in a secure manner. A token representing this information is
# returned to your server to use. You should use our
# [recommended payments integrations](https://stripe.com/docs/payments) to perform this process
# client-side. This ensures that no sensitive card data touches your server,
# and allows your integration to operate in a PCI-compliant way.
# 
# If you cannot use client-side tokenization, you can also create tokens using
# the API with either your publishable or secret API key. Keep in mind that if
# your integration uses this method, you are responsible for any PCI compliance
# that may be required, and you must keep your secret API key safe. Unlike with
# client-side tokenization, your customer's information is not sent directly to
# Stripe, so we cannot determine how it is handled or stored.
# 
# Tokens cannot be stored or used more than once. To store card or bank account
# information for later use, you can create [Customer](https://stripe.com/docs/api#customers)
# objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that
# [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection,
# performs best with integrations that use client-side tokenization.
# 
# Related guide: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)
public type Token record {
    # These bank accounts are payment methods on `Customer` objects.
    # 
    # On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer
    # destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts).
    # They can be bank accounts or debit cards as well, and are documented in the links above.
    # 
    # Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
    BankAccount bank_account?;
    # You can store multiple cards on a customer in order to charge the customer
    # later. You can also store multiple debit cards on a recipient in order to
    # transfer to those cards later.
    # 
    # Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
    Card card?;
    # IP address of the client that generated the token.
    string? client_ip?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Type of the token: `account`, `bank_account`, `card`, or `pii`.
    string 'type;
    # Whether this token has already been used (tokens can be used only once).
    boolean used;
};

public type CustomerCardDetails record {
    string address_city?;
    string address_country?;
    string address_line1?;
    string address_line2?;
    string address_state?;
    string address_zip?;
    string cvc?;
    int exp_month;
    int exp_year;
    record {} metadata?;
    string name?;
    string number;
    string 'object?;
};

public type SubscriptionCancelAt1 int|string;

# A phase describes the plans, coupon, and trialing status of a subscription for a predefined time period.
public type SubscriptionSchedulePhaseConfiguration record {
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this phase.
    SubscriptionScheduleAddInvoiceItem[] add_invoice_items;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
    decimal? application_fee_percent?;
    # Automatic tax configuration details
    SchedulesPhaseAutomaticTax automatic_tax?;
    # Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    string? billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    SubscriptionBillingThresholds? billing_thresholds?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    string? collection_method?;
    # ID of the coupon to use during this phase of the subscription schedule.
    string|Coupon|DeletedCoupon? coupon?;
    # ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
    string|PaymentMethod? default_payment_method?;
    # The default tax rates to apply to the subscription during this phase of the subscription schedule.
    TaxRate[]? default_tax_rates?;
    # The end of this phase of the subscription schedule.
    int end_date;
    # The invoice settings applicable during this phase.
    InvoiceSettingSubscriptionScheduleSetting? invoice_settings?;
    # Subscription items to configure the subscription to during this phase of the subscription schedule.
    SubscriptionScheduleConfigurationItem[] items;
    # If the subscription schedule will prorate when transitioning to this phase. Possible values are `create_prorations` and `none`.
    string proration_behavior;
    # The start of this phase of the subscription schedule.
    int start_date;
    # The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    SubscriptionTransferData? transfer_data?;
    # When the trial ends within the phase.
    int? trial_end?;
};

# Shows last VerificationSession error
public type GelatoSessionLastError record {
    # A short machine-readable string giving the reason for the verification or user-session failure.
    string? code?;
    # A message that explains the reason for verification or user-session failure.
    string? reason?;
};

# 
public type SetupAttemptPaymentMethodDetailsSofort record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Sofort authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    string? preferred_language?;
    # Owner's verified full name. Values are verified or provided by Sofort directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# 
public type PaymentMethodDetailsCardWalletAmexExpressCheckout record {
};

# 
public type IssuingCardholderIndividual record {
    # The date of birth of this cardholder.
    IssuingCardholderIndividualDob? dob?;
    # The first name of this cardholder.
    string first_name;
    # The last name of this cardholder.
    string last_name;
    # Government-issued ID document for this cardholder.
    IssuingCardholderVerification? verification?;
};

public type OneTimePriceData record {
    string currency;
    string product;
    string tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# Payment settings to pass to invoices created by the subscription.
public type PaymentSettings2 record {
    PaymentMethodOptions payment_method_options?;
    string[]|string payment_method_types?;
};

# Payment settings to pass to invoices created by the subscription.
public type PaymentSettings1 record {
    PaymentMethodOptions1 payment_method_options?;
    PaymentMethodTypesArray|string payment_method_types?;
};

public type BillingDetailsAddress record {
    string city?;
    string country?;
    string line1?;
    string line2?;
    string postal_code?;
    string state?;
};

# Evidence for the dispute. Evidence contains exactly two non-null fields: the reason for the dispute and the associated evidence field for the selected reason
public type IssuingDisputeEvidence record {
    # 
    IssuingDisputeCanceledEvidence canceled?;
    # 
    IssuingDisputeDuplicateEvidence duplicate?;
    # 
    IssuingDisputeFraudulentEvidence fraudulent?;
    # 
    IssuingDisputeMerchandiseNotAsDescribedEvidence merchandise_not_as_described?;
    # 
    IssuingDisputeNotReceivedEvidence not_received?;
    # 
    IssuingDisputeOtherEvidence other?;
    # The reason for filing the dispute. Its value will match the field containing the evidence.
    string reason;
    # 
    IssuingDisputeServiceNotAsDescribedEvidence service_not_as_described?;
};

# 
public type AccountBrandingSettings record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px.
    string|File? icon?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px.
    string|File? logo?;
    # A CSS hex color value representing the primary branding color for this account
    string? primary_color?;
    # A CSS hex color value representing the secondary branding color for this account
    string? secondary_color?;
};

# 
public type SetupAttemptPaymentMethodDetails record {
    # 
    SetupAttemptPaymentMethodDetailsAcssDebit acss_debit?;
    # 
    SetupAttemptPaymentMethodDetailsAuBecsDebit au_becs_debit?;
    # 
    SetupAttemptPaymentMethodDetailsBacsDebit bacs_debit?;
    # 
    SetupAttemptPaymentMethodDetailsBancontact bancontact?;
    # 
    SetupAttemptPaymentMethodDetailsCard card?;
    # 
    SetupAttemptPaymentMethodDetailsCardPresent card_present?;
    # 
    SetupAttemptPaymentMethodDetailsIdeal ideal?;
    # 
    SetupAttemptPaymentMethodDetailsSepaDebit sepa_debit?;
    # 
    SetupAttemptPaymentMethodDetailsSofort sofort?;
    # The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is included on `payment_method_details` with a name matching this value. It contains confirmation-specific information for the payment method.
    string 'type;
};

# This is an object representing a capability for a Stripe account.
# 
# Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).
public type Capability record {
    # The account for which the capability enables functionality.
    string|Account account;
    # The identifier for the capability.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Whether the capability has been requested.
    boolean requested;
    # Time at which the capability was requested. Measured in seconds since the Unix epoch.
    int? requested_at?;
    # 
    AccountCapabilityRequirements requirements?;
    # The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.
    string status;
};

public type PaymentMethodOptions record {
    record {string preferred_language?;}|string bancontact?;
    record {string request_three_d_secure?;}|string card?;
};

# A list of returns that have taken place for this order.
public type OrdersResourceOrderReturnList record {
    # Details about each object.
    OrderReturn[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# Point in Time
public type GelatoDataDocumentReportExpirationDate record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

public type CreatedDetails CreatedFilterOptions|int;

# 
public type LineItemsTaxAmount record {
    # Amount of tax applied for this rate.
    int amount;
    # Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
    # 
    # Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
    TaxRate rate;
};

# 
public type SetupIntentPaymentMethodOptionsAcssDebit record {
    # Currency supported by the bank account
    string? currency?;
    # 
    SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit mandate_options?;
    # Bank account verification method.
    string verification_method?;
};

# 
public type SetupAttemptPaymentMethodDetailsAcssDebit record {
};

public type DataParams record {
    string 'type;
    string value;
};

# 
public type IssuingCardholderIdDocument record {
    # The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? back?;
    # The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? front?;
};

# 
public type IssuingDisputeDuplicateEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for.
    string|File? card_statement?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash.
    string|File? cash_receipt?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product.
    string|File? check_image?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one.
    string? original_transaction?;
};

# 
public type Application record {
    # Unique identifier for the object.
    string id;
    # The name of the application.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# This is an object representing a person associated with a Stripe account.
# 
# A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account.
# See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.
# 
# Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
public type Person record {
    # The account the person is associated with.
    string account;
    # 
    Address address?;
    LegalEntityJapanAddress? address_kana?;
    LegalEntityJapanAddress? address_kanji?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # 
    LegalEntityDob dob?;
    # The person's email address.
    string? email?;
    # The person's first name.
    string? first_name?;
    # The Kana variation of the person's first name (Japan only).
    string? first_name_kana?;
    # The Kanji variation of the person's first name (Japan only).
    string? first_name_kanji?;
    # The person's gender (International regulations require either "male" or "female").
    string? gender?;
    # Unique identifier for the object.
    string id;
    # Whether the person's `id_number` was provided.
    boolean id_number_provided?;
    # The person's last name.
    string? last_name?;
    # The Kana variation of the person's last name (Japan only).
    string? last_name_kana?;
    # The Kanji variation of the person's last name (Japan only).
    string? last_name_kanji?;
    # The person's maiden name.
    string? maiden_name?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # The country where the person is a national.
    string? nationality?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The person's phone number.
    string? phone?;
    # Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
    string political_exposure?;
    # 
    PersonRelationship relationship?;
    PersonRequirements? requirements?;
    # Whether the last four digits of the person's Social Security number have been provided (U.S. only).
    boolean ssn_last_4_provided?;
    # 
    LegalEntityPersonVerification verification?;
};

# 
public type QuotesResourceStatusTransitions record {
    # The time that the quote was accepted. Measured in seconds since Unix epoch.
    int? accepted_at?;
    # The time that the quote was canceled. Measured in seconds since Unix epoch.
    int? canceled_at?;
    # The time that the quote was finalized. Measured in seconds since Unix epoch.
    int? finalized_at?;
};

public type InvoiceVoidBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
};

# A discount represents the actual application of a coupon to a particular
# customer. It contains information about when the discount began and when it
# will end.
# 
# Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
public type Discount record {
    # The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
    string? checkout_session?;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # The ID of the customer associated with this discount.
    string|Customer|DeletedCustomer? customer?;
    # If the coupon has a duration of `repeating`, the date that this discount will end. If the coupon has a duration of `once` or `forever`, this attribute will be null.
    int? end?;
    # The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
    string id;
    # The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
    string? invoice?;
    # The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
    string? invoice_item?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The promotion code applied to create this discount.
    string|PromotionCode? promotion_code?;
    # Date that the coupon was applied.
    int 'start;
    # The subscription that this coupon is applied to, if it is applied to a particular subscription.
    string? subscription?;
};

# 
public type PaymentMethodDetailsBacsDebit record {
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    string? mandate?;
    # Sort code of the bank account. (e.g., `10-20-30`)
    string? sort_code?;
};

public type CurrentPeriodStart RangeQuerySpecs|int;

# Result from a document check
public type GelatoDocumentReport record {
    # Address as it appears in the document.
    Address? address?;
    # Date of birth as it appears in the document.
    GelatoDataDocumentReportDateOfBirth? dob?;
    # Details on the verification error. Present when status is `unverified`.
    GelatoDocumentReportError? 'error?;
    # Expiration date of the document.
    GelatoDataDocumentReportExpirationDate? expiration_date?;
    # Array of [File](https://stripe.com/docs/api/files) ids containing images for this document.
    string[]? files?;
    # First name as it appears in the document.
    string? first_name?;
    # Issued date of the document.
    GelatoDataDocumentReportIssuedDate? issued_date?;
    # Issuing country of the document.
    string? issuing_country?;
    # Last name as it appears in the document.
    string? last_name?;
    # Document ID number.
    string? number?;
    # Status of this `document` check.
    string status;
    # Type of the document.
    string? 'type?;
};

public type SourceTypeCardPresent record {
    string application_cryptogram?;
    string application_preferred_name?;
    string? authorization_code?;
    string authorization_response_code?;
    string? brand?;
    string? country?;
    string cvm_type?;
    string? data_type?;
    string dedicated_file_name?;
    string emv_auth_data?;
    string? evidence_customer_signature?;
    string? evidence_transaction_certificate?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? pos_device_id?;
    string pos_entry_mode?;
    string? read_method?;
    string? reader?;
    string terminal_verification_results?;
    string transaction_status_information?;
};

# 
public type RadarReviewResourceSession record {
    # The browser used in this browser session (e.g., `Chrome`).
    string? browser?;
    # Information about the device used for the browser session (e.g., `Samsung SM-G930T`).
    string? device?;
    # The platform for the browser session (e.g., `Macintosh`).
    string? platform?;
    # The version for the browser session (e.g., `61.0.3163.100`).
    string? 'version?;
};

# 
public type TransferSchedule record {
    # The number of days charges for the account will be held before being paid out.
    int delay_days;
    # How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`.
    string interval;
    # The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
    int monthly_anchor?;
    # The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown if `interval` is weekly.
    string weekly_anchor?;
};

# If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
public type TransferDataSpecs1 record {
    int amount?;
    string destination;
};

# If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
public type TransferDataSpecs2 record {
    decimal amount_percent?;
    string destination;
};

# 
public type CheckoutAcssDebitMandateOptions record {
    # A URL for custom mandate text
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    string? payment_schedule?;
    # Transaction type of the mandate.
    string? transaction_type?;
};

# An Add Invoice Item describes the prices and quantities that will be added as pending invoice items when entering a phase.
public type SubscriptionScheduleAddInvoiceItem record {
    # ID of the price used to generate the invoice item.
    string|Price|DeletedPrice price;
    # The quantity of the invoice item.
    int? quantity?;
    # The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item.
    TaxRate[]? tax_rates?;
};

public type TransferDataSpecs3 record {
    decimal amount_percent?;
    string destination;
};

public type SourceTypeSofort record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? country?;
    string? iban_last4?;
    string? preferred_language?;
    string? statement_descriptor?;
};

public type PhaseConfigurationParams1 record {
    AddInvoiceItemEntry1[] add_invoice_items?;
    decimal application_fee_percent?;
    AutomaticTaxConfig3 automatic_tax?;
    string billing_cycle_anchor?;
    BillingThresholdParams|string billing_thresholds?;
    string collection_method?;
    string coupon?;
    string default_payment_method?;
    string[]|string default_tax_rates?;
    int|string end_date?;
    SubscriptionSchedulesParam1 invoice_settings?;
    ConfigurationItemParams[] items;
    int iterations?;
    string proration_behavior?;
    int|string start_date?;
    TransferDataSpecs3 transfer_data?;
    boolean trial?;
    int|string trial_end?;
};

# 
public type SourceCodeVerificationFlow record {
    # The number of attempts remaining to authenticate the source object with a verification code.
    int attempts_remaining;
    # The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0).
    string status;
};

# This resource has been renamed to [Early Fraud
# Warning](#early_fraud_warning_object) and will be removed in a future API
# version.
public type IssuerFraudRecord record {
    # An IFR is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an IFR, in order to avoid receiving a dispute later.
    boolean actionable;
    # ID of the charge this issuer fraud record is for, optionally expanded.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
    string fraud_type;
    # If true, the associated charge is subject to [liability shift](https://stripe.com/docs/payments/3d-secure#disputed-payments).
    boolean has_liability_shift;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The timestamp at which the card issuer posted the issuer fraud record.
    int post_date;
};

# 
public type ThreeDSecureUsage record {
    # Whether 3D Secure is supported on this card.
    boolean supported;
};

public type RangeQuerySpecs record {
    int gt?;
    int gte?;
    int lt?;
    int lte?;
};

# 
public type SepaDebitGeneratedFrom record {
    # The ID of the Charge that generated this PaymentMethod, if any.
    string|Charge? charge?;
    # The ID of the SetupAttempt that generated this PaymentMethod, if any.
    string|SetupAttempt? setup_attempt?;
};

# 
public type InvoicePaymentMethodOptionsCard record {
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    string? request_three_d_secure?;
};

# 
public type PaymentIntentNextActionRedirectToUrl record {
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate the payment.
    string? url?;
};

# A Connection Token is used by the Stripe Terminal SDK to connect to a reader.
# 
# Related guide: [Fleet Management](https://stripe.com/docs/terminal/creating-locations).
public type TerminalConnectionToken record {
    # The id of the location that this connection token is scoped to. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://stripe.com/docs/terminal/readers/fleet-management#connection-tokens).
    string location?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Your application should pass this token to the Stripe Terminal SDK.
    string secret;
};

# 
public type PaymentMethodDetailsAchDebit record {
    # Type of entity that holds the account. This can be either `individual` or `company`.
    string? account_holder_type?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # Routing transit number of the bank account.
    string? routing_number?;
};

# Point in Time
public type GelatoDataDocumentReportDateOfBirth record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type SetupIntentNextActionRedirectToUrl record {
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate.
    string? url?;
};

public type CustomerDetailsParam1 record {
    CustomerAdresss|string address?;
    CustomerAddressWithName|string shipping?;
    TaxParam1 tax?;
    string tax_exempt?;
    DataParams[] tax_ids?;
};

# 
public type PaymentMethodOptionsCardPresent record {
};

public type CurrentPeriodEnd RangeQuerySpecs|int;

# 
public type PaymentIntentPaymentMethodOptions record {
    # 
    PaymentIntentPaymentMethodOptionsAcssDebit acss_debit?;
    # 
    PaymentMethodOptionsAfterpayClearpay afterpay_clearpay?;
    # 
    PaymentMethodOptionsAlipay alipay?;
    # 
    PaymentMethodOptionsBancontact bancontact?;
    # 
    PaymentMethodOptionsBoleto boleto?;
    # 
    PaymentIntentPaymentMethodOptionsCard card?;
    # 
    PaymentMethodOptionsCardPresent card_present?;
    # 
    PaymentMethodOptionsIdeal ideal?;
    # 
    PaymentMethodOptionsOxxo oxxo?;
    # 
    PaymentMethodOptionsP24 p24?;
    # 
    PaymentIntentPaymentMethodOptionsSepaDebit sepa_debit?;
    # 
    PaymentMethodOptionsSofort sofort?;
    # 
    PaymentMethodOptionsWechatPay wechat_pay?;
};

# `Application Fee Refund` objects allow you to refund an application fee that
# has previously been created but not yet refunded. Funds will be refunded to
# the Stripe account from which the fee was originally collected.
# 
# Related guide: [Refunding Application Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).
public type FeeRefund record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|BalanceTransaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the application fee that was refunded.
    string|ApplicationFee fee;
    # Unique identifier for the object.
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

public type CardInvoicePaymentMethodOptionsParam record {
    string request_three_d_secure?;
};

public type CustomerBankAccountDetails record {
    string account_holder_name?;
    string account_holder_type?;
    string account_number;
    string country;
    string currency?;
    string 'object?;
    string routing_number?;
};

# 
public type PersonRequirements record {
    # Fields that need to be collected to keep the person's account enabled. If not collected by the account's `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
    string[] currently_due;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    AccountRequirementsError[] errors;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and the account's `current_deadline` becomes set.
    string[] eventually_due;
    # Fields that weren't collected by the account's `current_deadline`. These fields need to be collected to enable the person's account.
    string[] past_due;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    string[] pending_verification;
};

# 
public type AccountRequirementsError record {
    # The code for the type of error.
    string code;
    # An informative message that indicates the error type and provides additional details about the error.
    string reason;
    # The specific user onboarding requirement field (in the requirements hash) that needs to be resolved.
    string requirement;
};

# 
public type PaymentMethodOxxo record {
};

# 
public type GelatoDocumentReportError record {
    # A short machine-readable string giving the reason for the verification failure.
    string? code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# 
public type DeletedApplePayDomain record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PaymentMethodDetailsAchCreditTransfer record {
    # Account number to transfer funds to.
    string? account_number?;
    # Name of the bank associated with the routing number.
    string? bank_name?;
    # Routing transit number for the bank account to transfer funds to.
    string? routing_number?;
    # SWIFT code of the bank associated with the routing number.
    string? swift_code?;
};

# A phase item describes the price and quantity of a phase.
public type SubscriptionScheduleConfigurationItem record {
    # Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
    SubscriptionItemBillingThresholds? billing_thresholds?;
    # ID of the price to which the customer should be subscribed.
    string|Price|DeletedPrice price;
    # Quantity of the plan to which the customer should be subscribed.
    int quantity?;
    # The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`.
    TaxRate[]? tax_rates?;
};

# 
public type PaymentMethodDetailsInteracPresentReceipt record {
    # The type of account being debited or credited
    string account_type?;
    # EMV tag 9F26, cryptogram generated by the integrated circuit chip.
    string? application_cryptogram?;
    # Mnenomic of the Application Identifier.
    string? application_preferred_name?;
    # Identifier for this transaction.
    string? authorization_code?;
    # EMV tag 8A. A code returned by the card issuer.
    string? authorization_response_code?;
    # How the cardholder verified ownership of the card.
    string? cardholder_verification_method?;
    # EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
    string? dedicated_file_name?;
    # The outcome of a series of EMV functions performed by the card reader.
    string? terminal_verification_results?;
    # An indication of various EMV functions performed during the transaction.
    string? transaction_status_information?;
};

public type SourceTypeBancontact record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? iban_last4?;
    string? preferred_language?;
    string? statement_descriptor?;
};

# 
public type SubscriptionAutomaticTax record {
    # Whether Stripe automatically computes tax on this subscription.
    boolean enabled;
};

# 
public type PaymentMethodOptionsWechatPay record {
    # The app ID registered with WeChat Pay. Only required when client is ios or android.
    string? app_id?;
    # The client type that the end customer will pay from
    string? 'client?;
};

public type RecurringAdhoc record {
    string interval;
    int interval_count?;
};

public type ScheduleCancelBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # If the subscription schedule is `active`, indicates if a final invoice will be generated that contains any un-invoiced metered usage and new/pending proration invoice items. Defaults to `true`.
    boolean invoice_now?;
    # If the subscription schedule is `active`, indicates if the cancellation should be prorated. Defaults to `true`.
    boolean prorate?;
};

# 
public type QuotesResourceUpfront record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
    Quotesresourcelistlineitems1 line_items?;
    # 
    QuotesResourceTotalDetails total_details;
};

# 
public type DeletedAlipayAccount record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PaymentIntentNextActionAlipayHandleRedirect record {
    # The native data to be used with Alipay SDK you must redirect your customer to in order to authenticate the payment in an Android App.
    string? native_data?;
    # The native URL you must redirect your customer to in order to authenticate the payment in an iOS App.
    string? native_url?;
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate the payment.
    string? url?;
};

# 
public type PaymentMethodCardWalletSamsungPay record {
};

public type SourceTypeIdeal record {
    string? bank?;
    string? bic?;
    string? iban_last4?;
    string? statement_descriptor?;
};

# 
public type CustomerResourceCustomerList record {
    Customer[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type AccountPaymentsSettings record {
    # The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge.
    string? statement_descriptor?;
    # The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only)
    string? statement_descriptor_kana?;
    # The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only)
    string? statement_descriptor_kanji?;
};

# 
public type PortalCustomerUpdate record {
    # The types of customer updates that are supported. When empty, customers are not updateable.
    string[] allowed_updates;
    # Whether the feature is enabled.
    boolean enabled;
};

# 
public type InvoiceTransferData record {
    # The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.
    int? amount?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

# 
public type MandateBacsDebit record {
    # The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`.
    string network_status;
    # The unique reference identifying the mandate on the Bacs network.
    string reference;
    # The URL that will contain the mandate that the customer has signed.
    string url;
};

# With `Recipient` objects, you can transfer money from your Stripe account to a
# third-party bank account or debit card. The API allows you to create, delete,
# and update your recipients. You can retrieve individual recipients as well as
# a list of all your recipients.
# 
# **`Recipient` objects have been deprecated in favor of
# [Connect](https://stripe.com/docs/connect), specifically Connect's much more powerful
# [Account objects](https://stripe.com/docs/api#account). Stripe accounts that don't already use
# recipients can no longer begin doing so. Please use `Account` objects
# instead.**
public type Recipient record {
    # Hash describing the current account on the recipient, if there is one.
    BankAccount? active_account?;
    # 
    CardList? cards?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The default card to use for creating transfers to this recipient.
    string|Card? default_card?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    string? email?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The ID of the [Custom account](https://stripe.com/docs/connect/custom-accounts) this recipient was migrated to. If set, the recipient can no longer be updated, nor can transfers be made to it: use the Custom account instead.
    string|Account? migrated_to?;
    # Full, legal name of the recipient.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    string|Account rolled_back_from?;
    # Type of the recipient, one of `individual` or `corporation`.
    string 'type;
};

# 
public type ChargeOutcome record {
    # Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`. The value `reversed_after_approval` indicates the payment was [blocked by Stripe](https://stripe.com/docs/declines#blocked-payments) after bank authorization, and may temporarily appear as "pending" on a cardholder's statement.
    string? network_status?;
    # An enumerated value providing a more detailed explanation of the outcome's `type`. Charges blocked by Radar's default block rule have the value `highest_risk_level`. Charges placed in review by Radar's default review rule have the value `elevated_risk_level`. Charges authorized, blocked, or placed in review by custom rules have the value `rule`. See [understanding declines](https://stripe.com/docs/declines) for more details.
    string? reason?;
    # Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are `normal`, `elevated`, `highest`. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value `not_assessed`. In the event of an error in the evaluation, this field will have the value `unknown`. This field is only available with Radar.
    string risk_level?;
    # Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are between 0 and 100. For non-card payments, card-based payments predating the public assignment of risk scores, or in the event of an error during evaluation, this field will not be present. This field is only available with Radar for Fraud Teams.
    int risk_score?;
    # The ID of the Radar rule that matched the payment, if applicable.
    string|Rule rule?;
    # A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer.
    string? seller_message?;
    # Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`. See [understanding declines](https://stripe.com/docs/declines) and [Radar reviews](https://stripe.com/docs/radar/reviews) for details.
    string 'type;
};

# You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
public type IssuingCard record {
    # The brand of the card.
    string brand;
    # The reason why the card was canceled.
    string? cancellation_reason?;
    # An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.
    # 
    # Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
    IssuingCardholder cardholder;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
    string cvc?;
    # The expiration month of the card.
    int exp_month;
    # The expiration year of the card.
    int exp_year;
    # Unique identifier for the object.
    string id;
    # The last 4 digits of the card number.
    string last4;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
    string number?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The latest card that replaces this card, if any.
    string|IssuingCard? replaced_by?;
    # The card this card replaces, if any.
    string|IssuingCard? replacement_for?;
    # The reason why the previous card needed to be replaced.
    string? replacement_reason?;
    # Where and how the card will be shipped.
    IssuingCardShipping? shipping?;
    # 
    IssuingCardAuthorizationControls spending_controls;
    # Whether authorizations can be approved on this card.
    string status;
    # The type of the card.
    string 'type;
};

public type ScheduleReleaseBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Keep any cancellation on the subscription that the schedule has set
    boolean preserve_cancel_date?;
};

# 
public type CustomerAcceptance record {
    # The time at which the customer accepted the Mandate.
    int? accepted_at?;
    # 
    OfflineAcceptance offline?;
    # 
    OnlineAcceptance online?;
    # The type of customer acceptance information included with the Mandate. One of `online` or `offline`.
    string 'type;
};

# 
public type PromotionCodesResourceRestrictions record {
    # A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices
    boolean first_time_transaction;
    # Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
    int? minimum_amount?;
    # Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount
    string? minimum_amount_currency?;
};

# If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll
# receive a `sigma.scheduled_query_run.created` webhook each time the query
# runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
# retrieve the query results.
public type ScheduledQueryRun record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # When the query was run, Sigma contained a snapshot of your Stripe data at this time.
    int data_load_time;
    # 
    SigmaScheduledQueryRunError 'error?;
    # The file object representing the results of the query.
    File? file?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Time at which the result expires and is no longer available for download.
    int result_available_until;
    # SQL for the query.
    string sql;
    # The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise.
    string status;
    # Title of the query.
    string title;
};

public type SubscriptionItemUsageRecordsBody record {
    # Valid values are `increment` (default) or `set`. When using `increment` the specified `quantity` will be added to the usage at the specified timestamp. The `set` action will overwrite the usage quantity at that timestamp. If the subscription has [billing thresholds](https://stripe.com/docs/api/subscriptions/object#subscription_object-billing_thresholds), `increment` is the only allowed value.
    string action?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # The usage quantity for the specified timestamp.
    int quantity;
    # The timestamp for the usage event. This timestamp must be within the current billing period of the subscription of the provided `subscription_item`.
    int timestamp;
};

# Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
# [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.
# 
# For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public type Price record {
    # Whether the price can be used for new purchases.
    boolean active;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    string billing_scheme;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # A lookup key used to retrieve prices dynamically from a static string.
    string? lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # A brief description of the price, hidden from customers.
    string? nickname?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The ID of the product this price is associated with.
    string|Product|DeletedProduct product;
    # The recurring components of a price such as `interval` and `usage_type`.
    Recurring? recurring?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    string? tax_behavior?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    PriceTier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
    string? tiers_mode?;
    # Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
    TransformQuantity? transform_quantity?;
    # One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
    string 'type;
    # The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.
    int? unit_amount?;
    # The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.
    string? unit_amount_decimal?;
};

# Automatic tax configuration details
public type SchedulesPhaseAutomaticTax record {
    # Whether Stripe automatically computes tax on invoices created during this phase.
    boolean enabled;
};

# 
public type SetupIntentPaymentMethodOptions record {
    # 
    SetupIntentPaymentMethodOptionsAcssDebit acss_debit?;
    # 
    SetupIntentPaymentMethodOptionsCard card?;
    # 
    SetupIntentPaymentMethodOptionsSepaDebit sepa_debit?;
};

public type CustomerAdresss record {
    string city?;
    string country?;
    string line1?;
    string line2?;
    string postal_code?;
    string state?;
};

# 
public type TransformUsage record {
    # Divide usage by this number.
    int divide_by;
    # After division, either round the result `up` or `down`.
    string round;
};

# 
public type PaymentMethodDetailsCardWalletVisaCheckout record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type TaxDeductedAtSource record {
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The end of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
    int period_end;
    # The start of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
    int period_start;
    # The TAN that was supplied to Stripe when TDS was assessed
    string tax_deduction_account_number;
};

# Tax details about the customer.
public type TaxParam record {
    string|string ip_address?;
};

public type V1ProductsBody record {
    # Whether the product is currently available for purchase. Defaults to `true`.
    boolean active?;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    string description?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # An identifier will be randomly generated by Stripe. You can optionally override this ID, but the ID must be unique across all products in your Stripe account.
    string id?;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    string[] images?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {} metadata?;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    string name;
    # The dimensions of this product for shipping purposes.
    PackageDimensionsSpecs package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean shippable?;
    # An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.
    # 
    # This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.
    #  It must contain at least one letter.
    string statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
    string unit_label?;
    # A URL of a publicly-accessible webpage for this product.
    string url?;
};

public type InvoiceItemPreviewParams record {
    int amount?;
    string currency?;
    string description?;
    boolean discountable?;
    DiscountsDataParam|string discounts?;
    string invoiceitem?;
    record {}|string metadata?;
    Period1 period?;
    string price?;
    OneTimePriceData price_data?;
    int quantity?;
    string[]|string tax_rates?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# This is an object representing your Stripe balance. You can retrieve it to see
# the balance currently on your Stripe account.
# 
# You can also retrieve the balance history, which contains a list of
# [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to the balance
# (charges, payouts, and so forth).
# 
# The available and pending amounts for each currency are broken down further by
# payment source types.
# 
# Related guide: [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances).
public type Balance record {
    # Funds that are available to be transferred or paid out, whether automatically by Stripe or explicitly via the [Transfers API](https://stripe.com/docs/api#transfers) or [Payouts API](https://stripe.com/docs/api#payouts). The available balance for each currency and payment type can be found in the `source_types` property.
    BalanceAmount[] available;
    # Funds held due to negative balances on connected Custom accounts. The connect reserve balance for each currency and payment type can be found in the `source_types` property.
    BalanceAmount[] connect_reserved?;
    # Funds that can be paid out using Instant Payouts.
    BalanceAmount[] instant_available?;
    # 
    BalanceDetail issuing?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Funds that are not yet available in the balance, due to the 7-day rolling pay cycle. The pending balance for each currency, and for each payment type, can be found in the `source_types` property.
    BalanceAmount[] pending;
};

# This is an object representing a file hosted on Stripe's servers. The
# file may have been uploaded by yourself using the [create file](https://stripe.com/docs/api#create_file)
# request (for example, when uploading dispute evidence) or it may have
# been created by Stripe (for example, the results of a [Sigma scheduled
# query](#scheduled_queries)).
# 
# Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).
public type File record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The time at which the file expires and is no longer available in epoch seconds.
    int? expires_at?;
    # A filename for the file, suitable for saving to a filesystem.
    string? filename?;
    # Unique identifier for the object.
    string id;
    # A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
    FileFileLinkList? links?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
    string purpose;
    # The size in bytes of the file object.
    int size;
    # A user friendly title for the document.
    string? title?;
    # The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).
    string? 'type?;
    # The URL from which the file can be downloaded using your live secret API key.
    string? url?;
};

# Point in Time
public type GelatoDataDocumentReportIssuedDate record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type AccountCapabilityRequirements record {
    # Date by which the fields in `currently_due` must be collected to keep the capability enabled for the account. These fields may disable the capability sooner if the next threshold is reached before they are collected.
    int? current_deadline?;
    # Fields that need to be collected to keep the capability enabled. If not collected by `current_deadline`, these fields appear in `past_due` as well, and the capability is disabled.
    string[] currently_due;
    # If the capability is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.
    # 
    # `rejected.unsupported_business` means that the account's business is not supported by the capability. For example, payment methods may restrict the businesses they support in their terms of service:
    # 
    # - [Afterpay Clearpay's terms of service](/afterpay-clearpay/legal#restricted-businesses)
    # 
    # If you believe that the rejection is in error, please contact support@stripe.com for assistance.
    string? disabled_reason?;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    AccountRequirementsError[] errors;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and `current_deadline` becomes set.
    string[] eventually_due;
    # Fields that weren't collected by `current_deadline`. These fields need to be collected to enable the capability on the account.
    string[] past_due;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    string[] pending_verification;
};

# 
public type SourceTransactionAchCreditTransferData record {
    # Customer data associated with the transfer.
    string customer_data?;
    # Bank account fingerprint associated with the transfer.
    string fingerprint?;
    # Last 4 digits of the account number associated with the transfer.
    string last4?;
    # Routing number associated with the transfer.
    string routing_number?;
};

# 
public type SetupAttemptPaymentMethodDetailsCard record {
    # Populated if this authorization used 3D Secure authentication.
    ThreeDSecureDetails? three_d_secure?;
};

# The recurring components of a price such as `interval` and `usage_type`.
public type Recurring1 record {
    string aggregate_usage?;
    string interval;
    int interval_count?;
    string usage_type?;
};

# 
public type InlineResponse200 record {
    Coupon[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

public type PaymentMethodDetachBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
};

# 
public type IssuingCardholderSpendingLimit record {
    # Maximum amount allowed to spend per interval.
    int amount;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
    string[]? categories?;
    # Interval (or event) to which the amount applies.
    string interval;
};

# 
public type InvoicesPaymentMethodOptions record {
    # If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
    InvoicePaymentMethodOptionsBancontact? bancontact?;
    # If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
    InvoicePaymentMethodOptionsCard? card?;
};

# The Report Type resource corresponds to a particular type of report, such as
# the "Activity summary" or "Itemized payouts" reports. These objects are
# identified by an ID belonging to a set of enumerated values. See
# [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api)
# for those Report Type IDs, along with required and optional parameters.
# 
# Note that certain report types can only be run based on your live-mode data (not test-mode
# data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public type ReportingReportType record {
    # Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch.
    int data_available_end;
    # Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch.
    int data_available_start;
    # List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.)
    string[]? default_columns?;
    # The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`.
    string id;
    # Human-readable name of the Report Type
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # When this Report Type was latest updated. Measured in seconds since the Unix epoch.
    int updated;
    # Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.
    int 'version;
};

# Default invoice settings for this customer.
public type CustomerParam record {
    record {string name; string value;}[]|string custom_fields?;
    string default_payment_method?;
    string footer?;
};

# 
public type PaymentMethodCardWallet record {
    # 
    PaymentMethodCardWalletAmexExpressCheckout amex_express_checkout?;
    # 
    PaymentMethodCardWalletApplePay apple_pay?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # 
    PaymentMethodCardWalletGooglePay google_pay?;
    # 
    PaymentMethodCardWalletMasterpass masterpass?;
    # 
    PaymentMethodCardWalletSamsungPay samsung_pay?;
    # The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
    string 'type;
    # 
    PaymentMethodCardWalletVisaCheckout visa_checkout?;
};

# 
public type AccountCapabilities record {
    # The status of the ACSS Direct Debits payments capability of the account, or whether the account can directly process ACSS Direct Debits charges.
    string acss_debit_payments?;
    # The status of the Afterpay Clearpay capability of the account, or whether the account can directly process Afterpay Clearpay charges.
    string afterpay_clearpay_payments?;
    # The status of the BECS Direct Debit (AU) payments capability of the account, or whether the account can directly process BECS Direct Debit (AU) charges.
    string au_becs_debit_payments?;
    # The status of the Bacs Direct Debits payments capability of the account, or whether the account can directly process Bacs Direct Debits charges.
    string bacs_debit_payments?;
    # The status of the Bancontact payments capability of the account, or whether the account can directly process Bancontact charges.
    string bancontact_payments?;
    # The status of the boleto payments capability of the account, or whether the account can directly process boleto charges.
    string boleto_payments?;
    # The status of the card issuing capability of the account, or whether you can use Issuing to distribute funds on cards
    string card_issuing?;
    # The status of the card payments capability of the account, or whether the account can directly process credit and debit card charges.
    string card_payments?;
    # The status of the Cartes Bancaires payments capability of the account, or whether the account can directly process Cartes Bancaires card charges in EUR currency.
    string cartes_bancaires_payments?;
    # The status of the EPS payments capability of the account, or whether the account can directly process EPS charges.
    string eps_payments?;
    # The status of the FPX payments capability of the account, or whether the account can directly process FPX charges.
    string fpx_payments?;
    # The status of the giropay payments capability of the account, or whether the account can directly process giropay charges.
    string giropay_payments?;
    # The status of the GrabPay payments capability of the account, or whether the account can directly process GrabPay charges.
    string grabpay_payments?;
    # The status of the iDEAL payments capability of the account, or whether the account can directly process iDEAL charges.
    string ideal_payments?;
    # The status of the JCB payments capability of the account, or whether the account (Japan only) can directly process JCB credit card charges in JPY currency.
    string jcb_payments?;
    # The status of the legacy payments capability of the account.
    string legacy_payments?;
    # The status of the OXXO payments capability of the account, or whether the account can directly process OXXO charges.
    string oxxo_payments?;
    # The status of the P24 payments capability of the account, or whether the account can directly process P24 charges.
    string p24_payments?;
    # The status of the SEPA Direct Debits payments capability of the account, or whether the account can directly process SEPA Direct Debits charges.
    string sepa_debit_payments?;
    # The status of the Sofort payments capability of the account, or whether the account can directly process Sofort charges.
    string sofort_payments?;
    # The status of the tax reporting 1099-K (US) capability of the account.
    string tax_reporting_us_1099_k?;
    # The status of the tax reporting 1099-MISC (US) capability of the account.
    string tax_reporting_us_1099_misc?;
    # The status of the transfers capability of the account, or whether your platform can transfer funds to the account.
    string transfers?;
};

# 
public type SetupIntentNextActionVerifyWithMicrodeposits record {
    # The timestamp when the microdeposits are expected to land.
    int arrival_date;
    # The URL for the hosted verification page, which allows customers to verify their bank account.
    string hosted_verification_url;
};

# Line items that make up the credit note
public type CreditNoteLinesList record {
    # Details about each object.
    CreditNoteLineItem[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

public type V1InvoicesBody record {
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    string[]|string account_tax_ids?;
    # A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
    int application_fee_amount?;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
    boolean auto_advance?;
    # Settings for automatic tax lookup for this invoice.
    AutomaticTaxParam automatic_tax?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Defaults to `charge_automatically`.
    string collection_method?;
    # A list of up to 4 custom fields to be displayed on the invoice.
    InvoiceSettingsCustomFields|string custom_fields?;
    # The ID of the customer who will be billed.
    string customer;
    # The number of days from when the invoice is created until it is due. Valid only for invoices where `collection_method=send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    string default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    string default_source?;
    # The tax rates that will apply to any line item that does not have `tax_rates` set.
    string[] default_tax_rates?;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    string description?;
    # The coupons to redeem into discounts for the invoice. If not specified, inherits the discount from the invoice's customer. Pass an empty string to avoid inheriting any discounts.
    DiscountsDataParam|string discounts?;
    # The date on which payment for this invoice is due. Valid only for invoices where `collection_method=send_invoice`.
    int due_date?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Footer to be displayed on the invoice.
    string footer?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string on_behalf_of?;
    # Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
    PaymentSettings payment_settings?;
    # Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
    string statement_descriptor?;
    # The ID of the subscription to invoice, if any. If not set, the created invoice will include all pending invoice items for the customer. If set, the created invoice will only include pending invoice items for that subscription and pending invoice items not associated with any subscription. The subscription's billing cycle and regular subscription events won't be affected.
    string subscription?;
    # If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
    TransferDataSpecs1 transfer_data?;
};

public type SubscriptionDefaultTaxRates string[]|string;

public type DueDate RangeQuerySpecs|int;

# Point in Time
public type GelatoDataVerifiedOutputsDate record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

public type InvoiceSendBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
};

# Pending Updates store the changes pending from a previous update that will be applied
# to the Subscription upon successful payment.
public type SubscriptionsResourcePendingUpdate record {
    # If the update is applied, determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int? billing_cycle_anchor?;
    # The point after which the changes reflected by this update will be discarded and no longer applied.
    int expires_at;
    # List of subscription items, each with an attached plan, that will be set if the update is applied.
    SubscriptionItem[]? subscription_items?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time, if the update is applied.
    int? trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean? trial_from_plan?;
};

# 
public type SetupAttemptPaymentMethodDetailsCardPresent record {
    # The ID of the Card PaymentMethod which was generated by this SetupAttempt.
    string|PaymentMethod? generated_card?;
};

# A list of reversals that have been applied to the transfer.
public type TransferReversalList record {
    # Details about each object.
    TransferReversal[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type IssuingCardholderAuthorizationControls record {
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    string[]? allowed_categories?;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    string[]? blocked_categories?;
    # Limit spending with amount-based rules that apply across this cardholder's cards.
    IssuingCardholderSpendingLimit[]? spending_limits?;
    # Currency of the amounts within `spending_limits`.
    string? spending_limits_currency?;
};

# 
public type CountrySpecVerificationFieldDetails record {
    # Additional fields which are only required for some users.
    string[] additional;
    # Fields which every account must eventually provide.
    string[] minimum;
};

# A Reader represents a physical device for accepting payment details.
# 
# Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
public type TerminalReader record {
    # The current software version of the reader.
    string? device_sw_version?;
    # Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
    string device_type;
    # Unique identifier for the object.
    string id;
    # The local IP address of the reader.
    string? ip_address?;
    # Custom label given to the reader for easier identification.
    string label;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The location identifier of the reader.
    string|TerminalLocation? location?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Serial number of the reader.
    string serial_number;
    # The networking status of the reader.
    string? status?;
};

# An error response from the Stripe API
public type Error record {
    # 
    ApiErrors 'error;
};

# 
public type DeletedWebhookEndpoint record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type IssuingTransactionPurchaseDetails record {
    # Information about the flight that was purchased with this transaction.
    IssuingTransactionFlightData? flight?;
    # Information about fuel that was purchased with this transaction.
    IssuingTransactionFuelData? fuel?;
    # Information about lodging that was purchased with this transaction.
    IssuingTransactionLodgingData? lodging?;
    # The line items in the purchase.
    IssuingTransactionReceiptData[]? receipt?;
    # A merchant-specific order number.
    string? reference?;
};

# 
public type PaymentMethodBacsDebit record {
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # Sort code of the bank account. (e.g., `10-20-30`)
    string? sort_code?;
};

public type Discounts1 DiscountsDataParam|string;

# 
public type AccountSettings record {
    # 
    AccountBacsDebitPaymentsSettings bacs_debit_payments?;
    # 
    AccountBrandingSettings branding;
    # 
    AccountCardIssuingSettings card_issuing?;
    # 
    AccountCardPaymentsSettings card_payments;
    # 
    AccountDashboardSettings dashboard;
    # 
    AccountPaymentsSettings payments;
    # 
    AccountPayoutSettings payouts?;
    # 
    AccountSepaDebitPaymentsSettings sepa_debit_payments?;
};

# 
public type OfflineAcceptance record {
};

# 
public type IssuingCardholderRequirements record {
    # If `disabled_reason` is present, all cards will decline authorizations with `cardholder_verification_required` reason.
    string? disabled_reason?;
    # Array of fields that need to be collected in order to verify and re-enable the cardholder.
    string[]? past_due?;
};

public type SourceTypeSepaDebit record {
    string? bank_code?;
    string? branch_code?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? mandate_reference?;
    string? mandate_url?;
};

# The dimensions of this product for shipping purposes.
public type PackageDimensionsSpecs record {
    decimal height;
    decimal length;
    decimal weight;
    decimal width;
};

# 
public type TransformQuantity record {
    # Divide usage by this number.
    int divide_by;
    # After division, either round the result `up` or `down`.
    string round;
};

# 
public type InvoiceSettingCustomField record {
    # The name of the custom field.
    string name;
    # The value of the custom field.
    string value;
};

# 
public type IssuingTransactionFlightData record {
    # The time that the flight departed.
    int? departure_at?;
    # The name of the passenger.
    string? passenger_name?;
    # Whether the ticket is refundable.
    boolean? refundable?;
    # The legs of the trip.
    IssuingTransactionFlightDataLeg[]? segments?;
    # The travel agency that issued the ticket.
    string? travel_agency?;
};

# 
public type DeletedPlan record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type Networks record {
    # All available networks for the card.
    string[] available;
    # The preferred network for the card.
    string? preferred?;
};

# 
public type PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit record {
};

# 
public type PaymentMethodCardChecks record {
    # If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_postal_code_check?;
    # If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? cvc_check?;
};

# 
public type AccountPayoutSettings record {
    # A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See our [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances) documentation for details. Default value is `true` for Express accounts and `false` for Custom accounts.
    boolean debit_negative_balances;
    # 
    TransferSchedule schedule;
    # The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard.
    string? statement_descriptor?;
};

# 
public type InvoiceThresholdReason record {
    # The total invoice amount threshold boundary if it triggered the threshold invoice.
    int? amount_gte?;
    # Indicates which line items triggered a threshold invoice.
    InvoiceItemThresholdReason[] item_reasons;
};

# 
public type LegalEntityPersonVerificationDocument record {
    # The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? back?;
    # A user-displayable string describing the verification state of this document. For example, if a document is uploaded and the picture is too fuzzy, this may say "Identity document is too unclear to read".
    string? details?;
    # One of `document_corrupt`, `document_country_not_supported`, `document_expired`, `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_missing_back`, `document_missing_front`, `document_not_readable`, `document_not_uploaded`, `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A machine-readable code specifying the verification state for this document.
    string? details_code?;
    # The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? front?;
};

# 
public type PaymentMethodDetailsCardWalletGooglePay record {
};

# 
public type PaymentMethodSofort record {
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
};

public type ConfigurationItemParams record {
    ItemBillingThresholdsParam|string billing_thresholds?;
    string price?;
    RecurringPriceData1 price_data?;
    int quantity?;
    string[]|string tax_rates?;
};

# 
public type DeletedTerminalLocation record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

public type SubscriptionSchedulesScheduleBody record {
    # Object representing the subscription schedule's default settings.
    DefaultSettingsParams1 default_settings?;
    # Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
    string end_behavior?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase. Note that past phases can be omitted.
    PhaseConfigurationParams1[] phases?;
    # If the update changes the current phase, indicates if the changes should be prorated. Possible values are `create_prorations` or `none`, and the default value is `create_prorations`.
    string proration_behavior?;
};

# 
public type QuotesResourceTransferData record {
    # The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.
    int? amount?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount will be transferred to the destination.
    decimal? amount_percent?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

# 
public type SubscriptionBillingThresholds record {
    # Monetary threshold that triggers the subscription to create an invoice
    int? amount_gte?;
    # Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`.
    boolean? reset_billing_cycle_anchor?;
};

# 
public type DeletedCard record {
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string? currency?;
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PriceTier record {
    # Price for the entire tier.
    int? flat_amount?;
    # Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
    string? flat_amount_decimal?;
    # Per unit price for units relevant to the tier.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
    # Up to and including to this quantity will be contained in the tier.
    int? up_to?;
};

# 
public type LoginLink record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The URL for the login link.
    string url;
};

# 
public type DeletedTaxId record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type IssuingDisputeNotReceivedEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when the cardholder expected to receive the product.
    int? expected_at?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    string? product_type?;
};

# Description of the SKU’s inventory
public type SkuInventory record {
    # The count of inventory available. Will be present if and only if `type` is `finite`.
    int? quantity?;
    # Inventory type. Possible values are `finite`, `bucket` (not quantified), and `infinite`.
    string 'type;
    # An indicator of the inventory available. Possible values are `in_stock`, `limited`, and `out_of_stock`. Will be present if and only if `type` is `bucket`.
    string? value?;
};

# 
public type CountrySpecVerificationFields record {
    # 
    CountrySpecVerificationFieldDetails company;
    # 
    CountrySpecVerificationFieldDetails individual;
};

# 
public type PaymentMethodDetailsCardWallet record {
    # 
    PaymentMethodDetailsCardWalletAmexExpressCheckout amex_express_checkout?;
    # 
    PaymentMethodDetailsCardWalletApplePay apple_pay?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # 
    PaymentMethodDetailsCardWalletGooglePay google_pay?;
    # 
    PaymentMethodDetailsCardWalletMasterpass masterpass?;
    # 
    PaymentMethodDetailsCardWalletSamsungPay samsung_pay?;
    # The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
    string 'type;
    # 
    PaymentMethodDetailsCardWalletVisaCheckout visa_checkout?;
};

public type Tier record {
    int flat_amount?;
    string flat_amount_decimal?;
    int unit_amount?;
    string unit_amount_decimal?;
    string|int up_to;
};

# Default invoice settings for this customer.
public type CustomerParam1 record {
    InvoiceSettingsCustomFields|string custom_fields?;
    string default_payment_method?;
    string footer?;
};

public type BillingThresholds record {
    int usage_gte;
};

# [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a
# connected account, either entirely or partially, and can also specify whether
# to refund any related application fees. Transfer reversals add to the
# platform's balance and subtract from the destination account's balance.
# 
# Reversing a transfer that was made for a [destination
# charge](/docs/connect/destination-charges) is allowed only up to the amount of
# the charge. It is possible to reverse a
# [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options)
# transfer only if the destination account has enough balance to cover the
# reversal.
# 
# Related guide: [Reversing Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).
public type TransferReversal record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|BalanceTransaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Linked payment refund for the transfer reversal.
    string|Refund? destination_payment_refund?;
    # Unique identifier for the object.
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the refund responsible for the transfer reversal.
    string|Refund? source_refund?;
    # ID of the transfer that was reversed.
    string|Transfer transfer;
};

# 
public type PaymentIntentNextActionBoleto record {
    # The timestamp after which the boleto expires.
    int? expires_at?;
    # The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher.
    string? hosted_voucher_url?;
    # The boleto number.
    string? number?;
    # The URL to the downloadable boleto voucher PDF.
    string? pdf?;
};

# 
public type EphemeralKey record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Time at which the key will expire. Measured in seconds since the Unix epoch.
    int expires;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The key's secret. You can use this value to make authorized requests to the Stripe API.
    string secret?;
};

public type PaymentMethodsPaymentMethodBody record {
    # Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    BillingDetailsInnerParams billing_details?;
    # If this is a `card` PaymentMethod, this hash contains the user's card details.
    UpdateApiParam card?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
};

public type Created1 RangeQuerySpecs|int;

# `Refund` objects allow you to refund a charge that has previously been created
# but not yet refunded. Funds will be refunded to the credit or debit card that
# was originally charged.
# 
# Related guide: [Refunds](https://stripe.com/docs/refunds).
public type Refund record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|BalanceTransaction? balance_transaction?;
    # ID of the charge that was refunded.
    string|Charge? charge?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users. (Available on non-card refunds only)
    string description?;
    # If the refund failed, this balance transaction describes the adjustment made on your account balance that reverses the initial balance transaction.
    string|BalanceTransaction failure_balance_transaction?;
    # If the refund failed, the reason for refund failure if known. Possible values are `lost_or_stolen_card`, `expired_or_canceled_card`, or `unknown`.
    string failure_reason?;
    # Unique identifier for the object.
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the PaymentIntent that was refunded.
    string|PaymentIntent? payment_intent?;
    # Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).
    string? reason?;
    # This is the transaction number that appears on email receipts sent for this refund.
    string? receipt_number?;
    # The transfer reversal that is associated with the refund. Only present if the charge came from another Stripe account. See the Connect documentation for details.
    string|TransferReversal? source_transfer_reversal?;
    # Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or `failed`. For other types of refunds, it can be `pending`, `succeeded`, `failed`, or `canceled`. Refer to our [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.
    string? status?;
    # If the accompanying transfer was reversed, the transfer reversal object. Only applicable if the charge was created using the destination parameter.
    string|TransferReversal? transfer_reversal?;
};

public type SourceTypeP24 record {
    string? reference?;
};

# The customer's tax IDs.
public type TaxIDsList record {
    # Details about each object.
    TaxId[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type SourceRedirectFlow record {
    # The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.
    string? failure_reason?;
    # The URL you provide to redirect the customer to after they authenticated their payment.
    string return_url;
    # The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).
    string status;
    # The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.
    string url;
};

public type SubscriptionItemUpdateParams record {
    record {int usage_gte;}|string billing_thresholds?;
    boolean clear_usage?;
    boolean deleted?;
    string id?;
    record {}|string metadata?;
    string price?;
    RecurringPriceData1 price_data?;
    int quantity?;
    string[]|string tax_rates?;
};

# 
public type PortalSubscriptionPause record {
    # Whether the feature is enabled.
    boolean enabled;
};

# 
public type SetupIntentNextAction record {
    # 
    SetupIntentNextActionRedirectToUrl redirect_to_url?;
    # Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, or `oxxo_display_details`.
    string 'type;
    # When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
    record {} use_stripe_sdk?;
    # 
    SetupIntentNextActionVerifyWithMicrodeposits verify_with_microdeposits?;
};

# 
public type PaymentMethodOptionsCardInstallments record {
    # Installment plans that may be selected for this PaymentIntent.
    PaymentMethodDetailsCardInstallmentsPlan[]? available_plans?;
    # Whether Installments are enabled for this PaymentIntent.
    boolean enabled;
    # Installment plan selected for this PaymentIntent.
    PaymentMethodDetailsCardInstallmentsPlan? plan?;
};

public type AddInvoiceItemEntry record {
    string price?;
    OneTimePriceData price_data?;
    int quantity?;
    TaxRateArray|string tax_rates?;
};

# 
public type PaymentPagesPaymentPageResourcesShippingAddressCollection record {
    # An array of two-letter ISO country codes representing which countries Checkout should provide as options for
    # shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
    string[] allowed_countries;
};

# 
public type SourceTransactionSepaCreditTransferData record {
    # Reference associated with the transfer.
    string reference?;
    # Sender's bank account IBAN.
    string sender_iban?;
    # Sender's name.
    string sender_name?;
};

# To top up your Stripe balance, you create a top-up object. You can retrieve
# individual top-ups, as well as list all top-ups. Top-ups are identified by a
# unique, random ID.
# 
# Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).
public type Topup record {
    # Amount transferred.
    int amount;
    # ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up.
    string|BalanceTransaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up.
    int? expected_availability_date?;
    # Error code explaining reason for top-up failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
    string? failure_code?;
    # Message to user further explaining reason for top-up failure if available.
    string? failure_message?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # `Source` objects allow you to accept a variety of payment methods. They
    # represent a customer's payment instrument, and can be used with the Stripe API
    # just like a `Card` object: once chargeable, they can be charged, or can be
    # attached to customers.
    # 
    # Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
    Source 'source;
    # Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter.
    string? statement_descriptor?;
    # The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`.
    string status;
    # A string that identifies this top-up as part of a group.
    string? transfer_group?;
};

public type CustomerShippingAddress record {
    OptionalFieldsAddress address;
    string name;
    string phone?;
};

# 
public type SourceOwner record {
    # Owner's address.
    Address? address?;
    # Owner's email address.
    string? email?;
    # Owner's full name.
    string? name?;
    # Owner's phone number (including extension).
    string? phone?;
    # Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? verified_address?;
    # Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_email?;
    # Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
    # Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_phone?;
};

# 
public type PaymentMethodDetailsBoleto record {
    # Uniquely identifies this customer tax_id (CNPJ or CPF)
    string tax_id;
};

public type DiscountsDataParam DiscountsDataParam1[];

# Contains information about what this coupon applies to
public type CouponAppliesTo record {
    # A list of product IDs this coupon applies to
    string[] products;
};

# The line items purchased by the customer.
public type PaymentPagesCheckoutSessionListLineItems record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

public type V1PaymentMethodsBody record {
    # If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
    PaymentMethodParam acss_debit?;
    # If this is an `AfterpayClearpay` PaymentMethod, this hash contains details about the AfterpayClearpay payment method.
    record {} afterpay_clearpay?;
    # If this is an `Alipay` PaymentMethod, this hash contains details about the Alipay payment method.
    record {} alipay?;
    # If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
    Param au_becs_debit?;
    # If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    Param1 bacs_debit?;
    # If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    record {} bancontact?;
    # Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    BillingDetailsInnerParams billing_details?;
    # If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
    Param2 boleto?;
    # If this is a `card` PaymentMethod, this hash contains the user's card details. For backwards compatibility, you can alternatively provide a Stripe token (e.g., for Apple Pay, Amex Express Checkout, or legacy Checkout) into the card hash with format `card: {token: "tok_visa"}`. When providing a card number, you must meet the requirements for [PCI compliance](https://stripe.com/docs/security#validating-pci-compliance). We strongly recommend using Stripe.js instead of interacting with this API directly.
    CardDetailsParams|TokenParamas card?;
    # The `Customer` to whom the original PaymentMethod is attached.
    string customer?;
    # If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
    Param3 eps?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
    Param4 fpx?;
    # If this is a `giropay` PaymentMethod, this hash contains details about the Giropay payment method.
    record {} giropay?;
    # If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment method.
    record {} grabpay?;
    # If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
    Param5 ideal?;
    # If this is an `interac_present` PaymentMethod, this hash contains details about the Interac Present payment method.
    record {} interac_present?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {} metadata?;
    # If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
    record {} oxxo?;
    # If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
    Param6 p24?;
    # The PaymentMethod to share.
    string payment_method?;
    # If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    Param7 sepa_debit?;
    # If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
    Param8 sofort?;
    # The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    string 'type?;
    # If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
    record {} wechat_pay?;
};

# 
public type PaymentPagesCheckoutSessionTotalDetails record {
    # This is the sum of all the line item discounts.
    int amount_discount;
    # This is the sum of all the line item shipping amounts.
    int? amount_shipping?;
    # This is the sum of all the line item tax amounts.
    int amount_tax;
    # 
    PaymentPagesCheckoutSessionTotalDetailsResourceBreakdown breakdown?;
};

public type Created RangeQuerySpecs|int;

# Value lists allow you to group values together which can then be referenced in rules.
# 
# Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).
public type RadarValueList record {
    # The name of the value list for use in rules.
    string alias;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The name or email address of the user who created this value list.
    string created_by;
    # Unique identifier for the object.
    string id;
    # The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`.
    string item_type;
    # List of items contained within this value list.
    RadarListListItemList list_items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The name of the value list.
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type Recurring record {
    # Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
    string? aggregate_usage?;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    string interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
    string usage_type;
};

# 
public type PackageDimensions record {
    # Height, in inches.
    decimal height;
    # Length, in inches.
    decimal length;
    # Weight, in ounces.
    decimal weight;
    # Width, in inches.
    decimal width;
};

# 
public type SetupAttemptPaymentMethodDetailsBacsDebit record {
};

# 
public type PaymentMethodDetailsWechat record {
};

# The customer's payment sources, if any.
public type ApmsSourcesSourceList record {
    # Details about each object.
    (AlipayAccount|BankAccount|BitcoinReceiver|Card|Source)[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# Point in Time
public type GelatoDataIdNumberReportDate record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type PaymentMethodOptionsSofort record {
    # Preferred language of the SOFORT authorization page that the customer is redirected to.
    string? preferred_language?;
};

# A Checkout Session represents your customer's session as they pay for
# one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout).
# We recommend creating a new Session each time your customer attempts to pay.
# 
# Once payment is successful, the Checkout Session will contain a reference
# to the [Customer](https://stripe.com/docs/api/customers), and either the successful
# [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active
# [Subscription](https://stripe.com/docs/api/subscriptions).
# 
# You can create a Checkout Session on your server and pass its ID to the
# client to begin Checkout.
# 
# Related guide: [Checkout Server Quickstart](https://stripe.com/docs/payments/checkout/api).
public type CheckoutSession record {
    # Enables user redeemable promotion codes.
    boolean? allow_promotion_codes?;
    # Total of all items before discounts or taxes are applied.
    int? amount_subtotal?;
    # Total of all items after discounts and taxes are applied.
    int? amount_total?;
    # 
    PaymentPagesCheckoutSessionAutomaticTax automatic_tax;
    # Describes whether Checkout should collect the customer's billing address.
    string? billing_address_collection?;
    # The URL the customer will be directed to if they decide to cancel payment and return to your website.
    string cancel_url;
    # A unique string to reference the Checkout Session. This can be a
    # customer ID, a cart ID, or similar, and can be used to reconcile the
    # Session with your internal systems.
    string? client_reference_id?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string? currency?;
    # The ID of the customer for this Session.
    # For Checkout Sessions in `payment` or `subscription` mode, Checkout
    # will create a new customer object based on information provided
    # during the payment flow unless an existing customer was provided when
    # the Session was created.
    string|Customer|DeletedCustomer? customer?;
    # The customer details including the customer's tax exempt status and the customer's tax IDs. Only present on Sessions in `payment` or `subscription` mode.
    PaymentPagesCheckoutSessionCustomerDetails? customer_details?;
    # If provided, this value will be used when the Customer object is created.
    # If not provided, customers will be asked to enter their email address.
    # Use this parameter to prefill customer data if you already have an email
    # on file. To access information about the customer once the payment flow is
    # complete, use the `customer` attribute.
    string? customer_email?;
    # Unique identifier for the object. Used to pass to `redirectToCheckout`
    # in Stripe.js.
    string id;
    # The line items purchased by the customer.
    PaymentPagesCheckoutSessionListLineItems line_items?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
    string? locale?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # The mode of the Checkout Session.
    string mode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
    string|PaymentIntent? payment_intent?;
    # Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession.
    CheckoutSessionPaymentMethodOptions? payment_method_options?;
    # A list of the types of payment methods (e.g. card) this Checkout
    # Session is allowed to accept.
    string[] payment_method_types;
    # The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
    # You can use this value to decide when to fulfill your customer's order.
    string payment_status;
    # The ID of the SetupIntent for Checkout Sessions in `setup` mode.
    string|SetupIntent? setup_intent?;
    # Shipping information for this Checkout Session.
    Shipping? shipping?;
    # When set, provides configuration for Checkout to collect a shipping address from a customer.
    PaymentPagesPaymentPageResourcesShippingAddressCollection? shipping_address_collection?;
    # Describes the type of transaction being performed by Checkout in order to customize
    # relevant text on the page, such as the submit button. `submit_type` can only be
    # specified on Checkout Sessions in `payment` mode, but not Checkout Sessions
    # in `subscription` or `setup` mode.
    string? submit_type?;
    # The ID of the subscription for Checkout Sessions in `subscription` mode.
    string|Subscription? subscription?;
    # The URL the customer will be directed to after the payment or
    # subscription creation is successful.
    string success_url;
    # 
    PaymentPagesCheckoutSessionTaxIdCollection tax_id_collection?;
    # Tax and discount details for the computed total amount.
    PaymentPagesCheckoutSessionTotalDetails? total_details?;
    # The URL to the Checkout Session.
    string? url?;
};

# 
public type DeletedSku record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

public type PhaseConfigurationParams record {
    AddInvoiceItemEntry1[] add_invoice_items?;
    decimal application_fee_percent?;
    AutomaticTaxConfig3 automatic_tax?;
    string billing_cycle_anchor?;
    record {int amount_gte?; boolean reset_billing_cycle_anchor?;}|string billing_thresholds?;
    string collection_method?;
    string coupon?;
    string default_payment_method?;
    string[]|string default_tax_rates?;
    int end_date?;
    SubscriptionSchedulesParam1 invoice_settings?;
    ConfigurationItemParams[] items;
    int iterations?;
    string proration_behavior?;
    TransferDataSpecs3 transfer_data?;
    boolean trial?;
    int trial_end?;
};

# 
public type InvoicesList record {
    Invoice[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# If this is a `card` PaymentMethod, this hash contains the user's card details.
public type UpdateApiParam record {
    int exp_month?;
    int exp_year?;
};

# 
public type LegalEntityCompany record {
    # 
    Address address?;
    # The Kana variation of the company's primary address (Japan only).
    LegalEntityJapanAddress? address_kana?;
    # The Kanji variation of the company's primary address (Japan only).
    LegalEntityJapanAddress? address_kanji?;
    # Whether the company's directors have been provided. This Boolean will be `true` if you've manually indicated that all directors are provided via [the `directors_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-directors_provided).
    boolean directors_provided?;
    # Whether the company's executives have been provided. This Boolean will be `true` if you've manually indicated that all executives are provided via [the `executives_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-executives_provided), or if Stripe determined that sufficient executives were provided.
    boolean executives_provided?;
    # The company's legal name.
    string? name?;
    # The Kana variation of the company's legal name (Japan only).
    string? name_kana?;
    # The Kanji variation of the company's legal name (Japan only).
    string? name_kanji?;
    # Whether the company's owners have been provided. This Boolean will be `true` if you've manually indicated that all owners are provided via [the `owners_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-owners_provided), or if Stripe determined that sufficient owners were provided. Stripe determines ownership requirements using both the number of owners provided and their total percent ownership (calculated by adding the `percent_ownership` of each owner together).
    boolean owners_provided?;
    # The company's phone number (used for verification).
    string? phone?;
    # The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more details.
    string structure?;
    # Whether the company's business ID number was provided.
    boolean tax_id_provided?;
    # The jurisdiction in which the `tax_id` is registered (Germany-based companies only).
    string tax_id_registrar?;
    # Whether the company's business VAT number was provided.
    boolean vat_id_provided?;
    # Information on the verification state of the company.
    LegalEntityCompanyVerification? verification?;
};

# 
public type SetupIntentPaymentMethodOptionsCard record {
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    string? request_three_d_secure?;
};

public type SubscriptionBillingCycleAnchor string|int;

public type AutomaticTaxParam2 record {
    boolean enabled;
};

# 
public type SubscriptionPendingInvoiceItemInterval record {
    # Specifies invoicing frequency. Either `day`, `week`, `month` or `year`.
    string interval;
    # The number of intervals between invoices. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).
    int interval_count;
};

public type AutomaticTaxParam1 record {
    boolean enabled;
};

# A dispute occurs when a customer questions your charge with their card issuer.
# When this happens, you're given the opportunity to respond to the dispute with
# evidence that shows that the charge is legitimate. You can find more
# information about the dispute process in our [Disputes and
# Fraud](/docs/disputes) documentation.
# 
# Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).
public type Dispute record {
    # Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
    int amount;
    # List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute.
    BalanceTransaction[] balance_transactions;
    # ID of the charge that was disputed.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    DisputeEvidence evidence;
    # 
    DisputeEvidenceDetails evidence_details;
    # Unique identifier for the object.
    string id;
    # If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.
    boolean is_charge_refundable;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the PaymentIntent that was disputed.
    string|PaymentIntent? payment_intent?;
    # Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
    string reason;
    # Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `charge_refunded`, `won`, or `lost`.
    string status;
};

# Events are our way of letting you know when something interesting happens in
# your account. When an interesting event occurs, we create a new `Event`
# object. For example, when a charge succeeds, we create a `charge.succeeded`
# event; and when an invoice payment attempt fails, we create an
# `invoice.payment_failed` event. Note that many API requests may cause multiple
# events to be created. For example, if you create a new subscription for a
# customer, you will receive both a `customer.subscription.created` event and a
# `charge.succeeded` event.
# 
# Events occur when the state of another API resource changes. The state of that
# resource at the time of the change is embedded in the event's data field. For
# example, a `charge.succeeded` event will contain a charge, and an
# `invoice.payment_failed` event will contain an invoice.
# 
# As with other API resources, you can use endpoints to retrieve an
# [individual event](https://stripe.com/docs/api#retrieve_event) or a [list of events](https://stripe.com/docs/api#list_events)
# from the API. We also have a separate
# [webhooks](http://en.wikipedia.org/wiki/Webhook) system for sending the
# `Event` objects directly to an endpoint on your server. Webhooks are managed
# in your
# [account settings](https://dashboard.stripe.com/account/webhooks),
# and our [Using Webhooks](https://stripe.com/docs/webhooks) guide will help you get set up.
# 
# When using [Connect](https://stripe.com/docs/connect), you can also receive notifications of
# events that occur in connected accounts. For these events, there will be an
# additional `account` attribute in the received `Event` object.
# 
# **NOTE:** Right now, access to events through the [Retrieve Event API](https://stripe.com/docs/api#retrieve_event) is
# guaranteed only for 30 days.
public type Event record {
    # The connected account that originated the event.
    string account?;
    # The Stripe API version used to render `data`. *Note: This property is populated only for events on or after October 31, 2014*.
    string? api_version?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # 
    NotificationEventData data;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Number of webhooks that have yet to be successfully delivered (i.e., to return a 20x response) to the URLs you've specified.
    int pending_webhooks;
    # Information on the API request that instigated the event.
    NotificationEventRequest? request?;
    # Description of the event (e.g., `invoice.created` or `charge.refunded`).
    string 'type;
};

# 
public type PaymentMethodDetailsOxxo record {
    # OXXO reference number
    string? number?;
};

# 
public type PaymentMethodOptionsP24 record {
};

# Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
public type PaymentSettings record {
    PaymentMethodOptions payment_method_options?;
    string[]|string payment_method_types?;
};

# The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
public type Quotesresourcelistlineitems1 record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type BitcoinTransaction record {
    # The amount of `currency` that the transaction was converted to in real-time.
    int amount;
    # The amount of bitcoin contained in the transaction.
    int bitcoin_amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which this transaction was converted.
    string currency;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The receiver to which this transaction was sent.
    string receiver;
};

# 
public type PaymentPagesCheckoutSessionTaxId record {
    # The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, or `unknown`
    string 'type;
    # The value of the tax ID.
    string? value?;
};

# 
public type IssuingDisputeCanceledEvidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when order was canceled.
    int? canceled_at?;
    # Whether the cardholder was provided with a cancellation policy.
    boolean? cancellation_policy_provided?;
    # Reason for canceling the order.
    string? cancellation_reason?;
    # Date when the cardholder expected to receive the product.
    int? expected_at?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    string? product_type?;
    # Result of cardholder's attempt to return the product.
    string? return_status?;
    # Date when the product was returned or attempted to be returned.
    int? returned_at?;
};

# 
public type PaymentMethodCardWalletApplePay record {
};

# 
public type GelatoSessionIdNumberOptions record {
};

# 
public type CheckoutAcssDebitPaymentMethodOptions record {
    # Currency supported by the bank account. Returned when the Session is in `setup` mode.
    string currency?;
    # 
    CheckoutAcssDebitMandateOptions mandate_options?;
    # Bank account verification method.
    string verification_method?;
};

# 
public type PortalPaymentMethodUpdate record {
    # Whether the feature is enabled.
    boolean enabled;
};

# 
public type PaymentMethodInteracPresent record {
};

# 
public type GelatoVerifiedOutputs record {
    # The user's verified address.
    Address? address?;
    # The user’s verified date of birth.
    GelatoDataVerifiedOutputsDate? dob?;
    # The user's verified first name.
    string? first_name?;
    # The user's verified id number.
    string? id_number?;
    # The user's verified id number type.
    string? id_number_type?;
    # The user's verified last name.
    string? last_name?;
};

# 
public type PaymentMethodGiropay record {
};

# 
public type PaymentMethodDetailsSofort record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the SOFORT authorization page that the customer is redirected to.
    # Can be one of `de`, `en`, `es`, `fr`, `it`, `nl`, or `pl`
    string? preferred_language?;
    # Owner's verified full name. Values are verified or provided by SOFORT directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

public type InvoiceMarkUncollectibleBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
};

# 
public type IssuingTransactionAmountDetails record {
    # The fee charged by the ATM for the cash withdrawal.
    int? atm_fee?;
};

# 
public type PaymentPagesCheckoutSessionTaxIdCollection record {
    # Indicates whether tax ID collection is enabled for the session
    boolean enabled;
};

# 
public type LineItemsDiscountAmount record {
    # The amount discounted.
    int amount;
    # A discount represents the actual application of a coupon to a particular
    # customer. It contains information about when the discount began and when it
    # will end.
    # 
    # Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
    Discount discount;
};

public type SubscriptionTrialEnd1 string|int;

# 
public type InvoicesResourceInvoiceTaxId record {
    # The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, or `unknown`
    string 'type;
    # The value of the tax ID.
    string? value?;
};

# 
public type IssuingCardSpendingLimit record {
    # Maximum amount allowed to spend per interval.
    int amount;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
    string[]? categories?;
    # Interval (or event) to which the amount applies.
    string interval;
};

# 
public type PaymentMethodDetailsAcssDebit record {
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Institution number of the bank account
    string? institution_number?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    string mandate?;
    # Transit number of the bank account.
    string? transit_number?;
};

# 
public type SourceOrder record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The email address of the customer placing the order.
    string email?;
    # List of items constituting the order.
    SourceOrderItem[]? items?;
    # 
    Shipping shipping?;
};

# 
public type QuotesResourceTotalDetailsResourceBreakdown record {
    # The aggregated line item discounts.
    LineItemsDiscountAmount[] discounts;
    # The aggregated line item tax amounts by rate.
    LineItemsTaxAmount[] taxes;
};

# 
public type PaymentMethodDetailsGiropay record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # Owner's verified full name. Values are verified or provided by Giropay directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # Giropay rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

# 
public type SetupIntentPaymentMethodOptionsSepaDebit record {
    # 
    SetupIntentPaymentMethodOptionsMandateOptionsSepaDebit mandate_options?;
};

public type SourceTypeMultibanco record {
    string? entity?;
    string? reference?;
    string? refund_account_holder_address_city?;
    string? refund_account_holder_address_country?;
    string? refund_account_holder_address_line1?;
    string? refund_account_holder_address_line2?;
    string? refund_account_holder_address_postal_code?;
    string? refund_account_holder_address_state?;
    string? refund_account_holder_name?;
    string? refund_iban?;
};

# You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be
# notified about events that happen in your Stripe account or connected
# accounts.
# 
# Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.
# 
# Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).
public type WebhookEndpoint record {
    # The API version events are rendered as for this webhook endpoint.
    string? api_version?;
    # The ID of the associated Connect application.
    string? application?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # An optional description of what the webhook is used for.
    string? description?;
    # The list of events to enable for this endpoint. `['*']` indicates that all events are enabled, except those that require explicit selection.
    string[] enabled_events;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The endpoint's secret, used to generate [webhook signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.
    string secret?;
    # The status of the webhook. It can be `enabled` or `disabled`.
    string status;
    # The URL of the webhook endpoint.
    string url;
};

public type SubscriptionDefaultTaxRates1 string[]|string;

public type ProductsIdBody record {
    # Whether the product is available for purchase.
    boolean active?;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    string description?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    string[]|string images?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    AdditionalProperties|string metadata?;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    string name?;
    # The dimensions of this product for shipping purposes.
    PackageDimentionsSpecs|string package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean shippable?;
    # An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.
    # 
    # This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.
    #  It must contain at least one letter. May only be set if `type=service`.
    string statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string|string tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions. May only be set if `type=service`.
    string unit_label?;
    # A URL of a publicly-accessible webpage for this product.
    string url?;
};

# Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or leaving
# your Stripe account, such as a completed purchase or refund, is represented by an Issuing
# `Transaction` object.
# 
# Related guide: [Issued Card Transactions](https://stripe.com/docs/issuing/purchases/transactions).
public type IssuingTransaction record {
    # The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    IssuingTransactionAmountDetails? amount_details?;
    # The `Authorization` object that led to this transaction.
    string|IssuingAuthorization? authorization?;
    # ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated with this transaction.
    string|BalanceTransaction? balance_transaction?;
    # The card used to make this transaction.
    string|IssuingCard card;
    # The cardholder to whom this transaction belongs.
    string|IssuingCardholder? cardholder?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # If you've disputed the transaction, the ID of the dispute.
    string|IssuingDispute? dispute?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.
    int merchant_amount;
    # The currency with which the merchant is taking payment.
    string merchant_currency;
    # 
    IssuingAuthorizationMerchantData merchant_data;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Additional purchase information that is optionally provided by the merchant.
    IssuingTransactionPurchaseDetails? purchase_details?;
    # The nature of the transaction.
    string 'type;
    # The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`.
    string? wallet?;
};

# 
public type FinancialReportingFinanceReportRunRunParameters record {
    # The set of output columns requested for inclusion in the report run.
    string[] columns?;
    # Connected account ID by which to filter the report run.
    string connected_account?;
    # Currency of objects to be included in the report run.
    string currency?;
    # Ending timestamp of data to be included in the report run (exclusive).
    int interval_end?;
    # Starting timestamp of data to be included in the report run.
    int interval_start?;
    # Payout ID by which to filter the report run.
    string payout?;
    # Category of balance transactions to be included in the report run.
    string reporting_category?;
    # Defaults to `Etc/UTC`. The output timezone for all timestamps in the report. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones). Has no effect on `interval_start` or `interval_end`.
    string timezone?;
};

# 
public type IssuingAuthorizationMerchantData record {
    # A categorization of the seller's type of business. See our [merchant categories guide](https://stripe.com/docs/issuing/merchant-categories) for a list of possible values.
    string category;
    # The merchant category code for the seller’s business
    string category_code;
    # City where the seller is located
    string? city?;
    # Country where the seller is located
    string? country?;
    # Name of the seller
    string? name?;
    # Identifier assigned to the seller by the card brand
    string network_id;
    # Postal code where the seller is located
    string? postal_code?;
    # State where the seller is located
    string? state?;
};

# 
public type PaymentMethodDetailsSepaDebit record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Branch code of bank associated with the bank account.
    string? branch_code?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four characters of the IBAN.
    string? last4?;
    # ID of the mandate used to make this payment.
    string? mandate?;
};

# All invoices will be billed using the specified settings
public type SubscriptionSchedulesParam record {
    int days_until_due?;
};

# 
public type GelatoSessionDocumentOptions record {
    # Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
    string[] allowed_types?;
    # Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
    boolean require_id_number?;
    # Disable image uploads, identity document images have to be captured using the device’s camera.
    boolean require_live_capture?;
    # Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).
    boolean require_matching_selfie?;
};

# `Exchange Rate` objects allow you to determine the rates that Stripe is
# currently using to convert from one currency to another. Since this number is
# variable throughout the day, there are various reasons why you might want to
# know the current rate (for example, to dynamically price an item for a user
# with a default payment in a foreign currency).
# 
# If you want a guarantee that the charge is made with a certain exchange rate
# you expect is current, you can pass in `exchange_rate` to charges endpoints.
# If the value is no longer up to date, the charge won't go through. Please
# refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more
# details.
public type ExchangeRate record {
    # Unique identifier for the object. Represented as the three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Hash where the keys are supported currencies and the values are the exchange rate at which the base id currency converts to the key currency.
    record {} rates;
};

# 
public type IssuingTransactionFuelData record {
    # The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`.
    string 'type;
    # The units for `volume_decimal`. One of `us_gallon` or `liter`.
    string unit;
    # The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places.
    string unit_cost_decimal;
    # The volume of the fuel that was pumped, represented as a decimal string with at most 12 decimal places.
    string? volume_decimal?;
};

# 
public type DeletedDiscount record {
    # The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
    string? checkout_session?;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # The ID of the customer associated with this discount.
    string|Customer|DeletedCustomer? customer?;
    # Always true for a deleted object
    boolean deleted;
    # The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
    string id;
    # The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
    string? invoice?;
    # The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
    string? invoice_item?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The promotion code applied to create this discount.
    string|PromotionCode? promotion_code?;
    # Date that the coupon was applied.
    int 'start;
    # The subscription that this coupon is applied to, if it is applied to a particular subscription.
    string? subscription?;
};

# 
public type IssuingTransactionReceiptData record {
    # The description of the item. The maximum length of this field is 26 characters.
    string? description?;
    # The quantity of the item.
    decimal? quantity?;
    # The total for this line item in cents.
    int? total?;
    # The unit cost of the item in cents.
    int? unit_cost?;
};

# 
public type PaymentMethodAfterpayClearpay record {
};

public type V1SubscriptionsBody record {
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
    AddInvoiceItemEntry[] add_invoice_items?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
    decimal application_fee_percent?;
    # Automatic tax settings for this subscription.
    AutomaticTaxConfig automatic_tax?;
    # For new subscriptions, a past timestamp to backdate the subscription's start date to. If set, the first invoice will contain a proration for the timespan between the start date and the current time. Can be combined with trials and the billing cycle anchor.
    int backdate_start_date?;
    # A future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
    BillingThresholdParams|string billing_thresholds?;
    # A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
    int cancel_at?;
    # Boolean indicating whether this subscription should cancel at the end of the current period.
    boolean cancel_at_period_end?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    string collection_method?;
    # The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
    string coupon?;
    # The identifier of the customer to subscribe.
    string customer;
    # Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
    TaxRateArray|string default_tax_rates?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # A list of up to 20 subscription items, each with an attached price.
    SubscriptionItemCreateParams[] items?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    AdditionalProperties|string metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # Use `allow_incomplete` to create subscriptions with `status=incomplete` if the first invoice cannot be paid. Creating subscriptions with this status allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to create Subscriptions with `status=incomplete` when the first invoice requires payment, otherwise start as active. Subscriptions transition to `status=active` when successfully confirming the payment intent on the first invoice. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method. If the payment intent is not confirmed within 23 hours subscriptions transition to `status=incomplete_expired`, which is a terminal state.
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's first invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not create a subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    # 
    # `pending_if_incomplete` is only used with updates and cannot be passed when creating a subscription.
    string payment_behavior?;
    # Payment settings to pass to invoices created by the subscription.
    PaymentSettings1 payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    PendingInvoiceItemIntervalParams|string pending_invoice_item_interval?;
    # The API ID of a promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
    string promotion_code?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) resulting from the `billing_cycle_anchor`. Valid values are `create_prorations` or `none`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. Prorations can be disabled by passing `none`. If no value is passed, the default is `create_prorations`.
    string proration_behavior?;
    # If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
    TransferDataSpecs2 transfer_data?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    string|int trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean trial_from_plan?;
    # Integer representing the number of trial period days before the customer is charged for the first time. This will always overwrite any trials that might apply via a subscribed plan.
    int trial_period_days?;
};

# 
public type PaymentIntentPaymentMethodOptionsMandateOptionsAcssDebit record {
    # A URL for custom mandate text
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    string? payment_schedule?;
    # Transaction type of the mandate.
    string? transaction_type?;
};

# Reviews can be used to supplement automated fraud detection with human expertise.
# 
# Learn more about [Radar](/radar) and reviewing payments
# [here](https://stripe.com/docs/radar/reviews).
public type Review record {
    # The ZIP or postal code of the card used, if applicable.
    string? billing_zip?;
    # The charge associated with this review.
    string|Charge? charge?;
    # The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
    string? closed_reason?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    string id;
    # The IP address where the payment originated.
    string? ip_address?;
    # Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address.
    RadarReviewResourceLocation? ip_address_location?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # If `true`, the review needs action.
    boolean open;
    # The reason the review was opened. One of `rule` or `manual`.
    string opened_reason;
    # The PaymentIntent ID associated with this review, if one exists.
    string|PaymentIntent payment_intent?;
    # The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
    string reason;
    # Information related to the browsing session of the user who initiated the payment.
    RadarReviewResourceSession? session?;
};

# You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers).
# A customer's tax IDs are displayed on invoices and credit notes issued for the customer.
# 
# Related guide: [Customer Tax Identification Numbers](https://stripe.com/docs/billing/taxes/tax-ids).
public type TaxId record {
    # Two-letter ISO code representing the country of the tax ID.
    string? country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # ID of the customer.
    string|Customer? customer?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `gb_vat`, `hk_br`, `id_npwp`, `il_vat`, `in_gst`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `th_vat`, `tw_vat`, `us_ein`, or `za_vat`. Note that some legacy tax IDs have type `unknown`
    string 'type;
    # Value of the tax ID.
    string value;
    # Tax ID verification information.
    TaxIdVerification? verification?;
};

# When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing) must be settled directly with the card network. The net amount owed is represented by an Issuing `Settlement` object.
public type IssuingSettlement record {
    # The Bank Identification Number reflecting this settlement record.
    string bin;
    # The date that the transactions are cleared and posted to user's accounts.
    int clearing_date;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # The total interchange received as reimbursement for the transactions.
    int interchange_fees;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # The total net amount required to settle with the network.
    int net_total;
    # The card network for this settlement report. One of ["visa"]
    string network;
    # The total amount of fees owed to the network.
    int network_fees;
    # The Settlement Identification Number assigned by the network.
    string network_settlement_identifier;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # One of `international` or `uk_national_net`.
    string settlement_service;
    # The total number of transactions reflected in this settlement.
    int transaction_count;
    # The total transaction amount reflected in this settlement.
    int transaction_volume;
};

# 
public type PaymentMethodCardWalletGooglePay record {
};

# 
public type PaymentMethodCard record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string brand;
    # Checks on Card address and CVC if provided.
    PaymentMethodCardChecks? checks?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string funding;
    # Details of the original PaymentMethod that created this object.
    PaymentMethodCardGeneratedCard? generated_from?;
    # The last four digits of the card.
    string last4;
    # Contains information about card networks that can be used to process the payment.
    Networks? networks?;
    # Contains details on how this Card maybe be used for 3D Secure authentication.
    ThreeDSecureUsage? three_d_secure_usage?;
    # If this Card is part of a card wallet, this contains the details of the card wallet.
    PaymentMethodCardWallet? wallet?;
};

# 
public type PaymentMethodDetailsCardInstallments record {
    # Installment plan selected for the payment.
    PaymentMethodDetailsCardInstallmentsPlan? plan?;
};

# 
public type PaymentFlowsPaymentMethodList record {
    PaymentMethod[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# An early fraud warning indicates that the card issuer has notified us that a
# charge may be fraudulent.
# 
# Related guide: [Early Fraud Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).
public type RadarEarlyFraudWarning record {
    # An EFW is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a dispute later.
    boolean actionable;
    # ID of the charge this early fraud warning is for, optionally expanded.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
    string fraud_type;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the Payment Intent this early fraud warning is for, optionally expanded.
    string|PaymentIntent payment_intent?;
};

# When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing `Authorization`
# object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations) must be approved for the
# purchase to be completed successfully.
# 
# Related guide: [Issued Card Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).
public type IssuingAuthorization record {
    # The total amount that was authorized or rejected. This amount is in the card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    IssuingAuthorizationAmountDetails? amount_details?;
    # Whether the authorization has been approved.
    boolean approved;
    # How the card details were provided.
    string authorization_method;
    # List of balance transactions associated with this authorization.
    BalanceTransaction[] balance_transactions;
    # You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
    IssuingCard card;
    # The cardholder to whom this authorization belongs.
    string|IssuingCardholder? cardholder?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The currency that was presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string merchant_currency;
    # 
    IssuingAuthorizationMerchantData merchant_data;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook.
    IssuingAuthorizationPendingRequest? pending_request?;
    # History of every time `pending_request` was approved/denied, either by you directly or by Stripe (e.g. based on your `spending_controls`). If the merchant changes the authorization by performing an [incremental authorization](https://stripe.com/docs/issuing/purchases/authorizations), you can look at this field to see the previous requests for the authorization.
    IssuingAuthorizationRequest[] request_history;
    # The current status of the authorization in its lifecycle.
    string status;
    # List of [transactions](https://stripe.com/docs/api/issuing/transactions) associated with this authorization.
    IssuingTransaction[] transactions;
    # 
    IssuingAuthorizationVerificationData verification_data;
    # The digital wallet used for this authorization. One of `apple_pay`, `google_pay`, or `samsung_pay`.
    string? wallet?;
};

# Cardholder authentication via 3D Secure is initiated by creating a `3D Secure`
# object. Once the object has been created, you can use it to authenticate the
# cardholder and create a charge.
public type ThreeDSecure record {
    # Amount of the charge that you will create when authentication completes.
    int amount;
    # True if the cardholder went through the authentication flow and their bank indicated that authentication succeeded.
    boolean authenticated;
    # You can store multiple cards on a customer in order to charge the customer
    # later. You can also store multiple debit cards on a recipient in order to
    # transfer to those cards later.
    # 
    # Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
    Card card;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # If present, this is the URL that you should send the cardholder to for authentication. If you are going to use Stripe.js to display the authentication page in an iframe, you should use the value "_callback".
    string? redirect_url?;
    # Possible values are `redirect_pending`, `succeeded`, or `failed`. When the cardholder can be authenticated, the object starts with status `redirect_pending`. When liability will be shifted to the cardholder's bank (either because the cardholder was successfully authenticated, or because the bank has not implemented 3D Secure, the object wlil be in status `succeeded`. `failed` indicates that authentication was attempted unsuccessfully.
    string status;
};

public type InvoicePayBody record {
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # In cases where the source used to pay the invoice has insufficient funds, passing `forgive=true` controls whether a charge should be attempted for the full amount available on the source, up to the amount to fully pay the invoice. This effectively forgives the difference between the amount available on the source and the amount due. 
    # 
    # Passing `forgive=false` will fail the charge if the source hasn't been pre-funded with the right amount. An example for this case is with ACH Credit Transfers and wires: if the amount wired is less than the amount due by a small amount, you might want to forgive the difference. Defaults to `false`.
    boolean forgive?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted. Defaults to `true` (off-session).
    boolean off_session?;
    # Boolean representing whether an invoice is paid outside of Stripe. This will result in no charge being made. Defaults to `false`.
    boolean paid_out_of_band?;
    # A PaymentMethod to be charged. The PaymentMethod must be the ID of a PaymentMethod belonging to the customer associated with the invoice being paid.
    string payment_method?;
    # A payment source to be charged. The source must be the ID of a source belonging to the customer associated with the invoice being paid.
    string 'source?;
};

public type CustomerAddressWithName record {
    OptionalFieldsAddress address;
    string name;
    string phone?;
};

# 
public type CheckoutSessionPaymentMethodOptions record {
    # 
    CheckoutAcssDebitPaymentMethodOptions acss_debit?;
    # 
    PaymentMethodOptionsBoleto boleto?;
    # 
    PaymentMethodOptionsOxxo oxxo?;
};

# 
public type PaymentMethodOptionsAlipay record {
};

# Settings for automatic tax lookup for this invoice.
public type AutomaticTaxParam record {
    boolean enabled;
};

public type SubscriptionSchedulesParam1 record {
    int days_until_due?;
};

public type ItemBillingThresholdsParam record {
    int usage_gte;
};

# 
public type PaymentMethodDetailsKlarna record {
};

# 
public type DeletedInvoice record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type InvoiceSettingQuoteSetting record {
    # Number of days within which a customer must pay invoices generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`.
    int? days_until_due?;
};

# 
public type PaymentMethodOptionsBancontact record {
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    string preferred_language;
};

# To charge a credit or a debit card, you create a `Charge` object. You can
# retrieve and refund individual charges as well as list all charges. Charges
# are identified by a unique, random ID.
# 
# Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
public type Charge record {
    # Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount;
    # Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
    int amount_captured;
    # Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
    int amount_refunded;
    # ID of the Connect application that created the charge.
    string|Application? application?;
    # The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
    string|ApplicationFee? application_fee?;
    # The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
    int? application_fee_amount?;
    # ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
    string|BalanceTransaction? balance_transaction?;
    # 
    BillingDetails billing_details;
    # The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
    string? calculated_statement_descriptor?;
    # If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
    boolean captured;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the customer this charge is for if one exists.
    string|Customer|DeletedCustomer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Whether the charge has been disputed.
    boolean disputed;
    # Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
    string? failure_code?;
    # Message to user further explaining reason for charge failure if available.
    string? failure_message?;
    # Information on fraud assessments for the charge.
    ChargeFraudDetails? fraud_details?;
    # Unique identifier for the object.
    string id;
    # ID of the invoice this charge is for if one exists.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
    string|Account? on_behalf_of?;
    # ID of the order this charge is for if one exists.
    string|Order? 'order?;
    # Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
    ChargeOutcome? outcome?;
    # `true` if the charge succeeded, or was successfully authorized for later capture.
    boolean paid;
    # ID of the PaymentIntent associated with this charge, if one exists.
    string|PaymentIntent? payment_intent?;
    # ID of the payment method used in this charge.
    string? payment_method?;
    # Details about the payment method at the time of the transaction.
    PaymentMethodDetails? payment_method_details?;
    # This is the email address that the receipt for this charge was sent to.
    string? receipt_email?;
    # This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
    string? receipt_number?;
    # This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
    string? receipt_url?;
    # Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
    boolean refunded;
    # A list of refunds that have been applied to the charge.
    RefundList refunds;
    # ID of the review associated with this charge if one exists.
    string|Review? review?;
    # Shipping information for the charge.
    Shipping? shipping?;
    # The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
    string|Transfer? source_transfer?;
    # For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
    string? statement_descriptor?;
    # Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
    string? statement_descriptor_suffix?;
    # The status of the payment is either `succeeded`, `pending`, or `failed`.
    string status;
    # ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
    string|Transfer transfer?;
    # An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
    ChargeTransferData? transfer_data?;
    # A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
    string? transfer_group?;
};

# A Mandate is a record of the permission a customer has given you to debit their payment method.
public type Mandate record {
    # 
    CustomerAcceptance customer_acceptance;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # 
    MandateMultiUse multi_use?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the payment method associated with this mandate.
    string|PaymentMethod payment_method;
    # 
    MandatePaymentMethodDetails payment_method_details;
    # 
    MandateSingleUse single_use?;
    # The status of the mandate, which indicates whether it can be used to initiate a payment.
    string status;
    # The type of the mandate.
    string 'type;
};

# 
public type PaymentMethodDetailsCard record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? brand?;
    # Check results by Card networks on Card address and CVC at time of payment.
    PaymentMethodDetailsCardChecks? checks?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # Installment details for this payment (Mexico only).
    # 
    # For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
    PaymentMethodDetailsCardInstallments? installments?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # Populated if this transaction used 3D Secure authentication.
    ThreeDSecureDetails? three_d_secure?;
    # If this Card is part of a card wallet, this contains the details of the card wallet.
    PaymentMethodDetailsCardWallet? wallet?;
};

# 
public type SubscriptionsResourcePaymentSettings record {
    # Payment-method-specific configuration to provide to invoices created by the subscription.
    SubscriptionsResourcePaymentMethodOptions? payment_method_options?;
    # The list of payment method types to provide to every invoice created by the subscription. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice).
    string[]? payment_method_types?;
};

# 
public type BillingDetails record {
    # Billing address.
    Address? address?;
    # Email address.
    string? email?;
    # Full name.
    string? name?;
    # Billing phone number (including extension).
    string? phone?;
};

# 
public type MandateMultiUse record {
};

# A Quote is a way to model prices that you'd like to provide to a customer.
# Once accepted, it will automatically create an invoice, subscription or subscription schedule.
public type Quote record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Only applicable if there are no line items with recurring prices on the quote.
    int? application_fee_amount?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. Only applicable if there are line items with recurring prices on the quote.
    decimal? application_fee_percent?;
    # 
    QuotesResourceAutomaticTax automatic_tax;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or on finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    string collection_method;
    # 
    QuotesResourceComputed computed;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string? currency?;
    # The customer which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed.
    string|Customer|DeletedCustomer? customer?;
    # The tax rates applied to this quote.
    (string|TaxRate)[] default_tax_rates?;
    # A description that will be displayed on the quote PDF.
    string? description?;
    # The discounts applied to this quote.
    (string|Discount)[] discounts;
    # The date on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch.
    int expires_at;
    # A footer that will be displayed on the quote PDF.
    string? footer?;
    # Details of the quote that was cloned. See the [cloning documentation](https://stripe.com/docs/quotes/clone) for more details.
    QuotesResourceFromQuote? from_quote?;
    # A header that will be displayed on the quote PDF.
    string? header?;
    # Unique identifier for the object.
    string id;
    # The invoice that was created from this quote.
    string|Invoice|DeletedInvoice? invoice?;
    # All invoices will be billed using the specified settings.
    InvoiceSettingQuoteSetting? invoice_settings?;
    # A list of items the customer is being quoted for.
    QuotesResourceListLineItems line_items?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # A unique number that identifies this particular quote. This number is assigned once the quote is [finalized](https://stripe.com/docs/quotes/overview#finalize).
    string? number?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details.
    string|Account? on_behalf_of?;
    # The status of the quote.
    string status;
    # 
    QuotesResourceStatusTransitions status_transitions;
    # The subscription that was created or updated from this quote.
    string|Subscription? subscription?;
    # 
    QuotesResourceSubscriptionData subscription_data;
    # The subscription schedule that was created or updated from this quote.
    string|SubscriptionSchedule? subscription_schedule?;
    # 
    QuotesResourceTotalDetails total_details;
    # The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the invoices.
    QuotesResourceTransferData? transfer_data?;
};

# Subscription items allow you to create customer subscriptions with more than
# one plan, making it easy to represent complex billing relationships.
public type SubscriptionItem record {
    # Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
    SubscriptionItemBillingThresholds? billing_thresholds?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
    # [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.
    # 
    # For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.
    # 
    # Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
    Price price;
    # The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
    int quantity?;
    # The `subscription` this `subscription_item` belongs to.
    string subscription;
    # The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
    TaxRate[]? tax_rates?;
};

public type DeletedPaymentSource DeletedAlipayAccount|DeletedBankAccount|DeletedBitcoinReceiver|DeletedCard;

public type SourceTypeAuBecsDebit record {
    string? bsb_number?;
    string? fingerprint?;
    string? last4?;
};

# External accounts (bank accounts and debit cards) currently attached to this account
public type ExternalAccountList record {
    # The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
    (BankAccount|Card)[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type OnlineAcceptance record {
    # The IP address from which the Mandate was accepted by the customer.
    string? ip_address?;
    # The user agent of the browser from which the Mandate was accepted by the customer.
    string? user_agent?;
};

# 
public type SubscriptionItemBillingThresholds record {
    # Usage threshold that triggers the subscription to create an invoice
    int? usage_gte?;
};

# 
public type AccountCardPaymentsSettings record {
    # 
    AccountDeclineChargeOn decline_on?;
    # The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion.
    string? statement_descriptor_prefix?;
};

# 
public type SourceTransactionPaperCheckData record {
    # Time at which the deposited funds will be available for use. Measured in seconds since the Unix epoch.
    string available_at?;
    # Comma-separated list of invoice IDs associated with the paper check.
    string invoices?;
};

# 
public type GelatoReportDocumentOptions record {
    # Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
    string[] allowed_types?;
    # Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
    boolean require_id_number?;
    # Disable image uploads, identity document images have to be captured using the device’s camera.
    boolean require_live_capture?;
    # Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).
    boolean require_matching_selfie?;
};

# This is an object representing a Stripe account. You can retrieve it to see
# properties on the account like its current e-mail address or if the account is
# enabled yet to make live charges.
# 
# Some properties, marked below, are available only to platforms that want to
# [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).
public type Account record {
    # Business information about the account.
    AccountBusinessProfile? business_profile?;
    # The business type.
    string? business_type?;
    # 
    AccountCapabilities capabilities?;
    # Whether the account can create live charges.
    boolean charges_enabled?;
    # 
    LegalEntityCompany company?;
    # 
    AccountController controller?;
    # The account's country.
    string country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created?;
    # Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).
    string default_currency?;
    # Whether account details have been submitted. Standard accounts cannot receive payouts before this is true.
    boolean details_submitted?;
    # An email address associated with the account. You can treat this as metadata: it is not used for authentication or messaging account holders.
    string? email?;
    # External accounts (bank accounts and debit cards) currently attached to this account
    ExternalAccountList external_accounts?;
    # Unique identifier for the object.
    string id;
    # This is an object representing a person associated with a Stripe account.
    # 
    # A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account.
    # See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.
    # 
    # Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
    Person individual?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Whether Stripe can send payouts to this account.
    boolean payouts_enabled?;
    # 
    AccountRequirements requirements?;
    # Options for customizing how the account functions within Stripe.
    AccountSettings? settings?;
    # 
    AccountTosAcceptance tos_acceptance?;
    # The Stripe account type. Can be `standard`, `express`, or `custom`.
    string 'type?;
};

# Invoices are statements of amounts owed by a customer, and are either
# generated one-off, or generated periodically from a subscription.
# 
# They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration adjustments
# that may be caused by subscription upgrades/downgrades (if necessary).
# 
# If your invoice is configured to be billed through automatic charges,
# Stripe automatically finalizes your invoice and attempts payment. Note
# that finalizing the invoice,
# [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does
# not happen immediately as the invoice is created. Stripe waits
# until one hour after the last webhook was successfully sent (or the last
# webhook timed out after failing). If you (and the platforms you may have
# connected to) have no webhooks configured, Stripe waits one hour after
# creation to finalize the invoice.
# 
# If your invoice is configured to be billed by sending an email, then based on your
# [email settings](https://dashboard.stripe.com/account/billing/automatic),
# Stripe will email the invoice to your customer and await payment. These
# emails can contain a link to a hosted page to pay the invoice.
# 
# Stripe applies any customer credit on the account before determining the
# amount due for the invoice (i.e., the amount that will be actually
# charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
# per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the
# invoice is automatically marked paid, and we add the amount due to the
# customer's credit balance which is applied to the next invoice.
# 
# More details on the customer's credit balance are
# [here](https://stripe.com/docs/billing/customer/balance).
# 
# Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).
public type Invoice record {
    # The country of the business associated with this invoice, most often the business creating the invoice.
    string? account_country?;
    # The public name of the business associated with this invoice, most often the business creating the invoice.
    string? account_name?;
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    (string|TaxId|DeletedTaxId)[]? account_tax_ids?;
    # Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
    int amount_due;
    # The amount, in %s, that was paid.
    int amount_paid;
    # The amount remaining, in %s, that is due.
    int amount_remaining;
    # The fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account when the invoice is paid.
    int? application_fee_amount?;
    # Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.
    int attempt_count;
    # Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
    boolean attempted;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
    boolean auto_advance?;
    # 
    AutomaticTax automatic_tax;
    # Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.
    string? billing_reason?;
    # ID of the latest charge generated for this invoice, if any.
    string|Charge? charge?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.
    string collection_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Custom fields displayed on the invoice.
    InvoiceSettingCustomField[]? custom_fields?;
    # The ID of the customer who will be billed.
    string|Customer|DeletedCustomer? customer?;
    # The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated.
    Address? customer_address?;
    # The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_email?;
    # The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_name?;
    # The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_phone?;
    # The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.
    Shipping? customer_shipping?;
    # The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_tax_exempt?;
    # The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated.
    InvoicesResourceInvoiceTaxId[]? customer_tax_ids?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    string|PaymentMethod? default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    string|AlipayAccount|BankAccount|BitcoinReceiver|Card|Source? default_source?;
    # The tax rates applied to this invoice, if any.
    TaxRate[] default_tax_rates;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    string? description?;
    # Describes the current discount applied to this invoice, if there is one. Not populated if there are multiple discounts.
    Discount? discount?;
    # The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount|DeletedDiscount)[]? discounts?;
    # The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`.
    int? due_date?;
    # Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.
    int? ending_balance?;
    # Footer displayed on the invoice.
    string? footer?;
    # The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.
    string? hosted_invoice_url?;
    # Unique identifier for the object.
    string id?;
    # The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.
    string? invoice_pdf?;
    # The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized.
    ApiErrors? last_finalization_error?;
    # The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
    Invoicelineslist1 lines;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`.
    int? next_payment_attempt?;
    # A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified.
    string? number?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string|Account? on_behalf_of?;
    # Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer's account balance.
    boolean paid;
    # The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.
    string|PaymentIntent? payment_intent?;
    # 
    InvoicesPaymentSettings payment_settings;
    # End of the usage period during which invoice items were added to this invoice.
    int period_end;
    # Start of the usage period during which invoice items were added to this invoice.
    int period_start;
    # Total amount of all post-payment credit notes issued for this invoice.
    int post_payment_credit_notes_amount;
    # Total amount of all pre-payment credit notes issued for this invoice.
    int pre_payment_credit_notes_amount;
    # The quote this invoice was generated from.
    string|Quote? quote?;
    # This is the transaction number that appears on email receipts sent for this invoice.
    string? receipt_number?;
    # Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.
    int starting_balance;
    # Extra information about an invoice for the customer's credit card statement.
    string? statement_descriptor?;
    # The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
    string? status?;
    # 
    InvoicesStatusTransitions status_transitions;
    # The subscription that this invoice was prepared for, if any.
    string|Subscription? subscription?;
    # Only set for upcoming invoices that preview prorations. The time used to calculate prorations.
    int subscription_proration_date?;
    # Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated
    int subtotal;
    # The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
    int? tax?;
    # 
    InvoiceThresholdReason threshold_reason?;
    # Total after discounts and taxes.
    int total;
    # The aggregate amounts calculated per discount across all line items.
    DiscountsResourceDiscountAmount[]? total_discount_amounts?;
    # The aggregate amounts calculated per tax rate for all line items.
    InvoiceTaxAmount[] total_tax_amounts;
    # The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to for the invoice.
    InvoiceTransferData? transfer_data?;
    # Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created.
    int? webhooks_delivered_at?;
};

# 
public type CustomerTax record {
    # Surfaces if automatic tax computation is possible given the current customer location information.
    string automatic_tax;
    # A recent IP address of the customer used for tax reporting and tax location inference.
    string? ip_address?;
    # The customer's location as identified by Stripe Tax.
    CustomerTaxLocation? location?;
};

# 
public type DeletedTerminalReader record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type ConnectCollectionTransfer record {
    # Amount transferred, in %s.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the account that funds are being collected for.
    string|Account destination;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type PaymentMethodDetailsAuBecsDebit record {
    # Bank-State-Branch number of the bank account.
    string? bsb_number?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    string mandate?;
};

public type Discounts DiscountsDataParam|string;

public type SourceTypeAcssDebit record {
    string? bank_address_city?;
    string? bank_address_line_1?;
    string? bank_address_line_2?;
    string? bank_address_postal_code?;
    string? bank_name?;
    string? category?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? routing_number?;
};

# 
public type PaymentPagesCheckoutSessionAutomaticTax record {
    # Indicates whether automatic tax is enabled for the session
    boolean enabled;
    # The status of the most recent automated tax calculation for this session.
    string? status?;
};

public type TransferDataSpecs record {
    decimal amount_percent?;
    string destination;
};

# A line item.
public type Item record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes.
    int amount_total;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
    string description;
    # The discounts applied to the line item.
    LineItemsDiscountAmount[] discounts?;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The price used to generate the line item.
    Price? price?;
    # The quantity of products being purchased.
    int? quantity?;
    # The taxes applied to the line item.
    LineItemsTaxAmount[] taxes?;
};

# 
public type CreditNoteTaxAmount record {
    # The amount, in %s, of the tax.
    int amount;
    # Whether this tax amount is inclusive or exclusive.
    boolean inclusive;
    # The tax rate that was applied to get this tax amount.
    string|TaxRate tax_rate;
};

# 
public type CardGeneratedFromPaymentMethodDetails record {
    # 
    PaymentMethodDetailsCardPresent card_present?;
    # The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`.
    string 'type;
};

public type V1SubscriptionSchedulesBody record {
    # The identifier of the customer to create the subscription schedule for.
    string customer?;
    # Object representing the subscription schedule's default settings.
    DefaultSettingsParams default_settings?;
    # Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
    string end_behavior?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # Migrate an existing subscription to be managed by a subscription schedule. If this parameter is set, a subscription schedule will be created using the subscription's item(s), set to auto-renew using the subscription's interval. When using this parameter, other parameters (such as phase values) cannot be set. To create a subscription schedule with other modifications, we recommend making two separate API calls.
    string from_subscription?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase.
    PhaseConfigurationParams[] phases?;
    # When the subscription schedule starts. We recommend using `now` so that it starts the subscription immediately. You can also use a Unix timestamp to backdate the subscription so that it starts on a past date, or set a future date for the subscription to start on.
    int|string start_date?;
};

# 
public type PortalInvoiceList record {
    # Whether the feature is enabled.
    boolean enabled;
};

# Subscriptions allow you to charge a customer on a recurring basis.
# 
# Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
public type Subscription record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
    decimal? application_fee_percent?;
    # 
    SubscriptionAutomaticTax automatic_tax;
    # Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int billing_cycle_anchor;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    SubscriptionBillingThresholds? billing_thresholds?;
    # A date in the future at which the subscription will automatically get canceled
    int? cancel_at?;
    # If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
    boolean cancel_at_period_end;
    # If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
    int? canceled_at?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    string collection_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
    int current_period_end;
    # Start of the current period that the subscription has been invoiced for.
    int current_period_start;
    # ID of the customer who owns the subscription.
    string|Customer|DeletedCustomer customer;
    # Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
    int? days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string|PaymentMethod? default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string|AlipayAccount|BankAccount|BitcoinReceiver|Card|Source? default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
    TaxRate[]? default_tax_rates?;
    # Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
    Discount? discount?;
    # If the subscription has ended, the date the subscription ended.
    int? ended_at?;
    # Unique identifier for the object.
    string id;
    # List of subscription items, each with an attached price.
    SubscriptionItemList items;
    # The most recent invoice this subscription has generated.
    string|Invoice? latest_invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
    int? next_pending_invoice_item_invoice?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # If specified, payment collection for this subscription will be paused.
    SubscriptionsResourcePauseCollection? pause_collection?;
    # Payment settings passed on to invoices created by the subscription.
    SubscriptionsResourcePaymentSettings? payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    SubscriptionPendingInvoiceItemInterval? pending_invoice_item_interval?;
    # You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
    string|SetupIntent? pending_setup_intent?;
    # If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
    SubscriptionsResourcePendingUpdate? pending_update?;
    # The schedule attached to the subscription
    string|SubscriptionSchedule? schedule?;
    # Date when the subscription was first created. The date might differ from the `created` date due to backdating.
    int start_date;
    # Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`. 
    # 
    # For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated. 
    # 
    # A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over. 
    # 
    # If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts. 
    # 
    # If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
    string status;
    # The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    SubscriptionTransferData? transfer_data?;
    # If the subscription has a trial, the end of that trial.
    int? trial_end?;
    # If the subscription has a trial, the beginning of that trial.
    int? trial_start?;
};

# 
public type PaymentMethodCardPresent record {
};

# A Promotion Code represents a customer-redeemable code for a coupon. It can be used to
# create multiple codes for a single coupon.
public type PromotionCode record {
    # Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.
    boolean active;
    # The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer.
    string code;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The customer that this promotion code can be used by.
    string|Customer|DeletedCustomer? customer?;
    # Date at which the promotion code can no longer be redeemed.
    int? expires_at?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Maximum number of times this promotion code can be redeemed.
    int? max_redemptions?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    PromotionCodesResourceRestrictions restrictions;
    # Number of times this promotion code has been used.
    int times_redeemed;
};

# 
public type AccountBacsDebitPaymentsSettings record {
    # The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this will appear on the mandate, and as the statement descriptor.
    string display_name?;
};

# 
public type IssuingCardholderCompany record {
    # Whether the company's business ID number was provided.
    boolean tax_id_provided;
};

# 
public type SetupAttemptPaymentMethodDetailsSepaDebit record {
};

# 
public type SubscriptionTransferData record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
    decimal? amount_percent?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

# 
public type InvoiceLinesList record {
    # Details about each object.
    LineItem[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# You can store multiple cards on a customer in order to charge the customer
# later. You can also store multiple debit cards on a recipient in order to
# transfer to those cards later.
# 
# Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
public type Card record {
    # The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.
    string|Account? account?;
    # City/District/Suburb/Town/Village.
    string? address_city?;
    # Billing address country, if provided when creating card.
    string? address_country?;
    # Address line 1 (Street address/PO Box/Company name).
    string? address_line1?;
    # If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # Address line 2 (Apartment/Suite/Unit/Building).
    string? address_line2?;
    # State/County/Province/Region.
    string? address_state?;
    # ZIP or postal code.
    string? address_zip?;
    # If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_zip_check?;
    # A set of available payout methods for this card. Only values from this set should be passed as the `method` when creating a payout.
    string[]? available_payout_methods?;
    # Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.
    string brand;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.
    string? currency?;
    # The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
    string|Customer|DeletedCustomer? customer?;
    # If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).
    string? cvc_check?;
    # Whether this card is the default external account for its currency.
    boolean? default_for_currency?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string funding;
    # Unique identifier for the object.
    string id;
    # The last four digits of the card.
    string last4;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # Cardholder name.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.
    string|Recipient? recipient?;
    # If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.
    string? tokenization_method?;
};

# 
public type QuotesResourceComputed record {
    # The definitive totals and line items the customer will be charged on a recurring basis. Takes into account the line items with recurring prices and discounts with `duration=forever` coupons only. Defaults to `null` if no inputted line items with recurring prices.
    QuotesResourceRecurring? recurring?;
    # 
    QuotesResourceUpfront upfront;
};

# Stripe needs to collect certain pieces of information about each account
# created. These requirements can differ depending on the account's country. The
# Country Specs API makes these rules available to your integration.
# 
# You can also view the information from this API call as [an online
# guide](/docs/connect/required-verification-information).
public type CountrySpec record {
    # The default currency for this country. This applies to both payment methods and bank accounts.
    string default_currency;
    # Unique identifier for the object. Represented as the ISO country code for this country.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Currencies that can be accepted in the specific country (for transfers).
    record {} supported_bank_account_currencies;
    # Currencies that can be accepted in the specified country (for payments).
    string[] supported_payment_currencies;
    # Payment methods available in the specified country. You may need to enable some payment methods (e.g., [ACH](https://stripe.com/docs/ach)) on your account before they appear in this list. The `stripe` payment method refers to [charging through your platform](https://stripe.com/docs/connect/destination-charges).
    string[] supported_payment_methods;
    # Countries that can accept transfers from the specified country.
    string[] supported_transfer_countries;
    # 
    CountrySpecVerificationFields verification_fields;
};

# 
public type PaymentMethodEps record {
    # The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
    string? bank?;
};

# 
public type Rule record {
    # The action taken on the payment.
    string action;
    # Unique identifier for the object.
    string id;
    # The predicate to evaluate the payment against.
    string predicate;
};

# Balance transactions represent funds moving through your Stripe account.
# They're created for every type of transaction that comes into or flows out of your Stripe account balance.
# 
# Related guide: [Balance Transaction Types](https://stripe.com/docs/reports/balance-transaction-types).
public type BalanceTransaction record {
    # Gross amount of the transaction, in %s.
    int amount;
    # The date the transaction's net funds will become available in the Stripe balance.
    int available_on;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.
    decimal? exchange_rate?;
    # Fees (in %s) paid for this transaction.
    int fee;
    # Detailed breakdown of fees (in %s) paid for this transaction.
    Fee[] fee_details;
    # Unique identifier for the object.
    string id;
    # Net amount of the transaction, in %s.
    int net;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.
    string reporting_category;
    # The Stripe object to which this transaction is related.
    string|ApplicationFee|Charge|ConnectCollectionTransfer|Dispute|FeeRefund|IssuingAuthorization|IssuingDispute|IssuingTransaction|Payout|PlatformTaxFee|Refund|ReserveTransaction|TaxDeductedAtSource|Topup|Transfer|TransferReversal? 'source?;
    # If the transaction's net funds are available in the Stripe balance yet. Either `available` or `pending`.
    string status;
    # Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance transaction types and what they represent. If you are looking to classify transactions for accounting purposes, you might want to consider `reporting_category` instead.
    string 'type;
};

# Result from an id_number check
public type GelatoIdNumberReport record {
    # Date of birth.
    GelatoDataIdNumberReportDate? dob?;
    # Details on the verification error. Present when status is `unverified`.
    GelatoIdNumberReportError? 'error?;
    # First name.
    string? first_name?;
    # ID number.
    string? id_number?;
    # Type of ID number.
    string? id_number_type?;
    # Last name.
    string? last_name?;
    # Status of this `id_number` check.
    string status;
};

# 
public type AccountCardIssuingSettings record {
    # 
    CardIssuingAccountTermsOfService tos_acceptance?;
};

# Object representing the subscription schedule’s default settings
public type SubscriptionSchedulesResourceDefaultSettings record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
    decimal? application_fee_percent?;
    # 
    SubscriptionSchedulesResourceDefaultSettingsAutomaticTax automatic_tax?;
    # Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    string billing_cycle_anchor;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    SubscriptionBillingThresholds? billing_thresholds?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    string? collection_method?;
    # ID of the default payment method for the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
    string|PaymentMethod? default_payment_method?;
    # The subscription schedule's default invoice settings.
    InvoiceSettingSubscriptionScheduleSetting? invoice_settings?;
    # The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    SubscriptionTransferData? transfer_data?;
};

# 
public type GelatoVerificationSessionOptions record {
    # 
    GelatoSessionDocumentOptions document?;
    # 
    GelatoSessionIdNumberOptions id_number?;
};

# 
public type PaymentMethodCardGeneratedCard record {
    # The charge that created this object.
    string? charge?;
    # Transaction-specific details of the payment method used in the payment.
    CardGeneratedFromPaymentMethodDetails? payment_method_details?;
    # The ID of the SetupAttempt that generated this PaymentMethod, if any.
    string|SetupAttempt? setup_attempt?;
};

public type SourceTypeAchCreditTransfer record {
    string? account_number?;
    string? bank_name?;
    string? fingerprint?;
    string? refund_account_holder_name?;
    string? refund_account_holder_type?;
    string? refund_routing_number?;
    string? routing_number?;
    string? swift_code?;
};

# 
public type PortalSubscriptionUpdate record {
    # The types of subscription updates that are supported for items listed in the `products` attribute. When empty, subscriptions are not updateable.
    string[] default_allowed_updates;
    # Whether the feature is enabled.
    boolean enabled;
    # The list of products that support subscription updates.
    PortalSubscriptionUpdateProduct[]? products?;
    # Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`.
    string proration_behavior;
};

# 
public type PaymentMethodOptionsOxxo record {
    # The number of calendar days before an OXXO invoice expires. For example, if you create an OXXO invoice on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
    int expires_after_days;
};

public type PendingInvoiceItemIntervalParams record {
    string interval;
    int interval_count?;
};

# 
public type LegalEntityDob record {
    # The day of birth, between 1 and 31.
    int? day?;
    # The month of birth, between 1 and 12.
    int? month?;
    # The four-digit year of birth.
    int? year?;
};

public type BillingThresholdParams record {
    int amount_gte?;
    boolean reset_billing_cycle_anchor?;
};

# 
public type SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit record {
    # A URL for custom mandate text
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    string? payment_schedule?;
    # Transaction type of the mandate.
    string? transaction_type?;
};

# 
public type DeletedPrice record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type DisputeEvidence record {
    # Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity.
    string? access_activity_log?;
    # The billing address provided by the customer.
    string? billing_address?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer.
    string|File? cancellation_policy?;
    # An explanation of how and when the customer was shown your refund policy prior to purchase.
    string? cancellation_policy_disclosure?;
    # A justification for why the customer's subscription was not canceled.
    string? cancellation_rebuttal?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service.
    string|File? customer_communication?;
    # The email address of the customer.
    string? customer_email_address?;
    # The name of the customer.
    string? customer_name?;
    # The IP address that the customer used when making the purchase.
    string? customer_purchase_ip?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer's signature.
    string|File? customer_signature?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate.
    string|File? duplicate_charge_documentation?;
    # An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate.
    string? duplicate_charge_explanation?;
    # The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge.
    string? duplicate_charge_id?;
    # A description of the product or service that was sold.
    string? product_description?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge.
    string|File? receipt?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer.
    string|File? refund_policy?;
    # Documentation demonstrating that the customer was shown your refund policy prior to purchase.
    string? refund_policy_disclosure?;
    # A justification for why the customer is not entitled to a refund.
    string? refund_refusal_explanation?;
    # The date on which the customer received or began receiving the purchased service, in a clear human-readable format.
    string? service_date?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement.
    string|File? service_documentation?;
    # The address to which a physical product was shipped. You should try to include as complete address information as possible.
    string? shipping_address?;
    # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas.
    string? shipping_carrier?;
    # The date on which a physical product began its route to the shipping address, in a clear human-readable format.
    string? shipping_date?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer's full shipping address, if possible.
    string|File? shipping_documentation?;
    # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
    string? shipping_tracking_number?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements.
    string|File? uncategorized_file?;
    # Any additional evidence or statements.
    string? uncategorized_text?;
};

public type SourceTypeAlipay record {
    string? data_string?;
    string? native_url?;
    string? statement_descriptor?;
};

# 
public type PaymentMethodDetailsBancontact record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|PaymentMethod? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    string? preferred_language?;
    # Owner's verified full name. Values are verified or provided by Bancontact directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# 
public type CreditNoteLineItem record {
    # The integer amount in %s representing the gross amount being credited for this line item, excluding (exclusive) tax and discounts.
    int amount;
    # Description of the item being credited.
    string? description?;
    # The integer amount in %s representing the discount being credited for this line item.
    int discount_amount;
    # The amount of discount calculated per discount for this line item
    DiscountsResourceDiscountAmount[] discount_amounts;
    # Unique identifier for the object.
    string id;
    # ID of the invoice line item being credited
    string invoice_line_item?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The number of units of product being credited.
    int? quantity?;
    # The amount of tax calculated per tax rate for this line item
    CreditNoteTaxAmount[] tax_amounts;
    # The tax rates which apply to the line item.
    TaxRate[] tax_rates;
    # The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice.
    string 'type;
    # The cost of each unit of product being credited.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
};

# 
public type CardMandatePaymentMethodDetails record {
};

# 
public type IssuingCardholderIndividualDob record {
    # The day of birth, between 1 and 31.
    int? day?;
    # The month of birth, between 1 and 12.
    int? month?;
    # The four-digit year of birth.
    int? year?;
};

# A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
public type BitcoinTransactionList record {
    # Details about each object.
    BitcoinTransaction[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
public type Param8 record {
    string country;
};

# If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
public type Param7 record {
    string iban;
};

# If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
public type Param6 record {
    string bank?;
};

# 
public type Fee record {
    # Amount of the fee, in cents.
    int amount;
    # ID of the Connect application that earned the fee.
    string? application?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.
    string 'type;
};

# If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
public type Param5 record {
    string bank?;
};

# If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
public type Param4 record {
    string bank;
};

# If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
public type Param3 record {
    string bank?;
};

# If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
public type Param2 record {
    string tax_id;
};

# If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
public type Param1 record {
    string account_number?;
    string sort_code?;
};

public type PackageDimentionsSpecs record {
    decimal height;
    decimal length;
    decimal weight;
    decimal width;
};

# You can now model subscriptions more flexibly using the [Prices API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible to simplify your migration.
# 
# Plans define the base price, currency, and billing cycle for recurring purchases of products.
# [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.
# 
# For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public type Plan record {
    # Whether the plan can be used for new purchases.
    boolean active;
    # Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
    string? aggregate_usage?;
    # The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.
    int? amount?;
    # The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.
    string? amount_decimal?;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    string billing_scheme;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    string interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # A brief description of the plan, hidden from customers.
    string? nickname?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The product whose pricing this plan determines.
    string|Product|DeletedProduct? product?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    PlanTier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
    string? tiers_mode?;
    # Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
    TransformUsage? transform_usage?;
    # Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
    int? trial_period_days?;
    # Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
    string usage_type;
};

# A SetupAttempt describes one attempted confirmation of a SetupIntent,
# whether that confirmation was successful or unsuccessful. You can use
# SetupAttempts to inspect details of a specific attempt at setting up a
# payment method using a SetupIntent.
public type SetupAttempt record {
    # The value of [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation.
    string|Application? application?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The value of [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation.
    string|Customer|DeletedCustomer? customer?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The value of [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation.
    string|Account? on_behalf_of?;
    # ID of the payment method used with this SetupAttempt.
    string|PaymentMethod payment_method;
    # 
    SetupAttemptPaymentMethodDetails payment_method_details;
    # The error encountered during this attempt to confirm the SetupIntent, if any.
    ApiErrors? setup_error?;
    # ID of the SetupIntent that this attempt belongs to.
    string|SetupIntent setup_intent;
    # Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.
    string status;
    # The value of [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
    string usage;
};

# A portal configuration describes the functionality and behavior of a portal session.
public type BillingPortalConfiguration record {
    # Whether the configuration is active and can be used to create portal sessions.
    boolean active;
    # ID of the Connect Application that created the configuration.
    string? application?;
    # 
    PortalBusinessProfile business_profile;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
    string? default_return_url?;
    # 
    PortalFeatures features;
    # Unique identifier for the object.
    string id;
    # Whether the configuration is the default. If `true`, this configuration can be managed in the Dashboard and portal sessions will use this configuration unless it is overriden when creating the session.
    boolean is_default;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
};

# 
public type DeletedRecipient record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type InvoicesStatusTransitions record {
    # The time that the invoice draft was finalized.
    int? finalized_at?;
    # The time that the invoice was marked uncollectible.
    int? marked_uncollectible_at?;
    # The time that the invoice was paid.
    int? paid_at?;
    # The time that the invoice was voided.
    int? voided_at?;
};

public type CustomersCustomerBody record {
    # The customer's address.
    CustomerAdresss|string address?;
    # An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
    int balance?;
    # Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a dictionary containing a user's bank account details.
    CustomerBankAccountDetails|string bank_account?;
    # A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
    CustomerCardDetails|string card?;
    string coupon?;
    # ID of Alipay account to make the customer's new default for invoice payments.
    string default_alipay_account?;
    # ID of bank account to make the customer's new default for invoice payments.
    string default_bank_account?;
    # ID of card to make the customer's new default for invoice payments.
    string default_card?;
    # If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default_payment_method) parameter.
    # 
    # Provide the ID of a payment source already attached to this customer to make it this customer's default payment source.
    # 
    # If you want to add a new payment source and make it the default, see the [source](https://stripe.com/docs/api/customers/update#update_customer-source) property.
    string default_source?;
    # An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
    string description?;
    # Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
    string email?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
    string invoice_prefix?;
    # Default invoice settings for this customer.
    CustomerParam1 invoice_settings?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # The customer's full name or business name.
    string name?;
    # The sequence to be used on the customer's next invoice. Defaults to 1.
    int next_invoice_sequence?;
    # The customer's phone number.
    string phone?;
    # Customer's preferred languages, ordered by preference.
    string[] preferred_locales?;
    # The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
    string promotion_code?;
    # The customer's shipping information. Appears on invoices emailed to this customer.
    CustomerShippingAddress|string shipping?;
    string 'source?;
    # Tax details about the customer.
    TaxParam tax?;
    # The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
    string tax_exempt?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    string|int trial_end?;
};

# 
public type PortalSubscriptionUpdateProduct record {
    # The list of price IDs which, when subscribed to, a subscription can be updated.
    string[] prices;
    # The product ID.
    string product;
};

# 
public type AccountDeclineChargeOn record {
    # Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
    boolean avs_failure;
    # Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
    boolean cvc_failure;
};

# A representation of the constituent items of any given order. Can be used to
# represent [SKUs](https://stripe.com/docs/api#skus), shipping costs, or taxes owed on the order.
# 
# Related guide: [Orders](https://stripe.com/docs/orders/guide).
public type OrderItem record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Description of the line item, meant to be displayable to the user (e.g., `"Express shipping"`).
    string description;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
    string|Sku? parent?;
    # A positive integer representing the number of instances of `parent` that are included in this order item. Applicable/present only if `type` is `sku`.
    int? quantity?;
    # The type of line item. One of `sku`, `tax`, `shipping`, or `discount`.
    string 'type;
};

# 
public type LegalEntityCompanyVerification record {
    # 
    LegalEntityCompanyVerificationDocument document;
};

# Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
public type BillingDetailsInnerParams record {
    BillingDetailsAddress|string address?;
    string email?;
    string name?;
    string phone?;
};

# 
public type MandateSepaDebit record {
    # The unique reference of the mandate.
    string reference;
    # The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    string url;
};

# 
public type PaymentMethodFpx record {
    # The customer's bank, if provided. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
    string bank;
};

# Source mandate notifications should be created when a notification related to
# a source mandate must be sent to the payer. They will trigger a webhook or
# deliver an email to the customer.
public type SourceMandateNotification record {
    # 
    SourceMandateNotificationAcssDebitData acss_debit?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`.
    int? amount?;
    # 
    SourceMandateNotificationBacsDebitData bacs_debit?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`.
    string reason;
    # 
    SourceMandateNotificationSepaDebitData sepa_debit?;
    # `Source` objects allow you to accept a variety of payment methods. They
    # represent a customer's payment instrument, and can be used with the Stripe API
    # just like a `Card` object: once chargeable, they can be charged, or can be
    # attached to customers.
    # 
    # Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
    Source 'source;
    # The status of the mandate notification. Valid statuses are `pending` or `submitted`.
    string status;
    # The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`.
    string 'type;
};

# 
public type ReserveTransaction record {
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# Issue a credit note to adjust an invoice's amount after the invoice is finalized.
# 
# Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).
public type CreditNote record {
    # The integer amount in %s representing the total amount of the credit note, including tax.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the customer.
    string|Customer|DeletedCustomer customer;
    # Customer balance transaction related to this credit note.
    string|CustomerBalanceTransaction? customer_balance_transaction?;
    # The integer amount in %s representing the total amount of discount that was credited.
    int discount_amount;
    # The aggregate amounts calculated per discount for all line items.
    DiscountsResourceDiscountAmount[] discount_amounts;
    # Unique identifier for the object.
    string id;
    # ID of the invoice.
    string|Invoice invoice;
    # Line items that make up the credit note
    CreditNoteLinesList lines;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Customer-facing text that appears on the credit note PDF.
    string? memo?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.
    string number;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Amount that was credited outside of Stripe.
    int? out_of_band_amount?;
    # The link to download the PDF of the credit note.
    string pdf;
    # Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
    string? reason?;
    # Refund related to this credit note.
    string|Refund? refund?;
    # Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
    string status;
    # The integer amount in %s representing the amount of the credit note, excluding tax and invoice level discounts.
    int subtotal;
    # The aggregate amounts calculated per tax rate for all line items.
    CreditNoteTaxAmount[] tax_amounts;
    # The integer amount in %s representing the total amount of the credit note, including tax and all discount.
    int total;
    # Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid.
    string 'type;
    # The time that the credit note was voided.
    int? voided_at?;
};

# A Location represents a grouping of readers.
# 
# Related guide: [Fleet Management](https://stripe.com/docs/terminal/creating-locations).
public type TerminalLocation record {
    # 
    Address address;
    # The display name of the location.
    string display_name;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# Some payment methods have no required amount that a customer must send.
# Customers can be instructed to send any amount, and it can be made up of
# multiple transactions. As such, sources can have multiple associated
# transactions.
public type SourceTransaction record {
    # 
    SourceTransactionAchCreditTransferData ach_credit_transfer?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.
    int amount;
    # 
    SourceTransactionChfCreditTransferData chf_credit_transfer?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    SourceTransactionGbpCreditTransferData gbp_credit_transfer?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    SourceTransactionPaperCheckData paper_check?;
    # 
    SourceTransactionSepaCreditTransferData sepa_credit_transfer?;
    # The ID of the source this transaction is attached to.
    string 'source;
    # The status of the transaction, one of `succeeded`, `pending`, or `failed`.
    string status;
    # The type of source this transaction is attached to.
    string 'type;
};

# 
public type PaymentMethodWechatPay record {
};

# 
public type PaymentIntentNextActionDisplayOxxoDetails record {
    # The timestamp after which the OXXO voucher expires.
    int? expires_after?;
    # The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO voucher.
    string? hosted_voucher_url?;
    # OXXO reference number.
    string? number?;
};

# 
public type PaymentMethodDetailsCardPresentReceipt record {
    # The type of account being debited or credited
    string account_type?;
    # EMV tag 9F26, cryptogram generated by the integrated circuit chip.
    string? application_cryptogram?;
    # Mnenomic of the Application Identifier.
    string? application_preferred_name?;
    # Identifier for this transaction.
    string? authorization_code?;
    # EMV tag 8A. A code returned by the card issuer.
    string? authorization_response_code?;
    # How the cardholder verified ownership of the card.
    string? cardholder_verification_method?;
    # EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
    string? dedicated_file_name?;
    # The outcome of a series of EMV functions performed by the card reader.
    string? terminal_verification_results?;
    # An indication of various EMV functions performed during the transaction.
    string? transaction_status_information?;
};

# 
public type DeletedBitcoinReceiver record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# Order objects are created to handle end customers' purchases of previously
# defined [products](https://stripe.com/docs/api#products). You can create, retrieve, and pay individual orders, as well
# as list all orders. Orders are identified by a unique, random ID.
# 
# Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public type Order record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
    int amount;
    # The total amount that was returned to the customer.
    int? amount_returned?;
    # ID of the Connect Application that created the order.
    string? application?;
    # A fee in cents that will be applied to the order and transferred to the application owner’s Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees documentation.
    int? application_fee?;
    # The ID of the payment used to pay for the order. Present if the order status is `paid`, `fulfilled`, or `refunded`.
    string|Charge? charge?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The customer used for the order.
    string|Customer|DeletedCustomer? customer?;
    # The email address of the customer placing the order.
    string? email?;
    # External coupon code to load for this order.
    string external_coupon_code?;
    # Unique identifier for the object.
    string id;
    # List of items constituting the order. An order can have up to 25 items.
    OrderItem[] items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # A list of returns that have taken place for this order.
    OrdersResourceOrderReturnList? 'returns?;
    # The shipping method that is currently selected for this order, if any. If present, it is equal to one of the `id`s of shipping methods in the `shipping_methods` array. At order creation time, if there are multiple shipping methods, Stripe will automatically selected the first method.
    string? selected_shipping_method?;
    # The shipping address for the order. Present if the order is for goods to be shipped.
    Shipping? shipping?;
    # A list of supported shipping methods for this order. The desired shipping method can be specified either by updating the order, or when paying it.
    ShippingMethod[]? shipping_methods?;
    # Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More details in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).
    string status;
    # The timestamps at which the order status was updated.
    StatusTransitions? status_transitions?;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int? updated?;
    # The user's order ID if it is different from the Stripe order ID.
    string upstream_id?;
};

public type BancontactInvoicePaymentMethodOptionsParam record {
    string preferred_language?;
};

# A list of items the customer is being quoted for.
public type QuotesResourceListLineItems record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
public type RecurringPriceData record {
    string currency;
    string product;
    RecurringAdhoc recurring;
    string tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# 
public type PaymentMethodDetailsCardPresent record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? brand?;
    # The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
    string? cardholder_name?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Authorization response cryptogram.
    string? emv_auth_data?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
    string? generated_card?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # How card details were read in this transaction.
    string? read_method?;
    # A collection of fields required to be displayed on receipts. Only required for EMV transactions.
    PaymentMethodDetailsCardPresentReceipt? receipt?;
};

# Automatic tax settings for this subscription.
public type AutomaticTaxConfig1 record {
    boolean enabled;
};

# 
public type Period record {
    # The end date of this usage period. All usage up to and including this point in time is included.
    int? end?;
    # The start date of this usage period. All usage after this point in time is included.
    int? 'start?;
};

# A PaymentIntent guides you through the process of collecting a payment from your customer.
# We recommend that you create exactly one PaymentIntent for each order or
# customer session in your system. You can reference the PaymentIntent later to
# see the history of payment attempts for a particular session.
# 
# A PaymentIntent transitions through
# [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses)
# throughout its lifetime as it interfaces with Stripe.js to perform
# authentication flows and ultimately creates at most one successful charge.
# 
# Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
public type PaymentIntent record {
    # Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount;
    # Amount that can be captured from this PaymentIntent.
    int amount_capturable?;
    # Amount that was collected by this PaymentIntent.
    int amount_received?;
    # ID of the Connect application that created the PaymentIntent.
    string|Application? application?;
    # The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
    int? application_fee_amount?;
    # Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
    int? canceled_at?;
    # Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
    string? cancellation_reason?;
    # Controls when the funds will be captured from the customer's account.
    string capture_method;
    # Charges that were created by this PaymentIntent, if any.
    PaymentFlowsPaymentIntentResourceChargeList charges?;
    # The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key. 
    # 
    # The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    # 
    # Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
    string? client_secret?;
    string confirmation_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the Customer this PaymentIntent belongs to, if one exists.
    # 
    # Payment methods attached to other Customers cannot be used with this PaymentIntent.
    # 
    # If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
    string|Customer|DeletedCustomer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    string id;
    # ID of the invoice that created this PaymentIntent, if it exists.
    string|Invoice? invoice?;
    # The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
    ApiErrors? last_payment_error?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
    record {} metadata?;
    # If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
    PaymentIntentNextAction? next_action?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    string|Account? on_behalf_of?;
    # ID of the payment method used in this PaymentIntent.
    string|PaymentMethod? payment_method?;
    # Payment-method-specific configuration for this PaymentIntent.
    PaymentIntentPaymentMethodOptions? payment_method_options?;
    # The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
    string[] payment_method_types;
    # Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
    string? receipt_email?;
    # ID of the review associated with this PaymentIntent, if any.
    string|Review? review?;
    # Indicates that you intend to make future payments with this PaymentIntent's payment method.
    # 
    # Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
    # 
    # When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
    string? setup_future_usage?;
    # Shipping information for this PaymentIntent.
    Shipping? shipping?;
    # For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
    string? statement_descriptor?;
    # Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
    string? statement_descriptor_suffix?;
    # Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
    string status;
    # The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    TransferData? transfer_data?;
    # A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    string? transfer_group?;
};

# A VerificationReport is the result of an attempt to collect and verify data from a user.
# The collection of verification checks performed is determined from the `type` and `options`
# parameters used. You can find the result of each verification check performed in the
# appropriate sub-resource: `document`, `id_number`, `selfie`.
# 
# Each VerificationReport contains a copy of any data collected by the user as well as
# reference IDs which can be used to access collected images through the [FileUpload](https://stripe.com/docs/api/files)
# API. To configure and create VerificationReports, use the
# [VerificationSession](https://stripe.com/docs/api/identity/verification_sessions) API.
# 
# Related guides: [Accessing verification results](https://stripe.com/docs/identity/verification-sessions#results).
public type IdentityVerificationReport record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Result from a document check
    GelatoDocumentReport document?;
    # Unique identifier for the object.
    string id;
    # Result from an id_number check
    GelatoIdNumberReport id_number?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    GelatoVerificationReportOptions options;
    # Result from a selfie check
    GelatoSelfieReport selfie?;
    # Type of report.
    string 'type;
    # ID of the VerificationSession that created this report.
    string? verification_session?;
};

# 
public type MandateAuBecsDebit record {
    # The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    string url;
};

# 
public type PaymentMethodBoleto record {
    # Uniquely identifies the customer tax id (CNPJ or CPF)
    string tax_id;
};

# 
public type PaymentMethodDetailsEps record {
    # The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
    string? bank?;
    # Owner's verified full name. Values are verified or provided by EPS directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # EPS rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

# The Report Run object represents an instance of a report type generated with
# specific run parameters. Once the object is created, Stripe begins processing the report.
# When the report has finished running, it will give you a reference to a file
# where you can retrieve your results. For an overview, see
# [API Access to Reports](https://stripe.com/docs/reporting/statements/api).
# 
# Note that certain report types can only be run based on your live-mode data (not test-mode
# data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public type ReportingReportRun record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # If something should go wrong during the run, a message about the failure (populated when
    #  `status=failed`).
    string? 'error?;
    # Unique identifier for the object.
    string id;
    # `true` if the report is run on live mode data and `false` if it is run on test mode data.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    FinancialReportingFinanceReportRunRunParameters parameters;
    # The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as `"balance.summary.1"`.
    string report_type;
    # The file object representing the result of the report run (populated when
    #  `status=succeeded`).
    File? result?;
    # Status of this report run. This will be `pending` when the run is initially created.
    #  When the run finishes, this will be set to `succeeded` and the `result` field will be populated.
    #  Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated.
    string status;
    # Timestamp at which this run successfully finished (populated when
    #  `status=succeeded`). Measured in seconds since the Unix epoch.
    int? succeeded_at?;
};

# Sometimes you want to add a charge or credit to a customer, but actually
# charge or credit the customer's card only at the end of a regular billing
# cycle. This is useful for combining several charges (to minimize
# per-transaction fees), or for having Stripe tabulate your usage-based billing
# totals.
# 
# Related guide: [Subscription Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
public type Invoiceitem record {
    # Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The ID of the customer who will be billed when this invoice item is billed.
    string|Customer|DeletedCustomer customer;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int date;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # If true, discounts will apply to this invoice item. Always false for prorations.
    boolean discountable;
    # The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount)[]? discounts?;
    # Unique identifier for the object.
    string id;
    # The ID of the invoice this invoice item belongs to.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    InvoiceLineItemPeriod period;
    # The price of the invoice item.
    Price? price?;
    # Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
    boolean proration;
    # Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
    int quantity;
    # The subscription that this invoice item has been created for, if any.
    string|Subscription? subscription?;
    # The subscription item that this invoice item has been created for, if any.
    string subscription_item?;
    # The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
    TaxRate[]? tax_rates?;
    # Unit amount (in the `currency` specified) of the invoice item.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
};

public type PaymentMethodOptions1 record {
    BancontactInvoicePaymentMethodOptionsParam|string bancontact?;
    CardInvoicePaymentMethodOptionsParam|string card?;
};

# Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value,
# which denotes a debit or credit that's automatically applied to their next invoice upon finalization.
# You may modify the value directly by using the [update customer API](https://stripe.com/docs/api/customers/update),
# or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.
# 
# Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn more.
public type CustomerBalanceTransaction record {
    # The amount of the transaction. A negative value is a credit for the customer's balance, and a positive value is a debit to the customer's `balance`.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the credit note (if any) related to the transaction.
    string|CreditNote? credit_note?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The ID of the customer the transaction belongs to.
    string|Customer customer;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The customer's `balance` after the transaction was applied. A negative value decreases the amount due on the customer's next invoice. A positive value increases the amount due on the customer's next invoice.
    int ending_balance;
    # Unique identifier for the object.
    string id;
    # The ID of the invoice (if any) related to the transaction.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or `unapplied_from_invoice`. See the [Customer Balance page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction types.
    string 'type;
};

public type AutomaticTaxConfig3 record {
    boolean enabled;
};

# 
public type DeletedCoupon record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# Default settings for automatic tax computation
public type AutomaticTaxConfig2 record {
    # Enabled automatic tax calculation which will automatically compute tax rates on all invoices generated by the subscription
    boolean enabled;
};

# 
public type ApplicationFee record {
    # ID of the Stripe account this fee was taken from.
    string|Account account;
    # Amount earned, in %s.
    int amount;
    # Amount in %s refunded (can be less than the amount attribute on the fee if a partial refund was issued)
    int amount_refunded;
    # ID of the Connect application that earned the fee.
    string|Application application;
    # Balance transaction that describes the impact of this collected application fee on your account balance (not including refunds).
    string|BalanceTransaction? balance_transaction?;
    # ID of the charge that the application fee was taken from.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # ID of the corresponding charge on the platform account, if this fee was the result of a charge using the `destination` parameter.
    string|Charge? originating_transaction?;
    # Whether the fee has been fully refunded. If the fee is only partially refunded, this attribute will still be false.
    boolean refunded;
    # A list of refunds that have been applied to the fee.
    FeeRefundList refunds;
};

# 
public type PaymentIntentNextActionWechatPayDisplayQrCode record {
    # The data being used to generate QR code
    string data;
    # The base64 image data for a pre-generated QR code
    string image_data_url;
};

# PaymentMethod objects represent your customer's payment instruments.
# They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to
# Customer objects to store instrument details for future payments.
# 
# Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
public type PaymentMethod record {
    # 
    PaymentMethodAcssDebit acss_debit?;
    # 
    PaymentMethodAfterpayClearpay afterpay_clearpay?;
    # 
    PaymentFlowsPrivatePaymentMethodsAlipay alipay?;
    # 
    PaymentMethodAuBecsDebit au_becs_debit?;
    # 
    PaymentMethodBacsDebit bacs_debit?;
    # 
    PaymentMethodBancontact bancontact?;
    # 
    BillingDetails billing_details;
    # 
    PaymentMethodBoleto boleto?;
    # 
    PaymentMethodCard card?;
    # 
    PaymentMethodCardPresent card_present?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
    string|Customer? customer?;
    # 
    PaymentMethodEps eps?;
    # 
    PaymentMethodFpx fpx?;
    # 
    PaymentMethodGiropay giropay?;
    # 
    PaymentMethodGrabpay grabpay?;
    # Unique identifier for the object.
    string id;
    # 
    PaymentMethodIdeal ideal?;
    # 
    PaymentMethodInteracPresent interac_present?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    PaymentMethodOxxo oxxo?;
    # 
    PaymentMethodP24 p24?;
    # 
    PaymentMethodSepaDebit sepa_debit?;
    # 
    PaymentMethodSofort sofort?;
    # The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    string 'type;
    # 
    PaymentMethodWechatPay wechat_pay?;
};

# 
public type LegalEntityJapanAddress record {
    # City/Ward.
    string? city?;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Block/Building number.
    string? line1?;
    # Building details.
    string? line2?;
    # ZIP or postal code.
    string? postal_code?;
    # Prefecture.
    string? state?;
    # Town/cho-me.
    string? town?;
};

public type SubscriptionsSubscriptionExposedIdBody record {
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
    AddInvoiceItemEntry1[] add_invoice_items?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
    decimal application_fee_percent?;
    # Automatic tax settings for this subscription.
    AutomaticTaxConfig1 automatic_tax?;
    # Either `now` or `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    string billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
    record {int amount_gte?; boolean reset_billing_cycle_anchor?;}|string billing_thresholds?;
    # A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
    int|string cancel_at?;
    # Boolean indicating whether this subscription should cancel at the end of the current period.
    boolean cancel_at_period_end?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    string collection_method?;
    # The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
    string coupon?;
    # Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription. Pass an empty string to remove previously-defined tax rates.
    string[]|string default_tax_rates?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # A list of up to 20 subscription items, each with an attached price.
    SubscriptionItemUpdateParams[] items?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {}|string metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # If specified, payment collection for this subscription will be paused.
    record {string behavior; int resumes_at?;}|string pause_collection?;
    # Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.
    # 
    # Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    string payment_behavior?;
    # Payment settings to pass to invoices created by the subscription.
    PaymentSettings2 payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    record {string interval; int interval_count?;}|string pending_invoice_item_interval?;
    # The promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
    string promotion_code?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.
    # 
    # Prorations can be disabled by passing `none`.
    string proration_behavior?;
    # If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply exactly the same proration that was previewed with [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint. It can also be used to implement custom proration logic, such as prorating by day instead of by second, by providing the time that you wish to use for proration calculations.
    int proration_date?;
    # If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges. This will be unset if you POST an empty value.
    record {decimal amount_percent?; string destination;}|string transfer_data?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    string|int trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean trial_from_plan?;
};

# 
public type RadarReviewResourceLocation record {
    # The city where the payment originated.
    string? city?;
    # Two-letter ISO code representing the country where the payment originated.
    string? country?;
    # The geographic latitude where the payment originated.
    decimal? latitude?;
    # The geographic longitude where the payment originated.
    decimal? longitude?;
    # The state/county/province/region where the payment originated.
    string? region?;
};

# 
public type PaymentMethodDetails record {
    # 
    PaymentMethodDetailsAchCreditTransfer ach_credit_transfer?;
    # 
    PaymentMethodDetailsAchDebit ach_debit?;
    # 
    PaymentMethodDetailsAcssDebit acss_debit?;
    # 
    PaymentMethodDetailsAfterpayClearpay afterpay_clearpay?;
    # 
    PaymentFlowsPrivatePaymentMethodsAlipayDetails alipay?;
    # 
    PaymentMethodDetailsAuBecsDebit au_becs_debit?;
    # 
    PaymentMethodDetailsBacsDebit bacs_debit?;
    # 
    PaymentMethodDetailsBancontact bancontact?;
    # 
    PaymentMethodDetailsBoleto boleto?;
    # 
    PaymentMethodDetailsCard card?;
    # 
    PaymentMethodDetailsCardPresent card_present?;
    # 
    PaymentMethodDetailsEps eps?;
    # 
    PaymentMethodDetailsFpx fpx?;
    # 
    PaymentMethodDetailsGiropay giropay?;
    # 
    PaymentMethodDetailsGrabpay grabpay?;
    # 
    PaymentMethodDetailsIdeal ideal?;
    # 
    PaymentMethodDetailsInteracPresent interac_present?;
    # 
    PaymentMethodDetailsKlarna klarna?;
    # 
    PaymentMethodDetailsMultibanco multibanco?;
    # 
    PaymentMethodDetailsOxxo oxxo?;
    # 
    PaymentMethodDetailsP24 p24?;
    # 
    PaymentMethodDetailsSepaDebit sepa_debit?;
    # 
    PaymentMethodDetailsSofort sofort?;
    # 
    PaymentMethodDetailsStripeAccount stripe_account?;
    # The type of transaction-specific details of the payment method used in the payment, one of `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `stripe_account`, or `wechat`.
    # An additional hash is included on `payment_method_details` with a name matching this value.
    # It contains information specific to the payment method.
    string 'type;
    # 
    PaymentMethodDetailsWechat wechat?;
    # 
    PaymentMethodDetailsWechatPay wechat_pay?;
};

# 
public type AccountController record {
    # `true` if the Connect application retrieving the resource controls the account and can therefore exercise [platform controls](https://stripe.com/docs/connect/platform-controls-for-standard-accounts). Otherwise, this field is null.
    boolean is_controller?;
    # The controller type. Can be `application`, if a Connect application controls the account, or `account`, if the account controls itself.
    string 'type?;
};

# 
public type GelatoIdNumberReportError record {
    # A short machine-readable string giving the reason for the verification failure.
    string? code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# 
public type QuotesResourceAutomaticTax record {
    # Automatically calculate taxes
    boolean enabled;
    # The status of the most recent automated tax calculation for this quote.
    string? status?;
};

# Usage records allow you to report customer usage and metrics to Stripe for
# metered billing of subscription prices.
# 
# Related guide: [Metered Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).
public type UsageRecord record {
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The usage quantity for the specified date.
    int quantity;
    # The ID of the subscription item this usage record contains data for.
    string subscription_item;
    # The timestamp when this usage occurred.
    int timestamp;
};

# A list of refunds that have been applied to the fee.
public type FeeRefundList record {
    # Details about each object.
    FeeRefund[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# 
public type InvoicePaymentMethodOptionsBancontact record {
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    string preferred_language;
};

# 
public type PaymentPagesCheckoutSessionCustomerDetails record {
    # The customer’s email at time of checkout.
    string? email?;
    # The customer’s tax exempt status at time of checkout.
    string? tax_exempt?;
    # The customer’s tax IDs at time of checkout.
    PaymentPagesCheckoutSessionTaxId[]? tax_ids?;
};

# `Source` objects allow you to accept a variety of payment methods. They
# represent a customer's payment instrument, and can be used with the Stripe API
# just like a `Card` object: once chargeable, they can be charged, or can be
# attached to customers.
# 
# Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
public type Source record {
    SourceTypeAchCreditTransfer ach_credit_transfer?;
    SourceTypeAchDebit ach_debit?;
    SourceTypeAcssDebit acss_debit?;
    SourceTypeAlipay alipay?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
    int? amount?;
    SourceTypeAuBecsDebit au_becs_debit?;
    SourceTypeBancontact bancontact?;
    SourceTypeCard card?;
    SourceTypeCardPresent card_present?;
    # The client secret of the source. Used for client-side retrieval using a publishable key.
    string client_secret;
    # 
    SourceCodeVerificationFlow code_verification?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
    string? currency?;
    # The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
    string customer?;
    SourceTypeEps eps?;
    # The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.
    string flow;
    SourceTypeGiropay giropay?;
    # Unique identifier for the object.
    string id;
    SourceTypeIdeal ideal?;
    SourceTypeKlarna klarna?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    SourceTypeMultibanco multibanco?;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # Information about the owner of the payment instrument that may be used or required by particular source types.
    SourceOwner? owner?;
    SourceTypeP24 p24?;
    # 
    SourceReceiverFlow receiver?;
    # 
    SourceRedirectFlow redirect?;
    SourceTypeSepaDebit sepa_debit?;
    SourceTypeSofort sofort?;
    # 
    SourceOrder source_order?;
    # Extra information about a source. This will appear on your customer's statement every time you charge the source.
    string? statement_descriptor?;
    # The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
    string status;
    SourceTypeThreeDSecure three_d_secure?;
    # The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.
    string 'type;
    # Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
    string? usage?;
    SourceTypeWechat wechat?;
};

# 
public type SubscriptionsResourcePaymentMethodOptions record {
    # This sub-hash contains details about the Bancontact payment method options to pass to invoices created by the subscription.
    InvoicePaymentMethodOptionsBancontact? bancontact?;
    # This sub-hash contains details about the Card payment method options to pass to invoices created by the subscription.
    InvoicePaymentMethodOptionsCard? card?;
};

# 
public type InvoiceSettingCustomerSetting record {
    # Default custom fields to be displayed on invoices for this customer.
    InvoiceSettingCustomField[]? custom_fields?;
    # ID of a payment method that's attached to the customer, to be used as the customer's default payment method for subscriptions and invoices.
    string|PaymentMethod? default_payment_method?;
    # Default footer to be displayed on invoices for this customer.
    string? footer?;
};

# 
public type PaymentIntentNextAction record {
    # 
    PaymentIntentNextActionAlipayHandleRedirect alipay_handle_redirect?;
    # 
    PaymentIntentNextActionBoleto boleto_display_details?;
    # 
    PaymentIntentNextActionDisplayOxxoDetails oxxo_display_details?;
    # 
    PaymentIntentNextActionRedirectToUrl redirect_to_url?;
    # Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, or `oxxo_display_details`.
    string 'type;
    # When confirming a PaymentIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
    record {} use_stripe_sdk?;
    # 
    PaymentIntentNextActionVerifyWithMicrodeposits verify_with_microdeposits?;
    # 
    PaymentIntentNextActionWechatPayDisplayQrCode wechat_pay_display_qr_code?;
    # 
    PaymentIntentNextActionWechatPayRedirectToAndroidApp wechat_pay_redirect_to_android_app?;
    # 
    PaymentIntentNextActionWechatPayRedirectToIosApp wechat_pay_redirect_to_ios_app?;
};

public type SubscriptionTrialEnd string|int;

# 
public type MandateSingleUse record {
    # On a single use mandate, the amount of the payment.
    int amount;
    # On a single use mandate, the currency of the payment.
    string currency;
};

# 
public type PaymentIntentNextActionWechatPayRedirectToIosApp record {
    # An universal link that redirect to Wechat Pay APP
    string native_url;
};

public type SourceTypeAchDebit record {
    string? bank_name?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? routing_number?;
    string? 'type?;
};

public type SubscriptionBillingCycleAnchor1 string|int;

# [Tax codes](https://stripe.com/docs/tax/tax-codes) classify goods and services for tax purposes.
public type TaxCode record {
    # A detailed description of which types of products the tax code represents.
    string description;
    # Unique identifier for the object.
    string id;
    # A short name for the tax code.
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# A `Payout` object is created when you receive funds from Stripe, or when you
# initiate a payout to either a bank account or debit card of a [connected
# Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
# as well as list all payouts. Payouts are made on [varying
# schedules](/docs/connect/manage-payout-schedule), depending on your country and
# industry.
# 
# Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).
public type Payout record {
    # Amount (in %s) to be transferred to your bank account or debit card.
    int amount;
    # Date the payout is expected to arrive in the bank. This factors in delays like weekends or bank holidays.
    int arrival_date;
    # Returns `true` if the payout was created by an [automated payout schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested manually](https://stripe.com/docs/payouts#manual-payouts).
    boolean automatic;
    # ID of the balance transaction that describes the impact of this payout on your account balance.
    string|BalanceTransaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # ID of the bank account or card the payout was sent to.
    string|BankAccount|Card|DeletedBankAccount|DeletedCard? destination?;
    # If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.
    string|BalanceTransaction? failure_balance_transaction?;
    # Error code explaining reason for payout failure if available. See [Types of payout failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.
    string? failure_code?;
    # Message to user further explaining reason for payout failure if available.
    string? failure_message?;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {} metadata?;
    # The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more information.)
    string method;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # If the payout reverses another, this is the ID of the original payout.
    string|Payout? original_payout?;
    # If the payout was reversed, this is the ID of the payout that reverses this payout.
    string|Payout? reversed_by?;
    # The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.
    string source_type;
    # Extra information about a payout to be displayed on the user's bank statement.
    string? statement_descriptor?;
    # Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The status then changes to `paid` if the transaction goes through, or to `failed` or `canceled` (within 5 business days). Some failed payouts may initially show as `paid` but then change to `failed`.
    string status;
    # Can be `bank_account` or `card`.
    string 'type;
};

# 
public type IssuingAuthorizationRequest record {
    # The `pending_request.amount` at the time of the request, presented in your card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). Stripe held this amount from your account to fund the authorization if the request was approved.
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    IssuingAuthorizationAmountDetails? amount_details?;
    # Whether this request was approved.
    boolean approved;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The `pending_request.merchant_amount` at the time of the request, presented in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The currency that was collected by the merchant and presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string merchant_currency;
    # The reason for the approval or decline.
    string reason;
};

# 
public type SourceTransactionGbpCreditTransferData record {
    # Bank account fingerprint associated with the Stripe owned bank account receiving the transfer.
    string fingerprint?;
    # The credit transfer rails the sender used to push this transfer. The possible rails are: Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is supported.
    string funding_method?;
    # Last 4 digits of sender account number associated with the transfer.
    string last4?;
    # Sender entered arbitrary information about the transfer.
    string reference?;
    # Sender account number associated with the transfer.
    string sender_account_number?;
    # Sender name associated with the transfer.
    string sender_name?;
    # Sender sort code associated with the transfer.
    string sender_sort_code?;
};

# 
public type ApplePayDomain record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    string domain_name;
    # Unique identifier for the object.
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type VerificationSessionRedaction record {
    # Indicates whether this object and its related objects have been redacted or not.
    string status;
};

public type CardDetailsParams record {
    string cvc?;
    int exp_month;
    int exp_year;
    string number;
};

# 
public type GelatoSelfieReportError record {
    # A short machine-readable string giving the reason for the verification failure.
    string? code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# Charges that were created by this PaymentIntent, if any.
public type PaymentFlowsPaymentIntentResourceChargeList record {
    # This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
    Charge[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    string 'object;
    # The URL where this list can be accessed.
    string url;
};

# Result from a selfie check
public type GelatoSelfieReport record {
    # ID of the [File](https://stripe.com/docs/api/files) holding the image of the identity document used in this check.
    string? document?;
    # Details on the verification error. Present when status is `unverified`.
    GelatoSelfieReportError? 'error?;
    # ID of the [File](https://stripe.com/docs/api/files) holding the image of the selfie used in this check.
    string? selfie?;
    # Status of this `selfie` check.
    string status;
};

# 
public type BalanceAmount record {
    # Balance amount.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    BalanceAmountBySourceType source_types?;
};

# 
public type InvoiceLineItemPeriod record {
    # End of the line item's billing period
    int end;
    # Start of the line item's billing period
    int 'start;
};

# 
public type LineItem record {
    # The amount, in %s.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The amount of discount calculated per discount for this line item.
    DiscountsResourceDiscountAmount[]? discount_amounts?;
    # If true, discounts will apply to this line item. Always false for prorations.
    boolean discountable;
    # The discounts applied to the invoice line item. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount)[]? discounts?;
    # Unique identifier for the object.
    string id;
    # The ID of the [invoice item](https://stripe.com/docs/api/invoiceitems) associated with this line item if any.
    string invoice_item?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription` this will reflect the metadata of the subscription that caused the line item to be created.
    record {} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # 
    InvoiceLineItemPeriod period;
    # The price of the line item.
    Price? price?;
    # Whether this is a proration.
    boolean proration;
    # The quantity of the subscription, if the line item is a subscription or a proration.
    int? quantity?;
    # The subscription that the invoice item pertains to, if any.
    string? subscription?;
    # The subscription item that generated this invoice item. Left empty if the line item is not an explicit result of a subscription.
    string subscription_item?;
    # The amount of tax calculated per tax rate for this line item
    InvoiceTaxAmount[] tax_amounts?;
    # The tax rates which apply to the line item.
    TaxRate[] tax_rates?;
    # A string identifying the type of the source of this line item, either an `invoiceitem` or a `subscription`.
    string 'type;
};

# 
public type NotificationEventData record {
    # Object containing the API resource relevant to the event. For example, an `invoice.created` event will have a full [invoice object](https://stripe.com/docs/api#invoice_object) as the value of the object key.
    record {} 'object;
    # Object containing the names of the attributes that have changed, and their previous values (sent along only with *.updated events).
    record {} previous_attributes?;
};

# A return represents the full or partial return of a number of [order items](https://stripe.com/docs/api#order_items).
# Returns always belong to an order, and may optionally contain a refund.
# 
# Related guide: [Handling Returns](https://stripe.com/docs/orders/guide#handling-returns).
public type OrderReturn record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the returned line item.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    string id;
    # The items included in this order return.
    OrderItem[] items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
    # The order that this return includes items from.
    string|Order? 'order?;
    # The ID of the refund issued for this return.
    string|Refund? refund?;
};

# 
public type DeletedRadarValueListItem record {
    # Always true for a deleted object
    boolean deleted;
    # Unique identifier for the object.
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    string 'object;
};

# 
public type IssuingCardShipping record {
    # 
    Address address;
    # The delivery company that shipped a card.
    string? carrier?;
    # A unix timestamp representing a best estimate of when the card will be delivered.
    int? eta?;
    # Recipient name.
    string name;
    # Shipment service, such as `standard` or `express`.
    string 'service;
    # The delivery status of the card.
    string? status?;
    # A tracking number for a card shipment.
    string? tracking_number?;
    # A link to the shipping carrier's site where you can view detailed information about a card shipment.
    string? tracking_url?;
    # Packaging options.
    string 'type;
};

# 
public type PaymentMethodDetailsFpx record {
    # The customer's bank. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
    string bank;
    # Unique transaction id generated by FPX for every request from the merchant
    string? transaction_id?;
};

# 
public type PlanTier record {
    # Price for the entire tier.
    int? flat_amount?;
    # Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
    string? flat_amount_decimal?;
    # Per unit price for units relevant to the tier.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
    # Up to and including to this quantity will be contained in the tier.
    int? up_to?;
};

public type PricesPriceBody record {
    # Whether the price can be used for new purchases. Defaults to `true`.
    boolean active?;
    # Specifies which fields in the response should be expanded.
    string[] expand?;
    # A lookup key used to retrieve prices dynamically from a static string.
    string lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    AdditionalProperties|string metadata?;
    # A brief description of the price, hidden from customers.
    string nickname?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    string tax_behavior?;
    # If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
    boolean transfer_lookup_key?;
};

public type AddInvoiceItemEntry1 record {
    string price?;
    OneTimePriceData price_data?;
    int quantity?;
    string[]|string tax_rates?;
};

# 
public type IssuingAuthorizationAmountDetails record {
    # The fee charged by the ATM for the cash withdrawal.
    int? atm_fee?;
};

# 
public type MandatePaymentMethodDetails record {
    # 
    MandateAcssDebit acss_debit?;
    # 
    MandateAuBecsDebit au_becs_debit?;
    # 
    MandateBacsDebit bacs_debit?;
    # 
    CardMandatePaymentMethodDetails card?;
    # 
    MandateSepaDebit sepa_debit?;
    # The type of the payment method associated with this mandate. An additional hash is included on `payment_method_details` with a name matching this value. It contains mandate information specific to the payment method.
    string 'type;
};

# 
public type PaymentMethodOptionsBoleto record {
    # The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto voucher will expire on Wednesday at 23:59 America/Sao_Paulo time.
    int expires_after_days;
};

public type DiscountsDataParam1 record {
    string coupon?;
    string discount?;
};

public type SourceTypeGiropay record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? statement_descriptor?;
};

# Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
public type TransformUsageParam record {
    int divide_by;
    string round;
};
