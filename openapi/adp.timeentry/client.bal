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
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig auth;
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

# This is a generated connector for [ADP Time Entry API v1](https://developers.adp.com/articles/api/time-entry-v1-api) OpenAPI specification.
# The Time Entry API provides the capability to support the viewing of entries for a time period as specified by the System of Record (SOR) and may allow the creation and deletion of time entries based on rules determined by the SOR. 
# If authorized, the APIs support the resolution of exceptions in a timesheet and the review of timesheets.
@display {label: "ADP Time Entry", iconPath: "resources/adp.timeentry.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ADP account](https://www.adp.com/) and obtain tokens by following [this guide](https://developers.adp.com/articles/guide/auth-process-data-conn-request-access-token).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Request a time entry configuration
    #
    # + fields - Requests returning only the timeConfiguration object. fields=timeConfiguration 
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + ifNoneMatch - Used with a method to make it conditional; the method is performed only if the client entity (via the given entity tag, ETag header) does not match the server entity. 
    # + return - Request the list of all available payroll outputs that the requester is authorized to view 
    remote isolated function getTimeEntryDetails(string fields, string aoid, string roleCode, string? ifNoneMatch = ()) returns TimeEntryDetails|error {
        string  path = string `/time/v1/workers/${aoid}/time-entry-details`;
        map<anydata> queryParam = {"fields": fields};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "If-None-Match": ifNoneMatch};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TimeEntryDetails response = check self.clientEp-> get(path, accHeaders, targetType = TimeEntryDetails);
        return response;
    }
    # Approve 1 to many timesheets
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payload - Time sheet review 
    # + return - Time sheet review 
    remote isolated function reviewTimeSheet(string roleCode, TimeSheetsReview payload) returns TimeSheetsReview|error {
        string  path = string `/time/v1/timeSheets/review`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeSheetsReview response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TimeSheetsReview);
        return response;
    }
    # Time Entry Read
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + aoid - Associate OID 
    # + timeEntryId - Time Entry ID 
    # + return - Time entry 
    remote isolated function getTimeEntry(string roleCode, string aoid, string timeEntryId) returns TimeEntry|error {
        string  path = string `/time/v1/workers/${aoid}/time-entries/${timeEntryId}`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        TimeEntry response = check self.clientEp-> get(path, accHeaders, targetType = TimeEntry);
        return response;
    }
    # Resolve 1 to many exceptions
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payload - Entry 
    # + return - Entry 
    remote isolated function resolveEntryExceptions(string roleCode, TimeSheetsResolveExceptions payload) returns TimeSheetsResolveExceptions|error {
        string  path = string `/time/v1/timeSheets/resolveEntryExceptions`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TimeSheetsResolveExceptions response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TimeSheetsResolveExceptions);
        return response;
    }
}
