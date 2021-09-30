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

# This is a generated connector for [ADP Workers API v2](https://developers.adp.com/articles/api/workers---lifecycle-management-v2-api) OpenAPI specification.
# The Workers Lifecycle Management API provides the capability to manage workers work lifecycle.
# The worker.hire event indicates the creation of a work agreement between a person and an employer for the first time EVER. 
# Worker.Hire always results in a primary work assignment. Worker.hire may result in a worker status of either 'Active' or 'Pending' depending on whether or not the Worker.Start event is supported by the system of record.
@display {label: "ADP Workers Lifecycle Management", iconPath: "resources/adp.workerslifecyclemanagement.svg"}
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
    # Workers
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + payload - Hire event 
    # + return - Hire event 
    remote isolated function listWorkers(string roleCode, WorkerHireEvent payload, string? acceptLanguage = ()) returns WorkerHireEvent|error {
        string  path = string `/events/hr/v1/worker.hire`;
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkerHireEvent response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WorkerHireEvent);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + return - Workers 
    remote isolated function getWorkerMeta(string roleCode, string? filter = (), string? acceptLanguage = ()) returns WorkerHireEventMeta|error {
        string  path = string `/events/hr/v1/worker.hire/meta`;
        map<anydata> queryParam = {"$filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WorkerHireEventMeta response = check self.clientEp-> get(path, accHeaders, targetType = WorkerHireEventMeta);
        return response;
    }
    # Worker on leave. Worker's status changed to on leave effective on such and such a date
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + payload - On leave request body 
    # + return - On leave response 
    remote isolated function onLeave(string roleCode, WorkerOnLeaveEvent payload, string? acceptLanguage = ()) returns WorkerOnLeaveEvent|error {
        string  path = string `/events/hr/v1/worker.on-leave`;
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkerOnLeaveEvent response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WorkerOnLeaveEvent);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + return - On leave meta 
    remote isolated function onLeaveMeta(string roleCode, string? filter = (), string? acceptLanguage = ()) returns WorkerOnLeaveEventMeta|error {
        string  path = string `/events/hr/v1/worker.on-leave/meta`;
        map<anydata> queryParam = {"$filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WorkerOnLeaveEventMeta response = check self.clientEp-> get(path, accHeaders, targetType = WorkerOnLeaveEventMeta);
        return response;
    }
    # A worker is rehired.
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + payload - Rehire request body 
    # + return - Rehire response 
    remote isolated function rehire(string roleCode, WorkerRehireEvent payload, string? acceptLanguage = ()) returns WorkerRehireEvent|error {
        string  path = string `/events/hr/v1/worker.rehire`;
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkerRehireEvent response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WorkerRehireEvent);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + return - On leave meta 
    remote isolated function rehireMeta(string roleCode, string? filter = (), string? acceptLanguage = ()) returns WorkerRehireEventMeta|error {
        string  path = string `/events/hr/v1/worker.rehire/meta`;
        map<anydata> queryParam = {"$filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WorkerRehireEventMeta response = check self.clientEp-> get(path, accHeaders, targetType = WorkerRehireEventMeta);
        return response;
    }
    # A worker is terminated involuntarily.
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + payload - Terminate request body 
    # + return - Terminate response 
    remote isolated function terminate(string roleCode, WorkerTerminateEvent payload, string? acceptLanguage = ()) returns WorkerTerminateEvent|error {
        string  path = string `/events/hr/v1/worker.terminate`;
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WorkerTerminateEvent response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WorkerTerminateEvent);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction.  Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + acceptLanguage - “Accept-Language” “: ” ( language | “*” ) [“;” “q” “=”qvalue]. Specifies the language(s) that are acceptable for the response. The optional qvalue represents a quality level for acceptable languages. 
    # + return - Terminate meta 
    remote isolated function terminateMeta(string roleCode, string? filter = (), string? acceptLanguage = ()) returns WorkerTerminateEventMeta|error {
        string  path = string `/events/hr/v1/worker.terminate/meta`;
        map<anydata> queryParam = {"$filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode, "Accept-Language": acceptLanguage};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WorkerTerminateEventMeta response = check self.clientEp-> get(path, accHeaders, targetType = WorkerTerminateEventMeta);
        return response;
    }
}
