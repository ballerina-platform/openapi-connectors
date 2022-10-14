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

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `user-id`
    string userId;
    # Represent API Key `api-key`
    string apiKey;
|};

# This is a generated connector for [Neutrino API v3.5.0](https://www.neutrinoapi.com/api/api-basics/) OpenAPI specification.
# The Neutrino API is a general-purpose API.
@display {label: "Neutrino", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Neutrino API account](https://www.neutrinoapi.com/signup) and obtain tokens by following [this guide](https://www.neutrinoapi.com/api/api-basics/).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://neutrinoapi.net/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # SMS Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifySMS(SmsverifyBody payload) returns SMSVerifyResponse|error {
        string resourcePath = string `/sms-verify`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SMSVerifyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Phone Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifyPhone(PhoneverifyBody payload) returns PhoneVerifyResponse|error {
        string resourcePath = string `/phone-verify`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PhoneVerifyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # HLR Lookup
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function lookupHLR(HlrlookupBody payload) returns HLRLookupResponse|error {
        string resourcePath = string `/hlr-lookup`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        HLRLookupResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # SMS Message
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function sendSMS(SmsmessageBody payload) returns SMSMessageResponse|error {
        string resourcePath = string `/sms-message`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        SMSMessageResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Verify Security Code
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifySecurityCode(VerifysecuritycodeBody payload) returns VerifySecurityCodeResponse|error {
        string resourcePath = string `/verify-security-code`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        VerifySecurityCodeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Phone Playback
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function playbackPhone(PhoneplaybackBody payload) returns PhonePlaybackResponse|error {
        string resourcePath = string `/phone-playback`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PhonePlaybackResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # User Agent Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getUserAgentInfo(UseragentinfoBody payload) returns UserAgentInfoResponse|error {
        string resourcePath = string `/user-agent-info`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        UserAgentInfoResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Email Validate
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function validateEmail(EmailvalidateBody payload) returns EmailValidateResponse|error {
        string resourcePath = string `/email-validate`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        EmailValidateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Phone Validate
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function validatePhone(PhonevalidateBody payload) returns PhoneValidateResponse|error {
        string resourcePath = string `/phone-validate`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        PhoneValidateResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Bad Word Filter
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function filterBadWord(BadwordfilterBody payload) returns BadWordFilterResponse|error {
        string resourcePath = string `/bad-word-filter`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        BadWordFilterResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Host Reputation
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function hostReputation(HostreputationBody payload) returns HostReputationResponse|error {
        string resourcePath = string `/host-reputation`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        HostReputationResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # IP Probe
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function probeIP(IpprobeBody payload) returns IPProbeResponse|error {
        string resourcePath = string `/ip-probe`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        IPProbeResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Email Verify
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function verifyEmail(EmailverifyBody payload) returns EmailVerifyResponse|error {
        string resourcePath = string `/email-verify`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        EmailVerifyResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # IP Blocklist
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function detectIPBlocklist(IpblocklistBody payload) returns IPBlocklistResponse|error {
        string resourcePath = string `/ip-blocklist`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        IPBlocklistResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # IP Blocklist Download
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function downloadIPBlocklist(IpblocklistdownloadBody payload) returns string|error {
        string resourcePath = string `/ip-blocklist-download`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # IP Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getIPInfo(IpinfoBody payload) returns IPInfoResponse|error {
        string resourcePath = string `/ip-info`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        IPInfoResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Geocode Reverse
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function reverseGeocode(GeocodereverseBody payload) returns GeocodeReverseResponse|error {
        string resourcePath = string `/geocode-reverse`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        GeocodeReverseResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Geocode Address
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function geocodeAddress(GeocodeaddressBody payload) returns GeocodeAddressResponse|error {
        string resourcePath = string `/geocode-address`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        GeocodeAddressResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Currency Convert
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function convertCurrency(ConvertBody payload) returns ConvertResponse|error {
        string resourcePath = string `/convert`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        ConvertResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # BIN Lookup
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function lookupBIN(BinlookupBody payload) returns BINLookupResponse|error {
        string resourcePath = string `/bin-lookup`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        BINLookupResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # BIN List Download
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function downloadBINList(BinlistdownloadBody payload) returns string|error {
        string resourcePath = string `/bin-list-download`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # URL Info
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function getURLInfo(UrlinfoBody payload) returns URLInfoResponse|error {
        string resourcePath = string `/url-info`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        URLInfoResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # HTML Clean
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function cleanHTML(HtmlcleanBody payload) returns string|error {
        string resourcePath = string `/html-clean`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        string response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Browser Bot
    #
    # + payload - Request payload 
    # + return - Response status 
    remote isolated function browserBot(BrowserbotBody payload) returns BrowserBotResponse|error {
        string resourcePath = string `/browser-bot`;
        map<any> headerValues = {"user-id": self.apiKeyConfig.userId, "api-key": self.apiKeyConfig.apiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        BrowserBotResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
