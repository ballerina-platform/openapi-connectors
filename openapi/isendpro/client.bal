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
import ballerina/url;
import ballerina/lang.'string;

# This is a generated connector for [iSendPro v1.1.1](https://www.isendpro.com/docs/?type=7) OpenAPI specification.
# [1] List of features:
# - sending SMS to one or more recipients,
# - HLR lookup,
# - recovery of campaign summaries,
# - directory management,
# - addition to blacklist.
# - counting of the number of characters in SMS
# 
# [2] To use this API you must:
# - Create an iSendPro account on https://isendpro.com/
# - Credit your account
#     - Note: obtaining a test credit possible under certain conditions
# - Write down your account key (keyid)
#   - It will be essential for you to use the API
#   - You can find it in the section my "account", sub-section "my API"
# - Configure IP control
#   - IP control can be configured in the my "account" section, "my API" sub-section
#   - This is a whitelist system, you need to enter the IPs used to call the API
#   - You can also completely disable IP control
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Create an [iSendPro account](https://en.isendpro.com/signup.php) and obtain tokens by following this [guide](https://www.isendpro.com/docs/?type=7#prerequis_english)
    # Operations require passing the token as a parameter.
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://apirest.isendpro.com/cgi-bin") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Returns the SMS sent over a given period
    #
    # + keyid - API key
    # + rapportCampagne - Must be "1"
    # + dateDeb - start date in format YYYY-MM-DD hh:mm
    # + dateFin - End date in format YYYY-MM-DD hh:mm
    # + return - Successful response
    remote isolated function getCampaign(string keyid, string rapportCampagne, string dateDeb, string dateFin) returns string|error {
        string  path = string `/campagne`;
        map<anydata> queryParam = {"keyid": keyid, "rapportCampagne": rapportCampagne, "date_deb": dateDeb, "date_fin": dateFin};
        path = path + check getPathForQueryParam(queryParam);
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Count the number of characters.
    #
    # + payload - Count request
    # + return - Response OK
    remote isolated function count(CountRequest payload) returns CountResponse|error {
        string  path = string `/count`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CountResponse response = check self.clientEp->post(path, request, targetType=CountResponse);
        return response;
    }
    # Get credit
    #
    # + keyid - API key
    # + credit - Type of response requested, 1 for euro, 2 for euro + quantity estimate
    # + return - Successful response
    remote isolated function getCredit(string keyid, string credit) returns CreditResponse|error {
        string  path = string `/credit`;
        map<anydata> queryParam = {"keyid": keyid, "credit": credit};
        path = path + check getPathForQueryParam(queryParam);
        CreditResponse response = check self.clientEp-> get(path, targetType = CreditResponse);
        return response;
    }
    # Add a blacklisted number
    #
    # + keyid - API key
    # + delListeNoire - Must be "1"
    # + num - Mobile number to be deleted
    # + return - Successful response
    remote isolated function removeBlacklistNumber(string keyid, string delListeNoire, string num) returns BlacklistResponse|error {
        string  path = string `/dellistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "delListeNoire": delListeNoire, "num": num};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BlacklistResponse response = check self.clientEp-> post(path, request, targetType = BlacklistResponse);
        return response;
    }
    # Return the blacklist
    #
    # + keyid - API key
    # + getListeNoire - Must be "1"
    # + return - Successful response
    remote isolated function getBlacklist(string keyid, string getListeNoire) returns string|error {
        string  path = string `/getlistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "getListeNoire": getListeNoire};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        string response = check self.clientEp-> post(path, request, targetType = string);
        return response;
    }
    # Check the validity of a number
    #
    # + payload - HLR to be looked up
    # + return - Response OK
    remote isolated function validateNumber(HLRrequest payload) returns HLRResponse|error {
        string  path = string `/hlr`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        HLRResponse response = check self.clientEp->post(path, request, targetType=HLRResponse);
        return response;
    }
    # Update directory
    #
    # + payload - Creation directory request
    # + return - Successful response
    remote isolated function updateDirectory(DirectoryUpdateRequest payload) returns Directorymodifreponse|error {
        string  path = string `/repertoire`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Directorymodifreponse response = check self.clientEp->put(path, request, targetType=Directorymodifreponse);
        return response;
    }
    # Create directory
    #
    # + payload - Creation directory
    # + return - Successful response
    remote isolated function createDirectory(Directorycreaterequest payload) returns Directorycreatereponse|error {
        string  path = string `/repertoire`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Directorycreatereponse response = check self.clientEp->post(path, request, targetType=Directorycreatereponse);
        return response;
    }
    # Add a blacklisted number.
    #
    # + keyid - API key
    # + setlisteNoire - Must be "1"
    # + num - mobile number to be blacklisted
    # + return - Successful response
    remote isolated function addBlacklistNumber(string keyid, string setlisteNoire, string num) returns BlacklistResponse|error {
        string  path = string `/setlistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "setlisteNoire": setlisteNoire, "num": num};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BlacklistResponse response = check self.clientEp-> post(path, request, targetType = BlacklistResponse);
        return response;
    }
    # add a shortlink
    #
    # + payload - add sub account request
    # + return - Response OK
    remote isolated function addShortlink(ShortlinkRequest payload) returns ShortlinkResponse|error {
        string  path = string `/shortlink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShortlinkResponse response = check self.clientEp->post(path, request, targetType=ShortlinkResponse);
        return response;
    }
    # Send a text message.
    #
    # + payload - SMS request
    # + return - Response OK
    remote isolated function sendSms(SmsUniqueRequest payload) returns SMSResponse|error {
        string  path = string `/sms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SMSResponse response = check self.clientEp->post(path, request, targetType=SMSResponse);
        return response;
    }
    # Send multiple text messages
    #
    # + payload - SMS request
    # + return - Response OK
    remote isolated function sendSmsMulti(SMSRequest payload) returns SMSResponse|error {
        string  path = string `/smsmulti`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SMSResponse response = check self.clientEp->post(path, request, targetType=SMSResponse);
        return response;
    }
    # Edit a subaccount
    #
    # + payload - Update sub account request
    # + return - Response OK
    remote isolated function updateSubAccount(SubaccountRequest payload) returns SubaccountResponse|error {
        string  path = string `/subaccount`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubaccountResponse response = check self.clientEp->put(path, request, targetType=SubaccountResponse);
        return response;
    }
    # Add a sub account
    #
    # + payload - add sub account request
    # + return - Response OK
    remote isolated function addSubAccount(SubaccountAddRequest payload) returns SubaccountAddResponse|error {
        string  path = string `/subaccount`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubaccountAddResponse response = check self.clientEp->post(path, request, targetType=SubaccountAddResponse);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
