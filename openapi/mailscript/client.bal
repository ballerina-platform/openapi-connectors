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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [Mailscript](https://docs.mailscript.com/#api) OpenAPI specification.
# Mailscript API provides the capability to manage emails.
@display {label: "Mailscript", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mailscript account](https://login.mailscript.com/signup) and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.mailscript.com/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get all actions for the user
    #
    # + return - Successful operation 
    remote isolated function getAllActions() returns GetAllActionsResponse|error {
        string resourcePath = string `/actions`;
        GetAllActionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add an action
    #
    # + payload - Add action body 
    # + return - Successful operation 
    remote isolated function addAction(ActionsBody payload) returns AddActionResponse|error {
        string resourcePath = string `/actions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddActionResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update an action key
    #
    # + action - ID of action 
    # + payload - Action body 
    # + return - Successful update operation 
    remote isolated function updateAction(string action, ActionsActionBody payload) returns Key|error {
        string resourcePath = string `/actions/${getEncodedUri(action)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Key response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete an action
    #
    # + action - ID of the action 
    # + return - Successful delete operation 
    remote isolated function deleteAction(string action) returns http:Response|error {
        string resourcePath = string `/actions/${getEncodedUri(action)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all addresses you have access to
    #
    # + return - successful operation 
    remote isolated function getAllAddresses() returns GetAllAddressesResponse|error {
        string resourcePath = string `/addresses`;
        GetAllAddressesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Claim a new Mailscript address
    #
    # + payload - Address body 
    # + return - successful operation 
    remote isolated function addAddress(AddAddressRequest payload) returns http:Response|error {
        string resourcePath = string `/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete a mailscript address
    #
    # + address - ID of address 
    # + return - successful delete operation 
    remote isolated function deleteAddress(string address) returns http:Response|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List address keys
    #
    # + address - ID of address 
    # + return - successful operation 
    remote isolated function getAllKeys(string address) returns GetAllKeysResponse|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}/keys`;
        GetAllKeysResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add address key
    #
    # + address - ID of address 
    # + payload - Key body 
    # + return - successful operation 
    remote isolated function addKey(string address, AddKeyRequest payload) returns AddKeyResponse|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}/keys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddKeyResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get address key
    #
    # + address - ID of address 
    # + 'key - ID of key 
    # + return - successful operation 
    remote isolated function getKey(string address, string 'key) returns Key|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}/keys/${getEncodedUri('key)}`;
        Key response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update an address key
    #
    # + address - ID of address 
    # + 'key - ID of key 
    # + payload - Key body 
    # + return - Successful operation 
    remote isolated function updateKey(string address, string 'key, UpdateKeyRequest payload) returns Key|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}/keys/${getEncodedUri('key)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Key response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete address key
    #
    # + address - ID of address 
    # + 'key - ID of key 
    # + return - Successful delete operation 
    remote isolated function deleteKey(string address, string 'key) returns http:Response|error {
        string resourcePath = string `/addresses/${getEncodedUri(address)}/keys/${getEncodedUri('key)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get a token for opening a daemon connection
    #
    # + daemon - name of Daemon 
    # + return - Successful get operation 
    remote isolated function getDaemonToken(string daemon) returns InlineResponse200|error {
        string resourcePath = string `/daemons/${getEncodedUri(daemon)}/token`;
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all domains you have access to
    #
    # + return - successful operation 
    remote isolated function getAllDomains() returns GetAllDomainsResponse|error {
        string resourcePath = string `/domains`;
        GetAllDomainsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Claim a new Domain
    #
    # + payload - Domain body 
    # + return - successful operation 
    remote isolated function addDomain(AddDomainRequest payload) returns DomainResponse|error {
        string resourcePath = string `/domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        DomainResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get domain verification
    #
    # + domain - Full Top-level domain name 
    # + return - successful operation 
    remote isolated function getDomainVerify(string domain) returns DomainResponse|error {
        string resourcePath = string `/domains/verify/${getEncodedUri(domain)}`;
        DomainResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Check a new Domain
    #
    # + domain - Full Top-level domain name 
    # + return - successful operation 
    remote isolated function checkDomainVerify(string domain) returns CheckDomainVerify|error {
        string resourcePath = string `/domains/verify/${getEncodedUri(domain)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CheckDomainVerify response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Remove a domain
    #
    # + domain - Full Top-level domain name 
    # + return - successful operation 
    remote isolated function removeDomainVerify(string domain) returns http:Response|error {
        string resourcePath = string `/domains/${getEncodedUri(domain)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all inputs you have access to
    #
    # + name - Name 
    # + return - successful operation 
    remote isolated function getAllInputs(string? name = ()) returns GetAllInputsResponse|error {
        string resourcePath = string `/inputs`;
        map<anydata> queryParam = {"name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetAllInputsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all integrations for the user
    #
    # + return - Successful operation 
    remote isolated function getAllIntegrations() returns GetAllIntegrationsResponse|error {
        string resourcePath = string `/integrations`;
        GetAllIntegrationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete an integration
    #
    # + integration - ID of the integration 
    # + return - Successful delete operation 
    remote isolated function deleteIntegration(string integration) returns http:Response|error {
        string resourcePath = string `/integrations/${getEncodedUri(integration)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Send an email
    #
    # + payload - request body 
    # + return - successful operation 
    remote isolated function send(SendRequest payload) returns http:Response|error {
        string resourcePath = string `/send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get all triggers you have access to
    #
    # + return - successful operation 
    remote isolated function getAllTriggers() returns GetAllTriggersResponse|error {
        string resourcePath = string `/triggers`;
        GetAllTriggersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Setup a trigger
    #
    # + payload - Trigger body 
    # + return - successful add operation 
    remote isolated function addTrigger(AddTriggerRequest payload) returns AddTriggerResponse|error {
        string resourcePath = string `/triggers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddTriggerResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a trigger
    #
    # + trigger - ID of the trigger 
    # + payload - Trigger body 
    # + return - Successful update operation 
    remote isolated function updateTrigger(string trigger, AddTriggerRequest payload) returns http:Response|error {
        string resourcePath = string `/triggers/${getEncodedUri(trigger)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a trigger
    #
    # + trigger - ID of the trigger 
    # + return - Successful delete operation 
    remote isolated function deleteTrigger(string trigger) returns http:Response|error {
        string resourcePath = string `/triggers/${getEncodedUri(trigger)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get the authenticated user
    #
    # + return - successful operation 
    remote isolated function getAuthenticatedUser() returns User|error {
        string resourcePath = string `/user`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a user
    #
    # + payload - User body 
    # + return - Successful update operation 
    remote isolated function updateUser(UpdateUserRequest payload) returns http:Response|error {
        string resourcePath = string `/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get all verificats for the user
    #
    # + return - Successful operation 
    remote isolated function getAllVerifications() returns GetAllVerificationsResponse|error {
        string resourcePath = string `/verifications`;
        GetAllVerificationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start verification process for external email address or sms number
    #
    # + payload - Key body 
    # + return - Successful operation 
    remote isolated function addVerification(VerificationsBody payload) returns AddVerificationResponse|error {
        string resourcePath = string `/verifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AddVerificationResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Verify an email address or sms number with a code
    #
    # + verification - ID of the verification entry 
    # + payload - Verify action body 
    # + return - Successful operation 
    remote isolated function verify(string verification, VerificationVerifyBody payload) returns http:Response|error {
        string resourcePath = string `/verifications/${getEncodedUri(verification)}/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get all workflows you have access to
    #
    # + return - successful operation 
    remote isolated function getAllWorkflows() returns GetAllWorkflowsResponse|error {
        string resourcePath = string `/workflows`;
        GetAllWorkflowsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Setup workflow
    #
    # + payload - Workflow body 
    # + return - successful operation 
    remote isolated function addWorkflow(AddWorkflowRequest payload) returns http:Response|error {
        string resourcePath = string `/workflows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Set a property on a workflow
    #
    # + payload - Set Workflow body 
    # + return - Successful update operation 
    remote isolated function setWorkflow(SetWorkflowRequest payload) returns http:Response|error {
        string resourcePath = string `/workflows/set`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update an workflow
    #
    # + workflow - ID of the workflow 
    # + payload - Workflow body 
    # + return - Successful update operation 
    remote isolated function updateWorkflow(string workflow, AddWorkflowRequest payload) returns http:Response|error {
        string resourcePath = string `/workflows/${getEncodedUri(workflow)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a workflow
    #
    # + workflow - ID of the workflow 
    # + return - Successful delete operation 
    remote isolated function deleteWorkflow(string workflow) returns http:Response|error {
        string resourcePath = string `/workflows/${getEncodedUri(workflow)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all workspaces you have access to
    #
    # + return - successful operation 
    remote isolated function getAllWorkspaces() returns GetAllWorkspacesResponse|error {
        string resourcePath = string `/workspaces`;
        GetAllWorkspacesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Claim a Mailscript workspace
    #
    # + payload - request body 
    # + return - successful operation 
    remote isolated function addWorkspace(AddWorkspaceRequest payload) returns http:Response|error {
        string resourcePath = string `/workspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
