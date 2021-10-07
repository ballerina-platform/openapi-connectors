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

public type TimeentryTimeentryMetaArguments record {
    # URI of the property
    TimeentryTimeentryMetaPropertyuri propertyUri?;
    # The value of the property.
    string propertyValue?;
};

public type TimeentryTimeentryMeta1Actions record {
    # Identifies the operation
    string operationID?;
    # Identifies the type of action to be taken to fulfill the request.  Action can be a callback to a service to complete the action.  A callback requires the methodCode and uris to be returned.  An external link i.e. open a web page - requires the uris of the external link; An object reference is a reference to a related object within the application.  This is a canonical name which represents the object.  Based on this identifier, the application knows what view it needs to open.  The uris returns the data for the view.  For an object reference, the objectRefID, methodCode, and uris are required . modify indicates that a property is being modified.
    string actionTypeCode?;
    # True indicates that the application will prompt the user to confirm the selected action. False indicates that the action will be executed once selected by the user.
    boolean requestConfirmationIndicator?;
    # True indicates that the SOR supports adding a comment when taking an action.
    boolean commentIndicator?;
    # True indicates that this is the default action.
    boolean defaultIndicator?;
    # True indicates that the user will have to select a date at which the action applies
    boolean effectiveDateIndicator?;
    # Default effective date shown to user. Requires effectiveDateIndicator to be set to true. Follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
    # Code identifying the color to associate to the action.  A positive action should be green (e.g. Approval) a negative action (e.g. Denial) should be red); red=FF0000, yellow=FFFF00, green=80FF00 using RGB codes.
    string colorCode?;
    # Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true.
    TimeentrydetailsTimeentrydetailsMetaAttestation attestation?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    TimeentryTimeentryMeta1Links[] links?;
};

# Status of the entry.  E.g. Employee Approved, Manager Approved
public type TimeentrydetailsTimeentrydetailsTimeentrystatus record {
    # The dynamic code.
    string code?;
    # The label which will be shown in the UI for the policy.
    string labelName?;
    # Effective date of the status change.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
};

public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsTimesheets record {
    # Unique identifier of the timeSheet
    string timeSheetID?;
    # The revision identifier of the timesheet.  This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name if used.
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsTimesheetrevid timeSheetRevID?;
    # The unique identifier of an person with a relationship to a given organization, e.g. an Associate OID.
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsAssociateid associateID?;
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsEntries[] entries?;
};

# geographical location information of the device
public type TimeentryTimeentryClockentryGeolocation record {
    # The coordinates of the location of the device as captured by the gps of the device.  Following the W3C Geolocation API Specification.  Reference: http://dev.w3.org/geo/api/spec-source.html#altitude
    TimeentrydetailsTimeentrydetailsClockpolicyCoordinate coordinate?;
    # Denotes the accuracy level of the latitude and longitude coordinates.  It is specified in meters.  The value must be a non-negative real number.  The value should correspond to a 95% confidence level
    TimeentryTimeentryClockentryGeolocationAccuracy accuracy?;
};

# The next scheduled time and event which the user is scheduled to punch the clock
public type TimeentrydetailsTimeentrydetailsClocksummaryNextscheduledclockentry record {
    # The date as logged by the device based on the clock reference time from the server. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm.  where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string entryDateTime?;
    string description?;
};

public type TimeentryTimeentryMeta1Arguments record {
    # URI of the property
    TimeentryTimeentryMeta1Propertyuri propertyUri?;
    # The value of the property.
    string propertyValue?;
};

public type TimeSheetsResolveExceptions record {
    # action taken to systematically resolve an exception on a timesheet.
    TimesheetsresolveexceptionsTimesheetsresolveexceptions timeSheetsResolveExceptions?;
};

public type TimeentrydetailsTimeentrydetailsEarningentrypolicyTimepairouttypecodes record {
    # The time pair code to be returned ot the systme of record
    string code?;
    # The verbose name of the code which will be shown on the UI for the user to select from
    string codeName?;
    # True indicates that this is the default value shown to the user
    boolean defaultIndicator?;
};

public type TimeentrydetailsTimeentrydetailsTimepairsummary record {
    # Unique identifier of the entry
    string entryID?;
    # earning code associated with the entry
    string codeName?;
    # Time Period covering the entries listed.  If the period is within a day the startDateTime and the duration is communicated.
    TimeentrydetailsTimeentrydetailsTimeperiod timePeriod?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsEntrynotes[] entryNotes?;
    # Codes that represent overrides that a user may select for the entry,e.g. if the worker is requesting to override the standard meal deduction for this entry, the code would identify the rule.  Example is that the worker is scheduled for lunch, but is working through lunch.  This tells the system that the worker is working through lunch and to not count the regularly scheduled lunch time
    TimeentrydetailsTimeentrydetailsEntryoverrides[] entryOverrides?;
};

# viewable time period
public type TimeentrydetailsTimeentrydetailsEarningentrypolicyViewabletimeperiod record {
    # start date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # end date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
};

# URI of the property
public type TimeentryTimeentryMeta1Propertyuri record {
    string href?;
};

# Denotes the accuracy level of the latitude and longitude coordinates.  It is specified in meters.  The value must be a non-negative real number.  The value should correspond to a 95% confidence level
public type TimeentryTimeentryClockentryGeolocationAccuracy record {
    # the radius (distance) that the person may clock in from the coordinate.
    decimal unitValue?;
    # unit which the range is communicated in
    string unitCode?;
};

# The unique identifier of a person with a relationship to a given organization, e.g. an Associate OID.
public type TimesheetsreviewTimesheetsreviewAssociateid record {
    # An ID.
    string idValue?;
    # The agency that issues the ID.
    string schemeAgencyName?;
    # The type of ID.
    string schemeName?;
    # The label of the related entity to show on the UI.
    string labelName?;
};

# Entry of number of Units such as days, mileage, or widgets
public type TimeentryTimeentryUnitentry record {
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # Code describing the units
    string code?;
    # the number of units
    decimal unitValue?;
    # the number of units
    decimal totalUnitValue?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue.  The actual total amount will show up in the list of entries
    TimeentryTimeentryUnitentryTotalamount totalAmount?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
};

# policies for entering earnings in hours, time, time hours, units, or currency
public type TimeentrydetailsTimeentrydetailsEarningentrypolicy record {
    # entry codes relevant to the user.  These are earnings codes or unit codes, or amount codes.
    TimeentrydetailsTimeentrydetailsEarningentrypolicyEntrycodes[] entryCodes?;
    # Precision by which time is logged.  Hours and Minutes, Hours and Hundreths of an Hour, etc..
    string hourPrecision?;
    # viewable time period
    TimeentrydetailsTimeentrydetailsEarningentrypolicyViewabletimeperiod viewableTimePeriod?;
    # Relevant for defaultPlanTypeCode = timenetry. Time period where the user can create a new entry.  This is mutually exclusive with the createTimePeriods.
    TimeentrydetailsTimeentrydetailsEarningentrypolicyCreatetimeperiod createTimePeriod?;
    # Relevant for defaultPlanTypeCode = timenetry. Time period where the user can create a new entry. This is mutually exclusive with the createTimePeriod.  This array should be sent if there are non-contiguous periods which are updateable.
    TimeentrydetailsTimeentrydetailsEarningentrypolicyCreatetimeperiods[] createTimePeriods?;
    # Validation Tables to be requested
    TimeentrydetailsTimeentrydetailsClockpolicyValidationtables[] validationTables?;
};

# Reference to an Associate
public type TimeentrydetailsTimeentrydetailsClocksummaryAssociateref record {
    string associateOID?;
    # Formatted name of the related associate
    TimeentrydetailsTimeentrydetailsClocksummaryAssociaterefPersonname personName?;
};

# A work shift
public type TimeentrydetailsTimeentrydetailsWorkshiftcode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# Column Name
public type TimeentrydetailsTimeentrydetailsClockpolicyTableHeaderColumns record {
    string columnName?;
    # Indicaites whether the column should be considered a primary key
    boolean primarykeyIndicator?;
    # Indicaites whether the column should be visible to the user or whether it is only used by the syste,
    boolean userVisibleIndicator?;
};

# action taken to complete the review process of a timesheet, a set of timesheets
public type TimesheetsreviewTimesheetsreview record {
    # List of Time Sheets which are being reviewed
    TimesheetsreviewTimesheetsreviewTimesheets[] timeSheets?;
};

# Indicates whether the user is entitled to absence notification and what if any are the associated validation tables for this capability
public type TimeentrydetailsTimeentrydetailsAbsencepolicy record {
    # True indicates that the user is entitle to report an absence via the absence notification application. Absence/Late Arrival should be accessible to the user from the springboard (i.e. main menu)
    boolean entitlementIndicator?;
    # Validation Tables to be requested
    TimeentrydetailsTimeentrydetailsAbsencepolicyValidationtables[] validationTables?;
};

# The type of remuneration, e.g. bonus, commission, etc.
public type TimeentrydetailsTimeentrydetailsRemunerationtypecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type TimeentrydetailsTimeentrydetailsTimeconfiguration record {
    # Position identifier a person may enter time against. 
    TimeentrydetailsTimeentrydetailsPositionid positionID?;
    # The title of the position
    string positionTitle?;
    # Clock Reference to be used to record time.  This allows the application to synchronize its time with that of the server.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string clockReferenceDateTime?;
    # Time Notation used when displaying time on the UI
    string timeNotationCode?;
    # True indicates that the System of Record supports the user entering notes / comments.  If the value is false then the notes / comments field will not be visible in the UI
    boolean noteIndicator?;
    # True indicates that the System of Record supports the private notes / comments, e.g. if the comment is entered by a manager / practitioner, the note author can specify if it should be visible by an employee.  Can be 'true' only if the user is a manager / practitioner
    boolean privateNoteIndicator?;
    # True indicates if a user can provide free form notes with a comment
    boolean freeFormNoteIndicator?;
    # True indicates that the System of Record supports the user entering notes / comments that exceed 250 characters in length.  If the value is false or omitted, the client should enforce the 250 characters limit to avoid the errors
    boolean longNoteIndicator?;
    # polices for the time clock paradigm for the user
    TimeentrydetailsTimeentrydetailsClockpolicy clockPolicy?;
    # policies for entering earnings in hours, time, time hours, units, or currency
    TimeentrydetailsTimeentrydetailsEarningentrypolicy earningEntryPolicy?;
    # Indicates whether the user is entitled to absence notification and what if any are the associated validation tables for this capability
    TimeentrydetailsTimeentrydetailsAbsencepolicy absencePolicy?;
    # Indicates whether the user is entitled to late arrival notification and what if any are the associated validation tables for this capability
    TimeentrydetailsTimeentrydetailsLatearrivalpolicy lateArrivalPolicy?;
    # Indicates whether the user is entitled to paid time off.  This is only used when the Time System is the only one which maintains the fine grain authorization on whether a user should have Paid Time Off capability or not.  The finer grain access, balances vs requests, etc... is returned in the paidTimeOffDetails API.  This only indicates if the user sees the capability (e.g. PTO chiclet accessible from the Springboard)
    TimeentrydetailsTimeentrydetailsPtopolicy ptoPolicy?;
};

public type TimeentrydetailsTimeentrydetailsEntryoverrides record {
    # The code for the related entity
    TimeentrydetailsTimeentrydetailsClocksummaryOverridecode overrideCode?;
    # Used to indicate if the override is applicable to a particular element of the time entry, e.g. in the context if a timePairEntry if the note applies to start or end time. Should not be in the payload if not applicable
    string appliesToElementName?;
};

# timeHoursEntry is the entry of hours which starts at a specific date and time
public type TimeentryTimeentryTimehoursentry record {
    # earning code associated with the entry
    string code?;
    # The effective data time that the time was taken
    TimeentryTimeentryTimehoursentryEffectivetimeperiod effectiveTimePeriod?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
};

# URI of the property
public type TimeentrydetailsTimeentrydetailsMetaPropertyuri record {
    string href?;
};

# Status of entry, e.g. Pending, Employee Approved, Manager approved
public type TimeentrydetailsTimeentrydetailsEntrystatus record {
    # The code for the related entry status
    string code?;
    # The label / description of the related entry status
    string labelName?;
    # Effective date of the status change. Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
};

# Data which provides reference to a position
public type TimeentryTimeentryMeta record {
    # Actions which the user is allowed to initiate against the related entity.  
    TimeentryTimeentryMetaActions[] actions?;
};

public type TimeentrydetailsTimeentrydetailsLatearrivalpolicyValidationtables record {
    # The label to be shown on the UI
    string labelName?;
    # Identifier of the Validation Table
    string tableID?;
    # Type of Validation Table
    string typeCode?;
    # Value of true indicates that the user must select a value from the list to return in the entry
    boolean requiredIndicator?;
    # The default value, so if the user is not changing the value from the default they don't have to make the API calls
    TimeentrydetailsTimeentrydetailsClockpolicyDefaultcode defaultCode?;
    # URI of the validation table
    TimeentrydetailsTimeentrydetailsClockpolicyTableuri tableUri?;
    # table
    TimeentrydetailsTimeentrydetailsClockpolicyTable 'table?;
};

public type TimesheetsreviewTimesheetsreviewEntries record {
    # Unique identifier of the entry
    string entryID?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # The revision identifier of the entry.  This may be an Etag or a System of Record generated key. The schemeName should be Etag for the scheme name
    TimesheetsreviewTimesheetsreviewEntryrevid entryRevID?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimesheetsreviewTimesheetsreviewTimeentrystatus timeEntryStatus?;
};

# The revision identifier of the entry.  This may be an Etag or a System of Record generated key. The schemeName should be Etag for the scheme name
public type TimesheetsreviewTimesheetsreviewEntryrevid record {
    # An ID.
    string idValue?;
    # The type of ID.
    string schemeName?;
};

public type TimeentryTimeentryEntrynotes record {
    # The unique identifier (if supported) of a note within a collection
    string itemID?;
    # Name of user who entered the comment
    string userName?;
    # Reference to an Associate
    TimeentrydetailsTimeentrydetailsClocksummaryAssociateref associateRef?;
    # The date time of the entry. Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DDThh:mm:ss+-hh:mm
    string entryDateTime?;
    # Used to indicate if the note is applicable to a particular element of the time entry, e.g. in the context if a timePairEntry if the note applies to start or end time. Should not be in the payload if not applicable
    string appliesToElementName?;
    # Type of the related time entry note, one of the pre-defined by the backend SOR
    TimeentrydetailsTimeentrydetailsClocksummaryCommenttype commentType?;
    # User entered actual note text
    string noteText?;
    # Flag to indicate whether a note created by a supervisor / practitioner should be private (e.g. not visible to an employee). The default value is false  (e.g. visible)
    boolean privateNoteIndicator?;
    # Code describing the data entitlements the user has on the note.  These are c - create, r - read, u - update, d- delete.  Read ('r')is the default value.  If the associate can not see the entry it should not be returned in the JSON
    string[] metadataEntitlementCodes?;
};

# dayPeriodEntry is used when the day period associated to an earning code.
public type TimeentryTimeentryDayperiodentry record {
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # earning code associated with the entry
    string code?;
    # Day period, e.g Morning, Afternoon, Whole day, etc.
    string dayPeriodValue?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentryTimeentryHoursentryEarningallocations[] earningAllocations?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
};

public type TimeentrydetailsTimeentrydetailsEntrysummary record {
    # Unique identifier of the timeSheet
    string timeSheetID?;
    # Identifier of the position which this entry is associated to.  A worker may have multiple positions in which case they would pass the relevant position.
    TimeentrydetailsTimeentrydetailsPositionid1 positionID?;
    # The title of the position
    string positionTitle?;
    # The Time Period which relates to a payment for time worked
    TimeentrydetailsTimeentrydetailsPayperiod payPeriod?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string totalPayPeriodHours?;
    # Status of the timesheet.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimesheetstatus timeSheetStatus?;
    # Code identifying the type of exception on the timeSheet. This is the highest exception.  That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype exceptionType?;
    # Metadata associated to the related object
    TimeentrydetailsTimeentrydetailsMeta meta?;
    # Totals for the payPeriod by earning code, rate code, earning allocations
    TimeentrydetailsTimeentrydetailsPayperioditemtotals[] payPeriodItemTotals?;
    # Totals per day by earning code, rate code, earning allocations
    TimeentrydetailsTimeentrydetailsDailyitemtotals[] dailyItemTotals?;
    TimeentrydetailsTimeentrydetailsEntries[] entries?;
};

# action taken to systematically resolve an exception on a timesheet.
public type TimesheetsresolveexceptionsTimesheetsresolveexceptions record {
    # List of Time Sheets which are being reviewed
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsTimesheets[] timeSheets?;
};

# URI to get paid time off details
public type TimeentrydetailsTimeentrydetailsPtopolicyPtouri record {
    string href?;
};

# Entry properties for the Time Clock paradigm.  User punches in
public type TimeentryTimeentryClockentry record {
    # The date as logged by the device based on the clock reference time from the server. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification. The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm.  where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string entryDateTime?;
    # The Action Code.  ClockIn/ClockOut
    string actionCode?;
    # Identifier if the geo location which the device was within a valid range.  This identifier is sent in the timeEntryDetails json (//clockPolicy/validGeoLocations/id)
    string validGeoLocationID?;
    # geographical location information of the device
    TimeentryTimeentryClockentryGeolocation geoLocation?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Codes that represent overrides that a user may select for the entry,e.g. if the worker is requesting to override the standard meal deduction for this entry, the code would identify the rule.  Example is that the worker is scheduled for lunch, but is working through lunch.  This tells the system that the worker is working through lunch and to not count the regularly scheduled lunch time
    TimeentrydetailsTimeentrydetailsClocksummaryEntryoverrides[] entryOverrides?;
};

# Code identifying the type of exception
public type TimeentryTimeentryExceptiontype record {
    # Code identifying 
    string code?;
};

# Status of the timesheet.  E.g. Employee Approved, Manager Approved
public type TimesheetsreviewTimesheetsreviewTimesheetstatus record {
    # The dynamic code.
    string code?;
};

# URI of the attestation, should be used instead of the text property if can be cachable
public type TimeentryTimeentryMetaAttestationResourceuri record {
    string href?;
};

# Time Period covering the entries listed.  If the period is within a day the startDateTime and the duration is communicated.
public type TimeentrydetailsTimeentrydetailsTimeperiod record {
    # The start date time of the time period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # The end date time of the time period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
};

# Code identifying the type of exception on the timeSheet. This is the highest exception.  That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
public type TimeentrydetailsTimeentrydetailsExceptiontype record {
    # Code identifying 
    string code?;
};

public type TimeentrydetailsTimeentrydetailsMetaActions record {
    # Identifies the operation
    string operationID?;
    # Identifies the type of action to be taken to fulfill the request.  Action can be a callback to a service to complete the action.  A callback requires the methodCode and uris to be returned. An external link i.e. open a web page - requires the uris of the external link; An object reference is a reference to a related object within the application. This is a canonical name which represents the object. Based on this identifier, the application knows what view it needs to open.  The uris returns the data for the view.  For an object reference, the objectRefID, methodCode, and uris are required . modify indicates that a property is being modified.
    string actionTypeCode?;
    # True indicates that the application will prompt the user to confirm the selected action. False indicates that the action will be executed once selected by the user.
    boolean requestConfirmationIndicator?;
    # True indicates that the SOR supports adding a comment when taking an action.
    boolean commentIndicator?;
    # True indicates that this is the default action.
    boolean defaultIndicator?;
    # Code identifying the color to associate to the action.  A positive action should be green (e.g. Approval) a negative action (e.g. Denial) should be red); red=FF0000, yellow=FFFF00, green=80FF00 using RGB codes.
    string colorCode?;
    # Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true.
    TimeentrydetailsTimeentrydetailsMetaAttestation attestation?;
    # True indicates that the user will have to select a date at which the action applies
    boolean effectiveDateIndicator?;
    # Default effective date shown to user. Requires effectiveDateIndicator to be set to true. Follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    TimeentrydetailsTimeentrydetailsMetaLinks[] links?;
};

public type TimeentrydetailsTimeentrydetailsTimehourssummary record {
    # Unique identifier of the entry
    string entryID?;
    # earning code associated with the entry
    string codeName?;
    # The effective data time that the time was taken
    TimeentrydetailsTimeentrydetailsEffectivetimeperiod effectiveTimePeriod?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsEntrynotes[] entryNotes?;
};

# Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true.
public type TimeentryTimeentryMetaAttestation record {
    # Text to present.  This is mutuallly exclusive with the resourceUri which is an external link to the text.  If the text is sizable and fairly static then it should be an external link which may be cached.
    string descTxt?;
    # URI of the attestation, should be used instead of the text property if can be cachable
    TimeentryTimeentryMetaAttestationResourceuri resourceUri?;
};

public type TimeentryTimeentryMetaLinks record {
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    #  The value of the href link description property is a template used to determine the target URI of the related resource.  The value of the instance property SHOULD be resolved as a URI-Reference per RFC 3986 [RFC3986] and MAY be a relative reference to a URI.
    string href?;
    # The HTTP method to use to traverse the link (GET, POST, PUT or DELETE).
    string method?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # A map that may be used as the basis for any data (arguments or properties) required to follow the link. 
    TimeentryTimeentryMetaArguments[] arguments?;
};

public type TimeSheetsReview record {
    # action taken to complete the review process of a timesheet, a set of timesheets
    TimesheetsreviewTimesheetsreview timeSheetsReview?;
};

# URI of the validation table
public type TimeentrydetailsTimeentrydetailsClockpolicyTableuri record {
    string href?;
};

# Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true.
public type TimeentrydetailsTimeentrydetailsMetaAttestation record {
    # message to present to the user.  This is mutuallly exclusive with the messageUri which is an external link to the message.  If the text is sizable and fairly static then it should be an external link which may be cached.
    string messageTxt?;
    # URI of the attestation message, should be used instead of the messageTxt property if it can be cached
    TimeentrydetailsTimeentrydetailsMetaAttestationMessageuri messageUri?;
};

public type TimeentrydetailsTimeentrydetailsDailyitemtotals record {
    # A unique identifier of a work assignment
    string itemID?;
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # earning code associated with the entry
    string codeName?;
    # Code identifying the rate
    TimeentrydetailsTimeentrydetailsRatecode rateCode?;
    # The type of remuneration, e.g. bonus, commission, etc.
    TimeentrydetailsTimeentrydetailsRemunerationtypecode remunerationTypeCode?;
    # A work shift
    TimeentrydetailsTimeentrydetailsWorkshiftcode workShiftCode?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string hoursValue?;
    # total number of units
    decimal totalUnitValue?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue. The actual total amount will show up in the list of entries
    TimeentrydetailsTimeentrydetailsTotalamount totalAmount?;
    # Identifies the pay  If the earnings are to be split across check then the earnings are associated to the appropriate payNumber which it needs to be associated to.  Example if regular pay and vacation pay goes on one check (payNumber=0) and holiday pay goes on a separate check with payNumber=1
    string payNumber?;
};

# The code for the related entity
public type TimeentrydetailsTimeentrydetailsClocksummaryOverridecode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code
    string shortName?;
    # Long description of the related code
    string longName?;
};

public type TimeentryTimeentryMetaActions record {
    # Identifies the operation
    string operationID?;
    # Identifies the type of action to be taken to fulfill the request.  Action can be a callback to a service to complete the action.  A callback requires the methodCode and uris to be returned. An external link i.e. open a web page - requires the uris of the external link; An object reference is a reference to a related object within the application. This is a canonical name which represents the object. Based on this identifier, the application knows what view it needs to open.  The uris returns the data for the view.  For an object reference, the objectRefID, methodCode, and uris are required . modify indicates that a property is being modified.
    string actionTypeCode?;
    # True indicates that the application will prompt the user to confirm the selected action. False indicates that the action will be executed once selected by the user.
    boolean requestConfirmationIndicator?;
    # True indicates that the SOR supports adding a comment when taking an action.
    boolean commentIndicator?;
    # True indicates that this is the default action.
    boolean defaultIndicator?;
    # Code identifying the color to associate to the action.  A positive action should be green (e.g. Approval) a negative action (e.g. Denial) should be red); red=FF0000, yellow=FFFF00, green=80FF00 using RGB codes.
    string colorCode?;
    # Optional text provided to the user when they take an action to affirm to be correct, true, or genuine. Requires confirmation indicator to be set to true.
    TimeentryTimeentryMetaAttestation attestation?;
    # A link description object is used to describe link relations.  In the context of a schema, it defines the link relations of the instances of the schema, and can be parameterized by the instance values.  The link description format can be used on its own in regular (non-schema documents), and use of this format can be declared by referencing the normative link description schema as the the schema for the data structure that uses the links.
    TimeentryTimeentryMetaLinks[] links?;
};

# Header Record.  Provides the metadata of a table.  This includes the columns
public type TimeentrydetailsTimeentrydetailsClockpolicyTableHeader record {
    decimal numberOfColumns?;
    # Table Title Name
    string titleName?;
    # A code indicating the formatting to apply to the row.  For example, a heading row would be bold.
    string[] formatTypeCodes?;
    # The names of the columns in the table.  The order in the array is the implied order of the columns from left to right.
    TimeentrydetailsTimeentrydetailsClockpolicyTableHeaderColumns[] columns?;
};

# Total Hours for the Day
public type TimeentrydetailsTimeentrydetailsTotalhours record {
    string hourValue?;
    string unitTimeCode?;
};

public type TimeentrydetailsTimeentrydetailsDayperiodsummary record {
    # Unique identifier of the entry
    string entryID?;
    # earning code associated with the entry
    string codeName?;
    # Indicates the morning, afternoon or the whole day
    string dayPeriodValue?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
};

public type TimeentrydetailsTimeentrydetailsEntries record {
    # Status of entry, e.g. Pending, Employee Approved, Manager approved
    TimeentrydetailsTimeentrydetailsEntrystatus entryStatus?;
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # Total Hours for the Day
    TimeentrydetailsTimeentrydetailsTotalhours totalHours?;
    # Details of an entry
    TimeentrydetailsTimeentrydetailsEntrydetail[] entryDetail?;
};

public type TimeentrydetailsTimeentrydetailsMetaLinks record {
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    #  The value of the href link description property is a template used to determine the target URI of the related resource.  The value of the instance property SHOULD be resolved as a URI-Reference per RFC 3986 [RFC3986] and MAY be a relative reference to a URI.
    string href?;
    # The HTTP method to use to traverse the link (GET, POST, PUT or DELETE).
    string method?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # A map that may be used as the basis for any data (arguments or properties) required to follow the link. 
    TimeentrydetailsTimeentrydetailsMetaArguments[] arguments?;
};

# the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue.  The actual total amount will show up in the list of entries
public type TimeentryTimeentryUnitentryTotalamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Specifies the currency code of the object in which it is associated
    string currencyCode?;
};

# components of an address.  Only the relevant components are included
public type TimeentrydetailsTimeentrydetailsClockpolicyLocationrefAddress record {
    # Identifies the town or city.
    string cityName?;
    # Qualifies the further division of the Country. These may be Districts, Regions, States, Provinces etc. A possible list of values is as specified in ISO 3166-2. 
    string countrySubdivisionCode?;
};

public type TimeentrydetailsTimeentrydetailsClocksummaryEntryoverrides record {
    # The code for the related entity
    TimeentrydetailsTimeentrydetailsClocksummaryOverridecode overrideCode?;
    # Used to indicate if the override is applicable to a particular element of the time entry, e.g. in the context if a timePairEntry if the note applies to start or end time.  Should not be in the payload if not applicable
    string appliesToElementName?;
};

# Status of the entry.  E.g. Employee Approved, Manager Approved
public type TimesheetsreviewTimesheetsreviewTimeentrystatus record {
    # The dynamic code.
    string code?;
};

public type TimeentrydetailsTimeentrydetailsHourssummary record {
    # Unique identifier of the entry
    string entryID?;
    # earning code associated with the entry
    string codeName?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string hoursValue?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsEntrynotes[] entryNotes?;
};

public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsExceptions record {
    # Unique identifier of the exception
    string exceptionID?;
    # The revision identifier of the exception. This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name if Etag is used.
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsExceptionrevid exceptionRevID?;
    # The exception code
    string code?;
    # A systematic resolution of an exception
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsSolution solution?;
};

# URI of the attestation message, should be used instead of the messageTxt property if it can be cached
public type TimeentrydetailsTimeentrydetailsMetaAttestationMessageuri record {
    string href?;
};

public type TimeentrydetailsTimeentrydetailsEarningentrypolicyEntrycodes record {
    # code identifying the worked, non-worked, or expense entry.
    string code?;
    # The label which will be shown in the UI for the Earning Code.  Examples are Worked, Vacation, Jury Duty, Bereavement.  This is SOR specific, therefore there is no enumeration defined.
    string codeName?;
    # The entry type identifies the data which will be captured for the entry and maps directly to the name of the object in timeEntry
    string entryTypeCode?;
    # The category, which identifies the entry type.  Used to categorize the entry comments, etc.
    string entryTypeCategoryCode?;
    # The rate for unit entries.  The application will multiply the rate by the unitValue to show the total to the user.  If the SOR calculates the rate then a rate of 1 will be passed.
    TimeentrydetailsTimeentrydetailsEarningentrypolicyRateamount rateAmount?;
    # Currency to be used for unit entries. Relevant only for unit entries.  References ISO 4212 currency codes
    string defaultCurrencyCode?;
    # This array is only present for a time pair entry and if the system allows the user to override the entry out type.  Values are passed by the System of Record.  If not present the drop down is not shown
    TimeentrydetailsTimeentrydetailsEarningentrypolicyTimepairouttypecodes[] timePairOutTypeCodes?;
    # True indicates that this value should be the one which the earning code defaults to if the user does not select a different one.
    boolean defaultIndicator?;
};

public type TimeentrydetailsTimeentrydetailsEntrydetail record {
    # List of Time Clock Entires for a given period.  The period is determined by the System of Record.
    TimeentrydetailsTimeentrydetailsClocksummary clockSummary?;
    # List ofhours entries for a day. This is for a user who enters hours. 
    TimeentrydetailsTimeentrydetailsHourssummary[] hoursSummary?;
    # List of time pair entries.  
    TimeentrydetailsTimeentrydetailsTimepairsummary[] timePairSummary?;
    # List of time hours entries.  These are entries where the date time is captured and the number of hours.  For example, for sick time. The time taken is effective at a date and time
    TimeentrydetailsTimeentrydetailsTimehourssummary[] timeHoursSummary?;
    # List of date period entries.  These are entries where the day period is captured. For example, for 'Worked' - morning, afternoon or the whole day
    TimeentrydetailsTimeentrydetailsDayperiodsummary[] dayPeriodSummary?;
    # List of entries which are units based. Example is mileage.
    TimeentrydetailsTimeentrydetailsUnitsummary[] unitSummary?;
    # List of entries which are amount based. An example is tips.
    TimeentrydetailsTimeentrydetailsAmountsummary[] amountSummary?;
};

# polices for the time clock paradigm for the user
public type TimeentrydetailsTimeentrydetailsClockpolicy record {
    # Metadata for the buttons to be shown on the UI.  Each array entry defines a button, its label, associated action (e.g. Clock In, Clock Out, Lunch Out), and whether it is enabled - The user can select it or it is disabled. The order of the buttons is left right top to bottom in the order which they are communicated in the array.
    TimeentrydetailsTimeentrydetailsClockpolicyEntrybuttons[] entryButtons?;
    # The entry type identifies the data which will be captured for the entry and maps directly to the name of the object in timeEntry
    string entryTypeCode?;
    # The category, which identifies the entry type. Used to categorize the entry comments, etc.
    string entryTypeCategoryCode?;
    # Based on the Server Policy it is the time when the request expires.  That is, the client will need to make another request to the server to determine if the user can clock.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification. The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm.  where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string policyExpireDateTime?;
    # Valid geo locations where the user is allowed to clock in/clock out and therefore the capability is enabled
    TimeentrydetailsTimeentrydetailsClockpolicyValidgeolocations[] validGeoLocations?;
    # True indicates that the application should allow the person to clock in even if the device can not capture the geo location.
    boolean allowBypassIndicator?;
    # Validation Tables to be requested
    TimeentrydetailsTimeentrydetailsClockpolicyValidationtables[] validationTables?;
};

# Code identifying the rate
public type TimeentrydetailsTimeentrydetailsRatecode record {
    # The code for the related entity.
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# URI of the property
public type TimeentryTimeentryMetaPropertyuri record {
    string href?;
};

# The revision identifier of the timesheet.  This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name if used.
public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsTimesheetrevid record {
    # An ID.
    string idValue?;
    # The type of ID.
    string schemeName?;
};

# List of Time Clock Entires for a given period.  The period is determined by the System of Record.
public type TimeentrydetailsTimeentrydetailsClocksummary record {
    # The next scheduled time and event which the user is scheduled to punch the clock
    TimeentrydetailsTimeentrydetailsClocksummaryNextscheduledclockentry nextScheduledClockEntry?;
    # List of Time Clock Entires (Punches) for the Pay Period
    TimeentrydetailsTimeentrydetailsClocksummaryClockentries[] clockEntries?;
};

public type TimeEntryDetails record {
    # Time Entry Details is called upon entering the Time Application. It will get the time configuration for the user and the latest list of time entries for the given timeperiod.
    TimeentrydetailsTimeentrydetails timeEntryDetails?;
};

# The coordinates of the location of the device as captured by the gps of the device.  Following the W3C Geolocation API Specification.  Reference: http://dev.w3.org/geo/api/spec-source.html#altitude
public type TimeentrydetailsTimeentrydetailsClockpolicyCoordinate record {
    # The angle, in degrees, of a position on Earth around the equator from the Greenwich Meridian specified in decimal degrees.
    decimal longitude?;
    # The angle, in degrees, of a position on Earth above the equator. (Latitude is negative for a place below the equator.) specified in decimal degrees
    decimal latitude?;
    # Denotes the height of th eposition, specified in meters above the [WGS84] ellipsoid.
    decimal altitudeMeasure?;
};

public type TimeentrydetailsTimeentrydetailsClockpolicyValidationtables record {
    # The label to be shown on the UI
    string labelName?;
    # Identifier of the Validation Table
    string tableID?;
    # Type of Validation Table
    string typeCode?;
    # Value of true indicates that the user must select a value from the list to return in the entry
    boolean requiredIndicator?;
    # The default value, so if the user is not changing the value from the default they don't have to make the API calls
    TimeentrydetailsTimeentrydetailsClockpolicyDefaultcode defaultCode?;
    # URI of the validation table
    TimeentrydetailsTimeentrydetailsClockpolicyTableuri tableUri?;
    # table
    TimeentrydetailsTimeentrydetailsClockpolicyTable 'table?;
};

# Code identifying the type of exception on the timeSheet.  This is the highest exception.  That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
public type TimeentrydetailsTimeentrydetailsClocksummaryExceptiontype record {
    # Code identifying 
    string code?;
};

# Status of the timesheet.  E.g. Employee Approved, Manager Approved
public type TimeentrydetailsTimeentrydetailsTimesheetstatus record {
    # The dynamic code.
    string code?;
    # The label which will be shown in the UI for the policy.
    string labelName?;
    # Effective date of the status change.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
};

# clockEntry, timePairEntry, timeHoursEntry, hoursEntry, unitEntry, and amountEntry are mutually exclusive.  Only one would be passed in a json instance since each transaction is for 1 entry at a time
public type TimeentryTimeentry record {
    # Unique identifier of the entry
    string entryID?;
    # Date Time of the entering device.  This time is to be logged by the System of Record to maintain forensics on the time logged based on synchronization with the server clock and that of the user's mobile device. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string metadeviceDateTime?;
    # Identifier of the position which this entry is associated to.  A worker may have multiple positions in which case they would pass the relevant position.
    TimeentrydetailsTimeentrydetailsPositionid1 positionID?;
    # The title of the position
    string positionTitle?;
    # Status of the entry, e.g. Employee Approved, Manager Approved
    TimeentryTimeentryTimeentrystatus timeEntryStatus?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read ('r')is the default value.  If the associate can not see the entry it should not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # Time entry notes / comments
    TimeentryTimeentryEntrynotes[] entryNotes?;
    # Entry properties for the Time Clock paradigm.  User punches in
    TimeentryTimeentryClockentry clockEntry?;
    # A time pair entry
    TimeentryTimeentryTimepairentry timePairEntry?;
    # timeHoursEntry is the entry of hours which starts at a specific date and time
    TimeentryTimeentryTimehoursentry timeHoursEntry?;
    # hoursEntry is used when entering the number of hours associated to an earning code.
    TimeentryTimeentryHoursentry hoursEntry?;
    # dayPeriodEntry is used when the day period associated to an earning code.
    TimeentryTimeentryDayperiodentry dayPeriodEntry?;
    # Entry of number of Units such as days, mileage, or widgets
    TimeentryTimeentryUnitentry unitEntry?;
    # Entry of a currency amount
    TimeentryTimeentryAmountentry amountEntry?;
    # An exceptions array which has the exception level code, exceptionMessage and corresponding solutions.  These exceptions are at the time entry level.
    TimeentryTimeentryExceptions[] exceptions?;
    # Metadata for the related entity.  
    TimeentryTimeentryMeta1 meta?;
};

# the range in meters tolerated outside of the coordinates.  Example 5000 meter radius from the coordinate
public type TimeentrydetailsTimeentrydetailsClockpolicyRange record {
    # the radius (distance) that the person may clock in from the coordinate.
    decimal unitValue?;
    # unit which the range is communicated in
    string unitCode?;
};

public type TimeentrydetailsTimeentrydetailsEarningentrypolicyCreatetimeperiods record {
    # start date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # end date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
};

public type TimeentrydetailsTimeentrydetailsEarningallocations record {
    # The label to be shown on the UI
    string labelName?;
    # Identifier of the Validation Table
    string tableID?;
    # The value of the field code
    string valueText?;
};

public type TimeentrydetailsTimeentrydetailsMetaArguments record {
    # URI of the property
    TimeentrydetailsTimeentrydetailsMetaPropertyuri propertyUri?;
    # The value of the property.
    string propertyValue?;
};

# Time Period covering the entries listed
public type TimeentryTimeentryTimepairentryTimeperiod record {
    # The start date time of the time period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # The end date time of the time period. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
};

public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsEntries record {
    # Unique identifier of the entry
    string entryID?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # The revision identifier of the entry.  This may be an Etag or a System of Record generated key. The schemeName should be Etag for the scheme name if Etag is used.
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsEntryrevid entryRevID?;
    # An exceptions array which has the exception level code, exceptionMessage and corresponding solutions. These exceptions are at the time entry level.
    TimesheetsresolveexceptionsTimesheetsresolveexceptionsExceptions[] exceptions?;
};

public type TimeEntry record {
    # clockEntry, timePairEntry, timeHoursEntry, hoursEntry, unitEntry, and amountEntry are mutually exclusive.  Only one would be passed in a json instance since each transaction is for 1 entry at a time
    TimeentryTimeentry timeEntry?;
};

# Indicates whether the user is entitled to paid time off.  This is only used when the Time System is the only one which maintains the fine grain authorization on whether a user should have Paid Time Off capability or not.  The finer grain access, balances vs requests, etc... is returned in the paidTimeOffDetails API.  This only indicates if the user sees the capability (e.g. PTO chiclet accessible from the Springboard)
public type TimeentrydetailsTimeentrydetailsPtopolicy record {
    # True indicates that the user is entitled to paid time off capabilities.  False indicates that the user will not have access to paid time off capabilities from this media.
    boolean entitlementIndicator?;
    # URI to get paid time off details
    TimeentrydetailsTimeentrydetailsPtopolicyPtouri ptoUri?;
};

# Identifier of the position which this entry is associated to.  A worker may have multiple positions in which case they would pass the relevant position.
public type TimeentrydetailsTimeentrydetailsPositionid1 record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # name of the identification scheme
    string schemeName?;
    # Agency responsible for the maintenance and definition of the identification scheme
    string schemeAgencyName?;
};

public type TimeentrydetailsTimeentrydetailsClocksummaryClockentries record {
    # Unique identifier of the entry
    string entryID?;
    # The date as logged by the device based on the clock reference time from the server. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification. The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string entryDateTime?;
    # The action associated with the button invoked
    string actionCode?;
    # Description of the entry. E.g. Break, Lunch
    string description?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception.  That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsClocksummaryExceptiontype exceptionType?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsClocksummaryEntrynotes[] entryNotes?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete.  Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # Codes that represent overrides that a user may select for the entry,e.g. if the worker is requesting to override the standard meal deduction for this entry, the code would identify the rule. Example is that the worker is scheduled for lunch, but is working through lunch. This tells the system that the worker is working through lunch and to not count the regularly scheduled lunch time
    TimeentrydetailsTimeentrydetailsClocksummaryEntryoverrides[] entryOverrides?;
};

public type TimeentryTimeentryHoursentryEarningallocations record {
    # The label to be shown on the UI
    string labelName?;
    # Identifier of the Table
    string tableID?;
    # The value of the field code
    string valueText?;
};

# URI of a related resource
public type TimeentrydetailsTimeentrydetailsEntryuri record {
    string href?;
};

# The unique identifier of an person with a relationship to a given organization, e.g. an Associate OID.
public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsAssociateid record {
    # An ID.
    string idValue?;
    # The agency that issues the ID.
    string schemeAgencyName?;
    # The type of ID.
    string schemeName?;
    # The label of the related entity to show on the UI.
    string labelName?;
};

public type TimeentrydetailsTimeentrydetailsUnitsummary record {
    # Unique identifier of the entry
    string entryID?;
    # Code describing the units
    string codeName?;
    # the number of units
    decimal unitValue?;
    # The total number of units.  This may be different than the unitValue entered by the user depending on the System of Record's policies.  For example there may be a limit on how many units will be paid for.  Anything over the limit is not paid.
    decimal totalUnitValue?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue. The actual total amount will show up in the list of entries
    TimeentrydetailsTimeentrydetailsTotalamount totalAmount?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsEntrynotes[] entryNotes?;
};

# The effective data time that the time was taken
public type TimeentryTimeentryTimehoursentryEffectivetimeperiod record {
    # The start date time of the time period. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # This property is not used when communicating timeHoursEntry. Only startDateTime and duration are communicated.  It should not be sent in the json.  It has been kept in to maintain consistency of the object effectiveTimePeriod
    string endDateTime?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string duration?;
};

# Time Entry Details is called upon entering the Time Application. It will get the time configuration for the user and the latest list of time entries for the given timeperiod.
public type TimeentrydetailsTimeentrydetails record {
    # Time Configuration for the User.
    TimeentrydetailsTimeentrydetailsTimeconfiguration[] timeConfiguration?;
    # List of Time Entries for a given position and  time period determined by the System of Record
    TimeentrydetailsTimeentrydetailsEntrysummary[] entrySummary?;
};

# A reference to a location
public type TimeentrydetailsTimeentrydetailsClockpolicyLocationref record {
    # The name of the location
    string locationName?;
    # components of an address.  Only the relevant components are included
    TimeentrydetailsTimeentrydetailsClockpolicyLocationrefAddress address?;
};

# Indicates whether the user is entitled to late arrival notification and what if any are the associated validation tables for this capability
public type TimeentrydetailsTimeentrydetailsLatearrivalpolicy record {
    # True indicates that the user is entitle to report a late arrival via the late arrival notification application. Absence/Late Arrival should be accessible to the user from the springboard (i.e. main menu)
    boolean entitlementIndicator?;
    # Validation Tables to be requested
    TimeentrydetailsTimeentrydetailsLatearrivalpolicyValidationtables[] validationTables?;
};

# Entry of a currency amount
public type TimeentryTimeentryAmountentry record {
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # earning code associated with the entry
    string code?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue.  The actual total amount will show up in the list of entries
    TimeentryTimeentryUnitentryTotalamount amount?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
};

# Relevant for defaultPlanTypeCode = timenetry. Time period where the user can create a new entry.  This is mutually exclusive with the createTimePeriods.
public type TimeentrydetailsTimeentrydetailsEarningentrypolicyCreatetimeperiod record {
    # start date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # end date time of the period.  Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
};

public type TimeentrydetailsTimeentrydetailsAbsencepolicyValidationtables record {
    # The label to be shown on the UI
    string labelName?;
    # Identifier of the Validation Table
    string tableID?;
    # Type of Validation Table
    string typeCode?;
    # Value of true indicates that the user must select a value from the list to return in the entry
    boolean requiredIndicator?;
    # The default value, so if the user is not changing the value from the default they don't have to make the API calls
    TimeentrydetailsTimeentrydetailsClockpolicyDefaultcode defaultCode?;
    # URI of the validation table
    TimeentrydetailsTimeentrydetailsClockpolicyTableuri tableUri?;
    # table
    TimeentrydetailsTimeentrydetailsClockpolicyTable 'table?;
};

# Metadata for the related entity.  
public type TimeentryTimeentryMeta1 record {
    # Actions which the user is allowed to initiate against the related entity.  
    TimeentryTimeentryMeta1Actions[] actions?;
};

# The default value, so if the user is not changing the value from the default they don't have to make the API calls
public type TimeentrydetailsTimeentrydetailsClockpolicyDefaultcode record {
    # The code for the related entity
    string codeValue?;
    # Short description of the related code not to exceed 25 characters
    string shortName?;
    # Long description of the related code
    string longName?;
};

# A time pair entry
public type TimeentryTimeentryTimepairentry record {
    # earning code associated with the entry
    string code?;
    # Time Period covering the entries listed
    TimeentryTimeentryTimepairentryTimeperiod timePeriod?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # This is only present if the system allows the user to override the entry out type.  Values are passed by the System of Record.  If not present the drop down is not shown.  The possible values are passed in the earningEntryPolicy entryCodes timePairOutTypeCodes. The default is null.  In the case of null the application does not send the timePairOutTypeCode
    string timePairOutTypeCode?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # Codes that represent overrides that a user may select for the entry,e.g. if the worker is requesting to override the standard meal deduction for this entry, the code would identify the rule.  Example is that the worker is scheduled for lunch, but is working through lunch.  This tells the system that the worker is working through lunch and to not count the regularly scheduled lunch time
    TimeentrydetailsTimeentrydetailsClocksummaryEntryoverrides[] entryOverrides?;
};

# Status of the entry, e.g. Employee Approved, Manager Approved
public type TimeentryTimeentryTimeentrystatus record {
    # The dynamic code.
    string code?;
    # The label which will be shown in the UI for the policy.
    string labelName?;
    # Effective date of the status change.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
};

public type TimeentryTimeentryExceptions record {
    # The exception code
    string code?;
    # The exception text.
    string exceptionMessage?;
    # Code identifying the type of exception
    TimeentryTimeentryExceptiontype exceptionType?;
    # A list of textual solution messages
    string[] solutionMessages?;
    # Data which provides reference to a position
    TimeentryTimeentryMeta meta?;
};

# The rate for unit entries.  The application will multiply the rate by the unitValue to show the total to the user.  If the SOR calculates the rate then a rate of 1 will be passed.
public type TimeentrydetailsTimeentrydetailsEarningentrypolicyRateamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Specifies the currency code of the object in which it is associated
    string currencyCode?;
    # Specifies the per unit.  This may be time or some unit (i.e. widget)
    string unitCode?;
};

# hoursEntry is used when entering the number of hours associated to an earning code.
public type TimeentryTimeentryHoursentry record {
    # earning code associated with the entry
    string code?;
    # Date of Entry.   Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string entryDate?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string hoursValue?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentryTimeentryHoursentryEarningallocations[] earningAllocations?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
};

# The effective data time that the time was taken
public type TimeentrydetailsTimeentrydetailsEffectivetimeperiod record {
    # The start date time of the time period. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string startDateTime?;
    # The end date time of the time period. Data Representation Temporal Data Element Specification following ISO-8601:2000 specification.  The granularity for date-time for this API will always be the following: YYYY-MM-DDThh:mm:ss-+hh:mm. where -+ is either minus or plus depending on whether the offset from GMT is positive or negative hours minutes.
    string endDateTime?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string duration?;
};

# geographical location information of the device
public type TimeentrydetailsTimeentrydetailsClockpolicyValidgeolocations record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # The coordinates of the location of the device as captured by the gps of the device.  Following the W3C Geolocation API Specification.  Reference: http://dev.w3.org/geo/api/spec-source.html#altitude
    TimeentrydetailsTimeentrydetailsClockpolicyCoordinate coordinate?;
    # the range in meters tolerated outside of the coordinates.  Example 5000 meter radius from the coordinate
    TimeentrydetailsTimeentrydetailsClockpolicyRange range?;
    # A reference to a location
    TimeentrydetailsTimeentrydetailsClockpolicyLocationref locationRef?;
};

# Type of the related time entry note, one of the pre-defined by the backend SOR
public type TimeentrydetailsTimeentrydetailsClocksummaryCommenttype record {
    # The code of the related entity (if available)
    string code?;
    # Label / description of the related code
    string description?;
};

public type TimeentrydetailsTimeentrydetailsClocksummaryEntrynotes record {
    # The unique identifier (if supported) of a note within a collection
    string itemID?;
    # Name of user who entered the comment
    string userName?;
    # Reference to an Associate
    TimeentrydetailsTimeentrydetailsClocksummaryAssociateref associateRef?;
    # The date time of the entry. Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DDThh:mm:ss+-hh:mm
    string entryDateTime?;
    # Used to indicate if the note is applicable to a particular element of the time entry, e.g. in the context if a timePairEntry if the note applies to start or end time.  Should not be in the payload if not applicable
    string appliesToElementName?;
    # Type of the related time entry note, one of the pre-defined by the backend SOR
    TimeentrydetailsTimeentrydetailsClocksummaryCommenttype commentType?;
    # User entered actual note text
    string noteText?;
    # Flag to indicate whether a note created by a supervisor / practitioner should be private (e.g. not visible to an employee). The default value is false  (e.g. visible)
    boolean privateNoteIndicator?;
    # Code describing the data entitlements the user has on the note.  These are c - create, r - read, u - update, d- delete. Read ('r')is the default value. If the associate can not see the entry it should not be returned in the JSON
    string[] metadataEntitlementCodes?;
};

public type TimeentrydetailsTimeentrydetailsEntrynotes record {
    # The unique identifier (if supported) of a note within a collection
    string itemID?;
    # Name of user who entered the comment
    string userName?;
    # Reference to an Associate
    TimeentrydetailsTimeentrydetailsClocksummaryAssociateref associateRef?;
    # The date time of the entry. Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DDThh:mm:ss+-hh:mm
    string entryDateTime?;
    # Used to indicate if the note is applicable to a particular element of the time entry, e.g. in the context if a timePairEntry if the note applies to start or end time. Should not be in the payload if not applicable
    string appliesToElementName?;
    # Type of the related time entry note, one of the pre-defined by the backend SOR
    TimeentrydetailsTimeentrydetailsClocksummaryCommenttype commentType?;
    # User entered actual note text
    string noteText?;
    # Flag to indicate whether a note created by a supervisor / practitioner should be private (e.g. not visible to an employee).  The default value is false  (e.g. visible)
    boolean privateNoteIndicator?;
    # Code describing the data entitlements the user has on the note. These are c - create, r - read, u - update, d- delete.  Read ('r')is the default value.  If the associate can not see the entry it should not be returned in the JSON
    string[] metadataEntitlementCodes?;
};

# Formatted name of the related associate
public type TimeentrydetailsTimeentrydetailsClocksummaryAssociaterefPersonname record {
    # The first name of the person
    string givenName?;
    # Person middle name or initial
    string middleName?;
    # Person family name 1
    string familyName1?;
    # Person family name 2
    string familyName2?;
    # A formatted version of the person name
    string formattedName?;
};

public type TimeentrydetailsTimeentrydetailsClockpolicyTableTablerows record {
    # A code indicating the formatting to apply to the row.  For example, a heading row would be bold.
    string[] formatTypeCodes?;
    # Value of the column.  The order in the array is the order of the columns in the row.
    string[] columnValues?;
};

public type TimesheetsreviewTimesheetsreviewTimesheets record {
    # Unique identifier of the timeSheet
    string timeSheetID?;
    # The revision identifier of the timesheet.  This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name
    TimesheetsreviewTimesheetsreviewTimesheetrevid timeSheetRevID?;
    # Effective date. Follows the ISO-8601:2000 format YYYY-MM-DD
    string effectiveDate?;
    # The unique identifier of a person with a relationship to a given organization, e.g. an Associate OID.
    TimesheetsreviewTimesheetsreviewAssociateid associateID?;
    # Status of the timesheet.  E.g. Employee Approved, Manager Approved
    TimesheetsreviewTimesheetsreviewTimesheetstatus timeSheetStatus?;
    TimesheetsreviewTimesheetsreviewEntries[] entries?;
};

# Position identifier a person may enter time against. 
public type TimeentrydetailsTimeentrydetailsPositionid record {
    # Is the Identifier of the given instance of an entity.
    string id?;
    # name of the identification scheme
    string schemeName?;
    # Agency responsible for the maintenance and definition of the identification scheme
    string schemeAgencyName?;
};

public type TimeentrydetailsTimeentrydetailsPayperioditemtotals record {
    # A unique identifier of a work assignment
    string itemID?;
    # earning code associated with the entry
    string codeName?;
    # Code identifying the rate
    TimeentrydetailsTimeentrydetailsRatecode rateCode?;
    # The type of remuneration, e.g. bonus, commission, etc.
    TimeentrydetailsTimeentrydetailsRemunerationtypecode remunerationTypeCode?;
    # A work shift
    TimeentrydetailsTimeentrydetailsWorkshiftcode workShiftCode?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates the duration of time as represented by ISO 8601. Where the value space is a six dimensional space where the coordinates designate the Gregorian year, month, day, hour, minute, and second. The number of seconds can include decimal digits to arbitary pecision. PnYn MnDTnH nMnS, where: [n] is replaced by the value for each of the date and time elements that follow the [n]. Leading zeros are not required, but the maximum number of digits for each element should be agreed to by the communicating parties. The capital letters 'P', 'Y', 'M', 'W', 'D', 'T', 'H', 'M', and 'S' are designators for each of the date and time elements and are not replaced. P is the duration designator (historically called 'period') placed at the start of the duration representation. Y is the year designator that follows the value for the number of years. M is the month designator that follows the value for the number of months. D is the day designator that follows the value for the number of days. T is the time designator that precedes the time components of the representation. H is the hour designator that follows the value for the number of hours. M is the minute designator that follows the value for the number of minutes.S is the second designator that follows the value for the number of seconds. The number of seconds can include decimal digits to arbitrary precision
    string hoursValue?;
    # total number of units
    decimal totalUnitValue?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue. The actual total amount will show up in the list of entries
    TimeentrydetailsTimeentrydetailsTotalamount totalAmount?;
    # Identifies the pay  If the earnings are to be split across check then the earnings are associated to the appropriate payNumber which it needs to be associated to.  Example if regular pay and vacation pay goes on one check (payNumber=0) and holiday pay goes on a separate check with payNumber=1
    string payNumber?;
};

# The revision identifier of the entry.  This may be an Etag or a System of Record generated key. The schemeName should be Etag for the scheme name if Etag is used.
public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsEntryrevid record {
    # An ID.
    string idValue?;
    # The type of ID.
    string schemeName?;
};

# Metadata associated to the related object
public type TimeentrydetailsTimeentrydetailsMeta record {
    # Actions which the user is allowed to initiate against the related entity.  
    TimeentrydetailsTimeentrydetailsMetaActions[] actions?;
};

public type TimeentrydetailsTimeentrydetailsAmountsummary record {
    # Unique identifier of the entry
    string entryID?;
    # earning code associated with the entry
    string codeName?;
    # Status of the entry.  E.g. Employee Approved, Manager Approved
    TimeentrydetailsTimeentrydetailsTimeentrystatus timeEntryStatus?;
    # The reason associated with the entry.  This is relevant for non-worked time.  For example sick the reason may be Child Sick.  This reason code allows for reporting.
    string reasonCode?;
    # the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue. The actual total amount will show up in the list of entries
    TimeentrydetailsTimeentrydetailsTotalamount totalAmount?;
    # URI of a related resource
    TimeentrydetailsTimeentrydetailsEntryuri entryUri?;
    # Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
    TimeentrydetailsTimeentrydetailsExceptiontype1 exceptionType?;
    # Code describing the data entitlements the user has on the entry.  These are c - create, r - read, u - update, d- delete. Read is the default value. If the associate can not see the entry it will not be returned in the JSON
    string[] metadataEntitlementCodes?;
    # The entry may be allocated against an entity such as a position, department, location, etc...  
    TimeentrydetailsTimeentrydetailsEarningallocations[] earningAllocations?;
    # Indicates if the entry has notes associated with it
    boolean noteIndicator?;
    # Time entry notes / comments
    TimeentrydetailsTimeentrydetailsEntrynotes[] entryNotes?;
};

# The revision identifier of the exception. This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name if Etag is used.
public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsExceptionrevid record {
    # An ID.
    string idValue?;
    # The type of ID.
    string schemeName?;
};

# The Time Period which relates to a payment for time worked
public type TimeentrydetailsTimeentrydetailsPayperiod record {
    # Identifier of the payperiod
    string payPeriodID?;
    # Label identifying the payperiod which will be shown on the UI
    string labelName?;
    # The start date of the time period.  Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string startDate?;
    # The end date of the time period.  Data Representation Standard: Temporal Data Specification which follows the ISO-8601:2000 format YYYY-MM-DD
    string endDate?;
};

public type TimeentryTimeentryMeta1Links record {
    # Indicates the nature of the relationship of the related resource to the resource that generated this representation
    string rel?;
    #  The value of the href link description property is a template used to determine the target URI of the related resource.  The value of the instance property SHOULD be resolved as a URI-Reference per RFC 3986 [RFC3986] and MAY be a relative reference to a URI.
    string href?;
    # The HTTP method to use to traverse the link (GET, POST, PUT or DELETE).
    string method?;
    # The media type that the linked resource will return (Response)
    string mediaType?;
    # If present, this property indicates a query media type format that the server supports for querying or posting to the collection of instances at the target resource.  The query can be suffixed to the target URI to query the collection with property-based constraints on the resources that SHOULD be returned from the server or used to post data to the resource (depending on the method). (Request)
    string encType?;
    # This property contains a schema which defines the acceptable structure of the submitted request.  For a GET request, this schema would define the properties for the query string and for a POST request, this would define the body.
    string schema?;
    # This property is a schema that defines the expected structure of the JSON representation of the target of the link, if the target of the link is returned using JSON representation.
    string targetSchema?;
    # This property defines a title for the link.  The value must be a string. User agents MAY use this title when presenting the link to the user.
    string title?;
    # A map that may be used as the basis for any data (arguments or properties) required to follow the link. 
    TimeentryTimeentryMeta1Arguments[] arguments?;
};

# Code identifying the type of exception on the timeSheet.  This is the highest exception. That is, if a timeSheet has entries with warning, error, or information then an error exceptionType should be sent at the timeSheet level.
public type TimeentrydetailsTimeentrydetailsExceptiontype1 record {
    # Code identifying 
    string code?;
};

# A systematic resolution of an exception
public type TimesheetsresolveexceptionsTimesheetsresolveexceptionsSolution record {
    # Code identifying the solution
    string code?;
};

# The revision identifier of the timesheet.  This may be an Etag or a System of Record generated key.  The schemeName should be Etag for the scheme name
public type TimesheetsreviewTimesheetsreviewTimesheetrevid record {
    # An ID.
    string idValue?;
    # The type of ID.
    string schemeName?;
};

public type TimeentrydetailsTimeentrydetailsClockpolicyEntrybuttons record {
    # The label to be shown on the UI
    string labelName?;
    # The action associated with the button invoked
    string actionCode?;
    # True indicates that the action associated with the button is enabled
    boolean enableIndicator?;
};

# table
public type TimeentrydetailsTimeentrydetailsClockpolicyTable record {
    # Table Name
    string tableName?;
    # Header Record.  Provides the metadata of a table.  This includes the columns
    TimeentrydetailsTimeentrydetailsClockpolicyTableHeader header?;
    # A row in the table
    TimeentrydetailsTimeentrydetailsClockpolicyTableTablerows[] tableRows?;
};

# the calculated amount.  If the calculated amount should be done by the server due to complex business rules then the totalAmount will be 1xthe unitValue. The actual total amount will show up in the list of entries
public type TimeentrydetailsTimeentrydetailsTotalamount record {
    # The monetary value of the object in which the amount is associated
    decimal amountValue?;
    # Specifies the currency code of the object in which it is associated
    string currencyCode?;
};
