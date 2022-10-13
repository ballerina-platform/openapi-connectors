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

public type DisputeFileArr DisputeFile[];

public type BriefApplicationInfoArr BriefApplicationInfo[];

public type InlineResponse20060Arr InlineResponse20060[];

public type Meta record {
    # The current page number of a data set
    int current_page?;
    # The current position of a data set 
    int 'from?;
    # The last page of a data set
    string last_page?;
    # API path
    string path?;
    # A number of records per page
    int per_page?;
    # The last position in a data set
    int to?;
    # Total number of records in a data set
    int total?;
};

public type ReportPublished record {
    ReportpublishedHook hook?;
    ReportpublishedData data?;
};

public type CategoryWithStatuses record {
    # Status category Id
    int id?;
    # Status category name
    string name?;
    BriefStatusInfo[] statuses?;
};

public type CheckListRequest record {
    # Checklist item index
    int index?;
    string[] files?;
    int[] attached_files?;
    # Flag checklist are item completed
    boolean completed?;
    # Comment for checklist item
    string comment?;
};

public type TurboappdeclinedData record {
    TurboappdeclinedDataAccounts[] accounts?;
};

public type RetrievalreminderHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type ChargebackReplyCreditIssuedRequest record {
    # Credit transaction date
    string credit_date;
    # Credit transaction amount
    string credit_amount;
    # User note
    string user_note;
    # Files to attach
    string[] file;
};

public type TicketupdatedData record {
    record {
        *Ticket;
        *TicketCreatedBlock;
        *TicketSubscriptionData;
        # Ticket modified date
        string modified?;
        UserStructure modified_by?;
        # Ticket last comment date
        string last_comment?;
    }[] tickets?;
};

public type SignaturegeneratedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type Adjustments AdjustmentsInner[];

public type InlineResponse500 record {
    string message?;
};

public type LeadcreatedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TicketResolved record {
    TicketresolvedHook hook?;
    TicketresolvedData data?;
};

public type LeadidTasksBody record {
    # Priority
    string priority;
    # Date in ISO 8601 format (Y-m-d\TH:i:sP)
    string date;
    # End date in ISO 8601 format (Y-m-d\TH:i:sP)
    string date_end;
    # Task description
    string text;
    # Task set by user (user Id)
    string set_by;
    # Task set for user (user Id)
    string set_for;
};

# Statuses of leads whose documents should be uploaded
public type BriefsubscriptioninfoOptionsLeaddocumentuploaded record {
    # Statuses of leads whose uploaded documents should be reported (any if not specified)
    int[] statuses?;
};

public type HelpdeskBody record {
    # Type id
    int 'type;
    # Ticket subject
    string subject;
    # Ticket description
    string description?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority;
    int[] assignedUsers?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    string assignType;
    int assignTo;
    int group_id?;
    # Ticket due datetime
    string due_date?;
    # Calculate only business days
    boolean only_business_days?;
    # Notify assigned users
    boolean notify_assigned_users?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
    CheckListRequest[] checklist?;
};

public type CampaignActivity record {
    # Activity Id
    int id?;
    # New value of activity
    string newValue?;
    # User Id
    int assignedBy?;
    # Assigned date (Y-m-d\TH:i:sP)
    string assignedAt?;
};

public type TestsubscriptionData record {
    string message?;
};

public type LineitemaddedData record {
    LineItems[] line_items?;
};

public type CommentSubscriptionData record {
    string ticket_url?;
    # Assigned users
    UserListStructure assignedUsers?;
    File[] files?;
    # Indicates if the comment is visible for Merchant users
    boolean merchantVisible?;
};

public type LeadrestoredeventinfoData record {
    record {
        *ShortLeadSubscription;
        # Date and time of creation (ISO 8601)
        string restoredAt?;
        UserStructure restoredBy?;
    } lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {
        *ShortLeadSubscription;
        # Date and time of creation (ISO 8601)
        string restoredAt?;
        UserStructure restoredBy?;
    }[] leads?;
};

public type ChargebackReplyResponse record {
    ChargebackreplyresponseChargeback chargeback?;
    ChargebackreplyresponseItems items?;
    *DisputeDetailsResponse;
};

public type ChargebackUpdated record {
    ChargebackupdatedHook hook?;
    ChargebackaddedData data?;
};

public type InlineResponse20035Label record {
    int id?;
    string name?;
};

public type SourceActivity record {
    # Activity Id
    int id?;
    # New value of activity
    string newValue?;
    # User Id
    int assignedBy?;
    # Assigned date (Y-m-d\TH:i:sP)
    string assignedAt?;
};

public type ChargebackAdded record {
    ChargebackaddedHook hook?;
    ChargebackaddedData data?;
};

public type InlineResponse2008Data record {
    # Statement Id
    int id?;
    # Statement date
    string date?;
};

public type InlineResponse20025Data record {
    # Note Id
    int id?;
    # Pin note to top
    string sticky?;
    BriefTabInfo tab?;
    # Note text
    string text?;
    # Note creation date and time (ISO-8601)
    string created?;
    # Note modification date and time (ISO-8601)
    string modified?;
};

public type LeadidUsersBody record {
    # User Id
    int user;
};

public type ChargebackaddedData record {
    ChargebackReplyResponse[] chargebacks?;
};

public type ApplicationidGenerateBody record {
    # Expire the previously generated application
    boolean expire?;
};

public type DisputedetailsresponseNotes record {
    string message?;
    string added_at?;
};

public type LeadstatusupdatedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type ApplicationidSendBody record {
    @constraint:Array {maxLength: 5, minLength: 1}
    Apiv1leadsleadidsignaturesapplicationidsendRecipients[] recipients?;
    # Expire the previously generated application
    boolean expire?;
};

public type TurboappsubmitedDataApplications record {
    # Application ID
    int id?;
    # Application URL
    string application_url?;
    # Application identifier
    string identifier?;
    # Application submission identifier
    string submission_id?;
    # Merchant name
    string dba?;
    # Lead ID related to the application
    int lid?;
    # Date and time of creation (ISO 8601)
    string createdAt?;
    UserStructure createdBy?;
    # Date and time of submission (ISO 8601)
    string finishedAt?;
    UserStructure finishedBy?;
};

public type LeaddeletedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type LeadupdatedeventinfoData record {
    record {
        *FullLeadSubscription;
        # Date and time of creation (ISO 8601)
        string updated_at?;
        UserStructure updated_by?;
    } lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {
        *FullLeadSubscription;
        # Date and time of creation (ISO 8601)
        string updated_at?;
        UserStructure updated_by?;
    }[] leads?;
};

public type SubscriptionCommentEdited record {
    SubscriptioncommenteditedHook hook?;
    TicketcommentedData data?;
};

public type InlineResponse2009 record {
    string status?;
    string file_id?;
};

public type InlineResponse2008 record {
    InlineResponse2008Data[] data?;
};

public type TurboappdeclinedDataAccounts record {
    # Account ID
    int id?;
    # Application URL
    string application_url?;
    # Application identifier
    string identifier?;
    # Processor name
    string processor?;
    # Merchant name
    string dba?;
    # Merchant ID
    int mid?;
    # Lead ID related to the application
    int lid?;
    TurboappdeclinedDataActivationStatus activation_status?;
    TurboappdeclinedDataActivationStatus application_status?;
    string contact_name?;
    string contact_address?;
    string contact_phone?;
    string salesman?;
    string co_name?;
    # Date and time of account was declined (ISO 8601)
    string declined_at?;
    # Merchant name
    string legal_name?;
    TurboappdeclinedDataComments comments?;
    TurboappapprovedDataEntitlements entitlements?;
    string[] users?;
    # Date and time of account submit (ISO 8601)
    string date_submitted?;
    # Date and time of decision (ISO 8601)
    string date_decision?;
    # MCC code
    string mcc_code?;
    # Annual sales
    string annual_sales?;
    # Average ticket
    string average_ticket?;
    string tier?;
    string tier_status?;
};

public type FullleadsubscriptionCampaign record {
    # Campaign ID
    int? id?;
    # Campaign Name
    string? name?;
};

public type TicketSubscriptionData record {
    string ticket_url?;
    # Assigned users
    UserListStructure assignedUsers?;
    File[] files?;
    File[] preview_images?;
    # Ticket due date
    string due_date?;
    # Ticket SLA
    string due?;
    # Calculate only business days
    boolean only_business_days?;
};

public type RetrievalUpdated record {
    RetrievalupdatedHook hook?;
    RetrievaladdedData data?;
};

public type ApiupdatedData record {
    # Version number
    string 'version?;
    # Should users do an update of their API clients functional
    string update?;
    ApiupdatedDataDetails[] details?;
    # Date and time of creation (ISO 8601)
    string createdAt?;
};

public type ResidualsDetails record {
    string MID?;
    string DBA?;
};

public type InlineResponse401 record {
    string message?;
};

public type ShortLeadSubscription record {
    # Lead ID
    int id?;
    # Lead URL
    string lead_url?;
    # Lead Name
    string name?;
    # Lead Default Email
    string email?;
    # Lead Default Contact Name
    string contact?;
    # Lead Default Contact Phone Number
    string phone?;
    LeademailreceivedeventinfoDataAddress address?;
    # Assigned users
    UserListStructure assignedUsers?;
};

public type InlineResponse403 record {
    string message?;
};

public type InlineResponse20035Tab record {
    int id?;
    string name?;
};

public type InlineResponse405 record {
    string message?;
};

public type InlineResponse404 record {
    string message?;
};

public type TicketresolvedData record {
    record {
        # Ticket created date
        string created?;
        UserStructure created_by?;
        # Ticket modified date
        string modified?;
        UserStructure modified_by?;
        # Ticket last comment date
        string last_comment?;
        # Ticket resolved date
        string resolved?;
        UserStructure resolved_by?;
        *Ticket;
        *TicketSubscriptionData;
    }[] tickets?;
};

public type TemplateRules record {
    string column?;
    string rule?;
    int value?;
    string 'field?;
};

public type ApiUpdated record {
    ApiupdatedHook hook?;
    ApiupdatedData data?;
};

public type FullleadsubscriptionSource record {
    # Source ID
    int? id?;
    # Source Name
    string? name?;
};

public type LineitemsMerchant record {
    string mid?;
    string dba?;
};

public type FullleadsubscriptionStatus record {
    # Status ID
    int id?;
    # Status Name
    string name?;
};

public type LinksActivity record {
    # Activity Id
    int id?;
    # Status of link
    string status?;
    # Lead Id
    string lead?;
    # Merchant Id
    string merchant?;
    # User Id
    int linkedBy?;
    # Linking date (Y-m-d\TH:i:sP)
    string linkedAt?;
};

public type LeadCreatedEventInfo record {
    LeadcreatedeventinfoHook hook?;
    LeadcreatedeventinfoData data?;
};

public type LeaddocumentuploadedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type SignatureSubscription record {
    int id?;
    string hash?;
    string url?;
    string status?;
    # Signature created date
    string created?;
    UserStructure created_by?;
    boolean multi_signer?;
    boolean completed?;
    SignaturesubscriptionSigners[] signers?;
};

# Assigned users
public type UserListStructure UserStructure[];

public type TurboappapprovedDataAccounts record {
    # Account ID
    int id?;
    # Application URL
    string application_url?;
    # Application identifier
    string identifier?;
    # Processor name
    string processor?;
    # Merchant name
    string dba?;
    # Merchant ID
    int mid?;
    # Lead ID related to the application
    int lid?;
    TurboappupdatedDataActivationStatus activation_status?;
    TurboappupdatedDataActivationStatus application_status?;
    string contact_name?;
    string contact_address?;
    string contact_phone?;
    string salesman?;
    string co_name?;
    # Date and time of account approve (ISO 8601)
    string approved_at?;
    # Merchant name
    string legal_name?;
    TurboappupdatedDataComments comments?;
    TurboappapprovedDataEntitlements entitlements?;
    string[] users?;
    # Date and time of account submit (ISO 8601)
    string date_submitted?;
    # Date and time of decision (ISO 8601)
    string date_decision?;
    # MCC code
    string mcc_code?;
    # Annual sales
    string annual_sales?;
    # Average ticket
    string average_ticket?;
    string tier?;
    string tier_status?;
};

public type BriefTicketComments record {
    # Comment id
    int id?;
    # Ticket id
    int ticketId?;
    # Comment text
    string comment?;
    # Comment created date
    string created?;
    # Comment creator id
    int createdBy?;
    # Comment modified date
    string modified?;
    # Id of user who left comment
    int modifiedBy?;
    File[] files?;
    File[] preview_images?;
    # Indicates if the comment is visible to Merchant users
    boolean merchantVisible?;
};

public type ChargebackreplyresponseChargeback record {
    string id?;
    string merchant_id?;
    string dba?;
    string cycle_indicator?;
    string date?;
    string transaction_date?;
    string amount?;
    string reason_code?;
    string reason?;
    string card_number?;
    string case_number?;
    string case_action?;
    string action?;
    string reply_form?;
    string case_status?;
    string case_status_description?;
    string last_status_date?;
    string respond_due?;
    string original_amount?;
    string updated_at?;
    string mcc?;
    string dispute_jurisdiction?;
    string card_product_type?;
    string process_date?;
    string transaction_method?;
    string invoice_number?;
    string microfilm_number?;
    string airline_ticket_number?;
    string order_number?;
    string tracking_number?;
};

public type Ticket record {
    # Ticket id
    int id?;
    # Ticket subject
    string subject?;
    # Ticket description
    string description?;
    TicketStatus status?;
    TicketType 'type?;
    TicketGroup group?;
    TicketPriority priority?;
    # Assigned Lead ID
    int lead_id?;
    # Assigned Merchant ID
    int mid?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
};

public type HelpdeskTypesBody record {
    *TicketTypeRequest;
    record {*BriefTicketChecklistInfo; string[] files?;}[] checklist?;
};

public type TicketcreatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

# Copy button properties
public type LeadfieldOptionsCopy record {
    # Button label
    string title?;
    # Copy from
    record {} 'from?;
    # Copy to
    record {} to?;
};

# Options for each event
public type BriefsubscriptioninfoOptions record {
    # Statuses from which a lead should be updated
    BriefsubscriptioninfoOptionsLeadstatusupdated leadStatusUpdated?;
    # Statuses with which a lead should be created
    BriefsubscriptioninfoOptionsLeadcreated leadCreated?;
    # Statuses of leads whose notes should be added
    BriefsubscriptioninfoOptionsLeadnoteadded leadNoteAdded?;
    # Statuses of leads whose documents should be uploaded
    BriefsubscriptioninfoOptionsLeaddocumentuploaded leadDocumentUploaded?;
    # Statuses of leads whose emails should received
    BriefsubscriptioninfoOptionsLeademailreceived leadEmailReceived?;
};

public type SignaturesignedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type LeadsFieldsBody record {
    *LeadField;
    # Flag for overriding existing special field
    boolean override?;
};

public type InlineResponse2001 record {
    BriefMerchantInfo general?;
    string[] account_information?;
    # A list of linked lead Id's. First from this list is always used as a primary lead.
    int[] leads?;
};

public type InlineResponse2003 record {
    Deposits deposits?;
    Adjustments adjustments?;
    InlineResponse2003Totals totals?;
};

public type InlineResponse2002 record {
    string message?;
};

public type DisputedetailsresponseFiles record {
    string time?;
    string title?;
    # site url
    string url?;
    # api url
    string api_url?;
};

public type InlineResponse2005 record {
    Chargeback[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse2004 record {
    MonetaryBatch[] data?;
    Links links?;
    Meta meta?;
    Adjustments adjustments?;
};

public type InlineResponse2007 record {
    Retrieval[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse2006 record {
    int code?;
    string message?;
};

public type TicketcommentedData record {
    record {
        # Comment id
        int id?;
        # Ticket id
        int ticketId?;
        # Comment text
        string comment?;
        # Comment created date
        string created?;
        UserStructure createdBy?;
        # Comment modified date
        string modified?;
        UserStructure modified_by?;
        *CommentSubscriptionData;
    }[] comments?;
};

public type UserStructure record {
    # User ID
    int id?;
    # User Name
    string name?;
    # User Class
    string userClass?;
};

# 'lead' property is passed when 'Multiple at once' feature is disabled
public type LeademailreceivedeventinfoDataLead record {
    # Lead ID
    int id?;
    # Lead URL
    string lead_url?;
    # Lead Name
    string name?;
    # Lead Default Email
    string emailAddress?;
    # Lead Default Contact Name
    string contact?;
    # Lead Default Contact Phone Number
    string phone?;
    # Address
    LeademailreceivedeventinfoDataLeadAddress address?;
    # Email
    LeademailreceivedeventinfoDataLeadEmail email?;
    # Assigned users
    UserListStructure assignedUsers?;
};

public type TurboappdeclinedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type InlineResponse20018Fields record {
    # Field Id
    string id?;
    # Field name
    string 'field?;
    # Field value
    string value?;
};

public type LeadstatusupdatedeventinfoData record {
    record {
        *FullLeadSubscription;
        record {
            # Status ID
            int id?;
            # Status Name
            string name?;
        } previousStatus?;
        record {
            # Status ID
            int id?;
            # Status Name
            string name?;
        } newStatus?;
        # Date and time of creation (ISO 8601)
        string statusUpdatedAt?;
        UserStructure statusUpdatedBy?;
        UserStructure salesRep?;
    } lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {
        *FullLeadSubscription;
        record {
            # Status ID
            int id?;
            # Status Name
            string name?;
        } previousStatus?;
        record {
            # Status ID
            int id?;
            # Status Name
            string name?;
        } newStatus?;
        # Date and time of creation (ISO 8601)
        string statusUpdatedAt?;
        UserStructure statusUpdatedBy?;
        UserStructure salesRep?;
    }[] leads?;
};

public type BriefTicketChecklistInfo record {
    # Checklist item Id
    int id?;
    # Checklist template Id
    int template_id?;
    # Checklist item name
    string name?;
    # Index in list
    int index?;
    # Flag is checklist are required
    boolean required?;
    # Flag is checklist file are required
    boolean fileRequired?;
    # Flag is comment are required to resolve ticket
    boolean commentRequiredToDoneTicket?;
    # Flag is checklist are required to resolve checklist item
    boolean commentRequiredToDoneItem?;
    # Datetime when user have commented checklist item
    anydata commentedAt?;
    # User Id of user who have commented checklist item
    int commentedBy?;
};

public type SmsTemplateidBody record {int fieldId?;}|record {string phone?;};

public type LeadFieldOrder record {
    # New order position of lead field
    int value;
    # Type of changing order position
    string 'type?;
};

public type InlineResponse20061 record {
    BriefTicketTypeInfo[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20060 record {
    boolean active?;
    string 'source?;
    string date?;
    decimal user?;
    decimal assigned_by?;
};

public type InlineResponse20062 record {
    string message?;
    string movedTickets?;
};

public type MerchantsMerchantnumberBody record {
    # Merchant name
    string name?;
    # Merchant open date (YYYY-MM-DD)
    string opened?;
    # Merchant closed date (YYYY-MM-DD)
    string closed?;
    # Processor name
    string processor?;
    # Data source name
    string datasource?;
    # Group name
    string group?;
    # Is VIM?
    string vim?;
    # Merchant status
    string status?;
    # Merchant active flag
    string active?;
};

public type Apiv1leadsleadidsignaturesapplicationidsendRecipients record {
    # Lead Field Id with email address
    int fieldId?;
    # Recipient Email
    string email?;
    # Recipient Name
    string name?;
};

public type LeadidAppointmentsBody record {
    # Date in format ISO 8601 (Y-m-d\TH:i:sP)
    string date;
    # End date in format ISO 8601 (Y-m-d\TH:i:sP)
    string date_end;
    # Task description
    string text;
    # Task set by user (User Id)
    string set_by;
    # Task set for user (User Id)
    string set_for;
};

public type LeadRestoredEventInfo record {
    LeadrestoredeventinfoHook hook?;
    LeadrestoredeventinfoData data?;
};

public type RetrievalReminder record {
    RetrievalreminderHook hook?;
    RetrievalreminderData data?;
};

public type LeademailreceivedeventinfoDataAddress record {
    # Lead Default Address
    string address?;
    # Lead Default City
    string city?;
    # Lead Default State
    string state?;
    # Lead Default ZIP
    string zip?;
};

public type BriefApplicationInfo record {
    # Application Id
    int id?;
    # Application name
    string name?;
    # Is E-Sign available?
    string 'e\-sign?;
};

public type LeadupdatedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type DisputedetailsresponseMessages record {
    string message?;
    string description?;
    string added_at?;
    string viewed_on?;
};

public type LeadAppointment record {
    # Appointment Id
    int id?;
    BriefUserInfo user?;
    BriefUserInfo set_for?;
    # Appointment creation date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string set_at?;
    BriefUserInfo set_by?;
    # Appointment modification date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string modified?;
    BriefUserInfo modified_by?;
    # Appointment description
    string text?;
    # Appointment date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string date?;
    # Appointment end date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string date_end?;
    # Is appointment done?
    string done?;
    # Appointment confirmed date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string confirmed?;
    BriefUserInfo confirmed_by?;
    # Appointment seen date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string seen?;
    BriefUserInfo seen_by?;
    # Appointment rescheduled date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string rescheduled?;
    BriefUserInfo rescheduled_by?;
    int rescheduled_count?;
};

public type DisputedetailsresponseDirectories record {
    string time?;
    string title?;
    DisputedetailsresponseFiles[] files?;
};

public type DisputedetailsresponseFields record {
    string 'key?;
    string value?;
};

public type LeadcreatedeventinfoData record {
    FullLeadSubscription lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    FullLeadSubscription[] leads?;
};

public type BriefSourceInfo record {
    # Source Id
    int id?;
    # Source name
    string name?;
};

public type ApplicationfieldInfo record {
    # Field name
    string field_name?;
    # Field type
    string field_type?;
    # Padding from left
    int left?;
    # Padding from right
    int right?;
    # Padding from top
    int top?;
    # Padding from bottom
    int bottom?;
    # Height of field
    int field_height?;
    # Width of field
    int field_width?;
    # Page number
    int page_number?;
    # Page height
    int page_height?;
    # Page width
    int page_width?;
    # Page rotation
    int page_rotation?;
    # Export value
    string export_value?;
    # Field tooltip
    string tooltip?;
    ApplicationfieldDuplicates[] duplicates?;
};

public type LeademailreceivedeventinfoDataEmail record {
    # Sent from (name and email)
    string 'from?;
    # Sent to(email)
    string to?;
    # Email subject
    string subject?;
    # Email message without html
    string bodyText?;
    # Email message including html
    string bodyHtml?;
    # Date and time of receiving the email (ISO 8601)
    string sentAt?;
};

public type SignatureopenedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type RetrievalReplyCreditIssuedRequest record {
    # Credit transaction date
    string credit_date;
    # Credit transaction amount
    string credit_amount;
    # User note
    string user_note;
    # Files to attach
    string[] file;
};

public type DisputeFile record {
    # File name
    string name?;
    # Folder name
    string directory?;
    # base64 encoded content
    string content?;
};

public type LeadNoteAddedEventInfo record {
    LeadnoteaddedeventinfoHook hook?;
    LeadnoteaddedeventinfoData data?;
};

public type RetrievaladdedData record {
    RetrievalsReplyResponse[] retrievals?;
};

public type ChargebackreplyresponseItems record {
    string reason?;
    string message_from_bank?;
    string merchant_due_date?;
    string financial_disposition_date?;
    string 'type?;
};

public type ApiupdatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type AdjustmentsInner record {
    # Adjustment date
    string date?;
    # Adjustment type
    string 'type?;
    # Adjustment amount
    string amount?;
};

public type DuplicateActivity record {
    # Activity Id
    int id?;
    # Old lead Id
    int oldLeadId?;
    # New lead Id
    int newLeadId?;
    # User Id
    int duplicatedBy?;
    # Date of duplication (Y-m-d\TH:i:sP)
    string duplicatedAt?;
};

public type TicketresolvedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type LeadsBody record {
    # Campaign Id
    int campaign?;
    # Status Id
    int status;
    # Source Id
    int 'source?;
    # Group Id
    int group?;
    # Ids of users to assign to a new lead
    int[] users?;
    # Lead fields
    LeadsFields[] fields;
};

public type BriefSmsTemplate record {
    int id?;
    string title?;
};

public type TurboappupdatedDataActivationStatus record {
    string old?;
    string 'new?;
};

public type SignatureSigned record {
    SignaturesignedHook hook?;
    SignaturegeneratedData data?;
};

public type ApiupdatedDataDetails record {
    # Description of update
    string description?;
    # Link to endpoint documentation
    string link?;
    # Type of API update
    string 'type?;
};

public type ApplicationSubscription record {
    int id?;
    string title?;
    int group_id?;
    string group_name?;
};

public type LeadField record {
    # Field Id
    int id?;
    # Field tab Id
    int tab;
    # Field label
    string label;
    # Field type
    string 'type;
    # Field size
    int length?;
    # Field default value
    string default?;
    # Field alignment
    string alignment?;
    # Searchable field
    int searchable?;
    # Field special value
    string special?;
    LeadfieldOptions options?;
    int 'order?;
    # Whether the field is read only
    boolean readOnly?;
    # Whether the field is required
    boolean required?;
};

public type TicketCommented record {
    TicketcommentedHook hook?;
    TicketcommentedData data?;
};

public type TicketCreatedBlock record {
    # Ticket created date
    string created?;
    # Ticket creator id
    int created_by?;
};

public type ResidualtemplateassignedTemplates record {
    int id?;
    string name?;
    int 'version?;
    int processor_id?;
    TemplateRules[] rules?;
};

public type InlineResponse20018Details record {
    int id?;
    string name?;
    string 'type?;
    # Record Id
    int 'record?;
    InlineResponse20018Fields[] fields?;
};

public type LeadsLeadidBody record {
    # Campaign Id
    int campaign?;
    # Status Id
    int status?;
    # Source Id
    int 'source?;
    # Group Id
    int group?;
    # Lead fields
    LeadsFields[] fields?;
};

public type ChargebackreminderData record {
    record {
        *ChargebackReplyResponse;
        # Case due in days
        int due_in?;
    }[] chargebacks?;
};

public type TicketPriority record {
    # Priority id
    int id?;
    # Priority name
    string name?;
};

public type LeadnoteaddedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type FullLeadSubscription record {
    *ShortLeadSubscription;
    # Lead ID
    int id?;
    # Lead URL
    string lead_url?;
    # Lead Name
    string name?;
    # Lead Default Email
    string email?;
    # Lead Default Contact Name
    string contact?;
    # Lead Default Contact Phone Number
    string phone?;
    LeademailreceivedeventinfoDataAddress address?;
    FullleadsubscriptionGroup group?;
    FullleadsubscriptionCategory category?;
    FullleadsubscriptionStatus status?;
    FullleadsubscriptionCampaign campaign?;
    FullleadsubscriptionSource 'source?;
    # Date and time of creation (ISO 8601)
    string createdAt?;
    UserStructure createdBy?;
};

public type BrieftickettypeinfoAssignees record {
    int[] everyTime?;
    int[] roundRobin?;
};

public type Chargeback record {
    # Chargeback internal ID
    int id?;
    # Merchant ID
    string merchant_id?;
    # Merchant DBA
    string dba?;
    # Case number
    string case_number?;
    # Chargeback date
    string chargeback_date?;
    # Transaction date
    string transaction_date?;
    # Respond due date
    string respond_due?;
    # Amount
    string amount?;
    # Original amount of transaction
    string original_amount?;
    # Transaction currency
    string currency?;
    # Chargeback reason
    string reason?;
    # Chargeback reason code
    string reason_code?;
    # Cardholder number
    string card_number?;
    # Reply form type. Affects reply options.
    string reply_form?;
    # Chargeback cycle indicator
    string cycle_indicator?;
    # Transaction ID
    string transaction_id?;
    # Transaction ID
    string reference_number?;
    # Case status
    string case_status?;
    # Status description
    string case_status_description?;
    # MCC code
    string mcc?;
    # Dispute jurisdiction
    string dispute_jurisdiction?;
    # Card product
    string card_product_type?;
    # Process date
    string process_date?;
    # Transaction method
    string transaction_method?;
    # Invoice number
    string invoice_number?;
    # Microfilm number
    string microfilm_number?;
    # Airline ticket number
    string airline_ticket_number?;
    # Order number
    string order_number?;
    # Tracking number
    string tracking_number?;
    # Date of the last status update
    string last_status_date?;
    # Date of the most recent update
    string updated_at?;
    # Case action
    string case_action?;
    # Can the case be viewed of replied
    string action?;
    # Foreign amount of transaction
    string foreign_amount?;
    # Transaction locator
    string transaction_locator?;
    # Authorization code
    string authorization_code?;
    # Chargeback type
    string 'type?;
};

# Email
public type LeademailreceivedeventinfoDataLeadEmail record {
    # Sent from (name and email)
    string 'from?;
    # Sent to(email)
    string to?;
    # Email subject
    string subject?;
    # Email message without html
    string bodyText?;
    # Email message including html
    string bodyHtml?;
    # Date and time of receiving the email (ISO 8601)
    string sentAt?;
};

public type LeadDocumentUploadedEventInfo record {
    LeaddocumentuploadedeventinfoHook hook?;
    LeaddocumentuploadedeventinfoData data?;
};

public type SignaturegeneratedDataSignatures record {
    SignatureSubscription signature?;
    ApplicationSubscription application?;
    FullLeadSubscription lead?;
};

public type TurboappapprovedDataEntitlements record {
    string card_type?;
    string srv?;
    string proc_flag?;
};

public type StatusActivity record {
    # Activity Id
    int id?;
    # User Id
    int changedBy?;
    # Deleted date (Y-m-d\TH:i:sP)
    string changedAt?;
    # Old status
    string oldStatus?;
    # Old Status Id
    int old_status_id?;
    # New status
    string newStatus?;
    # New Status Id
    int new_status_id?;
};

public type DisputedetailsresponseTransactions record {
    string reference?;
    DisputedetailsresponseFields[] fields?;
};

public type TurboappdeclinedDataComments record {
    # Date and time of comment (ISO 8601)
    string date?;
    string co?;
    string text?;
};

public type LeademailreceivedeventinfoData record {
    # 'lead' property is passed when 'Multiple at once' feature is disabled
    LeademailreceivedeventinfoDataLead lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    LeademailreceivedeventinfoDataLeads[] leads?;
};

public type BriefTicketTypeInfo record {
    # Ticket type id
    int id?;
    # Ticket type name
    string name?;
    # Ticket type description
    string description?;
    # Days to Resolve
    int daysToResolve?;
    # Calculate only business days
    boolean only_business_days?;
    TicketStatus status?;
    TicketPriority priority?;
    # Ticket type created date
    string created?;
    # Ticket type creator id
    int createdBy?;
    # Ticket type modified date
    string modified?;
    # Id of user who made last change
    int modifiedBy?;
    # Ticket type order
    int 'order?;
    int[] permissions?;
    # Ticket due date
    string due_date?;
    BrieftickettypeinfoAssignees assignees?;
};

public type ChargebackReminder record {
    ChargebackreminderHook hook?;
    ChargebackreminderData data?;
};

public type LineitemsAgents record {
    int user_id?;
    string username?;
    string full_name?;
    int agent_net?;
    int percentage?;
};

public type InlineResponse20035Data record {
    # Document Id
    string id?;
    # Name
    string name?;
    # Size
    string size?;
    InlineResponse20035Tab tab?;
    InlineResponse20035Label label?;
};

public type InlineResponse20019 record {
    string message?;
};

public type ApplicationfieldDuplicates record {
    # Activity Id
    int instance?;
    # Padding from left
    int left?;
    # Padding from right
    int right?;
    # Padding from top
    int top?;
    # Padding from bottom
    int bottom?;
    # Height of field
    int height?;
    # Width of field
    int width?;
    # Page number
    int page_number?;
};

public type SignaturesubscriptionSigners record {
    string name?;
    string email?;
};

public type TicketcommentedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type RetrievalAdded record {
    RetrievaladdedHook hook?;
    RetrievaladdedData data?;
};

public type ChargebackReplyDisputeRequest record {
    # Selected documents
    string selected_doc_types;
    # Other document description
    string other_description?;
    # Compelling document
    string compelling_doc?;
    # Selected compelling
    string selected_compelling?;
    # Digital goods compelling documents
    string selected_digital_goods_04?;
    # Download date
    string download_date?;
    # Download time
    string download_time?;
    # Purchaser IP address
    string purchaser_ip_addr?;
    # Physical location
    string geographical_location?;
    # PhDevice ID
    string device_id?;
    # Device ID
    string device_name?;
    # Purchaser name
    string purchaser_name?;
    # Purchaser email
    string purchaser_email?;
    # ARN
    string arn_04?;
    # Transaction date
    string tran_date_04?;
    # ARN
    string arn_09?;
    # Transaction date
    string tran_date_09?;
    # ARN
    string arn_13?;
    # Transaction date
    string tran_date_13?;
    # IP address
    string ip_address?;
    # Email address
    string email_address?;
    # Phone number
    string phone_number?;
    # Physical address
    string physical_address?;
    # User note
    string user_note;
    # Files to attach
    string[] file;
};

public type DepositsInner record {
    # Deposit date
    string date?;
    # Deposit amount
    string amount?;
    # Transactions count
    int transactions?;
    # Deposit batch number
    string batch?;
};

public type TurboappsubmitedData record {
    TurboappsubmitedDataApplications[] applications?;
};

public type TicketcreatedData record {
    record {*Ticket; *TicketCreatedBlock; *TicketSubscriptionData;}[] tickets?;
};

public type InlineResponse20021 record {
    LeadField[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20020 record {
    string message?;
};

public type TicketGroup record {
    # Group id
    int id?;
    # Group name
    string name?;
};

public type TurboappupdatedDataAccounts record {
    # Account ID
    int id?;
    # Application URL
    string application_url?;
    # Application identifier
    string identifier?;
    # Merchant name
    string dba?;
    # Merchant ID
    int mid?;
    # Lead ID related to the application
    int lid?;
    TurboappupdatedDataComments comments?;
    TurboappupdatedDataActivationStatus activation_status?;
    TurboappupdatedDataActivationStatus application_status?;
    string contact_name?;
    string salesman?;
    # Date and time of account update (ISO 8601)
    string updatedAt?;
};

public type InlineResponse20023 record {
    LeadFieldTab[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20022 record {
    string result?;
};

public type InlineResponse20025 record {
    InlineResponse20025Data[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20024 record {
    InlineResponse20024Data[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20027 record {
    LeadAppointment[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20026 record {
    string message?;
};

public type DisputeDetailsResponse record {
    DisputedetailsresponseTransactions[] transactions?;
    DisputedetailsresponseTransactions[] auth_records?;
    DisputedetailsresponseNotes[] notes?;
    DisputedetailsresponseMessages[] messages?;
    DisputedetailsresponseDirectories[] directories?;
};

public type InlineResponse20029 record {
    string message?;
    string url?;
};

public type InlineResponse20028 record {
    string message?;
};

# Statuses of leads whose notes should be added
public type BriefsubscriptioninfoOptionsLeadnoteadded record {
    # Statuses of leads whose added notes should be reported (any if not specified)
    int[] statuses?;
};

public type LineItems record {
    int id?;
    string 'type?;
    int item_id?;
    LineitemsUser user?;
    LineitemsMerchant merchant?;
    int related_mid?;
    string related_dba?;
    string description?;
    int income?;
    int expense?;
    int percentage?;
    int agent_net?;
    boolean is_recurring?;
    # Created date of line item
    string created?;
    # Last update date of line item
    string modified?;
    LineitemsAgents[] agents?;
    # Date of start recurring line item
    string recurring_start_date?;
    # Count of payments what was already done
    int recurring_payment_count?;
    # Count of payments which will be done (this will be null if there is no limit)
    int recurring_max_payment_count?;
    string recurring_period?;
};

public type ResidualTemplate record {
    int id?;
    string name?;
    int creator_id?;
    string creator_name?;
    # Created date of template
    string created_at?;
    int revision?;
    TemplateRules[] rules?;
};

public type RetrievaladdedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type BriefMerchantInfo record {
    # Merchant number
    string mid?;
    # Merchant name
    string name?;
    # Merchant open date
    string opened?;
    # Merchant closed date
    string closed?;
    # Merchant created date
    string created?;
    # Merchant modified date
    string modified?;
    # Merchant first batch date
    string first_batch?;
    # Merchant last batch date
    string last_batch?;
    # Group name
    string group?;
    # Processor name
    string processor?;
    # Data source name
    string datasource?;
    # SIC Code
    string sic_code?;
    # Is VIM?
    string vim?;
    # Merchant deactivation date
    string deactivated?;
    # Merchant status
    string status?;
    # Merchant active flag
    string active?;
};

public type SignatureGenerated record {
    SignaturegeneratedHook hook?;
    SignaturegeneratedData data?;
};

public type InlineResponse2003TotalsAdjustments record {
    string 'type?;
    string amount?;
};

public type InlineResponse2003Totals record {
    string total_paid_by_us?;
    string monthly_total?;
    InlineResponse2003TotalsAdjustments[] adjustments?;
    InlineResponse2003TotalsDeposits[] deposits?;
    InlineResponse2003TotalsPerCardType[] per_card_type?;
    int transactions_count?;
};

public type FullleadsubscriptionCategory record {
    # Status category ID
    int id?;
    # Status category Name
    string name?;
};

public type InlineResponse20030 record {
    InlineResponse20030Data[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20039Data record {
    string status?;
    string url?;
    string templateId?;
    string templateName?;
};

public type InlineResponse20032 record {
    BriefUserInfoWithClass[] data?;
    Links links?;
    Meta meta?;
};

public type TurboappapprovedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type InlineResponse20031 record {
    string message?;
};

public type ChecklistFullInfo record {
    *BriefTicketChecklistInfo;
    # Flag is checklist are done
    boolean completed?;
    # User ID who compleated the checklist
    int completed_by?;
    # Datetime when user have completed the checklist item
    anydata completed_at?;
    File[] files?;
};

public type InlineResponse20034 record {
    string message?;
};

public type InlineResponse20033 record {
    string message?;
};

public type InlineResponse20036 record {
    FileLabel[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20035 record {
    # A list of lead documents
    InlineResponse20035Data[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20038 record {
    # Result message
    string message?;
    # Id of email what was sent
    int emailId?;
    # E-Sign hash
    string hash?;
    # E-Sign URL
    string url?;
};

public type BriefTabInfo record {
    # Tab Id
    int id?;
    # Tab name
    string name?;
};

public type InlineResponse20037 record {
    # Result message
    string message?;
    # E-Sign hash
    string hash?;
    # E-Sign URL
    string url?;
};

public type InlineResponse20039 record {
    InlineResponse20039Data[] data?;
    Links links?;
    Meta meta?;
};

public type BriefSubscriptionInfo record {
    # Subscription Id
    int id?;
    # Subscription URL
    string url;
    # Subscription Events
    string[] events;
    # Options for each event
    BriefsubscriptioninfoOptions options?;
    # Report multiple items in one request
    boolean multiple_at_once?;
};

public type RetrievalReplyResponseRequest record {
    # User note
    string user_note;
    # Files to attach
    string[] file;
};

public type ReportpublishedData record {
    ReportpublishedDataReports[] reports?;
};

public type TicketStatus record {
    # Status id
    int id?;
    # Status name
    string name?;
};

public type BriefEmailTemplate record {
    int id?;
    string title?;
};

public type FileLabel record {
    # Label Id
    int id?;
    # Label display order
    int 'order?;
    # Label name
    string name?;
};

public type InlineResponse20041 record {
    BriefEmailTemplate[] data?;
};

public type InlineResponse20040 record {
    # Email has been sent successfully
    string message?;
    # Id of email what will be sended to lead
    string emailId?;
};

public type InlineResponse20043 record {
    BriefSmsTemplate[] data?;
};

public type InlineResponse20042 record {
    # SMS has been sent successfully.
    string message?;
    # Phone number of SMS receiver.
    string receiver?;
};

public type EmailsTemplateidBody record {
    # Lead Field Id with email address
    int fieldId?;
    # Object with template placeholders
    record {} placeholders?;
}|record {
    # Recipient Email
    string email?;
    # Recipient Name
    string name?;
    # Object with template placeholders
    record {} placeholders?;
};

public type InlineResponse20045 record {
    DeletionActivity[] data?;
    Links links?;
    Meta meta?;
};

public type DeletionActivity record {
    # Activity Id
    int id?;
    # User Id
    int deletedId?;
    # Date of deletion (Y-m-d\TH:i:sP)
    string deletedAt?;
    # User Id
    int undeletedId?;
    # Date of undeletion (Y-m-d\TH:i:sP)
    string undeletedAt?;
};

public type InlineResponse20044 record {
    CampaignActivity[] data?;
    Links links?;
    Meta meta?;
};

# Statuses of leads whose emails should received
public type BriefsubscriptioninfoOptionsLeademailreceived record {
    # Statuses of leads whose received emails should be reported (any if not specified)
    int[] statuses?;
};

public type InlineResponse20047 record {
    LinksActivity[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20046 record {
    DuplicateActivity[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20049 record {
    StatusActivity[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20048 record {
    SourceActivity[] data?;
    Links links?;
    Meta meta?;
};

# Statuses from which a lead should be updated
public type BriefsubscriptioninfoOptionsLeadstatusupdated record {
    # Statuses from which a lead should be updated to report the update (any if not specified)
    int[] previousStatuses?;
    # Statuses to which a lead should be updated to report the update (any if not specified)
    int[] newStatuses?;
};

public type LeademailreceivedeventinfoDataLeads record {
    # Lead ID
    int id?;
    # Lead URL
    string lead_url?;
    # Lead Name
    string name?;
    # Lead Default Email
    string emailAddress?;
    # Lead Default Contact Name
    string contact?;
    # Lead Default Contact Phone Number
    string phone?;
    LeademailreceivedeventinfoDataAddress address?;
    LeademailreceivedeventinfoDataEmail email?;
    # Assigned users
    UserListStructure assignedUsers?;
};

public type ChargebackreminderHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TestSubscription record {
    TestsubscriptionHook hook?;
    TestsubscriptionData data?;
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

public type TurboAppDeclined record {
    TurboappdeclinedHook hook?;
    TurboappdeclinedData data?;
};

public type LeademailreceivedeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type BriefLeadInfo record {
    # Lead Id
    int id?;
    # Lead merchant Id
    int mid?;
    # Lead name
    string name?;
    BriefGroupInfo group?;
    BriefCategoryInfo category?;
    BriefStatusInfo status?;
    BriefCampaignInfo campaign?;
    BriefSourceInfo 'source?;
    # Lead creation date (Y-m-d\TH:i:sP)
    string created?;
    # Lead modification date (Y-m-d\TH:i:sP)
    string modified?;
};

public type BriefStatusInfo record {
    # Status Id
    int id?;
    # Status name
    string name?;
};

public type LineitemaddedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type MerchantRow record {
    string merchant?;
    int transactions?;
    int sales_amount?;
    int income?;
    int expense?;
    int net?;
    int bps?;
    boolean users?;
    int percentage?;
    int agent_net?;
    int mid?;
};

public type BriefUserInfo record {
    # User Id
    int id?;
    # User name
    string name?;
};

public type InlineResponse20050 record {
    ApplicationField[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20052 record {
    # A list of lead campaigns
    BriefCampaignInfo[] data?;
};

public type BriefTicketInfo record {
    *Ticket;
    *TicketCreatedBlock;
    # Ticket modified date
    string modified?;
    # Id of user who made last change
    int modified_by?;
    # Ticket resolved date
    string resolved?;
    # Id of user who made last change
    int resolved_by?;
    # Ticket due date
    string due_date?;
    # Ticket SLA
    string due?;
    # Calculate only business days
    boolean only_business_days?;
    # Ticket last comment date
    string last_comment?;
    # Count of ticket files
    int files_count?;
};

public type InlineResponse20051 record {
    string message?;
};

public type InlineResponse20054 record {
    # A list of lead sources
    BriefSourceInfo[] data?;
};

public type TicketTypeRequest record {
    # Ticket type name
    string name?;
    # Ticket type description
    string description?;
    # Days to Resolve
    int daysToResolve?;
    # Calculate only business days
    boolean only_business_days?;
    # Status
    string status?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority?;
    int[] permissions?;
    BrieftickettypeinfoAssignees assignees?;
};

public type InlineResponse20053 record {
    # A list of lead groups
    BriefGroupInfo[] data?;
};

public type TurboappupdatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type InlineResponse20056 record {
    BriefSubscriptionInfo[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse2003TotalsPerCardType record {
    string 'type?;
    string amount?;
    int count?;
};

public type BriefUserInfoWithClass record {
    # User Id
    int id?;
    # User username
    string username?;
    # User name
    string full_name?;
    # User email
    string email?;
    # User status
    string status?;
    # User class
    string 'class?;
};

public type InlineResponse20055 record {
    # A list of lead statuses
    CategoryWithStatuses[] data?;
};

public type BriefGroupInfo record {
    # Group Id
    int id?;
    # Group name
    string name?;
};

public type LeadEmailReceivedEventInfo record {
    LeademailreceivedeventinfoHook hook?;
    LeademailreceivedeventinfoData data?;
};

public type InlineResponse20058 record {
    record {*BriefTicketInfo; string created_username?; string modified_username?; string resolved_username?;}[] data?;
    Links links?;
    Meta meta?;
};

public type LineitemsUser record {
    int user_id?;
    string username?;
    string full_name?;
    string 'class?;
};

public type InlineResponse20057 record {
    # Subscription deletion message
    string message?;
};

public type InlineResponse20059 record {
    string status?;
};

# Add new list item
public type LeadfieldOptionsDropdown record {
    # Key
    string 'key?;
    # Value
    string value?;
};

public type Retrieval record {
    # Chargeback internal ID
    int id?;
    # Merchant ID
    string merchant_id?;
    # Merchant DBA
    string dba?;
    # Case number
    string case_number?;
    # Request date
    string retrieval_date?;
    # Transaction date
    string transaction_date?;
    # Amount
    string amount?;
    # Respond due date
    string respond_due?;
    # Original amount of transaction
    string original_amount?;
    # Transaction currency
    string currency?;
    # Retrieval case reason
    string reason?;
    # Retrieval case reason code
    string reason_code?;
    # Cardholder number
    string card_number?;
    # Transaction ID
    string transaction_id?;
    # Transaction ID
    string reference_number?;
    # Case status
    string case_status?;
    # Status description
    string case_status_description?;
    # MCC code
    string mcc?;
    # Dispute jurisdiction
    string dispute_jurisdiction?;
    # Card product
    string card_product_type?;
    # Transaction method
    string transaction_method?;
    # Invoice number
    string invoice_number?;
    # Microfilm number
    string microfilm_number?;
    # Airline ticket number
    string airline_ticket_number?;
    # Order number
    string order_number?;
    # Tracking number
    string tracking_number?;
    # Date of the last status update
    string last_status_date?;
    # Date of the most recent update
    string updated_at?;
    # Case action
    string case_action?;
    # Can the case be viewed of replied
    string action?;
    # Foreign amount of transaction
    string foreign_amount?;
    # Transaction locator
    string transaction_locator?;
};

public type SignatureOpened record {
    SignatureopenedHook hook?;
    SignaturegeneratedData data?;
};

public type TicketidCommentBody record {
    # Comment text
    string comment?;
    int[] notify?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    # Indicates if the comment is visible to Merchant users
    boolean merchantVisible?;
};

public type TicketupdatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TestsubscriptionHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TurboappupdatedData record {
    TurboappupdatedDataAccounts[] accounts?;
};

public type LeadsFields record {
    # Field Id
    string id;
    # Record Id
    string 'record?;
    # Field value
    string value;
};

public type ChargebackaddedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

# Statuses with which a lead should be created
public type BriefsubscriptioninfoOptionsLeadcreated record {
    # Statuses with which a created lead should be reported (any if not specified)
    int[] statuses?;
};

public type TicketDetail record {
    File[] general?;
    ChecklistFullInfo[] checklist?;
};

public type TurboappapprovedData record {
    TurboappapprovedDataAccounts[] accounts?;
};

public type SubscriptioncommenteditedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TurboappupdatedDataComments record {
    # Date and time of comment (ISO 8601)
    string date?;
    string co?;
    string text?;
};

public type RetrievalsReplyResponse record {
    RetrievalsreplyresponseRetrieval retrieval?;
    *DisputeDetailsResponse;
};

public type TicketCreated record {
    TicketcreatedHook hook?;
    TicketcreatedData data?;
};

public type HelpdeskTicketidBody record {
    # Type id
    int 'type?;
    # Ticket subject
    string subject?;
    # Ticket description
    string description?;
    # Ticket status
    string status?;
    # Priority (0 - Normal, 1 - Medium, 2 - Rush)
    int priority?;
    int[] assignedUsers?;
    # Ticket due datetime
    string due_date?;
    # Calculate only business days
    boolean only_business_days?;
    string assignType?;
    int assignTo?;
    string[] files?;
    int[] attached_files?;
    string[] preview_images?;
    int group_id?;
    # Indicates if the ticket is visible to Merchant users
    boolean merchantVisible?;
    record {*CheckListRequest; string[] new_files?; int[] attached_files?;}[] checklist?;
};

public type RetrievalreminderData record {
    record {
        *RetrievalsReplyResponse;
        # Case due in days
        int due_in?;
    }[] retrievals?;
};

public type MonetaryBatch record {
    # Batch date
    string date?;
    # Batch description
    string reference_number?;
    # Batch amount
    string amount?;
    # A number of transactions
    string count?;
    # Batch terminal number
    string terminal_number?;
    MonetarybatchTransactions[] transactions?;
};

public type TurboAppApproved record {
    TurboappapprovedHook hook?;
    TurboappapprovedData data?;
};

public type Deposits DepositsInner[];

public type LeadnoteaddedeventinfoData record {
    record {
        *ShortLeadSubscription;
        record {
            # Note ID
            int id?;
            # Note text
            string name?;
            # Whether The Note Is Pinned
            boolean pinned?;
            string[] images?;
            # Date and time of creation (ISO 8601)
            string createdAt?;
            UserStructure createdBy?;
        } note?;
    } lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {
        *ShortLeadSubscription;
        record {
            # Note ID
            int id?;
            # Note text
            string name?;
            # Whether The Note Is Pinned
            boolean pinned?;
            string[] images?;
            # Date and time of creation (ISO 8601)
            string createdAt?;
            UserStructure createdBy?;
        } note?;
    }[] leads?;
};

public type InlineResponse20024Data record {
    # Template Id
    int id?;
    # Template name
    string name?;
    # Template creator
    int created_by?;
    # Template modification date and time (ISO-8601)
    string created_at?;
    # Template modification date and time (ISO-8601)
    int modified_by?;
    # Last template editor
    string modified_at?;
    # Last fields editor
    int fields_changed_by?;
    # Last fileds modification date and time (ISO-8601)
    string fields_changed_at?;
    InlineResponse20024Values[] values?;
};

public type LeaddeletedeventinfoData record {
    record {*ShortLeadSubscription; UserStructure deletedBy?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*ShortLeadSubscription; UserStructure deletedBy?;}[] leads?;
};

public type ResidualTemplateAssigned record {
    int user_id?;
    string username?;
    string full_name?;
    ResidualtemplateassignedTemplates[] templates?;
};

public type TicketUpdated record {
    TicketupdatedHook hook?;
    TicketupdatedData data?;
};

public type TurboappsubmitedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type FullleadsubscriptionGroup record {
    # Group ID
    int id?;
    # Group Name
    string name?;
};

public type LeadStatusUpdatedEventInfo record {
    LeadstatusupdatedeventinfoHook hook?;
    LeadstatusupdatedeventinfoData data?;
};

public type File record {
    int id?;
    string name?;
    int size?;
    # File creation date (Y-m-d\TH:i:sP)
    string created?;
    int created_by?;
};

public type ApplicationField record {
    # Application field Id
    int id?;
    # Application field from field Id
    int 'from;
    # Application field record
    int 'record?;
    # Name of mapped field
    string to?;
    # Alt of mapped field
    string toAlt?;
    # Type of mapped field
    string toType?;
    # Special type of mapped field
    string special?;
    ApplicationfieldInfo[] info?;
};

public type TypesTypeidBody record {
    *TicketTypeRequest;
    record {*BriefTicketChecklistInfo; string[] files?; string[] new_files?;}[] checklist?;
};

public type TurboAppUpdated record {
    TurboappupdatedHook hook?;
    TurboappupdatedData data?;
};

public type InlineResponse20030Data record {
    # Task Id
    int id?;
    BriefUserInfo user?;
    # Task description
    string text?;
    # Task Date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string date?;
    # Task confirmed date and time in format ISO 8601 (Y-m-d\TH:i:sP)
    string confirmed?;
};

public type LeadDeletedEventInfo record {
    LeaddeletedeventinfoHook hook?;
    LeaddeletedeventinfoData data?;
};

public type InlineResponse2003TotalsDeposits record {
    string date?;
    string amount?;
};

public type InlineResponse200 record {
    record {
        *BriefMerchantInfo;
        # List of Lead IDs
        int[] leads?;
    }[] data?;
    Links links?;
    Meta meta?;
};

public type ChargebackupdatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type TypeDetail record {
    BriefTicketTypeInfo general?;
    ChecklistFullInfo[] checklist?;
};

public type SummaryResponse record {
    int processor_id?;
    string name?;
    string created?;
    int created_by?;
    string modified?;
    int modified_by?;
    int merchants_count?;
    int sum_transactions?;
    decimal sum_sales_amount?;
    decimal sum_income?;
    decimal sum_expense?;
    decimal sum_net?;
    decimal sum_bps?;
    int sum_agent_net?;
};

public type LeadFieldTab record {
    # Tab Id
    int id?;
    # Active tab
    int active?;
    # Tab position
    int position;
    # Tab class
    string 'class;
    # Tab class
    string name;
    # Tab order
    int 'order;
};

public type LeaddocumentuploadedeventinfoData record {
    record {
        *ShortLeadSubscription;
        record {
            # Document ID
            int id?;
            # Document label
            string label?;
            # Filename
            string filename?;
            # File url
            string file?;
            # Date and time of uploading (ISO 8601)
            string uploadedAt?;
            UserStructure uploadedBy?;
        } document?;
    } lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {
        *ShortLeadSubscription;
        record {
            # Document ID
            int id?;
            # Document label
            string label?;
            # Filename
            string filename?;
            # File url
            string file?;
            # Date and time of uploading (ISO 8601)
            string uploaded_at?;
            UserStructure uploaded_by?;
        } document?;
    }[] leads?;
};

public type TurboappdeclinedDataActivationStatus record {
    string old?;
    string 'new?;
};

public type LeadUpdatedEventInfo record {
    LeadupdatedeventinfoHook hook?;
    LeadupdatedeventinfoData data?;
};

public type BriefTicketUsersInfo record {
    # User id
    int id?;
    # User name
    string name?;
    # User class
    string 'class?;
};

public type MonetarybatchTransactions record {
    # Transaction ID
    int id?;
    # Transaction date
    string date?;
    # Transaction type
    string 'type?;
    # Transaction amount
    string amount?;
    # Cardholder number
    string cardholder?;
    # Transaction auth code
    string auth_code?;
    # POS entry mode
    string pos_entry_mode?;
    # Invoice number
    string invoice_number?;
    # Is a transaction rejected?
    boolean void_reject_chargeback?;
};

public type BriefCampaignInfo record {
    # Campaign Id
    int id?;
    # Campaign name
    string name?;
};

public type TicketType record {
    # Type id
    int id?;
    # Ticket type
    string name?;
};

public type LineItemAdded record {
    LineitemaddedHook hook?;
    LineitemaddedData data?;
};

public type RetrievalReplyUnableRequest record {
    # User note
    string user_note;
    # Files to attach
    string[] file;
};

public type RetrievalupdatedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type InlineResponse20024Values record {
    int field_id?;
    string value?;
};

public type ReportpublishedDataReports record {
    int id?;
    int month?;
    int year?;
    int sys_prin?;
    # Ticket created date
    string created?;
    UserStructure created_by?;
    int added_merchants_count?;
    int rows_count?;
    int revision?;
    int deactivated_merchants_count?;
    int processor_id?;
    string processor_name?;
    int sum_transactions?;
    decimal sum_volume?;
    decimal sum_net?;
    int sum_agent_net?;
};

public type LeadidNotesBody record {
    # Tab Id
    int tab;
    # Note text
    string note;
    # Pin to top?
    string sticky;
};

public type LeadrestoredeventinfoHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type BriefCategoryInfo record {
    # Status category Id
    int id?;
    # Status category name
    string name?;
};

public type RetrievalsreplyresponseRetrieval record {
    string id?;
    string merchant_id?;
    string dba?;
    string date?;
    string transaction_date?;
    string amount?;
    string reason_code?;
    string reason?;
    string card_number?;
    string case_number?;
    string case_action?;
    string action?;
    string case_status?;
    string case_status_description?;
    string last_status_date?;
    string respond_due?;
    string original_amount?;
    string updated_at?;
    string mcc?;
    string dispute_jurisdiction?;
    string card_product_type?;
    string foreign_amount?;
    string transaction_method?;
    string transaction_locator?;
    string invoice_number?;
    string microfilm_number?;
    string airline_ticket_number?;
    string order_number?;
    string tracking_number?;
};

public type SignaturegeneratedData record {
    SignaturegeneratedDataSignatures[] signatures?;
};

public type ReportpublishedHook record {
    # Request ID
    int requestId?;
    # Event ID
    string event?;
};

public type InlineResponse20010 record {
    SummaryResponse[] data?;
    Links links?;
    Meta meta?;
};

public type FieldsFieldidBody record {
    *LeadField;
    # Flag for overriding existing special field
    boolean override?;
};

public type InlineResponse20012 record {
    ResidualsDetails[] data?;
    Links links?;
    Meta meta?;
};

public type Links record {
    # An URL to the first page of the data set
    string first?;
    # An URL to the last page of the data set
    string last?;
    # An URL to the previous page of the data set
    string prev?;
    # An URL to the next page of the data set
    string next?;
};

public type InlineResponse20011 record {
    MerchantRow[] data?;
    Links links?;
    Meta meta?;
};

public type LeadfieldOptions record {
    # Add new list item
    LeadfieldOptionsDropdown dropdown?;
    # Enable dupecheck
    boolean dupecheck?;
    # Id of contact field
    string contactid?;
    # Field mask
    string mask?;
    # Copy button properties
    LeadfieldOptionsCopy copy?;
    # Enable hyperlink
    boolean hyperlink?;
    # Enable SMS
    boolean sms?;
    # Enable dialer
    boolean dialer?;
    # Google Maps search properties
    record {} googlemaps?;
    # ZIP Code autofill properties
    LeadfieldOptionsZipcodeAutocomplete zipcode_autocomplete?;
};

# Address
public type LeademailreceivedeventinfoDataLeadAddress record {
    # Lead Default Address
    string address?;
    # Lead Default City
    string city?;
    # Lead Default State
    string state?;
    # Lead Default ZIP
    string zip?;
};

public type InlineResponse20014 record {
    ResidualTemplate[] data?;
    Links links?;
    Meta meta?;
};

public type TurboAppSubmited record {
    TurboappsubmitedHook hook?;
    TurboappsubmitedData data?;
};

public type InlineResponse20013 record {
    LineItems[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20016 record {
    BriefLeadInfo[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20015 record {
    ResidualTemplateAssigned[] data?;
    Links links?;
    Meta meta?;
};

public type InlineResponse20018 record {
    BriefLeadInfo general?;
    InlineResponse20018Details[] details?;
};

public type InlineResponse20017 record {
    # Lead Id
    int leadId?;
    # Result message
    string message?;
};
