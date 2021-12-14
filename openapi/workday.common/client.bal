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

# This is a generated connector for [WorkDay Common Service REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The WorkDay common service enables applications to access REST service for common resources shared by multiple product areas.
@display {label: "Workday Common", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieves a collection of workers.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + search - Searches ~workers~ by name. The search is case-insensitive. You can include space-delimited search strings for an OR search. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfWorkers(int? 'limit = (), int? offset = (), string? search = ()) returns InlineResponse200|error {
        string resourcePath = string `/workers`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of direct reports for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerReports(string id, int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/workers/${id}/directReports`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a direct report instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getReportForWorker(string id, string subresourceID) returns WorkerSummary|error {
        string resourcePath = string `/workers/${id}/directReports/${subresourceID}`;
        WorkerSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of organizations for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getOrgForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2001|error {
        string resourcePath = string `/workers/${id}/organizations`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an organization instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerOrganization(string id, string subresourceID) returns WorkerOrganizationSummary|error {
        string resourcePath = string `/workers/${id}/organizations/${subresourceID}`;
        WorkerOrganizationSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of inbox tasks for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getTaskForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2002|error {
        string resourcePath = string `/workers/${id}/inboxTasks`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an inbox task instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInboxTaskForWorker(string id, string subresourceID) returns InboxTaskSummary|error {
        string resourcePath = string `/workers/${id}/inboxTasks/${subresourceID}`;
        InboxTaskSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of time off entries for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getTimeOffEntriesForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2003|error {
        string resourcePath = string `/workers/${id}/timeOffEntries`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a time off entry for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getTimeOffEntryForWorker(string id, string subresourceID) returns TimeOffEntries|error {
        string resourcePath = string `/workers/${id}/timeOffEntries/${subresourceID}`;
        TimeOffEntries response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of time off plans for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getTimeOffPlansForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2004|error {
        string resourcePath = string `/workers/${id}/timeOffPlans`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a particular time off plan for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getTimeOffPlan(string id, string subresourceID) returns TimeOffPlans|error {
        string resourcePath = string `/workers/${id}/timeOffPlans/${subresourceID}`;
        TimeOffPlans response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of history items for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getHistoryItemsForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2005|error {
        string resourcePath = string `/workers/${id}/history`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a history instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getHistoryInstanceForWorker(string id, string subresourceID) returns BusinessProcessSummary|error {
        string resourcePath = string `/workers/${id}/history/${subresourceID}`;
        BusinessProcessSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of business title changes for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionBusinessTitleChanges(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2006|error {
        string resourcePath = string `/workers/${id}/businessTitleChanges`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a business title change instance with the specified data.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createBusinessTitleChange(string id, BusinessTitleChangeInput payload) returns BusinessTitleChangeInput|error {
        string resourcePath = string `/workers/${id}/businessTitleChanges`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "Application/json");
        BusinessTitleChangeInput response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a business title change instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessTitleChangeForWorker(string id, string subresourceID) returns BusinessTitleChangeDetail|error {
        string resourcePath = string `/workers/${id}/businessTitleChanges/${subresourceID}`;
        BusinessTitleChangeDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of supervisory organizations managed by a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupervisoryOrgsManagedByWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2007|error {
        string resourcePath = string `/workers/${id}/supervisoryOrganizationsManaged`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a supervisory organization managed by a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupervisoryOrgManagedByWorker(string id, string subresourceID) returns SupervisoryOrganizationSummary|error {
        string resourcePath = string `/workers/${id}/supervisoryOrganizationsManaged/${subresourceID}`;
        SupervisoryOrganizationSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of pay slips for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPaySlipsForWorker(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2008|error {
        string resourcePath = string `/workers/${id}/paySlips`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2008 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a pay slip instance for a specific worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPaySlipInstancesForWorker(string id, string subresourceID) returns PaySlipSummary|error {
        string resourcePath = string `/workers/${id}/paySlips/${subresourceID}`;
        PaySlipSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a worker instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerInstance(string id) returns WorkerProfile|error {
        string resourcePath = string `/workers/${id}`;
        WorkerProfile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a job change instance with the specified data.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function createJobChange(string id, ChangeJobInput payload) returns ChangeJobInput|error {
        string resourcePath = string `/workers/${id}/jobChanges`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ChangeJobInput response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a business title change instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessTitle(string id) returns BusinessTitleChangeDetail|error {
        string resourcePath = string `/businessTitleChanges/${id}`;
        BusinessTitleChangeDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of currencies.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCurrencies(int? 'limit = (), int? offset = ()) returns InlineResponse2009|error {
        string resourcePath = string `/currencies`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a currency instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCurrencyInstance(string id) returns CurrencySummary|error {
        string resourcePath = string `/currencies/${id}`;
        CurrencySummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of audit logs.
    #
    # + 'from - Returns value entered in "From Moment" parm 
    # + instancesReturned - Numeric 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + returnUserActivityEntryCount - Boolean 
    # + systemAccount - The system account that initiated the request. 
    # + taskId - The Workday ID of the task executed in the transaction. 
    # + to - Returns value entered in "To Moment" parm 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAuditLogs(string? 'from = (), int? instancesReturned = (), int? 'limit = (), int? offset = (), boolean? returnUserActivityEntryCount = (), string? systemAccount = (), string? taskId = (), string? to = ()) returns InlineResponse20010|error {
        string resourcePath = string `/auditLogs`;
        map<anydata> queryParam = {"from": 'from, "instancesReturned": instancesReturned, "limit": 'limit, "offset": offset, "returnUserActivityEntryCount": returnUserActivityEntryCount, "systemAccount": systemAccount, "taskId": taskId, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an audit log instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAuditLogInstance(string id) returns UserActivityTracking|error {
        string resourcePath = string `/auditLogs/${id}`;
        UserActivityTracking response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of supervisory organizations.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfSupervisoryOrgs(int? 'limit = (), int? offset = ()) returns InlineResponse2007|error {
        string resourcePath = string `/supervisoryOrganizations`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a supervisory organization instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSupervisoryOrgInstance(string id) returns SupervisoryOrganizationSummary|error {
        string resourcePath = string `/supervisoryOrganizations/${id}`;
        SupervisoryOrganizationSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of workers for a specific supervisory organization.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkersOfSupervisoryOrg(string id, int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/supervisoryOrganizations/${id}/workers`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a worker instance for a specific supervisory organization.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerForSupervisoryOrg(string id, string subresourceID) returns WorkerSummary|error {
        string resourcePath = string `/supervisoryOrganizations/${id}/workers/${subresourceID}`;
        WorkerSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of job change reasons.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getJobChangeReason(int? 'limit = (), int? offset = ()) returns InlineResponse20011|error {
        string resourcePath = string `/jobChangeReasons`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse20011 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a job change reason instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getJobChangeInstance(string id) returns JobChangeReasonSummary|error {
        string resourcePath = string `/jobChangeReasons/${id}`;
        JobChangeReasonSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Validates the allowed and required worktag types and worktag combinations for a transaction.
    #
    # + return - Resource created. 
    remote isolated function validateWorkTagTypes(ValidateWorktagInput payload) returns ValidateWorktagInput|error {
        string resourcePath = string `/validateWorktags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "Apllication/json");
        ValidateWorktagInput response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves a customer instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCustomerInstance(string id) returns Customer|error {
        string resourcePath = string `/customers/${id}`;
        Customer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of activities for a specific customer.
    #
    # + id - The Workday ID of the resource. 
    # + fromDate - The transaction date for the reporting transaction. NOTE: If used a filtering criteria for expense reports, please use Expense Report Date report field instead to improve performance. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + toDate - The transaction date for the reporting transaction. NOTE: If used a filtering criteria for expense reports, please use Expense Report Date report field instead to improve performance. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkerActivities(string id, string? fromDate = (), int? 'limit = (), int? offset = (), string? toDate = ()) returns InlineResponse20012|error {
        string resourcePath = string `/customers/${id}/activities`;
        map<anydata> queryParam = {"fromDate": fromDate, "limit": 'limit, "offset": offset, "toDate": toDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse20012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an activity instance for a specific customer.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getActivityForCustomer(string id, string subresourceID) returns Activity|error {
        string resourcePath = string `/customers/${id}/activities/${subresourceID}`;
        Activity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of organizations.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getOrgCollection(int? 'limit = (), int? offset = ()) returns InlineResponse20013|error {
        string resourcePath = string `/organizations`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse20013 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an organization instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getOrgInstance(string id) returns OrganizationSummary|error {
        string resourcePath = string `/organizations/${id}`;
        OrganizationSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of organization types.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getOrganizationTypes(int? 'limit = (), int? offset = ()) returns InlineResponse20014|error {
        string resourcePath = string `/organizationTypes`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse20014 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves an organization type instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getOrgTypeInstance(string id) returns OrganizationTypeSummary|error {
        string resourcePath = string `/organizationTypes/${id}`;
        OrganizationTypeSummary response = check self.clientEp->get(resourcePath);
        return response;
    }
}
