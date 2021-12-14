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
@display {label: "iSendPro", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials.
    # Create an [iSendPro account](https://en.isendpro.com/signup.php) and obtain tokens by following this [guide](https://www.isendpro.com/docs/?type=7#prerequis_english)
    # Operations require passing the token as a parameter.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://apirest.isendpro.com/cgi-bin") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns the SMS sent over a given period
    #
    # + keyid - API key 
    # + rapportCampagne - Must be "1" 
    # + dateDeb - start date in format YYYY-MM-DD hh:mm 
    # + dateFin - End date in format YYYY-MM-DD hh:mm 
    # + return - Successful response 
    remote isolated function getCampaign(string keyid, string rapportCampagne, string dateDeb, string dateFin) returns string|error {
        string resourcePath = string `/campagne`;
        map<anydata> queryParam = {"keyid": keyid, "rapportCampagne": rapportCampagne, "date_deb": dateDeb, "date_fin": dateFin};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Count the number of characters.
    #
    # + payload - Count request 
    # + return - Response OK 
    remote isolated function count(CountRequest payload) returns CountResponse|error {
        string resourcePath = string `/count`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CountResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get credit
    #
    # + keyid - API key 
    # + credit - Type of response requested, 1 for euro, 2 for euro + quantity estimate 
    # + return - Successful response 
    remote isolated function getCredit(string keyid, string credit) returns CreditResponse|error {
        string resourcePath = string `/credit`;
        map<anydata> queryParam = {"keyid": keyid, "credit": credit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CreditResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add a blacklisted number
    #
    # + keyid - API key 
    # + delListeNoire - Must be "1" 
    # + num - Mobile number to be deleted 
    # + return - Successful response 
    remote isolated function removeBlacklistNumber(string keyid, string delListeNoire, string num) returns BlacklistResponse|error {
        string resourcePath = string `/dellistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "delListeNoire": delListeNoire, "num": num};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BlacklistResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Return the blacklist
    #
    # + keyid - API key 
    # + getListeNoire - Must be "1" 
    # + return - Successful response 
    remote isolated function getBlacklist(string keyid, string getListeNoire) returns string|error {
        string resourcePath = string `/getlistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "getListeNoire": getListeNoire};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        string response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Check the validity of a number
    #
    # + payload - HLR to be looked up 
    # + return - Response OK 
    remote isolated function validateNumber(HLRrequest payload) returns HLRResponse|error {
        string resourcePath = string `/hlr`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        HLRResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update directory
    #
    # + payload - Creation directory request 
    # + return - Successful response 
    remote isolated function updateDirectory(DirectoryUpdateRequest payload) returns Directorymodifreponse|error {
        string resourcePath = string `/repertoire`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Directorymodifreponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create directory
    #
    # + payload - Creation directory 
    # + return - Successful response 
    remote isolated function createDirectory(Directorycreaterequest payload) returns Directorycreatereponse|error {
        string resourcePath = string `/repertoire`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Directorycreatereponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Add a blacklisted number.
    #
    # + keyid - API key 
    # + setlisteNoire - Must be "1" 
    # + num - mobile number to be blacklisted 
    # + return - Successful response 
    remote isolated function addBlacklistNumber(string keyid, string setlisteNoire, string num) returns BlacklistResponse|error {
        string resourcePath = string `/setlistenoire`;
        map<anydata> queryParam = {"keyid": keyid, "setlisteNoire": setlisteNoire, "num": num};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        BlacklistResponse response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # add a shortlink
    #
    # + payload - add sub account request 
    # + return - Response OK 
    remote isolated function addShortlink(ShortlinkRequest payload) returns ShortlinkResponse|error {
        string resourcePath = string `/shortlink`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ShortlinkResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Send a text message.
    #
    # + payload - SMS request 
    # + return - Response OK 
    remote isolated function sendSms(SmsUniqueRequest payload) returns SMSResponse|error {
        string resourcePath = string `/sms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SMSResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Send multiple text messages
    #
    # + payload - SMS request 
    # + return - Response OK 
    remote isolated function sendSmsMulti(SMSRequest payload) returns SMSResponse|error {
        string resourcePath = string `/smsmulti`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SMSResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Edit a subaccount
    #
    # + payload - Update sub account request 
    # + return - Response OK 
    remote isolated function updateSubAccount(SubaccountRequest payload) returns SubaccountResponse|error {
        string resourcePath = string `/subaccount`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubaccountResponse response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Add a sub account
    #
    # + payload - add sub account request 
    # + return - Response OK 
    remote isolated function addSubAccount(SubaccountAddRequest payload) returns SubaccountAddResponse|error {
        string resourcePath = string `/subaccount`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubaccountAddResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
