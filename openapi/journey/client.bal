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

# Visit [here](https://developers.journy.io/#section/Authentication) to get information on obtaining API key
#
# + apiKeys - Provide your API Key as `X-Api-Key`. Eg: {"X-Api-Key" : "<API Key>}"
public type ApiKeysConfig record {
    map<string> apiKeys;
};
# This is a generated connector for [Journey.io API v1.0.0](https://www.journey.io/) OpenAPI specification.
# The journy.io API is organized around REST. Our API has predictable resource-oriented URLs, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Journy.io account](https://www.journey.io) and obtain the API Key following [this guide](https://developers.journy.io/#section/Authentication).
    #
    # + apiKeyConfig - Provide your API Key as `X-Api-Key`. Eg: `{"X-Api-Key" : "<API Key>}`"
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.journy.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Link web activity to user
    # 
    # + payload - Pyaload that can link web activity to user
    # + return - Object was created
    remote isolated function link(Body payload) returns CompoundLinkResponse|error {
        string  path = string `/link`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundLinkResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompoundLinkResponse);
        return response;
    }
    # Push event
    # 
    # + payload - Event for a user or an account
    # + return - Object was created
    remote isolated function trackJourneyEvent(Body1 payload) returns CompoundTrackJourneyEventResponse|error {
        string  path = string `/events`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundTrackJourneyEventResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompoundTrackJourneyEventResponse);
        return response;
    }
    # Create or update user
    # 
    # + payload - Update properties of a user
    # + return - Object was created
    remote isolated function upsertUser(Body2 payload) returns CompoundUpsertUserResponse|error {
        string  path = string `/users/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundUpsertUserResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompoundUpsertUserResponse);
        return response;
    }
    # Create or update account
    # 
    # + payload - Update properties and/or members of an account
    # + return - Object was created
    remote isolated function upsertAccount(Body3 payload) returns CompoundUpsertAccountResponse|error {
        string  path = string `/accounts/upsert`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundUpsertAccountResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompoundUpsertAccountResponse);
        return response;
    }
    # Add user to account
    # 
    # + payload - The user being added/removed from the account
    # + accountId - Unique identifier for the account in your database
    # + return - Object was created
    remote isolated function addUserToAccount(string accountId, Body4 payload) returns CompoundAddUserToAccountResponse|error {
        string  path = string `/accounts/${accountId}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundAddUserToAccountResponse response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CompoundAddUserToAccountResponse);
        return response;
    }
    # Remove user from account
    # 
    # + payload - The user being added/removed from the account
    # + accountId - Unique identifier for the account in your database
    # + return - Object was created
    remote isolated function removeUserFromAccount(string accountId, Body5 payload) returns CompoundRemoveUserFromAccountResponse|error {
        string  path = string `/accounts/${accountId}/users`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CompoundRemoveUserFromAccountResponse response = check self.clientEp->delete(path, request, headers = accHeaders, targetType=CompoundRemoveUserFromAccountResponse);
        return response;
    }
    # Validate API key
    #
    # + return - Key validation
    remote isolated function getValidity() returns CompoundGetValidityResponse|error {
        string  path = string `/validate`;
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompoundGetValidityResponse response = check self.clientEp-> get(path, accHeaders, targetType = CompoundGetValidityResponse);
        return response;
    }
    # Get snippet for a website
    #
    # + domain - The domain you want to receive a snippet for
    # + return - Snippet
    remote isolated function getTrackingSnippet(string domain) returns CompoundGetTrackingSnippetResponse|error {
        string  path = string `/tracking/snippet`;
        map<anydata> queryParam = {"domain": domain};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Api-Key": self.apiKeys["X-Api-Key"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        CompoundGetTrackingSnippetResponse response = check self.clientEp-> get(path, accHeaders, targetType = CompoundGetTrackingSnippetResponse);
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
