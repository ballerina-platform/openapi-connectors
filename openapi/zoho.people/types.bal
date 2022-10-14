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

public type AttendanceEntryArr AttendanceEntry[];

public type BalanceData record {
    string balanceData;
};

public type PermittedCasePriority record {
    string sequence?;
    string optionValue?;
    string fcid?;
    string optionId?;
    string systemValue?;
};

public type CreatedcaseResponse record {
    CreatedcaseResponseResult result?;
    string message?;
    string uri?;
    int status?;
    CaseErrors errors?;
};

public type LeaveType record {
    string Name?;
    int PermittedCount?;
    int AvailedCount?;
    string|int Id?;
    string Unit?;
    string|int BalanceCount?;
};

public type CaseDetails record {
    boolean assignedToList?;
    FileList[] filesList?;
    CaseDetail caseDetails?;
    boolean needCategoryChange?;
    SLA sla?;
};

public type CaseErrors record {
    string desc?;
    string status?;
};

public type FormDetail record {
    int componentId?;
    boolean iscustom?;
    string displayName?;
    string formLinkName?;
    PermissionDetails PermissionDetails?;
    boolean isVisible?;
    ViewDetails viewDetails?;
};

public type SLA record {
    string nextViolation?;
    int currentStatus?;
    boolean isViolated?;
};

public type LatestAttendance record {
    LatestattendanceResponse response?;
};

public type FormDetailResponse record {
    FormdetailresponseResponse response?;
};

public type ViewDetails record {
    int view_Id?;
    string view_Name?;
};

public type ShiftList record {
    string date?;
    string shiftId?;
    string shiftName?;
    string shiftColor?;
    string shiftStartTime?;
    string shiftEndTime?;
    boolean isWeekend?;
};

public type DepartmentResponse record {
    int Response?;
    string pkId?;
    int code?;
    string|record {}|record {}[] message?;
    int errorcode?;
    int 'Response\ status?;
};

public type CaseList record {
    CaselistResponse response?;
};

public type HolidaysResponse record {
    Holiday[] result?;
    string message?;
    string uri?;
    int status?;
    string error_msg?;
    int error_code?;
    Errors errors?;
};

public type LeaveInfo record {
    int taken?;
    string leavetypeName?;
    int available?;
    string 'type?;
    string leavetypeColor?;
    int leavetypeID?;
};

public type BalanceDataResponse record {
    BalancedataresponseResponse response?;
};

public type Records record {
    RecordsResponse response?;
};

public type CasedetailsresponseResponse record {
    CaseDetails result?;
    string message?;
    string uri?;
    int status?;
    CaseErrors errors?;
};

public type Agent record {
    string empid?;
    boolean allowPickup?;
    string valueId?;
    string erecno?;
    string employeePhoto?;
    string name?;
    string details?;
    string typeId?;
    string 'type?;
    string zuid?;
    string employeeEmailAlias?;
};

public type BalancedataresponseResponse record {
    record {} result?;
    string message?;
    string uri?;
    int status?;
    record {}|record {}[] errors?;
};

public type FileList record {
    string fileName?;
    string downloadUrl?;
    string filesize?;
    string fileUploadId?;
};

public type OnboardingResponse record {
    string msg?;
    boolean Success?;
};

public type FormdetailresponseResponse record {
    FormDetail[] result?;
    string message?;
    string uri?;
    int status?;
    record {}|record {}[] errors?;
};

public type Errors record {
    int code?;
    string message?;
};

public type Fields record {
    string comptype?;
    record {} Options?;
    string description?;
    string labelname?;
    boolean ismandatory?;
    string displayType?;
    int ReferedFormId?;
    boolean isPrimary?;
    string displayname?;
    string autofillvalue?;
    int formcomponentid?;
    string ReferedFormName?;
    int ReferedFieldId?;
    string ReferedFieldName?;
    int maxLength?;
};

public type CaseDetail record {
    string sourceId?;
    string agentId?;
    Agent agent?;
    PermittedCaseStatus[] permittedCaseStatus?;
    PermittedCasePriority[] permittedCasePriority?;
    string subject?;
    string description?;
    string 'source?;
    string categoryName?;
    string priorityId?;
    boolean isAgent?;
    string caseId?;
    string createdTime?;
    PermittedCaseSource[] permittedCaseSource?;
    boolean isEscalatedUser?;
    string agentValueId?;
    string agentTypeId?;
    string priority?;
    Requestor requestor?;
    string agentDetails?;
    string statusId?;
    string categoryIcon?;
    string categoryId?;
    string status?;
};

public type FormRecordResponse record {
    FormrecordresponseResponse response?;
};

public type LeaveReport record {
    string employeeName?;
    string employeeId?;
    LeaveInfo[] leavetypes?;
};

public type CreatedCase record {
    CreatedcaseResponse response?;
};

public type ShiftUpdate record {
    ShiftupdateResult result?;
    string msg?;
};

public type OnboardingType string;

public type BulkAttendance record {
    string response?;
};

public type CaseCategoryResult record {
    boolean isAgent?;
    string categoryIcon?;
    boolean isEnabled?;
    SubCategory[] subCategoryList?;
    string categoryShortDescription?;
    boolean enable_moderation?;
    string serviceId?;
    anydata[] applicableLocations?;
    string categoryName?;
    string categoryId?;
};

public type AttendanceEntryInfo record {
    string checkIn?;
    string checkOut_Location?;
    string sourceOfPunchOut?;
    string checkIn_Location?;
    string checkOut?;
    string sourceOfPunchIn?;
};

public type CaselistResponse record {
    CaselistResponseResult result?;
    string message?;
    string uri?;
    int status?;
};

public type LatestattendanceResponse record {
    LatestAttendanceEntries[] result?;
    string message?;
    string uri?;
    string status?;
};

public type UserShiftDetails record {
    string employeeName?;
    string erecno?;
    string employeePhoto?;
    string locationId?;
    string emailId?;
    string employeeId?;
    boolean isShiftEditable?;
    ShiftList[] shiftList?;
};

public type FormFields record {
    FormfieldsResponse response?;
};

public type Leave record {
    string Employee_ID?;
    record {} DayDetails?;
    string 'Leavetype\.ID?;
    string From?;
    string Unit?;
    string ApprovalStatus?;
    string Daystaken?;
    string Reasonforleave?;
    string TeamEmailID?;
    string Leavetype?;
    string To?;
    string 'Employee\_ID\.ID?;
    string DateOfRequest?;
};

public type LeavetypesResponse record {
    LeaveType[] result?;
    string message?;
    string uri?;
    int status?;
    string error_msg?;
    int error_code?;
    Errors errors?;
};

public type AttendanceImportData record {
    string data;
};

public type Holidays record {
    HolidaysResponse response?;
};

public type LeavedetailResponse record {
    Leave[] result?;
    string message?;
    string uri?;
    int status?;
    Errors errors?;
};

public type LeaveTypes record {
    LeavetypesResponse response?;
};

public type RecordsResponse record {
    record {}[] result?;
    string message?;
    string uri?;
    int status?;
    record {}|record {}[] errors?;
};

public type ShiftupdateResult record {
    string msg?;
};

public type AttendanceEntry record {
    int inputType_in?;
    int inputType_out?;
    string tdate?;
    string fdate?;
    string punchIn?;
    string dateFormat?;
    string response?;
    int tsecs?;
    string msg?;
};

public type CasecategoryResponse record {
    CaseCategoryResult[] result?;
    string message?;
    string uri?;
    int status?;
};

public type Requestor record {
    string empid?;
    string erecno?;
    string employeePhoto?;
    string name?;
    string zuid?;
    string employeeEmailAlias?;
};

public type InputData record {
    string inputData;
};

public type CaselistResponseResult record {
    HrcaseList[] hrcaseList?;
    boolean isNextAvailable?;
};

public type FormfieldsResponse record {
    Fields[] result?;
    string message?;
    string uri?;
    int status?;
    Errors errors?;
};

public type FormrecordresponseResponse record {
    FormrecordresponseResponseResult result?;
    string message?;
    string uri?;
    int status?;
    record {}|record {}[] errors?;
};

public type LatestAttendanceEntries record {
    string firstName?;
    string lastName?;
    record {}[] entries?;
    int erecNo?;
    string employeeId?;
    string emailId?;
};

public type AllHolidays record {
    Holiday[] data?;
    string message?;
    string uri?;
    int status?;
    string error_msg?;
    int error_code?;
};

public type PermittedCaseSource record {
    string sequence?;
    boolean isReopenDisabled?;
    string optionValue?;
    string fcid?;
    string optionId?;
    string systemValue?;
};

public type CaseCategory record {
    CasecategoryResponse response?;
};

public type AttendanceEntries record {
    string firstIn?;
    string totalHrs?;
    AttendanceEntryInfo[] entries?;
    string lastOut_Location?;
    string lastOut?;
    boolean allowedToCheckIn?;
    string firstIn_Location?;
    string status?;
};

public type PermittedCaseStatus record {
    string sequence?;
    string optionValue?;
    string fcid?;
    string optionId?;
    string systemValue?;
};

public type LeaveDetail record {
    LeavedetailResponse response?;
};

public type Holiday record {
    boolean isRestrictedHoliday?;
    string ShiftName?;
    string Remarks?;
    string LocationId?;
    string ShiftId?;
    string|int Id?;
    string Date?;
    boolean isHalfday?;
    string Name?;
    string LocationName?;
    int Session?;
    string fromDate?;
    string toDate?;
};

public type PermissionDetails record {
    int Add?;
    int Edit?;
    int View?;
};

public type SubCategory record {
    string subcategoryname?;
    string subCategoryId?;
};

public type CreatedcaseResponseResult record {
    string zp_recordId?;
    string caseId?;
    string desc?;
    string status?;
};

public type CaseDetailsResponse record {
    CasedetailsresponseResponse response?;
};

public type HrcaseList record {
    Agent agent?;
    string subject?;
    SLA SLA?;
    string priority?;
    string categoryName?;
    Requestor requestor?;
    string priorityId?;
    string recordId?;
    string statusId?;
    string caseId?;
    string createdTime?;
    string categoryId?;
    string status?;
    boolean hasAttachment?;
};

public type FormrecordresponseResponseResult record {
    string pkId?;
    string message?;
};

public type ShiftDetails record {
    UserShiftDetails userShiftDetails?;
};
