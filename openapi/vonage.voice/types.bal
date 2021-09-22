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

# Connect to a Phone (PSTN) number
public type EndpointPhoneFrom record {
    # The type of connection. Must be `phone`
    string 'type;
    # The phone number to connect to
    AddressE164 number;
};

public type UpdateCallRequestUnearmuff record {
    # Allow the specified UUID to hear audio
    UpdateCallRequestUnearmuffAction action?;
};

public type StopTalkResponse record {
    # Description of the action taken
    string message?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
};

public type StopStreamResponse record {
    # Description of the action taken
    string message?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
};

# A list of call objects. See the [get details of a specific call](#getCall) response fields for a description of the nested objects
public type GetcallsresponseEmbedded record {
    # Array of Get Call Response
    GetCallResponse[] calls?;
};

# The unique identifier for the conversation this call leg is part of.
#
public type ConversationUuid string;

public type UpdateCallRequestTransferAnswerUrl record {
    # Transfer the call to a new NCCO
    RequestTransferActionParam action;
    UpdatecallrequesttransferanswerurlDestination destination;
};

# <strong>DEPRECATED</strong> The voice & language to use
#
public type VoiceName string;

public type StartStreamRequest record {
    string[] stream_url;
    # the number of times to play the file, 0 for infinite
    int loop?;
    # Set the audio level of the stream in the range `-1 >= level <= 1` with a precision of 0.1. The default value is 0.
    string level?;
};

public type DTMFResponse record {
    # Description of the action taken
    string message?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
};

# The Mobile Country Code Mobile Network Code ([MCCMNC](https://en.wikipedia.org/wiki/Mobile_country_code)) for the carrier network used to make this call.
#
public type Network string;

# Connect to an App User
public type EndpointApp record {
    # The type of connection. Must be `app`
    string 'type;
    # The username to connect to
    string user;
};

# The single or mixed collection of endpoint types you connected to
public type To record {
    # The Type of Endpoint Called
    string 'type?;
    # The number of the endpoint called
    string number?;
};

# Websocket URI
#
public type AddressWebsocket string;

public type GetcallresponseLinksSelf record {
    string href?;
};

# The status of the call. [See possible values](https://developer.nexmo.com/voice/voice-api/guides/call-flow#event-objects)
#
public type Status string;

public type DTMFRequest record {
    # The digits to send
    string digits?;
};

public type UpdatecallrequesttransferanswerurlDestination record {
    # Always `ncco`
    string 'type;
    # The URL that Vonage makes a request to. Must return an NCCO.
    string[] url;
};

# The price per minute for this call. This is only sent if `status` is `completed`.
#
public type Rate string;

# The SIP URI to connect to
#
public type AddressSip string;

public type GetcallsresponseLinks record {
    GetcallsresponseLinksSelf self?;
};

# The time the call started in the following format: `YYYY-MM-DD HH:MM:SS`. For example, `2020-01-01 12:00:00`. This is only sent if `status` is `completed`.
#
public type StartTime string;

# The time elapsed for the call to take place in seconds. This is only sent if `status` is `completed`.
#
public type Duration string;

# The total price charged for this call. This is only sent if `status` is `completed`.
#
public type Price string;

public type CreateCallRequestBase record {
    EndpointPhoneTo[]|EndpointSip|EndpointWebsocket|EndpointVBCExtension[] to;
    # Connect to a Phone (PSTN) number
    EndpointPhoneFrom 'from;
    # **Required** unless `event_url` is configured at the application
    string[] event_url?;
    # The HTTP method used to send event information to `event_url`.
    CreateCallRequestBaseEventMethod event_method?;
    # Configure the behavior when Vonage detects that the call is answered by voicemail. If `continue`, Vonage sends an HTTP request to `event_url` with the Call event machine. If `hangup`, Vonage ends the call.
    CreateCallRequestBaseMachineDetection machine_detection?;
    # Set the number of seconds that elapse before Vonage hangs up after the call state changes to answered.
    int length_timer?;
    # Set the number of seconds that elapse before Vonage hangs up after the call state changes to ‘ringing’.
    int ringing_timer?;
};

# Connect to a Websocket
public type EndpointWebsocket record {
    # The type of connection. Must be `websocket`
    string 'type;
    # Websocket URI
    AddressWebsocket uri?;
    # Content Type
    EndpointWebsocketContentType 'content\-type;
    # Details of the Websocket you want to connect to
    EndpointwebsocketHeaders headers?;
};

public type CreateCallResponse record {
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
    # The status of the call. [See possible values](https://developer.nexmo.com/voice/voice-api/guides/call-flow#event-objects)
    Status status?;
    # Possible values are `outbound` or `inbound`
    Direction direction?;
    # The unique identifier for the conversation this call leg is part of.
    ConversationUuid conversation_uuid?;
};

# The time the call started in the following format: `YYYY-MM-DD HH:MM:SS`. For xample, `2020-01-01 12:00:00`. This is only sent if `status` is `completed`.
#
public type EndTime string;

public type NCCO record {
    # Action
    string action?;
    # Text
    string text?;
};

public type GetCallsResponse record {
    int count?;
    int page_size?;
    int record_index?;
    GetcallsresponseLinks _links?;
    # A list of call objects. See the [get details of a specific call](#getCall) response fields for a description of the nested objects
    GetcallsresponseEmbedded _embedded?;
};

public type UpdateCallRequestHangup record {
    # End the call for the specified UUID
    UpdateCallRequestHangupAction action?;
};

# Connect to a VBC extension
public type EndpointVBCExtension record {
    # The type of connection. Must be `vbc`
    string 'type;
    # Extension
    string extension;
};

public type UpdatecallrequesttransfernccoDestination record {
    # Always `ncco`
    string 'type;
    # Refer to the [NCCO Guide](https://developer.nexmo.com/voice/voice-api/ncco-reference) for a description of possible NCCO parameters.
    record {}[] ncco;
};

public type GetcallresponseLinks record {
    GetcallresponseLinksSelf self?;
};

public type GetcallsresponseLinksSelf record {
    string href?;
};

# Possible values are `outbound` or `inbound`
#
public type Direction string;

# Connect to a SIP Endpoint
public type EndpointSip record {
    # The type of connection. Must be `sip`
    string 'type;
    # The SIP URI to connect to
    AddressSip uri?;
};

# The phone number to connect to
#
public type AddressE164 string;

# The language to use
#
public type Language string;

public type CreateCallRequestNcco record {
    # With NCCO
    NCCO[] ncco;
    *CreateCallRequestBase;
};

public type CreateCallRequestAnswerUrl record {
    # With Answer URL
    string[] answer_url;
    *CreateCallRequestBase;
};

# The vocal style (vocal range, tessitura, and timbre) to use
#
public type Style int;

public type StartTalkRequest record {
    # The text to read
    string text;
    # The language to use
    Language language?;
    # The vocal style (vocal range, tessitura, and timbre) to use
    Style style?;
    # <strong>DEPRECATED</strong> The voice & language to use
    VoiceName voice_name?;
    # The number of times to repeat the text the file, 0 for infinite
    int loop?;
    # The volume level that the speech is played. This can be any value between `-1` to `1` in `0.1` increments, with `0` being the default.
    string level?;
};

public type  Body CreateCallRequestNcco|CreateCallRequestAnswerUrl;

public type GetCallResponse record {
    GetcallresponseLinks _links?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
    # The unique identifier for the conversation this call leg is part of.
    ConversationUuid conversation_uuid?;
    # The single or mixed collection of endpoint types you connected to
    To to?;
    # The endpoint you called from. Possible values are the same as `to`.
    From 'from?;
    # The status of the call. [See possible values](https://developer.nexmo.com/voice/voice-api/guides/call-flow#event-objects)
    Status status?;
    # Possible values are `outbound` or `inbound`
    Direction direction?;
    # The price per minute for this call. This is only sent if `status` is `completed`.
    Rate rate?;
    # The total price charged for this call. This is only sent if `status` is `completed`.
    Price price?;
    # The time elapsed for the call to take place in seconds. This is only sent if `status` is `completed`.
    Duration duration?;
    # The time the call started in the following format: `YYYY-MM-DD HH:MM:SS`. For example, `2020-01-01 12:00:00`. This is only sent if `status` is `completed`.
    StartTime start_time?;
    # The time the call started in the following format: `YYYY-MM-DD HH:MM:SS`. For xample, `2020-01-01 12:00:00`. This is only sent if `status` is `completed`.
    EndTime end_time?;
    # The Mobile Country Code Mobile Network Code ([MCCMNC](https://en.wikipedia.org/wiki/Mobile_country_code)) for the carrier network used to make this call.
    Network network?;
};

# Connect to a Phone (PSTN) number
public type EndpointPhoneTo record {
    # The type of connection. Must be `phone`
    string 'type;
    # The phone number to connect to
    AddressE164 number;
    # Provide [DTMF digits](https://developer.nexmo.com/voice/voice-api/guides/dtmf) to send when the call is answered
    string dtmfAnswer?;
};

public type UpdateCallRequestEarmuff record {
    # Prevent the specified UUID from hearing audio
    UpdateCallRequestEarmuffAction action?;
};

public type StartTalkResponse record {
    # Description of the action taken
    string message?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
};

# The endpoint you called from. Possible values are the same as `to`.
public type From record {
    # The type of Endpoint that made the call
    string 'type?;
    # The number that made the call
    string number?;
};

# Transfer the call to a new NCCO
#
public type RequestTransferActionParam string;

public type UpdateCallRequestMute record {
    # Mute the specified UUID
    UpdateCallRequestMuteAction action?;
};

# The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
#
public type Uuid string;

public type UpdateCallRequestUnmute record {
    # Unmute the specified UUID
    UpdateCallRequestUnmuteAction action?;
};

public type  Body1 UpdateCallRequestTransferNcco|UpdateCallRequestTransferAnswerUrl|UpdateCallRequestHangup|UpdateCallRequestMute|UpdateCallRequestUnmute|UpdateCallRequestEarmuff|UpdateCallRequestUnearmuff;

# Details of the Websocket you want to connect to
public type EndpointwebsocketHeaders record {
    # This is an example header. You can provide any headers you may need
    string customer_id?;
};

public type UpdateCallRequestTransferNcco record {
    # Transfer the call to a new NCCO
    RequestTransferActionParam action;
    UpdatecallrequesttransfernccoDestination destination;
};

public type StartStreamResponse record {
    # Description of the action taken
    string message?;
    # The unique identifier for this call leg. The UUID is created when your call request is accepted by Vonage. You use the UUID in all requests for individual live calls
    Uuid uuid?;
};

public enum GetCallsStatus {
    GETCALLSSTATUS_STARTED = "started",
    GETCALLSSTATUS_RINGING = "ringing",
    GETCALLSSTATUS_ANSWERED = "answered",
    GETCALLSSTATUS_MACHINE = "machine",
    GETCALLSSTATUS_COMPLETED = "completed",
    GETCALLSSTATUS_BUSY = "busy",
    GETCALLSSTATUS_CANCELLED = "cancelled",
    GETCALLSSTATUS_FAILED = "failed",
    GETCALLSSTATUS_REJECTED = "rejected",
    GETCALLSSTATUS_TIMEOUT = "timeout",
    GETCALLSSTATUS_UNANSWERED = "unanswered"
}

public enum GetCallsOrder {
    GETCALLSORDER_ASC = "asc",
    GETCALLSORDER_DESC = "desc"
}

public enum UpdateCallRequestUnearmuffAction {
    UPDATECALLREQUESTUNEARMUFFACTION_UNEARMUFF = "unearmuff"
}

public enum CreateCallRequestBaseEventMethod {
    CREATECALLREQUESTBASEEVENTMETHOD_POST = "POST",
    CREATECALLREQUESTBASEEVENTMETHOD_GET = "GET"
}

public enum CreateCallRequestBaseMachineDetection {
    CREATECALLREQUESTBASEMACHINEDETECTION_CONTINUE = "continue",
    CREATECALLREQUESTBASEMACHINEDETECTION_HANGUP = "hangup"
}

public enum EndpointWebsocketContentType {
    ENDPOINTWEBSOCKETCONTENTTYPE_AUDIOL16RATE8000 = "audio/l16;rate=8000",
    ENDPOINTWEBSOCKETCONTENTTYPE_AUDIOL16RATE16000 = "audio/l16;rate=16000"
}

public enum UpdateCallRequestHangupAction {
    UPDATECALLREQUESTHANGUPACTION_HANGUP = "hangup"
}

public enum UpdateCallRequestEarmuffAction {
    UPDATECALLREQUESTEARMUFFACTION_EARMUFF = "earmuff"
}

public enum UpdateCallRequestMuteAction {
    UPDATECALLREQUESTMUTEACTION_MUTE = "mute"
}

public enum UpdateCallRequestUnmuteAction {
    UPDATECALLREQUESTUNMUTEACTION_MUTE = "mute"
}
