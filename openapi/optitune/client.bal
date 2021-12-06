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

# This is a generated connector for [OptiTune API v1](https://manage.opti-tune.com/help/site/articles/api/default.html) OpenAPI specification.
# A complete API for interacting with all objects on an OptiTune Management Server
@display {label: "OptiTune", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [OptiTune account](https://manage.opti-tune.com) and obtain tokens by following [this guide](https://manage.opti-tune.com/help/site/articles/api/default.html#authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://manage.opti-tune.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Gets the logged in user account
    #
    # + return - OK 
    remote isolated function getMyAccounts() returns Account|error {
        string  path = string `/api/v1/Accounts/Me`;
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Gets all accounts in the organization
    #
    # + return - OK 
    remote isolated function getAllAccounts() returns Account[]|error {
        string  path = string `/api/v1/Accounts`;
        Account[] response = check self.clientEp-> get(path, targetType = AccountArr);
        return response;
    }
    # Adds a new account
    #
    # + payload - The account to add 
    # + return - OK 
    remote isolated function postAccounts(Account payload) returns Account|error {
        string  path = string `/api/v1/Accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->post(path, request, targetType=Account);
        return response;
    }
    # Gets a single account in the organization, given an account ID
    #
    # + id - Account ID 
    # + return - OK 
    remote isolated function getAccounts(string id) returns Account|error {
        string  path = string `/api/v1/Accounts/${id}`;
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Updates an existing account
    #
    # + id - The id of the Account 
    # + payload - The Account data 
    # + return - OK 
    remote isolated function putAccounts(string id, Account payload) returns Account|error {
        string  path = string `/api/v1/Accounts/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Account response = check self.clientEp->put(path, request, targetType=Account);
        return response;
    }
    # Deletes an existing account
    #
    # + id - Account ID 
    # + return - OK 
    remote isolated function deleteAccounts(string id) returns json|error {
        string  path = string `/api/v1/Accounts/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the advanced settings for an organization
    #
    # + return - OK 
    remote isolated function getAdvancedSettings() returns AdvancedSettings|error {
        string  path = string `/api/v1/AdvancedSettings`;
        AdvancedSettings response = check self.clientEp-> get(path, targetType = AdvancedSettings);
        return response;
    }
    # Adds or updates advanced settings for the organization
    #
    # + payload - AdvancedSettings data 
    # + return - OK 
    remote isolated function putAdvancedSettings(AdvancedSettings payload) returns AdvancedSettings|error {
        string  path = string `/api/v1/AdvancedSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AdvancedSettings response = check self.clientEp->put(path, request, targetType=AdvancedSettings);
        return response;
    }
    # Gets the OptiTune agent configuration for a given computer id, in XML format
    #
    # + computerid - computer ID 
    # + return - OK 
    remote isolated function getAgentConfig(string computerid) returns json|error {
        string  path = string `/api/v1/Computers/${computerid}/AgentConfig`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # Gets all agent installers in the organization
    #
    # + return - OK 
    remote isolated function agentinstallersGetall() returns AgentInstaller[]|error {
        string  path = string `/api/v1/AgentInstallers`;
        AgentInstaller[] response = check self.clientEp-> get(path, targetType = AgentInstallerArr);
        return response;
    }
    # Adds a new agent installer.  Upload the files specifying local storage first, and then 
    # specify the file IDs in the agent installer here
    #
    # + payload - AgentInstaller data 
    # + return - OK 
    remote isolated function postAgentInstallers(AgentInstaller payload) returns AgentInstaller|error {
        string  path = string `/api/v1/AgentInstallers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AgentInstaller response = check self.clientEp->post(path, request, targetType=AgentInstaller);
        return response;
    }
    # Gets a single agent installer in the organization, given an agent installer ID
    #
    # + id - Agent installer ID 
    # + return - OK 
    remote isolated function getAgentInstallers(string id) returns AgentInstaller|error {
        string  path = string `/api/v1/AgentInstallers/${id}`;
        AgentInstaller response = check self.clientEp-> get(path, targetType = AgentInstaller);
        return response;
    }
    # Deletes an existing agent installer
    #
    # + id - Agent installer ID 
    # + return - OK 
    remote isolated function deleteAgentInstallers(string id) returns json|error {
        string  path = string `/api/v1/AgentInstallers/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the state of a single OptiTune agent, given a computer ID.  The state will frequently change as the agent performs its duties.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getAgentStateAgentStatus(string computerid) returns AgentState|error {
        string  path = string `/api/v1/Computers/${computerid}/AgentState`;
        AgentState response = check self.clientEp-> get(path, targetType = AgentState);
        return response;
    }
    # Gets the connection status for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getConnectionStateAgentStatus(string computerid) returns ConnectionStatusInfo|error {
        string  path = string `/api/v1/Computers/${computerid}/ConnectionState`;
        ConnectionStatusInfo response = check self.clientEp-> get(path, targetType = ConnectionStatusInfo);
        return response;
    }
    # Gets a single alert instance, given an alert instance ID
    #
    # + id - Alert instance ID 
    # + return - OK 
    remote isolated function getAlertInstances(string id) returns AlertInstance|error {
        string  path = string `/api/v1/AlertInstances/${id}`;
        AlertInstance response = check self.clientEp-> get(path, targetType = AlertInstance);
        return response;
    }
    # Deletes an existing alert instance
    #
    # + id - Alert instance ID 
    # + return - OK 
    remote isolated function deleteAlertInstances(string id) returns json|error {
        string  path = string `/api/v1/AlertInstances/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all alert instances that fall into a given page range.
    #
    # + pageNumber - Page Number 
    # + pageSize - Page Size 
    # + return - OK 
    remote isolated function getAllAlertInstances(int? pageNumber = (), int? pageSize = ()) returns AlertInstance[]|error {
        string  path = string `/api/v1/AlertInstances`;
        map<anydata> queryParam = {"page.number": pageNumber, "page.size": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        AlertInstance[] response = check self.clientEp-> get(path, targetType = AlertInstanceArr);
        return response;
    }
    # Updates only the status for a given alert instance
    #
    # + payload - AlertInstance data 
    # + return - OK 
    remote isolated function patchAlertInstances(AlertInstance payload) returns AlertInstance|error {
        string  path = string `/api/v1/AlertInstances`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AlertInstance response = check self.clientEp->patch(path, request, targetType=AlertInstance);
        return response;
    }
    # Gets all alert subscriptions in the organization
    #
    # + return - OK 
    remote isolated function getAllAlertSubscriptions() returns AlertSubscription[]|error {
        string  path = string `/api/v1/AlertSubscriptions`;
        AlertSubscription[] response = check self.clientEp-> get(path, targetType = AlertSubscriptionArr);
        return response;
    }
    # Adds a new alert subscription
    #
    # + payload - AlertSubscription data 
    # + return - OK 
    remote isolated function postAlertSubscriptions(AlertSubscription payload) returns AlertSubscription|error {
        string  path = string `/api/v1/AlertSubscriptions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AlertSubscription response = check self.clientEp->post(path, request, targetType=AlertSubscription);
        return response;
    }
    # Gets a alert subscription by ID
    #
    # + id - Alert subscription ID 
    # + return - OK 
    remote isolated function getAlertSubscriptions(string id) returns AlertSubscription|error {
        string  path = string `/api/v1/AlertSubscriptions/${id}`;
        AlertSubscription response = check self.clientEp-> get(path, targetType = AlertSubscription);
        return response;
    }
    # Updates an existing alert subscription, using a given ID
    #
    # + id - Alert subscription ID 
    # + payload - AlertSubscription data 
    # + return - OK 
    remote isolated function putAlertSubscriptions(string id, AlertSubscription payload) returns AlertSubscription|error {
        string  path = string `/api/v1/AlertSubscriptions/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AlertSubscription response = check self.clientEp->put(path, request, targetType=AlertSubscription);
        return response;
    }
    # Deletes an existing alert subscription, given an ID
    #
    # + id - Alert subscription ID 
    # + return - OK 
    remote isolated function deleteAlertSubscriptions(string id) returns json|error {
        string  path = string `/api/v1/AlertSubscriptions/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all announcements on the management server
    #
    # + return - OK 
    remote isolated function getAllAnnouncements() returns Announcement[]|error {
        string  path = string `/api/v1/Announcements`;
        Announcement[] response = check self.clientEp-> get(path, targetType = AnnouncementArr);
        return response;
    }
    # Gets all applications installed on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getApplications(string computerid) returns Application[]|error {
        string  path = string `/api/v1/Computers/${computerid}/Applications`;
        Application[] response = check self.clientEp-> get(path, targetType = ApplicationArr);
        return response;
    }
    # Gets all audit log entries between optional start and end times, in UTC
    #
    # + startDateTime - An optional start time 
    # + endDateTime - An optional end time 
    # + return - OK 
    remote isolated function getByDateAuditLog(string? startDateTime = (), string? endDateTime = ()) returns AuditLogEntry[]|error {
        string  path = string `/api/v1/AuditLog`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        path = path + check getPathForQueryParam(queryParam);
        AuditLogEntry[] response = check self.clientEp-> get(path, targetType = AuditLogEntryArr);
        return response;
    }
    # Gets the cloudberry backup configuration for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getConfigBackupCloudberry(string computerid) returns BackupCloudberryComputerConfig|error {
        string  path = string `/api/v1/Computers/${computerid}/BackupCloudberryConfig`;
        BackupCloudberryComputerConfig response = check self.clientEp-> get(path, targetType = BackupCloudberryComputerConfig);
        return response;
    }
    # Gets the cloudberry backup plans for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getPlansBackupCloudberry(string computerid) returns BackupCloudberryComputerPlan[]|error {
        string  path = string `/api/v1/Computers/${computerid}/BackupCloudberryPlans`;
        BackupCloudberryComputerPlan[] response = check self.clientEp-> get(path, targetType = BackupCloudberryComputerPlanArr);
        return response;
    }
    # Gets the cloudberry backup plan history, for a given computer ID and plan ID
    #
    # + computerid - Computer ID 
    # + planid - Plan ID 
    # + return - OK 
    remote isolated function getPlanHistoryBackupCloudberry(string computerid, string planid) returns BackupCloudberryComputerPlanHistory[]|error {
        string  path = string `/api/v1/Computers/${computerid}/BackupCloudberryPlans/${planid}/History`;
        BackupCloudberryComputerPlanHistory[] response = check self.clientEp-> get(path, targetType = BackupCloudberryComputerPlanHistoryArr);
        return response;
    }
    # Gets all benchmark data points for a given computer.  Each benchmark data point will have an associated "benchmark" and "benchmark data set".
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getByComputerBenchmarkDataPoints(string computerid) returns BenchmarkDataPoint[]|error {
        string  path = string `/api/v1/Computers/${computerid}/BenchmarkDataPoints`;
        BenchmarkDataPoint[] response = check self.clientEp-> get(path, targetType = BenchmarkDataPointArr);
        return response;
    }
    # Each benchmark for a particular computer may contain multiple data sets.  This returns all available data sets for the organization, across all computers.
    #
    # + return - OK 
    remote isolated function getAllBenchmarkDataSets() returns BenchmarkDataSet[]|error {
        string  path = string `/api/v1/BenchmarkDataSets`;
        BenchmarkDataSet[] response = check self.clientEp-> get(path, targetType = BenchmarkDataSetArr);
        return response;
    }
    # Gets a particular benchmark data set given a benchmark data set id
    #
    # + id - Benchmark data set ID 
    # + return - OK 
    remote isolated function getBenchmarkDataSets(int id) returns BenchmarkDataSet|error {
        string  path = string `/api/v1/BenchmarkDataSets/${id}`;
        BenchmarkDataSet response = check self.clientEp-> get(path, targetType = BenchmarkDataSet);
        return response;
    }
    # Gets all available benchmarks for the organization.  Each benchmark is named for the corresponding performance counter, e.g. Name = "\Processor(_Total)\% Processor Time"
    #
    # + return - OK 
    remote isolated function getAllBenchmarks() returns Benchmark[]|error {
        string  path = string `/api/v1/Benchmarks`;
        Benchmark[] response = check self.clientEp-> get(path, targetType = BenchmarkArr);
        return response;
    }
    # Gets a particular benchmark given a benchmark id
    #
    # + id - Benchmark ID 
    # + return - OK 
    remote isolated function getBenchmarks(int id) returns Benchmark|error {
        string  path = string `/api/v1/Benchmarks/${id}`;
        Benchmark response = check self.clientEp-> get(path, targetType = Benchmark);
        return response;
    }
    # Gets all billing license usage data for the organization, between optional start and end dates (in UTC)
    #
    # + startDateTime - Start date 
    # + endDateTime - End date 
    # + return - OK 
    remote isolated function getByDateBillingLicenseUsage(string? startDateTime = (), string? endDateTime = ()) returns BillingLicenseUsage[]|error {
        string  path = string `/api/v1/BillingLicenseUsage`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        path = path + check getPathForQueryParam(queryParam);
        BillingLicenseUsage[] response = check self.clientEp-> get(path, targetType = BillingLicenseUsageArr);
        return response;
    }
    # Gets the billing settings for the current organization
    #
    # + return - OK 
    remote isolated function getBillingSettings() returns BillingSettings|error {
        string  path = string `/api/v1/BillingSettings`;
        BillingSettings response = check self.clientEp-> get(path, targetType = BillingSettings);
        return response;
    }
    # Updates existing billing settings.  If you provide a valid billing token (from https://www.bravurasoftware.com/billing), the organization will use monthly billing for its license usage
    #
    # + payload - BillingSettings data 
    # + return - OK 
    remote isolated function putBillingSettings(BillingSettings payload) returns BillingSettings|error {
        string  path = string `/api/v1/BillingSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BillingSettings response = check self.clientEp->put(path, request, targetType=BillingSettings);
        return response;
    }
    # Gets all available root domains for branding.  When configuring a brand for your organization, you can pick between one or more root domains, e.g. "rmmportal.com"
    #
    # + return - OK 
    remote isolated function getAllBrandDomains() returns BrandDomain[]|error {
        string  path = string `/api/v1/BrandDomains`;
        BrandDomain[] response = check self.clientEp-> get(path, targetType = BrandDomainArr);
        return response;
    }
    # Gets all brands in the organization
    #
    # + return - OK 
    remote isolated function getAllBrands() returns Brand[]|error {
        string  path = string `/api/v1/Brands`;
        Brand[] response = check self.clientEp-> get(path, targetType = BrandArr);
        return response;
    }
    # Adds a new brand
    #
    # + payload - Brand data 
    # + return - OK 
    remote isolated function postBrands(Brand payload) returns Brand|error {
        string  path = string `/api/v1/Brands`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Brand response = check self.clientEp->post(path, request, targetType=Brand);
        return response;
    }
    # Gets a brand by ID
    #
    # + id - Brand ID 
    # + return - OK 
    remote isolated function getBrands(string id) returns Brand|error {
        string  path = string `/api/v1/Brands/${id}`;
        Brand response = check self.clientEp-> get(path, targetType = Brand);
        return response;
    }
    # Deletes an existing brand
    #
    # + id - Brand ID 
    # + return - OK 
    remote isolated function deleteBrands(string id) returns json|error {
        string  path = string `/api/v1/Brands/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all business entities in the organization
    #
    # + return - OK 
    remote isolated function getAllBusinessEntities() returns BusinessEntity[]|error {
        string  path = string `/api/v1/BusinessEntities`;
        BusinessEntity[] response = check self.clientEp-> get(path, targetType = BusinessEntityArr);
        return response;
    }
    # Adds a new business entity
    #
    # + payload - BusinessEntity data 
    # + return - OK 
    remote isolated function postBusinessEntities(BusinessEntity payload) returns BusinessEntity|error {
        string  path = string `/api/v1/BusinessEntities`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BusinessEntity response = check self.clientEp->post(path, request, targetType=BusinessEntity);
        return response;
    }
    # Gets a business entity, based on the provided business entity ID
    #
    # + id - Business entity ID 
    # + return - OK 
    remote isolated function getBusinessEntities(string id) returns BusinessEntity|error {
        string  path = string `/api/v1/BusinessEntities/${id}`;
        BusinessEntity response = check self.clientEp-> get(path, targetType = BusinessEntity);
        return response;
    }
    # Updates an existing business entity.  You can also change the parent of the business entity by adjusting the ParentID value.
    #
    # + id - The id of the Business Entity 
    # + payload - The Business Entity data 
    # + return - OK 
    remote isolated function putBusinessEntities(string id, BusinessEntity payload) returns BusinessEntity|error {
        string  path = string `/api/v1/BusinessEntities/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BusinessEntity response = check self.clientEp->put(path, request, targetType=BusinessEntity);
        return response;
    }
    # Deletes an existing business entity
    #
    # + id - Business entity ID 
    # + return - OK 
    remote isolated function deleteBusinessEntities(string id) returns json|error {
        string  path = string `/api/v1/BusinessEntities/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerDetails(string computerid) returns ComputerDetails|error {
        string  path = string `/api/v1/Computers/${computerid}/Details`;
        ComputerDetails response = check self.clientEp-> get(path, targetType = ComputerDetails);
        return response;
    }
    # Returns the user provided display name for a given computer.  The display name typically entered in the computer details page,
    # and is independent of the normal computer name, as seen in Windows.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerDisplayName(string computerid) returns string|error {
        string  path = string `/api/v1/Computers/${computerid}/DisplayName`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Adds or Updates the computer's user defined display name
    #
    # + computerid - Computer ID 
    # + payload - User defined display name 
    # + return - OK 
    remote isolated function putComputerDisplayName(string computerid, string payload) returns string|error {
        string  path = string `/api/v1/Computers/${computerid}/DisplayName`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        string response = check self.clientEp->put(path, request, targetType=string);
        return response;
    }
    # Deletes the display name for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteComputerDisplayName(string computerid) returns json|error {
        string  path = string `/api/v1/Computers/${computerid}/DisplayName`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets computer metadata for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getComputerMetadata(string computerid) returns ComputerMetadata|error {
        string  path = string `/api/v1/Computers/${computerid}/Metadata`;
        ComputerMetadata response = check self.clientEp-> get(path, targetType = ComputerMetadata);
        return response;
    }
    # Adds or updates Metadata for a single computer
    #
    # + computerid - Computer ID 
    # + payload - Computer Metadata 
    # + return - OK 
    remote isolated function putComputerMetadata(string computerid, ComputerMetadata payload) returns ComputerMetadata|error {
        string  path = string `/api/v1/Computers/${computerid}/Metadata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ComputerMetadata response = check self.clientEp->put(path, request, targetType=ComputerMetadata);
        return response;
    }
    # Deletes the metadata for a single computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteComputerMetadata(string computerid) returns json|error {
        string  path = string `/api/v1/Computers/${computerid}/Metadata`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Updates individual metadata fields for one computer.  The Patch method will update individual fields, whereas the Put 
    # method adds or updates the entire metadata for one computer.
    #
    # + computerid - Computer ID 
    # + payload - Computer metadata 
    # + return - OK 
    remote isolated function patchComputerMetadata(string computerid, ComputerMetadata payload) returns ComputerMetadata|error {
        string  path = string `/api/v1/Computers/${computerid}/Metadata`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ComputerMetadata response = check self.clientEp->patch(path, request, targetType=ComputerMetadata);
        return response;
    }
    # Gets all computer metadata values for all computers in the organization.  Note that not every computer will have metadata associated with it.
    #
    # + return - OK 
    remote isolated function getAllComputerMetadata() returns ComputerMetadata[]|error {
        string  path = string `/api/v1/ComputerMetadata`;
        ComputerMetadata[] response = check self.clientEp-> get(path, targetType = ComputerMetadataArr);
        return response;
    }
    # Gets all computers in the organization
    #
    # + return - OK 
    remote isolated function getAllComputers() returns Computer[]|error {
        string  path = string `/api/v1/Computers`;
        Computer[] response = check self.clientEp-> get(path, targetType = ComputerArr);
        return response;
    }
    # Gets a computer by the computer's id
    #
    # + id - Computer ID 
    # + return - OK 
    remote isolated function getComputers(string id) returns Computer|error {
        string  path = string `/api/v1/Computers/${id}`;
        Computer response = check self.clientEp-> get(path, targetType = Computer);
        return response;
    }
    # Retires an existing computer, deleting all of its data in OptiTune.
    # Calling this method will add it to the list of retired computers.  The computer will
    # be blocked from accessing OptiTune until it is removed from the list of retired computers.
    #
    # + id - Computer ID 
    # + return - OK 
    remote isolated function deleteComputers(string id) returns json|error {
        string  path = string `/api/v1/Computers/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all deployment results for a given deployment ID
    #
    # + deploymentid - Deployment ID 
    # + return - OK 
    remote isolated function getDeploymentResults(string deploymentid) returns DeploymentResult[]|error {
        string  path = string `/api/v1/Deployments/${deploymentid}/Results`;
        DeploymentResult[] response = check self.clientEp-> get(path, targetType = DeploymentResultArr);
        return response;
    }
    # Gets all deployments to a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getForGroupDeployments(string groupid) returns Deployment[]|error {
        string  path = string `/api/v1/Groups/${groupid}/Deployments`;
        Deployment[] response = check self.clientEp-> get(path, targetType = DeploymentArr);
        return response;
    }
    # Gets all deployments in the organization
    #
    # + return - OK 
    remote isolated function getAllDeployments() returns Deployment[]|error {
        string  path = string `/api/v1/Deployments`;
        Deployment[] response = check self.clientEp-> get(path, targetType = DeploymentArr);
        return response;
    }
    # Adds a new deployment
    #
    # + payload - Deployment data 
    # + return - OK 
    remote isolated function postDeployments(Deployment payload) returns Deployment|error {
        string  path = string `/api/v1/Deployments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Deployment response = check self.clientEp->post(path, request, targetType=Deployment);
        return response;
    }
    # Gets a deployment by ID
    #
    # + id - Deployment ID 
    # + return - OK 
    remote isolated function getDeployments(string id) returns Deployment|error {
        string  path = string `/api/v1/Deployments/${id}`;
        Deployment response = check self.clientEp-> get(path, targetType = Deployment);
        return response;
    }
    # Deletes an existing deployment
    #
    # + id - Deployment ID 
    # + return - OK 
    remote isolated function deleteDeployments(string id) returns json|error {
        string  path = string `/api/v1/Deployments/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the endpoint protection information for a given computer, if available
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getEndpointProtection(string computerid) returns EndpointProtection|error {
        string  path = string `/api/v1/Computers/${computerid}/EndpointProtection`;
        EndpointProtection response = check self.clientEp-> get(path, targetType = EndpointProtection);
        return response;
    }
    # Gets the endpoint protection settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getEndpointProtectionSettings(string groupid) returns EndpointProtectionSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/EndpointProtectionSettings`;
        EndpointProtectionSettings response = check self.clientEp-> get(path, targetType = EndpointProtectionSettings);
        return response;
    }
    # Adds or updates endpoint protection settings for a given group
    #
    # + groupid - Group ID 
    # + payload - EndpointProtectionSettings data 
    # + return - OK 
    remote isolated function putEndpointProtectionSettings(string groupid, EndpointProtectionSettings payload) returns EndpointProtectionSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/EndpointProtectionSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EndpointProtectionSettings response = check self.clientEp->put(path, request, targetType=EndpointProtectionSettings);
        return response;
    }
    # Deletes existing endpoint protection settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteEndpointProtectionSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/EndpointProtectionSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all endpoint protection settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllEndpointProtectionSettings() returns EndpointProtectionSettings[]|error {
        string  path = string `/api/v1/EndpointProtectionSettings`;
        EndpointProtectionSettings[] response = check self.clientEp-> get(path, targetType = EndpointProtectionSettingsArr);
        return response;
    }
    # Gets all event categories in the organization
    #
    # + return - OK 
    remote isolated function getAllEventCategories() returns EventCategory[]|error {
        string  path = string `/api/v1/EventCategories`;
        EventCategory[] response = check self.clientEp-> get(path, targetType = EventCategoryArr);
        return response;
    }
    # Adds a new event category
    #
    # + payload - EventCategory data 
    # + return - OK 
    remote isolated function postEventCategories(EventCategory payload) returns EventCategory|error {
        string  path = string `/api/v1/EventCategories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EventCategory response = check self.clientEp->post(path, request, targetType=EventCategory);
        return response;
    }
    # Gets an event category by ID
    #
    # + id - Event category ID 
    # + return - OK 
    remote isolated function getEventCategories(string id) returns EventCategory|error {
        string  path = string `/api/v1/EventCategories/${id}`;
        EventCategory response = check self.clientEp-> get(path, targetType = EventCategory);
        return response;
    }
    # Deletes an existing event category
    #
    # + id - Event category ID 
    # + return - OK 
    remote isolated function deleteEventCategories(string id) returns json|error {
        string  path = string `/api/v1/EventCategories/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the event category members for a given event category, if available
    #
    # + eventCategoryid - Event category ID 
    # + return - OK 
    remote isolated function getEventCategoryMemberships(string eventCategoryid) returns EventCategoryMembership[]|error {
        string  path = string `/api/v1/EventCategories/${eventCategoryid}/Memberships`;
        EventCategoryMembership[] response = check self.clientEp-> get(path, targetType = EventCategoryMembershipArr);
        return response;
    }
    # Adds event source to an event category, if it doesn't already exist
    #
    # + eventCategoryid - Event category ID 
    # + eventSourceid - Event source ID 
    # + return - OK 
    remote isolated function postEventCategoryMemberships(string eventCategoryid, string eventSourceid) returns json|error {
        string  path = string `/api/v1/EventCategories/${eventCategoryid}/Memberships/${eventSourceid}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    # Deletes a event category membership for a given event category and event source
    #
    # + eventCategoryid - Event category ID 
    # + eventSourceid - Event source ID 
    # + return - OK 
    remote isolated function deleteEventCategoryMemberships(string eventCategoryid, string eventSourceid) returns json|error {
        string  path = string `/api/v1/EventCategories/${eventCategoryid}/Memberships/${eventSourceid}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all event descriptors that are available on the management server.  
    # To create a new event source, you will need an event descriptor with valid parameters filled in.
    #
    # + return - OK 
    remote isolated function getAllEventDescriptors() returns EventDescriptor[]|error {
        string  path = string `/api/v1/EventDescriptors`;
        EventDescriptor[] response = check self.clientEp-> get(path, targetType = EventDescriptorArr);
        return response;
    }
    # Gets all event sources in the organization
    #
    # + return - OK 
    remote isolated function getAllEventSources() returns EventSource[]|error {
        string  path = string `/api/v1/EventSources`;
        EventSource[] response = check self.clientEp-> get(path, targetType = EventSourceArr);
        return response;
    }
    # Adds a new event source.  Use the EventDescriptors resource to get the valid event descriptors on the management server, and pick one to use for the new event source.
    #
    # + payload - EventSource data 
    # + return - OK 
    remote isolated function postEventSources(EventSource payload) returns EventSource|error {
        string  path = string `/api/v1/EventSources`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        EventSource response = check self.clientEp->post(path, request, targetType=EventSource);
        return response;
    }
    # Gets an event source by ID
    #
    # + id - Event source ID 
    # + return - OK 
    remote isolated function getEventSources(string id) returns EventSource|error {
        string  path = string `/api/v1/EventSources/${id}`;
        EventSource response = check self.clientEp-> get(path, targetType = EventSource);
        return response;
    }
    # Deletes an existing event source
    #
    # + id - Event source ID 
    # + return - OK 
    remote isolated function deleteEventSources(string id) returns json|error {
        string  path = string `/api/v1/EventSources/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all favorite tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllFavoriteTasks() returns FavoriteTask[]|error {
        string  path = string `/api/v1/FavoriteTasks`;
        FavoriteTask[] response = check self.clientEp-> get(path, targetType = FavoriteTaskArr);
        return response;
    }
    # Adds a new favorite task
    #
    # + payload - FavoriteTask data 
    # + return - OK 
    remote isolated function postFavoriteTasks(FavoriteTask payload) returns FavoriteTask|error {
        string  path = string `/api/v1/FavoriteTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FavoriteTask response = check self.clientEp->post(path, request, targetType=FavoriteTask);
        return response;
    }
    # Gets a favorite task by task ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function getFavoriteTasks(string id) returns FavoriteTask|error {
        string  path = string `/api/v1/FavoriteTasks/${id}`;
        FavoriteTask response = check self.clientEp-> get(path, targetType = FavoriteTask);
        return response;
    }
    # Deletes an existing favorite task, by task ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function deleteFavoriteTasks(string id) returns json|error {
        string  path = string `/api/v1/FavoriteTasks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all files in the organization
    #
    # + return - OK 
    remote isolated function getAllFiles() returns File[]|error {
        string  path = string `/api/v1/Files`;
        File[] response = check self.clientEp-> get(path, targetType = FileArr);
        return response;
    }
    # Upload a file using 'multipart/form-data', supplying a storage type to use (1 for local storage, 2 for cloud)
    #
    # + payload - File data 
    # + storageType - 1 for local storage, 2 for cloud storage 
    # + return - OK 
    remote isolated function uploadFiles(Body payload, int storageType = 1) returns File|error {
        string  path = string `/api/v1/Files`;
        map<anydata> queryParam = {"storageType": storageType};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        File response = check self.clientEp->post(path, request, targetType=File);
        return response;
    }
    # Gets a single file in the organization, given a file ID
    #
    # + id - File ID 
    # + return - OK 
    remote isolated function getFiles(string id) returns File|error {
        string  path = string `/api/v1/Files/${id}`;
        File response = check self.clientEp-> get(path, targetType = File);
        return response;
    }
    # Deletes an existing file
    #
    # + id - File ID 
    # + return - OK 
    remote isolated function deleteFiles(string id) returns json|error {
        string  path = string `/api/v1/Files/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the group members for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getGroupMemberships(string groupid) returns GroupMembership[]|error {
        string  path = string `/api/v1/Groups/${groupid}/Memberships`;
        GroupMembership[] response = check self.clientEp-> get(path, targetType = GroupMembershipArr);
        return response;
    }
    # Adds computer to a group, using the static membership type
    #
    # + groupid - Group ID 
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function postGroupMemberships(string groupid, string computerid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/Memberships/${computerid}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> post(path, request, targetType = json);
        return response;
    }
    # Deletes a group membership for a given computer and group.  Note that this will only
    # work if the group membership type for the computer is 'Static'.
    #
    # + groupid - Group ID 
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function deleteGroupMemberships(string groupid, string computerid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/Memberships/${computerid}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllGroups() returns OptiTuneGroup[]|error {
        string  path = string `/api/v1/Groups`;
        OptiTuneGroup[] response = check self.clientEp-> get(path, targetType = OptiTuneGroupArr);
        return response;
    }
    # Adds a new group
    #
    # + payload - OptiTuneGroup data 
    # + return - OK 
    remote isolated function postGroups(OptiTuneGroup payload) returns OptiTuneGroup|error {
        string  path = string `/api/v1/Groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OptiTuneGroup response = check self.clientEp->post(path, request, targetType=OptiTuneGroup);
        return response;
    }
    # Looks up a given group, based on its ID
    #
    # + id - Group ID 
    # + return - OK 
    remote isolated function getGroups(string id) returns OptiTuneGroup|error {
        string  path = string `/api/v1/Groups/${id}`;
        OptiTuneGroup response = check self.clientEp-> get(path, targetType = OptiTuneGroup);
        return response;
    }
    # Deletes an existing group
    #
    # + id - Group ID 
    # + return - OK 
    remote isolated function deleteGroups(string id) returns json|error {
        string  path = string `/api/v1/Groups/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all install tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllInstallTasks() returns InstallTask[]|error {
        string  path = string `/api/v1/InstallTasks`;
        InstallTask[] response = check self.clientEp-> get(path, targetType = InstallTaskArr);
        return response;
    }
    # Adds a new install task.  If using PackageFileID, be sure to upload your package file first and get the ID of the file before calling this method
    #
    # + payload - InstallTask data 
    # + return - OK 
    remote isolated function postInstallTasks(InstallTask payload) returns InstallTask|error {
        string  path = string `/api/v1/InstallTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InstallTask response = check self.clientEp->post(path, request, targetType=InstallTask);
        return response;
    }
    # Gets a install task by ID
    #
    # + id - Install task ID 
    # + return - OK 
    remote isolated function getInstallTasks(string id) returns InstallTask|error {
        string  path = string `/api/v1/InstallTasks/${id}`;
        InstallTask response = check self.clientEp-> get(path, targetType = InstallTask);
        return response;
    }
    # Deletes an existing install task, and all of its associated deployments
    #
    # + id - Install task ID 
    # + return - OK 
    remote isolated function deleteInstallTasks(string id) returns json|error {
        string  path = string `/api/v1/InstallTasks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all applications installed on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getLocalUsers(string computerid) returns LocalUser[]|error {
        string  path = string `/api/v1/Computers/${computerid}/LocalUsers`;
        LocalUser[] response = check self.clientEp-> get(path, targetType = LocalUserArr);
        return response;
    }
    # Gets all mail templates in the organization
    #
    # + return - OK 
    remote isolated function getAllMailTemplates() returns MailTemplate[]|error {
        string  path = string `/api/v1/MailTemplates`;
        MailTemplate[] response = check self.clientEp-> get(path, targetType = MailTemplateArr);
        return response;
    }
    # Adds a new mail template
    #
    # + payload - MailTemplate data 
    # + return - OK 
    remote isolated function postMailTemplates(MailTemplate payload) returns MailTemplate|error {
        string  path = string `/api/v1/MailTemplates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MailTemplate response = check self.clientEp->post(path, request, targetType=MailTemplate);
        return response;
    }
    # Gets a mail template by ID
    #
    # + id - Mail template ID 
    # + return - OK 
    remote isolated function getMailTemplates(string id) returns MailTemplate|error {
        string  path = string `/api/v1/MailTemplates/${id}`;
        MailTemplate response = check self.clientEp-> get(path, targetType = MailTemplate);
        return response;
    }
    # Updates an existing mail template, using a given ID
    #
    # + id - Mail template ID 
    # + payload - MailTemplate data 
    # + return - OK 
    remote isolated function putMailTemplates(string id, MailTemplate payload) returns MailTemplate|error {
        string  path = string `/api/v1/MailTemplates/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        MailTemplate response = check self.clientEp->put(path, request, targetType=MailTemplate);
        return response;
    }
    # Deletes an existing mail template
    #
    # + id - Mail template ID 
    # + return - OK 
    remote isolated function deleteMailTemplates(string id) returns json|error {
        string  path = string `/api/v1/MailTemplates/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets any detected malware threats on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getMalwareThreats(string computerid) returns MalwareThreat[]|error {
        string  path = string `/api/v1/Computers/${computerid}/MalwareThreats`;
        MalwareThreat[] response = check self.clientEp-> get(path, targetType = MalwareThreatArr);
        return response;
    }
    # Gets the account members of a notification group by notification group ID
    #
    # + notificationgroupid - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroupMemberAccounts(string notificationgroupid) returns NotificationGroupMemberAccount[]|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/MemberAccounts`;
        NotificationGroupMemberAccount[] response = check self.clientEp-> get(path, targetType = NotificationGroupMemberAccountArr);
        return response;
    }
    # Adds an account to a notification group
    #
    # + notificationgroupid - Notification group ID 
    # + accountid - Account ID 
    # + payload - NotificationGroupMemberAccount data 
    # + return - OK 
    remote isolated function putNotificationGroupMemberAccounts(string notificationgroupid, string accountid, NotificationGroupMemberAccount payload) returns NotificationGroupMemberAccount|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/MemberAccounts/${accountid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationGroupMemberAccount response = check self.clientEp->put(path, request, targetType=NotificationGroupMemberAccount);
        return response;
    }
    # Deletes an existing notification group account
    #
    # + notificationgroupid - Notification group ID 
    # + accountid - Account ID 
    # + return - OK 
    remote isolated function deleteNotificationGroupMemberAccounts(string notificationgroupid, string accountid) returns json|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/MemberAccounts/${accountid}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the members of a notification group by notification group ID
    #
    # + notificationgroupid - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroupMembers(string notificationgroupid) returns NotificationGroupMember[]|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/Members`;
        NotificationGroupMember[] response = check self.clientEp-> get(path, targetType = NotificationGroupMemberArr);
        return response;
    }
    # Adds a member to a notification group.  For users that already have OptiTune accounts, use NotificationGroupMemberAccounts instead.
    #
    # + notificationgroupid - Notification group ID 
    # + payload - NotificationGroupMember data 
    # + return - OK 
    remote isolated function postNotificationGroupMembers(string notificationgroupid, NotificationGroupMember payload) returns NotificationGroupMember|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/Members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationGroupMember response = check self.clientEp->post(path, request, targetType=NotificationGroupMember);
        return response;
    }
    # Updates an existing notification group member
    #
    # + notificationgroupid - Notification group ID 
    # + notificationgroupmemberid - Notification group member ID 
    # + payload - NotificationGroupMember data 
    # + return - OK 
    remote isolated function putNotificationGroupMembers(string notificationgroupid, string notificationgroupmemberid, NotificationGroupMember payload) returns NotificationGroupMember|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/Members/${notificationgroupmemberid}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationGroupMember response = check self.clientEp->put(path, request, targetType=NotificationGroupMember);
        return response;
    }
    # Deletes an existing notification group member
    #
    # + notificationgroupid - Notification group ID 
    # + notificationgroupmemberid - Notification group member ID 
    # + return - OK 
    remote isolated function deleteNotificationGroupMembers(string notificationgroupid, string notificationgroupmemberid) returns json|error {
        string  path = string `/api/v1/NotificationGroups/${notificationgroupid}/Members/${notificationgroupmemberid}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all notification groups in the organization
    #
    # + return - OK 
    remote isolated function getAllNotificationGroups() returns NotificationGroup[]|error {
        string  path = string `/api/v1/NotificationGroups`;
        NotificationGroup[] response = check self.clientEp-> get(path, targetType = NotificationGroupArr);
        return response;
    }
    # Adds a new notification group
    #
    # + payload - NotificationGroup data 
    # + return - OK 
    remote isolated function postNotificationGroups(NotificationGroup payload) returns NotificationGroup|error {
        string  path = string `/api/v1/NotificationGroups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationGroup response = check self.clientEp->post(path, request, targetType=NotificationGroup);
        return response;
    }
    # Gets a notification group by ID
    #
    # + id - Notification group ID 
    # + return - OK 
    remote isolated function getNotificationGroups(string id) returns NotificationGroup|error {
        string  path = string `/api/v1/NotificationGroups/${id}`;
        NotificationGroup response = check self.clientEp-> get(path, targetType = NotificationGroup);
        return response;
    }
    # Updates an existing notification group, using a given ID
    #
    # + id - Notification group ID 
    # + payload - NotificationGroup data 
    # + return - OK 
    remote isolated function putNotificationGroups(string id, NotificationGroup payload) returns NotificationGroup|error {
        string  path = string `/api/v1/NotificationGroups/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        NotificationGroup response = check self.clientEp->put(path, request, targetType=NotificationGroup);
        return response;
    }
    # Deletes an existing notification group
    #
    # + id - Notification group ID 
    # + return - OK 
    remote isolated function deleteNotificationGroups(string id) returns json|error {
        string  path = string `/api/v1/NotificationGroups/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all tasks in the organization, that match the given taskType.  Use AllTasks to get all tasks in the organization.
    #
    # + taskType - Task type 
    # + return - OK 
    remote isolated function getAllOptiTuneTasks(string taskType) returns OptiTuneTask[]|error {
        string  path = string `/api/v1/OptiTuneTasks`;
        map<anydata> queryParam = {"taskType": taskType};
        path = path + check getPathForQueryParam(queryParam);
        OptiTuneTask[] response = check self.clientEp-> get(path, targetType = OptiTuneTaskArr);
        return response;
    }
    # Gets a task by ID
    #
    # + id - Task ID 
    # + return - OK 
    remote isolated function getOptiTuneTasks(string id) returns OptiTuneTask|error {
        string  path = string `/api/v1/OptiTuneTasks/${id}`;
        OptiTuneTask response = check self.clientEp-> get(path, targetType = OptiTuneTask);
        return response;
    }
    # Gets an organization's license usage data for an optional date and time range, in UTC
    #
    # + organizationid - Organization ID 
    # + startDateTime - Start Date Time 
    # + endDateTime - End Date Time 
    # + return - OK 
    remote isolated function getOrganizationsBillingLicenseUsageByDate(string organizationid, string? startDateTime = (), string? endDateTime = ()) returns BillingLicenseUsage[]|error {
        string  path = string `/api/v1/Organizations/${organizationid}/BillingLicenseUsage`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        path = path + check getPathForQueryParam(queryParam);
        BillingLicenseUsage[] response = check self.clientEp-> get(path, targetType = BillingLicenseUsageArr);
        return response;
    }
    # Gets all organizations on the management server.  You need to have master administrator privileges to call any of the Organization resource methods
    #
    # + return - OK 
    remote isolated function getAllOrganizations() returns Organization[]|error {
        string  path = string `/api/v1/Organizations`;
        Organization[] response = check self.clientEp-> get(path, targetType = OrganizationArr);
        return response;
    }
    # Adds a new organization
    #
    # + payload - OrganizationRegistration data 
    # + generateApiCredentials - Generate Api credentials 
    # + return - OK 
    remote isolated function postOrganizations(OrganizationRegistration payload, boolean generateApiCredentials = false) returns Organization|error {
        string  path = string `/api/v1/Organizations`;
        map<anydata> queryParam = {"generateApiCredentials": generateApiCredentials};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Organization response = check self.clientEp->post(path, request, targetType=Organization);
        return response;
    }
    # Gets a organization by ID
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function getOrganizations(string id) returns Organization|error {
        string  path = string `/api/v1/Organizations/${id}`;
        Organization response = check self.clientEp-> get(path, targetType = Organization);
        return response;
    }
    # Updates an existing organization, using a given ID
    #
    # + id - Organization ID 
    # + payload - Organization data 
    # + return - OK 
    remote isolated function putOrganizations(string id, Organization payload) returns Organization|error {
        string  path = string `/api/v1/Organizations/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Organization response = check self.clientEp->put(path, request, targetType=Organization);
        return response;
    }
    # Deletes an existing organization, and all of its associated data
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function deleteOrganizations(string id) returns json|error {
        string  path = string `/api/v1/Organizations/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all organization settings, for all organizations
    #
    # + return - OK 
    remote isolated function getAllOrganizationSettings() returns OrganizationSettings[]|error {
        string  path = string `/api/v1/OrganizationSettings`;
        OrganizationSettings[] response = check self.clientEp-> get(path, targetType = OrganizationSettingsArr);
        return response;
    }
    # Gets an organization settings by organization ID
    #
    # + id - Organization ID 
    # + return - OK 
    remote isolated function getOrganizationSettings(string id) returns OrganizationSettings|error {
        string  path = string `/api/v1/OrganizationSettings/${id}`;
        OrganizationSettings response = check self.clientEp-> get(path, targetType = OrganizationSettings);
        return response;
    }
    # Updates an existing organization settings, using a given organization ID
    #
    # + id - Organization ID 
    # + payload - OrganizationSettings data 
    # + return - OK 
    remote isolated function putOrganizationSettings(string id, OrganizationSettings payload) returns OrganizationSettings|error {
        string  path = string `/api/v1/OrganizationSettings/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OrganizationSettings response = check self.clientEp->put(path, request, targetType=OrganizationSettings);
        return response;
    }
    # Gets the performance settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getPerformanceSettings(string groupid) returns PerformanceSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/PerformanceSettings`;
        PerformanceSettings response = check self.clientEp-> get(path, targetType = PerformanceSettings);
        return response;
    }
    # Adds or updates performance settings for a given group
    #
    # + groupid - Group ID 
    # + payload - PerformanceSettings data 
    # + return - OK 
    remote isolated function putPerformanceSettings(string groupid, PerformanceSettings payload) returns PerformanceSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/PerformanceSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        PerformanceSettings response = check self.clientEp->put(path, request, targetType=PerformanceSettings);
        return response;
    }
    # Deletes performance settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deletePerformanceSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/PerformanceSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all performance settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllPerformanceSettings() returns PerformanceSettings[]|error {
        string  path = string `/api/v1/PerformanceSettings`;
        PerformanceSettings[] response = check self.clientEp-> get(path, targetType = PerformanceSettingsArr);
        return response;
    }
    # Gets all product keys for the organization
    #
    # + return - OK 
    remote isolated function getAllProductKeys() returns ProductKey[]|error {
        string  path = string `/api/v1/ProductKeys`;
        ProductKey[] response = check self.clientEp-> get(path, targetType = ProductKeyArr);
        return response;
    }
    # Adds a new product key for the organization
    #
    # + payload - ProductKey data 
    # + return - OK 
    remote isolated function postProductKeys(ProductKey payload) returns ProductKey|error {
        string  path = string `/api/v1/ProductKeys`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProductKey response = check self.clientEp->post(path, request, targetType=ProductKey);
        return response;
    }
    # Gets the remote access settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getRemoteAccessSettings(string groupid) returns RemoteAccessSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/RemoteAccessSettings`;
        RemoteAccessSettings response = check self.clientEp-> get(path, targetType = RemoteAccessSettings);
        return response;
    }
    # Adds or updates remote access settings for a given group
    #
    # + groupid - Group ID 
    # + payload - RemoteAccessSettings data 
    # + return - OK 
    remote isolated function putRemoteAccessSettings(string groupid, RemoteAccessSettings payload) returns RemoteAccessSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/RemoteAccessSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteAccessSettings response = check self.clientEp->put(path, request, targetType=RemoteAccessSettings);
        return response;
    }
    # Deletes existing remote access settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteRemoteAccessSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/RemoteAccessSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all remote access settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllRemoteAccessSettings() returns RemoteAccessSettings[]|error {
        string  path = string `/api/v1/RemoteAccessSettings`;
        RemoteAccessSettings[] response = check self.clientEp-> get(path, targetType = RemoteAccessSettingsArr);
        return response;
    }
    # Gets all remoteAssistanceRequests in the organization
    #
    # + return - OK 
    remote isolated function getAllRemoteAssistanceRequests() returns RemoteAssistanceRequest[]|error {
        string  path = string `/api/v1/RemoteAssistanceRequests`;
        RemoteAssistanceRequest[] response = check self.clientEp-> get(path, targetType = RemoteAssistanceRequestArr);
        return response;
    }
    # Adds a new RemoteAssistanceRequest
    #
    # + payload - RemoteAssistanceRequest data 
    # + return - OK 
    remote isolated function postRemoteAssistanceRequests(RemoteAssistanceRequest payload) returns RemoteAssistanceRequest|error {
        string  path = string `/api/v1/RemoteAssistanceRequests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteAssistanceRequest response = check self.clientEp->post(path, request, targetType=RemoteAssistanceRequest);
        return response;
    }
    # Gets a remoteAssistanceRequest by ID
    #
    # + id - RemoteAssistanceRequest ID 
    # + return - OK 
    remote isolated function getRemoteAssistanceRequests(string id) returns RemoteAssistanceRequest|error {
        string  path = string `/api/v1/RemoteAssistanceRequests/${id}`;
        RemoteAssistanceRequest response = check self.clientEp-> get(path, targetType = RemoteAssistanceRequest);
        return response;
    }
    # Updates an existing RemoteAssistanceRequest, using a given ID
    #
    # + id - RemoteAssistanceRequest ID 
    # + payload - RemoteAssistanceRequest data 
    # + return - OK 
    remote isolated function putRemoteAssistanceRequests(string id, RemoteAssistanceRequest payload) returns RemoteAssistanceRequest|error {
        string  path = string `/api/v1/RemoteAssistanceRequests/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RemoteAssistanceRequest response = check self.clientEp->put(path, request, targetType=RemoteAssistanceRequest);
        return response;
    }
    # Deletes an existing remote assistance request
    #
    # + id - Remote assistance request ID 
    # + return - OK 
    remote isolated function deleteRemoteAssistanceRequests(string id) returns json|error {
        string  path = string `/api/v1/RemoteAssistanceRequests/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # This will initiate a remote connection to the given computer, and return an .OTC file used by the Remote Connect software
    # which will in turn connect to the remote computer.  Note that if the computer in question is not connected to OptiTune,
    # it will not work, so it is suggested that the caller check the computer's connection status before making this request.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getRemoteConnections(string computerid) returns json|error {
        string  path = string `/api/v1/Computers/${computerid}/RemoteConnection`;
        json response = check self.clientEp-> get(path, targetType = json);
        return response;
    }
    # This will initiate a remote connection to the given computer, and return an URI with a custom url scheme (otcfile://) used by the Remote Connect software
    # which will in turn connect to the remote computer.  Note that if the computer in question is not connected to OptiTune,
    # it will not work, so it is suggested that the caller check the computer's connection status before making this request.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getUriRemoteConnections(string computerid) returns string|error {
        string  path = string `/api/v1/Computers/${computerid}/RemoteConnectionUri`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Gets all repair tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllRepairTasks() returns RepairTask[]|error {
        string  path = string `/api/v1/RepairTasks`;
        RepairTask[] response = check self.clientEp-> get(path, targetType = RepairTaskArr);
        return response;
    }
    # Adds a new repair task
    #
    # + payload - RepairTask data 
    # + return - OK 
    remote isolated function postRepairTasks(RepairTask payload) returns RepairTask|error {
        string  path = string `/api/v1/RepairTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        RepairTask response = check self.clientEp->post(path, request, targetType=RepairTask);
        return response;
    }
    # Gets a repair task by ID
    #
    # + id - Repair task ID 
    # + return - OK 
    remote isolated function getRepairTasks(string id) returns RepairTask|error {
        string  path = string `/api/v1/RepairTasks/${id}`;
        RepairTask response = check self.clientEp-> get(path, targetType = RepairTask);
        return response;
    }
    # Deletes an existing repair task, and all of its associated deployments
    #
    # + id - Repair task ID 
    # + return - OK 
    remote isolated function deleteRepairTasks(string id) returns json|error {
        string  path = string `/api/v1/RepairTasks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all retired computers in the organization
    #
    # + return - OK 
    remote isolated function getAllRetiredComputers() returns RetiredComputer[]|error {
        string  path = string `/api/v1/RetiredComputers`;
        RetiredComputer[] response = check self.clientEp-> get(path, targetType = RetiredComputerArr);
        return response;
    }
    # Gets a retired computer by computer ID
    #
    # + id - Retired computer ID 
    # + return - OK 
    remote isolated function getRetiredComputers(string id) returns RetiredComputer|error {
        string  path = string `/api/v1/RetiredComputers/${id}`;
        RetiredComputer response = check self.clientEp-> get(path, targetType = RetiredComputer);
        return response;
    }
    # Removes an existing retired computer, allowing to access OptiTune again
    #
    # + id - Retired computer ID 
    # + return - OK 
    remote isolated function deleteRetiredComputers(string id) returns json|error {
        string  path = string `/api/v1/RetiredComputers/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all script tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllScriptTasks() returns ScriptTask[]|error {
        string  path = string `/api/v1/ScriptTasks`;
        ScriptTask[] response = check self.clientEp-> get(path, targetType = ScriptTaskArr);
        return response;
    }
    # Adds a new script task
    #
    # + payload - ScriptTask data 
    # + return - OK 
    remote isolated function postScriptTasks(ScriptTask payload) returns ScriptTask|error {
        string  path = string `/api/v1/ScriptTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ScriptTask response = check self.clientEp->post(path, request, targetType=ScriptTask);
        return response;
    }
    # Gets a script task by task ID
    #
    # + id - Script task ID 
    # + return - OK 
    remote isolated function getScriptTasks(string id) returns ScriptTask|error {
        string  path = string `/api/v1/ScriptTasks/${id}`;
        ScriptTask response = check self.clientEp-> get(path, targetType = ScriptTask);
        return response;
    }
    # Deletes an existing script task, and all of its associated deployments
    #
    # + id - Script task ID 
    # + return - OK 
    remote isolated function deleteScriptTasks(string id) returns json|error {
        string  path = string `/api/v1/ScriptTasks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets the ID of the singleton group for a given computer ID.  The singleton group is used when creating settings or deploying tasks to a single computer.
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getSingletonGroups(string computerid) returns string|error {
        string  path = string `/api/v1/Computers/${computerid}/SingletonGroup`;
        string response = check self.clientEp-> get(path, targetType = string);
        return response;
    }
    # Gets all system tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllSystemTasks() returns SystemTask[]|error {
        string  path = string `/api/v1/SystemTasks`;
        SystemTask[] response = check self.clientEp-> get(path, targetType = SystemTaskArr);
        return response;
    }
    # Gets a system task by ID
    #
    # + id - System task ID 
    # + return - OK 
    remote isolated function getSystemTasks(string id) returns SystemTask|error {
        string  path = string `/api/v1/SystemTasks/${id}`;
        SystemTask response = check self.clientEp-> get(path, targetType = SystemTask);
        return response;
    }
    # Gets the tray icon settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getTrayIconSettings(string groupid) returns TrayIconSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/TrayIconSettings`;
        TrayIconSettings response = check self.clientEp-> get(path, targetType = TrayIconSettings);
        return response;
    }
    # Adds or updates tray icon settings for a given group
    #
    # + groupid - Group ID 
    # + payload - TrayIconSettings data 
    # + return - OK 
    remote isolated function putTrayIconSettings(string groupid, TrayIconSettings payload) returns TrayIconSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/TrayIconSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TrayIconSettings response = check self.clientEp->put(path, request, targetType=TrayIconSettings);
        return response;
    }
    # Deletes existing tray icon settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteTrayIconSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/TrayIconSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all tray icon settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllTrayIconSettings() returns TrayIconSettings[]|error {
        string  path = string `/api/v1/TrayIconSettings`;
        TrayIconSettings[] response = check self.clientEp-> get(path, targetType = TrayIconSettingsArr);
        return response;
    }
    # Gets all uninstall tasks in the organization
    #
    # + return - OK 
    remote isolated function getAllUninstallTasks() returns UninstallTask[]|error {
        string  path = string `/api/v1/UninstallTasks`;
        UninstallTask[] response = check self.clientEp-> get(path, targetType = UninstallTaskArr);
        return response;
    }
    # Adds a new uninstall task
    #
    # + payload - UninstallTask data 
    # + return - OK 
    remote isolated function postUninstallTasks(UninstallTask payload) returns UninstallTask|error {
        string  path = string `/api/v1/UninstallTasks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        UninstallTask response = check self.clientEp->post(path, request, targetType=UninstallTask);
        return response;
    }
    # Gets a uninstall task by ID
    #
    # + id - Uninstall task ID 
    # + return - OK 
    remote isolated function getUninstallTasks(string id) returns UninstallTask|error {
        string  path = string `/api/v1/UninstallTasks/${id}`;
        UninstallTask response = check self.clientEp-> get(path, targetType = UninstallTask);
        return response;
    }
    # Deletes an existing uninstall task, and all of its associated deployments
    #
    # + id - Uninstall task ID 
    # + return - OK 
    remote isolated function deleteUninstallTasks(string id) returns json|error {
        string  path = string `/api/v1/UninstallTasks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all webhooks in the organization
    #
    # + return - OK 
    remote isolated function getAllWebhooks() returns Webhook[]|error {
        string  path = string `/api/v1/Webhooks`;
        Webhook[] response = check self.clientEp-> get(path, targetType = WebhookArr);
        return response;
    }
    # Adds a new Webhook
    #
    # + payload - Webhook data 
    # + return - OK 
    remote isolated function postWebhooks(Webhook payload) returns Webhook|error {
        string  path = string `/api/v1/Webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->post(path, request, targetType=Webhook);
        return response;
    }
    # Gets a webhook by ID
    #
    # + id - Webhook ID 
    # + return - OK 
    remote isolated function getWebhooks(string id) returns Webhook|error {
        string  path = string `/api/v1/Webhooks/${id}`;
        Webhook response = check self.clientEp-> get(path, targetType = Webhook);
        return response;
    }
    # Updates an existing Webhook, using a given ID
    #
    # + id - Webhook ID 
    # + payload - Webhook data 
    # + return - OK 
    remote isolated function putWebhooks(string id, Webhook payload) returns Webhook|error {
        string  path = string `/api/v1/Webhooks/${id}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Webhook response = check self.clientEp->put(path, request, targetType=Webhook);
        return response;
    }
    # Deletes an existing Webhook
    #
    # + id - Webhook ID 
    # + return - OK 
    remote isolated function deleteWebhooks(string id) returns json|error {
        string  path = string `/api/v1/Webhooks/${id}`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets windows event log entries on a given computer
    #
    # + computerid - Computer ID 
    # + startDateTime - Start Date Time 
    # + endDateTime - End Date Time 
    # + return - OK 
    remote isolated function getWindowsEventLog(string computerid, string? startDateTime = (), string? endDateTime = ()) returns WindowsEventLogEntry[]|error {
        string  path = string `/api/v1/Computers/${computerid}/WindowsEventLog`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        path = path + check getPathForQueryParam(queryParam);
        WindowsEventLogEntry[] response = check self.clientEp-> get(path, targetType = WindowsEventLogEntryArr);
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
        string  path = string `/api/v1/Computers/${computerid}/WindowsEventLog/${logNameId}`;
        map<anydata> queryParam = {"startDateTime": startDateTime, "endDateTime": endDateTime};
        path = path + check getPathForQueryParam(queryParam);
        WindowsEventLogEntry[] response = check self.clientEp-> get(path, targetType = WindowsEventLogEntryArr);
        return response;
    }
    # Gets the names and IDs of all windows event logs for the organization.  The log IDs are needed to query event log entries for a given computer.
    #
    # + return - OK 
    remote isolated function getWindowsEventLogNames() returns WindowsEventLogName[]|error {
        string  path = string `/api/v1/WindowsEventLogNames`;
        WindowsEventLogName[] response = check self.clientEp-> get(path, targetType = WindowsEventLogNameArr);
        return response;
    }
    # Gets the windows event log settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getWindowsEventLogSettings(string groupid) returns WindowsEventLogSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsEventLogSettings`;
        WindowsEventLogSettings response = check self.clientEp-> get(path, targetType = WindowsEventLogSettings);
        return response;
    }
    # Adds or updates windows event log settings for a given group
    #
    # + groupid - Group ID 
    # + payload - WindowsEventLogSettings data 
    # + return - OK 
    remote isolated function putWindowsEventLogSettings(string groupid, WindowsEventLogSettings payload) returns WindowsEventLogSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsEventLogSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WindowsEventLogSettings response = check self.clientEp->put(path, request, targetType=WindowsEventLogSettings);
        return response;
    }
    # Deletes existing windows event log settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteWindowsEventLogSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsEventLogSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all windows event log settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsEventLogSettings() returns WindowsEventLogSettings[]|error {
        string  path = string `/api/v1/WindowsEventLogSettings`;
        WindowsEventLogSettings[] response = check self.clientEp-> get(path, targetType = WindowsEventLogSettingsArr);
        return response;
    }
    # Gets all windows updates that belong to a given windows update category
    #
    # + categoryid - Category ID 
    # + return - OK 
    remote isolated function getMembersWindowsUpdateCategories(string categoryid) returns WindowsUpdate[]|error {
        string  path = string `/api/v1/api/v1/WindowsUpdateCategory/${categoryid}/Members`;
        WindowsUpdate[] response = check self.clientEp-> get(path, targetType = WindowsUpdateArr);
        return response;
    }
    # Gets all windows update categories in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdateCategories() returns WindowsUpdateCategory[]|error {
        string  path = string `/api/v1/WindowsUpdateCategories`;
        WindowsUpdateCategory[] response = check self.clientEp-> get(path, targetType = WindowsUpdateCategoryArr);
        return response;
    }
    # Gets a windows update category by ID
    #
    # + id - Category ID 
    # + return - OK 
    remote isolated function getWindowsUpdateCategories(string id) returns WindowsUpdateCategory|error {
        string  path = string `/api/v1/WindowsUpdateCategories/${id}`;
        WindowsUpdateCategory response = check self.clientEp-> get(path, targetType = WindowsUpdateCategory);
        return response;
    }
    # Gets the state of all windows updates on a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getWindowsUpdateComputerState(string computerid) returns WindowsUpdateComputerState[]|error {
        string  path = string `/api/v1/Computers/${computerid}/UpdateState`;
        WindowsUpdateComputerState[] response = check self.clientEp-> get(path, targetType = WindowsUpdateComputerStateArr);
        return response;
    }
    # Gets the entire windows update history for a given computer
    #
    # + computerid - Computer ID 
    # + return - OK 
    remote isolated function getWindowsUpdateHistory(string computerid) returns WindowsUpdateHistoryEntry[]|error {
        string  path = string `/api/v1/Computers/${computerid}/WindowsUpdateHistory`;
        WindowsUpdateHistoryEntry[] response = check self.clientEp-> get(path, targetType = WindowsUpdateHistoryEntryArr);
        return response;
    }
    # Gets all windows updates in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdates() returns WindowsUpdate[]|error {
        string  path = string `/api/v1/WindowsUpdates`;
        WindowsUpdate[] response = check self.clientEp-> get(path, targetType = WindowsUpdateArr);
        return response;
    }
    # Gets a windows update by its ID
    #
    # + id - Windows update ID 
    # + return - OK 
    remote isolated function getWindowsUpdates(string id) returns WindowsUpdate|error {
        string  path = string `/api/v1/WindowsUpdates/${id}`;
        WindowsUpdate response = check self.clientEp-> get(path, targetType = WindowsUpdate);
        return response;
    }
    # Gets the windows update settings for a given group, if available
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function getWindowsUpdateSettings(string groupid) returns WindowsUpdateSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsUpdateSettings`;
        WindowsUpdateSettings response = check self.clientEp-> get(path, targetType = WindowsUpdateSettings);
        return response;
    }
    # Adds or updates windows update settings for a given group
    #
    # + groupid - Group ID 
    # + payload - WindowsUpdateSettings data 
    # + return - OK 
    remote isolated function putWindowsUpdateSettings(string groupid, WindowsUpdateSettings payload) returns WindowsUpdateSettings|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsUpdateSettings`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WindowsUpdateSettings response = check self.clientEp->put(path, request, targetType=WindowsUpdateSettings);
        return response;
    }
    # Deletes windows update settings for a given group
    #
    # + groupid - Group ID 
    # + return - OK 
    remote isolated function deleteWindowsUpdateSettings(string groupid) returns json|error {
        string  path = string `/api/v1/Groups/${groupid}/WindowsUpdateSettings`;
        json response = check self.clientEp-> delete(path, targetType = json);
        return response;
    }
    # Gets all windows update settings for all groups in the organization
    #
    # + return - OK 
    remote isolated function getAllWindowsUpdateSettings() returns WindowsUpdateSettings[]|error {
        string  path = string `/api/v1/WindowsUpdateSettings`;
        WindowsUpdateSettings[] response = check self.clientEp-> get(path, targetType = WindowsUpdateSettingsArr);
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
