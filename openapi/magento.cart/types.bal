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

public type CheckoutAgreementsDataAgreementInterfaceArr CheckoutAgreementsDataAgreementInterface[];

public type TemandoShippingDataCollectionPointQuoteCollectionPointInterfaceArr TemandoShippingDataCollectionPointQuoteCollectionPointInterface[];

public type QuoteDataShippingMethodInterfaceArr QuoteDataShippingMethodInterface[];

public type QuoteDataCartItemInterfaceArr QuoteDataCartItemInterface[];

public type QuoteDataPaymentMethodInterfaceArr QuoteDataPaymentMethodInterface[];

# Interface BundleOptionInterface
public type BundleDataBundleOptionInterface record {
    # Bundle option id.
    int? option_id;
    # Bundle option quantity.
    int? option_qty;
    # Bundle option selection ids.
    int[]? option_selections;
    # ExtensionInterface class for @see \Magento\Bundle\Api\Data\BundleOptionInterface
    BundleDataBundleOptionExtensionInterface? extension_attributes?;
};

public type MineSelectedpaymentmethodBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? method;
};

public type MineShippinginformationBody record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface? addressInformation;
};

public type MineEstimateshippingmethodsBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsItemInterface
public type QuoteDataTotalsItemExtensionInterface record {
    # Extension attribute for quote item totals model.
    NegotiableQuoteDataNegotiableQuoteItemTotalsInterface? negotiable_quote_item_totals?;
};

public type MinePaymentinformationBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface? billingAddress?;
};

public type MineSetpaymentinformationBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface? billingAddress?;
};

# ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemInterface
public type NegotiableQuoteDataNegotiableQuoteItemExtensionInterface record {
};

# Groups two or more filters together using a logical OR
public type FrameworkSearchFilterGroup record {
    # A list of filters in this group
    FrameworkFilter[]? filters?;
};

# Interface PaymentMethodInterface
public type QuoteDataPaymentMethodInterface record {
    # Payment method code
    string? code;
    # Payment method title
    string? title;
};

public type GiftmessageItemidBody1 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

public type GiftmessageItemidBody2 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# Additional data for totals collection.
public type QuoteDataTotalsAdditionalDataInterface record {
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsAdditionalDataInterface
    QuoteDataTotalsAdditionalDataExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

public type QuoteidItemsBody1 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

public type MineItemsBody record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

public type CartidEstimateshippingmethodsbyaddressidBody1 record {
    # The estimate address id
    int? addressId;
};

public type GiftmessageItemidBody3 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

public type CollectionpointSelectBody record {
    int? entityId;
};

# Interface for custom attribute value.
public type FrameworkAttributeInterface record {
    # Attribute code
    string? attribute_code;
    # Attribute value
    string? value;
};

# Extended customer custom attributes interface.
public type CompanyDataCompanyCustomerInterface record {
    # Customer ID.
    int? customer_id?;
    # Company ID.
    int? company_id?;
    # Get job title.
    string? job_title?;
    # Customer status.
    int? status?;
    # Get telephone.
    string? telephone?;
    # ExtensionInterface class for @see \Magento\Company\Api\Data\CompanyCustomerInterface
    CompanyDataCompanyCustomerExtensionInterface? extension_attributes?;
};

# Interface TotalsInterface
public type QuoteDataTotalSegmentInterface record {
    # Code
    string? code;
    # Total title
    string? title?;
    # Total value
    decimal? value;
    # Display area code.
    string? area?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalSegmentInterface
    QuoteDataTotalSegmentExtensionInterface? extension_attributes?;
};

# Interface ShippingMethodInterface
public type QuoteDataShippingMethodInterface record {
    # Shipping carrier code.
    string? carrier_code;
    # Shipping method code.
    string? method_code;
    # Shipping carrier title. Otherwise, null.
    string? carrier_title?;
    # Shipping method title. Otherwise, null.
    string? method_title?;
    # Shipping amount in store currency.
    decimal? amount;
    # Shipping amount in base currency.
    decimal? base_amount;
    # The value of the availability flag for the current shipping method.
    boolean? available;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingMethodInterface
    QuoteDataShippingMethodExtensionInterface? extension_attributes?;
    # Shipping Error message.
    string? error_message;
    # Shipping price excl tax.
    decimal? price_excl_tax;
    # Shipping price incl tax.
    decimal? price_incl_tax;
};

# Data object for sort order.
public type FrameworkSortOrder record {
    # Sorting field.
    string? 'field;
    # Sorting direction.
    string? direction;
};

public type CartidShippinginformationBody record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface? addressInformation;
};

# Interface CriteriaInterface
public type FrameworkCriteriaInterface record {
    # Associated Mapper Interface name
    string? mapper_interface_name;
    # Criteria objects added to current Composite Criteria
    FrameworkCriteriaInterface[]? criteria_list;
    # List of filters
    string[]? filters;
    # Ordering criteria
    string[]? orders;
    # Limit
    string[]? 'limit;
};

public type ItemsItemidBody3 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

public type ItemsItemidBody2 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

public type ItemsItemidBody1 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

# ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteInterface
public type NegotiableQuoteDataNegotiableQuoteExtensionInterface record {
};

public type MineItemsBody1 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

public type CartidBillingaddressBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    boolean? useForShipping?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsInterface
public type QuoteDataTotalsExtensionInterface record {
    string? coupon_label?;
    decimal? base_customer_balance_amount?;
    decimal? customer_balance_amount?;
    # Extension attribute for quote totals model.
    NegotiableQuoteDataNegotiableQuoteTotalsInterface? negotiable_quote_totals?;
    decimal? reward_points_balance?;
    decimal? reward_currency_amount?;
    decimal? base_reward_currency_amount?;
};

public type CartidOrderBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod?;
};

public type CollectionpointSearchrequestBody record {
    string? countryId;
    string? postcode;
};

# Image Content data interface
public type FrameworkDataImageContentInterface record {
    # Media data (base64 encoded content)
    string? base64_encoded_data;
    # MIME type
    string? 'type;
    # Image name
    string? name;
};

public type CartidOrderBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod?;
};

# Interface TotalsItemInterface
public type QuoteDataTotalsItemInterface record {
    # Item id
    int? item_id;
    # Item price in quote currency.
    decimal? price;
    # Item price in base currency.
    decimal? base_price;
    # Item quantity.
    decimal? qty;
    # Row total in quote currency.
    decimal? row_total;
    # Row total in base currency.
    decimal? base_row_total;
    # Row total with discount in quote currency. Otherwise, null.
    decimal? row_total_with_discount?;
    # Tax amount in quote currency. Otherwise, null.
    decimal? tax_amount?;
    # Tax amount in base currency. Otherwise, null.
    decimal? base_tax_amount?;
    # Tax percent. Otherwise, null.
    decimal? tax_percent?;
    # Discount amount in quote currency. Otherwise, null.
    decimal? discount_amount?;
    # Discount amount in base currency. Otherwise, null.
    decimal? base_discount_amount?;
    # Discount percent. Otherwise, null.
    decimal? discount_percent?;
    # Price including tax in quote currency. Otherwise, null.
    decimal? price_incl_tax?;
    # Price including tax in base currency. Otherwise, null.
    decimal? base_price_incl_tax?;
    # Row total including tax in quote currency. Otherwise, null.
    decimal? row_total_incl_tax?;
    # Row total including tax in base currency. Otherwise, null.
    decimal? base_row_total_incl_tax?;
    # Item price in quote currency.
    string? options;
    # Item weee tax applied amount in quote currency.
    decimal? weee_tax_applied_amount;
    # Item weee tax applied in quote currency.
    string? weee_tax_applied;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsItemInterface
    QuoteDataTotalsItemExtensionInterface? extension_attributes?;
    # Product name. Otherwise, null.
    string? name?;
};

public type CartsMineBody1 record {
    # Interface CartInterface
    QuoteDataCartInterface? quote;
};

public type ItemsItemidBody record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

# ExtensionInterface class for @see \Magento\Checkout\Api\Data\PaymentDetailsInterface
public type CheckoutDataPaymentDetailsExtensionInterface record {
};

public type MineGiftmessageBody record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# ExtensionInterface class for @see \Magento\GiftMessage\Api\Data\MessageInterface
public type GiftMessageDataMessageExtensionInterface record {
    string? entity_id?;
    string? entity_type?;
    int? wrapping_id?;
    boolean? wrapping_allow_gift_receipt?;
    boolean? wrapping_add_printed_card?;
};

public type MineCheckoutfieldsBody1 record {
    FrameworkAttributeInterface[]? serviceSelection;
};

# Interface CustomOptionInterface
public type CatalogDataCustomOptionInterface record {
    # Option id
    string? option_id;
    # Option value
    string? option_value;
    # ExtensionInterface class for @see \Magento\Catalog\Api\Data\CustomOptionInterface
    CatalogDataCustomOptionExtensionInterface? extension_attributes?;
};

public type CartidGiftcardsBody1 record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface? giftCardAccountData;
};

# ExtensionInterface class for @see \Magento\ConfigurableProduct\Api\Data\ConfigurableItemOptionValueInterface
public type ConfigurableProductDataConfigurableItemOptionValueExtensionInterface record {
};

public type CartidSelectedpaymentmethodBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? method;
};

# Interface GiftCardOptionInterface
public type GiftCardDataGiftCardOptionInterface record {
    # Gift card amount.
    string? giftcard_amount;
    # Gift card open amount value.
    decimal? custom_giftcard_amount?;
    # Gift card sender name.
    string? giftcard_sender_name;
    # Gift card recipient name.
    string? giftcard_recipient_name;
    # Gift card sender email.
    string? giftcard_sender_email;
    # Gift card recipient email.
    string? giftcard_recipient_email;
    # Giftcard message.
    string? giftcard_message?;
    # ExtensionInterface class for @see \Magento\GiftCard\Api\Data\GiftCardOptionInterface
    GiftCardDataGiftCardOptionExtensionInterface? extension_attributes?;
};

# Errors list
public type ErrorErrors ErrorErrorsItem[]?;

public type MineTotalsinformationBody record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface? addressInformation;
};

# Interface TotalsInformationInterface
public type CheckoutDataTotalsInformationInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    # Shipping method code
    string? shipping_method_code?;
    # Carrier code
    string? shipping_carrier_code?;
    # ExtensionInterface class for @see \Magento\Checkout\Api\Data\TotalsInformationInterface
    CheckoutDataTotalsInformationExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

public type MineOrderBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod?;
};

# Interface ShippingAssignmentInterface
public type QuoteDataShippingAssignmentInterface record {
    # Interface ShippingInterface
    QuoteDataShippingInterface? shipping;
    QuoteDataCartItemInterface[]? items;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingAssignmentInterface
    QuoteDataShippingAssignmentExtensionInterface? extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingAssignmentInterface
public type QuoteDataShippingAssignmentExtensionInterface record {
};

public type MineShippinginformationBody1 record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface? addressInformation;
};

public type CartidEstimateshippingmethodsBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\PaymentInterface
public type QuoteDataPaymentExtensionInterface record {
    string[]? agreement_ids?;
};

public type CartidGiftmessageBody record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# Downloadable Option
public type DownloadableDataDownloadableOptionInterface record {
    # The list of downloadable links
    int[]? downloadable_links;
};

# Interface CartInterface
public type QuoteDataCartInterface record {
    # Cart/quote ID.
    int? id;
    # Cart creation date and time. Otherwise, null.
    string? created_at?;
    # Cart last update date and time. Otherwise, null.
    string? updated_at?;
    # Cart conversion date and time. Otherwise, null.
    string? converted_at?;
    # Active status flag value. Otherwise, null.
    boolean? is_active?;
    # Virtual flag value. Otherwise, null.
    boolean? is_virtual?;
    # Array of items. Otherwise, null.
    QuoteDataCartItemInterface[]? items?;
    # Number of different items or products in the cart. Otherwise, null.
    int? items_count?;
    # Total quantity of all cart items. Otherwise, null.
    decimal? items_qty?;
    # Customer interface.
    CustomerDataCustomerInterface? customer;
    # Interface AddressInterface
    QuoteDataAddressInterface? billing_address?;
    # Reserved order ID. Otherwise, null.
    string? reserved_order_id?;
    # Original order ID. Otherwise, null.
    int? orig_order_id?;
    # Interface CurrencyInterface
    QuoteDataCurrencyInterface? currency?;
    # For guest customers, false for logged in customers
    boolean? customer_is_guest?;
    # Notice text
    string? customer_note?;
    # Customer notification flag
    boolean? customer_note_notify?;
    # Customer tax class ID.
    int? customer_tax_class_id?;
    # Store identifier
    int? store_id;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CartInterface
    QuoteDataCartExtensionInterface? extension_attributes?;
};

# Extension attribute for quote totals model.
public type NegotiableQuoteDataNegotiableQuoteTotalsInterface record {
    # The number of different items or products in the cart.
    int? items_count;
    # Negotiable quote status.
    string? quote_status;
    # The cart creation date and time.
    string? created_at;
    # The cart last update date and time.
    string? updated_at;
    # Customer group id.
    int? customer_group;
    # Base currency to quote currency rate.
    decimal? base_to_quote_rate;
    # Total cost for quote.
    decimal? cost_total;
    # Total cost for quote in base currency.
    decimal? base_cost_total;
    # Original quote total.
    decimal? original_total;
    # Original quote total in base currency.
    decimal? base_original_total;
    # Original tax amount for quote.
    decimal? original_tax;
    # Original tax amount for quote in base currency.
    decimal? base_original_tax;
    # Original price with included tax for quote.
    decimal? original_price_incl_tax;
    # Original price with included tax for quote in base currency.
    decimal? base_original_price_incl_tax;
    # Negotiable quote type.
    int? negotiated_price_type;
    # Negotiable price value for quote.
    decimal? negotiated_price_value;
};

# ExtensionInterface class for @see \Magento\Checkout\Api\Data\ShippingInformationInterface
public type CheckoutDataShippingInformationExtensionInterface record {
};

# Interface ShippingInformationInterface
public type CheckoutDataShippingInformationInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface? shipping_address;
    # Interface AddressInterface
    QuoteDataAddressInterface? billing_address?;
    # Shipping method code
    string? shipping_method_code;
    # Carrier code
    string? shipping_carrier_code;
    # ExtensionInterface class for @see \Magento\Checkout\Api\Data\ShippingInformationInterface
    CheckoutDataShippingInformationExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

# Interface ShippingInterface
public type QuoteDataShippingInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    # Shipping method
    string? method;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingInterface
    QuoteDataShippingExtensionInterface? extension_attributes?;
};

public type MineEstimateshippingmethodsbyaddressidBody1 record {
    # The estimate address id
    int? addressId;
};

# Error details
public type ErrorErrorsItem record {
    # Error message
    string? message?;
    # Error parameters list
    ErrorParameters? parameters?;
};

# Customer interface.
public type CustomerDataCustomerInterface record {
    # Customer id
    int? id?;
    # Group id
    int? group_id?;
    # Default billing address id
    string? default_billing?;
    # Default shipping address id
    string? default_shipping?;
    # Confirmation
    string? confirmation?;
    # Created at time
    string? created_at?;
    # Updated at time
    string? updated_at?;
    # Created in area
    string? created_in?;
    # Date of birth
    string? dob?;
    # Email address
    string? email;
    # First name
    string? firstname;
    # Last name
    string? lastname;
    # Middle name
    string? middlename?;
    # Prefix
    string? prefix?;
    # Suffix
    string? suffix?;
    # Gender
    int? gender?;
    # Store id
    int? store_id?;
    # Tax Vat
    string? taxvat?;
    # Website id
    int? website_id?;
    # Customer addresses.
    CustomerDataAddressInterface[]? addresses?;
    # Disable auto group change flag.
    int? disable_auto_group_change?;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\CustomerInterface
    CustomerDataCustomerExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

public type CollectionpointSelectBody1 record {
    int? entityId;
};

# Customer address interface.
public type CustomerDataAddressInterface record {
    # ID
    int? id?;
    # Customer ID
    int? customer_id?;
    # Customer address region interface.
    CustomerDataRegionInterface? region?;
    # Region ID
    int? region_id?;
    # Country code in ISO_3166-2 format
    string? country_id?;
    # Street
    string[]? street?;
    # Company
    string? company?;
    # Telephone number
    string? telephone?;
    # Fax number
    string? fax?;
    # Postcode
    string? postcode?;
    # City name
    string? city?;
    # First name
    string? firstname?;
    # Last name
    string? lastname?;
    # Middle name
    string? middlename?;
    # Prefix
    string? prefix?;
    # Suffix
    string? suffix?;
    # Vat id
    string? vat_id?;
    # If this address is default shipping address.
    boolean? default_shipping?;
    # If this address is default billing address
    boolean? default_billing?;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\AddressInterface
    CustomerDataAddressExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

public type ErrorResponse record {
    # Error message
    string? message;
    # Errors list
    ErrorErrors? errors?;
    # Error code
    int? code?;
    # Error parameters list
    ErrorParameters? parameters?;
    # Stack trace
    string? trace?;
};

public type MinePaymentinformationBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface? billingAddress?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CurrencyInterface
public type QuoteDataCurrencyExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Checkout\Api\Data\TotalsInformationInterface
public type CheckoutDataTotalsInformationExtensionInterface record {
};

# Error parameters item
public type ErrorParametersItem record {
    # ACL resource
    string? resources?;
    # Missing or invalid field name
    string? fieldName?;
    # Incorrect field value
    string? fieldValue?;
};

public type MineGiftcardsBody record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface? giftCardAccountData;
};

# Interface PaymentDetailsInterface
public type CheckoutDataPaymentDetailsInterface record {
    QuoteDataPaymentMethodInterface[]? payment_methods;
    # Interface TotalsInterface
    QuoteDataTotalsInterface? totals;
    # ExtensionInterface class for @see \Magento\Checkout\Api\Data\PaymentDetailsInterface
    CheckoutDataPaymentDetailsExtensionInterface? extension_attributes?;
};

public type CartsCartidBody1 record {
    # The customer ID.
    int? customerId;
    int? storeId;
};

# ExtensionInterface class for @see \Magento\CheckoutAgreements\Api\Data\AgreementInterface
public type CheckoutAgreementsDataAgreementExtensionInterface record {
};

# Interface CartItemInterface
public type QuoteDataCartItemInterface record {
    # Item ID. Otherwise, null.
    int? item_id?;
    # Product SKU. Otherwise, null.
    string? sku?;
    # Product quantity.
    decimal? qty;
    # Product name. Otherwise, null.
    string? name?;
    # Product price. Otherwise, null.
    decimal? price?;
    # Product type. Otherwise, null.
    string? product_type?;
    # Quote id.
    string? quote_id;
    # Product option interface
    QuoteDataProductOptionInterface? product_option?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CartItemInterface
    QuoteDataCartItemExtensionInterface? extension_attributes?;
};

public type MineDeliveryoptionBody record {
    string? selectedOption;
};

public type MineEstimateshippingmethodsBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
};

# ExtensionInterface class for @see \Magento\GiftCard\Api\Data\GiftCardOptionInterface
public type GiftCardDataGiftCardOptionExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalSegmentInterface
public type QuoteDataTotalSegmentExtensionInterface record {
    TaxDataGrandTotalDetailsInterface[]? tax_grandtotal_details?;
    string? gift_cards?;
    string? gw_order_id?;
    string[]? gw_item_ids?;
    string? gw_allow_gift_receipt?;
    string? gw_add_card?;
    string? gw_price?;
    string? gw_base_price?;
    string? gw_items_price?;
    string? gw_items_base_price?;
    string? gw_card_price?;
    string? gw_card_base_price?;
    string? gw_base_tax_amount?;
    string? gw_tax_amount?;
    string? gw_items_base_tax_amount?;
    string? gw_items_tax_amount?;
    string? gw_card_base_tax_amount?;
    string? gw_card_tax_amount?;
    string? gw_price_incl_tax?;
    string? gw_base_price_incl_tax?;
    string? gw_card_price_incl_tax?;
    string? gw_card_base_price_incl_tax?;
    string? gw_items_price_incl_tax?;
    string? gw_items_base_price_incl_tax?;
    string[]? vertex_tax_calculation_messages?;
};

# ExtensionInterface class for @see \Magento\Company\Api\Data\CompanyCustomerInterface
public type CompanyDataCompanyCustomerExtensionInterface record {
};

# Temando Collection Point Search Request Interface
public type TemandoShippingDataCollectionPointSearchRequestInterface record {
    int? shipping_address_id;
    string? country_id;
    string? postcode;
    boolean? pending;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\AddressInterface
public type QuoteDataAddressExtensionInterface record {
    int? gift_registry_id?;
    FrameworkAttributeInterface[]? checkout_fields?;
};

public type CartsCartidBody record {
    # The customer ID.
    int? customerId;
    int? storeId;
};

# Interface TotalsInterface
public type QuoteDataTotalsInterface record {
    # Grand total in quote currency
    decimal? grand_total?;
    # Grand total in base currency
    decimal? base_grand_total?;
    # Subtotal in quote currency
    decimal? subtotal?;
    # Subtotal in base currency
    decimal? base_subtotal?;
    # Discount amount in quote currency
    decimal? discount_amount?;
    # Discount amount in base currency
    decimal? base_discount_amount?;
    # Subtotal in quote currency with applied discount
    decimal? subtotal_with_discount?;
    # Subtotal in base currency with applied discount
    decimal? base_subtotal_with_discount?;
    # Shipping amount in quote currency
    decimal? shipping_amount?;
    # Shipping amount in base currency
    decimal? base_shipping_amount?;
    # Shipping discount amount in quote currency
    decimal? shipping_discount_amount?;
    # Shipping discount amount in base currency
    decimal? base_shipping_discount_amount?;
    # Tax amount in quote currency
    decimal? tax_amount?;
    # Tax amount in base currency
    decimal? base_tax_amount?;
    # Item weee tax applied amount in quote currency.
    decimal? weee_tax_applied_amount;
    # Shipping tax amount in quote currency
    decimal? shipping_tax_amount?;
    # Shipping tax amount in base currency
    decimal? base_shipping_tax_amount?;
    # Subtotal including tax in quote currency
    decimal? subtotal_incl_tax?;
    # Subtotal including tax in base currency
    decimal? base_subtotal_incl_tax?;
    # Shipping including tax in quote currency
    decimal? shipping_incl_tax?;
    # Shipping including tax in base currency
    decimal? base_shipping_incl_tax?;
    # Base currency code
    string? base_currency_code?;
    # Quote currency code
    string? quote_currency_code?;
    # Applied coupon code
    string? coupon_code?;
    # Items qty
    int? items_qty?;
    # Totals by items
    QuoteDataTotalsItemInterface[]? items?;
    # Dynamically calculated totals
    QuoteDataTotalSegmentInterface[]? total_segments;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsInterface
    QuoteDataTotalsExtensionInterface? extension_attributes?;
};

# ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemTotalsInterface
public type NegotiableQuoteDataNegotiableQuoteItemTotalsExtensionInterface record {
};

# Interface AddressInterface
public type QuoteDataAddressInterface record {
    # Id
    int? id?;
    # Region name
    string? region;
    # Region id
    int? region_id;
    # Region code
    string? region_code;
    # Country id
    string? country_id;
    # Street
    string[]? street;
    # Company
    string? company?;
    # Telephone number
    string? telephone;
    # Fax number
    string? fax?;
    # Postcode
    string? postcode;
    # City name
    string? city;
    # First name
    string? firstname;
    # Last name
    string? lastname;
    # Middle name
    string? middlename?;
    # Prefix
    string? prefix?;
    # Suffix
    string? suffix?;
    # Vat id
    string? vat_id?;
    # Customer id
    int? customer_id?;
    # Billing/shipping email
    string? email;
    # Same as billing flag
    int? same_as_billing?;
    # Customer address id
    int? customer_address_id?;
    # Save in address book flag
    int? save_in_address_book?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\AddressInterface
    QuoteDataAddressExtensionInterface? extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[]? custom_attributes?;
};

public type CartidTotalsinformationBody1 record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface? addressInformation;
};

# Search criteria interface.
public type FrameworkSearchCriteriaInterface record {
    # A list of filter groups.
    FrameworkSearchFilterGroup[]? filter_groups;
    # Sort order.
    FrameworkSortOrder[]? sort_orders?;
    # Page size.
    int? page_size?;
    # Current page.
    int? current_page?;
};

public type MineCollecttotalsBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # The carrier code.
    string? shippingCarrierCode?;
    # The shipping method code.
    string? shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface? additionalData?;
};

public type GiftmessageItemidBody record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\RegionInterface
public type CustomerDataRegionExtensionInterface record {
};

public type MineBillingaddressBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    boolean? useForShipping?;
};

public type CollectionpointSearchrequestBody1 record {
    string? countryId;
    string? postcode;
};

public type MineCollecttotalsBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # The carrier code.
    string? shippingCarrierCode?;
    # The shipping method code.
    string? shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface? additionalData?;
};

public type MineEstimateshippingmethodsbyaddressidBody record {
    # The estimate address id
    int? addressId;
};

public type MineCheckoutfieldsBody record {
    FrameworkAttributeInterface[]? serviceSelection;
};

# Interface ConfigurableItemOptionValueInterface
public type ConfigurableProductDataConfigurableItemOptionValueInterface record {
    # Option SKU
    string? option_id;
    # Item id
    int? option_value?;
    # ExtensionInterface class for @see \Magento\ConfigurableProduct\Api\Data\ConfigurableItemOptionValueInterface
    ConfigurableProductDataConfigurableItemOptionValueExtensionInterface? extension_attributes?;
};

# Interface CompanyQuoteConfigInterface
public type NegotiableQuoteDataNegotiableQuoteItemInterface record {
    # Quote item id
    int? item_id;
    # Quote item original price
    decimal? original_price;
    # Quote item original tax amount
    decimal? original_tax_amount;
    # Quote item original discount amount
    decimal? original_discount_amount;
    # ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemInterface
    NegotiableQuoteDataNegotiableQuoteItemExtensionInterface? extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingInterface
public type QuoteDataShippingExtensionInterface record {
};

public type QuoteidItemsBody record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface? cartItem;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\CustomerInterface
public type CustomerDataCustomerExtensionInterface record {
    # Extended customer custom attributes interface.
    CompanyDataCompanyCustomerInterface? company_attributes?;
    boolean? is_subscribed?;
    string? amazon_id?;
    string? vertex_customer_code?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CartInterface
public type QuoteDataCartExtensionInterface record {
    QuoteDataShippingAssignmentInterface[]? shipping_assignments?;
    # Interface NegotiableQuoteInterface
    NegotiableQuoteDataNegotiableQuoteInterface? negotiable_quote?;
    string? amazon_order_reference_id?;
};

# Customer address region interface.
public type CustomerDataRegionInterface record {
    # Region code
    string? region_code;
    # Region
    string? region;
    # Region id
    int? region_id;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\RegionInterface
    CustomerDataRegionExtensionInterface? extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Catalog\Api\Data\CustomOptionInterface
public type CatalogDataCustomOptionExtensionInterface record {
    # Image Content data interface
    FrameworkDataImageContentInterface? file_info?;
};

# ExtensionInterface class for @see \Magento\Bundle\Api\Data\BundleOptionInterface
public type BundleDataBundleOptionExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingMethodInterface
public type QuoteDataShippingMethodExtensionInterface record {
};

public type MineBillingaddressBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    boolean? useForShipping?;
};

# Gift Card Account data
public type GiftCardAccountDataGiftCardAccountInterface record {
    # Cards codes
    string[]? gift_cards;
    # Cards amount in quote currency
    decimal? gift_cards_amount;
    # Cards amount in base currency
    decimal? base_gift_cards_amount;
    # Cards amount used in quote currency
    decimal? gift_cards_amount_used;
    # Cards amount used in base currency
    decimal? base_gift_cards_amount_used;
    # ExtensionInterface class for @see \Magento\GiftCardAccount\Api\Data\GiftCardAccountInterface
    GiftCardAccountDataGiftCardAccountExtensionInterface? extension_attributes?;
};

public type MineTotalsinformationBody1 record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface? addressInformation;
};

# Extension attribute for quote item totals model.
public type NegotiableQuoteDataNegotiableQuoteItemTotalsInterface record {
    # Cost for quote item.
    decimal? cost;
    # Catalog price for quote item.
    decimal? catalog_price;
    # Catalog price for quote item in base currency.
    decimal? base_catalog_price;
    # Catalog price with included tax for quote item.
    decimal? catalog_price_incl_tax;
    # Catalog price with included tax for quote item in base currency.
    decimal? base_catalog_price_incl_tax;
    # Cart price for quote item.
    decimal? cart_price;
    # Cart price for quote item in base currency.
    decimal? base_cart_price;
    # Tax from catalog price for quote item.
    decimal? cart_tax;
    # Tax from catalog price for quote item in base currency.
    decimal? base_cart_tax;
    # Cart price with included tax for quote item.
    decimal? cart_price_incl_tax;
    # Cart price with included tax for quote item in base currency.
    decimal? base_cart_price_incl_tax;
    # ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemTotalsInterface
    NegotiableQuoteDataNegotiableQuoteItemTotalsExtensionInterface? extension_attributes?;
};

public type MineSetpaymentinformationBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface? billingAddress?;
};

# Error parameters list
public type ErrorParameters ErrorParametersItem[]?;

# Product option interface
public type QuoteDataProductOptionInterface record {
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ProductOptionInterface
    QuoteDataProductOptionExtensionInterface? extension_attributes?;
};

public type MineOrderBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? paymentMethod?;
};

# Temando Quote Collection Point Interface – Checkout/Quoting
public type TemandoShippingDataCollectionPointQuoteCollectionPointInterface record {
    int? entity_id;
    string? collection_point_id;
    int? recipient_address_id;
    string? name;
    string? country;
    string? region;
    string? postcode;
    string? city;
    string[]? street;
    string[]? opening_hours;
    string[]? shipping_experiences;
    boolean? selected;
};

# Interface GrandTotalRatesInterface
public type TaxDataGrandTotalRatesInterface record {
    # Tax percentage value
    string? percent;
    # Rate title
    string? title;
};

public type MineGiftcardsBody1 record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface? giftCardAccountData;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsAdditionalDataInterface
public type QuoteDataTotalsAdditionalDataExtensionInterface record {
    GiftMessageDataMessageInterface[]? gift_messages?;
};

public type CartidTotalsinformationBody record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface? addressInformation;
};

# Interface PaymentInterface
public type QuoteDataPaymentInterface record {
    # Purchase order number
    string? po_number?;
    # Payment method code
    string? method;
    # Payment additional details
    string[]? additional_data?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\PaymentInterface
    QuoteDataPaymentExtensionInterface? extension_attributes?;
};

public type MineDeliveryoptionBody1 record {
    string? selectedOption;
};

public type CartidEstimateshippingmethodsbyaddressidBody record {
    # The estimate address id
    int? addressId;
};

# ExtensionInterface class for @see \Magento\GiftCardAccount\Api\Data\GiftCardAccountInterface
public type GiftCardAccountDataGiftCardAccountExtensionInterface record {
};

public type CartidSelectedpaymentmethodBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? method;
};

# Interface AgreementInterface
public type CheckoutAgreementsDataAgreementInterface record {
    # Agreement ID.
    int? agreement_id;
    # Agreement name.
    string? name;
    # Agreement content.
    string? content;
    # Agreement content height. Otherwise, null.
    string? content_height?;
    # Agreement checkbox text.
    string? checkbox_text;
    # Agreement status.
    boolean? is_active;
    # * true - HTML. * false - plain text.
    boolean? is_html;
    # The agreement applied mode.
    int? mode;
    # ExtensionInterface class for @see \Magento\CheckoutAgreements\Api\Data\AgreementInterface
    CheckoutAgreementsDataAgreementExtensionInterface? extension_attributes?;
};

# Interface GrandTotalDetailsInterface
public type TaxDataGrandTotalDetailsInterface record {
    # Tax amount value
    decimal? amount;
    # Tax rates info
    TaxDataGrandTotalRatesInterface[]? rates;
    # Group identifier
    int? group_id;
};

public type CartidGiftcardsBody record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface? giftCardAccountData;
};

public type CartidBillingaddressBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
    boolean? useForShipping?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CartItemInterface
public type QuoteDataCartItemExtensionInterface record {
    # Interface CompanyQuoteConfigInterface
    NegotiableQuoteDataNegotiableQuoteItemInterface? negotiable_quote_item?;
};

# Interface CartSearchResultsInterface
public type QuoteDataCartSearchResultsInterface record {
    # Carts list.
    QuoteDataCartInterface[]? items;
    # Search criteria interface.
    FrameworkSearchCriteriaInterface? search_criteria;
    # Total count.
    int? total_count;
};

# Interface NegotiableQuoteInterface
public type NegotiableQuoteDataNegotiableQuoteInterface record {
    # Negotiable quote ID.
    int? quote_id;
    # Is regular quote.
    boolean? is_regular_quote;
    # Negotiable quote status.
    string? status;
    # Negotiated price type.
    int? negotiated_price_type;
    # Negotiated price value.
    decimal? negotiated_price_value;
    # Proposed shipping price.
    decimal? shipping_price;
    # Negotiable quote name.
    string? quote_name;
    # Expiration period.
    string? expiration_period;
    # Email notification status.
    int? email_notification_status;
    # Has unconfirmed changes.
    boolean? has_unconfirmed_changes;
    # Shipping tax changes.
    boolean? is_shipping_tax_changed;
    # Customer price changes.
    boolean? is_customer_price_changed;
    # Quote notifications.
    int? notifications;
    # Quote rules.
    string? applied_rule_ids;
    # Is address draft.
    boolean? is_address_draft;
    # Deleted products sku.
    string? deleted_sku;
    # Quote creator id.
    int? creator_id;
    # Quote creator type.
    int? creator_type;
    # Quote original total price.
    decimal? original_total_price?;
    # Quote original total price in base currency.
    decimal? base_original_total_price?;
    # Quote negotiated total price.
    decimal? negotiated_total_price?;
    # Quote negotiated total price in base currency.
    decimal? base_negotiated_total_price?;
    # ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteInterface
    NegotiableQuoteDataNegotiableQuoteExtensionInterface? extension_attributes?;
};

public type CartsMineBody record {
    # Interface CartInterface
    QuoteDataCartInterface? quote;
};

public type CartidGiftmessageBody1 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\AddressInterface
public type CustomerDataAddressExtensionInterface record {
};

public type CartidShippinginformationBody1 record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface? addressInformation;
};

# Option interface.
public type CustomerDataOptionInterface record {
    # Option label
    string? label;
    # Option value
    string? value?;
    # Nested options
    CustomerDataOptionInterface[]? options?;
};

# Filter which can be used by any methods from service layer.
public type FrameworkFilter record {
    # Field
    string? 'field;
    # Value
    string? value;
    # Condition type
    string? condition_type?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ProductOptionInterface
public type QuoteDataProductOptionExtensionInterface record {
    CatalogDataCustomOptionInterface[]? custom_options?;
    BundleDataBundleOptionInterface[]? bundle_options?;
    ConfigurableProductDataConfigurableItemOptionValueInterface[]? configurable_item_options?;
    # Downloadable Option
    DownloadableDataDownloadableOptionInterface? downloadable_option?;
    # Interface GiftCardOptionInterface
    GiftCardDataGiftCardOptionInterface? giftcard_item_option?;
};

public type CartidEstimateshippingmethodsBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface? address;
};

public type MineSelectedpaymentmethodBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface? method;
};

public type MineGiftmessageBody1 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface? giftMessage;
};

# Interface CurrencyInterface
public type QuoteDataCurrencyInterface record {
    # Global currency code
    string? global_currency_code?;
    # Base currency code
    string? base_currency_code?;
    # Store currency code
    string? store_currency_code?;
    # Quote currency code
    string? quote_currency_code?;
    # Store currency to base currency rate
    decimal? store_to_base_rate?;
    # Store currency to quote currency rate
    decimal? store_to_quote_rate?;
    # Base currency to global currency rate
    decimal? base_to_global_rate?;
    # Base currency to quote currency rate
    decimal? base_to_quote_rate?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CurrencyInterface
    QuoteDataCurrencyExtensionInterface? extension_attributes?;
};

# Interface MessageInterface
public type GiftMessageDataMessageInterface record {
    # Gift message ID. Otherwise, null.
    int? gift_message_id?;
    # Customer ID. Otherwise, null.
    int? customer_id?;
    # Sender name.
    string? sender;
    # Recipient name.
    string? recipient;
    # Message text.
    string? message;
    # ExtensionInterface class for @see \Magento\GiftMessage\Api\Data\MessageInterface
    GiftMessageDataMessageExtensionInterface? extension_attributes?;
};
