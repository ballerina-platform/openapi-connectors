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

# This is a generated connector from [Chaingateway Ethereum API v1](https://chaingateway.io/docs-ethereum) OpenAPI Specification. 
# 
# Chaingateway Ethereum allows you to interact with Ethereum and all ERC20 tokens
# 
# Accept your own token as payment method for your shop, distribute airdrop tokens of your ICO, convert your site currency to a token that can be traded on exchanges and many more
# 
# There are a lot of use cases which are not only limited to sending tokens but also receiving them. You could even create a secure wallet for your token which only the wallet owner has access to.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Please create an [Chaingateway account](https://chaingateway.io/register) and obtain an API key.    
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://eu.eth.chaingateway.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # clearAddress
    #
    # + authorization - API Key
    remote isolated function clearAddress(string authorization, ClearAddressRequest payload) returns ClearAddress|error {
        string  path = string `/clearAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClearAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ClearAddress);
        return response;
    }
    # deleteAddress
    #
    # + authorization - API Key
    remote isolated function deleteAddress(string authorization, DeleteAddressRequest payload) returns DeleteAddress|error {
        string  path = string `/deleteAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeleteAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DeleteAddress);
        return response;
    }
    # exportAddress
    #
    # + authorization - API Key
    remote isolated function exportAddress(string authorization, ExportAddressRequest payload) returns ExportAddress|error {
        string  path = string `/exportAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExportAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ExportAddress);
        return response;
    }
    # getBlock
    #
    # + authorization - API Key
    remote isolated function getBlock(string authorization, GetBlockRequest payload) returns GetBlock|error {
        string  path = string `/getBlock`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetBlock response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetBlock);
        return response;
    }
    # getEthereumBalance
    #
    # + authorization - API Key
    remote isolated function getEthereumBalance(string authorization, GetEthereumBalanceRequest payload) returns GetEthereumBalance|error {
        string  path = string `/getEthereumBalance`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetEthereumBalance response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetEthereumBalance);
        return response;
    }
    # getExchangeRate
    #
    # + authorization - API Key
    remote isolated function getExchangeRate(string authorization, GetExchangeRateRequest payload) returns GetExchangeRate|error {
        string  path = string `/getExchangeRate`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetExchangeRate response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetExchangeRate);
        return response;
    }
    # getGasPrice
    #
    # + authorization - API Key
    remote isolated function getGasPrice(string contentType, string authorization) returns GetGasPrice|error {
        string  path = string `/getGasPrice`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetGasPrice response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = GetGasPrice);
        return response;
    }
    # getLastBlockNumber
    #
    # + authorization - API Key
    remote isolated function getLastBlockNumber(string contentType, string authorization) returns GetLastBlockNumber|error {
        string  path = string `/getLastBlockNumber`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetLastBlockNumber response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = GetLastBlockNumber);
        return response;
    }
    # getToken
    #
    # + authorization - API Key
    remote isolated function getToken(string authorization, GetTokenRequest payload) returns GetToken|error {
        string  path = string `/getToken`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetToken response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetToken);
        return response;
    }
    # getTokenBalance
    #
    # + authorization - API Key
    remote isolated function getTokenBalance(string authorization, GetTokenBalanceRequest payload) returns GetTokenBalance|error {
        string  path = string `/getTokenBalance`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTokenBalance response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetTokenBalance);
        return response;
    }
    # getTransactions
    #
    # + authorization - API Key
    remote isolated function getTransactions(string authorization, GetTransactionsRequest payload) returns GetTransactions|error {
        string  path = string `/getTransactions`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTransactions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetTransactions);
        return response;
    }
    # importAddress
    #
    # + authorization - API Key
    remote isolated function importAddress(string authorization, ImportAddressRequest payload) returns ImportAddress|error {
        string  path = string `/importAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ImportAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ImportAddress);
        return response;
    }
    # listAddresses
    #
    # + authorization - API Key
    remote isolated function listAddresses(string contentType, string authorization) returns ListAddresses|error {
        string  path = string `/listAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListAddresses response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListAddresses);
        return response;
    }
    # listFailedIPNs
    #
    # + authorization - API Key
    remote isolated function listFailedIPNs(string contentType, string authorization) returns ListFailedIPNs|error {
        string  path = string `/listFailedIPNs`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListFailedIPNs response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListFailedIPNs);
        return response;
    }
    # listSubscribedAddresses
    #
    # + authorization - API Key
    remote isolated function listSubscribedAddresses(string contentType, string authorization) returns ListSubscribedAddresses|error {
        string  path = string `/listSubscribedAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListSubscribedAddresses response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListSubscribedAddresses);
        return response;
    }
    # newAddress
    #
    # + authorization - API Key
    remote isolated function newAddress(string authorization, NewAddressRequest payload) returns NewAddress|error {
        string  path = string `/newAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NewAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NewAddress);
        return response;
    }
    # resendFailedIPN
    #
    # + authorization - API Key
    remote isolated function resendFailedIPN(string authorization, ResendFailedIPNRequest payload) returns ResendFailedIPN|error {
        string  path = string `/resendFailedIPN`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResendFailedIPN response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ResendFailedIPN);
        return response;
    }
    # sendEthereum
    #
    # + authorization - API Key
    remote isolated function sendEthereum(string authorization, SendEthereumRequest payload) returns SendEthereum|error {
        string  path = string `/sendEthereum`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendEthereum response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SendEthereum);
        return response;
    }
    # sendToken
    #
    # + authorization - API Key
    remote isolated function sendToken(string authorization, SendTokenRequest payload) returns SendToken|error {
        string  path = string `/sendToken`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendToken response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SendToken);
        return response;
    }
    # subscribeAddress
    #
    # + authorization - API Key
    remote isolated function subscribeAddress(string authorization, SubscribeAddressRequest payload) returns SubscribeAddress|error {
        string  path = string `/subscribeAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscribeAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SubscribeAddress);
        return response;
    }
    # unsubscribeAddress
    #
    # + authorization - API Key
    remote isolated function unsubscribeAddress(string authorization, UnsubscribeAddressRequest payload) returns UnsubscribeAddress|error {
        string  path = string `/unsubscribeAddress`;
        map<any> headerValues = {"Authorization": authorization};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UnsubscribeAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UnsubscribeAddress);
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
