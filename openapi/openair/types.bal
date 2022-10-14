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

# An OpenAir type record or an error
public type OpenAirResponse record {
    # An array containing the relevant objects requested or an IDs
    (IDs|ExpenseReport|Attachment|JobCode)[] data?;
    # An array of expanded objects, if the expand parameter was set in the request
    record {} included?;
    # An object containing information about objects referenced by internal ID in the data array (object type and internal ID). Only returned if the return_object parameter was set to any value other than 0 (zero) in the request
    record {} meta?;
    # A string containing a brief message about the status of your request
    string message?;
};

# Job Code
public type JobCode record {
    # Optional accounting code that can be used for integration with external accounting systems
    string accountingCode?;
    # The date the job code was created
    string created?;
    # The currency for monetary values in the job code record. Three-letter currency code
    string currency?;
    # The unique external record ID, if the record was imported from an external system
    string externalId?;
    # The internal ID of the generic resource used in full-time equivalent (FTE) forecasting
    int genericResourceId?;
    # The unique internal identifier of the job code
    int id?;
    # A 1/0 field indicating if the job code is active
    boolean isActive?;
    # The cost per hour
    decimal loadedCost?;
    # The display name of the job code
    string name?;
    # Notes about the job code
    boolean notes?;
    # The date the job code was last updated or modified
    string updated?;
};

public type AttachmentTypeJson record {
    # The internal ID of the workspace document to be associated with the expense report.
    int id?;
};

public type InlineResponse2001 record {
    # A string containing a brief message about the status of your request — e.g. "Success" or "Attachment #4985 not found"
    string message?;
};

# IDs of the objects
public type IDs record {
    # ID of the object
    string id?;
};

public type InlineResponse200 record {
    # A string containing a brief message about the status of your request
    string message?;
};

# Attachments are files uploaded and stored in OpenAir and associated with records
public type Attachment record {
    # The internal ID of the attachment category
    int attachmentCategoryId?;
    # The date the attachment was created
    string created?;
    # The filename of the attached file
    string fileName?;
    # The file type. This is used for tracking purposes
    string fileType?;
    # The unique internal identifier of the attachment
    int id?;
    # A 1/0 field indicating if the attachment is excluded from the alert system
    boolean isExcludedFromAlert?;
    # A 1/0 field indicating if other attachment records have this attachment record as a parent
    boolean isFolder?;
    # A 1/0 field indicating if the attachment is locked for editing
    boolean isLocked?;
    # The internal ID of the employee who uploaded the file. The value is 0 (zero) if unlocked.
    int lockedBy?;
    # The display name of the attachment
    string name?;
    # Notes about the attachment. This attribute is used for keyword search.
    string notes?;
    # The file size in bytes
    decimal size?;
    # The date the attachment was last updated or modified
    string updated?;
    # The internal ID of the employee who uploaded the file.
    int uploadedBy?;
    # The internal ID of the workspace associated with the attachment. The value is 0 (zero) if the attachment is not associated with a workspace.
    int workspaceId?;
};

public type Receipts record {
    # The accounting period date of the receipt
    string accountingDate?;
    # The attachments associated with the receipt. Array of internal IDs for attachment objects.
    IDs[] attachments?;
    # The internal ID of the cost center associated with the receipt
    int costCenterId?;
    # The cost per unit of measure
    decimal costPerUnit?;
    # The date the receipt was created
    string created?;
    # The currency for monetary values in the receipt record. Three-letter currency code
    string currency?;
    # The internal ID of the customer associated with the receipt
    int customerId?;
    # The date of the receipt
    string date?;
    # The description of the receipt
    string description?;
    # The internal ID of the expense report associated with the receipt
    int expenseReportId?;
    # The unique external ID of the receipt, if the record was imported from an external system
    string externalId?;
    # The total federal tax for the receipt
    decimal federalTax?;
    # The federal tax rate for the receipt
    decimal federalTaxRate?;
    # The cost per unit of measure in the selected foreign currency, if this is a foreign currency receipt
    decimal foreignCurrencyCost?;
    # The cost per unit of measure in the selected foreign currency, if this is a foreign currency receipt.
    decimal foreignCurrencyRate?;
    # The foreign currency, if this is a foreign currency receipt. Three-letter currency code
    string foreignCurrencySymbol?;
    # The tax paid in the foreign currency, if this is a foreign currency receipt
    decimal foreignCurrencyTotalTaxPaid?;
    # The total GST tax for the receipt
    decimal gst?;
    # The total GST tax for the receipt
    decimal gstRate?;
    # The total GST tax for the receipt
    decimal hst?;
    # The total GST tax for the receipt
    decimal hstRate?;
    # The total GST tax for the receipt
    int id?;
    # A 1/0 field indicating if the record is within the specified foreign currency tolerance
    boolean isForeignCurrencyExchangeIntolerance?;
    # A 1/0 field indicating if the paper receipt is missing for this receipt
    boolean isMissingPaperReceipt?;
    # A 1/0 field indicating if the receipt is not billable
    boolean isNonBillable?;
    # A 1/0 field indicating if the receipt is reimbursable
    boolean isReimbursable?;
    # A 1/0 field indicating if the cost includes the tax
    boolean isTaxIncludedInCost?;
    # The internal ID of the item associated with the receipt. The type of item can be used to determine the receipt subtype
    int itemId?;
    # Notes about the receipt
    string notes?;
    # The internal ID of the payment type associated with the receipt. The payment type indicates how the payment was made and may determine if the receipt is reimbursable
    int paymentTypeId?;
    # The internal ID of the project associated with the receipt
    int projectId?;
    # The internal ID of the project task associated with the receipt. Requires an option to be enabled in OpenAir (Administration > Application settings > Expenses > Other settings)
    int projectTaskId?;
    # The total PST tax for the receipt
    decimal pst?;
    # The total PST tax for the receipt
    decimal pstRate?;
    # The city or location where the cost was incurred
    string receiptLocation?;
    # The internal ID of the slip associated with the receipt, if the expense was billed
    int slipId?;
    # The total state tax for the receipt
    decimal stateTax?;
    # The quantity (number of units of measure)
    int quantity?;
    # The internal ID of the tax location associated with the receipt
    int taxLocationId?;
    # The internal ID of the tax location associated with the receipt
    decimal total?;
    # The total value of the receipt excluding tax
    decimal totalNoTax?;
    # The total tax paid
    decimal totalTaxPaid?;
    # The unique reference number of the receipt within the associated expense report. This attribute is used to cross reference digital receipts with paper receipts
    string trackingNumber?;
    # The date the receipt was last updated or modified
    string updated?;
    # The internal ID of the employee associated with the receipt
    int userId?;
    # The internal ID of the employee location associated with the receipt
    int userLocationId?;
    # The internal ID of the vehicle associated with the receipt
    int vehicleId?;
    # The internal ID of the vendor associated with the receipt.
    int vendorId?;
};

# Contacts details
public type Contact record {
    # Optional accounting code that can be used for integration with external accounting systems.
    int accountingCode?;
    # First line of the contact's address
    string address1?;
    # Second line of the contact's address
    string address2?;
    # Third line of the contact's address
    string address3?;
    # Forth line of the contact's address
    string address4?;
    # A 1/0 field indicating if the contact can be used for billing
    boolean canBill?;
    # A 1/0 field indicating if the contact an be used for selling
    boolean canSell?;
    # A 1/0 field indicating if the contact can be used for shipping
    boolean canShip?;
    # The contact's city
    string city?;
    # The contact's country
    string country?;
    # The date the contact record was created
    string created?;
    # The internal ID of the associated customer
    int customerId?;
    # The contact's Email address
    string email?;
    # The unique external ID of the contact, if the record was imported from an external system
    string externalId?;
    # The contact's fax number
    string fax?;
    # The contact's first name
    string firstName?;
    # The unique internal identifier of the contact
    int id?;
    # A 1/0 field indicating if the contact is active
    boolean isActive?;
    # The contact's job title
    string jobTitle?;
    # The contact's last name
    string lastName?;
    # The contact's mobile phone number
    string mobile?;
    # The nickname used to identify the contact
    string nickname?;
    # Notes about the contact
    string notes?;
    # The contact's phone number
    string phone?;
    # The contact's state
    string state?;
    # The contact's title
    string title?;
    # The date the contact record was last updated or modified
    string updated?;
    # The contact's ZIP code or postal code
    string zip?;
};

# collections of expense items (receipts) that employees can use in OpenAir to claim reimbursement
public type ExpenseReport record {
    # The accounting period date of the expense report
    string accountingDate?;
    # The amount of any cash advance on the expense report
    string advance?;
    # The date the expense report was approved
    string approveDate?;
    # The attachments associated with this expense report. Array of internal IDs for attachment objects
    IDs[] attachments?;
    # The outstanding balance on the expense report
    decimal balance?;
    # The date the expense report was created
    string created?;
    # The currency for monetary values in the expense report. Three-letter currency code
    string currency?;
    # The internal ID of the associated customer
    int customerId?;
    # The date of the expense report
    string date?;
    # The description of the expense report (e.g. reason for the trip)
    string description?;
    # The ending date of the expense report (only used with auto-naming)
    string endDate?;
    # The date and time the record was marked as "exported"
    string exported?;
    # The unique external ID of the expense report, if the record was imported from an external "system"
    string externalId?;
    # The unique internal identifier of the expense report
    int id?;
    # A 1/0 field indicating if an envelope was submitted to an accounting partner
    boolean isAccounting?;
    # A 1/0 field indicating if the expense report is an adjusting expense report
    boolean isAdjusting?;
    # A 1/0 field indicating if the record is within the specified foreign currency tolerance as defined in database data definitions
    boolean isForeignCurrencyExchangeIntolerance?;
    # A 1/0 field indicating if the record is within the specified foreign currency tolerance as defined in database data definitions
    string name?;
    # Notes about the expense report
    string notes?;
    # The internal ID of the associated project
    int projectId?;
    # The starting date of the expense report (only used with auto-naming)
    string startDate?;
    # The status of the expense report. Possible values: O — open, S — submitted, A — approved, R — rejected
    string status?;
    # The date the expense report was submitted
    string submitDate?;
    # Default tax location for this expense report
    int taxLocationId?;
    # The total value of all the receipts in the expense report
    decimal total?;
    # The total number of receipts in the expense report
    int totalReceipts?;
    # The total amount of reimbursable expenses in the expense report
    decimal totalReimburse?;
    # The expense report tracking number
    string trackingNumber?;
    # The date the expense report was last updated or modified
    string updated?;
    # The internal ID of the associated employee
    int userId?;
};
