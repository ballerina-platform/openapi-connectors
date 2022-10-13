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

public type QueryResultUserRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of user fields.
    UserRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ContactFieldRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact field. This is a read-only property.
    string id?;
    # The email footer's current status.
    string currentStatus?;
    # The name of the contact field.
    string name?;
    # The description of the contact field.
    string description?;
    # The permissions for the contact field granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the contact field. This is a read-only property.
    string createdBy?;
    # The date and time the contact field was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # The login id of the user that last updated the contact field.
    string updatedBy?;
    # Unix timestamp for the date and time the contact field was last updated.
    string updatedAt?;
    # The date and time the contact field was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact field's internal name.
    string internalName?;
    # The id of the associated option list.
    string optionListId?;
    # The checked value.
    string checkedValue?;
    # The unchecked value of a checkbox custom object field.
    string uncheckedValue?;
    # The contact field's display type.
    string displayType?;
    # The contact field's data type. This is a read-only property.
    string dataType?;
    # The contact field's default value.
    string defaultValue?;
    # Whether or not the contact field is read only.
    string isReadOnly?;
    # Whether or not the contact field is required.
    string isRequired?;
    # Whether or not the contact field is standard.
    string isStandard?;
    # The id of the output format.
    string outputFormatId?;
    # Denotes under what circumstances the contact field is updated.
    string updateType?;
    # Whether or not a contact field is displayed only to trusted visitors.
    string showTrustedVisitorsOnly?;
};

public type FormFieldUpdateMappingRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the form field update mapping.
    string id?;
    # The form field update mapping's current status.
    string currentStatus?;
    # The name of the form field update mapping.
    string name?;
    # The description of the field comparison criteria.
    string description?;
    # The permissions for the form field update mapping granted to your current instance. This is a read-only property.
    string[] permissions?;
    # Id of the folder. This is a read-only property.
    string folderId?;
    # Id of the source template. This is a read-only property.
    string sourceTemplateId?;
    # The login id of the user who created the form field update mapping.
    string createdBy?;
    # The date and time the form field update mapping was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the form field update mapping.
    string updatedBy?;
    # Unix timestamp for the date and time the form field update mapping was last updated.
    string updatedAt?;
    # The date and time the form field update mapping was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date and time the form field update mapping is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Id of the source form field. 
    string sourceFormFieldId?;
    # The update type of the form field update mapping.
    string updateType?;
    # Id of the target field.
    string targetEntityFieldId?;
};

public type CustomObjectFieldRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the custom object field. This is a read-only property. Use negative ids to reference custom object fields for other properties (e.g. emailAddressFieldId or uniqueCodeFieldId). See example.
    string id?;
    # This property is not used for custom objects.
    string currentStatus?;
    # This property is not used for custom object fields.
    string description?;
    # This property is not used.
    string permissions?;
    # This property is not used for custom object fields.
    string createdBy?;
    # This property is not used for custom object fields.
    string createdAt?;
    # This property is not used for custom object fields.
    string updatedBy?;
    # This property is not used for custom object fields.
    string updatedAt?;
    # This property is not used for custom object fields.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The name of the custom object field.
    string name?;
    # The custom object field's display type.
    string displayType?;
    # The custom object field's data type.
    string dataType?;
    # The custom object field's default value.
    string defaultValue?;
};

public type QueryResultFormSubmissionRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form data elements.
    FormDataRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultSegmentRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of contact segment fields.
    ContactSegmentRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultFooterRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of footer fields.
    EmailFooterRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the synchronization definition.
public type SyncIndividual record {
    # When a sync completes, Eloqua will make a call to the URL specified in this parameter. The callback can occur during sync creation, before the sync creation response, or immediately after.
    string callbackUrl?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The status of the synchronization. This is a read-only property.
    SyncStatusType status?;
    # This value should be the uri for the export/import definition you wish to sync. When you create an import/export definition, Eloqua will respond with a "uri" parameter, the value of which should be used here.
    string syncedInstanceUri?;
    # The date and time the sync ended. This is a read-only property.
    string syncEndedAt?;
    # The date and time the sync started. This is a read-only property.
    string syncStartedAt?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultEmailRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of email fields.
    EmailRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the account sync action definition.
public type AccountSyncActionOperationIndividual record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ArchiveParameterRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The target folder to which the asset should be moved upon archive/unarchive. If not passed, the root folder will be used.
    string targetFolderId?;
};

public type ProcessingStepErrorRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Processing step id during which error ocurred
    string processingStepId?;
    # Type of the processing step during which error ocurred
    string processingStepTypeId?;
    # DisplayName of the processing step including description (if configured)
    string processingStepDisplayName?;
    # Unique Error Code for current error
    int errorCode?;
    # Error message for current error code
    string errorMessage?;
    # Detailed information about current error
    string errorDescription?;
};

public type EmailDeploymentRest20 record {
    # The type of email deployment. Possible values include: 
    # <ul>
    # <li><code>EmailTestDeployment</code></li>
    # <li><code>EmailLowVolumeDeployment</code></li>
    # </ul>
    # 
    # Note that the activity's Email Send Type will appear as <code>QuickSend</code>.
    string 'type?;
    # Unique identifier of the email deployment.
    string id?;
    # Current deployment status. Possible values are: <code>normal</code>, <code>locked</code>, <code>forceComplete</code>, <code>inError</code>, or <code>resend</code>.
    string currentStatus?;
    # The name of the deployment.
    string name?;
    # Description of the deployment.
    string description?;
    # Permission values of the deployment granted to the current user.
    string[] permissions?;
    # Id of the folder.
    string folderId?;
    # Id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the email deployment.
    string createdBy?;
    # The date and time the email deployment was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email deployment.
    string updatedBy?;
    # Unix timestamp for the date and time the email deployment was last updated.
    string updatedAt?;
    # The date and time the email deployment was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date and time the email deployment is scheduled.
    string scheduledFor?;
    # The request's level of detail.
    string depth?;
    EmailRest20 email?;
    # The number of emails which have been successfully sent so far.
    string successfulSendCount?;
    # The number of emails which failed during send so far.
    string failedSendCount?;
    # The date and time the email deployment ended.
    string endAt?;
    # The content type of the email.
    string sentContent?;
    # The subject line of the email.
    string sentSubject?;
    # EmailDeployment_Field_SendDate_Description
    string sendDate?;
};

public type QueryResultProgramRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of program fields.
    ProgramRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the activity export definition.
public type ActivityExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ImageFileRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the image. This is a read-only property.
    string id?;
    # The image's current status.
    string currentStatus?;
    # The name of the image.
    string name?;
    # The description of the image.
    string description?;
    # The permissions for the image granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the image.
    string createdBy?;
    # The date and time the image was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the image.
    string updatedBy?;
    # Unix timestamp for the date and time the image was last updated.
    string updatedAt?;
    # The date and time the image was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The image's complete URL. This is a read-only property.
    string fullImageUrl?;
    SizeRest10 size?;
    # The image's thumbnail URL. This is a read-only property.
    string thumbnailUrl?;
};

public type AccountRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the account. This is a read-only property.
    string id?;
    # The account's current status.
    string currentStatus?;
    # The name of the account.
    string name?;
    # The description of the account.
    string description?;
    # The permissions for the account granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the account.
    string createdBy?;
    # The date and time the account was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the account.
    string updatedBy?;
    # Unix timestamp for the date and time the account was last updated.
    string updatedAt?;
    # The date and time the account was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array containing <code>type</code> and <code>id</code> values for all of the accountFields associated with a given account.
    FieldValueRest10[] fieldValues?;
    # The account's first address.
    string address1?;
    # The account's second address.
    string address2?;
    # The account's third address.
    string address3?;
    # The account's city.
    string city?;
    # The account's province.
    string province?;
    # The account's postal code.
    string postalCode?;
    # The account's country.
    string country?;
    # The account's business phone number.
    string businessPhone?;
    # Lists CRM Users linked to the Account. Each <code>crmSystemMappings</code> contains a <code>type</code>, <code>CRMUsername</code>(s), and Eloqua <code>loginName</code> values for all of the Eloqua Users linked to the Account.
    # 
    # This property is only returned if Eloqua Users are linked to the Account. For instructions on how to link Eloqua Users to Accounts, refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a>.
    # 
    # This property is also only returned when the request depth is <code>complete</code>.
    CrmSystemMappingRest10[] crmSystemMappings?;
};

public type QueryResultMicrositeRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of microsite fields.
    MicrositeRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type AccountRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the account. This is a read-only property.
    string id?;
    # The account's current status.
    string currentStatus?;
    # The name of the account.
    string name?;
    # The description of the account.
    string description?;
    # The permissions for the account granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the account.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the account.
    string createdBy?;
    # The date and time the account was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the account.
    string updatedBy?;
    # Unix timestamp for the date and time the account was last updated.
    string updatedAt?;
    # The date and time the account was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the account is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The account's first address.
    string address1?;
    # The account's second address.
    string address2?;
    # The account's third address.
    string address3?;
    # The account's city.
    string city?;
    # The account's province.
    string province?;
    # The account's postal code.
    string postalCode?;
    # The account's country.
    string country?;
    # The account's business phone number.
    string businessPhone?;
    # Array containing <code>type</code> and <code>id</code> values for all of the accountFields associated with a given account.
    FieldValueRest20[] fieldValues?;
    # Lists CRM Users linked to the Account. Each <code>crmSystemMappings</code> contains a <code>type</code>, <code>CRMUsername</code>(s), and Eloqua <code>loginName</code> values for all of the Eloqua Users linked to the Account.
    # 
    # This property is only returned if Eloqua Users are linked to the Account. For instructions on how to link Eloqua Users to Accounts, refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a>.
    # 
    # This property is also only returned when the request depth is <code>complete</code>.
    CrmSystemMappingRest20[] crmSystemMappings?;
};

public type QueryResultFormSubmissionRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form data elements.
    FormDataRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultEmailRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of email data.
    EmailRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultFolderRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of folder fields.
    FolderRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultEventRegistrationDataRest20 record {
    # The asset's type in Eloqua. 
    string 'type?;
    # Array of event field elements.
    EventRegistrationDataRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultAccountGroupRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of account group fields.
    AccountGroupRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultContactFieldRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of contact fields.
    ContactFieldRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultFormRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form elements.
    FormRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ImageFileRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the image.
    string id?;
    # The image's current status.
    string currentStatus?;
    # The name of the image.
    string name?;
    # The description of the image.
    string description?;
    # The permissions for the image granted to your current instance. This is a read-only property.
    string[] permissions?;
    # Id of the folder.
    string folderId?;
    # Id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the image.
    string createdBy?;
    # The date and time the image was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the image.
    string updatedBy?;
    # Unix timestamp for the date and time the image was last updated.
    string updatedAt?;
    # The date and time the image was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date and time the image is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The image's complete URL. This is a read-only property.
    string fullImageUrl?;
    SizeRest20 size?;
    # The image's thumbnail URL. This is a read-only property.
    string thumbnailUrl?;
    # The image's source location.
    string 'source?;
    # The date and time the image was last synced, expressed in Unix time. This is a read-only property.
    string syncDate?;
};

# The status of the synchronization. This is a read-only property.
public type SyncStatusType string;

# The request body defines the details of the campaign response import definition.
public type CampaignResponseImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # This property is not used.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Your service instance id.
    string serviceInstanceId?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The type of data, used for field definitions.
public type DataType string;

public type RequirementRest20 record {
    string 'type?;
};

public type FieldMergeRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the field merge. This is a read-only property.
    string id?;
    # The field merge's current status.
    string currentStatus?;
    # Name of the field merge.
    string name?;
    # The description of the field merge.
    string description?;
    # The permissions for the field merge granted to your current instance.
    string[] permissions?;
    # Id of the associated folder.
    string folderId?;
    # The id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the field merge.
    string createdBy?;
    # The date and time the field merge was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the field merge.
    string updatedBy?;
    # Unix timestamp for the date and time the field merge was last updated.
    string updatedAt?;
    # The date and time the field merge was last accessed.
    string accessedAt?;
    # This property is not used for field merges.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The syntax of the field merge.
    string syntax?;
    # The default value of the field merge.
    string defaultValue?;
    # Id of the associated contact field.
    string contactFieldId?;
    # Id of the associated account field.
    string accountFieldId?;
    # Id of the associated event.
    string eventId?;
    # Id of the associated event field.
    string eventFieldId?;
    # Id of the associated event session field.
    string eventSessionFieldId?;
    # Id of the associated custom object.
    string customObjectId?;
    # Id of the associated custom object field.
    string customObjectFieldId?;
    # Type of the field merge. Possible values include: <code>contactField</code>, <code>accountField</code>, <code>eventField</code>, <code>eventSessionField</code>, and <code>customObjectField</code>.
    string mergeType?;
    # The associated custom object sort type.
    string customObjectSort?;
    # The key value if the field merge contains a query string. See the <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-user/Help/FieldMerges/Tasks/CreatingFieldMergeWithQueryString.htm'>Help Center</a> to learn more about field merges with query strings. This is a read-only property. 
    string queryStringKey?;
    # Array of field condition fields.
    FieldConditionRest20[] fieldConditions?;
    # Whether or not URLs are allowed in this field merge. False by default. Using URLs in a field merge can be a security risk. By default, when Oracle Eloqua attempts to insert the field merge, it removes any URLs while still inserting the remaining data. However, you can override this security feature by selecting the Allow URLs in field merge check box in the Eloqua user interface.
    string allowUrlsInValue?;
};

public type ConditionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
};

public type CrmSystemMappingRest20 record {
    string 'type?;
    string id?;
    string currentStatus?;
    string name?;
    string description?;
    string[] permissions?;
    string folderId?;
    string sourceTemplateId?;
    string createdBy?;
    string createdAt?;
    string updatedBy?;
    string updatedAt?;
    string accessedAt?;
    string scheduledFor?;
    string depth?;
    string loginName?;
    string MSDUserName?;
    string OSCUserName?;
    string SFDCUserName?;
    string SODUserName?;
};

public type EmailHeaderRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the email header. This is a read-only property.
    string id?;
    # The asset's current status. This is a read-only property.
    string currentStatus?;
    # The name of the email header.
    string name?;
    # The description of the email header.
    string description?;
    # The permissions for the email header granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the email header.
    string createdBy?;
    # The date and time the email header was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email header.
    string updatedBy?;
    # Unix timestamp for the date and time the email header was last updated.
    string updatedAt?;
    # The date and time the email header was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The email header's html text content.
    string body?;
    # The raw text from the "body" parameter.
    string text?;
    # A list of associated Field Merges.
    FieldMergeRest10[] fieldMerges?;
    # A list of hyperlinks contained within the asset.
    HyperlinkRest10[] hyperlinks?;
};

public type QueryResultFormRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form fields.
    FormRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type CustomObjectFieldRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the custom object field. This is a read-only property. Use negative ids in order to reference custom object fields for other properties (e.g. emailAddressFieldId or uniqueCodeFieldId). See example.
    string id?;
    # This property is not used for custom object fields.
    string currentStatus?;
    # This property is not used for custom object fields.
    string description?;
    # This property is not used.
    string[] permissions?;
    # This property is not used for custom object fields.
    string folderId?;
    # This property is not used for custom object fields.
    string sourceTemplateId?;
    # This property is not used for custom object fields.
    string createdBy?;
    # This property is not used for custom object fields.
    string createdAt?;
    # This property is not used for custom object fields.
    string updatedBy?;
    # This property is not used for custom object fields.
    string updatedAt?;
    # This property is not used for custom object fields.
    string accessedAt?;
    # This property is not used for custom object fields.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The name of the custom object field.
    string name?;
    # The custom object field's display type.
    string displayType?;
    # The custom object field's data type.
    string dataType?;
    # The custom object field's default value.
    string defaultValue?;
    # The custom object field's internal name. This is a read-only property.
    string internalName?;
    # The option list id for a single select custom object field.
    string optionListId?;
    # The checked value of a checkbox custom object field.
    string checkedValue?;
    # The unchecked value of a checkbox custom object field.
    string uncheckedValue?;
};

# The request body defines details of the opportunity contact linkage import definition.
public type OpportunityContactLinkageImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to false to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not to perform a case sensitive search on the match field.
    boolean linkOpportunitiesCaseSensitiveMatchField?;
    # Whether or not to perform a case sensitive search on the source field.
    boolean linkOpportunitiesCaseSensitiveSourceField?;
    # Specifies the entity of the contact linkage import. Allowed values are "Contact" or "Account".
    string linkOpportunitiesEntityType?;
    # Specifies the field name for matching.
    string linkOpportunitiesMatchFieldName?;
    # Whether or not imported data will be mapped to multiple matching records.
    boolean linkOpportunitiesMultipleSourceMatches?;
    # Specifies the source field name for matching.
    string linkOpportunitiesSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultSegmentRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of segment fields.
    ContactSegmentRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type CrmSystemMappingRest10 record {
    string 'type?;
    string id?;
    string currentStatus?;
    string name?;
    string description?;
    string permissions?;
    string createdBy?;
    string createdAt?;
    string updatedBy?;
    string updatedAt?;
    string accessedAt?;
    string depth?;
    string loginName?;
    string MSDUserName?;
    string OSCUserName?;
    string SFDCUserName?;
    string SODUserName?;
};

public type QueryResultAsyncFormSubmissionRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form submission data fields.
    FormDataRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type FieldMergeRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the field merge. This is a read-only property.
    string id?;
    # The field merge's current status.
    string currentStatus?;
    # Name of the field merge.
    string name?;
    # The description of the field merge.
    string description?;
    # The permissions for the field merge granted to your current instance.
    string permissions?;
    # The login id of the user who created the field merge.
    string createdBy?;
    # The date and time the field merge was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the field merge.
    string updatedBy?;
    # Unix timestamp for the date and time the field merge was last updated.
    string updatedAt?;
    # The date and time the field merge was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The syntax of the field merge.
    string syntax?;
    # The default value of the field merge.
    string defaultValue?;
    # Id of the associated contact field.
    string contactFieldId?;
    # Id of the associated account field.
    string accountFieldId?;
    # Id of the associated event.
    string eventId?;
    # Id of the associated event field.
    string eventFieldId?;
    # Id of the associated event session field.
    string eventSessionFieldId?;
    # Type of the field merge. Possible values include: <code>contactField</code>, <code>accountField</code>, <code>eventField</code>, <code>eventSessionField</code>, and <code>customObjectField</code>.
    string mergeType?;
};

public type QueryResultProfileFieldRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of visitor profile fields.
    ProfileFieldRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultEventRegistrationRest20 record {
    # The asset's type in Eloqua. 
    string 'type?;
    # Array of event field elements.
    EventRegistrationRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultCustomObjectRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of custom object fields.
    CustomObjectRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ObjectKeyRest10 record {
    string 'type?;
    string objectType?;
    string objectId?;
    ObjectKeyRest10 container?;
};

public type EmailRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the email. This is a read-only property.
    string id?;
    # The asset's current status. This is a read-only property.
    string currentStatus?;
    # The name of the email.
    string name?;
    # The description of the email.
    string description?;
    # The permissions for the email granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the email.
    string createdBy?;
    # The date and time the email was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email.
    string updatedBy?;
    # Unix timestamp for the date and time the email was last updated.
    string updatedAt?;
    # The date and time the email was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The email's subject line text.
    string subject?;
    # The sender name recipients of the email will see.
    string senderName?;
    # The address the email will appear to be sent from.
    string senderEmail?;
    # The sender name recipients of the email will see.
    string replyToName?;
    # The email address targeted when recipients click "reply".
    string replyToEmail?;
    # The email address which is notified if the email is undeliverable.
    string bounceBackEmail?;
    # The identifier of the email's Virtual MTA configuration for custom email sending options. Applicable only if your Eloqua instance has the Premium Branding and Deliverability package. <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-user/index.html#CSHID=EmailSettings'>Learn more</a>.
    string virtualMTAId?;
    # The email's brand ID.
    string brandId?;
    HtmlContentRest10 htmlContent?;
    # The email's content in plain text.
    string plainText?;
    # Whether or not the asset's text is editable.
    string isPlainTextEditable?;
    # Whether or not the sent email is plain text only.
    string sendPlainTextOnly?;
    # Whether or not Eloqua will track the asset.
    string isTracked?;
    # The email's main layout.
    string layout?;
    # The email's main layout style.
    string style?;
    # A list of associated Form assets.
    FormRest10[] forms?;
    # A list of associated Image assets.
    ImageFileRest10[] images?;
    # A list of hyperlinks contained within the email.
    HyperlinkRest10[] hyperlinks?;
    # A list of associated Content Section assets.
    ContentSectionRest10[] contentSections?;
    # A list of associated dynamic content.
    DynamicContentRest10[] dynamicContents?;
    # A list of associated landing page assets.
    LandingPageRest10[] landingPages?;
    # A list of imported files.
    ImportedFileRest10[] files?;
    # Id of the email header.
    string emailHeaderId?;
    # Id of the email footer.
    string emailFooterId?;
    # Id of the email group.
    string emailGroupId?;
    # Id of the encoding used.
    string encodingId?;
    # A list of associated Field Merges.
    FieldMergeRest10[] fieldMerges?;
};

public type FieldValueRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The value to set the corresponding field id to. Date values must be submitted as a unix timestamp.
    string value?;
    # The id of the field to be set to the corresponding value.
    string id?;
};

public type AsyncFormSubmissionBatchRest20 record {
    # The asset's type in Eloqua. This is a read-only property
    string 'type?;
    # The ID of the asynchronous form submission batch. This is a read-only property
    string id?;
    # Current status of form submission batch when submitted through asynchronous submission
    string currentStatus?;
    # The URL to be called back once processing of form submisssion batch is completed
    string callbackUrl?;
    # The unique identifier of the batch. Optional String field. If present, must be unique across created batches. If <code>batchCorrelationId</code> is not unique, then the entire batch will fail. The <code>batchCorrelationId</code> is persisted and could be used to retrieve form batch details.
    string batchCorrelationId?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # A list of form data elements
    FormDataRest20[] elements?;
    # The current status of the batch. Possible values: Queued, InProgress, Warning, Error, Success. This is a read-only property.
    string currentBatchStatus?;
    # The processing status of the batch. This is a read-only property.
    string processingStatus?;
};

public type QueryResultAsyncFormSubmissionRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of form submission data fields.
    FormDataRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the account import definition.
public type AccountImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # A boolean parameter that enables you to link Eloqua Users to Accounts during an Account import by specifying a CRM User ID.
    # 
    # If set to <code>true</code>, one of the following CRM User ID fields is required in the Account import definition: <code>CRMOSCUserId</code>, <code>CRMSfdcUserId</code>, <code>CRMMSDUserId</code>, or <code>CRMSODUserId</code>.
    # 
    # Refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a> for an example.
    boolean linkUsers?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultAccountRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of account fields.
    AccountRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type FormProcessingStepRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the form processing step. This is a read-only property.
    string id?;
    # The form processing step's current status.
    string currentStatus?;
    # Name of the form processing step.
    string name?;
    # The permissions for the form processing step granted to your current instance.
    string[] permissions?;
    # Id of the associated folder.
    string folderId?;
    # The ID of the source template.
    string sourceTemplateId?;
    # The login ID of the user who created the form processing step.
    string createdBy?;
    # The date and time the form processing step was created, expressed in Unix time.
    string createdAt?;
    # The login ID of the user that last updated the form processing step.
    string updatedBy?;
    # Unix timestamp for the date and time the form processing step was last updated.
    string updatedAt?;
    # The date and time the form processing step was last accessed.
    string accessedAt?;
    # The date the form processing step is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The conditions for which this form processing step will execute. Possible values include: <code>always</code>, <code>conditionally</code>, and <code>never</code>.
    string execute?;
    ProcessingStepConditionRest20 condition?;
    # The description of the form processing step.
    string description?;
    # ProcessingStep_Field_HasValidationIssue_Description
    string hasValidationIssue?;
};

# The request body defines the details of the contact import definition.
public type ContactImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultGroupRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of fields.
    EmailGroupRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type FolderRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the email folder. This is a read-only property.
    string id?;
    # The email folder's current status.
    string currentStatus?;
    # The name of the email folder.
    string name?;
    # The description of the email folder.
    string description?;
    # The permissions for the email folder granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the email folder.
    string createdBy?;
    # The date and time the email folder was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email folder.
    string updatedBy?;
    # Unix timestamp for the date and time the email folder was last updated.
    string updatedAt?;
    # The date and time the email folder was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Whether or not the email folder is a system folder.
    string isSystem?;
};

# The request body defines the details of the account import definition.
public type Accountimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # A boolean parameter that enables you to link Eloqua Users to Accounts during an Account import by specifying a CRM User ID.
    # 
    # If set to <code>true</code>, one of the following CRM User ID fields is required in the Account import definition: <code>CRMOSCUserId</code>, <code>CRMSfdcUserId</code>, <code>CRMMSDUserId</code>, or <code>CRMSODUserId</code>.
    # 
    # Refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a> for an example.
    boolean linkUsers?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the account import definition.
public type Accountimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # A boolean parameter that enables you to link Eloqua Users to Accounts during an Account import by specifying a CRM User ID.
    # 
    # If set to <code>true</code>, one of the following CRM User ID fields is required in the Account import definition: <code>CRMOSCUserId</code>, <code>CRMSfdcUserId</code>, <code>CRMMSDUserId</code>, or <code>CRMSODUserId</code>.
    # 
    # Refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a> for an example.
    boolean linkUsers?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ObjectKeyRest20 record {
    string 'type?;
    string objectType?;
    string objectId?;
    ObjectKeyRest20 container?;
};

public type EmailRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the email. This is a read-only property.
    string id?;
    # The asset's current status. This is a read-only property.
    string currentStatus?;
    # The name of the email.
    string name?;
    # The description of the email.
    string description?;
    # The permissions for the email granted to your current instance. This is a read-only property.
    string[] permissions?;
    # Id of the folder.
    string folderId?;
    # Id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the email.
    string createdBy?;
    # The date and time the email was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email.
    string updatedBy?;
    # Unix timestamp for the date and time the email was last updated.
    string updatedAt?;
    # The date and time the email was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date and time the email is scheduled for.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The email's subject line text.
    string subject?;
    # The preheader text that email clients will use when displaying a preview of the email. 500 character limit. Different email clients will limit the amount of characters displayed.
    string previewText?;
    # The sender name recipients of the email will see.
    string senderName?;
    # The address the email will appear to be sent from.
    string senderEmail?;
    # The sender name recipients of the email will see.
    string replyToName?;
    # The email address targeted when recipients click "reply".
    string replyToEmail?;
    # The email address which is notified if the email is undeliverable.
    string bounceBackEmail?;
    # The numeric ID for the Virtual MTA configuration. Virtual MTAs are setup during the Branding and Deliverability package provisioning process. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAA/index.html#CSHID=EmailSettings'>the Oracle Eloqua Help Center</a>.
    string virtualMTAId?;
    # The email's brand ID.
    string brandId?;
    HtmlContentRest20 htmlContent?;
    # The email's content in plain text.
    string plainText?;
    # Whether or not the asset's text is editable.
    string isPlainTextEditable?;
    # Whether or not the sent email is plain text only.
    string sendPlainTextOnly?;
    # Whether or not Eloqua will track the asset.
    string isTracked?;
    # Whether or not the email is private.
    string isPrivate?;
    # The email's main layout.
    string layout?;
    # The email's main layout style.
    string style?;
    # A list of associated Form assets.
    FormRest20[] forms?;
    # A list of associated Image assets.
    ImageFileRest20[] images?;
    # A list of hyperlinks contained within the email.
    HyperlinkRest20[] hyperlinks?;
    # A list of content sections contained within the email.
    ContentSectionRest20[] contentSections?;
    # A list of dynamic contents contained within the email.
    DynamicContentRest20[] dynamicContents?;
    # A list of imported files.
    ImportedFileRest20[] files?;
    # 
    CloudComponentInstanceRest20[] contentServiceInstances?;
    # Id of the email header.
    string emailHeaderId?;
    # Id of the email footer.
    string emailFooterId?;
    # Id of the email group.
    string emailGroupId?;
    # Id of the encoding used.
    string encodingId?;
    # A list of associated Field Merges.
    FieldMergeRest20[] fieldMerges?;
    # A list of imported files.
    ImportedFileRest20[] attachments?;
    # Whether or not the email is in protected mode.
    string isContentProtected?;
    # The layout of the email when it is sent or previewed. Possible values include: <code>fixed</code> or <code>flow</code>.
    string renderMode?;
    # Whether or not the email is archived.
    string archived?;
};

# The request body defines the details of the account import definition.
public type Accountimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # A boolean parameter that enables you to link Eloqua Users to Accounts during an Account import by specifying a CRM User ID.
    # 
    # If set to <code>true</code>, one of the following CRM User ID fields is required in the Account import definition: <code>CRMOSCUserId</code>, <code>CRMSfdcUserId</code>, <code>CRMMSDUserId</code>, or <code>CRMSODUserId</code>.
    # 
    # Refer to the <code>linkUsers</code> parameter in this <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-develop/index.html#CSHID=ImportExportParams'>tutorial</a> for an example.
    boolean linkUsers?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type FieldValueRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The value to set the corresponding field id to. Date values must be submitted as a unix timestamp.
    string value?;
    # The id of the field to be set to the corresponding value.
    string id?;
    # Name of the field value.
    string name?;
};

public type FormSpamDataRest20 record {
    # FormSpamSubmission_Field_Type_Description
    string 'type?;
    # FormSpamSubmission_Field_InternalId_Description
    string id?;
    # FormSpamSubmission_Field_Status_Description
    string currentStatus?;
    # Unix timestamp for the date and time the form data was submitted. This is a read-only property
    string submittedAt?;
    # A list of key/value pairs identifying the form data (field name / value)
    FieldValueRest20[] fieldValues?;
    # Specifies the source of the form submission
    string formSubmissionSource?;
    # Specifies the reason the form was blocked as spam
    string blockReason?;
};

public type FormProcessingStepRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the form processing step. This is a read-only property.
    string id?;
    # The form processing step's current status.
    string currentStatus?;
    # Name of the form processing step.
    string name?;
    # The description of the form processing step.
    string description?;
    # The permissions for the form processing step granted to your current instance.
    string permissions?;
    # The login id of the user who created the form processing step.
    string createdBy?;
    # The date and time the form processing step was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the form processing step.
    string updatedBy?;
    # Unix timestamp for the date and time the form processing step was last updated.
    string updatedAt?;
    # The date and time the form processing step was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The conditions for which this form processing step will execute. Possible values include: <code>always</code>, <code>conditionally</code>, and <code>never</code>.
    string execute?;
    # The type of value the comparator is validating. Possible values include: 'form field' or 'static value'.
    string conditionalType?;
    # The form field id used to compare form fields within a form processing step condition.
    string conditionalFieldId?;
    # The comparator used to validate a condition. Possible values include: <code>exactly</code> or <code>not exactly</code>.
    string conditionalComparator?;
    # The conditions for which the processing step will execute. If <code>yes</code>, the processing step will execute when the conditions are met. If <code>no</code>, the processing step will execute when the conditions are not met.
    string isConditionallyNegated?;
};

# The request body defines the details of the email address import definition.
public type Emailaddressimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the email address import definition.
public type Emailaddressimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ContactSegmentRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact segment. This is a read-only property.
    string id?;
    # The contact segment's current status. This is a read-only property.
    string currentStatus?;
    # The contact segment's name.
    string name?;
    # The description of the contact segment.
    string description?;
    # The permissions for the contact segment granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the contact segment.
    string createdBy?;
    # The date and time the contact segment was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact segment.
    string updatedBy?;
    # Unix timestamp for the date and time the contact segment was last updated.
    string updatedAt?;
    # The date and time the contact segment was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array of contact segment elements.
    SegmentElementRest10[] elements?;
    # The number of contacts in the contact segment. This is a read-only property.
    string count?;
    # The date and time of the most recent calculation. This is a read-only property.
    string lastCalculatedAt?;
};

# The request body defines the details of the email address import definition.
public type Emailaddressimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type UserPreferencesRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The ID of the user's timezone in Eloqua. This is a read-only property.
    string timezoneId?;
};

# The request body defines the details of the contact import definition.
public type Contactimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the contact import definition.
public type Contactimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the contact import definition.
public type Contactimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type AuditLogReportRequestRest20 record {
    # This property is not used.
    string 'type?;
    # Specifies the Audit Report Type to generate. Possible values include: <code>assets</code> (asset history), <code>securityGroup</code> (security group history), <code>userProfile</code> (user profile history), <code>userLogin</code> (user login history), <code>dataExport</code> (export history), and <code>dataUpload</code> (upload history).
    string auditReportType?;
    # The start date and time (10 digit integer Unix time). This property is required.
    string startDate?;
    # The end date and time (10 digit integer Unix time). This property is required.
    string endDate?;
    # Email address for export notification. This property is required.
    string notificationEmail?;
    # File format to be exported. Possible values include: <code>delimitedFile</code> or <code>Excel2007</code>.
    string fileFormat?;
    # The asset type for the Audit log. Required if <code>auditReportType</code> is set to <code>assets</code>. Possible values include: <code>forms</code>, <code>programs</code>, <code>campaigns</code>, <code>emails</code>, and <code>landingPages</code>. Specify multiple asset types by comma separating values.
    string assetTypes?;
    # The event action to filter for the audit log. Possible values include: <code>all</code>, <code>create</code>, <code>modify</code>, <code>delete</code>, <code>archive</code> and <code>unarchive</code>. For campaigns, possible values also include: <code>activated</code>, <code>deactivated</code>, <code>pause</code>, and <code>scheduleForActivation</code>. If not specified, defaults to <code>all</code>.
    string actionName?;
    # For <code>dataUpload</code> and <code>dataExport</code> audit reports, you can filter on the status. Possible values include: <code>completed</code>, <code>in progress</code>, <code>queued</code>, <code>waiting</code>, <code>failed</code>, and <code>inactive</code>.
    string status?;
    # The user name to filter on.
    string userName?;
};

public type FieldComparisonCriteriaRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the field comparison criteria.
    string id?;
    # The field comparison criteria's current status.
    string currentStatus?;
    # The name of the field comparison criteria.
    string name?;
    # The description of the field comparison criteria.
    string description?;
    # The permissions for the field comparison criteria granted to your current instance. This is a read-only property.
    string[] permissions?;
    # Id of the folder. This is a read-only property.
    string folderId?;
    # Id of the source template. This is a read-only property.
    string sourceTemplateId?;
    # The login id of the user who created the field comparison criteria.
    string createdBy?;
    # The date and time the field comparison criteria was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the field comparison criteria.
    string updatedBy?;
    # Unix timestamp for the date and time the field comparison criteria was last updated.
    string updatedAt?;
    # The date and time the form was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date and time the field comparison criteria is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The id of the field comparison criteria.
    string fieldId?;
    ConditionRest20 condition?;
};

public type FieldConditionRest20 record {
    string 'type?;
    string id?;
    string currentStatus?;
    string name?;
    string description?;
    string[] permissions?;
    string folderId?;
    string sourceTemplateId?;
    string createdBy?;
    string createdAt?;
    string updatedBy?;
    string updatedAt?;
    string accessedAt?;
    string scheduledFor?;
    string depth?;
    string fieldId?;
    ConditionRest20 condition?;
};

public type FormRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the form.
    string id?;
    # The form's current status. Example: draft, active, or complete.
    string currentStatus?;
    # The name of the form.
    string name?;
    # The description of the form.
    string description?;
    # The permissions for the form granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The ID of the containing folder.
    string folderId?;
    # Id of the source template.
    string sourceTemplateId?;
    # The login ID of the user who created the form.
    string createdBy?;
    # The date and time the form was created, expressed in Unix time.
    string createdAt?;
    # The login ID of the user that last updated the form.
    string updatedBy?;
    # Unix timestamp for the date and time the form was last updated.
    string updatedAt?;
    # The date and time the form was last accessed, expressed in Unix time.
    string accessedAt?;
    # This property is not used.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The asset's raw HTML name.
    string htmlName?;
    # A list of the form's processing types. For example: externalEmail, externalWebsite, internallyHosted, internalAgentProxyForm.
    string processingType?;
    # The landing page ID of the failed submit.
    string submitFailedLandingPageId?;
    SizeRest20 size?;
    # The asset's raw HTML content.
    string html?;
    # The asset's main layout style.
    string style?;
    # Array consisting of form elements.
    FormElementRest20[] elements?;
    # A list of the form's processing steps. There is no limit to the number of processing steps that can be included. Possible values include: FormStepAddToCampaign, FormStepAddToContactList, FormStepAddToDataCanvas, FormStepAddToProgram, FormStepAssociateToCampaign, FormStepCancelRegistration, FormStepUpdateContactEmailAddress, FormStepCreateUpdateEventRegistration, FormStepCreateUpdate, FormStepCreateUpdateFromFormField, FormStepGlobalSubscribe, FormStepGlobalUnsubscribe, FormStepGroupSubscription, FormStepPostData, FormStepRedirectToWebPage, FormStepRemoveFromContactList, FormStepRunIntegrationRules, FormStepSendEmail, FormStepSendNotificationEmail, and FormStepWebTracking.
    FormProcessingStepRest20[] processingSteps?;
    FormFieldUpdateMappingRest20 defaultKeyFieldMapping?;
    # The external integration URL used for integrating external forms.
    string externalIntegrationUrl?;
    # The custom style applied to the form.
    string customCSS?;
    # Whether the form is an internal form. If true, the form is not exposed outside of Eloqua and any form submissions to this form are deleted.
    string isHidden?;
    # Form metadata in JSON. Applicable only to responsive forms. Not required to be set when creating and updating forms. We recommend omitting this parameter when creating and updating forms, and letting Eloqua set it by default. When creating a form and including this parameter, this must be set to <code>{\"type\":\"responsiveForm\",\"version\":\"1\"}</code>.
    string formJson?;
    # Indicates whether the form is responsive. Returns <code>true</code> for a responsive form, <code>false</code> for a legacy form. Avoid sending this property when creating and updating forms. This is a read-only property.
    string isResponsive?;
    # True if form is archived otherwise False. This is a read-only property.
    string archived?;
    # Indicates whether spam protection is enabled on the form.
    string isFormSpamProtectionEnabled?;
};

public type ContactRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact. This is a read-only property.
    string id?;
    # The contact's current status.
    string currentStatus?;
    # The name of the contact.
    string name?;
    # The description of the contact.
    string description?;
    # The permissions for the contact granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the contact.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the contact.
    string createdBy?;
    # The date and time the contact was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact.
    string updatedBy?;
    # Unix timestamp for the date and time the contact was last updated.
    string updatedAt?;
    # The date and time the contact was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the contact is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact's first name.
    string firstName?;
    # The contact's last name.
    string lastName?;
    # The contact's email address.
    string emailAddress?;
    # The contact's email format preference.
    string emailFormatPreference?;
    # Whether or not the contact is subscribed.
    string isSubscribed?;
    # Contact_Field_IsSmsSubscribed_Description
    string isSmsSubscribed?;
    # Whether or not the contact has any associated bouncebacks.
    string isBounceback?;
    # The account name in which the contact belongs.
    string accountName?;
    # The account id in which the contact belongs. This is a read-only property.
    string accountId?;
    # The contact's title.
    string title?;
    # The contact's subscription date.
    string subscriptionDate?;
    # The contact's unsubscription date.
    string unsubscriptionDate?;
    # The contact's bounceback date.
    string bouncebackDate?;
    # Array containing <code>type</code> and <code>id</code> values for all of the contactFields associated with a given contact.
    FieldValueRest20[] fieldValues?;
    # The contact's first address.
    string address1?;
    # The contact's second address.
    string address2?;
    # The contact's third address.
    string address3?;
    # The contact's city.
    string city?;
    # The contact's province.
    string province?;
    # The contact's postal code.
    string postalCode?;
    # The contact's country.
    string country?;
    # The contact's business phone number.
    string businessPhone?;
    # The contact's mobile phone number.
    string mobilePhone?;
    # The contact's fax number.
    string fax?;
    # The contact's account representative.
    string salesPerson?;
    # The time the contact was added to a step. This is a read-only property. This property can only be retrieved when a <code>stepid</code> is provided.
    string stepEntryTime?;
    # The time when the contact is scheduled to be processed. This is a read-only property.  This property can only be retrieved when a <code>stepid</code> is provided.
    string nextEvaluationTime?;
};

public type UserPreferencesRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The ID of the user's timezone in Eloqua.
    string timezoneId?;
};

# The request body defines the details of the custom object export definition.
public type Customobjectexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type CampaignElementRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the campaign element. This is a read-only property.
    string id?;
    # The campaign element's current status.
    string currentStatus?;
    # Name of the campaign element. This is a read-only property.
    string name?;
    # The description of the campaign element.
    string description?;
    # The permissions for the campaign element granted to your current instance. This is a read-only property.
    string[] permissions?;
    # Id of the associated folder.
    string folderId?;
    # The id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the campaign element.
    string createdBy?;
    # The date and time the campaign element was created, expressed in Unix time. 
    string createdAt?;
    # The login id of the user that last updated the campaign element.
    string updatedBy?;
    # Unix timestamp for the date and time the campaign element was last updated.
    string updatedAt?;
    # The date and time the campaign element was last accessed.
    string accessedAt?;
    # The date the campaign element is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    PositionRest20 position?;
    # A list of the campaign element ids within the campaign. This is a read-only property.
    CampaignOutputTerminalRest20[] outputTerminals?;
    # Amount of members within the campaign element. This is a read-only property.
    string memberCount?;
    # Amount of members within the campaign element in errored status. This is a read-only property.
    string memberErrorCount?;
};

public type QueryResultContactRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of contact fields.
    ContactRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the custom object export definition.
public type Customobjectexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the custom object export definition.
public type Customobjectexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type CustomObjectRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the custom object.
    string id?;
    # This property is not used for custom object fields.
    string currentStatus?;
    # The name of the custom object.
    string name?;
    # The description of the custom object.
    string description?;
    # The permissions for the custom object granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the custom object.
    string createdBy?;
    # The date and time the custom object was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the custom object.
    string updatedBy?;
    # Unix timestamp for the date and time the custom object was last updated.
    string updatedAt?;
    # The date and time the custom object was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array consisting of custom object field properties.
    CustomObjectFieldRest10[] fields?;
    # For your custom object record to have a meaningful name field, you must create a custom object field which will act as a name. You can then use the desired custom object field's id as the value for this parameter.
    string displayNameFieldId?;
    # For your custom object record to have a unique identifier, you must create a custom object field which will act as a GUID. You can then use the desired custom object field's id as the value for this parameter.
    string uniqueCodeFieldId?;
    # Whether or not custom object records are deleted when linked contact records are deleted. Does not apply to records that are unmapped or account deletion. Deleting records is irreversible and data cannot be recovered. The default value is <code>false</code>. This feature is released under our Controlled Availability program. You can request access to this feature by submitting a request to <a href='https://support.oracle.com/epmos/faces/MosIndex.jspx'>My Oracle Support</a>.
    string deleteLinkedCustomObjectData?;
};

public type QueryResultSecurityGroupUserRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of security group user data.
    SecurityGroupUserRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the campaign response export definition.
public type CampaignResponseExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultUserRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of user fields.
    UserRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type EmailFooterRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the email footer. This is a read-only property.
    string id?;
    # The email footer's current status.
    string currentStatus?;
    # The name of the email footer.
    string name?;
    # The description of the email footer.
    string description?;
    # The permissions for the email footer granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the email footer.
    string createdBy?;
    # The date and time the email footer was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email footer.
    string updatedBy?;
    # Unix timestamp for the date and time the email footer was last updated.
    string updatedAt?;
    # The date and time the email footer was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The email footers's html text content.
    string body?;
    # The raw text from the "body" parameter.
    string text?;
    # A list of associated Field Merges.
    FieldMergeRest10[] fieldMerges?;
    # A list of hyperlinks contained within the email footer.
    HyperlinkRest10[] hyperlinks?;
};

public type QueryResultExternalAssetTypeRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of account group fields.
    ExternalAssetTypeRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ProfileFieldRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the visitor profile field. This is a read-only property.
    string id?;
    # The name of the visitor profile field. 
    string name?;
    # The internal name of the visitor profile field.
    string internalName?;
    # The visitor profile field's data type. Possible values are: text, 'text', 'largeText', 'date', or 'number'.
    string dataType?;
    # The value length of the field expressed in bytes.
    string length?;
};

public type PositionRest20 record {
    # The campaign element's type. This is a read-only property.
    string 'type?;
    # The position of the campaign element on the x axis.
    string x?;
    # The position of the campaign element on the y axis.
    string y?;
};

# The request body defines the details of the custom object export definition.
public type CustomObjectExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ContactRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact. This is a read-only property.
    string id?;
    # The contact's current status.
    string currentStatus?;
    # The name of the contact.
    string name?;
    # The description of the contact.
    string description?;
    # The permissions for the contact granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the contact.
    string createdBy?;
    # The date and time the contact was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact.
    string updatedBy?;
    # Unix timestamp for the date and time the contact was last updated.
    string updatedAt?;
    # The date and time the contact was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact's first name.
    string firstName?;
    # The contact's last name.
    string lastName?;
    # The contact's email address.
    string emailAddress?;
    # The contact's email format preference.
    string emailFormatPreference?;
    # Whether or not the contact is subscribed.
    string isSubscribed?;
    # Whether or not the contact has any associated bouncebacks.
    string isBounceback?;
    # The account name in which the contact belongs.
    string accountName?;
    # The account id in which the contact belongs. This is a read-only property.
    string accountId?;
    # The contact's title.
    string title?;
    # The contact's subscription date.
    string subscriptionDate?;
    # The contact's unsubscription date.
    string unsubscriptionDate?;
    # The contact's bounceback date.
    string bouncebackDate?;
    # Array containing <code>type</code> and <code>id</code> values for all of the contactFields associated with a given contact.
    FieldValueRest10[] fieldValues?;
    # The contact's first address.
    string address1?;
    # The contact's second address.
    string address2?;
    # The contact's third address.
    string address3?;
    # The contact's city.
    string city?;
    # The contact's province.
    string province?;
    # The contact's postal code.
    string postalCode?;
    # The contact's country.
    string country?;
    # The contact's business phone number.
    string businessPhone?;
    # The contact's mobile phone number.
    string mobilePhone?;
    # The contact's fax number.
    string fax?;
    # The contact's account representative.
    string salesPerson?;
};

public type DynamicContentRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the dynamic content. This is a read-only property.
    string id?;
    # The dynamic content's current status.
    string currentStatus?;
    # Name of the dynamic content.
    string name?;
    # The description of the dynamic content.
    string description?;
    # The permissions for the dynamic content granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the dynamic content.
    string createdBy?;
    # The date and time the dynamic content was last accessed, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the dynamic content. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the dynamic content was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the dynamic content was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    ContentSectionRest10 defaultContentSection?;
    # The dynamic content's rules.
    DynamicContentRuleRest10[] rules?;
};

# The request body defines details of the contact sync action definition.
public type ContactSyncActionOperationIndividual record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultSecurityGroupRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of security group fields.
    SecurityGroupRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type CustomObjectRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the custom object.
    string id?;
    # This property is not used for custom objects.
    string currentStatus?;
    # The name of the custom object.
    string name?;
    # The description of the custom object.
    string description?;
    # The permissions for the custom object granted to your current instance. This is a read-only property.
    string[] permissions?;
    # This property is not used for custom objects.
    string folderId?;
    # This property is not used for custom objects.
    string sourceTemplateId?;
    # The login id of the user who created the custom object.
    string createdBy?;
    # The date and time the custom object was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the custom object.
    string updatedBy?;
    # Unix timestamp for the date and time the custom object was last updated.
    string updatedAt?;
    # The date and time the custom object was last accessed, expressed in Unix time.
    string accessedAt?;
    # This property is not used for custom objects.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array consisting of custom object field properties.
    CustomObjectFieldRest20[] fields?;
    # For your custom object record to have an email address field, you must create a custom object field which will act as an email address. You can then use the desired custom object field's id as the value for this parameter.
    string emailAddressFieldId?;
    # For your custom object record to have a meaningful name field, you must create a custom object field which will act as a name. You can then use the desired custom object field's id as the value for this parameter.
    string displayNameFieldId?;
    # For your custom object record to have a unique identifier, you must create a <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#Developers/RESTAPI/2.0%20Endpoints/Custom%20objects/Custom-object-fields.htm'>custom object field</a> which will act as a GUID. You can then use the desired custom object field's id as the value for this parameter.
    string uniqueCodeFieldId?;
    # Whether or not custom object records are deleted when linked contact records are deleted. Does not apply to records that are unmapped or account deletion. Deleting records is irreversible and data cannot be recovered. The default value is <code>false</code>. This feature is released under our Controlled Availability program. You can request access to this feature by submitting a request to <a href='https://support.oracle.com/epmos/faces/MosIndex.jspx'>My Oracle Support</a>.
    string deleteLinkedCustomObjectData?;
};

public type CustomObjectDataRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the custom object data.
    string id?;
    # The custom object data's current status.
    string currentStatus?;
    # The name of the custom object data.
    string name?;
    # The description of the custom object data.
    string description?;
    # The permissions for the custom object data granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the custom object data.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the custom object data. This is a read-only property.
    string createdBy?;
    # The date and time the custom object data was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # The login id of the user that last updated the custom object data.
    string updatedBy?;
    # Unix timestamp for the date and time the custom object data was last updated.
    string updatedAt?;
    # The date and time the custom object data was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the custom object data is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact record Id associated to this custom object data.
    string contactId?;
    # The account record Id associated to this custom object data. This is a read-only property.
    string accountId?;
    # The unique code associated to the custom object data.
    string uniqueCode?;
    # The record status of the custom object data.
    string customObjectRecordStatus?;
    # Array containing <code>type</code> and <code>id</code> values for all of the fields associated with a given custom object data asset. Custom object date field values must be in Unix time format.
    FieldValueRest20[] fieldValues?;
    # Whether or not the custom object data is mapped to a custom object.
    string isMapped?;
};

# The request body defines the details of the opportunity import definition.
public type OpportunityImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not to perform a case sensitive search on the identifier field.
    boolean isIdentifierFieldCaseSensitive?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not multiple matched records are being updated.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the custom object sync action definition.
public type Customobjectsyncactionoperationindividual1 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the custom object sync action definition.
public type Customobjectsyncactionoperationindividual2 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the custom object sync action definition.
public type CustomObjectSyncActionOperationIndividual record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the custom object sync action definition.
public type Customobjectsyncactionoperationindividual3 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type LandingPageRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the landing page. This is a read-only property.
    string id?;
    # The landing page's current status. This is a read-only property.
    string currentStatus?;
    # The name of the landing page.
    string name?;
    # The description of the landing page.
    string description?;
    # The permissions for the landing page granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the landing page.
    string createdBy?;
    # The date and time the landing page was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the landing page.
    string updatedBy?;
    # Unix timestamp for the date and time the landing page was last updated.
    string updatedAt?;
    # The date and time the landing page was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Unix timestamp for the date and time the landing page was deployed. This is a read-only property.
    string deployedAt?;
    # Id of the associated microsite.
    string micrositeId?;
    # Unix timestamp for the date and time the landing page was last refreshed. This is a read-only property.
    string refreshedAt?;
    HtmlContentRest10 htmlContent?;
    # The landing page's main layout.
    string layout?;
    # The landing page's main layout style.
    string style?;
    # A list of forms contained within the landing page.
    FormRest10[] forms?;
    # A list of images contained within the landing page.
    ImageFileRest10[] images?;
    # A list of hyperlinks contained within the landing page.
    HyperlinkRest10[] hyperlinks?;
    # A list of content sections contained within the landing page.
    ContentSectionRest10[] contentSections?;
    # A list of dynamic contents contained within the landing page.
    DynamicContentRest10[] dynamicContents?;
    # A list of files contained within the landing page.
    ImportedFileRest10[] files?;
    # The landing page's auto re-direct URL.
    string autoRedirectUrl?;
    # The amount of time the service will wait before redirecting to the auto re-direct URL.
    string autoRedirectWaitFor?;
    # The amount of time the service will wait before closing.
    string autoCloseWaitFor?;
    # The relative path of the landing page.
    string relativePath?;
};

public type QueryResultImageRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of image fields.
    ImageFileRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the campaign response export definition.
public type Campaignresponseexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the campaign response export definition.
public type Campaignresponseexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the campaign response export definition.
public type Campaignresponseexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ObjectValidationErrorRest10 record {
    string 'type?;
    ObjectKeyRest10 container?;
    string property?;
    string value?;
    RequirementRest10 requirement?;
};

public type DynamicContentRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the dynamic content. This is a read-only property.
    string id?;
    # The dynamic content's current status.
    string currentStatus?;
    # Name of the dynamic content.
    string name?;
    # The description of the dynamic content.
    string description?;
    # The permissions for the dynamic content granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The id of the associated folder.
    string folderId?;
    # The id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the dynamic content.
    string createdBy?;
    # The date and time the dynamic content was last accessed, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the dynamic content.
    string updatedBy?;
    # Unix timestamp for the date and time the dynamic content was last updated.
    string updatedAt?;
    # The date and time the dynamic content was last accessed.
    string accessedAt?;
    # The date the dynamic content is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    ContentSectionRest20 defaultContentSection?;
    # The dynamic content's rules.
    DynamicContentRuleRest20[] rules?;
    # Whether or not the dynamic content is public.
    boolean isContentPublic?;
};

public type FormDataRest10 record {
    # The asset's type in Eloqua. This is a read-only property
    string 'type?;
    # ID of the form submit if synchronous or ID of the form submission job if async. This is a read-only property
    string id?;
    # Current status of form submission when submitted through asynchronous submission
    string currentStatus?;
    # Unix timestamp for the date and time the form data was submitted. This is a read-only property
    string submittedAt?;
    # ID of the contact that submitted the form. This is a read-only property
    string submittedByContactId?;
    # A list of key/value pairs identifying the form data (field name / value)
    FieldValueRest10[] fieldValues?;
    # A list of Processing Step Errors occurred in current form submission. This is a read-only property
    ProcessingStepErrorRest10[] processingStepErrors?;
    # Unix timestamp for the date and time the form data was processed if submitted through asynchronous submission. This is a read-only property
    string processedAt?;
    # In case of asynchronous form submission if processed then submit ID of form submission. This is a read-only property
    int rowId?;
    # Validation errors if any occured in form submission. This is a read-only property
    ObjectValidationErrorRest10[] validationErrors?;
};

public type InterfacePermissionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # 
    string interfaceCode?;
    # 
    InterfacePermissionRest20[] nestedInterfacePermissions?;
    # 
    string name?;
};

# The request body defines the details of the email address import definition.
public type EmailAddressImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the activity import definition.
public type ActivityImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type CampaignOutputTerminalRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the campaign output terminal. This is a read-only property.
    string id?;
    # The campaign output terminal's current status.
    string currentStatus?;
    # Name of the campaign output terminal.
    string name?;
    # The description of the campaign output terminal.
    string description?;
    # The permissions for the campaign output terminal granted to your current instance.
    string[] permissions?;
    # Id of the associated folder.
    string folderId?;
    # The id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the campaign output terminal.
    string createdBy?;
    # The date and time the campaign output terminal was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the campaign output terminal.
    string updatedBy?;
    # Unix timestamp for the date and time the campaign output terminal was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the campaign output terminal was last accessed.
    string accessedAt?;
    # The date the campaign output terminal is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The campaign output terminal type. This is a read-only property.
    string terminalType?;
    # The campaign output terminal's connection type. This is a read-only property.
    string connectedType?;
    # The connected id of the campaign output terminal. This is a read-only property.
    string connectedId?;
};

# The request body defines the details of the campaign response import definition.
public type Campaignresponseimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # This property is not used.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Your service instance id.
    string serviceInstanceId?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the activity export definition.
public type Activityexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the activity export definition.
public type Activityexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ExternalAssetRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the external asset. This is a read-only property.
    string id?;
    # The external asset's current status.
    string currentStatus?;
    # The description of the external asset.
    string description?;
    # The permissions for the external asset granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the external asset.
    string folderId?;
    # Id of the template used to create the external asset.
    string sourceTemplateId?;
    # The login id of the user who created the external asset.
    string createdBy?;
    # The date and time the external asset was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the external asset.
    string updatedBy?;
    # Unix timestamp for the date and time the external asset was last updated.
    string updatedAt?;
    # The date and time the external asset was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the external asset is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Id of the external asset type.
    string externalAssetTypeId?;
    # The name of the external asset.
    string name?;
};

# The request body defines the details of the activity export definition.
public type Activityexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type TypePermissionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # 
    string objectType?;
    TypePermissionsRest20 permissions?;
};

public type CustomObjectDataRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the custom object. This is a read-only property.
    string id?;
    # The custom object's current status. This is a read-only property.
    string currentStatus?;
    # Id of the contact. This is a read-only property.
    string contactId?;
    # Array containing <code>type</code> and <code>id</code> values for all of the fields associated with a given custom object data asset. Custom object date field values must be in Unix time format.
    FieldValueRest10[] fieldValues?;
};

# The request body defines the details of the campaign response import definition.
public type Campaignresponseimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # This property is not used.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Your service instance id.
    string serviceInstanceId?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ContactSegmentRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact segment. This is a read-only property.
    string id?;
    # This property is not used for contact segments.
    string currentStatus?;
    # The contact segment's name.
    string name?;
    # This property is not used for contact segments.
    string description?;
    # The permissions for the contact segment granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the contact segment.
    string folderId?;
    # This property is not used for contact segments.
    string sourceTemplateId?;
    # The login id of the user who created the contact segment.
    string createdBy?;
    # The date and time the contact segment was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact segment.
    string updatedBy?;
    # Unix timestamp for the date and time the contact segment was last updated.
    string updatedAt?;
    # This property is not used for contact segments.
    string accessedAt?;
    # This property is not used for contact segments.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array of contact segment elements.
    SegmentElementRest20[] elements?;
    # The number of contacts in the contact segment. This is a read-only property.
    string count?;
    # The date and time of the most recent calculation. This is a read-only property.
    string lastCalculatedAt?;
    # Whether or not the contact segment has been refreshed in the last 24 hours by the user performing the request.
    string isStale?;
};

# The request body defines the details of the campaign response import definition.
public type Campaignresponseimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # This property is not used.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # Your service instance id.
    string serviceInstanceId?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type CloudComponentRest20 record {
};

# The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
public type RuleType string;

public type EventSessionFieldValueRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # This property is not used for event session field values.
    string id?;
    # This property is not used for event session field values.
    string currentStatus?;
    # This property is not used for event session field values.
    string name?;
    # This property is not used for event session field values.
    string description?;
    # This property is not used.
    string[] permissions?;
    # This property is not used for event session field values.
    string folderId?;
    # This property is not used for event session field values.
    string sourceTemplateId?;
    # This property is not used for event session field values.
    string createdBy?;
    # This property is not used for event session field values.
    string createdAt?;
    # This property is not used for event session field values.
    string updatedBy?;
    # This property is not used for event session field values.
    string updatedAt?;
    # This property is not used for event session field values.
    string accessedAt?;
    # This property is not used for event session field values.
    string scheduledFor?;
    # This property is not used for event session field values.
    string depth?;
    # The SessionId of the session within an event for which field value is passed.
    string sessionId?;
    # The SessionFieldId of the field. The session field must be created first before creating session field values.
    string sessionFieldId?;
    # The value for the event session field.
    string value?;
};

public type SizeRest20 record {
    # The asset's type in Eloqua. This is a read-only property. The type for this property is 'size'.
    string 'type?;
    # The width dimensions of the asset expressed in pixels.
    string width?;
    # The height dimensions of the asset expressed in pixels.
    string height?;
};

public type SegmentElementRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the contact segment element. This is a read-only property.
    string id?;
    # The contact segment element's current status. This is a read-only property.
    string currentStatus?;
    # The name of the contact segment element. This is a read-only property.
    string name?;
    # The description of the contact segment element.
    string description?;
    # The permissions for the contact segment element granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the contact segment element.
    string createdBy?;
    # The date and time the contact segment element was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact segment element.
    string updatedBy?;
    # Unix timestamp for the date and time the contact segment element was last updated.
    string updatedAt?;
    # The date and time the contact segment element was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The total amount of contacts within the segment element.
    string isIncluded?;
    # The number of contacts in the contact segment element. This is a read-only property.
    string count?;
    # The date and time the contact segment element was last calculated. This is a read-only property.
    string lastCalculatedAt?;
};

public type OptionListRest10 record {
    # The option list's type in Eloqua. This is a read-only property.
    string 'type?;
    # The option list's unique identifier.
    string id?;
    # The option list's current status.
    string currentStatus?;
    # The name of the option list.
    string name?;
    # The description of the option list.
    string description?;
    # The permissions for the option list granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the option list.
    string createdBy?;
    # Unix timestamp for the date and time the option list was created.
    string createdAt?;
    # The login id of the user that last updated the option list.
    string updatedBy?;
    # Unix timestamp for the date and time the option list was last updated.
    string updatedAt?;
    # The date and time the option list was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # A list of option elements.
    OptionRest10[] elements?;
};

# The request body defines details of the opportunity contact linkage import definition.
public type Opportunitycontactlinkageimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to false to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not to perform a case sensitive search on the match field.
    boolean linkOpportunitiesCaseSensitiveMatchField?;
    # Whether or not to perform a case sensitive search on the source field.
    boolean linkOpportunitiesCaseSensitiveSourceField?;
    # Specifies the entity of the contact linkage import. Allowed values are "Contact" or "Account".
    string linkOpportunitiesEntityType?;
    # Specifies the field name for matching.
    string linkOpportunitiesMatchFieldName?;
    # Whether or not imported data will be mapped to multiple matching records.
    boolean linkOpportunitiesMultipleSourceMatches?;
    # Specifies the source field name for matching.
    string linkOpportunitiesSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the contact sync action definition.
public type Contactsyncactionoperationindividual3 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the opportunity contact linkage import definition.
public type Opportunitycontactlinkageimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to false to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not to perform a case sensitive search on the match field.
    boolean linkOpportunitiesCaseSensitiveMatchField?;
    # Whether or not to perform a case sensitive search on the source field.
    boolean linkOpportunitiesCaseSensitiveSourceField?;
    # Specifies the entity of the contact linkage import. Allowed values are "Contact" or "Account".
    string linkOpportunitiesEntityType?;
    # Specifies the field name for matching.
    string linkOpportunitiesMatchFieldName?;
    # Whether or not imported data will be mapped to multiple matching records.
    boolean linkOpportunitiesMultipleSourceMatches?;
    # Specifies the source field name for matching.
    string linkOpportunitiesSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the contact sync action definition.
public type Contactsyncactionoperationindividual1 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type FormRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the form. This is a read-only property.
    string id?;
    # The form's current status. Example: draft, active, or complete.
    string currentStatus?;
    # The name of the form.
    string name?;
    # The description of the form.
    string description?;
    # The permissions for the form granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the form.
    string createdBy?;
    # The date and time the form was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the form.
    string updatedBy?;
    # Unix timestamp for the date and time the form was last updated.
    string updatedAt?;
    # The date and time the form was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The asset's raw HTML name.
    string htmlName?;
    # A list of the form's processing types. For example: externalEmail, externalWebsite, internallyHosted, internalAgentProxyForm.
    string processingType?;
    # The email address form field entity's unique identifier.
    string emailAddressFormFieldId?;
    # The landing page id of the failed submit.
    string submitFailedLandingPageId?;
    # The asset's raw HTML content.
    string html?;
    # The asset's main layout style.
    string style?;
    # Array consisting of form elements.
    FormElementRest10[] elements?;
    # A list of the form's processing steps. There is no limit to the number of processing steps that can be included. Possible values include: FormStepAddToCampaign, FormStepAddToContactList, FormStepAddToDataCanvas, FormStepAddToProgram, FormStepAssociateToCampaign, FormStepCancelRegistration, FormStepUpdateContactEmailAddress, FormStepCreateUpdateEventRegistration, FormStepCreateUpdate, FormStepCreateUpdateFromFormField, FormStepGlobalSubscribe, FormStepGlobalUnsubscribe, FormStepGroupSubscription, FormStepPostData, FormStepRedirectToWebPage, FormStepRemoveFromContactList, FormStepRunIntegrationRules, FormStepSendEmail, FormStepSendNotificationEmail, and FormStepWebTracking.
    FormProcessingStepRest10[] processingSteps?;
    # Whether the form is an internal form. If <code>true</code>, the form is not exposed outside of Eloqua and any form submissions to this form are deleted.
    string isHidden?;
    # True if form is archived otherwise False. This is a read-only property.
    string archived?;
};

# The request body defines details of the opportunity contact linkage import definition.
public type Opportunitycontactlinkageimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to false to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not to perform a case sensitive search on the match field.
    boolean linkOpportunitiesCaseSensitiveMatchField?;
    # Whether or not to perform a case sensitive search on the source field.
    boolean linkOpportunitiesCaseSensitiveSourceField?;
    # Specifies the entity of the contact linkage import. Allowed values are "Contact" or "Account".
    string linkOpportunitiesEntityType?;
    # Specifies the field name for matching.
    string linkOpportunitiesMatchFieldName?;
    # Whether or not imported data will be mapped to multiple matching records.
    boolean linkOpportunitiesMultipleSourceMatches?;
    # Specifies the source field name for matching.
    string linkOpportunitiesSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the contact sync action definition.
public type Contactsyncactionoperationindividual2 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type FormDataRest20 record {
    # The asset's type in Eloqua. This is a read-only property
    string 'type?;
    # The ID of the form submit if synchronous or ID of the form submission job if asynchronous. This is a read-only property
    string id?;
    # The current status of the form submission job. Possible values: Queued, InProgress, Error, and Success.
    string currentStatus?;
    # Unix timestamp for the date and time the form data was submitted. This is a read-only property
    string submittedAt?;
    # The ID of the contact that submitted the form. This is a read-only property
    string submittedByContactId?;
    # A list of key/value pairs identifying the form data (field name / value)
    FieldValueRest20[] fieldValues?;
    # A list of Processing Step Errors occurred in current form submission. This is a read-only property
    ProcessingStepErrorRest20[] processingStepErrors?;
    # Unix timestamp for the date and time the form data was processed if submitted through asynchronous submission. This is a read-only property
    string processedAt?;
    # In case of an asynchronous form submission if processed then submit ID of form submission. This is a read-only property
    int rowId?;
    # Validation errors if any occured in form submission. This is a read-only property
    ObjectValidationErrorRest20[] validationErrors?;
    # The unique identifier of form submission within the batch. Optional String field. If present, must be unique across created batches. If <code>correlationId</code> is not unique, then the entire batch will fail. The <code>correlationId</code> is persisted and could be used to identify the form submit.
    string correlationId?;
};

public type ObjectValidationErrorRest20 record {
    string 'type?;
    ObjectKeyRest20 container?;
    string property?;
    string value?;
    RequirementRest20 requirement?;
};

public type MicrositeRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the microsite. This is a read-only property.
    string id?;
    # The campaign's current status.
    string currentStatus?;
    # The name of the microsite.
    string name?;
    # The description of the microsite.
    string description?;
    # The permissions for the microsite granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the microsite.
    string createdBy?;
    # The date and time the microsite was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the microsite.
    string updatedBy?;
    # Unix timestamp for the date and time the microsite was last updated.
    string updatedAt?;
    # The date and time the microsite was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # A collection of associated sub domains.
    string[] domains?;
    # The id for the associated default landing page.
    string defaultLandingPageId?;
    # Whether pages associated to the microsite can be embedded within frames, iframes, or objects. <a href='https://docs.oracle.com/en/cloud/saas/marketing/eloqua-user/index.html#CSHID=PreventEmbedding'>Learn more</a>.
    string isAllowedInFrame?;
};

public type HtmlContentRest10 record {
    string 'type?;
};

public type CriterionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the criterion. This is a read-only property.
    string id?;
    # The criterion's current status. This is a read-only property.
    string currentStatus?;
    # Name of the criterion.
    string name?;
    # The description of the criterion.
    string description?;
    # The permissions for the criterion granted to your current instance.
    string[] permissions?;
    # Id of the folder. This is a read-only property.
    string folderId?;
    # Id of the source template. This is a read-only property.
    string sourceTemplateId?;
    # The login id of the user who created the criterion.
    string createdBy?;
    # The date and time the criterion was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the criterion.
    string updatedBy?;
    # Unix timestamp for the date and time the criterion was last updated.
    string updatedAt?;
    # The date and time the criterion was last accessed.
    string accessedAt?;
    # The date and time the criterion is scheduled for.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
};

public type QueryResultLandingPageRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of landing page fields.
    LandingPageRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the custom object import definition.
public type CustomObjectImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type SegmentElementRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the contact segment element. This is a read-only property.
    string id?;
    # The contact segment element's current status. This is a read-only property.
    string currentStatus?;
    # This property is not used for contact segment elements.
    string name?;
    # This property is not used for contact segment elements.
    string description?;
    # The permissions for the contact segment element granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the contact segment element.
    string folderId?;
    # This property is not used for contact segment elements.
    string sourceTemplateId?;
    # The login id of the user who created the contact segment element.
    string createdBy?;
    # The date and time the contact segment element was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact segment element.
    string updatedBy?;
    # Unix timestamp for the date and time the contact segment element was last updated.
    string updatedAt?;
    # This property is not used for contact segment elements.
    string accessedAt?;
    # This property is not used for contact segment elements.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The total amount of contacts within the segment element.
    string isIncluded?;
    # The number of contacts in the contact segment element. This is a read-only property.
    string count?;
    # The date and time the contact segment element was last calculated. This is a read-only property.
    string lastCalculatedAt?;
};

# The request body defines details of the contact export definition.
public type ContactExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event import definition.
public type Eventimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event import definition.
public type Eventimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event import definition.
public type Eventimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the contact export definition.
public type Contactexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines details of the contact export definition.
public type Contactexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type HyperlinkRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the hyperlink. This is a read-only property.
    string id?;
    # The hyperlink's current status.
    string currentStatus?;
    # Name of the hyperlink.
    string name?;
    # The description of the hyperlink.
    string description?;
    # The permissions for the hyperlink granted to your current instance.
    string permissions?;
    # The login id of the user who created the hyperlink.
    string createdBy?;
    # The date and time the hyperlink was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the hyperlink.
    string updatedBy?;
    # Unix timestamp for the date and time the hyperlink was last updated.
    string updatedAt?;
    # The date and time the hyperlink was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Href value of the hyperlink.
    string href?;
    # The type of hyperlink. Possible values include: ExternalURL, ICSCalendarURL, LandingPageURL, ReferrerURL, RSSURL, or TrackedExternalURL.
    string hyperlinkType?;
    # Id of the referenced entity.
    string referencedEntityId?;
};

# The request body defines details of the contact export definition.
public type Contactexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type HtmlContentRest20 record {
    string 'type?;
    string contentSource?;
};

public type CriterionRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the criterion. This is a read-only property.
    string id?;
    # The criterion's current status. This is a read-only property.
    string currentStatus?;
    # Name of the criterion.
    string name?;
    # The description of the criterion.
    string description?;
    # The permissions for the criterion granted to your current instance.
    string permissions?;
    # The login id of the user who created the criterion.
    string createdBy?;
    # The date and time the criterion was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the criterion.
    string updatedBy?;
    # Unix timestamp for the date and time the criterion was last updated.
    string updatedAt?;
    # The date and time the criterion was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
};

# The request body defines the details of the opportunity import definition.
public type Opportunityimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not to perform a case sensitive search on the identifier field.
    boolean isIdentifierFieldCaseSensitive?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not multiple matched records are being updated.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the opportunity import definition.
public type Opportunityimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not to perform a case sensitive search on the identifier field.
    boolean isIdentifierFieldCaseSensitive?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not multiple matched records are being updated.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultHeaderRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of header fields.
    EmailHeaderRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the opportunity import definition.
public type Opportunityimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not to perform a case sensitive search on the identifier field.
    boolean isIdentifierFieldCaseSensitive?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not multiple matched records are being updated.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the account export definition.
public type AccountExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type UserPasswordRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The user's password.
    string password?;
    # Boolean to determine whether the user must change their password upon logging in.
    string mustChangePassword?;
};

public type QueryResultCustomObjectRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of custom object fields.
    CustomObjectRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type SecurityGroupUserRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The patch method to perform
    string patchMethod?;
    UserRest20 user?;
};

public type LandingPageRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the landing page. This is a read-only property.
    string id?;
    # The landing page's current status. This is a read-only property.
    string currentStatus?;
    # The name of the landing page.
    string name?;
    # The description of the landing page.
    string description?;
    # The permissions for the landing page granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the landing page.
    string folderId?;
    # Id of the template used to create the landing page.
    string sourceTemplateId?;
    # The login id of the user who created the landing page.
    string createdBy?;
    # The date and time the landing page was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the landing page.
    string updatedBy?;
    # Unix timestamp for the date and time the landing page was last updated.
    string updatedAt?;
    # This property is not used.
    string accessedAt?;
    # This property is not used.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Unix timestamp for the date and time the landing page was deployed. This is a read-only property.
    string deployedAt?;
    # Id of the associated microsite.
    string micrositeId?;
    # Unix timestamp for the date and time the landing page was last refreshed. This is a read-only property.
    string refreshedAt?;
    HtmlContentRest20 htmlContent?;
    # The landing page's main layout.
    string layout?;
    # The landing page's main layout style.
    string style?;
    # A list of forms contained within the landing page.
    FormRest20[] forms?;
    # A list of images contained within the landing page.
    ImageFileRest20[] images?;
    # A list of hyperlinks contained within the landing page.
    HyperlinkRest20[] hyperlinks?;
    # A list of content sections contained within the landing page.
    ContentSectionRest20[] contentSections?;
    # A list of dynamic contents contained within the landing page.
    DynamicContentRest20[] dynamicContents?;
    # A list of files contained within the landing page.
    ImportedFileRest20[] files?;
    # 
    CloudComponentInstanceRest20[] contentServiceInstances?;
    # The URL to redirect window used with <code>autoRedirectWaitFor</code>.
    string autoRedirectUrl?;
    # Amount of seconds to automatically redirect window to URL specified with <code>autoRedirectUrl</code>. This setting cannot be used with <code>autoCloseWaitFor</code>. Only one can be selected, and a validation error will be returned if including both.
    string autoRedirectWaitFor?;
    # Amount of seconds to automatically close window. This setting cannot be used with <code>autoRedirectWaitFor</code>. Only one can be selected, and a validation error will be returned if including both.
    string autoCloseWaitFor?;
    # The relative path of the landing page.
    string relativePath?;
    # Whether or not the landing page is excluded from authentication.
    string excludeFromAuthentication?;
    # Whether or not the landing page is in protected mode.
    string isContentProtected?;
    # Whether or not the landing page is visible to external visitors.
    string isHidden?;
};

public type ExternalActivityTypeRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the external activity type.
    string id?;
    # The external activity type's current status.
    string currentStatus?;
    # The description of the external activity type.
    string description?;
    # The permissions for the external activity type granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the external activity type.
    string folderId?;
    # Id of the template used to create the external activity type.
    string sourceTemplateId?;
    # The login id of the user who created the external activity type.
    string createdBy?;
    # The date and time the external activity type was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the external activity type.
    string updatedBy?;
    # Unix timestamp for the date and time the external activity type was last updated.
    string updatedAt?;
    # The date and time the external asset type was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the external activity type is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The name of the external activity type.
    string name?;
};

# The request body defines the details of the synchronization definition.
public type Syncindividual1 record {
    # When a sync completes, Eloqua will make a call to the URL specified in this parameter. The callback can occur during sync creation, before the sync creation response, or immediately after.
    string callbackUrl?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The status of the synchronization. This is a read-only property.
    SyncStatusType status?;
    # This value should be the uri for the export/import definition you wish to sync. When you create an import/export definition, Eloqua will respond with a "uri" parameter, the value of which should be used here.
    string syncedInstanceUri?;
    # The date and time the sync ended. This is a read-only property.
    string syncEndedAt?;
    # The date and time the sync started. This is a read-only property.
    string syncStartedAt?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type HyperlinkRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the hyperlink. This is a read-only property.
    string id?;
    # The hyperlink's current status.
    string currentStatus?;
    # Name of the hyperlink.
    string name?;
    # The description of the hyperlink.
    string description?;
    # The permissions for the hyperlink granted to your current instance.
    string[] permissions?;
    # Id of the containing folder.
    string folderId?;
    # Id of the source template.
    string sourceTemplateId?;
    # The login id of the user who created the hyperlink.
    string createdBy?;
    # The date and time the hyperlink was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the hyperlink.
    string updatedBy?;
    # Unix timestamp for the date and time the hyperlink was last updated.
    string updatedAt?;
    # The date and time the hyperlink was last accessed.
    string accessedAt?;
    # The date the hyperlink is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Href value of the hyperlink.
    string href?;
    # The type of hyperlink. Possible values include: <code>ExternalURL</code>, <code>ICSCalendarURL</code>, <code>LandingPageURL</code>, <code>ReferrerURL</code>, <code>RSSURL</code>, or <code>TrackedExternalURL</code>.
    string hyperlinkType?;
    # Id of the referenced entity.
    string referencedEntityId?;
};

public type EventSessionRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Id of the event session. This is a read-only property.
    string id?;
    # This property is not used for event sessions.
    string currentStatus?;
    # The name of the session.
    string name?;
    # This property is not used for event sessions.
    string description?;
    # This property is not used.
    string[] permissions?;
    # This property is not used for event sessions.
    string folderId?;
    # This property is not used for event sessions.
    string sourceTemplateId?;
    # This property is not used for event sessions.
    string createdBy?;
    # This property is not used for event sessions.
    string createdAt?;
    # This property is not used for event sessions.
    string updatedBy?;
    # This property is not used for event sessions.
    string updatedAt?;
    # This property is not used for event sessions.
    string accessedAt?;
    # This property is not used for event sessions.
    string scheduledFor?;
    # This property is not used for event sessions.
    string depth?;
    # The maximum number of participants per session.
    int participantsLimit?;
};

public type ExternalAssetTypeRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the external asset type.
    string id?;
    # The external asset type's current status.
    string currentStatus?;
    # The description of the external asset type.
    string description?;
    # The permissions for the external asset type granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the external asset type.
    string folderId?;
    # Id of the template used to create the external asset type.
    string sourceTemplateId?;
    # The login id of the user who created the external asset type.
    string createdBy?;
    # The date and time the external asset type was created, expressed in Unix time. 
    string createdAt?;
    # The login id of the user that last updated the external asset type.
    string updatedBy?;
    # Unix timestamp for the date and time the external asset type was last updated.
    string updatedAt?;
    # The date and time the external asset type was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the external asset type is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # A list of the external activity types associated with the external asset type.
    ExternalActivityTypeRest20[] activityTypes?;
    # The name of the external asset type.
    string name?;
    ImageFileRest20 image?;
};

public type EntitySearchByExternalIdsRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Level of detail returned by the request. The default will be <code>minimal</code>. <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Learn more about the depth parameter</a>.
    string depth?;
    # The external ids to retrieve. Maximum of 200 external ids per request. If the array exceeds the 200 limit, a <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>400 Bad Request</a> will be returned.
    string[] externalIds?;
};

# The request body defines the details of the event export definition.
public type EventExportIndividual record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type EntitySearchByIdsRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Level of detail returned by the request. The default will be <code>minimal</code>. <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Learn more about the depth parameter</a>.
    string depth?;
    # The ids to retrieve. Maximum of 200 ids per request. If the array contains duplicate ids, or exceeds the 200 limit, a <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=HTTPStatusCodes'>400 Bad Request</a> will be returned.
    int[] ids?;
};

public type ContentSectionRest10 record {
    # The content section's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the content section. This is a read-only property.
    string id?;
    # The content section's current status. This is a read-only property.
    string currentStatus?;
    # The name of the content section.
    string name?;
    # The description of the content section.
    string description?;
    # The permissions for the content section granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the content section.
    string createdBy?;
    # The date and time the content section was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the content section.
    string updatedBy?;
    # Unix timestamp for the date and time the content section was last updated.
    string updatedAt?;
    # The date and time the content section was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The content section's HTML content.
    string contentHtml?;
    # The content section's text content.
    string contentText?;
    # The content sections's scope: either <code>local</code> or <code>global</code>.
    string scope?;
    # A list of associated Form assets.
    FormRest10[] forms?;
    # A list of associated Image assets.
    ImageFileRest10[] images?;
    # A list of hyperlinks contained within the content section.
    HyperlinkRest10[] hyperlinks?;
    SizeRest10 size?;
};

public type UserEnabledRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Whether or not the user's account is enabled or disabled. Set <code>{\"enabled\":true}</code> to enable a user, otherwise <code>{\"enabled\":false}</code>.
    string enabled?;
};

public type UserRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the user. This is a read-only property.
    string id?;
    # This property is not used.
    string currentStatus?;
    # The name of the user. This is a read-only property.
    string name?;
    # The description of the user. This is a read-only property.
    string description?;
    # The permissions for the user granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the user. This is a read-only property.
    string createdBy?;
    # The date and time the user was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # The login id of the user that last updated the user. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the user was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the user was last accessed, expressed in Unix time. This is a read-only property.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The user's name used to login. This is a read-only property.
    string loginName?;
    # The name of the user's company/instance. This is a read-only property.
    string company?;
    # The user's email address. This is a read-only property.
    string emailAddress?;
    UserPreferencesRest10 preferences?;
    # The user's default contact view identifier. This property is only included in a response if the user being retrieved is the same user submitting the request.
    string defaultContactViewId?;
    # The user's default account view identifier. This property is only included in a response if the user being retrieved is the same user submitting the request.
    string defaultAccountViewId?;
};

public type QueryResultCustomObjectDataRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of custom object field elements.
    CustomObjectDataRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type QueryResultOptionListRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of option list fields.
    OptionListRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type OptionRest10 record {
    # The asset's type in Eloqua. This is a read-only property. This asset is an "Option".
    string 'type?;
    # The display name for the option that is displayed within the option list.
    string displayName?;
    # The option's internal value. This value is not displayed externally.
    string value?;
};

public type ExternalActivitiesRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the external activity. This is a read-only property.
    string id?;
    # The external activity's current status.
    string currentStatus?;
    # The name of the external activity.
    string name?;
    # The description of the external activity.
    string description?;
    # The permissions for the external activity granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the external activity.
    string folderId?;
    # Id of the template used to create the external activity.
    string sourceTemplateId?;
    # The login id of the user who created the external activity.
    string createdBy?;
    # The date and time the external activity was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the external activity.
    string updatedBy?;
    # Unix timestamp for the date and time the external activity was last updated.
    string updatedAt?;
    # The date and time the external activity was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the external activity is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Id of the associated campaign. This value must correspond to a valid campaign.
    int campaignId?;
    # The name of the associated asset.
    string assetName?;
    # The type of the associated asset.
    string assetType?;
    # The activity's type.
    string activityType?;
    # The date the external activity was performed by the associated contact.
    string activityDate?;
    # The id of the contact who performed the activity. This value must correspond to a valid contact.
    int contactId?;
    # Array containing <code>type</code> and <code>id</code> values for all of the activity fields associated with a given external activity
    record {}[] fieldValues?;
};

public type QueryResultCampaignRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of campaign fields.
    CampaignRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type EloquaApiRestContractsDataVisitorsVisitorviewdatarest20 record {
    # The visitor's type in Eloqua.
    string 'type?;
    # The Id of the visitor profile.
    string visitorId?;
    # The date and time the visitor was created, expressed in Unix time.
    string createdAt?;
    # The contact record Id associated to this profile, if any.
    string contactId?;
    # The id of the visitor.
    int id?;
};

public type QueryResultLandingPageRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of landing page fields.
    LandingPageRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type EventRegistrationRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the event. This is a read-only property.
    string id?;
    # This property is not used for events.
    string currentStatus?;
    # The name of the event.
    string name?;
    # The description of the event.
    string description?;
    # This property is not used for events.
    string[] permissions?;
    # The folder id of the folder which contains the event.
    string folderId?;
    # This property is not used for events.
    string sourceTemplateId?;
    # The login id of the user who created the event. This is a read-only property.
    string createdBy?;
    # The date and time the event was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # The login id of the user that last updated the event. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the event was last updated. This is a read-only property.
    string updatedAt?;
    # This property is not used for events.
    string accessedAt?;
    # This property is not used for events.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Array consisting of event field properties.
    CustomObjectFieldRest20[] fields?;
    # Array consisting of event sessions.
    EventSessionRest20[] sessions?;
    # Array consisting of session fields within a session.
    EventSessionFieldRest20[] sessionFields?;
    # Array consisting of session fields values for a session. You must create session fields and session before creating the session field values.
    EventSessionFieldValueRest20[] sessionFieldValues?;
    # The field id that contains the Email Address. Use the desired custom object field's negative id as the value for this parameter.
    string emailAddressFieldId?;
    # The field id that contains the unique identifier. Use the desired custom object field's negative id as the value for this parameter. See example. To use an Eloqua Identifier, leave this parameter out of the request.
    string uniqueCodeFieldId?;
    # The id of the field used to organize multiple sessions. Use the desired custom object field's negative id as the value for this parameter.
    string eventGroupByFieldId?;
};

# The request body defines the details of the account sync action definition.
public type Accountsyncactionoperationindividual1 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultFormSpamSubmissionRest20 record {
    # QueryResult1FormSpamSubmission_Field_Type_Description
    string 'type?;
    # QueryResult1FormSpamSubmission_Field_Elements_Description
    FormSpamDataRest20[] elements?;
    # QueryResult1FormSpamSubmission_Field_TotalElements_Description
    int total?;
    # QueryResult1FormSpamSubmission_Field_PageSize_Description
    int pageSize?;
    # QueryResult1FormSpamSubmission_Field_PageIndex_Description
    int page?;
};

public type ContentSectionRest20 record {
    # The content section's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the content section. This is a read-only property.
    string id?;
    # The content section's current status. This is a read-only property.
    string currentStatus?;
    # The name of the content section.
    string name?;
    # The description of the content section.
    string description?;
    # The permissions for the content section granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the content section.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the content section.
    string createdBy?;
    # The date and time the content section was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the content section.
    string updatedBy?;
    # Unix timestamp for the date and time the content section was last updated.
    string updatedAt?;
    # The date and time the content section was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the content section is scheduled. This is a read-only property.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The content section's HTML content.
    string contentHtml?;
    # The content section's text content.
    string contentText?;
    # The content sections's scope: either local or global.
    string scope?;
    # A list of associated Form assets.
    FormRest20[] forms?;
    # A list of associated Image assets.
    ImageFileRest20[] images?;
    # A list of hyperlinks contained within the content section.
    HyperlinkRest20[] hyperlinks?;
    # A list of associated files.
    ImportedFileRest20[] files?;
    SizeRest20 size?;
};

public type EmailGroupRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the email group. This is a read-only property.
    string id?;
    # The email group's current status.
    string currentStatus?;
    # The name of the email group.
    string name?;
    # The description of the email group.
    string description?;
    # The permissions for the email group granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the email group.
    string createdBy?;
    # The date and time the email group was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the email group.
    string updatedBy?;
    # Unix timestamp for the date and time the email group was last updated.
    string updatedAt?;
    # The date and time the email group was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # Id of the email header.
    string emailHeaderId?;
    # Id of the email footer.
    string emailFooterId?;
    # Id of the subscription landing page.
    string subscriptionLandingPageId?;
    # Id of the unsubscribe landing page.
    string unsubscriptionLandingPageId?;
    # Whether or not the email group is visible in the public subscriptions list.
    string isVisibleInPublicSubscriptionList?;
    # Whether or not the email group is visible in the Outlook plugin.
    string isVisibleInOutlookPlugin?;
    # Array containing the unique identifiers of the emails in the email group.
    string[] emailIds?;
    # The display name of the email group.
    string displayName?;
    # Id of the subscription list.  This is a read-only property.
    string subscriptionListId?;
    # Id of the unsubscribe list.  This is a read-only property.
    string unSubscriptionListId?;
    # Id of the subscription list's data lookup.
    string subscriptionListDataLookupId?;
    # Id of the unsubscribe list's data lookup.
    string unSubscriptionListDataLookupId?;
};

public type AccountGroupRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the account group.
    string id?;
    # The account group's current status. This is a read-only property.
    string currentStatus?;
    # The account group's name.
    string name?;
    # The description of the account group.
    string description?;
    # The permissions for the account group granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the account group.
    string folderId?;
    # Id of the template used to create the account group.
    string sourceTemplateId?;
    # The login id of the user who created the account group.
    string createdBy?;
    # The date and time the account group was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the account group.
    string updatedBy?;
    # Unix timestamp for the date and time the account group was last updated.
    string updatedAt?;
    # The date and time the account group was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the account group is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The number of companies within the account group. This is a read-only property.
    string count?;
    # The account group is archived or not. This is a read-only property.
    string isArchived?;
};

public type QueryResultListRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of contact list fields.
    ContactListRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type EventSessionFieldRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the event session field. This is a read-only property.
    string id?;
    # This property is not used for event session fields.
    string currentStatus?;
    # The name of the session field within an event.
    string name?;
    # This property is not used for event session fields.
    string description?;
    # This property is not used.
    string[] permissions?;
    # This property is not used for event session fields.
    string folderId?;
    # This property is not used for event session fields.
    string sourceTemplateId?;
    # This property is not used for event session fields.
    string createdBy?;
    # This property is not used for event session fields.
    string createdAt?;
    # This property is not used for event session fields.
    string updatedBy?;
    # This property is not used for event session fields.
    string updatedAt?;
    # This property is not used for event session fields.
    string accessedAt?;
    # This property is not used for event session fields.
    string scheduledFor?;
    # This property is not used for event session fields.
    string depth?;
    # The DataType of the session field.
    string dataType?;
    FieldOutputFormatRest20 outputFormat?;
};

public type ProcessingStepConditionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The conditions for which the processing step will execute. If yes, the processing step will execute when the conditions are met. If no, the processing step will execute when the conditions are not met.
    string isConditionallyNegated?;
    # The conditional field criteria for the form processing step condition.
    FieldComparisonCriteriaRest20[] conditionalFieldCriteria?;
};

public type CloudComponentInstanceRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # The cloud content's unique identifier.
    string id?;
    # The component id of the cloud content.
    string componentId?;
    # The configuration URL for the cloud content.
    string configurationUrl?;
    # The modal size of the configuration window. Possible values are <code>large</code> or <code>small</code>.
    string configurationUrlModalSize?;
    # The image url for an image that  Eloqua will display in the editor's design surface. <code>editorImageUrl</code> is not a templated URL.
    string editorImageUrl?;
    CloudComponentRest20 height?;
    CloudComponentRest20 width?;
    # Whether or not the cloud content is configured. Possible values include: <code>None</code>, <code>Installing</code>, <code>EnableProcess</code>, <code>Error</code>, <code>Ready</code>, <code>Disabled</code>, <code>DisabledError</code>, <code>MarkedForDeletion</code>.
    string enabledConfigStatus?;
    # The status of the cloud content. Possible values include: <code>Up</code>, <code>Down</code>, and <code>Maintenance</code>.
    string appStatus?;
    # Whether user configuration is required before the cloud content can be used. If set to <code>true</code>, users will be unable to save an email or landing page asset containing the unconfigured app service instance. Eloqua will display an error message.
    string requiresConfiguration?;
};

public type RequirementRest10 record {
    string 'type?;
};

# The request body defines the details of the account sync action definition.
public type Accountsyncactionoperationindividual2 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the account sync action definition.
public type Accountsyncactionoperationindividual3 record {
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the sync action. This is a read-only property.
    string createdBy?;
    # The field name and statement that will be used to identify the account, contact, or custom object. Must contain only one field.
    # 
    # Allowed field statement values to identify a contact are: {{Contact.Field(C_EmailAddress)}}, {{Contact.Field(ContactIDExt)}}, or {{Contact.Id}}.
    # 
    # Allowed field statement values to identify an account are: {{Account.Field(CompanyIDExt)}}, {{Account.Field(M_CompanyName)}}, or {{Account.Id}}.
    # 
    # Allowed field statement values to identify a custom object are: {{CustomObject[{id}].ExternalId}}.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long.
    string identifierFieldName?;
    # Whether or not the sync is triggered upon uploading data.
    boolean isSyncTriggeredOnImport?;
    # The amount of space used in kb. This is a read-only property.
    int kbUsed?;
    # The name of the sync action definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type SecurityGroupRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the security group.
    string id?;
    # This property is not used.
    string currentStatus?;
    # The description of the security group.
    string description?;
    # The permissions for the security granted to your current instance.
    string[] permissions?;
    # Id of the associated folder.
    string folderId?;
    # This property is not used.
    string sourceTemplateId?;
    # The login id of the user who created the security group.
    string createdBy?;
    # The date and time the security group was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the security group. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the security group was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the security group was last accessed.
    string accessedAt?;
    # This property is not used.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The name of the security group.
    string name?;
    # Acronym for the security group
    string acronym?;
    # Indicates if the security group is read only.
    string isReadOnly?;
    # Indicates if the security group is effective.
    string isEffective?;
};

public type ActivityRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the activity. This is a read-only property.
    string id?;
    # Id of the contact whose activity is being returned expressed in 10 digit integer Unix time. This is a read-only property.
    string contact?;
    # The activity's type. This is a read-only property.
    string activityType?;
    # The date the activity was performed expressed in 10 digit integer Unix time. This is a read-only property.
    string activityDate?;
    # Id of the associated asset. This is a read-only property.
    string asset?;
    # Type of the associated asset. This is a read-only property.
    string assetType?;
    # An array of detail values, specific to individual activity types.
    record {}[] details?;
};

public type CrmUserNamesRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # 
    string SFDCUserName?;
    # 
    string MSDUserName?;
    # 
    string OSCUserName?;
    # 
    string SODUserName?;
};

public type ProductPermissionRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # 
    string productCode?;
};

public type SizeRest10 record {
    string 'type?;
};

public type ImportedFileRest10 record {
    # The date and time the imported file was last accessed. This is a read-only property.
    string 'type?;
    # Id of the imported file. This is a read-only property.
    string id?;
    # The imported file's current status.
    string currentStatus?;
    # Name of the imported file.
    string name?;
    # The description of the imported file.
    string description?;
    # The permissions for the imported file granted to your current instance.
    string permissions?;
    # The login id of the user who created the imported file.
    string createdBy?;
    # The date and time the imported file was last accessed, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the imported file. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the imported file was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the imported file was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The file name of the imported file.
    string fileName?;
    # The imported file's complete URL. This is a read-only property.
    string link?;
    # The imported file's tracked complete URL. This is a read-only property.
    string trackedLink?;
    # ImportedFile_Field_BrandId_Description
    string brandId?;
};

public type ProcessingStepErrorRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Processing step id during which error ocurred
    string processingStepId?;
    # Type of the processing step during which error ocurred
    string processingStepTypeId?;
    # DisplayName of the processing step including description (if configured)
    string processingStepDisplayName?;
    # Unique Error Code for current error
    int errorCode?;
    # Error message for current error code
    string errorMessage?;
    # Detailed information about current error
    string errorDescription?;
};

public type QueryResultContentSectionRest10 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of content section fields.
    ContentSectionRest10[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ContactListRest10 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact list.
    string id?;
    # The contact list's current status. This is a read-only property.
    string currentStatus?;
    # The contact list's name.
    string name?;
    # The description of the contact list.
    string description?;
    # The permissions for the contact list granted to your current instance. This is a read-only property.
    string permissions?;
    # The login id of the user who created the contact list. This is a read-only property.
    string createdBy?;
    # The date and time the contact segment was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact list.
    string updatedBy?;
    # Unix timestamp for the date and time the contact list was last updated.
    string updatedAt?;
    # The date and time the contact list was last accessed, expressed in Unix time.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact list's scope: either <code>local</code> or <code>global</code>.
    string scope?;
    # The number of contacts in the contact list. This is a read-only property.
    string count?;
    # The number of contact membership additions in the contact list.
    string[] membershipAdditions?;
    # The number of contact membership deletions in the contact list.
    string[] membershipDeletions?;
    # The contact list's data lookup Id. This is a read-only property.
    string dataLookupId?;
};

public type FormElementRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the form element. This is a read-only property.
    string id?;
    # The form element's current status.
    string currentStatus?;
    # Name of the form element.
    string name?;
    # The description of the form element.
    string description?;
    # The permissions for the form element granted to your current instance.
    string permissions?;
    # The login id of the user who created the form element.
    string createdBy?;
    # The date and time the form element was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the form element.
    string updatedBy?;
    # Unix timestamp for the date and time the form element was last updated.
    string updatedAt?;
    # The date and time the form element was last accessed.
    string accessedAt?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The form element's field instructions. Field instructions are optional instructions that help users fill in fields.
    string instructions?;
    # The asset's main layout style.
    string style?;
};

# The request body defines the details of the account export definition.
public type Accountexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event export definition.
public type Eventexportindividual1 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the account export definition.
public type Accountexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event export definition.
public type Eventexportindividual2 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the account export definition.
public type Accountexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type DynamicContentRuleRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The Dynamic Content Rule 's current status.
    string currentStatus?;
    # Id of the dynamic content rule. This is a read-only property.
    string id?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    ContentSectionRest20 contentSection?;
    # The criteria of the dynamic content rule.
    CriterionRest20[] criteria?;
    # The statement of the dynamic content rule.
    string statement?;
    # The name of the dynamic content rule.
    string name?;
};

# The request body defines the details of the activity import definition.
public type Activityimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the event export definition.
public type Eventexportindividual3 record {
    # Whether or not <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SystemTimestamps'>system timestamps</a> will be exported in UTC. See <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>Filtering tutorial</a> for an example of filtering when <code>areSystemTimestampsInUTC</code> is set to <code>true</code>.
    boolean areSystemTimestampsInUTC?;
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time exported data should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to PT12H (12 hours) if not explicitly set during export definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The filter parameter uses Eloqua Markup Language to only return certain results. Learn more about <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=BulkFiltering'>filters</a>.
    string filter?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The maximum amount of records.
    int maxRecords?;
    # The name of the export definition.
    string name?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the activity import definition.
public type Activityimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type ProgramRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # Id of the program.
    string id?;
    # The program's current status: Active, Draft, Scheduled, Paused, or Completed.
    string currentStatus?;
    # The name of the program.
    string name?;
    # The description of the program.
    string description?;
    # The permissions for the program granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the program.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the program.
    string createdBy?;
    # The date and time the program was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the program.
    string updatedBy?;
    # Unix timestamp for the date and time the program was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the program was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the program is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # A list of program elements.
    CampaignElementRest20[] elements?;
    # Whether or not the program is read only.
    string isReadOnly?;
    # The login id of the user to activate the program.
    string runAsUserId?;
    # Whether contacts are allowed to enter the program more than once. If false, once a contact enters the program, the contact cannot enter the program again from another entry point.
    string isMemberAllowedDuplicates?;
    # The program type, possible values are Contact or CustomObjectRecords.
    string defaultEntityType?;
    # The id of the custom object data set. Only used for custom object programs.
    string defaultEntityId?;
};

# The request body defines the details of the activity import definition.
public type Activityimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type CampaignRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the campaign.
    string id?;
    # The campaign's current status: <code>Active</code>, <code>Draft</code>, <code>Scheduled</code>, or <code>Completed</code>.
    string currentStatus?;
    # The name of the campaign.
    string name?;
    # The description of the campaign.
    string description?;
    # The permissions for the campaign granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the campaign.
    string folderId?;
    # Id of the template used to create the asset.
    string sourceTemplateId?;
    # The login id of the user who created the campaign.
    string createdBy?;
    # The date and time the campaign was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the campaign.
    string updatedBy?;
    # Unix timestamp for the date and time the campaign was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the campaign was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the campaign is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. 
    string depth?;
    # A list of campaign elements.
    CampaignElementRest20[] elements?;
    # Whether or not the campaign is read only.
    string isReadOnly?;
    # The login id of the user to activate the campaign.
    string runAsUserId?;
    # The date time for which the campaign will activate, expressed in Unix time.
    string startAt?;
    # The date and time the campaign will end.
    string endAt?;
    # The campaign's projected cost.
    string budgetedCost?;
    # The campaign's actual cost.
    string actualCost?;
    # Whether or not members are allowed to re-enter the campaign.
    string isMemberAllowedReEntry?;
    # Array containing <code>type</code> and <code>id</code> values for all of the contactFields associated with a given contact. For campaigns, "fieldValues" include all custom campaign fields (type, id, value).
    FieldValueRest20[] fieldValues?;
    # The campaign's type.
    string campaignType?;
    # The campaign's product value.
    string product?;
    # The campaign's region value.
    string region?;
    # The end date of the clr.
    string clrEndDate?;
    # Campaign_Field_AdCampaignId_Description
    string adCampaignId?;
    # Campaign_Field_CampaignClassification_Description
    string campaignClassification?;
    # Campaign_Field_ReferenceProduct_Description
    string referenceProduct?;
    # The id of the customer relationship management application. When sending update requests, if <code>crmId</code> is not included in the request and a <code>crmId</code> value exists, it will be blanked.
    string crmId?;
    # Whether or not the campaign is synced with a customer relationship management application.
    string isSyncedWithCRM?;
    # Whether or not the campaign is included in return on investment.
    string isIncludedInROI?;
    # The badge id of the campaign.
    string badgeId?;
    # Whether or not the campaign is an email marketing campaign.
    string isEmailMarketingCampaign?;
    # Defines whether a Campaign is simple or multi-step. The value <code>emailMarketing</code> should be used for simple campaigns, and <code>contact</code> for multi-step campaigns.
    string campaignCategory?;
    # The date and time the campaign was originally activated.
    string firstActivation?;
    # The amount of members in the campaign. This property is only returned when <code>depth</code> is set to <code>partial</code> or <code>complete</code>. This is a read-only property.
    string memberCount?;
};

# The request body defines the details of the event import definition.
public type EventImportIndividual record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the custom object import definition.
public type Customobjectimportindividual3 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

# The request body defines the details of the custom object import definition.
public type Customobjectimportindividual2 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultExternalAssetRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of external asset fields.
    ExternalAssetRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

# The request body defines the details of the custom object import definition.
public type Customobjectimportindividual1 record {
    # Time until the definition will be deleted, expressed using the ISO-8601 standard.
    string autoDeleteDuration?;
    # The date and time the entity was created, expressed using the ISO-8601 standard. This is a read-only property.
    string createdAt?;
    # The login id of the user who created the entity. This is a read-only property.
    string createdBy?;
    # The length of time that unsync'd data from this import should remain in the staging area. Bulk API 2.0 uses the ISO-8601 standard for specifying all durations. Valid values are anything from PT1H (1 hour) to P14D (2 weeks). This setting will default to P7D (7 days) if not explicitly set during import definition creation.
    string dataRetentionDuration?;
    # List of fields to be included in the operation.
    string[] fields?;
    # The import definition???s resource identification number.
    int id?;
    # The field which will be used to identify the entity. Must be a string value, at least 1 character and at most 100 characters long. The following field types are not supported: Large Text, Date, and Boolean.
    string identifierFieldName?;
    # Must reference an existing <code>/imports/priorities/{id}</code>. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string importPriorityUri?;
    # Whether or not the sync is triggered on import.
    boolean isSyncTriggeredOnImport?;
    # Whether or not imported data will be mapped to multiple existing records. For contact imports, the <code>isUpdatingMultipleMatchedRecords</code> property must be set to <code>false</code> to update <code>Contact.Field(C_EmailAddress)</code>.
    boolean isUpdatingMultipleMatchedRecords?;
    # The amount of space used in kilobytes. This is a read-only property.
    int kbUsed?;
    # Whether or not data cards will be mapped on import. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCards?;
    # Perform a case sensitive search when mapping custom object records or events to a contact or account. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    boolean mapDataCardsCaseSensitiveMatch?;
    # This field specifies which Eloqua entity field will be used for mapping. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityField?;
    # This field specifies the entity of the custom data object or event import. Allowed values are "Contact" or "Company". For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsEntityType?;
    # This field specifies the source document field that will be used for matching. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    string mapDataCardsSourceField?;
    # The name of the import definition.
    string name?;
    # Whether or not to null the identifier field.
    boolean nullIdentifierFieldName?;
    # The parent object's resource identification number.
    int parentId?;
    # Specifies operations to perform during the sync with a maximum of 10 actions. See <a href='http://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=SyncActions'>Sync actions parameters</a> for a list of sync actions. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    # 
    # There currently are not any sync actions available for Events.
    string[] syncActions?;
    # The date and time the entity was last updated, expressed using the ISO-8601 standard. This is a read-only property.
    string updatedAt?;
    # The login id of the user that last updated the entity. This is a read-only property.
    string updatedBy?;
    # The rule used when doing updates on existing data. For more information about this parameter, see the <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=ImportExportParams'>Oracle Eloqua Developer Help Center</a>.
    RuleType updateRule?;
    # Import.Import_Field_updateRuleByField_Description
    string[] updateRuleByField?;
    # System-generated unique resource identifier that defines the definition for future referencing. This is a read-only property.
    string uri?;
};

public type QueryResultCustomObjectDataRest20 record {
    # The asset's type in Eloqua. 
    string 'type?;
    # Array of custom object field elements.
    CustomObjectDataRest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type UserRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the user. This is a read-only property.
    string id?;
    # This property is not used.
    string currentStatus?;
    # The name of the user. This is a read-only property.
    string name?;
    # The description of the user.
    string description?;
    # The permissions for the user granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the user. This is a read-only property.
    string folderId?;
    # Id of template used to create the user.
    string sourceTemplateId?;
    # The login id of the user who created the user. This is a read-only property.
    string createdBy?;
    # The date and time the user was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # The login id of the user that last updated the user. This is a read-only property.
    string updatedBy?;
    # Unix timestamp for the date and time the user was last updated. This is a read-only property.
    string updatedAt?;
    # The date and time the user was last accessed, expressed in Unix time.
    string accessedAt?;
    # This parameter is not used.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>. This is a read-only property.
    string depth?;
    # The user's name used to login. This is a read-only property.
    string loginName?;
    # The user's email address.
    string emailAddress?;
    # The user's Federation Id.
    string federationId?;
    # The first name of the user.
    string firstName?;
    # The last name of the user.
    string lastName?;
    UserPreferencesRest20 preferences?;
    # A list of the user's type permissions.
    TypePermissionRest20[] typePermissions?;
    # A list of strings: the user's capabilities.
    string[] capabilities?;
    # A list of strings: beta programs the user can access.
    string[] betaAccess?;
    # The user's default contact view identifier. This property is only included in a response if the user being retrieved is the same user submitting the request.
    string defaultContactViewId?;
    # The user's default account view identifier. This property is only included in a response if the user being retrieved is the same user submitting the request.
    string defaultAccountViewId?;
    # The user's security groups.
    SecurityGroupRest20[] securityGroups?;
    # A list of the user's interface permissions.
    InterfacePermissionRest20[] interfacePermissions?;
    # A list of the user's product permissions.
    ProductPermissionRest20[] productPermissions?;
    # This parameter is not used.
    string isUsingBrightenTemplate?;
    # This parameter is not used.
    string[] shortcuts?;
    # Indicates if the user is deleted.
    string isDeleted?;
    # Indicates if the user is disabled.
    string isDisabled?;
    # Job title of the user.
    string jobTitle?;
    # Name of the user's company to be displayed.
    string companyDisplayName?;
    # URL of the user's company.
    string companyUrl?;
    # Phone number of the user.
    string phone?;
    # User's identifier in default CRM.
    string crmUsername?;
    CrmUserNamesRest20 crmUserNames?;
    # Indicates if user's password can expire.
    string passwordExpires?;
    # Indicates if "User Welcome" email would be sent to user upon user creation.
    string sendWelcomeEmail?;
    # Mobile phone number of the user.
    string cellPhone?;
    # User's address line 1.
    string address1?;
    # User's address line 2.
    string address2?;
    # User's email address used as "reply to" address.
    string replyToAddress?;
    # Name of the user's department.
    string department?;
    # Fax number of the user.
    string fax?;
    # User's personal URL.
    string personalUrl?;
    # User's personal message.
    string personalMessage?;
    # Indicates if the user can only login using Single Sign On.
    string ssoOnly?;
    # Internal id of user's digital signature.
    string digitalSignatureId?;
    # Internal id of user's personal photo.
    string personalPhotoId?;
    # The name of the user's city.
    string city?;
    # The name of the user's state or province.
    string state?;
    # The name of the user's country.
    string country?;
    # User's ZIP or postal code.
    string zipCode?;
    # User's "Sender Email Address"
    string senderEmailAddress?;
    # User's "Sender Display Name"
    string senderDisplayName?;
};

public type QueryResultVisitorViewDataRest20 record {
    # The asset's type in Eloqua.
    string 'type?;
    # Array of visitor data.
    EloquaApiRestContractsDataVisitorsVisitorviewdatarest20[] elements?;
    # The total amount of results.
    int total?;
    # The page size.
    int pageSize?;
    # The specified page.
    int page?;
};

public type ImportedFileRest20 record {
    # The date and time the imported file was last accessed. This is a read-only property.
    string 'type?;
    # Id of the imported file. This is a read-only property.
    string id?;
    # The imported file's current status.
    string currentStatus?;
    # Name of the imported file.
    string name?;
    # The description of the imported file.
    string description?;
    # The permissions for the imported file granted to your current instance.
    string[] permissions?;
    # Id of the folder. This is a read-only property.
    string folderId?;
    # Id of the source template. This is a read-only property.
    string sourceTemplateId?;
    # The login id of the user who created the imported file.
    string createdBy?;
    # The date and time the imported file was last accessed, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the imported file.
    string updatedBy?;
    # Unix timestamp for the date and time the imported file was last updated.
    string updatedAt?;
    # The date and time the imported file was last accessed.
    string accessedAt?;
    # The date and time the file is scheduled for. This is a read-only property.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The file name of the imported file.
    string fileName?;
    # The imported file's complete URL. This is a read-only property.
    string link?;
    # The imported file's tracked complete URL. This is a read-only property.
    string trackedLink?;
    # The imported file's redirect URL. This is a read-only property.
    string redirectLink?;
    # ImportedFile_Field_BrandId_Description
    string brandId?;
};

public type ContactListRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the contact list.
    string id?;
    # The contact list's current status. This is a read-only property.
    string currentStatus?;
    # The contact list's name.
    string name?;
    # The description of the contact list.
    string description?;
    # The permissions for the contact list granted to your current instance. This is a read-only property.
    string[] permissions?;
    # The folder id of the folder which contains the contact list.
    string folderId?;
    # Id of the template used to create the contact list.
    string sourceTemplateId?;
    # The login id of the user who created the contact list.
    string createdBy?;
    # The date and time the contact segment was created, expressed in Unix time.
    string createdAt?;
    # The login id of the user that last updated the contact list.
    string updatedBy?;
    # Unix timestamp for the date and time the contact list was last updated.
    string updatedAt?;
    # The date and time the contact list was last accessed, expressed in Unix time.
    string accessedAt?;
    # The date the contact list is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    # The contact list's scope: either local or global.
    string scope?;
    # The number of contacts in the contact list. This is a read-only property.
    string count?;
    # The number of contact membership additions in the contact list.
    string[] membershipAdditions?;
    # The number of contact membership deletions in the contact list.
    string[] membershipDeletions?;
    # The contact list's data lookup Id. This is a read-only property.
    string dataLookupId?;
};

public type FormElementRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The ID of the form element. This is a read-only property.
    string id?;
    # The form element's current status.
    string currentStatus?;
    # Name of the form element.
    string name?;
    # The description of the form element.
    string description?;
    # The permissions for the form element granted to your current instance.
    string[] permissions?;
    # The ID of the associated folder.
    string folderId?;
    # The ID of the form element.
    string sourceTemplateId?;
    # The login ID of the user who created the form element.
    string createdBy?;
    # The date and time the form element was created, expressed in Unix time.
    string createdAt?;
    # The login ID of the user that last updated the form element.
    string updatedBy?;
    # Unix timestamp for the date and time the form element was last updated.
    string updatedAt?;
    # The date and time the form element was last accessed.
    string accessedAt?;
    # The date the form element is scheduled.
    string scheduledFor?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth' target='_blank'>Request depth</a>.
    string depth?;
    # The form element's field instructions. Field instructions are optional instructions that help users fill in fields.
    string instructions?;
    # The asset's main layout style.
    string style?;
};

public type FieldOutputFormatRest20 record {
    string 'type?;
    string currentStatus?;
    string id?;
    string format?;
    string dataType?;
};

public type DynamicContentRuleRest10 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
    # The Dynamic Content Rule 's current status.
    string currentStatus?;
    # Id of the dynamic content rule. This is a read-only property.
    string id?;
    # Level of detail returned by the request. Eloqua APIs can retrieve entities at three different levels of depth: <code>minimal</code>, <code>partial</code>, and <code>complete</code>. Any other values passed are reset to <code>complete</code> by default. For more information, see <a href='https://docs.oracle.com/cloud/latest/marketingcs_gs/OMCAB/index.html#CSHID=RequestDepth'>Request depth</a>.
    string depth?;
    ContentSectionRest10 contentSection?;
    # The criteria of the dynamic content rule.
    CriterionRest10[] criteria?;
    # The statement of the dynamic content rule.
    string statement?;
};

public type TypePermissionsRest20 record {
    # The asset's type in Eloqua. This is a read-only property.
    string 'type?;
};

public type EventRegistrationDataRest20 record {
    # The asset's type in Eloqua. This is a read-only property. 
    string 'type?;
    # Id of the event registrant. This is a read-only property.
    string id?;
    # This property is not used for event registrants.
    string currentStatus?;
    # The name of the event registrant. This is a read-only property.
    string name?;
    # This property is not used for event registrants.
    string description?;
    # This property is not used for event registrants.
    string[] permissions?;
    # This property is not used for event registrants.
    string folderId?;
    # This property is not used for event registrants.
    string sourceTemplateId?;
    # This property is not used for event registrants.
    string createdBy?;
    # The date and time the event registrant was created, expressed in Unix time. This is a read-only property.
    string createdAt?;
    # This property is not used for event registrants.
    string updatedBy?;
    # Unix timestamp for the date and time the event registrant was last updated. This is a read-only property.
    string updatedAt?;
    # This property is not used for event registrants.
    string accessedAt?;
    # This property is not used for event registrants.
    string scheduledFor?;
    # This property is not used for event registrants.
    string depth?;
    # The contact record Id associated to this event registrant. Use the desired contact's id as the value for this parameter.
    string contactId?;
    # The account record Id associated to this event registrant. This is a read-only property.
    string accountId?;
    # The unique value associated to the event registrant. This is a read-only property.
    string uniqueCode?;
    # The status of the event registrant. Only returned when creating or updating an event registrant. This is a read-only property.
    string customObjectRecordStatus?;
    # Array containing <code>type</code>, <code>id</code>, and <code>value</code> for all of the fields associated with a given event registrant.
    FieldValueRest20[] fieldValues?;
    # Whether or not the event registrant is mapped to a contact or account. This is a read-only property.
    string isMapped?;
};
