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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# This is a generated connector from [1Password Connect API v1.0](https://1password.com/) OpenAPI specification.
# 1Password is the easiest way to store and use strong passwords. Log in to sites and fill forms securely with a single click.
@display {label: "1Password", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [1Password account](https://1password.com/) and obtain OAuth tokens following [this guide](https://support.1password.com/manage-secrets-automation/#issue-revoke-or-rename-an-access-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "http://localhost:8080/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieve a list of API Requests that have been made.
    #
    # + 'limit - How many API Events should be retrieved in a single request. 
    # + offset - How far into the collection of API Events should the response start 
    # + return - OK 
    remote isolated function getApiActivity(int 'limit = 50, int offset = 0) returns APIRequest[]|error {
        string resourcePath = string `/activity`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        APIRequest[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all Vaults
    #
    # + filter - Filter the Vault collection based on Vault name using SCIM eq filter 
    # + return - OK 
    remote isolated function getVaults(string? filter = ()) returns Vault[]|error {
        string resourcePath = string `/vaults`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Vault[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get Vault details and metadata
    #
    # + vaultUuid - The UUID of the Vault to fetch Items from 
    # + return - OK 
    remote isolated function getVaultById(string vaultUuid) returns Vault|error {
        string resourcePath = string `/vaults/${vaultUuid}`;
        Vault response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all items for inside a Vault
    #
    # + vaultUuid - The UUID of the Vault to fetch Items from 
    # + filter - Filter the Item collection based on Item name using SCIM eq filter 
    # + return - OK 
    remote isolated function getVaultItems(string vaultUuid, string? filter = ()) returns Item[]|error {
        string resourcePath = string `/vaults/${vaultUuid}/items`;
        map<anydata> queryParam = {"filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Item[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new Item
    #
    # + vaultUuid - The UUID of the Vault to create an Item in 
    # + payload - Object containing the information to create the item. 
    # + return - OK 
    remote isolated function createVaultItem(string vaultUuid, FullItem payload) returns FullItem|error {
        string resourcePath = string `/vaults/${vaultUuid}/items`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullItem response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get the details of an Item
    #
    # + vaultUuid - The UUID of the Vault to fetch Item from 
    # + itemUuid - The UUID of the Item to fetch 
    # + return - OK 
    remote isolated function getVaultItemById(string vaultUuid, string itemUuid) returns FullItem|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}`;
        FullItem response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an Item
    #
    # + vaultUuid - The UUID of the Item's Vault 
    # + itemUuid - The UUID of the Item to update 
    # + payload - Object containing the information to update in item. 
    # + return - OK 
    remote isolated function updateVaultItem(string vaultUuid, string itemUuid, FullItem payload) returns FullItem|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullItem response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an Item
    #
    # + vaultUuid - The UUID of the Vault the item is in 
    # + itemUuid - The UUID of the Item to update 
    # + return - Successfully deleted an item 
    remote isolated function deleteVaultItem(string vaultUuid, string itemUuid) returns http:Response|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
    # Update a subset of Item attributes
    #
    # + vaultUuid - The UUID of the Vault the item is in 
    # + itemUuid - The UUID of the Item to update 
    # + payload - Object containing the subset of information to patch the item. 
    # + return - OK - Item updated. If no Patch operations were provided, Item is unmodified. 
    remote isolated function patchVaultItem(string vaultUuid, string itemUuid, Patch payload) returns FullItem|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FullItem response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get all the files inside an Item
    #
    # + vaultUuid - The UUID of the Vault to fetch Items from 
    # + itemUuid - The UUID of the Item to fetch files from 
    # + inlineFiles - Tells server to return the base64-encoded file contents in the response. 
    # + return - OK 
    remote isolated function getItemFiles(string vaultUuid, string itemUuid, boolean? inlineFiles = ()) returns File[]|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}/files`;
        map<anydata> queryParam = {"inline_files": inlineFiles};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        File[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the details of a File
    #
    # + vaultUuid - The UUID of the Vault to fetch Item from 
    # + itemUuid - The UUID of the Item to fetch File from 
    # + fileUuid - The UUID of the File to fetch 
    # + inlineFiles - Tells server to return the base64-encoded file contents in the response. 
    # + return - OK 
    remote isolated function getDetailsOfFileById(string vaultUuid, string itemUuid, string fileUuid, boolean? inlineFiles = ()) returns File|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}/files/${fileUuid}`;
        map<anydata> queryParam = {"inline_files": inlineFiles};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        File response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get the content of a File
    #
    # + vaultUuid - The UUID of the Vault the item is in 
    # + itemUuid - The UUID of the Item the File is in 
    # + fileUuid - UUID of the file to get content from 
    # + return - Success 
    remote isolated function downloadFileByID(string vaultUuid, string itemUuid, string fileUuid) returns string|error {
        string resourcePath = string `/vaults/${vaultUuid}/items/${itemUuid}/files/${fileUuid}/content`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Ping the server for liveness
    #
    # + return - OK 
    remote isolated function getHeartbeat() returns string|error {
        string resourcePath = string `/heartbeat`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Query server for exposed Prometheus metrics
    #
    # + return - Successfully returned Prometheus metrics 
    remote isolated function getPrometheusMetrics() returns string|error {
        string resourcePath = string `/metrics`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
}
