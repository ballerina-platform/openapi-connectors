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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [GoDaddy Shoppers API v1](https://developer.godaddy.com/doc/endpoint/shoppers) OpenAPI specification. 
# The GoDaddy Shoppers API provides capability to access GoDaddy operations related to shopper.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - Provide your API Key as `Authorization`. Eg: {Authorization : sso-key [<API_KEY>]:[<API_SECRET>]} 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "//api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Create a Subaccount owned by the authenticated Reseller
    #
    # + payload - The subaccount to create 
    # + return - Request was successful 
    remote isolated function createSubaccount(SubaccountCreate payload) returns ShopperId|error {
        string  path = string `/v1/shoppers/subaccount`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShopperId response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ShopperId);
        return response;
    }
    # Get details for the specified Shopper
    #
    # + shopperId - Shopper whose details are to be retrieved 
    # + includes - Additional properties to be included in the response shopper object 
    # + return - Request was successful 
    remote isolated function get(string shopperId, string[]? includes = ()) returns Shopper|error {
        string  path = string `/v1/shoppers/${shopperId}`;
        map<anydata> queryParam = {"includes": includes};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Shopper response = check self.clientEp-> get(path, accHeaders, targetType = Shopper);
        return response;
    }
    # Update details for the specified Shopper
    #
    # + shopperId - The ID of the Shopper to update 
    # + payload - The Shopper details to update 
    # + return - Request was successful 
    remote isolated function update(string shopperId, ShopperUpdate payload) returns ShopperId|error {
        string  path = string `/v1/shoppers/${shopperId}`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShopperId response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ShopperId);
        return response;
    }
    # Request the deletion of a shopper profile
    #
    # + shopperId - The ID of the shopper to delete. Must agree with the shopper id on the token or header, if present. *Note*: **shopperId** is **not the same** as **customerId**.  **shopperId** is a number of max length 10 digits (*ex:* 1234567890) whereas **customerId** is a UUIDv4 (*ex:* 295e3bc3-b3b9-4d95-aae5-ede41a994d13) 
    # + auditClientIp - The client IP of the user who originated the request leading to this call. 
    # + return - Request was successful 
    remote isolated function delete(string shopperId, string auditClientIp) returns http:Response|error {
        string  path = string `/v1/shoppers/${shopperId}`;
        map<anydata> queryParam = {"auditClientIp": auditClientIp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get details for the specified Shopper
    #
    # + shopperId - The ID of the shopper to retrieve. Must agree with the shopper id on the token or header, if present 
    # + auditClientIp - The client IP of the user who originated the request leading to this call. 
    # + return - Request was successful 
    remote isolated function getStatus(string shopperId, string auditClientIp) returns ShopperStatus|error {
        string  path = string `/v1/shoppers/${shopperId}/status`;
        map<anydata> queryParam = {"auditClientIp": auditClientIp};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ShopperStatus response = check self.clientEp-> get(path, accHeaders, targetType = ShopperStatus);
        return response;
    }
    # Set subaccount's password
    #
    # + shopperId - Shopper whose password will be set 
    # + payload - The value to set the subaccount's password to 
    # + return - Request was successful 
    remote isolated function changePassword(string shopperId, Secret payload) returns ShopperId|error {
        string  path = string `/v1/shoppers/${shopperId}/factors/password`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShopperId response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ShopperId);
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
