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

public type AbsenceBalanceView record {
    Unit? unit?;
    Position? position?;
    # The balance for the time off, absence table or leave type.
    int? quantity?;
    AbsencePlan? absencePlan?;
    # The first day of leave for the corresponding leave type for which the balance is returned.
    string? dateOfFirstAbsence?;
    # The date for which the balance is returned.
    string? effectiveDate?;
    Category? category?;
    Worker? 'worker?;
};

public type UnitOfTime record {
    *InstanceModelReference;
};

public type ContentType record {
    *InstanceModelReference;
};

public type LeaveType record {
    *InstanceModelReference;
};

public type TimeOffRequestEventView record {
    BusinessProcessParameters? businessProcessParameters?;
    # Time Off Entries
    TimeOffRequestEntryView[]? days?;
};

public type WorkerData record {
    PrimaryJob? primaryJob?;
    Person? person?;
    # The employee’s additional jobs and international assignments.
    JobDataForWorker[]? additionalJobs?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Dependent record {
    *InstanceModelReference;
};

public type Unit record {
    *InstanceModelReference;
};

public type TimeOffDetailsView record {
    PositionInstanceModelRef? position?;
    # The comment on the time off entry.
    string? comment?;
    Reason? reason?;
    TimeOffType? timeOffType?;
    # The Quantity of the Time Off Entry in the units specified by the Unit response field.
    int? quantity?;
    Status? status?;
    # The Date of the Time Off Entry using the format yyyy-mm-dd.
    string? date?;
    Unit? unit?;
    Worker? 'worker?;
};

public type AbsenceContainerViewForBalance record {
    # The Time Off name for which the balance is returned.
    string? timeoffs?;
    # Descriptor for Absence Container based on Calendar Display Option
    string? descriptor?;
    # Returns the Absence Table for the Absence Balance.
    AbsenceTable[]? absenceTable?;
    # ID for Absence Container.
    string? id?;
};

public type WorkSpace record {
    *JobWorkspaceData;
};

public type PersonDataView record {
    # Returns the primary public work phone number for the worker.
    string? phone?;
    # Returns the public primary work email address for the worker.
    string? email?;
    # Id of the instance
    string? id?;
};

public type CountryDataForLocationData record {
    # A preview of the instance
    string? descriptor?;
};

public type TimeOffRequestAbsenceTypeView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type EntryOption record {
    *InstanceModelReference;
};

public type ValidationErrorModelReference record {
    *ErrorModelReference;
    # An array of validation errors
    ErrorModelReference[]? errors?;
};

public type TimeOffType record {
    *CoordinatedTimeOffTypeView;
};

public type AdditionalFieldsLeavesOfAbsenceView record {
    # If true, the Leave Of Absence indicates a stillbirth or baby deceased, which may impact ~worker's~ leave entitlements.
    boolean? stillbirthBabyDeceased?;
    # The Stop Payment Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? stopPaymentDate?;
    # If true, the Leave Of Absence indicates a single parent, which may impact ~worker's~ leave entitlements.
    boolean? singleParentIndicator?;
    # The Child's Date Of Death additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? childsDateOfDeath?;
    # If true, the Leave Of Absence indicates multiple children, which may impact ~worker's~ leave entitlements.
    boolean? multipleChildIndicator?;
    # The Location During Leave text additional field for the Leave Of Absence.
    string? locationDuringLeave?;
    # The Number Of Babies Or Adopted Children numerical additional field for the Leave Of Absence.
    int? numberOfBabiesAdoptedChildren?;
    # The Date Child Entered ~Country~ additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? dateChildEnteredCountry?;
    # If true, the Leave Of Absence indicates a caesarean section birth, which may impact ~worker's~ leave entitlements.
    boolean? caesareanSectionBirth?;
    # The Date Of Recall additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? dateOfRecall?;
    # The Expected Due Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? expectedDueDate?;
    # The Last Date For Which Paid additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? lastDateForWhichPaid?;
    # The Child's Birth Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? childsBirthDate?;
    # The Number Of Previous Maternity Leaves numerical additional field for the Leave Of Absence.
    int? numberOfPreviousMaternityLeaves?;
    # If true, the Leave Of Absence is work related, which may impact Record Of Employment in Canada.
    boolean? workRelated?;
    # The Week Of Confinement Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? weekOfConfinement?;
    # The Adoption Notification Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? adoptionNotificationDate?;
    # The Date Baby Arrived Home From Hospital additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? dateBabyArrivedHomeFromHospital?;
    # The Leave Percentage numerical additional field for the Leave Of Absence.
    int? leavePercentage?;
    # The Number Of Previous Births numerical additional field for the Leave Of Absence.
    int? numberOfPreviousBirths?;
    Dependent? dependent?;
    # The Leave Entitlement Override numerical additional field for the Leave Of Absence.
    int? leaveEntitlementOverride?;
    # The Number Of Child Dependents numerical additional field for the Leave Of Absence.
    int? numberOfChildDependents?;
    # The Social Security Disability Code text additional field for the Leave Of Absence.
    string? socialSecurityDisabilityCode?;
    # The Adoption Placement Date additional field for the Leave Of Absence using the yyyy-mm-dd format.
    string? adoptionPlacementDate?;
    # The Age Of Dependent numerical additional field for the Leave Of Absence.
    int? ageOfDependent?;
};

public type Status record {
    *InstanceModelReference;
};

public type LocationDataJobView record {
    Country? country?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type BusinessProcessParameters2 record {
    OverallBusinessProcess? overallBusinessProcess?;
    Action? action;
    # Returns a null.
    string? comment?;
    # Returns the comments for the current business process.
    Comments[]? comments?;
    # Warning message for an action event triggered by a condition.
    string? warningValidations?;
    # Returns attachments associated with this business process that are uploaded from the toolbar and are accessible to the processing person. Returns blank if either of these conditions are not met.
    EventAttachmentsForToolbar[]? attachments?;
    # The current status of the business process.  For example: Successfully Completed, Denied, Terminated.
    string? overallStatus?;
    # Validation message for an action event triggered by a condition.
    string? criticalValidations?;
    For? for?;
};

public type AbsenceTable record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Position record {
    *PositionView;
};

public type LeaveImpactFields record {
    *LeaveImpactFieldsLeavesOfAbsenceView;
};

public type UnitOfTimeView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type For record {
    *InstanceModelReference;
};

public type FacetsModelReference FacetsModelReferenceInner[]?;

public type OverallBusinessProcess record {
    *InstanceModelReference;
};

public type TimeOffTypeAbsenceTypeView record {
    *TimeOffRequestAbsenceTypeView;
};

public type JobWorkspaceData record {
    # Location chain including bread crumbs for location.
    string? locationChain?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type UploadedBy record {
    *InstanceModelReference;
};

public type CoordinatedTimeOffTypeView record {
    # The Time Off Type Name or Absence Table Name for Coordinated Time Off Entry.
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type MultipleInstanceModelReference record {
    int? total?;
    InstanceModelReference[]? data?;
};

public type JobProfile record {
    *JobProfileJobView;
};

public type PrimaryJob record {
    *JobDataForWorker;
};

public type AbsenceReasonView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type LeavesOfAbsenceView record {
    # The Business Process Step Status of the Leave Of Absence.
    string? businessProcessStepStatus?;
    Reason? reason?;
    AdditionalFields? additionalFields?;
    # The Actual Last Day Of Work for the Leave Of Absence using the yyyy-mm-dd format.
    string? actualLastDayOfLeave?;
    # The Latest Leave Comment of the Leave Of Absence.
    string? latestLeaveComment?;
    Worker? 'worker?;
    # The Estimated Last Day Of Leave of the Leave Of Absence using the yyyy-mm-dd format.
    string? estimatedLastDayOfLeave?;
    # The Last Day Of Work of the Leave Of Absence using the yyyy-mm-dd format.
    string? lastDayOfWork?;
    LeaveImpactFields? leaveImpactFields?;
    PositionInstanceModelRef? position?;
    PriorLeaveEvent? priorLeaveEvent?;
    Status? status?;
    # The First Day Of Leave of the Leave Of Absence using the yyyy-mm-dd format.
    string? firstDayOfLeave?;
    LeaveType? leaveType?;
    # Id of the instance
    string? id?;
};

public type AbsencePlan record {
    *AbsenceContainerViewForBalance;
};

public type PersonInstanceModelRef record {
    *InstanceModelReference;
};

public type Country record {
    *CountryDataForLocationData;
};

public type EligibleAbsenceTypeView record {
    UnitOfTime? unitOfTime?;
    # If true, the time off type or leave type is position based.
    boolean? positionBased?;
    # The position associated to the time off or leave of absence.
    PositionView[]? position?;
    # The reason for the time off, absence table, or leave of absence.
    AbsenceReasonView[]? absenceReasons?;
    # If true, the time off type, absence table, or leave type requires a reason.
    boolean? reasonRequired?;
    # If true, the time off type has start and end times enabled.
    boolean? displayStartAndEndTime?;
    # Workday ID
    string? id?;
    Category? category?;
    # The additional field associated with a leave of absence type.
    EligibleAbsenceTypesAdditionalFieldView[]? additionalFields?;
    # Daily default quantity
    int? dailyDefaultQuantity?;
    AbsenceTypeGroup? absenceTypeGroup?;
    # If true, the quantity is based on the start and end times for the time off type.
    boolean? calculateQuantityBasedOnStartAndEndTime?;
    # Descriptor for Coordinated Absence Type
    string? descriptor?;
    EntryOption? entryOption?;
    # If true, the start and end times are required for the time off type.
    boolean? startAndEndTimeRequired?;
};

public type Person record {
    *PersonDataView;
};

public type UnitTimeView record {
    *UnitOfTimeView;
};

public type ErrorModelReference record {
    # A description of the error
    string? _error;
};

public type Action record {
    *InstanceModelReference;
};

public type TimeOffRequestEntryView record {
    # The start time of the time off entry.
    string? 'start?;
    # Time Off Entry date
    string? date?;
    Position? position?;
    # The end time of the time off entry.
    string? end?;
    Reason? reason?;
    # Time Off Entry hours
    int? dailyQuantity?;
    TimeOffTypeAbsenceTypeView? timeOffType?;
    # The comment on the time off entry.
    string? comment?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type Category record {
    *InstanceModelReference;
};

public type SupervisoryOrganizationJobView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

# collection something or other
public type InlineResponse200 record {
    EligibleAbsenceTypeView[]? data?;
    int? total?;
};

public type LeaveImpactFieldsLeavesOfAbsenceView record {
    # If true, the Leave Of Absence event has an effect on payroll.
    boolean? payrollEffect?;
    # If true, the Leave Of Absence event has a Professional Leave Effect leave impact field.
    boolean? professionalLeaveEffect?;
    # If true, the Leave Of Absence event has an effect on the ~worker's~ stock vesting schedule. It may require a change to the vesting schedule of any stock grants that the ~worker~ holds.
    boolean? stockVestingEffect?;
    # True if the leave event is for a leave type that is configured to allow a ~worker~ to be scheduled to work when placed on leave.
    boolean? schedulingEffect?;
    # If true, the ~worker~ on leave will be inactivated in the Workday system. If the leave type is position-based, the ~worker~ will not be inactive unless the ~worker~ is on leave for all positions with this effect.
    boolean? inactivateWorker?;
    # If true, the Leave Of Absence event has an effect on sabbatical eligibility. It may require a manual change to a ~worker's~ sabbatical records.
    boolean? sabbaticalEffect?;
    # If true, it has an impact on the ~worker's~ service accrual. It may need a manual change to the ~worker's~ service accrual.
    boolean? continuousServiceAccrualEffect?;
    # If true, it may require a change to the ~worker's~ benefits.
    boolean? benefitEffect?;
    # If true, Workday removes the ~worker~ on this type of leave from the ~Worker~ prompt of select ~worker~ reviews and feedback in talent.
    boolean? talentEffect?;
    # If true, the Leave Of Absence event has an effect on tenure eligibility. It may require a manual change to a ~worker's~ tenure records.
    boolean? tenureEffect?;
    # If true, it impacts the ~worker's~ absence accrual.
    boolean? absenceAccrualEffect?;
};

public type Reason record {
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

public type Worker record {
    *InstanceModelReference;
};

public type PositionInstanceModelRef record {
    *InstanceModelReference;
};

public type PositionView record {
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

public type EventAttachmentsForToolbar record {
    # Event attachment description
    string? description?;
    ContentType? contentType?;
    # File length of the attachment
    int? fileLength?;
    # Returns Date the Business Process Attachment was updated.
    string? uploadDate?;
    # File name of the attachment
    string? fileName?;
    UploadedBy? uploadedBy?;
    Category? category?;
    # Id of the instance
    string? id?;
};

public type PriorLeaveEvent record {
    *InstanceModelReference;
};

public type Comments record {
    # Gives the moment at which the instance was originally created.
    string? commentDate?;
    # Comment
    string? comment?;
    PersonInstanceModelRef? person?;
};

public type AbsenceTypeGroup record {
    *AbsenceTypeGroupView;
};

public type AdditionalFields record {
    *AdditionalFieldsLeavesOfAbsenceView;
};

public type JobTypeData record {
    # A preview of the instance
    string? descriptor?;
};

public type SupervisoryOrganization record {
    *SupervisoryOrganizationJobView;
};

public type JobProfileJobView record {
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type JobDataForWorker record {
    # The business title for the position.
    string? businessTitle?;
    SupervisoryOrganization? supervisoryOrganization?;
    JobType? jobType?;
    JobProfile? jobProfile?;
    Location? location?;
    WorkSpace? workSpace?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type EligibleAbsenceTypesAdditionalFieldView record {
    # True if Leave Additional Fields are required.
    boolean? required?;
    # A preview of the instance
    string? descriptor?;
    # Id of the instance
    string? id?;
};

public type BusinessProcessParameters record {
    *BusinessProcessParameters2;
};

public type JobType record {
    *JobTypeData;
};

# collection something or other
public type InlineResponse2001 record {
    LeavesOfAbsenceView[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2003 record {
    TimeOffDetailsView[]? data?;
    int? total?;
};

public type DailyQuantityView record {
    # The dates of the time off entry.
    string? date?;
    UnitTimeView? unit?;
    # The daily default quantity configured on the Time Off Plan or as an override on the Time Off.
    int? dailyDefaultQuantity?;
};

# collection something or other
public type InlineResponse2002 record {
    AbsenceBalanceView[]? data?;
    int? total?;
};

public type AbsenceTypeGroupView record {
    # Absence Type Group display order.
    string? displayOrder?;
    # Id of the instance
    string? id?;
    # A preview of the instance
    string? descriptor?;
};

# collection something or other
public type InlineResponse2005 record {
    WorkerData[]? data?;
    int? total?;
};

# collection something or other
public type InlineResponse2004 record {
    DailyQuantityView[]? data?;
    int? total?;
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

public type Location record {
    *LocationDataJobView;
};
