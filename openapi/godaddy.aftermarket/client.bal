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

# This is a generated connector for [GoDaddy Aftermarket API v1](https://developer.godaddy.com/doc/endpoint/aftermarket) OpenAPI specification. The GoDaddy Aftermarket API provides capability to access GoDaddy operations related to GoDaddy Auctions.
@display {label: "GoDaddy Aftermarket", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Create a [GoDaddy Shoppers](https://sg.godaddy.com/) and obtain tokens by following [this guide](https://developer.godaddy.com/getstarted).  
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.ote-godaddy.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Remove listings from GoDaddy Auction
    #
    # + domains - A comma separated list of domain names 
    # + return - Request was successful 
    remote isolated function deleteListings(string[] domains) returns AftermarketListingAction|error {
        string resourcePath = string `/v1/aftermarket/listings`;
        map<anydata> queryParam = {"domains": domains};
        map<Encoding> queryParamEncoding = {"domains": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        AftermarketListingAction response = check self.clientEp->delete(resourcePath, httpHeaders);
        return response;
    }
    # Add expiry listings into GoDaddy Auction
    #
    # + payload - An array of expiry listings to be loaded 
    # + return - Request was successful 
    remote isolated function addExpiryListings(AftermarketListingExpiryCreate[] payload) returns AftermarketListingAction|error {
        string resourcePath = string `/v1/aftermarket/listings/expiry`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AftermarketListingAction response = check self.clientEp->post(resourcePath, request, headers = httpHeaders);
        return response;
    }
}
