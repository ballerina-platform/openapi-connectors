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

public type Availablenumber record {
    # The two character country code in ISO 3166-1 alpha-2 format
    Country country?;
    # An available inbound virtual number.
    string msisdn?;
    # The type of number: `landline`, `landline-toll-free` or `mobile-lvn`
    string 'type?;
    # The monthly rental cost for this number, in Euros
    string cost?;
    # The capabilities of the number: `SMS` or `VOICE` or `SMS,VOICE` or `SMS,MMS` or `VOICE,MMS` or `SMS,MMS,VOICE`
    string[] features?;
};

public type Response record {
    # The status code of the response. `200` indicates a successful request.
    string 'error\-code?;
    # The status code description
    string 'error\-code\-label?;
};

public type NumberDetailsUpdate record {
    # The two character country code in ISO 3166-1 alpha-2 format
    Country country;
    # An available inbound virtual number.
    string msisdn;
    # The Application that will handle inbound traffic to this number.
    string app_id?;
    # An URL-encoded URI to the webhook endpoint that handles inbound messages. Your webhook endpoint must be active before you make this request. Vonage makes a `GET` request to the endpoint and checks that it returns a `200 OK` response. Set this parameter's value to an empty string to remove the webhook.
    string moHttpUrl?;
    # The associated system type for your SMPP client
    string moSmppSysType?;
    # Specify whether inbound voice calls on your number are forwarded
    # to a SIP or a telephone number.  This must be used with the
    # `voiceCallbackValue` parameter. If set, `sip` or `tel` are
    # prioritized over the Voice capability in your Application.
    # 
    # *Note: The `app` value is deprecated and will be removed in future.*
    string voiceCallbackType?;
    # A SIP URI or telephone number. Must be used with the `voiceCallbackType` parameter.
    string voiceCallbackValue?;
    # A webhook URI for Vonage to send a request to when a call ends
    string voiceStatusCallback?;
    # <strong>DEPRECATED</strong> - We recommend that you use `app_id` instead.
    # 
    # Specifies the Messages webhook type (always `app`) associated with this
    # number and must be used with the `messagesCallbackValue` parameter.
    string messagesCallbackType?;
    # <strong>DEPRECATED</strong> - We recommend that you use `app_id` instead.
    # 
    # Specifies the Application ID of your Messages application.
    # It must be used with the `messagesCallbackType` parameter.
    string messagesCallbackValue?;
};

public type Ownednumber record {
    # The two character country code in ISO 3166-1 alpha-2 format
    Country country?;
    # An available inbound virtual number.
    string msisdn?;
    # The URL of the webhook endpoint that handles inbound messages
    string moHttpUrl?;
    # The type of number: `landline`, `landline-toll-free` or `mobile-lvn`
    string 'type?;
    # The capabilities of the number: `SMS` or `VOICE` or `SMS,VOICE` or `SMS,MMS` or `VOICE,MMS` or `SMS,MMS,VOICE`
    string[] features?;
    # The messages webhook type: always `app`
    string messagesCallbackType?;
    # An Application ID
    string messagesCallbackValue?;
    # The voice webhook type: `sip`, `tel`, or `app`
    string voiceCallbackType?;
    # A SIP URI, telephone number or Application ID
    string voiceCallbackValue?;
};

public type NumberDetails record {
    # The two character country code in ISO 3166-1 alpha-2 format
    Country country;
    # An available inbound virtual number.
    string msisdn;
    # If you’d like to perform an action on a subaccount, provide the `api_key` of that account here. If you’d like to perform an action on your own account, you do not need to provide this field.
    string target_api_key?;
};

# The two character country code in ISO 3166-1 alpha-2 format
public type Country string;

public type Unauthorized record {
    # The status code of the response. `200` indicates a successful request.
    string 'error\-code?;
    # The status code description
    string 'error\-code\-label?;
};

public type Response420 record {
    # The status code of the response. `200` indicates a successful request.
    string 'error\-code?;
    # More detail about what happened. For example you may need to request the number via the dashboard, or you may already own this number.
    string 'error\-code\-label?;
};

public type AvailableNumbers record {
    # The total amount of numbers available in the pool.
    int count?;
    # A paginated array of available numbers and their details.
    Availablenumber[] numbers?;
};

public type InboundNumbers record {
    # The total amount of numbers owned by the account
    int count?;
    # A paginated array of numbers and their details
    Ownednumber[] numbers?;
};

public type AccountUnauthorized record {
    # The status code of the response. `200` indicates a successful request.
    string 'error\-code?;
    # The status code description
    string 'error\-code\-label?;
};
