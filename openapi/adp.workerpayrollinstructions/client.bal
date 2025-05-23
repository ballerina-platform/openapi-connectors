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

# Worker payroll instructions are used to specify recurring general deductions, garnishments, and retirement plan deductions for a specified worker.
# The Worker Payroll Instructions v1 APIs are used to start or stop payroll instructions for a worker, or to change an instruction that was previously started.
# You can also view all of the payroll instructions for a worker. API metadata is available.
@display {label: "ADP Worker Payroll Instructions", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [ADP account](https://www.adp.com/) and obtain tokens by following [this guide](https://developers.adp.com/articles/guide/auth-process-data-conn-request-access-token).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
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
    # Request the list of all available payroll instructions that the requester is authorized to view
    #
    # + aoid - Associate OID 
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + return - Request the list of all available payroll outputs that the requester is authorized to view 
    remote isolated function listPayrollInstructions(string aoid, string roleCode) returns PayrollInstructions|error {
        string resourcePath = string `/payroll/v1/workers/${getEncodedUri(aoid)}/payroll-instructions`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PayrollInstructions response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Start worker general deduction instruction information
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payload - Start event 
    # + return - Start event 
    remote isolated function startWorkerGeneralInstructionEvent(string roleCode, WorkerGeneralDeductionInstructionStartEvent payload) returns WorkerGeneralDeductionInstructionStartEvent|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.start`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkerGeneralDeductionInstructionStartEvent response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + return - Return a payroll output details 
    remote isolated function getStartEventMetaData(string roleCode, string? filter = ()) returns WorkerGeneralDeductionInstructionStartEventMeta|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.start/meta`;
        map<anydata> queryParam = {"$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WorkerGeneralDeductionInstructionStartEventMeta response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Change worker general deduction instruction information
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payload - Change event 
    # + return - Change event 
    remote isolated function changeWorkerGeneralInstructionEvent(string roleCode, WorkerGeneralDeductionInstructionChangeEvent payload) returns WorkerGeneralDeductionInstructionChangeEvent|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.change`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkerGeneralDeductionInstructionChangeEvent response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + return - Returns a meta 
    remote isolated function getChangeEventMetaData(string roleCode, string? filter = ()) returns WorkerGeneralDeductionInstructionChangeEventMeta|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.change/meta`;
        map<anydata> queryParam = {"$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WorkerGeneralDeductionInstructionChangeEventMeta response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Stop worker general deduction instruction information
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + payload - Stop event 
    # + return - Stop event 
    remote isolated function stopWorkerGeneralInstructionEvent(string roleCode, WorkerGeneralDeductionInstructionStopEvent payload) returns WorkerGeneralDeductionInstructionStopEvent|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.stop`;
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        WorkerGeneralDeductionInstructionStopEvent response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Returns an event metadata
    #
    # + roleCode - The role the user is playing during the transaction. Possible values: employee,manager,practitioner,administrator,supervisor.  The roleCode header will be passed in all calls. When coming from Myself capabilities rolecode=employee. When coming from Team capabilities roleCode=manager. When coming from Practitioner capabilities roleCode=practitioner. 
    # + filter - The OData $filter parameter MUST be used to specify the filter criteria. The usage sample is below. Various criteria could be combined using and/or operands and () to set the operand precedence. Please refer """"RESTful Web API Design Standard"""" for more details $filter=/mobileUserAccounts/associateOID eq 'G4O73G9Z62SL2NFM' $filter=/mobileUserAccounts/organizationOID eq 'ABCDEFGH' $filter=/mobileUserAccounts/accountStatusCode eq 'STATCODE' $filter=/mobileUserAccounts/personName/givenName eq 'John' $filter=/mobileUserAccounts/personName/familyName1 eq 'Smith' $filter=/mobileUserAccounts/birthDate eq '01-01-1970' 
    # + return - Event meta data 
    remote isolated function getStopEventMetaData(string roleCode, string? filter = ()) returns WorkerGeneralDeductionInstructionStopEventMeta|error {
        string resourcePath = string `/events/payroll/v2/worker-general-deduction-instruction.stop/meta`;
        map<anydata> queryParam = {"$filter": filter};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"roleCode": roleCode};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        WorkerGeneralDeductionInstructionStopEventMeta response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
