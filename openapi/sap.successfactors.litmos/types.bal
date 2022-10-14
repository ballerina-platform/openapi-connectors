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

public type UserBulkImport record {
    string Id?;
    string ImportDate?;
    string Status?;
    int TotalRecords?;
    int TotalUsersCreated?;
    int Failed?;
    int Duplicate?;
    int InvalidEmail?;
    boolean SendEmails?;
    boolean SkipFirstLogin?;
};

public type InlineResponse20019 record {
    InlineResponse20019Teamlearningpath[] TeamLearningPath?;
};

public type UserscoursesUser record {
    string Id?;
};

public type SettingsActivitys record {
    SettingsActivity[] SettingsActivity;
};

public type Modules record {
    Module[] Module;
};

public type Token record {
    string TokenId;
    string TokenCode;
    @constraint:Int {minValue: 1, maxValue: 4}
    int TokenType;
    string TokenTypeId;
    boolean Active;
    int MaximumActivations;
    string TokenExpiration;
};

public type Users record {
    User[] User;
};

public type CourseCustomField record {
    string CustomFieldId?;
    string Label?;
    string DefaultValue?;
    boolean Mandatory?;
    boolean VisibleToLearner?;
    string Type?;
    record {}[] Dropdown?;
};

public type InlineResponse20020User record {
    string Id?;
    string UserName?;
    string FirstName?;
    string LastName?;
    string FullName?;
    string Email?;
    string AccessLevel?;
    boolean DisableMessages?;
    boolean Active?;
    string Skype?;
    string PhoneWork?;
    string PhoneMobile?;
    string LastLogin?;
    string LoginKey?;
    boolean IsCustomUsername?;
    string TimeZone?;
    string SalesforceId?;
    string OriginalUserId?;
    string Street1?;
    string Street2?;
    string City?;
    string State?;
    string PostalCode?;
    string Country?;
    string CompanyName?;
    string JobTitle?;
    string CustomField1?;
    string CustomField2?;
    string CustomField3?;
    string CustomField4?;
    string CustomField5?;
    string CustomField6?;
    string CustomField7?;
    string CustomField8?;
    string CustomField9?;
    string CustomField10?;
    string SalesforceContactId?;
    string SalesforceAccountId?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
    string Brand?;
    string ManagerId?;
    string ManagerName?;
    boolean EnableTextNotification?;
    string Website?;
    string Twitter?;
    string ExpirationDate?;
    string ExternalEmployeeId?;
    string ProfileType?;
};

public type InlineResponse20021 record {
    InlineResponse20021Courses[] Courses?;
};

public type InlineResponse2007Learningpath record {
    string Id?;
    string Name?;
    string Description?;
    boolean Active?;
    string OriginalId?;
    boolean ForSale?;
    int Price?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string AccessTillDate?;
    int AccessTillDays?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    int DisplayOrder?;
    boolean IncludeInLibrary?;
    boolean IsCourseOptionalOrder?;
    string ImageURL?;
};

public type InlineResponse20020 record {
    InlineResponse20020User[] User?;
};

public type InlineResponse20023 record {
    int TotalBadgesEarned?;
    int TotalPointsEarned?;
};

public type InlineResponse20022 record {
    InlineResponse20022Learningpaths[] LearningPaths?;
};

public type InlineResponse20025 record {
    InlineResponse20025User[] User?;
};

public type InlineResponse20024 record {
    string Id?;
    string Title?;
    string Description?;
    string Icon?;
    string IconBadgeColor?;
};

public type InlineResponse20027 record {
    string 'parameter?;
};

public type InlineResponse20026 record {
    InlineResponse20026User[] User?;
};

public type InlineResponse20029Learningpath record {
    string Id?;
    string Name?;
    boolean Active?;
    string OriginalId?;
    boolean Complete?;
    int PercentageComplete?;
    string AssignedDate?;
    string StartDate?;
    string CompletedDate?;
    string ResultId?;
    string AccessTillDate?;
};

public type InlineResponse20029 record {
    InlineResponse20029Learningpath[] LearningPath?;
};

public type Tokens record {
    Token[] Token;
};

public type InlineResponse20028 record {
    InlineResponse20028Course[] Course?;
};

public type ActionActivity record {
    string ActivityType?;
    string ObjectType?;
    string ObjectId?;
    string OriginalObjectId?;
    string ObjectName?;
    string TargetObjectType?;
    string TargetObjectId?;
    string OriginalTargetObjectId?;
    string TargetObjectName?;
    string ActivityBy?;
    string ActivityByUserName?;
    string ActivityDate?;
};

public type LearningPaths record {
    LearningPath[] LearningPath;
};

public type InlineResponse20013Learningpathcourse record {
    string LearningPathId?;
    string Id?;
    string OriginalLearningPathId?;
    string OriginalCourseId?;
    boolean Active?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type UserImport record {
    string Username?;
    string Email;
    string FirstName;
    string LastName;
    string Password?;
    string Phone?;
    string Mobile?;
    string Skype?;
    string Title?;
    string CompanyName?;
    string WebSite?;
    string Twitter?;
    string Team1?;
    string Team2?;
    string Team3?;
    string Team4?;
    string Team5?;
    string Course1?;
    string Course2?;
    string Course3?;
    string Address1?;
    string Address2?;
    string City?;
    string State?;
    string Zip?;
    string Country?;
    string CustomField1?;
    string CustomField2?;
    string CustomField3?;
    string CustomField4?;
    string CustomField5?;
    string CustomField6?;
    string CustomField7?;
    string CustomField8?;
    string CustomField9?;
    string CustomField10?;
    string SalesforceId?;
    string SalesforceContactId?;
    string SalesforceAccountId?;
    boolean Active?;
    string InActiveDate?;
    @constraint:Int {minValue: 2, maxValue: 5}
    int AccessLevel?;
    string Brand?;
    string Culture?;
    string Manager?;
    string UserCustomField1?;
    string UserCustomField2?;
    string UserCustomField3?;
    string UserCustomField4?;
    string UserCustomField5?;
    string UserCustomField6?;
    string UserCustomField7?;
    string UserCustomField8?;
    string UserCustomField9?;
    string UserCustomField10?;
    string UserCustomField11?;
    string UserCustomField12?;
    string UserCustomField13?;
    string UserCustomField14?;
    string UserCustomField15?;
    string UserCustomField16?;
    string UserCustomField17?;
    string UserCustomField18?;
    string UserCustomField19?;
    string UserCustomField20?;
    string UserCustomField21?;
    string UserCustomField22?;
    string UserCustomField23?;
    string UserCustomField24?;
    string UserCustomField25?;
    string JobRole?;
    string ExternalEmployeeId?;
};

public type InlineResponse20030 record {
    InlineResponse20030User[] User?;
};

public type InlineResponse20018Teamcourse record {
    string TeamId?;
    string Id?;
    string OriginalCourseId?;
    string OriginalTeamId?;
    boolean Active?;
    boolean IsInTeamLibrary?;
    boolean LearningPathAssignment?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type EventUser record {
    string Id;
    int EventStatus;
    string FirstName;
    string LastName;
    string Email;
    string CompanyName;
    @constraint:Int {minValue: 1, maxValue: 100}
    int Score;
    boolean Completed;
};

public type InlineResponse20031 record {
    InlineResponse20030User[] User?;
};

public type UserImports record {
    UserImport[] UserImport;
};

public type Module record {
    string Id;
    string Name;
    string Description?;
    int ModuleType;
    boolean Active;
    string Code?;
    boolean HideDescription?;
    boolean NewWindow?;
    boolean ReviewMode?;
    string ContentURL;
};

public type SettingsActivity record {
    string ActivityType?;
    string Category?;
    string ObjectType?;
    string ObjectId?;
    string OriginalObjectId?;
    string ObjectName?;
    string TargetObjectType?;
    string TargetObjectId?;
    string OriginalTargetObjectId?;
    string TargetObjectName?;
    string OldValue?;
    string NewValue?;
    string ActivityBy?;
    string ActivityByUserName?;
    string ActivityDate?;
};

public type InlineResponse20022Learningpaths record {
    InlineResponse20022Learningpath LearningPath?;
};

public type InlineResponse2009 record {
    InlineResponse2009Userresult[] UserResult?;
};

public type InlineResponse2008 record {
    InlineResponse2008Moduleresult[] ModuleResult?;
};

public type AssignmentActivitys record {
    AssignmentActivity[] AssignmentActivity;
};

public type InlineResponse20016Team record {
    string Id?;
    string Name?;
    string OriginalTeamId?;
    boolean Active?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
    string ParentTeamId?;
    string TeamCodeForBulkImport?;
};

public type InlineResponse20021Courses record {
    InlineResponse20021Course Course?;
};

public type UsersuseridcoursesCourse record {
    string Id?;
};

public type TeamsteamidlearningpathsLearningpath record {
    string LearningPathId?;
};

public type Teams record {
    Team[] Team;
};

public type Team record {
    string Id;
    string Name;
    string Description?;
    string TeamCodeForBulkImport?;
    string ParentTeamId?;
};

public type EventUsers record {
    EventUser[] Team?;
};

public type Body8 record {
    UsersuseridcoursesCourse[] LearningPath?;
};

public type TeamsteamidcoursesCourse record {
    string CourseId?;
};

public type Body9 record {
    TeamsteamidcoursesCourse[] Course?;
};

public type InlineResponse20026User record {
    string Id?;
    string UserName?;
    string FirstName?;
    string LastName?;
    string FullName?;
    string Email?;
    string AccessLevel?;
    boolean DisableMessages?;
    boolean Active?;
    string Skype?;
    string PhoneWork?;
    string PhoneMobile?;
    string LastLogin?;
    string LoginKey?;
    boolean IsCustomUsername?;
    boolean SkipFirstLogin?;
    string TimeZone?;
    string SalesforceId?;
    string OriginalId?;
    string Street1?;
    string Street2?;
    string City?;
    string State?;
    string PostalCode?;
    string Country?;
    string CompanyName?;
    string JobTitle?;
    string CustomField1?;
    string CustomField2?;
    string CustomField3?;
    string CustomField4?;
    string CustomField5?;
    string CustomField6?;
    string CustomField7?;
    string CustomField8?;
    string CustomField9?;
    string CustomField10?;
    string SalesforcecontactId?;
    string SalesforceAccountId?;
    string CreatedDate?;
    int Points?;
    string Brand?;
    string ManagerId?;
    string ManagerName?;
    boolean EnableTextNotifications?;
    string Website?;
    string Twitter?;
    string ExpirationDate?;
    string JobRole?;
    string ExternalEmployeeId?;
    string ProfileType?;
};

public type Body6 record {
    UsersuseridcoursesCourse[] Course?;
};

public type Body7 record {
    UserscoursesUser[] User?;
};

public type Body4 record {
    TeamsteamidlearningpathsLearningpath[] LearningPath?;
};

public type Body5 record {
    string 'parameter?;
};

public type Body2 record {
    CollectionscollectionidlearningpathsLearningpath[] LearningPath?;
};

public type InlineResponse20030User record {
    string Id?;
    string UserName?;
    string FirstName?;
    string LastName?;
    boolean Active?;
    string Email?;
    string AccessLevel?;
    string Brand?;
};

public type Body3 record {
    string Id?;
};

public type Listing record {
    string Id;
    string Name;
    boolean Active;
    string DurationType;
    string MaxUsers;
    int DurationDays;
    string FixedDate;
    string CollectionId;
};

public type InlineResponse20017Teamuser record {
    string TeamId?;
    string Id?;
    string OriginalTeamId?;
    string OriginalUserId?;
    boolean Active?;
    boolean IsTeamLeader?;
    boolean IsTeamAdmin?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type InlineResponse2001 record {
    string Id?;
    string OriginalId?;
    string Code?;
    string Name?;
    string Description?;
    string CourseCode?;
    boolean Active?;
    boolean IncludeInLibrary?;
    boolean CompleteInOrder?;
    string CourseImageURL?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
    boolean ForSale?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string Price?;
    string AccessTillDate?;
    string AccessTillDays?;
    string DueDate?;
    string DueDateSpan?;
    string ComplianceDate?;
    string ComplianceDateSpan?;
    string ComplianceRetake?;
    string[] Languages?;
    string Topics?;
    string Tags?;
    string CoursePreRequisites?;
    string LearningPathPreRequisites?;
    string Skills?;
    boolean Social?;
    boolean DiscussionForum?;
    string AdvCourseCustomField1?;
    string AdvCourseCustomField2?;
    string AdvCourseCustomField3?;
    string AdvCourseCustomField4?;
    string AdvCourseCustomField5?;
    string AdvCourseCustomField6?;
    string AdvCourseCustomField7?;
    string AdvCourseCustomField8?;
    string AdvCourseCustomField9?;
    string AdvCourseCustomField10?;
    boolean AllModulesNewWindow?;
    boolean Certificate?;
    int BoostsReleased?;
    int BoostsFrequency?;
};

public type LearningPath record {
    string Id;
    string Name?;
    string Description?;
    boolean Active?;
    string OriginalId?;
    boolean ForSale?;
    int Price?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string AccessTillDate?;
    int AccessTillDays?;
    boolean IsEquivalency?;
    boolean LearningPathTeamLibrary?;
};

public type Body1 record {
    string Id?;
};

public type InlineResponse2003 record {
    string Id?;
    string UserOriginalId?;
    string UserName?;
    string FirstName?;
    string LastName?;
    boolean Active?;
    string Email?;
    string AccessLevel?;
    string LoginKey?;
    string CourseId?;
    string CourseOriginalId?;
    string UpdatedDate?;
    string Code?;
    string CourseName?;
    boolean Complete?;
    string PercentageComplete?;
    string CompletedDate?;
    boolean UpToDate?;
    boolean Overdue?;
    string CompliantTillDate?;
};

public type InlineResponse20012Coursemodule record {
    string CourseId?;
    string Id?;
    string OriginalCourseId?;
    string OriginalModuleId?;
    boolean Active?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type InlineResponse2002 record {
    string Id?;
    string UserName?;
    string FirstName?;
    string LastName?;
    boolean Completed?;
    string PercentageComplete?;
    string CompliantTill?;
    string DueDate?;
};

public type InlineResponse2005 record {
    InlineResponse2005Module[] Module?;
};

public type Day record {
    string Id;
    string StartDate;
    string EndDate;
    string StartTime;
    string EndTime;
    boolean SendReminder;
    @constraint:Int {minValue: 1}
    int ReminderValue;
    string ReminderMetric;
};

public type InlineResponse2004 record {
    string 'parameter?;
};

public type ListingUsers record {
    ListingUser[] ListingUser;
};

public type InlineResponse2007 record {
    InlineResponse2007Learningpath[] LearningPath?;
};

public type InlineResponse2006 record {
    InlineResponse2006Course[] Course?;
};

public type InlineResponse2005Module record {
    string Id?;
    string OriginalId?;
    string Name?;
    string Description?;
    boolean Active?;
    int Passmark?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string ModuleType?;
};

public type InlineResponse2008Moduleresult record {
    string Id?;
    string UserId?;
    string OriginalModuleId?;
    string OriginalUserId?;
    string ModuleResultId?;
    boolean Active?;
    string Name?;
    int Passmark?;
    int Score?;
    string UserName?;
    boolean Completed?;
    int AttemptNumber?;
    string CreatedBy?;
    string FinishedDate?;
    string CreatedDate?;
    string StartedDate?;
    string TimeTaken?;
    string UpdatedDate?;
    string Code?;
};

public type Body10 record {
    InlineResponse20030User[] User?;
};

public type ListingUser record {
    string Id;
    string UserName;
    string FirstName;
    string LastName;
    boolean Active?;
    string Email;
    string AccessLevel;
    string Brand;
};

public type InlineResponse2006Course record {
    string Id?;
    string Code?;
    string Name?;
    boolean Active?;
    boolean ForSale?;
    string OriginalCourseId?;
    string Description?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string CourseCodeForBulkImport?;
    int Price?;
    string AccessTillDate?;
    int AccessTillDays?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
    int CompliantTillDays?;
    string TimeLimitDate?;
    int TimeLimitDays?;
    int DisplayOrder?;
    boolean IncludeInLibrary?;
    string CourseImageURL?;
};

public type CourseImports record {
    CourseImport[] CourseImport?;
};

public type Listings record {
    Listing[] Listings;
};

public type CollectionscollectionidlearningpathsLearningpath record {
    string LearnigPathId?;
    int SeqId?;
};

public type InlineResponse20014Usercourse record {
    string UserId?;
    string Id?;
    string OriginalUserId?;
    string OriginalCourseId?;
    boolean Active?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type Achievement record {
    string UserId?;
    string Title?;
    string Description?;
    string AchievementDate?;
    string CourseId?;
    string ComplaintTillDate?;
    @constraint:Int {minValue: 1, maxValue: 100}
    int Score?;
    string Result?;
    string Type?;
    string FirstName?;
    string LastName?;
    string AchievementId?;
    string CertificateId?;
};

public type UserCollection record {
    record {} Pagination;
    Users[] Item?;
};

public type Course record {
    string Id;
    string Code?;
    string Name?;
    boolean Active?;
    boolean ForSale?;
    string OriginalId?;
    string Description?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string CourseCodeForBulkImport?;
    int Price?;
    string AccessTillDate?;
    int AccessTillDays?;
    boolean CourseTeamLibrary?;
    string CreatedBy?;
    string Tags?;
};

public type Collections record {
    Collection[] ListingUser?;
};

public type ActionActivitys record {
    ActionActivity[] ActionActivity;
};

public type ContentActivitys record {
    ContentActivity[] ContentActivity;
};

public type UserSessionRegistrationStatus record {
    int TotalUsersRegistered?;
    int Failed?;
};

public type CourseBulkImport record {
    string ImportId?;
    string ImportDate?;
    string Status?;
    int TotalRecords?;
    int TotalCoursesCreated?;
    int Failed?;
};

public type CourseImport record {
    string CourseTitle;
    string Description?;
    string CourseCode?;
    boolean Active;
    boolean ContentLibrary?;
    string Notifications?;
    boolean ModuleOrder?;
    string CourseInactivationDate?;
    string CourseAccessExpirationDate?;
    @constraint:Int {maxValue: 100}
    int CourseAccessExpirationDateSpan?;
    string DueDate?;
    @constraint:Int {maxValue: 100}
    int DueDateSpan?;
    @constraint:Int {maxValue: 100}
    int ComplianceDateSpan?;
    boolean ComplianceRetake?;
    string Topic1?;
    string Topic2?;
    string Topic3?;
    string Social?;
    boolean DiscussionForum?;
    string CoursePrerequisite1?;
    string CoursePrerequisite2?;
    string CoursePrerequisite3?;
    string LearningPathPrerequisite1?;
    string LearningPathPrerequisite2?;
    string LearningPathPrerequisite3?;
    string Language?;
    string Tags?;
    string AdvCourseCustomField1?;
    string AdvCourseCustomField2?;
    string AdvCourseCustomField3?;
    string AdvCourseCustomField4?;
    string AdvCourseCustomField5?;
    string AdvCourseCustomField6?;
    string AdvCourseCustomField7?;
    string AdvCourseCustomField8?;
    string AdvCourseCustomField9?;
    string AdvCourseCustomField10?;
    string ReferenceCode?;
};

public type Achievements record {
    Achievement[] Course?;
};

public type Collection record {
    string Name;
    string Description;
    boolean DefaultListing?;
    string ImageURL?;
};

public type InlineResponse2009Userresult record {
    string Id?;
    string UserId?;
    string OriginalCourseId?;
    string OriginalUserId?;
    string Name?;
    boolean Active?;
    string CreatedDate?;
    string UpdatedDate?;
    string StartedDate?;
    boolean Completed?;
    int PercentageComplete?;
    string CompletedDate?;
    string UpToDate?;
    boolean Overdue?;
    string CompliantTillDate?;
    string DueDate?;
    string LastAttemptDate?;
    string CreatedBy?;
    string UpdatedBy?;
    string Code?;
    string UserName?;
    boolean LearningPathAssignment?;
    boolean TeamAssignment?;
};

public type UserBulkImports record {
    UserBulkImport[] UserBulkImport;
};

public type User record {
    string Id;
    string UserName;
    string FirstName?;
    string LastName;
    string FullName?;
    string Email;
    string AccessLevel;
    boolean DisableMessages;
    boolean Active;
    string Skype?;
    string PhoneWork?;
    string PhoneMobile?;
    string LastLogin?;
    string LoginKey?;
    boolean IsCustomUsername;
    string Password?;
    boolean SkipFirstLogin;
    string TimeZone;
    string SalesforceId?;
    string OriginalId?;
    string Street1?;
    string Street2?;
    string City?;
    string State?;
    string PostalCode?;
    string Country?;
    string SalesforceContactId?;
    string SalesforceAccountId?;
    string CreatedDate?;
    int Points?;
    string CompanyName?;
    string JobTitle?;
    string CustomField1?;
    string CustomField2?;
    string CustomField3?;
    string CustomField4?;
    string CustomField5?;
    string CustomField6?;
    string CustomField7?;
    string CustomField8?;
    string CustomField9?;
    string CustomField10?;
    string Culture?;
    string Brand?;
    string ManagerId?;
    string ManagerName?;
    boolean EnableTextNotification?;
    string Website?;
    string Twitter?;
    string ExpirationDate?;
    string JobRole?;
    string ExternalEmployeeId?;
    string ProfileType?;
};

public type CourseCustomFields record {
    CourseCustomField[] CourseCustomField;
};

public type InlineResponse20019Teamlearningpath record {
    string TeamId?;
    string Id?;
    string OriginalLearningPathId?;
    string OriginalTeamId?;
    boolean Active?;
    boolean IsInTeamLibrary?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type Courses record {
    Course[] Course?;
};

public type InlineResponse200 record {
    string Username?;
    string ImporStatus?;
};

public type CollectionscollectionidcoursesCourse record {
    string CourseId?;
    int SeqId?;
};

public type InlineResponse20025User record {
    string Id?;
    string Username?;
    string FirstName?;
    string LastName?;
    boolean Active?;
    string Email?;
    string AccessLevel?;
    string Brand?;
};

public type InlineResponse20015Learningpathuser record {
    string LearningPathId?;
    string Id?;
    string OriginalLearningPathId?;
    boolean Active?;
    string OriginalUserId?;
    string CreatedBy?;
    string CreatedDate?;
    string UpdatedBy?;
    string UpdatedDate?;
};

public type InlineResponse20011Achievement record {
    string Id?;
    string UserId?;
    string CourseId?;
    string LearningPathId?;
    string OriginalAchievementId?;
    string OriginalUserId?;
    string OriginalCourseId?;
    string OriginalLearningPathId?;
    string ComplaintTillDate?;
    string Title?;
    string AchievementDate?;
    string Type?;
    string CertificateId?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string UpdatedBy?;
};

public type LoginActivitys record {
    LoginActivity[] LoginActivity;
};

public type ContentActivity record {
    string ActivityType?;
    string ObjectType?;
    string ObjectId?;
    string OriginalObjectId?;
    string ObjectName?;
    string TargetObjectType?;
    string TargetObjectId?;
    string OriginalTargetObjectId?;
    string TargetObjectName?;
    string ActivityBy?;
    string ActivityByUserName?;
    string ActivityDate?;
};

public type Body record {
    CollectionscollectionidcoursesCourse[] Course?;
};

public type ModuleResult record {
    string CourseId;
    string UserId;
    int Score;
    boolean Completed;
    string UpdatedAt;
    string Note;
    int Attempts;
};

public type AssignmentActivity record {
    string ActivityType?;
    string ObjectType?;
    string ObjectId?;
    string OriginalObjectId?;
    string ObjectName?;
    string TargetObjectType?;
    string TargetObjectId?;
    string OriginalTargetObjectId?;
    string TargetObjectName?;
    string ActivityBy?;
    string ActivityByUserName?;
    string ActivityDate?;
};

public type InlineResponse20010Learningpathresult record {
    string Id?;
    string UserId?;
    string OriginalLearningPathId?;
    string OriginalUserId?;
    boolean Active?;
    string Name?;
    int PercentageComplete?;
    boolean Completed?;
    string CreatedDate?;
    string UpdatedDate?;
    string CompliantTillDate?;
    string StartDate?;
    string FinishDate?;
    string CreatedBy?;
};

public type LoginActivity record {
    string ActivityType?;
    string UserId?;
    string OriginalUserId?;
    string UserName?;
    string IPAddress?;
    string LoginDate?;
};

public type InlineResponse20028Course record {
    string Id?;
    string Code?;
    string Name?;
    boolean Active?;
    boolean Complete?;
    int PercentageComplete?;
    string AssignedDate?;
    string StartDate?;
    string CompletedDate?;
    boolean UpToDate?;
    boolean Overdue?;
    string ComplaintTill?;
    boolean IsLearningPath?;
    string CourseCreatedDate?;
    string CourseCreator?;
    string OriginalId?;
    string ResultId?;
    string AccessTillDate?;
};

public type InlineResponse20021Course record {
    string Id?;
    string Code?;
    string Name?;
    boolean Active?;
    string UpdatedBy?;
    string OriginalId?;
    string Description?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string Skills?;
    int Price?;
    string AccessTillDate?;
    int AccessTillDays?;
    string CoursePreRequisites?;
    string LearningPathPreRequisites?;
    string Currency?;
    string Languages?;
    string Topics?;
    string Tags?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
};

public type InlineResponse20010 record {
    InlineResponse20010Learningpathresult[] LearningPathResult?;
};

public type InlineResponse20012 record {
    InlineResponse20012Coursemodule[] CourseModule?;
};

public type InlineResponse20011 record {
    InlineResponse20011Achievement[] Achievement?;
};

public type InlineResponse20014 record {
    InlineResponse20014Usercourse[] UserCourse?;
};

public type InlineResponse20013 record {
    InlineResponse20013Learningpathcourse[] LearningPathCourse?;
};

public type InlineResponse20016 record {
    InlineResponse20016Team[] Team?;
};

public type InlineResponse20022Learningpath record {
    string Id?;
    string Name?;
    string Description?;
    boolean Active?;
    string OriginalId?;
    int Price?;
    string EcommerceShortDescription?;
    string EcommerceLongDescription?;
    string AccessTillDate?;
    int AccessTillDays?;
    string CreatedDate?;
    string UpdatedDate?;
    string CreatedBy?;
    string Code?;
    string Currency?;
    string Languages?;
    string Topics?;
    string Tags?;
    string CoursePreRequisites?;
    string LearningPathPreRequisites?;
    string Skills?;
    string UpdatedBy?;
};

public type InlineResponse20015 record {
    InlineResponse20015Learningpathuser[] LearningPathUser?;
};

public type InlineResponse20018 record {
    InlineResponse20018Teamcourse[] TeamCourse?;
};

public type Session record {
    string Id;
    string Name;
    string InstructorUserId;
    @constraint:Int {minValue: 1, maxValue: 4}
    int SessionType;
    Day[] Days;
    string TimeZone;
    string Location;
    int LocationId;
    string StartDate?;
    string EndDate?;
    int Slots?;
    string Accepted?;
    boolean EnableWaitList?;
};

public type InlineResponse20017 record {
    InlineResponse20017Teamuser[] TeamUser?;
};
