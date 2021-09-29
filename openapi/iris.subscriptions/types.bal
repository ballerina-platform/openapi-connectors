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

public type ReportPublished record {
    ReportpublishedHook? hook?;
    ReportpublishedData? data?;
};

public type TurboappdeclinedData record {
    TurboappdeclinedDataAccounts[]? accounts?;
};

public type RetrievalreminderHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TicketupdatedData record {
    record {*Ticket; *TicketCreatedBlock; *TicketSubscriptionData; # Ticket modified date
        string? modified?; UserStructure? modified_by?; # Ticket last comment date
        string? last_comment?;}[]? tickets?;
};

public type SignaturegeneratedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LeadcreatedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TicketResolved record {
    TicketresolvedHook? hook?;
    TicketresolvedData? data?;
};

# Statuses of leads whose documents should be uploaded
public type BriefsubscriptioninfoOptionsLeaddocumentuploaded record {
    # Statuses of leads whose uploaded documents should be reported (any if not specified)
    int[]? statuses?;
};

public type TestsubscriptionData record {
    string? message?;
};

public type LineitemaddedData record {
    LineItems[]? line_items?;
};

public type CommentSubscriptionData record {
    string? ticket_url?;
    # Assigned users
    UserListStructure? assignedUsers?;
    File[]? files?;
    # Indicates if the comment is visible for Merchant users
    boolean? merchantVisible?;
};

public type LeadrestoredeventinfoData record {
    record {*ShortLeadSubscription; # Date and time of creation (ISO 8601)
        string? restoredAt?; UserStructure? restoredBy?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*ShortLeadSubscription; # Date and time of creation (ISO 8601)
        string? restoredAt?; UserStructure? restoredBy?;}[]? leads?;
};

public type ChargebackReplyResponse record {
    ChargebackreplyresponseChargeback? chargeback?;
    ChargebackreplyresponseItems? items?;
    *DisputeDetailsResponse;
};

public type ChargebackUpdated record {
    ChargebackupdatedHook? hook?;
    ChargebackaddedData? data?;
};

public type ChargebackAdded record {
    ChargebackaddedHook? hook?;
    ChargebackaddedData? data?;
};

public type ChargebackaddedData record {
    ChargebackReplyResponse[]? chargebacks?;
};

public type DisputedetailsresponseNotes record {
    string? message?;
    string? added_at?;
};

public type LeadstatusupdatedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TurboappsubmitedDataApplications record {
    # Application ID
    int? id?;
    # Application URL
    string? application_url?;
    # Application identifier
    string? identifier?;
    # Application submission identifier
    string? submission_id?;
    # Merchant name
    string? dba?;
    # Lead ID related to the application
    int? lid?;
    # Date and time of creation (ISO 8601)
    string? createdAt?;
    UserStructure? createdBy?;
    # Date and time of submission (ISO 8601)
    string? finishedAt?;
    UserStructure? finishedBy?;
};

public type LeaddeletedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LeadupdatedeventinfoData record {
    record {*FullLeadSubscription; # Date and time of creation (ISO 8601)
        string? updated_at?; UserStructure? updated_by?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*FullLeadSubscription; # Date and time of creation (ISO 8601)
        string? updated_at?; UserStructure? updated_by?;}[]? leads?;
};

public type SubscriptionCommentEdited record {
    SubscriptioncommenteditedHook? hook?;
    TicketcommentedData? data?;
};

public type TurboappdeclinedDataAccounts record {
    # Account ID
    int? id?;
    # Application URL
    string? application_url?;
    # Application identifier
    string? identifier?;
    # Processor name
    string? processor?;
    # Merchant name
    string? dba?;
    # Merchant ID
    int? mid?;
    # Lead ID related to the application
    int? lid?;
    TurboappdeclinedDataActivationStatus? activation_status?;
    TurboappdeclinedDataActivationStatus? application_status?;
    string? contact_name?;
    string? contact_address?;
    string? contact_phone?;
    string? salesman?;
    string? co_name?;
    # Date and time of account was declined (ISO 8601)
    string? declined_at?;
    # Merchant name
    string? legal_name?;
    TurboappdeclinedDataComments? comments?;
    TurboappapprovedDataEntitlements? entitlements?;
    string[]? users?;
    # Date and time of account submit (ISO 8601)
    string? date_submitted?;
    # Date and time of decision (ISO 8601)
    string? date_decision?;
    # MCC code
    string? mcc_code?;
    # Annual sales
    string? annual_sales?;
    # Average ticket
    string? average_ticket?;
    string? tier?;
    string? tier_status?;
};

public type FullleadsubscriptionCampaign record {
    # Campaign ID
    int? id?;
    # Campaign Name
    string? name?;
};

public type TicketSubscriptionData record {
    string? ticket_url?;
    # Assigned users
    UserListStructure? assignedUsers?;
    File[]? files?;
    File[]? preview_images?;
    # Ticket due date
    string? due_date?;
    # Ticket SLA
    string? due?;
    # Calculate only business days
    boolean? only_business_days?;
};

public type RetrievalUpdated record {
    RetrievalupdatedHook? hook?;
    RetrievaladdedData? data?;
};

public type ApiupdatedData record {
    # Version number
    string? 'version?;
    # Should users do an update of their API clients functional
    string? update?;
    ApiupdatedDataDetails[]? details?;
    # Date and time of creation (ISO 8601)
    string? createdAt?;
};

public type ShortLeadSubscription record {
    # Lead ID
    int? id?;
    # Lead URL
    string? lead_url?;
    # Lead Name
    string? name?;
    # Lead Default Email
    string? email?;
    # Lead Default Contact Name
    string? contact?;
    # Lead Default Contact Phone Number
    string? phone?;
    LeademailreceivedeventinfoDataAddress? address?;
    # Assigned users
    UserListStructure? assignedUsers?;
};

public type TicketresolvedData record {
    record {# Ticket created date
        string? created?; UserStructure? created_by?; # Ticket modified date
        string? modified?; UserStructure? modified_by?; # Ticket last comment date
        string? last_comment?; # Ticket resolved date
        string? resolved?; UserStructure? resolved_by?; *Ticket; *TicketSubscriptionData;}[]? tickets?;
};

public type ApiUpdated record {
    ApiupdatedHook? hook?;
    ApiupdatedData? data?;
};

public type FullleadsubscriptionSource record {
    # Source ID
    int? id?;
    # Source Name
    string? name?;
};

public type LineitemsMerchant record {
    string? mid?;
    string? dba?;
};

public type FullleadsubscriptionStatus record {
    # Status ID
    int? id?;
    # Status Name
    string? name?;
};

public type LeadCreatedEventInfo record {
    LeadcreatedeventinfoHook? hook?;
    LeadcreatedeventinfoData? data?;
};

public type LeaddocumentuploadedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type SignatureSubscription record {
    int? id?;
    string? hash?;
    string? url?;
    string? status?;
    # Signature created date
    string? created?;
    UserStructure? created_by?;
    boolean? multi_signer?;
    boolean? completed?;
    SignaturesubscriptionSigners[]? signers?;
};

# Assigned users
# Assigned users
public type UserListStructure UserStructure[]?;

public type TurboappapprovedDataAccounts record {
    # Account ID
    int? id?;
    # Application URL
    string? application_url?;
    # Application identifier
    string? identifier?;
    # Processor name
    string? processor?;
    # Merchant name
    string? dba?;
    # Merchant ID
    int? mid?;
    # Lead ID related to the application
    int? lid?;
    TurboappupdatedDataActivationStatus? activation_status?;
    TurboappupdatedDataActivationStatus? application_status?;
    string? contact_name?;
    string? contact_address?;
    string? contact_phone?;
    string? salesman?;
    string? co_name?;
    # Date and time of account approve (ISO 8601)
    string? approved_at?;
    # Merchant name
    string? legal_name?;
    TurboappupdatedDataComments? comments?;
    TurboappapprovedDataEntitlements? entitlements?;
    string[]? users?;
    # Date and time of account submit (ISO 8601)
    string? date_submitted?;
    # Date and time of decision (ISO 8601)
    string? date_decision?;
    # MCC code
    string? mcc_code?;
    # Annual sales
    string? annual_sales?;
    # Average ticket
    string? average_ticket?;
    string? tier?;
    string? tier_status?;
};

public type ChargebackreplyresponseChargeback record {
    string? id?;
    string? merchant_id?;
    string? dba?;
    string? cycle_indicator?;
    string? date?;
    string? transaction_date?;
    string? amount?;
    string? reason_code?;
    string? reason?;
    string? card_number?;
    string? case_number?;
    string? case_action?;
    string? action?;
    string? reply_form?;
    string? case_status?;
    string? case_status_description?;
    string? last_status_date?;
    string? respond_due?;
    string? original_amount?;
    string? updated_at?;
    string? mcc?;
    string? dispute_jurisdiction?;
    string? card_product_type?;
    string? process_date?;
    string? transaction_method?;
    string? invoice_number?;
    string? microfilm_number?;
    string? airline_ticket_number?;
    string? order_number?;
    string? tracking_number?;
};

public type Ticket record {
    # Ticket id
    int? id?;
    # Ticket subject
    string? subject?;
    # Ticket description
    string? description?;
    TicketStatus? status?;
    TicketType? 'type?;
    TicketGroup? 'group?;
    TicketPriority? priority?;
    # Assigned Lead ID
    int? lead_id?;
    # Assigned Merchant ID
    int? mid?;
    # Indicates if the ticket is visible to Merchant users
    boolean? merchantVisible?;
};

public type TicketcreatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

# Options for each event
public type BriefsubscriptioninfoOptions record {
    # Statuses from which a lead should be updated
    BriefsubscriptioninfoOptionsLeadstatusupdated? leadStatusUpdated?;
    # Statuses with which a lead should be created
    BriefsubscriptioninfoOptionsLeadcreated? leadCreated?;
    # Statuses of leads whose notes should be added
    BriefsubscriptioninfoOptionsLeadnoteadded? leadNoteAdded?;
    # Statuses of leads whose documents should be uploaded
    BriefsubscriptioninfoOptionsLeaddocumentuploaded? leadDocumentUploaded?;
    # Statuses of leads whose emails should received
    BriefsubscriptioninfoOptionsLeademailreceived? leadEmailReceived?;
};

public type SignaturesignedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type DisputedetailsresponseFiles record {
    string? time?;
    string? title?;
    # site url
    string? url?;
    # api url
    string? api_url?;
};

public type TicketcommentedData record {
    record {# Comment id
        int? id?; # Ticket id
        int? ticketId?; # Comment text
        string? comment?; # Comment created date
        string? created?; UserStructure? createdBy?; # Comment modified date
        string? modified?; UserStructure? modified_by?; *CommentSubscriptionData;}[]? comments?;
};

public type UserStructure record {
    # User ID
    int? id?;
    # User Name
    string? name?;
    # User Class
    string? userClass?;
};

# 'lead' property is passed when 'Multiple at once' feature is disabled
public type LeademailreceivedeventinfoDataLead record {
    # Lead ID
    int? id?;
    # Lead URL
    string? lead_url?;
    # Lead Name
    string? name?;
    # Lead Default Email
    string? emailAddress?;
    # Lead Default Contact Name
    string? contact?;
    # Lead Default Contact Phone Number
    string? phone?;
    # Address
    LeademailreceivedeventinfoDataLeadAddress? address?;
    # Email
    LeademailreceivedeventinfoDataLeadEmail? email?;
    # Assigned users
    UserListStructure? assignedUsers?;
};

public type TurboappdeclinedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LeadstatusupdatedeventinfoData record {
    record {*FullLeadSubscription; record  { # Status ID
            int? id?; # Status Name
            string? name?;}  previousStatus?; record  { # Status ID
            int? id?; # Status Name
            string? name?;}  newStatus?; # Date and time of creation (ISO 8601)
        string? statusUpdatedAt?; UserStructure? statusUpdatedBy?; UserStructure? salesRep?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*FullLeadSubscription; record  { # Status ID
            int? id?; # Status Name
            string? name?;}  previousStatus?; record  { # Status ID
            int? id?; # Status Name
            string? name?;}  newStatus?; # Date and time of creation (ISO 8601)
        string? statusUpdatedAt?; UserStructure? statusUpdatedBy?; UserStructure? salesRep?;}[]? leads?;
};

public type LeadRestoredEventInfo record {
    LeadrestoredeventinfoHook? hook?;
    LeadrestoredeventinfoData? data?;
};

public type RetrievalReminder record {
    RetrievalreminderHook? hook?;
    RetrievalreminderData? data?;
};

public type LeademailreceivedeventinfoDataAddress record {
    # Lead Default Address
    string? address?;
    # Lead Default City
    string? city?;
    # Lead Default State
    string? state?;
    # Lead Default ZIP
    string? zip?;
};

public type LeadupdatedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type DisputedetailsresponseMessages record {
    string? message?;
    string? description?;
    string? added_at?;
    string? viewed_on?;
};

public type DisputedetailsresponseDirectories record {
    string? time?;
    string? title?;
    DisputedetailsresponseFiles[]? files?;
};

public type DisputedetailsresponseFields record {
    string? 'key?;
    string? value?;
};

public type LeadcreatedeventinfoData record {
    FullLeadSubscription? lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    FullLeadSubscription[]? leads?;
};

public type LeademailreceivedeventinfoDataEmail record {
    # Sent from (name and email)
    string? 'from?;
    # Sent to(email)
    string? to?;
    # Email subject
    string? subject?;
    # Email message without html
    string? bodyText?;
    # Email message including html
    string? bodyHtml?;
    # Date and time of receiving the email (ISO 8601)
    string? sentAt?;
};

public type SignatureopenedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LeadNoteAddedEventInfo record {
    LeadnoteaddedeventinfoHook? hook?;
    LeadnoteaddedeventinfoData? data?;
};

public type RetrievaladdedData record {
    RetrievalsReplyResponse[]? retrievals?;
};

public type ChargebackreplyresponseItems record {
    string? reason?;
    string? message_from_bank?;
    string? merchant_due_date?;
    string? financial_disposition_date?;
    string? 'type?;
};

public type ApiupdatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TicketresolvedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TurboappupdatedDataActivationStatus record {
    string? old?;
    string? 'new?;
};

public type SignatureSigned record {
    SignaturesignedHook? hook?;
    SignaturegeneratedData? data?;
};

public type ApiupdatedDataDetails record {
    # Description of update
    string? description?;
    # Link to endpoint documentation
    string? link?;
    # Type of API update
    string? 'type?;
};

public type ApplicationSubscription record {
    int? id?;
    string? title?;
    int? group_id?;
    string? group_name?;
};

public type TicketCommented record {
    TicketcommentedHook? hook?;
    TicketcommentedData? data?;
};

public type TicketCreatedBlock record {
    # Ticket created date
    string? created?;
    # Ticket creator id
    int? created_by?;
};

public type ChargebackreminderData record {
    record {*ChargebackReplyResponse; # Case due in days
        int? due_in?;}[]? chargebacks?;
};

public type TicketPriority record {
    # Priority id
    int? id?;
    # Priority name
    string? name?;
};

public type LeadnoteaddedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type FullLeadSubscription record {
    *ShortLeadSubscription;
    # Lead ID
    int? id?;
    # Lead URL
    string? lead_url?;
    # Lead Name
    string? name?;
    # Lead Default Email
    string? email?;
    # Lead Default Contact Name
    string? contact?;
    # Lead Default Contact Phone Number
    string? phone?;
    LeademailreceivedeventinfoDataAddress? address?;
    FullleadsubscriptionGroup? 'group?;
    FullleadsubscriptionCategory? category?;
    FullleadsubscriptionStatus? status?;
    FullleadsubscriptionCampaign? campaign?;
    FullleadsubscriptionSource? 'source?;
    # Date and time of creation (ISO 8601)
    string? createdAt?;
    UserStructure? createdBy?;
};

# Email
public type LeademailreceivedeventinfoDataLeadEmail record {
    # Sent from (name and email)
    string? 'from?;
    # Sent to(email)
    string? to?;
    # Email subject
    string? subject?;
    # Email message without html
    string? bodyText?;
    # Email message including html
    string? bodyHtml?;
    # Date and time of receiving the email (ISO 8601)
    string? sentAt?;
};

public type LeadDocumentUploadedEventInfo record {
    LeaddocumentuploadedeventinfoHook? hook?;
    LeaddocumentuploadedeventinfoData? data?;
};

public type SignaturegeneratedDataSignatures record {
    SignatureSubscription? signature?;
    ApplicationSubscription? application?;
    FullLeadSubscription? lead?;
};

public type TurboappapprovedDataEntitlements record {
    string? card_type?;
    string? srv?;
    string? proc_flag?;
};

public type DisputedetailsresponseTransactions record {
    string? reference?;
    DisputedetailsresponseFields[]? fields?;
};

public type TurboappdeclinedDataComments record {
    # Date and time of comment (ISO 8601)
    string? date?;
    string? co?;
    string? text?;
};

public type LeademailreceivedeventinfoData record {
    # 'lead' property is passed when 'Multiple at once' feature is disabled
    LeademailreceivedeventinfoDataLead? lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    LeademailreceivedeventinfoDataLeads[]? leads?;
};

public type ChargebackReminder record {
    ChargebackreminderHook? hook?;
    ChargebackreminderData? data?;
};

public type LineitemsAgents record {
    int? user_id?;
    string? username?;
    string? full_name?;
    int? agent_net?;
    int? percentage?;
};

public type SignaturesubscriptionSigners record {
    string? name?;
    string? email?;
};

public type TicketcommentedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type RetrievalAdded record {
    RetrievaladdedHook? hook?;
    RetrievaladdedData? data?;
};

public type TurboappsubmitedData record {
    TurboappsubmitedDataApplications[]? applications?;
};

public type TicketcreatedData record {
    record {*Ticket; *TicketCreatedBlock; *TicketSubscriptionData;}[]? tickets?;
};

public type TicketGroup record {
    # Group id
    int? id?;
    # Group name
    string? name?;
};

public type TurboappupdatedDataAccounts record {
    # Account ID
    int? id?;
    # Application URL
    string? application_url?;
    # Application identifier
    string? identifier?;
    # Merchant name
    string? dba?;
    # Merchant ID
    int? mid?;
    # Lead ID related to the application
    int? lid?;
    TurboappupdatedDataComments? comments?;
    TurboappupdatedDataActivationStatus? activation_status?;
    TurboappupdatedDataActivationStatus? application_status?;
    string? contact_name?;
    string? salesman?;
    # Date and time of account update (ISO 8601)
    string? updatedAt?;
};

public type DisputeDetailsResponse record {
    DisputedetailsresponseTransactions[]? transactions?;
    DisputedetailsresponseTransactions[]? auth_records?;
    DisputedetailsresponseNotes[]? notes?;
    DisputedetailsresponseMessages[]? messages?;
    DisputedetailsresponseDirectories[]? directories?;
};

# Statuses of leads whose notes should be added
public type BriefsubscriptioninfoOptionsLeadnoteadded record {
    # Statuses of leads whose added notes should be reported (any if not specified)
    int[]? statuses?;
};

public type LineItems record {
    int? id?;
    string? 'type?;
    int? item_id?;
    LineitemsUser? user?;
    LineitemsMerchant? merchant?;
    int? related_mid?;
    string? related_dba?;
    string? description?;
    int? income?;
    int? expense?;
    int? percentage?;
    int? agent_net?;
    boolean? is_recurring?;
    # Created date of line item
    string? created?;
    # Last update date of line item
    string? modified?;
    LineitemsAgents[]? agents?;
    # Date of start recurring line item
    string? recurring_start_date?;
    # Count of payments what was already done
    int? recurring_payment_count?;
    # Count of payments which will be done (this will be null if there is no limit)
    int? recurring_max_payment_count?;
    string? recurring_period?;
};

public type RetrievaladdedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type SignatureGenerated record {
    SignaturegeneratedHook? hook?;
    SignaturegeneratedData? data?;
};

public type FullleadsubscriptionCategory record {
    # Status category ID
    int? id?;
    # Status category Name
    string? name?;
};

public type TurboappapprovedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type BriefSubscriptionInfo record {
    # Subscription Id
    int? id?;
    # Subscription URL
    string? url;
    # Subscription Events
    string[]? events;
    # Options for each event
    BriefsubscriptioninfoOptions? options?;
    # Report multiple items in one request
    boolean? multiple_at_once?;
};

public type ReportpublishedData record {
    ReportpublishedDataReports[]? reports?;
};

public type TicketStatus record {
    # Status id
    int? id?;
    # Status name
    string? name?;
};

# Statuses of leads whose emails should received
public type BriefsubscriptioninfoOptionsLeademailreceived record {
    # Statuses of leads whose received emails should be reported (any if not specified)
    int[]? statuses?;
};

# Statuses from which a lead should be updated
public type BriefsubscriptioninfoOptionsLeadstatusupdated record {
    # Statuses from which a lead should be updated to report the update (any if not specified)
    int[]? previousStatuses?;
    # Statuses to which a lead should be updated to report the update (any if not specified)
    int[]? newStatuses?;
};

public type LeademailreceivedeventinfoDataLeads record {
    # Lead ID
    int? id?;
    # Lead URL
    string? lead_url?;
    # Lead Name
    string? name?;
    # Lead Default Email
    string? emailAddress?;
    # Lead Default Contact Name
    string? contact?;
    # Lead Default Contact Phone Number
    string? phone?;
    LeademailreceivedeventinfoDataAddress? address?;
    LeademailreceivedeventinfoDataEmail? email?;
    # Assigned users
    UserListStructure? assignedUsers?;
};

public type ChargebackreminderHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TestSubscription record {
    TestsubscriptionHook? hook?;
    TestsubscriptionData? data?;
};

public type TurboAppDeclined record {
    TurboappdeclinedHook? hook?;
    TurboappdeclinedData? data?;
};

public type LeademailreceivedeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LineitemaddedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TurboappupdatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type InlineResponse20056 record {
    BriefSubscriptionInfo[]? data?;
    Links? links?;
    Meta? meta?;
};

public type LeadEmailReceivedEventInfo record {
    LeademailreceivedeventinfoHook? hook?;
    LeademailreceivedeventinfoData? data?;
};

public type LineitemsUser record {
    int? user_id?;
    string? username?;
    string? full_name?;
    string? 'class?;
};

public type InlineResponse20057 record {
    # Subscription deletion message
    string? message?;
};

public type SignatureOpened record {
    SignatureopenedHook? hook?;
    SignaturegeneratedData? data?;
};

public type TicketupdatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TestsubscriptionHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TurboappupdatedData record {
    TurboappupdatedDataAccounts[]? accounts?;
};

public type ChargebackaddedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

# Statuses with which a lead should be created
public type BriefsubscriptioninfoOptionsLeadcreated record {
    # Statuses with which a created lead should be reported (any if not specified)
    int[]? statuses?;
};

public type TurboappapprovedData record {
    TurboappapprovedDataAccounts[]? accounts?;
};

public type SubscriptioncommenteditedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type TurboappupdatedDataComments record {
    # Date and time of comment (ISO 8601)
    string? date?;
    string? co?;
    string? text?;
};

public type RetrievalsReplyResponse record {
    RetrievalsreplyresponseRetrieval? retrieval?;
    *DisputeDetailsResponse;
};

public type TicketCreated record {
    TicketcreatedHook? hook?;
    TicketcreatedData? data?;
};

public type RetrievalreminderData record {
    record {*RetrievalsReplyResponse; # Case due in days
        int? due_in?;}[]? retrievals?;
};

public type TurboAppApproved record {
    TurboappapprovedHook? hook?;
    TurboappapprovedData? data?;
};

public type LeadnoteaddedeventinfoData record {
    record {*ShortLeadSubscription; record  { # Note ID
            int? id?; # Note text
            string? name?; # Whether The Note Is Pinned
            boolean? pinned?; string[]? images?; # Date and time of creation (ISO 8601)
            string? createdAt?; UserStructure? createdBy?;}  note?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*ShortLeadSubscription; record  { # Note ID
            int? id?; # Note text
            string? name?; # Whether The Note Is Pinned
            boolean? pinned?; string[]? images?; # Date and time of creation (ISO 8601)
            string? createdAt?; UserStructure? createdBy?;}  note?;}[]? leads?;
};

public type LeaddeletedeventinfoData record {
    record {*ShortLeadSubscription; UserStructure? deletedBy?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*ShortLeadSubscription; UserStructure? deletedBy?;}[]? leads?;
};

public type TicketUpdated record {
    TicketupdatedHook? hook?;
    TicketupdatedData? data?;
};

public type TurboappsubmitedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type FullleadsubscriptionGroup record {
    # Group ID
    int? id?;
    # Group Name
    string? name?;
};

public type LeadStatusUpdatedEventInfo record {
    LeadstatusupdatedeventinfoHook? hook?;
    LeadstatusupdatedeventinfoData? data?;
};

public type File record {
    int? id?;
    string? name?;
    int? size?;
    # File creation date (Y-m-d\TH:i:sP)
    string? created?;
    int? created_by?;
};

public type TurboAppUpdated record {
    TurboappupdatedHook? hook?;
    TurboappupdatedData? data?;
};

public type LeadDeletedEventInfo record {
    LeaddeletedeventinfoHook? hook?;
    LeaddeletedeventinfoData? data?;
};

public type ChargebackupdatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type LeaddocumentuploadedeventinfoData record {
    record {*ShortLeadSubscription; record  { # Document ID
            int? id?; # Document label
            string? label?; # Filename
            string? filename?; # File url
            string? file?; # Date and time of uploading (ISO 8601)
            string? uploadedAt?; UserStructure? uploadedBy?;}  document?;} lead?;
    # 'leads' property is passed when 'Multiple at once' feature is enabled
    record {*ShortLeadSubscription; record  { # Document ID
            int? id?; # Document label
            string? label?; # Filename
            string? filename?; # File url
            string? file?; # Date and time of uploading (ISO 8601)
            string? uploaded_at?; UserStructure? uploaded_by?;}  document?;}[]? leads?;
};

public type TurboappdeclinedDataActivationStatus record {
    string? old?;
    string? 'new?;
};

public type LeadUpdatedEventInfo record {
    LeadupdatedeventinfoHook? hook?;
    LeadupdatedeventinfoData? data?;
};

public type TicketType record {
    # Type id
    int? id?;
    # Ticket type
    string? name?;
};

public type LineItemAdded record {
    LineitemaddedHook? hook?;
    LineitemaddedData? data?;
};

public type RetrievalupdatedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type ReportpublishedDataReports record {
    int? id?;
    int? month?;
    int? year?;
    int? sys_prin?;
    # Ticket created date
    string? created?;
    UserStructure? created_by?;
    int? added_merchants_count?;
    int? rows_count?;
    int? revision?;
    int? deactivated_merchants_count?;
    int? processor_id?;
    string? processor_name?;
    int? sum_transactions?;
    decimal? sum_volume?;
    decimal? sum_net?;
    int? sum_agent_net?;
};

public type LeadrestoredeventinfoHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
};

public type RetrievalsreplyresponseRetrieval record {
    string? id?;
    string? merchant_id?;
    string? dba?;
    string? date?;
    string? transaction_date?;
    string? amount?;
    string? reason_code?;
    string? reason?;
    string? card_number?;
    string? case_number?;
    string? case_action?;
    string? action?;
    string? case_status?;
    string? case_status_description?;
    string? last_status_date?;
    string? respond_due?;
    string? original_amount?;
    string? updated_at?;
    string? mcc?;
    string? dispute_jurisdiction?;
    string? card_product_type?;
    string? foreign_amount?;
    string? transaction_method?;
    string? transaction_locator?;
    string? invoice_number?;
    string? microfilm_number?;
    string? airline_ticket_number?;
    string? order_number?;
    string? tracking_number?;
};

public type SignaturegeneratedData record {
    SignaturegeneratedDataSignatures[]? signatures?;
};

public type ReportpublishedHook record {
    # Request ID
    int? requestId?;
    # Event ID
    string? event?;
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

# Address
public type LeademailreceivedeventinfoDataLeadAddress record {
    # Lead Default Address
    string? address?;
    # Lead Default City
    string? city?;
    # Lead Default State
    string? state?;
    # Lead Default ZIP
    string? zip?;
};

public type TurboAppSubmited record {
    TurboappsubmitedHook? hook?;
    TurboappsubmitedData? data?;
};
