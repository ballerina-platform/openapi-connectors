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

public type UsageBycountryBody record {
    # The date you want to start retrieving usage retrieving usage information from. The date should be expressed according to ISO-8601 format YYYY-MM-DD or YYYYMMDD.
    string startDate;
    # The date you want to stop retrieving usage information from. As with the start date, use ISO-8601 format YYYY-MM-DD or YYYYMMDD.
    string endDate;
    # The account name tied to your API key. If unknown, please contact your Account Manager.
    string accountName;
};

public type Usage record {
    # The country code expressed according to [ISO 3166-1 Alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1) code format.
    string country?;
    # Number of messages sent per country.
    string messagesCount?;
    # This is the account name tied to your API key. If unknown, please contact your account manager at Mitto for more information.
    string cost?;
};

public type SmsBody record {
    # When set to true, the API call is in test mode and no actual SMS is delivered. The response returns “test”: true. For test calls, there is no id parameter in the response. When set to false, you make the API call in production mode. The system delivers an SMS, and returns the id parameter in the response.
    #   If you do not use this parameter , by default you make the API call in production mode.
    boolean test?;
    # Free-form text with which the sender identifies themselves to the recipient. This is what the recipient will see as from whom the message is. Can be a phone number, or the name of the company or the service. NOTE - what you provide here may not be shown to the customer depending on how carriers choose to handle your message.
    string 'from;
    # The number to which the message is sent. Numbers are specified in E.164 format. 
    string to;
    # The body of the SMS message.
    #   If the message contains characters outside the range of the GSM Standard and Extended tables, then you need to set the character encoding to Unicode (type=Unicode as a query parameter). For details, refer to Long SMSs and Changing the Default Encoding of the Message. 
    string text;
    # Character set in which the message body will be encoded. If not specified, the default encoding (GSM) is used. For Unicode, set type Unicode. For Binary, set type to be Byte. For automatic detection set type to auto.
    string 'type?;
    # First metadata field for tagging the message. The metadata is returned in the delivery report by the callback. It can be any free-form text you consider appropriate. You can use a different reference string for each message or tag multiple messages with the same string and group them together in this way. For details, refer to [Delivery Reports](https://docs.mitto.ch/sms-use-cases/#retrieve-delivery-reports) and [Add Metadata to the Message](https://docs.mitto.ch/sms-use-cases/#add-metadata-to-a-message).
    string reference?;
    # Custom Hex-encoded User Data Header.
    string udh?;
    # Validity period of the SMS message in minutes. When a message has not been delivered to the receiver at the first attempt, subsequent delivery attempts will be made until the validity period expires, after which the message is discarded as undeliverable. If the specified validity period is different from the validity period of the supplier, then the shorter period is enforced. When not specified, the validity of a message defaults to 2,880 minutes (48 hours).
    int validity?;
    # Protocol identifier to use. Must be consistent with the udh parameter value. When not specified, defaults to 0.
    int pid?;
    # When set to true it will send the message in Flash mode. Flash SMS is when the SMS appears directly on the main screen without user interaction, and is not automatically stored in the inbox.
    boolean flash?;
    # When used, it overrides the URL address set on the account. For more details see the use case [Replace Callback URL in API Call](http://mitto.wpengine.com/sms-use-cases/#optional-callback-url-in-api-call).
    string callback?;
};

public type Smsbulk record {
    int responseCode?;
    string responseText?;
    SmsbulkMessages messages?;
};

public type SmsConvertedBody record {
    string messageId?;
};

public type Sms record {
    # ID string of the SMS message. When the length of the body text of the message exceeds the limit, then several concatenated are send to the receiver and in that case only id of the first message is returned. Not returned when making a test call or when error occurs.
    string id?;
    # Timestamp of the SMS message in ISO 8601 format. Example - 2019-04-13T17:51:06.3091182Z For a description of the format, refer to [Date and Time Formats](https://www.w3.org/TR/NOTE-datetime) page of the W3 Consortium.
    string timestamp?;
    # Text describing the responseCode. For details, refer to Status Codes.
    int responseCode?;
    # The length of the message you sent. If there is an error, or if the message is empty, this will be 0.
    int textLength?;
    # Text describing the responseCode. For details, refer to Status Codes.
    string responseText?;
    # When "test" is set to true, it indicates you are making a test API call. (No actual SMS is sent.) When not present, or when "test" is set to false or not included, an actual message is sent.
    boolean test?;
};

public type SmsbulkBody record {
    # When set to true, the API call is in test mode and no actual SMSes are delivered. The response returns “test”: true. For test calls, there is no id parameter in the response. When set to false, you make the API call in production mode. The system delivers an SMS, and returns the id parameter in the response.
    #   If you do not use this parameter , by default you make the API call in production mode.
    boolean test?;
    # Free-form text with which the sender identifies themselves to the recipient. This is what the recipient will see as from whom the message is. Can be a phone number, or the name of the company or the service. NOTE - what you provide here may not be shown to the customer depending on how carriers choose to handle your message.
    string 'from;
    # A list of strings separated by commas. Each string is the number to which your message is sent. Numbers are specified in E.164 format. You can repeat the same phone number, and the message will be sent to the number as many times as the number is listed.
    string to;
    # The body of the SMS message.
    #   If the message contains characters outside the range of the GSM Standard and Extended tables, then you need to set the character encoding to Unicode (type=Unicode as a query parameter). For details, refer to Long SMSs and Changing the Default Encoding of the Message. 
    string text;
    # Character set in which the message body will be encoded. If not specified, the default encoding (GSM) is used. For Unicode, set type Unicode. For Binary, set type to be Byte. For automatic detection set type to auto.
    string 'type?;
    # First metadata field for tagging the message. The metadata is returned in the delivery report by the callback. It can be any free-form text you consider appropriate. You can use a different reference string for each message or tag multiple messages with the same string and group them together in this way.
    string reference?;
    # Custom Hex-encoded User Data Header.
    string udh?;
    # Validity period of the SMS message in minutes. When a message has not been delivered to the receiver at the first attempt, subsequent delivery attempts will be made until the validity period expires, after which the message is discarded as undeliverable. If the specified validity period is different from the validity period of the supplier, then the shorter period is enforced. When not specified, the validity of a message defaults to 2,880 minutes (48 hours).
    int validity?;
    # Protocol identifier to use. Must be consistent with the udh parameter value. When not specified, defaults to 0.
    int pid?;
    # When set to true it will send the message in Flash mode. Flash SMS is when the SMS appears directly on the main screen without user interaction, and is not automatically stored in the inbox.
    boolean flash?;
    # When used, it overrides the URL address set on the account. 
    string callback?;
};

public type SmsbulkMessages record {
    # The unique identifier for the individual message sent to a phone number.
    string id?;
    string timestamp?;
};
