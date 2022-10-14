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

# Error
public type RequestErrorResponse record {
    # The unique ID of the Verify request. This may be blank in an error situation
    @constraint:String {maxLength: 32}
    string request_id?;
    # Code | Text | Description
    # -- | -- | --
    # 0 | Success | The request was successfully accepted by Vonage.
    # 1 | Throttled | You are trying to send more than the maximum of 30 requests per second.
    # 2 | Your request is incomplete and missing the mandatory parameter `$parameter` | The stated parameter is missing.
    # 3 | Invalid value for parameter `$parameter` | Invalid value for parameter. If you see Facility not allowed in the error text, check that you are using the correct Base URL in your request.
    # 4 | Invalid credentials were provided | The supplied API key or secret in the request is either invalid or disabled.
    # 5 | Internal Error | An error occurred processing this request in the Cloud Communications Platform.
    # 6 | The Vonage platform was unable to process this message for the following reason: `$reason` | The request could not be routed.
    # 7 | The number you are trying to verify is blacklisted for verification. |
    # 8 | The api_key you supplied is for an account that has been barred from submitting messages. |
    # 9 | Partner quota exceeded | Your account does not have sufficient credit to process this request.
    # 10 | Concurrent verifications to the same number are not allowed |
    # 15 | The destination number is not in a supported network | The request has been rejected. Find out more about this error in the [Knowledge Base](https://help.nexmo.com/hc/en-us/articles/360018406532-Verify-On-demand-Service-to-High-Risk-Countries)
    # 20 | This account does not support the parameter: pin_code. | Only certain accounts have the ability to set the `pin_code`. Please contact your account manager for more information.
    # 29 | Non-Permitted Destination | Your Vonage account is still in demo mode. While in demo mode you must add target numbers to the approved list for your account. Add funds to your account to remove this limitation.
    string status?;
    # If `status` is non-zero, this explains the error encountered.
    string error_text?;
};

public type SearchresponseEvents record {
    string 'type?;
    string id?;
};

# You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
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

public type InlineResponse200 RequestResponse|RequestErrorResponse;

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
    @constraint:String {maxLength: 32}
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
    @constraint:String {maxLength: 18}
    string payee;
    # The decimal amount of the payment to be confirmed, in Euros
    float amount;
    # The length of the verification code.
    int code_length = 4;
    # By default, the SMS or text-to-speech (TTS) message is generated in the locale that matches the `number`. For example, the text message or TTS message for a `33*` number is sent in French. Use this parameter to explicitly control the language used.
    # *Note: Voice calls in English for `bg-bg`, `ee-et`, `ga-ie`, `lv-lv`, `lt-lt`, `mt-mt`, `sk-sk`, `sk-si`
    string lg = "en-gb";
    # How long the generated verification code is valid for, in seconds. When you specify both `pin_expiry` and `next_event_wait` then `pin_expiry` must be an integer multiple of `next_event_wait` otherwise `pin_expiry` is defaulted to equal next_event_wait. See [changing the event timings](https://developer.nexmo.com/verify/guides/changing-default-timings).
    @constraint:Int {minValue: 60, maxValue: 3600}
    int pin_expiry = 300;
    # Specifies the wait time in seconds between attempts to deliver the verification code.
    @constraint:Int {minValue: 60, maxValue: 900}
    int next_event_wait = 300;
    # Selects the predefined sequence of SMS and TTS (Text To Speech) actions to use in order to convey the PIN to your user. For example, an id of 1 identifies the workflow SMS - TTS - TTS. For a list of all workflows and their associated ids, please visit the [developer portal](https://developer.nexmo.com/verify/guides/workflows-and-events).
    int workflow_id = 1;
};

# Success
public type SearchResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify search request.
    string request_id?;
    # The Vonage account ID the request was for.
    string account_id?;
    # Code | Description
    # -- | --
    # IN PROGRESS | The search is still in progress.
    # SUCCESS | Your user entered a correct verification code.
    # FAILED | Your user entered an incorrect code more than three times.
    # EXPIRED | Your user did not enter a code before the `pin_expiry` time elapsed.
    # CANCELLED | The verification process was cancelled by a Verify control request.
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
    # -- | -- | --
    # 0 | Success | The request was successfully accepted by Vonage.
    # 1 | Throttled | You are trying to send more than the maximum of 30 requests per second.
    # 2 | Your request is incomplete and missing the mandatory parameter `$parameter` | The stated parameter is missing.
    # 3 | Invalid value for parameter `$parameter` | Invalid value for parameter. If you see Facility not allowed in the error text, check that you are using the correct Base URL in your request.
    # 4 | Invalid credentials were provided | The supplied API key or secret in the request is either invalid or disabled.
    # 5 | Internal Error | An error occurred processing this request in the Cloud Communications Platform.
    # 6 | The Vonage platform was unable to process this message for the following reason: `$reason` | The request could not be routed.
    # 16 | The code inserted does not match the expected value |
    # 17 | The wrong code was provided too many times | You can run Verify check on a specific `request_id` up to three times unless a new verification code is generated. If you check a request more than three times, it is set to FAILED and you cannot check it again.
    string status?;
    # If the `status` is non-zero, this explains the error encountered.
    string error_text?;
};

# You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
public type ApiSecret string;

public type InlineResponse2001 CheckResponse|CheckErrorResponse;

# Error
public type SearchErrorResponse record {
    # The `request_id` that you received in the response to the Verify request and used in the Verify search request. May be empty in an error situation.
    string request_id?;
    # Code | Description
    # -- | --
    # IN PROGRESS | The search is still in progress.
    # SUCCESS | Your user entered a correct verification code.
    # FAILED | Your user entered an incorrect code more than three times.
    # EXPIRED | Your user did not enter a code before the `pin_expiry` time elapsed.
    # CANCELLED | The verification process was cancelled by a Verify control request.
    # 101 | You supplied an invalid `request_id`, or the data is not available. Note that for recently-completed requests, there can be a delay of up to 1 minute before the results are available in search.
    string status?;
    # If `status` is not `SUCCESS`, this message explains the issue encountered.
    string error_text?;
};

public type InlineResponse2003 ControlResponse|ControlErrorResponse;

public type CheckRequest record {
    # You can find your API key in your [account dashboard](https://dashboard.nexmo.com)
    ApiKey api_key;
    # You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)
    ApiSecret api_secret;
    # The Verify request to check. This is the `request_id` you received in the response to the Verify request.
    @constraint:String {maxLength: 32}
    string request_id;
    # The verification code entered by your user.
    @constraint:String {maxLength: 6, minLength: 4}
    string code;
    # (This field is no longer used)
    string ip_address?;
};

public type InlineResponse2002 SearchResponse|SearchErrorResponse;

# Success
public type ControlResponse record {
    # `cmd` | Code | Description
    # -- | -- | --
    # Any | 0 | Success
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
    @constraint:String {maxLength: 18}
    string brand;
    # An 11-character alphanumeric string that represents the [identity of the sender](https://developer.nexmo.com/messaging/sms/guides/custom-sender-id) of the verification request. Depending on the destination of the phone number you are sending the verification SMS to, restrictions might apply.
    @constraint:String {maxLength: 11}
    string sender_id = "VERIFY";
    # The length of the verification code.
    int code_length = 4;
    # By default, the SMS or text-to-speech (TTS) message is generated in the locale that matches the `number`. For example, the text message or TTS message for a `33*` number is sent in French. Use this parameter to explicitly control the language used for the Verify request. A list of languages is available: <https://developer.nexmo.com/verify/guides/verify-languages>
    string lg = "en-us";
    # How long the generated verification code is valid for, in seconds. When you specify both `pin_expiry` and `next_event_wait` then `pin_expiry` must be an integer multiple of `next_event_wait` otherwise `pin_expiry` is defaulted to equal next_event_wait. See [changing the event timings](https://developer.nexmo.com/verify/guides/changing-default-timings).
    @constraint:Int {minValue: 60, maxValue: 3600}
    int pin_expiry = 300;
    # Specifies the wait time in seconds between attempts to deliver the verification code.
    @constraint:Int {minValue: 60, maxValue: 900}
    int next_event_wait = 300;
    # Selects the predefined sequence of SMS and TTS (Text To Speech) actions to use in order to convey the PIN to your user. For example, an id of 1 identifies the workflow SMS - TTS - TTS. For a list of all workflows and their associated ids, please visit the [developer portal](https://developer.nexmo.com/verify/guides/workflows-and-events).
    int workflow_id = 1;
};

# This field may not be present, depending on your pricing model.
public type EstimatedPriceMessagesSent string;

# Error
public type ControlErrorResponse record {
    # Code | Text | Description
    # -- | -- | --
    # 0 | Success | The request was successfully accepted by Vonage.
    # 1 | Throttled | You are trying to send more than the maximum of 30 requests per second.
    # 2 | Your request is incomplete and missing the mandatory parameter `$parameter` | The stated parameter is missing.
    # 3 | Invalid value for parameter `$parameter` | Invalid value for parameter. If you see Facility not allowed in the error text, check that you are using the correct Base URL in your request.
    # 4 | Invalid credentials were provided | The supplied API key or secret in the request is either invalid or disabled.
    # 5 | Internal Error | An error occurred processing this request in the Cloud Communications Platform.
    # 6 | The Vonage platform was unable to process this message for the following reason: `$reason` | The request could not be routed.
    # 8 | The api_key you supplied is for an account that has been barred from submitting messages. |
    # 9 | Partner quota exceeded | Your account does not have sufficient credit to process this request.
    # 19 | For `cancel`: Either you have not waited at least 30 secs after sending a Verify request before cancelling or Verify has made too many attempts to deliver the verification code for this request and you must now wait for the process to complete. For `trigger_next_event`: All attempts to deliver the verification code for this request have completed and there are no remaining events to advance to.
    string status?;
    # If the `status` is non-zero, this explains the error encountered.
    string error_text?;
};
