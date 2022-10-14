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

public type KarbonApiTimeV3TimesheetdtoArr KarbonApiTimeV3Timesheetdto[];

public type KarbonApiTenantUserdtoArr KarbonApiTenantUserdto[];

public type KarbonApiTimeV3Aggregatetimeentrydto record {
    string TimeEntryKey;
    @constraint:String {maxLength: 12}
    string EntityKey;
    @constraint:String {maxLength: 12}
    string WorkItemKey?;
    @constraint:String {maxLength: 12}
    string ClientKey?;
    string ClientType?;
    string RoleName?;
    string TaskTypeName?;
    int Minutes;
    decimal HourlyRate?;
    string[] Descriptions?;
};

public type KarbonApiContactsV2Clientgroupsummarydto record {
    string FullName?;
    string PhoneNumber?;
    string Website?;
    string LastModifiedDateTime?;
    string ClientGroupKey?;
};

public type KarbonApiTimeV3Timesheetdto record {
    @constraint:String {maxLength: 12}
    string TimesheetKey;
    string StartDate;
    string EndDate;
    @constraint:String {maxLength: 12}
    string UserKey;
    # Gets or sets the status of the timesheet. Can be "Draft", "Submitted", "Approved", or "Declined".
    string Status;
    string[] WorkItemKeys;
    KarbonApiTimeV3Aggregatetimeentrydto[] TimeEntries?;
};

public type KarbonApiModelsWorkV3Actorroledto record {
    string ActorKey?;
    string ActorName?;
};

public type KarbonApiWorkV3Worktemplatedto record {
    string WorkTemplateKey?;
    string Title?;
    string Description?;
    string WorkTypeKey?;
    boolean HasScheduledClientTaskGroups?;
    decimal EstimatedBudget?;
    int EstimatedTime?;
    boolean DraftHasChanges?;
    string PublishedDate?;
    int NumberOfWorkItemsCreated?;
    string DateLastWorkItemCreated?;
    string DateModified?;
    KarbonApiModelsWorkV3Actorroledto[] ActorRoles?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiModelsWorkV3Workitemsummarydto record {
    KarbonApiModelsWorkV3Workitemsummarydto[] Items?;
    string NextPageLink?;
    int Count?;
};

public type KarbonApiWorkV3Workscheduledto record {
    string WorkScheduleKey?;
    string ClientKey?;
    string ClientType?;
    string CreatedFromWorkItemKey?;
    string RecurrenceFrequency?;
    string CustomFrequencyUnits?;
    int CustomFrequencyMultiple?;
    string FrequencyDescription?;
    string ScheduleStartDate?;
    string ScheduleEndDate?;
    string ScheduleDueDateMethod?;
    int ScheduleDueDateDays?;
    int ScheduleDueDateMonthMultiple?;
    string AssigneeUserKey?;
    string WorkItemDescription?;
    boolean PreventStartEndOnWeekend?;
    string InitializeBeforeStartDateUnits?;
    int InitializeBeforeStartDateMultiple?;
    string WorkItemTitleDefinition?;
    string WorkItemTitleDisplayText?;
    string InitializeTasksBeforeStartDateUnits?;
    int InitializeTasksBeforeStartDateMultiple?;
};

public type KarbonApiContactsV2Clientgroupdto record {
    string FullName?;
    KarbonApiContactsV2Businesscarddto BusinessCard?;
    string ClientOwner?;
    string ClientManager?;
    string ContactType?;
    string UserDefinedIdentifier?;
    string RestrictionLevel?;
    string PrimaryContact?;
    KarbonApiContactsV2Clientgroupmemberdto[] Members?;
    string LastModifiedDateTime?;
    KarbonApiModelsContactsV3Entitydescriptiondto EntityDescription?;
    KarbonApiModelsAccountingV3Accountingdetailsdto AccountingDetails?;
    string ClientGroupKey?;
};

public type KarbonApiFilesFiledto record {
    string Id?;
    string Name?;
    string MimeType?;
    int Size?;
};

public type KarbonApiModelsAccountingV3Accountingdetailsdto record {
    string ContactPermaKey?;
    string OrganizationPermaKey?;
    string BirthDate?;
    string DeathDate?;
    string Salutation?;
    string Sex?;
    int FinancialYearEndDay?;
    int FinancialYearEndMonth?;
    string IncorporationDate?;
    string IncorporationState?;
    string LegalName?;
    string LineOfBusiness?;
    string EntityType?;
    string TaxCountryCode?;
    string TradingName?;
    decimal AnnualRevenue?;
    string BaseCurrency?;
    string GstBasis?;
    string GstPeriod?;
    string IncomeTaxInstallmentPeriod?;
    boolean IsVATRegistered?;
    decimal OrganizationValuation?;
    boolean PaysTax?;
    boolean PrepareGST?;
    string ProvisionalTaxBasis?;
    string ProvisionalTaxRatio?;
    string RevenueModel?;
    string SalesTaxBasis?;
    string SalesTaxPeriod?;
    string Sells?;
    KarbonApiModelsAccountingV3Registrationnumberdto[] RegistrationNumbers?;
    KarbonApiModelsAccountingV3Clientnotedto[] Notes?;
};

public type KarbonApiModelsWorkV3Userroleassignmentdto record {
    string Id?;
    string RoleKey?;
    string UserProfileKey?;
};

public type KarbonApiContactsV2Clientgroupmemberdto record {
    string ContactKey?;
    string OrganizationKey?;
};

public type KarbonApiModelsAccountingV3Clientnotedto record {
    string Body?;
    string Type?;
};

public type KarbonApiModelsAccountingV3Registrationnumberdto record {
    string RegistrationNumber?;
    string Type?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiContactsV2Organizationsummarydto record {
    KarbonApiContactsV2Organizationsummarydto[] Items?;
    string NextPageLink?;
    int Count?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiContactsV2Contactsummarydto record {
    KarbonApiContactsV2Contactsummarydto[] Items?;
    string NextPageLink?;
    int Count?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiWorkV3Worktemplatedto record {
    KarbonApiWorkV3Worktemplatedto[] Items?;
    string NextPageLink?;
    int Count?;
};

public type KarbonApiTenantUserdto record {
    string Id?;
    string Name?;
    string EmailAddress?;
};

public type KarbonApiContactsV2Organizationsummarydto record {
    string FullName?;
    string PhoneNumber?;
    string Website?;
    string LastModifiedDateTime?;
    string OrganizationKey?;
};

public type KarbonApiModelsContactsV3Webhooksubscriptiondto record {
    string TargetUrl?;
};

public type KarbonApiContactsV2Businesscarddto record {
    string BusinessCardKey?;
    boolean IsPrimaryCard?;
    KarbonApiContactsV2Addressdto[] Addresses?;
    KarbonApiContactsV2Phonenumberdto[] PhoneNumbers?;
    string[] WebSites?;
    string[] EmailAddresses?;
    string OrganizationKey?;
    string RoleOrTitle?;
    string FacebookLink?;
    string LinkedInLink?;
    string TwitterLink?;
    string SkypeLink?;
};

public type KarbonApiContactsV2Organizationdto record {
    string FullName?;
    string ClientOwner?;
    string ClientManager?;
    string ContactType?;
    string UserDefinedIdentifier?;
    string RestrictionLevel?;
    string LastModifiedDateTime?;
    string OrganizationKey?;
    KarbonApiContactsV2Businesscarddto[] BusinessCards?;
    KarbonApiModelsContactsV3Entitydescriptiondto EntityDescription?;
    KarbonApiModelsAccountingV3Accountingdetailsdto AccountingDetail?;
};

public type KarbonApiContactsV2Phonenumberdto record {
    string PhoneNumberKey?;
    string Number?;
    string CountryCode?;
    string Label?;
};

public type KarbonApiContentitemsNotedto record {
    string Id?;
    string Subject?;
    string Body?;
    string AuthorEmailAddress?;
    string AssigneeEmailAddress?;
    string DueDate?;
    string TodoDate?;
};

public type KarbonApiModelsWorkV3Workitemdto record {
    string Description?;
    KarbonApiModelsWorkV3Userroleassignmentdto[] UserRoleAssignments?;
    KarbonApiModelsWorkV3Clienttaskrecipientdto[] ClientTaskRecipients?;
    @constraint:String {maxLength: 12}
    string WorkItemKey?;
    @constraint:String {maxLength: 254}
    string AssigneeEmailAddress;
    string AssigneeKey?;
    string AssigneeName?;
    @constraint:String {maxLength: 200}
    string Title?;
    @constraint:String {maxLength: 12}
    string ClientKey;
    string ClientName?;
    string ClientType;
    @constraint:String {maxLength: 12}
    string RelatedClientGroupKey?;
    @constraint:String {maxLength: 12}
    string ClientGroupKey?;
    string RelatedClientGroupName?;
    string StartDate;
    string DueDate?;
    string CompletedDate?;
    string ToDoPeriod?;
    string WorkType?;
    string WorkStatus?;
    string PrimaryStatus?;
    string SecondaryStatus?;
    @constraint:String {maxLength: 12}
    string WorkTemplateKey?;
    string WorkTemplateTile?;
    string WorkScheduleKey?;
    @constraint:Number {maxValue: 2147483647}
    decimal EstimatedBudget?;
};

public type KarbonApiModelsWorkV3Workitemsummarydto record {
    @constraint:String {maxLength: 12}
    string WorkItemKey?;
    @constraint:String {maxLength: 254}
    string AssigneeEmailAddress;
    string AssigneeKey?;
    string AssigneeName?;
    @constraint:String {maxLength: 200}
    string Title?;
    @constraint:String {maxLength: 12}
    string ClientKey;
    string ClientName?;
    string ClientType;
    @constraint:String {maxLength: 12}
    string RelatedClientGroupKey?;
    @constraint:String {maxLength: 12}
    string ClientGroupKey?;
    string RelatedClientGroupName?;
    string StartDate;
    string DueDate?;
    string CompletedDate?;
    string ToDoPeriod?;
    string WorkType?;
    string WorkStatus?;
    string PrimaryStatus?;
    string SecondaryStatus?;
    @constraint:String {maxLength: 12}
    string WorkTemplateKey?;
    string WorkTemplateTile?;
    string WorkScheduleKey?;
    @constraint:Number {maxValue: 2147483647}
    decimal EstimatedBudget?;
};

public type KarbonApiContactsV2Contactdto record {
    string FirstName?;
    string MiddleName?;
    string LastName?;
    string PreferredName?;
    string Salutation?;
    string Suffix?;
    string ClientOwner?;
    string ClientManager?;
    string ContactType?;
    string UserDefinedIdentifier?;
    string RestrictionLevel?;
    string AvatarUrl?;
    string LastModifiedDateTime?;
    string ContactKey?;
    KarbonApiContactsV2Businesscarddto[] BusinessCards?;
    KarbonApiModelsContactsV3Entitydescriptiondto EntityDescription?;
    KarbonApiModelsAccountingV3Accountingdetailsdto AccountingDetail?;
};

public type KarbonApiModelsWorkV3Clienttaskrecipientdto record {
    string RecipientKey?;
    string TemplateItemKey?;
    string LinkType?;
    string EmailAddress?;
};

public type KarbonApiModelsContactsV3Entitydescriptiondto record {
    string Text?;
};

public type KarbonApiContactsV2Contactsummarydto record {
    string FullName?;
    string PreferredName?;
    string Salutation?;
    string ClientOwner?;
    string ClientManager?;
    string Address?;
    string EmailAddress?;
    string PhoneNumber?;
    string RoleOrTitle?;
    string UserDefinedIdentifier?;
    string LastModifiedDateTime?;
    string ContactKey?;
};

public type KarbonApiContactsV2Addressdto record {
    string AddressKey?;
    string AddressLines?;
    string City?;
    string StateProvinceCounty?;
    string ZipCode?;
    string CountryCode?;
    string Label?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiContactsV2Clientgroupsummarydto record {
    KarbonApiContactsV2Clientgroupsummarydto[] Items?;
    string NextPageLink?;
    int Count?;
};

public type MicrosoftAspnetOdataPageresultKarbonApiTenantUserdto record {
    KarbonApiTenantUserdto[] Items?;
    string NextPageLink?;
    int Count?;
};
