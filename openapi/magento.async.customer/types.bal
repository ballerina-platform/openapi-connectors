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

# Interface BundleOptionInterface
public type BundleDataBundleOptionInterface record {
    # Bundle option id.
    int option_id;
    # Bundle option quantity.
    int option_qty;
    # Bundle option selection ids.
    int[] option_selections;
    # ExtensionInterface class for @see \Magento\Bundle\Api\Data\BundleOptionInterface
    BundleDataBundleOptionExtensionInterface extension_attributes?;
};

public type CustomersPasswordBody1 record {
    string email;
    string template;
    int websiteId?;
};

public type MineEstimateshippingmethodsBody record {
    # The estimate registry id
    int registryId;
};

public type GuestcartsCartidBody1 record {
    # The customer ID.
    int customerId;
    int storeId;
};

public type MinePaymentinformationBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type AmazonbillingaddressAmazonorderreferenceidBody1 record {
    string addressConsentToken;
};

public type MineSetpaymentinformationBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemInterface
public type NegotiableQuoteDataNegotiableQuoteItemExtensionInterface record {
};

public type GiftmessageItemidBody1 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface giftMessage;
};

# Additional data for totals collection.
public type QuoteDataTotalsAdditionalDataInterface record {
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsAdditionalDataInterface
    QuoteDataTotalsAdditionalDataExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type AmazonshippingaddressAmazonorderreferenceidBody1 record {
    string addressConsentToken;
};

public type CartidEstimateshippingmethodsbyaddressidBody1 record {
    # The estimate address id
    int addressId;
};

# Interface for custom attribute value.
public type FrameworkAttributeInterface record {
    # Attribute code
    string attribute_code;
    # Attribute value
    string value;
};

# Extended customer custom attributes interface.
public type CompanyDataCompanyCustomerInterface record {
    # Customer ID.
    int customer_id?;
    # Company ID.
    int company_id?;
    # Get job title.
    string job_title?;
    # Customer status.
    int status?;
    # Get telephone.
    string telephone?;
    # ExtensionInterface class for @see \Magento\Company\Api\Data\CompanyCustomerInterface
    CompanyDataCompanyCustomerExtensionInterface extension_attributes?;
};

public type CustomerTokenBody1 record {
    string username;
    string password;
};

public type CartidShippinginformationBody record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface addressInformation;
};

public type CartidItemsBody1 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface cartItem;
};

public type CartidBillingaddressBody3 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    boolean useForShipping?;
};

public type CartidBillingaddressBody2 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    boolean useForShipping?;
};

public type ItemsItemidBody1 record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface cartItem;
};

# ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteInterface
public type NegotiableQuoteDataNegotiableQuoteExtensionInterface record {
};

# Interface RequisitionListItemInterface
public type RequisitionListDataRequisitionListItemInterface record {
    # Requisition List ID.
    int id;
    # Product SKU.
    int sku;
    # Requisition List ID.
    int requisition_list_id;
    # Product Qty.
    decimal qty;
    # Requisition list item options.
    string[] options;
    # Store ID.
    int store_id;
    # Added_at value.
    string added_at;
    # ExtensionInterface class for @see \Magento\RequisitionList\Api\Data\RequisitionListItemInterface
    RequisitionListDataRequisitionListItemExtensionInterface extension_attributes?;
};

public type CartidBillingaddressBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    boolean useForShipping?;
};

public type CartidCollecttotalsBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # The carrier code.
    string shippingCarrierCode?;
    # The shipping method code.
    string shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface additionalData?;
};

public type CartidOrderBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod?;
};

# Image Content data interface
public type FrameworkDataImageContentInterface record {
    # Media data (base64 encoded content)
    string base64_encoded_data;
    # MIME type
    string 'type;
    # Image name
    string name;
};

public type CartidOrderBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod?;
};

public type CartsMineBody1 record {
    # Interface CartInterface
    QuoteDataCartInterface quote;
};

public type CartidGiftcardsBody3 record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface giftCardAccountData;
};

public type ItemsItemidBody record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface cartItem;
};

public type CartidGiftcardsBody2 record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface giftCardAccountData;
};

public type V1CustomersBody1 record {
    # Customer interface.
    CustomerDataCustomerInterface customer;
    string password?;
    string redirectUrl?;
};

public type V1RequisitionListsBody1 record {
    # Interface RequisitionListInterface
    RequisitionListDataRequisitionListInterface requisitionList;
};

# ExtensionInterface class for @see \Magento\GiftMessage\Api\Data\MessageInterface
public type GiftMessageDataMessageExtensionInterface record {
    string entity_id?;
    string entity_type?;
    int wrapping_id?;
    boolean wrapping_allow_gift_receipt?;
    boolean wrapping_add_printed_card?;
};

# Interface CustomOptionInterface
public type CatalogDataCustomOptionInterface record {
    # Option id
    string option_id;
    # Option value
    string option_value;
    # ExtensionInterface class for @see \Magento\Catalog\Api\Data\CustomOptionInterface
    CatalogDataCustomOptionExtensionInterface extension_attributes?;
};

public type CartidGiftcardsBody1 record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface giftCardAccountData;
};

# ExtensionInterface class for @see \Magento\ConfigurableProduct\Api\Data\ConfigurableItemOptionValueInterface
public type ConfigurableProductDataConfigurableItemOptionValueExtensionInterface record {
};

# Interface RequisitionListInterface
public type RequisitionListDataRequisitionListInterface record {
    # Requisition List ID
    int id;
    # Customer ID
    int customer_id;
    # Requisition List Name
    string name;
    # Requisition List Update Time
    string updated_at;
    # Requisition List Description
    string description;
    # Requisition List Items
    RequisitionListDataRequisitionListItemInterface[] items;
    # ExtensionInterface class for @see \Magento\RequisitionList\Api\Data\RequisitionListInterface
    RequisitionListDataRequisitionListExtensionInterface extension_attributes?;
};

public type CartidSelectedpaymentmethodBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface method;
};

# ItemStatusInterface interface Temporary object with status of requested item. Indicate if entity param was Accepted|Rejected to bulk schedule
public type AsynchronousOperationsDataItemStatusInterface record {
    # Entity Id.
    int id;
    # md5 hash of entity params array.
    string data_hash;
    # accepted|rejected
    string status;
    # Error information.
    string error_message?;
    # Error code.
    int error_code?;
};

public type MePasswordBody record {
    string currentPassword;
    string newPassword;
};

# Interface GiftCardOptionInterface
public type GiftCardDataGiftCardOptionInterface record {
    # Gift card amount.
    string giftcard_amount;
    # Gift card open amount value.
    decimal custom_giftcard_amount?;
    # Gift card sender name.
    string giftcard_sender_name;
    # Gift card recipient name.
    string giftcard_recipient_name;
    # Gift card sender email.
    string giftcard_sender_email;
    # Gift card recipient email.
    string giftcard_recipient_email;
    # Giftcard message.
    string giftcard_message?;
    # ExtensionInterface class for @see \Magento\GiftCard\Api\Data\GiftCardOptionInterface
    GiftCardDataGiftCardOptionExtensionInterface extension_attributes?;
};

# Discount Data Interface
public type SalesRuleDataDiscountDataInterface record {
    # Amount
    decimal amount;
    # Base Amount
    decimal base_amount;
    # Original Amount
    decimal original_amount;
    # Base Original Amount
    decimal base_original_amount;
};

public type CartidPaymentinformationBody record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# Errors list
public type ErrorErrors ErrorErrorsItem[];

public type AmazonshippingaddressAmazonorderreferenceidBody record {
    string addressConsentToken;
};

# Interface TotalsInformationInterface
public type CheckoutDataTotalsInformationInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    # Shipping method code
    string shipping_method_code?;
    # Carrier code
    string shipping_carrier_code?;
    # ExtensionInterface class for @see \Magento\Checkout\Api\Data\TotalsInformationInterface
    CheckoutDataTotalsInformationExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type CartidCollecttotalsBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # The carrier code.
    string shippingCarrierCode?;
    # The shipping method code.
    string shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface additionalData?;
};

# Interface ShippingAssignmentInterface
public type QuoteDataShippingAssignmentInterface record {
    # Interface ShippingInterface
    QuoteDataShippingInterface shipping;
    QuoteDataCartItemInterface[] items;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingAssignmentInterface
    QuoteDataShippingAssignmentExtensionInterface extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingAssignmentInterface
public type QuoteDataShippingAssignmentExtensionInterface record {
};

public type CartidEstimateshippingmethodsBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\PaymentInterface
public type QuoteDataPaymentExtensionInterface record {
    string[] agreement_ids?;
};

public type CartidGiftmessageBody record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface giftMessage;
};

# Downloadable Option
public type DownloadableDataDownloadableOptionInterface record {
    # The list of downloadable links
    int[] downloadable_links;
};

# Interface CartInterface
public type QuoteDataCartInterface record {
    # Cart/quote ID.
    int id;
    # Cart creation date and time. Otherwise, null.
    string created_at?;
    # Cart last update date and time. Otherwise, null.
    string updated_at?;
    # Cart conversion date and time. Otherwise, null.
    string converted_at?;
    # Active status flag value. Otherwise, null.
    boolean is_active?;
    # Virtual flag value. Otherwise, null.
    boolean is_virtual?;
    # Array of items. Otherwise, null.
    QuoteDataCartItemInterface[] items?;
    # Number of different items or products in the cart. Otherwise, null.
    int items_count?;
    # Total quantity of all cart items. Otherwise, null.
    decimal items_qty?;
    # Customer interface.
    CustomerDataCustomerInterface customer;
    # Interface AddressInterface
    QuoteDataAddressInterface billing_address?;
    # Reserved order ID. Otherwise, null.
    string reserved_order_id?;
    # Original order ID. Otherwise, null.
    int orig_order_id?;
    # Interface CurrencyInterface
    QuoteDataCurrencyInterface currency?;
    # For guest customers, false for logged in customers
    boolean customer_is_guest?;
    # Notice text
    string customer_note?;
    # Customer notification flag
    boolean customer_note_notify?;
    # Customer tax class ID.
    int customer_tax_class_id?;
    # Store identifier
    int store_id;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CartInterface
    QuoteDataCartExtensionInterface extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Checkout\Api\Data\ShippingInformationInterface
public type CheckoutDataShippingInformationExtensionInterface record {
};

# Interface ShippingInformationInterface
public type CheckoutDataShippingInformationInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface shipping_address;
    # Interface AddressInterface
    QuoteDataAddressInterface billing_address?;
    # Shipping method code
    string shipping_method_code;
    # Carrier code
    string shipping_carrier_code;
    # ExtensionInterface class for @see \Magento\Checkout\Api\Data\ShippingInformationInterface
    CheckoutDataShippingInformationExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type MeActivateBody1 record {
    string confirmationKey;
};

public type VertexaddressvalidationVertexaddressBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

# Interface ShippingInterface
public type QuoteDataShippingInterface record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    # Shipping method
    string method;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingInterface
    QuoteDataShippingExtensionInterface extension_attributes?;
};

# Error details
public type ErrorErrorsItem record {
    # Error message
    string message?;
    # Error parameters list
    ErrorParameters parameters?;
};

# ExtensionInterface class for @see \Magento\RequisitionList\Api\Data\RequisitionListInterface
public type RequisitionListDataRequisitionListExtensionInterface record {
};

public type CustomersResetpasswordBody record {
    # If empty value given then the customer will be matched by the RP token.
    string email;
    string resetToken;
    string newPassword;
};

public type AdminTokenBody1 record {
    string username;
    string password;
};

# Customer interface.
public type CustomerDataCustomerInterface record {
    # Customer id
    int id?;
    # Group id
    int group_id?;
    # Default billing address id
    string default_billing?;
    # Default shipping address id
    string default_shipping?;
    # Confirmation
    string confirmation?;
    # Created at time
    string created_at?;
    # Updated at time
    string updated_at?;
    # Created in area
    string created_in?;
    # Date of birth
    string dob?;
    # Email address
    string email;
    # First name
    string firstname;
    # Last name
    string lastname;
    # Middle name
    string middlename?;
    # Prefix
    string prefix?;
    # Suffix
    string suffix?;
    # Gender
    int gender?;
    # Store id
    int store_id?;
    # Tax Vat
    string taxvat?;
    # Website id
    int website_id?;
    # Customer addresses.
    CustomerDataAddressInterface[] addresses?;
    # Disable auto group change flag.
    int disable_auto_group_change?;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\CustomerInterface
    CustomerDataCustomerExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type CustomersResetpasswordBody1 record {
    # If empty value given then the customer will be matched by the RP token.
    string email;
    string resetToken;
    string newPassword;
};

# Customer address interface.
public type CustomerDataAddressInterface record {
    # ID
    int id?;
    # Customer ID
    int customer_id?;
    # Customer address region interface.
    CustomerDataRegionInterface region?;
    # Region ID
    int region_id?;
    # Country code in ISO_3166-2 format
    string country_id?;
    # Street
    string[] street?;
    # Company
    string company?;
    # Telephone number
    string telephone?;
    # Fax number
    string fax?;
    # Postcode
    string postcode?;
    # City name
    string city?;
    # First name
    string firstname?;
    # Last name
    string lastname?;
    # Middle name
    string middlename?;
    # Prefix
    string prefix?;
    # Suffix
    string suffix?;
    # Vat id
    string vat_id?;
    # If this address is default shipping address.
    boolean default_shipping?;
    # If this address is default billing address
    boolean default_billing?;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\AddressInterface
    CustomerDataAddressExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type ErrorResponse record {
    # Error message
    string message;
    # Errors list
    ErrorErrors errors?;
    # Error code
    int code?;
    # Error parameters list
    ErrorParameters parameters?;
    # Stack trace
    string trace?;
};

public type MinePaymentinformationBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CurrencyInterface
public type QuoteDataCurrencyExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Checkout\Api\Data\TotalsInformationInterface
public type CheckoutDataTotalsInformationExtensionInterface record {
};

public type CartidSetpaymentinformationBody3 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# Error parameters item
public type ErrorParametersItem record {
    # ACL resource
    string resources?;
    # Missing or invalid field name
    string fieldName?;
    # Incorrect field value
    string fieldValue?;
};

# 
public type AmazonPaymentDataQuoteLinkInterface record {
    string id;
    # Amazon order reference id
    string amazon_order_reference_id;
    # Quote id
    int quote_id;
    # Sandbox simulation reference
    string sandbox_simulation_reference;
    # Quote confirmed with amazon
    boolean confirmed;
};

public type CartidSetpaymentinformationBody2 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type CartidSetpaymentinformationBody1 record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type AmazonbillingaddressAmazonorderreferenceidBody record {
    string addressConsentToken;
};

# Interface CartItemInterface
public type QuoteDataCartItemInterface record {
    # Item ID. Otherwise, null.
    int item_id?;
    # Product SKU. Otherwise, null.
    string sku?;
    # Product quantity.
    decimal qty;
    # Product name. Otherwise, null.
    string name?;
    # Product price. Otherwise, null.
    decimal price?;
    # Product type. Otherwise, null.
    string product_type?;
    # Quote id.
    string quote_id;
    # Product option interface
    QuoteDataProductOptionInterface product_option?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CartItemInterface
    QuoteDataCartItemExtensionInterface extension_attributes?;
};

public type CartidPaymentinformationBody4 record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type CartidPaymentinformationBody3 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type CartidPaymentinformationBody5 record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type MineEstimateshippingmethodsBody1 record {
    # The estimate registry id
    int registryId;
};

# ExtensionInterface class for @see \Magento\GiftCard\Api\Data\GiftCardOptionInterface
public type GiftCardDataGiftCardOptionExtensionInterface record {
    string[] giftcard_created_codes?;
};

# ExtensionInterface class for @see \Magento\Company\Api\Data\CompanyCustomerInterface
public type CompanyDataCompanyCustomerExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\AddressInterface
public type QuoteDataAddressExtensionInterface record {
    SalesRuleDataRuleDiscountInterface[] discounts?;
    int gift_registry_id?;
};

# ExtensionInterface class for @see \Magento\RequisitionList\Api\Data\RequisitionListItemInterface
public type RequisitionListDataRequisitionListItemExtensionInterface record {
};

# Interface AddressInterface
public type QuoteDataAddressInterface record {
    # Id
    int id?;
    # Region name
    string region;
    # Region id
    int region_id;
    # Region code
    string region_code;
    # Country id
    string country_id;
    # Street
    string[] street;
    # Company
    string company?;
    # Telephone number
    string telephone;
    # Fax number
    string fax?;
    # Postcode
    string postcode;
    # City name
    string city;
    # First name
    string firstname;
    # Last name
    string lastname;
    # Middle name
    string middlename?;
    # Prefix
    string prefix?;
    # Suffix
    string suffix?;
    # Vat id
    string vat_id?;
    # Customer id
    int customer_id?;
    # Billing/shipping email
    string email;
    # Same as billing flag
    int same_as_billing?;
    # Customer address id
    int customer_address_id?;
    # Save in address book flag
    int save_in_address_book?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\AddressInterface
    QuoteDataAddressExtensionInterface extension_attributes?;
    # Custom attributes values.
    FrameworkAttributeInterface[] custom_attributes?;
};

public type CartidTotalsinformationBody1 record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface addressInformation;
};

public type MineCollecttotalsBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # The carrier code.
    string shippingCarrierCode?;
    # The shipping method code.
    string shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface additionalData?;
};

public type GiftmessageItemidBody record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface giftMessage;
};

public type CustomersPasswordBody record {
    string email;
    string template;
    int websiteId?;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\RegionInterface
public type CustomerDataRegionExtensionInterface record {
};

public type AdminTokenBody record {
    string username;
    string password;
};

public type MineCollecttotalsBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # The carrier code.
    string shippingCarrierCode?;
    # The shipping method code.
    string shippingMethodCode?;
    # Additional data for totals collection.
    QuoteDataTotalsAdditionalDataInterface additionalData?;
};

public type CartidPaymentinformationBody2 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

public type CartidPaymentinformationBody1 record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# Interface ConfigurableItemOptionValueInterface
public type ConfigurableProductDataConfigurableItemOptionValueInterface record {
    # Option SKU
    string option_id;
    # Item id
    int option_value?;
    # ExtensionInterface class for @see \Magento\ConfigurableProduct\Api\Data\ConfigurableItemOptionValueInterface
    ConfigurableProductDataConfigurableItemOptionValueExtensionInterface extension_attributes?;
};

public type CartidSetpaymentinformationBody record {
    string email;
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# Interface CompanyQuoteConfigInterface
public type NegotiableQuoteDataNegotiableQuoteItemInterface record {
    # Quote item id
    int item_id;
    # Quote item original price
    decimal original_price;
    # Quote item original tax amount
    decimal original_tax_amount;
    # Quote item original discount amount
    decimal original_discount_amount;
    # ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteItemInterface
    NegotiableQuoteDataNegotiableQuoteItemExtensionInterface extension_attributes?;
};

# ExtensionInterface class for @see \Magento\AsynchronousOperations\Api\Data\AsyncResponseInterface
public type AsynchronousOperationsDataAsyncResponseExtensionInterface record {
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ShippingInterface
public type QuoteDataShippingExtensionInterface record {
};

public type CustomersIsemailavailableBody record {
    string customerEmail;
    # If not set, will use the current websiteId
    int websiteId?;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\CustomerInterface
public type CustomerDataCustomerExtensionInterface record {
    # Extended customer custom attributes interface.
    CompanyDataCompanyCustomerInterface company_attributes?;
    boolean is_subscribed?;
    string amazon_id?;
    string vertex_customer_code?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CartInterface
public type QuoteDataCartExtensionInterface record {
    QuoteDataShippingAssignmentInterface[] shipping_assignments?;
    # Interface NegotiableQuoteInterface
    NegotiableQuoteDataNegotiableQuoteInterface negotiable_quote?;
    # 
    AmazonPaymentDataQuoteLinkInterface amazon_order_reference_id?;
};

# Customer address region interface.
public type CustomerDataRegionInterface record {
    # Region code
    string region_code;
    # Region
    string region;
    # Region id
    int region_id;
    # ExtensionInterface class for @see \Magento\Customer\Api\Data\RegionInterface
    CustomerDataRegionExtensionInterface extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Catalog\Api\Data\CustomOptionInterface
public type CatalogDataCustomOptionExtensionInterface record {
    # Image Content data interface
    FrameworkDataImageContentInterface file_info?;
};

# ExtensionInterface class for @see \Magento\Bundle\Api\Data\BundleOptionInterface
public type BundleDataBundleOptionExtensionInterface record {
};

# Gift Card Account data
public type GiftCardAccountDataGiftCardAccountInterface record {
    # Cards codes.
    string[] gift_cards?;
    # Cards amount in quote currency.
    decimal gift_cards_amount;
    # Cards amount in base currency.
    decimal base_gift_cards_amount;
    # Cards amount used in quote currency.
    decimal gift_cards_amount_used;
    # Cards amount used in base currency.
    decimal base_gift_cards_amount_used;
    # ExtensionInterface class for @see \Magento\GiftCardAccount\Api\Data\GiftCardAccountInterface
    GiftCardAccountDataGiftCardAccountExtensionInterface extension_attributes?;
};

public type CustomerTokenBody record {
    string username;
    string password;
};

public type MineSetpaymentinformationBody1 record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface paymentMethod;
    # Interface AddressInterface
    QuoteDataAddressInterface billingAddress?;
};

# Error parameters list
public type ErrorParameters ErrorParametersItem[];

# Rule discount Interface
public type SalesRuleDataRuleDiscountInterface record {
    # Discount Data Interface
    SalesRuleDataDiscountDataInterface discount_data;
    # Rule Label
    string rule_label;
    # Rule ID
    int rule_id;
};

public type V1CustomersBody record {
    # Customer interface.
    CustomerDataCustomerInterface customer;
    string password?;
    string redirectUrl?;
};

# Product option interface
public type QuoteDataProductOptionInterface record {
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\ProductOptionInterface
    QuoteDataProductOptionExtensionInterface extension_attributes?;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\TotalsAdditionalDataInterface
public type QuoteDataTotalsAdditionalDataExtensionInterface record {
    GiftMessageDataMessageInterface[] gift_messages?;
};

public type GuestcartsCartidBody record {
    # The customer ID.
    int customerId;
    int storeId;
};

public type CartidItemsBody record {
    # Interface CartItemInterface
    QuoteDataCartItemInterface cartItem;
};

public type CartidTotalsinformationBody record {
    # Interface TotalsInformationInterface
    CheckoutDataTotalsInformationInterface addressInformation;
};

public type CustomersIsemailavailableBody1 record {
    string customerEmail;
    # If not set, will use the current websiteId
    int websiteId?;
};

# Interface PaymentInterface
public type QuoteDataPaymentInterface record {
    # Purchase order number
    string po_number?;
    # Payment method code
    string method;
    # Payment additional details
    string[] additional_data?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\PaymentInterface
    QuoteDataPaymentExtensionInterface extension_attributes?;
};

public type V1RequisitionListsBody record {
    # Interface RequisitionListInterface
    RequisitionListDataRequisitionListInterface requisitionList;
};

# Interface AsyncResponseInterface Temporary data object to give response from webapi async router
public type AsynchronousOperationsDataAsyncResponseInterface record {
    # Bulk Uuid.
    string bulk_uuid;
    # The list of request items with status data.
    AsynchronousOperationsDataItemStatusInterface[] request_items;
    # There errors during processing bulk
    boolean errors;
    # ExtensionInterface class for @see \Magento\AsynchronousOperations\Api\Data\AsyncResponseInterface
    AsynchronousOperationsDataAsyncResponseExtensionInterface extension_attributes?;
};

public type CartidEstimateshippingmethodsbyaddressidBody record {
    # The estimate address id
    int addressId;
};

# ExtensionInterface class for @see \Magento\GiftCardAccount\Api\Data\GiftCardAccountInterface
public type GiftCardAccountDataGiftCardAccountExtensionInterface record {
};

public type CartidSelectedpaymentmethodBody record {
    # Interface PaymentInterface
    QuoteDataPaymentInterface method;
};

public type CartidGiftcardsBody record {
    # Gift Card Account data
    GiftCardAccountDataGiftCardAccountInterface giftCardAccountData;
};

public type CartidBillingaddressBody record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
    boolean useForShipping?;
};

public type CartidEstimateshippingmethodsBody5 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\CartItemInterface
public type QuoteDataCartItemExtensionInterface record {
    SalesRuleDataRuleDiscountInterface[] discounts?;
    # Interface CompanyQuoteConfigInterface
    NegotiableQuoteDataNegotiableQuoteItemInterface negotiable_quote_item?;
};

public type CartidEstimateshippingmethodsBody4 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

# Interface NegotiableQuoteInterface
public type NegotiableQuoteDataNegotiableQuoteInterface record {
    # Negotiable quote ID.
    int quote_id;
    # Is regular quote.
    boolean is_regular_quote;
    # Negotiable quote status.
    string status;
    # Negotiated price type.
    int negotiated_price_type;
    # Negotiated price value.
    decimal negotiated_price_value;
    # Proposed shipping price.
    decimal shipping_price;
    # Negotiable quote name.
    string quote_name;
    # Expiration period.
    string expiration_period;
    # Email notification status.
    int email_notification_status;
    # Has unconfirmed changes.
    boolean has_unconfirmed_changes;
    # Shipping tax changes.
    boolean is_shipping_tax_changed;
    # Customer price changes.
    boolean is_customer_price_changed;
    # Quote notifications.
    int notifications;
    # Quote rules.
    string applied_rule_ids;
    # Is address draft.
    boolean is_address_draft;
    # Deleted products sku.
    string deleted_sku;
    # Quote creator id.
    int creator_id;
    # Quote creator type.
    int creator_type;
    # Quote original total price.
    decimal original_total_price?;
    # Quote original total price in base currency.
    decimal base_original_total_price?;
    # Quote negotiated total price.
    decimal negotiated_total_price?;
    # Quote negotiated total price in base currency.
    decimal base_negotiated_total_price?;
    # ExtensionInterface class for @see \Magento\NegotiableQuote\Api\Data\NegotiableQuoteInterface
    NegotiableQuoteDataNegotiableQuoteExtensionInterface extension_attributes?;
};

public type CartsMineBody record {
    # Interface CartInterface
    QuoteDataCartInterface quote;
};

public type CartidGiftmessageBody1 record {
    # Interface MessageInterface
    GiftMessageDataMessageInterface giftMessage;
};

public type CartidEstimateshippingmethodsBody3 record {
    # The estimate registry id
    int registryId;
};

public type CartidShippinginformationBody3 record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface addressInformation;
};

# ExtensionInterface class for @see \Magento\Customer\Api\Data\AddressInterface
public type CustomerDataAddressExtensionInterface record {
};

public type CartidShippinginformationBody1 record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface addressInformation;
};

public type CartidShippinginformationBody2 record {
    # Interface ShippingInformationInterface
    CheckoutDataShippingInformationInterface addressInformation;
};

public type MePasswordBody1 record {
    string currentPassword;
    string newPassword;
};

public type CartidEstimateshippingmethodsBody2 record {
    # The estimate registry id
    int registryId;
};

# ExtensionInterface class for @see \Magento\Quote\Api\Data\ProductOptionInterface
public type QuoteDataProductOptionExtensionInterface record {
    CatalogDataCustomOptionInterface[] custom_options?;
    BundleDataBundleOptionInterface[] bundle_options?;
    ConfigurableProductDataConfigurableItemOptionValueInterface[] configurable_item_options?;
    # Downloadable Option
    DownloadableDataDownloadableOptionInterface downloadable_option?;
    # Interface GiftCardOptionInterface
    GiftCardDataGiftCardOptionInterface giftcard_item_option?;
};

public type CartidEstimateshippingmethodsBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

public type MeActivateBody record {
    string confirmationKey;
};

public type VertexaddressvalidationVertexaddressBody1 record {
    # Interface AddressInterface
    QuoteDataAddressInterface address;
};

# Interface CurrencyInterface
public type QuoteDataCurrencyInterface record {
    # Global currency code
    string global_currency_code?;
    # Base currency code
    string base_currency_code?;
    # Store currency code
    string store_currency_code?;
    # Quote currency code
    string quote_currency_code?;
    # Store currency to base currency rate
    decimal store_to_base_rate?;
    # Store currency to quote currency rate
    decimal store_to_quote_rate?;
    # Base currency to global currency rate
    decimal base_to_global_rate?;
    # Base currency to quote currency rate
    decimal base_to_quote_rate?;
    # ExtensionInterface class for @see \Magento\Quote\Api\Data\CurrencyInterface
    QuoteDataCurrencyExtensionInterface extension_attributes?;
};

# Interface MessageInterface
public type GiftMessageDataMessageInterface record {
    # Gift message ID. Otherwise, null.
    int gift_message_id?;
    # Customer ID. Otherwise, null.
    int customer_id?;
    # Sender name.
    string sender;
    # Recipient name.
    string recipient;
    # Message text.
    string message;
    # ExtensionInterface class for @see \Magento\GiftMessage\Api\Data\MessageInterface
    GiftMessageDataMessageExtensionInterface extension_attributes?;
};
