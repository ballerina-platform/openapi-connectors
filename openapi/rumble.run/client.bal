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

# This is a generated connector for [Rumble API v1](https://www.rumble.run/docs/) OpenAPI specification.
# The Rumble API provides the capability to scan your IT and OT environments to provide a foundation for your asset inventory, attack surface reduction, and incident response programs.
@display {label: "Rumble Run", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Rumble account](https://console.rumble.run/register) and obtain tokens by following [this guide](https://www.rumble.run/docs/organization-api/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://console.rumble.run/api/v1.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get all agents across all organizations
    #
    # + search - an optional search string for filtering results 
    # + return - array of tasks 
    remote isolated function getAccountAgents(string? search = ()) returns Agent[]|error {
        string resourcePath = string `/account/agents`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Agent[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all account credentials
    #
    # + search - an optional search string for filtering results 
    # + return - array of credentials 
    remote isolated function getAccountCredentials(string? search = ()) returns Credential[]|error {
        string resourcePath = string `/account/credentials`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Credential[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new credential
    #
    # + payload - credential parameters 
    # + return - credential details 
    remote isolated function createAccountCredential(CredentialOptions payload) returns Credential|error {
        string resourcePath = string `/account/credentials`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Credential response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get credential details
    #
    # + credentialId - UUID of the credential to retrieve 
    # + return - credential details 
    remote isolated function getAccountCredential(string credentialId) returns Credential|error {
        string resourcePath = string `/account/credentials/${getEncodedUri(credentialId)}`;
        Credential response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove this credential
    #
    # + credentialId - UUID of the credential to delete 
    # + return - empty response 
    remote isolated function removeAccountCredential(string credentialId) returns http:Response|error {
        string resourcePath = string `/account/credentials/${getEncodedUri(credentialId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # System event log as JSON
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered event results 
    remote isolated function exportEventsJSON(string? search = (), string? fields = ()) returns Event[]|error {
        string resourcePath = string `/account/events.json`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Event[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # System event log as JSON line-delimited
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered event results 
    remote isolated function exportEventsJSONL(string? search = (), string? fields = ()) returns Event[]|error {
        string resourcePath = string `/account/events.jsonl`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Event[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all active API keys
    #
    # + return - array of keys 
    remote isolated function getAccountKeys() returns APIKey[]|error {
        string resourcePath = string `/account/keys`;
        APIKey[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new key
    #
    # + payload - key parameters 
    # + return - key details 
    remote isolated function createAccountKey(APIKeyOptions payload) returns APIKey|error {
        string resourcePath = string `/account/keys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        APIKey response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get key details
    #
    # + keyId - UUID of the key to retrieve 
    # + return - Automatically created 
    remote isolated function getAccountKey(string keyId) returns APIKey|error {
        string resourcePath = string `/account/keys/${getEncodedUri(keyId)}`;
        APIKey response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove this key
    #
    # + keyId - UUID of the key to retrieve 
    # + return - empty response 
    remote isolated function removeAccountKey(string keyId) returns http:Response|error {
        string resourcePath = string `/account/keys/${getEncodedUri(keyId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Rotates the key secret
    #
    # + keyId - UUID of the key to retrieve 
    # + return - key details 
    remote isolated function rotateAccountKey(string keyId) returns APIKey|error {
        string resourcePath = string `/account/keys/${getEncodedUri(keyId)}/rotate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        APIKey response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Get license details
    #
    # + return - Automatically created 
    remote isolated function getAccountLicense() returns License|error {
        string resourcePath = string `/account/license`;
        License response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all organization details
    #
    # + search - an optional search string for filtering results 
    # + return - array of organizations 
    remote isolated function getAccountOrganizations(string? search = ()) returns Organization[]|error {
        string resourcePath = string `/account/orgs`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Organization[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new organization
    #
    # + payload - organization definition 
    # + return - organization details 
    remote isolated function createAccountOrganization(OrgOptions payload) returns Organization|error {
        string resourcePath = string `/account/orgs`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get organization details
    #
    # + orgId - UUID of the organization to retrieve 
    # + return - Automatically created 
    remote isolated function getAccountOrganization(string orgId) returns Organization|error {
        string resourcePath = string `/account/orgs/${getEncodedUri(orgId)}`;
        Organization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove this organization
    #
    # + orgId - UUID of the organization to retrieve 
    # + return - empty response 
    remote isolated function removeAccountOrganization(string orgId) returns http:Response|error {
        string resourcePath = string `/account/orgs/${getEncodedUri(orgId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update organization details
    #
    # + orgId - UUID of the organization to retrieve 
    # + payload - organization options 
    # + return - organization details 
    remote isolated function updateAccountOrganization(string orgId, OrgOptions payload) returns Organization|error {
        string resourcePath = string `/account/orgs/${getEncodedUri(orgId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Removes the export token from the specified organization
    #
    # + orgId - UUID of the organization to retrieve 
    # + return - empty response 
    remote isolated function deleteAccountOrganizationExportToken(string orgId) returns http:Response|error {
        string resourcePath = string `/account/orgs/${getEncodedUri(orgId)}/exportToken`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Rotates the organization export token and returns the updated organization
    #
    # + orgId - UUID of the organization to retrieve 
    # + return - organization details 
    remote isolated function rotateAccountOrganizationExportToken(string orgId) returns Organization|error {
        string resourcePath = string `/account/orgs/${getEncodedUri(orgId)}/exportToken/rotate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Organization response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Get all sites details across all organizations
    #
    # + search - an optional search string for filtering results 
    # + return - array of sites 
    remote isolated function getAccountSites(string? search = ()) returns Site[]|error {
        string resourcePath = string `/account/sites`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Site[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all task details across all organizations (up to 1000)
    #
    # + search - an optional search string for filtering results 
    # + return - array of tasks 
    remote isolated function getAccountTasks(string? search = ()) returns Task[]|error {
        string resourcePath = string `/account/tasks`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Task[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get all users
    #
    # + return - array of users 
    remote isolated function getAccountUsers() returns User[]|error {
        string resourcePath = string `/account/users`;
        User[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new user account
    #
    # + payload - user parameters 
    # + return - key details 
    remote isolated function createAccountUser(UserOptions payload) returns User|error {
        string resourcePath = string `/account/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a new user account and send an email invite
    #
    # + payload - user invite parameters 
    # + return - key details 
    remote isolated function createAccountUserInvite(UserInviteOptions payload) returns User|error {
        string resourcePath = string `/account/users/invite`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get user details
    #
    # + userId - UUID of the user to retrieve 
    # + return - Automatically created 
    remote isolated function getAccountUser(string userId) returns User|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}`;
        User response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove this user
    #
    # + userId - UUID of the user to delete 
    # + return - empty response 
    remote isolated function removeAccountUser(string userId) returns http:Response|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a user's details
    #
    # + userId - UUID of the user to retrieve 
    # + payload - user parameters 
    # + return - Automatically created 
    remote isolated function updateAccountUser(string userId, UserOptions payload) returns User|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        User response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Resets the user's lockout status
    #
    # + userId - UUID of the user to retrieve 
    # + return - Automatically created 
    remote isolated function resetAccountUserLockout(string userId) returns User|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}/resetLockout`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Resets the user's MFA tokens
    #
    # + userId - UUID of the user to retrieve 
    # + return - Automatically created 
    remote isolated function resetAccountUserMFA(string userId) returns User|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}/resetMFA`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Sends the user a password reset email
    #
    # + userId - UUID of the user to retrieve 
    # + return - Automatically created 
    remote isolated function resetAccountUserPassword(string userId) returns User|error {
        string resourcePath = string `/account/users/${getEncodedUri(userId)}/resetPassword`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Cisco serial number and model name export for Cisco Smart Net Total Care Service.
    #
    # + search - an optional search string for filtering results 
    # + return - filtered asset results 
    remote isolated function exportAssetsCiscoCSV(string? search = ()) returns string|error {
        string resourcePath = string `/export/org/assets.cisco.csv`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Asset inventory as CSV
    #
    # + search - an optional search string for filtering results 
    # + return - filtered asset results 
    remote isolated function exportAssetsCSV(string? search = ()) returns string|error {
        string resourcePath = string `/export/org/assets.csv`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the asset inventory
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered asset results 
    remote isolated function exportAssetsJSON(string? search = (), string? fields = ()) returns Asset[]|error {
        string resourcePath = string `/export/org/assets.json`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Asset[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Asset inventory as JSON line-delimited
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered asset results 
    remote isolated function exportAssetsJSONL(string? search = (), string? fields = ()) returns string|error {
        string resourcePath = string `/export/org/assets.jsonl`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Asset inventory as Nmap-style XML
    #
    # + search - an optional search string for filtering results 
    # + return - filtered asset results 
    remote isolated function exportAssetsNmapXML(string? search = ()) returns string|error {
        string resourcePath = string `/export/org/assets.nmap.xml`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Export an asset inventory as CSV for ServiceNow integration
    #
    # + return - asset export 
    remote isolated function snowExportAssetsCSV() returns string|error {
        string resourcePath = string `/export/org/assets.servicenow.csv`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the asset inventory as JSON
    #
    # + return - filtered asset results 
    remote isolated function snowExportAssetsJSON() returns AssetServiceNow[]|error {
        string resourcePath = string `/export/org/assets.servicenow.json`;
        AssetServiceNow[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the asset inventory in a sync-friendly manner using created_at as a checkpoint. Requires the Splunk entitlement.
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + since - an optional unix timestamp to use as a checkpoint 
    # + return - filtered asset results with a checkpoint wrapper 
    remote isolated function splunkAssetSyncCreatedJSON(string? search = (), string? fields = (), int? since = ()) returns AssetsWithCheckpoint|error {
        string resourcePath = string `/export/org/assets/sync/created/assets.json`;
        map<anydata> queryParam = {"search": search, "fields": fields, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AssetsWithCheckpoint response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Exports the asset inventory in a sync-friendly manner using updated_at as a checkpoint. Requires the Splunk entitlement.
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + since - an optional unix timestamp to use as a checkpoint 
    # + return - filtered asset results with a checkpoint wrapper 
    remote isolated function splunkAssetSyncUpdatedJSON(string? search = (), string? fields = (), int? since = ()) returns AssetsWithCheckpoint|error {
        string resourcePath = string `/export/org/assets/sync/updated/assets.json`;
        map<anydata> queryParam = {"search": search, "fields": fields, "since": since};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AssetsWithCheckpoint response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Service inventory as CSV
    #
    # + search - an optional search string for filtering results 
    # + return - filtered service results 
    remote isolated function exportServicesCSV(string? search = ()) returns string|error {
        string resourcePath = string `/export/org/services.csv`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Service inventory as JSON
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered service results 
    remote isolated function exportServicesJSON(string? search = (), string? fields = ()) returns Service[]|error {
        string resourcePath = string `/export/org/services.json`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Service[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Service inventory as JSON line-delimited
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered service results 
    remote isolated function exportServicesJSONL(string? search = (), string? fields = ()) returns string|error {
        string resourcePath = string `/export/org/services.jsonl`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Export a service inventory as CSV for ServiceNow integration
    #
    # + return - services export 
    remote isolated function snowExportServicesCSV() returns string|error {
        string resourcePath = string `/export/org/services.servicenow.csv`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Site list as CSV
    #
    # + return - all sites 
    remote isolated function exportSitesCSV() returns string|error {
        string resourcePath = string `/export/org/sites.csv`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Export all sites
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - all sites 
    remote isolated function exportSitesJSON(string? search = (), string? fields = ()) returns Site[]|error {
        string resourcePath = string `/export/org/sites.json`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Site[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Site list as JSON line-delimited
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - all sites 
    remote isolated function exportSitesJSONL(string? search = (), string? fields = ()) returns string|error {
        string resourcePath = string `/export/org/sites.jsonl`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Wireless inventory as CSV
    #
    # + search - an optional search string for filtering results 
    # + return - filtered wireless results 
    remote isolated function exportWirelessCSV(string? search = ()) returns string|error {
        string resourcePath = string `/export/org/wireless.csv`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Wireless inventory as JSON
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered wireless results 
    remote isolated function exportWirelessJSON(string? search = (), string? fields = ()) returns Wireless[]|error {
        string resourcePath = string `/export/org/wireless.json`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Wireless[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Wireless inventory as JSON line-delimited
    #
    # + search - an optional search string for filtering results 
    # + fields - an optional list of fields to export, comma-separated 
    # + return - filtered wireless results 
    remote isolated function exportWirelessJSONL(string? search = (), string? fields = ()) returns string|error {
        string resourcePath = string `/export/org/wireless.jsonl`;
        map<anydata> queryParam = {"search": search, "fields": fields};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get organization details
    #
    # + return - organization details 
    remote isolated function getOrganization() returns Organization|error {
        string resourcePath = string `/org`;
        Organization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update organization details
    #
    # + payload - organization options 
    # + return - organization details 
    remote isolated function updateOrganization(OrgOptions payload) returns Organization|error {
        string resourcePath = string `/org`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get all agents
    #
    # + return - array of agents 
    remote isolated function getAgents() returns Agent[]|error {
        string resourcePath = string `/org/agents`;
        Agent[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get details for a single agent
    #
    # + agentId - UUID of the agent 
    # + return - agent details 
    remote isolated function getAgent(string agentId) returns Agent|error {
        string resourcePath = string `/org/agents/${getEncodedUri(agentId)}`;
        Agent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove and uninstall an agent
    #
    # + agentId - UUID of the agent to remove 
    # + return - empty response 
    remote isolated function removeAgent(string agentId) returns http:Response|error {
        string resourcePath = string `/org/agents/${getEncodedUri(agentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update the site associated with agent
    #
    # + agentId - UUID of the agent to update 
    # + payload - site_id to associate with the agent 
    # + return - agent details 
    remote isolated function updateAgentSite(string agentId, AgentSiteID payload) returns Agent|error {
        string resourcePath = string `/org/agents/${getEncodedUri(agentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Agent response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Force an agent to update and restart
    #
    # + agentId - UUID of the agent to update 
    # + return - empty response 
    remote isolated function upgradeAgent(string agentId) returns http:Response|error {
        string resourcePath = string `/org/agents/${getEncodedUri(agentId)}/update`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get all assets
    #
    # + search - an optional search string for filtering results 
    # + return - array of assets 
    remote isolated function getAssets(string? search = ()) returns Asset[]|error {
        string resourcePath = string `/org/assets`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Asset[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get asset details
    #
    # + assetId - UUID of the asset to retrieve 
    # + return - asset details 
    remote isolated function getAsset(string assetId) returns Asset|error {
        string resourcePath = string `/org/assets/${getEncodedUri(assetId)}`;
        Asset response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove an asset
    #
    # + assetId - UUID of the asset to remove 
    # + return - empty response 
    remote isolated function removeAsset(string assetId) returns http:Response|error {
        string resourcePath = string `/org/assets/${getEncodedUri(assetId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update asset comments
    #
    # + assetId - UUID of the asset to update 
    # + payload - comments to apply to the asset 
    # + return - asset details 
    remote isolated function updateAssetComments(string assetId, AssetComments payload) returns Asset|error {
        string resourcePath = string `/org/assets/${getEncodedUri(assetId)}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Asset response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Update asset tags
    #
    # + assetId - UUID of the agent to update 
    # + payload - tags to apply to the asset 
    # + return - asset details 
    remote isolated function updateAssetTags(string assetId, AssetTags payload) returns Asset|error {
        string resourcePath = string `/org/assets/${getEncodedUri(assetId)}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Asset response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get API key details
    #
    # + return - api key details 
    remote isolated function getKey() returns APIKey|error {
        string resourcePath = string `/org/key`;
        APIKey response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove the current API key
    #
    # + return - empty response 
    remote isolated function removeKey() returns http:Response|error {
        string resourcePath = string `/org/key`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Rotate the API key secret and return the updated key
    #
    # + return - api key details 
    remote isolated function rotateKey() returns APIKey|error {
        string resourcePath = string `/org/key/rotate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        APIKey response = check self.clientEp-> patch(resourcePath, request);
        return response;
    }
    # Get all services
    #
    # + search - an optional search string for filtering results 
    # + return - array of services 
    remote isolated function getServices(string? search = ()) returns Service[]|error {
        string resourcePath = string `/org/services`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Service[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get service details
    #
    # + serviceId - UUID of the service to retrieve 
    # + return - service details 
    remote isolated function getService(string serviceId) returns Service|error {
        string resourcePath = string `/org/services/${getEncodedUri(serviceId)}`;
        Service response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove a service
    #
    # + serviceId - UUID of the service to remove 
    # + return - empty response 
    remote isolated function removeService(string serviceId) returns http:Response|error {
        string resourcePath = string `/org/services/${getEncodedUri(serviceId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get all sites
    #
    # + return - array of sites 
    remote isolated function getSites() returns Site[]|error {
        string resourcePath = string `/org/sites`;
        Site[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new site
    #
    # + payload - site definition 
    # + return - site details 
    remote isolated function createSite(SiteOptions payload) returns Site|error {
        string resourcePath = string `/org/sites`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Site response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get site details
    #
    # + siteId - UUID or name of the site 
    # + return - site details 
    remote isolated function getSite(string siteId) returns Site|error {
        string resourcePath = string `/org/sites/${getEncodedUri(siteId)}`;
        Site response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove a site and associated assets
    #
    # + siteId - UUID or name of the site to remove 
    # + return - empty response 
    remote isolated function removeSite(string siteId) returns http:Response|error {
        string resourcePath = string `/org/sites/${getEncodedUri(siteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a site definition
    #
    # + siteId - UUID or name of the site to update 
    # + payload - site object 
    # + return - site details 
    remote isolated function updateSite(string siteId, SiteOptions payload) returns Site|error {
        string resourcePath = string `/org/sites/${getEncodedUri(siteId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Site response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Import a scan data file into a site
    #
    # + siteId - UUID or name of the site to import scan data into 
    # + payload - Data 
    # + return - import task 
    remote isolated function importScanData(string siteId, byte[] payload) returns Task|error {
        string resourcePath = string `/org/sites/${getEncodedUri(siteId)}/import`;
        http:Request request = new;
        request.setPayload(payload, "application/octet-stream");
        Task response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Create a scan task for a given site
    #
    # + siteId - UUID or name of the site to scan 
    # + payload - Scan options 
    # + return - a created scan task 
    remote isolated function createScan(string siteId, ScanOptions payload) returns Task|error {
        string resourcePath = string `/org/sites/${getEncodedUri(siteId)}/scan`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "text/json");
        Task response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Get all tasks (last 1000)
    #
    # + status - an optional status string for filtering results 
    # + search - an optional search string for filtering results 
    # + return - array of tasks 
    remote isolated function getTasks(string? status = (), string? search = ()) returns Task[]|error {
        string resourcePath = string `/org/tasks`;
        map<anydata> queryParam = {"status": status, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Task[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get task details
    #
    # + taskId - UUID of the task to retrieve 
    # + return - task details 
    remote isolated function getTask(string taskId) returns Task|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}`;
        Task response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update task parameters
    #
    # + taskId - UUID of the task to update 
    # + payload - task object 
    # + return - task details 
    remote isolated function updateTask(string taskId, Task payload) returns Task|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Task response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Returns a temporary task change report data url
    #
    # + taskId - UUID of the task 
    # + return - Automatically created 
    remote isolated function getTaskChangeReport(string taskId) returns URL|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}/changes`;
        URL response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a temporary task scan data url
    #
    # + taskId - UUID of the task 
    # + return - Automatically created 
    remote isolated function getTaskScanData(string taskId) returns URL|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}/data`;
        URL response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Signal that a completed task should be hidden
    #
    # + taskId - UUID of the task to hide 
    # + return - Automatically created 
    remote isolated function hideTask(string taskId) returns Task|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}/hide`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Task response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Signal that a task should be stopped or canceledThis will also remove recurring and scheduled tasks
    #
    # + taskId - UUID of the task to stop 
    # + return - Automatically created 
    remote isolated function stopTask(string taskId) returns Task|error {
        string resourcePath = string `/org/tasks/${getEncodedUri(taskId)}/stop`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Task response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get all wireless LANs
    #
    # + search - an optional search string for filtering results 
    # + return - array of wireless LANs 
    remote isolated function getWirelessLANs(string? search = ()) returns Wireless[]|error {
        string resourcePath = string `/org/wireless`;
        map<anydata> queryParam = {"search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Wireless[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get wireless LAN details
    #
    # + wirelessId - UUID of the wireless LAN to retrieve 
    # + return - wireless details 
    remote isolated function getWirelessLAN(string wirelessId) returns Wireless|error {
        string resourcePath = string `/org/wirelesss/${getEncodedUri(wirelessId)}`;
        Wireless response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove a wireless LAN
    #
    # + wirelessId - UUID of the wireless LAN to remove 
    # + return - empty response 
    remote isolated function removeWirelessLAN(string wirelessId) returns http:Response|error {
        string resourcePath = string `/org/wirelesss/${getEncodedUri(wirelessId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns latest agent version
    #
    # + return - component version 
    remote isolated function getLatestAgentVersion() returns ComponentVersion|error {
        string resourcePath = string `/releases/agent/version`;
        ComponentVersion response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns latest platform version
    #
    # + return - component version 
    remote isolated function getLatestPlatformVersion() returns ComponentVersion|error {
        string resourcePath = string `/releases/platform/version`;
        ComponentVersion response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns latest scanner version
    #
    # + return - component version 
    remote isolated function getLatestScannerVersion() returns ComponentVersion|error {
        string resourcePath = string `/releases/scanner/version`;
        ComponentVersion response = check self.clientEp->get(resourcePath);
        return response;
    }
}
