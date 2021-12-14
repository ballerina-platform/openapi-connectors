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

public type WebhookArr Webhook[];

public type MessageArr Message[];

public type SubmissionentryTo record {
    # Type of the recipient. The default value is INTERNATIONAL.
    string? 'type?;
    # The phone number of the recipient.  It must be supplied if the `type` is INTERNATIONAL
    string? address?;
    # The name of a group in your phonebook. A value can be given if the `type` is GROUP.
    string? name?;
    # The id of a group in your phonebook.  A value can be given if the `type` is GROUP.
    string? id?;
    # Custom fields that can be used in the message body. A value can be given if the `type` is INTERNATIONAL
    # Read the [body templates section](#tag/Message) for more information.
    string[]? fields?;
};

# Commerce address
public type ProfileCommerceAddress record {
    # Street
    string[]? street?;
    # City
    string? city?;
    # Region
    string? region?;
    # Country
    string? country?;
    # Postal Code
    string? postalCode?;
};

# commerce profile details
public type ProfileCommerce record {
    # Bank payment detail reference
    string? bankPaymentReference?;
    # Commerce address
    ProfileCommerceAddress? address?;
};

public type Message record {
    # A unique identifier that is assigned when the message is created.
    string? id;
    # The message direction
    string? 'type;
    # The address part of the sender id
    string? 'from?;
    # The phone number of the recipient
    string? to;
    # The content of the message
    record {} body;
    # The type of the content.  See the `encoding` field for more information.
    string? encoding?;
    # See the `protocolId` field for more information.
    int? protocolId?;
    # See the `messageClass` field for more information.
    int? messageClass?;
    # The number of parts.  If this is a concatenated message, the number of parts will be more than 1.  Note that this field does not have a value in the submission response.
    int? numberOfParts?;
    # The cost of the message (in credits).   Note that this field does not have a value in the submission response.
    float? creditCost?;
    # Identifies the submission.
    MessageSubmission? submission?;
    # The status of the message
    MessageStatus? status;
    # This field has a value only if the type is RECEIVED.
    # With SMS messages, it is not possible to link a reply directly with a specific sent message.  However, if you specified `REPLIABLE` in the `from` property, BulkSMS will link any reply to the most recent message sent to a given phone number.
    # The `relatedSentMessageId` property keeps the information about this link.
    # You can use this property to derive an implicit conversation from a set of messages.
    #   - If a received reply message has a `relatedSentMessageId`, you can use it to retrieve the last message that was sent before the reply was received.
    #   - If you have the `id` of the sent message and you want all the received messages that relate to it, you can use the List Related Messages Operation.
    string relatedSentMessageId?;
    # This is the value you supplied in the `userSuppliedId` field.
    # Has a value only if the `type` is SENT.
    string? userSuppliedId?;
};

# See the [errors page](errors/) for more detail on what kind of errors you can get.
public type Error record {
    # A URL to one of the [error types](errors/).
    string 'type;
    # A short description of the type
    string title;
    # The HTTP status code
    int status;
    # More information about why the error occurred.
    string detail?;
};

public type WebhookEntry record {
    # A text identifier for the webhook.
    # More than one webhook cannot have the same name.
    string? name;
    # The location of the webhook.
    # 
    # In addition to being a [valid URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier#Syntax), the url must also start with `http` or `https`.
    string? url;
    # The email address to which emails will be sent if there are problem with invoking the webhook.
    # The value must be a valid email address.
    # If this value is `null`, no email will be sent.
    # It is `null` by default.
    string? contactEmailAddress?;
    # Specifies when the webhook will be triggered.  
    # 
    # Please note the values are case sensitive.
    # 
    # If the value is `SENT`, the webhook will be called when a status update becomes available for a message you sent (i.e. a mobile terminating (MT) message).
    # 
    # If the value is `RECEIVED`, the webhook will be called when a message is received (i.e. a mobile originating (MO) message).
    # 
    # Note that this field forces you to create two separate webhook entries if you want to collect all messages.  However,  you can use the same `url` for both webhooks if you want.
    string? triggerScope;
    # Specifies how to invoke your webhook.
    # 
    # If the value is `ONE` the array POSTed to your webhook will contain no more than a single message.  Use this option if your webhook logic is unable to handle more than one messages at a time.
    # 
    # If the value is `MANY` the array POSTed to your webhook can contain up to 10 messages.  This is the recommended option.  The number of calls made to your webhook would be less and this will speed up your total processing time.
    # If your webhook fails for an invoke that has more than one message, each message in the array will automatically be retried one at a time. 
    # 
    # This value defaults to `ONE` - but it is recommended that you set this property to `MANY`.
    string? invokeOption?;
    # Indicates whether you want the webhook activated.
    # If the value is `true`, the webhook at the given `url` will be invoked with an empty array (`[]`) as part of the validation process.
    # If the webhook responds with a `2xx` status code, the submission is accepted; if not the webhook is not created (or updated).
    # If the value is `false` the webhook will be inactive, and it will not be invoked when messages are `SENT` or `RECEIVED`.
    # The default value is `true`.
    boolean? active?;
    # Indicates whether you want to show this webhook on the Web App.
    # Webhooks shown there can be updated by the user that use the public Web site.
    # The default value is `true`.
    boolean? onWebApp?;
};

# Identifies the submission.
public type MessageSubmission record {
    # A unique identity shared by all messages that were created from the same submission. This field should be ignored if the `type` is not SENT.
    string? id;
    # The date and time the submission was processed. If the `type` is RECEIVED, this field reflects the date and time the received message was processed.
    string? date;
};

# Represents a profile
public type Profile record {
    # profile ID
    string? id;
    # username of profile
    string? username;
    # Created data/time
    string? created;
    # Credit Amount
    ProfileCredits? credits;
    # quota details
    ProfileQuota? quota;
    # Original Address
    ProfileOriginaddresses? originAddresses?;
    # company details
    ProfileCompany? company?;
    # commerce profile details
    ProfileCommerce? commerce?;
};

# The status of the message
public type MessageStatus record {
    # A concatenated value A.B where A is the `status.type` and B is the `status.subtype`.  
    # It there is no value for `subtype` then B takes string value `"null"` (e.g. `"SENT.null"`).   
    string? id;
    # ACCEPTED  Message accepted for delivery. Only returned for initial message submissions.
    # SCHEDULED  Message accepted for delivery at a later date. Only returned for initial message  submissions.
    # SENT  Message has been relayed away from our systems.
    # DELIVERED  Successfully delivered to phone.
    # UNKNOWN  Message is in an unknown state.
    # FAILED  Delivery failed.
    string? 'type;
    # Has a value only if the `type` is FAILED.
    # EXPIRED  Delivery failed because message expired before delivery was possible.
    # HANDSET_ERROR  Delivery failed because of a problem related to the phone (e.g. message storage area full).
    # BLOCKED  Your account has been blocked from sending to this phone (e.g. recipient replied STOP to block communication).
    # NOT_SENT  Message delivery was not attempted (e.g. because we were not able to find a route for the supplied phone number).
    string? subtype?;
};

public type BlockedNumber record {
    # A unique identifier that is assigned when the BlockedNumber is created.
    int id;
    # A phone number in E.164 format
    PhoneNumber phoneNumber;
};

# Identifies the sender.
# 
# Instead of a structured object, you can supply a string value here. 
# If you do this, the `type` of the sender is derived to be either INTERNATIONAL or ALPHANUMERIC.  If the value does not begin with a `+` and it contains at least one character that is not a digit, the type is detected as ALPHANUMERIC. Otherwise, the type is detected as INTERNATIONAL.
public type SubmissionentryFrom record {
    # The type of the sender id.
    # 
    # If you want BulkSMS to collect replies to this message on your behalf, specify the type as REPLIABLE.  If the recipient is in a country where BulkSMS does not have a local reply number, the reply may incur costs that are more expensive than sending a local SMS in that country.
    # If you operate a service from a shortcode in a locale that allows messaging from such a shortcode, you can specify SHORTCODE for the type.
    string? 'type;
    # The address of the sender id.
    # 
    # The validation for this field depends on the value of the `type`.
    # INTERNATIONAL can start with `+`. It has a maximum length of 15 digits, and has to be longer than 6 digits.
    # ALPHANUMERIC has a maximum length of 11 characters.
    # SHORTCODE has a maximum length of 6 digits.
    # REPLIABLE should not specify a value here.
    string? address?;
};

# quota details
public type ProfileQuota record {
    # The setting that limits the number of messages you can send in a day.
    int? size;
    # The number of messages you can still send today.
    int? remaining;
};

# company details
public type ProfileCompany record {
    # name of the company
    string? name?;
    # tax reference
    string? taxReference?;
};

# A phone number in E.164 format
public type PhoneNumber string;

# Represents a webhook
public type Webhook record {
    # Webhook ID
    decimal? id?;
    # Webhook name
    string? name?;
    # Webhook URL
    string? url?;
    # Contact email address
    string? contactEmailAddress?;
    # Trigger scope details
    string? triggerScope?;
    # Indicates whether the webhook is active or not
    boolean? active?;
    # Indicates whether it is on web app or not
    boolean? onWebApp?;
};

# Credit Amount
public type ProfileCredits record {
    # Credit balance
    float? balance?;
    # Credit limit
    int? 'limit?;
    # Indicates whether the transferring is allowed or not
    boolean? isTransferAllowed?;
};

# Original Address
public type ProfileOriginaddresses record {
    # Indicates whether the full control is allowed or not
    boolean? isFullControlAllowed?;
    # An array of allowed details
    string[]? allowed?;
};

# An object that you use when posting messages.
public type SubmissionEntry record {
    # Identifies the sender.
    # 
    # Instead of a structured object, you can supply a string value here. 
    # If you do this, the `type` of the sender is derived to be either INTERNATIONAL or ALPHANUMERIC.  If the value does not begin with a `+` and it contains at least one character that is not a digit, the type is detected as ALPHANUMERIC. Otherwise, the type is detected as INTERNATIONAL.
    SubmissionentryFrom? 'from?;
    # Identifies the recipients
    # Instead of an array of structured objects, you can also provide a single object, a simple string or an array of strings.
    # If you supply a string, the `type` is taken as INTERNATIONAL.
    SubmissionentryTo[]? to;
    # Allows you to choose routing. The default is STANDARD.
    string? routingGroup?;
    # Describes the content of the message body.
    # 
    # Typically this is TEXT, which is the default if no value is provided.
    # 
    # If you need to send characters that are not covered by the [GSM 03.38](https://en.wikipedia.org/wiki/GSM_03.38) character set you will need to specify UNICODE.
    # 
    # If you want to send a sequence of bytes, you must use BINARY.
    # 
    # You can also or use the `auto-unicode` parameter of the Send Messages Operation.   
    # 
    # If you supply the value of `TEXT` while `auto-unicode` is `true` then your message may be converted to `UNICODE`.
    # 
    # If you supply a value other than `TEXT` for this property while `auto-unicode` is `true` then no automatic conversion will take place.
    string? encoding?;
    # The maximum number of message parts that can be used for a [concatenated message](https://en.wikipedia.org/wiki/Concatenated_SMS).
    # The default is `3`.
    int? longMessageMaxParts?;
    # The message content as described in the `encoding`. If the `encoding` is BINARY, the body must contain only hexadecimal digits where one byte is represented as two digits. For example, if you want to send two bytes '0x05' and '0x1F', the message body must contain the text '051F'.
    # The message content can also contain templates, read the [body templates section](#tag/Message) for more information.
    string? body;
    # Correlate the messages created from this submission to your data.
    # 
    # The value can contain no more than 20 characters.
    string? userSuppliedId?;
    # The TP-PID value from GSM 03.40[.750] §9.2.3.9.
    # 
    # You can provide either an integer value, or a mnemonic string.
    # 
    # If unspecified, this property defaults to `0`, representing the IMPLICIT value.
    # Numeric values are listed below
    # | Name | Value|
    # |----- |------|
    # | IMPLICIT              | 00 |
    # | SHORT_MESSAGE_TYPE_0  | 64 |
    # | REPLACE_MESSAGE_1     | 65 |
    # | REPLACE_MESSAGE_2     | 66 |
    # | REPLACE_MESSAGE_3     | 67 |
    # | REPLACE_MESSAGE_4     | 68 |
    # | REPLACE_MESSAGE_5     | 69 |
    # | REPLACE_MESSAGE_6     | 70 |
    # | REPLACE_MESSAGE_7     | 71 |
    # | RETURN_CALL           | 95 |
    # | ME_DOWNLOAD           | 125 |
    # | ME_DEPERSONALIZE      | 126 |
    # | SIM_DOWNLOAD          | 127 |
    string? protocolId?;
    # The class of the message, as specified by §4 of the GSM 03.38 specification.
    # You can provide either an integer value, or a mnemonic string.
    # The default value is SIM_SPECIFIC.
    # Numeric values are
    # | Name | Value|
    # |------|------|
    # | FLASH_SMS | 0      |
    # | ME_SPECIFIC | 1    |
    # | SIM_SPECIFIC | 2   |
    # | TE_SPECIFIC | 3   |
    string? messageClass?;
    # The type of delivery reports to request from the delivering network.
    # The default value  is `ALL`. Please note that not all networks support delivery reports.
    # ALL. All possible delivery reports
    # ERRORS. Only error delivery reports
    # NONE. No delivery reports
    string? deliveryReports?;
};
