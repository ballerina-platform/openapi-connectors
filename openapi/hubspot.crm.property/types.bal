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

public type PropertyName record {
    # The name of the property to read or modify.
    string name;
};

public type StandardError record {
    string status;
    string id?;
    ErrorCategory category;
    record {} subCategory?;
    string message;
    ErrorDetail[] errors;
    record {} context;
    record {} links;
};

public type BatchResponseProperty record {
    string status;
    Property[] results;
    int numErrors?;
    StandardError[] errors?;
    string requestedAt?;
    string startedAt;
    string completedAt;
    record {} links?;
};

public type CollectionResponseProperty record {
    Property[] results;
    Paging paging?;
};

# An ID for a group of properties
public type PropertyGroup record {
    # The internal property group name, which must be used when referencing the property group via the API.
    string name;
    # A human-readable label that will be shown in HubSpot.
    string label;
    # Property groups are displayed in order starting with the lowest positive integer value. Values of -1 will cause the property group to be displayed after any positive values.
    int displayOrder;
    # Archive ID
    boolean archived;
};

public type PropertyCreate record {
    # The internal property name, which must be used when referencing the property via the API.
    string name;
    # A human-readable property label that will be shown in HubSpot.
    string label;
    # The data type of the property.
    string 'type;
    # Controls how the property appears in HubSpot.
    string fieldType;
    # The name of the property group the property belongs to.
    string groupName;
    # A description of the property that will be shown as help text in HubSpot.
    string description?;
    # A list of valid options for the property. This field is required for enumerated properties.
    OptionInput[] options?;
    # Properties are displayed in order starting with the lowest positive integer value. Values of -1 will cause the property to be displayed after any positive values.
    int displayOrder?;
    # Whether or not the property's value must be unique. Once set, this can't be changed.
    boolean hasUniqueValue?;
    # If true, the property won't be visible and can't be used in HubSpot.
    boolean hidden?;
    # Whether or not the property can be used in a HubSpot form.
    boolean formField?;
};

public type OptionInput record {
    # A human-readable option label that will be shown in HubSpot.
    string label;
    # The internal value of the option, which must be used when setting the property value through the API.
    string value;
    # A description of the option.
    string description?;
    # Options are shown in order starting with the lowest positive integer value. Values of -1 will cause the option to be displayed after any positive values.
    int displayOrder?;
    # Hidden options won't be shown in HubSpot.
    boolean hidden;
};

public type Paging record {
    NextPage next?;
};

public type Error record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # A unique identifier for the request. Include this value with any error reports or support tickets
    string correlationId;
    # The error category
    string category;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # further information about the error
    ErrorDetail[] errors?;
    # Context about the error condition
    record {} context?;
    # A map of link names to associated URIs containing documentation about the error or recommended remediation steps
    record {} links?;
};

public type BatchInputPropertyCreate record {
    PropertyCreate[] inputs;
};

public type ErrorDetail record {
    # A human readable message describing the error along with remediation steps where appropriate
    string message;
    # The name of the field or parameter in which the error was found.
    string 'in?;
    # The status code associated with the error detail
    string code?;
    # A specific category that contains more specific detail about the error
    string subCategory?;
    # Context about the error condition
    record {} context?;
};

public type PropertyUpdate record {
    # A human-readable property label that will be shown in HubSpot.
    string label?;
    # The data type of the property.
    string 'type?;
    # Controls how the property appears in HubSpot.
    string fieldType?;
    # The name of the property group the property belongs to.
    string groupName?;
    # A description of the property that will be shown as help text in HubSpot.
    string description?;
    # A list of valid options for the property.
    OptionInput[] options?;
    # Properties are displayed in order starting with the lowest positive integer value. Values of -1 will cause the Property to be displayed after any positive values.
    int displayOrder?;
    # If true, the property won't be visible and can't be used in HubSpot.
    boolean hidden?;
    # Whether or not the property can be used in a HubSpot form.
    boolean formField?;
};

public type BatchReadInputPropertyName record {
    PropertyName[] inputs;
    # Whether the results that have been archived
    boolean archived;
};

public type PropertyGroupCreate record {
    # The internal property group name, which must be used when referencing the property group via the API.
    string name;
    # A human-readable label that will be shown in HubSpot.
    string label;
    # Property groups are displayed in order starting with the lowest positive integer value. Values of -1 will cause the property group to be displayed after any positive values.
    int displayOrder?;
};

public type PropertyModificationMetadata record {
    boolean archivable;
    boolean readOnlyDefinition;
    boolean readOnlyOptions?;
    boolean readOnlyValue;
};

public type ErrorCategory record {
    string httpStatus;
    string name;
};

public type BatchInputPropertyName record {
    PropertyName[] inputs;
};

public type Option record {
    # A human-readable option label that will be shown in HubSpot.
    string label;
    # The internal value of the option, which must be used when setting the property value through the API.
    string value;
    # A description of the option.
    string description?;
    # Options are displayed in order starting with the lowest positive integer value. Values of -1 will cause the option to be displayed after any positive values.
    int displayOrder?;
    # Hidden options will not be displayed in HubSpot.
    boolean hidden;
};

public type CollectionResponsePropertyGroup record {
    PropertyGroup[] results;
    Paging paging?;
};

public type PropertyGroupUpdate record {
    # A human-readable label that will be shown in HubSpot.
    string label?;
    # Property groups are displayed in order starting with the lowest positive integer value. Values of -1 will cause the property group to be displayed after any positive values.
    int displayOrder?;
};

public type NextPage record {
    string after;
    string link?;
};

public type Property record {
    string updatedAt?;
    string createdAt?;
    # When the property was archived.
    string archivedAt?;
    # The internal property name, which must be used when referencing the property via the API.
    string name;
    # A human-readable property label that will be shown in HubSpot.
    string label;
    # The property data type.
    string 'type;
    # Controls how the property appears in HubSpot.
    string fieldType;
    # A description of the property that will be shown as help text in HubSpot.
    string description;
    # The name of the property group the property belongs to.
    string groupName;
    # A list of valid options for the property. This field is required for enumerated properties, but will be empty for other property types.
    Option[] options;
    # The internal user ID of the user who created the property in HubSpot. This field may not exist if the property was created outside of HubSpot.
    string createdUserId?;
    # The internal user ID of the user who updated the property in HubSpot. This field may not exist if the property was updated outside of HubSpot.
    string updatedUserId?;
    # If this property is related to other object(s), they'll be listed here.
    string referencedObjectType?;
    # Properties are shown in order, starting with the lowest positive integer value.
    int displayOrder?;
    # For default properties, true indicates that the property is calculated by a HubSpot process. It has no effect for custom properties.
    boolean calculated?;
    # For default properties, true indicates that the options are stored externally to the property settings.
    boolean externalOptions?;
    # Whether or not the property is archived.
    boolean archived?;
    # Whether or not the property's value must be unique. Once set, this can't be changed.
    boolean hasUniqueValue?;
    # Whether or not the property will be hidden from the HubSpot UI. It's recommended this be set to false for custom properties.
    boolean hidden?;
    # This will be true for default object properties built into HubSpot.
    boolean hubspotDefined?;
    # Whether or not the property will display the currency symbol set in the account settings.
    boolean showCurrencySymbol?;
    PropertyModificationMetadata modificationMetadata?;
    # Whether or not the property can be used in a HubSpot form.
    boolean formField?;
};
