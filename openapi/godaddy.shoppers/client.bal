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
    # Represents API Key 'Authorization'
    string authorization;
|};

# This is a generated connector for [GoDaddy Shoppers API v1](https://developer.godaddy.com/doc/endpoint/shoppers) OpenAPI specification. The GoDaddy Shoppers API provides capability to access GoDaddy operations related to shopper.
@display {label: "GoDaddy Shopper", iconPath: "resources/godaddy.shopper.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "//api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Create a Subaccount owned by the authenticated Reseller
    #
    # + payload - The subaccount to create 
    # + return - Request was successful 
    remote isolated function createSubaccount(SubaccountCreate payload) returns ShopperId|error {
        string  path = string `/v1/shoppers/subaccount`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<Encoding> queryParamEncoding = {"includes": {style: FORM, explode: false}};
        path = path + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
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
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShopperId response = check self.clientEp->put(path, request, headers = accHeaders, targetType=ShopperId);
        return response;
    }
}
