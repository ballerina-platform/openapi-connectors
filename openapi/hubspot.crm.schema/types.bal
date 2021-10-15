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

# Defines attributes to update on an object type.
public type ObjectTypeDefinitionPatch record {
    # Singular and plural labels for the object. Used in CRM display.
    ObjectTypeDefinitionLabels labels?;
    # The names of properties that should be **required** when creating an object of this type.
    string[] requiredProperties?;
    # Names of properties that will be indexed for this object type in by HubSpot's product search.
    string[] searchableProperties?;
    # The name of the primary property for this object. This will be displayed as primary on the HubSpot record page for this object type.
    string primaryDisplayProperty?;
    # The names of secondary properties for this object. These will be displayed as secondary on the HubSpot record page for this object type.
    string[] secondaryDisplayProperties?;
    # Is restorable
    boolean restorable?;
};

public type CollectionResponseObjectSchemaNoPaging record {
    ObjectSchema[] results;
};

# Defines an object type.
public type ObjectTypeDefinition record {
    # Singular and plural labels for the object. Used in CRM display.
    ObjectTypeDefinitionLabels labels;
    # The names of properties that should be **required** when creating an object of this type.
    string[] requiredProperties;
    # Names of properties that will be indexed for this object type in by HubSpot's product search.
    string[] searchableProperties;
    # The name of the primary property for this object. This will be displayed as primary on the HubSpot record page for this object type.
    string primaryDisplayProperty?;
    # The names of secondary properties for this object. These will be displayed as secondary on the HubSpot record page for this object type.
    string[] secondaryDisplayProperties;
    # Is object archived
    boolean archived;
    # A unique ID for this object type. Will be defined as {meta-type}-{unique ID}.
    string id;
    # Fully qualified name
    string fullyQualifiedName;
    # When the object type was created.
    string createdAt?;
    # When the object type was last updated.
    string updatedAt?;
    # Object type ID
    string objectTypeId;
    # A unique name for this object. For internal use only.
    string name;
    # The ID of the account that this object type is specific to.
    int portalId?;
};

# Defines a enumeration property option
public type OptionInput record {
    # A human-readable option label that will be shown in HubSpot.
    string label;
    # The internal value of the option, which must be used when setting the property value through the API.
    string value;
    # A description of the option.
    string description?;
    # Options are shown in order starting with the lowest positive integer value. Values of -1 will cause the option to be displayed after any positive values.
    int displayOrder;
    # Hidden options won't be shown in HubSpot.
    boolean hidden;
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

# Defines a property to create.
public type ObjectTypePropertyCreate record {
    # The internal property name, which must be used when referencing the property from the API.
    string name;
    # A human-readable property label that will be shown in HubSpot.
    string label;
    # The name of the group this property belongs to.
    string groupName?;
    # A description of the property that will be shown as help text in HubSpot.
    string description?;
    # A list of available options for the property. This field is only required for enumerated properties.
    OptionInput[] options?;
    # The order that this property should be displayed in the HubSpot UI relative to other properties for this object type. Properties are displayed in order starting with the lowest positive integer value. A value of -1 will cause the property to be displayed **after** any positive values.
    int displayOrder?;
    # Whether or not the property's value must be unique. Once set, this can't be changed.
    boolean hasUniqueValue?;
    # Is property hidden
    boolean hidden?;
    # The data type of the property.
    string 'type;
    # Controls how the property appears in HubSpot.
    string fieldType;
};

# Modification metadata
public type PropertyModificationMetadata record {
    # The schema is archivable
    boolean archivable;
    # The schema has readonly definition
    boolean readOnlyDefinition;
    # The schema has readonly options
    boolean readOnlyOptions?;
    # The shema has readonly value
    boolean readOnlyValue;
};

# Defines an association between two object types.
public type AssociationDefinitionEgg record {
    # ID of the primary object type to link from.
    string fromObjectTypeId;
    # ID of the target object type ID to link to.
    string toObjectTypeId;
    # A unique name for this association.
    string name?;
};

# Defines an association between two object types.
public type AssociationDefinition record {
    # ID of the primary object type to link from.
    string fromObjectTypeId;
    # ID of the target object type ID to link to.
    string toObjectTypeId;
    # A unique name for this association.
    string name?;
    # A unique ID for this association.
    string id;
    # When the association was defined.
    string createdAt?;
    # When the association was last updated.
    string updatedAt?;
};

# Defines an object schema, including its properties and associations.
public type ObjectSchema record {
    # Singular and plural labels for the object. Used in CRM display.
    ObjectTypeDefinitionLabels labels;
    # The names of properties that should be **required** when creating an object of this type.
    string[] requiredProperties;
    # Names of properties that will be indexed for this object type in by HubSpot's product search.
    string[] searchableProperties;
    # The name of the primary property for this object. This will be displayed as primary on the HubSpot record page for this object type.
    string primaryDisplayProperty?;
    # The names of secondary properties for this object. These will be displayed as secondary on the HubSpot record page for this object type.
    string[] secondaryDisplayProperties;
    # Is object archived
    boolean archived;
    # A unique ID for this schema's object type. Will be defined as {meta-type}-{unique ID}.
    string id;
    # An assigned unique ID for the object, including portal ID and object name.
    string fullyQualifiedName;
    # When the object schema was created.
    string createdAt?;
    # When the object schema was last updated.
    string updatedAt?;
    # Object type ID
    string objectTypeId;
    # Properties defined for this object type.
    Property[] properties;
    # Associations defined for a given object type.
    AssociationDefinition[] associations;
    # A unique name for the schema's object type.
    string name;
};

# Defines a new object type, its properties, and associations.
public type ObjectSchemaEgg record {
    # Singular and plural labels for the object. Used in CRM display.
    ObjectTypeDefinitionLabels labels;
    # The names of properties that should be **required** when creating an object of this type.
    string[] requiredProperties;
    # Names of properties that will be indexed for this object type in by HubSpot's product search.
    string[] searchableProperties;
    # The name of the primary property for this object. This will be displayed as primary on the HubSpot record page for this object type.
    string primaryDisplayProperty?;
    # The names of secondary properties for this object. These will be displayed as secondary on the HubSpot record page for this object type.
    string[] secondaryDisplayProperties;
    # Properties defined for this object type.
    ObjectTypePropertyCreate[] properties;
    # Associations defined for this object type.
    string[] associatedObjects;
    # A unique name for this object. For internal use only.
    string name;
};

# Singular and plural labels for the object. Used in CRM display.
public type ObjectTypeDefinitionLabels record {
    # The word for one object. (There’s no way to change this later.)
    string singular?;
    # The word for multiple objects. (There’s no way to change this later.)
    string plural?;
};

# The options available when a property is an enumeration
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

# Defines a property
public type Property record {
    # When the property was updated
    string updatedAt?;
    # When the property was created
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
    # The internal ID of the user who created the property in HubSpot. This field may not exist if the property was created outside of HubSpot.
    string createdUserId?;
    # The internal user ID of the user who updated the property in HubSpot. This field may not exist if the property was updated outside of HubSpot.
    string updatedUserId?;
    # If this property is related to other object(s), they'll be listed here.
    string referencedObjectType?;
    # The order that this property should be displayed in the HubSpot UI relative to other properties for this object type. Properties are displayed in order starting with the lowest positive integer value. A value of -1 will cause the property to be displayed **after** any positive values.
    int displayOrder?;
    # For default properties, true indicates that the property is calculated by a HubSpot process. It has no effect for custom properties.
    boolean calculated?;
    # For default properties, true indicates that the options are stored externally to the property settings.
    boolean externalOptions?;
    # Whether or not the property is archived.
    boolean archived?;
    # Whether or not the property's value must be unique. Once set, this can't be changed.
    boolean hasUniqueValue?;
    # If schema is hidden
    boolean hidden?;
    # This will be true for default object properties built into HubSpot.
    boolean hubspotDefined?;
    # Whether the property will display the currency symbol set in the account settings.
    boolean showCurrencySymbol?;
    # Modification metadata
    PropertyModificationMetadata modificationMetadata?;
    # Whether or not the property can be used in a HubSpot form.
    boolean formField?;
};
