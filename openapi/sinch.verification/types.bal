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

public type CalloutrequesteventresponseCallout record {
    # Indicates the language that should be used for the text-to-speech message. Currently, only `en-US` is supported.
    string locale?;
    # The message that can be played to the user when the phone call is picked up. The default value is: "To verify your phone number, please press {pin}. If you didnâ€™t request this call, please hang up."
    string ttsMenu?;
    # The `.wav` file that can be played to the user when the phone call is picked up.
    string wavFile?;
    # The digit that the user should press to verify the phone number. The default value is `1`.
    string pin?;
};

public type VerificationResponse record {
    # Verification identifier used to query for status.
    string id?;
    # The type of the verification request.
    VerificationMethod method?;
    # The status of the verification request.
    string status?;
    # Displays the reason why a verification has `FAILED`, was `DENIED`, or was `ABORTED`.
    string reason?;
    # The reference ID that was optionally passed together with the verification request.
    string reference?;
    # Free text that the client is sending, used to show if the call/SMS was intercepted or not.
    string 'source?;
};

# The response contains the `template` of the SMS to be expected and intercepted.
public type SmsinitiateverificationresponseSms record {
    # The expected SMS response.
    string template?;
};

public type VerificationRequestEvent record {
    # The ID of the verification request.
    string id;
    # The type of the event.
    string event;
    # The verification method.
    string method;
    # Specifies the type of endpoint that will be verified and the particular endpoint. `number` is currently the only supported endpoint type.
    Identity identity;
    # The amount of money and currency of the verification request.
    VerificationrequesteventPrice price?;
    # Used to pass your own reference in the request for tracking purposes.
    string reference?;
    # Can be used to pass custom data in the request.
    string custom?;
    # Allows you to set or override if provided in the API request, the SMS verification content language. Only used with the SMS verification method. The content language specified in the API request or in the callback can be overridden by carrier provider specific templates, due to compliance and legal requirements, such as [US shortcode requirements (pdf)](https://community.sinch.com/t5/SMS/Sinch-US-Short-Code-Onboarding-Overview/ta-p/7085).
    string[] acceptLanguage?;
};

public type CalloutInitiateVerificationResponse record {
    # Verification identifier used to query for status.
    string id;
    # The response contains information for the client to poll for the verification result.
    CalloutinitiateverificationresponseCallout callout;
};

public type SMSInitiateVerificationResponse record {
    # Verification identifier used to query for status.
    string id;
    # The response contains the `template` of the SMS to be expected and intercepted.
    SmsinitiateverificationresponseSms sms;
};

public type InitiateVerificationResource record {
    # Specifies the type of endpoint that will be verified and the particular endpoint. `number` is currently the only supported endpoint type.
    Identity identity;
    # The type of the verification request.
    VerificationMethod method;
    # Used to pass your own reference in the request for tracking purposes.
    string reference?;
    # Can be used to pass custom data in the request.
    string custom?;
    # An optional object for flashCall verifications. It allows you to specify dial time out parameter for flashCall. FlashCallOptions object can be specified optionally, and only if the verification request was triggered from your backend (no SDK client) through an [Application signed request](/docs/voice/api-reference/authentication#application-signed-request).
    InitiateverificationresourceFlashcalloptions flashCallOptions?;
};

public type FlashCallInitiateVerificationResponse record {
    # Verification identifier used to query for status.
    string id;
    # The response contains the `cliFilter` and `interceptionTimeout` properties.
    FlashcallinitiateverificationresponseFlashcall flashCall;
};

public type SmsVerificationReportRequest record {
    # The type of verification.
    string method;
    # Contains information about the SMS verification.
    SmsverificationreportrequestSms sms;
};

public type CalloutRequestEventResponse record {
    # Determines whether the verification can be executed.
    string action?;
    CalloutrequesteventresponseCallout callout?;
};

public type SmsrequesteventresponseSms record {
    # The SMS PIN that should be used. By default, the Sinch dashboard will automatically generate PIN codes for SMS verification. If you want to set your own PIN, you can specify it in the response to the Verification Request Event.
    string code?;
    # The SMS verification content language. Set in the verification request.
    string[] acceptLanguage?;
};

public type VerificationResultEvent record {
    # The ID of the verification request.
    string id;
    # The type of the event.
    string event;
    # The verification method.
    string method;
    # Specifies the type of endpoint that will be verified and the particular endpoint. `number` is currently the only supported endpoint type.
    Identity identity;
    # The status of the verification request.
    string status;
    # Displays the reason why a verification has `FAILED`, was `DENIED`, or was `ABORTED`.
    string reason?;
    # The reference ID that was optionally passed together with the verification request.
    string reference?;
    # Free text that the client is sending, used to show if the call/SMS was intercepted or not.
    string 'source?;
    # A custom string that can be provided during a verification request.
    string custom?;
};

public type VerificationRequestEventResponse SMSRequestEventResponse|FlashCallRequestEventResponse|CalloutRequestEventResponse;

# Specifies the type of endpoint that will be verified and the particular endpoint. `number` is currently the only supported endpoint type.
public type Identity record {
    # Currently only `number` type is supported.
    string 'type;
    # For `number` use an [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537)-compatible phone number.
    string endpoint;
};

public type VerificationReportRequestResource SmsVerificationReportRequest|FlashcallVerificationReportRequest;

# Contains information about the FlashCall verification.
public type FlashcallverificationreportrequestFlashcall record {
    # The caller ID of the FlashCall.
    string cli;
};

public type InitiateVerificationResponse SMSInitiateVerificationResponse|FlashCallInitiateVerificationResponse|CalloutInitiateVerificationResponse|DataInitiateVerificationResponse;

public type VerificationResultEventResponse SMSRequestEventResponse|FlashCallRequestEventResponse|CalloutRequestEventResponse;

public type DataInitiateVerificationResponse record {
    # Verification identifier used to query for status.
    string id;
    # The response contains the target URI.
    DatainitiateverificationresponseSeamless seamless?;
};

# The amount of money and currency of the verification request.
public type VerificationrequesteventPrice record {
    # The amount of money of the verification request.
    int amount?;
    # The currency of the price.
    string currencyId?;
};

# Contains information about the SMS verification.
public type SmsverificationreportrequestSms record {
    # The code which was input by the user submitting the SMS verification.
    string code;
    # The sender ID of the SMS.
    string cli?;
};

# The response contains the `cliFilter` and `interceptionTimeout` properties.
public type FlashcallinitiateverificationresponseFlashcall record {
    # Filter that should be applied for incoming calls to intercept the Flashcall.
    string cliFilter;
    # Amount of seconds client should wait for the Flashcall.
    int interceptionTimeout;
};

public type SMSRequestEventResponse record {
    # Determines whether the verification can be executed.
    string action?;
    SmsrequesteventresponseSms sms?;
};

# An optional object for flashCall verifications. It allows you to specify dial time out parameter for flashCall. FlashCallOptions object can be specified optionally, and only if the verification request was triggered from your backend (no SDK client) through an [Application signed request](/docs/voice/api-reference/authentication#application-signed-request).
public type InitiateverificationresourceFlashcalloptions record {
    # The dial timeout in seconds.
    int dialTimeout?;
};

# The type of the verification request.
public type VerificationMethod string;

# The response contains information for the client to poll for the verification result.
public type CalloutinitiateverificationresponseCallout record {
    # The amount of time in seconds after the request is sent that the polling should start.
    int startPollingAfter?;
    # The amount of time in seconds after the request is sent that polling should stop.
    int stopPollingAfter?;
    # The amount of time in seconds between each poll.
    int pollingInterval?;
};

public type FlashcallrequesteventresponseFlashcall record {
    # The phone number that will be displayed to the user when the flashcall is received on the user's phone. By default, the Sinch dashboard will randomly select the CLI that will be displayed during a flashcall from a pool of numbers. If you want to set your own CLI, you can specify it in the response to the Verification Request Event.
    string cli?;
    # The maximum time that a flashcall verification will be active and can be completed. If the phone number hasn't been verified successfully during this time, then the verification request will fail. By default, the Sinch dashboard will automatically optimize dial time out during a flashcall. If you want to set your own dial time out for the flashcall, you can specify it in the response to the Verification Request Event.
    int dialTimeout?;
};

public type FlashCallRequestEventResponse record {
    # Determines whether the verification can be executed.
    string action?;
    FlashcallrequesteventresponseFlashcall flashCall?;
};

public type FlashcallVerificationReportRequest record {
    # The type of verification.
    string method;
    # Contains information about the FlashCall verification.
    FlashcallverificationreportrequestFlashcall flashCall;
};

# The response contains the target URI.
public type DatainitiateverificationresponseSeamless record {
    # The target URI.
    string targetUri?;
};
