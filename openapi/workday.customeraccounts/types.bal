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

public type Company record {
    *CompanyDisplay;
};

public type RelatedInvoice record {
    *InstanceModelReference;
};

public type Invoice record {
    *InstanceModelReference;
};

public type TypeRef record {
    *InstanceModelReference;
};

public type Currency record {
    *CurrencyDisplay;
};

public type BillToAddressDisplay record {
    # The subdivision of the region of the bill-to customer.
    string? regionSubdivision1?;
    CountryRegion? countryRegion?;
    # The third address line for the bill-to customer.
    string? addressLine3?;
    # The subdivision of the city of the bill-to customer.
    string? citySubdivision1?;
    # The first address line for the bill-to customer.
    string? addressLine1?;
    # The fourth address line for the bill-to customer.
    string? addressLine4?;
    # The city of the bill-to customer.
    string? city?;
    # The second subdivision of the city of the bill-to customer.
    string? citySubdivision2?;
    Country? country?;
    # The second address line for the bill-to customer.
    string? addressLine2?;
    # The second subdivision of the region of the bill-to customer.
    string? regionSubdivision2?;
    # The postal code of the bill-to customer.
    string? postalCode?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type BillToCustomer record {
    *CustomerDisplay;
};

public type RelatedAdjustmentDisplay record {
    # Id of the instance
    string? id?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
};

public type CurrencyDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};

public type PaymentStatus record {
    *PaymentStatusDisplay;
};

public type PrintRunType record {
    *InstanceModelReference;
};

public type CustomerInvoice record {
    # The date of the customer invoice.
    string? invoiceDate?;
    # The type of customer invoice document, either Invoice or Adjustment.
    string? transactionType?;
    # The tax amount that you withhold from the customer invoice.
    record {} withholdingAmount?;
    Company? company?;
    BillToCustomer? billToCustomer?;
    # A flag when set to true, places the invoices into collections.
    boolean? inCollection?;
    # The total of all invoice line amounts minus the total Tax amount minus the Prepaid Utilization amount. This calculation doesn't deduct the withholding tax. This is the value printed on the customer invoice and can be positive or negative.
    record {} netAmount?;
    # The amount you dispute on a customer invoice.
    record {} disputeAmount?;
    # The amount due for the customer invoice. The value can be positive or negative.
    record {} dueAmount?;
    InvoiceType? invoiceType?;
    # The purchase order number specified on the customer invoice.
    string? poNumber?;
    # Adjustments for a customer Invoice.
    RelatedAdjustmentDisplay[]? relatedAdjustments?;
    AdjustmentReason? adjustmentReason?;
    # The total tax amount for the document with sign.
    record {} taxAmount?;
    # The date you place the customer invoice in dispute.
    string? disputeDate?;
    RelatedInvoice? relatedInvoice?;
    PaymentStatus? paymentStatus?;
    Currency? currency?;
    # The due date of the customer invoice or invoice adjustment as of the defined reporting date.
    string? dueDate?;
    # The memo for the customer invoice.
    string? memo?;
    BillToCustomerAddress? billToCustomerAddress?;
    # True if the invoice is in dispute.
    boolean? inDispute?;
    # The reasons for invoice dispute.
    DisputeReasonDisplay[]? disputeReasons?;
    InvoiceStatus? invoiceStatus?;
    # Total retention amount from invoice lines.
    record {} retentionAmount?;
    # The total amount for the customer invoice including tax. The amount can be positive or negative. When the reporting transaction is not an instance of a customer invoice, the amount value is zero.
    record {} totalAmount?;
    # The customer invoice number.
    string? invoiceNumber?;
    # Id of the instance
    string? id?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
};

public type CountryRegion record {
    *CountryRegionDisplay;
};

public type CustomerGroup record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type FacetsModelReference FacetsModelReferenceInner[]?;

public type MultipleInstanceModelReference record {
    int? total?;
    InstanceModelReference[]? data?;
};

public type RelatedAdjustmentReasonDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type CompanyDisplay record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type CountryDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type CustomerView record {
    # The maximum credit limit for the customer.
    record {} creditLimit?;
    # The name of the customer.
    string? name?;
    # The customer satisfaction score.
    int? satisfactionScore?;
    PaymentTerms? paymentTerms?;
    # The Dun and Bradstreet risk score of the customer.
    int? compositeRiskScore?;
    # The customer group a customer belongs to. A customer can be part of multiple customer groups.
    CustomerGroup[]? groups?;
    # The Dun and Bradstreet Commercial credit score of the customer.
    int? commercialCreditScore?;
    # The primary phone number of the customer.
    string? primaryPhone?;
    # The total customer balance due in the customer currency, as of the report run time. Workday calculates the total balance by adding the amount of all approved and uncanceled customer invoices and subtracting the total amount of all approved and uncanceled customer payments. The customer currency can be the default currency for the tenant, or the currency you define for a given customer.
    record {} totalBalance?;
    Category? category?;
    # Id of the instance
    string? id?;
};

public type BillToCustomerAddress record {
    *BillToAddressDisplay;
};

public type Country record {
    *CountryDisplay;
};

public type ErrorModelReference record {
    # A description of the error
    string? _error;
};

public type CreateCustomerPayment record {
    # A memo associated with the customer payment.
    string? memo?;
    RemitFromCustomer? remitFromCustomer?;
    # True if the customer payment is ready for automatic application for a cash sale.
    boolean? readyToAutoApply?;
    # The reference to a customer payment that's processed through a settlement run. This field is blank when the Payment Status is In Progress or when the Payment Type is Check or ETF.
    string? reference?;
    # The transaction number for the reporting transaction.
    string? transactionNumber?;
    # The amount of the customer payment in transaction currency.
    record {} amount?;
    TypeRef? 'type?;
    # The date the customer payment was made.
    string? date?;
    Company? company?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Category record {
    *InstanceModelReference;
};

public type InvoiceStatusDisplay record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

# collection something or other
public type InlineResponse200 record {
    CustomerInvoice[]? data?;
    int? total?;
};

public type CreateRemittanceDetails record {
    # The amount to pay specified on the invoice line of the customer payment.
    record {} amountToPay?;
    Invoice? invoice?;
    BillToCustomerRef? billToCustomer?;
    # Id of the instance
    string? id?;
};

public type PaymentTerms record {
    *InstanceModelReference;
};

public type InvoiceTypeDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type ViewCustomerPayment record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type CustomerDisplay record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type PDF record {
    *InvoicePDFDisplay;
};

public type DisputeReasonDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string? id;
    # A description of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
};

public type AdjustmentReason record {
    *RelatedAdjustmentReasonDisplay;
};

public type PaymentStatusDisplay record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type CountryRegionDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type DeliveryMethodDisplay record {
    # A preview of the instance
    string? descriptor?;
};

public type ViewRemittanceDetails record {
    # Id of the instance
    string? id?;
};

public type PrintRun record {
    PDF? pdf?;
    # The delivery method associated with the print run of the customer invoice.
    DeliveryMethodDisplay[]? deliveryMethod?;
    # The date when the customer invoice was printed.
    string? printedDateTime?;
    PrintRunType? printRunType?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type InvoiceType record {
    *InvoiceTypeDisplay;
};

public type RemitFromCustomer record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2001 record {
    PrintRun[]? data?;
    int? total?;
};

public type InvoicePDFDisplay record {
    # The name of the PDF file associated with the customer invoice.
    string? name?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2002 record {
    CustomerView[]? data?;
    int? total?;
};

public type BillToCustomerRef record {
    *InstanceModelReference;
};

public type InvoiceStatus record {
    *InvoiceStatusDisplay;
};

# This object represents the possible facets for this resource
public type FacetsModelReferenceInner record {
    # A description of the facet
    string? descriptor?;
    # The alias used to select the facet
    string? facetParameter?;
    # the facet values
    record {
        # The number of instances returned by this facet
        int? count?;
        # wid / id / reference id
        string? id;
        # A description of the facet
        string? descriptor?;
        # A link to the instance
        string? href?;
    }[]? values?;
};
