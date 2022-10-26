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

import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type TimesheetSummaryResult record {
    string? EntryDateFrom?;
    string? EntryDateTo?;
    decimal? TotalHours?;
    decimal? BillableHours?;
    int[]? UserID?;
    string[]? GroupingLevels?;
    TimesheetSummaryGroup[]? GroupData?;
};

public type ExpenseCategoryDetails record {
    int? ExpenseCategoryID?;
    string? Name?;
    boolean? Enabled?;
    boolean? hasUnitPrice?;
    decimal? UnitPrice?;
    string? UnitName?;
};

public type Invoice record {
    int? TransactionID?;
    int? AccountIDFK?;
    string? TransactionPrefix?;
    string? InvoiceNumber?;
    int? CompanyIDFK?;
    string? CompanyName?;
    string? Subject?;
    string? DateIssued?;
    string? DateSent?;
    string? DueDate?;
    string? TransactionStatusCode?;
    decimal? TaxAmount?;
    string? TransactionTaxConfigCode?;
    decimal? Balance?;
    string? CurrencyCode?;
    decimal? TotalAmount?;
    decimal? ExchangeRate?;
    string? Notes?;
    string? CustomerPONumber?;
    string? DateCreated?;
    string? DateUpdated?;
    InvoiceLineItem[]? LineItems?;
    InvoiceLinks? Links?;
    IssuerDetails? Issuer?;
    RecipientDetails? Recipient?;
};

public type AccountTaskTypeDetails record {
    int? AccountTaskTypeID?;
    string? Name?;
    string? Icon?;
    string? IconType?;
    boolean? isDefault?;
};

public type NewPayment record {
    decimal? Amount?;
    # Optional. If not specified will be automatically generated
    string? PaymentNumber?;
    # Date of Payment. If not specified, assumes today.
    string? DateIssued?;
    # Optional to override the default prefix added to Payment Numbers
    string? TransactionPrefix?;
    # Only required if no invoice allocations specified.
    int? CustomerIDFK?;
    # Optional. Only used when the Customer's currecy is different from the Avaza account's base currency. Specifies the exchange rate that should apply between the customer currency and base currency. If not provided we will obtain an up to date exchange rate for the Payment Issue Date.
    decimal? ExchangeRate?;
    # Optional for storing the reference # of the payment method.
    string? TransactionReference?;
    string? Notes?;
    # Optional for storing the payment provider who was the source of funds.
    string? PaymentProviderCode?;
    # List of amounts within this payment that are allocated to invoices. The sum of these be less than or equal to the payment amount.
    NewPaymentAllocation[]? PaymentAllocations?;
};

public type CreateLeave record {
    int? LeaveUserIDFK?;
    boolean? LeaveNotify?;
    decimal? LeaveHoursPerDay?;
    int? LeaveTypeIDFK?;
    string? LeaveNotes?;
    string? LeaveStartDate?;
    string? LeaveEndDate?;
};

public type NewTask record {
    int? ProjectIDFK;
    int? SectionIDFK;
    int? AccountTaskTypeIDFK?;
    string? Title;
    string? Description?;
    int? AssignedToUserIDFK?;
    string? TaskPriorityCode?;
    string? DateStart?;
    string? DateDue?;
    # Decimal hours
    decimal? EstimatedEffort?;
    # Collection of tags specifying Name and Color (Hex)
    NewTag[]? Tags?;
};

public type TaskDetails record {
    int? TaskID?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    string? ProjectCode?;
    string? SectionTitle?;
    int? SectionIDFK?;
    string? Title?;
    string? Description?;
    string? DescriptionNoHTML?;
    string? AssignedToFirstname?;
    string? AssignedToLastname?;
    string? AssignedToEmail?;
    string? AssignedToUserIDFK?;
    string? DateStart?;
    string? DateDue?;
    string? DateCompleted?;
    decimal? EstimatedEffort?;
    decimal? ActualTime?;
    TagItem[]? Tags?;
    int? AccountTaskTypeIDFK?;
    string? TaskStatusCode?;
    string? TaskStatusName?;
    boolean? isCompleteStatus?;
    decimal? PercentComplete?;
    string? TaskPriorityCode?;
    string? TaskPriorityName?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type Currency record {
    string? CurrencyCode?;
    string? Name?;
    string? Symbol?;
    string? Symbol2?;
    int? DecimalPlaces?;
};

public type ExpenseSummaryResult record {
    string? ExpenseDateFrom?;
    string? ExpenseDateTo?;
    decimal? TotalAmount?;
    int[]? UserID?;
    string[]? GroupingLevels?;
    ExpenseSummaryGroup[]? GroupData?;
};

public type TaxList record {
    TaxItem[]? Taxes?;
};

public type NewTag record {
    string? Name?;
    # Hex color code in format #000000
    string? Color?;
};

public type ScheduleSeriesList record {
    ScheduleSeriesDetails[]? ScheduleSeries?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type UpdateTask record {
    int? TaskID;
    string[]? FieldsToUpdate;
    int? SectionIDFK?;
    string? Title?;
    string? Description?;
    int? AssignedToUserIDFK?;
    string? DateStart?;
    string? DateDue?;
    string? TaskPriorityCode?;
    # Decimal hours
    decimal? EstimatedEffort?;
    string? TaskStatusCode?;
    int? PercentComplete?;
    NewTag[]? Tags?;
};

public type ExpenseMerchantDropdownList record {
    ExpenseMerchantMinimal[]? ExpenseMerchants?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type FixedAmountList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    FixedAmountDetails[]? FixedAmounts?;
};

public type CompanyContact record {
    int? ContactID?;
    int? CompanyIDFK?;
    string? CompanyName?;
    string? Firstname?;
    string? Lastname?;
    string? Email?;
    string? Phone?;
    string? Mobile?;
    string? PositionTitle?;
    string? TimeZone?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type NewTimesheet record {
    # UserID for a Timesheet user in Avaza
    int? UserIDFK?;
    # The project to associate the timesheet with.
    int? ProjectIDFK?;
    # The Project timesheet category to link the timesheet to
    int? TimesheetCategoryIDFK?;
    # The duration of the timesheet, in decimal hours. If null or 0, a timer will be started.
    decimal? Duration?;
    # Optional. False by default. Allows you to mark the timesheet as invoiced in an external system.
    boolean? isInvoiced?;
    # The date of the timesheet entry, with an optional start time component.
    string? EntryDate?;
    # If true, the start time will be take from the time component of the Entry Date field, and the end time will be calculated by adding the Duration to the StartDate
    boolean? hasStartEndTime?;
    # Timesheet Notes
    string? Notes?;
    # Optional. Link the timesheet to a specific task
    int? TaskIDFK?;
    # Optional. free nvarchar field available via Api to store any additional metadata against a timesheet. We suggest you use Json or your preferred serialisation format. 1000 characters max.
    string? CustomMetadata?;
};

public type RoleDetails record {
    string? RoleCode?;
    string? RoleName?;
};

public type ProjectTagItem record {
    int? ProjectTagID?;
    string? Name?;
};

public type EstimateLinks record {
    string? ClientView?;
    string? View?;
    string? Edit?;
};

public type PaymentList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    Payment[]? Payments?;
};

public type SectionDetails record {
    int? SectionID?;
    int? ProjectIDFK?;
    string? Title?;
    int? DisplayOrder?;
    string? StartDateUTC?;
    string? StartDate?;
    string? EndDateUTC?;
    string? EndDate?;
};

public type WebhookList record {
    WebhookDetails[]? Webhooks?;
};

public type ExpenseSummaryRequest record {
    # (Optional) Combine one, two or three levels of Grouping. Combine these possible grouping values: "Category", "ChargeableStatus", "Merchant", "ApprovalStatus", "ReimbursementStatus", "Customer", "Project", "User", "Task", "Year", "Month", "Day", "Week".
    string[]? GroupBy?;
    # (Required) Filter for expenses with expense dates greater or equal to the specified date. e.g. 2019-01-25.
    string? ExpenseDateFrom?;
    # (Required) Filter for expenses with an expense date smaller or equal to the specified  date. e.g. 2019-01-25.
    string? ExpenseDateTo?;
    # (Optional) Defaults to the current user. Provide one or more UserIDs of Users whose expenses should be retrieved. If the current user doesn't have impersonation rights, then they will only see their own data.
    int[]? UserID?;
    # (Optional) Filter by Project
    int? ProjectID?;
};

public type NewCompany record {
    string? CompanyName;
    string? CurrencyCode?;
    string? BillingAddressLine?;
    string? BillingAddressCity?;
    string? BillingAddressState?;
    string? BillingAddressPostCode?;
    string? BillingCountryCode?;
    string? BillingAddress?;
    string? Phone?;
    string? Fax?;
    string? website?;
    string? TaxNumber?;
    string? Comments?;
};

public type ProjectCompanyGroup record {
    int? CompanyID?;
    string? CompanyName?;
    ProjectDropdownSelection[]? projects?;
};

public type NewProjectMember record {
    boolean? isProjectManager?;
    boolean? isTimesheetAllowed?;
    boolean? isTimesheetApprover?;
    boolean? isTimesheetApprovalRequired?;
    boolean? canCreateTasks?;
    boolean? canDeleteTasks?;
    boolean? canCommentOnTasks?;
    boolean? canUpdateTasks?;
    # Required. The ProjectID
    int? ProjectIDFK?;
    # Required. The UserID to assign
    int? UserIDFK?;
    # Optional. If not provided, defaults to the User's default Cost Amount.
    decimal? CostAmount?;
    # Optional. If not provided, defaults to the User's default Rate Amount.
    decimal? RateAmount?;
    # Optional
    decimal? BudgetAmount?;
};

public type ProjectDropdownList record {
    # List of Projects grouped by Customer Name
    ProjectCompanyGroup[]? companies?;
    # Current page number (1 based)
    int? pageNumber?;
    # Current page size
    int? PageSize?;
    # More records probably exist
    boolean? hasMore?;
};

public type InvoiceLinks record {
    string? ClientView?;
    string? View?;
    string? Edit?;
};

public type NewProjectModel record {
    # An ID of a company in Avaza to create the Project under. You must provide either a CompanyID, or a CompanyName
    int? CompanyIDFK?;
    # The name for a Company to create the project under. Will create company unless it matches an existing company name
    string? CompanyName?;
    # The ISO 3 letter currency code to use when creating a new Company. If not provided, the account's default currency will be used.
    string? CurrencyCode?;
    # The title of the new project. (255 characters max)
    string? ProjectTitle;
    # Used when Manual Project Codes are enabled
    string? ProjectCode?;
    # Any descriptive notes about the project. (2000 characters max)
    string? ProjectNotes?;
    boolean? TimesheetApprovalRequiredbyDefault?;
    # Defaults to true.
    boolean? PopulateDefaultProjectMembers?;
    boolean? isTaskRequiredOnTimesheet?;
    string? StartDate?;
    string? EndDate?;
    decimal? BudgetAmount?;
    decimal? BudgetHours?;
    string? ProjectStatusCode?;
    int? ProjectCategoryIDFK?;
};

public type ExpenseList record {
    ExpenseDetails[]? Expenses?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type WebhookDetails record {
    int? SubscriptionID?;
    string? EventCode?;
    string? NotificationURL?;
    int? UserIDFK?;
};

public type UpdateExpense record {
    int? ExpenseID;
    string[]? FieldsToUpdate;
    # The date of the expense entry
    string? ExpenseDate?;
    # The expense category to link the Expense to.
    int? ExpenseCategoryIDFK?;
    # aka Billable. Defaults to false if not provided. If set to true, a CustomerIDFK or CustomerName must be provided.
    boolean? isChargeable?;
    # Defaults to false if not provided.
    boolean? isReimbursable?;
    # Conditional - available for expenses that are assigned a unit priced based expense category. e.g Mileage
    decimal? Quantity?;
    # The Avaza Customer ID to associate the Expense with.
    int? CustomerIDFK?;
    # The Avaza project ID to associate the Expense with.
    int? ProjectIDFK?;
    # (optional) TaskID of a Task to link the new Expense to. A Customer and Project must be provided also.
    int? TaskIDFK?;
    # A 3-letter ISO CurrencyCode for the expense currency. (e.g. USD). If not provided, defaults to the Account base currency.
    string? CurrencyCode?;
    # Optional (Only relevant if the expense currency is different to your account currency. If not provided we will look up the market exchange rate for you based on the expense date.) Exchange Rate = Expense Currency Amount / Base Currency Amount (e.g. if Expense currency is in AUD, and Base Currency is in USD, Exchange Rate = AUD $140 / USD $100 = 1.4)
    decimal? ExchangeRate?;
    # Expense Amount (Required). Must be &gt;= 0
    decimal? Amount?;
    # Avaza Tax ID the expense belongs to.
    int? TaxIDFK?;
    # Optional - Enter "INC" if the tax amount is included in the expense amount otherwise enter "EX" when the amount exlcudes the tax. Defaults to "Ex". The tax amount on the expense will be autocalculated.
    string? TransactionTaxConfigCode?;
    # Links the expense to a Grouping/Trip report. If no matching name found, creates a new Group/Trip Report name.
    string? GroupTripName?;
    # (Optional) ID of Expense Payment Method.
    int? ExpensePaymentMethodIDFK?;
    # The name of the merchant.
    string? Merchant?;
    # A Tax number identifier for the merchant.
    string? MerchantTaxNumber?;
    # Expense Notes
    string? Notes?;
    # Pass false if creating a draft expense. True otherwise.
    boolean? VerifyAndSave?;
    # Array of File Attachment IDs to associate with this expense. The files need to have already been uploaded. Currently only accepts a single file.
    int[]? FileAttachmentIDs?;
};

public type ExpensePaymentMethodMinimal record {
    int? ExpensePaymentMethodID?;
    string? Name?;
};

public type UpdateCompany record {
    int? CompanyID?;
    string[]? FieldsToUpdate?;
    string? CompanyName?;
    string? BillingAddressLine?;
    string? BillingAddressCity?;
    string? BillingAddressState?;
    string? BillingAddressPostCode?;
    string? BillingCountryCode?;
    string? BillingAddress?;
    string? Phone?;
    string? Fax?;
    string? website?;
    string? TaxNumber?;
    string? Comments?;
};

# New Estimate to be created
public type NewEstimate record {
    # A prefix for the Estimate number. e.g. 'INV'. If left blank it will be set to the account default. Max length 20 characters.
    string? EstimatePrefix?;
    # Pass any string. If left blank it will use the next number in the auto incrementing sequence. If an integer is passed then the largest integer will be use as the seed to auto generate the next Estimate number in the sequence.
    string? EstimateNumber?;
    # If left blank then you must specify Company Name.
    int? CompanyIDFK?;
    # If left blank then you must specify Company ID. Specified Name will be used to match existing customer record. If not matched then it will be used to create a new customer. First Name, Last Name and Email will only be used if it is a new company. If the Company name appears multiple times we will check the email address to find a matching company. If email address doesn't identify a matching company then the Estimate creation will be rejected.
    string? CompanyName?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Firstname?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Lastname?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Email?;
    # Expects ISO Standard 3 character currency code. If left blank the currency will default to account's currency in general setting. For existing companies this field will be ignored and the Estimate will use the currency of the customer. For new customers if the currency is not specified then account currency will be used otherwise the specified currency will be used.
    string? CurrencyCode?;
    # Exchange rate is only valid for Estimates in currency other than default account currency. If not specified it will get the market rate based on the Date Issued.
    decimal? ExchangeRate?;
    # If left blank the account default Estimate template will be used.
    int? InvoiceTemplateIDFK?;
    # Plain UTF8 text. (no HTML). 255 characters max
    string? Subject?;
    # Plain UTF8 text. 100 characters max
    string? CustomerPONumber?;
    # If not specified it will use today's date. The date should be specified as local date.
    string? DateIssued?;
    # It will be auto calculated based on the payment term and issue date. Due Date must be greater than or equal to Issue Date. If the Due Date is specified then Payment Terms will be set to -1 (Custom)
    string? DueDate?;
    # Possible values are (EX --- Tax Exclusive, INC --- Tax Inclusive). If left empty it will use the account default.
    string? EstimateTaxConfigCode?;
    # Plain UTF8 text. (no HTML). Max 2000 characters
    string? Notes?;
    # Line item to be added to new Estimate
    NewEstimateLineItem[]? LineItems?;
};

public type ExpenseGroupMinimal record {
    int? ExpenseGroupID?;
    string? Name?;
};

public type EditBooking record {
    int? ScheduleSeriesID?;
    int? UserIDFK?;
    decimal? HoursPerDay?;
    decimal? TotalDuration?;
    string? DurationType?;
    boolean? ScheduleOnDaysOff?;
    int? ProjectIDFK?;
    int? CategoryIDFK?;
    int? TaskIDFK?;
    string? Notes?;
    string? StartDate?;
    string? EndDate?;
};

public type ExpenseDeleteResultSet record {
    ExpenseDeleteResult[]? Results?;
};

public type InvoiceList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    Invoice[]? Invoices?;
};

public type ProjectTimesheetCategoryDetails record {
    int? TimeSheetCategoryIDFK?;
    int? AccountIDFK?;
    int? ProjectIDFK?;
    string? Name?;
    boolean? isBillable?;
    decimal? RateAmount?;
    decimal? BudgetHours?;
    decimal? CostAmount?;
};

public type TaskStatusList record {
    TaskStatusDetails[]? statuses?;
};

public type InventoryList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    InventoryItem[]? Inventory?;
};

public type ProjectList record {
    ProjectListDetails[]? Projects?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type CreditNoteLineItem record {
    int? TransactionLineItemID?;
    string? Description?;
    decimal? Quantity?;
    decimal? UnitPrice?;
    decimal? TaxAmount?;
    int? TaxIDFK?;
    decimal? Amount?;
    decimal? Discount?;
};

public type UpdateTimesheetModel record {
    int? TimeSheetEntryID;
    string[]? FieldsToUpdate;
    int? ProjectIDFK;
    int? TimesheetCategoryIDFK?;
    int? TaskIDFK?;
    decimal? Duration?;
    string? EntryDate?;
    boolean? hasStartEndTime?;
    string? Notes?;
    # Optional. free nvarchar field available via Api to store any additional metadata against a timesheet. We suggest you use Json or your preferred serialisation format. 1000 characters max.
    string? CustomMetadata?;
};

public type CompanyMinimal record {
    int? CompanyID?;
    string? CompanyName?;
};

public type FileAttachmentDetails record {
    int? FileAttachmentID?;
    int? SizeBytes?;
    string? OriginalFilename?;
    string? PublicFileURL?;
    string? PreviewBaseURL?;
};

public type ContactList record {
    CompanyContact[]? Contacts?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type ExpenseSummaryGroup record {
    string? GroupID?;
    string? GroupName?;
    decimal? TotalAmount?;
    ExpenseSummaryGroup[]? GroupData?;
};

public type TagItem record {
    int? TagID?;
    string? Name?;
    string? Color?;
};

public type TimesheetList record {
    TimesheetDetails[]? Timesheets?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type InvoiceLineItem record {
    int? TransactionLineItemID?;
    int? InventoryItemIDFK?;
    string? InventoryItemName?;
    string? InventoryItemSKU?;
    string? Description?;
    decimal? Quantity?;
    decimal? UnitPrice?;
    decimal? TaxAmount?;
    int? TaxIDFK?;
    string? TaxCode?;
    string? TaxName?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    decimal? Amount?;
    decimal? Discount?;
};

public type CompanyDropdownList record {
    CompanyMinimal[]? Companies?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type TaskSectionGroup record {
    string? SectionTitle?;
    TaskDropdownSelection[]? tasks?;
};

public type ProjectSectionDetails record {
    int? SectionID?;
    string? Title?;
    string? StartDate?;
    string? EndDate?;
    int? DisplayOrder?;
};

public type ScheduleAssignmentList record {
    ScheduleAssignmentDetails[]? ScheduleAssignments?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type NewExpense record {
    # The date of the expense entry (Required)
    string? ExpenseDate?;
    # UserID for a Timesheet/Expense user in Avaza. If not provided, UserEmail field must be provided
    int? UserIDFK?;
    # The email address of a Timesheet/Expense user in Avaza. If not provided, UserIDFK field must be provided.
    string? UserEmail?;
    # The expense category to link the Expense to. If not provided, ExpenseCategoryName must be provided
    int? ExpenseCategoryIDFK?;
    # Must match an existing expense category name otherwise a new category will be created. If left blank Expense Category ID must be provided.
    string? ExpenseCategoryName?;
    # aka Billable. Defaults to false if not provided. If set to true, a CustomerIDFK or CustomerName must be provided.
    boolean? isChargeable?;
    # Defaults to false if not provided.
    boolean? isReimbursable?;
    # Conditional - available for expenses that are assigned a unit priced based expense category. e.g Mileage
    decimal? Quantity?;
    # The Avaza Customer ID to associate the Expense with. Either this field or CustomerName can be provided.
    int? CustomerIDFK?;
    # The name of an existing customer in Avaza. Must be an exact (case insensitive) match.
    string? CustomerName?;
    # The Avaza project ID to associate the Expense with.
    int? ProjectIDFK?;
    # Can work for matching an expense to a project, but only if it's an exact match for a single project under the customer.
    string? ProjectName?;
    # (optional) TaskID of a Task to link the new Expense to. A Customer and Project must be provided also.
    int? TaskIDFK?;
    # A 3-letter ISO CurrencyCode for the expense currency. (e.g. USD). If not provided, defaults to the Account base currency.
    string? CurrencyCode?;
    # Optional (Only relevant if the expense currency is different to your account currency. If not provided we will look up the market exchange rate for you based on the expense date.) Exchange Rate = Expense Currency Amount / Base Currency Amount (e.g. if Expense currency is in AUD, and Base Currency is in USD, Exchange Rate = AUD $140 / USD $100 = 1.4)
    decimal? ExchangeRate?;
    # Expense Amount (Required). Must be &gt;= 0
    decimal? Amount?;
    # Avaza Tax ID the expense belongs to. If left blank then Tax Name must be provided.
    int? TaxIDFK?;
    # Must exactly match an existing Tax Name that you have configured in Avaza Tax settings. If left blank then Tax ID must be provided.
    string? TaxName?;
    # Optional - Enter "INC" if the tax amount is included in the expense amount otherwise enter "EX" when the amount exlcudes the tax. Defaults to "Ex". The tax amount on the expense will be autocalculated.
    string? TransactionTaxConfigCode?;
    # Links the expense to a Grouping/Trip report. If no matching name found, creates a new Group/Trip Report name.
    string? GroupTripName?;
    # (Optional) ID of Expense Payment Method.
    int? ExpensePaymentMethodIDFK?;
    # The name of the merchant.
    string? Merchant?;
    # A Tax number identifier for the merchant.
    string? MerchantTaxNumber?;
    # Expense Notes
    string? Notes?;
    # Pass false if creating a draft expense. True otherwise.
    boolean? VerifyAndSave?;
    # Array of File Attachment IDs to associate with this expense. The files need to have already been uploaded. Currently only accepts a single file.
    int[]? FileAttachmentIDs?;
};

public type Company record {
    int? CompanyID?;
    string? CompanyName?;
    string? BillingAddressLine?;
    string? BillingAddressCity?;
    string? BillingAddressState?;
    string? BillingAddressPostCode?;
    string? BillingCountryCode?;
    string? BillingAddress?;
    string? Phone?;
    string? Fax?;
    string? website?;
    string? TaxNumber?;
    string? Comments?;
    string? CurrencyCode?;
    int? DefaultTradingTermIDFK?;
    string? DateCreated?;
    string? DateUpdated?;
    CompanyContact[]? Contacts?;
};

public type CompanyList record {
    Company[]? Companies?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type ExpenseAttachmentBody record {
    # Upload software package
    string? File;
};

public type CreditNote record {
    int? TransactionID?;
    string? TransactionPrefix?;
    string? CreditNoteNumber?;
    int? CustomerIDFK?;
    string? DateIssued?;
    string? TransactionStatusCode?;
    decimal? Balance?;
    string? CurrencyCode?;
    decimal? TotalAmount?;
    string? Notes?;
    string? DateCreated?;
    string? DateUpdated?;
    CreditNoteAllocation[]? CreditNoteAllocations?;
    CreditNoteLineItem[]? CreditNoteLineItems?;
};

public type TaskList record {
    TaskDetails[]? Tasks?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};

public type EditLeave record {
    int? ScheduleSeriesID?;
    int? UserIDFK?;
    decimal? HoursPerDay?;
    int? LeaveTypeIDFK?;
    string? Notes?;
    string? StartDate?;
    string? EndDate?;
};

public type ProjectMemberDetails record {
    int? UserIDFK?;
    string? Firstname?;
    string? Lastname?;
    string? Fullname?;
    string? Email?;
    decimal? CostAmount?;
    decimal? RateAmount?;
    decimal? BudgetAmount?;
    boolean? isMemberDisabled?;
    boolean? isProjectManager?;
    boolean? isTimesheetAllowed?;
    boolean? isTimesheetApprover?;
    boolean? isTimesheetApprovalRequired?;
    boolean? canCreateTasks?;
    boolean? canDeleteTasks?;
    boolean? canCommentOnTasks?;
    boolean? canUpdateTasks?;
};

public type UserTagDetails record {
    int? UserTagID?;
    string? UserTagName?;
};

# New Subscription to be Created
public type CreateSubscription record {
    # The URL that should be notified of the event.
    string? target_url;
    # The event code to be notified about. Possible values: company_created, contact_created, invoice_created, invoice_sent, project_created, task_created
    string? event;
    # Optional Secret string (255 char max). If provided, the secret will be BASE 64 encoded and used as a basic authentication http header with webhook notifications. i.e. Authorization Basic [BASE64 of Secret]"
    string? secret?;
};

public type TimesheetSummaryGroup record {
    string? GroupID?;
    string? GroupName?;
    decimal? TotalHours?;
    decimal? BillableHours?;
    TimesheetSummaryGroup[]? GroupData?;
};

public type SubscribeResult record {
    int? ID?;
};

public type FixedAmountDetails record {
    int? FixedAmountID?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    string? ProjectCode?;
    int? TaskIDFK?;
    string? TaskTitle?;
    int? InventoryItemIDFK?;
    string? InventoryItemName?;
    decimal? Amount?;
    string? Notes?;
    boolean? isInvoiced?;
    string? DateCreated?;
    string? DateUpdated?;
    int? UpdatedByUserIDFK?;
};

public type UserDetails record {
    int? UserID?;
    int? AccountIDFK?;
    string? Email?;
    string? Firstname?;
    string? Lastname?;
    string? PositionTitle?;
    string? Phone?;
    string? Mobile?;
    # Windows Timezone ID
    string? TimeZone?;
    # IANA tz database timezone name
    string? IANATimezone?;
    boolean? isTeamMember?;
    int? CompanyIDFK?;
    string? CompanyName?;
    decimal? DefaultBillableRate?;
    decimal? DefaultCostRate?;
    decimal? MondayAvailableHours?;
    decimal? TuesdayAvailableHours?;
    decimal? WednesdayAvailableHours?;
    decimal? ThursdayAvailableHours?;
    decimal? FridayAvailableHours?;
    decimal? SaturdayAvailableHours?;
    decimal? SundayAvailableHours?;
    RoleDetails[]? Roles?;
    UserTagDetails[]? Tags?;
};

public type TimesheetDetails record {
    int? TimesheetEntryID?;
    int? UserIDFK?;
    string? Firstname?;
    string? Lastname?;
    string? Email?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    string? ProjectCode?;
    int? CustomerIDFK?;
    string? CustomerName?;
    int? TimesheetCategoryIDFK?;
    string? CategoryName?;
    decimal? Duration?;
    string? TimesheetEntryApprovalStatusCode?;
    boolean? HasTimer?;
    string? TimerStartedAtUTC?;
    boolean? isBillable?;
    boolean? isInvoiced?;
    string? EntryDate?;
    string? StartTimeLocal?;
    string? StartTimeUTC?;
    string? EndTimeLocal?;
    string? EndTimeUTC?;
    string? TimesheetUserTimeZone?;
    string? Notes?;
    int? TaskIDFK?;
    string? TaskTitle?;
    int? InvoiceIDFK?;
    int? InvoiceLineItemIDFK?;
    string? DateCreated?;
    string? DateUpdated?;
    string? DateApproved?;
    string? ApprovedBy?;
    string? CustomMetadata?;
};

# New invoice to be created
public type NewInvoice record {
    # A prefix for the Invoice number. e.g. 'INV'. If left blank it will be set to the account default. Max length 20 characters.
    string? TransactionPrefix?;
    # Pass any string. If left blank it will use the next number in the auto incrementing sequence. If an integer is passed then the largest integer will be use as the seed to auto generate the next invoice number in the sequence.
    string? InvoiceNumber?;
    # If left blank then you must specify Company Name.
    int? CompanyIDFK?;
    # If left blank then you must specify Company ID. Specified Name will be used to match existing customer record. If not matched then it will be used to create a new customer. First Name, Last Name and Email will only be used if it is a new company. If the Company name appears multiple times we will check the email address to find a matching company. If email address doesn't identify a matching company then the invoice creation will be rejected.
    string? CompanyName?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Firstname?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Lastname?;
    # Specified value will be used to create a new customer contact only if a new customer is being created.
    string? Email?;
    # Expects ISO Standard 3 character currency code. If left blank the currency will default to account's currency in general setting. For existing companies this field will be ignored and the invoice will use the currency of the customer. For new customers if the currency is not specified then account currency will be used otherwise the specified currency will be used.
    string? CurrencyCode?;
    # Exchange rate is only valid for invoices in currency other than default account currency. If not specified it will get the market rate based on the Date Issued.
    decimal? ExchangeRate?;
    # If left blank the account default invoice template will be used.
    int? InvoiceTemplateIDFK?;
    # Plain UTF8 text. (no HTML). 255 characters max
    string? Subject?;
    # Plain UTF8 text. 100 characters max
    string? CustomerPONumber?;
    # If not specified it will use today's date. The date should be specified as local date.
    string? DateIssued?;
    #  "If left blank we will set it to customer default. If specified then it must match one of your existing pre configured payment term periods. Your account starts with:
    # (-1 --- Custom, 0 --- Upon Receipt, 7 --- 7 Days, 15 --- 15 Days, 30 --- 30 Days, 45 --- 45 Days, 60 --- 60 Days)
    int? PaymentTerms?;
    # It will be auto calculated based on the payment term and issue date. Due Date must be greater than or equal to Issue Date. If the Due Date is specified then Payment Terms will be set to -1 (Custom)
    string? DueDate?;
    # Possible values are (EX --- Tax Exclusive, INC --- Tax Inclusive). If left empty it will use the account default.
    string? TransactionTaxConfigCode?;
    # Plain UTF8 text. (no HTML). Max 2000 characters
    string? Notes?;
    # Line item to be added to new invoice
    NewInvoiceLineItem[]? LineItems?;
};

public type PaymentAllocation record {
    int? TransactionAllocationID?;
    int? InvoiceTransactionIDFK?;
    int? PaymentTransactionIDFK?;
    string? AllocationDate?;
    decimal? AllocationAmount?;
};

public type ScheduleSeriesDetails record {
    int? ScheduleSeriesID?;
    int? AccountIDFK?;
    int? UserIDFK?;
    string? Firstname?;
    string? Lastname?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    int? CompanyIDFK?;
    string? CompanyName?;
    int? TimeSheetCategoryIDFK?;
    string? TimeSheetCategoryName?;
    int? LeaveTypeIDFK?;
    string? LeaveTypeName?;
    string? StartDate?;
    string? EndDate?;
    decimal? HoursPerDay?;
    decimal? TotalDuration?;
    boolean? ScheduleOnDaysOff?;
    string? Notes?;
    int? TaskIDFK?;
    string? TaskTitle?;
    string? DateCreated?;
    string? DateUpdated?;
    int? UpdatedByUserIDFK?;
};

public type AccountDetails record {
    int? AccountID?;
    string? CompanyName?;
    string? Subdomain?;
    string? AccountEmail?;
    boolean? hasStartEndTimesheets?;
    boolean? has24HourTimesheetFormat?;
    boolean? WeeklyTimesheetReminder?;
    boolean? LockApprovedTimesheets?;
    int? TimesheetDayOfWeek?;
    string? TimesheetDisplayFormatCode?;
    boolean? AllowHidingCompletedTasksOnTimesheet?;
    # Format: ISO "YYYY-MM-DD HH:mm:ss.SSS"
    string? CurrentServerTimeISO?;
    string? SC?;
    # ISO 3 letter base Currency Code for the account
    string? DefaultCurrencyCode?;
    # Whether the account requires expenses be approved.
    boolean? ExpenseApprovalRequired?;
    # Approved expenses get locked from subsequent editing by standard expense users.
    boolean? LockApprovedExpenses?;
};

# Line item to be added to new invoice
public type NewInvoiceLineItem record {
    # If not specified then Inventory Item Name must be specified.
    int? InventoryItemIDFK?;
    # If not specified then Inventory item ID must be specified. If specified and not matched to any existing inventory items then a new inventory item will be created. Max 200 characters.
    string? InventoryItemName?;
    # Plain UTF8 text. (no HTML)
    string? Description?;
    # The quantity for the line item
    decimal? Quantity;
    # The unit price for the lineitem.
    decimal? UnitPrice;
    # If specified then it must match an existing Tax ID. If not specified then Tax Name and Tax Percent must be specified.
    int? TaxIDFK?;
    # Must be specified if the Tax ID is blank. If the Tax Name is specified it will be matched to an existing Tax Name or else a new Tax will be created.
    string? TaxName?;
    # The Tax Percent will only be used if a new tax is being created.
    decimal? TaxPercent?;
    # Enter 10.5 to give a 10.5% discount
    decimal? Discount?;
    # Optional. Project ID of an Avaza Project that belongs to this customer, so line item is attributed to that Project for reporting.
    int? ProjectIDFK?;
};

public type SectionList record {
    SectionDetails[]? Sections?;
    int? TotalCount?;
};

public type TaskTypeList record {
    AccountTaskTypeDetails[]? tasktypes?;
};

public type Payment record {
    int? TransactionID?;
    int? AccountIDFK?;
    string? TransactionPrefix?;
    string? PaymentNumber?;
    string? TransactionReference?;
    int? CustomerIDFK?;
    string? DateIssued?;
    string? TransactionStatusCode?;
    string? PaymentProviderCode?;
    decimal? ExchangeRate?;
    decimal? Balance?;
    string? CurrencyCode?;
    decimal? TotalAmount?;
    string? Notes?;
    string? DateCreated?;
    string? DateUpdated?;
    PaymentAllocation[]? PaymentAllocations?;
};

public type ExpenseDetails record {
    int? ExpenseID?;
    int? UserIDFK?;
    string? Firstname?;
    string? Lastname?;
    string? Email?;
    int? CustomerIDFK?;
    string? CustomerName?;
    int? ProjectIDFK?;
    string? ProjectTitle?;
    string? ProjectCode?;
    int? TaskIDFK?;
    string? TaskTitle?;
    int? ExpenseCategoryIDFK?;
    string? ExpenseCategoryName?;
    boolean? ExpenseCategoryHasUnitPrice?;
    decimal? ExpenseCategoryUnitPrice?;
    string? ExpenseCategoryUnitName?;
    string? CurrencyCode?;
    decimal? ExchangeRate?;
    decimal? Quantity?;
    decimal? Amount?;
    decimal? TaxAmount?;
    int? TaxIDFK?;
    string? TaxName?;
    string? TransactionTaxConfigCode?;
    string? TransactionTaxConfigName?;
    boolean? isOfficialExchangeRate?;
    string? ExpenseApprovalStatusCode?;
    int? ExpensePaymentMethodIDFK?;
    string? ExpensePaymentMethodName?;
    boolean? isChargeable?;
    string? ChargeableStatusCode?;
    boolean? isReimbursable?;
    string? ExpenseReimbursementStatusCode?;
    int? ExpenseReimbursementIDFK?;
    string? ExpenseDate?;
    int? FileAttachmentIDFK?;
    string? AttachmentURL?;
    string? AttachmentPreviewURL?;
    string? Merchant?;
    string? MerchantTaxNumber?;
    string? Notes?;
    int? ExpenseReportIDFK?;
    string? ExpenseReportName?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type NewPaymentAllocation record {
    # The Avaza Invoice TransactionID that is having a payment amount allocated to it.
    int? InvoiceTransactionIDFK?;
    # The Amount being allocated to the invoice. Expects same currency as invoice currency
    decimal? AllocationAmount?;
    # Optional. Defaults to the current time in the Avaza account's timezone. The date the allocation is applied to the invoice. Can be difference from the Payment Date when doing prepayments etc.
    string? AllocationDate?;
};

public type ExpensePaymentMethodDropdownList record {
    ExpensePaymentMethodMinimal[]? ExpensePaymentMethods?;
};

public type ProjectDropdownSelection record {
    int? ProjectID?;
    string? ProjectCode?;
    string? Title?;
};

public type ExpenseDeleteResult record {
    int? ExpenseID?;
    boolean? Success?;
    string? ErrorMessage?;
};

public type EstimateList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    EstimateDetails[]? Estimates?;
};

public type CreditNoteAllocation record {
    int? TransactionAllocationID?;
    int? InvoiceTransactionIDFK?;
    int? CreditNoteTransactionIDFK?;
    string? AllocationDate?;
    decimal? AllocationAmount?;
};

public type InventoryItem record {
    int? InventoryItemID?;
    string? Name?;
    string? Description?;
    string? SKU?;
    decimal? CostPrice?;
    decimal? SalePrice?;
    int? SaleTaxIDFK?;
    boolean? isHidden?;
    string? DateCreated?;
    string? DateUpdated?;
};

# Line item to be added to new Estimate
public type NewEstimateLineItem record {
    # If not specified then Inventory Item Name must be specified.
    int? InventoryItemIDFK?;
    # If not specified then Inventory item ID must be specified. If specified and not matched to any existing inventory items then a new inventory item will be created. Max 200 characters.
    string? InventoryItemName?;
    # Plain UTF8 text. (no HTML)
    string? Description?;
    # The quantity for the line item
    decimal? Quantity;
    # The unit price for the lineitem.
    decimal? UnitPrice;
    # If specified then it must match an existing Tax ID. If not specified then Tax Name and Tax Percent must be specified.
    int? TaxIDFK?;
    # Must be specified if the Tax ID is blank. If the Tax Name is specified it will be matched to an existing Tax Name or else a new Tax will be created.
    string? TaxName?;
    # The Tax Percent will only be used if a new tax is being created.
    decimal? TaxPercent?;
    # Enter 10.5 to give a 10.5% discount
    decimal? Discount?;
};

public type RecipientDetails record {
    int? CompanyIDFK?;
    string? CompanyName?;
    string? RecipientFormattedBillingAddress?;
    string? RecipientBillingAddressLine?;
    string? RecipientBillingAddressCity?;
    string? RecipientBillingAddressState?;
    string? RecipientBillingAddressPostCode?;
    string? RecipientBillingAddressCountryCode?;
};

public type EstimateDetails record {
    int? EstimateID?;
    int? AccountIDFK?;
    string? EstimatePrefix?;
    string? EstimateItemNumber?;
    int? CompanyIDFK?;
    string? CompanyName?;
    string? Subject?;
    string? DateIssued?;
    string? DateSent?;
    string? DueDate?;
    string? EstimateStatusCode?;
    decimal? TaxAmount?;
    string? EstimateTaxConfigCode?;
    decimal? Balance?;
    string? CurrencyCode?;
    decimal? TotalAmount?;
    decimal? ExchangeRate?;
    string? Notes?;
    string? DateCreated?;
    string? DateUpdated?;
    EstimateLineItemDetails[]? LineItems?;
    EstimateLinks? Links?;
    IssuerDetails? Issuer?;
    RecipientDetails? Recipient?;
};

public type UpdateProjectModel record {
    # The ID of the Project to update
    int? ProjectID?;
    # 
    string[]? FieldsToUpdate?;
    # (optional) An updated project title. (255 characters max)
    string? ProjectTitle?;
    # (optional) Any descriptive notes about the project. (2000 characters max)
    string? ProjectNotes?;
    # Whether timesheet approval should be required by default for newly added project members.
    boolean? TimesheetApprovalRequiredbyDefault?;
    # Whether timesheets entered against this project require a task to be selected.
    boolean? isTaskRequiredOnTimesheet?;
    string? StartDate?;
    string? EndDate?;
    decimal? BudgetAmount?;
    decimal? BudgetHours?;
    # Update the project status (string, optional): (Possible values: NotStarted, InProgress, Complete, OnHold)
    string? ProjectStatusCode?;
    int? ProjectCategoryIDFK?;
    # The billing method of the project. (string, optional) Possible values: CategoryHourly, NoRate, NotBillable, PersonHourly, ProjectHourly
    string? ProjectBillableTypeCode?;
    # The project budgeting type. (string, optional) Possible values: NoBudget, PersonHours, ProjectFees, ProjectHours, CategoryHours
    string? ProjectBudgetTypeCode?;
};

public type ExpenseAttachmentUploadResult record {
    FileAttachmentDetails[]? FileAttachments?;
};

public type TimesheetSummaryRequest record {
    # (Optional) Combine one, two or three levels of Grouping. Combine these possible grouping values: "Customer", "Project", "Category", "User", "Task", "Year", "Month", "Day", "Week".
    string[]? GroupBy?;
    # (Required) Filter for timesheets greater or equal to the specified date. e.g. 2019-01-25. You can optionally include a time component, otherwise it assumes 00:00
    string? EntryDateFrom?;
    # (Required) Filter for timesheets with an entry date smaller or equal to the specified  date. e.g. 2019-01-25. You can optionally include a time component, otherwise it assumes 00:00
    string? EntryDateTo?;
    # (Optional) Defaults to the current user. Provide one or more UserIDs of Users whose timesheets should be retrieved. If the current user doesn't have impersonation rights, then they will only see their own data.
    int[]? UserID?;
    # (Optional) Filter by Project
    int? ProjectID?;
    # (Optional) Filter by the billable status of Timesheets.
    boolean? isBillable?;
    # (Optional) Filter for timesheets by whether they have been Invoiced or not.
    boolean? isInvoiced?;
};

public type ProjectListDetails record {
    int? ProjectID?;
    string? ProjectCode?;
    string? Title?;
    boolean? isArchived?;
    string? Notes?;
    string? CompanyName?;
    int? CompanyIDFK?;
    boolean? isTaskRequiredOnTimesheet?;
    int? DefaultAccountTaskTypeIDFK?;
    string? DefaultAccountTaskTypeName?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type ExpenseMerchantMinimal record {
    string? MerchantName?;
};

public type TaxComponent record {
    int? TaxComponentID?;
    int? TaxIDFK?;
    string? ComponentTaxCode?;
    string? Name?;
    decimal? Percentage?;
    boolean? isCompound?;
};

public type ScheduleAssignmentDetails record {
    int? ScheduleAssignmentID?;
    int? AccountIDFK?;
    int? UserIDFK?;
    int? ScheduleSeriesIDFK?;
    string? ScheduleDate?;
    decimal? Duration?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type TaskDropdownSelection record {
    string? TaskID?;
    string? Title?;
};

public type EstimateLineItemDetails record {
    int? EstimateLineItemID?;
    int? InventoryItemIDFK?;
    string? InventoryItemName?;
    string? InventoryItemSKU?;
    string? Description?;
    decimal? Quantity?;
    decimal? UnitPrice?;
    decimal? TaxAmount?;
    int? TaxIDFK?;
    string? TaxCode?;
    string? TaxName?;
    decimal? Amount?;
    decimal? Discount?;
};

public type TaskDropdownList record {
    # List of Task grouped by Section
    TaskSectionGroup[]? sections?;
    # Current page number (1 based)
    int? pageNumber?;
    # Current page size
    int? PageSize?;
    # More records probably exist
    boolean? hasMore?;
};

public type CurrencyList record {
    Currency[]? Currencies?;
};

public type UserList record {
    UserDetails[]? Users?;
};

public type ExpenseCategoryList record {
    ExpenseCategoryDetails[]? Categories?;
};

public type ProjectDetails record {
    int? ProjectID?;
    string? Title?;
    string? ProjectCode?;
    string? Notes?;
    string? CompanyName?;
    int? CompanyIDFK?;
    int? ProjectOwnerUserIDFK?;
    # Possible values: NotStarted, InProgress, Complete
    string? ProjectStatusCode?;
    boolean? isArchived?;
    # Possible values: CategoryHourly, NoRate, NotBillable, PersonHourly, ProjectHourly
    string? ProjectBillableTypeCode?;
    # Possible Values: CategoryHours, NoBudget, PersonHours, ProjectFees, ProjectHours
    string? ProjectBudgetTypeCode?;
    decimal? BudgetAmount?;
    decimal? BudgetHours?;
    decimal? ProjectHourlyRate?;
    int? ProjectCategoryIDFK?;
    string? ProjectCategoryName?;
    boolean? isTaskRequiredOnTimesheet?;
    int? DefaultAccountTaskTypeIDFK?;
    string? DefaultAccountTaskTypeName?;
    # Html Hex Color Code starting with #
    string? ProjectCategoryColor?;
    string? StartDate?;
    string? EndDate?;
    ProjectSectionDetails[]? Sections?;
    ProjectMemberDetails[]? Members?;
    ProjectTagItem[]? ProjectTags?;
    string? DateCreated?;
    string? DateUpdated?;
};

public type TaskStatusDetails record {
    string? TaskStatusCode?;
    string? Name?;
    string? Color?;
    int? DisplayOrder?;
    boolean? isComplete?;
    int? AccountTaskTypeIDFK?;
    string? TaskTypeName?;
};

public type IssuerDetails record {
    string? BillingAddress?;
    string? BillingAddressLine?;
    string? BillingAddressCity?;
    string? BillingAddressState?;
    string? BillingAddressPostCode?;
    string? BillingCountryCode?;
    string? TaxNumber?;
};

public type CreditNoteList record {
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
    CreditNote[]? CreditNotes?;
};

public type NewCompanyContact record {
    int? CompanyIDFK?;
    string? CompanyName?;
    string? CurrencyCode?;
    string? CompanyBillingAddress?;
    string? CompanyBillingAddressLine?;
    string? CompanyBillingAddressCity?;
    string? CompanyBillingAddressState?;
    string? CompanyBillingAddressPostCode?;
    string? CompanyBillingAddressCountryCode?;
    string? ContactEmail;
    string? Firstname;
    string? Lastname;
    string? PositionTitle?;
    string? Mobile?;
    string? Phone?;
    boolean? UpdateExisting?;
};

public type NewSection record {
    int? ProjectIDFK?;
    string? Title?;
    string? StartDateUTC?;
    string? EndDateUTC?;
};

public type TaxItem record {
    int? TaxID?;
    string? TaxCode?;
    string? Name?;
    decimal? CalculatedPercent?;
    TaxComponent[]? TaxComponents?;
};

public type ProjectTimesheetCategoryList record {
    ProjectTimesheetCategoryDetails[]? Categories?;
};

public type CreateBooking record {
    int? UserIDFK?;
    decimal? HoursPerDay?;
    decimal? TotalDuration?;
    string? DurationType?;
    boolean? ScheduleOnDaysOff?;
    int? ProjectIDFK?;
    int? CategoryIDFK?;
    int? TaskIDFK?;
    string? Notes?;
    string? StartDate?;
    string? EndDate?;
};

public type ExpenseGroupDropdownList record {
    ExpenseGroupMinimal[]? ExpenseGroups?;
    int? TotalCount?;
    int? PageNumber?;
    int? PageSize?;
};
