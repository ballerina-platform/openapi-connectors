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

# This is a generated connector from [Azure SQL DB API v1.0](https://docs.microsoft.com/en-us/azure/azure-sql/database/sql-database-paas-overview)  OpenAPI specification.
# This Azure SQL Database management API provides a RESTful set of web APIs that interact with Azure SQL Database services to manage your databases. The API enables users to create, retrieve, update, and delete databases, servers, and other entities.
@display {label: "Azure SQL DB", iconPath: "resources/azure.sqldb.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the Azure SQL DB instance. 
    # Create a [Azure SQL DB](https://docs.microsoft.com/en-us/azure/azure-sql/database/logins-create-manage) application obtain tokens by using [this](https://docs.microsoft.com/en-us/azure/azure-sql/database/logins-create-manage)
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://management.azure.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
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
        string  path = string `/subscriptions/${subscriptionId}/providers/Microsoft.Sql/locations/${locationName}/managedDatabaseRestoreAzureAsyncOperation/${operationId}/completeRestore`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
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
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Sql/managedInstances/${managedInstanceName}/databases`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        ManagedDatabaseListResult response = check self.clientEp-> get(path, targetType = ManagedDatabaseListResult);
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
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Sql/managedInstances/${managedInstanceName}/databases/${databaseName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        ManagedDatabase response = check self.clientEp-> get(path, targetType = ManagedDatabase);
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
    remote isolated function createOrUpdateManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion, ManagedDatabase payload) returns ManagedDatabase|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Sql/managedInstances/${managedInstanceName}/databases/${databaseName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ManagedDatabase response = check self.clientEp->put(path, request, targetType=ManagedDatabase);
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
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Sql/managedInstances/${managedInstanceName}/databases/${databaseName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
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
    remote isolated function updateManagedDatabases(string resourceGroupName, string managedInstanceName, string databaseName, string subscriptionId, string apiVersion, ManagedDatabaseUpdate payload) returns ManagedDatabase|error {
        string  path = string `/subscriptions/${subscriptionId}/resourceGroups/${resourceGroupName}/providers/Microsoft.Sql/managedInstances/${managedInstanceName}/databases/${databaseName}`;
        map<anydata> queryParam = {"api-version": apiVersion};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ManagedDatabase response = check self.clientEp->patch(path, request, targetType=ManagedDatabase);
        return response;
    }
}
