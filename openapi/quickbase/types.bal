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

public type InlineResponse200Arr InlineResponse200[];

public type InlineResponse2001Arr InlineResponse2001[];

public type InlineResponse2002Arr InlineResponse2002[];

public type InlineResponse2003Arr InlineResponse2003[];

public type InlineResponse2004Arr InlineResponse2004[];

# Basic information about the field.
public type FieldsusageField record {
    # Field name.
    string name;
    # Field id.
    int id;
    # Field type.
    string 'type;
};

public type TableidRelationshipBody record {
    # Array of summary field objects which will turn into summary fields in the parent table. When you specify the 'COUNT' accumulation type, you have to specify 0 as the summaryFid (or not set it in the request). 'DISTINCT-COUNT' requires that summaryFid be set to an actual fid.
    TablestableidrelationshipSummaryfields[] summaryFields?;
    # Array of field ids in the parent table that will become lookup fields in the child table.
    int[] lookupFieldIds?;
    # The parent table id for the relationship.
    string parentTableId;
    # This property is optional.  If it is not provided, the foreign key field will be created with the label ‘Related <record>’, where <record> is the name of a record in the parent table.
    TablestableidrelationshipForeignkeyfield foreignKeyField?;
};

# Additional properties for the field. Please see [Field type details](../fieldInfo) page for more details on the properties for each field type.
public type FieldsProperties record {
    # The comments entered on the field properties by an administrator.
    string comments?;
    # Whether this field totals in reports within the product.
    boolean doesTotal?;
    # Whether the link field will auto save.
    boolean autoSave?;
    # Default user id value.
    int defaultValueLuid?;
    # The maximum number of versions configured for a file attachment.
    int maxVersions?;
    # Whether the field should carry its multiple choice fields when copied.
    boolean carryChoices?;
    # The format to display time.
    int format?;
    # The maximum number of characters allowed for entry in Quickbase for this field.
    int maxLength?;
    # The configured text value that replaces the URL that users see within the product.
    string linkText?;
    # The id of the parent composite field, when applicable.
    int parentFieldId?;
    # Indicates whether to display the timezone within the product.
    boolean displayTimezone?;
    # The id of the field that is used to aggregate values from the child, when applicable. This displays 0 if the summary function doesn’t require a field selection (like count).
    int summaryTargetFieldId?;
    # Indicates if users can add new choices to a selection list.
    boolean allowNewChoices?;
    # The id of the field that is the reference in the relationship.
    int masterChoiceFieldId?;
    # Indicates if the field value is defaulted today for new records.
    boolean defaultToday?;
    # The units label.
    string units?;
    # The id of the field that is the target on the master table for this lookup.
    int lookupTargetFieldId?;
    # The summary accumulation function type.
    string summaryFunction?;
    # The id of the source field.
    int sourceFieldId?;
    # The table alias for the master table in the relationship this field is part of.
    string masterTableTag?;
    # Whether this field averages in reports within the product.
    boolean doesAverage?;
    # The formula of the field as configured in Quickbase.
    string formula?;
    # The number of decimal places displayed in the product for this field.
    int decimalPlaces?;
    # Indicates if the user can see other versions, aside from the most recent, of a file attachment within the product.
    boolean seeVersions?;
    # How to display months.
    string displayMonth?;
    # The number of lines shown in Quickbase for this text field.
    int numLines?;
    # How the email is displayed.
    string displayEmail?;
    # The user default type.
    string defaultKind?;
    # An alternate user friendly text that can be used to display a link in the browser.
    string coverText?;
    # The current symbol used when displaying field values within the product.
    string currencySymbol?;
    # The id of the table that is the master in this relationship.
    int masterChoiceTableId?;
    # The id of the target field.
    int targetFieldId?;
    # The configured option for how users display within the product.
    string displayUser?;
    # Whether a blank value is treated the same as 0 in calculations within the product.
    boolean blankIsZero?;
    # Whether an exact match is required for a report link.
    boolean exact?;
    # The start field id.
    int startField?;
    # Default email domain.
    string defaultDomain?;
    # The default value configured for a field when a new record is added.
    string defaultValue?;
    # List of user choices.
    string[] choicesLuid?;
    # Don't show the URL protocol when showing the URL.
    boolean abbreviate?;
    # The field's xml tag.
    string xmlTag?;
    # The field's target table name.
    string targetTableName?;
    # The format used for displaying numeric values in the product (decimal, separators, digit group).
    int numberFormat?;
    # The link text, if empty, the url will be used as link text.
    string appearsAs?;
    # The field's html input width in the product.
    int width?;
    # The currency format used when displaying field values within the product.
    string currencyFormat?;
    # Indicates whether images will display for file attachments on forms and reports within the product.
    boolean displayImages?;
    # Indicates if the field is a foreign key (or reference field) in a relationship.
    boolean foreignKey?;
    # Indicates whether to display the day of the week within the product.
    boolean displayDayOfWeek?;
    # The id of the field that is the reference in the relationship for this summary.
    int summaryReferenceFieldId?;
    # The number of digits before commas display in the product, when applicable.
    int commaStart?;
    # An array of entries that exist for a field that offers choices to the user.
    string[] choices?;
    # The id of the target table.
    string targetTableId?;
    # Whether to display time as relative.
    boolean displayRelative?;
    # An array of the fields that make up a composite field (e.g., address).
    string[] compositeFields?;
    # Version modes for files. Keep all versions vs keep last version.
    string versionMode?;
    # Indicates whether to display the time, in addition to the date.
    boolean displayTime?;
    # The duration field id.
    int durationField?;
    # The id of the field that is used to snapshot values from, when applicable.
    int snapFieldId?;
    # Indicates whether or not to display time in the 24-hour format within the product.
    boolean hours24?;
    # Whether to sort alphabetically, default sort is by record ID.
    boolean sortAlpha?;
    # Indicates if the listed entries sort as entered vs alphabetically.
    boolean sortAsGiven?;
    # Whether this field has a phone extension.
    boolean hasExtension?;
    # The work week type.
    int workWeek?;
    # Indicates if the URL should open a new window when a user clicks it within the product.
    boolean useNewWindow?;
    # Whether this field is append only.
    boolean appendOnly?;
    # Indicates if a field that is part of the relationship should be shown as a hyperlink to the parent record within the product.
    boolean displayAsLink?;
    # Whether this field allows html.
    boolean allowHTML?;
    # The id of the field that is the reference in the relationship for this lookup.
    int lookupReferenceFieldId?;
};

public type RelationshipRelationshipidBody record {
    # An array of objects, each representing a configuration of one field from the child table, that will become summary fields on the parent table. When you specify the 'COUNT' accumulation type, you have to specify 0 as the summaryFid (or not set it in the request). 'DISTINCT-COUNT' requires that summaryFid be set to an actual fid.
    TablestableidrelationshipSummaryfields[] summaryFields?;
    # An array of field ids on the parent table that will become lookup fields on the child table.
    int[] lookupFieldIds?;
};

public type InlineResponse200 record {
    # Indication of whether current event is active.
    boolean isActive?;
    # Type of an event.
    string 'type?;
    # The name of the event. This property is not returned for automations.
    string name?;
    # The url to automation that can be accessed from the browser. Only returned for automations.
    string url?;
    # The user that owns the event.
    AppsappideventsOwner owner?;
    # The unique identifier of the table to which event belongs to.
    string tableId?;
};

# The number of webhooks where the given field is referenced.
public type FieldsusageUsageWebhooks record {
    # the number of times a field has been used for the given item.
    int count;
};

public type FieldsPermissions record {
    # The role associated with a given permission for the field
    string role?;
    # The permission given to the role for this field
    string permissionType?;
    # The Id of the given role
    int roleId?;
};

# The configuration properties for performing the app copy
public type AppsappidcopyProperties record {
    # Whether to add the user token used to make this request to the new app
    boolean assignUserToken?;
    # If keepData is true, whether to copy the file attachments as well. If keepData is false, this property is ignored
    boolean excludeFiles?;
    # Whether to copy the app's data along with the schema
    boolean keepData?;
    # If true, users will be copied along with their assigned roles. If false, users and roles will be copied but roles will not be assigned
    boolean usersAndRoles?;
};

# The number of relationships where the given field is referenced.
public type FieldsusageUsageRelationships record {
    # the number of times a field has been used for the given item.
    int count;
};

# If grouping or sorting is not set, records will not be sorted.
public type RecordsQueryBody record {
    # Additional query options.
    RecordsqueryOptions options?;
    # The filter, using the Quickbase query language, which determines the records to return. If this parameter is omitted, the query will return all records.
    string 'where?;
    # An array that contains the fields to group the records by.
    RecordsqueryGroupby[] groupBy?;
    # By default, queries will be sorted by the given sort fields or the default sort if the query does not provide any. Set to false to avoid sorting when the order of the data returned is not important. Returning data without sorting can improve performance.
    record {} sortBy?;
    # An array of field ids for the fields that should be returned in the response. If empty, the default columns on the table will be returned.
    string[] 'select?;
    # The table identifier.
    @constraint:String {minLength: 1}
    string 'from;
};

# Additional query options.
public type RecordsqueryOptions record {
    # The number of records to skip.
    int skip?;
    # Whether to run the query against a date time field with respect to the application's local time. The query is run with UTC time by default.
    boolean compareWithAppLocalTime?;
    # The maximum number of records to display.
    int top?;
};

# The number of forms where the given field is referenced.
public type FieldsusageUsageForms record {
    # the number of times a field has been used for the given item.
    int count;
};

# The number of default reports where the given field is referenced.
public type FieldsusageUsageDefaultreports record {
    # the number of times a field has been used for the given item.
    int count;
};

# Usage Information about the field.
public type FieldsusageUsage record {
    # The number of default reports where the given field is referenced.
    FieldsusageUsageDefaultreports defaultReports;
    # The number of notifications where the given field is referenced.
    FieldsusageUsageNotifications notifications;
    # The number of reminders where the given field is referenced.
    FieldsusageUsageReminders reminders;
    # The number of forms where the given field is referenced.
    FieldsusageUsageForms forms;
    # The number of quickbase actions where the given field is referenced.
    FieldsusageUsageActions actions;
    # The number of personal reports where the given field is referenced.
    FieldsusageUsagePersonalreports personalReports;
    # The number of roles where the given field is referenced.
    FieldsusageUsageRoles roles;
    # The number of reports where the given field is referenced.
    FieldsusageUsageReports reports;
    # The number of fields where the given field is referenced.
    FieldsusageUsageFields fields;
    # The number of relationships where the given field is referenced.
    FieldsusageUsageRelationships relationships;
    # The number of webhooks where the given field is referenced.
    FieldsusageUsageWebhooks webhooks;
    # The number of app home pages where the given field is referenced.
    FieldsusageUsageApphomepages appHomePages;
    # The number of exact forms where the given field is referenced.
    FieldsusageUsageExactforms exactForms;
};

# The number of notifications where the given field is referenced.
public type FieldsusageUsageNotifications record {
    # the number of times a field has been used for the given item.
    int count;
};

public type AppsVariables record {
    # The name for the variable.
    string name;
    # The value for the variable.
    string value;
};

public type ReportsQueryFormulafields record {
    # Formula field identifier.
    int id?;
    # Formula field label.
    string label?;
    # Resulting formula value type.
    string fieldType?;
    # Formula text.
    string formula?;
    # For numeric formula the number precision.
    int decimalPrecision?;
};

public type RecordsBody record {
    # The table identifier.
    @constraint:String {minLength: 1}
    string to;
    # Record data array.
    string[] data?;
    # The merge field id.
    int mergeFieldId?;
    # Specify an array of field ids that will return data for any updates or added record. Record ID (FID 3) is always returned if any field ID is requested.
    int[] fieldsToReturn?;
};

# The user that owns the event.
public type AppsappideventsOwner record {
    # User full name.
    string name?;
    # User Id.
    string id?;
    # User email.
    string email?;
    # User Name as updated in user properties. Optional, appears if not the same as user email.
    string userName?;
};

# The query definition as configured in Quickbase that gets executed when the report is run.
public type ReportsQuery record {
    # The table identifier for the report.
    string tableId?;
    # Filter used to query for data.
    string filter?;
    # Calculated formula fields.
    ReportsQueryFormulafields[] formulaFields?;
};

# The number of quickbase actions where the given field is referenced.
public type FieldsusageUsageActions record {
    # the number of times a field has been used for the given item.
    int count;
};

# The number of personal reports where the given field is referenced.
public type FieldsusageUsagePersonalreports record {
    # the number of times a field has been used for the given item.
    int count;
};

# This property is optional.  If it is not provided, the foreign key field will be created with the label ‘Related <record>’, where <record> is the name of a record in the parent table.
public type TablestableidrelationshipForeignkeyfield record {
    # The label for the foreign key field.
    string label?;
};

public type RecordsqueryGroupby record {
    # The unique identifier of a field in a table.
    int fieldId?;
    # Group by based on ascending order (ASC), descending order (DESC) or equal values (equal-values)
    string grouping?;
};

# The number of reports where the given field is referenced.
public type FieldsusageUsageReports record {
    # the number of times a field has been used for the given item.
    int count;
};

# The number of app home pages where the given field is referenced.
public type FieldsusageUsageApphomepages record {
    # the number of times a field has been used for the given item.
    int count;
};

# The following example will execute a Sum() for '20' and the value in a record with id 1 for the field with label 'NumericField'. Since this API is able to run any type of formula, all results will be returned as a string.
public type FormulaRunBody record {
    # The formula to run. This must be a valid Quickbase formula.
    string formula;
    # The record ID to run the formula against. Only necessary for formulas that are run in the context of a record. For example, the formula User() does not need a record ID.
    int rid?;
    # The unique identifier (dbid) of the table.
    string 'from;
};

# The number of roles where the given field is referenced.
public type FieldsusageUsageRoles record {
    # the number of times a field has been used for the given item.
    int count;
};

# The example below shows all the properties that can be changed with this request. Additional properties that you can see with the corresponding GET request cannot be set through this API.
public type TablesTableidBody record {
    # The name for the table.
    string name?;
    # The plural noun for records in the table. If this value is not passed the default value is 'Records'.
    string pluralRecordName?;
    # The singular noun for records in the table. If this value is not passed the default value is 'Record'.
    string singleRecordName?;
    # The description for the table. If this value is not passed the default value is blank.
    string description?;
};

# The number of reminders where the given field is referenced.
public type FieldsusageUsageReminders record {
    # the number of times a field has been used for the given item.
    int count;
};

# The number of fields where the given field is referenced.
public type FieldsusageUsageFields record {
    # the number of times a field has been used for the given item.
    int count;
};

public type UsertokenCloneBody record {
    # The new name for the cloned user token.
    string name?;
    # The description for the cloned user token.
    string description?;
};

# Specific field properties.
public type FieldsfieldidProperties record {
    # The comments entered on the field properties by an administrator.
    string comments?;
    # Whether this field totals in reports within the product.
    boolean doesTotal?;
    # Whether the link field will auto save.
    boolean autoSave?;
    # Default user id value.
    int defaultValueLuid?;
    # The maximum number of versions configured for a file attachment.
    @constraint:Int {minValue: 1}
    int maxVersions?;
    # The format to display time.
    int format?;
    # Whether the field should carry its multiple choice fields when copied.
    boolean carryChoices?;
    # The maximum number of characters allowed for entry in Quickbase for this field.
    int maxLength?;
    # The configured text value that replaces the URL that users see within the product.
    string linkText?;
    # The id of the parent composite field, when applicable.
    int parentFieldId?;
    # Indicates whether to display the timezone within the product.
    boolean displayTimezone?;
    # The id of the field that is used to aggregate values from the child, when applicable. This displays 0 if the summary function doesn’t require a field selection (like count).
    int summaryTargetFieldId?;
    # Indicates if users can add new choices to a selection list.
    boolean allowNewChoices?;
    # Indicates if the field value is defaulted today for new records.
    boolean defaultToday?;
    # The units label.
    string units?;
    # The id of the field that is the target on the parent table for this lookup.
    int lookupTargetFieldId?;
    # The accumulation type for the summary field.
    string summaryFunction?;
    # The id of the source field.
    int sourceFieldId?;
    # Whether this field averages in reports within the product.
    boolean doesAverage?;
    # The formula of the field as configured in Quickbase.
    string formula?;
    # The number of decimal places displayed in the product for this field.
    int decimalPlaces?;
    # How to display months.
    string displayMonth?;
    # Indicates if the user can see other versions, aside from the most recent, of a file attachment within the product.
    boolean seeVersions?;
    # The number of lines shown in Quickbase for this text field.
    int numLines?;
    # The user default type.
    string defaultKind?;
    # How the email is displayed.
    string displayEmail?;
    # An alternate user friendly text that can be used to display a link in the browser.
    string coverText?;
    # The current symbol used when displaying field values within the product.
    string currencySymbol?;
    # The summary query.
    string summaryQuery?;
    # The id of the target field.
    int targetFieldId?;
    # The configured option for how users display within the product.
    string displayUser?;
    # Whether a blank value is treated the same as 0 in calculations within the product.
    boolean blankIsZero?;
    # Whether an exact match is required for a report link.
    boolean exact?;
    # Default email domain.
    string defaultDomain?;
    # The default value configured for a field when a new record is added.
    string defaultValue?;
    # Don't show the URL protocol when showing the URL.
    boolean abbreviate?;
    # The format used for displaying numeric values in the product (decimal, separators, digit group).
    int numberFormat?;
    # The field's target table name.
    string targetTableName?;
    # The link text, if empty, the url will be used as link text.
    string appearsAs?;
    # The field's html input width in the product.
    int width?;
    # The currency format used when displaying field values within the product.
    string currencyFormat?;
    # Indicates whether images will display for file attachments on forms and reports within the product.
    boolean displayImages?;
    # Indicates whether to display the day of the week within the product.
    boolean displayDayOfWeek?;
    # The id of the field that is the reference in the relationship for this summary.
    int summaryReferenceFieldId?;
    # The number of digits before commas display in the product, when applicable.
    int commaStart?;
    # An array of entries that exist for a field that offers choices to the user. Note that these choices refer to the valid values of any records added in the future. You are allowed to remove values from the list of choices even if there are existing records with those values in this field. They will be displayed in red when users look at the data in the browser but there is no other effect. While updating a field with this property, the old choices are removed and replaced by the new choices.
    string[] choices?;
    # The id of the target table.
    string targetTableId?;
    # Whether to display time as relative.
    boolean displayRelative?;
    # An array of the fields that make up a composite field (e.g., address).
    string[] compositeFields?;
    # The table the summary field references fields from.
    string summaryTableId?;
    # Indicates whether to display the time, in addition to the date.
    boolean displayTime?;
    # Version modes for files. Keep all versions vs keep last version.
    string versionMode?;
    # The id of the field that is used to snapshot values from, when applicable.
    int snapFieldId?;
    # Indicates whether or not to display time in the 24-hour format within the product.
    boolean hours24?;
    # Whether to sort alphabetically, default sort is by record ID.
    boolean sortAlpha?;
    # Indicates if the listed entries sort as entered vs alphabetically.
    boolean sortAsGiven?;
    # Whether this field has a phone extension.
    boolean hasExtension?;
    # Indicates if the URL should open a new window when a user clicks it within the product.
    boolean useNewWindow?;
    # Whether this field is append only.
    boolean appendOnly?;
    # Indicates if a field that is part of the relationship should be shown as a hyperlink to the parent record within the product.
    boolean displayAsLink?;
    # The id of the field that is the reference in the relationship for this lookup.
    int lookupReferenceFieldId?;
};

# The example below shows all the properties that can be changed with this request. Additional properties that you can see with the corresponding GET request cannot be set through this API.
public type FieldsBody record {
    # Indicates if the field is being tracked as part of Quickbase Audit Logs. You can only set this property to "true" if the app has audit logs enabled. See Enable data change logs under [Quickbase Audit Logs](https://help.quickbase.com/user-assistance/audit_logs.html).
    boolean audited?;
    # The configured help text shown to users within the product.
    string fieldHelp?;
    # Indicates if the field is configured to display in bold in the product.
    boolean bold?;
    # Specific field properties.
    FieldsProperties1 properties?;
    # Indicates if the field is marked as a default in reports.
    boolean appearsByDefault?;
    # The [field types](https://help.quickbase.com/user-assistance/field_types.html), click on any of the field type links for more info.
    string fieldType;
    # Field Permissions for different roles.
    FieldsPermissions[] permissions?;
    # Whether the field you are adding should appear on forms.
    boolean addToForms?;
    # The label (name) of the field.
    string label;
    # Indicates if the field is marked as searchable.
    boolean findEnabled?;
    # Indicates if the field is configured to not wrap when displayed in the product.
    boolean noWrap?;
};

public type TablestableidrelationshipSummaryfields record {
    # The field id to summarize.
    decimal summaryFid?;
    # The label for the summary field.
    string label?;
    # The accumulation type for the summary field.
    string accumulationType;
    # The filter, using the Quickbase query language, which determines the records to return.
    string 'where?;
};

# The example below shows all the properties that can be set with this request. Additional properties that you can see, with the corresponding GET request, cannot be set through this API. See individual property descriptions below for details on how to set or change each.
public type AppsBody record {
    # Set to true if you would like to assign the app to the user token you used to create the application. The default is false.
    boolean assignToken?;
    # The app variables. See [About Application Variables](https://help.quickbase.com/user-assistance/variables.html)
    AppsVariables[] variables?;
    # The app name. You are allowed to create multiple apps with the same name, in the same realm, because they will have different dbid values. We urge you to be careful about doing this.
    string name;
    # The description for the app. If this property is left out, the app description will be blank.
    string description?;
};

# The example below shows all the properties that can be changed with this request. Additional properties that you can see with the corresponding GET request cannot be set through this API.
public type TablesBody record {
    # The name for the table.
    @constraint:String {minLength: 1}
    string name;
    # The plural noun for records in the table. If this value is not passed the default value is 'Records'.
    string pluralRecordName?;
    # The singular noun for records in the table. If this value is not passed the default value is 'Record'.
    string singleRecordName?;
    # The description for the table. If this value is not passed the default value is blank.
    string description?;
};

# The number of exact forms where the given field is referenced.
public type FieldsusageUsageExactforms record {
    # the number of times a field has been used for the given item.
    int count;
};

# The example below shows all the properties that can be changed with this request. Additional properties that you can see with the corresponding GET request cannot be set through this API.
public type FieldsFieldidBody record {
    # Indicates if the field is being tracked as part of Quickbase Audit Logs. You can only set this property to "true" if the app has audit logs enabled. See Enable data change logs under [Quickbase Audit Logs](https://help.quickbase.com/user-assistance/audit_logs.html).
    boolean audited?;
    # The configured help text shown to users within the product.
    string fieldHelp?;
    # Indicates if the field is configured to display in bold in the product.
    boolean bold?;
    # Indicates if the field is required (i.e. if every record must have a non-null value in this field). If you attempt to change a field from not-required to required, and the table currently contains records that have null values in that field, you will get an error indicating that there are null values of the field. In this case you need to find and update those records with null values of the field before changing the field to required.
    boolean required?;
    # Specific field properties.
    FieldsfieldidProperties properties?;
    # Indicates if the field is marked as a default in reports.
    boolean appearsByDefault?;
    # Indicates if every record in the table must contain a unique value of this field. If you attempt to change a field from not-unique to unique, and the table currently contains records with the same value of this field, you will get an error. In this case you need to find and update those records with duplicate values of the field before changing the field to unique.
    boolean unique?;
    # Field Permissions for different roles.
    FieldsPermissions[] permissions?;
    # Whether the field you are adding should appear on forms.
    boolean addToForms?;
    # The label (name) of the field.
    string label?;
    # Indicates if the field is marked as searchable.
    boolean findEnabled?;
    # Indicates if the field is configured to not wrap when displayed in the product.
    boolean noWrap?;
};

# Specific field properties.
public type FieldsProperties1 record {
    # The comments entered on the field properties by an administrator.
    string comments?;
    # Whether this field totals in reports within the product.
    boolean doesTotal?;
    # Whether the link field will auto save.
    boolean autoSave?;
    # Default user id value.
    int defaultValueLuid?;
    # The maximum number of versions configured for a file attachment.
    @constraint:Int {minValue: 1}
    int maxVersions?;
    # The format to display time.
    int format?;
    # Whether the field should carry its multiple choice fields when copied.
    boolean carryChoices?;
    # The maximum number of characters allowed for entry in Quickbase for this field.
    int maxLength?;
    # The configured text value that replaces the URL that users see within the product.
    string linkText?;
    # The id of the parent composite field, when applicable.
    int parentFieldId?;
    # Indicates whether to display the timezone within the product.
    boolean displayTimezone?;
    # Indicates if users can add new choices to a selection list.
    boolean allowNewChoices?;
    # Indicates if the field value is defaulted today for new records.
    boolean defaultToday?;
    # The units label.
    string units?;
    # The id of the source field.
    int sourceFieldId?;
    # Whether this field averages in reports within the product.
    boolean doesAverage?;
    # The formula of the field as configured in Quickbase.
    string formula?;
    # The number of decimal places displayed in the product for this field.
    int decimalPlaces?;
    # How to display months.
    string displayMonth?;
    # Indicates if the user can see other versions, aside from the most recent, of a file attachment within the product.
    boolean seeVersions?;
    # The number of lines shown in Quickbase for this text field.
    int numLines?;
    # The user default type.
    string defaultKind?;
    # How the email is displayed.
    string displayEmail?;
    # An alternate user friendly text that can be used to display a link in the browser.
    string coverText?;
    # The current symbol used when displaying field values within the product.
    string currencySymbol?;
    # The id of the target field.
    int targetFieldId?;
    # The configured option for how users display within the product.
    string displayUser?;
    # Whether a blank value is treated the same as 0 in calculations within the product.
    boolean blankIsZero?;
    # Whether an exact match is required for a report link.
    boolean exact?;
    # Default email domain.
    string defaultDomain?;
    # The default value configured for a field when a new record is added.
    string defaultValue?;
    # Don't show the URL protocol when showing the URL.
    boolean abbreviate?;
    # The format used for displaying numeric values in the product (decimal, separators, digit group).
    int numberFormat?;
    # The field's target table name.
    string targetTableName?;
    # The link text, if empty, the url will be used as link text.
    string appearsAs?;
    # The field's html input width in the product.
    int width?;
    # The currency format used when displaying field values within the product.
    string currencyFormat?;
    # Indicates whether images will display for file attachments on forms and reports within the product.
    boolean displayImages?;
    # Indicates whether to display the day of the week within the product.
    boolean displayDayOfWeek?;
    # The number of digits before commas display in the product, when applicable.
    int commaStart?;
    # An array of entries that exist for a field that offers choices to the user. Note that these choices refer to the valid values of any records added in the future. You are allowed to remove values from the list of choices even if there are existing records with those values in this field. They will be displayed in red when users look at the data in the browser but there is no other effect. While updating a field with this property, the old choices are removed and replaced by the new choices.
    string[] choices?;
    # The id of the target table.
    string targetTableId?;
    # Whether to display time as relative.
    boolean displayRelative?;
    # An array of the fields that make up a composite field (e.g., address).
    string[] compositeFields?;
    # Indicates whether to display the time, in addition to the date.
    boolean displayTime?;
    # Version modes for files. Keep all versions vs keep last version.
    string versionMode?;
    # The id of the field that is used to snapshot values from, when applicable.
    int snapFieldId?;
    # Indicates whether or not to display time in the 24-hour format within the product.
    boolean hours24?;
    # Whether to sort alphabetically, default sort is by record ID.
    boolean sortAlpha?;
    # Indicates if the listed entries sort as entered vs alphabetically.
    boolean sortAsGiven?;
    # Whether this field has a phone extension.
    boolean hasExtension?;
    # Indicates if the URL should open a new window when a user clicks it within the product.
    boolean useNewWindow?;
    # Whether this field is append only.
    boolean appendOnly?;
    # Indicates if a field that is part of the relationship should be shown as a hyperlink to the parent record within the product.
    boolean displayAsLink?;
};

# The example below shows all the properties that can be changed with this request. Additional properties that you can see with the corresponding GET request cannot be set through this API. See individual property descriptions below for details on how to set or change each.
public type AppsAppidBody record {
    # The app variables. See [About Application Variables](https://help.quickbase.com/user-assistance/variables.html)
    AppsVariables[] variables?;
    # The name for the app.
    string name?;
    # The description for the app.
    string description?;
};

public type InlineResponse2001 record {
    # The name of the table.
    string name?;
    # The unique identifier (dbid) of the table.
    string id?;
    # The automatically-created table alias for the table.
    string alias?;
    # The description of the table, as configured by an application administrator.
    string description?;
    # The time and date when the table was created, in the ISO 8601 time format YYYY-MM-DDThh:mm:ss.sssZ (in UTC time zone).
    string created?;
    # The time and date when the table schema or data was last updated, in the ISO 8601 time format YYYY-MM-DDThh:mm:ss.sssZ (in UTC time zone).
    string updated?;
    # The incremental Record ID that will be used when the next record is created, as determined when the API call was ran.
    int nextRecordId?;
    # The incremental Field ID that will be used when the next field is created, as determined when the API call was ran.
    int nextFieldId?;
    # The id of the field that is configured for default sorting.
    int defaultSortFieldId?;
    # The configuration of the default sort order on the table.
    string defaultSortOrder?;
    # The id of the field that is configured to be the key on this table, which is usually the Quickbase Record ID.
    int keyFieldId?;
    # The builder-configured singular noun of the table.
    string singleRecordName?;
    # The builder-configured plural noun of the table.
    string pluralRecordName?;
    # The size limit for the table.
    string sizeLimit?;
    # The amount of space currently being used by the table.
    string spaceUsed?;
    # The amount of space remaining for use by the table.
    string spaceRemaining?;
};

public type InlineResponse2003 record {
    # The id of the field, unique to this table.
    int id;
    # The type of field, as described [here](https://help.quickbase.com/user-assistance/field_types.html).
    string fieldType?;
    # For derived fields, this will be 'lookup', 'summary', or 'formula', to indicate the type of derived field.  For non-derived fields, this will be blank.
    string mode?;
    # The label (name) of the field.
    string label?;
    # Indicates if the field is configured to not wrap when displayed in the product.
    boolean noWrap?;
    # Indicates if the field is configured to display in bold in the product.
    boolean bold?;
    # Indicates if the field is marked required.
    boolean required?;
    # Indicates if the field is marked as a default in reports.
    boolean appearsByDefault?;
    # Indicates if the field is marked as searchable.
    boolean findEnabled?;
    # Indicates if the field is marked unique.
    boolean unique?;
    # Indicates if the field data will copy when a user copies the record.
    boolean doesDataCopy?;
    # The configured help text shown to users within the product.
    string fieldHelp?;
    # Indicates if the field is being tracked as part of Quickbase Audit Logs.
    boolean audited?;
    # Additional properties for the field. Please see [Field type details](../fieldInfo) page for more details on the properties for each field type.
    FieldsProperties properties?;
    # Field Permissions for different roles.
    FieldsPermissions[] permissions?;
};

public type InlineResponse2002 record {
    # The identifier of the report, unique to the table.
    string id?;
    # The configured name of the report.
    string name?;
    # The type of report in Quickbase (e.g., chart).
    string 'type?;
    # The configured description of a report.
    string description?;
    # Optional, showed only for personal reports. The user ID of report owner.
    int ownerId?;
    # The query definition as configured in Quickbase that gets executed when the report is run.
    ReportsQuery query?;
    # A list of properties specific to the report type. To see a detailed description of the properties for each report type, See [Report Types.](../reportTypes)
    record {} properties?;
    # The instant at which a report was last used.
    string usedLast?;
    # The number of times a report has been used.
    int usedCount?;
};

public type AppidCopyBody record {
    # The name of the newly copied app
    string name;
    # The description of the newly copied app
    string description?;
    # The configuration properties for performing the app copy
    AppsappidcopyProperties properties?;
};

public type InlineResponse2004 record {
    # Basic information about the field.
    FieldsusageField 'field;
    # Usage Information about the field.
    FieldsusageUsage usage;
};
