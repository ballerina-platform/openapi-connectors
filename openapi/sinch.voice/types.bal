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

# Mute conference participant payload
public type MuteUnmuteConferenceParticipantRequest record {
};

# The type of device and number or endpoint to call.
public type Destination record {
    # Can be of `number` for PSTN endpoints or of `username` for data endpoints.
    string 'type;
    # If the type is `number` the value of the endpoint is a phone number. If the type is `username` the value is the username for a data endpoint.
    string endpoint;
};

# The text-to-speech callout calls a phone number and plays a synthesized text messages or pre-recorded sound files.
public type TtsCalloutRequest record {
    # The number that will be displayed as caller, must be in [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537) format.
    string cli?;
    # The type of device and number or endpoint to call.
    Destination destination;
    # When the destination picks up, this DTMF tones will be played to the callee. Valid characters in the string are "0"-"9", "#", and "w". A "w" will render a 500 ms pause. For example, "ww1234#w#" will render a 1s pause, the DTMF tones "1", "2", "3", "4" and "#" followed by a 0.5s pause and finally the DTMF tone for "#". This can be used if the callout destination for instance require a conference PIN code or an extension to be entered.
    string dtmf?;
    # Can be either `pstn` for PSTN endpoint or `mxp` for data (app or web) clients.
    string domain?;
    # Can be used to input custom data.
    string custom?;
    # Language of the prompts as defined in [ISO 639](locales.md) for supported languages
    string locale?;
    # The text that will be spoken in the text-to-speech message. Every application's default maximum characters allowed in text-to-speech is 600 characters. Contact support if you wish this limit to be changed.
    string text?;
    # An advanced alternative to using text. You can then supply a , -separated list of prompts. Either prompt can be the name of a pre-recorded file or a text-to-speech string specified as â€œ#tts[my text]. To upload and use pre-recorded files, you need to contact Sinch for support. Every application's default maximum characters allowed per 'prompts'-command text-to-speech is 600 characters. Contact support if you wish this limit to be changed.
    string prompts?;
    # If enableAce is set to true and the application has a callback URL specified, you will receive an ACE callback when the call is answered. When the callback is received, your platform must respond with a svamlet, containing the connectcon action in order to add the call to a conference or create the conference if itâ€™s the first call. If it's set to false, no ACE event will be sent to your backend.
    boolean enableAce?;
    # If enableDice is set to true and the application has a callback URL specified, you will receive a DiCE callback when the call is disconnected. If it's set to false, no DiCE event will be sent to your backend.
    boolean enableDice?;
};

# The custom callout, the server initiates a call from the servers that can be controlled by specifying how the call should progress at each call event.
public type CustomCalloutRequest record {
    # The number that will be displayed as caller, must be in [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537) format.
    string cli?;
    # The type of device and number or endpoint to call.
    Destination destination?;
    # When the destination picks up, this DTMF tones will be played to the callee. Valid characters in the string are "0"-"9", "#", and "w". A "w" will render a 500 ms pause. For example, "ww1234#w#" will render a 1s pause, the DTMF tones "1", "2", "3", "4" and "#" followed by a 0.5s pause and finally the DTMF tone for "#". This can be used if the callout destination for instance require a conference PIN code or an extension to be entered.
    string dtmf?;
    # The maximum amount of time in seconds that the call will last.
    int maxDuration?;
    # Incoming Call Event (ICE) is when a call is placed / made.
    string ice?;
    # Answered Call Event (ACE) is when a call is answered.
    string ace?;
    # Input Event Callback (PIE) triggered from either a user pressing a number of DTMF digits, or by the “return” command.
    string pie?;
    # Disconnected Call Event (DiCE) is when a call is disconnected.
    string dice?;
};

public type GetnumbersresponseobjNumbers record {
    # Numbers that you own in E.164 format.
    string number?;
    # Indicates the application where the number(s) will be assigned. If no number is assigned the applicationkey will not be returned.
    string applicationkey?;
    # indicates the DID capability that needs to be assigned to the chosen application. Valid values are 'voice' and 'sms'. Please note that the DID needs to support the selected capability.
    string capability?;
};

public type SvamlrequestbodyInstructions record {
    # Instructions allow an application to play a message or file, start recording, and various other tasks. For more information about instructions, see the [SVAML](/docs/voice/api-reference/svaml/) documentation.
    record {} instruction?;
};

# The conference callout calls a phone number or a user. When the call is answered, it's connected to a conference room.
public type ConferenceCalloutRequest record {
    # The number that will be displayed as caller, must be in [E.164](https://community.sinch.com/t5/Glossary/E-164/ta-p/7537) format.
    string cli?;
    # The type of device and number or endpoint to call.
    Destination destination;
    # The conferenceId of the conference to which you want the callee to join. If the conferenceId doesn't exist a conference room will be created.
    string conferenceId;
    # When the destination picks up, this DTMF tones will be played to the callee. Valid characters in the string are "0"-"9", "#" and "w". A "w" will render a 500 ms pause. Example: "ww1234#w#" will render a 1s pause, the DTMF tones "1", "2", "3", "4" and "#" followed by a 0.5s pause and finally the DTMF tone for "#". This can be used if the callout destination for instance require a conference PIN code or an extension to be entered.
    string dtmf?;
    # Maximum duration.
    string maxDuration?;
    # If `enableAce` is set to true and the application has a callback URL specified, you will receive an ACE callback when the call is answered. When the callback is received, your platform must respond with a svamlet, containing the connectcon action in order to add the call to a conference or create the conference if itâ€™s the first call. If it's set to false, no ACE event will be sent to your backend.
    boolean enableAce?;
    # If enableDice is set to true and the application has a callback URL specified, you will receive a DiCE callback when the call is disconnected. If it's set to false, no DiCE event will be sent to your backend.
    boolean enableDice?;
    # If enablePie is set to true and the application has a callback URL specified, you will receive a PIE callback after a runMenu action, with the information of the action that the user took. If it's set to false, no PIE event will be sent to your backend.
    boolean enablePie?;
    # Language of the prompts as defined in [ISO 639](locales.md) for supported languages.
    string locale?;
    # The text that will be spoken as a greeting.
    string greeting?;
    # Means "music-on-hold." It's an optional parameter that specifies what the first participant should listen to while they're alone in the conference, waiting for other participants to join. It can take one of these pre-defined values:<ul><li>`ring` (progress tone)</li><li>`music1` (music file)</li><li>`music2` (music file)</li><li>`music3` (music file)</li></ul></br>If no music-on-hold is specified, the user will only hear silence.
    string mohClass?;
    # Used to input custom data.
    string custom?;
    # can be either pstn for PSTN endpoint or mxp for data (app or web) clients.
    string domain?;
};

# Information about the participants in the conference.
public type GetConferenceInfoResponse record {
    # Array containing information about the participants in the conference.
    GetconferenceinforesponseParticipants[] participants?;
};

public type GetCallResponseObj record {
    # Contains the caller information.
    string 'from?;
    # Contains the callee information.
    string to?;
    # Can be either `pstn` for PSTN endpoint or `mxp` for data (app or web) clients.
    string domain?;
    # The unique identifier of the call.
    string callid?;
    # The duration of the call in seconds.
    int duration?;
    # The status of the call. Either `ONGOING` or `FINAL`
    string status?;
    # Contains the result of a call.
    string result?;
    # Contains the reason why a call ended.
    string reason?;
    # The date and time of the call.
    string timestamp?;
    record {} custom?;
    string userRate?;
    string debit?;
};

public type Error record {
    # A summary of the HTTP error code and error type.
    string status?;
    # The HTTP error code.
    string errorCode?;
    # A simple description of the cause of the error.
    string message?;
    # If applicable, a reference ID for support to use with diagnosing the error.
    string reference?;
};

public type GetRecordingFileInfo record {
    string 'key?;
    string url?;
    string createdOn?;
    string expiresOn?;
    record {} headers?;
};

public type GetQueryNumber record {
    # The ISO 3166-1 formatted country code.
    string countryId?;
    # The type of the number.
    string numberType?;
    # The number in E.164 format.
    string normalizedNumber?;
    # Concerns whether the call is restricted or not.
    boolean restricted?;
    # The cost per minute to call the destination number.
    GetquerynumberRate rate?;
};

# The returned call ID.
public type GetCalloutResponseObj record {
    # The returned call identifier.
    string callid?;
};

public type UpdateCallbacks record {
    # Contains primary and or fallback callback URLs
    UpdatecallbacksUrl[] url?;
};

public type GetcallbacksUrl record {
    # Your primary callback URL
    string primary?;
    # Your fallback callback URL (returned if configured). It is used only if Sinch platform gets a timeout or error from your primary callback URL.
    string fallback?;
};

# SVAML is a call control markup language. When a server receives a callback event from the Sinch platform, it can respond with a SVAML object to control the voice call. The following is an example of a SVAML object type and its contents.
public type SVAMLRequestBody record {
    # The collection of instructions that can perform various tasks during the call. You can include as many instructions as necessary.
    SvamlrequestbodyInstructions[] instructions?;
    # The action that will control the call. Each SVAML object can only include one action.
    record {} action?;
};

# Currently three types of callouts are supported: conference callouts, text-to-speech callouts and custom callouts. The custom callout is the most flexible, but text-to-speech and conferece callouts are more convenient.
public type CalloutRequest record {
    # Sets the type of callout.
    string method;
    # The conference callout calls a phone number or a user. When the call is answered, it's connected to a conference room.
    ConferenceCalloutRequest conferenceCallout?;
    # The text-to-speech callout calls a phone number and plays a synthesized text messages or pre-recorded sound files.
    TtsCalloutRequest ttsCallout?;
    # The custom callout, the server initiates a call from the servers that can be controlled by specifying how the call should progress at each call event.
    CustomCalloutRequest customCallout?;
};

public type GetconferenceinforesponseParticipants record {
    # The phone number of the PSTN participant that was connected in the conference, or whatever was passed as CLI for data originated/terminated calls.
    string cli?;
    # The callId of the call leg that the participant joined the conference.
    string id?;
    # The number of seconds that the participant has been connected to the conference.
    int duration?;
    boolean muted?;
};

public type UpdatecallbacksUrl record {
    # Your primary callback URL
    string primary?;
    # Your fallback callback URL
    string fallback?;
};

# The cost per minute to call the destination number.
public type GetquerynumberRate record {
    # The currency in which the call is charged.
    string currencyId?;
    # The amount.
    decimal amount?;
};

public type UpdateNumbers record {
    # The phone number or list of numbers in E.164 format.
    string[] numbers?;
    # indicates the application where the number(s) will be assigned. If empty, the application key that is used to sign the request will be used.
    string applicationkey?;
    # indicates the DID capability that needs to be assigned to the chosen application. Valid values are 'voice' and 'sms'. Please note that the DID needs to support the selected capability.
    string capability?;
};

public type UnassignNumbers record {
    # The phone number in E.164 format (https://en.wikipedia.org/wiki/E.164)
    string number?;
    # Indicates the application where the number(s) was assigned. dIf empty, the application key that is used to sign the request will be used.
    string applicationkey?;
    # (optional) indicates the DID capability that was assigned to the chosen application. Please note that the DID needs to support the selected capability.
    string capability?;
};

public type GetCallbacks record {
    # Gets primary and if configured fallback callback URLs
    GetcallbacksUrl[] url?;
};

public type GetNumbersResponseObj record {
    # The object type. Will always be list of numbers, associated applicationkeys and capabilities
    GetnumbersresponseobjNumbers[] numbers?;
};
