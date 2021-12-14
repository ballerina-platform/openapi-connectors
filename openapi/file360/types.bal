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

public type ArchiveApplicationsArr ArchiveApplications[];

public type FileInfoArr FileInfo[];

public type FetchDocumentIndexReturnArr FetchDocumentIndexReturn[];

public type DocumentIdentifierArr DocumentIdentifier[];

public type SourceDocumentIdentifierArr SourceDocumentIdentifier[];

public type ServerStatusArr ServerStatus[];

public type UserIdentifierArr UserIdentifier[];

public type GroupIdentifierArr GroupIdentifier[];

public type UserArr User[];

public type GroupArr Group[];

# Archive.
public type Archive record {
    # Archive id
    int Id?;
    # Archive name
    string Name?;
};

# Data entry template description.
public type DataEntryTemplateDescription record {
    # Application id
    int ApplicationId?;
    # Application name
    string ApplicationName?;
    # Archive id
    int ArchiveId?;
    # Archive name
    string ArchiveName?;
    # Template id
    int Id?;
    # Template name
    string Name?;
};

# Callback handle.
public type CallbackHandle record {
    # External handler library
    string ExternalHandlerLibrary?;
    # External handler method
    string ExternalHandlerMethod?;
    # External handler name space
    string ExternalHandlerNamespace?;
    # External handler parameters
    string ExternalHandlerParameters?;
    # Callback handle id
    int HandleId?;
    # Callback label
    string Label?;
    # Source id
    int SourceId?;
    # Callback type. 0 = None, 1100 = Template entry,3101 = Field entry,3999 = Field entry static file,5001 = Field exit verification,5002 = Field exit min/max,5998 = Field exit existence check,5999 = Field exit static file,9999 = User exit
    int TypeCallback?;
    # User exit type. 0 = None, 1 = Callback usage, 2 = Mask, 3 = Lookup
    int TypeUserExit?;
};

# Remark.
public type Remark record {
    # Remark content
    string Content?;
    DocumentIdentifier DocumentIdentifier?;
};

public type DataEntryTemplate record {
    *DataEntryTemplateIdentifier;
    # Application id
    int ApplicationId?;
    # Application name
    string ApplicationName?;
    # Archive id
    int ArchiveId?;
    # Archive name
    string ArchiveName?;
    # Available devices
    DeviceIdentifier[] AvailableDevices?;
    # Can data enter
    boolean CanDataEnter?;
    # Can update
    boolean CanUpdate?;
    # Callback handle.
    CallbackHandle EntryCallback?;
    # Callback handle.
    CallbackHandle ExitCallback?;
    # Collection of field ids and input field objects
    DataEntryInputFieldItem[] InputFields?;
    # Device identifier.
    DeviceIdentifier SelectedDevice?;
};

# Lookup table entry field key value pair
public type LookupTableEntryItem record {
    # List Key
    string Key?;
    # List Value
    string Value?;
};

# Retrieval template access item.
public type RetrievalTemplateAccessItem record {
    RetrievalTemplate Key?;
    # Access enabled for retrieval template.
    boolean Value?;
};

# A retrieval template description.
public type RetrievalTemplateDescription record {
    # Application id
    int ApplicationId?;
    # Application name
    string ApplicationName?;
    # Template friendly name
    string FriendlyName?;
    # Template id
    int Id?;
    # Template name
    string Name?;
};

# Permission item.
public type PermissionItem record {
    # Permission
    int PermissionItem?;
};

# Source document identifier.
public type SourceDocumentIdentifier record {
    # Master id
    int MasterId;
    # Version id
    int Version;
    # Date version was created
    string VersionCreated?;
    # Version creator user id
    int VersionCreatorId?;
    # Version creator name
    string VersionCreatorName?;
    # Version label
    string VersionLabel?;
};

# Workitem form field.
public type WorkitemFormInboxField record {
    # Inbox field name
    string Name?;
    # Inbox field value
    string Value?;
};

# Application identifier.
public type ApplicationIdentifier record {
    # Application id
    int Id?;
    # Application name
    string Name?;
};

# Device identifier.
public type DeviceIdentifier record {
    # Device type. 0 = None,1 = Cache,2 = Keyfile,3 = MicrofilmIdw,4 = MicrofilmImt,5 = MicrofilmIms,6 = MicrofilmI7300,7 = LocalCdrom,8 = LocalCdWriter,9 = RemoteCdrom,10 = RemoteCdWriter,11 = CdromJukebox,12 = CdromJukeboxWriter,13 = CacheServer,14 = DocServer,15 = Offline,16 = AutoCache,17 = Scanner,18 = Volume,19 = ContentServer
    int DeviceType?;
    # Device id
    int Id?;
    # Device name
    string Name?;
};

# Retrieval template input field id and object.
public type RetrievalTemplateInputFieldItem record {
    # Field Id
    string Key?;
    RetrievalTemplateInputField[] Value?;
};

# Workitem.
public type Workitem record {
    # Can modify document index
    boolean CanModifyDocumentIndex?;
    # Workitem class name
    string ClassName?;
    # Data entry template id
    int DataEntryTemplateId?;
    # Workitem form field.
    WorkitemFormField[] FormFields?;
    # Workitem history.
    WorkitemHistory[] History?;
    # Workitem id
    string Id?;
    # Workitem form inbox fields.
    WorkitemFormInboxField[] InboxFields?;
    # Is workitem in progress
    boolean IsInProgress?;
    # Has workitem been modified
    boolean IsModified?;
    # Is workitem reserved
    boolean IsReserved?;
    # Workitem name
    string Name?;
    # Send to default workset
    boolean SendToDefault?;
    DocumentIdentifier SourceDocument?;
    # Workitem type
    int Type?;
    # Workflow id
    int WorkflowId?;
    # Workflow name
    string WorkflowName?;
    # Workset name
    string WorksetName?;
    # Time workitem entered the workstep
    string WorkstepEntryTime?;
    # Workstep name
    string WorkstepName?;
};

public type Volume record {
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # Volume id
    int Id?;
    # Volume label
    string Label?;
    # Should move files to target
    boolean ShouldMoveFilesToTarget?;
    # Volume slot
    int Slot?;
    # Device identifier.
    DeviceIdentifier TargetDeviceIdentifier?;
};

# Workitem form field.
public type WorkitemFormField record {
    # Field data type - one of the following : None = 0, Currency = 11, Date = 9, DateTime = 8, Double = 5, Float = 4, LongInteger = 3, String = 6, Time = 10
    int FieldDataType?;
    # Workitem form field label
    string Hint?;
    # Workitem form field id
    int Id?;
    # Is the Workitem form field a memo field
    boolean IsMemo?;
    # Is the Workitem form field read only
    boolean IsReadOnly?;
    # Is the Workitem form field required
    boolean IsRequired?;
    # Workitem form field label
    string Label?;
    # Workitem form field length
    int Length?;
    # Workitem form field name
    string Name?;
    # Possible display options of the field.
    string[] OptionList?;
    # Workitem form field value
    string Value?;
    # A collection of values for the form field.
    string[] ValueList?;
};

# Create document information.
public type CreateDocumentinfo record {
    DataEntryTemplate dataEntryTemplate;
    # An array of relative document file paths. Which are expected to resolve to paths within the File360 Web Server's directory. Like : '/documents/uploads/1.tif'. This will resolve to '{WebServerInstallDir}/documents/uploads/1.tif'. No escape characters are accepted.
    IndexFolderDocumentFile[] indexFolderDocumentFiles;
};

# User identifier.
public type UserIdentifier record {
    # User id
    int Id?;
    # User name
    string Name?;
};

# Application.
public type Application record {
    # Application id
    int Id?;
    # Application name
    string Name?;
};

public type Group record {
    *GroupIdentifier;
    # Active directory LDAP path
    string ActiveDirectoryLDAPPath?;
    # Date created.
    string Created?;
    # Date modified.
    string Modified?;
    # Reserved license count.
    int ReservedLicenseCount?;
    # User count.
    int UserCount?;
    # Members. (This collection will only be populated by the GET 'group/members' API call)
    User[] Members?;
    # A collection of functional security items.
    FunctionalSecurityItem[] FunctionalSecurity?;
    # Collection of application field access items.
    ApplicationFieldAccessItem[] ApplicationFieldAccess?;
    # Collection of data entry template access items.
    DataEntryTemplateAccessItem[] DataEntryTemplateAccess?;
    # Collection of retrieval template access items.
    RetrievalTemplateAccessItem[] RetrievalTemplateAccess?;
    # Source document security access.
    SourceDocumentSecurityAccessItem[] SourceDocumentSecurityAccess?;
    # Index document security access.
    IndexDocumentSecurityAccessItem[] IndexDocumentSecurityAccess?;
};

# Functional security item.
public type FunctionalSecurityItem record {
    # Permission item description.
    PermissionItemDescriptionItem Key?;
    # Permission item enabled.
    boolean Value?;
};

# A collection of hits.
public type Hits record {
    DocumentFormatIcon[] DocumentFormatIcons?;
    Hit[] HitItems?;
    int HitlistId?;
    # Look up tables.
    LookupTable[] LookupTables?;
    boolean MoreHits?;
    RetrievalTemplate RetrievalTemplate?;
    string SearchUri?;
    record {}[] StatusIcons?;
    int TotalResults?;
    string WebServerUri?;
};

# Callback external column.
public type CallbackExternalColumn record {
    boolean CopyToTarget?;
    string Name?;
    int TargetFieldId?;
};

public type CdromJukebox record {
    *Device;
    # Cache device
    Cache[] CacheDevices?;
    # Check that device employs the best practices
    boolean CheckForBestPractices?;
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # Is this CD read only
    boolean IsReadOnly?;
    # Most recent label
    string MostRecentLabel?;
    # device path identifier.
    PathIdentifier PathIdentifier?;
    # Device operation status.
    OperationStatus StatusReport?;
    # Workstation definition.
    Workstation WorkstationIdentifier?;
};

# Index document.
public type IndexedDocument record {
    # Index action
    int Action?;
    # Application id
    int ApplicationId?;
    # Archive id
    int ArchiveId?;
    # Source document identifier.
    SourceDocumentIdentifier Document?;
    # Index folder document.
    IndexFolderDocument FolderData?;
    # Index folder document.
    IndexFolderDocument NextFolderData?;
};

# Index-able error folders
public type IndexFoldersMessage record {
    # Batch error count
    int BatchErrorCount?;
    # Index-able folders
    IndexFolder[] IndexFolders?;
    # Is the batch in an unknown error state?
    boolean UnknownBatchErrorState?;
};

# Device operation status.
public type OperationStatus record {
    # Can the operation be canceled
    boolean CanCancel?;
    # Operation count
    int Count?;
    # Operation status message
    string StatusMessage?;
    # Operation total
    int Total?;
};

# Data entry template access item.
public type DataEntryTemplateAccessItem record {
    DataEntryTemplate Key?;
    # Access enabled for data entry template.
    boolean Value?;
};

# Applications associated with an archive with the selected access type.
public type ArchiveApplications record {
    # Application.
    Application[] Applications?;
    # Archive.
    Archive Archive?;
};

public type RetrievalTemplateOutputField record {
    *FieldIdentifier;
    boolean CanSort?;
    int CharacterLength?;
    # Display type. Edit = 'E', MaskEdit = '<mask value>', Lookup = 'L,<num>'
    string DisplayType?;
    # Field data type - one of the following : None = 0, Currency = 11, Date = 9, DateTime = 8, Double = 5, Float = 4, LongInteger = 3, String = 6, Time = 10
    int FieldType?;
    boolean IncludeInOutput?;
    boolean IsSystemField?;
    string Label?;
    string Mask?;
    decimal OutputFieldWidth?;
    int OutputOrder?;
    int Precision?;
    int SortOrder?;
    # Sort type - one of the following : Ascending = 0, Descending = 1, NoSort = 2
    int SortType?;
};

# Routing details.
public type RoutingDetails record {
    # Collection of document identifiers to route.
    DocumentIdentifier[] documents?;
    # Collection of group identifiers to route to.
    int[] groups?;
    # Collection of user identifiers to route to.
    int[] users?;
};

# Available devices
public type AvailableDevices record {
    # Collection of applications associated with device types
    ApplicationIdentifier[] Applications?;
    # Collection of cache devices
    Cache[] CacheDevices?;
    # Collection of Content Server devices
    ContentServer[] ContentServerDevices?;
    # Device identifier.
    DeviceIdentifier DefaultDevice?;
    # Collection of available devices
    DeviceIdentifier[] Devices?;
    # Collection of Keyfile devices
    Keyfile[] KeyfileDevices?;
    # Collection of microfilm devices
    Microfilm[] MicrofilmDevices?;
    # Collection of store devices
    CdromJukebox[] StoreDevices?;
    # Collection of Volumes
    Volume[] Volumes?;
};

# Field identifier
public type FieldIdentifier record {
    # Field id
    int Id?;
    # Field name
    string Name?;
};

# Group identifier.
public type GroupIdentifier record {
    # A collection of application archive pair and their access rights items.
    ApplicationArchiveAccess ApplicationArchiveAccess?;
    # Group id
    int Id?;
    # Group name
    string Name?;
};

# Retrieval hit.
public type Hit record {
    int AnnotationCount?;
    int ApplicationId?;
    int ArchiveId?;
    boolean CanDataEnter?;
    boolean CanDelete?;
    boolean CanExport?;
    boolean CanUpdate?;
    string ContentServerId?;
    string ContentServerWebsiteAddress?;
    string DateTimeLocked?;
    string Description?;
    int DescriptionFieldId?;
    string Editor?;
    string Expires?;
    HitListFieldKeyValuePair[] Fields?;
    int FileFormat?;
    boolean IsKeywordsEnabled?;
    string KeywordData?;
    boolean Keywords?;
    string LegalHoldExpires?;
    string LegalHoldReason?;
    int LegalHoldUserId?;
    # Lock reserve type - one of the following : NotReserved = 0, Reserved = 1, ReservedByCurrentUser = 2, LegalHold = 3, RecordsManagement = 4
    int LockType?;
    int MasterId?;
    # Document medium type - of the following : Unknown = 0, Cache = 1, Microfilm = 2, Ascii = 3, Hybrid = 4
    int MediumType?;
    string ModifyDateTime?;
    boolean Remarks?;
    int Suffix?;
    int Version?;
};

# Application archive pair.
public type ApplicationArchivePair record {
    # Application id
    int ApplicationId?;
    # Application name
    string ApplicationName?;
    # Archive id
    int ArchiveId?;
    # Archive name
    string ArchiveName?;
};

# Log message information.
public type LogMessage record {
    # Log message
    string Message;
    # User name
    string UserName;
};

# Authentication information.
public type Authentication record {
    # Users culture string : 'en-us'
    string culture;
    # Application key
    string 'key?;
    # User name
    string name;
    # Password
    string password;
};

# device path identifier.
public type PathIdentifier record {
    # Path id
    int Id?;
    # Path
    string Path?;
};

# Folder document associated viewer information
public type IndexFolderDocumentViewer record {
    # Indexing folder document data
    IndexFolderDocumentData IndexFolderDocumentdata?;
    # Index viewer URL
    string IndexViewerURL?;
};

public type RetrievalTemplate record {
    *RetrievalTemplateIdentifier;
    # Append next search result to existing results
    boolean AppendResults?;
    # Content server URL search address
    string ContentServerSearchAddress?;
    # Items inclusion option. NonDeleted = 0: Include only non deleted items, Deleted = 1: include only deleted items, DeletedAndNonDeleted = 2: include both deleted and non-deleted items
    int DeleteOption?;
    # Include expired documents in hit list
    boolean IncludeExpiredDocuments?;
    # Collection of field ids and input field objects
    RetrievalTemplateInputFieldItem[] InputFields?;
    # Is this a personal template
    boolean IsPersonalTemplate?;
    # Maximum number of hits to return.  Max 50000
    int MaxHits?;
    # Include only documents on legal hold in hit list
    boolean OnlyLegalHoldDocuments?;
    # Collection of field ids and output field objects
    RetrievalTemplateOutputFieldItem[] OutputFields?;
    # Collection of the names of associated groups.
    string[] GroupDescriptions?;
};

# Fetch document index key-value return : Field id - string data
public type FetchDocumentIndexReturn record {
    # fieldId
    int Key?;
    # String data
    string Value?;
};

public type RetrievalTemplateInputField record {
    *Field;
    boolean CanCompare?;
    # Callback handle.
    CallbackHandle ChangeCallback?;
    # Compare operator type - one of the following : Equal = 1, NotEqual = 2, GreaterThan = 3, LessThan = 4, GreaterThanOrEqualTo = 5, LessThanOrEqualTo = 6, Between = 7
    int CompareOperator?;
    # Field coordinates.
    FieldCoordinates ComparePosition1?;
    # Field coordinates.
    FieldCoordinates ComparePosition2?;
    # Conjunction type - one of the following : None = 0, And = 1, Or = 2
    int Conjunction?;
    # Field coordinates.
    FieldCoordinates ConjunctionPosition?;
    # Callback handle.
    CallbackHandle EntryCallback?;
    # Callback handle.
    CallbackHandle ExitCallback?;
    # Field coordinates.
    FieldCoordinates Field1Position?;
    # Field coordinates.
    FieldCoordinates Field2Position?;
    string Label?;
    # Field coordinates.
    FieldCoordinates LabelPosition?;
    boolean LeftParenthesis?;
    # Field coordinates.
    FieldCoordinates LeftParenthesisPosition?;
    # Look up table.
    int[] LookupTable?;
    boolean Required?;
    boolean RightParenthesis?;
    # Field coordinates.
    FieldCoordinates RightParenthesisPosition?;
    record {} Value1?;
    record {} Value2?;
};

# Legal hold status.
public type LegalHoldStatus record {
    # Has a legal hold entry
    boolean HasHoldEntry?;
    # The reason for the hold
    string HoldReason?;
    # Date the legal hold was placed
    string HoldCreated?;
    # Date the legal hold expires - INTERNAL ONLY
    string HoldExpires?;
    # Date the legal hold expires - Microsoft JSON date format - format : '2012-03-19T07:22Z'
    string HoldExpiresDate?;
    # User identifier.
    UserIdentifier HoldUserCreated?;
};

# Source document result.
public type SourceDocumentResult record {
    # Document action error message
    string ErrorMessage?;
    # Source document identifier.
    SourceDocumentIdentifier SourceDocument?;
};

# Document file information.
public type FileInfo record {
    # Thumbnail display name
    string displayName?;
    # Source file extension
    string fileExtension?;
    # File number
    int fileNumber?;
    # Source file URL
    string sourceFileURL?;
    # Thumbnail URL
    string thumbnailURL?;
};

# Collection of document identifiers to change and associated change data.
public type DocumentIdentifierIndexDataChangeMessage record {
    # Collection of document identifiers, one or more, to change index data
    DocumentIdentifier[] Documents;
    DataEntryTemplate EntryTemplate;
};

# Index folder document.
public type IndexFolderDocument record {
    # Application id
    int ApplicationId?;
    # Application name
    string ApplicationName?;
    # Archive id
    int ArchiveId?;
    # Archive name
    string ArchiveName?;
    # File count
    int Count?;
    # Date document created
    string Created?;
    # Folder id
    int FolderId?;
    # Folder document id
    int Id?;
    # Document id
    int IndexDataId?;
    # Document name
    string Name?;
    # Name of user currently using the document
    string UsedBy?;
    # Id of user currently using the document
    int UsedById?;
};

# Retrieval template identifier.
public type RetrievalTemplateIdentifier record {
    # Template id
    int Id;
    # Template name
    string Name?;
};

# Web server status information.
public type ServerStatus record {
    # Product name.
    string ProductName?;
    # Product version.
    string ProductVersion?;
};

# Document page Key-value pair - page number - path to page
public type DocumentPageItem record {
    # Page number
    int Key?;
    # Path to page
    string Value?;
};

# Hit list field key value pair.
public type HitListFieldKeyValuePair record {
    # Field id
    int Key?;
    # Field.
    Field Value?;
};

# Permission item description.
public type PermissionItemDescriptionItem record {
    # Permission name.
    string Name?;
    # Permission description.
    string Description?;
    # Database index id.
    int IndexInDatabase?;
    # Category type - one of the following : Administration = 0, DataEntry = 1, Document = 2, Global = 3, Mail = 4, Remarks = 5, Retrieval = 6, SpecialAPI = 7
    int Category?;
    # Permission item.
    PermissionItem PermissionItem?;
};

public type Keyfile record {
    *Device;
    # Check that device employs the best practices
    boolean CheckForBestPractices?;
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # device path identifier.
    PathIdentifier PathIdentifier?;
    # Device operation status.
    OperationStatus StatusReport?;
    # Workstation definition.
    Workstation WorkstationIdentifier?;
};

public type ContentServer record {
    *Device;
    # Application password
    string ApplicationPassword?;
    # Application user name
    string ApplicationUserName?;
    # Authentication password
    string AuthenticationPassword?;
    # Authentication server address
    string AuthenticationServerAddress?;
    # Authentication user name
    string AuthenticationUserName?;
    # Check that device employs the best practices
    boolean CheckForBestPractices?;
    # Content server address
    string ContentServerAddress?;
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # Encrypted application password
    string EncryptedApplicationPassword?;
    # Enterprise library server address
    string EnterpriseLibraryServerAddress?;
    # device path identifier.
    PathIdentifier PathIdentifier?;
    # Root folder item id
    string RootFolderItemId?;
    # Device operation status.
    OperationStatus StatusReport?;
    # Web site address
    string WebsiteAddress?;
    # Workstation definition.
    Workstation WorkstationIdentifier?;
};

# Device
public type Device record {
    # Check that device employs the best practices
    boolean CheckForBestPractices?;
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # device path identifier.
    PathIdentifier PathIdentifier?;
    # Device operation status.
    OperationStatus StatusReport?;
    # Workstation definition.
    Workstation WorkstationIdentifier?;
};

# Application field access item.
public type ApplicationFieldAccessItem record {
    ApplicationField Key?;
    # Application filed access item enabled.
    boolean Value?;
};

# User setting.
public type Setting record {
    # Setting category name
    string Category?;
    # Setting name
    string Name?;
    # Setting value
    record {} Value?;
};

# Work item form.
public type WorkitemForm record {
    # Workitem form fields.
    WorkitemFormField[] Fields?;
    # Workitem form name
    string Name?;
};

# Del document results.
public type DeleteDocumentResult record {
    DocumentIdentifier Document?;
    # Error message
    string ErrorMessage?;
};

# Workset.
public type Workset record {
    # Workitem count
    int Count?;
    # Workflow id
    int WorkflowId?;
    # Workflow name
    string WorkflowName?;
    # Workset name
    string WorksetName?;
};

# A collection of data entry templates.
public type DataEntryTemplatesList record {
    # Data entry templates
    DataEntryTemplateDescription[] DataEntryTemplates?;
};

# A collection of application archive pair and their access rights items.
public type ApplicationArchiveAccess record {
    # Application archive access.
    ApplicationArchiveAccessItem[] ApplicationArchiveAccess?;
};

# Icon
public type Icon record {
    string Description?;
    # Byte array for icon.
    record {} Icon?;
    # Tiff = 1, Ascii = 2, Bitmap = 3, Word = 4, Excel = 5, Powerpoint = 6, Windoc = 7, Unknown = 8, Exe = 9, LockedByCurrentUser = 100, Keywords = 101, Remarks = 102, LockedByOtherUser = 103, VersionsExist = 104, Expired = 105, Annotations = 106
    int Identifier?;
};

# Index folder document file.
public type IndexFolderDocumentFile record {
    # File path
    string filePath;
};

# Source document security access item.
public type SourceDocumentSecurityAccessItem record {
    # Security level
    int Key?;
    # Security level access
    boolean Value?;
};

public type Cache record {
    *Device;
    # Activate cache after storing
    string ActivateAfterStore?;
    # Actual size of the cache
    int ActualSize?;
    # Actual size of the cache in bytes
    int ActualSizeInBytes?;
    # Application identifier.
    ApplicationIdentifier ApplicationIdentifier?;
    # Collection of applications associated with this device
    ApplicationIdentifier[] Applications?;
    # Check that device employs the best practices
    boolean CheckForBestPractices?;
    # Clear cache after storing
    string ClearAfterStore?;
    # Device identifier.
    DeviceIdentifier DeviceIdentifier?;
    # Count of documents in the cache
    int DocumentCount?;
    # Enable auto run
    boolean EnableAutoRun?;
    # Export index data to store
    boolean ExportIndexDataToStore?;
    # Export programs to store
    boolean ExportProgramsToStore?;
    # Id of last document added to cache
    int LastDocumentId?;
    # Last time the cache we reset
    string LastReset?;
    # Maximum size of the cache in bytes
    int MaximumSizeInBytes?;
    # device path identifier.
    PathIdentifier PathIdentifier?;
    # Cache state - one of the following : None = 0, Active = 1, Locked = 2, Full = 3, WritePrepared = 4, Prepared = 5, Checked = 6, Preparing = 7, Checking = 8, Migrating = 9, Migrated = 10
    int State?;
    # Device operation status.
    OperationStatus StatusReport?;
    # Id of Store device was stored to
    int StoreDeviceId?;
    # Label of store cache has been stored to
    string StoreLabel?;
    Volume StoredVolume?;
    # Collection of unassigned applications
    ApplicationIdentifier[] UnassignedApplications?;
    # Volume id
    int VolumeId?;
    # Workstation definition.
    Workstation WorkstationIdentifier?;
};

public type ApplicationField record {
    *Field;
    # Application identifier.
    ApplicationIdentifier Application?;
    # Field label.
    string Label?;
    # Is field required.
    boolean IsRequired?;
    # Usage type - one of the following : None = 0, CallbackUsage = 1, Mask = 2, Lookup = 3
    int UsageType?;
};

# Keywords.
public type Keywords record {
    # Keyword data
    string KeywordData?;
    # Source document identifier.
    SourceDocumentIdentifier SourceDocumentIdentifier?;
};

public type User record {
    *UserIdentifier;
    # Annotation note defined for user, see User/Group administration
    string Annotation?;
    # The user created manually (false) or was auto-provisioned via OTDS or Active Directory (true)
    boolean ActiveDirectoryUser?;
    # System Key serial number
    int DatabaseSerialNumber?;
    # Days before password expires
    int DaysBeforePasswordChangeRequired?;
    # Collection of disallowed file extensions
    string[] DisallowedIndexingExtensions?;
    # End date for user access
    string EndDate?;
    # Web server URL
    string File360WebserverUrl?;
    # The user's first name
    string FirstName?;
    # Licenses reserved
    int GroupSeats?;
    # The number of invalid log on attempts allowed
    int InvalidLogonAttemptsAllowed?;
    # Countersign for the system has been applied
    boolean IsActivated?;
    # Is the user an administrator, see Administrator setting in User/Group administration
    boolean IsAdministrator?;
    # Is auto run default, see Autorun setting in System Configuration
    boolean IsAutoRunDefault?;
    # Is this a demo system
    boolean IsDemo?;
    # Is the user a records manager, see Records Manager setting in User/Group administration
    boolean IsRecordsManager?;
    # Is verbose logging enabled
    boolean IsServerVerboseLoggingEnabled?;
    # The user's last name
    string LastName?;
    # Is user locked out
    boolean Locked?;
    # Semi-colon separated list of file extensions to open externally
    string OpenExternalExtensions?;
    # Date last time password was changed
    string PasswordLastChanged?;
    # Collection of permissions
    PermissionItem[] Permissions?;
    # Program id
    int ProgramId?;
    # Collection of security levels granted
    int[] SecurityLevelsGranted?;
    # Collection of user settings
    Setting[] Settings?;
    # Start date for user accessed
    string StartDate?;
    # Users unique identifier
    string UniqueId?;
    # System key to expire message.  If this value is set then 'Display license expiration warning' checkbox is set.
    string WarnSystemKeyToExpireMessage?;
    # Web viewer options - one of the following : PDF = 0, Brava = 1
    int WebViewerOption?;
    # Workspace id for client logon
    int WorkstationId?;
};

# Index folder
public type IndexFolder record {
    # Id of the assigned application for the folder
    int ApplicationId?;
    # Name of the assigned application for the folder
    string ApplicationName?;
    # Id of the assigned archive for the folder
    int ArchiveId?;
    # Name of the assigned archive for the folder
    string ArchiveName?;
    # Id of group assigned to the folder
    int AssignedToGroupId?;
    # Name of group or user assigned to the folder
    string AssignedToName?;
    # Id of user assigned to the folder
    int AssignedToUserId?;
    # Number of documents in the folder
    int Count?;
    # Date the folder was created
    string Created?;
    # Application archive listing
    ApplicationArchivePair[] DistinctApplicationArchives?;
    # Folder id
    int Id?;
    # Is this an error folder?
    boolean IsError?;
    # Folder name
    string Name?;
    # Folder types - None = 0, DataEntry = 1, Retrieval = 2, Personal = 3, MailDataEntry = 4, Mail = 5, RequestProcessor = 6, ASCII = 7, AsciiDataEntry = 8, Export = 9, Scanner = 10, AsciiDatabaseEngine = 11, MailRequestProcessor = 12, EmailRequestProcessor = 13, AsciiMailDataEntry = 14
    int TypeOfFolder?;
    # Name of user that is currently using the folder
    string UsedBy?;
    # Id of user currently using the folder
    int UsedById?;
};

# Callback result.
public type CallbackResult record {
    # Callback external columns.
    CallbackExternalColumn[] Columns?;
    DataEntryTemplate EntryTemplate?;
    # Callback handle.
    CallbackHandle Handle?;
    # Collection of callback results returned.
    CallbackResultRows[] Rows?;
    RetrievalTemplate SearchTemplate?;
};

# Index document security access item.
public type IndexDocumentSecurityAccessItem record {
    # Security level
    int Key?;
    # Security level access
    boolean Value?;
};

# Field coordinates.
public type FieldCoordinates record {
    int Bottom?;
    int Height?;
    int Left?;
    int Right?;
    int Top?;
    int Width?;
};

public type DocumentIdentifier record {
    *SourceDocumentIdentifier;
    # Document suffix id
    int Suffix;
};

# Workitems.
public type Workitems record {
    # Inbox fields.
    WorkitemFormField[] InboxFields?;
    # Workitem list.
    Workitem[] WorkitemList?;
};

# Field.
public type Field record {
    # Alignment - one of the following : Left = 0, Right = 1, Center = 2
    int Alignment?;
    # Display type - one of the following : Edit = 0, MaskEdit = 1, Lookup = 2
    int Display?;
    # Display type. Edit = 'E', MaskEdit = '<mask value>', Lookup = 'L,<num>'
    string DisplayType?;
    # Field data type - one of the following : None = 0, Currency = 11, Date = 9, DateTime = 8, Double = 5, Float = 4, LongInteger = 3, String = 6, Time = 10
    int FieldType?;
    string FillCharacter?;
    string Hint?;
    int Length?;
    string Mask?;
    # Mask format - one of the following : None = 0, Standard = 1, DateAndTime = 2, Numeric = 3
    int MaskFormat?;
    string MaskPlaceholder?;
    # Mask storage type - one of the following : UserData = 0, Literals = 1 (Obsolete), Spaces = 2(Obsolete), IncludePlaceholders = 3, IncludeLiteralsAndPlaceholders = 4, IncludeLiterals = 5
    int MaskStorage?;
    string Name?;
    int Precision?;
};

# Document level security
public type DocumentLevelSecurity record {
    # Security level
    int Level?;
    # Level description
    string Description?;
    # Level selected
    boolean Selected?;
};

# A collection of retrieval template descriptions.
public type RetrievalTemplatesList record {
    # Retrieval template descriptions
    RetrievalTemplateDescription[] RetrievalTemplates?;
};

# Document file for create new version.
public type DocumentCreateVersionFile record {
    # File number
    int fileNumber;
    # File path
    string filePath;
};

# Data entry input field.
public type DataEntryInputField record {
    # Look up table
    LookupTable LookupTable?;
    # Display type. Edit = 'E', MaskEdit = '<mask value>', Lookup = 'L,<num>'
    string DisplayType?;
    # Callback handle.
    CallbackHandle EntryCallback?;
    # Callback handle.
    CallbackHandle ExitCallback?;
    # Field type. None = 0, Currency = 11, Date = 9, DateTime = 8, Double = 5, Float = 4, LongInteger = 3, String = 6, Time = 10
    int FieldType?;
    # Field hint
    string Hint?;
    # Field id
    int Id?;
    # Should the field be duplicated on data entry
    boolean IsDuplicate?;
    # Field label
    string Label?;
    # Field data max length
    int Length?;
    # Mapping number
    int MappingNumber?;
    # Field mask
    string Mask?;
    # Field mask placeholder
    string MaskPlaceholder?;
    # Mask storage. UserData = 0, Literals = 1, Spaces = 2, IncludePlaceholders = 3, IncludeLiteralsAndPlaceholders = 4, IncludeLiterals = 5
    int MaskStorage?;
    # Field name
    string Name?;
    # Field precision
    int Precision?;
    # Is the field required
    boolean Required?;
    # Field value
    string Value?;
};

public type Microfilm record {
    *Device;
};

# Collection of index folder documents
public type IndexFolderDocuments record {
    # List of documents in the folder (GET) or the last document created in the folder (POST)
    FolderDocumentAndIndex[] Documents?;
    # Index folder
    IndexFolder Folder?;
    # Folder id
    int FolderId?;
};

# Callback result.
public type CallbackResultRows record {
    record {}[] Row?;
};

# Document format icon.
public type DocumentFormatIcon record {
    # Icon
    Icon Icon?;
    # Tiff = 1, Ascii = 2, Bitmap = 3, Word = 4, Excel = 5, Powerpoint = 6, Windoc = 7, Unknown = 8, Exe = 9, LockedByCurrentUser = 100, Keywords = 101, Remarks = 102, LockedByOtherUser = 103, VersionsExist = 104, Expired = 105, Annotations = 106
    int TotalResults?;
};

# Indexing folder document data
public type IndexFolderDocumentData record {
    # Index folder document.
    IndexFolderDocument FolderDocument?;
    # Folder id
    int FolderId?;
    # Indexing string data array
    string[] IndexData?;
    # Is the folder shared between users and groups
    boolean IsFolderShared?;
    # Index folder
    IndexFolder ParentFolder?;
    # Paths to indexed document pages (files)
    DocumentPageItem[] PathsToDocumentPages?;
    # Number of document relative to folder
    int RelativeDocumentNumber?;
    DataEntryTemplate Template?;
};

# Workstation definition.
public type Workstation record {
    # Workstation domain name
    string Domain?;
    # Workstation id
    int Id?;
    # Workstation name
    string Name?;
};

# Workitem history.
public type WorkitemHistory record {
    # Destination workstep name
    string DestinationWorkstepName?;
    # Error code
    int ErrorCode?;
    # Has an error
    boolean HasError?;
    # Resource name
    string ResourceName?;
    # Source workstep name
    string SourceWorkstepName?;
    # Workflow Name
    string WorkflowName?;
    # Workstep entry time
    string WorkstepEntryTime?;
};

# Data entry key-value pair : Field id - DataEntryTemplateField
public type DataEntryInputFieldItem record {
    # Field Id
    string Key?;
    # Data entry input field.
    DataEntryInputField Value?;
};

# Data entry template identifier.
public type DataEntryTemplateIdentifier record {
    # Entry template id
    int Id;
    # Entry template name
    string Name?;
};

# An application archive pair and their access rights item
public type ApplicationArchiveAccessItem record {
    # Application archive pair.
    ApplicationArchivePair Key?;
    # An OR'ed set of access types : NoAccess = 0, RetrievalAccess = 1, ExportAccess = 2, EntryAccess = 4, ImportAccess = 8, UpdateAccess = 16, DeleteAccess = 32, SuperAccess = 65535
    int Value?;
};

# Retrieval template output field id and object.
public type RetrievalTemplateOutputFieldItem record {
    # Field Id
    string Key?;
    RetrievalTemplateOutputField[] Value?;
};

# Look up table
public type LookupTable record {
    # Field id
    int FieldId?;
    # Look up table entries for field
    LookupTableEntryItem[] LookUpTableEntries?;
};

# Collection of index folder document file relative paths, one file required
public type IndexFolderDocumentFiles record {
    IndexFolderDocumentFile[] files;
};

# Folder document index and its associated index folder document
public type FolderDocumentAndIndex record {
    # Index folder document.
    IndexFolderDocument document?;
    # Document index
    int index?;
};

# Worksets.
public type Worksets record {
    # Workset list.
    Workset[] WorkitemList?;
};
