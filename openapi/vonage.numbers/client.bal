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
    # You can find your API key in the [developer dashboard](https://dashboard.nexmo.com)
    string apiKey;
    # You can find your API secret in the [developer dashboard](https://dashboard.nexmo.com)
    string apiSecret;
|};

# This is a generated connector for [Vonage Numbers API v1.0.20](https://nexmo-api-specification.herokuapp.com/numbers) OpenAPI specification.
# The Numbers API enables you to manage your existing numbers and buy new virtual numbers for use with the Vonage APIs. 
# Further information is here: <https://developer.nexmo.com/numbers/overview>
@display {label: "Vonage Numbers", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vonage account](https://www.vonage.com/) and obtain tokens by following [this guide](https://developer.nexmo.com/concepts/guides/authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://rest.nexmo.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # List the numbers you own
    #
    # + applicationId - The Application that you want to return the numbers for. 
    # + hasApplication - Set this optional field to `true` to restrict your results to numbers associated with an Application (any Application). Set to `false` to find all numbers not associated with any Application. Omit the field to avoid filtering on whether or not the number is assigned to an Application. 
    # + country - The two character country code in ISO 3166-1 alpha-2 format 
    # + pattern - The number pattern you want to search for. Use in conjunction with `search_pattern`. 
    # + searchPattern - The strategy you want to use for matching: * `0` - Search for numbers that start with `pattern` (Note: all numbers are in E.164 format, so the starting pattern includes the country code, such as 1 for USA) * `1` - Search for numbers that contain `pattern` * `2` - Search for numbers that end with `pattern` 
    # + size - Page size 
    # + index - Page index 
    # + return - OK 
    remote isolated function getOwnedNumbers(string? applicationId = (), boolean? hasApplication = (), string? country = (), string? pattern = (), int searchPattern = 0, int size = 10, int index = 1) returns InboundNumbers|error {
        string resourcePath = string `/account/numbers`;
        map<anydata> queryParam = {"application_id": applicationId, "has_application": hasApplication, "country": country, "pattern": pattern, "search_pattern": searchPattern, "size": size, "index": index, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InboundNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search available numbers
    #
    # + country - The two character country code to filter on (in ISO 3166-1 alpha-2 format) 
    # + 'type - Set this parameter to filter the type of number, such as mobile or landline 
    # + pattern - The number pattern you want to search for. Use in conjunction with `search_pattern`. 
    # + searchPattern - The strategy you want to use for matching: * `0` - Search for numbers that start with `pattern` (Note: all numbers are in E.164 format, so the starting pattern includes the country code, such as 1 for USA) * `1` - Search for numbers that contain `pattern` * `2` - Search for numbers that end with `pattern` 
    # + features - Available features are `SMS`, `VOICE` and `MMS`. To look for numbers that support multiple features, use a comma-separated value: `SMS,MMS,VOICE`. 
    # + size - Page size 
    # + index - Page index 
    # + return - OK 
    remote isolated function getAvailableNumbers(string country, string? 'type = (), string? pattern = (), int searchPattern = 0, string? features = (), int size = 10, int index = 1) returns AvailableNumbers|error {
        string resourcePath = string `/number/search`;
        map<anydata> queryParam = {"country": country, "type": 'type, "pattern": pattern, "search_pattern": searchPattern, "features": features, "size": size, "index": index, "api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AvailableNumbers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Buy a number
    #
    # + payload - Number details 
    # + return - OK 
    remote isolated function buyANumber(NumberDetails payload) returns Response|error {
        string resourcePath = string `/number/buy`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Cancel a number
    #
    # + payload - Number details 
    # + return - OK 
    remote isolated function cancelANumber(NumberDetails payload) returns Response|error {
        string resourcePath = string `/number/cancel`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a number
    #
    # + payload - Number details 
    # + return - OK 
    remote isolated function updateANumber(NumberDetailsUpdate payload) returns Response|error {
        string resourcePath = string `/number/update`;
        map<anydata> queryParam = {"api_key": self.apiKeyConfig.apiKey, "api_secret": self.apiKeyConfig.apiSecret};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        string encodedRequestBody = createFormURLEncodedRequestBody(payload);
        request.setPayload(encodedRequestBody, "application/x-www-form-urlencoded");
        Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
