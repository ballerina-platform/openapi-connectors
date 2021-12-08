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

public type PhaseDetails record {
    # The name of the ~project plan phase~.
    string? name?;
    # The WBS UI id of ~Project Plan Phase~.
    string? rowId?;
    # The ~project tasks~ for the ~project phase~.
    TaskDetails[]? tasks?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Owner record {
    *InstanceModelReference;
};

public type UnitOfTime record {
    *InstanceModelReference;
};

public type Customer record {
    # The name of the customer.
    string? name?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type OrganizationSummary record {
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Activity record {
    InvoiceOpportunity? invoiceOpportunity?;
    # The check number for a customer payment. This is a reference number that's available only when processed through a settlement run and not a check number.
    string? paymentReference?;
    # The positive or negative sign of the transaction amount for this customer transaction. This is for internal use only on a REST API.
    record  { }  transactionAmountSigned?;
    # The date of the customer transaction. This field is for internal use only on a REST API.
    string? transactionDate?;
    # The transaction type of this customer transaction. This is for internal use only on a REST API.
    string? transactionType?;
    # The payment or application status of the customer invoice, customer invoice adjustment or customer invoice payment. For customer invoice payments, the application status can be Unapplied, Applied with On Account, or Fully Applied. For invoices, the payment status can be Paid, Partially Paid, or Unpaid.
    string? applicationStatus?;
    # The current status of the transaction. Applicable for all transaction types. This is for internal use only on a REST API.
    string? transactionStatus?;
    # The transaction number for the reporting transaction. This is for internal use only on a REST API.
    string? transactionNumber?;
    # The due date of the customer invoice or invoice adjustment as of the defined reporting date.
    string? invoiceDueDate?;
    # Returns the Workday ID for a given object.
    string? id?;
};

public type BusinessTitleChangeDetail record {
    # The business title for the ~worker~ prior to this business process.  If there is no business title override, this field defaults to the job title or job profile name.
    string? currentBusinessTitle?;
    # The new business title for the ~worker~ as of the effective date.  If there is no business title override, this field defaults to the job title or job profile name.
    string? proposedBusinessTitle?;
    # The date this business process takes effect.
    string? effective?;
    # The date the business process needs to be completed.
    string? due?;
    # The date and time this business process was initiated.
    string? initiated?;
    Initiator? initiator?;
    Subject? subject?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type TransactionStatus record {
    *InstanceModelReference;
};

public type TimeOffRef record {
    Plan? plan?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type UserActivityTracking record {
    Target? target?;
    # The user's IP Address from the user signon used to make the request.
    string? ipAddress?;
    # The client browser and operating system information from the user signon used to make this request.
    string? userAgent?;
    # The device type from the user signon used to make the request.
    string? deviceType?;
    # The Workday ID of the task executed in the transaction.
    string? taskId?;
    # The system account that initiated the request.
    string? systemAccount?;
    # The system id for tracking signons from the user signon used to make the request.
    string? sessionId?;
    # Returns the User Activity Count for the inputted filter parameters
    int? userActivityEntryCount?;
    # The request time of the action.
    string? requestTime?;
    # The action executed in the transaction.
    string? taskDisplayName?;
    # The type of action that was executed.
    string? activityAction?;
};

public type Manager record {
    *InstanceModelReference;
};

public type TimeOffEntries record {
    # The units entered for a time off request line item.
    int? units?;
    Employee? employee?;
    UnitOfTime? unitOfTime?;
    TimeOffRequest? timeOffRequest?;
    # The date requested to be taken for a paid time off request line item.
    string? date?;
    TimeOff? timeOff?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type BusinessObject record {
    *InstanceModelReference;
};

public type InboxTaskSummary record {
    Initiator? initiator?;
    StepType? stepType?;
    Status? status?;
    OverallProcess? overallProcess?;
    Subject? subject?;
    # Returns the due date for this step.
    string? due?;
    # Returns the date when the event record was last updated on.
    string? assigned?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type WorkerProfile record {
    # The primary work email address for the ~worker~.
    string? primaryWorkEmail?;
    # Identifies if the ~worker~ has a ~manager~ role.
    boolean? isManager?;
    # The primary work phone number for the ~worker~ including the area code and ~country~ code.
    string? primaryWorkPhone?;
    Location? location?;
    PrimarySupervisoryOrganization? primarySupervisoryOrganization?;
    # Returns the primary work address for the ~worker~, or from their default primary work location, full format on a single line.
    string? primaryWorkAddressText?;
    # The years of service for the ~worker~.
    int? yearsOfService?;
    # The business title for the ~worker's~ primary position. If no business title is defined for a position, the position title is returned back.
    string? businessTitle?;
    # The birth date of the ~worker~.
    string? dateOfBirth?;
    # All ~supervisory organizations~, excluding inherited organizations, in which the ~worker~ has a leadership role.
    string? supervisoryOrganizationsManaged?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type InvoiceOpportunity record {
    *OpportunityDisplay;
};

public type SupervisoryOrganizationSummary record {
    Manager? manager?;
    # Contains the ~workers~ in the organization.
    string? workers?;
    # The organization name for the organization.
    string? name?;
    # The organization id for the organization.
    string? code?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Initiator record {
    *InstanceModelReference;
};

public type TaskDetails record {
    # The start date of the ~project task~.
    string? startDate?;
    # The progress of the ~project task~.
    int? percentComplete?;
    # The WBS id of ~Project Plan Task~.
    string? rowId?;
    # The name of the ~project plan task~.
    string? name?;
    # The end date of the ~project task~.
    string? endDate?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type WorktagInput record {
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};

public type Status record {
    *InstanceModelReference;
};

public type WorkTagAndTypeInput record {
    # Do Not Use. This CRF can be used only by REST APIs.
    # Worktag types configured as required for a worktag with related worktags but not sent in the REST request.
    WorktagTypeInput[]? missingWorktagTypes?;
    WorkTagWithRequiredWorkTags? worktagWithRequiredWorktags?;
};

public type TimeOff record {
    *TimeOffRef;
};

public type WorkerOrganizationSummary record {
    OrganizationType? organizationType?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type JobChangeReasonSummary record {
    # Identifies whether the reason is allowed to be entered for ~contingent workers~.
    boolean? isForContingentWorker?;
    # Identifies whether the reason is allowed to be entered for ~employees~.
    boolean? isForEmployee?;
    # Identifies whether the reason is allowed to be entered by ~managers~.
    boolean? managerReason?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type JobChangeReason record {
    *InstanceModelReference;
};

public type PrimarySupervisoryOrganization record {
    *InstanceModelReference;
};

public type BusinessObjectFilter record {
    *InstanceModelReference;
};

public type Employee record {
    *InstanceModelReference;
};

public type OrganizationTypeSummary record {
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type ChangeJobInput record {
    SupervisoryOrganization? supervisoryOrganization?;
    JobChangeReason? jobChangeReason?;
    # Returns a boolean that indicates whether teams reporting to the ~Manager~ moved with them during the Change Job Event.
    boolean? moveManagersTeam?;
    # The date this business process takes effect.
    string? effective?;
    # Contains the organizations with staffing behavior that are assigned to the position as a result of this event.
    # All staffing behavior organization types are included (company, cost center, region, custom organizations, fund, grant, program, gift, business unit).
    ProposedStaffsInput[]? proposedOrganizations?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type OverallProcess record {
    *InstanceModelReference;
};

public type ValidateWorktagInput record {
    # Do Not Use. This CRF can be used only by REST APIs.
    # Indicates a set of validation types which should be included in the REST response. If this request parm is not present or is empty, then all validation types supported by the 'validateWorktags' REST API will be included in the response.
    WorkTagValidationTypeInput[]? validationTypes?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Restrictions to be validated in combination with the worktags.
    RestrictionInput[]? restrictions?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Represents the pair of invalid restrictions and a worktag with 'Restricted to' values.
    WorkTagAndRestrictionInput[]? invalidRestrictionsForWorktags?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Only one worktag value of type ~Project~, ~Project Phase~ or ~Project Task~ is allowed to be sent in the request. This error indicates that the set of worktags contains more than one worktag of these types.
    string? onlyOneProjectOrPhaseOrTaskAllowed?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Represents the pair of related worktag and missing required worktag types for that related worktag. Worktag Types can be configured as Required on Transaction on Maintain Related Worktag Usage or the in Related Worktag Widget.
    WorkTagAndTypeInput[]? missingRequiredWorktagTypesForWorktags?;
    # When TRUE, allowed worktag types in request are a union of tenant-configured worktags in 'Maintain Worktag Usage' for the taggable type in request + all promptable worktag types for Accounting Journal' taggable type that are not a promptable worktag type for the taggable type in the request.
    # When FALSE, no change in existing behavior (allowed worktag types in request are limited to tenant-configured worktags in 'Maintain Worktag Usage' for the taggable type in request)
    string? allowBuiltInWorktags?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Set of worktag types sent in the request that are not allowed by the Taggable configuration.
    WorktagTypeInput[]? nonAllowedWorktagTypesForTaggableConfig?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Worktag types which are configured as required for the Taggable configuration but are not sent in the request.
    WorktagTypeInput[]? missingRequiredWorktagTypesForTaggableConfig?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Set of inactive worktags sent in the request which are disallowed by the Taggable configuration.
    WorktagInput[]? nonAllowedInactiveWorktagValues?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Indicates whether the worktags sent in the request are valid or have any validation errors.
    string? status?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Set of worktags to be validated against tenant configurations such as allowed worktag types, required on transaction, related worktags and taggable configuration.
    WorktagInput[]? worktags?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Represents the pair of related worktag and a set of worktags which are not allowed by the configuration for that related worktag.
    WorkTagsComboInput[]? invalidWorktagCombinations?;
    TaggableConfiguration? taggableConfiguration?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Worktag types which are configured as required for the taggable configuration but are not explicitly sent in the request and are not defaulted from the related worktags.
    WorktagTypeInput[]? missingRequiredWorktagTypesAfterDefaulting?;
};

public type PaySlipSummary record {
    # Net Pay for a Payroll Result
    int? net?;
    # Gross Pay for a Payroll Result
    int? gross?;
    Status? status?;
    # Payment Date
    string? date?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type ErrorModelReference record {
    # A description of the error
    string? _error;
};

public type OpportunityDisplay record {
    # The non-unique name of the Opportunity. This is for internal use only.
    string? name?;
    # Returns the Workday ID for a given object.
    string? id?;
    # The Reference id to use for lookups within our Workday Web Services. For ~supervisory organizations~, this is also the 'Organization id'
    string? opportunityReferenceID?;
};

# collection something or other
public type InlineResponse2009 record {
    CurrencySummary[]? data?;
    int? total?;
};

public type WorkTagValidationTypeInput record {
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2008 record {
    PaySlipSummary[]? data?;
    int? total?;
};

public type BusinessTitleChangeInput record {
    # The new business title for the ~worker~ as of the effective date.  If there is no business title override, this field defaults to the job title or job profile name.
    string? proposedBusinessTitle?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type StepType record {
    *InstanceModelReference;
};

public type TimeOffEntryStatus record {
    # The current status of the business process.  For example: Successfully Completed, Denied, Terminated.
    string? status?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type RestrictionInput record {
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

# collection something or other
public type InlineResponse200 record {
    WorkerSummary[]? data?;
    int? total?;
};

public type EventRecordAssigneeView record {
    # ~Workers~ assigned to this step.
    WorkerSummary[]? assignedToWorkers?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type Target record {
    *InstanceModelReference;
};

public type InstanceModelReference record {
    # wid / id / reference id
    string? id;
    # A description of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
};

public type CurrencySummary record {
    # Currency id - 3 character currency code identified by ISO 4217
    string? code?;
    # Decimal precision for currency amounts
    int? precision?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type ProposedStaffsInput record {
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type WorkTagAndRestrictionInput record {
    WorkTagWithRestrictedToValues? worktagWithRestrictedToValues?;
    # Do Not Use. This CRF can be used only by REST APIs.
    # Indicates invalid 'Restricted To Values' for a worktag.
    RestrictionInput[]? invalidRestrictedToValues?;
};

public type TimeOffRequest record {
    *TimeOffEntryStatus;
};

public type WorktagWithAllowedValues record {
    *InstanceModelReference;
};

public type SupervisoryOrganization record {
    *InstanceModelReference;
};

public type OrganizationType record {
    *InstanceModelReference;
};

public type Plan record {
    *InstanceModelReference;
};

public type WorkTagWithRequiredWorkTags record {
    *InstanceModelReference;
};

public type Subject record {
    *InstanceModelReference;
};

public type WorkersCompletedMostRecentStep record {
    *WorkerSummary;
};

public type WorkTagWithRestrictedToValues record {
    *InstanceModelReference;
};

public type WorkerSummary record {
    # The primary work phone number for the ~worker~ including the area code and ~country~ code.
    string? primaryWorkPhone?;
    # Identifies if the ~worker~ has a ~manager~ role.
    boolean? isManager?;
    # The primary work email address for the ~worker~.
    string? primaryWorkEmail?;
    # The business title for the ~worker's~ primary position. If no business title is defined for a position, the position title is returned back.
    string? businessTitle?;
    PrimarySupervisoryOrganization? primarySupervisoryOrganization?;
    # A link to the instance
    string? href?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type TimeOffPlans record {
    # Returns the time off balance including pending events for the ~worker~ and time off plan.  This report field should be used within Calculated Fields.
    int? timeOffBalance?;
    UnitOfTime? unitOfTime?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

public type TaggableConfiguration record {
    *InstanceModelReference;
};

public type WorkTagsComboInput record {
    # Do Not Use. This CRF can be used only by REST APIs.
    # Set of worktags from the REST request which are not valid for the anchor worktag with allowed values.
    WorktagInput[]? invalidWorktagValues?;
    WorktagWithAllowedValues? worktagWithAllowedValues?;
};

# collection something or other
public type InlineResponse20010 record {
    UserActivityTracking[]? data?;
    int? total?;
};

public type BusinessProcessSummary record {
    Subject? subject?;
    Initiator? initiator?;
    # The date this business process takes effect.
    string? effective?;
    # The date the business process needs to be completed.
    string? due?;
    # The date and time this business process was initiated.
    string? initiated?;
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse2001 record {
    WorkerOrganizationSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse20012 record {
    Activity[]? data?;
    int? total?;
};

public type WorktagTypeInput record {
    # A preview of the instance
    string? descriptor?;
    # A link to the instance
    string? href?;
    # Id of the instance
    string? id?;
};

# collection something or other
public type InlineResponse20011 record {
    JobChangeReasonSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2003 record {
    TimeOffEntries[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse20014 record {
    OrganizationTypeSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2002 record {
    InboxTaskSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse20013 record {
    OrganizationSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2005 record {
    BusinessProcessSummary[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2004 record {
    TimeOffPlans[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2007 record {
    SupervisoryOrganizationSummary[]? data?;
    int? total?;
};

public type Location record {
    *InstanceModelReference;
};

# collection something or other
public type InlineResponse2006 record {
    BusinessTitleChangeDetail[]? data?;
    int? total?;
};
