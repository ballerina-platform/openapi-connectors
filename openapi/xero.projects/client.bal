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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Xero Projects API v2.16.0](https://developer.xero.com/documentation/api/projects/overview) OpenAPI specification.
# The Xero Projects API is a collection of endpoints which businesses to track time and costs on projects/jobs and report on profitability.
@display {label: "Xero Projects", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Xero account](https://developer.xero.com/app/manage) and obtain tokens by following [this guide](https://developer.xero.com/documentation/getting-started-guide/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.xero.com/projects.xro/2.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Retrieves all projects
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectIds - Search for all projects that match a comma separated list of projectIds 
    # + contactID - Filter for projects for a specific contact 
    # + states - Filter for projects in a particular state (INPROGRESS or CLOSED) 
    # + page - set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0. 
    # + pageSize - Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500. 
    # + return - OK/success, returns a list of project objects 
    remote isolated function getProjects(string xeroTenantId, string[]? projectIds = (), string? contactID = (), string? states = (), int page = 1, int pageSize = 50) returns Projects|error {
        string  path = string `/Projects`;
        map<anydata> queryParam = {"projectIds": projectIds, "contactID": contactID, "states": states, "page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Projects response = check self.clientEp-> get(path, accHeaders, targetType = Projects);
        return response;
    }
    # Create one or more new projects
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + payload - Create a new project with ProjectCreateOrUpdate object 
    # + return - OK/success, returns the new project object 
    remote isolated function createProject(string xeroTenantId, ProjectCreateOrUpdate payload) returns Project|error {
        string  path = string `/Projects`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, headers = accHeaders, targetType=Project);
        return response;
    }
    # Retrieves a single project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + return - OK/success, returns a list of project objects 
    remote isolated function getProject(string xeroTenantId, string projectId) returns Project|error {
        string  path = string `/Projects/${projectId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Project response = check self.clientEp-> get(path, accHeaders, targetType = Project);
        return response;
    }
    # Updates a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + payload - Request of type ProjectCreateOrUpdate 
    # + return - Success - return response 204 no content 
    remote isolated function updateProject(string xeroTenantId, string projectId, ProjectCreateOrUpdate payload) returns http:Response|error {
        string  path = string `/Projects/${projectId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # creates a project for the specified contact
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + payload - Update the status of an existing Project 
    # + return - Success - return response 204 no content 
    remote isolated function patchProject(string xeroTenantId, string projectId, ProjectPatch payload) returns http:Response|error {
        string  path = string `/Projects/${projectId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Retrieves a list of all project users
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + page - set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0. 
    # + pageSize - Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500. 
    # + return - OK/success, returns a list of project objects 
    remote isolated function getProjectUsers(string xeroTenantId, int page = 1, int pageSize = 50) returns ProjectUsers|error {
        string  path = string `/ProjectsUsers`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ProjectUsers response = check self.clientEp-> get(path, accHeaders, targetType = ProjectUsers);
        return response;
    }
    # Retrieves all project tasks
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + page - Set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0. 
    # + pageSize - Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500. 
    # + taskIds - taskIds	Search for all tasks that match a comma separated list of taskIds, i.e. GET https://.../tasks?taskIds={taskID},{taskID} 
    # + chargeType - Can be `TIME`, `FIXED` or `NON_CHARGEABLE`, defines how the task will be charged. Use `TIME` when you want to charge per hour and `FIXED` to charge as a fixed amount. If the task will not be charged use `NON_CHARGEABLE`. 
    # + return - OK/success, returns a list of task objects 
    remote isolated function getTasks(string xeroTenantId, string projectId, int? page = (), int? pageSize = (), string? taskIds = (), ChargeType? chargeType = ()) returns Tasks|error {
        string  path = string `/Projects/${projectId}/Tasks`;
        map<anydata> queryParam = {"page": page, "pageSize": pageSize, "taskIds": taskIds, "chargeType": chargeType};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Tasks response = check self.clientEp-> get(path, accHeaders, targetType = Tasks);
        return response;
    }
    # Retrieves a single project task
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + taskId - You can specify an individual task by appending the taskId to the endpoint, i.e. GET https://.../tasks/{taskID} 
    # + return - OK/success, returns a list of task objects 
    remote isolated function getTask(string xeroTenantId, string projectId, string taskId) returns Task|error {
        string  path = string `/Projects/${projectId}/Tasks/${taskId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Task response = check self.clientEp-> get(path, accHeaders, targetType = Task);
        return response;
    }
    # Retrieves all time entries associated with a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - Identifier of the project, that the task (which the time entry is logged against) belongs to. 
    # + userId - The xero user identifier of the person who logged time. 
    # + taskId - Identifier of the task that time entry is logged against. 
    # + invoiceId - Finds all time entries for this invoice. 
    # + contactId - Finds all time entries for this contact identifier. 
    # + page - Set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0. 
    # + pageSize - Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500. 
    # + states - Comma-separated list of states to find. Will find all time entries that are in the status of whatever is specified.	 
    # + isChargeable - Finds all time entries which relate to tasks with the charge type 'TIME' or 'FIXED'. 
    # + dateAfterUtc - ISO 8601 UTC date. Finds all time entries on or after this date filtered on the `dateUtc` field. 
    # + dateBeforeUtc - ISO 8601 UTC date. Finds all time entries on or before this date filtered on the `dateUtc` field. 
    # + return - OK/success, returns a list of time entry objects 
    remote isolated function getTimeEntries(string xeroTenantId, string projectId, string? userId = (), string? taskId = (), string? invoiceId = (), string? contactId = (), int? page = (), int? pageSize = (), string[]? states = (), boolean? isChargeable = (), string? dateAfterUtc = (), string? dateBeforeUtc = ()) returns TimeEntries|error {
        string  path = string `/Projects/${projectId}/Time`;
        map<anydata> queryParam = {"userId": userId, "taskId": taskId, "invoiceId": invoiceId, "contactId": contactId, "page": page, "pageSize": pageSize, "states": states, "isChargeable": isChargeable, "dateAfterUtc": dateAfterUtc, "dateBeforeUtc": dateBeforeUtc};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TimeEntries response = check self.clientEp-> get(path, accHeaders, targetType = TimeEntries);
        return response;
    }
    # Creates a time entry for a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + payload - The time entry object you are creating 
    # + return - OK/success, returns the newly created time entry 
    remote isolated function createTimeEntry(string xeroTenantId, string projectId, TimeEntryCreateOrUpdate payload) returns TimeEntry|error {
        string  path = string `/Projects/${projectId}/Time`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeEntry response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TimeEntry);
        return response;
    }
    # Retrieves a single time entry for a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + timeEntryId - You can specify an individual time entry by appending the id to the endpoint 
    # + return - OK/success, returns a single time entry 
    remote isolated function getTimeEntry(string xeroTenantId, string projectId, string timeEntryId) returns TimeEntry|error {
        string  path = string `/Projects/${projectId}/Time/${timeEntryId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TimeEntry response = check self.clientEp-> get(path, accHeaders, targetType = TimeEntry);
        return response;
    }
    # Updates a time entry for a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + timeEntryId - You can specify an individual time entry by appending the id to the endpoint 
    # + payload - The time entry object you are updating 
    # + return - Success - return response 204 no content 
    remote isolated function updateTimeEntry(string xeroTenantId, string projectId, string timeEntryId, TimeEntryCreateOrUpdate payload) returns http:Response|error {
        string  path = string `/Projects/${projectId}/Time/${timeEntryId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Deletes a time entry for a specific project
    #
    # + xeroTenantId - Xero identifier for Tenant 
    # + projectId - You can specify an individual project by appending the projectId to the endpoint 
    # + timeEntryId - You can specify an individual task by appending the id to the endpoint 
    # + return - Success - return response 204 no content 
    remote isolated function deleteTimeEntry(string xeroTenantId, string projectId, string timeEntryId) returns http:Response|error {
        string  path = string `/Projects/${projectId}/Time/${timeEntryId}`;
        map<any> headerValues = {"Xero-Tenant-Id": xeroTenantId};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
