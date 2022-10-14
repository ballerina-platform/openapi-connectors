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

public type MsisdnArr Msisdn[];

public type RetrieveRecipientDeliveryResponseObj record {
    # The default originator used for the recipient this delivery report belongs to, if default originator pool configured and no originator set when submitting batch.
    string applied_originator?;
    # A timestamp of when the Delivery Report was created in the Sinch service.
    string at;
    # The ID of the batch this delivery report belongs to
    string batch_id;
    # The client identifier of the batch this delivery report belongs to, if set when submitting batch.
    string client_reference?;
    # The detailed status code.
    int code;
    # The number of parts the message was split into. Present only if _max_number_of_message_parts_ parameter was set.
    int number_of_message_parts?;
    # The operator that was used for delivering the message to this recipient, if configured for the account.
    string operator?;
    # A timestamp extracted from the Delivery Receipt from the originating SMSC.
    string operator_status_at?;
    # Phone number that was queried for.
    string recipient;
    # The simplified status as described in _Delivery Report Statuses_.
    string status;
    # The object type. Will always be _recipient_delivery_report_sms_.
    string 'type?;
};

# Keyword to be sent in MO to remove from a group.
public type GroupobjectAutoUpdateRemove record {
    # Opt-out keyword like "LEAVE" If auto_update.to is dedicated long/short number or unique brand keyword like "Sinch" if it is a shared short code.
    # Constraints:
    # Max length: 15 characters Must be one word.
    @constraint:String {maxLength: 15}
    string first_word?;
    # Opt-out keyword like "LEAVE" if auto_update.to is shared short code.
    # Constraints: Max length: 15 characters Must be one word.
    @constraint:String {maxLength: 15}
    string second_word?;
};

public type UpdateBatchReq record {
    # List of phone numbers and group IDs to add to the batch.
    # Constraints: 1 to 100 elements.
    @constraint:Array {maxLength: 100, minLength: 1}
    string[] toAdd?;
    # List of phone numbers and group IDs to remove from the batch.	
    # 
    # constraints:
    # 1 to 100 elements.
    string[] toRemove?;
    # Sender number.
    # Default: Must be valid phone number, short code or alphanumeric.
    string 'from?;
    # The message content. Normal text string for mt_text and Base64 encoded for mt_binary.
    # Constraints: Max 1600 chars for mt_text and max 140 bytes together with udh for mt_binary
    @constraint:String {maxLength: 1600}
    string body?;
    # Request delivery report callback. Note that delivery reports can be fetched from the API regardless of this setting.
    # Constraints: Valid types are none, summary, full and per_recipient
    string delivery_report?;
    # If set in the future the message will be delayed until send_at occurs. ISO-8601 format.
    # Constraints: Must be before expire_at. If set in the past messages will be sent immediately.
    string send_at?;
    # If set the system will stop trying to deliver the message at this point.
    # Constraints: Must be after send_at
    # Default: 3 days after send_at
    string expire_at?;
    # Override the default callback URL for this batch.
    # Constraints: Must be valid URL. Max 2048 characters long.
    @constraint:String {maxLength: 2048}
    string callback_url?;
};

public type RetrievedeliveryresponseobjStatuses record {
    # The detailed status code.
    int code?;
    # The simplified status as described in _Delivery Report Statuses_
    string status?;
    # The number of messages that currently has this code. Will always be at least 1
    int count?;
    # Only for _full_ report. A list of the phone number recipients which messages has this status code.
    string[] recipients?;
};

public type GroupObject record {
    # Name of the group
    @constraint:String {maxLength: 20}
    string name?;
    # Initial list of phone numbers in [E.164 format](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537) [MSISDNs](https://community.sinch.com/t5/Glossary/MSISDN/ta-p/7628) for the group.
    @constraint:Array {maxLength: 10000}
    Msisdn[] members?;
    # MSISDNs of child group will be included in this group. If present then this group will be auto populated.
    # Constraints: Elements must be group IDs.
    @constraint:Array {maxLength: 10}
    string[] child_groups?;
    GroupobjectAutoUpdate auto_update?;
};

public type InlineResponse200 record {
    # The requested page.
    int page?;
    # The total number of batches matching the given filters.
    int count?;
    # The number of batches returned in this request
    int page_size?;
    # The page of batches matching the given filters
    SendBatchObject[] batches?;
};

public type GroupsGroupIdBody1 record {
    # phone numbers to add as members.
    # Constraints: Elements must be phone numbers.
    #  Max 10 000 elements.
    @constraint:Array {maxLength: 10000}
    Msisdn[] add?;
    # phone numbers to remove from group.
    # Constraints: Elements must be phone numbers. Max 10 000 elements.
    @constraint:Array {maxLength: 10000}
    Msisdn[] remove?;
    # Name of group.
    # 	
    # Constraints:
    # Max 20 characters
    @constraint:String {maxLength: 20}
    string name?;
    # Copy the members from the given group into this group.
    # Constraints: Must be valid group ID
    string add_from_group?;
    # Remove members in the given group from group.
    # Constraints: Must be valid group ID
    string remove_from_group?;
};

public type RetrieveDeliveryResponseObj record {
    # The object type. Will always be _delivery_report_sms_
    string 'type?;
    # The ID of the batch this delivery report belongs to
    string batch_id?;
    # The total number of messages for the batch
    string total_message_count?;
    # Array with status objects. Only status codes with at least one recipient will be listed.
    RetrievedeliveryresponseobjStatuses[] statuses?;
    # The client identifier of the batch this delivery report belongs to, if set when submitting batch.
    string client_reference?;
};

# The response object of an inbound message. They can be retrieved and listed or sent via a callback.
public type InboundsObject record {
    # The object type. Either mo_text or mo_binary.
    string 'type?;
    # The ID of this inbound message.
    string id?;
    # The phone number that sent the message.
    string 'from?;
    # The Sinch phone number or short code to which the message was sent.
    string to?;
    # The message body. Base64 encoded if type is `mo_binary`.
    string body?;
    # The MCCMNC of the sender's operator if known.
    string operator_id?;
    # When the message left the originating device. Only available if provided by operator.
    # Formatted as ISO-8601.
    string sent_at?;
    # When the system received the message.
    # Formatted as ISO-8601.
    string received_at?;
};

public type ErrorResponseObj record {
    # The error code. See [error codes](/docs/sms/api-reference/#error-codes).
    string code?;
    # The human readable description of the error.
    string text?;
};

# A phone number in [E.164 format](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537).
public type Msisdn string;

public type SendBatchObject record {
    # List of Phone numbers and group IDs that will receive the batch. Constraints: 1 to 1000 elements [More info](https://community.sinch.com/t5/Glossary/MSISDN/ta-p/7628)
    @constraint:Array {maxLength: 1000, minLength: 1}
    Msisdn[] to;
    # Sender number.
    # 
    # Required if Automatic Default Originator not configured.
    string 'from?;
    # Identifies the type of batch message. Default: mt_text
    string 'type = "mt_text";
    # The message content. Normal text string for mt_text and Base64 encoded for mt_binary.
    # Max 1600 chars for mt_text and max 140 bytes together with udh for mt_binary.
    string body;
    # The UDH header of a binary message. Max 140 bytes together with body.
    # Required if type is mt_binary.
    string udh?;
    # Request delivery report callback. 
    # 
    # Note that delivery reports can be fetched from the API regardless of this setting. 
    # 
    # Valid types are none, summary, full and per_recipient	
    string delivery_report?;
    # If set in the future the message will be delayed until send_at occurs.
    # 
    # Must be before expire_at. 
    #  
    # If set in the past messages will be sent immediately.	
    string send_at?;
    # If set the system will stop trying to deliver the message at this point.
    # 
    #  Must be after send_at. Default is 3 days after send_at.
    string expire_at?;
    # Override the default callback URL for this batch.
    # Must be valid URL.
    # Max 2048 characters long.
    @constraint:String {maxLength: 2048}
    string callback_url?;
    # Shows message on screen without user interaction while not saving the message to the inbox.
    # true or false.
    boolean flash_message = false;
    # The client identifier of batch message. If set, it will be added in the delivery report/callback of this batch
    # Max 128 characters long
    @constraint:String {maxLength: 128}
    string client_reference?;
    # Message will be dispatched only if it is not split to more parts than Max Number of Message Parts
    # Must be higher or equal 1
    @constraint:Int {minValue: 1}
    int max_number_of_message_parts?;
};

public type InlineResponse2001PerRecipient record {
    string recipient?;
    string message_part?;
    string body?;
    string encoding?;
};

public type GroupobjectAutoUpdateAdd record {
    # Keyword to be sent in MO to add MSISDN to a group Opt-in keyword like "JOIN" If auto_update.to is dedicated long/short number or unique brand keyword like "Sinch" if it is a shared short code.
    # Constraints:
    # Max length: 15 characters Must be one word.
    @constraint:String {maxLength: 15}
    string first_word?;
    # Opt-in keyword like "JOIN" if auto_update.to is shared short code.
    # Constraints:
    # Max length: 15 characters Must be one word.
    @constraint:String {maxLength: 15}
    string second_word?;
};

public type CreateGroupResponse record {
    # The ID used to reference this group
    string id?;
    # Name of group if set
    string name?;
    # The number of members currently in the group
    int size?;
    # Timestamp for when the group was created.
    # ISO-8601 format
    string created_at?;
    # Timestamp for when the group was last modified.
    # ISO-8601 format
    string modified_at?;
};

public type GroupobjectAutoUpdate record {
    # Short code or long number addressed in MO.
    # Constraints: Must be valid MSISDN or short code.
    string to?;
    GroupobjectAutoUpdateAdd add?;
    # Keyword to be sent in MO to remove from a group.
    GroupobjectAutoUpdateRemove remove?;
};

public type InboundResponseObject record {
    # The requested page.
    int page?;
    # The number of inbounds returned in this request.
    int page_size?;
    # The total number of inbounds matching the given filters
    int count?;
    # The page of inbounds matching the given filters
    InboundsObject[] inbounds?;
};

public type InlineResponse2001 record {
    # The number of recipients in the batch
    int number_of_recipients?;
    # The total number of SMS message parts to be sent in the batch
    int number_of_messages?;
    # The recipient, the number of message parts to this recipient, the body of the message, and the encoding type of each message
    InlineResponse2001PerRecipient[] per_recipient?;
};

public type InlineResponse2002 record {
    int page?;
    int page_size?;
    int count?;
    GroupObject[] groups?;
};

public type SendBatchCreated record {
    # List of Phone numbers and group IDs that will receive the batch. [More info](https://community.sinch.com/t5/Glossary/MSISDN/ta-p/7628) Constraints: 1 to 1000 elements
    @constraint:Array {maxLength: 1000, minLength: 1}
    Msisdn[] to?;
    # Sender number.
    # 
    # Required if Automatic Default Originator not configured.
    string 'from?;
    # Identifies the type of batch message. Default: mt_text is regular SMS, mt_binary is a binary format.
    string 'type?;
    # The message content. Normal text string for mt_text and Base64 encoded for mt_binary.
    # Max 1600 chars for mt_text and max 140 bytes together with udh for mt_binary.
    string body?;
    # The UDH header of a binary message. Max 140 bytes together with body.
    # Required if type is mt_binary.
    string udh?;
    # Request delivery report callback. 
    # 
    # Note that delivery reports can be fetched from the API regardless of this setting. 
    # 
    # Valid types are none, summary, full and per_recipient	
    string delivery_report?;
    # If set in the future the message will be delayed until send_at occurs.
    # 
    # Must be before expire_at. 
    #  
    # If set in the past messages will be sent immediately.	
    string send_at?;
    # If set the system will stop trying to deliver the message at this point.
    # 
    #  Must be after send_at. Default is 3 days after send_at.
    string expire_at?;
    # Override the default callback URL for this batch.
    # Must be valid URL.
    # Max 2048 characters long.
    @constraint:String {maxLength: 2048}
    string callback_url?;
    # Shows message on screen without user interaction while not saving the message to the inbox.
    # true or false.
    boolean flash_message?;
    # The client identifier of batch message. If set, it will be added in the delivery report/callback of this batch
    # Max 128 characters long
    @constraint:String {maxLength: 128}
    string client_reference?;
    # Message will be dispatched only if it is not split to more parts than Max Number of Message Parts
    # Must be higher or equal 1
    @constraint:Int {minValue: 1}
    int max_number_of_message_parts?;
    # Unique identifier for batch
    string id?;
    # Timestamp for when batch was created.
    # ISO-8601 format
    string created_at?;
    # Timestamp for when batch was last updated.
    # ISO-8601 format
    string modified_at?;
    # Indicates if the batch has been canceled or not.
    boolean canceled?;
};

public type GroupsGroupIdBody record {
    # Name of group.
    # Constraints: Max 20 characters
    string name?;
    # The initial members of the group.
    # Constraints: Elements must be phone numbers in [e164](https://en.wikipedia.org/wiki/E.164) format MSISDNs. Max 10 000 elements.
    @constraint:Array {maxLength: 10000}
    Msisdn[] members;
};
