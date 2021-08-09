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

# Visit [here](https://chaingateway.io/account) and obtain an `API key`. 
#
# + apiKeys - Provide your API key as `Authorization`. Eg: `{"Authorization" : "<your API key>"}`   
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# This is a generated connector for [Chaingateway API v1.0](https://chaingateway.io/docs-ethereum) OpenAPI specification.
# This is the REST API to build the bridge between Ethereum and the real world. 
# All of the integrations communicates with chaingateway.io through this API.
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Chaingateway.io Account](https://chaingateway.io/register) and obtain tokens following [this guide](https://chaingateway.io/docs-ethereum#apikey).
    #
    # + apiKeyConfig - Provide your API key as `Authorization`. Eg: `{"Authorization" : "<your API key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error at the failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://eu.eth.chaingateway.io/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Returns information about a specific ERC20 token like name, symbol, decimal places and total supply.
    #
    # + payload - Payload to get a details about ERC20 token like name, symbol, decimal places and total supply
    # + return - Information about a specific ERC20 token like name, symbol, decimal places and total supply
    remote isolated function getToken(GetTokenRequest payload) returns GetToken|error {
        string  path = string `/getToken`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetToken response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetToken);
        return response;
    }
    # Returns the block number of the last mined Ethereum block.
    #
    # + contentType - Result of content type of resuly whether json or xml
    # + return - Block number of the last mined Ethereum block
    remote isolated function getLastBlockNumber(string contentType) returns GetLastBlockNumber|error {
        string  path = string `/getLastBlockNumber`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetLastBlockNumber response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = GetLastBlockNumber);
        return response;
    }
    # Returns the current gas price in GWEI.
    #
    # + contentType - Result of content type of resuly whether json or xml
    # + return - Current gas price in GWEI.
    remote isolated function getGasPrice(string contentType) returns GetGasPrice|error {
        string  path = string `/getGasPrice`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetGasPrice response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = GetGasPrice);
        return response;
    }
    # Returns the current Ethereum price in Euro or US Dollar.
    #
    # + payload - Payload to get current Ethereum price in Euro or US Dollar
    # + return - Current Ethereum price in Euro or US Dollar
    remote isolated function getExchangeRate(GetExchangeRateRequest payload) returns GetExchangeRate|error {
        string  path = string `/getExchangeRate`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetExchangeRate response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetExchangeRate);
        return response;
    }
    # Returns the Ethereum balance of a given address.
    #
    # + payload - Payload to get Ethereum balance of a given address
    # + return - Ethereum balance of a given address
    remote isolated function getEthereumBalance(GetEthereumBalanceRequest payload) returns GetEthereumBalance|error {
        string  path = string `/getEthereumBalance`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetEthereumBalance response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetEthereumBalance);
        return response;
    }
    # Returns the token balance of a given address.
    #
    # + payload - Payload to get token balance of a given address
    # + return - Token balance of a given address
    remote isolated function getTokenBalance(GetTokenBalanceRequest payload) returns GetTokenBalance|error {
        string  path = string `/getTokenBalance`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTokenBalance response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetTokenBalance);
        return response;
    }
    # Returns information like confirmations, token contract address, amount, gas price and more of a given transaction.
    #
    # + payload - Payload to get a details about given transaction
    # + return - Information like confirmations, token contract address, amount, gas price and more of a given transaction
    remote isolated function getTransactions(GetTransactionsRequest payload) returns GetTransactions|error {
        string  path = string `/getTransactions`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetTransactions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetTransactions);
        return response;
    }
    # Returns information of an Ethereum block with or without transactions.
    #
    # + payload - Payload to get a Ethereum block
    # + return - Information of an Ethereum block with or without transactions
    remote isolated function getBlock(GetBlockRequest payload) returns GetBlock|error {
        string  path = string `/getBlock`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        GetBlock response = check self.clientEp->post(path, request, headers = accHeaders, targetType=GetBlock);
        return response;
    }
    # Generates a new Ethereum addresses you can use to send or receive funds. Do not lose the password! We can't restore access to an address if you lose it.
    #
    # + payload - Payload to create a new Ethereum address
    # + return - Generated new Ethereum addresses you can use to send or receive funds
    remote isolated function newAddress(NewAddressRequest payload) returns NewAddress|error {
        string  path = string `/newAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NewAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=NewAddress);
        return response;
    }
    # Deletes an existing Ethereum address. Be careful when using this function.
    #
    # + payload - Payload to delete an existing Ethereum address
    # + return - Detail of Ethereum addresses deleted
    remote isolated function deleteAddress(DeleteAddressRequest payload) returns DeleteAddress|error {
        string  path = string `/deleteAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeleteAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DeleteAddress);
        return response;
    }
    # Returns all Ethereum addresses created with an account.
    #
    # + contentType - Result of content type of resuly whether json or xml
    # + return - Ethereum addresses created with an account
    remote isolated function listAddresses(string contentType) returns ListAddresses|error {
        string  path = string `/listAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListAddresses response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListAddresses);
        return response;
    }
    # Imports an existing keystore into system and makes it possible to send transactions from it.
    #
    # + payload - Payload to import a keystore into system
    # + return - List of Ethereum addresses created with an account
    remote isolated function importAddress(ImportAddressRequest payload) returns ImportAddress|error {
        string  path = string `/importAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ImportAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ImportAddress);
        return response;
    }
    # Exports an existing keystore file so you can use it in other wallets.
    #
    # + payload - Payload to export an existing keystore file
    # + return - List of Ethereum addresses created with an account
    remote isolated function exportAddress(ExportAddressRequest payload) returns ExportAddress|error {
        string  path = string `/exportAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ExportAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ExportAddress);
        return response;
    }
    # Creates a new subscription/IPN for the given address (and contractaddress). You will receive a notification to the given url every time a deposit is received. Unsubscribe the address before sending tokens/ETH from it or you won't get reliable notifications anymore.
    #
    # + payload - Payload to create a new subscription/IPN
    # + return - Detail about Ethereum address
    remote isolated function subscribeAddress(SubscribeAddressRequest payload) returns SubscribeAddress|error {
        string  path = string `/subscribeAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SubscribeAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SubscribeAddress);
        return response;
    }
    # Deletes an existing subscription/IPN for the given address (and contractaddress).
    #
    # + payload - Payload to delete an existing subscription/IPN
    # + return - Detail about Ethereum address
    remote isolated function unsubscribeAddress(UnsubscribeAddressRequest payload) returns UnsubscribeAddress|error {
        string  path = string `/unsubscribeAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UnsubscribeAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=UnsubscribeAddress);
        return response;
    }
    # Returns all subscriptions/IPNs created with an account.
    #
    # + contentType - Result of content type of resuly whether json or xml
    # + return - Details about all Ethereum addresses
    remote isolated function listSubscribedAddresses(string contentType) returns ListSubscribedAddresses|error {
        string  path = string `/listSubscribedAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListSubscribedAddresses response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListSubscribedAddresses);
        return response;
    }
    # Returns all IPNs that couldn't be sent. Our system tries to send IPNs 10 times until they end up failed.
    #
    # + contentType - Result of content type of resuly whether json or xml
    # + return - List of IPNs that couldn't be sent
    remote isolated function listFailedIPNs(string contentType) returns ListFailedIPNs|error {
        string  path = string `/listFailedIPNs`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListFailedIPNs response = check self.clientEp-> post(path, request, headers = accHeaders, targetType = ListFailedIPNs);
        return response;
    }
    # Tries to resend a failed IPN.
    #
    # + payload - Payload to resend a failed IPN
    # + return - Status of subscriptions/IPNs
    remote isolated function resendFailedIPN(ResendFailedIPNRequest payload) returns ResendFailedIPN|error {
        string  path = string `/resendFailedIPN`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResendFailedIPN response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ResendFailedIPN);
        return response;
    }
    # Sends Ethereum from an address controlled by the account to a specified receiver address.
    #
    # + payload - Payload to send Ethereum transaction from an address
    # + return - Detail about Ethereum transaction from an address
    remote isolated function sendEthereum(SendEthereumRequest payload) returns SendEthereum|error {
        string  path = string `/sendEthereum`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendEthereum response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SendEthereum);
        return response;
    }
    # Sends all available Ethereum funds of an address to a specified receiver address.
    #
    # + payload - Payload to send all available Ethereum funds from an address
    # + return - Detail about all available Ethereum funds from an address
    remote isolated function clearAddress(ClearAddressRequest payload) returns ClearAddress|error {
        string  path = string `/clearAddress`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ClearAddress response = check self.clientEp->post(path, request, headers = accHeaders, targetType=ClearAddress);
        return response;
    }
    # Sends ERC20 tokens from an address controlled by the account to a specified receiver address. The token contract address is needed to specify the token. The use of the identifier parameter is recommend and awaits an unique string. Whenever a transaction is beeing sent, the identifier is checked and the transaction gets dropped if there is one with that identifier already.
    #
    # + payload - Payload to sends ERC20 tokens from an address
    # + return - Detail about ERC20 tokens transaction
    remote isolated function sendToken(SendTokenRequest payload) returns SendToken|error {
        string  path = string `/sendToken`;
        map<any> headerValues = {"Authorization": self.apiKeys["Authorization"]};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        SendToken response = check self.clientEp->post(path, request, headers = accHeaders, targetType=SendToken);
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
