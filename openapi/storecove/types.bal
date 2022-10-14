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

public type LegalEntity record {
    *LegalEntityUpdate;
    PeppolIdentifier[] peppol_identifiers?;
};

# The invoice to send.  Provide either invoice, or invoiceData, but not both.
public type Invoice record {
    # The buyer's accounting cost centre for this invoice, expressed as text.
    @constraint:String {minLength: 1}
    string accountingCost?;
    # The customer receiving the invoice.
    AccountingCustomerParty accountingCustomerParty;
    # The party sending the invoice. Most data for the AccountingSupplierParty is taken from the Storecove database, where your sender identity resides and has been validated. However, we provide a limited number of fields here that you can specify on an invoice-by-invoice basis.
    AccountingSupplierParty accountingSupplierParty?;
    # An array of allowance charges.
    AllowanceCharge[] allowanceCharges?;
    # amountIncludingVat is important because of rounding differences. In many invoices, the sum of the line item amounts excluding VAT and the VAT amounts is not equal to first summing the line items without VAT, and then applying VAT. The difference is automatically calculated and included in the electronic invoice, so the receiving accounting package can process the electronic invoice without problems.
    decimal amountIncludingVat;
    # A reference to a commercial invoice or corrective invoice of which the current invoice is a correction. This field is mandatory when sending invoiceType 384.
    string billingReference?;
    # A reference provided by the buyer used for internal routing of the document.
    string buyerReference?;
    # Whether or not to process the invoice in consumer tax mode. In this mode, the VAT identifier of the sender will not be the default VAT identifier, but the one that matches with the country of the receiving consumer, if that additional VAT identifier for that country is available. These additional VAT identifiers need to be added to the sending LegalEntity by Storecove, so if you need to send invoices in this mode, please contact us.
    boolean consumerTaxMode = false;
    # A reference to a contract or framework agreement that this invoice relates to.
    string contractDocumentReference?;
    # Delivery details.
    Delivery delivery?;
    # The ISO 4217 currency code.
    CurrencyCode documentCurrencyCode?;
    # Format: yyyy-mm-dd.
    string dueDate?;
    # An array of invoice lines.
    @constraint:Array {minLength: 1}
    InvoiceLine[] invoiceLines;
    # The invoice number you assigned to the invoice. The invoiceNumber should be unique for the legalEntityId and year of the issueDate. This means invoice numbers can be reused in different years, as is customary in some countries.
    @constraint:String {minLength: 1}
    string invoiceNumber;
    # The period (or specific date) to which the invoice applies. Format: yyyy-mm-dd - yyyy-mm-dd.
    string invoicePeriod?;
    # Do not use. This field is available for legacy reasons only. If you want to send a regular invoice (aka UBL type '380'), make sure you have a positive invoice amount. For a credit note (aka UBL type '381'), simply provide a negative invoice amount. If you, in addition to a negative invoice amount, also specify a billingReferences, your invoice will become a corrective invoice (aka UBL type '384'). If your invoice is not sent in the UBL syntax, Storecove will provide the appropriate type for the syntax the invoice is sent in.
    string invoiceType = "380";
    # Format: yyyy-mm-dd.
    string issueDate;
    # A note to add to the invoice
    string note?;
    # A reference to an order for this invoice, assigned by the buyer. Note that this often is a key field, since many receivers of invoices will use this field to automatically match the invoice to an order they placed. Many receivers refuse invoices that cannot be automatically matched, in particular government agencies. So it is highly recommended to fill this field whenever possible.
    string orderReference?;
    # An array of payment means (ways to pay the invoice).
    PaymentMeans[] paymentMeansArray?;
    # DEPRECATED. Use paymentMeansArray. The BIC (Swift) of the bank where the amount payable should be transferred to
    string paymentMeansBic?;
    # DEPRECATED. Use paymentMeansArray. How the invoice has been / will be paid. Use only online_payment_service (payment will be made or has been made by an online payment service), bank_card (e.g. debit card, credit card), direct_debit (the amount has been / will be taken out of the client's bank account), standing_agreement (an unspecified payment means known to both buyer and seller) or credit_transfer (the buyer will do / has done a bank transfer). The numeric codes are for legacy purposes, they should not be used.
    string paymentMeansCode?;
    # DEPRECATED. Use paymentMeansArray. The IBAN the amount payable should be transferred to
    string paymentMeansIban?;
    # DEPRECATED. Use the paymentId in the individual PaymentMeans object. The payment id that you will use to match the payment against the invoice.
    string paymentMeansPaymentId?;
    # The payment terms of the invoice.
    ThePaymentTerms paymentTerms?;
    # The amount already paid.
    decimal prepaidAmount?;
    # Information about the project this invoice relates to.
    string projectReference?;
    # A reference to an order for this invoice, assigned by the seller.
    string salesOrderId?;
    # DEPRECATED. Use Tax/category and specify this per invoice line. If you do specify this field, it will be applied to all invoice lines and it is an error to specify a Tax/category at the invoice line level. This field holds the reason no tax is present in the invoice. Note that this is an invoice level field and you cannot specify it per invoice line. This field is mandatory unless tax is present in the invoice.
    string taxExemptReason?;
    # The tax date is the date on which the supply of goods or of services was made or completed or the date on which the payment on account was made insofar as that date can be determined and differs from the date of the issue of the invoice. EU 2006-112 Article 226 Point 7. Note: For the Dutch TAX authorities the tac date should be the same as the issue date.
    string taxPointDate?;
    # An array of tax subtotals. This element is mandatory for taxSystem 'tax_line_percentages'.
    TaxSubtotal[] taxSubtotals?;
    # The tax system used for the invoice. The system 'tax_line_percentages' is preferred, but for historic purposes 'tax_line_amounts is supported and default. Since not all invoice formats that we are required to send support 'tax_line_amounts' we will need to convert the invoice to the 'tax_line_percentags' system if we are forced to send the invoice in that tax system.
    string taxSystem = "tax_line_amounts";
    # An array of ubl extensions.
    string[] ublExtensions?;
    # DEPRECTATED. Use taxExemptReason.
    boolean vatReverseCharge = false;
};

# The address
public type Address record {
    # The name of the city. Mandatory in most countries.
    @constraint:String {minLength: 2}
    string city?;
    # An ISO 3166-1 alpha-2 country code.
    Country country;
    # An optional county name.
    string county?;
    # The street name and number. Mandatory in most countries.
    @constraint:String {minLength: 2}
    string street1?;
    # The second street field. Use this if you used the first field for the building name.
    string street2?;
    # The zipcode/postalzone. Mandatory unless the country does not have zip codes.
    @constraint:String {minLength: 2}
    string zip?;
};

# The details of the delivery associated with this invoice.
public type PurchaseinvoiceDelivery record {
    # The actual delivery date.
    string actual_date?;
    # The location the goods/services were delivered to.
    Location location?;
    # The party the goods/services were delivered to.
    PurchaseinvoiceParty party?;
};

public type PurchaseInvoiceAttachment record {
    # The attachment content type (mime type).
    string content_type?;
    # The Base64 encoded document attachment.
    string document?;
};

public type PurchaseInvoiceUbl record {
    # Used for accountants. The id you specified for the organization.
    string external_key?;
    # Used for the embedded portal retrieval service. The external_user_id you provided when the ShopAccount was created.
    string external_user_id?;
    # The GUID of the invoice
    string guid?;
    # The id of the LegalEntity the invoice was received for.
    int legal_entity_id?;
    # Whether or not the document image (PDF) was generated by Storecove. If true, it means the invoice was received without any attachments and Storecove generated one for you. If false, the invoice will contain at least one attachment, which was received from the invoice sender.
    boolean system_generated_primary_image?;
    # The tax system of the invoice. Either tax_line_percentages or tax_line_amounts. The first tax system means the invoice lines contain only the tax percentages and the tax amounts are included only in the tax subtotals at the invoice level and so are only calculated at the invoice level. The tax system tax_line_amounts means that in addition to the percentage, each invoice line also contains the tax amount.
    string tax_system?;
    # The Base64 encoded UBL invoice.
    string ubl?;
};

public type AdministrationCreate record {
    # The email address to send the received document to
    @constraint:String {maxLength: 128, minLength: 5}
    string email?;
    # The LegalEntity the Administration belongs to.
    int legal_entity_id?;
    # The version of the package.
    string package_version?;
    # How to package the purchase invoice.
    string packaging?;
    # The id of the SenderEmailIdentity. If not provided, the Storecove default sender will be used
    int sender_email_identity_id?;
};

public type AllowanceCharge record {
    # The amount for the allowance or charge, excluding VAT
    decimal amountExcludingVat;
    # The reason for the allowance or charge, free text
    string reason = "Agreed settlement";
    # Do not use. Contact Storecove first if you want to use this field.
    string reasonCode?;
    # Tax
    Tax tax;
    # An array of taxes, duties and fees for this allowance or charge. At this moment, only a single Tax item is allowed. When used, the 'tax' element must be empty.
    @constraint:Array {maxLength: 1}
    Tax[] taxes_duties_fees?;
};

# The different ways to send the invoice to the recipient. The publicIdentifiers are used to send via the Peppol network, if the recipient is not registered on the Peppol network, the invoice will be sent to the email addresses in the emails property. This property is only mandatory when sending the invoice data using the <<_openapi_invoice>> property, not when sending using the <<_openapi_invoicedata>> property, in which case this information will be extracted from the <<_openapi_invoicedata>> object. If you do specify an <<_openapi_invoicerecipient>> object and an <<_openapi_invoicedata>> object, the data from the two will be merged.
public type InvoiceRecipient record {
    # The email addresses the invoice should be sent to if none of the other identifiers can be used
    string[] emails?;
    # A list of public identifiers that uniquely identify this customer.
    PublicIdentifiers publicIdentifiers?;
};

# A document attachment to the invoice.
public type Attachment record {
    # The base64 encoded version of the document attachment.
    @constraint:String {minLength: 5}
    string document;
    # The name of the file attachment.
    string filename?;
    # The document attachment mime type. Currently only application/pdf is allowed.
    string mimeType;
    # Whether or not this document is a visual representation of the invoice data.
    boolean primaryImage = false;
};

# Tax
public type Tax record {
    # The amount of tax. Mandatory if taxSystem == 'tax_line_amounts'. However, it is best to use taxSystem tax_line_percentages and provide only the percentage, not the actual amount. The amount is then provided at the invoice level, in the taxSubtotals element.
    decimal amount?;
    # The optional category code for the tax. This is not mandatory, but highly recommended. If not provided, it will be automatically derived from the country/percentage in combination with the invoice taxPointDate (which defaults to the issueDate), but there are situations in which this fails and the category needs to be specified explicitly. In particular, there are multiple categories available for 0%. The allowed values depend on the country of the tax.
    # ++++
    # <ul><li>AU/NZ:<ul><li>standard (S)</li><li>zero_rated (Z - 0%)</li><li>exempt (E - 0%)</li><li>export (G - 0%)</li><li>outside_scope (O - 0%)</li></ul></li><li>EU:<ul><li>standard (S)</li><li>zero_rated (Z - 0%)</li><li>reverse_charge (AE - 0%)</li><li>intra_community (K - 0%)</li><li>exempt (E - 0%)</li><li>export (G - 0%)</li><li>outside_scope (O - 0%)</li></ul></li><li>SG:<ul><li>standard (SR)</li><li>deemed_supply (DS)</li><li>srca_s (SRCA-S)</li><li>srca_c (SRCA-C - 0%)</li><li>zero_rated (ZR - 0%)</li><li>regulation33_exempt (ES33 - 0%)</li><li>nonregulation33_exempt (ESN33 - 0%)</li><li>outside_scope (OS - 0%)</li><li>not_registered (NG - 0%)</li></ul></li><li>MY:<ul><li>sales_tax (S), also 0%</li><li>sales_tax_work (SW)</li><li>service_tax (SV), also 0%</li><li>service_tax_import (SVI)</li><li>sales_export_market (EEM)</li><li>sales_special_area (ESP)</li><li>sales_designated_area (EDA)</li><li>exemption_schedule_a (ESA)</li><li>exemption_schedule_b (ESB)</li><li>exemption_schedule_c_a (ESC-A)</li><li>exemption_schedule_c_b (ESC-B)</li><li>exemption_schedule_c_c (ESC-C)</li><li>exemption_service_tax (ESV)</li></ul></li></ul>
    # ++++
    string category?;
    # An ISO 3166-1 alpha-2 country code.
    Country country;
    # The percentage Tax. This should be a valid Tax percentage in the country at the time of the issueDate of this invoice. Mandatory if taxSystem == 'tax_line_percentages'
    decimal percentage?;
};

# The customer receiving the invoice.
public type AccountingCustomerParty record {
    # The account id you assigned to the customer.
    string accountId?;
    # A party that can receive or send invoices
    Party party;
    # A list of legal and tax identifiers for this customer.
    PublicIdentifier[] publicIdentifiers?;
};

# An electronic routing identifier.
public type RoutingIdentifier record {
    # The actual identifier.
    @constraint:String {minLength: 1}
    string id?;
    # The scheme of the identifier. See <<_peppol_participant_identifier_list>> for a list.
    @constraint:String {minLength: 3}
    string scheme?;
};

# The ISO 4217 currency code.
public type CurrencyCode string;

public type PurchaseInvoiceInvoiceLine record {
    PurchaseInvoiceAccountingDetails accounting?;
    # DEPRECATED - use allowance_charges.
    decimal allowance_charge?;
    PurchaseInvoiceInvoiceLineAllowanceCharge[] allowance_charges?;
    # The amount excluding Tax. This is equal to quantity x price_amount + ∑ allowance_charges.
    decimal amount_excluding_tax?;
    # DEPRECTATED - use amount_excluding_tax The amount excluding VAT.
    decimal amount_excluding_vat?;
    # The description for the invoice line.
    string description?;
    # The price for one item, excluding VAT.
    decimal price_amount?;
    # The quantity of the item.
    decimal quantity?;
    # The VAT details for the invoice line.
    VatDetails vat?;
};

public type LegalEntityUpdate record {
    # A list of document types to advertise. Use if this LegalEntity needs the ability to receive more than only invoice documents.
    string[] advertisements?;
    # The city.
    @constraint:String {maxLength: 64, minLength: 2}
    string city?;
    # An ISO 3166-1 alpha-2 country code.
    Country country?;
    # County, if applicable
    @constraint:String {maxLength: 64}
    string county?;
    # The Storecove assigned id for the LegalEntity.
    int id?;
    # The first address line.
    @constraint:String {maxLength: 64, minLength: 2}
    string line1?;
    # The second address line, if applicable
    @constraint:String {maxLength: 64}
    string line2?;
    # The name of the company.
    @constraint:String {maxLength: 64, minLength: 2}
    string party_name?;
    # Whether or not this LegalEntity is public. Public means it will be listed in the PEPPOL directory at https://directory.peppol.eu/ which is normally what you want. If you have a good reason to not want the LegalEntity listed, provide false. This property is ignored when for country SG, where it is always true.
    boolean 'public?;
    # The id of the tenant, to be used in case of multi-tenant solutions. This property will included in webhook events.
    @constraint:String {maxLength: 64}
    string tenant_id?;
    # The zipcode.
    @constraint:String {maxLength: 32, minLength: 2}
    string zip?;
};

# An additional property for the item
public type AdditionalItemProperty record {
    # The name of the property.
    @constraint:String {minLength: 1}
    string name;
    # The value of the property.
    string value;
};

public type PurchaseInvoice record {
    PurchaseInvoiceAccountingDetails accounting?;
    # The accounting cost code.
    string accounting_cost?;
    # DEPRECATED - Use the allowance_charges array.
    decimal allowance_charge?;
    PurchaseInvoiceAllowanceCharge[] allowance_charges?;
    # The total invoice amount payable, including tax. This is equal to the sum of the invoice_lines (amount_excluding_tax + tax.amount)
    decimal amount_including_tax?;
    # DEPRECATED - Use amount_including_tax.
    decimal amount_including_vat?;
    PurchaseInvoiceAttachment[] attachments?;
    # Reference to the previous invoice this invoice relates to.
    string billing_reference?;
    # Reference provided by the buyer. Used for routing.
    string buyer_reference?;
    # Reference to the contract.
    string contract_document_reference?;
    # The details of the delivery associated with this invoice.
    PurchaseinvoiceDelivery delivery?;
    # DEPRECTATED. Use the new atatchments array.
    string document?;
    # The ISO 4217 currency for the invoice.
    string document_currency_code?;
    # The date the invoice must be payed by. Format "YYYY-MM-DD".
    string due_date?;
    # Used for accountants. The id you specified for the organization.
    string external_key?;
    # Used for the embedded portal retrieval service. The external_user_id you provided when the ShopAccount was created.
    string external_user_id?;
    # The GUID of the invoice
    string guid?;
    PurchaseInvoiceInvoiceLine[] invoice_lines?;
    # The invoicenumber.
    string invoice_number?;
    # The type of invoice.
    string invoice_type?;
    # The date the invoice was issued. Format "YYYY-MM-DD".
    string issue_date?;
    # The id of the LegalEntity the invoice was received for.
    int legal_entity_id?;
    # The invoice level note.
    string note?;
    # Reference to the order. Used for matching the invoice to an order.
    string order_reference?;
    # The total invoice amount payable including tax. This is equal to amount_including_tax + allowance_charge + payable_rounding_amount. This property is redundant and provided only to make invoice processing easier. You can also choose to only store this property, instead of the underlying fields.
    decimal payable_amount?;
    # The difference between the invoice total and the sum of the invoice lines.
    decimal payable_rounding_amount?;
    # DEPRECATED - Use the new payment_means_array array.
    PaymentMeansDeprecated payment_means?;
    # The different payment means that can be used to pay the invoice.
    PurchaseInvoicePaymentMeans[] payment_means_array?;
    # DEPRECATED - use the payment_id property in the payment_means_array
    string payment_means_payment_id?;
    # A textual description of the payment terms.
    string payment_terms_note?;
    # The end date of the period this invoice relates to. Format "YYYY-MM-DD".
    string period_end?;
    # The start date of the period this invoice relates to. Format "YYYY-MM-DD".
    string period_start?;
    # The amount already paid.
    decimal prepaid_amount?;
    # Reference to the project.
    string project_reference?;
    PurchaseInvoiceSender sender?;
    # The source the invoice was received from.
    string 'source?;
    # Whether or not the document image (PDF) was generated by Storecove. If true, it means the invoice was received without any attachments and Storecove generated one for you. If false, the invoice will contain at least one attachment, which was received from the invoice sender..
    boolean system_generated_primary_image?;
    # The date the invoice was issued for tax purposes. In most countries MUST match the issue_date. Format "YYYY-MM-DD".
    string tax_point_date?;
    PurchaseInvoiceTaxSubtotal[] tax_subtotals?;
    # The tax system of the invoice. Either tax_line_percentages or tax_line_amounts. The first tax system means the invoice lines contain only the tax percentages and the tax amounts are included only in the tax subtotals at the invoice level and so are only calculated at the invoice level. The tax system tax_line_amounts means that in addition to the percentage, each invoice line also contains the tax amount. The tax subtotals at the invoice level are calculated as the sum of the tax of the invoice lines. The distinction between the two tax systems has has implications for rounding.
    string tax_system?;
    # DEPRECATED - This is now part of each invoice line.
    boolean vat_reverse_charge?;
};

# The party the goods/services were delivered to.
public type PurchaseinvoiceParty record {
    # The name of the deliveyr party.
    string name?;
};

# A list of public identifiers that uniquely identify this customer.
public type PublicIdentifiers PublicIdentifier[];

public type PurchaseInvoiceSender record {
    PurchaseInvoiceSenderBillingContact billing_contact?;
    # The city.
    string city?;
    # The country.
    string country?;
    # The county.
    string county?;
    # The department who sent the invoice.
    string department?;
    # The array of identifiers for this sender.
    PeppolIdentifier[] identifiers?;
    # The address
    string line1?;
    # The address, line 2
    string line2?;
    # The party who sent the invoice.
    string party_name?;
    PeppolIdentifier peppol_identifiers?;
    # The zip code.
    string zip?;
};

# Location
public type DeliveryLocation record {
    # The address
    Address address?;
    # The location identifier.
    @constraint:String {minLength: 2}
    string id?;
    # The schemeAgencyId of the location identifier (e.g. 'ZZZ')
    string schemeAgencyId?;
    # The schemeId of the location identifier (e.g. 'EAN')
    string schemeId?;
};

# A document to send, in base64 encoded format.
public type RawDocumentData record {
    # The base64 encoded version of the document.
    @constraint:String {minLength: 5}
    string document;
    # The document type id of the document. Required when parse == false.
    string documentTypeId?;
    # *** NOTE: only parse == true is currently supported *** *** NOTE: parsing is only supported for documentType == 'invoice' *** Whether or not to parse the document. If true, the data will be extracted from the document and used to construct a new document. If false, the document will be sent as is. In this case, you must ensure the document validates without any errors against the relevant validation artifacts for that processId/documentTypeId. We automatically apply updates of the validation artificats, respecting the grace period provided by the issuer. During that period, documents that validate against either the old as well as against the new artifacts are accepted. After the grace period, your document must validate against the new artifacts. You are also responsible for making sure your receiver is able to receive the updated document.
    boolean parse = true;
    # How to parse the document. Only needed when parse == true.
    string parseStrategy?;
    # The process id of the document. Required when parse == false.
    string processId?;
};

# A public identifier for this customer.
public type PublicIdentifier record {
    # The actual identifier.
    @constraint:String {minLength: 1}
    string id;
    # The scheme of the identifier. See <<_peppol_participant_identifier_list>> for a list.
    @constraint:String {minLength: 3}
    string scheme;
};

public type PurchaseInvoiceTaxSubtotal record {
    # The amount excluding tax.
    decimal amount_excluding_tax?;
    # DEPRECATED - use amount_excluding_tax.
    string amount_excluding_vat?;
    PurchaseInvoiceTax tax?;
    # DEPRECATED - Use tax.
    PurchaseInvoiceVat vat?;
};

# Represents invoice line.
public type InvoiceLine record {
    # The buyer's accounting cost centre for this invoice line, expressed as text.
    @constraint:String {minLength: 1}
    string accountingCost?;
    # An array of additional item properties.
    @constraint:Array {minLength: 1}
    AdditionalItemProperty[] additionalItemProperties?;
    # The discount or surcharge on this item. Should be negative for discounts
    decimal allowanceCharge?;
    # The amount excluding VAT. Should equal quantity x itemPrice + allowanceCharge.
    decimal amountExcludingVat;
    # The ID the buyer assigned to this item.
    @constraint:String {minLength: 1}
    string buyersItemIdentification?;
    # Delivery details.
    Delivery delivery?;
    # The description for this invoice line.
    @constraint:String {minLength: 1}
    string description?;
    # The period (or specific date) to which the invoice line applies. Format: yyyy-mm-dd - yyyy-mm-dd.
    string invoicePeriod?;
    # The price per item (may be fractional)
    decimal itemPrice = 1;
    # The id for this invoice line.
    @constraint:String {minLength: 1}
    string lineId?;
    # A short name for this invoice line. If not provided, it will be taken from description and description will be set to an emtpy string.
    @constraint:String {minLength: 1}
    string name?;
    # A reference to the ID of the order. The order is specified as the orderReference at the invoice level. It is not possible to specify an orderReference at the invoice line level. An invoice MUST at this time be for a single order only.
    @constraint:String {minLength: 1}
    string orderLineReferenceLineId?;
    # The number of items (may be fractional).
    decimal quantity = 1;
    # The unit of measure that applies to the invoiced quantity. Codes for unit of packaging from UNECE Recommendation No. 21 can be used in accordance with the descriptions in the "Intro" section of UN/ECE Recommendation 20, Revision 11 (2015): The 2 character alphanumeric code values in UNECE Recommendation 21 shall be used. To avoid duplication with existing code values in UNECE Recommendation No. 20, each code value from UNECE Recommendation 21 shall be prefixed with an “X”, resulting in a 3 alphanumeric code when used as a unit of measure. Note that the following additionally allowed codes are deprecated and will be converted to C62: 04, 05, 08, 16, 17, 18, 19, 26, 29, 30, 31, 32, 36, 43, 44, 45, 46, 47, 48, 53, 54, 62, 63, 64, 66, 69, 71, 72, 73, 76, 78, 84, 90, 92, 93, 94, 95, 96, 97, 98, 1A, 1B, 1C, 1D, 1E, 1F, 1G, 1H, 1J, 1K, 1L, 1M, 1X, 2V, 2W, 3E, 3G, 3H, 3I, 4A, 4B, 4E, 5C, 5F, 5G, 5H, 5I, 5K, 5P, 5Q, A1, A25, A50, A51, A52, A57, A58, A60, A61, A62, A63, A64, A65, A66, A67, A77, A78, A79, A80, A81, A82, A83, AJ, AM, AP, AR, ARE, ATT, AV, AW, B0, B2, B36, B37, B38, B39, B40, B5, B51, B6, B65, B9, BD, BE, BG, BH, BJ, BK, BL, BO, BR, BT, BW, BX, BZ, C1, C2, C4, C5, C6, C77, C98, CA, CH, CJ, CK, CL, CO, CQ, CR, CS, CT, CU, CV, CY, CZ, D14, D28, D35, D37, D38, D39, D40, D64, D66, D67, D7, D70, D71, D72, D75, D76, D79, D8, D9, D90, D92, D96, D97, D98, D99, DC, DE, DI, DQ, DR, DRM, DS, DU, DX, DY, E2, E3, E5, EC, EP, EV, F1, F9, FB, FD, FE, FG, FM, G7, GC, GD, GH, GK, GN, GRT, GT, GW, GY, GZ, H1, H2, HAR, HD, HE, HF, HI, HJ, HK, HL, HN, HO, HP, HS, HT, HY, IC, IF, II, IL, IM, IP, IT, JB, JG, JO, JR, K5, KD, KF, KG, KS, KTM, LC, LE, LI, LJ, LX, M0, MA, MF, MK, MQ, MT, MV, N2, NB, NBB, NC, ND, NE, NG, NH, NI, NJ, NN, NPL, NPR, NQ, NR, NRL, NTT, NV, NY, OP, OZ, P0, P3, P4, P6, P7, P8, P9, PA, PB, PE, PF, PG, PK, PL, PM, PN, PT, PU, PV, PW, PY, PZ, QD, QH, QK, QT, R4, RA, RD, RG, RK, RL, RN, RO, RS, RU, S5, S6, S7, S8, SA, SD, SE, SHT, SK, SL, SN, SO, SP, SS, SST, ST, SV, T1, T4, T5, T6, T7, T8, TA, TC, TD, TE, TF, TJ, TK, TL, TN, TQ, TR, TS, TSD, TSH, TT, TU, TV, TW, TY, UA, UD, UE, UF, UH, UM, VI, VQ, VS, W4, WH, WI, WR, WW, YL, YT, Z1, Z2, Z3, Z4, Z5, Z6, Z8
    string quantityUnitCode = "C62";
    # The ID the seller assigned to this item.
    @constraint:String {minLength: 1}
    string sellersItemIdentification?;
    # Standardized ID for the item.
    @constraint:String {minLength: 1}
    string standardItemIdentification?;
    # The scheme agency for the standardized ID for the item.
    @constraint:String {minLength: 1}
    string standardItemIdentificationSchemeAgencyId = "9";
    # The scheme for the standardized ID for the item.
    @constraint:String {minLength: 1}
    string standardItemIdentificationSchemeId = "GTIN";
    # Tax
    Tax tax?;
    # An array of taxes, duties and fees for this invoice line. At this moment, only a single Tax item is allowed. When used, the 'tax' element must be empty.
    @constraint:Array {maxLength: 1}
    Tax[] taxes_duties_fees?;
};

# The invoice you want Storecove to process, with some meta-data.
public type InvoiceSubmission record {
    # An array of attachments. You may provide up to 10 attchments, but the total size must not exceed 10MB after Base64 encoding.
    @constraint:Array {maxLength: 10}
    Attachment[] attachments?;
    # Whether or not to create a primary image (PDF) if one is not provided.
    boolean createPrimaryImage?;
    # DEPRECATED. Use attachments.
    string document?;
    # DEPRECATED. Use attachments.
    string documentUrl?;
    # A guid that you generated for this InvoiceSubmission to achieve idempotency. If you submit multiple documents with the same idempotencyGuid, only the first one will be processed.
    @constraint:String {maxLength: 36, minLength: 36}
    string idempotencyGuid?;
    # The invoice to send.  Provide either invoice, or invoiceData, but not both.
    Invoice invoice?;
    # The invoice to send, in base64 encoded format. Provide either invoice, or invoiceData, but not both.
    InvoiceData invoiceData?;
    # The different ways to send the invoice to the recipient. The publicIdentifiers are used to send via the Peppol network, if the recipient is not registered on the Peppol network, the invoice will be sent to the email addresses in the emails property. This property is only mandatory when sending the invoice data using the <<_openapi_invoice>> property, not when sending using the <<_openapi_invoicedata>> property, in which case this information will be extracted from the <<_openapi_invoicedata>> object. If you do specify an <<_openapi_invoicerecipient>> object and an <<_openapi_invoicedata>> object, the data from the two will be merged.
    InvoiceRecipient invoiceRecipient?;
    # The id of the LegalEntity this invoice should be sent for.
    int legalEntityId?;
    # DEPRECATED. Use legalEntityId
    int legalSupplierId?;
    # DEPRECATED.
    string mode?;
    # The different ways to send the invoice to the recipient. The publicIdentifiers are used to send via the Peppol network, if the recipient is not registered on the Peppol network, the invoice will be sent to the email addresses in the emails property. This property is only mandatory when sending the invoice data using the <<_openapi_invoice>> property, not when sending using the <<_openapi_invoicedata>> property, in which case this information will be extracted from the <<_openapi_invoicedata>> object. If you do specify an <<_openapi_invoicerecipient>> object and an <<_openapi_invoicedata>> object, the data from the two will be merged.
    Routing routing?;
    # DEPRECATED.
    int supplierId?;
};

# DEPRECATED - Use tax.
public type PurchaseInvoiceVat record {
    # The VAT country.
    string amount?;
    # The VAT percentage.
    string percentage?;
};

# A participant to be discovered.
public type DiscoverableParticipant record {
    # An array of document types to discover. The default is '["invoice", "creditnote"]'
    string[] documentTypes?;
    # The actual identifier.
    @constraint:String {minLength: 1}
    string identifier;
    # The meta scheme of the identifier. For Peppol this is always 'iso6523-actorid-upis'.
    @constraint:String {minLength: 3}
    string metaScheme = "iso6523-actorid-upis";
    # The network to check. Currently only 'peppol' is supported.
    @constraint:String {minLength: 3}
    string network = "peppol";
    # The scheme of the identifier. See <<_peppol_participant_identifier_list>> for a list.
    @constraint:String {minLength: 3}
    string scheme;
};

public type PurchaseInvoiceTax record {
    # The tax element.
    PurchaseInvoiceTaxElement tax?;
};

# A PaymentMeans is a way to pay the invoice.
public type PaymentMeans record {
    # The account number.
    string account?;
    # The bank branch code. Not required for IBAN numbers. Often referred to as Swift or Bic code.
    string branche_code?;
    # How the invoice has been / will be paid. The code determines which type of PaymentMeans is used and which fields are mandatory.
    # ++++
    # <ul>    <li>        <strong>credit_transfer</strong><br/>        The amount is to be transfered into a bank account. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The account number. For New Zealand, this should hold the full 16 digit bank account number. <strong>Mandatory</strong>.            </li>            <li>                <strong>branche_code</strong><br/>                In case of an IBAN, the account alone number is sufficient. In other cases, like a BBAN, a BIC code or other additional identifier is required. For Australia, the BSB goes here. Optional.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>    </li>    <br/>    <li>        <strong>direct_debit</strong><br/>        Direct debit. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The account number from which the funds will be debited. <strong>Mandatory</strong>.            </li>            <li>                <strong>mandate</strong><br/>                The direct debit mandate id. Optional.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>    </li>    <br/>    <li>        <strong>card, bank_card (bank_card is deprecated)</strong><br/>        E.g. credit or debit card. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The card number, but never more than the last four digits. <strong>Mandatory</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>            <li>                <strong>network</strong><br/>                The payment network, e.g. VISA, SEPA. Optional, but recommended since a default of "N/A" may be used if not provided.            </li>        </ul>    </li>    <br/>    <li>        <strong>online_payment_service</strong><br/>        E.g. Paypal. The invoice will have been prepaid. Relevant additional fields:<br/>        <ul>            <li>                <strong>network</strong><br/>                The payment network, e.g. PayPal. <strong>Mandatory</strong>.            </li>        </ul>    </li>    <br/>    <li>        <strong>standing_agreement</strong><br/>        The payment means has been agreed out of band. Relevant additional fields: none.    </li>    <br/>    <li>        <strong>aunz_npp_payid, aunz_npp (aunz_npp is deprecated)</strong><br/>        Australia/New Zealand New Payments Platform. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                PayID. May be an email address, ABN, mobile phone number etc. <strong>Mandatory</strong>.            </li>        </ul>    </li>    <br/>    <li>        <strong>aunz_npp_payto</strong><br/>        Australia/New Zealand New Payments Platform. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                Account number. <strong>Mandatory</strong>.            </li>            <li>                <strong>mandate</strong><br/>                Mandate/direct debit authority reference/PayTo Agreement. <strong>Mandatory</strong>.            </li>        </ul>    </li>    <br/>    <li>        <strong>aunz_bpay</strong><br/>        Australia/New Zealand New Payments Platform. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                Biller code. <strong>Mandatory</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>    </li>    <br/>    <li>        <strong>aunz_postbillpay</strong><br/>        Australia/New Zealand New Payments Platform. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                Biller code. <strong>Mandatory.</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>    </li>    <br/>    <li>        <strong>aunz_uri</strong><br/>        Australia/New Zealand URI. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                Payment URI. <strong>Mandatory.</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>    </li>    <br/>    <li>        <strong>se_bankgiro</strong><br/>        Swedish Bankgiro. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The account number from which the funds will be debited, 7 or 8 digits. <strong>Mandatory</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>        <br/>    </li>    <br/>    <li>        <strong>se_plusgiro</strong><br/>        Swedish Plusgiro. Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The account number from which the funds will be debited, 2 - 8 digits. <strong>Mandatory</strong>.            </li>            <li>                <strong>holder</strong><br/>                The account holder name. Optional.            </li>        </ul>        <br/>    </li>    <br/>    <li>        <strong>sg_giro</strong><br/>        Singapore GIRO-system (direct debit). Relevant additional fields: none.    </li>    <br/>    <li>        <strong>sg_card</strong><br/>        Singapore CreditCard payment. Relevant additional fields: none.    </li>    <br/>    <li>        <strong>sg_paynow</strong><br/>        Singapore PayNow Corporate.  Relevant additional fields:<br/>        <ul>            <li>                <strong>account</strong><br/>                The UEN, format: UENxxxxxxxxxx. <strong>Mandatory</strong>.            </li>        </ul>    </li></ul>
    # ++++
    string code;
    # The name of the account holder.
    string holder?;
    # The direct debit mandate code.
    string mandate?;
    # The name of the card network, e.g. VISA.
    string network?;
    # The payment id that you will use to match the payment against the invoice.
    string paymentId?;
};

# Identifies the invoice recipient to preflight
public type InvoiceRecipientPreflight record {
    # A list of public identifiers that uniquely identify this customer.
    PublicIdentifiers publicIdentifiers?;
};

public type PurchaseInvoiceAccountingDetails record {
    # The the code of the general ledger account.
    string code?;
    # The name of the list for the code, e.g. "RGS".
    string list?;
    # The version of the list for the code, e.g. "1.1".
    string list_version?;
    # A textual description of the code.
    string name?;
};

public type PurchaseInvoiceSenderBillingContact record {
    # The email of the billing contact.
    string email?;
    # The first name of the billing contact.
    string first_name?;
    # The last name of the billing contact.
    string last_name?;
};

# An ISO 3166-1 alpha-2 country code.
public type Country string;

# A list of electronic routing identifiers. These are the identifiers used on the Peppol network or for other destinations.
public type EIdentifiers RoutingIdentifier[];

public type PurchaseInvoicePaymentMeans record {
    # The account number to which to transfer.
    string account?;
    # The code identifying the bank branch. May contain a BIC/SWIFT or something appropriate for the payment method, such as "NPP" for type NppPaymentMean.
    string branch_code?;
    # The account holder name to which to transfer.
    string holder?;
    # The mandate, used only for type DirectDebitPaymentMean.
    string mandate?;
    # The payment network. Used only for type CardPaymentType.
    string network?;
    # The payment id to use when making the payment. The invoice sender will use this to match the received funds to the invoice.
    string payment_id?;
    # The type of payment means. Which type are returned is determined by the &pmv= query parameter. For details see documentation for that field.
    string 'type?;
};

# The result of preflighting an invoice recipient
public type PreflightInvoiceRecipientResult record {
    # The result code of the preflight request
    string code?;
};

# A public identifier for this customer.
public type DiscoveredParticipant record {
    # The response code.
    string code?;
    # Whether or not an 'OK' response means the document will be sent via Peppol, but delivered by email. This happens in the Belgian Hermes system where all identifiers have been registered, but if the receiver hasn't registered with a service provider, the Hermes system will send a PDF created from the electronic invoice and email that. The electronic document will itself not be emailed. Also see https://einvoice.belgium.be/en/article/send-structured-invoices-all-your-customers-hermes[Hermes^].
    boolean email?;
};

# The payment terms of the invoice.
public type ThePaymentTerms record {
    # The note for the payment terms.
    string note?;
};

# The VAT details for the invoice line.
public type VatDetails record {
    # The amount of VAT for the invoice line.
    decimal amount?;
    # The ISO 3166 country of the VAT for the invoice line.
    string country?;
    # The percentage of VAT for the invoice line.
    decimal percentage?;
};

public type AdministrationUpdate record {
    # The email address to send the received document to
    @constraint:String {maxLength: 128, minLength: 5}
    string email?;
    # The version of the package.
    string package_version?;
    # How to package the purchase invoice.
    string packaging?;
    # The id of the SenderEmailIdentity. If not provided, the Storecove default sender will be used
    int sender_email_identity_id?;
};

# The party sending the invoice. Most data for the AccountingSupplierParty is taken from the Storecove database, where your sender identity resides and has been validated. However, we provide a limited number of fields here that you can specify on an invoice-by-invoice basis.
public type AccountingSupplierParty record {
    # A party that can send invoices
    SupplierParty party?;
};

public type LegalEntityCreate record {
    # A list of document types to advertise. Use if this LegalEntity needs the ability to receive more than only invoice documents.
    string[] advertisements = ["invoice"];
    # The city.
    @constraint:String {maxLength: 64, minLength: 2}
    string city;
    # An ISO 3166-1 alpha-2 country code.
    Country country;
    # County, if applicable
    @constraint:String {maxLength: 64}
    string county?;
    # The first address line.
    @constraint:String {maxLength: 64, minLength: 2}
    string line1;
    # The second address line, if applicable
    @constraint:String {maxLength: 64}
    string line2?;
    # The name of the company.
    @constraint:String {maxLength: 64, minLength: 2}
    string party_name;
    # Whether or not this LegalEntity is public. Public means it will be entered into the PEPPOL directory at https://directory.peppol.eu/
    boolean 'public = true;
    # The id of the tenant, to be used in case of multi-tenant solutions. This property will included in webhook events.
    @constraint:String {maxLength: 64}
    string tenant_id?;
    # The zipcode.
    @constraint:String {maxLength: 32, minLength: 2}
    string zip;
};

# The document you want Storecove to send, with some meta-data.
public type DocumentSubmission record {
    # An array of attachments. You may provide up to 10 attchments, but the total size must not exceed 10MB after Base64 encoding.
    @constraint:Array {maxLength: 10}
    Attachment[] attachments?;
    # Whether or not to create a primary image (PDF) if one is not provided.
    boolean createPrimaryImage?;
    # The document to send.
    SendableDocument document?;
    # A guid that you generated for this DocumentSubmission to achieve idempotency. If you submit multiple documents with the same idempotencyGuid, only the first one will be processed and any subsequent ones will trigger an HTTP 422 Unprocessable Entity response.
    @constraint:String {maxLength: 36, minLength: 36}
    string idempotencyGuid?;
    # The id of the LegalEntity this document should be sent on behalf of. Either legalEntityId or receiveGuid is mandatory.
    int legalEntityId?;
    # The GUID that was in the received_invoice webhook. Either legalEntityId or receiveGuid is mandatory.
    string receiveGuid?;
    # The different ways to send the invoice to the recipient. The publicIdentifiers are used to send via the Peppol network, if the recipient is not registered on the Peppol network, the invoice will be sent to the email addresses in the emails property. This property is only mandatory when sending the invoice data using the <<_openapi_invoice>> property, not when sending using the <<_openapi_invoicedata>> property, in which case this information will be extracted from the <<_openapi_invoicedata>> object. If you do specify an <<_openapi_invoicerecipient>> object and an <<_openapi_invoicedata>> object, the data from the two will be merged.
    Routing routing?;
};

# The total amount of tax of this type in the invoice.
public type TaxSubtotal record {
    # The tax category. For a description see <<_openapi_tax>>
    string category?;
    # An ISO 3166-1 alpha-2 country code.
    Country country?;
    # The tax percentage. This should be a valid tax percentage in the country at the time of the taxpointDate of this invoice. Required unless taxAmount is provided.
    decimal percentage?;
    # The amount of tax.
    decimal taxAmount?;
    # The amount on which the tax is levied. Required unless percentage is provided.
    decimal taxableAmount;
};

public type InvoiceSubmissionEvidence record {
    # An array of actions taken to deliver the document.
    InvoiceSubmissionActionEvidence[] actions?;
    # The guid for the InvoiceSubmission.
    string guid?;
    # The overall status for this InvoiceSubmission.
    string status?;
};

# A party that can send invoices
public type SupplierParty record {
    # Contact details for the invoice
    Contact contact?;
};

# The tax element.
public type PurchaseInvoiceTaxElement record {
    # The tax country.
    string amount?;
    # The tax category.
    string category?;
    # The tax category code.
    string category_code?;
    # The tax percentage.
    decimal percentage?;
    # The tax type.
    string 'type?;
};

# A party that can receive or send invoices
public type Party record {
    # The address
    Address address;
    # The name of the company receiving the invoice
    @constraint:String {minLength: 2}
    string companyName;
    # Contact details for the invoice
    Contact contact?;
};

# The invoice response to send.
public type DocumentInvoiceResponse record {
    # A list of clarifications why a received invoice was rejected (RE) or under query (UQ) and what action to take.
    InvoiceResponseClarification[] clarifications?;
    # The date when the status became effective. Format: yyyy-mm-dd.
    string effectiveDate?;
    # A note to add to the invoice reponse
    string note?;
    # The response code. For details see https://docs.peppol.eu/poacc/upgrade-3/codelist/UNCL4343-T111/
    string responseCode;
};

# The invoice to send, in base64 encoded format. Provide either invoice, or invoiceData, but not both.
public type InvoiceData record {
    # How to interpret the document.
    string conversionStrategy?;
    # The base64 encoded version of the document.
    @constraint:String {minLength: 5}
    string document?;
};

# The document to send.
public type SendableDocument record {
    # The type of document to be sent.
    string documentType;
    # The invoice to send.  Provide either invoice, or invoiceData, but not both.
    Invoice invoice?;
    # The invoice response to send.
    DocumentInvoiceResponse invoiceResponse?;
    # A document to send, in base64 encoded format.
    RawDocumentData rawDocumentData?;
};

public type PeppolIdentifierCreate record {
    # The identifier.
    @constraint:String {maxLength: 64, minLength: 2}
    string identifier;
    # The scheme of the identifier. See <<_peppol_participant_identifier_list>> for a list.
    @constraint:String {maxLength: 64, minLength: 2}
    string scheme;
    # The superscheme of the identifier. Should always be "iso6523-actorid-upis".
    @constraint:String {maxLength: 64, minLength: 2}
    string superscheme;
};

public type Administration record {
    # The email address to send the received document to
    @constraint:String {maxLength: 128, minLength: 5}
    string email?;
    # The Storecove assigned id for the Administration.
    int id?;
    # The LegalEntity the Administration belongs to.
    int legal_entity_id?;
    # The version of the package.
    string package_version?;
    # How to package the purchase invoice.
    string packaging?;
    # The id of the SenderEmailIdentity. If not provided, the Storecove default sender will be used
    int sender_email_identity_id?;
};

# The result of a document submission
public type DocumentSubmissionResult record {
    # A (V4) GUID for the document submission
    string guid?;
};

public type PeppolIdentifier record {
    # The identifier.
    @constraint:String {maxLength: 64, minLength: 2}
    string identifier?;
    # The scheme of the identifier. See <<_peppol_participant_identifier_list>> for a list.
    @constraint:String {maxLength: 64, minLength: 2}
    string scheme?;
    # The superscheme of the identifier. Should always be "iso6523-actorid-upis".
    @constraint:String {maxLength: 64, minLength: 2}
    string superscheme?;
};

# The different ways to send the invoice to the recipient. The publicIdentifiers are used to send via the Peppol network, if the recipient is not registered on the Peppol network, the invoice will be sent to the email addresses in the emails property. This property is only mandatory when sending the invoice data using the <<_openapi_invoice>> property, not when sending using the <<_openapi_invoicedata>> property, in which case this information will be extracted from the <<_openapi_invoicedata>> object. If you do specify an <<_openapi_invoicerecipient>> object and an <<_openapi_invoicedata>> object, the data from the two will be merged.
public type Routing record {
    # A list of electronic routing identifiers. These are the identifiers used on the Peppol network or for other destinations.
    EIdentifiers eIdentifiers?;
    # The email addresses the invoice should be sent to if none of the other identifiers can be used
    string[] emails?;
};

# Contact details for the invoice
public type Contact record {
    # Email
    string email?;
    # First name
    string firstName?;
    # Only supported for AccountingCustomerParty
    @constraint:String {maxLength: 20}
    string id?;
    # Last name
    string lastName?;
    # Phone number
    @constraint:String {maxLength: 24}
    string phone?;
};

public type PurchaseInvoiceAllowanceCharge record {
    # The amount excluding tax.
    decimal amount_excluding_tax?;
    # DEPRECATED - use amount_excluding_tax.
    string amount_excluding_vat?;
    # The reason for the allowance or charge.
    string reason?;
    PurchaseInvoiceTax tax?;
    # DEPRECATED - Use tax.
    PurchaseInvoiceVat vat?;
};

# The result of an invoice submission
public type InvoiceSubmissionResult record {
    # A (V4) GUID for the invoice submission
    string guid?;
};

# DEPRECATED - Use the new payment_means_array array.
public type PaymentMeansDeprecated record {
    # The IBAN to which to transfer.
    string iban?;
    # An id to mention in the transfer.
    string id?;
};

public type ErrorModel record {
    string details?;
    string 'source?;
};

public type InvoiceSubmissionActionEvidence record {
    # The response the receiver sent.
    string receiver_response?;
    # The DateTime of the transmission, as defined by RFC 3339, section 5.6, for example, 2017-07-21T17:32:28Z.
    string transmission_datetime?;
    # The result of this transmission.
    string transmission_result?;
    # How the document was transmitted.
    string transmission_type?;
    # The document that was transmitted.
    string transmitted_document?;
};

public type PurchaseInvoiceInvoiceLineAllowanceCharge record {
    # The amount of the allowance or charge.
    decimal amount?;
};

# Delivery details.
public type Delivery record {
    # The actual date of the delivery.
    string actualDate?;
    # Location
    DeliveryLocation location?;
    # The quantity of the delivery.
    decimal quantity?;
};

# A clarification for why a received invoice was rejected (RE) or under query (UQ) and what action to take.
public type InvoiceResponseClarification record {
    # A textual description of the clarification
    string clarification?;
    # The code for the clarification. For details see https://docs.peppol.eu/poacc/upgrade-3/codelist/OPStatusReason/ and https://docs.peppol.eu/poacc/upgrade-3/codelist/OPStatusAction/
    string clarificationCode;
    # The type of the clarification.
    string clarificationCodeType;
};

public type WebhookInstance record {
    # The webhook body that would have been pushed if this were a push-mode webhook.
    string body?;
    # The GUID of the WebhookInstance. Use this to delete it.
    string guid?;
};

# The location the goods/services were delivered to.
public type Location record {
    # Address city.
    string city?;
    # Address country.
    string country?;
    # Address county.
    string county?;
    # Department name.
    string department?;
    # The id of the location.
    string id?;
    # Address line 1.
    string line1?;
    # Address line 2.
    string line2?;
    # The scheme id for the id of the location.
    string scheme_id?;
    # Address zip code
    string zip?;
};
