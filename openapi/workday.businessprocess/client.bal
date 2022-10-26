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

# This is a generated connector for [WorkDay Business Process REST API v1](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The WorkDay business process service enables applications to access information on event actions and details
@display {label: "Workday Business Process", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
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
    # Retrieves business process event steps.
    #
    # + businessProcess - The business process type of the event that the step is associated with. 
    # + createdOnOrAfter - The last moment the step was updated. 
    # + createdOnOrBefore - The last moment the step was updated. 
    # + dueDateOnOrAfter - Returns the due date for this step. 
    # + dueDateOnOrBefore - Returns the due date for this step. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + stepType - Retired. We retire this report field because when there are multiple steps on the business process definition that are associated with this event step, this report field doesn't return the step type for each associated step. We recommend that you use the Step Type report field instead. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessProcessEventSteps(string[]? businessProcess = (), string? createdOnOrAfter = (), string? createdOnOrBefore = (), string? dueDateOnOrAfter = (), string? dueDateOnOrBefore = (), int? 'limit = (), int? offset = (), string[]? stepType = ()) returns InlineResponse200|error {
        string resourcePath = string `/eventSteps`;
        map<anydata> queryParam = {"businessProcess": businessProcess, "createdOnOrAfter": createdOnOrAfter, "createdOnOrBefore": createdOnOrBefore, "dueDateOnOrAfter": dueDateOnOrAfter, "dueDateOnOrBefore": dueDateOnOrBefore, "limit": 'limit, "offset": offset, "stepType": stepType};
        map<Encoding> queryParamEncoding = {"businessProcess": {style: FORM, explode: true}, "stepType": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves business process events.
    #
    # + businessProcess - The business process type associated with the business process. Returns filterable search results. Use with the Business Process Type data source. 
    # + completedOnOrAfter - The date and time the business process was completed. 
    # + completedOnOrBefore - The date and time the business process was completed. 
    # + initiatedOnOrAfter - The date and time this business process was initiated. 
    # + initiatedOnOrBefore - The date and time this business process was initiated. 
    # + initiator - The ~worker~ that initiated the business process. Please do not use this field in a condition rule for the initiation step of a process, as it will not return results. This is because there is no initiating ~worker~ designated until the process has started. The Initiating ~Worker~ field only gets a value after the event is initiated (after the process is submitted). 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + status - Transaction Status for Facet Search 
    # + 'worker - Event about ~Worker~ for Facet Search 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessProcessEvents(string[]? businessProcess = (), string? completedOnOrAfter = (), string? completedOnOrBefore = (), string? initiatedOnOrAfter = (), string? initiatedOnOrBefore = (), string[]? initiator = (), int? 'limit = (), int? offset = (), string[]? status = (), string? 'worker = ()) returns InlineResponse2001|error {
        string resourcePath = string `/events`;
        map<anydata> queryParam = {"businessProcess": businessProcess, "completedOnOrAfter": completedOnOrAfter, "completedOnOrBefore": completedOnOrBefore, "initiatedOnOrAfter": initiatedOnOrAfter, "initiatedOnOrBefore": initiatedOnOrBefore, "initiator": initiator, "limit": 'limit, "offset": offset, "status": status, "worker": 'worker};
        map<Encoding> queryParamEncoding = {"businessProcess": {style: FORM, explode: true}, "initiator": {style: FORM, explode: true}, "status": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves completed steps for a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCompletedStepsBusinessProcess(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2002|error {
        string resourcePath = string `/events/${getEncodedUri(id)}/completedSteps`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves all business process types.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAllBusinessProcessTypes(int? 'limit = (), int? offset = ()) returns InlineResponse2003|error {
        string resourcePath = string `/types`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves attachments for a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAttachmentBusinessProcessEvent(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2004|error {
        string resourcePath = string `/events/${getEncodedUri(id)}/attachments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a business process type.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessProcessTypeByID(string id) returns BusinessProcessTypeDetails|error {
        string resourcePath = string `/types/${getEncodedUri(id)}`;
        BusinessProcessTypeDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a business process event step.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessProcessEventStepByID(string id) returns EventStepsView|error {
        string resourcePath = string `/eventSteps/${getEncodedUri(id)}`;
        EventStepsView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves comments for a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCommentsBusinessProcessEvent(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2005|error {
        string resourcePath = string `/events/${getEncodedUri(id)}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves in progress steps for a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInProcessStepsBusinessProcessEvent(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2006|error {
        string resourcePath = string `/events/${getEncodedUri(id)}/inProgressSteps`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Denies a business process event step.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function deniesBusinessProcess(string id, BusinessProcessStepsDeny payload) returns BusinessProcessStepsDeny|error {
        string resourcePath = string `/eventSteps/${getEncodedUri(id)}/deny`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BusinessProcessStepsDeny response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + eventStep - Please do not add superclasses to, or relationships on this class without first discussing with the BPF team. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getRetrievesInstances(string? eventStep = ()) returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/sendBack/to/`;
        map<anydata> queryParam = {"eventStep": eventStep};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves remaining steps for a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getRemainingStepsBusinessProcessEvent(string id, int? 'limit = (), int? offset = ()) returns InlineResponse2007|error {
        string resourcePath = string `/events/${getEncodedUri(id)}/remainingSteps`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves attachment categories for a business process type.
    #
    # + id - The Workday ID of the resource. 
    # + eventTarget - The Workday ID of the event target that this business process is about. You can use a returned id from an API that returns instances of the event target type. For example, if your event target is a worker, use GET /workers in the Staffing service. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getAttachmentCategories(string id, string? eventTarget = (), int? 'limit = (), int? offset = ()) returns InlineResponse2008|error {
        string resourcePath = string `/types/${getEncodedUri(id)}/attachmentCategories`;
        map<anydata> queryParam = {"eventTarget": eventTarget, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2008 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a business process event.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getBusinessProcessEvent(string id) returns EventDetails|error {
        string resourcePath = string `/events/${getEncodedUri(id)}`;
        EventDetails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Approves a business process event step.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function approveBusinessProcess(string id, BusinessProcessStepsApprove payload) returns BusinessProcessStepsApprove|error {
        string resourcePath = string `/eventSteps/${getEncodedUri(id)}/approve`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BusinessProcessStepsApprove response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Sends back a business process event step.
    #
    # + id - The Workday ID of the resource. 
    # + return - Resource created. 
    remote isolated function sendBackBusinessProcessEvent(string id, BusinessProcessStepSendBack payload) returns BusinessProcessStepSendBack|error {
        string resourcePath = string `/eventSteps/${getEncodedUri(id)}/sendBack`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BusinessProcessStepSendBack response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
