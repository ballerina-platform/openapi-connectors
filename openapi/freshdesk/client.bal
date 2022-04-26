// Copyright (c) 2022 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    http:CredentialsConfig auth;
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

# This is a generated connector for [Freshdesk API v2.0](https://developers.freshdesk.com/api/#intro) OpenAPI specification.
# Freshdesk is a cloud-based customer service software that enables businesses of all sizes to deliver stellar customer support.
@display {label: "Freshdesk", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Freshdesk Account](https://freshdesk.com/signup) and obtain tokens following [this guide](https://developers.freshdesk.com/api/#getting-started)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
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
        string resourcePath = string `/api/v2/tickets/${id}`;
        Ticket response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a ticket
    #
    # + id - Unique identifier for a ticket 
    # + return - The resource was deleted successfully. 
    remote isolated function deleteTicket(int id) returns http:Response|error {
        string resourcePath = string `/api/v2/tickets/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
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
        string resourcePath = string `/api/v2/contacts/${id}`;
        Contact response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a contact
    #
    # + id - Unique identifier for a contact 
    # + return - The resource was deleted successfully. 
    remote isolated function deleteContact(int id) returns http:Response|error {
        string resourcePath = string `/api/v2/contacts/${id}`;
        http:Response response = check self.clientEp->delete(resourcePath);
        return response;
    }
}
