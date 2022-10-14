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

# This is a generated connector for [WorkDay AbsenceManagement REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The Absence Management service enables applications to access worker information about leaves of absence and time off details.
@display {label: "Workday Absence Management", iconPath: "icon.png"}
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
    # Retrieves the leave of absence for the specified worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrieveWorkerLeaveOfAbsence(string id, string subresourceID) returns LeavesOfAbsenceView|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/leavesOfAbsence/${getEncodedUri(subresourceID)}`;
        LeavesOfAbsenceView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesInstanceAsValuesForEndpointParameters() returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/leave/status/`;
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the specified balance of all absence plan and leave of absence types.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrieveAbsencePlaneBalance(string id) returns AbsenceBalanceView|error {
        string resourcePath = string `/balances/${getEncodedUri(id)}`;
        AbsenceBalanceView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesTimeOffInstancesForEndpointParameters() returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/timeOff/status/`;
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of eligible absence types for the specified worker.
    #
    # + id - The Workday ID of the resource. 
    # + category - The Workday ID of the absence type category. Valid values: * Leave of Absence Type: 17bd6531c90c100016d74f8dfae007d0  * Absence Table: 17bd6531c90c100016da3f5b554007d2 * Time Off: 17bd6531c90c100016d4b06f2b8a07ce 
    # + effective - The effective date for which eligible absence types need to be returned for the worker. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesCollectionOfAbsenceTypes(string id, string? category = (), string? effective = (), int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/eligibleAbsenceTypes`;
        map<anydata> queryParam = {"category": category, "effective": effective, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the Leaves Of Absence for a specified worker ID.
    #
    # + id - The Workday ID of the resource. 
    # + fromDate - The start of a date range filter using the yyyy-mm-dd format. 
    # + leaveType - The Workday ID of the type of Leave Of Absence. You can specify multiple leaveType query parameters. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + status - The Workday ID of the status of the Leave Of Absence. The valid statuses are Successfully Completed, In Progress, Canceled, Rescinded, and Process Terminated. To get the Workday ID of a status, call the GET /values/leave/status endpoint. You can specify multiple status query parameters. 
    # + toDate - The end of a date range filter using the yyyy-mm-dd format. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesLeavesOfAbsenceByWorkerID(string id, string? fromDate = (), string[]? leaveType = (), int? 'limit = (), int? offset = (), string[]? status = (), string? toDate = ()) returns InlineResponse2001|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/leavesOfAbsence`;
        map<anydata> queryParam = {"fromDate": fromDate, "leaveType": leaveType, "limit": 'limit, "offset": offset, "status": status, "toDate": toDate};
        map<Encoding> queryParamEncoding = {"leaveType": {style: FORM, explode: true}, "status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the balance of all absence plan and leave of absence type for the specified worker ID.
    #
    # + category - The Workday ID of the Time Off, Leave Type, or Absence Table. 
    # + effective - Absence balances as of the specified date using the yyyy-mm-dd format. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + 'worker - The Workday ID of the worker for which balances are returned. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesBalanacesAllAbasencePalnbyWorkerID(string? category = (), string? effective = (), int? 'limit = (), int? offset = (), string? 'worker = ()) returns InlineResponse2002|error {
        string resourcePath = string `/balances`;
        map<anydata> queryParam = {"category": category, "effective": effective, "limit": 'limit, "offset": offset, "worker": 'worker};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a time off request for the specified worker ID and initiates the business process.
    #
    # + id - The Workday ID of the resource. 
    # + payload - Request payload 
    # + return - Resource created. 
    remote isolated function createsTimeOffRequest(string id, TimeOffRequestEventView payload) returns TimeOffRequestEventView|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/requestTimeOff`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TimeOffRequestEventView response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves the valid time off dates for the specified worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesValidTimeOffDates(string id, string subresourceID) returns DailyQuantityView|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/validTimeOffDates/${getEncodedUri(subresourceID)}`;
        DailyQuantityView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of workers and current staffing information.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesWorkersInfo(string id) returns WorkerData|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}`;
        WorkerData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of time off details for the specified worker.
    #
    # + id - The Workday ID of the resource. 
    # + fromDate - The start of a date range filter using the yyyy-mm-dd format. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + status - The Workday ID of the time off status. You can specify multiple status query parameters. This method returns the most recent instance of a time off entry based on this query parameter.  The valid statuses are Approved, Submitted, Not Submitted, and Sent Back. This method does not return Canceled and Denied Time Off Entries. To get the Workday ID of a status, call the GET /values/timeOff/status endpoint. You can specify multiple status query parameters. Example: An approved Time Off Entry for Vacation 8 hours was corrected to Vacation 4 hours and is not in submitted status. If the query parameter is status = approved, the Time Off Entry of Vacation, 8 hours, Approved is returned. If query parameter status = submitted, the Time Off Entry of Vacation, 4 hours, Submitted is returned. If no query parameter is passed, the Time Off Entry of Vacation, 4 hours, Submitted is returned. 
    # + timeOffType - The Workday ID of the Time Off Type. You can specify multiple timeOffType query parameters. 
    # + toDate - The end of a date range filter using the yyyy-mm-dd format. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesWorkerTimeOffDetails(string id, string? fromDate = (), int? 'limit = (), int? offset = (), string[]? status = (), string[]? timeOffType = (), string? toDate = ()) returns InlineResponse2003|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/timeOffDetails`;
        map<anydata> queryParam = {"fromDate": fromDate, "limit": 'limit, "offset": offset, "status": status, "timeOffType": timeOffType, "toDate": toDate};
        map<Encoding> queryParamEncoding = {"status": {style: FORM, explode: true}, "timeOffType": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the valid time off dates for the specified worker ID for the given dates.
    #
    # + id - The Workday ID of the resource. 
    # + date - The dates being requested for which to validate using the yyyy-mm-dd format. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + position - The Workday ID of the Position. 
    # + timeOff - The Workday ID of the Time Off. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesTimeOffDateByWorkerId(string id, string? date = (), int? 'limit = (), int? offset = (), string? position = (), string? timeOff = ()) returns InlineResponse2004|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/validTimeOffDates`;
        map<anydata> queryParam = {"date": date, "limit": 'limit, "offset": offset, "position": position, "timeOff": timeOff};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of workers and current staffing information.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + search - Searches workers by name. The search is case-insensitive. You can include space-delimited search strings for an OR search. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesStaffAndWorkersInfo(int? 'limit = (), int? offset = (), string? search = ()) returns InlineResponse2005|error {
        string resourcePath = string `/workers`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "search": search};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the eligible absence type for the specified worker.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function retrievesWorkerEligibleAbsenceType(string id, string subresourceID) returns EligibleAbsenceTypeView|error {
        string resourcePath = string `/workers/${getEncodedUri(id)}/eligibleAbsenceTypes/${getEncodedUri(subresourceID)}`;
        EligibleAbsenceTypeView response = check self.clientEp->get(resourcePath);
        return response;
    }
}
