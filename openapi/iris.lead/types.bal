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

public type Meta record {
    # The current page number of a data set
    int? current_page?;
    # The current position of a data set 
    int? 'from?;
    # The last page of a data set
    string? last_page?;
    # API path
    string? path?;
    # A number of records per page
    int? per_page?;
    # The last position in a data set
    int? to?;
    # Total number of records in a data set
    int? total?;
};

public type CategoryWithStatuses record {
    # Status category Id
    int? id?;
    # Status category name
    string? name?;
    BriefStatusInfo[]? statuses?;
};

public type CampaignActivity record {
    # Activity Id
    int? id?;
    # New value of activity
    string? newValue?;
    # User Id
    int? assignedBy?;
    # Assigned date (Y-m-d\TH:i:sP)
    string? assignedAt?;
};

public type InlineResponse20035Label record {
    int? id?;
    string? name?;
};

public type SourceActivity record {
    # Activity Id
    int? id?;
    # New value of activity
    string? newValue?;
    # User Id
    int? assignedBy?;
    # Assigned date (Y-m-d\TH:i:sP)
    string? assignedAt?;
};

public type InlineResponse20025Data record {
    # Note Id
    int? id?;
    # Pin note to top
    string? sticky?;
    BriefTabInfo? tab?;
    # Note text
    string? text?;
    # Note creation date and time (ISO-8601)
    string? created?;
    # Note modification date and time (ISO-8601)
    string? modified?;
};

public type InlineResponse20035Tab record {
    int? id?;
    string? name?;
};

public type LinksActivity record {
    # Activity Id
    int? id?;
    # Status of link
    string? status?;
    # Lead Id
    string? lead?;
    # Merchant Id
    string? merchant?;
    # User Id
    int? linkedBy?;
    # Linking date (Y-m-d\TH:i:sP)
    string? linkedAt?;
};

# Copy button properties
public type LeadfieldOptionsCopy record {
    # Button label
    string? title?;
    # Copy from
    record {} 'from?;
    # Copy to
    record {} to?;
};

public type InlineResponse20018Fields record {
    # Field Id
    string? id?;
    # Field name
    string? 'field?;
    # Field value
    string? value?;
};

public type Apiv1leadsFields record {
    # Field Id
    string? id;
    # Record Id
    string? 'record?;
    # Field value
    string? value;
};

public type LeadFieldOrder record {
    # New order position of lead field
    int? value;
    # Type of changing order position
    string? 'type?;
};

public type LeadAppointment record {
    # Appointment Id
    int? id?;
    BriefUserInfo? user?;
    BriefUserInfo? set_for?;
    # Appointment creation date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? set_at?;
    BriefUserInfo? set_by?;
    # Appointment modification date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? modified?;
    BriefUserInfo? modified_by?;
    # Appointment description
    string? text?;
    # Appointment date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? date?;
    # Appointment end date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? date_end?;
    # Is appointment done?
    string? done?;
    # Appointment confirmed date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? confirmed?;
    BriefUserInfo? confirmed_by?;
    # Appointment seen date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? seen?;
    BriefUserInfo? seen_by?;
    # Appointment rescheduled date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? rescheduled?;
    BriefUserInfo? rescheduled_by?;
    int? rescheduled_count?;
};

public type BriefSourceInfo record {
    # Source Id
    int? id?;
    # Source name
    string? name?;
};

public type DuplicateActivity record {
    # Activity Id
    int? id?;
    # Old lead Id
    int? oldLeadId?;
    # New lead Id
    int? newLeadId?;
    # User Id
    int? duplicatedBy?;
    # Date of duplication (Y-m-d\TH:i:sP)
    string? duplicatedAt?;
};

public type BriefSmsTemplate record {
    int? id?;
    string? title?;
};

public type LeadField record {
    # Field Id
    int? id?;
    # Field tab Id
    int? tab;
    # Field label
    string? label;
    # Field type
    string? 'type;
    # Field size
    int? length?;
    # Field default value
    string? 'default?;
    # Field alignment
    string? alignment?;
    # Searchable field
    int? searchable?;
    # Field special value
    string? special?;
    LeadfieldOptions? options?;
    int? 'order?;
    # Whether the field is read only
    boolean? readOnly?;
    # Whether the field is required
    boolean? required?;
};

public type InlineResponse20018Details record {
    int? id?;
    string? name?;
    string? 'type?;
    # Record Id
    int? 'record?;
    InlineResponse20018Fields[]? fields?;
};

public type StatusActivity record {
    # Activity Id
    int? id?;
    # User Id
    int? changedBy?;
    # Deleted date (Y-m-d\TH:i:sP)
    string? changedAt?;
    # Old status
    string? oldStatus?;
    # Old Status Id
    int? old_status_id?;
    # New status
    string? newStatus?;
    # New Status Id
    int? new_status_id?;
};

public type InlineResponse20035Data record {
    # Document Id
    string? id?;
    # Name
    string? name?;
    # Size
    string? size?;
    InlineResponse20035Tab? tab?;
    InlineResponse20035Label? label?;
};

public type InlineResponse20019 record {
    string? message?;
};

public type InlineResponse20021 record {
    LeadField[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20020 record {
    string? message?;
};

public type InlineResponse20023 record {
    LeadFieldTab[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20022 record {
    string? result?;
};

public type InlineResponse20025 record {
    InlineResponse20025Data[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20024 record {
    InlineResponse20024Data[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20027 record {
    LeadAppointment[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20026 record {
    string? message?;
};

public type InlineResponse20029 record {
    string? message?;
    string? url?;
};

public type InlineResponse20028 record {
    string? message?;
};

public type InlineResponse20030 record {
    InlineResponse20030Data[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20032 record {
    BriefUserInfoWithClass[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20031 record {
    string? message?;
};

public type InlineResponse20034 record {
    string? message?;
};

public type InlineResponse20033 record {
    string? message?;
};

public type InlineResponse20036 record {
    FileLabel[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20035 record {
    # A list of lead documents
    InlineResponse20035Data[]? data?;
    Links? links?;
    Meta? meta?;
};

public type BriefTabInfo record {
    # Tab Id
    int? id?;
    # Tab name
    string? name?;
};

public type BriefEmailTemplate record {
    int? id?;
    string? title?;
};

public type FileLabel record {
    # Label Id
    int? id?;
    # Label display order
    int? 'order?;
    # Label name
    string? name?;
};

public type InlineResponse20041 record {
    BriefEmailTemplate[]? data?;
};

public type InlineResponse20040 record {
    # Email has been sent successfully
    string? message?;
    # Id of email what will be sended to lead
    string? emailId?;
};

public type InlineResponse20043 record {
    BriefSmsTemplate[]? data?;
};

public type InlineResponse20042 record {
    # SMS has been sent successfully.
    string? message?;
    # Phone number of SMS receiver.
    string? receiver?;
};

public type InlineResponse20045 record {
    DeletionActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type DeletionActivity record {
    # Activity Id
    int? id?;
    # User Id
    int? deletedId?;
    # Date of deletion (Y-m-d\TH:i:sP)
    string? deletedAt?;
    # User Id
    int? undeletedId?;
    # Date of undeletion (Y-m-d\TH:i:sP)
    string? undeletedAt?;
};

public type InlineResponse20044 record {
    CampaignActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20047 record {
    LinksActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20046 record {
    DuplicateActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20049 record {
    StatusActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20048 record {
    SourceActivity[]? data?;
    Links? links?;
    Meta? meta?;
};

public type Body8 record {
    # User Id
    int? user;
};

# ZIP Code autofill properties
public type LeadfieldOptionsZipcodeAutocomplete record {
    # City fields
    record {} city?;
    # State fields
    record {} state?;
    # Zipcode fields
    record {} zipcode?;
};

public type Body6 record {
    # Date in format ISO 8601 (Y-m-d\TH:i:sP)
    string? date;
    # End date in format ISO 8601 (Y-m-d\TH:i:sP)
    string? date_end;
    # Task description
    string? text;
    # Task set by user (User Id)
    string? set_by;
    # Task set for user (User Id)
    string? set_for;
};

public type BriefLeadInfo record {
    # Lead Id
    int? id?;
    # Lead merchant Id
    int? mid?;
    # Lead name
    string? name?;
    BriefGroupInfo? 'group?;
    BriefCategoryInfo? category?;
    BriefStatusInfo? status?;
    BriefCampaignInfo? campaign?;
    BriefSourceInfo? 'source?;
    # Lead creation date (Y-m-d\TH:i:sP)
    string? created?;
    # Lead modification date (Y-m-d\TH:i:sP)
    string? modified?;
};

public type Body7 record {
    # Priority
    string? priority;
    # Date in ISO 8601 format (Y-m-d\TH:i:sP)
    string? date;
    # End date in ISO 8601 format (Y-m-d\TH:i:sP)
    string? date_end;
    # Task description
    string? text;
    # Task set by user (user Id)
    string? set_by;
    # Task set for user (user Id)
    string? set_for;
};

public type Body4 record {
    *LeadField;
    # Flag for overriding existing special field
    boolean? override?;
};

public type Body5 record {
    # Tab Id
    int? tab;
    # Note text
    string? note;
    # Pin to top?
    string? sticky;
};

public type Body2 record {
    # Campaign Id
    int? campaign?;
    # Status Id
    int? status?;
    # Source Id
    int? 'source?;
    # Group Id
    int? 'group?;
    # Lead fields
    Apiv1leadsFields[]? fields?;
};

public type BriefStatusInfo record {
    # Status Id
    int? id?;
    # Status name
    string? name?;
};

public type Body3 record {
    *LeadField;
    # Flag for overriding existing special field
    boolean? override?;
};

public type BriefUserInfo record {
    # User Id
    int? id?;
    # User name
    string? name?;
};

public type InlineResponse20052 record {
    # A list of lead campaigns
    BriefCampaignInfo[]? data?;
};

public type InlineResponse20054 record {
    # A list of lead sources
    BriefSourceInfo[]? data?;
};

public type InlineResponse20053 record {
    # A list of lead groups
    BriefGroupInfo[]? data?;
};

public type BriefUserInfoWithClass record {
    # User Id
    int? id?;
    # User username
    string? username?;
    # User name
    string? full_name?;
    # User email
    string? email?;
    # User status
    string? status?;
    # User class
    string? 'class?;
};

public type Body1 record {
    # Campaign Id
    int? campaign?;
    # Status Id
    int? status;
    # Source Id
    int? 'source?;
    # Group Id
    int? 'group?;
    # Ids of users to assign to a new lead
    int[]? users?;
    # Lead fields
    Apiv1leadsFields[]? fields;
};

public type InlineResponse20055 record {
    # A list of lead statuses
    CategoryWithStatuses[]? data?;
};

public type BriefGroupInfo record {
    # Group Id
    int? id?;
    # Group name
    string? name?;
};

# Add new list item
public type LeadfieldOptionsDropdown record {
    # Key
    string? 'key?;
    # Value
    string? value?;
};

public type  Body12 record {}|record {};

public type  Body11 record {}|record {};

public type InlineResponse20024Data record {
    # Template Id
    int? id?;
    # Template name
    string? name?;
    # Template creator
    int? created_by?;
    # Template modification date and time (ISO-8601)
    string? created_at?;
    # Template modification date and time (ISO-8601)
    int? modified_by?;
    # Last template editor
    string? modified_at?;
    # Last fields editor
    int? fields_changed_by?;
    # Last fileds modification date and time (ISO-8601)
    string? fields_changed_at?;
    InlineResponse20024Values[]? values?;
};

public type InlineResponse20030Data record {
    # Task Id
    int? id?;
    BriefUserInfo? user?;
    # Task description
    string? text?;
    # Task Date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? date?;
    # Task confirmed date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string? confirmed?;
};

public type LeadFieldTab record {
    # Tab Id
    int? id?;
    # Active tab
    int? active?;
    # Tab position
    int? position;
    # Tab class
    string? 'class;
    # Tab class
    string? name;
    # Tab order
    int? 'order;
};

public type BriefCampaignInfo record {
    # Campaign Id
    int? id?;
    # Campaign name
    string? name?;
};

public type InlineResponse20024Values record {
    int? field_id?;
    string? value?;
};

public type BriefCategoryInfo record {
    # Status category Id
    int? id?;
    # Status category name
    string? name?;
};

public type Links record {
    # An URL to the first page of the data set
    string? first?;
    # An URL to the last page of the data set
    string? last?;
    # An URL to the previous page of the data set
    string? prev?;
    # An URL to the next page of the data set
    string? next?;
};

public type LeadfieldOptions record {
    # Add new list item
    LeadfieldOptionsDropdown? dropdown?;
    # Enable dupecheck
    boolean? dupecheck?;
    # Id of contact field
    string? contactid?;
    # Field mask
    string? mask?;
    # Copy button properties
    LeadfieldOptionsCopy? copy?;
    # Enable hyperlink
    boolean? hyperlink?;
    # Enable SMS
    boolean? sms?;
    # Enable dialer
    boolean? dialer?;
    # Google Maps search properties
    record {} googlemaps?;
    # ZIP Code autofill properties
    LeadfieldOptionsZipcodeAutocomplete? zipcode_autocomplete?;
};

public type InlineResponse20016 record {
    BriefLeadInfo[]? data?;
    Links? links?;
    Meta? meta?;
};

public type InlineResponse20018 record {
    BriefLeadInfo? general?;
    InlineResponse20018Details[]? details?;
};

public type InlineResponse20017 record {
    # Lead Id
    int? leadId?;
    # Result message
    string? message?;
};
