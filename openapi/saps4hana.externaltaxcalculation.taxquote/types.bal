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

public type ApiV0SchemaAdditionaliteminformation record {
    # Information about the operation, such as the material origin, own production usage, and whether the service is sold electronically.
    string 'type?;
    # Information about the item type. The 'isServiceElectronicallySold' parameter can have the values 'Y' (yes) or 'N' (no). In the tax configuration application, you must maintain the product tax classification for all relevant tax countries where the product is sold electronically.
    string information?;
};

# The list of details on the tax exemption.
public type ApiV0SchemaExemptiondetail record {
    # The location at which the product has the specified exemption.
    string LocationType?;
    # The Exemption Code classification for the product.
    string exemptionCode?;
    # The classification code for a tax rate. The tax authorities of the country/region in which the the tax is applicable determine these rates.
    string tariffId?;
    # The identification of the tax rate type on which you apply the exemption.
    string taxType?;
    # The identification of the tax rate type.
    string taxRateType?;
    # The code of the region in which the product exemption is valid.
    string region?;
};

public type ApiV0SchemaTaxresponse record {
    string date?;
    # The total amount to be paid or collected.
    string total?;
    # Shows whether tax was included in the gross amount: included (true) or not included (false).
    string inclusive?;
    # The amount on which tax is applicable.
    string subTotal?;
    # The total amount of tax for an item.
    string totalTax?;
    # The total amount of withholding tax.
    string totalWithholdingTax?;
    # The taxable country/region. Note: the API returns the country/region only if all items have the same tax country/region.
    string country?;
    ApiV0SchemaTaxline[] taxLines?;
    ApiV0SchemaWarning[] warning?;
    # Includes the trace content for tax determination. Applies only when the value of the 'isTraceRequired' parameter is 'y' in the request payload.
    string[] traceLog?;
};

public type ApiV0SchemaCostinformation record {
    # The type of cost, such as freight, discount, shipping, or others.
    string costType?;
    # The corresponding amount for the cost type.
    string amount?;
};

# Invalid date in the request / Invalid country/region code in the request / Invalid type in the request / Any of the mandatory parameters is missing / Invalid currency in the request / Invalid GrossOrNet in the request / Invalid SaleOrPurchase in the request / Max length given in the schema / Location Type is missing/invalid / ExemptionCode is missing/invalid / More than 1 Ship_From in the exemptionDetils / More than 1 Ship_To in the exemptionDetails / More than 1 Ship_From in the Locations / More than 1 Ship_To in the Locations/ Invalid Zipcode in SHIP_TO Location for US / More than 1 shippingCost in items / Invalid shippingCost in items " / Invalid fromDate / Invalid toDate / Invalid Date Range / Missing value for toDate / Missing value for fromDate.
public type ApiV0SchemaErrorresponse record {
    # The status code.
    int status?;
    # The message type.
    string 'type?;
    # The message content.
    string message?;
};

# If you include too many line items in the request, it can impact the performance. For more information, see SAP Note 2698505 on the SAP ONE Support Launchpad.
public type ApiV0SchemaItem record {
    # A unique identifier for each item in the transaction.
    string id;
    # Pass the item code, for example, SKU of a product. Else pass the productid as maintained in the Tax configuration application. In the second case, the service considers the relevant tax classification as maintained in the application.
    string itemCode?;
    # The quantity of the line item. This can include fractions expressed using decimal places.
    decimal quantity;
    # The unit price of the line item.
    decimal unitPrice;
    # To determine tax on shipping costs, specify the tax as a separate item. To indicate that an item relates to shipping costs, you must enter 'Y' as the value of this parameter. For the United States of America, tax is calculated if shipping is taxable in the particular jurisdiction. If shipping is not taxable, the API returns zero tax for the item.
    string shippingCost?;
    # The type of product - service or material. Enter 's' for service and 'm' for material.
    string itemType?;
    ApiV0SchemaExemptiondetail[] exemptionDetails?;
    # The ID of the exemption certificate, as maintained in the tax configuration application. The API considers the exemption only when the following conditions are met: 1. The certificate ID is valid on the date in the request payload. 2. The exemption details are maintained in the tax configuration application.
    string certificateId?;
    ApiV0SchemaItemclassification[] itemClassifications?;
    ApiV0SchemaAdditionaliteminformation[] additionalItemInformation?;
    ApiV0SchemaCostinformation[] costInformation?;
    # Determines if the taxes to be calculated are product taxes or withholding taxes. This parameter is valid only for direct calculation scenarios.
    string taxCategory?;
    # Determines the country/region for which the system calculates taxes. The system uses the 2-character country/region code described on ISO 3166-1 alpha-2. This parameter is valid only for direct calculation scenarios.
    string taxCodeCountry?;
    # Determines which rule the system uses to calculate taxes. This parameter is valid only for direct calculation scenarios.
    string taxCode?;
    # Determines the region for which the system calculates taxes. This parameter is optional and valid only for direct calculation scenarios.
    string taxCodeRegion?;
};

# Details about other parties.
public type ApiV0SchemaParty record {
    # The identifier of each party in the business transaction. Use the party master data ID that the consuming application defines. For example, in SAP S/4HANA (Cloud and OP), the party ID is the business partner number.
    string id?;
    # The role played by the party in the transaction.
    string role?;
    ApiV0SchemaTaxregistration[] taxRegistration?;
};

# The exemption details of a business partner.
public type ApiV0SchemaBusinesspartnerexemptiondetail record {
    # The location at which the product has the specified exemption.
    string locationType?;
    # The exemption code classification for the product.
    string exemptionreasoncode?;
    # The identification of the tax rate type on which you apply the exemption.
    string taxType?;
};

public type ApiV0SchemaTaxline record {
    # The unique identifier for each item in the transaction.
    string id?;
    # The taxable country/region. If the tax country/region for an item differs from the other items, then the tax service sends back the tax country/region for each item.
    string country?;
    # The total amount of tax for an item.
    string totalTax?;
    # The tax code for an item in the operation.
    string taxcode?;
    # The description of the tax code that is determined for the transaction.
    string taxCodeDescription?;
    # The legal phrase associated with the tax code. Where applicable, this item relates to the tax act or article numbers.
    string taxCodeLegalPhrase?;
    # The total tax rate.
    string totalRate?;
    # The total amount of withholding tax.
    string totalWithholdingTax?;
    # The total withholding tax rate.
    string totalWithholdingTaxRate?;
    # The withholding tax code.
    string withholdingTaxCode?;
    ApiV0SchemaTaxvalue[] taxValues?;
};

# List of Addresses.
public type ApiV0SchemaLocation record {
    # The type of address.
    string 'type;
    # The first line of the address.
    string addressLine1?;
    # The second line of the address.
    string addressLine2?;
    # The third line of the address.
    string addressLine3?;
    # The ZIP or postal code.
    string zipCode?;
    # The name of the city.
    string city?;
    # The code of the state or province; do not add the country/region as a prefix or suffix.
    string state?;
    # The name of the county.
    string county?;
    # The ID of the address, as maintained in the tax configuration application for the various location addresses. The 'addressID' parameter is relevant only when location addresses are maintained in the tax configuration application for a company, customer, or supplier. For sale transactions and the location type 'SHIP_FROM', the API checks for an address maintained for the company ID that is specified in the request payload. For sale transactions and the location type 'SHIP_TO', the API checks for an address maintained for the business partner ID that is specified in the request payload. For purchase transactions and the location type 'SHIP_TO', the API checks for an address maintained for the company ID that is specified in the request payload. For sale transactions and the location type 'SHIP_FROM', the API checks for an address maintained for the business partner ID that is specified in the request payload. Note: if you specify an address ID in the request, you must also specify a company ID and business partner ID.
    string addressId?;
    # The name of the country/region. Enter the 2-character country/region code according to the standards of ISO 3166-1 alpha-2.
    string country;
    # Shows whether the company is registered with the tax authorities at this location. The application calling the API must identify whether a company has a VAT establishment for tax purposes in the selling country/region. If the company has a VAT establishment, the calling application must specify 'Y' as the value for this parameter "isCompanyTaxRegistered" for the selling location. If the company is not established for VAT purposes, the calling application must specify 'N' as the value for this parameter "isCompanyTaxRegistered" for the selling location.
    string isCompanyTaxRegistered?;
    # Shows whether the business partner is registered for tax purposes. The tax service does not differentiate between business-to-business (B2B) and business-to-consumer (B2C) transactions. B2B transactions: the calling application must specify 'Y' as the value of this parameter. B2C transactions: the calling application must specify 'N' as the value of this parameter.
    string isBusinessPartnerTaxRegistered?;
};

# Other tax attributes.
public type ApiV0SchemaTaxattribute record {
    # The type of the tax attribute.
    string attributeType?;
    # Corresponding value for the attributes.
    string attributeValue?;
};

# The request payload as per the model schema provided.
public type ApiV0SchemaTaxrequest record {
    # A document ID that uniquely identifies the transaction, which is the request that is sent for tax calculation.
    string id;
    # The company ID, as maintained in the Tax Configuration application. If the company master data is maintained in the tax configuration application, include a value for this key in the request for the service to use the relevant tax classification available in the application to determine the tax amount.
    string companyId?;
    # The ID of a supplier or customer, as maintained in the Tax Configuration application. Include a value for this parameter in the request only if the tax configuration data for suppliers or customers is maintained in the tax configuration application. In this case, the service considers the relevant tax classification available in the application to determine the tax amount.
    string businessPartnerId?;
    # The date of a transaction, such as the order date, invoice date, or return date. To determine the tax due, the service applies the relevant tax rules that apply on this date.
    string date;
    # Specifies the currency code according to ISO 4217 standards. All amounts in the response have the number digits after the decimal place in accordance with the currency in question.
    string currency;
    # Indicates if the parties involved in the transaction belong to the same tax reporting group, as defined by law.
    string isTransactionWithinTaxReportingGroup?;
    # The percentage discount that applies to the business transaction request sent. In accordance with country/region tax determination guidelines, the service determines whether a cash discount affects the base amount used for tax calculation.
    string cashDiscountPercent?;
    # If the cash discount is planned for the transaction, enter 'y' or 'Y' as the value of this parameter. If the cash discount is already considered in the transaction, enter 'n' or 'N' as the value of this parameter.
    string isCashDiscountPlanned?;
    # Shows whether the transaction is gross or net. Use g for gross and n for net.
    string grossOrNet?;
    # Shows whether the transaction is a sale or purchase. Use s or S for a sale and p or P for a purchase.
    string saleorPurchase?;
    # Identifies the nature of the operation.
    string operationNatureCode?;
    # Indicates if the company can defer the tax due until the date of the invoice payment. This applies only if the company has the required authorizations for tax deferral. If you enter 'y' as the value in this parameter, the service applies deferred tax rules and indicates tax deferral in the response.
    string isCompanyDeferredTaxEnabled?;
    # If you include too many line items in the request, it can impact the performance. For more information, see SAP Note 2698505 on the SAP ONE Support Launchpad.
    ApiV0SchemaItem[] Items;
    ApiV0SchemaLocation[] Locations?;
    ApiV0SchemaBusinesspartnerexemptiondetail[] BusinessPartnerExemptionDetails?;
    ApiV0SchemaParty[] Party?;
    # Shows whether tracing of the tax determination process is enabled. To enable the trace, enter 'y' or 'Y' as the value of the parameter. To disable the trace, enter 'n' or 'N'. When enabled, the trace content is sent as part of the response payload.
    string isTraceRequired?;
};

# Return messages for scenarios where one or more input values are not taken into consideration for tax calculation. It is also relevant in cases in which the API overrides input values.
public type ApiV0SchemaWarning record {
    # The code of the warning.
    string code?;
    # The description of the warning.
    string description?;
};

public type ApiV0SchemaItemclassification record {
    # The identifier of the item.
    string itemStandardClassificationSystemCode?;
    # The classification code for the system code.
    string itemStandardClassificationCode?;
};

# The tax registration details.
public type ApiV0SchemaTaxregistration record {
    # The type of location.
    string locationType?;
    # The corresponding tax number for the tax number type code.
    string taxNumber?;
    # The code for the tax number type.
    #   * isNaturalPerson - Determines if this party of the business transaction is a natural person. Note: The system uses the information from this parameter to determine what data privacy and protection policies to apply on this payload data. The system does not use the information from this parameter to determine and calculate taxes. 'y' when the party is a natural person, otherwise 'n'.
    string taxNumberTypeCode?;
};

public type ApiV0SchemaTaxvalue record {
    # Returns the tax level in the tax hierarchy for a tax on tax scenario. The highest level is 1. In the case of sales and use tax in US, level 1 indicates State tax, level 2 indicates county and so on.
    string level?;
    # Tax type code.
    string taxTypeCode?;
    # Name of tax type.
    string name?;
    # Tax rate.
    string rate?;
    # Returns the base amount used for tax calculations. In cases where a cash discount percentage is passed, country/region tax determination guidelines can affect the base amount.
    string taxable?;
    # Percentage of base amount exempted.
    string exemptedBasePercent?;
    # Exempted base amount.
    string exemptedBaseAmount?;
    # Other base amount.
    string otherBaseAmount?;
    # Tax amount including the non-deductible amount where applicable.
    string value?;
    # Non-deductible tax rate.
    string nonDeductibleTaxRate?;
    # Non-deductible tax amount.
    string nonDeductibleTaxAmount?;
    # Deductible tax amount.
    string deductibleTaxAmount?;
    ApiV0SchemaTaxattribute[] taxAttributes?;
    # Jurisdiction name.
    string jurisdiction?;
    # Returns the unique identifier of tax jurisdiction in the US.
    string jurisdictionCode?;
    # Returns "P" (payable) in cases of taxes due to the authorities, and "R" (receivable) for input taxes that can be claimed.
    string dueCategory?;
    # Is tax deferred or not.
    boolean isTaxDeferred?;
    # Tax value is withholding relevant or not.
    boolean withholdingRelevant?;
};
