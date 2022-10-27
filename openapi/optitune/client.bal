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
import ballerina/mime;

# This is a generated connector for [OptiTune API v1](https://manage.opti-tune.com/help/site/articles/api/default.html) OpenAPI specification.
# A complete API for interacting with all objects on an OptiTune Management Server
@display {label: "OptiTune", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [OptiTune account](https://manage.opti-tune.com) and obtain tokens by following [this guide](https://manage.opti-tune.com/help/site/articles/api/default.html#authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://manage.opti-tune.com/") returns error? {
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
    # Gets the logged in user account
    #
    # + return - OK 
    remote isolated function getMyAccounts() returns Account|error {
        string resourcePath = string `/api/v1/Accounts/Me`;
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all accounts in the organization
    #
    # + return - OK 
    remote isolated function getAllAccounts() returns Account[]|error {
        string resourcePath = string `/api/v1/Accounts`;
        Account[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new account
    #
    # + payload - The account to add 
    # + return - OK 
    remote isolated function postAccounts(Account payload) returns Account|error {
        string resourcePath = string `/api/v1/Accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a single account in the organization, given an account ID
    #
    # + id - Account ID 
    # + return - OK 
    remote isolated function getAccounts(string id) returns Account|error {
        string resourcePath = string `/api/v1/Accounts/${getEncodedUri(id)}`;
        Account response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing account
    #
    # + id - The id of the Account 
    # + payload - The Account data 
    # + return - OK 
    remote isolated function putAccounts(string id, Account payload) returns Account|error {
        string resourcePath = string `/api/v1/Accounts/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Account response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing account
    #
    # + id - Account ID 
    # + return - OK 
    remote isolated function deleteAccounts(string id) returns json|error {
        string resourcePath = string `/api/v1/Accounts/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the advanced settings for an organization
    #
    # + return - OK 
    remote isolated function getAdvancedSettings() returns AdvancedSettings|error {
        string resourcePath = string `/api/v1/AdvancedSettings`;
        AdvancedSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates advanced settings for the organization
    #
    # + payload - AdvancedSettings data 
    # + return - OK 
    remote isolated function putAdvancedSettings(AdvancedSettings payload) returns AdvancedSettings|error {
        string resourcePath = string `/api/v1/AdvancedSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AdvancedSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets the OptiTune agent configuration for a given computer id, in XML format
    #
    # + computerid - computer ID 
    # + return - OK 
    remote isolated function getAgentConfig(string computerid) returns json|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/AgentConfig`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all agent installers in the organization
    #
    # + return - OK 
    remote isolated function agentinstallersGetall() returns AgentInstaller[]|error {
        string resourcePath = string `/api/v1/AgentInstallers`;
        AgentInstaller[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new agent installer.  Upload the files specifying local storage first, and then 
    # specify the file IDs in the agent installer here
    #
    # + payload - AgentInstaller data 
    # + return - OK 
    remote isolated function postAgentInstallers(AgentInstaller payload) returns AgentInstaller|error {
        string resourcePath = string `/api/v1/AgentInstallers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AgentInstaller response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a single agent installer in the organization, given an agent installer ID
    #
    # + id - Agent installer ID 
    # + return - OK 
    remote isolated function getAgentInstallers(string id) returns AgentInstaller|error {
        string resourcePath = string `/api/v1/AgentInstallers/${getEncodedUri(id)}`;
        AgentInstaller response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing agent installer
    #
    # + id - Agent installer ID 
    # + return - OK 
    remote isolated function deleteAgentInstallers(string id) returns json|error {
        string resourcePath = string `/api/v1/AgentInstallers/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the state of a single OptiTune agent, given a computer ID.  The state will frequently change as the agent performs its duties.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getAgentStateAgentStatus(string computerid) returns AgentState|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/AgentState`;
        AgentState response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the connection status for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getConnectionStateAgentStatus(string computerid) returns ConnectionStatusInfo|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/ConnectionState`;
        ConnectionStatusInfo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a single alert instance, given an alert instance ID
    #
    # + id - Alert instance ID 
    # + return - OK 
    remote isolated function getAlertInstances(string id) returns AlertInstance|error {
        string resourcePath = string `/api/v1/AlertInstances/${getEncodedUri(id)}`;
        AlertInstance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing alert instance
    #
    # + id - Alert instance ID 
    # + return - OK 
    remote isolated function deleteAlertInstances(string id) returns json|error {
        string resourcePath = string `/api/v1/AlertInstances/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all alert instances that fall into a given page range.
    #
    # + pageNumber - Page Number 
    # + pageSize - Page Size 
    # + return - OK 
    remote isolated function getAllAlertInstances(int? pageNumber = (), int? pageSize = ()) returns AlertInstance[]|error {
        string resourcePath = string `/api/v1/AlertInstances`;
        map<anydata> queryParam = {"page.number": pageNumber, "page.size": pageSize};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AlertInstance[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates only the status for a given alert instance
    #
    # + payload - AlertInstance data 
    # + return - OK 
    remote isolated function patchAlertInstances(AlertInstance payload) returns AlertInstance|error {
        string resourcePath = string `/api/v1/AlertInstances`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AlertInstance response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets all alert subscriptions in the organization
    #
    # + return - OK 
    remote isolated function getAllAlertSubscriptions() returns AlertSubscription[]|error {
        string resourcePath = string `/api/v1/AlertSubscriptions`;
        AlertSubscription[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new alert subscription
    #
    # + payload - AlertSubscription data 
    # + return - OK 
    remote isolated function postAlertSubscriptions(AlertSubscription payload) returns AlertSubscription|error {
        string resourcePath = string `/api/v1/AlertSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AlertSubscription response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a alert subscription by ID
    #
    # + id - Alert subscription ID 
    # + return - OK 
    remote isolated function getAlertSubscriptions(string id) returns AlertSubscription|error {
        string resourcePath = string `/api/v1/AlertSubscriptions/${getEncodedUri(id)}`;
        AlertSubscription response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing alert subscription, using a given ID
    #
    # + id - Alert subscription ID 
    # + payload - AlertSubscription data 
    # + return - OK 
    remote isolated function putAlertSubscriptions(string id, AlertSubscription payload) returns AlertSubscription|error {
        string resourcePath = string `/api/v1/AlertSubscriptions/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AlertSubscription response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing alert subscription, given an ID
    #
    # + id - Alert subscription ID 
    # + return - OK 
    remote isolated function deleteAlertSubscriptions(string id) returns json|error {
        string resourcePath = string `/api/v1/AlertSubscriptions/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all announcements on the management server
    #
    # + return - OK 
    remote isolated function getAllAnnouncements() returns Announcement[]|error {
        string resourcePath = string `/api/v1/Announcements`;
        Announcement[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all applications installed on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getApplications(string computerid) returns Application[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Applications`;
        Application[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all audit log entries between optional start and end times, in UTC
    #
    # + startDateTime - An optional start time 
    # + endDateTime - An optional end time 
    # + return - OK 
    remote isolated function getByDateAuditLog(string? startDateTime = (), string? endDateTime = ()) returns AuditLogEntry[]|error {
        string resourcePath = string `/api/v1/AuditLog`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AuditLogEntry[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the cloudberry backup configuration for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getConfigBackupCloudberry(string computerid) returns BackupCloudberryComputerConfig|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/BackupCloudberryConfig`;
        BackupCloudberryComputerConfig response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the cloudberry backup plans for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getPlansBackupCloudberry(string computerid) returns BackupCloudberryComputerPlan[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/BackupCloudberryPlans`;
        BackupCloudberryComputerPlan[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the cloudberry backup plan history, for a given computer ID and plan ID
    #
    # + computerid - Computer ID 
    # + planid - Plan ID 
    # + return - OK 
    remote isolated function getPlanHistoryBackupCloudberry(string computerid, string planid) returns BackupCloudberryComputerPlanHistory[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/BackupCloudberryPlans/${getEncodedUri(planid)}/History`;
        BackupCloudberryComputerPlanHistory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all benchmark data points for a given computer.  Each benchmark data point will have an associated "benchmark" and "benchmark data set".
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getByComputerBenchmarkDataPoints(string computerid) returns BenchmarkDataPoint[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/BenchmarkDataPoints`;
        BenchmarkDataPoint[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Each benchmark for a particular computer may contain multiple data sets.  This returns all available data sets for the organization, across all computers.
    #
    # + return - OK 
    remote isolated function getAllBenchmarkDataSets() returns BenchmarkDataSet[]|error {
        string resourcePath = string `/api/v1/BenchmarkDataSets`;
        BenchmarkDataSet[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a particular benchmark data set given a benchmark data set id
    #
    # + id - Benchmark data set ID 
    # + return - OK 
    remote isolated function getBenchmarkDataSets(int id) returns BenchmarkDataSet|error {
        string resourcePath = string `/api/v1/BenchmarkDataSets/${getEncodedUri(id)}`;
        BenchmarkDataSet response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all available benchmarks for the organization.  Each benchmark is named for the corresponding performance counter, e.g. Name = "\Processor(_Total)\% Processor Time"
    #
    # + return - OK 
    remote isolated function getAllBenchmarks() returns Benchmark[]|error {
        string resourcePath = string `/api/v1/Benchmarks`;
        Benchmark[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a particular benchmark given a benchmark id
    #
    # + id - Benchmark ID 
    # + return - OK 
    remote isolated function getBenchmarks(int id) returns Benchmark|error {
        string resourcePath = string `/api/v1/Benchmarks/${getEncodedUri(id)}`;
        Benchmark response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all billing license usage data for the organization, between optional start and end dates (in UTC)
    #
    # + startDateTime - Start date 
    # + endDateTime - End date 
    # + return - OK 
    remote isolated function getByDateBillingLicenseUsage(string? startDateTime = (), string? endDateTime = ()) returns BillingLicenseUsage[]|error {
        string resourcePath = string `/api/v1/BillingLicenseUsage`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BillingLicenseUsage[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the billing settings for the current organization
    #
    # + return - OK 
    remote isolated function getBillingSettings() returns BillingSettings|error {
        string resourcePath = string `/api/v1/BillingSettings`;
        BillingSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates existing billing settings.  If you provide a valid billing token (from https://www.bravurasoftware.com/billing), the organization will use monthly billing for its license usage
    #
    # + payload - BillingSettings data 
    # + return - OK 
    remote isolated function putBillingSettings(BillingSettings payload) returns BillingSettings|error {
        string resourcePath = string `/api/v1/BillingSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BillingSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets all available root domains for branding.  When configuring a brand for your organization, you can pick between one or more root domains, e.g. "rmmportal.com"
    #
    # + return - OK 
    remote isolated function getAllBrandDomains() returns BrandDomain[]|error {
        string resourcePath = string `/api/v1/BrandDomains`;
        BrandDomain[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all brands in the organization
    #
    # + return - OK 
    remote isolated function getAllBrands() returns Brand[]|error {
        string resourcePath = string `/api/v1/Brands`;
        Brand[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new brand
    #
    # + payload - Brand data 
    # + return - OK 
    remote isolated function postBrands(Brand payload) returns Brand|error {
        string resourcePath = string `/api/v1/Brands`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Brand response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a brand by ID
    #
    # + id - Brand ID 
    # + return - OK 
    remote isolated function getBrands(string id) returns Brand|error {
        string resourcePath = string `/api/v1/Brands/${getEncodedUri(id)}`;
        Brand response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing brand
    #
    # + id - Brand ID 
    # + return - OK 
    remote isolated function deleteBrands(string id) returns json|error {
        string resourcePath = string `/api/v1/Brands/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all business entities in the organization
    #
    # + return - OK 
    remote isolated function getAllBusinessEntities() returns BusinessEntity[]|error {
        string resourcePath = string `/api/v1/BusinessEntities`;
        BusinessEntity[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new business entity
    #
    # + payload - BusinessEntity data 
    # + return - OK 
    remote isolated function postBusinessEntities(BusinessEntity payload) returns BusinessEntity|error {
        string resourcePath = string `/api/v1/BusinessEntities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BusinessEntity response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a business entity, based on the provided business entity ID
    #
    # + id - Business entity ID 
    # + return - OK 
    remote isolated function getBusinessEntities(string id) returns BusinessEntity|error {
        string resourcePath = string `/api/v1/BusinessEntities/${getEncodedUri(id)}`;
        BusinessEntity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing business entity.  You can also change the parent of the business entity by adjusting the ParentID value.
    #
    # + id - The id of the Business Entity 
    # + payload - The Business Entity data 
    # + return - OK 
    remote isolated function putBusinessEntities(string id, BusinessEntity payload) returns BusinessEntity|error {
        string resourcePath = string `/api/v1/BusinessEntities/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BusinessEntity response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing business entity
    #
    # + id - Business entity ID 
    # + return - OK 
    remote isolated function deleteBusinessEntities(string id) returns json|error {
        string resourcePath = string `/api/v1/BusinessEntities/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerDetails(string computerid) returns ComputerDetails|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Details`;
        ComputerDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the user provided display name for a given computer.  The display name typically entered in the computer details page,
    # and is independent of the normal computer name, as seen in Windows.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerDisplayName(string computerid) returns string|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/DisplayName`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or Updates the computer's user defined display name
    #
    # + computerid - Computer ID 
    # + payload - User defined display name 
    # + return - OK 
    remote isolated function putComputerDisplayName(string computerid, string payload) returns string|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/DisplayName`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        string response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes the display name for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteComputerDisplayName(string computerid) returns json|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/DisplayName`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets computer metadata for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerMetadata(string computerid) returns ComputerMetadata|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Metadata`;
        ComputerMetadata response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates Metadata for a single computer
    #
    # + computerid - Computer ID 
    # + payload - Computer Metadata 
    # + return - OK 
    remote isolated function putComputerMetadata(string computerid, ComputerMetadata payload) returns ComputerMetadata|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Metadata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ComputerMetadata response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes the metadata for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteComputerMetadata(string computerid) returns json|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Metadata`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates individual metadata fields for one computer.  The Patch method will update individual fields, whereas the Put 
    # method adds or updates the entire metadata for one computer.
    #
    # + computerid - Computer ID 
    # + payload - Computer metadata 
    # + return - OK 
    remote isolated function patchComputerMetadata(string computerid, ComputerMetadata payload) returns ComputerMetadata|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/Metadata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ComputerMetadata response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Gets all computer metadata values for all computers in the organization.  Note that not every computer will have metadata associated with it.
    #
    # + return - OK 
    remote isolated function getAllComputerMetadata() returns ComputerMetadata[]|error {
        string resourcePath = string `/api/v1/ComputerMetadata`;
        ComputerMetadata[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all computers in the organization
    #
    # + return - OK 
    remote isolated function getAllComputers() returns Computer[]|error {
        string resourcePath = string `/api/v1/Computers`;
        Computer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a computer by the computer's id
    #
    # + id - Computer ID 
    # + return - OK 
    remote isolated function getComputers(string id) returns Computer|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(id)}`;
        Computer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retires an existing computer, deleting all of its data in OptiTune.
    # Calling this method will add it to the list of retired computers.  The computer will
    # be blocked from accessing OptiTune until it is removed from the list of retired computers.
    #
    # + id - Computer ID 
    # + return - OK 
    remote isolated function deleteComputers(string id) returns json|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all deployment results for a given deployment ID
    #
    # + deploymentid - Deployment ID 
    # + return - OK 
    remote isolated function getDeploymentResults(string deploymentid) returns DeploymentResult[]|error {
        string resourcePath = string `/api/v1/Deployments/${getEncodedUri(deploymentid)}/Results`;
        DeploymentResult[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all deployments to a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getForGroupDeployments(string groupid) returns Deployment[]|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/Deployments`;
        Deployment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all deployments in the organization
    #
    # + return - OK 
    remote isolated function getAllDeployments() returns Deployment[]|error {
        string resourcePath = string `/api/v1/Deployments`;
        Deployment[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new deployment
    #
    # + payload - Deployment data 
    # + return - OK 
    remote isolated function postDeployments(Deployment payload) returns Deployment|error {
        string resourcePath = string `/api/v1/Deployments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Deployment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a deployment by ID
    #
    # + id - Deployment ID 
    # + return - OK 
    remote isolated function getDeployments(string id) returns Deployment|error {
        string resourcePath = string `/api/v1/Deployments/${getEncodedUri(id)}`;
        Deployment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing deployment
    #
    # + id - Deployment ID 
    # + return - OK 
    remote isolated function deleteDeployments(string id) returns json|error {
        string resourcePath = string `/api/v1/Deployments/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the endpoint protection information for a given computer, if available
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getEndpointProtection(string computerid) returns EndpointProtection|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/EndpointProtection`;
        EndpointProtection response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the endpoint protection settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getEndpointProtectionSettings(string groupid) returns EndpointProtectionSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/EndpointProtectionSettings`;
        EndpointProtectionSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates endpoint protection settings for a given group
    #
    # + groupid - Group ID 
    # + payload - EndpointProtectionSettings data 
    # + return - OK 
    remote isolated function putEndpointProtectionSettings(string groupid, EndpointProtectionSettings payload) returns EndpointProtectionSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/EndpointProtectionSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EndpointProtectionSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes existing endpoint protection settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteEndpointProtectionSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/EndpointProtectionSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all endpoint protection settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllEndpointProtectionSettings() returns EndpointProtectionSettings[]|error {
        string resourcePath = string `/api/v1/EndpointProtectionSettings`;
        EndpointProtectionSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all event categories in the organization
    #
    # + return - OK 
    remote isolated function getAllEventCategories() returns EventCategory[]|error {
        string resourcePath = string `/api/v1/EventCategories`;
        EventCategory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new event category
    #
    # + payload - EventCategory data 
    # + return - OK 
    remote isolated function postEventCategories(EventCategory payload) returns EventCategory|error {
        string resourcePath = string `/api/v1/EventCategories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventCategory response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an event category by ID
    #
    # + id - Event category ID 
    # + return - OK 
    remote isolated function getEventCategories(string id) returns EventCategory|error {
        string resourcePath = string `/api/v1/EventCategories/${getEncodedUri(id)}`;
        EventCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing event category
    #
    # + id - Event category ID 
    # + return - OK 
    remote isolated function deleteEventCategories(string id) returns json|error {
        string resourcePath = string `/api/v1/EventCategories/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the event category members for a given event category, if available
    #
    # + eventCategoryid - Event category ID 
    # + return - OK 
    remote isolated function getEventCategoryMemberships(string eventCategoryid) returns EventCategoryMembership[]|error {
        string resourcePath = string `/api/v1/EventCategories/${getEncodedUri(eventCategoryid)}/Memberships`;
        EventCategoryMembership[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds event source to an event category, if it doesn't already exist
    #
    # + eventCategoryid - Event category ID 
    # + eventSourceid - Event source ID 
    # + return - OK 
    remote isolated function postEventCategoryMemberships(string eventCategoryid, string eventSourceid) returns json|error {
        string resourcePath = string `/api/v1/EventCategories/${getEncodedUri(eventCategoryid)}/Memberships/${getEncodedUri(eventSourceid)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Deletes a event category membership for a given event category and event source
    #
    # + eventCategoryid - Event category ID 
    # + eventSourceid - Event source ID 
    # + return - OK 
    remote isolated function deleteEventCategoryMemberships(string eventCategoryid, string eventSourceid) returns json|error {
        string resourcePath = string `/api/v1/EventCategories/${getEncodedUri(eventCategoryid)}/Memberships/${getEncodedUri(eventSourceid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all event descriptors that are available on the management server.  
    # To create a new event source, you will need an event descriptor with valid parameters filled in.
    #
    # + return - OK 
    remote isolated function getAllEventDescriptors() returns EventDescriptor[]|error {
        string resourcePath = string `/api/v1/EventDescriptors`;
        EventDescriptor[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all event sources in the organization
    #
    # + return - OK 
    remote isolated function getAllEventSources() returns EventSource[]|error {
        string resourcePath = string `/api/v1/EventSources`;
        EventSource[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new event source.  Use the EventDescriptors resource to get the valid event descriptors on the management server, and pick one to use for the new event source.
    #
    # + payload - EventSource data 
    # + return - OK 
    remote isolated function postEventSources(EventSource payload) returns EventSource|error {
        string resourcePath = string `/api/v1/EventSources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EventSource response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets an event source by ID
    #
    # + id - Event source ID 
    # + return - OK 
    remote isolated function getEventSources(string id) returns EventSource|error {
        string resourcePath = string `/api/v1/EventSources/${getEncodedUri(id)}`;
        EventSource response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing event source
    #
    # + id - Event source ID 
    # + return - OK 
    remote isolated function deleteEventSources(string id) returns json|error {
        string resourcePath = string `/api/v1/EventSources/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all favorite tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllFavoriteTasks() returns FavoriteTask[]|error {
        string resourcePath = string `/api/v1/FavoriteTasks`;
        FavoriteTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new favorite task
    #
    # + payload - FavoriteTask data 
    # + return - OK 
    remote isolated function postFavoriteTasks(FavoriteTask payload) returns FavoriteTask|error {
        string resourcePath = string `/api/v1/FavoriteTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FavoriteTask response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a favorite task by task ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function getFavoriteTasks(string id) returns FavoriteTask|error {
        string resourcePath = string `/api/v1/FavoriteTasks/${getEncodedUri(id)}`;
        FavoriteTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing favorite task, by task ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function deleteFavoriteTasks(string id) returns json|error {
        string resourcePath = string `/api/v1/FavoriteTasks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all files in the organization
    #
    # + return - OK 
    remote isolated function getAllFiles() returns File[]|error {
        string resourcePath = string `/api/v1/Files`;
        File[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Upload a file using 'multipart/form-data', supplying a storage type to use (1 for local storage, 2 for cloud)
    #
    # + storageType - 1 for local storage, 2 for cloud storage 
    # + payload - File data 
    # + return - OK 
    remote isolated function uploadFiles(V1FilesBody payload, int storageType = 1) returns File|error {
        string resourcePath = string `/api/v1/Files`;
        map<anydata> queryParam = {"storageType": storageType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        mime:Entity[] bodyParts = check createBodyParts(payload);
        request.setBodyParts(bodyParts);
        File response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a single file in the organization, given a file ID
    #
    # + id - File ID 
    # + return - OK 
    remote isolated function getFiles(string id) returns File|error {
        string resourcePath = string `/api/v1/Files/${getEncodedUri(id)}`;
        File response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing file
    #
    # + id - File ID 
    # + return - OK 
    remote isolated function deleteFiles(string id) returns json|error {
        string resourcePath = string `/api/v1/Files/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the group members for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getGroupMemberships(string groupid) returns GroupMembership[]|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/Memberships`;
        GroupMembership[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds computer to a group, using the static membership type
    #
    # + groupid - Group ID 
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function postGroupMemberships(string groupid, string computerid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/Memberships/${getEncodedUri(computerid)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Deletes a group membership for a given computer and group.  Note that this will only
    # work if the group membership type for the computer is 'Static'.
    #
    # + groupid - Group ID 
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteGroupMemberships(string groupid, string computerid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/Memberships/${getEncodedUri(computerid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllGroups() returns OptiTuneGroup[]|error {
        string resourcePath = string `/api/v1/Groups`;
        OptiTuneGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new group
    #
    # + payload - OptiTuneGroup data 
    # + return - OK 
    remote isolated function postGroups(OptiTuneGroup payload) returns OptiTuneGroup|error {
        string resourcePath = string `/api/v1/Groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OptiTuneGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Looks up a given group, based on its ID
    #
    # + id - Group ID 
    # + return - OK 
    remote isolated function getGroups(string id) returns OptiTuneGroup|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(id)}`;
        OptiTuneGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing group
    #
    # + id - Group ID 
    # + return - OK 
    remote isolated function deleteGroups(string id) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all install tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllInstallTasks() returns InstallTask[]|error {
        string resourcePath = string `/api/v1/InstallTasks`;
        InstallTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new install task.  If using PackageFileID, be sure to upload your package file first and get the ID of the file before calling this method
    #
    # + payload - InstallTask data 
    # + return - OK 
    remote isolated function postInstallTasks(InstallTask payload) returns InstallTask|error {
        string resourcePath = string `/api/v1/InstallTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InstallTask response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a install task by ID
    #
    # + id - Install task ID 
    # + return - OK 
    remote isolated function getInstallTasks(string id) returns InstallTask|error {
        string resourcePath = string `/api/v1/InstallTasks/${getEncodedUri(id)}`;
        InstallTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing install task, and all of its associated deployments
    #
    # + id - Install task ID 
    # + return - OK 
    remote isolated function deleteInstallTasks(string id) returns json|error {
        string resourcePath = string `/api/v1/InstallTasks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all applications installed on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getLocalUsers(string computerid) returns LocalUser[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/LocalUsers`;
        LocalUser[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all mail templates in the organization
    #
    # + return - OK 
    remote isolated function getAllMailTemplates() returns MailTemplate[]|error {
        string resourcePath = string `/api/v1/MailTemplates`;
        MailTemplate[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new mail template
    #
    # + payload - MailTemplate data 
    # + return - OK 
    remote isolated function postMailTemplates(MailTemplate payload) returns MailTemplate|error {
        string resourcePath = string `/api/v1/MailTemplates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MailTemplate response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a mail template by ID
    #
    # + id - Mail template ID 
    # + return - OK 
    remote isolated function getMailTemplates(string id) returns MailTemplate|error {
        string resourcePath = string `/api/v1/MailTemplates/${getEncodedUri(id)}`;
        MailTemplate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing mail template, using a given ID
    #
    # + id - Mail template ID 
    # + payload - MailTemplate data 
    # + return - OK 
    remote isolated function putMailTemplates(string id, MailTemplate payload) returns MailTemplate|error {
        string resourcePath = string `/api/v1/MailTemplates/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MailTemplate response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing mail template
    #
    # + id - Mail template ID 
    # + return - OK 
    remote isolated function deleteMailTemplates(string id) returns json|error {
        string resourcePath = string `/api/v1/MailTemplates/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets any detected malware threats on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getMalwareThreats(string computerid) returns MalwareThreat[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/MalwareThreats`;
        MalwareThreat[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the account members of a notification group by notification group ID
    #
    # + notificationgroupid - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroupMemberAccounts(string notificationgroupid) returns NotificationGroupMemberAccount[]|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/MemberAccounts`;
        NotificationGroupMemberAccount[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds an account to a notification group
    #
    # + notificationgroupid - Notification group ID 
    # + accountid - Account ID 
    # + payload - NotificationGroupMemberAccount data 
    # + return - OK 
    remote isolated function putNotificationGroupMemberAccounts(string notificationgroupid, string accountid, NotificationGroupMemberAccount payload) returns NotificationGroupMemberAccount|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/MemberAccounts/${getEncodedUri(accountid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationGroupMemberAccount response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing notification group account
    #
    # + notificationgroupid - Notification group ID 
    # + accountid - Account ID 
    # + return - OK 
    remote isolated function deleteNotificationGroupMemberAccounts(string notificationgroupid, string accountid) returns json|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/MemberAccounts/${getEncodedUri(accountid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the members of a notification group by notification group ID
    #
    # + notificationgroupid - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroupMembers(string notificationgroupid) returns NotificationGroupMember[]|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/Members`;
        NotificationGroupMember[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a member to a notification group.  For users that already have OptiTune accounts, use NotificationGroupMemberAccounts instead.
    #
    # + notificationgroupid - Notification group ID 
    # + payload - NotificationGroupMember data 
    # + return - OK 
    remote isolated function postNotificationGroupMembers(string notificationgroupid, NotificationGroupMember payload) returns NotificationGroupMember|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/Members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationGroupMember response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Updates an existing notification group member
    #
    # + notificationgroupid - Notification group ID 
    # + notificationgroupmemberid - Notification group member ID 
    # + payload - NotificationGroupMember data 
    # + return - OK 
    remote isolated function putNotificationGroupMembers(string notificationgroupid, string notificationgroupmemberid, NotificationGroupMember payload) returns NotificationGroupMember|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/Members/${getEncodedUri(notificationgroupmemberid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationGroupMember response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing notification group member
    #
    # + notificationgroupid - Notification group ID 
    # + notificationgroupmemberid - Notification group member ID 
    # + return - OK 
    remote isolated function deleteNotificationGroupMembers(string notificationgroupid, string notificationgroupmemberid) returns json|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(notificationgroupid)}/Members/${getEncodedUri(notificationgroupmemberid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all notification groups in the organization
    #
    # + return - OK 
    remote isolated function getAllNotificationGroups() returns NotificationGroup[]|error {
        string resourcePath = string `/api/v1/NotificationGroups`;
        NotificationGroup[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new notification group
    #
    # + payload - NotificationGroup data 
    # + return - OK 
    remote isolated function postNotificationGroups(NotificationGroup payload) returns NotificationGroup|error {
        string resourcePath = string `/api/v1/NotificationGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationGroup response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a notification group by ID
    #
    # + id - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroups(string id) returns NotificationGroup|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(id)}`;
        NotificationGroup response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing notification group, using a given ID
    #
    # + id - Notification group ID 
    # + payload - NotificationGroup data 
    # + return - OK 
    remote isolated function putNotificationGroups(string id, NotificationGroup payload) returns NotificationGroup|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        NotificationGroup response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing notification group
    #
    # + id - Notification group ID 
    # + return - OK 
    remote isolated function deleteNotificationGroups(string id) returns json|error {
        string resourcePath = string `/api/v1/NotificationGroups/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all tasks in the organization, that match the given taskType.  Use AllTasks to get all tasks in the organization.
    #
    # + taskType - Task type 
    # + return - OK 
    remote isolated function getAllOptiTuneTasks(string taskType) returns OptiTuneTask[]|error {
        string resourcePath = string `/api/v1/OptiTuneTasks`;
        map<anydata> queryParam = {"taskType": taskType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OptiTuneTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a task by ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function getOptiTuneTasks(string id) returns OptiTuneTask|error {
        string resourcePath = string `/api/v1/OptiTuneTasks/${getEncodedUri(id)}`;
        OptiTuneTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets an organization's license usage data for an optional date and time range, in UTC
    #
    # + organizationid - Organization ID 
    # + startDateTime - Start Date Time 
    # + endDateTime - End Date Time 
    # + return - OK 
    remote isolated function getOrganizationsBillingLicenseUsageByDate(string organizationid, string? startDateTime = (), string? endDateTime = ()) returns BillingLicenseUsage[]|error {
        string resourcePath = string `/api/v1/Organizations/${getEncodedUri(organizationid)}/BillingLicenseUsage`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        BillingLicenseUsage[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all organizations on the management server.  You need to have master administrator privileges to call any of the Organization resource methods
    #
    # + return - OK 
    remote isolated function getAllOrganizations() returns Organization[]|error {
        string resourcePath = string `/api/v1/Organizations`;
        Organization[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new organization
    #
    # + generateApiCredentials - Generate Api credentials 
    # + payload - OrganizationRegistration data 
    # + return - OK 
    remote isolated function postOrganizations(OrganizationRegistration payload, boolean generateApiCredentials = false) returns Organization|error {
        string resourcePath = string `/api/v1/Organizations`;
        map<anydata> queryParam = {"generateApiCredentials": generateApiCredentials};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a organization by ID
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function getOrganizations(string id) returns Organization|error {
        string resourcePath = string `/api/v1/Organizations/${getEncodedUri(id)}`;
        Organization response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing organization, using a given ID
    #
    # + id - Organization ID 
    # + payload - Organization data 
    # + return - OK 
    remote isolated function putOrganizations(string id, Organization payload) returns Organization|error {
        string resourcePath = string `/api/v1/Organizations/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Organization response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing organization, and all of its associated data
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function deleteOrganizations(string id) returns json|error {
        string resourcePath = string `/api/v1/Organizations/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all organization settings, for all organizations
    #
    # + return - OK 
    remote isolated function getAllOrganizationSettings() returns OrganizationSettings[]|error {
        string resourcePath = string `/api/v1/OrganizationSettings`;
        OrganizationSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets an organization settings by organization ID
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function getOrganizationSettings(string id) returns OrganizationSettings|error {
        string resourcePath = string `/api/v1/OrganizationSettings/${getEncodedUri(id)}`;
        OrganizationSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing organization settings, using a given organization ID
    #
    # + id - Organization ID 
    # + payload - OrganizationSettings data 
    # + return - OK 
    remote isolated function putOrganizationSettings(string id, OrganizationSettings payload) returns OrganizationSettings|error {
        string resourcePath = string `/api/v1/OrganizationSettings/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        OrganizationSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Gets the performance settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getPerformanceSettings(string groupid) returns PerformanceSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/PerformanceSettings`;
        PerformanceSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates performance settings for a given group
    #
    # + groupid - Group ID 
    # + payload - PerformanceSettings data 
    # + return - OK 
    remote isolated function putPerformanceSettings(string groupid, PerformanceSettings payload) returns PerformanceSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/PerformanceSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PerformanceSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes performance settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deletePerformanceSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/PerformanceSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all performance settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllPerformanceSettings() returns PerformanceSettings[]|error {
        string resourcePath = string `/api/v1/PerformanceSettings`;
        PerformanceSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all product keys for the organization
    #
    # + return - OK 
    remote isolated function getAllProductKeys() returns ProductKey[]|error {
        string resourcePath = string `/api/v1/ProductKeys`;
        ProductKey[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new product key for the organization
    #
    # + payload - ProductKey data 
    # + return - OK 
    remote isolated function postProductKeys(ProductKey payload) returns ProductKey|error {
        string resourcePath = string `/api/v1/ProductKeys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ProductKey response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the remote access settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getRemoteAccessSettings(string groupid) returns RemoteAccessSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/RemoteAccessSettings`;
        RemoteAccessSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates remote access settings for a given group
    #
    # + groupid - Group ID 
    # + payload - RemoteAccessSettings data 
    # + return - OK 
    remote isolated function putRemoteAccessSettings(string groupid, RemoteAccessSettings payload) returns RemoteAccessSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/RemoteAccessSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteAccessSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes existing remote access settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteRemoteAccessSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/RemoteAccessSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all remote access settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllRemoteAccessSettings() returns RemoteAccessSettings[]|error {
        string resourcePath = string `/api/v1/RemoteAccessSettings`;
        RemoteAccessSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all remoteAssistanceRequests in the organization
    #
    # + return - OK 
    remote isolated function getAllRemoteAssistanceRequests() returns RemoteAssistanceRequest[]|error {
        string resourcePath = string `/api/v1/RemoteAssistanceRequests`;
        RemoteAssistanceRequest[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new RemoteAssistanceRequest
    #
    # + payload - RemoteAssistanceRequest data 
    # + return - OK 
    remote isolated function postRemoteAssistanceRequests(RemoteAssistanceRequest payload) returns RemoteAssistanceRequest|error {
        string resourcePath = string `/api/v1/RemoteAssistanceRequests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteAssistanceRequest response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a remoteAssistanceRequest by ID
    #
    # + id - RemoteAssistanceRequest ID 
    # + return - OK 
    remote isolated function getRemoteAssistanceRequests(string id) returns RemoteAssistanceRequest|error {
        string resourcePath = string `/api/v1/RemoteAssistanceRequests/${getEncodedUri(id)}`;
        RemoteAssistanceRequest response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing RemoteAssistanceRequest, using a given ID
    #
    # + id - RemoteAssistanceRequest ID 
    # + payload - RemoteAssistanceRequest data 
    # + return - OK 
    remote isolated function putRemoteAssistanceRequests(string id, RemoteAssistanceRequest payload) returns RemoteAssistanceRequest|error {
        string resourcePath = string `/api/v1/RemoteAssistanceRequests/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RemoteAssistanceRequest response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing remote assistance request
    #
    # + id - Remote assistance request ID 
    # + return - OK 
    remote isolated function deleteRemoteAssistanceRequests(string id) returns json|error {
        string resourcePath = string `/api/v1/RemoteAssistanceRequests/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # This will initiate a remote connection to the given computer, and return an .OTC file used by the Remote Connect software
    # which will in turn connect to the remote computer.  Note that if the computer in question is not connected to OptiTune,
    # it will not work, so it is suggested that the caller check the computer's connection status before making this request.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getRemoteConnections(string computerid) returns json|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/RemoteConnection`;
        json response = check self.clientEp->get(resourcePath);
        return response;
    }
    # This will initiate a remote connection to the given computer, and return an URI with a custom url scheme (otcfile://) used by the Remote Connect software
    # which will in turn connect to the remote computer.  Note that if the computer in question is not connected to OptiTune,
    # it will not work, so it is suggested that the caller check the computer's connection status before making this request.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getUriRemoteConnections(string computerid) returns string|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/RemoteConnectionUri`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all repair tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllRepairTasks() returns RepairTask[]|error {
        string resourcePath = string `/api/v1/RepairTasks`;
        RepairTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new repair task
    #
    # + payload - RepairTask data 
    # + return - OK 
    remote isolated function postRepairTasks(RepairTask payload) returns RepairTask|error {
        string resourcePath = string `/api/v1/RepairTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        RepairTask response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a repair task by ID
    #
    # + id - Repair task ID 
    # + return - OK 
    remote isolated function getRepairTasks(string id) returns RepairTask|error {
        string resourcePath = string `/api/v1/RepairTasks/${getEncodedUri(id)}`;
        RepairTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing repair task, and all of its associated deployments
    #
    # + id - Repair task ID 
    # + return - OK 
    remote isolated function deleteRepairTasks(string id) returns json|error {
        string resourcePath = string `/api/v1/RepairTasks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all retired computers in the organization
    #
    # + return - OK 
    remote isolated function getAllRetiredComputers() returns RetiredComputer[]|error {
        string resourcePath = string `/api/v1/RetiredComputers`;
        RetiredComputer[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a retired computer by computer ID
    #
    # + id - Retired computer ID 
    # + return - OK 
    remote isolated function getRetiredComputers(string id) returns RetiredComputer|error {
        string resourcePath = string `/api/v1/RetiredComputers/${getEncodedUri(id)}`;
        RetiredComputer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Removes an existing retired computer, allowing to access OptiTune again
    #
    # + id - Retired computer ID 
    # + return - OK 
    remote isolated function deleteRetiredComputers(string id) returns json|error {
        string resourcePath = string `/api/v1/RetiredComputers/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all script tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllScriptTasks() returns ScriptTask[]|error {
        string resourcePath = string `/api/v1/ScriptTasks`;
        ScriptTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new script task
    #
    # + payload - ScriptTask data 
    # + return - OK 
    remote isolated function postScriptTasks(ScriptTask payload) returns ScriptTask|error {
        string resourcePath = string `/api/v1/ScriptTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ScriptTask response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a script task by task ID
    #
    # + id - Script task ID 
    # + return - OK 
    remote isolated function getScriptTasks(string id) returns ScriptTask|error {
        string resourcePath = string `/api/v1/ScriptTasks/${getEncodedUri(id)}`;
        ScriptTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing script task, and all of its associated deployments
    #
    # + id - Script task ID 
    # + return - OK 
    remote isolated function deleteScriptTasks(string id) returns json|error {
        string resourcePath = string `/api/v1/ScriptTasks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets the ID of the singleton group for a given computer ID.  The singleton group is used when creating settings or deploying tasks to a single computer.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getSingletonGroups(string computerid) returns string|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/SingletonGroup`;
        string response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all system tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllSystemTasks() returns SystemTask[]|error {
        string resourcePath = string `/api/v1/SystemTasks`;
        SystemTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a system task by ID
    #
    # + id - System task ID 
    # + return - OK 
    remote isolated function getSystemTasks(string id) returns SystemTask|error {
        string resourcePath = string `/api/v1/SystemTasks/${getEncodedUri(id)}`;
        SystemTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the tray icon settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getTrayIconSettings(string groupid) returns TrayIconSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/TrayIconSettings`;
        TrayIconSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates tray icon settings for a given group
    #
    # + groupid - Group ID 
    # + payload - TrayIconSettings data 
    # + return - OK 
    remote isolated function putTrayIconSettings(string groupid, TrayIconSettings payload) returns TrayIconSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/TrayIconSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TrayIconSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes existing tray icon settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteTrayIconSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/TrayIconSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all tray icon settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllTrayIconSettings() returns TrayIconSettings[]|error {
        string resourcePath = string `/api/v1/TrayIconSettings`;
        TrayIconSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all uninstall tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllUninstallTasks() returns UninstallTask[]|error {
        string resourcePath = string `/api/v1/UninstallTasks`;
        UninstallTask[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new uninstall task
    #
    # + payload - UninstallTask data 
    # + return - OK 
    remote isolated function postUninstallTasks(UninstallTask payload) returns UninstallTask|error {
        string resourcePath = string `/api/v1/UninstallTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        UninstallTask response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a uninstall task by ID
    #
    # + id - Uninstall task ID 
    # + return - OK 
    remote isolated function getUninstallTasks(string id) returns UninstallTask|error {
        string resourcePath = string `/api/v1/UninstallTasks/${getEncodedUri(id)}`;
        UninstallTask response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing uninstall task, and all of its associated deployments
    #
    # + id - Uninstall task ID 
    # + return - OK 
    remote isolated function deleteUninstallTasks(string id) returns json|error {
        string resourcePath = string `/api/v1/UninstallTasks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all webhooks in the organization
    #
    # + return - OK 
    remote isolated function getAllWebhooks() returns Webhook[]|error {
        string resourcePath = string `/api/v1/Webhooks`;
        Webhook[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds a new Webhook
    #
    # + payload - Webhook data 
    # + return - OK 
    remote isolated function postWebhooks(Webhook payload) returns Webhook|error {
        string resourcePath = string `/api/v1/Webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a webhook by ID
    #
    # + id - Webhook ID 
    # + return - OK 
    remote isolated function getWebhooks(string id) returns Webhook|error {
        string resourcePath = string `/api/v1/Webhooks/${getEncodedUri(id)}`;
        Webhook response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates an existing Webhook, using a given ID
    #
    # + id - Webhook ID 
    # + payload - Webhook data 
    # + return - OK 
    remote isolated function putWebhooks(string id, Webhook payload) returns Webhook|error {
        string resourcePath = string `/api/v1/Webhooks/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Webhook response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes an existing Webhook
    #
    # + id - Webhook ID 
    # + return - OK 
    remote isolated function deleteWebhooks(string id) returns json|error {
        string resourcePath = string `/api/v1/Webhooks/${getEncodedUri(id)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets windows event log entries on a given computer
    #
    # + computerid - Computer ID 
    # + startDateTime - Start Date Time 
    # + endDateTime - End Date Time 
    # + return - OK 
    remote isolated function getWindowsEventLog(string computerid, string? startDateTime = (), string? endDateTime = ()) returns WindowsEventLogEntry[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/WindowsEventLog`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WindowsEventLogEntry[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets windows event log entries for a given log on a given computer
    #
    # + computerid - Computer ID 
    # + logNameId - Log name ID 
    # + startDateTime - Start Date Time 
    # + endDateTime - End Date Time 
    # + return - OK 
    remote isolated function getWindowsEventLogByLogNameId(string computerid, string logNameId, string? startDateTime = (), string? endDateTime = ()) returns WindowsEventLogEntry[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/WindowsEventLog/${getEncodedUri(logNameId)}`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        WindowsEventLogEntry[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the names and IDs of all windows event logs for the organization.  The log IDs are needed to query event log entries for a given computer.
    #
    # + return - OK 
    remote isolated function getWindowsEventLogNames() returns WindowsEventLogName[]|error {
        string resourcePath = string `/api/v1/WindowsEventLogNames`;
        WindowsEventLogName[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the windows event log settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getWindowsEventLogSettings(string groupid) returns WindowsEventLogSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsEventLogSettings`;
        WindowsEventLogSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates windows event log settings for a given group
    #
    # + groupid - Group ID 
    # + payload - WindowsEventLogSettings data 
    # + return - OK 
    remote isolated function putWindowsEventLogSettings(string groupid, WindowsEventLogSettings payload) returns WindowsEventLogSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsEventLogSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WindowsEventLogSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes existing windows event log settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteWindowsEventLogSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsEventLogSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all windows event log settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsEventLogSettings() returns WindowsEventLogSettings[]|error {
        string resourcePath = string `/api/v1/WindowsEventLogSettings`;
        WindowsEventLogSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all windows updates that belong to a given windows update category
    #
    # + categoryid - Category ID 
    # + return - OK 
    remote isolated function getMembersWindowsUpdateCategories(string categoryid) returns WindowsUpdate[]|error {
        string resourcePath = string `/api/v1/api/v1/WindowsUpdateCategory/${getEncodedUri(categoryid)}/Members`;
        WindowsUpdate[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all windows update categories in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdateCategories() returns WindowsUpdateCategory[]|error {
        string resourcePath = string `/api/v1/WindowsUpdateCategories`;
        WindowsUpdateCategory[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a windows update category by ID
    #
    # + id - Category ID 
    # + return - OK 
    remote isolated function getWindowsUpdateCategories(string id) returns WindowsUpdateCategory|error {
        string resourcePath = string `/api/v1/WindowsUpdateCategories/${getEncodedUri(id)}`;
        WindowsUpdateCategory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the state of all windows updates on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getWindowsUpdateComputerState(string computerid) returns WindowsUpdateComputerState[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/UpdateState`;
        WindowsUpdateComputerState[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the entire windows update history for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getWindowsUpdateHistory(string computerid) returns WindowsUpdateHistoryEntry[]|error {
        string resourcePath = string `/api/v1/Computers/${getEncodedUri(computerid)}/WindowsUpdateHistory`;
        WindowsUpdateHistoryEntry[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets all windows updates in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdates() returns WindowsUpdate[]|error {
        string resourcePath = string `/api/v1/WindowsUpdates`;
        WindowsUpdate[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a windows update by its ID
    #
    # + id - Windows update ID 
    # + return - OK 
    remote isolated function getWindowsUpdates(string id) returns WindowsUpdate|error {
        string resourcePath = string `/api/v1/WindowsUpdates/${getEncodedUri(id)}`;
        WindowsUpdate response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the windows update settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getWindowsUpdateSettings(string groupid) returns WindowsUpdateSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsUpdateSettings`;
        WindowsUpdateSettings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Adds or updates windows update settings for a given group
    #
    # + groupid - Group ID 
    # + payload - WindowsUpdateSettings data 
    # + return - OK 
    remote isolated function putWindowsUpdateSettings(string groupid, WindowsUpdateSettings payload) returns WindowsUpdateSettings|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsUpdateSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WindowsUpdateSettings response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes windows update settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteWindowsUpdateSettings(string groupid) returns json|error {
        string resourcePath = string `/api/v1/Groups/${getEncodedUri(groupid)}/WindowsUpdateSettings`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Gets all windows update settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdateSettings() returns WindowsUpdateSettings[]|error {
        string resourcePath = string `/api/v1/WindowsUpdateSettings`;
        WindowsUpdateSettings[] response = check self.clientEp->get(resourcePath);
        return response;
    }
}
