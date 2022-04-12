// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

public type AccountListResponse record {
    AccountData[] accounts?;
};

public type Account record {
    # Account's name
    string name;
    # Account's website
    string accountUrl?;
    # Account's custom field values {customFieldId- int, fieldValue- string, fieldCurrency?-string}[]
    Field[] fields?;
};

public type Meta record {
    string total?;
    MetaPageInput page_input?;
};

public type MessageReadResponse record {
    MessageData message?;
};

public type ContactAutomationResponse record {
    ContactRead[] contacts?;
    ContactAutomationData contactAutomation?;
};

public type MetaPageInput record {
    int segmentid?;
    int formid?;
    int listid?;
    int tagid?;
    int 'limit?;
    int offset?;
    string search?;
    string sort?;
    int seriesid?;
    int waitid?;
    int status?;
    int forceQuery?;
    string cacheid?;
};

public type Subscribe record {
    # The ID of the list to subscribe the contact to or unsubscribe the contact from. Lists must be referenced by the ID that ActiveCampaign assigns to them. You can find the list ID by clicking the list in your ActiveCampaign account then viewing the URL bar. It will look something like this- `/app/contacts/?listid=19&status=1` You can also retrieve the ID number for a list by using the "Retrieve all lists" API call.
    string listid;
};

public type AccountdataAccount record {
    string name?;
    string accountUrl?;
    string createdTimestamp?;
    string updatedTimestamp?;
    string[] links?;
    string id?;
    Field[] fields?;
};

public type CampaignListResponse record {
    CampaignData[] campaigns?;
    Meta meta?;
};

public type ListData record {
    string stringid?;
    string userid?;
    string name?;
    string cdate?;
    string p_use_tracking?;
    string p_use_analytics_read?;
    string p_use_analytics_link?;
    string p_use_twitter?;
    string p_use_facebook?;
    string p_embed_image?;
    string p_use_captcha?;
    string send_last_broadcast?;
    string 'private?;
    string analytics_domains?;
    string analytics_source?;
    string analytics_ua?;
    string twitter_token?;
    string twitter_token_secret?;
    string facebook_session?;
    string carboncopy?;
    string subscription_notify?;
    string unsubscription_notify?;
    string require_name?;
    string get_unsubscribe_reason?;
    string to_name?;
    string optinoptout?;
    string sender_name?;
    string sender_addr1?;
    string sender_addr2?;
    string sender_city?;
    string sender_state?;
    string sender_zip?;
    string sender_country?;
    string sender_phone?;
    string sender_url?;
    string sender_reminder?;
    string fulladdress?;
    string optinmessageid?;
    string optoutconf?;
    string deletestamp?;
    string udate?;
    Links links?;
    string id?;
    string user?;
};

public type BulkImportStatus record {
    Batch[] outstanding?;
    Batch[] recentlyCompleted?;
};

public type CreateAccountNoteRequest record {
    # Account note's content
    string note;
};

public type ContactData record {
    string contact?;
    string tstamp?;
    string geoTstamp?;
    string geoIp4?;
    string geoCountry2?;
    string geo_country?;
    string geoState?;
    string geoCity?;
    string geoZip?;
    string geoArea?;
    string geoLat?;
    string geoLon?;
    string geoTz?;
    string geoTzOffset?;
    string ga_campaign_source?;
    string ga_campaign_name?;
    string ga_campaign_medium?;
    string ga_campaign_term?;
    string ga_campaign_content?;
    string ga_campaign_customsegment?;
    string ga_first_visit?;
    string ga_times_visited?;
    string fb_id?;
    string fb_name?;
    string tw_id?;
    string created_timestamp?;
    string updated_timestamp?;
    string created_by?;
    string updated_by?;
    Links links?;
    string id?;
};

public type List record {
    # Name of the list to create
    string name;
    # URL-safe list name. Example- 'list-name-sample'
    string stringid;
    # The website URL this list is for.
    string sender_url;
    # A reminder for your contacts as to why they are on this list and you are messaging them.
    string sender_reminder;
    # User Id of the list owner. A list owner is able to control campaign branding. A property of list. userid also exists on this object; both properties map to the same list owner field and are being maintained in the response object for backward compatibility. If you post values for both list.user and list.userid, the value of list.user will be used.
    int user?;
    # Boolean value indicating whether or not to send the last sent campaign to this list to a new subscriber upon subscribing. 1 = yes, 0 = no
    boolean send_last_broadcast?;
    # Comma-separated list of email addresses to send a copy of all mailings to upon send
    string carboncopy?;
    # Comma-separated list of email addresses to notify when a new subscriber joins this list.
    string subscription_notify?;
    # Comma-separated list of email addresses to notify when a subscriber unsubscribes from this list.
    string unsubscription_notify?;
};

public type FieldValue record {
    # Field name
    string 'field;
    # Value related to field name
    string value;
};

public type CreateListRequest record {
    List list;
};

public type BulkContactData record {
    # The contact's email.
    string email;
    # The contact's first name
    string first_name?;
    # The contact's last name.
    string last_name?;
    # The contact’s phone number.
    string phone?;
    # The name of the contact’s account.
    string customer_acct_name?;
    # Each string in the array will be added as a single tag to the contact. New tags will be created if they do not already exist.
    string[] tags?;
    # A list of custom fields to apply to the contact. Each field must contain two fields- Each contact may have up to N custom fields.
    FieldValue[] fields?;
    # An array of lists to subscribe the contact to. Contacts may not be subscribed to lists which they have previously unsubscribed from. Each list object contains a single field.
    Subscribe[] subscribe?;
    # An array of lists to unsubscribe the contact to. Each list object contains a single field.
    Subscribe[]? unsubscribe?;
};

public type NotedataNoteOwner record {
    string id?;
    string 'type?;
};

public type GeoIp record {
    string contact?;
    string campaignid?;
    string messageid?;
    string geoaddrid?;
    string ip4?;
    string tstamp?;
    string geoAddress?;
    Links links?;
    string id?;
};

public type CampaignReadResponse record {
    CampaignData campaign?;
};

public type ContactAutomationListResponse record {
    ContactAutomationData[] contactAutomations?;
    Meta meta?;
};

public type BounceLog record {
    string tstamp?;
    string bounceid?;
    string subscriberid?;
    string campaignid?;
    string messageid?;
    string codeid?;
    string email?;
    string _error?;
    string 'source?;
    string created_timestamp?;
    string updated_timestamp?;
    string created_by?;
    string updated_by?;
    Links links?;
    string id?;
    string bounce?;
    string contact?;
    string campaign?;
    string message?;
    string code?;
};

public type Deal record {
    string owner?;
    string contact?;
    string organization?;
    string 'group?;
    string title?;
    string nexttaskid?;
    string currency?;
    string status?;
    Links links?;
    string id?;
    string nextTask?;
};

public type BulkImportRequest record {
    BulkContactData[] contacts;
    string? callback?;
};

public type ContactTagReadResponse record {
    ContactTagData contactTag?;
};

public type ListListResponse record {
    ListData[] lists?;
    Meta meta?;
};

public type AddTagToContactRequest record {
    ContactTag contactTag;
};

public type AccountNoteData record {
    AccountData[] accounts?;
    NoteData note?;
};

public type ContactListListResponse record {
    ContactList[] contactLists?;
};

public type UpdateAccountRequest record {
    UpdatableAccount account;
};

public type SubscribeOrUnsubscribeContactResponse record {
    ContactRead[] contacts?;
    ContactList contactList?;
};

public type SubscribeOrUnsubscribeContactRequest record {
    ContactListData contactList;
};

public type BulkImportStatusInfo record {
    string status?;
    string[] success?;
    string[] failure?;
};

public type ContactTagData record {
    string cdate?;
    string contact?;
    string id?;
    Links links?;
    string tag?;
};

public type MessageListResponse record {
    MessageData[] messages?;
    Meta meta?;
};

public type UpdatableAccount record {
    # Account's name
    string name?;
    # Account's website
    string accountUrl?;
    # Account's custom field values {customFieldId- int, fieldValue- string, fieldCurrency?-string}[]
    Field[] fields?;
};

public type NoteData record {
    NotedataNote note?;
};

public type ContactListResponse record {
    anydata[] scoreValues?;
    ContactRead[] contacts?;
    Meta meta?;
};

public type Field record {
    # Field ID, ID of the Custom Field Meta Data
    int customFieldId;
    # Updated field value. For currency field, this needs to be in cents not dollars (or 100 x Base Unit).
    string|int fieldValue;
    # Required only for the currency field type. The three letter currency code for the currency value
    string fieldCurrency?;
};

public type AddContactAutomationRequest record {
    ContactAutomation contactAutomation;
};

public type ContactAutomationData record {
    string contact?;
    string seriesid?;
    string startid?;
    string status?;
    string adddate?;
    string remdate?;
    string timespan?;
    string lastblock?;
    string lastdate?;
    string completedElements?;
    string totalElements?;
    int completed?;
    int completeValue?;
    Links links?;
    string id?;
    string automation?;
};

public type ListCreateResponse record {
    ListData list?;
};

public type ContactTag record {
    # The id of the Contact
    string contact?;
    # The id of the tag
    string tag?;
};

public type GeoAddress record {
    string ip4?;
    string country2?;
    string country?;
    string state?;
    string city?;
    string zip?;
    string area?;
    string lat?;
    string lon?;
    string tz?;
    string tstamp?;
    Links links?;
    string id?;
};

public type AccountData record {
    AccountdataAccount account?;
};

public type Batch record {
    string forDate?;
    string batches?;
    string contacts?;
};

public type UpdateAccountNoteRequest record {
    # Account note's content
    string note?;
};

public type ListReadResponse record {
    ListData list?;
};

public type ContactReadResponse record {
    ContactAutomation[] contactAutomations?;
    ContactList[] contactLists?;
    Deal[] deals?;
    FieldValue[] fieldValues?;
    GeoAddress[] geoAddresses?;
    GeoIp[] geoIps?;
    ContactRead contact?;
};

public type ContactGoal record {
    string goalid?;
    string seriesid?;
    string subscriberid?;
    string subscriberseriesid?;
    string timespan?;
    string tstamp?;
    Links links?;
    string id?;
    string goal?;
    string automation?;
    string contact?;
    string contactAutomation?;
};

public type NotedataNoteLinks record {
    string activities?;
    string mentions?;
    string notes?;
    string owner?;
    string user?;
};

public type MessageData record {
    string userid?;
    string ed_instanceid?;
    string ed_version?;
    string cdate?;
    string mdate?;
    string name?;
    string fromname?;
    string fromemail?;
    string reply2?;
    string priority?;
    string charset?;
    string encoding?;
    string format?;
    string subject?;
    string preheader_text?;
    string text?;
    string html?;
    string htmlfetch?;
    string textfetch?;
    string hidden?;
    string preview_mime?;
    string preview_data?;
};

public type BulkImportResponse record {
    int Success?;
    int queued_contacts?;
    string batchId?;
    string message?;
};

public type BounceLogResponse record {
    BounceLog[] bounceLogs?;
};

public type ContactList record {
    string contact?;
    string list?;
    string form?;
    string seriesid?;
    string sdate?;
    string udate?;
    string status?;
    string responder?;
    string sync?;
    string unsubreason?;
    string campaign?;
    string message?;
    string first_name?;
    string last_name?;
    string ip4Sub?;
    string sourceid?;
    string autosyncLog?;
    string ip4_last?;
    string ip4Unsub?;
    string unsubscribeAutomation?;
    Links links?;
    string id?;
    string automation?;
};

public type ContactRead record {
    string cdate?;
    string email?;
    string phone?;
    string firstName?;
    string lastName?;
    string orgid?;
    string segmentio_id?;
    string bounced_hard?;
    string bounced_soft?;
    string bounced_date?;
    string ip?;
    string ua?;
    string hash?;
    string socialdata_lastcheck?;
    string email_local?;
    string email_domain?;
    string sentcnt?;
    string rating_tstamp?;
    string gravatar?;
    string deleted?;
    string anonymized?;
    string udate?;
    string deleted_at?;
    anydata[] scoreValues?;
    Links links?;
    string id?;
    string organization?;
};

public type UpdateContactRequest record {
    UpdateContactData contact;
};

public type Contact record {
    # Email address of the new contact. Example- 'test@example.com'
    string email;
    # First name of the new contact.
    string firstName?;
    # Last name of the new contact.
    string lastName?;
    # Phone number of the contact.
    int phone?;
    FieldValue[] fieldValues?;
};

public type CreateContactRequest record {
    Contact contact;
};

public type CreateAccountRequest record {
    Account account;
};

public type ContactListData record {
    # ID of the list to subscribe the contact to
    int list;
    # ID of the contact to subscribe to the list
    int contact;
    # Set to "1" to subscribe the contact to the list. Set to "2" to unsubscribe the contact from the list. WARNING- If you change a status from unsubscribed to active, you can re-subscribe a contact to a list from which they had manually unsubscribed.
    int status;
    # Set to "4" when re-subscribing a contact to a list
    int sourceid?;
};

public type CampaignData record {
    string 'type?;
    string userid?;
    string segmentid?;
    string bounceid?;
    string realcid?;
    string sendid?;
    string threadid?;
    string seriesid?;
    string formid?;
    string basetemplateid?;
    string basemessageid?;
    string addressid?;
    string 'source?;
    string name?;
    string cdate?;
    string mdate?;
    string sdate?;
    string ldate?;
    string send_amt?;
    string total_amt?;
    string opens?;
    string uniqueopens?;
    string linkclicks?;
    string uniquelinkclicks?;
    string subscriberclicks?;
    string forwards?;
    string uniqueforwards?;
    string hardbounces?;
    string softbounces?;
    string unsubscribes?;
    string unsubreasons?;
    string updates?;
    string socialshares?;
    string replies?;
    string uniquereplies?;
    string status?;
    string 'public?;
    string mail_transfer?;
    string mail_send?;
    string mail_cleanup?;
    string mailer_log_file?;
    string tracklinks?;
    string tracklinksanalytics?;
    string trackreads?;
    string trackreadsanalytics?;
    string analytics_campaign_name?;
    string tweet?;
    string facebook?;
    string survey?;
    string embed_images?;
    string htmlunsub?;
    string textunsub?;
    string htmlunsubdata?;
    string textunsubdata?;
    string recurring?;
    string willrecur?;
    string split_type?;
    string split_content?;
    string split_offset?;
    string split_offset_type?;
    string split_winner_messageid?;
    string split_winner_awaiting?;
    string responder_offset?;
    string responder_type?;
    string responder_existing?;
    string reminder_field?;
    string reminder_format?;
    string reminder_type?;
    string reminder_offset?;
    string reminder_offset_type?;
    string reminder_offset_sign?;
    string reminder_last_cron_run?;
    string activerss_interval?;
    string activerss_url?;
    string activerss_items?;
    string ip4?;
    string laststep?;
    string managetext?;
    string schedule?;
    string scheduleddate?;
    string waitpreview?;
    string deletestamp?;
    string replysys?;
    Links links?;
    string id?;
    string user?;
    string automation?;
};

public type Links record {
    string bounceLogs?;
    string contactAutomations?;
    string contactData?;
    string contactGoals?;
    string contactLists?;
    string contactLogs?;
    string contactTags?;
    string contactDeals?;
    string deals?;
    string fieldValues?;
    string geoIps?;
    string notes?;
    string organization?;
    string plusAppend?;
    string trackingLogs?;
    string scoreValues?;
};

public type ContactGoalResponse record {
    ContactGoal[] contactGoals?;
};

public type UpdateContactData record {
    # Email address of the contact to sync
    string email?;
    # First name of the new contact.
    string firstName?;
    # Last name of the new contact.
    string lastName?;
    # Phone number of the contact.
    int phone?;
    # Contact's custom field values [{field, value}]
    FieldValue[] fieldValues?;
};

public type ContactAutomation record {
    # Contact ID of the Contact, to be linked to the contactAutomation
    string contact?;
    # Automation ID of the automation, to be linked to the contactAutomation
    string automation?;
};

public type ContactDataResponse record {
    ContactData contactDatum?;
};

public type NotedataNote record {
    string cdate?;
    string id?;
    NotedataNoteLinks links?;
    string mdate?;
    string note?;
    NotedataNoteOwner owner?;
    record {} relid?;
    record {} reltype?;
    record {} user?;
    record {} userid?;
};
