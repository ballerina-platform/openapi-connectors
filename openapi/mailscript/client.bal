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
import ballerina/url;
import ballerina/lang.'string;

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
    }
    # Get all actions for the user
    #
    # + return - Successful operation
    remote isolated function getAllActions() returns GetAllActionsResponse|error {
        string  path = string `/actions`;
        GetAllActionsResponse response = check self.clientEp-> get(path, targetType = GetAllActionsResponse);
        return response;
    }
    # Add an action
    #
    # + payload - Add action body
    # + return - Successful operation
    remote isolated function addAction(Body payload) returns AddActionResponse|error {
        string  path = string `/actions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddActionResponse response = check self.clientEp->post(path, request, targetType=AddActionResponse);
        return response;
    }
    # Update an action key
    #
    # + action - ID of action
    # + payload - Action body
    # + return - Successful update operation
    remote isolated function updateAction(string action, Body1 payload) returns Key|error {
        string  path = string `/actions/${action}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Key response = check self.clientEp->put(path, request, targetType=Key);
        return response;
    }
    # Delete an action
    #
    # + action - ID of the action
    # + return - Successful delete operation
    remote isolated function deleteAction(string action) returns http:Response|error {
        string  path = string `/actions/${action}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get all addresses you have access to
    #
    # + return - successful operation
    remote isolated function getAllAddresses() returns GetAllAddressesResponse|error {
        string  path = string `/addresses`;
        GetAllAddressesResponse response = check self.clientEp-> get(path, targetType = GetAllAddressesResponse);
        return response;
    }
    # Claim a new Mailscript address
    #
    # + payload - Address body
    # + return - successful operation
    remote isolated function addAddress(AddAddressRequest payload) returns http:Response|error {
        string  path = string `/addresses`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete a mailscript address
    #
    # + address - ID of address
    # + return - successful delete operation
    remote isolated function deleteAddress(string address) returns http:Response|error {
        string  path = string `/addresses/${address}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List address keys
    #
    # + address - ID of address
    # + return - successful operation
    remote isolated function getAllKeys(string address) returns GetAllKeysResponse|error {
        string  path = string `/addresses/${address}/keys`;
        GetAllKeysResponse response = check self.clientEp-> get(path, targetType = GetAllKeysResponse);
        return response;
    }
    # Add address key
    #
    # + address - ID of address
    # + payload - Key body
    # + return - successful operation
    remote isolated function addKey(string address, AddKeyRequest payload) returns AddKeyResponse|error {
        string  path = string `/addresses/${address}/keys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddKeyResponse response = check self.clientEp->post(path, request, targetType=AddKeyResponse);
        return response;
    }
    # Get address key
    #
    # + address - ID of address
    # + 'key - ID of key
    # + return - successful operation
    remote isolated function getKey(string address, string 'key) returns Key|error {
        string  path = string `/addresses/${address}/'keys/${'key}`;
        Key response = check self.clientEp-> get(path, targetType = Key);
        return response;
    }
    # Update an address key
    #
    # + address - ID of address
    # + 'key - ID of key
    # + payload - Key body
    # + return - Successful operation
    remote isolated function updateKey(string address, string 'key, UpdateKeyRequest payload) returns Key|error {
        string  path = string `/addresses/${address}/'keys/${'key}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Key response = check self.clientEp->put(path, request, targetType=Key);
        return response;
    }
    # Delete address key
    #
    # + address - ID of address
    # + 'key - ID of key
    # + return - Successful delete operation
    remote isolated function deleteKey(string address, string 'key) returns http:Response|error {
        string  path = string `/addresses/${address}/'keys/${'key}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get a token for opening a daemon connection
    #
    # + daemon - name of Daemon
    # + return - Successful get operation
    remote isolated function getDaemonToken(string daemon) returns InlineResponse200|error {
        string  path = string `/daemons/${daemon}/token`;
        InlineResponse200 response = check self.clientEp-> get(path, targetType = InlineResponse200);
        return response;
    }
    # Get all domains you have access to
    #
    # + return - successful operation
    remote isolated function getAllDomains() returns GetAllDomainsResponse|error {
        string  path = string `/domains`;
        GetAllDomainsResponse response = check self.clientEp-> get(path, targetType = GetAllDomainsResponse);
        return response;
    }
    # Claim a new Domain
    #
    # + payload - Domain body
    # + return - successful operation
    remote isolated function addDomain(AddDomainRequest payload) returns DomainResponse|error {
        string  path = string `/domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DomainResponse response = check self.clientEp->post(path, request, targetType=DomainResponse);
        return response;
    }
    # Get domain verification
    #
    # + domain - Full Top-level domain name
    # + return - successful operation
    remote isolated function getDomainVerify(string domain) returns DomainResponse|error {
        string  path = string `/domains/verify/${domain}`;
        DomainResponse response = check self.clientEp-> get(path, targetType = DomainResponse);
        return response;
    }
    # Check a new Domain
    #
    # + domain - Full Top-level domain name
    # + return - successful operation
    remote isolated function checkDomainVerify(string domain) returns CheckDomainVerify|error {
        string  path = string `/domains/verify/${domain}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CheckDomainVerify response = check self.clientEp-> post(path, request, targetType = CheckDomainVerify);
        return response;
    }
    # Remove a domain
    #
    # + domain - Full Top-level domain name
    # + return - successful operation
    remote isolated function removeDomainVerify(string domain) returns http:Response|error {
        string  path = string `/domains/${domain}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get all inputs you have access to
    #
    # + name - Name
    # + return - successful operation
    remote isolated function getAllInputs(string? name = ()) returns GetAllInputsResponse|error {
        string  path = string `/inputs`;
        map<anydata> queryParam = {"name": name};
        path = path + check getPathForQueryParam(queryParam);
        GetAllInputsResponse response = check self.clientEp-> get(path, targetType = GetAllInputsResponse);
        return response;
    }
    # Get all integrations for the user
    #
    # + return - Successful operation
    remote isolated function getAllIntegrations() returns GetAllIntegrationsResponse|error {
        string  path = string `/integrations`;
        GetAllIntegrationsResponse response = check self.clientEp-> get(path, targetType = GetAllIntegrationsResponse);
        return response;
    }
    # Delete an integration
    #
    # + integration - ID of the integration
    # + return - Successful delete operation
    remote isolated function deleteIntegration(string integration) returns http:Response|error {
        string  path = string `/integrations/${integration}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Send an email
    #
    # + payload - request body
    # + return - successful operation
    remote isolated function send(SendRequest payload) returns http:Response|error {
        string  path = string `/send`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get all triggers you have access to
    #
    # + return - successful operation
    remote isolated function getAllTriggers() returns GetAllTriggersResponse|error {
        string  path = string `/triggers`;
        GetAllTriggersResponse response = check self.clientEp-> get(path, targetType = GetAllTriggersResponse);
        return response;
    }
    # Setup a trigger
    #
    # + payload - Trigger body
    # + return - successful add operation
    remote isolated function addTrigger(AddTriggerRequest payload) returns AddTriggerResponse|error {
        string  path = string `/triggers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddTriggerResponse response = check self.clientEp->post(path, request, targetType=AddTriggerResponse);
        return response;
    }
    # Update a trigger
    #
    # + trigger - ID of the trigger
    # + payload - Trigger body
    # + return - Successful update operation
    remote isolated function updateTrigger(string trigger, AddTriggerRequest payload) returns http:Response|error {
        string  path = string `/triggers/${trigger}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a trigger
    #
    # + trigger - ID of the trigger
    # + return - Successful delete operation
    remote isolated function deleteTrigger(string trigger) returns http:Response|error {
        string  path = string `/triggers/${trigger}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get the authenticated user
    #
    # + return - successful operation
    remote isolated function getAuthenticatedUser() returns User|error {
        string  path = string `/user`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Update a user
    #
    # + payload - User body
    # + return - Successful update operation
    remote isolated function updateUser(UpdateUserRequest payload) returns http:Response|error {
        string  path = string `/user`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get all verificats for the user
    #
    # + return - Successful operation
    remote isolated function getAllVerifications() returns GetAllVerificationsResponse|error {
        string  path = string `/verifications`;
        GetAllVerificationsResponse response = check self.clientEp-> get(path, targetType = GetAllVerificationsResponse);
        return response;
    }
    # Start verification process for external email address or sms number
    #
    # + payload - Key body
    # + return - Successful operation
    remote isolated function addVerification(Body2 payload) returns AddVerificationResponse|error {
        string  path = string `/verifications`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AddVerificationResponse response = check self.clientEp->post(path, request, targetType=AddVerificationResponse);
        return response;
    }
    # Verify an email address or sms number with a code
    #
    # + verification - ID of the verification entry
    # + payload - Verify action body
    # + return - Successful operation
    remote isolated function verify(string verification, Body3 payload) returns http:Response|error {
        string  path = string `/verifications/${verification}/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Get all workflows you have access to
    #
    # + return - successful operation
    remote isolated function getAllWorkflows() returns GetAllWorkflowsResponse|error {
        string  path = string `/workflows`;
        GetAllWorkflowsResponse response = check self.clientEp-> get(path, targetType = GetAllWorkflowsResponse);
        return response;
    }
    # Setup workflow
    #
    # + payload - Workflow body
    # + return - successful operation
    remote isolated function addWorkflow(AddWorkflowRequest payload) returns http:Response|error {
        string  path = string `/workflows`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Set a property on a workflow
    #
    # + payload - Set Workflow body
    # + return - Successful update operation
    remote isolated function setWorkflow(SetWorkflowRequest payload) returns http:Response|error {
        string  path = string `/workflows/set`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Update an workflow
    #
    # + workflow - ID of the workflow
    # + payload - Workflow body
    # + return - Successful update operation
    remote isolated function updateWorkflow(string workflow, AddWorkflowRequest payload) returns http:Response|error {
        string  path = string `/workflows/${workflow}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete a workflow
    #
    # + workflow - ID of the workflow
    # + return - Successful delete operation
    remote isolated function deleteWorkflow(string workflow) returns http:Response|error {
        string  path = string `/workflows/${workflow}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Get all workspaces you have access to
    #
    # + return - successful operation
    remote isolated function getAllWorkspaces() returns GetAllWorkspacesResponse|error {
        string  path = string `/workspaces`;
        GetAllWorkspacesResponse response = check self.clientEp-> get(path, targetType = GetAllWorkspacesResponse);
        return response;
    }
    # Claim a Mailscript workspace
    #
    # + payload - request body
    # + return - successful operation
    remote isolated function addWorkspace(AddWorkspaceRequest payload) returns http:Response|error {
        string  path = string `/workspaces`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
