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

# This is a generated connector from [Azure Analysis Services API v2017-08-01](https://azure.microsoft.com/en-us/services/analysis-services/) OpenAPI specification.
# The Azure Analysis Services Web API provides a RESTful set of web services that enables users to create, retrieve, update, and delete Analysis Services servers
@display {label: "Azure Analysis Services", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Azure Analysis Services account](https://azure.microsoft.com/en-us/services/analysis-services/) and obtain OAuth tokens following [this guide](https://docs.microsoft.com/en-us/azure/analysis-services/analysis-services-manage-users#authentication).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://management.azure.com/") returns error? {
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
    # Gets details about the specified Analysis Services server.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be a minimum of 3 characters, and a maximum of 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. The operation was successful. 
    remote isolated function serversGetdetails(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns AnalysisServicesServer|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AnalysisServicesServer response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Provisions the specified Analysis Services server based on the configuration specified in the request.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be a minimum of 3 characters, and a maximum of 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + payload - Contains the information used to provision the Analysis Services server. 
    # + return - OK. The operation completed successfully. 
    remote isolated function serversCreate(string resourceGroupName, string serverName, string apiVersion, string subscriptionId, AnalysisServicesServer payload) returns AnalysisServicesServer|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalysisServicesServer response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes the specified Analysis Services server.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. 
    remote isolated function serversDelete(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates the current state of the specified Analysis Services server.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + payload - Request object that contains the updated information for the server. 
    # + return - OK 
    remote isolated function serversUpdate(string resourceGroupName, string serverName, string apiVersion, string subscriptionId, AnalysisServicesServerUpdateParameters payload) returns AnalysisServicesServer|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AnalysisServicesServer response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Suspends operation of the specified Analysis Services server instance.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. 
    remote isolated function serversSuspend(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}/suspend`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Resumes operation of the specified Analysis Services server instance.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK 
    remote isolated function serversResume(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}/resume`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Gets all the Analysis Services servers for the given resource group.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK 
    remote isolated function serversListbyresourcegroup(string resourceGroupName, string apiVersion, string subscriptionId) returns AnalysisServicesServers|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AnalysisServicesServers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists all the Analysis Services servers for the given subscription.
    #
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK 
    remote isolated function serversList(string apiVersion, string subscriptionId) returns AnalysisServicesServers|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.AnalysisServices/servers`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        AnalysisServicesServers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists eligible SKUs for Analysis Services resource provider.
    #
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK 
    remote isolated function serversListskusfornew(string apiVersion, string subscriptionId) returns SkuEnumerationForNewResourceResult|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.AnalysisServices/skus`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SkuEnumerationForNewResourceResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists eligible SKUs for an Analysis Services resource.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK 
    remote isolated function serversListskusforexisting(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns SkuEnumerationForExistingResourceResult|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}/skus`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        SkuEnumerationForExistingResourceResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Return the gateway status of the specified Analysis Services server instance.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. 
    remote isolated function serversListgatewaystatus(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns GatewayListStatusLive|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}/listGatewayStatus`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        GatewayListStatusLive response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Dissociates a Unified Gateway associated with the server.
    #
    # + resourceGroupName - The name of the Azure Resource group of which a given Analysis Services server is part. This name must be at least 1 character in length, and no more than 90. 
    # + serverName - The name of the Analysis Services server. It must be at least 3 characters in length, and no more than 63. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. 
    remote isolated function serversDissociategateway(string resourceGroupName, string serverName, string apiVersion, string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.AnalysisServices/servers/${getEncodedUri(serverName)}/dissociateGateway`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Check the name availability in the target location.
    #
    # + location - The region name which the operation will lookup into. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + payload - Contains the information used to provision the Analysis Services server. 
    # + return - OK. The request has succeeded. 
    remote isolated function serversChecknameavailability(string location, string apiVersion, string subscriptionId, CheckServerNameAvailabilityParameters payload) returns CheckServerNameAvailabilityResult|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.AnalysisServices/locations/${getEncodedUri(location)}/checkNameAvailability`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CheckServerNameAvailabilityResult response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List the result of the specified operation.
    #
    # + location - The region name which the operation will lookup into. 
    # + operationId - The target operation Id. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. The operation completed. 
    remote isolated function serversListoperationresults(string location, string operationId, string apiVersion, string subscriptionId) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.AnalysisServices/locations/${getEncodedUri(location)}/operationresults/${getEncodedUri(operationId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List the status of operation.
    #
    # + location - The region name which the operation will lookup into. 
    # + operationId - The target operation Id. 
    # + apiVersion - The client API version. 
    # + subscriptionId - A unique identifier for a Microsoft Azure subscription. The subscription ID forms part of the URI for every service call. 
    # + return - OK. The operation completed. 
    remote isolated function serversListoperationstatuses(string location, string operationId, string apiVersion, string subscriptionId) returns OperationStatus|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.AnalysisServices/locations/${getEncodedUri(location)}/operationstatuses/${getEncodedUri(operationId)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OperationStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists all of the available consumption REST API operations.
    #
    # + apiVersion - The client API version. 
    # + return - OK. The request has succeeded. 
    remote isolated function operationsList(string apiVersion) returns OperationListResult|error {
        string resourcePath = string `/providers/Microsoft.AnalysisServices/operations`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        OperationListResult response = check self.clientEp->get(resourcePath);
        return response;
    }
}
