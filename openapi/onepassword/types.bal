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

public type APIRequestArr APIRequest[];

public type VaultArr Vault[];

public type ItemArr Item[];

public type FileArr File[];

public type FullitemSections record {
    # A unique identifier for the section.
    string id?;
    # The label for the section.
    string label?;
};

# Object containing the item information.
public type FullItem record {
    *Item;
    # An array of Section objects of the sections to include with the item.
    FullitemSections[] sections?;
    # An array of Field objects of the fields to include with the item.
    Field[] fields?;
    # Information about files.
    File[] files?;
};

# For files that are in a section, this field describes the section.
public type FileSection record {
    # The UUID of a section in the item.
    string id?;
};

public type PatchInner record {
    # The kind of operation to perform. One of: add remove replace
    string op;
    # An RFC6901 JSON Pointer pointing to the Item document, an Item Attribute, and Item Field by Field ID, or an Item Field Attribute
    string path;
    # The new value to apply at the path.
    record {} value?;
};

public type ErrorResponse record {
    # HTTP Status Code
    int status?;
    # A message detailing the error
    string message?;
};

# A Resource object.
public type ApirequestResource record {
    # The resource requested. One of: "ITEM" "VAULT"
    string 'type?;
    # An object containing an id property with the value of the UUID of the vault requested.
    ApirequestResourceVault vault?;
    # An object containing an id property with the value of the UUID of the item requested.
    ApirequestResourceItem item?;
    # The version of the item.
    int itemVersion?;
};

# Represents a request that was made to the API. Including what Token was used and what resource was accessed.
public type APIRequest record {
    # The unique id used to identify a single request.
    string requestId?;
    # The time at which the request was processed by the server.
    string timestamp?;
    # The action taken. One of: "READ" "CREATE" "UPDATE" "DELETE"
    string action?;
    # The result of the action. One of: "SUCCESS" "DENY"
    string result?;
    # An Actor object.
    ApirequestActor actor?;
    # A Resource object.
    ApirequestResource 'resource?;
};

# An object containing an id property with the value of the UUID of the vault requested.
public type ApirequestResourceVault record {
    # Id property with the value of the UUID of the vault requested.
    string id?;
};

public type Item record {
    # The UUID of the item.
    string id?;
    # The title of the item.
    string title?;
    # An object containing an id property whose value is the UUID of the vault the item is in.
    ItemVault vault;
    # The category of the item.
    string category;
    # Array of URL objects containing URLs for the item.
    ItemUrls[] urls?;
    # Whether the item is marked as a favorite.
    boolean favorite?;
    # An array of strings of the tags assigned to the item.
    string[] tags?;
    # The version of the item.
    int 'version?;
    # The state of the item. One of: "ARCHIVED" "DELETED"
    string state?;
    # Date and time when the item was created.
    string createdAt?;
    # Date and time when the vault or its contents were last changed.
    string updatedAt?;
    # UUID of the account that last changed the item.
    string lastEditedBy?;
};

# A field object which contain fields to include with the item.
public type Field record {
    # Field ID.
    string id;
    # An object containing the UUID of a section in the item.
    FieldSection section?;
    # Use type for all other fields. Possible values are: "STRING" "EMAIL" "CONCEALED" "URL" "OTP" "DATE"
    string 'type;
    # Some item types, Login and Password, have fields used for autofill. This property indicates that purpose and is required for some item types.
    string purpose?;
    # The label for the field.
    string label?;
    # The value of the field.
    string value?;
    # If value is not present then a new value should be generated for this field
    boolean generate?;
    # The recipe is used in conjunction with the "generate" property to set the character set used to generate a new secure value
    GeneratorRecipe recipe?;
    # For fields with a purpose of `PASSWORD` this is the entropy of the value
    decimal entropy?;
};

# An object containing an id property whose value is the UUID of the vault the item is in.
public type ItemVault record {
    # Id property whose value is the UUID of the vault the item is in.
    string id;
};

# An object containing an id property with the value of the UUID of the item requested.
public type ApirequestResourceItem record {
    # Id property with the value of the UUID of the item requested.
    string id?;
};

public type Vault record {
    # The UUID of the vault.
    string id?;
    # The name of the vault.
    string name?;
    # The description for the vault.
    string description?;
    # The vault version
    int attributeVersion?;
    # The version of the vault contents
    int contentVersion?;
    # Number of active items in the vault
    int items?;
    # The type of vault. One of: "EVERYONE": The team Shared vault. "PERSONAL": The Private vault for the Connect server. "USER_CREATED": A vault created by a user.
    string 'type?;
    # Date and time when the vault was created.
    string createdAt?;
    # Date and time when the vault or its contents were last changed.
    string updatedAt?;
};

# An Actor object.
public type ApirequestActor record {
    # The UUID of the Connect server that made the request.
    string id?;
    # The UUID of the 1Password account the request went to.
    string account?;
    # The UUID of the access token used to authenticate the request.
    string jti?;
    # The user agent string specified in the request.
    string userAgent?;
    # The IP address the request originated from.
    string requestIp?;
};

public type File record {
    # ID of the file
    string id?;
    # Name of the file
    string name?;
    # Size in bytes of the file
    int size?;
    # Path of the Connect API that can be used to download the contents of this file.
    string content_path?;
    # For files that are in a section, this field describes the section.
    FileSection section?;
    # Base64-encoded contents of the file. Only set if size <= OP_MAX_INLINE_FILE_SIZE_KB kb and `inline_files` is set to `true`.
    string content?;
};

public type Patch PatchInner[];

public type ItemUrls record {
    # Whether this is the primary URL for the item.
    boolean primary?;
    # The address.
    string href;
};

# An object containing the UUID of a section in the item.
public type FieldSection record {
    # The UUID of a section in the item.
    string id?;
};

# The recipe is used in conjunction with the "generate" property to set the character set used to generate a new secure value
public type GeneratorRecipe record {
    # Length of the generated value
    int length?;
    # An array containing of the kinds of characters to include. Optional. Possible values: "LETTERS" "DIGITS" "SYMBOLS"
    string[] characterSets?;
};
