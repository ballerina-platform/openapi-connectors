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

# This is a generated connector for [Freshdesk API v2.0](https://developers.freshdesk.com/api/#intro) OpenAPI specification.
# Freshdesk is a cloud-based customer service software that enables businesses of all sizes to deliver stellar customer support.
@display {label: "Freshdesk", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Freshdesk Account](https://freshdesk.com/signup) and obtain tokens following [this guide](https://developers.freshdesk.com/api/#getting-started)
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
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
        return;
    }
    # List tickets
    #
    # + return - Tickets details 
    remote isolated function listTickets() returns Ticket[]|error {
        string resourcePath = string `/api/v2/tickets`;
        Ticket[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add a ticket
    #
    # + payload - Add a ticket 
    # + return - Ticket detail 
    remote isolated function addTicket(TicketPayload payload) returns Ticket|error {
        string resourcePath = string `/api/v2/tickets`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Ticket response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get a ticket
    #
    # + id - Unique identifier for a ticket 
    # + return - Ticket detail 
    remote isolated function getTicket(int id) returns Ticket|error {
        string resourcePath = string `/api/v2/tickets/${getEncodedUri(id)}`;
        Ticket response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a ticket
    #
    # + id - Unique identifier for a ticket 
    # + return - The resource was deleted successfully. 
    remote isolated function deleteTicket(int id) returns http:Response|error {
        string resourcePath = string `/api/v2/tickets/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List contacts
    #
    # + return - Contacts details 
    remote isolated function listContacts() returns Contact[]|error {
        string resourcePath = string `/api/v2/contacts`;
        Contact[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get a contact
    #
    # + id - Unique identifier for a contact 
    # + return - Contact detail 
    remote isolated function getContact(int id) returns Contact|error {
        string resourcePath = string `/api/v2/contacts/${getEncodedUri(id)}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a contact
    #
    # + id - Unique identifier for a contact 
    # + return - The resource was deleted successfully. 
    remote isolated function deleteContact(int id) returns http:Response|error {
        string resourcePath = string `/api/v2/contacts/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
