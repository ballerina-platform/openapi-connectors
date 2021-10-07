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
    # Represents API Key `x-api-key`
    string xApiKey;
|};

# This is a generated connector for [Shorten.REST v1.0](https://docs.shorten.rest/) OpenAPI Specification.
# The Shorten.REST API allows you to programmatically create short URLs for longer URL.
# Each alias you create can be used to redirect the end user (person clicking on the link) to one or more destination URLs
# A default destination is always set and specific destinations can be set to redirect the end user to preferred destinations based on the user's geographical location (country) and device Operating System.
@display {label: "Shorten.REST", iconPath: "resources/shorten.rest.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Shorten.REST account](https://app.shorten.rest/auth) and obtain tokens by following [this guide](https://docs.shorten.rest/#section/Authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.shorten.rest") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
    }
    # Get alias
    #
    # + domainName - domain which alias belongs to (string without `http/https` or `/`) 
    # + aliasName - alias value (without `/` at the beginning) 
    # + return - Alias model or **null** 
    remote isolated function getAlias(string aliasName, string domainName = "short.fyi") returns AliasModel|error {
        string  path = string `/aliases`;
        map<anydata> queryParam = {"domainName": domainName, "aliasName": aliasName};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        AliasModel response = check self.clientEp-> get(path, accHeaders, targetType = AliasModel);
        return response;
    }
    # Update alias
    #
    # + domainName - domain which alias belongs to (string without `http/https` or `/`) 
    # + aliasName - alias (without `/` at the beginning) 
    # + payload - alias properties you wish to be updated 
    # + return - Empty response 
    remote isolated function updateAlias(string aliasName, CreateAliasModel payload, string domainName = "short.fyi") returns http:Response|error {
        string  path = string `/aliases`;
        map<anydata> queryParam = {"domainName": domainName, "aliasName": aliasName};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Create alias
    #
    # + domainName - domain which alias will belong to (string without `http/https` or `/`) 
    # + aliasName - alias (without `/` at the beginning) 
    # + payload - alias properties 
    # + return - Response contains aliasName, domainName and full generated short link 
    remote isolated function createAlias(CreateAliasModel payload, string domainName = "short.fyi", string aliasName = "@rnd") returns CreateAliasResponseModel|error {
        string  path = string `/aliases`;
        map<anydata> queryParam = {"domainName": domainName, "aliasName": aliasName};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CreateAliasResponseModel response = check self.clientEp->post(path, request, headers = accHeaders, targetType=CreateAliasResponseModel);
        return response;
    }
    # Delete alias
    #
    # + domainName - domain which alias belongs to (string without `http/https` or `/`) 
    # + aliasName - alias (without `/` at the beginning) 
    # + return - Empty response 
    remote isolated function deleteAlias(string aliasName, string domainName = "short.fyi") returns http:Response|error {
        string  path = string `/aliases`;
        map<anydata> queryParam = {"domainName": domainName, "aliasName": aliasName};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp-> delete(path, accHeaders, targetType = http:Response);
        return response;
    }
    # Get aliases by domain
    #
    # + domainName - The domain name to get the aliases for (string without `http/https` or `/`) 
    # + continueFrom - An ID returned by a previous query to continue aliases retrieval (see lastId in response) 
    # + 'limit - Number of results to return per request 
    # + return - returns Array of aliases with lastId 
    remote isolated function getAliases(string domainName = "short.fyi", string? continueFrom = (), int 'limit = 1000) returns GetAliasesModel|error {
        string  path = string `/aliases/all`;
        map<anydata> queryParam = {"domainName": domainName, "continueFrom": continueFrom, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetAliasesModel response = check self.clientEp-> get(path, accHeaders, targetType = GetAliasesModel);
        return response;
    }
    # Get clicks
    #
    # + continueFrom - An ID returned by a previous query to continue clicks retrieval (see lastId in response) 
    # + 'limit - Number of results to return per request 
    # + return - returns Array of Click models, also returns lastId 
    remote isolated function getClicks(string? continueFrom = (), int 'limit = 1000) returns GetClicksModel|error {
        string  path = string `/clicks`;
        map<anydata> queryParam = {"continueFrom": continueFrom, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        GetClicksModel response = check self.clientEp-> get(path, accHeaders, targetType = GetClicksModel);
        return response;
    }
}
