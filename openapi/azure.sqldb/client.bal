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

# This is a generated connector from [Azure SQL DB API v1.0](https://docs.microsoft.com/en-us/azure/azure-sql/database/sql-database-paas-overview)  OpenAPI specification.
# This Azure SQL Database management API provides a RESTful set of web APIs that interact with Azure SQL Database services to manage your databases. The API enables users to create, retrieve, update, and delete databases, servers, and other entities.
@display {label: "Azure SQL DB", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the Azure SQL DB instance. 
    # Create a [Azure SQL DB](https://docs.microsoft.com/en-us/azure/azure-sql/database/logins-create-manage) application obtain tokens by using [this](https://docs.microsoft.com/en-us/azure/azure-sql/database/logins-create-manage)
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
    # Completes the restore operation on a managed database.
    #
    # + locationName - The name of the region where the resource is located. 
    # + operationId - Management operation id that this request tries to complete. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + payload - The definition for completing the restore of this managed database. 
    # + return - Successfully issued complete restore request. 
    remote isolated function completeRestoreManagedDatabases(string locationName, string operationId, string subscriptionId, string apiVersion, CompleteDatabaseRestoreDefinition payload) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/providers/Microsoft.Sql/locations/${getEncodedUri(locationName)}/managedDatabaseRestoreAzureAsyncOperation/${getEncodedUri(operationId)}/completeRestore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a list of managed databases.
    #
    # + resourceGroupName - The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API or the portal. 
    # + managedInstanceName - The name of the managed instance. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + return - Successfully retrieved the list of databases. 
    remote isolated function listManagedDatabasesByInstance(string resourceGroupName, string managedInstanceName, string subscriptionId, string apiVersion) returns ManagedDatabaseListResult|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.Sql/managedInstances/${getEncodedUri(managedInstanceName)}/databases`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ManagedDatabaseListResult response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets a managed database.
    #
    # + resourceGroupName - The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API or the portal. 
    # + managedInstanceName - The name of the managed instance. 
    # + databaseName - The name of the database. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + return - Successfully retrieved the specified managed database. 
    remote isolated function getManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion) returns ManagedDatabase|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.Sql/managedInstances/${getEncodedUri(managedInstanceName)}/databases/${getEncodedUri(databaseName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ManagedDatabase response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new database or updates an existing database.
    #
    # + resourceGroupName - The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API or the portal. 
    # + managedInstanceName - The name of the managed instance. 
    # + databaseName - The name of the database. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + payload - The requested database resource state. 
    # + return - Successfully updated the database. 
    remote isolated function createOrUpdateManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion, ManagedDatabase payload) returns ManagedDatabase|error? {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.Sql/managedInstances/${getEncodedUri(managedInstanceName)}/databases/${getEncodedUri(databaseName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ManagedDatabase? response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a managed database.
    #
    # + resourceGroupName - The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API or the portal. 
    # + managedInstanceName - The name of the managed instance. 
    # + databaseName - The name of the database. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + return - Successfully deleted the managed database. 
    remote isolated function deleteManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion) returns http:Response|error {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.Sql/managedInstances/${getEncodedUri(managedInstanceName)}/databases/${getEncodedUri(databaseName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates an existing database.
    #
    # + resourceGroupName - The name of the resource group that contains the resource. You can obtain this value from the Azure Resource Manager API or the portal. 
    # + managedInstanceName - The name of the managed instance. 
    # + databaseName - The name of the database. 
    # + subscriptionId - The subscription ID that identifies an Azure subscription. 
    # + apiVersion - The API version to use for the request. 
    # + payload - The requested database resource state. 
    # + return - Successfully updated the database. 
    remote isolated function updateManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion, ManagedDatabaseUpdate payload) returns ManagedDatabase|error? {
        string resourcePath = string `/subscriptions/${getEncodedUri(subscriptionId)}/resourceGroups/${getEncodedUri(resourceGroupName)}/providers/Microsoft.Sql/managedInstances/${getEncodedUri(managedInstanceName)}/databases/${getEncodedUri(databaseName)}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ManagedDatabase? response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
}
