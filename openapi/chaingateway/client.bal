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

# This is a generated connector for [Chaingateway API v1.0](https://chaingateway.io/docs-ethereum) OpenAPI specification.
# This is the REST API to build the bridge between Ethereum and the real world. 
# All of the integrations communicates with chaingateway.io through this API.
@display {label: "Chaingateway", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Chaingateway.io Account](https://chaingateway.io/register) and obtain tokens following [this guide](https://chaingateway.io/docs-ethereum#apikey).
    #
    # + apiKeyConfig - API keys for authorization 
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, ConnectionConfig config =  {}, string serviceUrl = "https://eu.eth.chaingateway.io/v1") returns error? {
        http:ClientConfiguration httpClientConfig = {httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Returns information about a specific ERC20 token like name, symbol, decimal places and total supply.
    #
    # + payload - Payload to get a details about ERC20 token like name, symbol, decimal places and total supply 
    # + return - Information about a specific ERC20 token like name, symbol, decimal places and total supply 
    remote isolated function getToken(GetTokenRequest payload) returns GetToken|error {
        string resourcePath = string `/getToken`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetToken response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the block number of the last mined Ethereum block.
    #
    # + contentType - Result of content type of resuly whether json or xml 
    # + return - Block number of the last mined Ethereum block 
    remote isolated function getLastBlockNumber(string contentType) returns GetLastBlockNumber|error {
        string resourcePath = string `/getLastBlockNumber`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetLastBlockNumber response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the current gas price in GWEI.
    #
    # + contentType - Result of content type of resuly whether json or xml 
    # + return - Current gas price in GWEI. 
    remote isolated function getGasPrice(string contentType) returns GetGasPrice|error {
        string resourcePath = string `/getGasPrice`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        GetGasPrice response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the current Ethereum price in Euro or US Dollar.
    #
    # + payload - Payload to get current Ethereum price in Euro or US Dollar 
    # + return - Current Ethereum price in Euro or US Dollar 
    remote isolated function getExchangeRate(GetExchangeRateRequest payload) returns GetExchangeRate|error {
        string resourcePath = string `/getExchangeRate`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetExchangeRate response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the Ethereum balance of a given address.
    #
    # + payload - Payload to get Ethereum balance of a given address 
    # + return - Ethereum balance of a given address 
    remote isolated function getEthereumBalance(GetEthereumBalanceRequest payload) returns GetEthereumBalance|error {
        string resourcePath = string `/getEthereumBalance`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetEthereumBalance response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns the token balance of a given address.
    #
    # + payload - Payload to get token balance of a given address 
    # + return - Token balance of a given address 
    remote isolated function getTokenBalance(GetTokenBalanceRequest payload) returns GetTokenBalance|error {
        string resourcePath = string `/getTokenBalance`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetTokenBalance response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns information like confirmations, token contract address, amount, gas price and more of a given transaction.
    #
    # + payload - Payload to get a details about given transaction 
    # + return - Information like confirmations, token contract address, amount, gas price and more of a given transaction 
    remote isolated function getTransactions(GetTransactionsRequest payload) returns GetTransactions|error {
        string resourcePath = string `/getTransactions`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetTransactions response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns information of an Ethereum block with or without transactions.
    #
    # + payload - Payload to get a Ethereum block 
    # + return - Information of an Ethereum block with or without transactions 
    remote isolated function getBlock(GetBlockRequest payload) returns GetBlock|error {
        string resourcePath = string `/getBlock`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetBlock response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Generates a new Ethereum addresses you can use to send or receive funds. Do not lose the password! We can't restore access to an address if you lose it.
    #
    # + payload - Payload to create a new Ethereum address 
    # + return - Generated new Ethereum addresses you can use to send or receive funds 
    remote isolated function newAddress(NewAddressRequest payload) returns NewAddress|error {
        string resourcePath = string `/newAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NewAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes an existing Ethereum address. Be careful when using this function.
    #
    # + payload - Payload to delete an existing Ethereum address 
    # + return - Detail of Ethereum addresses deleted 
    remote isolated function deleteAddress(DeleteAddressRequest payload) returns DeleteAddress|error {
        string resourcePath = string `/deleteAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DeleteAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns all Ethereum addresses created with an account.
    #
    # + contentType - Result of content type of resuly whether json or xml 
    # + return - Ethereum addresses created with an account 
    remote isolated function listAddresses(string contentType) returns ListAddresses|error {
        string resourcePath = string `/listAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListAddresses response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Imports an existing keystore into system and makes it possible to send transactions from it.
    #
    # + payload - Payload to import a keystore into system 
    # + return - List of Ethereum addresses created with an account 
    remote isolated function importAddress(ImportAddressRequest payload) returns ImportAddress|error {
        string resourcePath = string `/importAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ImportAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Exports an existing keystore file so you can use it in other wallets.
    #
    # + payload - Payload to export an existing keystore file 
    # + return - List of Ethereum addresses created with an account 
    remote isolated function exportAddress(ExportAddressRequest payload) returns ExportAddress|error {
        string resourcePath = string `/exportAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ExportAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Creates a new subscription/IPN for the given address (and contractaddress). You will receive a notification to the given url every time a deposit is received. Unsubscribe the address before sending tokens/ETH from it or you won't get reliable notifications anymore.
    #
    # + payload - Payload to create a new subscription/IPN 
    # + return - Detail about Ethereum address 
    remote isolated function subscribeAddress(SubscribeAddressRequest payload) returns SubscribeAddress|error {
        string resourcePath = string `/subscribeAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscribeAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Deletes an existing subscription/IPN for the given address (and contractaddress).
    #
    # + payload - Payload to delete an existing subscription/IPN 
    # + return - Detail about Ethereum address 
    remote isolated function unsubscribeAddress(UnsubscribeAddressRequest payload) returns UnsubscribeAddress|error {
        string resourcePath = string `/unsubscribeAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UnsubscribeAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns all subscriptions/IPNs created with an account.
    #
    # + contentType - Result of content type of resuly whether json or xml 
    # + return - Details about all Ethereum addresses 
    remote isolated function listSubscribedAddresses(string contentType) returns ListSubscribedAddresses|error {
        string resourcePath = string `/listSubscribedAddresses`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListSubscribedAddresses response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns all IPNs that couldn't be sent. Our system tries to send IPNs 10 times until they end up failed.
    #
    # + contentType - Result of content type of resuly whether json or xml 
    # + return - List of IPNs that couldn't be sent 
    remote isolated function listFailedIPNs(string contentType) returns ListFailedIPNs|error {
        string resourcePath = string `/listFailedIPNs`;
        map<any> headerValues = {"Content-Type": contentType, "Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ListFailedIPNs response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Tries to resend a failed IPN.
    #
    # + payload - Payload to resend a failed IPN 
    # + return - Status of subscriptions/IPNs 
    remote isolated function resendFailedIPN(ResendFailedIPNRequest payload) returns ResendFailedIPN|error {
        string resourcePath = string `/resendFailedIPN`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ResendFailedIPN response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sends Ethereum from an address controlled by the account to a specified receiver address.
    #
    # + payload - Payload to send Ethereum transaction from an address 
    # + return - Detail about Ethereum transaction from an address 
    remote isolated function sendEthereum(SendEthereumRequest payload) returns SendEthereum|error {
        string resourcePath = string `/sendEthereum`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendEthereum response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sends all available Ethereum funds of an address to a specified receiver address.
    #
    # + payload - Payload to send all available Ethereum funds from an address 
    # + return - Detail about all available Ethereum funds from an address 
    remote isolated function clearAddress(ClearAddressRequest payload) returns ClearAddress|error {
        string resourcePath = string `/clearAddress`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ClearAddress response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sends ERC20 tokens from an address controlled by the account to a specified receiver address. The token contract address is needed to specify the token. The use of the identifier parameter is recommend and awaits an unique string. Whenever a transaction is beeing sent, the identifier is checked and the transaction gets dropped if there is one with that identifier already.
    #
    # + payload - Payload to sends ERC20 tokens from an address 
    # + return - Detail about ERC20 tokens transaction 
    remote isolated function sendToken(SendTokenRequest payload) returns SendToken|error {
        string resourcePath = string `/sendToken`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SendToken response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
}
