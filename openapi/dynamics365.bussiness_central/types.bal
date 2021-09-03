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

public type PostItemRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central item entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central item entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central item entity
    string? displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central item entity
    string? 'type?;
    # (v1.0) The itemCategoryId property for the Dynamics 365 Business Central item entity
    string? itemCategoryId?;
    # (v1.0) The itemCategoryCode property for the Dynamics 365 Business Central item entity
    string? itemCategoryCode?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central item entity
    boolean? blocked?;
    # (v1.0) The baseUnitOfMeasureId property for the Dynamics 365 Business Central item entity
    string? baseUnitOfMeasureId?;
    Unitofmeasuretype baseUnitOfMeasure?;
    # (v1.0) The gtin property for the Dynamics 365 Business Central item entity
    string? gtin?;
    # (v1.0) The inventory property for the Dynamics 365 Business Central item entity
    decimal? inventory?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central item entity
    decimal? unitPrice?;
    # (v1.0) The priceIncludesTax property for the Dynamics 365 Business Central item entity
    boolean? priceIncludesTax?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central item entity
    decimal? unitCost?;
    # (v1.0) The taxGroupId property for the Dynamics 365 Business Central item entity
    string? taxGroupId?;
    # (v1.0) The taxGroupCode property for the Dynamics 365 Business Central item entity
    string? taxGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central item entity
    string? lastModifiedDateTime?;
};

public type PatchItemRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central item entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central item entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central item entity
    string? displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central item entity
    string? 'type?;
    # (v1.0) The itemCategoryId property for the Dynamics 365 Business Central item entity
    string? itemCategoryId?;
    # (v1.0) The itemCategoryCode property for the Dynamics 365 Business Central item entity
    string? itemCategoryCode?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central item entity
    boolean? blocked?;
    # (v1.0) The baseUnitOfMeasureId property for the Dynamics 365 Business Central item entity
    string? baseUnitOfMeasureId?;
    Unitofmeasuretype baseUnitOfMeasure?;
    # (v1.0) The gtin property for the Dynamics 365 Business Central item entity
    string? gtin?;
    # (v1.0) The inventory property for the Dynamics 365 Business Central item entity
    decimal? inventory?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central item entity
    decimal? unitPrice?;
    # (v1.0) The priceIncludesTax property for the Dynamics 365 Business Central item entity
    boolean? priceIncludesTax?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central item entity
    decimal? unitCost?;
    # (v1.0) The taxGroupId property for the Dynamics 365 Business Central item entity
    string? taxGroupId?;
    # (v1.0) The taxGroupCode property for the Dynamics 365 Business Central item entity
    string? taxGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central item entity
    string? lastModifiedDateTime?;
};

public type PatchPictureForItemRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content property for the Dynamics 365 Business Central picture entity
    string? content?;
};

public type PostDefaultDimensionsForItemRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchDefaultDimensionsForItemRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchPictureRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content property for the Dynamics 365 Business Central picture entity
    string? content?;
};

public type PostDefaultDimensionsRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchDefaultDimensionsRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PostCustomerRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customer entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central customer entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customer entity
    string displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central customer entity
    string? 'type?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central customer entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central customer entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central customer entity
    string? website?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central customer entity
    boolean? taxLiable?;
    # (v1.0) The taxAreaId property for the Dynamics 365 Business Central customer entity
    string? taxAreaId?;
    # (v1.0) The taxAreaDisplayName property for the Dynamics 365 Business Central customer entity
    string? taxAreaDisplayName?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central customer entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central customer entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central customer entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central customer entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central customer entity
    string? shipmentMethodId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central customer entity
    string? paymentMethodId?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central customer entity
    string? blocked?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customer entity
    string? lastModifiedDateTime?;
};

public type PatchCustomerRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customer entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central customer entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customer entity
    string displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central customer entity
    string? 'type?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central customer entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central customer entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central customer entity
    string? website?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central customer entity
    boolean? taxLiable?;
    # (v1.0) The taxAreaId property for the Dynamics 365 Business Central customer entity
    string? taxAreaId?;
    # (v1.0) The taxAreaDisplayName property for the Dynamics 365 Business Central customer entity
    string? taxAreaDisplayName?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central customer entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central customer entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central customer entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central customer entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central customer entity
    string? shipmentMethodId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central customer entity
    string? paymentMethodId?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central customer entity
    string? blocked?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customer entity
    string? lastModifiedDateTime?;
};

public type PatchPictureForCustomerRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content property for the Dynamics 365 Business Central picture entity
    string? content?;
};

public type PostDefaultDimensionsForCustomerRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchDefaultDimensionsForCustomerRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PostVendorRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central vendor entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central vendor entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central vendor entity
    string? displayName?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central vendor entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central vendor entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central vendor entity
    string? website?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central vendor entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central vendor entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central vendor entity
    string? currencyCode?;
    # (v1.0) The irs1099Code property for the Dynamics 365 Business Central vendor entity
    string? irs1099Code?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central vendor entity
    string? paymentTermsId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central vendor entity
    string? paymentMethodId?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central vendor entity
    boolean? taxLiable?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central vendor entity
    string? blocked?;
    # (v1.0) The balance property for the Dynamics 365 Business Central vendor entity
    decimal? balance?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central vendor entity
    string? lastModifiedDateTime?;
};

public type PatchVendorRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central vendor entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central vendor entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central vendor entity
    string? displayName?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central vendor entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central vendor entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central vendor entity
    string? website?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central vendor entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central vendor entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central vendor entity
    string? currencyCode?;
    # (v1.0) The irs1099Code property for the Dynamics 365 Business Central vendor entity
    string? irs1099Code?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central vendor entity
    string? paymentTermsId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central vendor entity
    string? paymentMethodId?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central vendor entity
    boolean? taxLiable?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central vendor entity
    string? blocked?;
    # (v1.0) The balance property for the Dynamics 365 Business Central vendor entity
    decimal? balance?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central vendor entity
    string? lastModifiedDateTime?;
};

public type PatchPictureForVendorRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content property for the Dynamics 365 Business Central picture entity
    string? content?;
};

public type PostDefaultDimensionsForVendorRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchDefaultDimensionsForVendorRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchCompanyInformationRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central companyInformation entity
    string id?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central companyInformation entity
    string? displayName?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central companyInformation entity
    string? phoneNumber?;
    # (v1.0) The faxNumber property for the Dynamics 365 Business Central companyInformation entity
    string? faxNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central companyInformation entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central companyInformation entity
    string? website?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central companyInformation entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central companyInformation entity
    string? currencyCode?;
    # (v1.0) The currentFiscalYearStartDate property for the Dynamics 365 Business Central companyInformation entity
    string? currentFiscalYearStartDate?;
    # (v1.0) The industry property for the Dynamics 365 Business Central companyInformation entity
    string? industry?;
    # (v1.0) The picture property for the Dynamics 365 Business Central companyInformation entity
    string? picture?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central companyInformation entity
    string? lastModifiedDateTime?;
};

public type PostSalesInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesInvoice entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? externalDocumentNumber?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central salesInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesInvoice entity
    string? dueDate?;
    # (v1.0) The customerPurchaseOrderReference property for the Dynamics 365 Business Central salesInvoice entity
    string? customerPurchaseOrderReference?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesInvoice entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesInvoice entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesInvoice entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesInvoice entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyCode?;
    # (v1.0) The orderId property for the Dynamics 365 Business Central salesInvoice entity
    string? orderId?;
    # (v1.0) The orderNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? orderNumber?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesInvoice entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesInvoice entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesInvoice entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The remainingAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? remainingAmount?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesInvoice entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesInvoice entity
    string? email?;
};

public type PatchSalesInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesInvoice entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? externalDocumentNumber?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central salesInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesInvoice entity
    string? dueDate?;
    # (v1.0) The customerPurchaseOrderReference property for the Dynamics 365 Business Central salesInvoice entity
    string? customerPurchaseOrderReference?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesInvoice entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesInvoice entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesInvoice entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesInvoice entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyCode?;
    # (v1.0) The orderId property for the Dynamics 365 Business Central salesInvoice entity
    string? orderId?;
    # (v1.0) The orderNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? orderNumber?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesInvoice entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesInvoice entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesInvoice entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The remainingAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? remainingAmount?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesInvoice entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesInvoice entity
    string? email?;
};

public type PostSalesInvoiceLineForSalesInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? shipmentDate?;
};

public type PatchSalesInvoiceLineForSalesInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? shipmentDate?;
};

public type PostSalesInvoiceLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? shipmentDate?;
};

public type PatchSalesInvoiceLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? shipmentDate?;
};

public type PostCustomerPaymentJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPaymentJournal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central customerPaymentJournal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountNumber?;
};

public type PatchCustomerPaymentJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPaymentJournal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central customerPaymentJournal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountNumber?;
};

public type PostCustomerPaymentForCustomerPaymentJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPayment entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central customerPayment entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central customerPayment entity
    int? lineNumber?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerPayment entity
    string? customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerPayment entity
    string? customerNumber?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central customerPayment entity
    string? contactId?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central customerPayment entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central customerPayment entity
    decimal? amount?;
    # (v1.0) The appliesToInvoiceId property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceId?;
    # (v1.0) The appliesToInvoiceNumber property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central customerPayment entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central customerPayment entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPayment entity
    string? lastModifiedDateTime?;
};

public type PatchCustomerPaymentForCustomerPaymentJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPayment entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central customerPayment entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central customerPayment entity
    int? lineNumber?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerPayment entity
    string? customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerPayment entity
    string? customerNumber?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central customerPayment entity
    string? contactId?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central customerPayment entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central customerPayment entity
    decimal? amount?;
    # (v1.0) The appliesToInvoiceId property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceId?;
    # (v1.0) The appliesToInvoiceNumber property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central customerPayment entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central customerPayment entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPayment entity
    string? lastModifiedDateTime?;
};

public type PostCustomerPaymentRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPayment entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central customerPayment entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central customerPayment entity
    int? lineNumber?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerPayment entity
    string? customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerPayment entity
    string? customerNumber?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central customerPayment entity
    string? contactId?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central customerPayment entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central customerPayment entity
    decimal? amount?;
    # (v1.0) The appliesToInvoiceId property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceId?;
    # (v1.0) The appliesToInvoiceNumber property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central customerPayment entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central customerPayment entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPayment entity
    string? lastModifiedDateTime?;
};

public type PatchCustomerPaymentRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPayment entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central customerPayment entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central customerPayment entity
    int? lineNumber?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerPayment entity
    string? customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerPayment entity
    string? customerNumber?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central customerPayment entity
    string? contactId?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central customerPayment entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central customerPayment entity
    decimal? amount?;
    # (v1.0) The appliesToInvoiceId property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceId?;
    # (v1.0) The appliesToInvoiceNumber property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central customerPayment entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central customerPayment entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPayment entity
    string? lastModifiedDateTime?;
};

public type PostTaxGroupRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxGroup entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxGroup entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxGroup entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxGroup entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxGroup entity
    string? lastModifiedDateTime?;
};

public type PatchTaxGroupRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxGroup entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxGroup entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxGroup entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxGroup entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxGroup entity
    string? lastModifiedDateTime?;
};

public type PostJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central journal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central journal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central journal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central journal entity
    string? balancingAccountNumber?;
};

public type PatchJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central journal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central journal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central journal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central journal entity
    string? balancingAccountNumber?;
};

public type PostJournalLineForJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journalLine entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central journalLine entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central journalLine entity
    int? lineNumber?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central journalLine entity
    string? accountType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central journalLine entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central journalLine entity
    string? accountNumber?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central journalLine entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central journalLine entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central journalLine entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central journalLine entity
    decimal? amount?;
    # (v1.0) The description property for the Dynamics 365 Business Central journalLine entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central journalLine entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journalLine entity
    string? lastModifiedDateTime?;
};

public type PatchJournalLineForJournalRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journalLine entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central journalLine entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central journalLine entity
    int? lineNumber?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central journalLine entity
    string? accountType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central journalLine entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central journalLine entity
    string? accountNumber?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central journalLine entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central journalLine entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central journalLine entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central journalLine entity
    decimal? amount?;
    # (v1.0) The description property for the Dynamics 365 Business Central journalLine entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central journalLine entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journalLine entity
    string? lastModifiedDateTime?;
};

public type PostAttachmentsForJournalLineForJournalRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PatchAttachmentsForJournalLineForJournalRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PostJournalLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journalLine entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central journalLine entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central journalLine entity
    int? lineNumber?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central journalLine entity
    string? accountType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central journalLine entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central journalLine entity
    string? accountNumber?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central journalLine entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central journalLine entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central journalLine entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central journalLine entity
    decimal? amount?;
    # (v1.0) The description property for the Dynamics 365 Business Central journalLine entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central journalLine entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journalLine entity
    string? lastModifiedDateTime?;
};

public type PatchJournalLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central journalLine entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central journalLine entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central journalLine entity
    int? lineNumber?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central journalLine entity
    string? accountType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central journalLine entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central journalLine entity
    string? accountNumber?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central journalLine entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central journalLine entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central journalLine entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central journalLine entity
    decimal? amount?;
    # (v1.0) The description property for the Dynamics 365 Business Central journalLine entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central journalLine entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journalLine entity
    string? lastModifiedDateTime?;
};

public type PostAttachmentsForJournalLineRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PatchAttachmentsForJournalLineRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PostAttachmentsRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PatchAttachmentsRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type PostEmployeeRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central employee entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central employee entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central employee entity
    string? displayName?;
    # (v1.0) The givenName property for the Dynamics 365 Business Central employee entity
    string? givenName?;
    # (v1.0) The middleName property for the Dynamics 365 Business Central employee entity
    string? middleName?;
    # (v1.0) The surname property for the Dynamics 365 Business Central employee entity
    string? surname?;
    # (v1.0) The jobTitle property for the Dynamics 365 Business Central employee entity
    string? jobTitle?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central employee entity
    string? phoneNumber?;
    # (v1.0) The mobilePhone property for the Dynamics 365 Business Central employee entity
    string? mobilePhone?;
    # (v1.0) The email property for the Dynamics 365 Business Central employee entity
    string? email?;
    # (v1.0) The personalEmail property for the Dynamics 365 Business Central employee entity
    string? personalEmail?;
    # (v1.0) The employmentDate property for the Dynamics 365 Business Central employee entity
    string? employmentDate?;
    # (v1.0) The terminationDate property for the Dynamics 365 Business Central employee entity
    string? terminationDate?;
    # (v1.0) The status property for the Dynamics 365 Business Central employee entity
    string? status?;
    # (v1.0) The birthDate property for the Dynamics 365 Business Central employee entity
    string? birthDate?;
    # (v1.0) The statisticsGroupCode property for the Dynamics 365 Business Central employee entity
    string? statisticsGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central employee entity
    string? lastModifiedDateTime?;
};

public type PatchEmployeeRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central employee entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central employee entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central employee entity
    string? displayName?;
    # (v1.0) The givenName property for the Dynamics 365 Business Central employee entity
    string? givenName?;
    # (v1.0) The middleName property for the Dynamics 365 Business Central employee entity
    string? middleName?;
    # (v1.0) The surname property for the Dynamics 365 Business Central employee entity
    string? surname?;
    # (v1.0) The jobTitle property for the Dynamics 365 Business Central employee entity
    string? jobTitle?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central employee entity
    string? phoneNumber?;
    # (v1.0) The mobilePhone property for the Dynamics 365 Business Central employee entity
    string? mobilePhone?;
    # (v1.0) The email property for the Dynamics 365 Business Central employee entity
    string? email?;
    # (v1.0) The personalEmail property for the Dynamics 365 Business Central employee entity
    string? personalEmail?;
    # (v1.0) The employmentDate property for the Dynamics 365 Business Central employee entity
    string? employmentDate?;
    # (v1.0) The terminationDate property for the Dynamics 365 Business Central employee entity
    string? terminationDate?;
    # (v1.0) The status property for the Dynamics 365 Business Central employee entity
    string? status?;
    # (v1.0) The birthDate property for the Dynamics 365 Business Central employee entity
    string? birthDate?;
    # (v1.0) The statisticsGroupCode property for the Dynamics 365 Business Central employee entity
    string? statisticsGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central employee entity
    string? lastModifiedDateTime?;
};

public type PatchPictureForEmployeeRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content property for the Dynamics 365 Business Central picture entity
    string? content?;
};

public type PostDefaultDimensionsForEmployeeRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PatchDefaultDimensionsForEmployeeRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
};

public type PostTimeRegistrationEntryForEmployeeRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string id?;
    # (v1.0) The employeeId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeId?;
    # (v1.0) The employeeNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeNumber?;
    # (v1.0) The jobId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobId?;
    # (v1.0) The jobNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobNumber?;
    # (v1.0) The absence property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? absence?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    int? lineNumber?;
    # (v1.0) The date property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? date?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central timeRegistrationEntry entity
    decimal? quantity?;
    # (v1.0) The status property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? status?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModfiedDateTime property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? lastModfiedDateTime?;
};

public type PatchTimeRegistrationEntryForEmployeeRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string id?;
    # (v1.0) The employeeId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeId?;
    # (v1.0) The employeeNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeNumber?;
    # (v1.0) The jobId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobId?;
    # (v1.0) The jobNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobNumber?;
    # (v1.0) The absence property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? absence?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    int? lineNumber?;
    # (v1.0) The date property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? date?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central timeRegistrationEntry entity
    decimal? quantity?;
    # (v1.0) The status property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? status?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModfiedDateTime property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? lastModfiedDateTime?;
};

public type PostTimeRegistrationEntryRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string id?;
    # (v1.0) The employeeId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeId?;
    # (v1.0) The employeeNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeNumber?;
    # (v1.0) The jobId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobId?;
    # (v1.0) The jobNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobNumber?;
    # (v1.0) The absence property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? absence?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    int? lineNumber?;
    # (v1.0) The date property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? date?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central timeRegistrationEntry entity
    decimal? quantity?;
    # (v1.0) The status property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? status?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModfiedDateTime property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? lastModfiedDateTime?;
};

public type PatchTimeRegistrationEntryRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string id?;
    # (v1.0) The employeeId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeId?;
    # (v1.0) The employeeNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeNumber?;
    # (v1.0) The jobId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobId?;
    # (v1.0) The jobNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobNumber?;
    # (v1.0) The absence property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? absence?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    int? lineNumber?;
    # (v1.0) The date property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? date?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central timeRegistrationEntry entity
    decimal? quantity?;
    # (v1.0) The status property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? status?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModfiedDateTime property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? lastModfiedDateTime?;
};

public type PostCurrencyRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central currency entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central currency entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central currency entity
    string? displayName?;
    # (v1.0) The symbol property for the Dynamics 365 Business Central currency entity
    string? symbol?;
    # (v1.0) The amountDecimalPlaces property for the Dynamics 365 Business Central currency entity
    string? amountDecimalPlaces?;
    # (v1.0) The amountRoundingPrecision property for the Dynamics 365 Business Central currency entity
    decimal? amountRoundingPrecision?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central currency entity
    string? lastModifiedDateTime?;
};

public type PatchCurrencyRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central currency entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central currency entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central currency entity
    string? displayName?;
    # (v1.0) The symbol property for the Dynamics 365 Business Central currency entity
    string? symbol?;
    # (v1.0) The amountDecimalPlaces property for the Dynamics 365 Business Central currency entity
    string? amountDecimalPlaces?;
    # (v1.0) The amountRoundingPrecision property for the Dynamics 365 Business Central currency entity
    decimal? amountRoundingPrecision?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central currency entity
    string? lastModifiedDateTime?;
};

public type PostPaymentMethodRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentMethod entity
    string? lastModifiedDateTime?;
};

public type PatchPaymentMethodRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentMethod entity
    string? lastModifiedDateTime?;
};

public type PostDimensionLineRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central dimensionLine entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central dimensionLine entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central dimensionLine entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimensionLine entity
    string? displayName?;
    # (v1.0) The valueId property for the Dynamics 365 Business Central dimensionLine entity
    string? valueId?;
    # (v1.0) The valueCode property for the Dynamics 365 Business Central dimensionLine entity
    string? valueCode?;
    # (v1.0) The valueDisplayName property for the Dynamics 365 Business Central dimensionLine entity
    string? valueDisplayName?;
};

public type PatchDimensionLineRequest record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central dimensionLine entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central dimensionLine entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central dimensionLine entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimensionLine entity
    string? displayName?;
    # (v1.0) The valueId property for the Dynamics 365 Business Central dimensionLine entity
    string? valueId?;
    # (v1.0) The valueCode property for the Dynamics 365 Business Central dimensionLine entity
    string? valueCode?;
    # (v1.0) The valueDisplayName property for the Dynamics 365 Business Central dimensionLine entity
    string? valueDisplayName?;
};

public type PostPaymentTermRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentTerm entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentTerm entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentTerm entity
    string? displayName?;
    # (v1.0) The dueDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? dueDateCalculation?;
    # (v1.0) The discountDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? discountDateCalculation?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central paymentTerm entity
    decimal? discountPercent?;
    # (v1.0) The calculateDiscountOnCreditMemos property for the Dynamics 365 Business Central paymentTerm entity
    boolean? calculateDiscountOnCreditMemos?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentTerm entity
    string? lastModifiedDateTime?;
};

public type PatchPaymentTermRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentTerm entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentTerm entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentTerm entity
    string? displayName?;
    # (v1.0) The dueDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? dueDateCalculation?;
    # (v1.0) The discountDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? discountDateCalculation?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central paymentTerm entity
    decimal? discountPercent?;
    # (v1.0) The calculateDiscountOnCreditMemos property for the Dynamics 365 Business Central paymentTerm entity
    boolean? calculateDiscountOnCreditMemos?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentTerm entity
    string? lastModifiedDateTime?;
};

public type PostShipmentMethodRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central shipmentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central shipmentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central shipmentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central shipmentMethod entity
    string? lastModifiedDateTime?;
};

public type PatchShipmentMethodRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central shipmentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central shipmentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central shipmentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central shipmentMethod entity
    string? lastModifiedDateTime?;
};

public type PostItemCategoryRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central itemCategory entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central itemCategory entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central itemCategory entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central itemCategory entity
    string? lastModifiedDateTime?;
};

public type PatchItemCategoryRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central itemCategory entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central itemCategory entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central itemCategory entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central itemCategory entity
    string? lastModifiedDateTime?;
};

public type PostCountryRegionRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central countryRegion entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central countryRegion entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central countryRegion entity
    string? displayName?;
    # (v1.0) The addressFormat property for the Dynamics 365 Business Central countryRegion entity
    string? addressFormat?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central countryRegion entity
    string? lastModifiedDateTime?;
};

public type PatchCountryRegionRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central countryRegion entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central countryRegion entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central countryRegion entity
    string? displayName?;
    # (v1.0) The addressFormat property for the Dynamics 365 Business Central countryRegion entity
    string? addressFormat?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central countryRegion entity
    string? lastModifiedDateTime?;
};

public type PostSalesOrderRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrder entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesOrder entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesOrder entity
    string? externalDocumentNumber?;
    # (v1.0) The orderDate property for the Dynamics 365 Business Central salesOrder entity
    string? orderDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesOrder entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesOrder entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesOrder entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesOrder entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesOrder entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesOrder entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesOrder entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesOrder entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? pricesIncludeTax?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesOrder entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesOrder entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesOrder entity
    string? salesperson?;
    # (v1.0) The partialShipping property for the Dynamics 365 Business Central salesOrder entity
    boolean? partialShipping?;
    # (v1.0) The requestedDeliveryDate property for the Dynamics 365 Business Central salesOrder entity
    string? requestedDeliveryDate?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The fullyShipped property for the Dynamics 365 Business Central salesOrder entity
    boolean? fullyShipped?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesOrder entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesOrder entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesOrder entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesOrder entity
    string? email?;
};

public type PatchSalesOrderRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrder entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesOrder entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesOrder entity
    string? externalDocumentNumber?;
    # (v1.0) The orderDate property for the Dynamics 365 Business Central salesOrder entity
    string? orderDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesOrder entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesOrder entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesOrder entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesOrder entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesOrder entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesOrder entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesOrder entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesOrder entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? pricesIncludeTax?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesOrder entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesOrder entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesOrder entity
    string? salesperson?;
    # (v1.0) The partialShipping property for the Dynamics 365 Business Central salesOrder entity
    boolean? partialShipping?;
    # (v1.0) The requestedDeliveryDate property for the Dynamics 365 Business Central salesOrder entity
    string? requestedDeliveryDate?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The fullyShipped property for the Dynamics 365 Business Central salesOrder entity
    boolean? fullyShipped?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesOrder entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesOrder entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesOrder entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesOrder entity
    string? email?;
};

public type PostSalesOrderLineForSalesOrderRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrderLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesOrderLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesOrderLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesOrderLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesOrderLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesOrderLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesOrderLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesOrderLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? quantity?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? unitPrice?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrderLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesOrderLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesOrderLine entity
    string? shipmentDate?;
    # (v1.0) The shippedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shippedQuantity?;
    # (v1.0) The invoicedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoicedQuantity?;
    # (v1.0) The invoiceQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceQuantity?;
    # (v1.0) The shipQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shipQuantity?;
};

public type PatchSalesOrderLineForSalesOrderRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrderLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesOrderLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesOrderLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesOrderLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesOrderLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesOrderLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesOrderLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesOrderLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? quantity?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? unitPrice?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrderLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesOrderLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesOrderLine entity
    string? shipmentDate?;
    # (v1.0) The shippedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shippedQuantity?;
    # (v1.0) The invoicedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoicedQuantity?;
    # (v1.0) The invoiceQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceQuantity?;
    # (v1.0) The shipQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shipQuantity?;
};

public type PostSalesOrderLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrderLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesOrderLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesOrderLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesOrderLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesOrderLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesOrderLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesOrderLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesOrderLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? quantity?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? unitPrice?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrderLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesOrderLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesOrderLine entity
    string? shipmentDate?;
    # (v1.0) The shippedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shippedQuantity?;
    # (v1.0) The invoicedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoicedQuantity?;
    # (v1.0) The invoiceQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceQuantity?;
    # (v1.0) The shipQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shipQuantity?;
};

public type PatchSalesOrderLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrderLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesOrderLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesOrderLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesOrderLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesOrderLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesOrderLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesOrderLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesOrderLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? quantity?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? unitPrice?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrderLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesOrderLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesOrderLine entity
    string? shipmentDate?;
    # (v1.0) The shippedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shippedQuantity?;
    # (v1.0) The invoicedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoicedQuantity?;
    # (v1.0) The invoiceQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceQuantity?;
    # (v1.0) The shipQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shipQuantity?;
};

public type PostUnitOfMeasureRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central unitOfMeasure entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central unitOfMeasure entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central unitOfMeasure entity
    string? displayName?;
    # (v1.0) The internationalStandardCode property for the Dynamics 365 Business Central unitOfMeasure entity
    string? internationalStandardCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central unitOfMeasure entity
    string? lastModifiedDateTime?;
};

public type PatchUnitOfMeasureRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central unitOfMeasure entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central unitOfMeasure entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central unitOfMeasure entity
    string? displayName?;
    # (v1.0) The internationalStandardCode property for the Dynamics 365 Business Central unitOfMeasure entity
    string? internationalStandardCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central unitOfMeasure entity
    string? lastModifiedDateTime?;
};

public type PostTaxAreaRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxArea entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxArea entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxArea entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxArea entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxArea entity
    string? lastModifiedDateTime?;
};

public type PatchTaxAreaRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxArea entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxArea entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxArea entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxArea entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxArea entity
    string? lastModifiedDateTime?;
};

public type PostSalesQuoteRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuote entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesQuote entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesQuote entity
    string? externalDocumentNumber?;
    # (v1.0) The documentDate property for the Dynamics 365 Business Central salesQuote entity
    string? documentDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesQuote entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesQuote entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesQuote entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesQuote entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesQuote entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesQuote entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesQuote entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesQuote entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesQuote entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesQuote entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesQuote entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesQuote entity
    string? salesperson?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? discountAmount?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesQuote entity
    string? status?;
    # (v1.0) The sentDate property for the Dynamics 365 Business Central salesQuote entity
    string? sentDate?;
    # (v1.0) The validUntilDate property for the Dynamics 365 Business Central salesQuote entity
    string? validUntilDate?;
    # (v1.0) The acceptedDate property for the Dynamics 365 Business Central salesQuote entity
    string? acceptedDate?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesQuote entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesQuote entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesQuote entity
    string? email?;
};

public type PatchSalesQuoteRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuote entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesQuote entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesQuote entity
    string? externalDocumentNumber?;
    # (v1.0) The documentDate property for the Dynamics 365 Business Central salesQuote entity
    string? documentDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesQuote entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesQuote entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesQuote entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesQuote entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesQuote entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesQuote entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesQuote entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesQuote entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesQuote entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesQuote entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesQuote entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesQuote entity
    string? salesperson?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? discountAmount?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesQuote entity
    string? status?;
    # (v1.0) The sentDate property for the Dynamics 365 Business Central salesQuote entity
    string? sentDate?;
    # (v1.0) The validUntilDate property for the Dynamics 365 Business Central salesQuote entity
    string? validUntilDate?;
    # (v1.0) The acceptedDate property for the Dynamics 365 Business Central salesQuote entity
    string? acceptedDate?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesQuote entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesQuote entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesQuote entity
    string? email?;
};

public type PostSalesQuoteLineForSalesQuoteRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuoteLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesQuoteLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesQuoteLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesQuoteLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesQuoteLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesQuoteLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmountIncludingTax?;
};

public type PatchSalesQuoteLineForSalesQuoteRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuoteLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesQuoteLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesQuoteLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesQuoteLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesQuoteLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesQuoteLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmountIncludingTax?;
};

public type PostSalesQuoteLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuoteLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesQuoteLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesQuoteLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesQuoteLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesQuoteLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesQuoteLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmountIncludingTax?;
};

public type PatchSalesQuoteLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuoteLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesQuoteLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesQuoteLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesQuoteLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesQuoteLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesQuoteLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmountIncludingTax?;
};

public type PostSalesCreditMemoRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemo entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesCreditMemo entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? externalDocumentNumber?;
    # (v1.0) The creditMemoDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? creditMemoDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerNumber?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesCreditMemo entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesCreditMemo entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesCreditMemo entity
    string? lastModifiedDateTime?;
    # (v1.0) The invoiceId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceId?;
    # (v1.0) The invoiceNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceNumber?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesCreditMemo entity
    string? email?;
};

public type PatchSalesCreditMemoRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemo entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesCreditMemo entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? externalDocumentNumber?;
    # (v1.0) The creditMemoDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? creditMemoDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerNumber?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesCreditMemo entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesCreditMemo entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesCreditMemo entity
    string? lastModifiedDateTime?;
    # (v1.0) The invoiceId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceId?;
    # (v1.0) The invoiceNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceNumber?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesCreditMemo entity
    string? email?;
};

public type PostSalesCreditMemoLineForSalesCreditMemoRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesCreditMemoLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? shipmentDate?;
};

public type PatchSalesCreditMemoLineForSalesCreditMemoRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesCreditMemoLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? shipmentDate?;
};

public type PostSalesCreditMemoLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesCreditMemoLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? shipmentDate?;
};

public type PatchSalesCreditMemoLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesCreditMemoLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? shipmentDate?;
};

public type PostGeneralLedgerEntryAttachmentsRequest record {
    # (v1.0) The generalLedgerEntryNumber property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int generalLedgerEntryNumber?;
    # (v1.0) The id property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? content?;
    # (v1.0) The createdDateTime property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? createdDateTime?;
};

public type PatchGeneralLedgerEntryAttachmentsRequest record {
    # (v1.0) The generalLedgerEntryNumber property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int generalLedgerEntryNumber?;
    # (v1.0) The id property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? content?;
    # (v1.0) The createdDateTime property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? createdDateTime?;
};

public type PostPurchaseInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central purchaseInvoice entity
    string? number?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? dueDate?;
    # (v1.0) The vendorInvoiceNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorInvoiceNumber?;
    # (v1.0) The vendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorId?;
    # (v1.0) The vendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorNumber?;
    # (v1.0) The vendorName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorName?;
    # (v1.0) The payToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToName?;
    # (v1.0) The payToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToContact?;
    # (v1.0) The payToVendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorId?;
    # (v1.0) The payToVendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToContact?;
    Postaladdresstype buyFromAddress?;
    Postaladdresstype payToAddress?;
    Postaladdresstype shipToAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central purchaseInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central purchaseInvoice entity
    string? lastModifiedDateTime?;
};

public type PatchPurchaseInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central purchaseInvoice entity
    string? number?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? dueDate?;
    # (v1.0) The vendorInvoiceNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorInvoiceNumber?;
    # (v1.0) The vendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorId?;
    # (v1.0) The vendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorNumber?;
    # (v1.0) The vendorName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorName?;
    # (v1.0) The payToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToName?;
    # (v1.0) The payToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToContact?;
    # (v1.0) The payToVendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorId?;
    # (v1.0) The payToVendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToContact?;
    Postaladdresstype buyFromAddress?;
    Postaladdresstype payToAddress?;
    Postaladdresstype shipToAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central purchaseInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central purchaseInvoice entity
    string? lastModifiedDateTime?;
};

public type PostPurchaseInvoiceLineForPurchaseInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? description?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? unitCost?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The expectedReceiptDate property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? expectedReceiptDate?;
};

public type PatchPurchaseInvoiceLineForPurchaseInvoiceRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? description?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? unitCost?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The expectedReceiptDate property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? expectedReceiptDate?;
};

public type PostPurchaseInvoiceLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? description?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? unitCost?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The expectedReceiptDate property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? expectedReceiptDate?;
};

public type PatchPurchaseInvoiceLineRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? description?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? unitCost?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The expectedReceiptDate property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? expectedReceiptDate?;
};

public type PostProjectRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central project entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central project entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central project entity
    string? displayName?;
};

public type PatchProjectRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central project entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central project entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central project entity
    string? displayName?;
};

public type PostBankAccountRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central bankAccount entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central bankAccount entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central bankAccount entity
    string? displayName?;
};

public type PatchBankAccountRequest record {
    # (v1.0) The id property for the Dynamics 365 Business Central bankAccount entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central bankAccount entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central bankAccount entity
    string? displayName?;
};

public type Account record {
    # (v1.0) The id property for the Dynamics 365 Business Central account entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central account entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central account entity
    string? displayName?;
    # (v1.0) The category property for the Dynamics 365 Business Central account entity
    string? category?;
    # (v1.0) The subCategory property for the Dynamics 365 Business Central account entity
    string? subCategory?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central account entity
    boolean? blocked?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central account entity
    string? lastModifiedDateTime?;
};

public type TimeRegistrationEntry record {
    # (v1.0) The id property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string id?;
    # (v1.0) The employeeId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeId?;
    # (v1.0) The employeeNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? employeeNumber?;
    # (v1.0) The jobId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobId?;
    # (v1.0) The jobNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? jobNumber?;
    # (v1.0) The absence property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? absence?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central timeRegistrationEntry entity
    int? lineNumber?;
    # (v1.0) The date property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? date?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central timeRegistrationEntry entity
    decimal? quantity?;
    # (v1.0) The status property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? status?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModfiedDateTime property for the Dynamics 365 Business Central timeRegistrationEntry entity
    string? lastModfiedDateTime?;
    Project project?;
};

public type InlineResponse20019 record {
    TimeRegistrationEntry[] value?;
};

public type GeneralLedgerEntry record {
    # (v1.0) The id property for the Dynamics 365 Business Central generalLedgerEntry entity
    int id?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? documentNumber?;
    # (v1.0) The documentType property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? documentType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? accountNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? description?;
    # (v1.0) The debitAmount property for the Dynamics 365 Business Central generalLedgerEntry entity
    decimal? debitAmount?;
    # (v1.0) The creditAmount property for the Dynamics 365 Business Central generalLedgerEntry entity
    decimal? creditAmount?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central generalLedgerEntry entity
    string? lastModifiedDateTime?;
    Account account?;
};

public type Customer record {
    # (v1.0) The id property for the Dynamics 365 Business Central customer entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central customer entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customer entity
    string displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central customer entity
    string? 'type?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central customer entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central customer entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central customer entity
    string? website?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central customer entity
    boolean? taxLiable?;
    # (v1.0) The taxAreaId property for the Dynamics 365 Business Central customer entity
    string? taxAreaId?;
    # (v1.0) The taxAreaDisplayName property for the Dynamics 365 Business Central customer entity
    string? taxAreaDisplayName?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central customer entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central customer entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central customer entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central customer entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central customer entity
    string? shipmentMethodId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central customer entity
    string? paymentMethodId?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central customer entity
    string? blocked?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customer entity
    string? lastModifiedDateTime?;
    CustomerFinancialDetail[]? customerFinancialDetails?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
    PaymentMethod paymentMethod?;
};

public type CustomerPayment record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPayment entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central customerPayment entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central customerPayment entity
    int? lineNumber?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerPayment entity
    string? customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerPayment entity
    string? customerNumber?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central customerPayment entity
    string? contactId?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central customerPayment entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central customerPayment entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central customerPayment entity
    decimal? amount?;
    # (v1.0) The appliesToInvoiceId property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceId?;
    # (v1.0) The appliesToInvoiceNumber property for the Dynamics 365 Business Central customerPayment entity
    string? appliesToInvoiceNumber?;
    # (v1.0) The description property for the Dynamics 365 Business Central customerPayment entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central customerPayment entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPayment entity
    string? lastModifiedDateTime?;
    Customer customer?;
};

public type CustomerSale record {
    # (v1.0) The customerId property for the Dynamics 365 Business Central customerSale entity
    string customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central customerSale entity
    string customerNumber?;
    # (v1.0) The name property for the Dynamics 365 Business Central customerSale entity
    string name?;
    # (v1.0) The totalSalesAmount property for the Dynamics 365 Business Central customerSale entity
    decimal? totalSalesAmount?;
    # (v1.0) The dateFilter_FilterOnly property for the Dynamics 365 Business Central customerSale entity
    string? dateFilter_FilterOnly?;
};

public type Item record {
    # (v1.0) The id property for the Dynamics 365 Business Central item entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central item entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central item entity
    string? displayName?;
    # (v1.0) The type property for the Dynamics 365 Business Central item entity
    string? 'type?;
    # (v1.0) The itemCategoryId property for the Dynamics 365 Business Central item entity
    string? itemCategoryId?;
    # (v1.0) The itemCategoryCode property for the Dynamics 365 Business Central item entity
    string? itemCategoryCode?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central item entity
    boolean? blocked?;
    # (v1.0) The baseUnitOfMeasureId property for the Dynamics 365 Business Central item entity
    string? baseUnitOfMeasureId?;
    Unitofmeasuretype baseUnitOfMeasure?;
    # (v1.0) The gtin property for the Dynamics 365 Business Central item entity
    string? gtin?;
    # (v1.0) The inventory property for the Dynamics 365 Business Central item entity
    decimal? inventory?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central item entity
    decimal? unitPrice?;
    # (v1.0) The priceIncludesTax property for the Dynamics 365 Business Central item entity
    boolean? priceIncludesTax?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central item entity
    decimal? unitCost?;
    # (v1.0) The taxGroupId property for the Dynamics 365 Business Central item entity
    string? taxGroupId?;
    # (v1.0) The taxGroupCode property for the Dynamics 365 Business Central item entity
    string? taxGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central item entity
    string? lastModifiedDateTime?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    ItemCategory itemCategory?;
};

public type ItemCategory record {
    # (v1.0) The id property for the Dynamics 365 Business Central itemCategory entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central itemCategory entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central itemCategory entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central itemCategory entity
    string? lastModifiedDateTime?;
};

public type Picture record {
    # (v1.0) The id property for the Dynamics 365 Business Central picture entity
    string id?;
    # (v1.0) The width property for the Dynamics 365 Business Central picture entity
    int? width?;
    # (v1.0) The height property for the Dynamics 365 Business Central picture entity
    int? height?;
    # (v1.0) The contentType property for the Dynamics 365 Business Central picture entity
    string? contentType?;
    # (v1.0) The content@odata.mediaEditLink property for the Dynamics 365 Business Central picture entity
    string? 'content\@odata\.mediaEditLink?;
    # (v1.0) The content@odata.mediaReadLink property for the Dynamics 365 Business Central picture entity
    string? 'content\@odata\.mediaReadLink?;
};

public type InlineResponse20021 record {
    Currency[] value?;
};

public type CustomerPaymentJournal record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerPaymentJournal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central customerPaymentJournal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central customerPaymentJournal entity
    string? balancingAccountNumber?;
    CustomerPayment[]? customerPayments?;
    Account account?;
};

public type Currency record {
    # (v1.0) The id property for the Dynamics 365 Business Central currency entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central currency entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central currency entity
    string? displayName?;
    # (v1.0) The symbol property for the Dynamics 365 Business Central currency entity
    string? symbol?;
    # (v1.0) The amountDecimalPlaces property for the Dynamics 365 Business Central currency entity
    string? amountDecimalPlaces?;
    # (v1.0) The amountRoundingPrecision property for the Dynamics 365 Business Central currency entity
    decimal? amountRoundingPrecision?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central currency entity
    string? lastModifiedDateTime?;
};

public type InlineResponse20020 record {
    GeneralLedgerEntry[] value?;
};

public type InlineResponse20023 record {
    Dimension[] value?;
};

public type SalesOrderLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrderLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesOrderLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesOrderLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesOrderLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesOrderLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesOrderLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesOrderLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesOrderLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? quantity?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? unitPrice?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrderLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesOrderLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesOrderLine entity
    string? shipmentDate?;
    # (v1.0) The shippedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shippedQuantity?;
    # (v1.0) The invoicedQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoicedQuantity?;
    # (v1.0) The invoiceQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? invoiceQuantity?;
    # (v1.0) The shipQuantity property for the Dynamics 365 Business Central salesOrderLine entity
    decimal? shipQuantity?;
    Item item?;
    Account account?;
};

public type InlineResponse20022 record {
    PaymentMethod[] value?;
};

public type InlineResponse20025 record {
    DimensionLine[] value?;
};

public type InlineResponse20024 record {
    DimensionValue[] value?;
};

public type InlineResponse20027 record {
    ShipmentMethod[] value?;
};

public type Unitofmeasuretype record {
    # (v1.0) The code property for the Dynamics 365 Business Central unitofmeasuretype entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central unitofmeasuretype entity
    string? displayName?;
    # (v1.0) The symbol property for the Dynamics 365 Business Central unitofmeasuretype entity
    string? symbol?;
    Itemunitofmeasureconversiontype unitConversion?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    ItemCategory itemCategory?;
};

public type InlineResponse20026 record {
    PaymentTerm[] value?;
};

public type InlineResponse20029 record {
    CashFlowStatement[] value?;
};

public type InlineResponse20028 record {
    ItemCategory[] value?;
};

public type CountryRegion record {
    # (v1.0) The id property for the Dynamics 365 Business Central countryRegion entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central countryRegion entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central countryRegion entity
    string? displayName?;
    # (v1.0) The addressFormat property for the Dynamics 365 Business Central countryRegion entity
    string? addressFormat?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central countryRegion entity
    string? lastModifiedDateTime?;
};

public type TrialBalance record {
    # (v1.0) The number property for the Dynamics 365 Business Central trialBalance entity
    string number?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central trialBalance entity
    string? accountId?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central trialBalance entity
    string? accountType?;
    # (v1.0) The display property for the Dynamics 365 Business Central trialBalance entity
    string? display?;
    # (v1.0) The totalDebit property for the Dynamics 365 Business Central trialBalance entity
    string? totalDebit?;
    # (v1.0) The totalCredit property for the Dynamics 365 Business Central trialBalance entity
    string? totalCredit?;
    # (v1.0) The balanceAtDateDebit property for the Dynamics 365 Business Central trialBalance entity
    string? balanceAtDateDebit?;
    # (v1.0) The balanceAtDateCredit property for the Dynamics 365 Business Central trialBalance entity
    string? balanceAtDateCredit?;
    # (v1.0) The dateFilter property for the Dynamics 365 Business Central trialBalance entity
    string? dateFilter?;
    Account account?;
};

public type Dimensiontype record {
    # (v1.0) The code property for the Dynamics 365 Business Central dimensiontype entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimensiontype entity
    string? displayName?;
    # (v1.0) The valueCode property for the Dynamics 365 Business Central dimensiontype entity
    string valueCode?;
    # (v1.0) The valueDisplayName property for the Dynamics 365 Business Central dimensiontype entity
    string? valueDisplayName?;
    Customer customer?;
};

public type Project record {
    # (v1.0) The id property for the Dynamics 365 Business Central project entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central project entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central project entity
    string? displayName?;
};

public type Employee record {
    # (v1.0) The id property for the Dynamics 365 Business Central employee entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central employee entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central employee entity
    string? displayName?;
    # (v1.0) The givenName property for the Dynamics 365 Business Central employee entity
    string? givenName?;
    # (v1.0) The middleName property for the Dynamics 365 Business Central employee entity
    string? middleName?;
    # (v1.0) The surname property for the Dynamics 365 Business Central employee entity
    string? surname?;
    # (v1.0) The jobTitle property for the Dynamics 365 Business Central employee entity
    string? jobTitle?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central employee entity
    string? phoneNumber?;
    # (v1.0) The mobilePhone property for the Dynamics 365 Business Central employee entity
    string? mobilePhone?;
    # (v1.0) The email property for the Dynamics 365 Business Central employee entity
    string? email?;
    # (v1.0) The personalEmail property for the Dynamics 365 Business Central employee entity
    string? personalEmail?;
    # (v1.0) The employmentDate property for the Dynamics 365 Business Central employee entity
    string? employmentDate?;
    # (v1.0) The terminationDate property for the Dynamics 365 Business Central employee entity
    string? terminationDate?;
    # (v1.0) The status property for the Dynamics 365 Business Central employee entity
    string? status?;
    # (v1.0) The birthDate property for the Dynamics 365 Business Central employee entity
    string? birthDate?;
    # (v1.0) The statisticsGroupCode property for the Dynamics 365 Business Central employee entity
    string? statisticsGroupCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central employee entity
    string? lastModifiedDateTime?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    TimeRegistrationEntry[]? timeRegistrationEntries?;
};

public type InlineResponse20030 record {
    CountryRegion[] value?;
};

public type InlineResponse20032 record {
    SalesOrderLine[] value?;
};

public type InlineResponse20031 record {
    SalesOrder[] value?;
};

public type Documentlineobjectdetailstype record {
    # (v1.0) The number property for the Dynamics 365 Business Central documentlineobjectdetailstype entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central documentlineobjectdetailstype entity
    string? displayName?;
    Item item?;
    Account account?;
};

public type InlineResponse20034 record {
    UnitOfMeasure[] value?;
};

public type InlineResponse20033 record {
    RetainedEarningsStatement[] value?;
};

public type InlineResponse20036 record {
    AgedAccountsPayable[] value?;
};

public type InlineResponse20035 record {
    AgedAccountsReceivable[] value?;
};

public type InlineResponse20038 record {
    TrialBalance[] value?;
};

public type InlineResponse20037 record {
    BalanceSheet[] value?;
};

public type InlineResponse20039 record {
    IncomeStatement[] value?;
};

public type InlineResponse2009 record {
    SalesInvoiceLine[] value?;
};

public type InlineResponse2008 record {
    SalesInvoice[] value?;
};

public type BalanceSheet record {
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central balanceSheet entity
    int lineNumber?;
    # (v1.0) The display property for the Dynamics 365 Business Central balanceSheet entity
    string? display?;
    # (v1.0) The balance property for the Dynamics 365 Business Central balanceSheet entity
    decimal? balance?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central balanceSheet entity
    string? lineType?;
    # (v1.0) The indentation property for the Dynamics 365 Business Central balanceSheet entity
    int? indentation?;
    # (v1.0) The dateFilter property for the Dynamics 365 Business Central balanceSheet entity
    string? dateFilter?;
};

public type GeneralLedgerEntryAttachments record {
    # (v1.0) The generalLedgerEntryNumber property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int generalLedgerEntryNumber?;
    # (v1.0) The id property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? content?;
    # (v1.0) The createdDateTime property for the Dynamics 365 Business Central generalLedgerEntryAttachments entity
    string? createdDateTime?;
    GeneralLedgerEntry generalLedgerEntry?;
};

public type DimensionValue record {
    # (v1.0) The id property for the Dynamics 365 Business Central dimensionValue entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central dimensionValue entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimensionValue entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central dimensionValue entity
    string? lastModifiedDateTime?;
};

public type InlineResponse20041 record {
    SalesQuote[] value?;
};

public type InlineResponse20040 record {
    TaxArea[] value?;
};

public type InlineResponse20043 record {
    SalesCreditMemo[] value?;
};

public type InlineResponse20042 record {
    SalesQuoteLine[] value?;
};

public type InlineResponse20045 record {
    GeneralLedgerEntryAttachments[] value?;
};

public type InlineResponse20044 record {
    SalesCreditMemoLine[] value?;
};

public type InlineResponse20047 record {
    PurchaseInvoiceLine[] value?;
};

public type InlineResponse20046 record {
    PurchaseInvoice[] value?;
};

public type InlineResponse20049 record {
    BankAccount[] value?;
};

public type InlineResponse20048 record {
    Project[] value?;
};

public type BankAccount record {
    # (v1.0) The id property for the Dynamics 365 Business Central bankAccount entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central bankAccount entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central bankAccount entity
    string? displayName?;
};

public type Dimension record {
    # (v1.0) The id property for the Dynamics 365 Business Central dimension entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central dimension entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimension entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central dimension entity
    string? lastModifiedDateTime?;
    DimensionValue[]? dimensionValues?;
};

public type InlineResponse20050 record {
    CustomerSale[] value?;
};

public type TaxArea record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxArea entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxArea entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxArea entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxArea entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxArea entity
    string? lastModifiedDateTime?;
};

public type CompanyInformation record {
    # (v1.0) The id property for the Dynamics 365 Business Central companyInformation entity
    string id?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central companyInformation entity
    string? displayName?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central companyInformation entity
    string? phoneNumber?;
    # (v1.0) The faxNumber property for the Dynamics 365 Business Central companyInformation entity
    string? faxNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central companyInformation entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central companyInformation entity
    string? website?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central companyInformation entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central companyInformation entity
    string? currencyCode?;
    # (v1.0) The currentFiscalYearStartDate property for the Dynamics 365 Business Central companyInformation entity
    string? currentFiscalYearStartDate?;
    # (v1.0) The industry property for the Dynamics 365 Business Central companyInformation entity
    string? industry?;
    # (v1.0) The picture property for the Dynamics 365 Business Central companyInformation entity
    string? picture?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central companyInformation entity
    string? lastModifiedDateTime?;
};

public type InlineResponse20051 record {
    VendorPurchase[] value?;
};

public type InlineResponse2001 record {
    Item[] value?;
};

public type VendorPurchase record {
    # (v1.0) The vendorId property for the Dynamics 365 Business Central vendorPurchase entity
    string vendorId?;
    # (v1.0) The vendorNumber property for the Dynamics 365 Business Central vendorPurchase entity
    string vendorNumber?;
    # (v1.0) The name property for the Dynamics 365 Business Central vendorPurchase entity
    string name?;
    # (v1.0) The totalPurchaseAmount property for the Dynamics 365 Business Central vendorPurchase entity
    decimal? totalPurchaseAmount?;
    # (v1.0) The dateFilter_FilterOnly property for the Dynamics 365 Business Central vendorPurchase entity
    string? dateFilter_FilterOnly?;
};

public type InlineResponse2003 record {
    DefaultDimensions[] value?;
};

public type InlineResponse2002 record {
    Picture[] value?;
};

public type InlineResponse2005 record {
    CustomerFinancialDetail[] value?;
};

public type SalesCreditMemoLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesCreditMemoLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemoLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesCreditMemoLine entity
    string? shipmentDate?;
    Item item?;
    Account account?;
};

public type InlineResponse2004 record {
    Customer[] value?;
};

public type InlineResponse2007 record {
    CompanyInformation[] value?;
};

public type InlineResponse2006 record {
    Vendor[] value?;
};

public type Company record {
    # (v1.0) The id property for the Dynamics 365 Business Central company entity
    string id?;
    # (v1.0) The systemVersion property for the Dynamics 365 Business Central company entity
    string? systemVersion?;
    # (v1.0) The name property for the Dynamics 365 Business Central company entity
    string? name?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central company entity
    string? displayName?;
    # (v1.0) The businessProfileId property for the Dynamics 365 Business Central company entity
    string? businessProfileId?;
    Item[]? items?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    Customer[]? customers?;
    CustomerFinancialDetail[]? customerFinancialDetails?;
    Vendor[]? vendors?;
    CompanyInformation[]? companyInformation?;
    SalesInvoice[]? salesInvoices?;
    SalesInvoiceLine[]? salesInvoiceLines?;
    PdfDocument[]? pdfDocument?;
    CustomerPaymentJournal[]? customerPaymentJournals?;
    CustomerPayment[]? customerPayments?;
    Account[]? accounts?;
    TaxGroup[]? taxGroups?;
    Journal[]? journals?;
    JournalLine[]? journalLines?;
    Attachments[]? attachments?;
    Employee[]? employees?;
    TimeRegistrationEntry[]? timeRegistrationEntries?;
    GeneralLedgerEntry[]? generalLedgerEntries?;
    Currency[]? currencies?;
    PaymentMethod[]? paymentMethods?;
    Dimension[]? dimensions?;
    DimensionValue[]? dimensionValues?;
    DimensionLine[]? dimensionLines?;
    PaymentTerm[]? paymentTerms?;
    ShipmentMethod[]? shipmentMethods?;
    ItemCategory[]? itemCategories?;
    CashFlowStatement[]? cashFlowStatement?;
    CountryRegion[]? countriesRegions?;
    SalesOrder[]? salesOrders?;
    SalesOrderLine[]? salesOrderLines?;
    RetainedEarningsStatement[]? retainedEarningsStatement?;
    UnitOfMeasure[]? unitsOfMeasure?;
    AgedAccountsReceivable[]? agedAccountsReceivable?;
    AgedAccountsPayable[]? agedAccountsPayable?;
    BalanceSheet[]? balanceSheet?;
    TrialBalance[]? trialBalance?;
    IncomeStatement[]? incomeStatement?;
    TaxArea[]? taxAreas?;
    SalesQuote[]? salesQuotes?;
    SalesQuoteLine[]? salesQuoteLines?;
    SalesCreditMemo[]? salesCreditMemos?;
    SalesCreditMemoLine[]? salesCreditMemoLines?;
    GeneralLedgerEntryAttachments[]? generalLedgerEntryAttachments?;
    PurchaseInvoice[]? purchaseInvoices?;
    PurchaseInvoiceLine[]? purchaseInvoiceLines?;
    Project[]? projects?;
    BankAccount[]? bankAccounts?;
    CustomerSale[]? customerSales?;
    VendorPurchase[]? vendorPurchases?;
};

public type Itemunitofmeasureconversiontype record {
    # (v1.0) The toUnitOfMeasure property for the Dynamics 365 Business Central itemunitofmeasureconversiontype entity
    string? toUnitOfMeasure?;
    # (v1.0) The fromToConversionRate property for the Dynamics 365 Business Central itemunitofmeasureconversiontype entity
    decimal? fromToConversionRate?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    ItemCategory itemCategory?;
};

public type Journal record {
    # (v1.0) The id property for the Dynamics 365 Business Central journal entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central journal entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central journal entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journal entity
    string? lastModifiedDateTime?;
    # (v1.0) The balancingAccountId property for the Dynamics 365 Business Central journal entity
    string? balancingAccountId?;
    # (v1.0) The balancingAccountNumber property for the Dynamics 365 Business Central journal entity
    string? balancingAccountNumber?;
    JournalLine[]? journalLines?;
    Account account?;
};

public type SalesQuote record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuote entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesQuote entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesQuote entity
    string? externalDocumentNumber?;
    # (v1.0) The documentDate property for the Dynamics 365 Business Central salesQuote entity
    string? documentDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesQuote entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesQuote entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesQuote entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesQuote entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesQuote entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesQuote entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesQuote entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesQuote entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesQuote entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesQuote entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesQuote entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesQuote entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesQuote entity
    string? salesperson?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? discountAmount?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesQuote entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesQuote entity
    string? status?;
    # (v1.0) The sentDate property for the Dynamics 365 Business Central salesQuote entity
    string? sentDate?;
    # (v1.0) The validUntilDate property for the Dynamics 365 Business Central salesQuote entity
    string? validUntilDate?;
    # (v1.0) The acceptedDate property for the Dynamics 365 Business Central salesQuote entity
    string? acceptedDate?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesQuote entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesQuote entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesQuote entity
    string? email?;
    SalesQuoteLine[]? salesQuoteLines?;
    PdfDocument[]? pdfDocument?;
    Customer customer?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
};

public type Postaladdresstype record {
    # (v1.0) The street property for the Dynamics 365 Business Central postaladdresstype entity
    string? street?;
    # (v1.0) The city property for the Dynamics 365 Business Central postaladdresstype entity
    string? city?;
    # (v1.0) The state property for the Dynamics 365 Business Central postaladdresstype entity
    string? state?;
    # (v1.0) The countryLetterCode property for the Dynamics 365 Business Central postaladdresstype entity
    string? countryLetterCode?;
    # (v1.0) The postalCode property for the Dynamics 365 Business Central postaladdresstype entity
    string? postalCode?;
    CustomerFinancialDetail[]? customerFinancialDetails?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
    PaymentMethod paymentMethod?;
};

public type PurchaseInvoice record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central purchaseInvoice entity
    string? number?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central purchaseInvoice entity
    string? dueDate?;
    # (v1.0) The vendorInvoiceNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorInvoiceNumber?;
    # (v1.0) The vendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorId?;
    # (v1.0) The vendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorNumber?;
    # (v1.0) The vendorName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? vendorName?;
    # (v1.0) The payToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToName?;
    # (v1.0) The payToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToContact?;
    # (v1.0) The payToVendorId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorId?;
    # (v1.0) The payToVendorNumber property for the Dynamics 365 Business Central purchaseInvoice entity
    string? payToVendorNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central purchaseInvoice entity
    string? shipToContact?;
    Postaladdresstype buyFromAddress?;
    Postaladdresstype payToAddress?;
    Postaladdresstype shipToAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central purchaseInvoice entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central purchaseInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central purchaseInvoice entity
    string? lastModifiedDateTime?;
    PurchaseInvoiceLine[]? purchaseInvoiceLines?;
    PdfDocument[]? pdfDocument?;
    Vendor vendor?;
    Currency currency?;
};

public type SalesOrder record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesOrder entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesOrder entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesOrder entity
    string? externalDocumentNumber?;
    # (v1.0) The orderDate property for the Dynamics 365 Business Central salesOrder entity
    string? orderDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesOrder entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesOrder entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesOrder entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesOrder entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesOrder entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesOrder entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesOrder entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesOrder entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesOrder entity
    string? currencyCode?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? pricesIncludeTax?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesOrder entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesOrder entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesOrder entity
    string? salesperson?;
    # (v1.0) The partialShipping property for the Dynamics 365 Business Central salesOrder entity
    boolean? partialShipping?;
    # (v1.0) The requestedDeliveryDate property for the Dynamics 365 Business Central salesOrder entity
    string? requestedDeliveryDate?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesOrder entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesOrder entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The fullyShipped property for the Dynamics 365 Business Central salesOrder entity
    boolean? fullyShipped?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesOrder entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesOrder entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesOrder entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesOrder entity
    string? email?;
    SalesOrderLine[]? salesOrderLines?;
    Customer customer?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
};

public type JournalLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central journalLine entity
    string id?;
    # (v1.0) The journalDisplayName property for the Dynamics 365 Business Central journalLine entity
    string? journalDisplayName?;
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central journalLine entity
    int? lineNumber?;
    # (v1.0) The accountType property for the Dynamics 365 Business Central journalLine entity
    string? accountType?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central journalLine entity
    string? accountId?;
    # (v1.0) The accountNumber property for the Dynamics 365 Business Central journalLine entity
    string? accountNumber?;
    # (v1.0) The postingDate property for the Dynamics 365 Business Central journalLine entity
    string? postingDate?;
    # (v1.0) The documentNumber property for the Dynamics 365 Business Central journalLine entity
    string? documentNumber?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central journalLine entity
    string? externalDocumentNumber?;
    # (v1.0) The amount property for the Dynamics 365 Business Central journalLine entity
    decimal? amount?;
    # (v1.0) The description property for the Dynamics 365 Business Central journalLine entity
    string? description?;
    # (v1.0) The comment property for the Dynamics 365 Business Central journalLine entity
    string? comment?;
    Dimensiontype[] dimensions?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central journalLine entity
    string? lastModifiedDateTime?;
    Attachments[]? attachments?;
    Account account?;
};

public type UnitOfMeasure record {
    # (v1.0) The id property for the Dynamics 365 Business Central unitOfMeasure entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central unitOfMeasure entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central unitOfMeasure entity
    string? displayName?;
    # (v1.0) The internationalStandardCode property for the Dynamics 365 Business Central unitOfMeasure entity
    string? internationalStandardCode?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central unitOfMeasure entity
    string? lastModifiedDateTime?;
};

public type RetainedEarningsStatement record {
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central retainedEarningsStatement entity
    int lineNumber?;
    # (v1.0) The display property for the Dynamics 365 Business Central retainedEarningsStatement entity
    string? display?;
    # (v1.0) The netChange property for the Dynamics 365 Business Central retainedEarningsStatement entity
    decimal? netChange?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central retainedEarningsStatement entity
    string? lineType?;
    # (v1.0) The indentation property for the Dynamics 365 Business Central retainedEarningsStatement entity
    int? indentation?;
    # (v1.0) The dateFilter property for the Dynamics 365 Business Central retainedEarningsStatement entity
    string? dateFilter?;
};

public type ShipmentMethod record {
    # (v1.0) The id property for the Dynamics 365 Business Central shipmentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central shipmentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central shipmentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central shipmentMethod entity
    string? lastModifiedDateTime?;
};

public type SalesCreditMemo record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesCreditMemo entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesCreditMemo entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? externalDocumentNumber?;
    # (v1.0) The creditMemoDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? creditMemoDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesCreditMemo entity
    string? dueDate?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? billToCustomerNumber?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesCreditMemo entity
    string? currencyCode?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesCreditMemo entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? pricesIncludeTax?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesCreditMemo entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesCreditMemo entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesCreditMemo entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesCreditMemo entity
    string? lastModifiedDateTime?;
    # (v1.0) The invoiceId property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceId?;
    # (v1.0) The invoiceNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? invoiceNumber?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesCreditMemo entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesCreditMemo entity
    string? email?;
    SalesCreditMemoLine[]? salesCreditMemoLines?;
    PdfDocument[]? pdfDocument?;
    Customer customer?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
};

public type PdfDocument record {
    # (v1.0) The id property for the Dynamics 365 Business Central pdfDocument entity
    string id?;
    # (v1.0) The content property for the Dynamics 365 Business Central pdfDocument entity
    string? content?;
};

public type IncomeStatement record {
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central incomeStatement entity
    int lineNumber?;
    # (v1.0) The display property for the Dynamics 365 Business Central incomeStatement entity
    string? display?;
    # (v1.0) The netChange property for the Dynamics 365 Business Central incomeStatement entity
    decimal? netChange?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central incomeStatement entity
    string? lineType?;
    # (v1.0) The indentation property for the Dynamics 365 Business Central incomeStatement entity
    int? indentation?;
    # (v1.0) The dateFilter property for the Dynamics 365 Business Central incomeStatement entity
    string? dateFilter?;
};

public type TaxGroup record {
    # (v1.0) The id property for the Dynamics 365 Business Central taxGroup entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central taxGroup entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central taxGroup entity
    string? displayName?;
    # (v1.0) The taxType property for the Dynamics 365 Business Central taxGroup entity
    string? taxType?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central taxGroup entity
    string? lastModifiedDateTime?;
};

public type SalesInvoiceLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The shipmentDate property for the Dynamics 365 Business Central salesInvoiceLine entity
    string? shipmentDate?;
    Item item?;
    Account account?;
};

public type PaymentMethod record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentMethod entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentMethod entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentMethod entity
    string? displayName?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentMethod entity
    string? lastModifiedDateTime?;
};

public type AgedAccountsPayable record {
    # (v1.0) The vendorId property for the Dynamics 365 Business Central agedAccountsPayable entity
    string vendorId?;
    # (v1.0) The vendorNumber property for the Dynamics 365 Business Central agedAccountsPayable entity
    string? vendorNumber?;
    # (v1.0) The name property for the Dynamics 365 Business Central agedAccountsPayable entity
    string? name?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central agedAccountsPayable entity
    string? currencyCode?;
    # (v1.0) The balanceDue property for the Dynamics 365 Business Central agedAccountsPayable entity
    decimal? balanceDue?;
    # (v1.0) The currentAmount property for the Dynamics 365 Business Central agedAccountsPayable entity
    decimal? currentAmount?;
    # (v1.0) The period1Amount property for the Dynamics 365 Business Central agedAccountsPayable entity
    decimal? period1Amount?;
    # (v1.0) The period2Amount property for the Dynamics 365 Business Central agedAccountsPayable entity
    decimal? period2Amount?;
    # (v1.0) The period3Amount property for the Dynamics 365 Business Central agedAccountsPayable entity
    decimal? period3Amount?;
    # (v1.0) The agedAsOfDate property for the Dynamics 365 Business Central agedAccountsPayable entity
    string? agedAsOfDate?;
    # (v1.0) The periodLengthFilter property for the Dynamics 365 Business Central agedAccountsPayable entity
    string? periodLengthFilter?;
};

public type AgedAccountsReceivable record {
    # (v1.0) The customerId property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string customerId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string? customerNumber?;
    # (v1.0) The name property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string? name?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string? currencyCode?;
    # (v1.0) The balanceDue property for the Dynamics 365 Business Central agedAccountsReceivable entity
    decimal? balanceDue?;
    # (v1.0) The currentAmount property for the Dynamics 365 Business Central agedAccountsReceivable entity
    decimal? currentAmount?;
    # (v1.0) The period1Amount property for the Dynamics 365 Business Central agedAccountsReceivable entity
    decimal? period1Amount?;
    # (v1.0) The period2Amount property for the Dynamics 365 Business Central agedAccountsReceivable entity
    decimal? period2Amount?;
    # (v1.0) The period3Amount property for the Dynamics 365 Business Central agedAccountsReceivable entity
    decimal? period3Amount?;
    # (v1.0) The agedAsOfDate property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string? agedAsOfDate?;
    # (v1.0) The periodLengthFilter property for the Dynamics 365 Business Central agedAccountsReceivable entity
    string? periodLengthFilter?;
};

public type SalesQuoteLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesQuoteLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central salesQuoteLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central salesQuoteLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central salesQuoteLine entity
    string? description?;
    # (v1.0) The unitOfMeasureId property for the Dynamics 365 Business Central salesQuoteLine entity
    string? unitOfMeasureId?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitPrice property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? unitPrice?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesQuoteLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central salesQuoteLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central salesQuoteLine entity
    decimal? netAmountIncludingTax?;
    Item item?;
    Account account?;
};

public type DimensionLine record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central dimensionLine entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central dimensionLine entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central dimensionLine entity
    string? code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central dimensionLine entity
    string? displayName?;
    # (v1.0) The valueId property for the Dynamics 365 Business Central dimensionLine entity
    string? valueId?;
    # (v1.0) The valueCode property for the Dynamics 365 Business Central dimensionLine entity
    string? valueCode?;
    # (v1.0) The valueDisplayName property for the Dynamics 365 Business Central dimensionLine entity
    string? valueDisplayName?;
    Dimension dimension?;
};

public type InlineResponse200 record {
    Company[] value?;
};

public type Attachments record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central attachments entity
    string parentId?;
    # (v1.0) The id property for the Dynamics 365 Business Central attachments entity
    string id?;
    # (v1.0) The fileName property for the Dynamics 365 Business Central attachments entity
    string? fileName?;
    # (v1.0) The byteSize property for the Dynamics 365 Business Central attachments entity
    int? byteSize?;
    # (v1.0) The content property for the Dynamics 365 Business Central attachments entity
    string? content?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central attachments entity
    string? lastModifiedDateTime?;
};

public type SalesInvoice record {
    # (v1.0) The id property for the Dynamics 365 Business Central salesInvoice entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central salesInvoice entity
    string? number?;
    # (v1.0) The externalDocumentNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? externalDocumentNumber?;
    # (v1.0) The invoiceDate property for the Dynamics 365 Business Central salesInvoice entity
    string? invoiceDate?;
    # (v1.0) The dueDate property for the Dynamics 365 Business Central salesInvoice entity
    string? dueDate?;
    # (v1.0) The customerPurchaseOrderReference property for the Dynamics 365 Business Central salesInvoice entity
    string? customerPurchaseOrderReference?;
    # (v1.0) The customerId property for the Dynamics 365 Business Central salesInvoice entity
    string? customerId?;
    # (v1.0) The contactId property for the Dynamics 365 Business Central salesInvoice entity
    string? contactId?;
    # (v1.0) The customerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? customerNumber?;
    # (v1.0) The customerName property for the Dynamics 365 Business Central salesInvoice entity
    string? customerName?;
    # (v1.0) The billToName property for the Dynamics 365 Business Central salesInvoice entity
    string? billToName?;
    # (v1.0) The billToCustomerId property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerId?;
    # (v1.0) The billToCustomerNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? billToCustomerNumber?;
    # (v1.0) The shipToName property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToName?;
    # (v1.0) The shipToContact property for the Dynamics 365 Business Central salesInvoice entity
    string? shipToContact?;
    Postaladdresstype sellingPostalAddress?;
    Postaladdresstype billingPostalAddress?;
    Postaladdresstype shippingPostalAddress?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central salesInvoice entity
    string? currencyCode?;
    # (v1.0) The orderId property for the Dynamics 365 Business Central salesInvoice entity
    string? orderId?;
    # (v1.0) The orderNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? orderNumber?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central salesInvoice entity
    string? paymentTermsId?;
    # (v1.0) The shipmentMethodId property for the Dynamics 365 Business Central salesInvoice entity
    string? shipmentMethodId?;
    # (v1.0) The salesperson property for the Dynamics 365 Business Central salesInvoice entity
    string? salesperson?;
    # (v1.0) The pricesIncludeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? pricesIncludeTax?;
    # (v1.0) The remainingAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? remainingAmount?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? discountAmount?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central salesInvoice entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The totalAmountExcludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountExcludingTax?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalTaxAmount?;
    # (v1.0) The totalAmountIncludingTax property for the Dynamics 365 Business Central salesInvoice entity
    decimal? totalAmountIncludingTax?;
    # (v1.0) The status property for the Dynamics 365 Business Central salesInvoice entity
    string? status?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central salesInvoice entity
    string? lastModifiedDateTime?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central salesInvoice entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central salesInvoice entity
    string? email?;
    SalesInvoiceLine[]? salesInvoiceLines?;
    PdfDocument[]? pdfDocument?;
    Customer customer?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    ShipmentMethod shipmentMethod?;
};

public type DefaultDimensions record {
    # (v1.0) The parentId property for the Dynamics 365 Business Central defaultDimensions entity
    string parentId?;
    # (v1.0) The dimensionId property for the Dynamics 365 Business Central defaultDimensions entity
    string dimensionId?;
    # (v1.0) The dimensionCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionCode?;
    # (v1.0) The dimensionValueId property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueId?;
    # (v1.0) The dimensionValueCode property for the Dynamics 365 Business Central defaultDimensions entity
    string? dimensionValueCode?;
    # (v1.0) The postingValidation property for the Dynamics 365 Business Central defaultDimensions entity
    string? postingValidation?;
    Account account?;
    Dimension dimension?;
    DimensionValue dimensionValue?;
};

public type Vendor record {
    # (v1.0) The id property for the Dynamics 365 Business Central vendor entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central vendor entity
    string? number?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central vendor entity
    string? displayName?;
    Postaladdresstype address?;
    # (v1.0) The phoneNumber property for the Dynamics 365 Business Central vendor entity
    string? phoneNumber?;
    # (v1.0) The email property for the Dynamics 365 Business Central vendor entity
    string? email?;
    # (v1.0) The website property for the Dynamics 365 Business Central vendor entity
    string? website?;
    # (v1.0) The taxRegistrationNumber property for the Dynamics 365 Business Central vendor entity
    string? taxRegistrationNumber?;
    # (v1.0) The currencyId property for the Dynamics 365 Business Central vendor entity
    string? currencyId?;
    # (v1.0) The currencyCode property for the Dynamics 365 Business Central vendor entity
    string? currencyCode?;
    # (v1.0) The irs1099Code property for the Dynamics 365 Business Central vendor entity
    string? irs1099Code?;
    # (v1.0) The paymentTermsId property for the Dynamics 365 Business Central vendor entity
    string? paymentTermsId?;
    # (v1.0) The paymentMethodId property for the Dynamics 365 Business Central vendor entity
    string? paymentMethodId?;
    # (v1.0) The taxLiable property for the Dynamics 365 Business Central vendor entity
    boolean? taxLiable?;
    # (v1.0) The blocked property for the Dynamics 365 Business Central vendor entity
    string? blocked?;
    # (v1.0) The balance property for the Dynamics 365 Business Central vendor entity
    decimal? balance?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central vendor entity
    string? lastModifiedDateTime?;
    Picture[]? picture?;
    DefaultDimensions[]? defaultDimensions?;
    Currency currency?;
    PaymentTerm paymentTerm?;
    PaymentMethod paymentMethod?;
};

public type PaymentTerm record {
    # (v1.0) The id property for the Dynamics 365 Business Central paymentTerm entity
    string id?;
    # (v1.0) The code property for the Dynamics 365 Business Central paymentTerm entity
    string code?;
    # (v1.0) The displayName property for the Dynamics 365 Business Central paymentTerm entity
    string? displayName?;
    # (v1.0) The dueDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? dueDateCalculation?;
    # (v1.0) The discountDateCalculation property for the Dynamics 365 Business Central paymentTerm entity
    string? discountDateCalculation?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central paymentTerm entity
    decimal? discountPercent?;
    # (v1.0) The calculateDiscountOnCreditMemos property for the Dynamics 365 Business Central paymentTerm entity
    boolean? calculateDiscountOnCreditMemos?;
    # (v1.0) The lastModifiedDateTime property for the Dynamics 365 Business Central paymentTerm entity
    string? lastModifiedDateTime?;
};

public type CashFlowStatement record {
    # (v1.0) The lineNumber property for the Dynamics 365 Business Central cashFlowStatement entity
    int lineNumber?;
    # (v1.0) The display property for the Dynamics 365 Business Central cashFlowStatement entity
    string? display?;
    # (v1.0) The netChange property for the Dynamics 365 Business Central cashFlowStatement entity
    decimal? netChange?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central cashFlowStatement entity
    string? lineType?;
    # (v1.0) The indentation property for the Dynamics 365 Business Central cashFlowStatement entity
    int? indentation?;
    # (v1.0) The dateFilter property for the Dynamics 365 Business Central cashFlowStatement entity
    string? dateFilter?;
};

public type CustomerFinancialDetail record {
    # (v1.0) The id property for the Dynamics 365 Business Central customerFinancialDetail entity
    string id?;
    # (v1.0) The number property for the Dynamics 365 Business Central customerFinancialDetail entity
    string? number?;
    # (v1.0) The balance property for the Dynamics 365 Business Central customerFinancialDetail entity
    decimal? balance?;
    # (v1.0) The totalSalesExcludingTax property for the Dynamics 365 Business Central customerFinancialDetail entity
    decimal? totalSalesExcludingTax?;
    # (v1.0) The overdueAmount property for the Dynamics 365 Business Central customerFinancialDetail entity
    decimal? overdueAmount?;
};

public type InlineResponse20010 record {
    PdfDocument[] value?;
};

public type InlineResponse20012 record {
    CustomerPayment[] value?;
};

public type InlineResponse20011 record {
    CustomerPaymentJournal[] value?;
};

public type InlineResponse20014 record {
    TaxGroup[] value?;
};

public type PurchaseInvoiceLine record {
    # (v1.0) The id property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string id?;
    # (v1.0) The documentId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? documentId?;
    # (v1.0) The sequence property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    int? sequence?;
    # (v1.0) The itemId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? itemId?;
    # (v1.0) The accountId property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? accountId?;
    # (v1.0) The lineType property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? lineType?;
    Documentlineobjectdetailstype lineDetails?;
    # (v1.0) The description property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? description?;
    Unitofmeasuretype unitOfMeasure?;
    # (v1.0) The unitCost property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? unitCost?;
    # (v1.0) The quantity property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? quantity?;
    # (v1.0) The discountAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountAmount?;
    # (v1.0) The discountPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? discountPercent?;
    # (v1.0) The discountAppliedBeforeTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    boolean? discountAppliedBeforeTax?;
    # (v1.0) The amountExcludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountExcludingTax?;
    # (v1.0) The taxCode property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? taxCode?;
    # (v1.0) The taxPercent property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? taxPercent?;
    # (v1.0) The totalTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? totalTaxAmount?;
    # (v1.0) The amountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? amountIncludingTax?;
    # (v1.0) The invoiceDiscountAllocation property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? invoiceDiscountAllocation?;
    # (v1.0) The netAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmount?;
    # (v1.0) The netTaxAmount property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netTaxAmount?;
    # (v1.0) The netAmountIncludingTax property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    decimal? netAmountIncludingTax?;
    # (v1.0) The expectedReceiptDate property for the Dynamics 365 Business Central purchaseInvoiceLine entity
    string? expectedReceiptDate?;
    Item item?;
    Account account?;
};

public type InlineResponse20013 record {
    Account[] value?;
};

public type InlineResponse20016 record {
    JournalLine[] value?;
};

public type InlineResponse20015 record {
    Journal[] value?;
};

public type InlineResponse20018 record {
    Employee[] value?;
};

public type InlineResponse20017 record {
    Attachments[] value?;
};
