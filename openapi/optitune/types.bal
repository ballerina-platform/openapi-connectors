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

public type AccountArr Account[];

public type AgentInstallerArr AgentInstaller[];

public type AlertInstanceArr AlertInstance[];

public type AlertSubscriptionArr AlertSubscription[];

public type AnnouncementArr Announcement[];

public type ApplicationArr Application[];

public type AuditLogEntryArr AuditLogEntry[];

public type BackupCloudberryComputerPlanArr BackupCloudberryComputerPlan[];

public type BackupCloudberryComputerPlanHistoryArr BackupCloudberryComputerPlanHistory[];

public type BenchmarkDataPointArr BenchmarkDataPoint[];

public type BenchmarkDataSetArr BenchmarkDataSet[];

public type BenchmarkArr Benchmark[];

public type BillingLicenseUsageArr BillingLicenseUsage[];

public type BrandDomainArr BrandDomain[];

public type BrandArr Brand[];

public type BusinessEntityArr BusinessEntity[];

public type ComputerMetadataArr ComputerMetadata[];

public type ComputerArr Computer[];

public type DeploymentResultArr DeploymentResult[];

public type DeploymentArr Deployment[];

public type EndpointProtectionSettingsArr EndpointProtectionSettings[];

public type EventCategoryArr EventCategory[];

public type EventCategoryMembershipArr EventCategoryMembership[];

public type EventDescriptorArr EventDescriptor[];

public type EventSourceArr EventSource[];

public type FavoriteTaskArr FavoriteTask[];

public type FileArr File[];

public type GroupMembershipArr GroupMembership[];

public type OptiTuneGroupArr OptiTuneGroup[];

public type InstallTaskArr InstallTask[];

public type LocalUserArr LocalUser[];

public type MailTemplateArr MailTemplate[];

public type MalwareThreatArr MalwareThreat[];

public type NotificationGroupMemberAccountArr NotificationGroupMemberAccount[];

public type NotificationGroupMemberArr NotificationGroupMember[];

public type NotificationGroupArr NotificationGroup[];

public type OptiTuneTaskArr OptiTuneTask[];

public type OrganizationArr Organization[];

public type OrganizationSettingsArr OrganizationSettings[];

public type PerformanceSettingsArr PerformanceSettings[];

public type ProductKeyArr ProductKey[];

public type RemoteAccessSettingsArr RemoteAccessSettings[];

public type RemoteAssistanceRequestArr RemoteAssistanceRequest[];

public type RepairTaskArr RepairTask[];

public type RetiredComputerArr RetiredComputer[];

public type ScriptTaskArr ScriptTask[];

public type SystemTaskArr SystemTask[];

public type TrayIconSettingsArr TrayIconSettings[];

public type UninstallTaskArr UninstallTask[];

public type WebhookArr Webhook[];

public type WindowsEventLogEntryArr WindowsEventLogEntry[];

public type WindowsEventLogNameArr WindowsEventLogName[];

public type WindowsEventLogSettingsArr WindowsEventLogSettings[];

public type WindowsUpdateArr WindowsUpdate[];

public type WindowsUpdateCategoryArr WindowsUpdateCategory[];

public type WindowsUpdateComputerStateArr WindowsUpdateComputerState[];

public type WindowsUpdateHistoryEntryArr WindowsUpdateHistoryEntry[];

public type WindowsUpdateSettingsArr WindowsUpdateSettings[];

public type AgentState record {
    string ComputerID?;
    string OrganizationID?;
    int ClientVersion?;
    string ClientDisplayVersion?;
    string ClientApp?;
    string ClientTime?;
    string LastUpdated?;
    int AutoUpdateCount?;
    LogMessage[] LogMessages?;
    AgentStatus LastStatus?;
    # Maps from queue name to AgentQueue, in a case insensitive manner
    record {} Queues?;
};

# The account is an OptiTune user account
public type Account record {
    # The id of the account
    string ID?;
    # The roles assigned to the account, only certain combinations of these flags are allowed, which include:
    # 
    # Admin
    # Admin | GroupRestricted
    # ReportReader
    # ReportReader | GroupRestricted
    # ReportReader | RemoteAssistance
    # ReportReader | RemoteAssistance | GroupRestricted
    string Roles;
    # The first name for the account
    string FirstName;
    # The last name for the account
    string LastName;
    # The user name for the account
    string UserName;
    # The password for the account
    string Password?;
    # The email for the account
    string Email;
    # The mobile number for the account, used to send SMS text messages
    string SMSNumber?;
    # The authentication mode for the account, which determines how the user will login
    string AuthenticationMode;
    # The timezone ID for the account
    # 
    # Valid values include:
    # 
    # Value: 'Dateline Standard Time'             Offset: '-12:00:00'
    # Value: 'UTC-11'							    Offset: '-11:00:00'
    # Value: 'Aleutian Standard Time'             Offset: '-10:00:00'
    # Value: 'Hawaiian Standard Time'             Offset: '-10:00:00'
    # Value: 'Marquesas Standard Time'            Offset: '-09:30:00'
    # Value: 'Alaskan Standard Time'              Offset: '-09:00:00'
    # Value: 'UTC-09'							    Offset: '-09:00:00'
    # Value: 'Pacific Standard Time (Mexico)'     Offset: '-08:00:00'
    # Value: 'UTC-08'							    Offset: '-08:00:00'
    # Value: 'Pacific Standard Time'              Offset: '-08:00:00'
    # Value: 'US Mountain Standard Time'          Offset: '-07:00:00'
    # Value: 'Mountain Standard Time (Mexico)'    Offset: '-07:00:00'
    # Value: 'Mountain Standard Time'             Offset: '-07:00:00'
    # Value: 'Central America Standard Time'      Offset: '-06:00:00'
    # Value: 'Central Standard Time'              Offset: '-06:00:00'
    # Value: 'Easter Island Standard Time'        Offset: '-06:00:00'
    # Value: 'Central Standard Time (Mexico)'     Offset: '-06:00:00'
    # Value: 'Canada Central Standard Time'       Offset: '-06:00:00'
    # Value: 'SA Pacific Standard Time'           Offset: '-05:00:00'
    # Value: 'Eastern Standard Time (Mexico)'     Offset: '-05:00:00'
    # Value: 'Eastern Standard Time'              Offset: '-05:00:00'
    # Value: 'Haiti Standard Time'                Offset: '-05:00:00'
    # Value: 'Cuba Standard Time'                 Offset: '-05:00:00'
    # Value: 'US Eastern Standard Time'           Offset: '-05:00:00'
    # Value: 'Turks And Caicos Standard Time'     Offset: '-05:00:00'
    # Value: 'Paraguay Standard Time'             Offset: '-04:00:00'
    # Value: 'Atlantic Standard Time'             Offset: '-04:00:00'
    # Value: 'Venezuela Standard Time'            Offset: '-04:00:00'
    # Value: 'Central Brazilian Standard Time'    Offset: '-04:00:00'
    # Value: 'SA Western Standard Time'           Offset: '-04:00:00'
    # Value: 'Pacific SA Standard Time'           Offset: '-04:00:00'
    # Value: 'Newfoundland Standard Time'         Offset: '-03:30:00'
    # Value: 'Tocantins Standard Time'            Offset: '-03:00:00'
    # Value: 'E. South America Standard Time'     Offset: '-03:00:00'
    # Value: 'SA Eastern Standard Time'           Offset: '-03:00:00'
    # Value: 'Argentina Standard Time'            Offset: '-03:00:00'
    # Value: 'Greenland Standard Time'            Offset: '-03:00:00'
    # Value: 'Montevideo Standard Time'           Offset: '-03:00:00'
    # Value: 'Magallanes Standard Time'           Offset: '-03:00:00'
    # Value: 'Saint Pierre Standard Time'         Offset: '-03:00:00'
    # Value: 'Bahia Standard Time'                Offset: '-03:00:00'
    # Value: 'UTC-02'							    Offset: '-02:00:00'
    # Value: 'Mid-Atlantic Standard Time'         Offset: '-02:00:00'
    # Value: 'Azores Standard Time'               Offset: '-01:00:00'
    # Value: 'Cape Verde Standard Time'           Offset: '-01:00:00'
    # Value: 'UTC'								Offset: '00:00:00'
    # Value: 'GMT Standard Time'					Offset: '00:00:00'
    # Value: 'Greenwich Standard Time'            Offset: '00:00:00'
    # Value: 'Sao Tome Standard Time'             Offset: '00:00:00'
    # Value: 'Morocco Standard Time'              Offset: '00:00:00'
    # Value: 'W. Europe Standard Time'            Offset: '01:00:00'
    # Value: 'Central Europe Standard Time'       Offset: '01:00:00'
    # Value: 'Romance Standard Time'              Offset: '01:00:00'
    # Value: 'Central European Standard Time'     Offset: '01:00:00'
    # Value: 'W. Central Africa Standard Time'    Offset: '01:00:00'
    # Value: 'Jordan Standard Time'               Offset: '02:00:00'
    # Value: 'GTB Standard Time'					Offset: '02:00:00'
    # Value: 'Middle East Standard Time'          Offset: '02:00:00'
    # Value: 'Egypt Standard Time'                Offset: '02:00:00'
    # Value: 'E. Europe Standard Time'            Offset: '02:00:00'
    # Value: 'Syria Standard Time'                Offset: '02:00:00'
    # Value: 'West Bank Standard Time'            Offset: '02:00:00'
    # Value: 'South Africa Standard Time'         Offset: '02:00:00'
    # Value: 'FLE Standard Time'					Offset: '02:00:00'
    # Value: 'Israel Standard Time'               Offset: '02:00:00'
    # Value: 'Kaliningrad Standard Time'          Offset: '02:00:00'
    # Value: 'Sudan Standard Time'                Offset: '02:00:00'
    # Value: 'Libya Standard Time'                Offset: '02:00:00'
    # Value: 'Namibia Standard Time'              Offset: '02:00:00'
    # Value: 'Arabic Standard Time'               Offset: '03:00:00'
    # Value: 'Turkey Standard Time'               Offset: '03:00:00'
    # Value: 'Arab Standard Time'                 Offset: '03:00:00'
    # Value: 'Belarus Standard Time'              Offset: '03:00:00'
    # Value: 'Russian Standard Time'              Offset: '03:00:00'
    # Value: 'E. Africa Standard Time'            Offset: '03:00:00'
    # Value: 'Iran Standard Time'                 Offset: '03:30:00'
    # Value: 'Arabian Standard Time'              Offset: '04:00:00'
    # Value: 'Astrakhan Standard Time'            Offset: '04:00:00'
    # Value: 'Azerbaijan Standard Time'           Offset: '04:00:00'
    # Value: 'Russia Time Zone 3'                 Offset: '04:00:00'
    # Value: 'Mauritius Standard Time'            Offset: '04:00:00'
    # Value: 'Saratov Standard Time'              Offset: '04:00:00'
    # Value: 'Georgian Standard Time'             Offset: '04:00:00'
    # Value: 'Volgograd Standard Time'            Offset: '04:00:00'
    # Value: 'Caucasus Standard Time'             Offset: '04:00:00'
    # Value: 'Afghanistan Standard Time'          Offset: '04:30:00'
    # Value: 'West Asia Standard Time'            Offset: '05:00:00'
    # Value: 'Ekaterinburg Standard Time'         Offset: '05:00:00'
    # Value: 'Pakistan Standard Time'             Offset: '05:00:00'
    # Value: 'Qyzylorda Standard Time'            Offset: '05:00:00'
    # Value: 'India Standard Time'                Offset: '05:30:00'
    # Value: 'Sri Lanka Standard Time'            Offset: '05:30:00'
    # Value: 'Nepal Standard Time'                Offset: '05:45:00'
    # Value: 'Central Asia Standard Time'         Offset: '06:00:00'
    # Value: 'Bangladesh Standard Time'           Offset: '06:00:00'
    # Value: 'Omsk Standard Time'                 Offset: '06:00:00'
    # Value: 'Myanmar Standard Time'              Offset: '06:30:00'
    # Value: 'SE Asia Standard Time'              Offset: '07:00:00'
    # Value: 'Altai Standard Time'                Offset: '07:00:00'
    # Value: 'W. Mongolia Standard Time'          Offset: '07:00:00'
    # Value: 'North Asia Standard Time'           Offset: '07:00:00'
    # Value: 'N. Central Asia Standard Time'      Offset: '07:00:00'
    # Value: 'Tomsk Standard Time'                Offset: '07:00:00'
    # Value: 'China Standard Time'                Offset: '08:00:00'
    # Value: 'North Asia East Standard Time'      Offset: '08:00:00'
    # Value: 'Singapore Standard Time'            Offset: '08:00:00'
    # Value: 'W. Australia Standard Time'         Offset: '08:00:00'
    # Value: 'Taipei Standard Time'               Offset: '08:00:00'
    # Value: 'Ulaanbaatar Standard Time'          Offset: '08:00:00'
    # Value: 'Aus Central W. Standard Time'       Offset: '08:45:00'
    # Value: 'Transbaikal Standard Time'          Offset: '09:00:00'
    # Value: 'Tokyo Standard Time'                Offset: '09:00:00'
    # Value: 'North Korea Standard Time'          Offset: '09:00:00'
    # Value: 'Korea Standard Time'                Offset: '09:00:00'
    # Value: 'Yakutsk Standard Time'              Offset: '09:00:00'
    # Value: 'Cen. Australia Standard Time'       Offset: '09:30:00'
    # Value: 'AUS Central Standard Time'          Offset: '09:30:00'
    # Value: 'E. Australia Standard Time'         Offset: '10:00:00'
    # Value: 'AUS Eastern Standard Time'          Offset: '10:00:00'
    # Value: 'West Pacific Standard Time'         Offset: '10:00:00'
    # Value: 'Tasmania Standard Time'             Offset: '10:00:00'
    # Value: 'Vladivostok Standard Time'          Offset: '10:00:00'
    # Value: 'Lord Howe Standard Time'            Offset: '10:30:00'
    # Value: 'Bougainville Standard Time'         Offset: '11:00:00'
    # Value: 'Russia Time Zone 10'                Offset: '11:00:00'
    # Value: 'Magadan Standard Time'              Offset: '11:00:00'
    # Value: 'Norfolk Standard Time'              Offset: '11:00:00'
    # Value: 'Sakhalin Standard Time'             Offset: '11:00:00'
    # Value: 'Central Pacific Standard Time'      Offset: '11:00:00'
    # Value: 'Russia Time Zone 11'                Offset: '12:00:00'
    # Value: 'New Zealand Standard Time'          Offset: '12:00:00'
    # Value: 'UTC+12'							    Offset: '12:00:00'
    # Value: 'Fiji Standard Time'                 Offset: '12:00:00'
    # Value: 'Kamchatka Standard Time'            Offset: '12:00:00'
    # Value: 'Chatham Islands Standard Time'      Offset: '12:45:00'
    # Value: 'UTC+13'							    Offset: '13:00:00'
    # Value: 'Tonga Standard Time'                Offset: '13:00:00'
    # Value: 'Samoa Standard Time'                Offset: '13:00:00'
    # Value: 'Line Islands Standard Time'         Offset: '14:00:00'
    string TimeZoneCode;
    # Whether or not the page size will be remembered when the user views various pages in OptiTune
    boolean SavePageSize;
    # If provided, restrict the account to only accessing computers in the given group, or any of its sub groups
    string GroupRestriction?;
};

public type UninstallKeyCondition record {
    string SubKey;
    int ListOrder?;
};

public type DoubleParameter record {
    float MinValue?;
    float MaxValue?;
    float Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

# A group membership entry
public type GroupMembership record {
    string GroupID?;
    string ComputerID?;
    string MembershipType?;
};

public type WeeklySchedule record {
    string TimezoneID?;
    AnyTimeWeeklyScheduleItem[] AnyTimeWeeklyScheduleItems?;
    SelectDaysWeeklyScheduleItem[] SelectDaysWeeklyScheduleItems?;
    SelectTimesWeeklyScheduleItem[] SelectTimesWeeklyScheduleItems?;
};

public type MalwareProtectionStateGroupMembershipRule record {
    string Value;
    int ListOrder?;
};

public type ComputerDetailsNetworkAdapters record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    int ConfigManagerErrorCode?;
    string Description?;
    string Manufacturer?;
    string AdapterType?;
    string NetConnectionID?;
    int NetConnectionStatus?;
    int NetEnabled?;
    string MACAddress?;
    int Speed?;
    string Status?;
};

# Tray icon settings for a group of computers
public type TrayIconSettings record {
    # The ID of the group that the settings apply to
    string GroupID?;
    # The date and time the settings were last modified
    string DateModified?;
    # Whether or not the tray icon application is enabled/disabled on each computer in the group
    string TrayIconState?;
    # The title in the Support Center Overview screen. You can customize this to include your own company's branding.
    string Title;
    # The description in the Support Center Overview screen. You can customize this to provide an overview for the Support Center.
    string Description;
    # The organization or person who provides technical support.
    string SupportedBy;
    # The main support website (optional).
    string Website?;
    # The main support email address.
    string Email;
    # The main support phone number (optional).
    string Phone?;
    # Any notes or information you wish to provide to the end user.  For example, you could include hours of operation.
    string Notes?;
    SupportActionsList SupportActions?;
    # A File ID for a icon (.ico) file to use in the support center application's main window, the tray section of the windows task bar, and the desktop shortcut as well
    string CustomIconFileID?;
    # If specified, this will create a desktop shortcut using the given name to provide easier access to the support center application for end users
    string DesktopShortcutName?;
};

public type DailyScheduleItem record {
    string Time?;
    int ListOrder?;
};

public type Computer record {
    string ID?;
    string OrganizationID?;
    string ComputerName?;
    string DomainName?;
    int OSMajorVersion?;
    int OSMinorVersion?;
    int OSBuildNumber?;
    string OSVersion?;
    int OSServicePack?;
    string OSArchitecture?;
    string OSProductKey?;
    string ComputerType?;
    string MachineGuid?;
    string ClientID?;
    string LocalIP?;
    string PublicIP?;
    int PublicIPNumber?;
    string ClientVersion?;
    string LastReportDate?;
    string FirstReportDate?;
    # Gets the fully qualified name of the computer, e.g. "Bravura\BRAVO2"
    string ComputerFullName?;
    # Gets the display name for the computer, if one is set, otherwise returns ComputerName
    string ComputerDisplayName?;
};

# Windows Event Log settings for a group of computers
public type WindowsEventLogSettings record {
    # The ID of the group that these settings apply to
    string GroupID?;
    # Whether or not the collection of windows event log entries is enabled/disabled on each computer in the group
    string CollectionState?;
    Schedule CollectionSchedule?;
    # Defines which system event logs to collect from
    string EventLogsMask?;
    # Any other custom event logs to collect from, for example 'Microsoft-Windows-Windows Defender/Operational'
    string[] OtherEventLogNames?;
    # The levels of windows event log entries to include, a bitmask
    string EventLogLevels?;
    # The maximum number of event log entries to collect for each event log on each computer
    int MaxEntries?;
};

public type ComputerDetailsData record {
    string ID?;
    string ComputerID?;
    string DateGenerated?;
    string ComputerSystem_ComputerName?;
    string ComputerSystem_DomainName?;
    int ComputerSystem_DomainRole?;
    int ComputerSystem_PartOfDomain?;
    string ComputerSystem_BootupState?;
    string ComputerSystem_Manufacturer?;
    string ComputerSystem_Model?;
    int ComputerSystem_NumberOfLogicalProcessors?;
    int ComputerSystem_NumberOfProcessors?;
    int ComputerSystem_PCSystemType?;
    int ComputerSystem_PowerState?;
    int ComputerSystem_PowerSupplyState?;
    string ComputerSystem_SystemType?;
    int ComputerSystem_ThermalState?;
    int ComputerSystem_TotalPhysicalMemory?;
    string ComputerSystem_UserName?;
    string ComputerSystemProduct_Caption?;
    string ComputerSystemProduct_IdentifyingNumber?;
    string ComputerSystemProduct_Name?;
    string ComputerSystemProduct_SKUNumber?;
    string ComputerSystemProduct_Vendor?;
    string SystemEnclosure_Manufacturer?;
    string SystemEnclosure_OtherIdentifyingInfo?;
    string SystemEnclosure_PartNumber?;
    string SystemEnclosure_Name?;
    string SystemEnclosure_SerialNumber?;
    string SystemEnclosure_SMBIOSAssetTag?;
    string OperatingSystem_Name?;
    string OperatingSystem_BootDevice?;
    int OperatingSystem_BuildNumber?;
    string OperatingSystem_BuildType?;
    string OperatingSystem_Caption?;
    string OperatingSystem_CodeSet?;
    string OperatingSystem_CountryCode?;
    string OperatingSystem_CSDVersion?;
    int OperatingSystem_CurrentTimeZone?;
    int OperatingSystem_Debug?;
    int OperatingSystem_FreePhysicalMemory?;
    string OperatingSystem_InstallDate?;
    string OperatingSystem_LastBootUpTime?;
    string OperatingSystem_Manufacturer?;
    string OperatingSystem_MUILanguages?;
    int OperatingSystem_OperatingSystemSKU?;
    string OperatingSystem_Organization?;
    string OperatingSystem_OSArchitecture?;
    int OperatingSystem_OSLanguage?;
    int OperatingSystem_OSProductSuite?;
    int OperatingSystem_OSType?;
    string OperatingSystem_OtherTypeDescription?;
    int OperatingSystem_PAEEnabled?;
    int OperatingSystem_ProductType?;
    string OperatingSystem_SerialNumber?;
    int OperatingSystem_ServicePackMajorVersion?;
    int OperatingSystem_ServicePackMinorVersion?;
    int OperatingSystem_SuiteMask?;
    string OperatingSystem_SystemDevice?;
    string OperatingSystem_SystemDirectory?;
    string OperatingSystem_Version?;
    string Motherboard_Manufacturer?;
    string Motherboard_Product?;
    string Motherboard_SerialNumber?;
    string Motherboard_Version?;
    string Bios_Caption?;
    string Bios_Manufacturer?;
    string Bios_Name?;
    string Bios_ReleaseDate?;
    string Bios_SMBIOSBIOSVersion?;
    int Bios_SMBIOSMajorVersion?;
    int Bios_SMBIOSMinorVersion?;
    string Bios_Status?;
    string Bios_Version?;
    float WinSAT_CPUScore?;
    float WinSAT_D3DScore?;
    float WinSAT_DiskScore?;
    float WinSAT_GraphicsScore?;
    float WinSAT_MemoryScore?;
    float WinSAT_WinSPRLevel?;
    int Details_TotalRam?;
    int Details_TotalDiskSize?;
    int Details_TotalDiskFreeSpace?;
    string Details_PrimaryCPU?;
    int Details_PCType?;
};

public type SelectDaysWeeklyScheduleItem record {
    string Days?;
    int ListOrder?;
};

public type TimePeriod record {
    int Days?;
    int Hours?;
    int Minutes?;
    int Seconds?;
    int ListOrder?;
};

# Summary description for LocalUser
public type LocalUser record {
    string ID?;
    string ComputerID?;
    string UserName?;
    string DomainName?;
    string FullName?;
    string Comment?;
    string Sid?;
    string ProfilePath?;
    boolean HasAllDetails?;
    string PrivilegesMask?;
    string Flags?;
    string LastLogonTime?;
};

public type ComputerDetailsPhysicalMemory record {
    string ID?;
    string ComputerDetailsID?;
    string BankLabel?;
    int Capacity?;
    string DeviceLocator?;
    int FormFactor?;
    string Manufacturer?;
    int MemoryType?;
    string PartNumber?;
    string SerialNumber?;
    int Speed?;
};

# A business entity, which will always have an associated group.  You can think of the business entity as extra fields or metadata to associate with a group, such
# as addresses, contact information, websites, etc...  Every business entity will have an associated group, but not every group will have an associated business entity.
# The tree of business entities will also be a subset of the tree of groups.
public type BusinessEntity record {
    string ID?;
    # The ID of the business entity's parent business entity
    string ParentID?;
    # The ID of the group associated with this business entity
    string GroupID?;
    # The type of the business entity.  Depending on the type, not all of the data fields
    # will be shown in the UI when displaying the business entity
    string Type?;
    # The name of the business entity
    string Name;
    # The description of the business entity
    string Description?;
    # Any notes you wish to keep about the business entity
    string Notes?;
    # The date and time the business entity was last modified
    string DateModified?;
    # The first name of the person to contact for the business entity
    string ContactFirstName?;
    # The last name of the person to contact for the business entity
    string ContactLastName?;
    # The email address of the person to contact for the business entity
    string ContactEmail?;
    # The phone number of the person to contact for the business entity
    string ContactPhone?;
    # The website of the business entity
    string Website?;
    # The mailing address of the business entity
    string MailingAddress?;
    # The physical address of the business entity
    string PhysicalAddress?;
    # The account number of the business entity
    string AccountNumber?;
    # The first name of the sales person who handles the business entity
    string RelationshipManagerFirstName?;
    # The last name of the sales person who handles the business entity
    string RelationshipManagerLastName?;
    # The email of the sales person who handles the business entity
    string RelationshipManagerEmail?;
    # The phone number of the sales person who handles the business entity
    string RelationshipManagerPhone?;
};

public type ComputerDetailsPortableBattery record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    string Manufacturer?;
    string Location?;
    int Chemistry?;
    int DesignCapacity?;
    int DesignVoltage?;
    string Status?;
};

public type OrganizationRegistration record {
    # The user name of the administrator of the organization
    string UserName;
    # The password for the administrator of the organization.  This is only used when setting up a new organization
    string Password;
    # An optional registration code to use when registering a new organization
    string RegistrationCode?;
    # An optional timezone code for the new account
    string TimeZoneCode?;
    # The unique ID of the organization on this management server
    string ID?;
    # The date and time the organization was added to this management server, in UTC
    string DateAdded?;
    # The name of the organization
    string Name;
    # An optional website for the organization
    string Website?;
    # The first name of a contact person at the organization
    string ContactFirstName;
    # The last name of a contact person at the organization
    string ContactLastName;
    # The contact person's email address
    string ContactEmail;
    # The contact person's phone number
    string ContactPhone?;
    # If GenerateApiCredentials is true when adding an organization, this will hold the API User Name
    string GeneratedApiUserName?;
    # If GenerateApiCredentials is true when adding an organization, this will hold the API Password
    string GeneratedApiPassword?;
};

public type SelectTimesWeeklyScheduleItem record {
    string Days?;
    string StartTime?;
    string EndTime?;
    int ListOrder?;
};

public type ComputerDetailsDiskShares record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    string Caption?;
    string Path?;
    string Status?;
};

public type ConnectionStatusInfo record {
    string Status?;
    string LastPollUtc?;
    int PollingInterval?;
};

public type AuditLogCustomDataEntry record {
    string Name?;
    string Format?;
    string Value?;
};

public type ComputerDetailsDiskVolumes record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    int BootVolume?;
    int Capacity?;
    int Compressed?;
    string DriveLetter?;
    int DriveType?;
    string FileSystem?;
    int FreeSpace?;
    int IndexingEnabled?;
    int PageFilePresent?;
    int QuotasEnabled?;
    int SystemVolume?;
};

public type OptiTuneTask record {
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};

# A repair task, for repairing an installed MSI application
public type RepairTask record {
    SystemConditions InstalledConditions?;
    string MsiProduct?;
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};

public type WindowsUpdateComputerState record {
    string ID?;
    string UpdateID?;
    string ComputerID?;
    string State?;
    string StateDate?;
    int ErrorCode?;
};

# Summary description for AuditLogEntry
public type AuditLogEntry record {
    string ID?;
    string OrganizationID?;
    string AccountID?;
    string UserName?;
    string SourceType?;
    string TargetID?;
    string TargetType?;
    string TargetName?;
    string Date?;
    string IPAddress?;
    string WebBrowser?;
    string PagePath?;
    int Result?;
    string Importance?;
    string Area?;
    string MessageType?;
    string MessageTypeDetail?;
    string Message?;
    AuditLogCustom Data?;
};

public type ComputerDetailsVideoCards record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    string AdapterCompatibility?;
    string AdapterDACType?;
    int AdapterRAM?;
    int ConfigManagerErrorCode?;
    int CurrentBitsPerPixel?;
    int CurrentHorizontalResolution?;
    int CurrentNumberOfColors?;
    int CurrentRefreshRate?;
    int CurrentVerticalResolution?;
    string DriverDate?;
    string DriverVersion?;
    string Status?;
    int VideoArchitecture?;
    int VideoMemoryType?;
    string VideoModeDescription?;
    string VideoProcessor?;
};

public type AgentQueueItem record {
    string DisplayName?;
    string ID?;
    string Started?;
    int RunTime?;
    string Stage?;
};

# A remote assistance request, created when an end user requests remote assistance
public type RemoteAssistanceRequest record {
    string ID?;
    string ComputerID?;
    string UserName;
    string FullName;
    string Email;
    string Phone?;
    string UserMessage?;
    string LocalIPAddresses?;
    string DateCreated?;
};

# Summary description for Application
public type Application record {
    string ID?;
    string ComputerID?;
    string UninstallSubKeyName?;
    string MsiProductID?;
    string DisplayName?;
    string UserName?;
    string Comments?;
    string Contact?;
    string HelpTelephone?;
    string HelpUrl?;
    string PublisherName?;
    string UpdateInfoUrl?;
    string Version?;
    int InstallerActions?;
    string DateInstalled?;
    int InstallSize?;
    string InstallSource?;
    string ModifyCmd?;
    string Location?;
    string UninstallCmd?;
};

# Summary description for Application
public type BackupCloudberryComputerConfig record {
    string ID?;
    string ComputerID?;
    string EngineVersion?;
    string Edition?;
    string BackupUserEmail?;
    record  { } [] License?;
    record  { } [] EngineSettings?;
};

public type WindowsUpdateHistoryEntry record {
    string ID?;
    string ComputerID?;
    string UpdateNumber?;
    int RevisionNumber?;
    string Title?;
    string Description?;
    string ClientApplication?;
    string Date?;
    int ErrorCode?;
    string Operation?;
    string OperationResult?;
    int SelectedServer?;
    string SupportUrl?;
    string UninstallNotes?;
    string[] UninstallSteps?;
};

# An event category
public type EventCategory record {
    string ID?;
    string Name;
    string Description;
};

# An organization on this management server
public type Organization record {
    # The unique ID of the organization on this management server
    string ID?;
    # The date and time the organization was added to this management server, in UTC
    string DateAdded?;
    # The name of the organization
    string Name;
    # An optional website for the organization
    string Website?;
    # The first name of a contact person at the organization
    string ContactFirstName;
    # The last name of a contact person at the organization
    string ContactLastName;
    # The contact person's email address
    string ContactEmail;
    # The contact person's phone number
    string ContactPhone?;
    # If GenerateApiCredentials is true when adding an organization, this will hold the API User Name
    string GeneratedApiUserName?;
    # If GenerateApiCredentials is true when adding an organization, this will hold the API Password
    string GeneratedApiPassword?;
};

public type AllUpdateFilter record {
    int ListOrder?;
};

# This class represents an Announcement on the management server, visible to all organizations
public type Announcement record {
    string Title?;
    string ContentHtml?;
    string DateDisplay?;
    string DateExpires?;
    string ID?;
};

public type NameUpdateFilter record {
    string Name;
    int ListOrder?;
};

public type ComputerDetailsDiskDrive record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    int ConfigManagerErrorCode?;
    string FirmwareRevision?;
    string InterfaceType?;
    string Manufacturer?;
    string Model?;
    string SerialNumber?;
    int Size?;
    string Status?;
};

# Windows update group policy settings for a group of computers
public type WindowsUpdateGroupPolicy record {
    # Controls the state of the Windows Update Automatic Update agent, i.e. you can turn off automatic updates or enable them
    # on supported versions of Windows (usually the enterprise versions of Windows 10 for example).
    string ConfigureAutomaticUpdatesState?;
    # Use the following values to control how windows itself automatically installs windows updates
    # 
    # 2 - Notify for download and auto install
    # When Windows finds updates that apply to this computer, users will be notified that updates are ready to be downloaded.After going to Windows Update, users can download and install any available updates.
    # 
    # 3 - Auto download and notify for install
    # Windows finds updates that apply to the computer and downloads them in the background (the user is not notified or interrupted during this process). When the downloads are complete, users will be notified that they are ready to install. After going to Windows Update, users can install them.
    # 
    # 4 - Auto download and schedule the install
    # The default schedule for all installations will be every day at 3:00 AM. If any updates require a restart to complete the installation, Windows will restart the computer automatically. (If a user is signed in to the computer when Windows is ready to restart, the user will be notified and given the option to delay the restart.)
    # 
    # 5 - Allow local admin to choose setting
    # With this option, local administrators will be allowed to use the Windows Update control panel to select a configuration option of their choice. Local administrators will not be allowed to disable the configuration for Automatic Updates.
    int AutomaticUpdates?;
    # This setting lets you configure the download method used by Delivery Optimization, in Windows 10 computers or above.
    # Specifies the download method that Delivery Optimization can use in downloads of Windows Updates, Apps and App updates.
    string ConfigureDownloadModeState?;
    # 0 - HTTP only
    # HTTP only, no peering
    # 
    # 1 - LAN
    # HTTP blended with peering behind the same NAT.
    # 
    # 2 - Group
    # HTTP blended with peering across a private group.Peering occurs on devices in the same Active Directory Site(if exist) or the same domain by default. When this option is selected, peering will cross NATs. To create a custom group use Group ID in combination with Mode 2.
    # 
    # 3 - Internet
    # HTTP blended with Internet Peering.
    # 
    # 99 - Simple
    # Simple download mode with no peering. Delivery Optimization downloads using HTTP only and does not attempt to contact the Delivery Optimization cloud services.
    # 
    # 100 - Bypass
    # Bypass mode. Do not use Delivery Optimization and use BITS instead.
    int DownloadMode?;
    # CorpWuURL - Specify intranet Microsoft update service location
    string UseWUServer?;
    # CorpWUURL_Name - Set the intranet update service for detecting updates:
    string WUServer?;
    # CorpWUStatusURL_Name - Set the intranet statistics server:
    string WUStatusServer?;
    # CorpWUContentHost_Name - Set the alternate download server:
    string UpdateServiceUrlAlternate?;
    # CorpWUFillEmptyContentUrls - Download files with no Url in the metadata if alternate download server is set.
    # 
    # Added in the April service release of Windows 10, version 1607. Allows Windows Update Agent to determine the download URL when it is missing from the metadata. This scenario will occur when intranet update service stores the metadata files but the download contents are stored in the ISV file cache (specified as the alternate download URL).
    boolean FillEmptyContentUrls?;
    # TargetGroup_Title - Enable client-side targeting
    string EnableWUTargetGroup?;
    # TargetGroup_Name - Target group name for this computer
    string TargetGroup?;
};

public type GroupMembershipRules record {
    string Logic;
    GroupMembershipValueMatchesRule[] ValueMatchesRules?;
    ComputerTypeGroupMembershipRule[] ComputerTypeRules?;
    WindowsInstallDateGroupMembershipRule[] WindowsInstallDateRules?;
    PhysicalMemoryGroupMembershipRule[] PhysicalMemoryRules?;
    MalwareProtectionStateGroupMembershipRule[] MalwareProtectionStateRules?;
    MalwareThreatExistsGroupMembershipRule[] MalwareThreatExistsRules?;
    OSGroupMembershipRule[] OSRules?;
};

public type OSConditionItem record {
    string Version?;
    string Architecture?;
    int MinServicePack?;
};

public type ComputerDetailsSoundDevices record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    int ConfigManagerErrorCode?;
    string Manufacturer?;
    string Status?;
};

public type RegistryKeyCondition record {
    string Key;
    int ListOrder?;
};

public type OneTimeScheduleItem record {
    string DateAndTime?;
    int ListOrder?;
};

public type MalwareThreatExistsGroupMembershipRule record {
    string Value;
    int ListOrder?;
};

# A system task, for performing simple operations, like restarting or shutting down a computer
public type SystemTask record {
    string SystemTaskType?;
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};

public type UpdateFilters record {
    AllUpdateFilter[] AllUpdateFilters?;
    NameUpdateFilter[] NameUpdateFilters?;
    NameContainsUpdateFilter[] NameContainsUpdateFilters?;
    KBArticleUpdateFilter[] KBArticleUpdateFilters?;
    IDUpdateFilter[] IDUpdateFilters?;
    CustomUpdateFilter[] CustomUpdateFilters?;
};

# A mail template for sending alert notification emails and SMS messages
public type MailTemplate record {
    # The ID of the mail template
    string ID?;
    # The name of the mail template
    string Name;
    # The FROM email address to use when sending the email
    string FromAddress;
    # The template for the subject of the email.  This can contain variables, see the OptiTune help documentation for more details.
    string Subject;
    # The template for the body of the email.  This can contain variables, see the OptiTune help documentation for more details.
    string Body;
    # The format of the body, either plain text or html
    string BodyType?;
    # The template for the body of the SMS message.  This can contain variables, see the OptiTune help documentation for more details.
    string SMSBody?;
};

# An OrganizationSettings object
public type OrganizationSettings record {
    string OrganizationID?;
    # The storage quota (in bytes) assigned to the organization, from 100MB to 25TB
    int StorageQuota?;
    # An optional billing token to associate with the organization, if monthly billing is to be used in addition or instead of product keys
    string BillingToken?;
    # Specifies whether or not the billing token is locked.  If true, the user cannot edit the billing token, otherwise they can edit the billing
    # token for the organization.
    boolean BillingLocked?;
};

public type IDUpdateFilter record {
    string UpdateNumber;
    string UpdateRevision?;
    int ListOrder?;
};

# An OptiTune product key (registration code)
public type ProductKey record {
    string ExpirationDate?;
    int NumLicenses?;
    boolean IsTrialLicense?;
    string RegistrationCode;
};

public type OnceAfterScheduleItem record {
    string DateAndTimeUTC?;
    int ListOrder?;
};

public type AuditLogCustom record {
    AuditLogCustomDataEntry[] Entries?;
};

public type RegistryValueCondition record {
    string Key;
    # We don't support ValueName of length 0, use a RegistryKeyCondition instead
    string ValueName;
    string ValueType?;
    string StringValue?;
    int DwordValue?;
    int ListOrder?;
};

public type PhysicalMemoryGroupMembershipRule record {
    int TotalMemoryBytes;
    string BelowOrAbove;
    int ListOrder?;
};

public type BenchmarkDataPoint record {
    string ID?;
    string ComputerID?;
    int BenchmarkID?;
    int DataSetID?;
    string Date?;
    float Value?;
    int Flags?;
};

# A retired computer describes a previously managed computer that is retired, and not allowed to access OptiTune
public type RetiredComputer record {
    string ComputerID?;
    string ComputerName?;
    string DomainName?;
};

public type SimpleParameterList record {
    StringParameter[] StringParameters?;
    IntParameter[] IntParameters?;
    LongParameter[] LongParameters?;
    DoubleParameter[] DoubleParameters?;
    GuidParameter[] GuidParameters?;
    DateParameter[] DateParameters?;
    EnumParameter[] EnumParameters?;
    EnumParameter[] MaskParameters?;
};

# Windows update settings for a group of computers
public type WindowsUpdateSettings record {
    # The ID of the group
    string GroupID?;
    # The state for whether or not the OptiTune agent should upload update information to the management server
    string MonitoringState?;
    # Whether or not the OptiTune agent should install windows updates according to the AutomaticInstallSchedule, and the include/exclude filters
    string AutomaticInstallState?;
    Schedule AutomaticInstallSchedule?;
    # If AutomaticInstallState = Enabled, use this variable to control the reboot behavior for updates that require a system reboot
    string AutomaticInstallRebootBehavior?;
    UpdateFilters AutomaticInstallIncludeFilter?;
    UpdateFilters AutomaticInstallExcludeFilter?;
    # Windows update group policy settings for a group of computers
    WindowsUpdateGroupPolicy WindowsUpdateGroupPolicy?;
};

public type ComputerTypeGroupMembershipRule record {
    string PCType;
    int ListOrder?;
};

public type PathsList record {
    string[] Paths?;
};

public type LogMessage record {
    string Text?;
    string Time?;
    string MessageType?;
};

# A notification group member, for sending emails or SMS messages to users who don't have an OptiTune account.
public type NotificationGroupMember record {
    # The ID of the notification group member
    string ID?;
    # The ID of the notification group
    string NotificationGroupID?;
    # The first name of the user
    string FirstName;
    # The last name of the user
    string LastName;
    # The email address of the user
    string Email?;
    # The phone number of the user, for sending SMS messages
    string SMSNumber?;
};

public type CustomUpdateFilter record {
    int PublishedDaysGreaterThan?;
    int PublishedDaysLessThan?;
    string Product?;
    string Classification?;
    string Importance?;
    int Flags?;
    int ListOrder?;
};

# A Webhook for receiving a notification via HTTP POST
public type Webhook record {
    string ID?;
    string GroupID?;
    string Name;
    string Description?;
    string State?;
    string WebhookEventType?;
    string WebhookEventSubType?;
    string Url;
};

public type NameContainsUpdateFilter record {
    string NameContains;
    int ListOrder?;
};

# A group of computers
public type OptiTuneGroup record {
    # The ID of the group
    string ID?;
    # The ID of the parent group, if the group has a parent group
    string ParentID?;
    # The name of the group
    string Name;
    # Any notes you wish to keep about the group
    string Notes?;
    # The segment is a user readable string that identifies this group in a path of groups, for example,
    # "groupa" in groupa.groupb.root  
    # 
    # It should only contain lower case letters, digits, and '-' for spaces.  No punctuation or whitespace is allowed.
    # 
    # If left out or blank, it will be calculated based on the group name.
    string Segment?;
    # True if the group's members are managed by the system, otherwise false.
    # For example, All Computers is a system group
    boolean IsSystemGroup?;
    # True if the group represents one computer, and should be hidden from the user's view.
    # This allows the admin to make settings changes for a single computer, since the singleton group is used.
    boolean IsSingletonGroup?;
    # Currently, flags are used to determine what type of system group this group represents
    string Flags?;
    # The priority indicates the relative importance of the group.  Lower numbers indicate a higher priority,
    # and groups with lower numbers will win when conflicting settings are created for a computer that belongs to
    # multiple groups.
    int Priority?;
    GroupMembershipRules MembershipRules?;
};

# A favorite task is an organization wide task that is frequently used, and can be quickly deployed from the computer details page
public type FavoriteTask record {
    string TaskID?;
    string Name?;
};

public type KBArticleUpdateFilter record {
    string KBArticle;
    int ListOrder?;
};

public type AnyTimeWeeklyScheduleItem record {
    int ListOrder?;
};

public type DirectoryCondition record {
    string Name;
    int ListOrder?;
};

public type MalwareThreat record {
    string ID?;
    string ComputerID?;
    string Date?;
    string ThreatName?;
    int ThreatNumber?;
    string Severity?;
    string Category?;
    string Action?;
    string Detection?;
    string InfoUrl?;
    PathsList Processes?;
    string UserName?;
    int ErrorCode?;
    PathsList LocalPaths?;
    string Message?;
    int RecordNumber?;
    int EventNumber?;
    string State?;
};

# A Deployment of an OptiTune Task to a Group of computers (or the singleton group for an individual computer)
public type Deployment record {
    # The ID for the deployment
    string ID?;
    # The ID of the deployed task
    string TaskID?;
    # The ID of the group the task is deployed to
    string GroupID?;
    Schedule Schedule;
    # The date and time the deployment was last modified
    string DateModified?;
    # Whether or not the deployment is enabled/disabled
    string State?;
};

public type GroupMembershipValueMatchesRule record {
    string ValueType;
    # Note that this can be the empty string in certain cases, depending on the value of ValueType.  BadRequest will be returned
    # if this value is invalid
    string Value;
    int ListOrder?;
};

# Summary description for PageDTO
public type Page record {
    int Number?;
    int Size?;
};

public type WindowsInstallDateGroupMembershipRule record {
    string InstallTimeUTC;
    string BeforeOrAfter;
    int ListOrder?;
};

# A notification group for sending alert notification emails and SMS messages to
public type NotificationGroup record {
    # The ID of the notification group
    string ID?;
    # The name of the notification group
    string Name;
    # A description for the notification group
    string Description;
    # Any notes you wish to keep about the notification group
    string Notes?;
};

# An install task
public type InstallTask record {
    # The ID of the uploaded package file for the install task.  It may refer to an .exe, .msi, or .bvx file which contains the installer for the application
    string PackageFileID?;
    # Enter any other locations where the installation file is available, one per line.  If you have also specified a packaged file id, the name 
    # of the uploaded file must be the same as the filename in each additional location.
    # 
    # The client computer will try to download the file in the order specified, finally trying the file specified in PackageFileID, if any.
    #             
    # For example:
    # \\myserver\share\test1.bvx
    # https://www.mywebsite.com/packages/test1.bvx
    # https://mycompany.s3.amazonaws.com/packages/test1.bvx
    string[] Locations?;
    SystemConditions PreInstallConditions?;
    SystemConditions InstalledConditions?;
    # If the installer file specified in PackageFileID or Locations is an .exe or .msi, this must be identical to that filename
    # 
    # If the installer file specified is a .bvx package file, this refers to the filename inside the .bvx package to run when installing the application
    string SetupRelativePath;
    # Any command line arguments to pass to the installer file
    string CommandLineArgs?;
    # Whether or not to keep the installer files (.exe, .msi, or extracted files from the .bvx package) after the install completes
    boolean KeepInstallerFiles?;
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};

public type WindowsUpdate record {
    string ID?;
    string OrganizationID?;
    string UpdateNumber?;
    int RevisionNumber?;
    string Title?;
    string Description?;
    string[] KBs?;
    string PublishedDate?;
    string[] MoreInfoUrls?;
    string SupportUrl?;
    string[] Languages?;
    string MsrcSeverity?;
    string[] MsrcNumbers?;
    string Type?;
    string UninstallNote?;
    string[] UninstallSteps?;
    string Flags?;
};

public type BillingLicenseUsage record {
    string OrganizationID?;
    string Time?;
    int TotalComputers?;
    int Desktops?;
    int Laptops?;
    int Servers?;
    int StaticLicenses?;
    string ID?;
};

public type MonthlyScheduleItem record {
    int Day?;
    string Time?;
    int ListOrder?;
};

public type StartupScheduleItem record {
    int ListOrder?;
};

public type WindowsUpdateCategory record {
    string ID?;
    string OrganizationID?;
    string ParentID?;
    string CategoryNumber?;
    string ParentCategoryNumber?;
    string Name?;
    string Description?;
    string Type?;
    int DisplayOrder?;
};

public type Benchmark record {
    int ID?;
    string OrganizationID?;
    string Name?;
};

public type ComputerDetailsPrinter record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    string DriverName?;
    string Location?;
    int Attributes?;
    int IsDefault?;
    int DetectedErrorState?;
    int ExtendedDetectedErrorState?;
    int ExtendedPrinterStatus?;
    string Status?;
};

public type SupportActionsList record {
    RemoteAssistSupportAction[] RemoteAssistSupportActions?;
    UrlSupportAction[] UrlSupportActions?;
    EmailSupportAction[] EmailSupportActions?;
};

# Summary description for LocalUser
public type WindowsEventLogEntry record {
    string ID?;
    string ComputerID?;
    string LogNameID?;
    string ProviderName?;
    string ProviderGuid?;
    string Keywords?;
    int EventID?;
    string EventLevel?;
    string Message?;
    string TimeCreated?;
    string Sid?;
};

# The billing settings for an organization.  Provide a billing token from the Bravura Software Billing Portal
# to setup monthly billing for the organization.
public type BillingSettings record {
    # An optional billing token to associate with the organization, if monthly billing is to be used in addition or instead of product keys
    string BillingToken?;
};

public type FileCondition record {
    string Name;
    int ListOrder?;
};

public type OSGroupMembershipRule record {
    OSConditionItem[] Items;
    int ListOrder?;
};

# Endpoint protection settings for a group of computers
public type EndpointProtectionSettings record {
    string GroupID?;
    string MonitoringState?;
    string QuickScanState?;
    Schedule QuickScanSchedule?;
    string FullScanState?;
    Schedule FullScanSchedule?;
    string SignatureUpdateState?;
    Schedule SignatureUpdateSchedule?;
};

public type UpdatedScheduleItem record {
    string DateAndTimeUTC?;
    int ListOrder?;
};

public type BrandDomain record {
    string Domain?;
    string ID?;
};

public type SystemConditions record {
    string Logic;
    FileCondition[] FileConditions?;
    DirectoryCondition[] DirectoryConditions?;
    RegistryKeyCondition[] RegistryKeyConditions?;
    RegistryValueCondition[] RegistryValueConditions?;
    UninstallKeyCondition[] UninstallKeyConditions?;
    MSIProductCondition[] MSIProductConditions?;
    OSCondition[] OSConditions?;
};

public type DeploymentResult record {
    string ID?;
    string DeploymentID?;
    string ComputerID?;
    string Date?;
    boolean Result?;
    int DetailedResult?;
    int SubStatus?;
    int ErrorCode?;
    int ExitCode?;
    string Message?;
    string Output?;
};

# Summary description for Application
public type BackupCloudberryComputerPlan record {
    string ID?;
    string ComputerID?;
    # A cloudberry backup plan id, which may not be unique on a given computer
    string PlanId?;
    string PlanType?;
    string Name?;
    string DateModified?;
    record  { } [] PlanContent?;
};

# This class represents a brand that you can configure for your organization.  Each organization supports having 0, 1 or multiple brands, each of which
# has a unique title, domain name, colors, styles, and other assets that you can configure.  When you access the brand's domain name, you will be presented
# with the branded (white labeled) experience, instead of the default management portal.
public type Brand record {
    string ID?;
    # The ID of the brand root domain to use.  Use the BrandDomains resource to get all available root domains installed on the management server
    string BrandDomainID?;
    # A host name for accessing the branded site.  The fully qualified domain name will be "hostname.rootdomain", for example, "mycompany.rmmportal.com",
    # where "mycompany" is the host name, and "rmmportal.com" is the root domain
    string HostName;
    # The title is used (optionally) when rendering the logo, and showing the HTML page title in the browser.
    string Title;
    # The subtitle is used (optionally) when rendering the logo
    string Subtitle?;
    # A description for the brand.  This is for internal, informational purposes, and is not shown anywhere.
    string Description?;
    # A file ID for the icon the browser uses to represent the site.  It will be displayed in the browser tab, next to the title, and often as a bookmark icon for the site.  Must be .png
    string FaviconFileID?;
    # A file ID for a logo image to use in the login page, and other front pages of the site.  Must be .png, .jpg, .gif, .svg, or .webp
    string FrontpageLogoFileID?;
    # A file ID for a custom .CSS file for further customizing the appearance of the login page, and other front pages of the site.  This is for advanced users only.
    string FrontpageCssFileID?;
    # A file ID for a custom .CSS file for further customizing the appearance of the main site, after successfully logging in.  This is for advanced users only.
    string FrontpageBackgroundFileID?;
    # A file ID for a logo image to use in the main site, after successfully logging in.  Must be .png, .jpg, .gif, .svg, or .webp
    string MainpageLogoFileID?;
    # A file ID for a custom .CSS file for further customizing the appearance of the main site, after successfully logging in.  This is for advanced users only.
    string MainpageCssFileID?;
    # These flags determine how the logo is displayed on the front page and main page.  Note that if you add a .css file, it can further alter this behavior.
    string Flags?;
    # Specify a color for the tabs in the sidebar
    string TabColor;
    # Specify a color for the website buttons
    string ButtonColor;
    # Specify a color for the website page links
    string LinkColor;
    # Specify a color for text headings
    string HeadingColor;
    # Specify a color for highlights, used as a lighter background color for small item lists
    string HighlightColor;
    # Specify a color for drawing the background of the page
    string PageBackgroundColor;
    # Specify a color for drawing the background of each content box's header
    string ContentHeaderColor;
    # Specify a color for drawing the background of the sidebar
    string SidebarBackgroundColor;
    # The font size in points (pt) used to display the logo title.  It can be a decimal number.
    float TitleFontSize?;
    # The font size in points (pt) used to display the logo subtitle.  It can be a decimal number.
    float SubtitleFontSize?;
};

# An event source
public type EventSource record {
    string ID?;
    string Name;
    string Description;
    string Notes?;
    string Severity?;
    string State?;
    TimePeriod MinPeriod;
    string Scope?;
    string Scenario?;
    EventDescriptor Descriptor;
};

# A script task executes a script on a computer or group of computers, and uploads the output of the script to the management server
public type ScriptTask record {
    SystemConditions RunConditions?;
    string ScriptFileID?;
    string PackageFileID?;
    string ScriptType?;
    string CommandLineArgs?;
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};

public type PeriodicScheduleItem record {
    int Days?;
    int Hours?;
    int Minutes?;
    int Seconds?;
    int ListOrder?;
};

public type EventDescriptor record {
    SimpleParameterList Parameters?;
    # The type of event
    string Type?;
    # The scope of the event type
    string Scope?;
    # The scenario of the event type
    string Scenario?;
    # The explanation of the event type
    string Explanation?;
};

public type ComputerDetails record {
    ComputerDetailsData Details?;
    ComputerDetailsDiskDrive[] DiskDrives?;
    ComputerDetailsDiskShares[] DiskShares?;
    ComputerDetailsDiskVolumes[] DiskVolumes?;
    ComputerDetailsNetworkAdapters[] NetworkAdapters?;
    ComputerDetailsPhysicalMemory[] PhysicalMemory?;
    ComputerDetailsPortableBattery[] PortableBatteries?;
    ComputerDetailsPrinter[] Printers?;
    ComputerDetailsProcessors[] Processors?;
    ComputerDetailsSoundDevices[] SoundDevices?;
    ComputerDetailsVideoCards[] VideoCards?;
};

public type RemoteAssistSupportAction record {
    string Name;
    string Icon?;
    int ListOrder?;
};

public type AgentQueue record {
    string QueueName?;
    AgentQueueItem[] QueueItems?;
};

# A file that has been uploaded to OptiTune
public type File record {
    # The file's ID, used to reference the file in other resources
    string ID?;
    # The file's filename
    string FileName?;
    # The file's mime type
    string MimeType?;
    # The url from which the file can be downloaded
    string DownloadUrl?;
    # The date the file was created
    string DateCreated?;
    # The date the file was last modified
    string DateModified?;
    # The size of the file, in bytes
    int Size?;
    # The flags associated with the file
    string Flags?;
    # If the file is associated with a script task, the ID of the script task
    string ScriptTaskID?;
    # If the file is associated with a install task, the ID of the install task
    string InstallTaskID?;
    # If the file is associated with tray icon settings, the tray icon settings ID
    string TrayIconSettingsGroupID?;
    # If the file is associated with an agent installer, the ID of the agent installer
    string AgentInstallerID?;
    # If the file is associated with task metadata, the ID of the task metadata
    string TaskMetadataID?;
    # If the file is associated with a brand, the ID of the brand
    string BrandID?;
    # If one of the associated ID fields is present, the name of the associated entity
    string RelatedItemName?;
};

public type IntParameter record {
    int MinValue?;
    int MaxValue?;
    int Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

public type UrlSupportAction record {
    string UrlLink;
    string Name;
    string Icon?;
    int ListOrder?;
};

public type LongParameter record {
    int MinValue?;
    int MaxValue?;
    int Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

public type OnceBeforeScheduleItem record {
    string DateAndTimeUTC?;
    int ListOrder?;
};

public type MSIProductCondition record {
    string ID;
    int ListOrder?;
};

# Performance settings for a group of computers
public type PerformanceSettings record {
    # The ID of the group
    string GroupID?;
    # Is performance monitoring enabled?
    boolean MonitoringEnabled?;
    # The reporting interval, in seconds at which the agent should send performance data.  The default is 1 hour.
    int ReportingInterval?;
    # The sample interval, at which the agent should sample performance data.  The default is 30 seconds.
    int SampleInterval?;
    # The number of data points to store per computer.  The default is 5000.
    int MaxDataPoints?;
};

# Remote access settings for a group of computers
public type RemoteAccessSettings record {
    # The ID of the group that these settings apply to
    string GroupID?;
    # The date and time these settings were last modified
    string DateModified?;
    # Whether or not the relay server is enabled
    string RelayServerState?;
    # If the relay server is enabled, how is it chosen?
    string RelayServerSelectionMethod?;
    # If the relay server is enabled, and the selection method is Manual, provide a list of relay servers to use (fully qualified DNS names), e.g. "relay.opti-tune.com"
    string[] RelayServers?;
    # Whether or not the remote assistance application should have a firewall exception
    string RemoteAssistanceFirewallState?;
    # Whether or not the remote service application should have a firewall exception
    string RemoteServiceFirewallState?;
    # Enables/Disables the remote connect tool
    string RemoteConnectState?;
    # If enabled, show a message to the end user when the remote connect tool is activated
    string RemoteConnectNotifyState?;
    # If RemoteConnectNotifyState is Enabled, provide the message to display to the user when remote connect is activated on their machine
    string RemoteConnectNotifyMessage?;
    # Enables/Disables the other remote tools, such as the command prompt, task manager, powershell, etc...
    string RemoteToolsState?;
    # If enabled, show a message to the end user when the other remote tools are activated
    string RemoteToolsNotifyState?;
    # If RemoteToolsNotifyState is Enabled, provide the message to display to the user when any of the other remote tools are activated
    string RemoteToolsNotifyMessage?;
};

public type DateParameter record {
    string Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

public type AgentStatus record {
    string Status?;
    string DisplayText?;
    string Time?;
};

# Metadata for one computer
public type ComputerMetadata record {
    SimpleParameterList Parameters;
    string ComputerID?;
};

public type Body record {
    string file;
};

public type NameValuePair record {
    string Name;
    int Value?;
};

public type StringParameter record {
    int MinLength?;
    int MaxLength?;
    string Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

public type BenchmarkDataSet record {
    int ID?;
    string OrganizationID?;
    string Name?;
};

public type EndpointProtection record {
    string ID?;
    string ComputerID?;
    string ProductName?;
    string ProductVersion?;
    string ProductID?;
    string ProductSupported?;
    string InstalledDate?;
    string ModifiedDate?;
    string LocalPath?;
    string SignatureVersion?;
    string SignatureDate?;
    string EngineVersion?;
    string LastQuickScanDate?;
    string LastFullScanDate?;
    string RealtimeAntivirusState?;
    string RealtimeAntispywareState?;
    string AntivirusSignatureState?;
    string DetectionMethod?;
    string AntivirusScanSubstatus?;
    string AntivirusSettingsSubstatus?;
    string AntivirusProtectionUpdateSubstatus?;
    int AntivirusDaysUntilExpired?;
    string ActionRequired?;
};

public type EmailSupportAction record {
    string To;
    string Subject?;
    string Body?;
    boolean AttachScreenshot?;
    string Name;
    string Icon?;
    int ListOrder?;
};

public type MonthlyByWeekdayScheduleItem record {
    int WeekOrder?;
    string DayOfWeek?;
    string Time?;
    int ListOrder?;
};

public type EnumParameter record {
    int Value?;
    NameValuePair[] AllowedValues;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

# An alert instance
public type AlertInstance record {
    # The ID for the deployment
    string ID?;
    string Status?;
    string GroupID?;
    string EventSourceID?;
    string Time?;
    string ReportedTime?;
    string Details?;
};

public type OSCondition record {
    OSConditionItem[] Items;
    int ListOrder?;
};

public type BackupCloudberryComputerPlanHistory record {
    string PlanID?;
    string DateStarted?;
    int Duration?;
    int Result?;
    string ErrorMessage?;
    int FailedCount?;
    int PeakMemoryUsage?;
    int ProcessorTime?;
    int PurgedCount?;
    int ScannedCount?;
    int ScannedSize?;
    int TotalCount?;
    int TotalSize?;
    int UploadedCount?;
    int UploadedSize?;
    string ID?;
};

# A notification group member account entry, associating an account with a notification group
public type NotificationGroupMemberAccount record {
    # The ID of the notification group
    string NotificationGroupID?;
    # The ID of the account to associate with the notification group
    string AccountID?;
    # The methods to use to notify the account, either SMS, Email or both
    string NotificationMethods?;
};

public type ComputerDetailsProcessors record {
    string ID?;
    string ComputerDetailsID?;
    string Name?;
    string Manufacturer?;
    string ProcessorId?;
    int NumberOfCores?;
    int NumberOfLogicalProcessors?;
    string Socket?;
    int L2CacheSize?;
    int L3CacheSize?;
    int Revision?;
};

public type WeeklyScheduleItem record {
    string DayOfWeek?;
    string Time?;
    int ListOrder?;
};

public type WindowsEventLogName record {
    string OrganizationID?;
    string Name?;
    string ID?;
};

# Advanced settings for an organization
public type AdvancedSettings record {
    # The reporting url, where OptiTune agents send their reports.
    string ReportingUrl;
    # Specifies the minimum number of days that a Windows Update is available, before it is taken into account for Windows Update reporting.
    # For example, if you specify 5, then updates that have been released for less than 5 days won't affect the counts for number of computers needing important updates, recommended updates, or optional updates.
    int MinUpdateAge;
    SimpleParameterList ComputerMetadataPrototype;
};

# An event category membership entry.  This defines which event sources belong to which event categories.
public type EventCategoryMembership record {
    string EventCategoryID?;
    string EventSourceID?;
};

# An OptiTune agent installer
public type AgentInstaller record {
    # The ID of the agent installer
    string ID?;
    # The group ID the agent installer is associated with.  Normally when setting this you also
    # set the ClientIdentifier to match the group
    string GroupID?;
    # The date and time this agent installer was last modified
    string DateModified?;
    # An internal only name for the agent installer
    string Name;
    # An internal only description for the agent installer
    string Description;
    # Optional Publisher Name
    string PublisherName?;
    # Optional Application Name
    string ApplicationName?;
    # Optional Client Identifier to use when installing the OptiTune agent
    string ClientIdentifier?;
    # Specifies whether or not the agent can be downloaded by anyone who has the agent installer URL (true), or if the
    # user needs to be logged in to OptiTune to download the agent installer (false)
    boolean PublicDownload?;
    string InstallerIconFileID?;
    string InstallerBackgroundImageFileID?;
    string EulaFileID?;
    string PostInstallExeFileID?;
    string PostInstallCmdParameters?;
    string PostInstallUrlDisplayName?;
    string PostInstallUrl?;
    string InstallerFileID?;
    # If there was a problem building the installer, the description is saved
    # here, to be displayed to the user
    string LastBuildErrorMessage?;
};

public type GuidParameter record {
    string Value?;
    string Name;
    string Description?;
    string Type?;
    int ListOrder?;
};

public type Schedule record {
    StartupScheduleItem[] StartupScheduleItems?;
    PeriodicScheduleItem[] PeriodicScheduleItems?;
    OneTimeScheduleItem[] OneTimeScheduleItems?;
    OnceBeforeScheduleItem[] OnceBeforeScheduleItems?;
    OnceAfterScheduleItem[] OnceAfterScheduleItems?;
    UpdatedScheduleItem[] UpdatedScheduleItems?;
    DailyScheduleItem[] DailyScheduleItems?;
    WeeklyScheduleItem[] WeeklyScheduleItems?;
    MonthlyScheduleItem[] MonthlyScheduleItems?;
    MonthlyByWeekdayScheduleItem[] MonthlyByWeekdayScheduleItems?;
};

# An alert subscription
public type AlertSubscription record {
    string ID?;
    string GroupID?;
    string NotificationGroupID?;
    string MailTemplateID?;
    string State?;
    # Optional, a list of event categories to match, or null for no event categories
    string[] EventCategoryIDs?;
    string SeverityMask?;
    WeeklySchedule Times?;
};

# An uninstall task, for uninstalling a regular or MSI installed application
public type UninstallTask record {
    SystemConditions InstalledConditions?;
    # Enter the full command line to uninstall the application
    # You may use environment variables in the string as well.
    #             
    # For example:
    # %programfiles%\myapp32\bin\uinstall.exe /s /r
    # %programfiles64%\myapp64\bin\uinstall.exe /s /r
    string CommandLine?;
    # Enter the product ID (in Guid format) for the msi application you wish to uninstall
    #             
    # For example:
    # 837FEC39-0181-4EB3-BCB5-CFFC425B2345
    string MsiProduct?;
    # Enter the name of the uninstall subkey for the application.
    # The OptiTune client will use the UninstallString registry value
    # contained in the key to uninstall the application
    #             
    # For example:
    # myapp 
    # {2012098D-EEE9-4769-8DD3-B038050854D4}
    string UninstallSubkeyName?;
    # Enter any extra command line arguments you wish to pass to the uninstaller, when using the UninstallSubkeyName parameter
    # This allows you to specify the uninstall command using the uninstall registry key name, but add additional parameters such 
    # as a "quiet" or "silent" switch to the uninstaller
    # 
    # For example:
    # /s /q
    string UninstallSubkeyExtraCommandLineArgs?;
    string UninstallMethod?;
    # The ID for the task in the database
    string ID?;
    # The name of the task
    string Name;
    # A description of the task
    string Description;
    # Notes about the task
    string Notes?;
    # The date/time in UTC that the task was modified
    string DateModified?;
    # The time to wait for the task to complete, in minutes
    int Timeout?;
    # The type of task
    string TaskType?;
};
