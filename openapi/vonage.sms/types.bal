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

public type Message record {
    # The number the message was sent to. Numbers are specified in E.164 format.
    string to?;
    # The ID of the message
    string messageId?;
    # The status of the message. See [Troubleshooting Failed SMS](/messaging/sms/guides/troubleshooting-sms).
    string status?;
    # Your remaining balance
    string remainingBalance?;
    # The cost of the message
    string messagePrice?;
    # The ID of the network of the recipient
    string network?;
    # If a `client-ref` was included when sending the SMS, this field will be included and hold the value that was sent.
    string clientRef?;
    # **Advanced**: An optional string used to identify separate accounts using the SMS endpoint for billing purposes. To use this feature, please email [support@nexmo.com](mailto:support@nexmo.com)
    string accountRef?;
};

public type DeliveryReceipt record {
    # The number the message was sent to. Numbers are specified in E.164 format.
    string msisdn?;
    # The SenderID you set in `from` in your request.
    string to?;
    # The Mobile Country Code Mobile Network Code (MCCMNC) of the carrier this phone number is registered with.
    string networkCode?;
    # The Vonage ID for this message.
    string messageId?;
    # The cost of the message
    string price?;
    # A code that explains where the message is in the delivery process.
    string status?;
    # When the DLR was received from the carrier in the following format `YYMMDDHHMM`. For example, `2001011400` is at `2020-01-01 14:00`
    string scts?;
    # The status of the request. Will be a non `0` value if there has been an error, or if the status is unknown. See the [Delivery Receipt documentation](/messaging/sms/guides/delivery-receipts#dlr-error-codes) for more details
    string errCode?;
    # The API key that sent the SMS. This is useful when multiple accounts are sending webhooks to the same endpoint.
    string apiKey?;
    # If the `client-ref` is set when the SMS is sent, it will be included in the delivery receipt
    string clientRef?;
    # The time when Vonage started to push this Delivery Receipt to your webhook endpoint.
    string messageTimestamp?;
    # A timestamp in Unix (seconds since the epoch) format. _Only included if you have signatures enabled_
    string timestamp?;
    # A random string to be used when calculating the signature. _Only included if you have signatures enabled_
    string nonce?;
    # The signature to enable verification of the source of this webhook. Please see the [developer documentation for validating signatures](/concepts/guides/signing-messages) for more information, or use one of our published SDKs. _Only included if you have signatures enabled_
    string sig?;
};

public type NewMessage record {
    # Your API key
    @constraint:String {maxLength: 8, minLength: 8}
    string api_key;
    # Your API secret. Required unless `sig` is provided
    @constraint:String {maxLength: 32, minLength: 6}
    string api_secret?;
    # The hash of the request parameters in alphabetical order, a timestamp and the signature secret. See [Signing Requests](/concepts/guides/signing-messages) for more details.
    @constraint:String {maxLength: 60, minLength: 16}
    string sig?;
    # The name or number the message should be sent from. Alphanumeric senderID's are not supported in all countries, see [Global Messaging](/messaging/sms/guides/global-messaging#country-specific-features) for more details. If alphanumeric, spaces will be ignored. Numbers are specified in E.164 format.
    string 'from;
    # The number that the message should be sent to. Numbers are specified in E.164 format.
    @constraint:String {maxLength: 15, minLength: 7}
    string to;
    # The body of the message being sent. If your message contains characters that can be encoded according to the GSM Standard and Extended tables then you can set the `type` to `text`. If your message contains characters outside this range, then you will need to set the `type` to `unicode`.
    string text?;
    # **Advanced**: The duration in milliseconds the delivery of an SMS will be attempted.§§ By default Vonage attempts delivery for 72 hours, however the maximum effective value depends on the operator and is typically 24 - 48 hours. We recommend this value should be kept at its default or at least 30 minutes.
    @constraint:Int {minValue: 20000, maxValue: 604800000}
    int ttl = 259200000;
    # **Advanced**: Boolean indicating if you like to receive a [Delivery Receipt](/messaging/sms/building-blocks/receive-a-delivery-receipt).
    boolean statusReportReq = true;
    # **Advanced**: The webhook endpoint the delivery receipt for this sms is sent to. This parameter overrides the webhook endpoint you set in Dashboard.
    string callback?;
    # **Advanced**: The Data Coding Scheme value of the message
    int messageClass?;
    # **Advanced**: The format of the message body
    string 'type = "text";
    # **Advanced**: A business card in [vCard format](https://en.wikipedia.org/wiki/VCard). Depends on `type` parameter having the value `vcard`.
    string vcard?;
    # **Advanced**: A calendar event in [vCal format](https://en.wikipedia.org/wiki/VCal). Depends on `type` parameter having the value `vcal`.
    string vcal?;
    # **Advanced**: Hex encoded binary data. Depends on `type` parameter having the value `binary`.
    string body?;
    # **Advanced**: Your custom Hex encoded [User Data Header](https://en.wikipedia.org/wiki/User_Data_Header). Depends on `type` parameter having the value `binary`.
    string udh?;
    # **Advanced**: The value of the [protocol identifier](https://en.wikipedia.org/wiki/GSM_03.40#Protocol_Identifier) to use. Ensure that the value is aligned with `udh`.
    int protocolId?;
    # **Advanced**: The title for a wappush SMS. Depends on `type` parameter having the value `wappush`.
    string title?;
    # **Advanced**: The URL of your website. Depends on `type` parameter having the value `wappush`.
    string url?;
    # **Advanced**: The availability for an SMS in milliseconds. Depends on `type` parameter having the value `wappush`.
    string validity?;
    # **Advanced**: You can optionally include your own reference of up to 40 characters.
    string clientRef?;
    # **Advanced**: An optional string used to identify separate accounts using the SMS endpoint for billing purposes. To use this feature, please email [support@nexmo.com](mailto:support@nexmo.com)
    string accountRef?;
    # **Advanced**: A string parameter that satisfies regulatory requirements when sending an SMS to specific countries. For more information please refer to the [Country-Specific Outbound SMS Features](https://help.nexmo.com/hc/en-us/articles/115011781468)
    string entityId?;
    # **Advanced**: A string parameter that satisfies regulatory requirements when sending an SMS to specific countries. For more information please refer to the [Country-Specific Outbound SMS Features](https://help.nexmo.com/hc/en-us/articles/115011781468)
    string contentId?;
};

# Message sent
public type SMS record {
    # The amount of messages in the request
    string messageCount?;
    # Array of Messages
    Message[] messages?;
};

# Message sent
public type SMSXml record {
    # Array of Messages
    record {int count?;} messages?;
};

# Error
public type Error record {
    # The amount of messages in the request
    string messageCount?;
    # Array of Error Messages
    ErrorMessage[] messages?;
};

public type InboundMessage record {
    # The Vonage API Key of the receiving account.
    string apiKey?;
    # The phone number that this inbound message was sent from. Numbers are specified in E.164 format.
    string msisdn;
    # The phone number the message was sent to. **This is your virtual number**. Numbers are specified in E.164 format.
    string to;
    # The ID of the message
    string messageId;
    # The message body for this inbound message.
    string text;
    # Possible values are:
    # 
    #   - `text` - standard text.
    #   - `unicode` - URLencoded   unicode  . This is valid for standard GSM, Arabic, Chinese, double-encoded characters and so on.
    #   - `binary` - a binary message.
    string 'type;
    # The first word in the message body. Converted to upper case.
    string keyword;
    # The time when Vonage started to push this Delivery Receipt to your webhook endpoint.
    string messageTimestamp?;
    # A unix timestamp representation of message-timestamp.
    string timestamp?;
    # A random string that forms part of the signed set of parameters, it adds an extra element of unpredictability into the signature for the request. You use the nonce and timestamp parameters with your shared secret to calculate and validate the signature for inbound messages.
    string nonce?;
    # True - if this is a concatenated message. This field does not exist if it is a single message
    string concat?;
    # The transaction reference. All parts of this message share this value.
    string concatRef?;
    # The number of parts in this concatenated message.
    string concatTotal?;
    # The number of this part in the message. Counting starts at 1.
    string concatPart?;
    # The content of this message, if type is binary.
    string data?;
    # The hex encoded User Data Header, if type is binary
    string udh?;
};

public type InlineResponse200 SMS;

public type ErrorMessage record {
    # The error status of the message
    string status?;
    # The description of the error
    string errorText?;
};

# Error
public type ErrorXml record {
    # Array of Error Messages
    ErrorMessage[] messages?;
};
