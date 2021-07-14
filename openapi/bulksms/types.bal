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
    ProfileCommerceAddress address?;
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
    MessageSubmission submission?;
    # The status of the message
    MessageStatus status;
    # This field has a value only if the type is RECEIVED.
    string relatedSentMessageId?;
    # This is the value you supplied in the `userSuppliedId` field.
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
    string? name;
    # The location of the webhook.
    string? url;
    # The email address to which emails will be sent if there are problem with invoking the webhook.
    string? contactEmailAddress?;
    # Specifies when the webhook will be triggered.  
    string? triggerScope;
    # Specifies how to invoke your webhook.
    string? invokeOption?;
    # Indicates whether you want the webhook activated.
    boolean? active?;
    # Indicates whether you want to show this webhook on the Web App.
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
    ProfileCredits credits;
    # quota details
    ProfileQuota quota;
    # Original Address
    ProfileOriginaddresses originAddresses?;
    # company details
    ProfileCompany company?;
    # commerce profile details
    ProfileCommerce commerce?;
};

# The status of the message
public type MessageStatus record {
    # A concatenated value A.B where A is the `status.type` and B is the `status.subtype`.  
    string? id;
    # ACCEPTED  Message accepted for delivery. Only returned for initial message submissions.
    string? 'type;
    # Has a value only if the `type` is FAILED.
    string? subtype?;
};

public type BlockedNumber record {
    # A unique identifier that is assigned when the BlockedNumber is created.
    int id;
    record {} phoneNumber;
};

# Identifies the sender.
public type SubmissionentryFrom record {
    # The type of the sender id.
    string? 'type;
    # The address of the sender id.
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
#
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
    SubmissionentryFrom 'from?;
    # Identifies the recipients
    SubmissionentryTo[]? to;
    # Allows you to choose routing. The default is STANDARD.
    string? routingGroup?;
    # Describes the content of the message body.
    string? encoding?;
    # The maximum number of message parts that can be used for a [concatenated message](https://en.wikipedia.org/wiki/Concatenated_SMS).
    int? longMessageMaxParts?;
    # The message content as described in the `encoding`. If the `encoding` is BINARY, the body must contain only hexadecimal digits where one byte is represented as two digits. For example, if you want to send two bytes '0x05' and '0x1F', the message body must contain the text '051F'.
    string? body;
    # Correlate the messages created from this submission to your data.
    string? userSuppliedId?;
    # The TP-PID value from GSM 03.40[.750] §9.2.3.9.
    string? protocolId?;
    # The class of the message, as specified by §4 of the GSM 03.38 specification.
    string? messageClass?;
    # The type of delivery reports to request from the delivering network.
    string? deliveryReports?;
};
