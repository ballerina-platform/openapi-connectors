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

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Neutrino API v3.5.0](https://www.neutrinoapi.com/api/api-basics/) OpenAPI specification.
# The Neutrino API is a general-purpose API.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Neutrino API account](https://www.neutrinoapi.com/signup) and obtain tokens by following [this guide](https://www.neutrinoapi.com/api/api-basics/).
    #
    # + apiKeyConfig - Provide your API keys as `user-id` and `api-key`. Eg: `{"user-id" : "<User ID>", "api-key" : "<API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://neutrinoapi.net/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # SMS Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifySMS(Body4 payload) returns SMSVerifyResponse|error {
        string  path = string `/sms-verify`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        SMSVerifyResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SMSVerifyResponse);
        return response;
    }
    # Phone Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifyPhone(Body5 payload) returns PhoneVerifyResponse|error {
        string  path = string `/phone-verify`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        PhoneVerifyResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PhoneVerifyResponse);
        return response;
    }
    # HLR Lookup
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function lookupHLR(Body6 payload) returns HLRLookupResponse|error {
        string  path = string `/hlr-lookup`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        HLRLookupResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=HLRLookupResponse);
        return response;
    }
    # SMS Message
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function sendSMS(Body7 payload) returns SMSMessageResponse|error {
        string  path = string `/sms-message`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        SMSMessageResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SMSMessageResponse);
        return response;
    }
    # Verify Security Code
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifySecurityCode(Body8 payload) returns VerifySecurityCodeResponse|error {
        string  path = string `/verify-security-code`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        VerifySecurityCodeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=VerifySecurityCodeResponse);
        return response;
    }
    # Phone Playback
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function playbackPhone(Body9 payload) returns PhonePlaybackResponse|error {
        string  path = string `/phone-playback`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        PhonePlaybackResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PhonePlaybackResponse);
        return response;
    }
    # User Agent Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getUserAgentInfo(Body10 payload) returns UserAgentInfoResponse|error {
        string  path = string `/user-agent-info`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        UserAgentInfoResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UserAgentInfoResponse);
        return response;
    }
    # Email Validate
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function validateEmail(Body11 payload) returns EmailValidateResponse|error {
        string  path = string `/email-validate`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        EmailValidateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EmailValidateResponse);
        return response;
    }
    # Phone Validate
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function validatePhone(Body12 payload) returns PhoneValidateResponse|error {
        string  path = string `/phone-validate`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        PhoneValidateResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=PhoneValidateResponse);
        return response;
    }
    # Bad Word Filter
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function filterBadWord(Body13 payload) returns BadWordFilterResponse|error {
        string  path = string `/bad-word-filter`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        BadWordFilterResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BadWordFilterResponse);
        return response;
    }
    # Host Reputation
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function hostReputation(Body14 payload) returns HostReputationResponse|error {
        string  path = string `/host-reputation`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        HostReputationResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=HostReputationResponse);
        return response;
    }
    # IP Probe
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function probeIP(Body15 payload) returns IPProbeResponse|error {
        string  path = string `/ip-probe`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        IPProbeResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPProbeResponse);
        return response;
    }
    # Email Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifyEmail(Body16 payload) returns EmailVerifyResponse|error {
        string  path = string `/email-verify`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        EmailVerifyResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=EmailVerifyResponse);
        return response;
    }
    # IP Blocklist
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function detectIPBlocklist(Body17 payload) returns IPBlocklistResponse|error {
        string  path = string `/ip-blocklist`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        IPBlocklistResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPBlocklistResponse);
        return response;
    }
    # IP Blocklist Download
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function downloadIPBlocklist(Body18 payload) returns string|error {
        string  path = string `/ip-blocklist-download`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # IP Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getIPInfo(Body19 payload) returns IPInfoResponse|error {
        string  path = string `/ip-info`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        IPInfoResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=IPInfoResponse);
        return response;
    }
    # Geocode Reverse
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function reverseGeocode(Body20 payload) returns GeocodeReverseResponse|error {
        string  path = string `/geocode-reverse`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        GeocodeReverseResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GeocodeReverseResponse);
        return response;
    }
    # Geocode Address
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function geocodeAddress(Body21 payload) returns GeocodeAddressResponse|error {
        string  path = string `/geocode-address`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        GeocodeAddressResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GeocodeAddressResponse);
        return response;
    }
    # Currency Convert
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function convertCurrency(Body22 payload) returns ConvertResponse|error {
        string  path = string `/convert`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ConvertResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ConvertResponse);
        return response;
    }
    # BIN Lookup
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function lookupBIN(Body23 payload) returns BINLookupResponse|error {
        string  path = string `/bin-lookup`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        BINLookupResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BINLookupResponse);
        return response;
    }
    # BIN List Download
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function downloadBINList(Body24 payload) returns string|error {
        string  path = string `/bin-list-download`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # URL Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getURLInfo(Body25 payload) returns URLInfoResponse|error {
        string  path = string `/url-info`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        URLInfoResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=URLInfoResponse);
        return response;
    }
    # HTML Clean
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function cleanHTML(Body26 payload) returns string|error {
        string  path = string `/html-clean`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string response = check self.clientEp->post(path, request, headers = accHeaders, targetType=string);
        return response;
    }
    # Browser Bot
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function browserBot(Body27 payload) returns BrowserBotResponse|error {
        string  path = string `/browser-bot`;
        map<any> headerValues = {"user-id": self.apiKeys["user-id"], "api-key": self.apiKeys["api-key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        BrowserBotResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=BrowserBotResponse);
        return response;
    }
}

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
