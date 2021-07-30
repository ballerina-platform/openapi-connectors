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

# Error
public type RequestErrorResponse record {
    # The unique ID of the Verify request. This may be blank in an error situation
    string request_id?;
    # Code | Text | Description
    string status?;
    # If `status` is non-zero, this explains the error encountered.
    string error_text?;
};

public type SearchresponseEvents record {
    string 'type?;
    string id?;
};

# You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
#
public type ApiKey string;

public type SearchresponseChecks record {
    # The date and time this check was received (in the format YYYY-MM-DD HH:MM:SS)
    string date_received?;
    # The code supplied with this check request
    string code?;
    string status?;
    # The IP address, if available (this field is no longer used).
    string ip_address?;
};

public type  InlineResponse200 RequestResponse;

# Success
public type CheckResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify check request.
    string request_id?;
    # The ID of the verification event, such as an SMS or TTS call.
    string event_id?;
    # A value of `0` indicates that your user entered the correct code. If it is non-zero, check the `error_text`.
    string status?;
    # The cost incurred for this request.
    string price?;
    # The currency code.
    string currency?;
    # This field may not be present, depending on your pricing model.
    EstimatedPriceMessagesSent estimated_price_messages_sent?;
};

public type ControlRequest record {
    # You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
    ApiKey api_key;
    # You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
    ApiSecret api_secret;
    # The `request_id` you received in the response to the Verify request.
    string request_id;
    # The possible commands are `cancel` to request cancellation of the verification process, or `trigger_next_event` to advance  to the next verification event (if any). Cancellation is only possible 30 seconds after the start of the verification request and before the second event (either TTS or SMS) has taken place.
    string cmd;
};

# Success
public type RequestResponse record {
    # The unique ID of the Verify request. You need this `request_id` for the Verify check.
    string request_id?;
    # Indicates the outcome of the request; zero is success
    string status?;
};

public type Psd2Request record {
    # You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
    ApiKey api_key;
    # You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
    ApiSecret api_secret;
    # The mobile or landline phone number to verify. Unless you are setting `country` explicitly, this number must be in [E.164](https://en.wikipedia.org/wiki/E.164) format.
    string number;
    # If you do not provide `number` in international format or you are not sure if `number` is correctly formatted, specify the two-character country code in `country`. Verify will then format the number for you.
    string country?;
    # An alphanumeric string to indicate to the user the name of the recipient that they are confirming a payment to.
    string payee;
    # The decimal amount of the payment to be confirmed, in Euros
    float amount;
    # The length of the verification code.
    int code_length?;
    # By default, the SMS or text-to-speech (TTS) message is generated in the locale that matches the `number`. For example, the text message or TTS message for a `33*` number is sent in French. Use this parameter to explicitly control the language used.
    string lg?;
    # How long the generated verification code is valid for, in seconds. When you specify both `pin_expiry` and `next_event_wait` then `pin_expiry` must be an integer multiple of `next_event_wait` otherwise `pin_expiry` is defaulted to equal next_event_wait. See [changing the event timings](https://developer.nexmo.com/verify/guides/changing-default-timings).
    int pin_expiry?;
    # Specifies the wait time in seconds between attempts to deliver the verification code.
    int next_event_wait?;
    # Selects the predefined sequence of SMS and TTS (Text To Speech) actions to use in order to convey the PIN to your user. For example, an id of 1 identifies the workflow SMS - TTS - TTS. For a list of all workflows and their associated ids, please visit the [developer portal](https://developer.nexmo.com/verify/guides/workflows-and-events).
    int workflow_id?;
};

# Success
public type SearchResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify search request.
    string request_id?;
    # The Vonage account ID the request was for.
    string account_id?;
    # Code | Description
    string status?;
    # The phone number this verification request was used for.
    string number?;
    # The cost incurred for this verification request.
    string price?;
    # The currency code.
    string currency?;
    # The `sender_id` you provided in the Verify request.
    string sender_id?;
    # The date and time the verification request was submitted, in the following format YYYY-MM-DD HH:MM:SS.
    string date_submitted?;
    # The date and time the verification request was completed. This response parameter is in the following format YYYY-MM-DD HH:MM:SS.
    string date_finalized?;
    # The time the first verification attempt was made, in the following format YYYY-MM-DD HH:MM:SS.
    string first_event_date?;
    # The time the last verification attempt was made, in the following format YYYY-MM-DD HH:MM:SS.
    string last_event_date?;
    # The list of checks made for this verification and their outcomes.
    SearchresponseChecks[] checks?;
    # The events that have taken place to verify this number, and their unique identifiers.
    SearchresponseEvents[] events?;
    # This field may not be present, depending on your pricing model.
    EstimatedPriceMessagesSent estimated_price_messages_sent?;
};

# Error
public type CheckErrorResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify check request.
    string request_id?;
    # Code | Text | Description
    string status?;
    # If the `status` is non-zero, this explains the error encountered.
    string error_text?;
};

# You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
#
public type ApiSecret string;

public type  InlineResponse2001 CheckResponse;

# Error
public type SearchErrorResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify search request. May be empty in an error situation.
    string request_id?;
    # Code | Description
    string status?;
    # If `status` is not `SUCCESS`, this message explains the issue encountered.
    string error_text?;
};

public type  InlineResponse2003 ControlResponse;

public type CheckRequest record {
    # You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
    ApiKey api_key;
    # You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
    ApiSecret api_secret;
    # The Verify request to check. This is the `request_id` you received in the response to the Verify request.
    string request_id;
    # The verification code entered by your user.
    string code;
    # (This field is no longer used)
    string ip_address?;
};

public type  InlineResponse2002 SearchResponse;

# Success
public type ControlResponse record {
    # `cmd` | Code | Description
    string status?;
    # The `cmd` you sent in the request.
    string command?;
};

public type VerifyRequest record {
    # You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
    ApiKey api_key;
    # You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
    ApiSecret api_secret;
    # The mobile or landline phone number to verify. Unless you are setting `country` explicitly, this number must be in [E.164](https://en.wikipedia.org/wiki/E.164) format.
    string number;
    # If you do not provide `number` in international format or you are not sure if `number` is correctly formatted, specify the two-character country code in `country`. Verify will then format the number for you.
    string country?;
    # An 18-character alphanumeric string you can use to personalize the verification request SMS body, to help users identify your company or application name. For example: "Your `Acme Inc` PIN is ..."
    string brand;
    # An 11-character alphanumeric string that represents the [identity of the sender](https://developer.nexmo.com/messaging/sms/guides/custom-sender-id) of the verification request. Depending on the destination of the phone number you are sending the verification SMS to, restrictions might apply.
    string sender_id?;
    # The length of the verification code.
    int code_length?;
    # By default, the SMS or text-to-speech (TTS) message is generated in the locale that matches the `number`. For example, the text message or TTS message for a `33*` number is sent in French. Use this parameter to explicitly control the language used for the Verify request. A list of languages is available: <https://developer.nexmo.com/verify/guides/verify-languages>
    string lg?;
    # How long the generated verification code is valid for, in seconds. When you specify both `pin_expiry` and `next_event_wait` then `pin_expiry` must be an integer multiple of `next_event_wait` otherwise `pin_expiry` is defaulted to equal next_event_wait. See [changing the event timings](https://developer.nexmo.com/verify/guides/changing-default-timings).
    int pin_expiry?;
    # Specifies the wait time in seconds between attempts to deliver the verification code.
    int next_event_wait?;
    # Selects the predefined sequence of SMS and TTS (Text To Speech) actions to use in order to convey the PIN to your user. For example, an id of 1 identifies the workflow SMS - TTS - TTS. For a list of all workflows and their associated ids, please visit the [developer portal](https://developer.nexmo.com/verify/guides/workflows-and-events).
    int workflow_id?;
};

# This field may not be present, depending on your pricing model.

#
public type EstimatedPriceMessagesSent string;

# Error
public type ControlErrorResponse record {
    # Code | Text | Description
    string status?;
    # If the `status` is non-zero, this explains the error encountered.
    string error_text?;
};
