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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `Authorization`
    string authorization;
|};

# This is a generated connector for [BMC Hardware Sentry TrueSight Presentation Server REST API v1.0](https://docs.bmc.com/docs/display/tsps107/Getting+started) OpenAPI specification.  
# The BMC Hardware Sentry TrueSight Presentation Server API provides the capability to access data from various TrueSight products to provide a consolidated set of views for monitoring the infrastructure, real and synthetic applications, and capacity planning.
@display {label: "Bmc TrueSight Presentation Server", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [user account](https://docs.bmc.com/docs/sso90/managing-users-474056900.html#Managingusers-Toaddanewuser) in BMC Hardware Sentry TrueSight Presentation Server and obtain tokens following [this guide](https://docs.bmc.com/docs/display/tsps107/TSWS+authentication).
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, string serviceUrl, http:ClientConfiguration clientConfig =  {}) returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # Triggers a new collect on a specific device.
    #
    # + deviceId - The ID of the device. 
    # + monitorClass - The Monitor Class of the device. 
    # + return - Successful operation 
    remote isolated function collectNow(int deviceId, string monitorClass) returns ActionResponse|error {
        string resourcePath = string `/hardware/actions/${getEncodedUri(deviceId)}/collect-now`;
        map<anydata> queryParam = {"monitorClass": monitorClass};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Triggers a new discovery on a specific device.
    #
    # + deviceId - The ID of the device. 
    # + return - Successful operation 
    remote isolated function rediscover(int deviceId) returns ActionResponse|error {
        string resourcePath = string `/hardware/actions/${getEncodedUri(deviceId)}/rediscover`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Sends a 'Reinitialize KM' command.
    #
    # + deviceId - The ID of the device. 
    # + payload - The request body as a JSON payload. 
    # + return - Successful operation 
    remote isolated function reinitialize(int deviceId, ReinitializeActionConfiguration payload) returns ActionResponse|error {
        string resourcePath = string `/hardware/actions/${getEncodedUri(deviceId)}/reinitialize`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ActionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Removes a specific instance from the monitoring environment.
    #
    # + deviceId - The ID of the device. 
    # + monitorClass - The Monitor Class of the device. 
    # + monitorSid - The Monitor SID of the device. 
    # + return - Successful operation 
    remote isolated function remove(int deviceId, string monitorClass, string monitorSid) returns ActionResponse|error {
        string resourcePath = string `/hardware/actions/${getEncodedUri(deviceId)}/remove`;
        map<anydata> queryParam = {"monitorClass": monitorClass, "monitorSid": monitorSid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Resets the Error Count parameter.
    #
    # + deviceId - The ID of the device. 
    # + monitorClass - The Monitor Class of the device. 
    # + monitorSid - The Monitor SID of the device. 
    # + return - Successful operation 
    remote isolated function reset(int deviceId, string monitorClass, string monitorSid) returns ActionResponse|error {
        string resourcePath = string `/hardware/actions/${getEncodedUri(deviceId)}/reset-error-count`;
        map<anydata> queryParam = {"monitorClass": monitorClass, "monitorSid": monitorSid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        ActionResponse response = check self.clientEp->post(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets summarized information about all monitored applications.
    #
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + direction - The sorting order (case insensitive). 
    # + sort - The column to sort by (case insensitive). 
    # + return - Successful operation 
    remote isolated function getApplications(string page = "0", int 'limit = 100, string direction = "asc", string sort = "name") returns ResultPage|error {
        string resourcePath = string `/hardware/applications`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "direction": direction, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets detailed information for a specific application.
    #
    # + applicationId - The ID of the application. 
    # + return - Successful operation 
    remote isolated function getOneApplication(string applicationId) returns ApplicationSummary|error {
        string resourcePath = string `/hardware/applications/${getEncodedUri(applicationId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApplicationSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets the Monitors for a specific device.
    #
    # + deviceId - The ID of the device. 
    # + return - Successful operation 
    remote isolated function getDeviceMonitors(int deviceId) returns http:Response|error {
        string resourcePath = string `/hardware/device-monitors/${getEncodedUri(deviceId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Response response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets summarized information about all monitored devices.
    #
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + direction - The sorting order (case insensitive). 
    # + sort - The column to sort by (case insensitive). 
    # + groupId - The ID of the group. 
    # + applicationId - The ID of the application. 
    # + serviceId - The ID of the service. 
    # + return - Successful operation 
    remote isolated function getDevices(string page = "0", int 'limit = 100, string direction = "asc", string sort = "name", string? groupId = (), string? applicationId = (), string? serviceId = ()) returns ResultPage|error {
        string resourcePath = string `/hardware/devices`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "direction": direction, "sort": sort, "groupId": groupId, "applicationId": applicationId, "serviceId": serviceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets overall information for all devices.
    #
    # + return - Successful operation 
    remote isolated function getDevicesSummary() returns GlobalSummary|error {
        string resourcePath = string `/hardware/devices-summary`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GlobalSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets detailed information about a specific device.
    #
    # + deviceId - The ID of the device. 
    # + return - Successful operation 
    remote isolated function getDevice(int deviceId) returns DeviceSummary|error {
        string resourcePath = string `/hardware/devices/${getEncodedUri(deviceId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets detailed information about an Agent.
    #
    # + deviceId - The ID of the device. 
    # + return - Successful operation 
    remote isolated function getDeviceAgent(int deviceId) returns DeviceAgent|error {
        string resourcePath = string `/hardware/devices/${getEncodedUri(deviceId)}/agent`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        DeviceAgent response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets a list of all the devices monitored by an Agent.
    #
    # + deviceId - The ID of the device. 
    # + return - Successful operation 
    remote isolated function getAgentDevices(int deviceId) returns ResultPage|error {
        string resourcePath = string `/hardware/devices/${getEncodedUri(deviceId)}/agent-devices`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets data history for a parameter of a specific device over a given period.
    #
    # + deviceId - The ID of the device. 
    # + parameterName - The name of the parameter. 
    # + monitorType - The unique name of the Monitor type. 
    # + 'from - Beginning of the period (Epoch time, in seconds). 
    # + to - End of the period (Epoch time, in seconds). 
    # + monitorSid - The Monitor SID (to filter the list of Monitors). 
    # + return - Successful operation 
    remote isolated function getDeviceParameterHistory(int deviceId, string parameterName, string monitorType, int? 'from = (), int? to = (), string? monitorSid = ()) returns ResultPage|error {
        string resourcePath = string `/hardware/devices/${getEncodedUri(deviceId)}/parameter-history`;
        map<anydata> queryParam = {"parameterName": parameterName, "monitorType": monitorType, "from": 'from, "to": to, "monitorSid": monitorSid};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets the energy usage for a specific device and a given period.
    #
    # + deviceId - The ID of the device. 
    # + rollPeriod - The period for which you wish to retrieve energy usage data. 
    # + basis - Subdivision of the period for which you wish to retrieve energy usage data. 
    # + return - Successful operation 
    remote isolated function getDeviceEnergyUsage(int deviceId, string rollPeriod = "ONE_DAY", string basis = "HOURLY") returns ResultPage|error {
        string resourcePath = string `/hardware/energy-usage/${getEncodedUri(deviceId)}`;
        map<anydata> queryParam = {"rollPeriod": rollPeriod, "basis": basis};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets all group summaries.
    #
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + direction - The sorting order (case insensitive). 
    # + sort - The column to sort by (case insensitive). 
    # + return - Successful operation 
    remote isolated function getGroups(string page = "0", int 'limit = 100, string direction = "asc", string sort = "name") returns ResultPage|error {
        string resourcePath = string `/hardware/groups`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "direction": direction, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets detailed information about a specific group.
    #
    # + groupId - The ID of the group. 
    # + return - Successful operation 
    remote isolated function getOneGroup(string groupId) returns GroupSummary|error {
        string resourcePath = string `/hardware/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        GroupSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Updates the values of the energy footprint parameter for a specific group.
    #
    # + groupId - The ID of the group. 
    # + payload - The values you wish to assign. 
    # + return - Successful operation 
    remote isolated function updateEnergyCost(string groupId, GroupConfiguration payload) returns GlobalSummary|error {
        string resourcePath = string `/hardware/groups/${getEncodedUri(groupId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GlobalSummary response = check self.clientEp->put(resourcePath, request, httpHeaders);
        return response;
    }
    # Gets the heating margin values for each monitored device, when available.
    #
    # + covered - If set to <em>true</em>, only gets devices whose heating margin information is available.<br>Otherwise, gets any other devices. 
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + direction - The sorting order (case insensitive). 
    # + sort - The column to sort by (case insensitive). 
    # + groupId - The ID of the group. 
    # + applicationId - The ID of the application. 
    # + serviceId - The ID of the service. 
    # + return - Successful operation 
    remote isolated function getHeatingMarginCoverage(boolean covered = true, string page = "0", int 'limit = 100, string direction = "asc", string sort = "name", string? groupId = (), string? applicationId = (), string? serviceId = ()) returns ResultPage|error {
        string resourcePath = string `/hardware/heating-margin-devices`;
        map<anydata> queryParam = {"covered": covered, "page": page, "limit": 'limit, "direction": direction, "sort": sort, "groupId": groupId, "applicationId": applicationId, "serviceId": serviceId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets historical data for a specific group, application or service.
    #
    # + groupId - The ID of the group. 
    # + applicationId - The ID of the application. 
    # + serviceId - The ID of the service. 
    # + 'from - Beginning of the period (Epoch time, in seconds). 
    # + to - End of the period (Epoch time, in seconds). 
    # + return - Successful operation 
    remote isolated function getHistory(string? groupId = (), string? applicationId = (), string? serviceId = (), int? 'from = (), int? to = ()) returns ResultPage|error {
        string resourcePath = string `/hardware/history`;
        map<anydata> queryParam = {"groupId": groupId, "applicationId": applicationId, "serviceId": serviceId, "from": 'from, "to": to};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Searches devices by name, model, manufacturer or serial number.
    #
    # + searchTerms - Space-separated search criteria. 
    # + groupId - The ID of the group. 
    # + applicationId - The ID of the application. 
    # + serviceId - The ID of the service. 
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + return - Successful operation 
    remote isolated function searchDevices(string searchTerms, string? groupId = (), string? applicationId = (), string? serviceId = (), string page = "0", int 'limit = 100) returns ResultPage|error {
        string resourcePath = string `/hardware/search-devices`;
        map<anydata> queryParam = {"searchTerms": searchTerms, "groupId": groupId, "applicationId": applicationId, "serviceId": serviceId, "page": page, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets summarized information about all monitored services.
    #
    # + page - The page number to retrieve (first page is 0). 
    # + 'limit - The maximum number of entries per page. 
    # + direction - The sorting order (case insensitive). 
    # + sort - The column to sort by (case insensitive). 
    # + return - Successful operation 
    remote isolated function getServices(string page = "0", int 'limit = 100, string direction = "asc", string sort = "name") returns ResultPage|error {
        string resourcePath = string `/hardware/services`;
        map<anydata> queryParam = {"page": page, "limit": 'limit, "direction": direction, "sort": sort};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ResultPage response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # Gets detailed information about a specific service.
    #
    # + serviceId - The ID of the service. 
    # + return - Successful operation 
    remote isolated function getOneService(string serviceId) returns ServiceSummary|error {
        string resourcePath = string `/hardware/services/${getEncodedUri(serviceId)}`;
        map<any> headerValues = {"Authorization": self.apiKeyConfig.authorization};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ServiceSummary response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
