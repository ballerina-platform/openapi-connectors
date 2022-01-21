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

public type AssetEmbedField string;

public type UpdateAssetError record {
    # Error structure for revealing tag ID conflicts
    TagsExistError data;
    string message;
};

public type GetUsersQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup specific users by passing an array of valid Spotto IDs.
    string[] ids?;
    # Lookup users belonging to specific roles by passing an array of valid Spotto IDs.
    string[] role?;
    UserType 'type?;
    # Common sort fields across most GET endpoints
    StandardSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Attach additional user information:
    # - **meta** includes basic CRUD status information.
    UserEmbedField[] embed?;
};

public type GetLocationsQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup specific locations by passing an array of valid Spotto IDs.
    string[] ids?;
    # Lookup locations with specific tag IDs e.g. Beacon MAC addresses and RFID EPC codes.
    string[] tagIds?;
    # Lookup locations at specific floor levels, e.g. Ground and Level 1 ONLY.
    string[] levels?;
    # Only return locations that have tags registered.
    boolean hasTags?;
    # Only return locations that have readers attached.
    boolean hasReaders?;
    # Only return locations that either have tags OR readers attached
    boolean setupComplete?;
    # Return deleted locations, the default is false.
    boolean archived?;
    SearchableSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Search query string, for lucene based full text search.
    string search?;
    # Whether or not to run the search in *fuzzy* mode. The level of fuzziness
    # depends on the character length of search terms:
    # 
    # - 1-2: Must match exactly.
    # - 3-5: Off by at most 1 character.
    # - 6+: Off by at most 2 characters.
    boolean searchFuzzy?;
    # Reduce the scope of fields to perform the search on.
    # When left blank it will search all of these fields.
    LocationSearchField[] searchFields?;
    # Attach additional location information:
    # 
    # - **meta** includes basic CRUD status information.
    # - **tags** includes the tag IDs connected to this location.
    # - **readers** includes any readers configured at the given location.
    LocationEmbedField[] embed?;
};

public type DefaultReaderRequest record {
    # Name of the new reader, try to be descriptive to make it easy for
    # people find it when searching.
    # <br>
    # This field is optional for **FIXED** readers, see *IFixedReaderRequest*.
    string name;
    # The reader behaviour type:
    # - **FIXED** - regular non-moving readers.
    # - **ROVING** - readers that move around and look for location tags, assigning nearby assets to the locations it sees.
    # - **VIRTUAL** -  allow different antennas plugged into a reader to report as their own readers.
    # - **PORTAL** - similar to virtual but for differentiating 2 adjacent zones e.g. IN/OUT.
    ReaderType 'type;
    # The physical reader device type:
    # - **B1** - Spotto B1 Bluetooth Reader.
    # - **RF1A4** - Spotto RF1A4 4 Port RFID Reader.
    # - **RF1F** - Spotto RF1F FEIG Reader.
    # - **HD1** - Spotto HD1 HID Reader.
    # - **ZEBRA** - Zebra RFID Reader.
    # - **IMPINJ** - Impinj RFID Reader.
    # - **TURCK** - Turck Handheld RFID Reader.
    # - **OTHER** - Custom Reader (BYO Device).
    # - **APPLICATION** - Spotto Detector Application.
    DeviceType deviceType;
    # locationId is used for specifying an already existing location.
    string locationId?;
    # If a location object is specified, a new location will be created and
    # added to the locations list.
    IUpsertedLocation location?;
    # Reader Device ID. This will typically be a MAC address e.g. *00:11:22:33:44:55*.
    # <br>
    # It is only applicable to IoTX3 readers.
    string deviceId?;
    # WiFi network credentials.
    INetworkRequest network?;
    # When this flag is true, it will save any provided WiFi details to the account.
    # It will be ignored if no networks are present.
    boolean saveNetwork?;
    # Additional antenna config. This is only applicable to VIRTUAL or PORTAL readers.
    IAntennaRequest[] antennas?;
};

public type AssetSearchField string;

# Metadata, holding important timestamps of this object's lifecycle.
public type IEntityMeta record {
    # Created timestamp
    float created;
    # Last updated timestamp
    float updated?;
    # Deletion timestamp
    float deleted?;
};

public type PostTriggersResponse record {
    # Total number of records that were inserted
    float inserted;
    # The list of inserted items
    GetTriggerResponse[] items;
};

public type TagErrorInList record {
    # Index within the request that errors occurred
    float index;
    # List of errors for the asset at the given index of the request body
    (TagsExistError|TagsDuplicatedError)[] errors;
};

public type GetLocationInventoryResponse IInventoryItem[];

# A single conflict with a new tag ID existing on a previous item in the request
public type TagsDuplicatedConflict record {
    # Tag ID causing the conflict
    string tagId;
    # Index in this request the tag ID was first found
    float index;
};

# Sort orders - ascending and descending
public type SortOrders string;

public type PostTriggerRequest PostArrivedAtTriggerRequest|PostMovedTriggerRequest|PostWentOnlineTriggerRequest|PostWentOfflineTriggerRequest;

public type UpdateLocationRequest record {
    # Update the name of the location, perhaps because of a typo or to be more descriptive.
    string name?;
    # Update the building level of the location. This should match an existing level from [GetLevels](/#operation/GetLevels).
    string level?;
    # New list of tag identifiers, perhaps adding a new tag if the original tag is low on battery.
    string[] tagIds?;
    # Setting the archived status to true hides the location from view, you can reveal
    # archived assets by using the [GetLocations](/#operation/GetLocations) request.
    boolean archived?;
    # ⚠️ Experimental - You can edit a Locations address however this is not used in any Spotto interfaces.
    string address?;
    # ⚠️ Experimental - You can edit Location coordinates however this is not used in any Spotto interfaces.
    # NOTE: For brevity this option has been set to a string. Any valid GeoJSON object
    # will be accepted for this field. Check https://geojson.org/ for details.
    string geoLocation?;
};

public type GetRolesQuery record {
    # Common sort fields across most GET endpoints
    StandardSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Attach additional user information:
    # 
    # **meta** includes basic CRUD status information.
    RoleEmbedField[] embed?;
};

public type GetLocationsResponse record {
    GetLocationsQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetLocationResponse[] items;
};

# ==== TRIGGER TYPES ====
public type TriggerType string;

public type IEmbeddedEntity record {
    # Unique Spotto ID of this object.
    string id;
    # Human readable name of this object.
    string name;
};

# Asset or Reader moved in relation to selected locations
public type GetArrivedAtTriggerResponse record {
    # Type
    string 'type;
    # Location rules filter the possible events that cause this
    # trigger to fire.
    Rule[] locationRules;
    # Unique ID of the Trigger.
    string id;
    # The human readable name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # Status of the trigger, disabled triggers will not fire.
    boolean enabled;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

public type ReaderSearchField string;

public type PostAssetsError record {
    TagErrorInList[] data;
    string message;
};

public type LocationSearchField string;

# Reader went online after a given threshold.
public type PostWentOfflineTriggerRequest record {
    # Type
    string 'type;
    # The name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
};

public type IInventoryItem record {
    # When the asset was first seen at this location.
    float firstSeen;
    # When the asset was last seen at this location.
    float lastSeen;
    # Unique Spotto ID of this object.
    string id;
    # Human readable name of this object.
    string name;
};

public type UpdateAssetErrorResponse DefaultError|UpdateAssetError;

# Reader went online after a given threshold.
public type PostWentOnlineTriggerRequest record {
    # Type
    string 'type;
    # The name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
};

public type PostLevelResponse record {
};

# The reader behaviour type:
# - **FIXED** - regular non-moving readers.
# - **ROVING** - readers that move around and look for location tags, assigning nearby assets to the locations it sees.
# - **VIRTUAL** -  allow different antennas plugged into a reader to report as their own readers.
# - **PORTAL** - similar to virtual but for differentiating 2 adjacent zones e.g. IN/OUT.
public type ReaderType string;

public type GetEventsQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup events for specific readers by passing an array of valid Spotto IDs.
    string[] readers?;
    # Lookup events for specific locations by passing an array of valid Spotto IDs.
    string[] locations?;
    # Lookup events for specific assets by passing an array of valid Spotto IDs.
    string[] assets?;
    # Lookup events for specific event types, e.g. only show Reader Online/Offline events.
    EventType[] 'type?;
    # Filter events from a given timestamp. It will yield events up until the
    # current server time, unless otherwise specified by `timeTo`.
    float timeFrom?;
    # Filter events until a given timestamp. It will yield all events prior to the specified time,
    # unless otherwise specified by `timeFrom`.
    float timeTo?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
};

public type PostExternalUserRequest record {
    # User type for identifying external API users.
    string 'type;
    # The User's full name, or an identifier of the external API user.
    string name;
    # The role ID the new user will be assigned. To fetch a list of available roles,
    # check out the [GetRoles](/#operation/GetRoles) request.
    string role;
};

public type PutLevelsRequest record {
    # New list of levels to save against the account.
    string[] levels;
};

public type EmailAction record {
    string 'type;
    # Email address of the trigger recipient.
    string address;
};

public type PostLocationsRequest PostlocationsrequestInner[];

public type Rule MatchNameRule|StrictMatchIdRule;

public type UserType string;

public type GetKeyResponse record {
    # Access key for using the Spotto REST API. Insert this key into the `x-api-key`
    # header, then call any request in this spec, provided the user this key is associated
    # with has the correct permissions.
    string 'key;
};

public type PostAssetsResponse record {
    # Total number of records that were inserted.
    float inserted;
    # The list of inserted items.
    GetAssetResponse[] items;
};

public type PostAssetRequest record {
    # Name of the new asset, try to be descriptive to make it easy for people find it when searching.
    string name;
    # Array of tag identifiers, these will typically be BLE tag MAC addresses e.g. 00:11:22:33:44:55.
    string[] tagIds?;
};

# Reader Locations can either be:
# 
# FIXED: Are static and don't have a timestamp<br>
# ROVING: Are dynamic and have a lastSeen timestamp
public type ReaderLocation IFixedReaderLocation|IRovingReaderLocation;

public type GetInternalUserResponse record {
    # User type for identifying internal users from external API users.
    string 'type;
    # The User's unique email address.
    string email;
    # Unique Spotto ID assigned to this User.
    string id;
    # Human readable full name or identifier of the User.
    # NOTE: We do not enforce unique names, we instead rely on `id` for uniqueness.
    string name;
    IEmbeddedEntity role;
    IEmbeddedEntity organisation;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

public type StrictMatchIdRule record {
    string 'type;
    # Case sensitive exact Spotto ID of the event subject.
    string 'match;
};

public type IFixedReaderLocation record {
    string 'type;
    # Unique Spotto ID of this object.
    string id;
    # Human readable name of this object.
    string name;
};

public type GetExternalUserResponse record {
    # User type for identifying external API users from internal users.
    string 'type;
    # The API key is returned when creating new **EXTERNAL** users, or where requested.
    string 'key?;
    # Unique Spotto ID assigned to this User.
    string id;
    # Human readable full name or identifier of the User.
    # NOTE: We do not enforce unique names, we instead rely on `id` for uniqueness.
    string name;
    IEmbeddedEntity role;
    IEmbeddedEntity organisation;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

# Error structure for revealing tag ID conflicts
public type TagsExistError record {
    # Type
    string 'type;
    # Message
    string message;
    # Conflicts
    TagsExistConflict[] conflicts;
};

public type GetAssetResponse record {
    # Unique ID of this Asset.
    string id;
    # Human readable asset name NOTE: We do not enforce unique names for assets, instead we rely on the `id` for uniqueness.
    string name;
    # List of connected tag identifiers, these will typically be  BLE tag MAC addresses e.g. 00:11:22:33:44:55.
    string[] tagIds?;
    # Lucene based search score, added as an optional meta field when searching.
    float score?;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
    ILastLocation lastLocation?;
};

public type PostLevelRequest record {
    # Name of the new level to be inserted.
    string level;
};

public type GetReadersQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup specific readers by passing an array of valid Spotto IDs.
    string[] ids?;
    # Lookup readers that are positioned at specific location IDs
    string[] locationIds?;
    # Lookup specific readers by passing an array of device IDs.
    # These are typically the MAC address of the reader.
    string[] deviceIds?;
    # Filter based on the reader behavioural type.
    ReaderType[] types?;
    # Lookup readers belonging to specific device types.
    DeviceType[] deviceTypes?;
    # Return deleted readers, the default is false.
    boolean archived?;
    SearchableSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Search query string, for Lucene based full text search.
    string search?;
    # Whether or not to run the search in *fuzzy* mode. The level of fuzziness
    # depends on the character length of search terms:
    # 
    # - 1-2: Must match exactly.
    # - 3-5: Off by at most 1 character.
    # - 6+: Off by at most 2 characters.
    boolean searchFuzzy?;
    # Reduce the scope of fields to perform the search on.
    # When left blank it will search all of these fields.
    ReaderSearchField[] searchFields?;
    # Attach additional reader information:
    # 
    # - **meta** includes basic CRUD status information.
    # - **status** includes dynamic status information about the reader such as
    # the time it came online and when we last heard from it.
    ReaderEmbedField[] embed?;
};

public type TriggerEmbedField string;

public type GetEventsResponse record {
    GetEventsQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetEventResponse[] items;
};

public type GetAssetsResponse record {
    GetAssetsQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetAssetResponse[] items;
};

public type PostReadersResponse record {
    # Total number of records that were inserted
    float inserted;
    # The list of inserted items
    GetReaderResponse[] items;
};

public type PostLocationsError record {
    TagErrorInList[] data;
    string message;
};

public type WebhookAction record {
    string 'type;
    # Endpoint URL to POST the event payload to.
    string endpoint;
};

public type PostAssetsRequest PostAssetRequest[];

public type GetEventResponse record {
    # Unique ID of this Event.
    string id;
    # Unix numeric timestamp (milliseconds) of when the event was recorded.
    float timestamp;
    EventType 'type;
    IEmbeddedEntity asset?;
    IEmbeddedEntity location?;
    IEmbeddedEntity reader?;
};

public type PostTriggersRequest PostTriggerRequest[];

public type IRovingReaderLocation record {
    string 'type;
    # First time the location was seen by this reader
    float firstSeen;
    # Last time the location was seen by this reader
    float lastSeen;
    # Unique Spotto ID of this object.
    string id;
    # Human readable name of this object.
    string name;
};

public type RoleEmbedField string;

public type GetRoleResponse record {
    # Unique Spotto ID of the role.
    string id;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
    # Human readable name of the role.
    string name;
    # Short description of the role including the scope of access.
    string description;
    # List of permissions this role has access to, following
    # the entity:action pattern.
    string[] permissions;
    # Whether or not this role is a default system role, available to all organisations.
    boolean 'default?;
};

public type GetReaderInventoryResponse IInventoryItem[];

public type GetAssetsQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup specific assets by passing an array of valid Spotto IDs.
    string[] ids?;
    # Lookup assets with specific tag IDs e.g. Beacon MAC addresses and RFID EPC codes.
    string[] tagIds?;
    # Only return assets that have tags registered.
    boolean hasTags?;
    # Return deleted assets, the default is false.
    boolean archived?;
    SearchableSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Search query string, for lucene based full text search.
    string search?;
    # Whether or not to run the search in *fuzzy* mode. The level of fuzziness
    # depends on the character length of search terms:
    # 
    # - 1-2: Must match exactly.
    # - 3-5: Off by at most 1 character.
    # - 6+: Off by at most 2 characters.
    boolean searchFuzzy?;
    # Reduce the scope of fields to perform the search on.
    # When left blank it will search all of these fields.
    AssetSearchField[] searchFields?;
    # Attach additional asset information:
    # 
    # - **meta** includes basic CRUD status information.
    # - **tags** includes the tag IDs connected to this asset.
    # - **lastLocation** includes the last known time and location the asset was seen.
    AssetEmbedField[] embed?;
};

public type UpdateAssetRequest record {
    # Update the name of the asset, perhaps because of a typo or to be more descriptive.
    string name?;
    # Setting the archived status to true hides the asset from view, you can reveal
    # archived assets by using the [GetAssets](/#operation/GetAssets) request.
    boolean archived?;
    # New list of tag identifiers, perhaps adding a new tag if the original tag is low on battery.
    string[] tagIds?;
};

# If a location object is specified, a new location will be created and
# added to the locations list.
public type IUpsertedLocation record {
    # Name
    string name;
    # Level
    string level?;
};

public type GetReaderResponse record {
    # Unique ID of this Reader.
    string id;
    # Human readable reader name NOTE: We do not enforce unique names, instead we rely on `id` for uniqueness.
    string name;
    # The reader behaviour type:
    # - **FIXED** - regular non-moving readers.
    # - **ROVING** - readers that move around and look for location tags, assigning nearby assets to the locations it sees.
    # - **VIRTUAL** -  allow different antennas plugged into a reader to report as their own readers.
    # - **PORTAL** - similar to virtual but for differentiating 2 adjacent zones e.g. IN/OUT.
    ReaderType 'type;
    # The physical reader device type:
    # - **B1** - Spotto B1 Bluetooth Reader.
    # - **RF1A4** - Spotto RF1A4 4 Port RFID Reader.
    # - **RF1F** - Spotto RF1F FEIG Reader.
    # - **HD1** - Spotto HD1 HID Reader.
    # - **ZEBRA** - Zebra RFID Reader.
    # - **IMPINJ** - Impinj RFID Reader.
    # - **TURCK** - Turck Handheld RFID Reader.
    # - **OTHER** - Custom Reader (BYO Device).
    # - **APPLICATION** - Spotto Detector Application.
    DeviceType deviceType;
    # Reader Device ID. This will typically be a MAC address e.g. 00:11:22:33:44:55.
    string deviceId?;
    # Endpoint this reader will POST reads to. This is only needed when manually setting
    # up a reader, or when using a BYO device.
    string endpoint;
    # SSID of the network the reader is connected to, if any.
    string network?;
    # Reader Locations can either be:
    # 
    # FIXED: Are static and don't have a timestamp<br>
    # ROVING: Are dynamic and have a lastSeen timestamp
    ReaderLocation location?;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
    # Reader online status information.
    # 
    # Note: Other IoT style status information will ultimately end up here
    # e.g. Temperature, WiFi signal, Battery level (for portable readers).
    IReaderStatus status?;
};

public type PutLevelsResponse record {
    # The new list of levels for this organisation.
    string[] levels;
};

public type IAntennaRequest record {
    string name?;
    float port;
    string locationId?;
    IantennarequestLocation location?;
};

public type EventType string;

# Asset or Reader moved anywhere (No location rules).
public type PostMovedTriggerRequest record {
    # Type
    string 'type;
    # The name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
};

public type PostReadersRequest PostReaderRequest[];

public type IFixedReaderRequest record {
    string 'type;
    # Name is optional for FIXED reader. This field is appended to the
    # location name separated by a ' - '.
    string name?;
    # The physical reader device type:
    # - **B1** - Spotto B1 Bluetooth Reader.
    # - **RF1A4** - Spotto RF1A4 4 Port RFID Reader.
    # - **RF1F** - Spotto RF1F FEIG Reader.
    # - **HD1** - Spotto HD1 HID Reader.
    # - **ZEBRA** - Zebra RFID Reader.
    # - **IMPINJ** - Impinj RFID Reader.
    # - **TURCK** - Turck Handheld RFID Reader.
    # - **OTHER** - Custom Reader (BYO Device).
    # - **APPLICATION** - Spotto Detector Application.
    DeviceType deviceType;
    # locationId is used for specifying an already existing location.
    string locationId?;
    # If a location object is specified, a new location will be created and
    # added to the locations list.
    IUpsertedLocation location?;
    # Reader Device ID. This will typically be a MAC address e.g. *00:11:22:33:44:55*.
    # <br>
    # It is only applicable to IoTX3 readers.
    string deviceId?;
    # WiFi network credentials.
    INetworkRequest network?;
    # When this flag is true, it will save any provided WiFi details to the account.
    # It will be ignored if no networks are present.
    boolean saveNetwork?;
    # Additional antenna config. This is only applicable to VIRTUAL or PORTAL readers.
    IAntennaRequest[] antennas?;
};

public type GetReaderStatusResponse record {
    IRovingReaderLocation location?;
    # Reader online status information.
    # 
    # Note: Other IoT style status information will ultimately end up here
    # e.g. Temperature, WiFi signal, Battery level (for portable readers).
    IReaderStatus status;
};

public type GetAssetLastLocationResponse record {
    # Unique ID of this Asset.
    string id;
    ILastLocation lastLocation;
};

public type GetTriggerResponse GetArrivedAtTriggerResponse|GetMovedTriggerResponse|GetWentOnlineTriggerResponse|GetWentOfflineTriggerResponse;

# ==== INTEGRATIONS ====
public type MQTTDisabled record {
    # Enabled
    boolean enabled;
};

public type UpdateLocationErrorResponse DefaultError|UpdateLocationError;

# Asset or Reader moved anywhere (No location rules)
public type GetMovedTriggerResponse record {
    # Type
    string 'type;
    # Unique ID of the Trigger.
    string id;
    # The human readable name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # Status of the trigger, disabled triggers will not fire.
    boolean enabled;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

# Extends the base shape returned in the integrations list with
# additional information about the integration.
public type MQTTEnabledWithDetails record {
    # Password for accessing the Spotto MQTT broker.
    string password;
    # Host URL of Spotto MQTT broker.
    string host;
    # MQTT Topic that will subscribe to all events for this organisation.
    string rootTopic;
    # Enabled
    boolean enabled;
    # Username for accessing the Spotto MQTT broker.
    string username;
};

# Reader went online after a given threshold
public type GetWentOfflineTriggerResponse record {
    # Type
    string 'type;
    # Unique ID of the Trigger.
    string id;
    # The human readable name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # Status of the trigger, disabled triggers will not fire.
    boolean enabled;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

public type GetLevelsResponse record {
    # List of levels saved against the account.
    string[] levels;
};

public type IantennarequestLocation record {
    string name;
    string level?;
};

# Reader went online after a given threshold
public type GetWentOnlineTriggerResponse record {
    # Type
    string 'type;
    # Unique ID of the Trigger.
    string id;
    # The human readable name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # Status of the trigger, disabled triggers will not fire.
    boolean enabled;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

public type UpdateTriggerRequest record {
    # The human readable name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name?;
    # Change the status of the trigger, disabled triggers will not fire.
    boolean enabled?;
    # Change the actions that fire for this trigger, you must send the
    # entire array as part of the request. Use the [GetTrigger](/#operation/GetTrigger)
    # request to fetch the existing actions to prevent accidentally deleting any.
    Action[] actions?;
    # Change the subject rules to filter the events that cause this
    # trigger to fire, you must send the entire array as part of
    # the request. Use the [GetTrigger](/#operation/GetTrigger)
    # request to fetch the existing subjectRules to prevent accidentally deleting any.
    Rule[] subjectRules?;
    # Change the location rules to filter the events that cause this
    # trigger to fire, you must send the entire array as part of
    # the request. Use the [GetTrigger](/#operation/GetTrigger)
    # request to fetch the existing actions to prevent accidentally deleting any.
    # 
    # ⚠️ Warning: This is only allowed for ArrivedAt triggers.
    Rule[] locationRules?;
};

public type PostAssetsErrorResponse DefaultError|PostAssetsError;

# A single conflict with a new tag ID existing on an existing entity
public type TagsExistConflict record {
    # Tag ID causing the conflict
    string tagId;
    # Type of entity the tag ID exists on
    string 'type;
    # ID of the entity the tag ID exists on
    string id;
};

public type GetLocationResponse record {
    # Unique ID of this Location.
    string id;
    # Human readable location name NOTE: We do not enforce unique names, instead relying on `id` for uniqueness.
    string name;
    # List of connected tag identifiers, these will typically be  BLE tag MAC addresses e.g. 00:11:22:33:44:55.
    string[] tagIds?;
    # List of readers configured at this location.
    IEmbeddedEntity[] readers?;
    # The name of the building level the location is on. This should match an existing level from [GetLevels](/#operation/GetLevels).
    string level?;
    # Metadata, holding important timestamps of this object's lifecycle.
    IEntityMeta meta?;
};

# Asset or Reader moved in relation to selected locations
public type PostArrivedAtTriggerRequest record {
    # Type
    string 'type;
    # Location rules filter the possible events that cause this
    # trigger to fire.
    Rule[] locationRules;
    # The name of the trigger, for easily identifying the trigger
    # and its purpose.
    string name;
    # The list of actions that fire for this trigger.
    Action[] actions;
    # Subject rules filter the possible events that cause this
    # trigger to fire.
    Rule[] subjectRules;
};

public type PostLocationsResponse record {
    # Total number of records that were inserted
    float inserted;
    # The list of inserted items
    GetLocationResponse[] items;
};

# The physical reader device type:
# - **B1** - Spotto B1 Bluetooth Reader.
# - **RF1A4** - Spotto RF1A4 4 Port RFID Reader.
# - **RF1F** - Spotto RF1F FEIG Reader.
# - **HD1** - Spotto HD1 HID Reader.
# - **ZEBRA** - Zebra RFID Reader.
# - **IMPINJ** - Impinj RFID Reader.
# - **TURCK** - Turck Handheld RFID Reader.
# - **OTHER** - Custom Reader (BYO Device).
# - **APPLICATION** - Spotto Detector Application.
public type DeviceType string;

# WiFi network credentials.
public type INetworkRequest record {
    # SSID of the network.
    string name;
    # Optional network username, this is only required for WPA2 Enterprise networks.
    string username?;
    # Optional network password, this is not required for open networks.
    string password?;
};

public type GetTriggersResponse record {
    GetTriggersQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetTriggerResponse[] items;
};

# Standard deletion response is an empty object
public type DeleteResponse record {
};

public type PostUserRequest PostExternalUserRequest|PostInternalUserRequest;

public type PostlocationsrequestInner record {
    # Name of the new location, try to be descriptive to make it easy for people find it when searching.
    string name;
    # Attach a building level to the location if appropriate, this should match an existing level from [GetLevels](/#operation/GetLevels)
    string level?;
    # If this location can be sensed by a mobile reader, you can add identifiers so it can be seen.
    # It accepts an array of tag identifiers, these will typically be BLE tag MAC addresses e.g. 00:11:22:33:44:55.
    string[] tagIds?;
    # ⚠️ Experimental - You can assign an address to a Location however this is not used in any Spotto interfaces
    string address?;
    # ⚠️ Experimental - You can assign coordinates to a Location however this is not used in any Spotto interfaces.
    # For brevity this option has been set to a string. Any valid GeoJSON object
    # will be accepted for this field. Check https://geojson.org/ for details.
    string geoLocation?;
};

public type MQTTAction record {
    string 'type;
    # Custom MQTT topic to publish the event payload to.
    string topic;
};

public type SearchableSortFields StandardSortFields|string;

public type UpdateUserRequest record {
    # Change the User's full name, or name of the external API user.
    string name?;
    # Change the role ID assigned to a user. To fetch a list of available roles,
    # check out the [GetRoles](/#operation/GetRoles) request.
    string role?;
    # If you have super-admin permissions you can move users
    # between organisations.
    string organisation?;
};

# Common sort fields across most GET endpoints
public type StandardSortFields string;

public type ILastLocation record {
    # When the asset was first seen at this location.
    float firstSeen;
    # When the asset was last seen at this location.
    float lastSeen;
    # Unique Spotto ID of this object.
    string id;
    # Human readable name of this object.
    string name;
};

public type Action WebhookAction|MQTTAction|EmailAction;

public type PostInternalUserRequest record {
    # User type for identifying internal users.
    string 'type;
    # The User's unique email address. We send a welcome email including their password.
    string email;
    # Optionally provide a custom password rather than have Spotto automatically generate one.
    # This will be forwarded to the new User's email address so that they can log into Spotto.
    string password?;
    # The User's full name, or an identifier of the external API user.
    string name;
    # The role ID the new user will be assigned. To fetch a list of available roles,
    # check out the [GetRoles](/#operation/GetRoles) request.
    string role;
};

public type GetUsersResponse record {
    GetUsersQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetUserResponse[] items;
};

public type PostLocationsErrorResponse DefaultError|PostLocationsError;

public type UpdateReaderRequest record {
    # Update the name of the reader, perhaps because of a typo or to be more descriptive.
    string name?;
    # Setting the archived status to true hides the reader from view, you can reveal
    # archived readers by using the [GetReaders](/#operation/GetReaders) request.
    boolean archived?;
    # locationId is used for specifying an already existing location.
    string locationId?;
    # If a location object is specified, a new location will be created and
    # added to the locations list.
    IUpsertedLocation location?;
    # Reader Device ID. This will typically be a MAC address e.g. *00:11:22:33:44:55*.
    # <br>
    # It is only applicable to IoTX3 readers.
    string deviceId?;
    # WiFi network credentials.
    INetworkRequest network?;
    # When this flag is true, it will save any provided WiFi details to the account.
    # It will be ignored if no networks are present.
    boolean saveNetwork?;
    # Additional antenna config. This is only applicable to VIRTUAL or PORTAL readers.
    IAntennaRequest[] antennas?;
};

# Error structure for revealing tag ID conflicts within the request
public type TagsDuplicatedError record {
    # Type
    string 'type;
    # Message
    string message;
    # Conflicts
    TagsDuplicatedConflict[] conflicts;
};

public type GetRolesResponse record {
    GetRolesQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetRoleResponse[] items;
};

public type MQTTSettings MQTTEnabledWithDetails|MQTTDisabled;

public type UpdateLocationError record {
    # Error structure for revealing tag ID conflicts
    TagsExistError data;
    string message;
};

# Reader online status information.
# 
# Note: Other IoT style status information will ultimately end up here
# e.g. Temperature, WiFi signal, Battery level (for portable readers).
public type IReaderStatus record {
    # Whether or not the reader is currently online.
    boolean online;
    # Unix numeric timestamp (milliseconds) of when the reader came online.
    float onlineTime;
    # Unix numeric timestamp (milliseconds) of when the reader last reported.
    float lastReportedTime;
};

public type LocationEmbedField string;

public type MatchNameRule record {
    string 'type;
    # Case insensitive name or substring to match on the event subject.
    string 'match;
};

public type GetTriggersQuery record {
    # **Pagination:** What page of results, assuming the limit (defaulting to 20)
    # to start from. The default is page 0 (the first page of results).
    # 
    # e.g. With a limit of 20, page 1 gets us results 20-39 (with zero based indexing).
    float page?;
    # **Pagination:** Max number of results to return in the request. The default is 20.
    float 'limit?;
    # Lookup specific triggers by passing an array of valid Spotto IDs.
    string[] ids?;
    # Lookup triggers that are only enabled or disabled.
    boolean enabled?;
    # ==== TRIGGER TYPES ====
    TriggerType 'type?;
    # Common sort fields across most GET endpoints
    StandardSortFields sort?;
    # Sort orders - ascending and descending
    SortOrders sortOrder?;
    # Attach additional trigger information:
    # - **meta** includes basic CRUD status information.
    TriggerEmbedField[] embed?;
};

public type ReaderEmbedField string;

public type PostReaderRequest DefaultReaderRequest|IFixedReaderRequest;

public type GetUserResponse GetExternalUserResponse|GetInternalUserResponse;

public type GetReadersResponse record {
    GetReadersQuery query;
    # Total number of records that match the query (without pagination).
    float total;
    # This is the list of paginated results, which will be an array of 20 items
    # or less, unless another limit was specified in the query params.
    GetReaderResponse[] items;
};

public type UserEmbedField string;

public type DefaultError record {
    string message;
};
